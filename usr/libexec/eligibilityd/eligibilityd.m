void sub_100004870(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;

  v5 = a3;
  v6 = [a2 unsignedIntegerValue];
  if (v6 == (id)3)
  {
    [*(id *)(a1 + 32) setDeviceClassesOfInterest:v5];
  }
  else if (v6 == (id)2)
  {
    [*(id *)(a1 + 32) setBillingCountriesOfInterest:v5];
  }
  else if (v6 == (id)1)
  {
    [*(id *)(a1 + 32) setLocatedCountriesOfInterest:v5 withGracePeriod:[*(id *)(a1 + 40) gracePeriodInSeconds]];
  }
  else
  {
    v7 = sub_10000D0EC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[SulfurDomain status]_block_invoke";
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: Unsupported input type passed in to SulfurDomain", (uint8_t *)&v8, 0xCu);
    }
  }
}

const char *sub_1000057F8(uint64_t a1)
{
  switch(a1)
  {
    case 1:
      result = "OS_ELIGIBILITY_DOMAIN_LOTX";
      break;
    case 2:
      result = "OS_ELIGIBILITY_DOMAIN_HYDROGEN";
      break;
    case 3:
      result = "OS_ELIGIBILITY_DOMAIN_HELIUM";
      break;
    case 4:
      result = "OS_ELIGIBILITY_DOMAIN_LITHIUM";
      break;
    case 5:
      result = "OS_ELIGIBILITY_DOMAIN_BERYLLIUM";
      break;
    case 6:
      result = "OS_ELIGIBILITY_DOMAIN_BORON";
      break;
    case 7:
      result = "OS_ELIGIBILITY_DOMAIN_CARBON";
      break;
    case 8:
      result = "OS_ELIGIBILITY_DOMAIN_NITROGEN";
      break;
    case 9:
      result = "OS_ELIGIBILITY_DOMAIN_OXYGEN";
      break;
    case 10:
      result = "OS_ELIGIBILITY_DOMAIN_FLUORINE";
      break;
    case 11:
      result = "OS_ELIGIBILITY_DOMAIN_NEON";
      break;
    case 12:
      result = "OS_ELIGIBILITY_DOMAIN_SODIUM";
      break;
    case 13:
      result = "OS_ELIGIBILITY_DOMAIN_MAGNESIUM";
      break;
    case 14:
      result = "OS_ELIGIBILITY_DOMAIN_ALUMINUM";
      break;
    case 15:
      result = "OS_ELIGIBILITY_DOMAIN_SILICON";
      break;
    case 16:
      result = "OS_ELIGIBILITY_DOMAIN_PHOSPHORUS";
      break;
    case 17:
      result = "OS_ELIGIBILITY_DOMAIN_SULFUR";
      break;
    case 18:
      result = "OS_ELIGIBILITY_DOMAIN_CHLORINE";
      break;
    case 19:
      result = "OS_ELIGIBILITY_DOMAIN_ARGON";
      break;
    case 20:
      result = "OS_ELIGIBILITY_DOMAIN_POTASSIUM";
      break;
    case 21:
      result = "OS_ELIGIBILITY_DOMAIN_CALCIUM";
      break;
    case 22:
      result = "OS_ELIGIBILITY_DOMAIN_SCANDIUM";
      break;
    case 23:
      result = "OS_ELIGIBILITY_DOMAIN_TITANIUM";
      break;
    case 24:
      result = "OS_ELIGIBILITY_DOMAIN_VANADIUM";
      break;
    case 25:
      result = "OS_ELIGIBILITY_DOMAIN_CHROMIUM";
      break;
    case 26:
      result = "OS_ELIGIBILITY_DOMAIN_MANGANESE";
      break;
    case 27:
      result = "OS_ELIGIBILITY_DOMAIN_IRON";
      break;
    case 28:
      result = "OS_ELIGIBILITY_DOMAIN_COBALT";
      break;
    case 29:
      result = "OS_ELIGIBILITY_DOMAIN_NICKEL";
      break;
    case 30:
      result = "OS_ELIGIBILITY_DOMAIN_COPPER";
      break;
    case 31:
      result = "OS_ELIGIBILITY_DOMAIN_ZINC";
      break;
    case 32:
      result = "OS_ELIGIBILITY_DOMAIN_GALLIUM";
      break;
    case 33:
      result = "OS_ELIGIBILITY_DOMAIN_GERMANIUM";
      break;
    case 34:
      result = "OS_ELIGIBILITY_DOMAIN_ARSENIC";
      break;
    case 35:
      result = "OS_ELIGIBILITY_DOMAIN_SELENIUM";
      break;
    case 36:
      result = "OS_ELIGIBILITY_DOMAIN_BROMINE";
      break;
    case 37:
      result = "OS_ELIGIBILITY_DOMAIN_KRYPTON";
      break;
    case 38:
      result = "OS_ELIGIBILITY_DOMAIN_RUBIDIUM";
      break;
    case 39:
      result = "OS_ELIGIBILITY_DOMAIN_STRONTIUM";
      break;
    case 40:
      result = "OS_ELIGIBILITY_DOMAIN_YTTRIUM";
      break;
    case 41:
      result = "OS_ELIGIBILITY_DOMAIN_ZIRCONIUM";
      break;
    case 42:
      result = "OS_ELIGIBILITY_DOMAIN_NIOBIUM";
      break;
    case 43:
      result = "OS_ELIGIBILITY_DOMAIN_MOLYBDENUM";
      break;
    default:
      uint64_t v2 = a1 - 120;
      result = "OS_ELIGIBILITY_DOMAIN_TEST";
      switch(v2)
      {
        case 0:
          return result;
        case 1:
          result = "OS_ELIGIBILITY_DOMAIN_PODCASTS_TRANSCRIPTS";
          break;
        case 2:
          result = "OS_ELIGIBILITY_DOMAIN_GREYMATTER";
          break;
        case 3:
          result = "OS_ELIGIBILITY_DOMAIN_XCODE_LLM";
          break;
        case 4:
          result = "OS_ELIGIBILITY_DOMAIN_SEARCH_MARKETPLACES";
          break;
        case 5:
          result = "OS_ELIGIBILITY_DOMAIN_SWIFT_ASSIST";
          break;
        default:
          result = 0;
          break;
      }
      break;
  }
  return result;
}

char *sub_100005B64()
{
  uint64_t v2 = 0;
  if (asprintf(&v2, "%s%s", "/", "/private/var/db/eligibilityd/eligibility.plist") == -1)
  {
    v0 = sub_10000D0EC();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v4 = "copy_eligibility_domain_public_answer_plist_path";
      __int16 v5 = 2080;
      v6 = "/private/var/db/eligibilityd/eligibility.plist";
      _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  return v2;
}

void sub_100005F18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 unsignedIntegerValue];
  if (v6 == (id)3)
  {
    [*(id *)(a1 + 32) setDeviceClassesOfInterest:v5];
  }
  else if (v6 == (id)2)
  {
    [*(id *)(a1 + 32) setBillingCountriesOfInterest:v5];
  }
  else if (v6 == (id)1)
  {
    [*(id *)(a1 + 32) setLocatedCountriesOfInterest:v5 withGracePeriod:[*(id *)(a1 + 40) gracePeriodInSeconds]];
  }
  else
  {
    v7 = sub_10000D0EC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      v9 = "-[PhosphorusDomain status]_block_invoke";
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: Unsupported input type passed in to PhosphorusDomain", (uint8_t *)&v8, 0xCu);
    }
  }
}

void sub_100009D7C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 description];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

uint64_t sub_10000AEC8()
{
  qword_10004C7E8 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_10000CAD8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 unsignedIntegerValue];
  if (v6 == (id)3)
  {
    [*(id *)(a1 + 32) setDeviceClassesOfInterest:v5];
  }
  else if (v6 == (id)2)
  {
    [*(id *)(a1 + 32) setBillingCountriesOfInterest:v5];
  }
  else if (v6 == (id)1)
  {
    [*(id *)(a1 + 32) setLocatedCountriesOfInterest:v5 withGracePeriod:[*(id *)(a1 + 40) gracePeriodInSeconds]];
  }
  else
  {
    v7 = sub_10000D0EC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      v9 = "-[KryptonDomain status]_block_invoke";
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: Unsupported input type passed in to KryptonDomain", (uint8_t *)&v8, 0xCu);
    }
  }
}

char *sub_10000CE98(unint64_t a1)
{
  if (a1 < 0x10) {
    return (&off_100038A70)[a1];
  }
  v3 = sub_10000D0EC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "eligibility_input_to_str";
    __int16 v6 = 2048;
    unint64_t v7 = a1;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s: Unsupported input type: %llu", (uint8_t *)&v4, 0x16u);
  }

  return 0;
}

id sub_10000CF70(unint64_t a1)
{
  if (a1 >= 5)
  {
    v3 = sub_10000D0EC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v6 = "eligibility_answer_to_str";
      __int16 v7 = 2048;
      unint64_t v8 = a1;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s: Unsupported answer type: %llu", buf, 0x16u);
    }

    uint64_t v2 = +[NSString stringWithFormat:@"<Unknown: %llu>", a1];
  }
  else
  {
    uint64_t v2 = +[NSString stringWithUTF8String:(&off_100038A48)[a1]];
  }

  return v2;
}

id sub_10000D080(unint64_t a1)
{
  if (sub_10000CE98(a1)) {
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  }
  else {
  uint64_t v2 = +[NSString stringWithFormat:@"<Unknown: %llu>", a1];
  }

  return v2;
}

id sub_10000D0EC()
{
  if (qword_10004C800 != -1) {
    dispatch_once(&qword_10004C800, &stru_100038B48);
  }
  v0 = (void *)qword_10004C7F8;

  return v0;
}

void sub_10000D140(id a1)
{
  qword_10004C7F8 = (uint64_t)os_log_create("com.apple.os_eligibility", "daemon");

  _objc_release_x1();
}

void start()
{
  v1 = sub_10000D0EC();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v14 = "main";
    __int16 v15 = 2080;
    v16 = "160.60.1";
    __int16 v17 = 2080;
    v18 = "Nov 10 2024";
    __int16 v19 = 2080;
    v20 = "03:40:44";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%s: eligibilityd (%s) built at %s %s started", buf, 0x2Au);
  }

  uint64_t v2 = dispatch_workloop_create("com.apple.eligibility.xpc_workloop");
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.eligibility.xpc_handler", v3, v2);

  sub_100018B7C(v4, &stru_100038B68);
  id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  __int16 v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);

  __int16 v7 = dispatch_queue_create("com.apple.eligibility.notifications", v6);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v7, &stru_100038BA8);
  xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.eligibilityd", v4, 1uLL);
  if (!mach_service)
  {
    v9 = sub_10000D0EC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "main";
      __int16 v15 = 2080;
      v16 = "com.apple.eligibilityd";
      _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s: Unable to start xpc service %s", buf, 0x16u);
    }

    exit(1);
  }
  v10 = mach_service;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000D3D8;
  handler[3] = &unk_100038BD0;
  v12 = v2;
  xpc_connection_set_event_handler(v10, handler);
  xpc_connection_activate(v10);

  dispatch_main();
}

