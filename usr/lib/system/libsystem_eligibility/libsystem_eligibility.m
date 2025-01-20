char *copy_eligibility_domain_public_answer_plist_path()
{
  NSObject *v0;
  char *v2;
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x263EF8C08];
  v2 = 0;
  if (asprintf(&v2, "%s%s", "/", "/private/var/db/eligibilityd/eligibility.plist") == -1)
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    v0 = eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v4 = "copy_eligibility_domain_public_answer_plist_path";
      v5 = 2080;
      v6 = "/private/var/db/eligibilityd/eligibility.plist";
      _os_log_error_impl(&dword_263DE6000, v0, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  return v2;
}

uint64_t os_eligibility_get_domain_answer(uint64_t a1, int64_t *a2, int64_t *a3, void *a4, xpc_object_t *a5)
{
  uint64_t v41 = *MEMORY[0x263EF8C08];
  xpc_object_t object = 0;
  if ((unint64_t)(a1 - 22) >= 0x64)
  {
    if (a1 > 20)
    {
      if ((unint64_t)(a1 - 123) < 3) {
        goto LABEL_2;
      }
      if (a1 == 21 || a1 == 122)
      {
        v11 = copy_eligibility_domain_public_answer_plist_path();
        if (v11) {
          goto LABEL_8;
        }
      }
    }
    else if ((unint64_t)(a1 - 1) < 0x14)
    {
      goto LABEL_2;
    }
LABEL_20:
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    v16 = eligibility_log_handle_log_handle;
    if (!os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      v11 = 0;
LABEL_24:
      xpc_object_t v13 = 0;
      int64_t v14 = 0;
      uint64_t v12 = 22;
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136315394;
    v36 = "os_eligibility_get_domain_answer";
    __int16 v37 = 2048;
    v38 = (const char *)a1;
    uint64_t v12 = 22;
    _os_log_error_impl(&dword_263DE6000, v16, OS_LOG_TYPE_ERROR, "%s: Unknown plist for domain %llu", buf, 0x16u);
    v11 = 0;
    goto LABEL_10;
  }
LABEL_2:
  v34 = 0;
  if (asprintf(&v34, "%s%s", "/", "/private/var/db/os_eligibility/eligibility.plist") == -1)
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    v10 = eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "copy_eligibility_domain_answer_plist_path";
      __int16 v37 = 2080;
      v38 = "/private/var/db/os_eligibility/eligibility.plist";
      _os_log_error_impl(&dword_263DE6000, v10, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  v11 = v34;
  if (!v34) {
    goto LABEL_20;
  }
LABEL_8:
  if (load_eligibility_plist(v11, &object))
  {
    uint64_t v12 = 0;
LABEL_10:
    xpc_object_t v13 = 0;
    int64_t v14 = 0;
LABEL_25:
    int64_t int64 = 1;
    goto LABEL_26;
  }
  switch(a1)
  {
    case 1:
      v15 = "OS_ELIGIBILITY_DOMAIN_LOTX";
      break;
    case 2:
      v15 = "OS_ELIGIBILITY_DOMAIN_HYDROGEN";
      break;
    case 3:
      v15 = "OS_ELIGIBILITY_DOMAIN_HELIUM";
      break;
    case 4:
      v15 = "OS_ELIGIBILITY_DOMAIN_LITHIUM";
      break;
    case 5:
      v15 = "OS_ELIGIBILITY_DOMAIN_BERYLLIUM";
      break;
    case 6:
      v15 = "OS_ELIGIBILITY_DOMAIN_BORON";
      break;
    case 7:
      v15 = "OS_ELIGIBILITY_DOMAIN_CARBON";
      break;
    case 8:
      v15 = "OS_ELIGIBILITY_DOMAIN_NITROGEN";
      break;
    case 9:
      v15 = "OS_ELIGIBILITY_DOMAIN_OXYGEN";
      break;
    case 10:
      v15 = "OS_ELIGIBILITY_DOMAIN_FLUORINE";
      break;
    case 11:
      v15 = "OS_ELIGIBILITY_DOMAIN_NEON";
      break;
    case 12:
      v15 = "OS_ELIGIBILITY_DOMAIN_SODIUM";
      break;
    case 13:
      v15 = "OS_ELIGIBILITY_DOMAIN_MAGNESIUM";
      break;
    case 14:
      v15 = "OS_ELIGIBILITY_DOMAIN_ALUMINUM";
      break;
    case 15:
      v15 = "OS_ELIGIBILITY_DOMAIN_SILICON";
      break;
    case 16:
      v15 = "OS_ELIGIBILITY_DOMAIN_PHOSPHORUS";
      break;
    case 17:
      v15 = "OS_ELIGIBILITY_DOMAIN_SULFUR";
      break;
    case 18:
      v15 = "OS_ELIGIBILITY_DOMAIN_CHLORINE";
      break;
    case 19:
      v15 = "OS_ELIGIBILITY_DOMAIN_ARGON";
      break;
    case 20:
      v15 = "OS_ELIGIBILITY_DOMAIN_POTASSIUM";
      break;
    case 21:
      v15 = "OS_ELIGIBILITY_DOMAIN_CALCIUM";
      break;
    case 22:
      v15 = "OS_ELIGIBILITY_DOMAIN_SCANDIUM";
      break;
    case 23:
      v15 = "OS_ELIGIBILITY_DOMAIN_TITANIUM";
      break;
    case 24:
      v15 = "OS_ELIGIBILITY_DOMAIN_VANADIUM";
      break;
    case 25:
      v15 = "OS_ELIGIBILITY_DOMAIN_CHROMIUM";
      break;
    case 26:
      v15 = "OS_ELIGIBILITY_DOMAIN_MANGANESE";
      break;
    case 27:
      v15 = "OS_ELIGIBILITY_DOMAIN_IRON";
      break;
    case 28:
      v15 = "OS_ELIGIBILITY_DOMAIN_COBALT";
      break;
    case 29:
      v15 = "OS_ELIGIBILITY_DOMAIN_NICKEL";
      break;
    case 30:
      v15 = "OS_ELIGIBILITY_DOMAIN_COPPER";
      break;
    case 31:
      v15 = "OS_ELIGIBILITY_DOMAIN_ZINC";
      break;
    case 32:
      v15 = "OS_ELIGIBILITY_DOMAIN_GALLIUM";
      break;
    case 33:
      v15 = "OS_ELIGIBILITY_DOMAIN_GERMANIUM";
      break;
    case 34:
      v15 = "OS_ELIGIBILITY_DOMAIN_ARSENIC";
      break;
    case 35:
      v15 = "OS_ELIGIBILITY_DOMAIN_SELENIUM";
      break;
    case 36:
      v15 = "OS_ELIGIBILITY_DOMAIN_BROMINE";
      break;
    case 37:
      v15 = "OS_ELIGIBILITY_DOMAIN_KRYPTON";
      break;
    case 38:
      v15 = "OS_ELIGIBILITY_DOMAIN_RUBIDIUM";
      break;
    case 39:
      v15 = "OS_ELIGIBILITY_DOMAIN_STRONTIUM";
      break;
    case 40:
      v15 = "OS_ELIGIBILITY_DOMAIN_YTTRIUM";
      break;
    case 41:
      v15 = "OS_ELIGIBILITY_DOMAIN_ZIRCONIUM";
      break;
    case 42:
      v15 = "OS_ELIGIBILITY_DOMAIN_NIOBIUM";
      break;
    case 43:
      v15 = "OS_ELIGIBILITY_DOMAIN_MOLYBDENUM";
      break;
    default:
      v15 = "OS_ELIGIBILITY_DOMAIN_TEST";
      switch(a1)
      {
        case 'x':
          goto LABEL_109;
        case 'y':
          v15 = "OS_ELIGIBILITY_DOMAIN_PODCASTS_TRANSCRIPTS";
          goto LABEL_109;
        case 'z':
          v15 = "OS_ELIGIBILITY_DOMAIN_GREYMATTER";
          goto LABEL_109;
        case '{':
          v15 = "OS_ELIGIBILITY_DOMAIN_XCODE_LLM";
          goto LABEL_109;
        case '|':
          v15 = "OS_ELIGIBILITY_DOMAIN_SEARCH_MARKETPLACES";
          goto LABEL_109;
        case '}':
          v15 = "OS_ELIGIBILITY_DOMAIN_SWIFT_ASSIST";
          goto LABEL_109;
        default:
          if (eligibility_log_handle_once_token != -1) {
            dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
          }
          v24 = eligibility_log_handle_log_handle;
          if (!os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR)) {
            goto LABEL_24;
          }
          *(_DWORD *)buf = 136315394;
          v36 = "os_eligibility_get_domain_answer";
          __int16 v37 = 2048;
          v38 = (const char *)a1;
          uint64_t v12 = 22;
          _os_log_error_impl(&dword_263DE6000, v24, OS_LOG_TYPE_ERROR, "%s: Invalid domain %llu", buf, 0x16u);
          break;
      }
      goto LABEL_10;
  }
LABEL_109:
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(object, v15);
  if (!dictionary)
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    v28 = eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v36 = "os_eligibility_get_domain_answer";
      __int16 v37 = 2080;
      v38 = v15;
      __int16 v39 = 2048;
      uint64_t v40 = a1;
      _os_log_error_impl(&dword_263DE6000, v28, OS_LOG_TYPE_ERROR, "%s: Domain %s(%llu) missing from plist", buf, 0x20u);
    }
    xpc_object_t v13 = 0;
    int64_t v14 = 0;
    uint64_t v12 = 0xFFFFFFFFLL;
    goto LABEL_25;
  }
  v26 = dictionary;
  int64_t int64 = xpc_dictionary_get_int64(dictionary, "os_eligibility_answer_t");
  if (int64 < 0)
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    v29 = eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "os_eligibility_get_domain_answer";
      __int16 v37 = 2080;
      v38 = v15;
      _os_log_error_impl(&dword_263DE6000, v29, OS_LOG_TYPE_ERROR, "%s: Unable to read eligibility answer for domain: %s", buf, 0x16u);
    }
    xpc_object_t v13 = 0;
    int64_t v14 = 0;
    goto LABEL_138;
  }
  if (a3)
  {
    int64_t v27 = xpc_dictionary_get_int64(v26, "os_eligibility_answer_source_t");
    int64_t v14 = v27;
    if (v27 >= 0)
    {
      *a3 = v27;
      goto LABEL_125;
    }
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    v32 = eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "os_eligibility_get_domain_answer";
      __int16 v37 = 2080;
      v38 = v15;
      _os_log_error_impl(&dword_263DE6000, v32, OS_LOG_TYPE_ERROR, "%s: Unable to read eligibility source for domain: %s", buf, 0x16u);
    }
    xpc_object_t v13 = 0;
