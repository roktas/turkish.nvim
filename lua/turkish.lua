local Turkish = {}

local group = vim.api.nvim_create_augroup("Turkish", { clear = true })

Turkish.setup = function(options)
  Turkish.use(options)
end

Turkish.use = function(options)
  if options.abbreviate then
    vim.api.nvim_create_autocmd( "FileType", {
      pattern  = options.abbreviate,
      callback = function () Turkish.use_abbreviations() end,
      group    = group,
    })
  end

  if options.map then
    Turkish.use_mappings()
  end
end

Turkish.defaults = function()
  Turkish.use({ abbreviate = { "markdown", "text", "tex" }, map = true })
end

local abbreviations = {
  { "acenta",        "acente"        },
  { "Acenta",        "Acente"        },
  { "ahçı",          "aşçı"          },
  { "Ahçı",          "Aşçı"          },
  { "ardarda",       "art arda"      },
  { "Ardarda",       "Art arda"      },
  { "arttırılma",    "artırılma"     },
  { "Arttırılma",    "Artırılma"     },
  { "arttırır",      "artırır"       },
  { "Arttırır",      "Artırır"       },
  { "arttırmak",     "artırmak"      },
  { "Arttırmak",     "Artırmak"      },
  { "arzederim",     "arz ederim"    },
  { "Arzederim",     "Arz ederim"    },
  { "aşcı",          "aşçı"          },
  { "Aşcı",          "Aşçı"          },
  { "askari",        "asgari"        },
  { "Askari",        "Asgari"        },
  { "aşkolsun",      "aşk olsun"     },
  { "Aşkolsun",      "Aşk olsun"     },
  { "asvalt",        "asfalt"        },
  { "Asvalt",        "Asfalt"        },
  { "ayrıyeten",     "ayrıca"        },
  { "Ayrıyeten",     "Ayrıca"        },
  { "ayrıyetten",    "ayrıca"        },
  { "Ayrıyetten",    "Ayrıca"        },
  { "azerbeycan",    "azerbaycan"    },
  { "Azerbeycan",    "Azerbaycan"    },
  { "bilimum",       "bilumum"       },
  { "Bilimum",       "Bilumum"       },
  { "biribiri",      "birbiri"       },
  { "Biribiri",      "Birbiri"       },
  { "biribirine",    "birbirine"     },
  { "Biribirine",    "Birbirine"     },
  { "birşey",        "bir şey"       },
  { "Birşey",        "Bir şey"       },
  { "bugünki",       "bugünkü"       },
  { "Bugünki",       "Bugünkü"       },
  { "burda",         "burada"        },
  { "Burda",         "Burada"        },
  { "büyültmek",     "büyütmek"      },
  { "Büyültmek",     "Büyütmek"      },
  { "dedektif",      "detektif"      },
  { "Dedektif",      "Detektif"      },
  { "deyinmek",      "değinmek"      },
  { "Deyinmek",      "Değinmek"      },
  { "dinazor",       "dinozor"       },
  { "Dinazor",       "Dinozor"       },
  { "direk",         "direkt"        },
  { "Direk",         "Direkt"        },
  { "diyaspora",     "diaspora"      },
  { "Diyaspora",     "Diaspora"      },
  { "döküman",       "doküman"       },
  { "Döküman",       "Doküman"       },
  { "döndermek",     "döndürmek"     },
  { "Döndermek",     "Döndürmek"     },
  { "ençok",         "en çok"        },
  { "Ençok",         "En çok"        },
  { "entellektüel",  "entelektüel"   },
  { "Entellektüel",  "Entelektüel"   },
  { "erezyon",       "erozyon"       },
  { "Erezyon",       "Erozyon"       },
  { "evraklar",      "evrak"         },
  { "Evraklar",      "Evrak"         },
  { "harfiyat",      "hafriyat"      },
  { "Harfiyat",      "Hafriyat"      },
  { "hastahane",     "hastane"       },
  { "Hastahane",     "Hastane"       },
  { "herbir",        "her bir"       },
  { "Herbir",        "Her bir"       },
  { "herbiri",       "her biri"      },
  { "Herbiri",       "Her biri"      },
  { "hergün",        "her gün"       },
  { "Hergün",        "Her gün"       },
  { "herkez",        "herkes"        },
  { "Herkez",        "Herkes"        },
  { "herşey",        "her şey"       },
  { "Herşey",        "Her şey"       },
  { "herzaman",      "her zaman"     },
  { "Herzaman",      "Her zaman"     },
  { "hizmetiçi",     "hizmet içi"    },
  { "Hizmetiçi",     "Hizmet içi"    },
  { "hoşçakal",      "hoşça kal"     },
  { "Hoşçakal",      "Hoşça kal"     },
  { "hukuğu",        "hukuku"        },
  { "Hukuğu",        "Hukuku"        },
  { "i̇çerde",        "i̇çeride"       },
  { "İçerde",        "İçeride"       },
  { "i̇nsiyatif",     "i̇nisiyatif"    },
  { "İnsiyatif",     "İnisiyatif"    },
  { "i̇şbirliği",     "i̇ş birliği"    },
  { "İşbirliği",     "İş birliği"    },
  { "Istırap",       "Iztırap"       },
  { "itibariyla",    "itibarıyla"    },
  { "Itibariyla",    "Itibarıyla"    },
  { "itibariyle",    "itibarıyla"    },
  { "Itibariyle",    "Itibarıyla"    },
  { "i̇tibariyle",    "i̇tibarıyla"    },
  { "İtibariyle",    "İtibarıyla"    },
  { "i̇zalasyon",     "i̇zolasyon"     },
  { "İzalasyon",     "İzolasyon"     },
  { "ıstırap",       "ıztırap"       },
  { "kanepe",        "kanape"        },
  { "Kanepe",        "Kanape"        },
  { "kilot",         "külot"         },
  { "Kilot",         "Külot"         },
  { "kırahathane",   "kıraathane"    },
  { "Kırahathane",   "Kıraathane"    },
  { "klavuz",        "kılavuz"       },
  { "Klavuz",        "Kılavuz"       },
  { "kolleksiyon",   "koleksiyon"    },
  { "Kolleksiyon",   "Koleksiyon"    },
  { "kominikasyon",  "komünikasyon"  },
  { "Kominikasyon",  "Komünikasyon"  },
  { "komünükasyon",  "komünikasyon"  },
  { "Komünükasyon",  "Komünikasyon"  },
  { "krathane",      "kıraathane"    },
  { "Krathane",      "Kıraathane"    },
  { "küpür",         "kupür"         },
  { "Küpür",         "Kupür"         },
  { "küsür",         "küsur"         },
  { "Küsür",         "Küsur"         },
  { "labaratuar",    "laboratuvar"   },
  { "Labaratuar",    "Laboratuvar"   },
  { "labaratuvar",   "laboratuvar"   },
  { "Labaratuvar",   "Laboratuvar"   },
  { "laboratuar",    "laboratuvar"   },
  { "Laboratuar",    "Laboratuvar"   },
  { "laborotuar",    "laboratuvar"   },
  { "Laborotuar",    "Laboratuvar"   },
  { "labratuvar",    "laboratuvar"   },
  { "Labratuvar",    "Laboratuvar"   },
  { "makina",        "makine"        },
  { "Makina",        "Makine"        },
  { "malesef",       "maalesef"      },
  { "Malesef",       "Maalesef"      },
  { "mataryel",      "materyal"      },
  { "Mataryel",      "Materyal"      },
  { "mazallah",      "maazallah"     },
  { "Mazallah",      "Maazallah"     },
  { "mebla",         "meblağ"        },
  { "Mebla",         "Meblağ"        },
  { "meskür",        "mezkûr"        },
  { "Meskür",        "Mezkûr"        },
  { "method",        "metot"         },
  { "Method",        "Metot"         },
  { "metod",         "metot"         },
  { "Metod",         "Metot"         },
  { "mevzuatlar",    "mevzuat"       },
  { "Mevzuatlar",    "Mevzuat"       },
  { "mezkür",        "mezkûr"        },
  { "Mezkür",        "Mezkûr"        },
  { "müddet",        "mühlet"        },
  { "Müddet",        "Mühlet"        },
  { "muhattap",      "muhatap"       },
  { "Muhattap",      "Muhatap"       },
  { "mundar",        "murdar"        },
  { "Mundar",        "Murdar"        },
  { "müsade",        "müsaade"       },
  { "Müsade",        "Müsaade"       },
  { "mütaakip",      "müteakip"      },
  { "Mütaakip",      "Müteakip"      },
  { "mütahit",       "müteahhit"     },
  { "Mütahit",       "Müteahhit"     },
  { "mütevazi",      "mütevazı"      },
  { "Mütevazi",      "Mütevazı"      },
  { "nufüs",         "nüfus"         },
  { "Nufüs",         "Nüfus"         },
  { "öğe",           "öge"           },
  { "Öğe",           "Öge"           },
  { "orjinal",       "orijinal"      },
  { "Orjinal",       "Orijinal"      },
  { "ortadoğu",      "orta doğu"     },
  { "Ortadoğu",      "Orta Doğu"     },
  { "pantalon",      "pantolon"      },
  { "Pantalon",      "Pantolon"      },
  { "parakende",     "perakende"     },
  { "Parakende",     "Perakende"     },
  { "personeller",   "personel"      },
  { "Personeller",   "Personel"      },
  { "potbori",       "potpuri"       },
  { "Potbori",       "Potpuri"       },
  { "proğram",       "program"       },
  { "Proğram",       "Program"       },
  { "provakasyon",   "provokasyon"   },
  { "Provakasyon",   "Provokasyon"   },
  { "rakkam",        "rakam"         },
  { "Rakkam",        "Rakam"         },
  { "raslamak",      "rastlamak"     },
  { "Raslamak",      "Rastlamak"     },
  { "rötüş",         "rötuş"         },
  { "Rötüş",         "Rötuş"         },
  { "Rumen",         "Romen"         },
  { "satınalma",     "satın alma"    },
  { "Satınalma",     "Satın alma"    },
  { "sebeb",         "sebep"         },
  { "Sebeb",         "Sebep"         },
  { "sevketmek",     "sevk etmek"    },
  { "Sevketmek",     "Sevk etmek"    },
  { "seyehat",       "seyahat"       },
  { "Seyehat",       "Seyahat"       },
  { "sezeryan",      "sezaryen"      },
  { "Sezeryan",      "Sezaryen"      },
  { "şifai",         "şifahi"        },
  { "Şifai",         "Şifahi"        },
  { "silüet",        "siluet"        },
  { "Silüet",        "Siluet"        },
  { "sipiker",       "spiker"        },
  { "Sipiker",       "Spiker"        },
  { "şöför",         "şoför"         },
  { "Şöför",         "Şoför"         },
  { "şovenizm",      "şovinizm"      },
  { "Şovenizm",      "Şovinizm"      },
  { "sözkonusu",     "söz konusu"    },
  { "Sözkonusu",     "Söz konusu"    },
  { "süpriz",        "sürpriz"       },
  { "Süpriz",        "Sürpriz"       },
  { "tahüt",         "taahhüt"       },
  { "Tahüt",         "Taahhüt"       },
  { "taktir",        "takdir"        },
  { "Taktir",        "Takdir"        },
  { "taşaron",       "taşeron"       },
  { "Taşaron",       "Taşeron"       },
  { "tastik",        "tasdik"        },
  { "Tastik",        "Tasdik"        },
  { "tasviye",       "tasfiye"       },
  { "Tasviye",       "Tasfiye"       },
  { "tebellü",       "tebellüğ"      },
  { "Tebellü",       "Tebellüğ"      },
  { "tebli",         "tebliğ"        },
  { "Tebli",         "Tebliğ"        },
  { "tekrardan",     "tekrar"        },
  { "Tekrardan",     "Tekrar"        },
  { "tensib",        "tensip"        },
  { "Tensib",        "Tensip"        },
  { "terörist",      "terorist"      },
  { "Terörist",      "Terorist"      },
  { "terörizm",      "terorizm"      },
  { "Terörizm",      "Terorizm"      },
  { "teror",         "terör"         },
  { "Teror",         "Terör"         },
  { "tesbit",        "tespit"        },
  { "Tesbit",        "Tespit"        },
  { "teşfik",        "teşvik"        },
  { "Teşfik",        "Teşvik"        },
  { "tişort",        "tişört"        },
  { "Tişort",        "Tişört"        },
  { "transistör",    "transistor"    },
  { "Transistör",    "Transistor"    },
  { "tranzistor",    "transistor"    },
  { "Tranzistor",    "Transistor"    },
  { "tranzistör",    "transistor"    },
  { "Tranzistör",    "Transistor"    },
  { "ultimatom",     "ültimatom"     },
  { "Ultimatom",     "Ültimatom"     },
  { "ültümaton",     "ültimatom"     },
  { "Ültümaton",     "Ültimatom"     },
  { "uluslararası",  "uluslar arası" },
  { "Uluslararası",  "Uluslar arası" },
  { "ünüverste",     "üniversite"    },
  { "Ünüverste",     "Üniversite"    },
  { "ünvan",         "unvan"         },
  { "Ünvan",         "Unvan"         },
  { "ünversite",     "üniversite"    },
  { "Ünversite",     "Üniversite"    },
  { "uslup",         "üslup"         },
  { "Uslup",         "Üslup"         },
  { "üzre",          "üzere"         },
  { "Üzre",          "Üzere"         },
  { "virtüöz",       "virtüoz"       },
  { "Virtüöz",       "Virtüoz"       },
  { "yada",          "ya da"         },
  { "Yada",          "Ya da"         },
  { "yalnış",        "yanlış"        },
  { "Yalnış",        "Yanlış"        },
  { "yanlız",        "yalnız"        },
  { "Yanlız",        "Yalnız"        },
  { "yasadışı",      "yasa dışı"     },
  { "Yasadışı",      "Yasa dışı"     },
  { "yeralmak",      "yer almak"     },
  { "Yeralmak",      "Yer almak"     },
  { "yövmiye",       "yevmiye"       },
  { "Yövmiye",       "Yevmiye"       },
  { "yükseköğrenim", "yükseköğretim" },
  { "Yükseköğrenim", "Yükseköğretim" },
  { "zerafet",       "zarafet"       },
  { "Zerafet",       "Zarafet"       },
}