void sub_10000D3D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = *(void **)(a1 + 32);
  id v5 = (_xpc_connection_s *)v3;
  __int16 v6 = v4;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_set_target_queue(v5, v6);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000D568;
    handler[3] = &unk_100038BD0;
    __int16 v7 = v5;
    v16 = v7;
    xpc_connection_set_event_handler(v7, handler);
    xpc_connection_resume(v7);
    unint64_t v8 = v6;
    v9 = +[GlobalConfiguration sharedInstance];
    unsigned int v10 = [v9 isMemoryConstrainedDevice];

    if (v10)
    {
      v11 = qword_10004C808;
      if (!qword_10004C808)
      {
        dispatch_source_t v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v8);
        v13 = (void *)qword_10004C808;
        qword_10004C808 = (uint64_t)v12;

        dispatch_source_set_event_handler((dispatch_source_t)qword_10004C808, &stru_100038BF0);
        v11 = qword_10004C808;
      }
      dispatch_time_t v14 = dispatch_time(0, 30000000000);
      dispatch_source_set_timer(v11, v14, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_activate((dispatch_object_t)qword_10004C808);
    }
  }
}

void sub_10000D568()
{
  uint64_t v0 = __chkstk_darwin();
  id v2 = v1;
  id v3 = (_xpc_connection_s *)*(id *)(v0 + 32);
  id v4 = v2;
  *(void *)&long long v5 = -1;
  *((void *)&v5 + 1) = -1;
  long long v104 = v5;
  long long v105 = v5;
  xpc_connection_get_audit_token();
  uint64_t pid = xpc_connection_get_pid(v3);
  int v7 = proc_pidpath(pid, buffer, 0x1000u);
  if (v7 < 1)
  {
    v11 = @"(unknown)";
  }
  else
  {
    unsigned int v8 = v7;
    v9 = +[NSFileManager defaultManager];
    unsigned int v10 = [v9 stringWithFileSystemRepresentation:buffer length:v8];

    v11 = [v10 lastPathComponent];
  }
  dispatch_source_t v12 = +[NSString stringWithFormat:@"%@(%d)", v11, pid];

  v13 = xpc_copy_description(v4);
  dispatch_time_t v14 = sub_10000D0EC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buffer = 136315650;
    *(void *)&buffer[4] = "_connectionHandler";
    *(_WORD *)&buffer[12] = 2112;
    *(void *)&buffer[14] = v12;
    *(_WORD *)&buffer[22] = 2080;
    *(void *)&buffer[24] = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Message from %@: %s", buffer, 0x20u);
  }

  free(v13);
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_error)
  {
    v16 = sub_10000D0EC();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      string = xpc_dictionary_get_string(v4, _xpc_error_key_description);
      *(_DWORD *)buffer = 136315394;
      *(void *)&buffer[4] = "_connectionHandler";
      *(_WORD *)&buffer[12] = 2080;
      *(void *)&buffer[14] = string;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: Received xpc error: %s", buffer, 0x16u);
    }
    goto LABEL_89;
  }
  reply = xpc_dictionary_create_reply(v4);
  if (reply)
  {
    v16 = reply;
    if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_dictionary)
    {
      __int16 v17 = sub_10000D0EC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buffer = 136315138;
        *(void *)&buffer[4] = "eligibility_xpc_get_message_type";
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: xpc message type must be a dictionary", buffer, 0xCu);
      }
LABEL_88:
      xpc_connection_cancel(v3);