LABEL_138:
    uint64_t v12 = 33;
    goto LABEL_26;
  }
  int64_t v14 = 0;
LABEL_125:
  if (a4 && (xpc_object_t value = xpc_dictionary_get_value(v26, "status")) != 0) {
    xpc_object_t v13 = xpc_retain(value);
  }
  else {
    xpc_object_t v13 = 0;
  }
  if (a5 && (xpc_object_t v31 = xpc_dictionary_get_dictionary(v26, "context")) != 0)
  {
    uint64_t v12 = 0;
    *a5 = xpc_retain(v31);
  }
  else
  {
    uint64_t v12 = 0;
  }
LABEL_26:
  free(v11);
  if (a2) {
    *a2 = int64;
  }
  if (a4)
  {
    if (!v13 && v14 != 2)
    {
      xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
      xpc_object_t v13 = v18;
      v19 = "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION";
      switch(a1)
      {
        case 1:
          goto LABEL_35;
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 11:
        case 12:
        case 14:
        case 16:
        case 17:
        case 19:
        case 20:
        case 22:
        case 23:
        case 24:
        case 27:
        case 32:
        case 33:
        case 34:
        case 35:
        case 36:
        case 40:
LABEL_32:
          xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION", 1);
          goto LABEL_33;
        case 10:
        case 13:
        case 15:
        case 25:
        case 26:
LABEL_33:
          v20 = "OS_ELIGIBILITY_INPUT_COUNTRY_BILLING";
          goto LABEL_34;
        case 18:
          xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_COUNTRY_BILLING", 1);
          goto LABEL_49;
        case 21:
          goto LABEL_57;
        case 28:
        case 37:
LABEL_47:
          xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION", 1);
          v19 = "OS_ELIGIBILITY_INPUT_COUNTRY_BILLING";
          goto LABEL_35;
        case 29:
LABEL_49:
          v22 = "OS_ELIGIBILITY_INPUT_DEVICE_CLASS";
          goto LABEL_52;
        case 30:
        case 41:
        case 42:
          break;
        case 31:
          xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_COUNTRY_BILLING", 1);
          v19 = "OS_ELIGIBILITY_INPUT_DEVICE_LANGUAGE";
          goto LABEL_35;
        case 38:
          v22 = "OS_ELIGIBILITY_INPUT_DEVICE_REGION_CODE";
LABEL_52:
          xpc_dictionary_set_int64(v13, v22, 1);
          v19 = "OS_ELIGIBILITY_INPUT_DEVICE_LOCALE";
          goto LABEL_35;
        case 39:
          xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION", 1);
          xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_COUNTRY_BILLING", 1);
          v23 = "OS_ELIGIBILITY_INPUT_DEVICE_CLASS";
LABEL_56:
          xpc_dictionary_set_int64(v13, v23, 1);
LABEL_57:
          v19 = "OS_ELIGIBILITY_INPUT_DEVICE_REGION_CODE";
          goto LABEL_35;
        case 43:
          xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_INITIAL_SETUP_LOCATION", 1);
          v20 = "OS_ELIGIBILITY_INPUT_BIRTHDATE";
LABEL_34:
          xpc_dictionary_set_int64(v13, v20, 1);
          v19 = "OS_ELIGIBILITY_INPUT_DEVICE_CLASS";
LABEL_35:
          xpc_dictionary_set_int64(v13, v19, 1);
          break;
        default:
          switch(a1)
          {
            case 'x':
              goto LABEL_47;
            case 'y':
              xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION", 1);
              v23 = "OS_ELIGIBILITY_INPUT_COUNTRY_BILLING";
              goto LABEL_56;
            case 'z':
              xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION", 1);
              xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_DEVICE_LANGUAGE", 1);
              xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_GENERATIVE_MODEL_SYSTEM", 1);
              xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_DEVICE_REGION_CODE", 1);
              xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_SIRI_LANGUAGE", 1);
              xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_EXTERNAL_BOOT_DRIVE", 1);
              xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_DEVICE_LOCALE", 1);
              xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_SHARED_IPAD", 1);
              v19 = "OS_ELIGIBILITY_INPUT_DEVICE_AND_SIRI_LANGUAGE_MATCH";
              goto LABEL_35;
            case '{':
            case '}':
              xpc_dictionary_set_int64(v18, "OS_ELIGIBILITY_INPUT_DEVICE_REGION_CODE", 1);
              xpc_dictionary_set_int64(v13, "OS_ELIGIBILITY_INPUT_DEVICE_CLASS", 1);
              v19 = "OS_ELIGIBILITY_INPUT_EXTERNAL_BOOT_DRIVE";
              goto LABEL_35;
            case '|':
              goto LABEL_32;
            default:
              goto LABEL_36;
          }
      }
    }
LABEL_36:
    *a4 = v13;
  }
  else if (v13)
  {
    xpc_release(v13);
  }
  if (object) {
    xpc_release(object);
  }
  return v12;
}