Turkish.use_abbreviations = function()
  local pair

  for _, pair in ipairs(abbreviations) do
    vim.cmd.iabbrev(pair)
  end
end

local mappings = {
  { 'n', '<Char-305>', '@q',                                                   },  -- ı → Dotless i:  'q' kaydedicisindeki içeriği çalıştır (makro kayıtlarında yararlı)

  { 'n', '<Char-252>', '<Nop>'                                                 },  -- ü → udiaeresis: <Nop>
  { 'n', '<Char-220>', '<Nop>'                                                 },  -- Ü → Udiaeresis: <Nop>

  { 'n', '<Char-246>', '<c-]>'                                                 },  -- ö → odiaeresis: <c-]>
  { 'n', '<Char-214>', '<Nop>'                                                 },  -- Ö → Odiaeresis: <Nop>

  { '',  '<Char-231>', '<Leader>'                                              },  -- ç → ccedilla: <Leader>
  { '',  '<Char-199>', '<LocalLeader>'                                         },  -- Ç → Ccedilla: <LocalLeader>

  { 'n', '<Char-287>', '}'                                                     },  -- ğ → gbreve: }
  { 'n', '<Char-287>', '}'                                                     },  -- ğ → gbreve: }
  { 'v', '<Char-286>', '{'                                                     },  -- Ğ → Gbreve {
  { 'v', '<Char-286>', '{'                                                     },  -- Ğ → Gbreve {

  { 'n', '<Char-351>', ':%s/<c-r>=expand("<cword>")<cr>//gc<left><left><left>' }, -- ş → scedilla: Kursörün altındaki kelimeyi bul/değiştir
  { 'v', '<Char-351>', ':s/<c-r>=expand("<cword>")<cr>//gc<left><left><left>'  }, -- ş → scedilla: Kursörün altındaki kelimeyi bul/değiştir

  { 'n', '<Char-350>', ':%s///gc<left><left><left><left>'                      }, -- Ş → Scedilla: Bul/değiştir istemine geç
  { 'v', '<Char-350>', ':s///gc<left><left><left><left>'                       }, -- Ş → Scedilla: Bul/değiştir istemine geç
}

Turkish.use_mappings = function()
  local mapping

  for _, mapping in ipairs(mappings) do
    local mode = mapping[1]
    local lhs  = mapping[2]
    local rhs  = mapping[3]

    -- User has not mapped (a keyseq starting with) `lhs` to something else.
    -- User has not already mapped something to the <Plug> key.
    if vim.fn.mapcheck(lhs, mode) == "" and vim.fn.hasmapto(rhs, mode) == 0 then
      vim.api.nvim_set_keymap(mode, lhs, rhs, {})
    end
  end
end

return Turkish