LABEL_89:

      goto LABEL_90;
    }
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "eligibility_message_type");
    switch(uint64)
    {
      case 1uLL:
        *(_OWORD *)buffer = v104;
        *(_OWORD *)&buffer[16] = v105;
        if (sub_10000E818((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.setInput"))
        {
          *(_OWORD *)buffer = v104;
          *(_OWORD *)&buffer[16] = v105;
          if (sub_10000E974(buffer))
          {
            id v21 = v12;
            id v22 = v4;
            uint64_t v23 = xpc_dictionary_get_uint64(v22, "input");
            v24 = xpc_dictionary_get_value(v22, "value");
            uint64_t v25 = xpc_dictionary_get_uint64(v22, "status");

            if (v23 <= 0xF
              && ((0xC216u >> v23) & 1) != 0
              && (!v24 || !v25)
              && (v24 || v25)
              && v25 <= 7
              && ((1 << v25) & 0xE1) != 0)
            {
              v98 = +[EligibilityEngine sharedInstance];
              *(void *)buffer = 0;
              unsigned __int8 v99 = [v98 setInput:v23 to:v24 status:v25 fromProcess:v21 withError:buffer];
              id v28 = *(id *)buffer;

              v26 = v16;
              if (v99)
              {
                v27 = v12;
                v30 = 0;
                char v29 = 1;
                goto LABEL_27;
              }
              v27 = v12;
            }
            else
            {
              v26 = v16;
              v27 = v12;
              id v28 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
            }
            id v28 = v28;
            char v29 = 0;
            v30 = v28;
LABEL_27:

            id v31 = v30;
            if (v29)
            {
              int64_t v32 = 0;
              dispatch_source_t v12 = v27;
              goto LABEL_100;
            }
            dispatch_source_t v12 = v27;
            goto LABEL_103;
          }
        }
        v74 = sub_10000D0EC();
        if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
          goto LABEL_87;
        }
        *(_DWORD *)buffer = 136315394;
        *(void *)&buffer[4] = "_connectionHandler";
        *(_WORD *)&buffer[12] = 2112;
        *(void *)&buffer[14] = v12;
        v75 = "%s: Process %@ not entitled to send set input message";
        goto LABEL_86;
      case 2uLL:
        *(_OWORD *)buffer = v104;
        *(_OWORD *)&buffer[16] = v105;
        if (sub_10000E818((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.resetDomain"))
        {
          *(_OWORD *)buffer = v104;
          *(_OWORD *)&buffer[16] = v105;
          if (sub_10000E974(buffer))
          {
            id v103 = 0;
            uint64_t v33 = xpc_dictionary_get_uint64(v4, "domain");
            v34 = +[EligibilityEngine sharedInstance];
            unsigned __int8 v35 = [v34 resetDomain:v33 withError:&v103];

            goto LABEL_43;
          }
        }
        v74 = sub_10000D0EC();
        if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
          goto LABEL_87;
        }
        *(_DWORD *)buffer = 136315394;
        *(void *)&buffer[4] = "_connectionHandler";
        *(_WORD *)&buffer[12] = 2112;
        *(void *)&buffer[14] = v12;
        v75 = "%s: Process %@ not entitled to send reset domain message";
        goto LABEL_86;
      case 3uLL:
        *(_OWORD *)buffer = v104;
        *(_OWORD *)&buffer[16] = v105;
        if (!sub_10000E818((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.forceDomain")
          || (*(_OWORD *)buffer = v104, *(_OWORD *)&buffer[16] = v105, (sub_10000E974(buffer) & 1) == 0))
        {
          v74 = sub_10000D0EC();
          if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
            goto LABEL_87;
          }
          *(_DWORD *)buffer = 136315394;
          *(void *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(void *)&buffer[14] = v12;
          v75 = "%s: Process %@ not entitled to send force domain message";
          goto LABEL_86;
        }
        id v36 = v4;
        uint64_t v37 = xpc_dictionary_get_uint64(v36, "domain");
        uint64_t v38 = xpc_dictionary_get_uint64(v36, "answer");
        v39 = xpc_dictionary_get_dictionary(v36, "context");

        if (v38 - 2 >= 3)
        {
          v43 = v16;
          v44 = v12;
          id v42 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
        }
        else
        {
          v40 = +[EligibilityEngine sharedInstance];
          *(void *)buffer = 0;
          unsigned __int8 v41 = [v40 forceDomainAnswer:v37 answer:v38 context:v39 withError:buffer];
          id v42 = *(id *)buffer;

          v43 = v16;
          if (v41)
          {
            v44 = v12;
            v45 = 0;
            char v46 = 1;
            goto LABEL_138;
          }
          v44 = v12;
        }
        id v42 = v42;
        char v46 = 0;
        v45 = v42;
LABEL_138:

        id v31 = v45;
        if (v46)
        {
          int64_t v32 = 0;
          dispatch_source_t v12 = v44;
          v16 = v43;
          goto LABEL_135;
        }
        dispatch_source_t v12 = v44;
        v16 = v43;
        goto LABEL_108;
      case 4uLL:
        *(_OWORD *)buffer = v104;
        *(_OWORD *)&buffer[16] = v105;
        if (sub_10000E818((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.internalState"))
        {
          id v103 = 0;
          v47 = v16;
          v48 = +[EligibilityEngine sharedInstance];
          v49 = [v48 internalStateWithError:&v103];
          if (!v49) {
            goto LABEL_55;
          }
          v50 = (void *)_CFXPCCreateXPCObjectFromCFObject();
          v51 = "internalStateDictionary";
          goto LABEL_54;
        }
        v74 = sub_10000D0EC();
        if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
          goto LABEL_87;
        }
        *(_DWORD *)buffer = 136315394;
        *(void *)&buffer[4] = "_connectionHandler";
        *(_WORD *)&buffer[12] = 2112;
        *(void *)&buffer[14] = v12;
        v75 = "%s: Process %@ not entitled to send internal state message";
        goto LABEL_86;
      case 5uLL:
        *(_OWORD *)buffer = v104;
        *(_OWORD *)&buffer[16] = v105;
        if (!sub_10000E818((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.resetAllDomains")
          || (*(_OWORD *)buffer = v104, *(_OWORD *)&buffer[16] = v105, (sub_10000E974(buffer) & 1) == 0))
        {
          v74 = sub_10000D0EC();
          if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
            goto LABEL_87;
          }
          *(_DWORD *)buffer = 136315394;
          *(void *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(void *)&buffer[14] = v12;
          v75 = "%s: Process %@ not entitled to send reset all domains message";
          goto LABEL_86;
        }
        id v103 = 0;
        v52 = +[EligibilityEngine sharedInstance];
        unsigned __int8 v35 = [v52 resetAllDomainsWithError:&v103];

LABEL_43:
        id v31 = v103;
        int64_t v32 = 0;
        if ((v35 & 1) == 0) {
          goto LABEL_108;
        }
        goto LABEL_135;
      case 6uLL:
        *(_OWORD *)buffer = v104;
        *(_OWORD *)&buffer[16] = v105;
        if (!sub_10000E818((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.forceDomainSet")
          || (*(_OWORD *)buffer = v104, *(_OWORD *)&buffer[16] = v105, (sub_10000E974(buffer) & 1) == 0))
        {
          v74 = sub_10000D0EC();
          if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
            goto LABEL_87;
          }
          *(_DWORD *)buffer = 136315394;
          *(void *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(void *)&buffer[14] = v12;
          v75 = "%s: Process %@ not entitled to send force domain set message";
          goto LABEL_86;
        }
        v26 = v16;
        id v53 = v4;
        uint64_t v54 = xpc_dictionary_get_uint64(v53, "domainSet");
        uint64_t v55 = xpc_dictionary_get_uint64(v53, "answer");
        v56 = xpc_dictionary_get_dictionary(v53, "context");

        if (v54 == 1 && v55 - 2 <= 2)
        {
          v57 = +[EligibilityEngine sharedInstance];
          *(void *)buffer = 0;
          char v58 = 1;
          unsigned __int8 v59 = [v57 forceDomainSetAnswers:1 answer:v55 context:v56 withError:buffer];
          id v60 = *(id *)buffer;

          v61 = v12;
          if (v59)
          {
            v62 = 0;
            goto LABEL_98;
          }
        }
        else
        {
          v61 = v12;
          id v60 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
        }
        id v60 = v60;
        char v58 = 0;
        v62 = v60;
LABEL_98:

        id v31 = v62;
        if (v58)
        {
          int64_t v32 = 0;
          dispatch_source_t v12 = v61;
LABEL_100:
          v16 = v26;
          goto LABEL_135;
        }
        dispatch_source_t v12 = v61;
LABEL_103:
        v16 = v26;
        goto LABEL_108;
      case 7uLL:
        *(_OWORD *)buffer = v104;
        *(_OWORD *)&buffer[16] = v105;
        if (!sub_10000E818((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.stateDump"))
        {
          v74 = sub_10000D0EC();
          if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
            goto LABEL_87;
          }
          *(_DWORD *)buffer = 136315394;
          *(void *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(void *)&buffer[14] = v12;
          v75 = "%s: Process %@ not entitled to send state dump message";
          goto LABEL_86;
        }
        id v103 = 0;
        v47 = v16;
        v48 = +[EligibilityEngine sharedInstance];
        v49 = [v48 stateDumpWithError:&v103];
        if (v49)
        {
          v50 = (void *)_CFXPCCreateXPCObjectFromCFObject();
          v51 = "stateDumpDictionary";
LABEL_54:
          xpc_dictionary_set_value(v47, v51, v50);
        }
LABEL_55:

        id v31 = v103;
        if (v49) {
          goto LABEL_67;
        }
        goto LABEL_108;
      case 8uLL:
        *(_OWORD *)buffer = v104;
        *(_OWORD *)&buffer[16] = v105;
        if (sub_10000E818((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.dumpSysdiagnoseDataToDir"))
        {
          v63 = xpc_dictionary_get_string(v4, "dirPath");
          if (v63)
          {
            v64 = v63;
            uint64_t v65 = +[NSURL fileURLWithFileSystemRepresentation:v63 isDirectory:1 relativeToURL:0];
            if (v65)
            {
              v66 = (void *)v65;
              v67 = +[EligibilityEngine sharedInstance];
              *(void *)&long long v106 = 0;
              unsigned int v68 = [v67 dumpToDirectory:v66 withError:&v106];
              id v69 = (id)v106;

              if (v68)
              {

                goto LABEL_66;
              }
              goto LABEL_106;
            }
            v76 = sub_10000D0EC();
            if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
            {
LABEL_105:

              id v69 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
LABEL_106:
              v80 = v69;
              goto LABEL_107;
            }
            *(_DWORD *)buffer = 136315394;
            *(void *)&buffer[4] = "_dumpToDirectory";
            *(_WORD *)&buffer[12] = 2080;
            *(void *)&buffer[14] = v64;
            v77 = "%s: Failed to convert directory path %s to an NSURL, aborting.";
            v78 = v76;
            uint32_t v79 = 22;
          }
          else
          {
            v76 = sub_10000D0EC();
            if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
              goto LABEL_105;
            }
            *(_DWORD *)buffer = 136315138;
            *(void *)&buffer[4] = "_dumpToDirectory";
            v77 = "%s: File path read from xpc message was nil, aborting.";
            v78 = v76;
            uint32_t v79 = 12;
          }
          _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, v77, buffer, v79);
          goto LABEL_105;
        }
        v74 = sub_10000D0EC();
        if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
          goto LABEL_87;
        }
        *(_DWORD *)buffer = 136315394;
        *(void *)&buffer[4] = "_connectionHandler";
        *(_WORD *)&buffer[12] = 2112;
        *(void *)&buffer[14] = v12;
        v75 = "%s: Process %@ not entitled to send sysdiagnose dump message";
        goto LABEL_86;
      case 9uLL:
        *(_OWORD *)buffer = v104;
        *(_OWORD *)&buffer[16] = v105;
        if (!sub_10000E818((uint64_t)buffer, (uint64_t)"com.apple.private.eligibilityd.setTestMode")
          || (*(_OWORD *)buffer = v104, *(_OWORD *)&buffer[16] = v105, (sub_10000E974(buffer) & 1) == 0))
        {
          v74 = sub_10000D0EC();
          if (!os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
            goto LABEL_87;
          }
          *(_DWORD *)buffer = 136315394;
          *(void *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(void *)&buffer[14] = v12;
          v75 = "%s: Process %@ not entitled to send set test mode message";
LABEL_86:
          _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, v75, buffer, 0x16u);
LABEL_87:

          goto LABEL_88;
        }
        BOOL v70 = xpc_dictionary_get_BOOL(v4, "enabled");
        v71 = +[GlobalConfiguration sharedInstance];
        *(void *)buffer = 0;
        unsigned int v72 = [v71 setTestMode:v70 withError:buffer];
        id v73 = *(id *)buffer;

        if (v72)
        {

LABEL_66:
          id v31 = 0;
LABEL_67:
          int64_t v32 = 0;
          goto LABEL_135;
        }
        v80 = v73;
LABEL_107:
        id v81 = v80;

        id v31 = v81;
LABEL_108:
        v82 = sub_10000D0EC();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buffer = 136315650;
          *(void *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2048;
          *(void *)&buffer[14] = uint64;
          *(_WORD *)&buffer[22] = 2112;
          *(void *)&buffer[24] = v31;
          _os_log_error_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "%s: Message %llu failed: %@", buffer, 0x20u);
        }

        id v83 = v31;
        id v31 = v83;
        if (v83)
        {
          v84 = [v83 domain];
          unsigned int v85 = [v84 isEqualToString:NSPOSIXErrorDomain];

          if (v85)
          {
            id v86 = v31;
            goto LABEL_127;
          }
          v100 = v16;
          v101 = v12;
          long long v108 = 0u;
          long long v109 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          id obj = [v31 underlyingErrors];
          id v87 = [obj countByEnumeratingWithState:&v106 objects:buffer count:16];
          if (!v87) {
            goto LABEL_121;
          }
          id v88 = v87;
          uint64_t v89 = *(void *)v107;
LABEL_115:
          uint64_t v90 = 0;
          while (1)
          {
            if (*(void *)v107 != v89) {
              objc_enumerationMutation(obj);
            }
            v91 = *(void **)(*((void *)&v106 + 1) + 8 * v90);
            v92 = [v91 domain];
            unsigned __int8 v93 = [v92 isEqualToString:NSPOSIXErrorDomain];

            if (v93) {
              break;
            }
            if (v88 == (id)++v90)
            {
              id v88 = [obj countByEnumeratingWithState:&v106 objects:buffer count:16];
              if (!v88)
              {
LABEL_121:

                v16 = v100;
                dispatch_source_t v12 = v101;
                goto LABEL_122;
              }
              goto LABEL_115;
            }
          }
          id v86 = v91;

          v16 = v100;
          dispatch_source_t v12 = v101;
          if (v86)
          {
LABEL_127:
            int64_t v32 = (int64_t)[v86 code];
LABEL_128:
            if (v31)
            {
              id v95 = [v31 description];
              v96 = (const char *)[v95 UTF8String];

              if (v96)
              {
                xpc_dictionary_set_string(v16, "errorDesc", v96);
              }
              else
              {
                v97 = sub_10000D0EC();
                if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buffer = 136315394;
                  *(void *)&buffer[4] = "_connectionHandler";
                  *(_WORD *)&buffer[12] = 2112;
                  *(void *)&buffer[14] = v31;
                  _os_log_error_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_ERROR, "%s: Received an error, but couldn't obtain its c-string description: %@", buffer, 0x16u);
                }
              }
            }

LABEL_135:
            xpc_dictionary_set_int64(v16, "errorNum", v32);
            xpc_connection_send_message(v3, v16);

            goto LABEL_91;
          }
        }
        else
        {
LABEL_122:
        }
        v94 = sub_10000D0EC();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buffer = 136315394;
          *(void *)&buffer[4] = "_connectionHandler";
          *(_WORD *)&buffer[12] = 2112;
          *(void *)&buffer[14] = v31;
          _os_log_fault_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_FAULT, "%s: Unknown underlying POSIX error for - %@", buffer, 0x16u);
        }

        id v86 = 0;
        int64_t v32 = 107;
        goto LABEL_128;
      default:
        goto LABEL_88;
    }
  }
  __int16 v19 = sub_10000D0EC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buffer = 136315138;
    *(void *)&buffer[4] = "_connectionHandler";
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: Failed to construct reply message, canceling connection", buffer, 0xCu);
  }

  xpc_connection_cancel(v3);
LABEL_90:
  id v31 = 0;
LABEL_91:
}

void sub_10000E75C(id a1)
{
  if (!dispatch_source_testcancel((dispatch_source_t)qword_10004C808))
  {
    id v1 = sub_10000D0EC();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      int v2 = 136315138;
      id v3 = "_tryExitWhenCleanOnWorkloop_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "%s: Running on a memory-constrained device; eager exiting when clean",
        (uint8_t *)&v2,
        0xCu);
    }

    xpc_transaction_exit_clean();
  }
}

BOOL sub_10000E818(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)xpc_copy_entitlement_for_token();
  id v4 = v3;
  if (v3)
  {
    if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_BOOL)
    {
      BOOL value = xpc_BOOL_get_value(v4);
      goto LABEL_8;
    }
    long long v5 = sub_10000D0EC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      unsigned int v10 = "_checkEntitlement";
      __int16 v11 = 2080;
      uint64_t v12 = a2;
      __int16 v6 = "%s: Entitlement %s was the wrong type";
LABEL_10:
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    long long v5 = sub_10000D0EC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      unsigned int v10 = "_checkEntitlement";
      __int16 v11 = 2080;
      uint64_t v12 = a2;
      __int16 v6 = "%s: Missing entitlement %s";
      goto LABEL_10;
    }
  }

  BOOL value = 0;
LABEL_8:

  return value;
}

uint64_t sub_10000E974(_OWORD *a1)
{
  int v2 = +[GlobalConfiguration sharedInstance];
  unsigned int v3 = [v2 testMode];

  if (!v3) {
    return 1;
  }
  long long v4 = a1[1];
  v7[0] = *a1;
  v7[1] = v4;
  if (sub_10000E818((uint64_t)v7, (uint64_t)"com.apple.private.eligibilityd.setTestMode")) {
    return 1;
  }
  __int16 v6 = sub_10000D0EC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v7[0]) = 136315138;
    *(void *)((char *)v7 + 4) = "_checkTestModeEntitlement";
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: Missing the com.apple.private.eligibilityd.setTestMode entitlement while test mode is enabled", (uint8_t *)v7, 0xCu);
  }

  return 0;
}

void sub_10000EA78(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  unsigned int v3 = sub_10000D0EC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    __int16 v6 = "main_block_invoke_2";
    __int16 v7 = 2080;
    unsigned int v8 = string;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Got darwin notification %s", (uint8_t *)&v5, 0x16u);
  }

  if (!strcmp(string, "AppleLanguagePreferencesChangedNotification")
    || !strcmp(string, "AFLanguageCodeDidChangeDarwinNotification")
    || !strcmp(string, "com.apple.coregraphics.GUIConsoleSessionChanged"))
  {
    long long v4 = +[EligibilityEngine sharedInstance];
    [v4 recomputeAllDomainAnswers];
  }
}