uint64_t load_eligibility_plist(const char *a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8C08];
  memset(&v30.st_size, 0, 48);
  int v4 = open(a1, 0x20000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  if ((v4 & 0x80000000) == 0)
  {
    int v5 = v4;
    if (fstat(v4, &v30))
    {
      uint64_t v6 = *__error();
      if (eligibility_log_handle_once_token != -1) {
        dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
      }
      uint64_t v7 = eligibility_log_handle_log_handle;
      if (!os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      v28 = strerror(v6);
      *(_DWORD *)buf = 136315906;
      v32 = "load_eligibility_plist";
      __int16 v33 = 2080;
      size_t v34 = (size_t)a1;
      __int16 v35 = 2080;
      v36 = v28;
      __int16 v37 = 1024;
      int v38 = v6;
      v24 = "%s: Failed to stat %s: %s(%d)";
      v25 = v7;
      uint32_t v26 = 38;
LABEL_33:
      _os_log_error_impl(&dword_263DE6000, v25, OS_LOG_TYPE_ERROR, v24, buf, v26);
LABEL_6:
      v8 = 0;
LABEL_36:
      close(v5);
      if (a2 && !v6 && v8)
      {
        uint64_t v6 = 0;
        *a2 = v8;
      }
      else if (v8)
      {
        xpc_release(v8);
      }
      return v6;
    }
    size_t st_size = v30.st_size;
    if ((unint64_t)v30.st_size >> 31)
    {
      if (eligibility_log_handle_once_token != -1) {
        dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
      }
      v11 = eligibility_log_handle_log_handle;
      if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v32 = "load_eligibility_plist";
        __int16 v33 = 2048;
        size_t v34 = st_size;
        _os_log_error_impl(&dword_263DE6000, v11, OS_LOG_TYPE_ERROR, "%s: eligibility plist is too large (%zu)", buf, 0x16u);
      }
      v8 = 0;
      uint64_t v6 = 27;
      goto LABEL_36;
    }
    uint64_t v12 = mmap(0, v30.st_size, 1, 1026, v5, 0);
    if (v12 == (void *)-1)
    {
      uint64_t v6 = *__error();
      if (eligibility_log_handle_once_token != -1) {
        dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
      }
      uint64_t v22 = eligibility_log_handle_log_handle;
      if (!os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      v23 = strerror(v6);
      *(_DWORD *)buf = 136315650;
      v32 = "load_eligibility_plist";
      __int16 v33 = 2080;
      size_t v34 = (size_t)a1;
      __int16 v35 = 2080;
      v36 = v23;
      v24 = "%s: Failed to map file at %s; error: %s";
      v25 = v22;
      uint32_t v26 = 32;
      goto LABEL_33;
    }
    xpc_object_t v13 = v12;
    uint64_t v14 = xpc_create_from_plist();
    v8 = (void *)v14;
    if (v14)
    {
      uint64_t v15 = MEMORY[0x263E70EC0](v14);
      if (v15 == MEMORY[0x263EF8D00])
      {
        uint64_t v6 = 0;
        goto LABEL_35;
      }
      v16 = (const _xpc_type_s *)v15;
      if (eligibility_log_handle_once_token != -1) {
        dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
      }
      uint64_t v17 = eligibility_log_handle_log_handle;
      if (!os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
      {
LABEL_31:
        uint64_t v6 = 0xFFFFFFFFLL;
LABEL_35:
        munmap(v13, st_size);
        goto LABEL_36;
      }
      name = xpc_type_get_name(v16);
      *(_DWORD *)buf = 136315394;
      v32 = "load_eligibility_plist";
      __int16 v33 = 2080;
      size_t v34 = (size_t)name;
      v19 = "%s: Expected plist to be a dictionary but instead was a %s";
      v20 = v17;
      uint32_t v21 = 22;
    }
    else
    {
      if (eligibility_log_handle_once_token != -1) {
        dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
      }
      uint64_t v27 = eligibility_log_handle_log_handle;
      if (!os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      *(_DWORD *)buf = 136315138;
      v32 = "load_eligibility_plist";
      v19 = "%s: Failed to parse property list";
      v20 = v27;
      uint32_t v21 = 12;
    }
    _os_log_error_impl(&dword_263DE6000, v20, OS_LOG_TYPE_ERROR, v19, buf, v21);
    goto LABEL_31;
  }
  uint64_t v6 = *__error();
  if (eligibility_log_handle_once_token != -1) {
    dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
  }
  v9 = eligibility_log_handle_log_handle;
  if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v32 = "load_eligibility_plist";
    __int16 v33 = 2080;
    size_t v34 = (size_t)a1;
    __int16 v35 = 2080;
    v36 = strerror(v6);
    __int16 v37 = 1024;
    int v38 = v6;
    _os_log_error_impl(&dword_263DE6000, v9, OS_LOG_TYPE_ERROR, "%s: Failed to open %s: %s(%d)", buf, 0x26u);
  }
  return v6;
}

os_log_t __eligibility_log_handle_block_invoke()
{
  os_log_t result = os_log_create("com.apple.os_eligibility", "library");
  eligibility_log_handle_log_handle = (uint64_t)result;
  return result;
}

void eligibility_xpc_set_message_type(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8C08];
  if (MEMORY[0x263E70EC0](a2) == MEMORY[0x263EF8D00])
  {
    xpc_dictionary_set_uint64(a2, "eligibility_message_type", a1);
  }
  else
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    int v4 = eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      uint64_t v6 = "eligibility_xpc_set_message_type";
      _os_log_error_impl(&dword_263DE6000, v4, OS_LOG_TYPE_ERROR, "%s: xpc message type must be a dictionary", (uint8_t *)&v5, 0xCu);
    }
  }
}