void sub_10000EB9C(id a1)
{
  uint32_t v1 = notify_post("com.apple.os-eligibility-domain.input-needed");
  if (v1)
  {
    uint32_t v2 = v1;
    unsigned int v3 = sub_10000D0EC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v15 = "_sendInputsNeededNotification";
      __int16 v16 = 1024;
      LODWORD(v17) = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s: Could not send inputs needed notification \"com.apple.os-eligibility-domain.input-needed\": %u", buf, 0x12u);
    }
  }
  v13 = 0;
  if (asprintf(&v13, "%s%s", "/", "/private/var/db/os_eligibility") == -1)
  {
    long long v4 = sub_10000D0EC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v15 = "copy_eligibility_domain_data_vault_directory_path";
      __int16 v16 = 2080;
      __int16 v17 = "/private/var/db/os_eligibility";
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  int v5 = v13;
  sub_10000EEAC(v13, 1);
  free(v5);
  v13 = 0;
  if (asprintf(&v13, "%s%s", "/", "/private/var/db/eligibilityd") == -1)
  {
    __int16 v6 = sub_10000D0EC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v15 = "copy_eligibility_domain_daemon_directory_path";
      __int16 v16 = 2080;
      __int16 v17 = "/private/var/db/eligibilityd";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  __int16 v7 = v13;
  sub_10000EEAC(v13, 0);
  free(v7);
  v13 = 0;
  unsigned int v8 = sub_10001C124(&v13);
  int v9 = v13;
  if (v8)
  {
    unsigned int v10 = [v8 URLByAppendingPathComponent:@"Library/Caches/NeverRestore/" isDirectory:1];
    sub_10000EEAC((const char *)[v10 fileSystemRepresentation], 0);
  }
  else
  {
    unsigned int v10 = sub_10000D0EC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v15 = "_createDirectories";
      __int16 v16 = 2112;
      __int16 v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: Failed to obtain the URL for data container: %@", buf, 0x16u);
    }
  }

  __int16 v11 = +[EligibilityEngine sharedInstance];
  [v11 recomputeAllDomainAnswers];

  uint64_t v12 = +[EligibilityEngine sharedInstance];
  [v12 scheduleDailyRecompute];
}

void sub_10000EEAC(const char *a1, int a2)
{
  if (mkdir(a1, 0x1EDu))
  {
    int v4 = *__error();
    if (v4 == 17) {
      goto LABEL_8;
    }
    int v5 = sub_10000D0EC();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 136315906;
    __int16 v19 = "_createDirectoryAtPath";
    __int16 v20 = 2080;
    id v21 = a1;
    __int16 v22 = 2080;
    uint64_t v23 = strerror(v4);
    __int16 v24 = 1024;
    int v25 = v4;
    __int16 v6 = "%s: mkdir of path \"%s\" failed; this directory should already exist: %s(%d)";
    __int16 v7 = v5;
    uint32_t v8 = 38;
    goto LABEL_18;
  }
  if (!a2) {
    goto LABEL_8;
  }
  int v5 = sub_10000D0EC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "_createDirectoryAtPath";
    __int16 v20 = 2080;
    id v21 = a1;
    __int16 v6 = "%s: Successfully created directory \"%s\"; this should already exist";
    __int16 v7 = v5;
    uint32_t v8 = 22;
LABEL_18:
    _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, v6, buf, v8);
  }
LABEL_7:

LABEL_8:
  int v9 = opendir(a1);
  if (v9)
  {
    unsigned int v10 = v9;
    int v11 = dirfd(v9);
    if (fcntl(v11, 64, 4))
    {
      uint64_t v12 = sub_10000D0EC();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        dispatch_time_t v14 = __error();
        __int16 v15 = strerror(*v14);
        *(_DWORD *)buf = 136315650;
        __int16 v19 = "_setDataProtectionClassDForPath";
        __int16 v20 = 2080;
        id v21 = a1;
        __int16 v22 = 2080;
        uint64_t v23 = v15;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s: Failed to setclass(PROTECTION_CLASS_D) on directory %s: %s", buf, 0x20u);
      }
    }
    closedir(v10);
  }
  else
  {
    v13 = sub_10000D0EC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = __error();
      __int16 v17 = strerror(*v16);
      *(_DWORD *)buf = 136315650;
      __int16 v19 = "_setDataProtectionClassDForPath";
      __int16 v20 = 2080;
      id v21 = a1;
      __int16 v22 = 2080;
      uint64_t v23 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: opendir of %s failed: %s", buf, 0x20u);
    }
  }
}

void sub_10000F834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000F84C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) testModeEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_10000F9F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTestModeEnabled:*(unsigned __int8 *)(a1 + 40)];
}

void sub_10000FA50(id a1)
{
  byte_10004C838 = MGGetSInt64Answer() < 1073741825;
}

void sub_10000FAD0(id a1)
{
  byte_10004C828 = os_variant_has_internal_content();
}

void sub_10000FBDC(id a1)
{
  qword_10004C810 = objc_alloc_init(GlobalConfiguration);

  _objc_release_x1();
}

void sub_100012208(uint64_t a1, void *a2, int a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a5;
  id v13 = a6;
  if (a3)
  {
    dispatch_time_t v14 = [a4 path];
    __int16 v15 = sub_10000D0EC();
    __int16 v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        char v29 = [v11 summary];
        *(_DWORD *)buf = 136315650;
        id v36 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
        __int16 v37 = 2112;
        id v38 = v29;
        __int16 v39 = 2112;
        id v40 = v14;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s: Config auto-asset %@ successfully locked at path:%@", buf, 0x20u);
      }
      __int16 v17 = sub_10000D0EC();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
      if (v12)
      {
        if (v18)
        {
          __int16 v19 = [v12 summary];
          *(_DWORD *)buf = 136315394;
          id v36 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
          __int16 v37 = 2112;
          id v38 = v19;
          _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s: Newer version in progress: %@", buf, 0x16u);
        }
      }
      else if (v18)
      {
        *(_DWORD *)buf = 136315138;
        id v36 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
        _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s: No newer version currently being downloaded", buf, 0xCu);
      }

      v34[0] = v14;
      v34[1] = @"Config.plist";
      uint64_t v23 = +[NSArray arrayWithObjects:v34 count:2];
      __int16 v24 = +[NSURL fileURLWithPathComponents:v23];

      id v33 = 0;
      int v25 = +[NSDictionary dictionaryWithContentsOfURL:v24 error:&v33];
      id v22 = v33;
      if (v25)
      {
        [*(id *)(a1 + 32) _initDomainsWithConfigPlist:v25];
        v26 = +[EligibilityEngine sharedInstance];
        [v26 asyncUpdateAndRecomputeAllAnswers];

        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_1000126DC;
        v31[3] = &unk_100038D98;
        v27 = *(void **)(a1 + 40);
        id v32 = *(id *)(a1 + 48);
        [v27 endLockUsage:@"lockEligibilityConfigOptions" completion:v31];
      }
      else
      {
        id v28 = sub_10000D0EC();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v30 = [v24 path];
          *(_DWORD *)buf = 136315650;
          id v36 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
          __int16 v37 = 2112;
          id v38 = v30;
          __int16 v39 = 2112;
          id v40 = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s: Failed to open Mobile Asset configuration plist at %@: %@", buf, 0x20u);
        }
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v36 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: Sucessfully locked content, but the URL given by MobileAsset was nil", buf, 0xCu);
      }

      uint64_t v21 = *(void *)(a1 + 48);
      id v22 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      (*(void (**)(uint64_t, id))(v21 + 16))(v21, v22);
    }
  }
  else
  {
    __int16 v20 = sub_10000D0EC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v36 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
      __int16 v37 = 2112;
      id v38 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: Failed to get content lock on Mobile Asset: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_1000126DC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = sub_10000D0EC();
  uint32_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = [v5 summary];
      int v10 = 136315650;
      id v11 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Failed to release lock on %@: %@", (uint8_t *)&v10, 0x20u);
LABEL_7:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = [v5 summary];
    int v10 = 136315394;
    id v11 = "-[MobileAssetManager _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s: Successfully released lock on %@", (uint8_t *)&v10, 0x16u);
    goto LABEL_7;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_1000128E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:&stru_100038DB8];
}

void sub_1000128F8(id a1, NSError *a2)
{
  uint32_t v2 = a2;
  if (v2)
  {
    unsigned int v3 = sub_10000D0EC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[MobileAssetManager asyncRefetchMobileAsset]_block_invoke_2";
      __int16 v6 = 2112;
      __int16 v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s: Failed to fetch MobileAsset: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

void sub_100012BB8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = sub_10000D0EC();
  uint32_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = [v5 summary];
      int v10 = 136315650;
      id v11 = "-[MobileAssetManager _onMobileAssetQueue_markInterestInMobileAssetWithCompletion:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Failed to register interest in Mobile Asset %@: %@", (uint8_t *)&v10, 0x20u);
LABEL_7:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = [v5 summary];
    int v10 = 136315394;
    id v11 = "-[MobileAssetManager _onMobileAssetQueue_markInterestInMobileAssetWithCompletion:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s: Sucessfully registered interest in Mobile Asset: %@", (uint8_t *)&v10, 0x16u);
    goto LABEL_7;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100012E28(uint64_t a1)
{
  uint32_t v2 = sub_10000D0EC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[MobileAssetManager registerForMobileAssetUpdateNotification]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: AUTO-ASSET-NOTIFICATION: %@", (uint8_t *)&v5, 0x16u);
  }

  return [*(id *)(a1 + 40) _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:&stru_100038D48];
}

void sub_100012EF4(id a1, NSError *a2)
{
  uint32_t v2 = a2;
  uint64_t v3 = sub_10000D0EC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[MobileAssetManager registerForMobileAssetUpdateNotification]_block_invoke";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s: Done updating values with new MobileAsset", (uint8_t *)&v5, 0xCu);
  }

  if (v2)
  {
    int v4 = sub_10000D0EC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "-[MobileAssetManager registerForMobileAssetUpdateNotification]_block_invoke";
      __int16 v7 = 2112;
      uint64_t v8 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s: Failed to update MobileAsset on update notification: %@", (uint8_t *)&v5, 0x16u);
    }
  }
}

void sub_100013170(uint64_t a1)
{
  uint32_t v2 = sub_10000D0EC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v7 = "-[MobileAssetManager init]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s: Marking interest in MobileAsset", buf, 0xCu);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001327C;
  v4[3] = &unk_100038D28;
  id v5 = v3;
  [v5 _onMobileAssetQueue_markInterestInMobileAssetWithCompletion:v4];
}

void sub_10001327C(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = sub_10000D0EC();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      __int16 v7 = "-[MobileAssetManager init]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s: Failed to express interest in MobileAsset: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      __int16 v7 = "-[MobileAssetManager init]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: Fetching MobileAsset", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(a1 + 32) _onMobileAssetQueue_fetchMobileAssetContentWithCompletion:&stru_100038D00];
  }
}

void sub_1000133B0(id a1, NSError *a2)
{
  uint32_t v2 = a2;
  if (v2)
  {
    id v3 = sub_10000D0EC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      id v5 = "-[MobileAssetManager init]_block_invoke";
      __int16 v6 = 2112;
      __int16 v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s: Failed to fetch MobileAsset: %@", (uint8_t *)&v4, 0x16u);
    }
  }
}