int64_t eligibility_xpc_send_message_with_reply(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8C08];
  mach_service = xpc_connection_create_mach_service("com.apple.eligibilityd", 0, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_7);
  xpc_connection_activate(mach_service);
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(mach_service, a1);
  uint64_t v6 = MEMORY[0x263E70EC0]();
  if (v6) {
    BOOL v7 = v6 == MEMORY[0x263EF8D08];
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (v6 == MEMORY[0x263EF8D00])
    {
      int64_t int64 = xpc_dictionary_get_int64(v5, "errorNum");
      if (!v5) {
        return int64;
      }
    }
    else
    {
      int64_t int64 = 0xFFFFFFFFLL;
      if (!v5) {
        return int64;
      }
    }
    goto LABEL_15;
  }
  string = xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x263EF8CE0]);
  if (eligibility_log_handle_once_token != -1) {
    dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
  }
  v9 = eligibility_log_handle_log_handle;
  if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
  {
    if (!string) {
      string = "unknown error";
    }
    if (MEMORY[0x263E70EC0](a1) == MEMORY[0x263EF8D00])
    {
      uint64_t int64 = xpc_dictionary_get_uint64(a1, "eligibility_message_type");
    }
    else
    {
      if (eligibility_log_handle_once_token != -1) {
        dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
      }
      xpc_object_t v13 = eligibility_log_handle_log_handle;
      if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
      {
        int v14 = 136315138;
        uint64_t v15 = "eligibility_xpc_get_message_type";
        _os_log_error_impl(&dword_263DE6000, v13, OS_LOG_TYPE_ERROR, "%s: xpc message type must be a dictionary", (uint8_t *)&v14, 0xCu);
      }
      uint64_t int64 = 0;
    }
    int v14 = 136315650;
    uint64_t v15 = "eligibility_xpc_send_message_with_reply";
    __int16 v16 = 2048;
    uint64_t v17 = uint64;
    __int16 v18 = 2080;
    v19 = string;
    _os_log_error_impl(&dword_263DE6000, v9, OS_LOG_TYPE_ERROR, "%s: Error returned trying to send xpc message %llu: %s", (uint8_t *)&v14, 0x20u);
  }
  int64_t int64 = 54;
  if (v5)
  {
LABEL_15:
    if (!a2 || int64) {
      xpc_release(v5);
    }
    else {
      *a2 = v5;
    }
  }
  return int64;
}

int64_t os_eligibility_set_input(uint64_t a1, void *a2, uint64_t a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  eligibility_xpc_set_message_type(1uLL, v6);
  xpc_dictionary_set_uint64(v6, "input", a1);
  if (a2) {
    xpc_dictionary_set_value(v6, "value", a2);
  }
  xpc_dictionary_set_uint64(v6, "status", a3);
  int64_t v7 = eligibility_xpc_send_message_with_reply(v6, 0);
  xpc_release(v6);
  return v7;
}

int64_t os_eligibility_reset_domain(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  eligibility_xpc_set_message_type(2uLL, v2);
  xpc_dictionary_set_uint64(v2, "domain", a1);
  int64_t v3 = eligibility_xpc_send_message_with_reply(v2, 0);
  xpc_release(v2);
  return v3;
}

int64_t os_eligibility_reset_all_domains()
{
  xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
  eligibility_xpc_set_message_type(5uLL, v0);
  int64_t v1 = eligibility_xpc_send_message_with_reply(v0, 0);
  xpc_release(v0);
  return v1;
}

int64_t os_eligibility_force_domain_answer(uint64_t a1, uint64_t a2, void *a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  eligibility_xpc_set_message_type(3uLL, v6);
  xpc_dictionary_set_uint64(v6, "domain", a1);
  xpc_dictionary_set_uint64(v6, "answer", a2);
  if (a3) {
    xpc_dictionary_set_value(v6, "context", a3);
  }
  int64_t v7 = eligibility_xpc_send_message_with_reply(v6, 0);
  xpc_release(v6);
  return v7;
}