id sub_10001438C(uint64_t a1)
{
  [*(id *)(a1 + 32) setLotXAsset:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setGreymatterAsset:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setXcodeLLMAsset:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setPodcastsTranscriptsAsset:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) setSearchMarketplacesAsset:*(void *)(a1 + 72)];
  [*(id *)(a1 + 32) setSwiftAssistAsset:*(void *)(a1 + 80)];
  [*(id *)(a1 + 32) setHydrogenAsset:*(void *)(a1 + 88)];
  [*(id *)(a1 + 32) setHeliumAsset:*(void *)(a1 + 96)];
  [*(id *)(a1 + 32) setLithiumAsset:*(void *)(a1 + 104)];
  [*(id *)(a1 + 32) setBerylliumAsset:*(void *)(a1 + 112)];
  [*(id *)(a1 + 32) setBoronAsset:*(void *)(a1 + 120)];
  [*(id *)(a1 + 32) setCarbonAsset:*(void *)(a1 + 128)];
  [*(id *)(a1 + 32) setNitrogenAsset:*(void *)(a1 + 136)];
  [*(id *)(a1 + 32) setOxygenAsset:*(void *)(a1 + 144)];
  [*(id *)(a1 + 32) setFluorineAsset:*(void *)(a1 + 152)];
  [*(id *)(a1 + 32) setNeonAsset:*(void *)(a1 + 160)];
  [*(id *)(a1 + 32) setSodiumAsset:*(void *)(a1 + 168)];
  [*(id *)(a1 + 32) setMagnesiumAsset:*(void *)(a1 + 176)];
  [*(id *)(a1 + 32) setAluminumAsset:*(void *)(a1 + 184)];
  [*(id *)(a1 + 32) setSiliconAsset:*(void *)(a1 + 192)];
  [*(id *)(a1 + 32) setPhosphorusAsset:*(void *)(a1 + 200)];
  [*(id *)(a1 + 32) setSulfurAsset:*(void *)(a1 + 208)];
  [*(id *)(a1 + 32) setChlorineAsset:*(void *)(a1 + 216)];
  [*(id *)(a1 + 32) setArgonAsset:*(void *)(a1 + 224)];
  [*(id *)(a1 + 32) setPotassiumAsset:*(void *)(a1 + 232)];
  [*(id *)(a1 + 32) setScandiumAsset:*(void *)(a1 + 240)];
  [*(id *)(a1 + 32) setTitaniumAsset:*(void *)(a1 + 248)];
  [*(id *)(a1 + 32) setVanadiumAsset:*(void *)(a1 + 256)];
  [*(id *)(a1 + 32) setChromiumAsset:*(void *)(a1 + 264)];
  [*(id *)(a1 + 32) setManganeseAsset:*(void *)(a1 + 272)];
  [*(id *)(a1 + 32) setIronAsset:*(void *)(a1 + 280)];
  [*(id *)(a1 + 32) setCobaltAsset:*(void *)(a1 + 288)];
  [*(id *)(a1 + 32) setNickelAsset:*(void *)(a1 + 296)];
  [*(id *)(a1 + 32) setCopperAsset:*(void *)(a1 + 304)];
  [*(id *)(a1 + 32) setGalliumAsset:*(void *)(a1 + 312)];
  [*(id *)(a1 + 32) setGermaniumAsset:*(void *)(a1 + 320)];
  [*(id *)(a1 + 32) setArsenicAsset:*(void *)(a1 + 328)];
  [*(id *)(a1 + 32) setSeleniumAsset:*(void *)(a1 + 336)];
  [*(id *)(a1 + 32) setBromineAsset:*(void *)(a1 + 344)];
  [*(id *)(a1 + 32) setKryptonAsset:*(void *)(a1 + 352)];
  [*(id *)(a1 + 32) setRubidiumAsset:*(void *)(a1 + 360)];
  [*(id *)(a1 + 32) setStrontiumAsset:*(void *)(a1 + 368)];
  [*(id *)(a1 + 32) setYttriumAsset:*(void *)(a1 + 376)];
  uint64_t v2 = *(void *)(a1 + 384);
  id v3 = *(void **)(a1 + 32);

  return [v3 setAssetVersion:v2];
}

void sub_1000146C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000146E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000146F0(uint64_t a1)
{
}

void sub_1000146F8(uint64_t a1)
{
}

void sub_100014810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014828(uint64_t a1)
{
}

void sub_100014940(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014958(uint64_t a1)
{
}

void sub_100014A70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014A88(uint64_t a1)
{
}

void sub_100014BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014BB8(uint64_t a1)
{
}

void sub_100014CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014CE8(uint64_t a1)
{
}

void sub_100014E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014E18(uint64_t a1)
{
}

void sub_100014F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014F48(uint64_t a1)
{
}

void sub_100015060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015078(uint64_t a1)
{
}

void sub_100015190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000151A8(uint64_t a1)
{
}

void sub_1000152C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000152D8(uint64_t a1)
{
}

void sub_1000153F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015408(uint64_t a1)
{
}

void sub_100015520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015538(uint64_t a1)
{
}

void sub_100015650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015668(uint64_t a1)
{
}

void sub_100015780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015798(uint64_t a1)
{
}

void sub_1000158B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000158C8(uint64_t a1)
{
}

void sub_1000159E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000159F8(uint64_t a1)
{
}

void sub_100015B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015B28(uint64_t a1)
{
}

void sub_100015C40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015C58(uint64_t a1)
{
}

void sub_100015D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015D88(uint64_t a1)
{
}

void sub_100015EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015EB8(uint64_t a1)
{
}

void sub_100015FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015FE8(uint64_t a1)
{
}

void sub_100016100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016118(uint64_t a1)
{
}

void sub_100016230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016248(uint64_t a1)
{
}

void sub_100016360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016378(uint64_t a1)
{
}

void sub_100016490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000164A8(uint64_t a1)
{
}

void sub_1000165C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000165D8(uint64_t a1)
{
}

void sub_1000166F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016708(uint64_t a1)
{
}

void sub_100016820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016838(uint64_t a1)
{
}

void sub_100016950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016968(uint64_t a1)
{
}

void sub_100016A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016A98(uint64_t a1)
{
}

void sub_100016BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016BC8(uint64_t a1)
{
}

void sub_100016CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016CF8(uint64_t a1)
{
}

void sub_100016E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016E28(uint64_t a1)
{
}

void sub_100016F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100016F58(uint64_t a1)
{
}

void sub_100017070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100017088(uint64_t a1)
{
}

void sub_1000171A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000171B8(uint64_t a1)
{
}

void sub_1000172D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000172E8(uint64_t a1)
{
}

void sub_100017400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100017418(uint64_t a1)
{
}

void sub_100017530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100017548(uint64_t a1)
{
}

void sub_100017660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100017678(uint64_t a1)
{
}

void sub_100017790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000177A8(uint64_t a1)
{
}

void sub_1000178C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000178D8(uint64_t a1)
{
}

void sub_1000179F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100017A08(uint64_t a1)
{
}

uint64_t sub_100017ABC()
{
  qword_10004C840 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100018B7C(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = a1;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _OWORD v7[2] = sub_100018C48;
  v7[3] = &unk_100038E08;
  id v8 = (id)os_transaction_create();
  id v9 = v3;
  id v5 = v8;
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_100018C48(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100019BF8(void *a1, void *a2)
{
  unint64_t v3 = a1;
  unint64_t v4 = a2;
  id v5 = (void *)v4;
  if (v3 | v4)
  {
    if ((v3 != 0) != (v4 != 0)) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = (uint64_t)[(id)v3 isEqual:v4];
    }
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

uint64_t sub_100019C7C(void *a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = a1;
  uint64_t v2 = (char *)[v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    unint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      id v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v6 = 0;
          goto LABEL_11;
        }
        ++v5;
      }
      while (v3 != v5);
      unint64_t v3 = (char *)[v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_11:

  return v6;
}

void sub_10001AA04(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [&off_10003F6D8 objectForKeyedSubscript:v12];
    __int16 v7 = v6;
    if (!v6)
    {
LABEL_8:

      goto LABEL_9;
    }
    unsigned int v8 = [v6 unsignedIntValue];

    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (sub_100019C7C(v5))
        {
          uint64_t v9 = +[NSSet setWithArray:v5];
          if (v9)
          {
            __int16 v7 = (void *)v9;
            long long v10 = *(void **)(a1 + 32);
            long long v11 = +[NSNumber numberWithUnsignedLongLong:v8];
            [v10 setObject:v7 forKeyedSubscript:v11];

            goto LABEL_8;
          }
        }
      }
    }
  }
LABEL_9:
}

id sub_10001C124(void *a1)
{
  if (!container_query_create())
  {
    uint64_t v6 = sub_10000D0EC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "OEURLForContainerWithError";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: Failed to create query for container", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_7;
  }
  container_query_set_class();
  xpc_object_t v2 = xpc_string_create("com.apple.eligibilityd");
  container_query_set_identifiers();

  container_query_set_persona_unique_string();
  container_query_operation_set_flags();
  if (container_query_get_single_result())
  {
    uint64_t path = container_get_path();
    if (path)
    {
      uint64_t v4 = +[NSString stringWithUTF8String:path];
      id v5 = +[NSURL fileURLWithPath:v4 isDirectory:1];
LABEL_8:
      __int16 v7 = 0;
      goto LABEL_12;
    }
    uint64_t v6 = sub_10000D0EC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      id v12 = "OEURLForContainerWithError";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Failed to read path from returned container", (uint8_t *)&v11, 0xCu);
    }
LABEL_7:

    uint64_t v4 = 0;
    id v5 = 0;
    goto LABEL_8;
  }
  container_query_get_last_error();
  unsigned int v8 = (void *)container_error_copy_unlocalized_description();
  uint64_t v9 = sub_10000D0EC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    id v12 = "OEURLForContainerWithError";
    __int16 v13 = 2080;
    __int16 v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Failed to query container manager: %s", (uint8_t *)&v11, 0x16u);
  }

  free(v8);
  __int16 v7 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:(int)container_error_get_posix_errno() userInfo:0];
  uint64_t v4 = 0;
  id v5 = 0;
LABEL_12:
  container_query_free();
  if (a1 && !v5) {
    *a1 = v7;
  }

  return v5;
}

id sub_10001DE60(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _onQueue_handleRecompute:a2];
}

void sub_10001E214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001E23C(uint64_t a1)
{
  xpc_object_t v2 = sub_10000D0EC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 136315394;
    id v5 = "-[EligibilityEngine _onQueue_handleRecompute:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s: Expiration handler called for %@", (uint8_t *)&v4, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
}

id sub_10001E394(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  xpc_object_t v2 = [*(id *)(a1 + 32) domains];
  uint64_t v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) updateParameters];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return [*(id *)(a1 + 32) _onQueue_recomputeAllDomainAnswers];
}

void sub_10001E768(uint64_t a1)
{
  xpc_object_t v2 = +[InputManager sharedInstance];
  uint64_t v3 = [v2 debugDictionary];
  [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:@"OS_ELIGIBILITY_STATE_DUMP_INPUTS"];

  id v4 = objc_opt_new();
  id v5 = [*(id *)(a1 + 40) domains];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001E934;
  v14[3] = &unk_100038EB8;
  id v15 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v14];

  id v7 = [v6 copy];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:@"OS_ELIGIBILITY_STATE_DUMP_DOMAINS"];

  unsigned int v8 = [*(id *)(a1 + 40) eligibilityOverrides];
  long long v9 = [v8 description];
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:@"OS_ELIGIBILITY_STATE_DUMP_OVERRIDES"];

  long long v10 = +[GlobalConfiguration sharedInstance];
  long long v11 = [v10 debugDescription];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:@"OS_ELIGIBILITY_STATE_DUMP_GLOBAL_STATE"];

  long long v12 = +[MobileAssetManager sharedInstance];
  __int16 v13 = [v12 debugDescription];
  [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:@"OS_ELIGIBILITY_STATE_DUMP_MOBILE_ASSET"];
}

void sub_10001E934(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 description];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

void sub_10001EA84(uint64_t a1)
{
  xpc_object_t v2 = +[InputManager sharedInstance];
  uint64_t v3 = [v2 objectForInputValue:1];
  id v4 = [v3 countryCodes];
  id v5 = [v4 allObjects];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"OS_ELIGIBILITY_INTERNAL_STATE_COUNTRY_LOCATION"];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [*(id *)(a1 + 40) domains];
  id v7 = [v6 allValues];

  uint64_t v8 = (uint64_t)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) hasActiveGracePeriod])
        {
          uint64_t v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = (uint64_t)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  long long v11 = +[NSNumber numberWithBool:v8];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:@"OS_ELIGIBILITY_INTERNAL_STATE_GRACE_PERIOD_IN_EFFECT"];
}

void sub_10001EED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001EF10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001EF20(uint64_t a1)
{
}

void sub_10001EF28(uint64_t a1)
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  xpc_object_t v2 = [*(id *)(a1 + 32) domains];
  uint64_t v3 = [v2 allValues];

  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v28;
    *(void *)&long long v5 = 136315650;
    long long v25 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v8);
        unint64_t v10 = (unint64_t)[v9 domain:v25];
        unint64_t v11 = v10;
        uint64_t v12 = *(void *)(a1 + 64);
        if (v12 == 1)
        {
          BOOL v13 = v10 > 0x2A || ((1 << v10) & 0x73F07DFFFFELL) == 0;
          if (!v13 || (v10 - 120 <= 4 ? (BOOL v18 = ((1 << (v10 - 120)) & 0x13) == 0) : (BOOL v18 = 1), !v18))
          {
            long long v14 = [*(id *)(a1 + 32) eligibilityOverrides];
            [v14 forceDomain:[v9 domain] answer:*(void *)(a1 + 72) context:*(void *)(a1 + 40)];

            long long v15 = [*(id *)(a1 + 32) notificationsToSend];
            __int16 v16 = [v9 domainChangeNotificationName];
            [v15 addObject:v16];
          }
        }
        else
        {
          __int16 v17 = sub_10000D0EC();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v25;
            id v33 = "eligibility_domain_in_domain_set";
            __int16 v34 = 2048;
            unint64_t v35 = v11;
            __int16 v36 = 2048;
            uint64_t v37 = v12;
            _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "%s: Checking if a domain %llu is in unknown domain set %llu", buf, 0x20u);
          }
        }
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v19 = [v3 countByEnumeratingWithState:&v27 objects:v31 count:16];
      id v6 = v19;
    }
    while (v19);
  }

  __int16 v20 = *(void **)(a1 + 32);
  uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v21 + 40);
  unsigned __int8 v22 = [v20 _onQueue_saveDomainsWithError:&obj];
  objc_storeStrong((id *)(v21 + 40), obj);
  if (v22)
  {
    [*(id *)(a1 + 32) _onQueue_sendNotifications];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v23 = sub_10000D0EC();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      unint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 136315394;
      id v33 = "-[EligibilityEngine forceDomainSetAnswers:answer:context:withError:]_block_invoke";
      __int16 v34 = 2112;
      unint64_t v35 = v24;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s: Failed to save updated eligibility to disk: %@", buf, 0x16u);
    }
  }
}

void sub_10001F538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001F574(uint64_t a1)
{
  xpc_object_t v2 = +[NSString stringWithUTF8String:*(void *)(a1 + 64)];
  uint64_t v3 = [*(id *)(a1 + 32) domains];
  id v4 = [v3 objectForKeyedSubscript:v2];

  if (v4)
  {
    long long v5 = [*(id *)(a1 + 32) eligibilityOverrides];
    [v5 forceDomain:*(void *)(a1 + 72) answer:*(void *)(a1 + 80) context:*(void *)(a1 + 40)];

    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v7 + 40);
    unsigned __int8 v8 = [v6 _onQueue_saveDomainsWithError:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    if (v8)
    {
      uint64_t v9 = [*(id *)(a1 + 32) notificationsToSend];
      unint64_t v10 = [v4 domainChangeNotificationName];
      [v9 addObject:v10];

      [*(id *)(a1 + 32) _onQueue_sendNotifications];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    else
    {
      long long v15 = sub_10000D0EC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        *(_DWORD *)buf = 136315394;
        __int16 v20 = "-[EligibilityEngine forceDomainAnswer:answer:context:withError:]_block_invoke";
        __int16 v21 = 2112;
        uint64_t v22 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Failed to save updated eligibility to disk: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    unint64_t v11 = sub_10000D0EC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 136315394;
      __int16 v20 = "-[EligibilityEngine forceDomainAnswer:answer:context:withError:]_block_invoke";
      __int16 v21 = 2048;
      uint64_t v22 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s: Unknown domain: %llu", buf, 0x16u);
    }

    uint64_t v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

void sub_10001F924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10001F948(uint64_t a1)
{
  xpc_object_t v2 = [*(id *)(a1 + 32) notificationsToSend];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = [*(id *)(a1 + 32) domains];
  id v4 = [v3 allValues];

  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      unsigned __int8 v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v8);
        unint64_t v10 = [*(id *)(a1 + 32) eligibilityOverrides];
        [v10 resetAnswerForDomain:[v9 domain]];

        unint64_t v11 = [v9 domainChangeNotificationName];
        [v2 addObject:v11];

        unsigned __int8 v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v6);
  }

  uint64_t v12 = *(void **)(a1 + 32);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v13 + 40);
  unsigned __int8 v14 = [v12 _onQueue_saveDomainsWithError:&obj];
  objc_storeStrong((id *)(v13 + 40), obj);
  if (v14)
  {
    [v2 addObject:@"com.apple.os-eligibility-domain.input-needed"];
    [*(id *)(a1 + 32) _onQueue_sendNotifications];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    long long v15 = sub_10000D0EC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 136315394;
      uint64_t v23 = "-[EligibilityEngine resetAllDomainsWithError:]_block_invoke";
      __int16 v24 = 2112;
      uint64_t v25 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Failed to save updated eligibility to disk: %@", buf, 0x16u);
    }
  }
}

void sub_10001FD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10001FD54(uint64_t a1)
{
  xpc_object_t v2 = +[NSString stringWithUTF8String:*(void *)(a1 + 56)];
  uint64_t v3 = [*(id *)(a1 + 32) domains];
  id v4 = [v3 objectForKeyedSubscript:v2];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) eligibilityOverrides];
    [v5 resetAnswerForDomain:*(void *)(a1 + 64)];

    id v6 = *(void **)(a1 + 32);
    id v18 = 0;
    unsigned __int8 v7 = [v6 _onQueue_saveDomainsWithError:&v18];
    id v8 = v18;
    id v9 = v18;
    if (v7)
    {
      unint64_t v10 = [*(id *)(a1 + 32) notificationsToSend];
      uint64_t v11 = [v4 domainChangeNotificationName];
      [v10 addObject:v11];

      uint64_t v12 = [*(id *)(a1 + 32) notificationsToSend];
      [v12 addObject:@"com.apple.os-eligibility-domain.input-needed"];

      [*(id *)(a1 + 32) _onQueue_sendNotifications];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      uint64_t v16 = sub_10000D0EC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        long long v20 = "-[EligibilityEngine resetDomain:withError:]_block_invoke";
        __int16 v21 = 2112;
        id v22 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: Failed to save updated eligibility to disk: %@", buf, 0x16u);
      }

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
    }
  }
  else
  {
    uint64_t v13 = sub_10000D0EC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 136315394;
      long long v20 = "-[EligibilityEngine resetDomain:withError:]_block_invoke";
      __int16 v21 = 2048;
      id v22 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Unknown domain: %llu", buf, 0x16u);
    }

    uint64_t v14 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(id *)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
}

void sub_100020314(uint64_t a1)
{
  xpc_object_t v2 = +[InputManager sharedInstance];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = 0;
  unsigned __int8 v4 = [v2 setInput:v3 withError:&v7];
  id v5 = v7;
  if (v4)
  {
    [*(id *)(a1 + 40) _onQueue_recomputeAllDomainAnswers];
  }
  else
  {
    id v6 = sub_10000D0EC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v9 = "-[EligibilityEngine setInput:to:status:fromProcess:withError:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: Failed to set input value: %@", buf, 0x16u);
    }
  }
}

void sub_100020594(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 answer];
  id v12 = 0;
  unsigned __int8 v8 = [v6 computeWithError:&v12];
  id v9 = v12;
  if ((v8 & 1) == 0)
  {
    __int16 v10 = sub_10000D0EC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v14 = "-[EligibilityEngine _onQueue_recomputeAllDomainAnswers]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Failed to compute eligibility for domain %@: %@", buf, 0x20u);
    }
    goto LABEL_6;
  }
  if (v7 != [v6 answer])
  {
    __int16 v10 = [*(id *)(a1 + 32) notificationsToSend];
    id v11 = [v6 domainChangeNotificationName];
    [v10 addObject:v11];

LABEL_6:
  }
}

id sub_100020780(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueue_recomputeAllDomainAnswers];
}

void sub_100020B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100020B40(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v15 = 0;
  id v6 = +[NSPropertyListSerialization dataWithPropertyList:a3 format:100 options:0 error:&v15];
  id v7 = v15;
  uint64_t v8 = v7;
  if (v6)
  {
    id v14 = v7;
    unsigned __int8 v9 = [v6 writeToURL:v5 options:268435457 error:&v14];
    id v10 = v14;

    if (v9)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_8;
    }
    uint64_t v8 = v10;
  }
  uint64_t v11 = sub_10000D0EC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = [v5 path];
    *(_DWORD *)buf = 136315650;
    __int16 v17 = "-[EligibilityEngine _onQueue_saveDomainAnswerOutputsWithError:]_block_invoke";
    __int16 v18 = 2112;
    long long v19 = v13;
    __int16 v20 = 2112;
    __int16 v21 = v8;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s: Failed to write answer plist %@: %@", buf, 0x20u);
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  id v10 = *(id *)(v12 + 40);
  *(void *)(v12 + 40) = v8;
LABEL_8:
}