int64_t os_eligibility_force_domain_set_answers(uint64_t a1, uint64_t a2, void *a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  eligibility_xpc_set_message_type(6uLL, v6);
  xpc_dictionary_set_uint64(v6, "domainSet", a1);
  xpc_dictionary_set_uint64(v6, "answer", a2);
  if (a3) {
    xpc_dictionary_set_value(v6, "context", a3);
  }
  int64_t v7 = eligibility_xpc_send_message_with_reply(v6, 0);
  xpc_release(v6);
  return v7;
}

int64_t os_eligibility_set_test_mode(BOOL a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  eligibility_xpc_set_message_type(9uLL, v2);
  xpc_dictionary_set_BOOL(v2, "enabled", a1);
  int64_t v3 = eligibility_xpc_send_message_with_reply(v2, 0);
  xpc_release(v2);
  return v3;
}

uint64_t os_eligibility_get_all_domain_answers(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8C08];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  v11 = 0;
  if (asprintf(&v11, "%s%s", "/", "/private/var/db/os_eligibility/eligibility.plist") == -1)
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    int64_t v3 = eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      xpc_object_t v13 = "copy_eligibility_domain_answer_plist_path";
      __int16 v14 = 2080;
      uint64_t v15 = "/private/var/db/os_eligibility/eligibility.plist";
      _os_log_error_impl(&dword_263DE6000, v3, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  int v4 = v11;
  v11 = 0;
  if (asprintf(&v11, "%s%s", "/", "/private/var/db/eligibilityd/eligibility.plist") == -1)
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    xpc_object_t v5 = eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      xpc_object_t v13 = "copy_eligibility_domain_public_answer_plist_path";
      __int16 v14 = 2080;
      uint64_t v15 = "/private/var/db/eligibilityd/eligibility.plist";
      _os_log_error_impl(&dword_263DE6000, v5, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  xpc_object_t v6 = v11;
  uint64_t appended = _append_plist_keys_to_dictionary(v4, (uint64_t)v2);
  if (appended)
  {
    uint64_t v8 = appended;
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    v9 = eligibility_log_handle_log_handle;
    if (!os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_DWORD *)buf = 136315650;
    xpc_object_t v13 = "os_eligibility_get_all_domain_answers";
    __int16 v14 = 2080;
    uint64_t v15 = v4;
    __int16 v16 = 1024;
    int v17 = v8;
    goto LABEL_25;
  }
  uint64_t v8 = _append_plist_keys_to_dictionary(v6, (uint64_t)v2);
  if (!v8) {
    goto LABEL_21;
  }
  if (eligibility_log_handle_once_token != -1) {
    dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
  }
  v9 = eligibility_log_handle_log_handle;
  if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    xpc_object_t v13 = "os_eligibility_get_all_domain_answers";
    __int16 v14 = 2080;
    uint64_t v15 = v6;
    __int16 v16 = 1024;
    int v17 = v8;
LABEL_25:
    _os_log_error_impl(&dword_263DE6000, v9, OS_LOG_TYPE_ERROR, "%s: Failed to load in plist %s: error=%d", buf, 0x1Cu);
  }
LABEL_20:
  xpc_object_t v2 = 0;
LABEL_21:
  free(v4);
  free(v6);
  if (a1) {
    *a1 = v2;
  }
  return v8;
}

uint64_t _append_plist_keys_to_dictionary(const char *a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x263EF8C08];
  xpc_object_t xdict = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2000000000;
  int v12 = 0;
  int v12 = load_eligibility_plist(a1, &xdict);
  if (*((_DWORD *)v10 + 6))
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    int v4 = eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      int v5 = *((_DWORD *)v10 + 6);
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = "_append_plist_keys_to_dictionary";
      __int16 v16 = 2080;
      int v17 = a1;
      __int16 v18 = 1024;
      int v19 = v5;
      _os_log_error_impl(&dword_263DE6000, v4, OS_LOG_TYPE_ERROR, "%s: Failed to read in plist %s: error=%d", buf, 0x1Cu);
    }
  }
  else
  {
    applier[0] = MEMORY[0x263EF8BF8];
    applier[1] = 0x40000000;
    applier[2] = ___append_plist_keys_to_dictionary_block_invoke;
    applier[3] = &unk_2655E8258;
    applier[4] = &v9;
    applier[5] = a2;
    xpc_dictionary_apply(xdict, applier);
  }
  if (xdict)
  {
    xpc_release(xdict);
    xpc_object_t xdict = 0;
  }
  uint64_t v6 = *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