void sub_100020DC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (uint64_t)[v6 domain];
  if ((unint64_t)(v7 - 22) < 0x64) {
    goto LABEL_2;
  }
  if (v7 <= 20)
  {
    if ((unint64_t)(v7 - 1) >= 0x14) {
      goto LABEL_16;
    }
    goto LABEL_2;
  }
  if ((unint64_t)(v7 - 123) < 3)
  {
LABEL_2:
    __int16 v17 = 0;
    if (asprintf(&v17, "%s%s", "/", "/private/var/db/os_eligibility/eligibility.plist") == -1)
    {
      uint64_t v8 = sub_10000D0EC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        long long v19 = "copy_eligibility_domain_answer_plist_path";
        __int16 v20 = 2080;
        __int16 v21 = "/private/var/db/os_eligibility/eligibility.plist";
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
      }
    }
    unsigned __int8 v9 = v17;
    if (v17) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
  if (v7 == 21 || v7 == 122)
  {
    unsigned __int8 v9 = sub_100005B64();
    if (v9)
    {
LABEL_6:
      id v10 = +[NSString stringWithUTF8String:v9];
      free(v9);
      uint64_t v11 = +[NSURL fileURLWithPath:v10 isDirectory:0];
      uint64_t v12 = [*(id *)(a1 + 32) objectForKey:v11];

      if (!v12)
      {
        uint64_t v13 = objc_opt_new();
        [*(id *)(a1 + 32) setObject:v13 forKeyedSubscript:v11];
      }
      id v14 = [*(id *)(a1 + 40) _onQueue_finalEligibilityDictionaryForDomain:v6];
      id v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:v11];
      [v15 setObject:v14 forKeyedSubscript:v5];

      goto LABEL_19;
    }
  }
LABEL_16:
  id v16 = sub_10000D0EC();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v19 = "-[EligibilityEngine _onQueue_urlToDomainData]_block_invoke";
    __int16 v20 = 2112;
    __int16 v21 = (const char *)v6;
    _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "%s: Skipping domain %@ because it doesn't have a plist specified", buf, 0x16u);
  }

LABEL_19:
}

void sub_1000211FC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 domain];
  [*(id *)(a1 + 32) _onQueue_finalEligibilityDictionaryForDomain:v4];
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [v9 objectForKeyedSubscript:@"os_eligibility_answer_t"];
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = +[NSNumber numberWithUnsignedLongLong:v5];
  [v7 setObject:v6 forKeyedSubscript:v8];
}

void sub_10002163C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([v5 shouldSaveToDisk]) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
  }
}

void sub_100021B34(_Unwind_Exception *a1)
{
}

BOOL sub_1000230A0(id a1, NSString *a2, EligibilityDomain *a3, BOOL *a4)
{
  return ![(EligibilityDomain *)a3 shouldSaveToDisk];
}

uint64_t sub_100023160()
{
  qword_10004C850 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100024C38(uint64_t a1)
{
  CFOptionFlags v20 = 0;
  CFUserNotificationDisplayAlert(0.0, 2uLL, 0, 0, 0, *(CFStringRef *)(a1 + 32), *(CFStringRef *)(a1 + 40), @"File A Bug", @"No Thanks", 0, &v20);
  if (!v20)
  {
    xpc_object_t v2 = *(void **)(a1 + 56);
    id v3 = *(id *)(a1 + 48);
    id v4 = v2;
    id v5 = objc_alloc_init((Class)NSURLComponents);
    [v5 setScheme:@"tap-to-radar"];
    [v5 setHost:@"new"];
    id v6 = objc_alloc_init((Class)NSMutableArray);
    id v7 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentName" value:@"os_eligibility"];
    [v6 addObject:v7];

    id v8 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentVersion" value:@"all"];
    [v6 addObject:v8];

    id v9 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"ComponentID" value:@"1533410"];
    [v6 addObject:v9];

    id v10 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Classification" value:@"Serious Bug"];
    [v6 addObject:v10];

    id v11 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Reproducibility" value:@"I Didn't Try"];
    [v6 addObject:v11];

    id v12 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"AutoDiagnostics" value:@"phone"];
    [v6 addObject:v12];

    if (v3 && [v3 length])
    {
      id v13 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Title" value:v3];
      [v6 addObject:v13];
    }
    if (v4 && [v4 length])
    {
      id v14 = [objc_alloc((Class)NSURLQueryItem) initWithName:@"Description" value:v4];
      [v6 addObject:v14];
    }
    [v5 setQueryItems:v6];
    id v15 = [v5 URL];

    if (v15)
    {
      id v16 = +[LSApplicationWorkspace defaultWorkspace];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100024FD8;
      v18[3] = &unk_100039070;
      long long v19 = v15;
      [v16 openURL:v19 configuration:0 completionHandler:v18];

      __int16 v17 = v19;
    }
    else
    {
      __int16 v17 = sub_10000D0EC();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v22 = "_ShowUserNoticeWithTapToRadarButton_block_invoke";
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: Failed to construct TTR URL", buf, 0xCu);
      }
    }
  }
}

void sub_100024FD8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_10000D0EC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 136315650;
      id v8 = "_ShowUserNoticeWithTapToRadarButton_block_invoke";
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Failed to open url %@ : %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