BOOL ___append_plist_keys_to_dictionary_block_invoke(uint64_t a1, const char *a2, xpc_object_t xdict)
{
  uint64_t v12 = *MEMORY[0x263EF8C08];
  int64_t int64 = xpc_dictionary_get_int64(xdict, "os_eligibility_answer_t");
  if (int64 < 0)
  {
    if (eligibility_log_handle_once_token != -1) {
      dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
    }
    uint64_t v6 = eligibility_log_handle_log_handle;
    if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      uint64_t v9 = "_append_plist_keys_to_dictionary_block_invoke";
      __int16 v10 = 2080;
      uint64_t v11 = a2;
      _os_log_error_impl(&dword_263DE6000, v6, OS_LOG_TYPE_ERROR, "%s: Unable to read eligibility answer for domain: %s", (uint8_t *)&v8, 0x16u);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 33;
  }
  else
  {
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), a2, int64);
  }
  return ((int64 >> 63) & 1) == 0;
}

uint64_t os_eligibility_get_internal_state(void *a1)
{
  if (!a1) {
    return 22;
  }
  xpc_object_t xdict = 0;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  eligibility_xpc_set_message_type(4uLL, v2);
  int64_t v3 = eligibility_xpc_send_message_with_reply(v2, &xdict);
  if (!v3)
  {
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(xdict, "internalStateDictionary");
    xpc_object_t v5 = dictionary;
    if (dictionary) {
      xpc_retain(dictionary);
    }
    *a1 = v5;
  }
  if (xdict) {
    xpc_release(xdict);
  }
  xpc_release(v2);
  return v3;
}

uint64_t os_eligibility_get_state_dump(void *a1)
{
  if (!a1) {
    return 22;
  }
  xpc_object_t xdict = 0;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  eligibility_xpc_set_message_type(7uLL, v2);
  int64_t v3 = eligibility_xpc_send_message_with_reply(v2, &xdict);
  if (!v3)
  {
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(xdict, "stateDumpDictionary");
    xpc_object_t v5 = dictionary;
    if (dictionary) {
      xpc_retain(dictionary);
    }
    *a1 = v5;
  }
  if (xdict) {
    xpc_release(xdict);
  }
  xpc_release(v2);
  return v3;
}

uint64_t os_eligibility_dump_sysdiagnose_data_to_dir(const char *a1)
{
  if (!a1) {
    return 22;
  }
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  eligibility_xpc_set_message_type(8uLL, v2);
  xpc_dictionary_set_string(v2, "dirPath", a1);
  int64_t v3 = eligibility_xpc_send_message_with_reply(v2, 0);
  xpc_release(v2);
  return v3;
}

char *os_eligibility_get_domain_notification_name(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8C08];
  if ((unint64_t)(a1 - 1) < 0x7D) {
    return (&off_2655E8278)[a1 - 1];
  }
  if (eligibility_log_handle_once_token != -1) {
    dispatch_once(&eligibility_log_handle_once_token, &__block_literal_global);
  }
  int64_t v3 = eligibility_log_handle_log_handle;
  if (os_log_type_enabled((os_log_t)eligibility_log_handle_log_handle, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    xpc_object_t v5 = "os_eligibility_get_domain_notification_name";
    __int16 v6 = 2048;
    uint64_t v7 = a1;
    _os_log_error_impl(&dword_263DE6000, v3, OS_LOG_TYPE_ERROR, "%s: Unable to convert domain to notification string: %llu", (uint8_t *)&v4, 0x16u);
  }
  return 0;
}