uint64_t AFPreferencesSupportedLanguages()
{
  return _AFPreferencesSupportedLanguages();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationDisplayAlert(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, otherButtonTitle, responseFlags);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetSInt64Answer()
{
  return _MGGetSInt64Answer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

uint64_t SADSEligiblilityDidChange()
{
  return _SADSEligiblilityDidChange();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_crash()
{
  return __os_crash();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

uint64_t container_error_copy_unlocalized_description()
{
  return _container_error_copy_unlocalized_description();
}

uint64_t container_error_get_posix_errno()
{
  return _container_error_get_posix_errno();
}

uint64_t container_get_path()
{
  return _container_get_path();
}

uint64_t container_query_create()
{
  return _container_query_create();
}

uint64_t container_query_free()
{
  return _container_query_free();
}

uint64_t container_query_get_last_error()
{
  return _container_query_get_last_error();
}

uint64_t container_query_get_single_result()
{
  return _container_query_get_single_result();
}

uint64_t container_query_operation_set_flags()
{
  return _container_query_operation_set_flags();
}

uint64_t container_query_set_class()
{
  return _container_query_set_class();
}

uint64_t container_query_set_identifiers()
{
  return _container_query_set_identifiers();
}

uint64_t container_query_set_persona_unique_string()
{
  return _container_query_set_persona_unique_string();
}

int dirfd(DIR *dirp)
{
  return _dirfd(dirp);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return _dispatch_source_testcancel(source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return _dispatch_workloop_create(label);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return _xpc_type_get_name(type);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__createDefaultDomains(void *a1, const char *a2, ...)
{
  return [a1 _createDefaultDomains];
}

id objc_msgSend__createDefaultInputs(void *a1, const char *a2, ...)
{
  return [a1 _createDefaultInputs];
}

id objc_msgSend__deviceMinimiumRequiredConfidence(void *a1, const char *a2, ...)
{
  return [a1 _deviceMinimiumRequiredConfidence];
}

id objc_msgSend__interestedDataString(void *a1, const char *a2, ...)
{
  return [a1 _interestedDataString];
}

id objc_msgSend__isGreenTeaDeviceCapable(void *a1, const char *a2, ...)
{
  return [a1 _isGreenTeaDeviceCapable];
}

id objc_msgSend__mgDeviceClass(void *a1, const char *a2, ...)
{
  return [a1 _mgDeviceClass];
}

id objc_msgSend__mgDeviceRegionCode(void *a1, const char *a2, ...)
{
  return [a1 _mgDeviceRegionCode];
}

id objc_msgSend__mgSupportsGenerativeModelSystems(void *a1, const char *a2, ...)
{
  return [a1 _mgSupportsGenerativeModelSystems];
}

id objc_msgSend__supportedInputsString(void *a1, const char *a2, ...)
{
  return [a1 _supportedInputsString];
}

id objc_msgSend_age(void *a1, const char *a2, ...)
{
  return [a1 age];
}

id objc_msgSend_ageOfInterest(void *a1, const char *a2, ...)
{
  return [a1 ageOfInterest];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_aluminumAsset(void *a1, const char *a2, ...)
{
  return [a1 aluminumAsset];
}

id objc_msgSend_answer(void *a1, const char *a2, ...)
{
  return [a1 answer];
}

id objc_msgSend_answerSource(void *a1, const char *a2, ...)
{
  return [a1 answerSource];
}

id objc_msgSend_argonAsset(void *a1, const char *a2, ...)
{
  return [a1 argonAsset];
}

id objc_msgSend_arsenicAsset(void *a1, const char *a2, ...)
{
  return [a1 arsenicAsset];
}

id objc_msgSend_assetVersion(void *a1, const char *a2, ...)
{
  return [a1 assetVersion];
}

id objc_msgSend_asyncRefetchMobileAsset(void *a1, const char *a2, ...)
{
  return [a1 asyncRefetchMobileAsset];
}

id objc_msgSend_asyncUpdateAndRecomputeAllAnswers(void *a1, const char *a2, ...)
{
  return [a1 asyncUpdateAndRecomputeAllAnswers];
}

id objc_msgSend_berylliumAsset(void *a1, const char *a2, ...)
{
  return [a1 berylliumAsset];
}

id objc_msgSend_billingCountriesOfInterest(void *a1, const char *a2, ...)
{
  return [a1 billingCountriesOfInterest];
}

id objc_msgSend_billingCountryCodes(void *a1, const char *a2, ...)
{
  return [a1 billingCountryCodes];
}

id objc_msgSend_birthdate(void *a1, const char *a2, ...)
{
  return [a1 birthdate];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_boronAsset(void *a1, const char *a2, ...)
{
  return [a1 boronAsset];
}

id objc_msgSend_bromineAsset(void *a1, const char *a2, ...)
{
  return [a1 bromineAsset];
}

id objc_msgSend_carbonAsset(void *a1, const char *a2, ...)
{
  return [a1 carbonAsset];
}

id objc_msgSend_chinaCellularDevice(void *a1, const char *a2, ...)
{
  return [a1 chinaCellularDevice];
}

id objc_msgSend_chlorineAsset(void *a1, const char *a2, ...)
{
  return [a1 chlorineAsset];
}

id objc_msgSend_chromiumAsset(void *a1, const char *a2, ...)
{
  return [a1 chromiumAsset];
}

id objc_msgSend_cobaltAsset(void *a1, const char *a2, ...)
{
  return [a1 cobaltAsset];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_computeInputStatusForDeviceAndSiriLanguageMatch(void *a1, const char *a2, ...)
{
  return [a1 computeInputStatusForDeviceAndSiriLanguageMatch];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return [a1 confidence];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copperAsset(void *a1, const char *a2, ...)
{
  return [a1 copperAsset];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_countryCodes(void *a1, const char *a2, ...)
{
  return [a1 countryCodes];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentUsername(void *a1, const char *a2, ...)
{
  return [a1 currentUsername];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_debugDictionary(void *a1, const char *a2, ...)
{
  return [a1 debugDictionary];
}

id objc_msgSend_defaultAnswer(void *a1, const char *a2, ...)
{
  return [a1 defaultAnswer];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return [a1 deviceClass];
}

id objc_msgSend_deviceClassesOfInterest(void *a1, const char *a2, ...)
{
  return [a1 deviceClassesOfInterest];
}

id objc_msgSend_deviceLanguages(void *a1, const char *a2, ...)
{
  return [a1 deviceLanguages];
}

id objc_msgSend_deviceLanguagesOfInterest(void *a1, const char *a2, ...)
{
  return [a1 deviceLanguagesOfInterest];
}

id objc_msgSend_deviceLocale(void *a1, const char *a2, ...)
{
  return [a1 deviceLocale];
}

id objc_msgSend_deviceLocalesOfInterest(void *a1, const char *a2, ...)
{
  return [a1 deviceLocalesOfInterest];
}

id objc_msgSend_deviceRegionCode(void *a1, const char *a2, ...)
{
  return [a1 deviceRegionCode];
}

id objc_msgSend_deviceRegionCodesOfInterest(void *a1, const char *a2, ...)
{
  return [a1 deviceRegionCodesOfInterest];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainChangeNotificationName(void *a1, const char *a2, ...)
{
  return [a1 domainChangeNotificationName];
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return [a1 domains];
}

id objc_msgSend_eligibilityInputs(void *a1, const char *a2, ...)
{
  return [a1 eligibilityInputs];
}

id objc_msgSend_eligibilityOverrides(void *a1, const char *a2, ...)
{
  return [a1 eligibilityOverrides];
}

id objc_msgSend_enable(void *a1, const char *a2, ...)
{
  return [a1 enable];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_excludedEnglishVariants(void *a1, const char *a2, ...)
{
  return [a1 excludedEnglishVariants];
}

id objc_msgSend_expectedCountryCode(void *a1, const char *a2, ...)
{
  return [a1 expectedCountryCode];
}

id objc_msgSend_fallbackDeviceLocale(void *a1, const char *a2, ...)
{
  return [a1 fallbackDeviceLocale];
}

id objc_msgSend_fallbackVersion(void *a1, const char *a2, ...)
{
  return [a1 fallbackVersion];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fluorineAsset(void *a1, const char *a2, ...)
{
  return [a1 fluorineAsset];
}

id objc_msgSend_galliumAsset(void *a1, const char *a2, ...)
{
  return [a1 galliumAsset];
}

id objc_msgSend_germaniumAsset(void *a1, const char *a2, ...)
{
  return [a1 germaniumAsset];
}

id objc_msgSend_gracePeriodInSeconds(void *a1, const char *a2, ...)
{
  return [a1 gracePeriodInSeconds];
}

id objc_msgSend_greymatterAsset(void *a1, const char *a2, ...)
{
  return [a1 greymatterAsset];
}

id objc_msgSend_hasActiveGracePeriod(void *a1, const char *a2, ...)
{
  return [a1 hasActiveGracePeriod];
}

id objc_msgSend_hasExpired(void *a1, const char *a2, ...)
{
  return [a1 hasExpired];
}

id objc_msgSend_hasExternalBootDrive(void *a1, const char *a2, ...)
{
  return [a1 hasExternalBootDrive];
}

id objc_msgSend_hasInternalContent(void *a1, const char *a2, ...)
{
  return [a1 hasInternalContent];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_heliumAsset(void *a1, const char *a2, ...)
{
  return [a1 heliumAsset];
}

id objc_msgSend_hydrogenAsset(void *a1, const char *a2, ...)
{
  return [a1 hydrogenAsset];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initialLocationsOfInterest(void *a1, const char *a2, ...)
{
  return [a1 initialLocationsOfInterest];
}

id objc_msgSend_internalQueue(void *a1, const char *a2, ...)
{
  return [a1 internalQueue];
}

id objc_msgSend_inversionMask(void *a1, const char *a2, ...)
{
  return [a1 inversionMask];
}

id objc_msgSend_ironAsset(void *a1, const char *a2, ...)
{
  return [a1 ironAsset];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isChinaSKU(void *a1, const char *a2, ...)
{
  return [a1 isChinaSKU];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isMemoryConstrainedDevice(void *a1, const char *a2, ...)
{
  return [a1 isMemoryConstrainedDevice];
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return [a1 isSharedIPad];
}

id objc_msgSend_isSharediPad(void *a1, const char *a2, ...)
{
  return [a1 isSharediPad];
}

id objc_msgSend_kryptonAsset(void *a1, const char *a2, ...)
{
  return [a1 kryptonAsset];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return [a1 language];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lithiumAsset(void *a1, const char *a2, ...)
{
  return [a1 lithiumAsset];
}

id objc_msgSend_loadedTimeInSeconds(void *a1, const char *a2, ...)
{
  return [a1 loadedTimeInSeconds];
}

id objc_msgSend_locatedCountriesOfInterest(void *a1, const char *a2, ...)
{
  return [a1 locatedCountriesOfInterest];
}

id objc_msgSend_locatedCountryTimer(void *a1, const char *a2, ...)
{
  return [a1 locatedCountryTimer];
}

id objc_msgSend_lotXAsset(void *a1, const char *a2, ...)
{
  return [a1 lotXAsset];
}

id objc_msgSend_magnesiumAsset(void *a1, const char *a2, ...)
{
  return [a1 magnesiumAsset];
}

id objc_msgSend_manganeseAsset(void *a1, const char *a2, ...)
{
  return [a1 manganeseAsset];
}

id objc_msgSend_mobileAssetQueue(void *a1, const char *a2, ...)
{
  return [a1 mobileAssetQueue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_neonAsset(void *a1, const char *a2, ...)
{
  return [a1 neonAsset];
}

id objc_msgSend_nickelAsset(void *a1, const char *a2, ...)
{
  return [a1 nickelAsset];
}

id objc_msgSend_nitrogenAsset(void *a1, const char *a2, ...)
{
  return [a1 nitrogenAsset];
}

id objc_msgSend_notificationsToSend(void *a1, const char *a2, ...)
{
  return [a1 notificationsToSend];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_onGreymatterQueue(void *a1, const char *a2, ...)
{
  return [a1 onGreymatterQueue];
}

id objc_msgSend_overrideMap(void *a1, const char *a2, ...)
{
  return [a1 overrideMap];
}

id objc_msgSend_oxygenAsset(void *a1, const char *a2, ...)
{
  return [a1 oxygenAsset];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_phosphorusAsset(void *a1, const char *a2, ...)
{
  return [a1 phosphorusAsset];
}

id objc_msgSend_podcastsTranscriptsAsset(void *a1, const char *a2, ...)
{
  return [a1 podcastsTranscriptsAsset];
}

id objc_msgSend_policies(void *a1, const char *a2, ...)
{
  return [a1 policies];
}

id objc_msgSend_potassiumAsset(void *a1, const char *a2, ...)
{
  return [a1 potassiumAsset];
}

id objc_msgSend_primaryLanguage(void *a1, const char *a2, ...)
{
  return [a1 primaryLanguage];
}

id objc_msgSend_queryHasExternalBootDrive(void *a1, const char *a2, ...)
{
  return [a1 queryHasExternalBootDrive];
}

id objc_msgSend_recomputeAllDomainAnswers(void *a1, const char *a2, ...)
{
  return [a1 recomputeAllDomainAnswers];
}

id objc_msgSend_regionCode(void *a1, const char *a2, ...)
{
  return [a1 regionCode];
}

id objc_msgSend_regionSKUs(void *a1, const char *a2, ...)
{
  return [a1 regionSKUs];
}

id objc_msgSend_registerForMobileAssetUpdateNotification(void *a1, const char *a2, ...)
{
  return [a1 registerForMobileAssetUpdateNotification];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetInputsOfInterest(void *a1, const char *a2, ...)
{
  return [a1 resetInputsOfInterest];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rubidiumAsset(void *a1, const char *a2, ...)
{
  return [a1 rubidiumAsset];
}

id objc_msgSend_scandiumAsset(void *a1, const char *a2, ...)
{
  return [a1 scandiumAsset];
}

id objc_msgSend_scheduleDailyRecompute(void *a1, const char *a2, ...)
{
  return [a1 scheduleDailyRecompute];
}

id objc_msgSend_searchMarketplacesAsset(void *a1, const char *a2, ...)
{
  return [a1 searchMarketplacesAsset];
}

id objc_msgSend_seleniumAsset(void *a1, const char *a2, ...)
{
  return [a1 seleniumAsset];
}

id objc_msgSend_serialize(void *a1, const char *a2, ...)
{
  return [a1 serialize];
}

id objc_msgSend_setDeviceAndSiriLangaugeMatchInterest(void *a1, const char *a2, ...)
{
  return [a1 setDeviceAndSiriLangaugeMatchInterest];
}

id objc_msgSend_setDeviceLanguageInterest(void *a1, const char *a2, ...)
{
  return [a1 setDeviceLanguageInterest];
}

id objc_msgSend_setDeviceRegionInterest(void *a1, const char *a2, ...)
{
  return [a1 setDeviceRegionInterest];
}

id objc_msgSend_setExternalBootInterest(void *a1, const char *a2, ...)
{
  return [a1 setExternalBootInterest];
}

id objc_msgSend_setGenerativeModelSystemVersionInterest(void *a1, const char *a2, ...)
{
  return [a1 setGenerativeModelSystemVersionInterest];
}

id objc_msgSend_setSharediPadInterest(void *a1, const char *a2, ...)
{
  return [a1 setSharediPadInterest];
}

id objc_msgSend_setSiriLanguageInterest(void *a1, const char *a2, ...)
{
  return [a1 setSiriLanguageInterest];
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return [a1 setTaskCompleted];
}

id objc_msgSend_setTime(void *a1, const char *a2, ...)
{
  return [a1 setTime];
}

id objc_msgSend_settingProccessName(void *a1, const char *a2, ...)
{
  return [a1 settingProccessName];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return [a1 sharedScheduler];
}

id objc_msgSend_shouldSaveToDisk(void *a1, const char *a2, ...)
{
  return [a1 shouldSaveToDisk];
}

id objc_msgSend_siliconAsset(void *a1, const char *a2, ...)
{
  return [a1 siliconAsset];
}

id objc_msgSend_sodiumAsset(void *a1, const char *a2, ...)
{
  return [a1 sodiumAsset];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_strontiumAsset(void *a1, const char *a2, ...)
{
  return [a1 strontiumAsset];
}

id objc_msgSend_sulfurAsset(void *a1, const char *a2, ...)
{
  return [a1 sulfurAsset];
}

id objc_msgSend_summary(void *a1, const char *a2, ...)
{
  return [a1 summary];
}

id objc_msgSend_supportedInputs(void *a1, const char *a2, ...)
{
  return [a1 supportedInputs];
}

id objc_msgSend_supportsGenerativeModelSystems(void *a1, const char *a2, ...)
{
  return [a1 supportsGenerativeModelSystems];
}

id objc_msgSend_swiftAssistAsset(void *a1, const char *a2, ...)
{
  return [a1 swiftAssistAsset];
}

id objc_msgSend_systemLanguages(void *a1, const char *a2, ...)
{
  return [a1 systemLanguages];
}

id objc_msgSend_testMode(void *a1, const char *a2, ...)
{
  return [a1 testMode];
}

id objc_msgSend_testModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 testModeEnabled];
}

id objc_msgSend_testModeQueue(void *a1, const char *a2, ...)
{
  return [a1 testModeQueue];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeStart(void *a1, const char *a2, ...)
{
  return [a1 timeStart];
}

id objc_msgSend_titaniumAsset(void *a1, const char *a2, ...)
{
  return [a1 titaniumAsset];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uiLocalesRequiringExactMatch(void *a1, const char *a2, ...)
{
  return [a1 uiLocalesRequiringExactMatch];
}

id objc_msgSend_underlyingErrors(void *a1, const char *a2, ...)
{
  return [a1 underlyingErrors];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateParameters(void *a1, const char *a2, ...)
{
  return [a1 updateParameters];
}

id objc_msgSend_vanadiumAsset(void *a1, const char *a2, ...)
{
  return [a1 vanadiumAsset];
}

id objc_msgSend_xcodeLLMAsset(void *a1, const char *a2, ...)
{
  return [a1 xcodeLLMAsset];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}

id objc_msgSend_yttriumAsset(void *a1, const char *a2, ...)
{
  return [a1 yttriumAsset];
}