uint64_t os_eligibility_domain_for_name(uint64_t result)
{
  if (result)
  {
    int64_t v1 = (const char *)result;
    if (!strcmp((const char *)result, "OS_ELIGIBILITY_DOMAIN_INVALID"))
    {
      return 0;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TEST"))
    {
      return 120;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_LOTX"))
    {
      return 1;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_PODCASTS_TRANSCRIPTS"))
    {
      return 121;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_GREYMATTER"))
    {
      return 122;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_XCODE_LLM"))
    {
      return 123;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SEARCH_MARKETPLACES"))
    {
      return 124;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SWIFT_ASSIST"))
    {
      return 125;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_HYDROGEN"))
    {
      return 2;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_HELIUM"))
    {
      return 3;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_LITHIUM"))
    {
      return 4;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_BERYLLIUM"))
    {
      return 5;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_BORON"))
    {
      return 6;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CARBON"))
    {
      return 7;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_NITROGEN"))
    {
      return 8;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_OXYGEN"))
    {
      return 9;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_FLUORINE"))
    {
      return 10;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_NEON"))
    {
      return 11;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SODIUM"))
    {
      return 12;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_MAGNESIUM"))
    {
      return 13;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ALUMINUM"))
    {
      return 14;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SILICON"))
    {
      return 15;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_PHOSPHORUS"))
    {
      return 16;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SULFUR"))
    {
      return 17;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CHLORINE"))
    {
      return 18;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ARGON"))
    {
      return 19;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_POTASSIUM"))
    {
      return 20;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CALCIUM"))
    {
      return 21;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SCANDIUM"))
    {
      return 22;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TITANIUM"))
    {
      return 23;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_VANADIUM"))
    {
      return 24;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CHROMIUM"))
    {
      return 25;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_MANGANESE"))
    {
      return 26;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_IRON"))
    {
      return 27;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_COBALT"))
    {
      return 28;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_NICKEL"))
    {
      return 29;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_COPPER"))
    {
      return 30;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ZINC"))
    {
      return 31;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_GALLIUM"))
    {
      return 32;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_GERMANIUM"))
    {
      return 33;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ARSENIC"))
    {
      return 34;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SELENIUM"))
    {
      return 35;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_BROMINE"))
    {
      return 36;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_KRYPTON"))
    {
      return 37;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_RUBIDIUM"))
    {
      return 38;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_STRONTIUM"))
    {
      return 39;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_YTTRIUM"))
    {
      return 40;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ZIRCONIUM"))
    {
      return 41;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_NIOBIUM"))
    {
      return 42;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_MOLYBDENUM"))
    {
      return 43;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TECHNETIUM"))
    {
      return 44;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_RUTHENIUM"))
    {
      return 45;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_RHODIUM"))
    {
      return 46;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_PALLADIUM"))
    {
      return 47;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SILVER"))
    {
      return 48;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CADMIUM"))
    {
      return 49;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_INDIUM"))
    {
      return 50;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TIN"))
    {
      return 51;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ANTIMONY"))
    {
      return 52;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TELLURIUM"))
    {
      return 53;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_IODINE"))
    {
      return 54;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_XENON"))
    {
      return 55;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CESIUM"))
    {
      return 56;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_BARIUM"))
    {
      return 57;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_LANTHANUM"))
    {
      return 58;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CERIUM"))
    {
      return 59;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_PRASEODYMIUM"))
    {
      return 60;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_NEODYMIUM"))
    {
      return 61;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_PROMETHIUM"))
    {
      return 62;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SAMARIUM"))
    {
      return 63;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_EUROPIUM"))
    {
      return 64;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_GADOLINIUM"))
    {
      return 65;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TERBIUM"))
    {
      return 66;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_DYSPROSIUM"))
    {
      return 67;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_HOLMIUM"))
    {
      return 68;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ERBIUM"))
    {
      return 69;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_THULIUM"))
    {
      return 70;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_YTTERBIUM"))
    {
      return 71;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_LUTETIUM"))
    {
      return 72;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_HAFNIUM"))
    {
      return 73;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TANTALUM"))
    {
      return 74;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TUNGSTEN"))
    {
      return 75;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_RHENIUM"))
    {
      return 76;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_OSMIUM"))
    {
      return 77;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_IRIDIUM"))
    {
      return 78;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_PLATINUM"))
    {
      return 79;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_GOLD"))
    {
      return 80;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_MERCURY"))
    {
      return 81;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_THALLIUM"))
    {
      return 82;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_LEAD"))
    {
      return 83;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_BISMUTH"))
    {
      return 84;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_POLONIUM"))
    {
      return 85;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ASTATINE"))
    {
      return 86;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_RADON"))
    {
      return 87;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_FRANCIUM"))
    {
      return 88;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_RADIUM"))
    {
      return 89;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ACTINIUM"))
    {
      return 90;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_THORIUM"))
    {
      return 91;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_PROTACTINIUM"))
    {
      return 92;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_URANIUM"))
    {
      return 93;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_NEPTUNIUM"))
    {
      return 94;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_PLUTONIUM"))
    {
      return 95;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_AMERICIUM"))
    {
      return 96;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CURIUM"))
    {
      return 97;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_BERKELIUM"))
    {
      return 98;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_CALIFORNIUM"))
    {
      return 99;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_EINSTEINIUM"))
    {
      return 100;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_FERMIUM"))
    {
      return 101;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_MENDELEVIUM"))
    {
      return 102;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_NOBELIUM"))
    {
      return 103;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_LAWRENCIUM"))
    {
      return 104;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_RUTHERFORDIUM"))
    {
      return 105;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_DUBNIUM"))
    {
      return 106;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_SEABORGIUM"))
    {
      return 107;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_BOHRIUM"))
    {
      return 108;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_HASSIUM"))
    {
      return 109;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_MEITNERIUM"))
    {
      return 110;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_DARMSTADTIUM"))
    {
      return 111;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_ROENTGENIUM"))
    {
      return 112;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_COPERNICIUM"))
    {
      return 113;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_NIHONIUM"))
    {
      return 114;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_FLEROVIUM"))
    {
      return 115;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_MOSCOVIUM"))
    {
      return 116;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_LIVERMORIUM"))
    {
      return 117;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_TENNESSINE"))
    {
      return 118;
    }
    else if (!strcmp(v1, "OS_ELIGIBILITY_DOMAIN_OGANESSON"))
    {
      return 119;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270EDD478]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x270EDCFD8](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x270EDD5C8](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270EDD688](*(void *)&a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDD8B8](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDD8C8](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDD8D0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDDD40](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDDD50](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDD2A0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDD2B8](*(void *)&__errnum);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDDDE8](name, targetq, flags);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDDE08](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x270EDDE30]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDDE50](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDDE58](keys, values, count);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDDE70](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDDE78](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDDE80](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDDE88](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDDE90](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDDED0](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDDEF0](object);
}