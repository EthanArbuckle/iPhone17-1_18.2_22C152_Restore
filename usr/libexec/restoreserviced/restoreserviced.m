void start()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  id v3;

  v0 = dispatch_queue_create("restoreservice_queue", 0);
  v1 = (void *)qword_10002E588;
  qword_10002E588 = (uint64_t)v0;

  v2 = (id)qword_10002E588;
  if (v2)
  {

    v3 = (id)xpc_remote_connection_create_remote_service_listener();
    if (v3)
    {

      xpc_remote_connection_set_event_handler();
      xpc_remote_connection_activate();
      dispatch_main();
    }
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void sub_100002B10(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    v3 = sub_100002C34();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100015898();
    }

    uint64_t v4 = xpc_copy_clean_description();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = sub_100002C34();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10001582C((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
      }

      free(v5);
    }
  }
  else
  {
    v13 = v2;
    xpc_remote_connection_set_event_handler();
    xpc_remote_connection_activate();
  }
}

id sub_100002C34()
{
  if (qword_10002E590 != -1) {
    dispatch_once(&qword_10002E590, &stru_100024990);
  }
  v0 = (void *)qword_10002E598;

  return v0;
}

void sub_100002C88(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_error)
  {
    uint64_t v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
    id v5 = v3;
    if ((xpc_dictionary_expects_reply() & 1) == 0)
    {
      v26 = sub_100002C34();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_100015BE4();
      }

      xpc_connection_cancel(v4);
      goto LABEL_68;
    }
    string = xpc_dictionary_get_string(v5, "command");
    uint64_t v8 = sub_100002C34();
    uint64_t v9 = v8;
    if (!string)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100015988();
      }
LABEL_26:

      sub_100003854(v5, "error");
      id v28 = v27;
LABEL_33:
      xpc_object_t reply = v28;
LABEL_66:
      id v72 = reply;
      if (!v72) {
        sub_10001596C();
      }
      v73 = v72;

      xpc_dictionary_send_reply();
LABEL_68:

      goto LABEL_69;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)cf = 136446210;
      *(void *)&cf[4] = string;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Got command %{public}s", cf, 0xCu);
    }

    if (!strcmp(string, "recovery"))
    {
      id v29 = v5;
      io_registry_entry_t v30 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
      if (v30)
      {
        io_registry_entry_t v31 = v30;
        CFDataRef v32 = CFDataCreate(0, (const UInt8 *)"false", 5);
        if (!v32) {
          sub_10001596C();
        }
        CFDataRef v33 = v32;
        uint64_t v34 = IORegistryEntrySetCFProperty(v31, @"auto-boot-once", v32);
        v35 = sub_100002C34();
        v36 = v35;
        if (v34)
        {
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            sub_100015A34(v34, v36, v37, v38, v39, v40, v41, v42);
          }
        }
        else if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)cf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "auto-boot successfully disabled (via auto-boot-once)", cf, 2u);
        }

        CFRelease(v33);
        IOObjectRelease(v31);
        if (!v34)
        {
          sub_100003328(v29);
          id v60 = (id)objc_claimAutoreleasedReturnValue();
LABEL_50:
          xpc_object_t reply = v60;
          goto LABEL_65;
        }
LABEL_49:
        sub_100003854(v29, "error");
        id v60 = v61;
        goto LABEL_50;
      }
      v51 = sub_100002C34();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_1000159BC(v51, v52, v53, v54, v55, v56, v57, v58);
      }
    }
    else
    {
      if (!strcmp(string, "reboot"))
      {
        sub_100003328(v5);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
      if (strcmp(string, "getnonces"))
      {
        if (strcmp(string, "getpreflightinfo"))
        {
          if (!strcmp(string, "getapparameters"))
          {
            sub_1000033EC(v5);
            id v28 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_33;
          }
          if (!strcmp(string, "delayrecoveryimage"))
          {
            sub_100003510(v5);
            id v28 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_33;
          }
          if (!strcmp(string, "restorelang"))
          {
            v74 = xpc_dictionary_get_string(v5, "argument");
            sub_1000036B4(v5, v74);
            id v28 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_33;
          }
          uint64_t v9 = sub_100002C34();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
            sub_100015B78((uint64_t)string, v9, v10, v11, v12, v13, v14, v15);
          }
          goto LABEL_26;
        }
        id v29 = v5;
        *(void *)cf = 0;
        updated = ramrod_update_copy_deviceinfo(0, (CFErrorRef *)cf);
        if (updated)
        {
          xpc_object_t reply = xpc_dictionary_create_reply(v29);
          v59 = (void *)_CFXPCCreateXPCObjectFromCFObject();
          xpc_dictionary_set_value(reply, "preflightinfo", v59);

          xpc_dictionary_set_string(reply, "result", "preflightinfo");
        }
        else
        {
          if (*(void *)cf)
          {
            v64 = sub_100002C34();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
              sub_100015B08((uint64_t)cf, v64, v65, v66, v67, v68, v69, v70);
            }

            CFRelease(*(CFTypeRef *)cf);
          }
          sub_100003854(v29, "error");
          xpc_object_t reply = v71;
        }
        if (*(void *)cf) {
          CFRelease(*(CFTypeRef *)cf);
        }
        if (updated) {
          goto LABEL_63;
        }
LABEL_65:

        goto LABEL_66;
      }
      id v29 = v5;
      uint64_t v44 = MGCopyAnswer();
      if (v44)
      {
        updated = (__CFDictionary *)v44;
        uint64_t v46 = MGCopyAnswer();
        if (v46)
        {
          v47 = (__CFDictionary *)v46;
          xpc_object_t reply = xpc_dictionary_create_reply(v29);
          v48 = (void *)_CFXPCCreateXPCObjectFromCFObject();
          xpc_dictionary_set_value(reply, "apNonce", v48);

          v49 = (void *)_CFXPCCreateXPCObjectFromCFObject();
          xpc_dictionary_set_value(reply, "sepNonce", v49);

          xpc_dictionary_set_string(reply, "result", "nonces");
          CFRelease(updated);
          v50 = v47;
LABEL_64:
          CFRelease(v50);
          goto LABEL_65;
        }
        v62 = sub_100002C34();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR)) {
          sub_100015AD4();
        }

        sub_100003854(v29, "error");
        xpc_object_t reply = v63;
LABEL_63:
        v50 = updated;
        goto LABEL_64;
      }
      v51 = sub_100002C34();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
        sub_100015AA0();
      }
    }

    goto LABEL_49;
  }
  v16 = sub_100002C34();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_100015938();
  }

  uint64_t v17 = xpc_copy_clean_description();
  if (v17)
  {
    v18 = (void *)v17;
    v19 = sub_100002C34();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000158CC((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
    }

    free(v18);
  }
LABEL_69:
}

void sub_1000032E4(id a1)
{
  qword_10002E598 = (uint64_t)os_log_create("com.apple.RestoreRemoteServices.restoreservice", "restoreservice");

  _objc_release_x1();
}

id sub_100003328(void *a1)
{
  id v1 = a1;
  dispatch_time_t v2 = dispatch_time(0, 3000000000);
  dispatch_after(v2, (dispatch_queue_t)qword_10002E588, &stru_1000249B0);
  id v3 = sub_100002C34();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calling reboot3 imminently", v6, 2u);
  }

  uint64_t v4 = sub_100003854(v1, "success");

  return v4;
}

id sub_1000033EC(void *a1)
{
  id v1 = a1;
  CFTypeRef cf = 0;
  CFDictionaryRef updated = ramrod_update_copy_ap_parameters_generating_nonces(0);
  if (updated)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v1);
    uint64_t v4 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(reply, "apparameters", v4);

    xpc_dictionary_set_string(reply, "result", "apparameters");
  }
  else
  {
    sub_100003854(v1, "error");
    xpc_object_t reply = v5;
  }
  if (cf) {
    CFRelease(cf);
  }
  if (updated) {
    CFRelease(updated);
  }

  return reply;
}

id sub_100003510(void *a1)
{
  id v1 = a1;
  if (MGGetProductType() != 376943508)
  {
LABEL_11:
    sub_100003854(v1, "error");
    id v24 = v23;
    goto LABEL_12;
  }
  io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v2)
  {
    uint64_t v15 = sub_100002C34();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000159BC(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    goto LABEL_11;
  }
  io_registry_entry_t v3 = v2;
  CFDataRef v4 = CFDataCreate(0, (const UInt8 *)"true", 4);
  if (!v4) {
    sub_10001596C();
  }
  CFDataRef v5 = v4;
  uint64_t v6 = IORegistryEntrySetCFProperty(v3, @"delay-recovery-image", v4);
  uint64_t v7 = sub_100002C34();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100015A34(v6, v8, v9, v10, v11, v12, v13, v14);
    }

    CFRelease(v5);
    IOObjectRelease(v3);
    goto LABEL_11;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "delay-recovery-image successfully enabled", v27, 2u);
  }

  CFRelease(v5);
  IOObjectRelease(v3);
  sub_100003854(v1, "success");
  id v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  uint64_t v25 = v24;

  return v25;
}

id sub_1000036B4(void *a1, const char *a2)
{
  id v3 = a1;
  if (MGGetProductType() != 376943508)
  {
LABEL_15:
    sub_100003854(v3, "error");
    id v28 = v27;
    goto LABEL_16;
  }
  if (!a2)
  {
    uint64_t v18 = sub_100002C34();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100015C18();
    }

    goto LABEL_15;
  }
  size_t v4 = strlen(a2);
  CFDataRef v5 = CFDataCreate(0, (const UInt8 *)a2, v4);
  if (!v5) {
    sub_10001596C();
  }
  CFDataRef v6 = v5;
  io_registry_entry_t v7 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v7)
  {
    uint64_t v19 = sub_100002C34();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000159BC(v19, v20, v21, v22, v23, v24, v25, v26);
    }

    CFRelease(v6);
    goto LABEL_15;
  }
  io_object_t v8 = v7;
  uint64_t v9 = IORegistryEntrySetCFProperty(v7, @"restore-lang", v6);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = sub_100002C34();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100015A34(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    CFRelease(v6);
    IOObjectRelease(v8);
    goto LABEL_15;
  }
  CFRelease(v6);
  IOObjectRelease(v8);
  sub_100003854(v3, "success");
  id v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
  id v29 = v28;

  return v29;
}

void sub_100003854(void *a1, const char *a2)
{
  id v3 = a1;
  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  if (reply)
  {
    CFDataRef v5 = reply;
    xpc_dictionary_set_string(reply, "result", a2);

    id v6 = v5;
  }
  else
  {
    io_registry_entry_t v7 = sub_100002C34();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100015C4C(v7, v8, v9, v10, v11, v12, v13, v14);
    }

    __break(1u);
  }
}

void sub_1000038E0(id a1)
{
  id v1 = sub_100002C34();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Calling reboot3 now", v3, 2u);
  }

  if (reboot3())
  {
    io_registry_entry_t v2 = sub_100002C34();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      sub_100015CC4(v2);
    }
  }
}

void sub_10000397C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100003998(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000039C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t AMRestorePartitionFWCopyTagData(const __CFURL *a1)
{
  if (a1 && (int v1 = sub_100003F5C(a1, 0)) != 0)
  {
    int v2 = v1;
    id v3 = malloc(0x8000uLL);
    if (v3 && read(v2, v3, 0x8000uLL))
    {
      Img4DecodeParseLengthFromBuffer();
      AMSupportLogInternal();
    }
    AMSupportLogInternal();
    if (v2 >= 1) {
      close(v2);
    }
  }
  else
  {
    AMSupportLogInternal();
  }
  AMSupportSafeFree();
  AMSupportSafeFree();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return 99;
}

uint64_t sub_100003F5C(const __CFURL *a1, int a2)
{
  bzero(buffer, 0x400uLL);
  if (!CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
  {
    AMSupportLogInternal();
LABEL_6:
    AMSupportLogInternal();
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = open((const char *)buffer, a2);
  uint64_t v5 = v4;
  if ((int)v4 <= 0)
  {
    io_registry_entry_t v7 = __error();
    strerror(*v7);
    AMSupportLogInternal();
    return v5;
  }
  if (fcntl(v4, 48, 1)) {
    goto LABEL_6;
  }
  return v5;
}

void sub_100004754(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
}

uint64_t sub_10000477C(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    if (result) {
      sub_100015E04(&v2, v3);
    }
  }
  return result;
}

uint64_t sub_100004904(char *a1, const __CFString *a2)
{
  CFDataRef v4 = (const __CFData *)sub_100005210(a1, a2);
  if (v4)
  {
    CFDataRef v5 = v4;
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFDataGetTypeID()
      || (BytePtr = CFDataGetBytePtr(v5), (size_t Length = CFDataGetLength(v5)) != 0)
      && (Length > 4 || !memcmp(BytePtr, &unk_100019580, Length)))
    {
      uint64_t v9 = 0;
      uint64_t v10 = "NO";
    }
    else
    {
      uint64_t v9 = 1;
      uint64_t v10 = "YES";
    }
    ramrod_log_msg_cf(@"Boot Firmware Updater: property_is_nonzero(%s, %@) = %s (%@)\n", a1, a2, v10, v5);
    CFRelease(v5);
  }
  else
  {
    ramrod_log_msg_cf(@"Boot Firmware Updater: property_is_nonzero(%s, %@) = %s (%@)\n", a1, a2, "NO", 0);
    return 0;
  }
  return v9;
}

BOOL sub_100004A54(const __CFString *a1)
{
  CFTypeRef v2 = sub_100005210("IODeviceTree:/defaults", a1);
  CFTypeRef v3 = v2;
  if (v2)
  {
    CFRelease(v2);
    CFDataRef v4 = "YES";
  }
  else
  {
    CFDataRef v4 = "NO";
  }
  ramrod_log_msg_cf(@"Boot Firmware Updater: property_exists(%s, %@) = %s\n", "IODeviceTree:/defaults", a1, v4);
  return v3 != 0;
}

void sub_100005020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

uint64_t sub_100005054(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  objc_opt_class();
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  return result;
}

void sub_1000050B4(uint64_t a1, uint64_t a2)
{
}

void sub_1000050C4(uint64_t a1)
{
}

CFTypeRef sub_100005210(char *path, const __CFString *a2)
{
  io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, path);
  if (!v3) {
    return 0;
  }
  io_object_t v4 = v3;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v3, a2, kCFAllocatorDefault, 0);
  IOObjectRelease(v4);
  return CFProperty;
}

uint64_t MSUBootFirmwareFindNamespace(io_registry_entry_t a1, uint64_t a2)
{
  uint64_t entryID = 0;
  IORegistryEntryGetRegistryEntryID(a1, &entryID);
  IOServiceWaitQuiet(a1, 0);
  v12[0] = @"IOParentMatch";
  CFMutableDictionaryRef v4 = IORegistryEntryIDMatching(entryID);
  CFTypeRef v5 = (id)CFMakeCollectable(v4);
  v12[1] = @"IOPropertyMatch";
  v13[0] = v5;
  uint64_t v10 = a2;
  uint64_t v11 = +[NSNumber numberWithBool:1];
  v13[1] = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  CFTypeID v6 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  if (v6) {
    CFDictionaryRef v7 = (const __CFDictionary *)CFRetain(v6);
  }
  else {
    CFDictionaryRef v7 = 0;
  }
  return IOServiceGetMatchingService(kIOMasterPortDefault, v7);
}

uint64_t sub_100007598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return __os_log_send_and_compose_impl(a1, v6, v5, 80, a5, v7, 16);
}

void sub_1000076DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
}

uint64_t sub_100007704(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    if (result) {
      sub_100015F34(&v2, v3);
    }
  }
  return result;
}

void sub_100007AD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
}

uint64_t sub_100007B00(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = IOServiceClose(result);
    if (result) {
      sub_100016048(&v2, v3);
    }
  }
  return result;
}

double sub_100007BAC(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

BOOL sub_100007BC4()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void iBU_LOG_real(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = [objc_alloc((Class)NSString) initWithFormat:a1 arguments:&a9];
  uint64_t v11 = v10;
  if (off_10002E5A0)
  {
    uint64_t v12 = (const char *)[v10 UTF8String];
    off_10002E5A0("%s: %s\n", a2, v12);
  }
  else
  {
    NSLog(@"%s: %@", a2, v10);
  }
}

NSError *MSUBootFirmwareError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11 = [objc_alloc((Class)NSString) initWithFormat:a3 arguments:&a9];
  if (a2)
  {
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    NSErrorUserInfoKey v19 = NSUnderlyingErrorKey;
    id v20 = v11;
    uint64_t v21 = a2;
    uint64_t v12 = &v20;
    uint64_t v13 = &v18;
    uint64_t v14 = 2;
  }
  else
  {
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    id v17 = v11;
    uint64_t v12 = &v17;
    uint64_t v13 = &v16;
    uint64_t v14 = 1;
  }
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"MSUFirmwareUpdaterErrorDomain", a1, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v13, v14, &a9, v16, v17, v18, v19, v20, v21));
}

BOOL sub_100007EDC(io_registry_entry_t a1)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(a1, @"low-level-fw-device-info", 0, 0);
  CFTypeRef v2 = CFProperty;
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  return v2 != 0;
}

void sub_10000B4E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10)
{
}

uint64_t sub_10000B508(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    if (result) {
      sub_10001616C(&v2, v3);
    }
  }
  return result;
}

void sub_10000B610(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, char a11)
{
}

void image3Discard(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2)
    {
      if (*(void *)v2)
      {
        if ((*(unsigned char *)(v2 + 10) & 4) != 0)
        {
          image3Free(*(void **)v2);
          uint64_t v2 = *a1;
        }
      }
      image3Free((void *)v2);
      *a1 = 0;
    }
  }
}

uint64_t image3InstantiateNew(void *a1, size_t a2, unsigned int a3)
{
  uint64_t v6 = image3Malloc(0x28uLL);
  if (!v6) {
    return 12;
  }
  uint64_t v7 = v6;
  if (a2 <= 0x14) {
    a2 = 20;
  }
  uint64_t v8 = image3Malloc(a2);
  *uint64_t v7 = v8;
  if (!v8)
  {
    image3Free(v7);
    return 12;
  }
  *uint64_t v8 = 0;
  v8[1] = 0;
  *((_DWORD *)v8 + 4) = 0;
  uint64_t v9 = (_DWORD *)*v7;
  *uint64_t v9 = 1231906611;
  v9[4] = a3;
  v7[2] = a2;
  v7[3] = 0xFFFFFFFF00000000;
  *((_DWORD *)v7 + 2) = 0x40000;
  v7[4] = 0;
  if (a3 == 1667592820 || (uint64_t v10 = image3SetTagUnsignedNumber((char **)v7, 1415139397, a3), !v10))
  {
    uint64_t v11 = 0;
    *a1 = v7;
  }
  else
  {
    uint64_t v11 = v10;
    image3Free((void *)*v7);
    image3Free(v7);
  }
  return v11;
}

uint64_t image3SetTagUnsignedNumber(char **a1, int a2, unint64_t a3)
{
  int v7 = 0;
  unint64_t v6 = 0;
  if (HIDWORD(a3))
  {
    unint64_t v6 = a3;
    io_registry_entry_t v3 = (uint64_t *)&v6;
    size_t v4 = 8;
  }
  else
  {
    int v7 = a3;
    io_registry_entry_t v3 = (uint64_t *)&v7;
    size_t v4 = 4;
  }
  return image3SetTagStructure(a1, a2, v3, v4, 0);
}

uint64_t image3Finalize(uint64_t a1, char **a2, void *a3, int a4, uint64_t a5)
{
  unint64_t v18 = 0;
  int8x16_t v19 = 0uLL;
  int v20 = 0;
  v16[0] = 0;
  v16[1] = 0;
  int v17 = 0;
  if (!a4) {
    goto LABEL_8;
  }
  uint64_t result = image3AdvanceCursorWithZeroPad((char **)a1, (56 - *(_DWORD *)(a1 + 24)) & 0x3F);
  if (!result)
  {
    uint64_t v10 = *(char **)a1;
    unsigned int v11 = *(_DWORD *)(a1 + 24);
    *((_DWORD *)v10 + 3) = v11 + a5;
    uint64_t v12 = v10 + 12;
    CC_LONG v13 = v11 + 8;
    if (a5)
    {
      unint64_t v18 = __PAIR64__(v11, a5);
      image3SHA1Partial(v12, v13, &v19);
    }
    else
    {
      image3SHA1Generate(v12, v13, (unsigned __int8 *)v16);
    }
    uint64_t result = image3PKISignHash();
    if (!result)
    {
      *(_DWORD *)(a1 + 8) |= 0x20000u;
LABEL_8:
      uint64_t result = 0;
      uint64_t v14 = *(char **)a1;
      *((_DWORD *)v14 + 2) = *(_DWORD *)(a1 + 24);
      uint64_t v15 = (*(_DWORD *)(a1 + 24) + 20);
      *((_DWORD *)v14 + 1) = v15;
      *a2 = v14;
      *a3 = v15;
    }
  }
  return result;
}

uint64_t image3AdvanceCursorWithZeroPad(char **a1, int a2)
{
  if ((*((unsigned char *)a1 + 10) & 2) != 0) {
    return 30;
  }
  uint64_t v4 = *((int *)a1 + 6);
  uint64_t v3 = *((int *)a1 + 7);
  LODWORD(v5) = v4 + a2;
  *((_DWORD *)a1 + 6) = v4 + a2;
  unint64_t v6 = *a1;
  if (v3 != -1)
  {
    *(_DWORD *)&v6[v3 + 24] = v5 - v3;
    LODWORD(v5) = *((_DWORD *)a1 + 6);
  }
  uint64_t v5 = (int)v5;
  unint64_t v7 = (int)v5 + 20;
  if (v7 <= (unint64_t)a1[2]) {
    goto LABEL_7;
  }
  unint64_t v6 = (char *)realloc(v6, (int)v5 + 20);
  if (v6)
  {
    *a1 = v6;
    a1[2] = (char *)v7;
    uint64_t v5 = *((int *)a1 + 6);
LABEL_7:
    bzero(&v6[v4 + 20], v5 - v4);
    uint64_t result = 0;
    *((_DWORD *)*a1 + 2) = *((_DWORD *)a1 + 6);
    return result;
  }
  return 12;
}

uint64_t image3SetTagStructure(char **a1, int a2, void *__src, size_t __n, int a5)
{
  if ((*((unsigned char *)a1 + 10) & 2) != 0) {
    return 30;
  }
  if (a5)
  {
    uint64_t v9 = *((int *)a1 + 7);
    int v10 = (a5 + *((_DWORD *)a1 + 6) / a5 * a5 - *((_DWORD *)a1 + 6)) % a5 + *((_DWORD *)a1 + 6);
    *((_DWORD *)a1 + 6) = v10;
    unsigned int v11 = *a1;
    if (v9 != -1) {
      *(_DWORD *)&v11[v9 + 24] = v10 - v9;
    }
  }
  else
  {
    unsigned int v11 = *a1;
  }
  if ((__n & 0xF) != 0) {
    size_t v13 = 16 - (__n & 0xF);
  }
  else {
    size_t v13 = 0;
  }
  uint64_t v14 = *((int *)a1 + 6);
  size_t v15 = __n + v13 + v14 + 32;
  if (v15 > (unint64_t)a1[2])
  {
    unsigned int v11 = (char *)realloc(v11, __n + v13 + v14 + 32);
    if (!v11) {
      return 12;
    }
    *a1 = v11;
    a1[2] = (char *)v15;
    uint64_t v14 = *((int *)a1 + 6);
  }
  NSErrorUserInfoKey v16 = &v11[v14];
  if (((v13 + __n) & 3) != 0) {
    int v17 = ((v13 + __n) & 0xFFFFFFFC) + 16;
  }
  else {
    int v17 = v13 + __n + 12;
  }
  *((_DWORD *)v16 + 5) = a2;
  *((_DWORD *)v16 + 6) = v17;
  *((_DWORD *)v16 + 7) = __n;
  memcpy(v16 + 32, __src, __n);
  bzero(&v16[__n + 32], v13);
  uint64_t result = 0;
  int v18 = *((_DWORD *)a1 + 6);
  *((_DWORD *)a1 + 7) = v18;
  int v19 = *((_DWORD *)v16 + 6) + v18;
  *((_DWORD *)a1 + 6) = v19;
  *((_DWORD *)*a1 + 2) = v19;
  return result;
}

uint64_t image3InstantiateFromBuffer(void *a1, _DWORD *a2, unint64_t a3, char a4)
{
  if (a3 < 0x14) {
    return 22;
  }
  if (*a2 != 1231906611) {
    return 22;
  }
  unint64_t v6 = a2[2];
  if (a3 - 20 < v6 || a2[3] > v6 || v6 + 20 > a2[1]) {
    return 22;
  }
  int v10 = image3Malloc(0x28uLL);
  if (!v10) {
    return 12;
  }
  unsigned int v11 = v10;
  *((_DWORD *)v10 + 2) = 1;
  v10[4] = 0;
  if (a2[3])
  {
    *((_DWORD *)v10 + 2) = 131073;
    if ((a4 & 1) == 0)
    {
      *int v10 = a2;
      v10[2] = a3;
LABEL_21:
      uint64_t result = 0;
      *a1 = v11;
      return result;
    }
    goto LABEL_19;
  }
  *((_DWORD *)v10 + 6) = a2[2];
  *((_DWORD *)v10 + 7) = -1;
  unsigned int v12 = a2[2];
  if (!v12)
  {
LABEL_19:
    size_t v16 = a2[2] + 20;
    v11[2] = v16;
    int v17 = image3Malloc(v16);
    *unsigned int v11 = v17;
    if (v17)
    {
      memcpy(v17, a2, v11[2]);
      *((_DWORD *)v11 + 2) |= 0x40000u;
      goto LABEL_21;
    }
    image3Free(v11);
    return 12;
  }
  unsigned int v13 = 0;
  while (1)
  {
    unsigned int v14 = v13;
    unsigned int v15 = *(_DWORD *)((char *)a2 + v13 + 24);
    v13 += v15;
    if (v13 > v12 || v15 <= 0xB) {
      break;
    }
    if (v13 == v12)
    {
      *((_DWORD *)v10 + 7) = v14;
      goto LABEL_19;
    }
  }
  image3Free(v10);
  return 22;
}

uint64_t image3GetTagStruct(uint64_t a1, int a2, void *a3, void *a4, int a5)
{
  uint64_t v5 = *(unsigned int *)(*(void *)a1 + 8);
  if (!v5) {
    return 2;
  }
  unint64_t v6 = (_DWORD *)(*(void *)a1 + 20);
  unint64_t v7 = (unint64_t)v6 + v5;
  while (1)
  {
    uint64_t v8 = v6 + 3;
    if ((unint64_t)(v6 + 3) > v7) {
      return 22;
    }
    uint64_t v9 = v6[2];
    if ((unint64_t)v8 + v9 > v7) {
      return 22;
    }
    if (a2 == -1 || *v6 == a2) {
      break;
    }
LABEL_9:
    unint64_t v10 = v6[1];
    if (v9 + 12 > v10) {
      return 22;
    }
    unint64_t v6 = (_DWORD *)((char *)v6 + v10);
    if ((unint64_t)v6 >= v7) {
      return 2;
    }
  }
  if (a5)
  {
    --a5;
    goto LABEL_9;
  }
  if (a4)
  {
    if (*a4 && *a4 != v9) {
      return 22;
    }
    *a4 = v9;
  }
  uint64_t result = 0;
  *a3 = v8;
  return result;
}

uint64_t image3GetTagUnsignedNumber(uint64_t a1, int a2, void *a3, int a4)
{
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t result = image3GetTagStruct(a1, a2, &v8, &v7, a4);
  if (!result)
  {
    if (v7 == 8)
    {
      uint64_t v6 = *(void *)v8;
      goto LABEL_6;
    }
    if (v7 == 4)
    {
      uint64_t v6 = *v8;
LABEL_6:
      uint64_t result = 0;
      *a3 = v6;
      return result;
    }
    return 22;
  }
  return result;
}

void sub_10000C440(uint64_t a1)
{
  uint64_t step_desc = checkpoint_closure_context_get_step_desc((uint64_t)[*(id *)(a1 + 32) checkpoint_closure_context]);
  ramrod_log_msg("[AsyncCP][Start] Checkpoint %s start running.\n", v3, v4, v5, v6, v7, v8, v9, *(void *)(step_desc + 8));
  unint64_t v10 = [*(id *)(a1 + 32) workQueue];
  dispatch_queue_set_specific(v10, kCheckpointAsyncStepContextKey, [*(id *)(a1 + 32) checkpoint_closure_context], 0);
  char v11 = 0;
  char v12 = 1;
  do
  {
    while (1)
    {
      unsigned int v44 = 0;
      id v43 = 0;
      if (v11)
      {
        unsigned int v13 = (uint64_t *)[*(id *)(a1 + 32) checkpoint_closure_context];
        if (checkpoint_closure_context_handle_simulator_actions(v13, 1, (int *)&v44, (const void **)&v43, v14, v15, v16, v17))goto LABEL_4; {
      }
        }
      else if (v12)
      {
LABEL_4:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        unsigned int v44 = [*(id *)(a1 + 32) result];
        id v43 = [*(id *)(a1 + 32) error];
        char v12 = 1;
        goto LABEL_7;
      }
      char v12 = 0;
LABEL_7:
      int v18 = (uint64_t *)[*(id *)(a1 + 32) checkpoint_closure_context];
      if (checkpoint_closure_context_handle_simulator_actions(v18, 0, (int *)&v44, (const void **)&v43, v19, v20, v21, v22))
      {
        uint64_t v23 = (uint64_t *)[*(id *)(a1 + 32) checkpoint_closure_context];
        BOOL v31 = checkpoint_closure_context_handle_simulator_match_name(v23, v24, v25, v26, v27, v28, v29, v30) != 0;
      }
      else
      {
        BOOL v31 = 0;
      }
      [*(id *)(a1 + 32) setResult:v44];
      [*(id *)(a1 + 32) setError:v43];
      if (!v44 || v31) {
        break;
      }
      int should_retry = checkpoint_closure_context_should_retry((uint64_t)[*(id *)(a1 + 32) checkpoint_closure_context]);
      char v11 = 1;
      if (!should_retry) {
        goto LABEL_18;
      }
    }
    if (v44) {
      char v33 = 1;
    }
    else {
      char v33 = v31;
    }
    char v11 = 1;
  }
  while ((v33 & 1) != 0);
LABEL_18:
  uint64_t v34 = [*(id *)(a1 + 32) workQueue];
  dispatch_queue_set_specific(v34, kCheckpointAsyncStepContextKey, 0, 0);
  uint64_t v35 = *(void *)(step_desc + 8);
  [*(id *)(a1 + 32) result];
  ramrod_log_msg("[AsyncCP][End] Checkpoint %s finished with result: %d.\n", v36, v37, v38, v39, v40, v41, v42, v35);
}

void sub_10000C5F0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 3);
  uint64_t v4 = *(const void **)(a2 + 40);

  _Block_object_assign((void *)(a1 + 40), v4, 7);
}

void sub_10000C640(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 7);
  uint64_t v2 = *(const void **)(a1 + 32);

  _Block_object_dispose(v2, 3);
}

uint64_t wait_for_io_service_matching_dict(CFTypeRef cf, unsigned int a2)
{
  unsigned int v4 = 0;
  do
  {
    CFRetain(cf);
    uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, (CFDictionaryRef)cf);
    if (MatchingService) {
      break;
    }
    unsigned int v6 = a2 - v4 >= 3 ? 3 : a2 - v4;
    CFStringRef v7 = CFCopyDescription(cf);
    char CStringPtr = CFStringGetCStringPtr(v7, 0);
    ramrod_log_msg("waiting for matching IOKit service: %s\n", v9, v10, v11, v12, v13, v14, v15, CStringPtr);
    sleep(v6);
    v4 += v6;
    CFRelease(v7);
  }
  while (v4 < a2);
  CFRelease(cf);
  return MatchingService;
}

uint64_t wait_for_io_service_matching_resource_with_timeout(const char *a1, unsigned int a2)
{
  CFMutableDictionaryRef v4 = IOServiceMatching("IOResources");
  if (!v4)
  {
    ramrod_log_msg("unable to create matching dictionary for resource '%s'\n", v5, v6, v7, v8, v9, v10, v11, (char)a1);
    return 0;
  }
  uint64_t v12 = v4;
  CFStringRef v13 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x8000100u);
  if (!v13)
  {
    ramrod_log_msg("unable to convert resource name to CFString\n", v14, v15, v16, v17, v18, v19, v20, v23);
    return 0;
  }
  CFStringRef v21 = v13;
  CFDictionarySetValue(v12, @"IOResourceMatch", v13);
  CFRelease(v21);

  return wait_for_io_service_matching_dict(v12, a2);
}

BOOL ramrod_check_NVRAM_access()
{
  io_object_t v0 = wait_for_io_service_matching_resource_with_timeout("IONVRAM", 0);
  io_object_t v1 = v0;
  if (v0) {
    IOObjectRelease(v0);
  }
  return v1 != 0;
}

uint64_t ramrod_delete_NVRAM_variable()
{
  return 1;
}

uint64_t ramrod_copy_NVRAM_variable()
{
  return 0;
}

CFTypeRef ramrod_copy_NVRAM_variable_from_devicetree(CFStringRef theString)
{
  CFStringRef Copy = CFStringCreateCopy(0, theString);
  io_registry_entry_t v2 = atomic_load((unsigned int *)dword_10002E5A8);
  if (!v2)
  {
    io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/options");
    if (v2)
    {
      io_registry_entry_t v5 = 0;
      atomic_compare_exchange_strong(dword_10002E5A8, &v5, v2);
      if (v5)
      {
        IOObjectRelease(v2);
        io_registry_entry_t v2 = v5;
      }
    }
  }
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v2, Copy, 0, 0);
  CFRelease(Copy);
  return CFProperty;
}

uint64_t image3SHA1Generate(const void *a1, CC_LONG a2, unsigned __int8 *a3)
{
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, a1, a2);
  return CC_SHA1_Final(a3, &v7);
}

uint64_t image3PKISignHash()
{
  return 0xFFFFFFFFLL;
}

int8x16_t image3SHA1Partial(const void *a1, CC_LONG a2, int8x16_t *a3)
{
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, a1, a2);
  int8x16_t result = vrev32q_s8(*(int8x16_t *)&v7.h0);
  *a3 = result;
  a3[1].i32[0] = bswap32(v7.h4);
  return result;
}

uint64_t ramrod_ticket_create_img3(CFDataRef *a1, CFErrorRef *a2)
{
  uint64_t v28 = 0;
  if (!qword_10002E5B0 || byte_10002E5B8 != 1) {
    return 1;
  }
  CFIndex v29 = 0;
  uint64_t v30 = 0;
  if (image3InstantiateNew(&v28, 0, 0x53434142u))
  {
    ramrod_create_error_cf(a2, @"RamrodErrorDomain", 6, 0, @"%s: unable to create img3 ticket", v4, v5, v6, (char)"ramrod_ticket_create_img3");
    uint64_t v14 = "failed to create img3\n";
LABEL_10:
    ramrod_log_msg(v14, v7, v8, v9, v10, v11, v12, v13, v27);
LABEL_11:
    uint64_t v15 = 0;
    goto LABEL_12;
  }
  uint64_t v16 = v28;
  BytePtr = (UInt8 *)CFDataGetBytePtr((CFDataRef)qword_10002E5B0);
  size_t Length = CFDataGetLength((CFDataRef)qword_10002E5B0);
  if (image3SetTagStructure(v16, 1145132097, BytePtr, Length, 32))
  {
    uint64_t v14 = "failed to create data tag for ticket";
    goto LABEL_10;
  }
  if (image3Finalize((uint64_t)v28, (char **)&v30, &v29, 0, 0))
  {
    ramrod_create_error_cf(a2, @"RamrodErrorDomain", 6, 0, @"%s: unable to create CFData for img3 ticket", v19, v20, v21, (char)"ramrod_ticket_create_img3");
    uint64_t v14 = "could not finalize ticket img3";
    goto LABEL_10;
  }
  CFDataRef v23 = CFDataCreate(kCFAllocatorDefault, v30, v29);
  if (!v23)
  {
    ramrod_create_error_cf(a2, @"RamrodErrorDomain", 6, 0, @"%s: unable to create CFData for img3 ticket", v24, v25, v26, (char)"ramrod_ticket_create_img3");
    goto LABEL_11;
  }
  *a1 = v23;
  uint64_t v15 = 1;
LABEL_12:
  if (v28) {
    image3Discard((uint64_t *)&v28);
  }
  return v15;
}

uint64_t get_BOOLean_option(const __CFDictionary *a1, const __CFString *a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unsigned __int8 valuePtr = a3;
  if (!a1) {
    return v3;
  }
  Value = CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return v3;
  }
  uint64_t v6 = Value;
  CFTypeID v7 = CFGetTypeID(Value);
  if (v7 != CFBooleanGetTypeID())
  {
    CFTypeID v9 = CFGetTypeID(v6);
    if (v9 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)v6, kCFNumberIntType, &valuePtr);
      return valuePtr;
    }
    else
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      *(_OWORD *)buffer = 0u;
      long long v19 = 0u;
      CFStringGetCString(a2, buffer, 255, 0x8000100u);
      ramrod_log_msg("%s: option '%s' has non-BOOLean value, using default\n", v10, v11, v12, v13, v14, v15, v16, (char)"get_BOOLean_option");
    }
    return v3;
  }

  return CFBooleanGetValue((CFBooleanRef)v6);
}

uint64_t ramrod_log_msg_to_fd(uint64_t a1, uint64_t a2, int __fd)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    uint64_t v7 = 0;
    while (1)
    {
      ssize_t v8 = write(__fd, (const void *)(a1 + v7), a2 - v7);
      if (v8 == -1) {
        break;
      }
      v7 += v8;
      if (v7 == a2) {
        return 0;
      }
    }
    return *__error();
  }
  return result;
}

uint64_t sub_10000D044(int a1)
{
  int valuePtr = a1;
  memset(&v16, 0, sizeof(v16));
  int v1 = fstat(a1, &v16);
  BOOL v2 = (__int16)v16.st_mode <= -1 && v1 == 0;
  uint64_t v3 = &qword_10002E5E0;
  if (v2) {
    uint64_t v3 = &qword_10002E5D8;
  }
  uint64_t v4 = (__CFSet *)*v3;
  if (!*v3)
  {
    uint64_t v12 = __stderrp;
    uint64_t v13 = "can't remove logging fd since none were added";
    size_t v14 = 45;
LABEL_13:
    fwrite(v13, v14, 1uLL, v12);
    return 0xFFFFFFFFLL;
  }
  CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (!v5)
  {
    uint64_t v12 = __stderrp;
    uint64_t v13 = "failed to convert fd to number";
    size_t v14 = 30;
    goto LABEL_13;
  }
  CFNumberRef v6 = v5;
  CFSetRemoveValue(v4, v5);
  if (close(valuePtr))
  {
    uint64_t v7 = __error();
    uint64_t v8 = *v7;
    CFTypeID v9 = __stderrp;
    int v10 = valuePtr;
    uint64_t v11 = strerror(*v7);
    fprintf(v9, "failed to close file descriptor '%d', error:%s", v10, v11);
  }
  else
  {
    uint64_t v8 = 0;
  }
  CFRelease(v6);
  return v8;
}

uint64_t ramrod_log_msg_to_all_fds(uint64_t a1, uint64_t a2)
{
  long long context = 0u;
  *(_OWORD *)theArray = 0u;
  int valuePtr = -1;
  pthread_mutex_lock(&stru_10002E010);
  if (a1 && xmmword_10002E5D8 != 0)
  {
    *(void *)&long long context = a1;
    *((void *)&context + 1) = a2;
    theArray[0] = 0;
    LOBYTE(theArray[1]) = 0;
    if (*((void *)&xmmword_10002E5D8 + 1)) {
      CFSetApplyFunction(*((CFSetRef *)&xmmword_10002E5D8 + 1), (CFSetApplierFunction)sub_10000D2E0, &context);
    }
    qword_10002E5E8 += a2;
    if (qword_10002E5E8)
    {
      LOBYTE(theArray[1]) = 1;
      qword_10002E5E8 = 0;
    }
    if ((void)xmmword_10002E5D8) {
      CFSetApplyFunction((CFSetRef)xmmword_10002E5D8, (CFSetApplierFunction)sub_10000D2E0, &context);
    }
    if (theArray[0])
    {
      CFIndex Count = CFArrayGetCount(theArray[0]);
      if (Count >= 1)
      {
        CFIndex v5 = Count;
        for (CFIndex i = 0; i != v5; ++i)
        {
          CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray[0], i);
          if (CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr)) {
            sub_10000D044(valuePtr);
          }
          else {
            fwrite("Failed to convert CFNumberRef into int value\n", 0x2DuLL, 1uLL, __stderrp);
          }
        }
      }
      CFRelease(theArray[0]);
    }
  }
  pthread_mutex_unlock(&stru_10002E010);
  return 0;
}

void sub_10000D2E0(const void *a1, uint64_t a2)
{
  int valuePtr = -1;
  if (a1)
  {
    if (a2)
    {
      if (*(void *)a2)
      {
        if (CFNumberGetValue((CFNumberRef)a1, kCFNumberIntType, &valuePtr))
        {
          if (ramrod_log_msg_to_fd(*(void *)a2, *(void *)(a2 + 8), valuePtr))
          {
            fprintf(__stderrp, "Removing file descriptor %d since it failed to be written to.\n", valuePtr);
            Mutable = *(__CFArray **)(a2 + 16);
            if (!Mutable)
            {
              Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
              *(void *)(a2 + 16) = Mutable;
            }
            CFArrayAppendValue(Mutable, a1);
          }
          else if (*(unsigned char *)(a2 + 24))
          {
            fsync(valuePtr);
          }
        }
        else
        {
          fwrite("Failed to convert num to int\n", 0x1DuLL, 1uLL, __stderrp);
        }
      }
      return;
    }
    CFIndex v5 = __stderrp;
    CFNumberRef v6 = "Missing logging context.\n";
    size_t v7 = 25;
  }
  else
  {
    CFIndex v5 = __stderrp;
    CFNumberRef v6 = "NULL fd num in fd set, weird.\n";
    size_t v7 = 30;
  }

  fwrite(v6, v7, 1uLL, v5);
}

void ramrod_log_msg(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void ramrod_log_msg_cf(CFStringRef format, ...)
{
  va_start(va, format);
  CFStringRef v1 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, format, va);
  if (!v1)
  {
    ramrod_log_msg("(Failed to format log message)\n", v2, v3, v4, v5, v6, v7, v8, v30);
    return;
  }
  CFStringRef v9 = v1;
  char CStringPtr = CFStringGetCStringPtr(v1, 0x8000100u);
  if (CStringPtr)
  {
    char v30 = (char)CStringPtr;
    uint64_t v18 = "%s";
  }
  else
  {
    CFIndex Length = CFStringGetLength(v9);
    CFIndex v20 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    long long v21 = (char *)malloc(v20);
    if (v21)
    {
      long long v22 = v21;
      if (CFStringGetCString(v9, v21, v20, 0x8000100u)) {
        ramrod_log_msg("%s", v23, v24, v25, v26, v27, v28, v29, (char)v22);
      }
      else {
        ramrod_log_msg("(Failed to alloc and convert log message)\n", v23, v24, v25, v26, v27, v28, v29, v30);
      }
      free(v22);
      goto LABEL_12;
    }
    uint64_t v18 = "(Failed to alloc and convert log message)\n";
  }
  ramrod_log_msg(v18, v11, v12, v13, v14, v15, v16, v17, v30);
LABEL_12:
  CFRelease(v9);
}

void sub_10000D560(int a1, const char *a2, va_list a3)
{
  __s = 0;
  if (vasprintf(&__s, a2, a3) != -1)
  {
    pthread_mutex_lock(&stru_10002DFD0);
    if (a1 == 1)
    {
      fputs(__s, __stdoutp);
      if (off_10002E5F0) {
        off_10002E5F0(__s);
      }
    }
    size_t v4 = strlen(__s);
    ramrod_log_msg_to_all_fds((uint64_t)__s, v4);
    if (!byte_10002E050) {
      goto LABEL_23;
    }
    uint64_t v5 = (char *)qword_10002E5D0;
    if (!qword_10002E5D0)
    {
      uint64_t v5 = (char *)malloc(0x100000uLL);
      qword_10002E5D0 = (uint64_t)v5;
      if (!v5)
      {
        fprintf(__stderrp, "unable to allocate %lu bytes for log buffer\n", 0x100000);
LABEL_23:
        pthread_mutex_unlock(&stru_10002DFD0);
        goto LABEL_24;
      }
      qword_10002E5C0 = (uint64_t)v5;
      qword_10002E5C8 = (uint64_t)v5;
    }
    char v6 = *__s;
    if (*__s)
    {
      uint64_t v7 = v5 + 0x100000;
      uint64_t v8 = (char *)qword_10002E5C8;
      uint64_t v9 = qword_10002E5C0;
      int v10 = __s + 1;
      do
      {
        *uint64_t v8 = v6;
        if (v8 + 1 == v7) {
          uint64_t v8 = v5;
        }
        else {
          ++v8;
        }
        qword_10002E5C8 = (uint64_t)v8;
        if ((char *)v9 == v8)
        {
          if (v8 + 1 == v7) {
            uint64_t v9 = (uint64_t)v5;
          }
          else {
            uint64_t v9 = (uint64_t)(v8 + 1);
          }
          qword_10002E5C0 = v9;
        }
        int v11 = *v10++;
        char v6 = v11;
      }
      while (v11);
    }
    goto LABEL_23;
  }
  fwrite("unable to allocate storage for log message\n", 0x2BuLL, 1uLL, __stderrp);
LABEL_24:
  free(__s);
}

CFStringRef sub_10000D6DC()
{
  return CFStringCreateWithFormat(0, 0, @"UNKNOWN");
}

CFStringRef sub_10000D6F0(uint64_t a1, const char **a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v2 = *a2;
  if (!*a2) {
    return 0;
  }
  size_t v3 = strlen(*a2);
  if (v3 > 0x100) {
    return CFStringCreateWithFormat(0, 0, @"~%s", &v2[v3 - 255]);
  }
  else {
    return CFStringCreateWithFormat(0, 0, @"%s", v2);
  }
}

CFStringRef sub_10000D768(uint64_t a1, unsigned int *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v3 = *((void *)a2 + 1);
  if (!v3) {
    return 0;
  }
  size_t v4 = strlen(*((const char **)a2 + 1));
  if (v4 > 0xF2) {
    return CFStringCreateWithFormat(0, 0, @"{0x%08X:\"~%s\"}", *a2, v4 + v3 - 241);
  }
  else {
    return CFStringCreateWithFormat(0, 0, @"{0x%08X:\"%s\"}", *a2, v3);
  }
}

CFStringRef sub_10000D7EC(uint64_t a1, void *a2)
{
  if (a2) {
    return CFStringCreateWithFormat(0, 0, @"%ld", *a2);
  }
  else {
    return 0;
  }
}

CFStringRef sub_10000D830(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    uint64_t v16 = 0;
    asprintf(&v16, "{");
    uint64_t v8 = v16;
    if (v16)
    {
      uint64_t v9 = 0;
      int v15 = 0;
      char v10 = 1;
      do
      {
        char v11 = v10;
        uint64_t v12 = (const char *)*((void *)&v2->isa + v9);
        if (v12)
        {
          uint64_t v8 = sub_100010204(v8, off_100024A30[v9], v12, &v15);
          uint64_t v16 = v8;
        }
        char v10 = 0;
        uint64_t v9 = 1;
      }
      while ((v11 & 1) != 0);
      uint64_t v16 = sub_1000102F4(v8, "}", (uint64_t)v12, v3, v4, v5, v6, v7, v14);
      CFStringRef v2 = CFStringCreateWithFormat(0, 0, @"%s", v16);
      if (v16) {
        free(v16);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

CFStringRef sub_10000D900(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    char v14 = 0;
    asprintf(&v14, "{");
    uint64_t v8 = v14;
    if (v14)
    {
      uint64_t v9 = 0;
      int v13 = 0;
      do
      {
        char v10 = *(const char **)((char *)&v2->info + v9);
        if (v10)
        {
          uint64_t v8 = sub_100010394(v8, *(_DWORD *)((char *)&v2->isa + v9), v10, &v13);
          char v14 = v8;
        }
        v9 += 16;
      }
      while (v9 != 128);
      char v14 = sub_1000102F4(v8, "}", (uint64_t)v10, v3, v4, v5, v6, v7, v12);
      CFStringRef v2 = CFStringCreateWithFormat(0, 0, @"%s", v14);
      if (v14) {
        free(v14);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

CFStringRef sub_10000D9BC(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    char v14 = 0;
    asprintf(&v14, "{");
    if (v14)
    {
      uint64_t v9 = 0;
      int v13 = 0;
      do
      {
        if (*(_DWORD *)((char *)&v2->isa + v9))
        {
          char v12 = 0;
          asprintf(&v12, "%d", *(_DWORD *)((char *)&v2->isa + v9 + 4));
          uint64_t v3 = v12;
          if (v12)
          {
            char v14 = sub_100010394(v14, *(_DWORD *)((char *)&v2->isa + v9), v12, &v13);
            if (v12) {
              free(v12);
            }
          }
        }
        v9 += 8;
      }
      while (v9 != 64);
      char v14 = sub_1000102F4(v14, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v11);
      CFStringRef v2 = CFStringCreateWithFormat(0, 0, @"%s", v14);
      if (v14) {
        free(v14);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

CFStringRef sub_10000DABC(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    long long v19 = 0;
    asprintf(&v19, "{");
    if (v19)
    {
      uint64_t v9 = 0;
      int v18 = 0;
      p_info = &v2->info;
      do
      {
        char v11 = (int *)v2 + 18 * v9;
        if (*v11)
        {
          long long v22 = 0;
          asprintf(&v22, "{");
          if (v22)
          {
            uint64_t v12 = 0;
            int v21 = 0;
            do
            {
              int v13 = (const char *)p_info[v12];
              if (v13)
              {
                CFIndex v20 = 0;
                asprintf(&v20, "\"%s\"", v13);
                uint64_t v3 = v20;
                if (v20)
                {
                  long long v22 = sub_10001040C(v22, v12, v20, &v21);
                  if (v20) {
                    free(v20);
                  }
                }
              }
              ++v12;
            }
            while (v12 != 8);
            char v14 = sub_1000102F4(v22, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v17);
            if (v14)
            {
              int v15 = v14;
              long long v19 = sub_100010394(v19, *v11, v14, &v18);
              free(v15);
            }
          }
        }
        ++v9;
        p_info += 9;
      }
      while (v9 != 8);
      long long v19 = sub_1000102F4(v19, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v17);
      CFStringRef v2 = CFStringCreateWithFormat(0, 0, @"%s", v19);
      if (v19) {
        free(v19);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

CFStringRef sub_10000DC54(uint64_t a1, const __CFString *a2)
{
  CFStringRef v2 = a2;
  if (a2)
  {
    int v18 = 0;
    asprintf(&v18, "{");
    if (v18)
    {
      uint64_t v9 = 0;
      int v17 = 0;
      CFStringRef v10 = v2;
      do
      {
        char v11 = (int *)v2 + 11 * v9;
        if (*v11)
        {
          int v21 = 0;
          asprintf(&v21, "{");
          if (v21)
          {
            uint64_t v12 = 0;
            int v20 = 0;
            do
            {
              if (*((unsigned char *)&v10[1].isa + v12 + 4))
              {
                long long v19 = 0;
                asprintf(&v19, "%d", *((_DWORD *)&v10->isa + v12 + 1));
                uint64_t v3 = v19;
                if (v19)
                {
                  int v21 = sub_10001040C(v21, v12, v19, &v20);
                  if (v19) {
                    free(v19);
                  }
                }
              }
              ++v12;
            }
            while (v12 != 8);
            int v13 = sub_1000102F4(v21, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v16);
            if (v13)
            {
              char v14 = v13;
              int v18 = sub_100010394(v18, *v11, v13, &v17);
              free(v14);
            }
          }
        }
        ++v9;
        CFStringRef v10 = (CFStringRef)((char *)v10 + 44);
      }
      while (v9 != 8);
      int v18 = sub_1000102F4(v18, "}", (uint64_t)v3, v4, v5, v6, v7, v8, v16);
      CFStringRef v2 = CFStringCreateWithFormat(0, 0, @"%s", v18);
      if (v18) {
        free(v18);
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t sub_10000DDF8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  int v10 = *(_DWORD *)(a1 + 664);
  if (!v10) {
    goto LABEL_160;
  }
  if (v10 == 1)
  {
    uint64_t v11 = 1;
    goto LABEL_20;
  }
  uint64_t v11 = 0;
  if (a2)
  {
    if (v10 == 2)
    {
LABEL_160:
      if (ramrod_check_NVRAM_access())
      {
        if (*(unsigned char *)(a1 + 2272))
        {
          if (!*(unsigned char *)(a1 + 2273))
          {
LABEL_24:
            int v17 = *(_DWORD *)(a1 + 664);
            if (*(unsigned char *)(a1 + 669))
            {
LABEL_149:
              uint64_t v11 = 1;
              *(_DWORD *)(a1 + 664) = 1;
              if (!v8)
              {
                if (v17) {
                  sub_10000E6F0(a1, 2, 1, 0, 256, "NVRAM access has become available", 0, 0, 0);
                }
                else {
                  sub_10000E6F0(a1, 2, 1, 0, 256, "NVRAM access available on initial check", 0, 0, 0);
                }
              }
              goto LABEL_20;
            }
            BOOL v18 = *(_DWORD *)a1 == 1 && v17 == 2;
            uint64_t v19 = 8;
            if (v18) {
              uint64_t v19 = 400;
            }
            uint64_t v20 = a1 + v19;
            int v21 = (void *)(v20 + 664);
            if (*(unsigned char *)(v20 + 668)) {
              ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): first available indication when already collected\n", v12, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_handle_first_available");
            }
            else {
              sub_10000F1E0((int *)a1, (uint64_t)v21, a3, a4, a5, a6, a7, a8);
            }
            if (*(_DWORD *)a1 == 1)
            {
              int v29 = *(_DWORD *)(a1 + 88);
              if (*(_DWORD *)(a1 + 96))
              {
                if (v29 == 2) {
                  uint64_t v39 = (unsigned int *)&unk_100019848;
                }
                else {
                  uint64_t v39 = (unsigned int *)&unk_100019990;
                }
              }
              else
              {
                if (v29 == 2)
                {
                  int v31 = sub_100010834(a1, (uint64_t)v21, dword_1000195B8, v24, v25, v26, v27, v28);
                  sub_100010A6C(a1, (uint64_t)v21);
                  goto LABEL_53;
                }
                uint64_t v39 = (unsigned int *)&unk_100019738;
              }
              int v31 = sub_100010834(a1, (uint64_t)v21, v39, v24, v25, v26, v27, v28);
LABEL_53:
              uint64_t v43 = v21[6];
              if (!v43)
              {
LABEL_110:
                if (!v43 && v31 && !*(unsigned char *)(a1 + 106) && !*(unsigned char *)(a1 + 100) && !*(unsigned char *)(a1 + 104)) {
                  sub_10000F3A4(a1, v32, "[monitor_aware]pre-existing NVRAM implied reboot-retry but values were inconsistent");
                }
LABEL_116:
                if (*(unsigned char *)(a1 + 104))
                {
                  if (v17 == 2)
                  {
                    uint64_t v73 = 0;
                    v74 = (void *)(a1 + 1496);
                    v75 = &dword_100024A50;
LABEL_119:
                    uint64_t v76 = *v75;
                    if (v73 != v76)
                    {
                      uint64_t v77 = a1 + 16 * (int)v76;
                      *(unsigned char *)(v77 + 1492) = *((unsigned char *)v74 - 4);
                      *((unsigned char *)v74 - 4) = 0;
                      uint64_t v78 = *v74;
                      void *v74 = *(void *)(v77 + 1496);
                      *(void *)(v77 + 1496) = v78;
                    }
                    while (v73 != 47)
                    {
                      v74 += 2;
                      v75 += 8;
                      ++v73;
                      if (*(unsigned char *)(a1 + 104)) {
                        goto LABEL_119;
                      }
                    }
                  }
                }
                else if (*(_DWORD *)a1 != 1 && *(_DWORD *)(a1 + 88) == 2)
                {
                  ramrod_log_msg("%s\n", v32, v33, v34, v35, v36, v37, v38, (char)"void clear_stale_ota_nvram(void)");
                  sub_100010C48(@"boot-breadcrumbs");
                  sub_100010C48(@"OTA-pre-conversion");
                  sub_100010C48(@"OTA-post-conversion");
                  sub_100010C48(@"ota-conv-panic-indicator");
                  sub_100010C48(@"OTA-fsck-metrics");
                  sub_100010C48(@"OTA-sealvolume-metrics");
                  sub_100010C48(@"OTA-migrator-metrics");
                  for (uint64_t i = 0; i != 28; ++i)
                  {
                    v80 = (const __CFString **)&off_100024A40[4 * dword_100019EC8[i]];
                    sub_100010C48(v80[1]);
                    sub_100010C48(*v80);
                  }
                }
                if (*(_DWORD *)(a1 + 96))
                {
                  if (*(unsigned char *)(a1 + 101))
                  {
                    if (*(unsigned char *)(a1 + 104))
                    {
                      if (*(unsigned char *)(a1 + 106))
                      {
                        unsigned int v81 = 9;
                      }
                      else if (*(unsigned char *)(a1 + 105))
                      {
                        unsigned int v81 = 12;
                      }
                      else if (*(unsigned char *)(a1 + 100))
                      {
                        unsigned int v81 = 10;
                      }
                      else
                      {
                        unsigned int v81 = 11;
                      }
                    }
                    else if (*(unsigned char *)(a1 + 103))
                    {
                      unsigned int v81 = 10;
                    }
                    else
                    {
                      unsigned int v81 = 3;
                    }
                  }
                  else if (*(unsigned char *)(a1 + 102))
                  {
                    if (*(unsigned char *)(a1 + 104)) {
                      unsigned int v81 = 7;
                    }
                    else {
                      unsigned int v81 = 6;
                    }
                  }
                  else
                  {
                    unsigned int v81 = 2;
                  }
                  sub_10000F444(a1, v81, v33, v34, v35, v36, v37, v38);
                }
                else
                {
                  sub_100010484(a1, 1, v33, v34, v35, v36, v37, v38);
                }
                *(unsigned char *)(a1 + 669) = 1;
                goto LABEL_149;
              }
              unsigned int v44 = sub_10000F328(a1, (uint64_t)v21, v33, v34, v35, v36, v37, v38);
              if (v44 < 0x22)
              {
                uint64_t v52 = &dword_100019F38[3 * v44];
              }
              else
              {
                ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid outcome=%d\n", v45, v46, v47, v48, v49, v50, v51, (char)"checkpoint_get_outcome_attributes");
                uint64_t v52 = dword_100019F38;
              }
              CFStringRef v53 = (const __CFString *)v21[6];
              bzero(v83, 0x400uLL);
              if (*v52 == 2)
              {
                int v54 = *((unsigned __int8 *)v52 + 8);
                if (*((unsigned char *)v52 + 8)) {
                  *(unsigned char *)(a1 + 106) = 1;
                }
                if (*((unsigned char *)v52 + 7))
                {
                  int v31 = 0;
                  *(unsigned char *)(a1 + 102) = 1;
                }
                if (!*((unsigned char *)v52 + 5))
                {
                  if (!*((unsigned char *)v52 + 4) || !*((unsigned char *)v52 + 6))
                  {
                    LODWORD(v43) = 0;
                    goto LABEL_110;
                  }
                  if (v54)
                  {
                    LODWORD(v43) = 0;
                    *(unsigned char *)(a1 + 101) = 1;
                    goto LABEL_110;
                  }
                  uint64_t v43 = v21[8];
                  if (!v43) {
                    goto LABEL_110;
                  }
LABEL_98:
                  CFStringRef v69 = (const __CFString *)v21[7];
                  *(unsigned char *)(a1 + 101) = 1;
                  if (v69 && CFEqual(v69, @"true"))
                  {
                    *(unsigned char *)(a1 + 100) = 1;
                    LODWORD(v43) = *((unsigned __int8 *)v52 + 5);
                    if (!*((unsigned char *)v52 + 5))
                    {
                      *(unsigned char *)(a1 + 103) = 1;
                      goto LABEL_110;
                    }
                    LODWORD(v43) = 0;
                    goto LABEL_65;
                  }
                  goto LABEL_100;
                }
                if (v54)
                {
                  LODWORD(v43) = 0;
                  *(unsigned char *)(a1 + 101) = 1;
LABEL_65:
                  *(_WORD *)(a1 + 104) = 257;
                  goto LABEL_110;
                }
                uint64_t v43 = v21[8];
                if (v43) {
                  goto LABEL_98;
                }
              }
              else
              {
                LODWORD(v43) = *((unsigned __int8 *)v52 + 5);
                if (!*((unsigned char *)v52 + 5)) {
                  goto LABEL_110;
                }
                if (!v21[8])
                {
                  sub_10000F5E4(v53, v83);
                  sub_10000F3A4(a1, v71, "[monitor_aware]outcome=%s(reboot_retry_not_in_zone)");
                  goto LABEL_102;
                }
                CFStringRef v55 = (const __CFString *)v21[7];
                if (!v55 || CFStringCompare(v55, @"true", 0))
                {
LABEL_100:
                  sub_10000F5E4(v53, v83);
                  sub_10000F3A4(a1, v70, "[monitor_aware]outcome=%s(reboot_retry_disabled)");
LABEL_102:
                  LODWORD(v43) = 1;
                  goto LABEL_110;
                }
                LODWORD(v43) = 0;
              }
              *(unsigned char *)(a1 + 104) = 1;
              goto LABEL_110;
            }
            CFStringRef v30 = (const __CFString *)v21[7];
            if (v30 && CFEqual(v30, @"true")) {
              *(unsigned char *)(a1 + 100) = 1;
            }
            else {
              ramrod_log_msg("AP nonce will not be touched\n", v22, v23, v24, v25, v26, v27, v28, v82);
            }
            int v40 = *(_DWORD *)(a1 + 88);
            if (*(_DWORD *)(a1 + 96))
            {
              if (v40 == 2)
              {
                int v41 = sub_100010834(a1, (uint64_t)v21, dword_100019C30, v24, v25, v26, v27, v28);
                sub_100010A6C(a1, (uint64_t)v21);
                goto LABEL_72;
              }
              uint64_t v42 = (unsigned int *)&unk_100019DB8;
            }
            else if (v40 == 2)
            {
              uint64_t v42 = (unsigned int *)&unk_100019A70;
            }
            else
            {
              uint64_t v42 = (unsigned int *)&unk_100019B88;
            }
            int v41 = sub_100010834(a1, (uint64_t)v21, v42, v24, v25, v26, v27, v28);
LABEL_72:
            if (!v21[6])
            {
              *(unsigned char *)(a1 + 1456) = 1;
              *(void *)(a1 + 1464) = "access now enabled";
              if (*(_DWORD *)(a1 + 88) == 2)
              {
                if (v21[8]) {
                  sub_10000F4E0(a1, 7, 0, 0, v35, v36, v37, v38);
                }
                CFStringRef v65 = (const __CFString *)v21[3];
                if (v65 && CFStringCompare(v65, @"recover", 0)) {
                  sub_10000F4E0(a1, 2, 1, 0, v35, v36, v37, v38);
                }
                if (v21[4]) {
                  sub_10000F4E0(a1, 3, 1, 0, v35, v36, v37, v38);
                }
              }
              goto LABEL_105;
            }
            unsigned int v56 = sub_10000F328(a1, (uint64_t)v21, v33, v34, v35, v36, v37, v38);
            if (v56 < 0x22)
            {
              v64 = &dword_100019F38[3 * v56];
            }
            else
            {
              ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid outcome=%d\n", v57, v58, v59, v60, v61, v62, v63, (char)"checkpoint_get_outcome_attributes");
              v64 = dword_100019F38;
            }
            CFStringRef v66 = (const __CFString *)v21[6];
            bzero(v83, 0x400uLL);
            if (*v64 != 1)
            {
              if (*((unsigned char *)v64 + 6))
              {
                if (v21[8])
                {
                  sub_100010B60((unsigned char *)a1, v66, v33, v34, v35, v36, v37, v38, v82);
                }
                else
                {
                  sub_10000F5E4(v66, v83);
                  sub_10000F3A4(a1, v72, "[chassis_aware]outcome=%s(pre_existing_reboot_retry_not_in_zone)", v83);
                }
              }
              *(unsigned char *)(a1 + 1456) = 1;
              *(void *)(a1 + 1464) = "access now enabled";
              goto LABEL_105;
            }
            uint64_t v67 = v21[8];
            if (*((unsigned char *)v64 + 5))
            {
              if (!v67)
              {
                sub_10000F5E4(v66, v83);
                sub_10000F3A4(a1, v68, "[chassis_aware]outcome=%s(pre_existing_reboot_retry_not_in_zone)", v83);
LABEL_105:
                if (v41 && !*(unsigned char *)(a1 + 104)) {
                  sub_10000F3A4(a1, v32, "[chassis_aware]pre-existing NVRAM implied reboot-retry but values were inconsistent");
                }
                goto LABEL_116;
              }
            }
            else if (!v67)
            {
              goto LABEL_105;
            }
            sub_100010B60((unsigned char *)a1, v66, v33, v34, v35, v36, v37, v38, v82);
            goto LABEL_105;
          }
        }
        else
        {
          sub_10001054C(a1, 1u, 0x2Fu, (const __CFString **)(a1 + 1056));
          if (!*(void *)(a1 + 1056))
          {
            *(unsigned char *)(a1 + 2272) = 1;
            goto LABEL_24;
          }
          if (*(_DWORD *)a1 == 2) {
            sub_10000F4E0(a1, 47, 0, 0, a5, a6, a7, a8);
          }
          *(unsigned char *)(a1 + 2273) = 1;
          *(unsigned char *)(a1 + 668) = 0;
          int v13 = (const __CFString **)(a1 + 992);
          uint64_t v14 = -4;
          do
            sub_10001054C(a1, 1u, v14 + 43, v13++);
          while (!__CFADD__(v14++, 1));
          *(unsigned char *)(a1 + 2272) = 1;
        }
      }
      *(_DWORD *)(a1 + 664) = 2;
      if (!v8) {
        sub_10000E6F0(a1, 2, 1, 0, 256, "NVRAM access is not currently available", 0, 0, 0);
      }
      uint64_t v11 = 0;
    }
  }
LABEL_20:
  if (!*(_DWORD *)(a1 + 96)) {
    sub_100010484(a1, v11, a3, a4, a5, a6, a7, a8);
  }
  return v11;
}

void *sub_10000E6F0(uint64_t a1, int a2, int a3, int a4, int a5, const char *a6, int a7, int a8, const void *a9)
{
  int v17 = calloc(1uLL, 0x78uLL);
  if (!v17) {
    return v17;
  }
  v130 = 0;
  asprintf(&v130, "%s", a6);
  if (!v130)
  {
    free(v17);
    return 0;
  }
  *((_DWORD *)v17 + 2) = a2;
  v17[2] = time(0);
  gettimeofday((timeval *)(v17 + 3), 0);
  *((_DWORD *)v17 + 10) = getpid();
  *((_DWORD *)v17 + 11) = getppid();
  *((_DWORD *)v17 + 12) = a3;
  *((_DWORD *)v17 + 13) = a4;
  *((_DWORD *)v17 + 14) = a5;
  v17[8] = v130;
  *((_DWORD *)v17 + 18) = a7;
  *((_DWORD *)v17 + 19) = a8;
  if (a9)
  {
    v17[10] = a9;
    CFRetain(a9);
    a5 = *((_DWORD *)v17 + 14);
  }
  *((_DWORD *)v17 + 22) = a5 | (*((_DWORD *)v17 + 2) << 16) | 0x11000000;
  *(void *)v134 = 0x1500000001;
  v131[0] = 0;
  v131[1] = 0;
  size_t v132 = 16;
  if (sysctl(v134, 2u, v131, &v132, 0, 0)) {
    uint64_t v25 = -1;
  }
  else {
    uint64_t v25 = v17[2] - (unint64_t)v131[0];
  }
  int v26 = *((_DWORD *)v17 + 2);
  switch(v26)
  {
    case 1:
      sub_100010E8C(a1, 10, *((unsigned int *)v17 + 22), (const char *)v17[8], v21, v22, v23, v24);
      goto LABEL_69;
    case 2:
      goto LABEL_69;
    case 3:
      if (!*((_DWORD *)v17 + 18))
      {
        uint64_t v38 = 23;
        if (!*(unsigned char *)(a1 + 104)) {
          uint64_t v38 = 11;
        }
        int v39 = *(_DWORD *)(a1 + 1472) + 1;
        *(_DWORD *)(a1 + 1472) = v39;
        uint64_t v40 = *((unsigned int *)v17 + 22);
        int v41 = *(int **)(a1 + 16 * v38 + 1496);
        if (!v41) {
          goto LABEL_28;
        }
        unint64_t v42 = 0;
        do
        {
          int v44 = *v41;
          v41 += 2;
          int v43 = v44;
          if (v42 > 6) {
            break;
          }
          ++v42;
        }
        while (v43);
        if (!v43)
        {
          *(v41 - 2) = v40;
          *(v41 - 1) = v39;
          *(unsigned char *)(a1 + 16 * v38 + 1492) = 1;
        }
        else
        {
LABEL_28:
          int v45 = *(_DWORD *)(a1 + 1476);
          if (!v45)
          {
            ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", v18, v40, v20, v21, v22, v23, v24, (char)"checkpoint_nvram_store_lost");
            int v45 = *(_DWORD *)(a1 + 1476);
            uint64_t v40 = *((unsigned int *)v17 + 22);
          }
          *(_DWORD *)(a1 + 1476) = v45 + 1;
        }
        sub_100010E8C(a1, 12, v40, (const char *)v17[8], v21, v22, v23, v24);
      }
      goto LABEL_68;
    case 4:
    case 7:
      goto LABEL_15;
    case 5:
      goto LABEL_13;
    case 6:
      sub_100011208(a1, 14, *((unsigned int *)v17 + 22), *((unsigned int *)v17 + 18), (const char *)v17[8], v22, v23, v24);
      goto LABEL_69;
    default:
      if (v26 == 32)
      {
LABEL_15:
        sub_1000110B4(a1, 13, *((_DWORD *)v17 + 14) | 0x11070000u, *((unsigned int *)v17 + 18), *((unsigned int *)v17 + 19), v22, v23, v24);
        uint64_t v28 = (__CFError *)v17[10];
        if (v28)
        {
          CFIndex Code = CFErrorGetCode(v28);
          CFStringRef Domain = CFErrorGetDomain((CFErrorRef)v17[10]);
          int v31 = sub_10000F814((CFErrorRef)v17[10]);
          sub_1000110B4(a1, 15, *((unsigned int *)v17 + 22), *((unsigned int *)v17 + 18), Code, v32, v33, v34);
          if (Domain)
          {
            bzero(buffer, 0x400uLL);
            CFStringGetCString(Domain, (char *)buffer, 1024, 0x8000100u);
            sub_100011208(a1, 16, *((unsigned int *)v17 + 22), *((unsigned int *)v17 + 18), (const char *)buffer, v35, v36, v37);
          }
          if (v31)
          {
            sub_100010E8C(a1, 17, *((unsigned int *)v17 + 22), v31, v21, v22, v23, v24);
            free(v31);
          }
        }
        goto LABEL_68;
      }
      if (v26 != 33) {
        goto LABEL_69;
      }
LABEL_13:
      uint64_t v20 = *((unsigned int *)v17 + 18);
      int v27 = *((_DWORD *)v17 + 14);
      if (v20)
      {
        sub_1000110B4(a1, 13, v27 | 0x11070000u, v20, 0, v22, v23, v24);
        goto LABEL_68;
      }
      uint64_t v46 = 23;
      if (!*(unsigned char *)(a1 + 104)) {
        uint64_t v46 = 11;
      }
      uint64_t v47 = a1 + 16 * v46;
      uint64_t v48 = *(void **)(v47 + 1496);
      if (!v48) {
        goto LABEL_45;
      }
      int v49 = v27 | 0x11030000;
      if (*(_DWORD *)v48 == v49)
      {
        uint64_t v50 = 0;
        void *v48 = 0;
LABEL_37:
        uint64_t v51 = v50;
        do
        {
          v48[v51] = v48[v51 + 1];
          ++v51;
        }
        while (v51 != 7);
        goto LABEL_39;
      }
      uint64_t v52 = v48 + 1;
      unint64_t v53 = -1;
      while (v53 != 6)
      {
        int v54 = *v52;
        v52 += 2;
        ++v53;
        if (v54 == v49)
        {
          *((void *)v52 - 1) = 0;
          if (v53 <= 5)
          {
            uint64_t v50 = v53 + 1;
            goto LABEL_37;
          }
LABEL_39:
          v48[7] = 0;
          *(unsigned char *)(v47 + 1492) = 1;
          goto LABEL_48;
        }
      }
LABEL_45:
      int v55 = *(_DWORD *)(a1 + 1480);
      if (!v55)
      {
        ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on remove [%s]\n", v18, v19, v20, v21, v22, v23, v24, (char)"checkpoint_nvram_remove_lost");
        int v55 = *(_DWORD *)(a1 + 1480);
      }
      *(_DWORD *)(a1 + 1480) = v55 + 1;
LABEL_48:
      uint64_t v56 = 24;
      if (!*(unsigned char *)(a1 + 104)) {
        uint64_t v56 = 12;
      }
      if (((0x1001100uLL >> v56) & 1) == 0) {
        goto LABEL_63;
      }
      uint64_t v57 = a1 + 16 * v56;
      uint64_t v58 = *(void *)(v57 + 1496);
      if (!v58) {
        goto LABEL_63;
      }
      int v59 = *((_DWORD *)v17 + 14) | 0x11030000;
      if (*(_DWORD *)v58 == v59)
      {
        unint64_t v60 = 0;
LABEL_57:
        uint64_t v63 = (void *)(v58 + 16 * v60);
        v64 = (void *)v63[1];
        if (v64) {
          free(v64);
        }
        *uint64_t v63 = 0;
        v63[1] = 0;
        if (v60 <= 6)
        {
          uint64_t v65 = 16 * v60;
          do
          {
            *(_OWORD *)(v58 + v65) = *(_OWORD *)(v58 + v65 + 16);
            v65 += 16;
          }
          while (v65 != 112);
        }
        *(void *)(v58 + 112) = 0;
        *(void *)(v58 + 120) = 0;
        *(unsigned char *)(v57 + 1492) = 1;
      }
      else
      {
        unint64_t v60 = 0;
        uint64_t v61 = (int *)(v58 + 16);
        while (v60 != 7)
        {
          ++v60;
          int v62 = *v61;
          v61 += 4;
          if (v62 == v59) {
            goto LABEL_57;
          }
        }
LABEL_63:
        int v66 = *(_DWORD *)(a1 + 1480);
        if (!v66)
        {
          ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on remove [%s]\n", v18, v19, v20, v21, v22, v23, v24, (char)"checkpoint_nvram_remove_lost");
          int v66 = *(_DWORD *)(a1 + 1480);
        }
        *(_DWORD *)(a1 + 1480) = v66 + 1;
      }
LABEL_68:
      sub_100010FCC(a1, 18, v25, v20, v21, v22, v23, v24);
      sub_100010FCC(a1, 21, (uint64_t)*((double *)v17 + 14), v67, v68, v69, v70, v71);
LABEL_69:
      *int v17 = 0;
      **(void **)(a1 + 192) = v17;
      *(void *)(a1 + 192) = v17;
      unsigned int v72 = *(_DWORD *)(a1 + 200) + 1;
      *(_DWORD *)(a1 + 200) = v72;
      if (v72 >= 0x201)
      {
        uint64_t v73 = (void **)(a1 + 184);
        do
        {
          v74 = *v73;
          v75 = (void *)**v73;
          void *v73 = v75;
          if (!v75) {
            *(void *)(a1 + 192) = v73;
          }
          *(_DWORD *)(a1 + 200) = v72 - 1;
          uint64_t v76 = (void *)v74[8];
          if (v76)
          {
            free(v76);
            v74[8] = 0;
          }
          uint64_t v77 = (const void *)v74[10];
          if (v77) {
            CFRelease(v77);
          }
          free(v74);
          unsigned int v72 = *(_DWORD *)(a1 + 200);
        }
        while (v72 > 0x200);
      }
      memset(buffer, 0, 56);
      v131[0] = 0;
      gmtime_r(v17 + 2, buffer);
      uint64_t v78 = *((unsigned int *)v17 + 2);
      if (v78 > 0x21) {
        v79 = "GENERAL";
      }
      else {
        v79 = off_1000250C8[v78];
      }
      asprintf(v131, "[%02u:%02u:%02u.%04u-GMT]{%u>%u} CHECKPOINT %s", buffer[0].tm_hour, buffer[0].tm_min, buffer[0].tm_sec, *((_DWORD *)v17 + 8) / 1000, *((_DWORD *)v17 + 11), *((_DWORD *)v17 + 10), v79);
      v80 = v131[0];
      *(void *)&buffer[0].tm_sec = 0;
      if (*((_DWORD *)v17 + 19))
      {
        asprintf((char **)buffer, "(FAILURE:%d) ");
      }
      else
      {
        unsigned int v87 = *((_DWORD *)v17 + 2);
        if (v87 <= 0x1C && ((1 << v87) & 0x18000080) != 0) {
          asprintf((char **)buffer, "(SUCCESS) ", v127);
        }
        else {
          asprintf((char **)buffer, " ", v127);
        }
      }
      v88 = *(char **)&buffer[0].tm_sec;
      if (!v80 || !*(void *)&buffer[0].tm_sec) {
        goto LABEL_149;
      }
      *(void *)&buffer[0].tm_sec = 0;
      if (*((_DWORD *)v17 + 14))
      {
        int v89 = *((_DWORD *)v17 + 2);
        if (v89 == 28 || v89 == 1)
        {
          asprintf((char **)buffer, "[0x%04X] %s");
        }
        else if (*((_DWORD *)v17 + 12) == 1)
        {
          asprintf((char **)buffer, "%s");
        }
        else
        {
          asprintf((char **)buffer, "%s:[0x%04X] %s");
        }
        v90 = *(char **)&buffer[0].tm_sec;
      }
      else
      {
        v90 = 0;
      }
      v131[0] = 0;
      int v91 = *((_DWORD *)v17 + 2);
      if (v91 == 28)
      {
        *(void *)&buffer[0].tm_sec = 0;
        if (!*((_DWORD *)v17 + 19))
        {
          asprintf((char **)buffer, "... %s");
          goto LABEL_122;
        }
        v94 = sub_100011410(a1, 9, v81, v82, v83, v84, v85, v86);
        v100 = sub_1000114C0(a1, a1 + 1064, 12, v95, v96, v97, v98, v99);
        v101 = v100;
        uint64_t v102 = *(unsigned int *)(a1 + 108);
        if (v102 > 6) {
          v103 = "GENERAL";
        }
        else {
          v103 = off_1000252C0[v102];
        }
        if (v94)
        {
          if (!v100)
          {
            asprintf((char **)buffer, "[%s] %s", v103, v94);
            v112 = v94;
            goto LABEL_121;
          }
          asprintf((char **)buffer, "[%s] %s %s", v103, v100, v94);
          free(v94);
        }
        else
        {
          if (!v100)
          {
            asprintf((char **)buffer, "[%s]");
LABEL_122:
            v92 = *(char **)&buffer[0].tm_sec;
            if (v90) {
              goto LABEL_106;
            }
            goto LABEL_123;
          }
          asprintf((char **)buffer, "[%s] %s", v103, v100);
        }
        v112 = v101;
LABEL_121:
        free(v112);
        goto LABEL_122;
      }
      if (v91 == 27)
      {
        v92 = sub_100011410(a1, 13, v81, v82, v83, v84, v85, v86);
        int v93 = strcmp(v92, "{}");
        if (v92 && !v93)
        {
          free(v92);
          if (!v90) {
            goto LABEL_125;
          }
LABEL_108:
          asprintf(v131, "%s:%s%s", v80, v88, v90);
          char v111 = 0;
          v92 = 0;
          goto LABEL_127;
        }
      }
      else
      {
        v92 = sub_10000F814((CFErrorRef)v17[10]);
      }
      if (v90)
      {
LABEL_106:
        if (v92)
        {
          asprintf(v131, "%s:%s%s %s", v80, v88, v90, v92);
          char v111 = 0;
          goto LABEL_127;
        }
        goto LABEL_108;
      }
LABEL_123:
      if (v92)
      {
        asprintf(v131, "%s:%s %s", v80, v88, v92);
        goto LABEL_126;
      }
LABEL_125:
      asprintf(v131, "%s:%s", v80, v88);
      v92 = 0;
LABEL_126:
      char v111 = 1;
LABEL_127:
      char v113 = (char)v131[0];
      if (v131[0])
      {
        char v129 = v111;
        if (*((_DWORD *)v17 + 2) == 28)
        {
          if (*(_DWORD *)(a1 + 88) == 2) {
            int v114 = 1;
          }
          else {
            int v114 = 3;
          }
        }
        else
        {
          int v114 = 1;
        }
        while (1)
        {
          ramrod_log_msg("%s\n", v104, v105, v106, v107, v108, v109, v110, v113);
          if (*((_DWORD *)v17 + 2) == 28) {
            ramrod_log_msg("\n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n", v115, v116, v117, v118, v119, v120, v121, v128);
          }
          if (v114 < 2) {
            break;
          }
          --v114;
          sleep(1u);
        }
        v122 = v131[0];
        v123 = calloc(1uLL, 0x10uLL);
        if (v123)
        {
          v124 = v123;
          v123[1] = v122;
          if (*(_DWORD *)a1 == 1)
          {
            void *v123 = 0;
            **(void **)(a1 + 480) = v123;
            *(void *)(a1 + 480) = v123;
          }
          else
          {
            pthread_mutex_lock((pthread_mutex_t *)(a1 + 232));
            int v125 = *(_DWORD *)a1;
            void *v124 = 0;
            **(void **)(a1 + 480) = v124;
            *(void *)(a1 + 480) = v124;
            if (v125 != 1) {
              pthread_mutex_unlock((pthread_mutex_t *)(a1 + 232));
            }
          }
          *(unsigned char *)(a1 + 208) = 1;
          char v111 = v129;
        }
        else if (v122)
        {
          free(v122);
        }
      }
      if ((v111 & 1) == 0) {
        free(v90);
      }
      if (v92) {
        free(v92);
      }
LABEL_149:
      if (v80) {
        free(v80);
      }
      if (v88) {
        free(v88);
      }
      return v17;
  }
}

void sub_10000F1E0(int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a2 + 4))
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): first available indication when already collected\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_collect");
    return;
  }
  int v10 = (const __CFString **)(a2 + 8);
  for (uint64_t i = 1; i != 49; ++i)
  {
    sub_10001054C((uint64_t)a1, *(_DWORD *)a2, i - 1, v10);
    int v16 = *a1;
    if ((i - 40) <= 3 && v16 == 2)
    {
      if (*(void *)(a2 + 8 * i)) {
        goto LABEL_12;
      }
    }
    else if ((i - 44) <= 3 && v16 == 2)
    {
      CFStringRef v17 = *(const __CFString **)(a2 + 8 * i);
      if (v17)
      {
        bzero(v23, 0x400uLL);
        sub_10000F5E4(v17, v23);
        sub_10000F630((uint64_t)a1, (i - 5), v23, v18, v19, v20, v21, v22);
LABEL_12:
        sub_10000F4E0((uint64_t)a1, i - 1, 0, 0, v12, v13, v14, v15);
      }
    }
    ++v10;
  }
  *(unsigned char *)(a2 + 4) = 1;
}

uint64_t sub_10000F328(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = sub_1000114C0(a1, a2, 5, a4, a5, a6, a7, a8);
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  unint64_t v10 = 0;
  do
  {
    if (!strcmp(v9, off_1000252F8[v10])) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 0;
    }
    if (v11) {
      break;
    }
  }
  while (v10++ < 0x21);
  free(v9);
  return v11;
}

void sub_10000F3A4(uint64_t a1, uint64_t a2, char *a3, ...)
{
  va_start(va, a3);
  v8[0] = 0;
  va_copy((va_list)&v8[1], va);
  vasprintf(v8, a3, va);
  if (v8[0])
  {
    sub_10000E6F0(a1, 30, 1, 0, 260, v8[0], 0, 0, 0);
    sub_100010E8C(a1, 8, *(unsigned int *)(a1 + 120), v8[0], v4, v5, v6, v7);
    if (v8[0])
    {
      free(v8[0]);
      v8[0] = 0;
    }
  }
  ++*(_DWORD *)(a1 + 120);
}

void sub_10000F444(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned int *)(a1 + 96);
  uint64_t v9 = (uint64_t)*(&off_100025408 + v8);
  if (*(_DWORD *)(v9 + 4 * a2))
  {
    *(_DWORD *)(a1 + 92) = v8;
    uint64_t v12 = *(unsigned int *)(v9 + 4 * a2);
    *(_DWORD *)(a1 + 96) = v12;
    if (v12 > 0x21) {
      uint64_t v13 = "unknown";
    }
    else {
      uint64_t v13 = off_1000252F8[v12];
    }
    sub_10000F630(a1, 5, v13, a4, a5, a6, a7, a8);
    sub_100010D0C(a1, a2);
  }
}

void sub_10000F4E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 < 0x30)
  {
    uint64_t v9 = &off_100024A40[4 * a2];
    if (a3 || (*((_DWORD *)v9 + 6) - 5) < 0xFFFFFFFD)
    {
      bzero(buffer, 0x400uLL);
      if (*(_DWORD *)(a1 + 88) == 1) {
        unint64_t v10 = (CFStringRef *)v9;
      }
      else {
        unint64_t v10 = (CFStringRef *)(v9 + 1);
      }
      CFStringRef v11 = *v10;
      CFStringGetCString(*v10, buffer, 1024, 0x8000100u);
      sub_100010C48(v11);
    }
    else
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid delete of BOOT-CONTROL NVRAM ID %u\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_delete_var");
    }
  }
  else
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid delete of NVRAM ID %u\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_delete_var");
  }
}

char *sub_10000F5E4(const __CFString *a1, char *a2)
{
  if (a1) {
    CFStringGetCString(a1, a2, 1024, 0x8000100u);
  }
  else {
    bzero(a2, 0x400uLL);
  }
  return a2;
}

void sub_10000F630(uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      uint64_t v10 = 0;
      goto LABEL_7;
    }
    a2 = LODWORD(off_100024A40[4 * a2 + 2]);
  }
  if (a2 > 0x2F) {
    goto LABEL_12;
  }
  uint64_t v10 = a2;
LABEL_7:
  if ((0xFFFC000000FEuLL >> v10))
  {
    CFStringRef v11 = *(void ***)(a1 + 16 * v10 + 1496);
    if (v11)
    {
      if (*v11)
      {
        free(*v11);
        *CFStringRef v11 = 0;
      }
      sub_100011368(a1 + 1456, (char **)v11, a3, a4, a5, a6, a7, a8);
      *(unsigned char *)(a1 + 16 * v10 + 1492) = 1;
      return;
    }
  }
LABEL_12:
  int v12 = *(_DWORD *)(a1 + 1476);
  if (!v12)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
    int v12 = *(_DWORD *)(a1 + 1476);
  }
  *(_DWORD *)(a1 + 1476) = v12 + 1;
}

void sub_10000F74C(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (*a1 != 1)
    {
      uint64_t v8 = (pthread_mutex_t *)(a1 + 2);
      pthread_mutex_lock(v8);
    }
  }
  else
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): checkpoint context not initialized\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_access_obtain");
  }
}

void sub_10000F7B0(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if (*a1 != 1)
    {
      uint64_t v8 = (pthread_mutex_t *)(a1 + 2);
      pthread_mutex_unlock(v8);
    }
  }
  else
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): checkpoint context not initialized\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_access_yield");
  }
}

char *sub_10000F814(CFErrorRef err)
{
  if (!err) {
    return 0;
  }
  CFStringRef v1 = err;
  CFStringRef v2 = 0;
  unsigned int v3 = 0;
  do
  {
    CFDictionaryRef v4 = CFErrorCopyUserInfo(v1);
    CFStringRef v2 = sub_1000102F4(v2, "[%d]", v5, v6, v7, v8, v9, v10, v3);
    if (!v4) {
      break;
    }
    char v22 = 0;
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorLocalizedRecoverySuggestionKey);
    int v12 = sub_1000115B8(v2, (char)"RS", Value, &v22);
    CFStringRef v13 = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorLocalizedDescriptionKey);
    uint64_t v14 = sub_1000115B8(v12, (char)"LD", v13, &v22);
    CFStringRef v15 = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorDescriptionKey);
    int v16 = sub_1000115B8(v14, (char)"D", v15, &v22);
    CFStringRef v17 = (const __CFString *)CFDictionaryGetValue(v4, kCFErrorLocalizedFailureReasonKey);
    CFStringRef v2 = sub_1000115B8(v16, (char)"FR", v17, &v22);
    CFStringRef v1 = (__CFError *)CFDictionaryGetValue(v4, kCFErrorUnderlyingErrorKey);
    CFRelease(v4);
    if (!v1) {
      break;
    }
  }
  while (v3++ < 0xF);
  size_t v19 = strlen(v2);
  if (v19 >= 0xF3)
  {
    uint64_t v21 = 0;
    asprintf(&v21, "%s", &v2[v19 - 242]);
    if (v2) {
      free(v2);
    }
    return v21;
  }
  return v2;
}

uint64_t checkpoint_closure_context_get_step_desc(uint64_t result)
{
  if (result) {
    return *(void *)result;
  }
  return result;
}

uint64_t checkpoint_closure_context_should_retry(uint64_t result)
{
  if (result)
  {
    int v1 = *(_DWORD *)(result + 40);
    *(_DWORD *)(result + 40) = v1 + 1;
    return !*(unsigned char *)(result + 11) && v1 < *(_DWORD *)(*(void *)result + 28);
  }
  return result;
}

uint64_t checkpoint_closure_context_handle_simulator_actions(uint64_t *a1, uint64_t a2, int *a3, const void **a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): closure context is NULL\n", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)"checkpoint_closure_context_handle_simulator_actions");
    return a2;
  }
  if (!qword_10002E5F8)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): %s called too early, checkpoint_chassis_context == NULL\n", a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)"checkpoint_closure_context_handle_simulator_actions");
    return a2;
  }
  uint64_t v9 = *a1;
  uint64_t v10 = qword_10002E5F8;

  return sub_10000FAD4(v10, v9, a2, a3, a4, a6, a7, a8);
}

uint64_t sub_10000FAD4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, const void **a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = a3;
  unsigned int v13 = a3;
  sub_10000F74C((_DWORD *)a1, a2, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
  sub_10001168C(a1, v14, v15, v16, v17, v18, v19, v20);
  if (!*(_DWORD *)(a1 + 2276) || !*(void *)(a1 + 2288)) {
    goto LABEL_14;
  }
  CFStringRef v28 = CFStringCreateWithCString(kCFAllocatorDefault, *(const char **)(a2 + 8), 0x8000100u);
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 2288));
  if (Count < 1)
  {
    BOOL v36 = 0;
    if (!v28) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  CFIndex v30 = Count;
  CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), 0);
  if (CFEqual(v28, ValueAtIndex))
  {
    BOOL v36 = 1;
    if (!v28) {
      goto LABEL_10;
    }
LABEL_9:
    CFRelease(v28);
    goto LABEL_10;
  }
  CFIndex v32 = 1;
  do
  {
    CFIndex v33 = v32;
    if (v30 == v32) {
      break;
    }
    CFStringRef v34 = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), v32);
    CFComparisonResult v35 = CFStringCompare(v28, v34, 0);
    CFIndex v32 = v33 + 1;
  }
  while (v35);
  BOOL v36 = v33 < v30;
  if (v28) {
    goto LABEL_9;
  }
LABEL_10:
  if (!v36)
  {
LABEL_14:
    sub_10000F7B0((_DWORD *)a1, v21, v22, v23, v24, v25, v26, v27);
    BOOL v38 = 0;
    goto LABEL_15;
  }
  int v37 = *(_DWORD *)(a1 + 2284);
  if (v37)
  {
    if (!v13) {
      *(_DWORD *)(a1 + 2284) = v37 - 1;
    }
    goto LABEL_14;
  }
  if (v13) {
    sub_10000E6F0(a1, *(_DWORD *)(a1 + 2276), 1, 0, *(_DWORD *)a2, *(const char **)(a2 + 8), *(_DWORD *)(a1 + 2280), *a4, *a5);
  }
  sub_10000F7B0((_DWORD *)a1, v21, v22, v23, v24, v25, v26, v27);
  BOOL v38 = 0;
  int v47 = 0;
  switch(*(_DWORD *)(a1 + 2276))
  {
    case 9:
      goto LABEL_80;
    case 0xA:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        *a4 = 181;
        ramrod_create_error_cf((CFErrorRef *)a5, @"CheckpointErrorDomain", 181, 0, @"checkpoint simulator error", v44, v45, v46, v92);
      }
      goto LABEL_76;
    case 0xB:
      if (*(unsigned __int8 *)(a1 + 2275) == v10) {
        abort();
      }
      goto LABEL_76;
    case 0xC:
      if (*(unsigned __int8 *)(a1 + 2275) == v10) {
        exit(182);
      }
      goto LABEL_76;
    case 0xD:
      if (*(unsigned __int8 *)(a1 + 2275) == v10) {
        _exit(183);
      }
      goto LABEL_76;
    case 0xE:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        for (uint64_t i = 0; ; i += 4)
          ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): simulator signal executing after dereference of %p [%d]\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
      }
      goto LABEL_76;
    case 0xF:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        while (1)
          ;
      }
      goto LABEL_76;
    case 0x10:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        memset(&v94, 0, sizeof(v94));
        v93.__sig = 0;
        *(void *)v93.__opaque = 0;
        pthread_mutexattr_init(&v93);
        pthread_mutex_init(&v94, &v93);
        pthread_mutex_lock(&v94);
        pthread_mutex_lock(&v94);
      }
      goto LABEL_76;
    case 0x11:
      if (*(unsigned __int8 *)(a1 + 2275) != v10) {
        goto LABEL_76;
      }
      mach_port_t v49 = mach_host_self();
      int v50 = 0;
      goto LABEL_45;
    case 0x12:
      if (*(unsigned __int8 *)(a1 + 2275) != v10) {
        goto LABEL_76;
      }
      mach_port_t v49 = mach_host_self();
      int v50 = 4096;
LABEL_45:
      host_reboot(v49, v50);
LABEL_76:
      BOOL v38 = 0;
      goto LABEL_77;
    case 0x13:
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): simulator PAUSE not supported\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
      goto LABEL_76;
    case 0x14:
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): simulator RESUME not supported\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
      goto LABEL_76;
    case 0x15:
      if (*(unsigned __int8 *)(a1 + 2275) != v10) {
        goto LABEL_76;
      }
      __break(1u);
LABEL_50:
      BOOL v38 = v10 == 0;
LABEL_77:
      int v47 = v13;
LABEL_78:
      if (!v13) {
        goto LABEL_80;
      }
      unsigned int v13 = v47;
      if (!v47) {
        goto LABEL_80;
      }
      goto LABEL_15;
    case 0x16:
      goto LABEL_50;
    case 0x17:
      BOOL v38 = 0;
      int v51 = *(unsigned __int8 *)(a1 + 2275);
      if (v51 == v10) {
        int v47 = 0;
      }
      else {
        int v47 = v10;
      }
      if (v13 || v51 != v10) {
        goto LABEL_78;
      }
      if (!*a4)
      {
        ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): checkpoint simulator to ignore error on step %s, but step was successful\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
        goto LABEL_70;
      }
      ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): checkpoint simulator ignoring error on step %s result: %d\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
      *a4 = 0;
      if (!*a5)
      {
LABEL_70:
        BOOL v38 = 0;
        int v47 = 0;
        goto LABEL_80;
      }
      uint64_t v52 = sub_10000F814((CFErrorRef)*a5);
      if (v52)
      {
        unint64_t v60 = v52;
        ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): checkpoint simulator ignoring error on step %s error: %s\n", v53, v54, v55, v56, v57, v58, v59, (char)"checkpoint_simulator_action");
        free(v60);
      }
      CFRelease(*a5);
      BOOL v38 = 0;
      int v47 = 0;
      *a5 = 0;
LABEL_80:
      int v90 = *(_DWORD *)(a1 + 2280);
      if (v90)
      {
        int v91 = v90 - 1;
        *(_DWORD *)(a1 + 2280) = v91;
        if (!v91) {
          *(_DWORD *)(a1 + 2276) = 0;
        }
      }
      unsigned int v13 = v47;
LABEL_15:
      if (v10) {
        return v13;
      }
      else {
        return v38;
      }
    case 0x18:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        sub_1000118A8();
        ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): returned from checkpoint jetsam attempt; continuing engine\n",
          v61,
          v62,
          v63,
          v64,
          v65,
          v66,
          v67,
          (char)"checkpoint_simulator_action");
      }
      goto LABEL_76;
    case 0x19:
      if (*(unsigned __int8 *)(a1 + 2275) == v10)
      {
        int v68 = fork();
        if (v68 < 1)
        {
          if (!v68)
          {
            sub_1000118A8();
            exit(0);
          }
          __error();
          ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): error %d attempting to fork jetsam child\n", v76, v77, v78, v79, v80, v81, v82, (char)"checkpoint_simulator_action");
        }
        else
        {
          LODWORD(v94.__sig) = 0;
          if (waitpid(v68, (int *)&v94, 0) < 0)
          {
            __error();
            ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): error %d waiting for jetsam child\n", v83, v84, v85, v86, v87, v88, v89, (char)"checkpoint_simulator_action");
          }
          else if ((v94.__sig & 0x7F) == 0x7F)
          {
            ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): unexpected status of jetsam child: %d\n", v69, v70, v71, v72, v73, v74, v75, (char)"checkpoint_simulator_action");
          }
          else if ((v94.__sig & 0x7F) != 0)
          {
            ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): jetsam child signalled: %d\n", v69, v70, v71, v72, v73, v74, v75, (char)"checkpoint_simulator_action");
          }
          else
          {
            ramrod_log_msg("CHECKPOINT_SIMULATOR_NOTICE(%s): jetsam child exited: %d\n", v69, v70, v71, v72, v73, v74, v75, (char)"checkpoint_simulator_action");
          }
        }
      }
      goto LABEL_76;
    default:
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): unknown simulator command ignored\n", v40, v41, v42, v43, v44, v45, v46, (char)"checkpoint_simulator_action");
      BOOL v38 = 0;
      int v47 = 1;
      goto LABEL_78;
  }
}

uint64_t checkpoint_closure_context_handle_simulator_match_name(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): closure context is NULL\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_closure_context_handle_simulator_match_name");
    return 0;
  }
  if (!qword_10002E5F8)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): %s called too early, checkpoint_chassis_context == NULL\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_closure_context_handle_simulator_match_name");
    return 0;
  }
  uint64_t v8 = *a1;
  uint64_t v9 = qword_10002E5F8;

  return sub_10001012C(v9, v8, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_10001012C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F74C((_DWORD *)a1, a2, a3, a4, a5, a6, a7, a8);
  sub_10001168C(a1, v10, v11, v12, v13, v14, v15, v16);
  if (*(_DWORD *)(a1 + 2276))
  {
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 2288));
    CFStringRef v32 = CFStringCreateWithCString(kCFAllocatorDefault, *(const char **)(a2 + 8), 0x8000100u);
    if (Count < 1)
    {
LABEL_6:
      uint64_t v35 = 0;
    }
    else
    {
      CFIndex v33 = 0;
      while (1)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), v33);
        if (CFEqual(v32, ValueAtIndex)) {
          break;
        }
        if (Count == ++v33) {
          goto LABEL_6;
        }
      }
      uint64_t v35 = 1;
    }
    sub_10000F7B0((_DWORD *)a1, v25, v26, v27, v28, v29, v30, v31);
    if (v32) {
      CFRelease(v32);
    }
  }
  else
  {
    sub_10000F7B0((_DWORD *)a1, v17, v18, v19, v20, v21, v22, v23);
    return 0;
  }
  return v35;
}

char *sub_100010204(char *a1, const char *a2, const char *a3, int *a4)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  asprintf(&v12, "%s:%s", a2, a3);
  uint64_t v6 = v12;
  if (!v12) {
    return a1;
  }
  if (!a1) {
    return v12;
  }
  size_t v7 = strlen(a1);
  size_t v8 = strlen(v12);
  uint64_t v9 = 1;
  if (*a4 > 0) {
    uint64_t v9 = 2;
  }
  if (v8 + v7 + v9 >= 0x81)
  {
    uint64_t v11 = a1;
LABEL_13:
    free(v6);
    return v11;
  }
  if (*a4 <= 0) {
    asprintf(&v11, "%s%s");
  }
  else {
    asprintf(&v11, "%s;%s");
  }
  ++*a4;
  free(a1);
  uint64_t v6 = v12;
  if (v12) {
    goto LABEL_13;
  }
  return v11;
}

char *sub_1000102F4(char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11 = 0;
  v12[0] = 0;
  v12[1] = &a9;
  vasprintf(v12, a2, &a9);
  if (!v12[0]) {
    return a1;
  }
  if (!a1) {
    return v12[0];
  }
  asprintf(&v11, "%s%s", a1, v12[0]);
  if (v11) {
    free(a1);
  }
  else {
    uint64_t v11 = a1;
  }
  if (v12[0])
  {
    free(v12[0]);
    v12[0] = 0;
  }
  return v11;
}

char *sub_100010394(char *a1, int a2, const char *a3, int *a4)
{
  size_t v8 = 0;
  asprintf(&v8, "0x%08X", a2);
  if (v8)
  {
    a1 = sub_100010204(a1, v8, a3, a4);
    if (v8) {
      free(v8);
    }
  }
  return a1;
}

char *sub_10001040C(char *a1, int a2, const char *a3, int *a4)
{
  size_t v8 = 0;
  asprintf(&v8, "%d", a2);
  if (v8)
  {
    a1 = sub_100010204(a1, v8, a3, a4);
    if (v8) {
      free(v8);
    }
  }
  return a1;
}

void sub_100010484(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)a1 == 1)
  {
    if (a2)
    {
      if (*(unsigned char *)(a1 + 104))
      {
        int v9 = 17;
        goto LABEL_14;
      }
      BOOL v10 = *(unsigned char *)(a1 + 101) == 0;
      int v9 = 5;
    }
    else
    {
      BOOL v10 = *(_DWORD *)(a1 + 88) == 2;
      int v9 = 1;
    }
  }
  else if (a2)
  {
    if (*(unsigned char *)(a1 + 104))
    {
      int v9 = 19;
      goto LABEL_14;
    }
    BOOL v10 = *(unsigned char *)(a1 + 101) == 0;
    int v9 = 7;
  }
  else
  {
    BOOL v10 = *(_DWORD *)(a1 + 88) == 2;
    int v9 = 3;
  }
  if (!v10) {
    ++v9;
  }
LABEL_14:
  *(_DWORD *)(a1 + 96) = v9;
  sub_10000F630(a1, 5, off_1000252F8[v9], a4, a5, a6, a7, a8);

  sub_100010D0C(a1, 1);
}

void sub_10001054C(uint64_t a1, unsigned int a2, unsigned int a3, const __CFString **a4)
{
  CFTypeRef cf = 0;
  bzero(buffer, 0x400uLL);
  bzero(v46, 0x400uLL);
  if (a3 < 0x30)
  {
    if (*(_DWORD *)(a1 + 88) == 1) {
      uint64_t v16 = &off_100024A40[4 * a3];
    }
    else {
      uint64_t v16 = &off_100024A40[4 * a3 + 1];
    }
    CFStringGetCString(*v16, buffer, 1024, 0x8000100u);
    CFStringRef v17 = (const __CFString *)ramrod_copy_NVRAM_variable();
    if (!v17) {
      return;
    }
    CFStringRef v15 = v17;
    CFTypeID v18 = CFGetTypeID(v17);
    if (v18 == CFStringGetTypeID())
    {
      CFStringGetCString(v15, v46, 1024, 0x8000100u);
      *a4 = v15;
      CFStringRef v15 = 0;
      goto LABEL_22;
    }
    if (v18 == CFNumberGetTypeID())
    {
      LODWORD(valuePtr) = 0;
      if (!CFNumberGetValue((CFNumberRef)v15, kCFNumberIntType, &valuePtr))
      {
        uint64_t v27 = "CHECKPOINT_INTERNAL_ERROR(%s): number that is not an int %s\n";
        goto LABEL_29;
      }
      CFStringRef v26 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", valuePtr);
      if (!v26)
      {
        uint64_t v27 = "CHECKPOINT_INTERNAL_ERROR(%s): failed to get valid number for %s\n";
LABEL_29:
        ramrod_log_msg(v27, v19, v20, v21, v22, v23, v24, v25, (char)"checkpoint_nvram_collect_var");
        goto LABEL_3;
      }
    }
    else
    {
      if (v18 != CFDataGetTypeID())
      {
        ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): unsupported nvram variable type for %s\n", v28, v29, v30, v31, v32, v33, v34, (char)"checkpoint_nvram_collect_var");
        goto LABEL_3;
      }
      CFStringRef v26 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, (CFDataRef)v15, 0x8000100u);
      if (!v26)
      {
        ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): failed to get string from data %s\n", v35, v36, v37, v38, v39, v40, v41, (char)"checkpoint_nvram_collect_var");
        goto LABEL_3;
      }
    }
    CFStringRef v42 = v26;
    CFStringGetCString(v26, v46, 1024, 0x8000100u);
    *a4 = v42;
LABEL_22:
    int valuePtr = 0;
    if (a2 > 2) {
      uint64_t v43 = "Unknown";
    }
    else {
      uint64_t v43 = off_100025040[a2];
    }
    asprintf(&valuePtr, "%s NVRAM variable: %s=%s", v43, buffer, v46);
    if (valuePtr)
    {
      sub_10000E6F0(a1, 2, 1, 0, 257, valuePtr, 0, 0, 0);
      free(valuePtr);
    }
    goto LABEL_3;
  }
  ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable id=%u\n", v8, v9, v10, v11, v12, v13, v14, (char)"checkpoint_nvram_collect_var");
  CFStringRef v15 = 0;
LABEL_3:
  if (cf) {
    CFRelease(cf);
  }
  if (v15) {
    CFRelease(v15);
  }
}

uint64_t sub_100010834(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  memset(v38, 0, sizeof(v38));
  unsigned int v10 = *a3;
  if (*a3)
  {
    unsigned __int8 v11 = 0;
    char v12 = 0;
    uint64_t v13 = a3 + 2;
    do
    {
      uint64_t v14 = v10;
      *((unsigned char *)v38 + v10) = 1;
      if (*(void *)(a2 + 8 * v10 + 8))
      {
        if (*((unsigned char *)v13 - 3)) {
          unsigned __int8 v11 = 1;
        }
        if (*((unsigned char *)v13 - 2)) {
          char v12 = 1;
        }
        if (*((unsigned char *)v13 - 1))
        {
          uint64_t v15 = v10 <= 0x2F && (LODWORD(off_100024A40[4 * v10 + 3]) - 2) < 3;
          sub_10000F4E0(a1, v10, v15, 1, a5, a6, a7, a8);
        }
      }
      else if (*((unsigned char *)v13 - 4))
      {
        bzero(buffer, 0x400uLL);
        sub_100010AD4(a1, v14, buffer, v16, v17, v18, v19, v20);
        sub_10000F3A4(a1, v21, "[check_collection]%s(does_not_exist)", buffer);
      }
      unsigned int v22 = *v13;
      v13 += 2;
      unsigned int v10 = v22;
    }
    while (v22);
  }
  else
  {
    char v12 = 0;
    unsigned __int8 v11 = 0;
  }
  uint64_t v23 = 0;
  uint64_t v24 = a2 + 16;
  do
  {
    if (!*((unsigned char *)v38 + v23 + 1) && *(void *)(v24 + 8 * v23))
    {
      bzero(buffer, 0x400uLL);
      bzero(v36, 0x400uLL);
      sub_100010AD4(a1, (v23 + 1), buffer, v25, v26, v27, v28, v29);
      sub_10000F5E4(*(const __CFString **)(v24 + 8 * v23), v36);
      sub_10000F3A4(a1, v30, "[check_collection]%s=%s(exists_when_not_expected)", buffer, v36);
      sub_10000F4E0(a1, (v23 + 1), 0, 1, v31, v32, v33, v34);
    }
    ++v23;
  }
  while (v23 != 47);
  if (v12) {
    sub_10000E6F0(a1, 2, 1, 0, 262, "Old restore failure indication(s)", 0, 0, 0);
  }
  return v11;
}

void sub_100010A6C(uint64_t a1, uint64_t a2)
{
  CFStringRef v3 = *(const __CFString **)(a2 + 24);
  if (v3 && CFEqual(v3, @"upgrade"))
  {
    sub_10000F4E0(a1, 2, 1, 0, v4, v5, v6, v7);
  }
}

char *sub_100010AD4(uint64_t a1, uint64_t a2, char *buffer, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 >= 0x30)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, (uint64_t)buffer, a4, a5, a6, a7, a8, (char)"checkpoint_get_nvram_name");
    LODWORD(a2) = 0;
  }
  if (*(_DWORD *)(a1 + 88) == 1) {
    unsigned int v10 = &off_100024A40[4 * a2];
  }
  else {
    unsigned int v10 = &off_100024A40[4 * a2 + 1];
  }
  CFStringGetCString(*v10, buffer, 1024, 0x8000100u);
  return buffer;
}

void sub_100010B60(unsigned char *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1[100])
  {
    a1[104] = 1;
    a1[101] = 1;
    ramrod_log_msg("AP nonce will not be touched\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    bzero(v12, 0x400uLL);
    sub_10000F5E4(a2, v12);
    sub_10000F3A4((uint64_t)a1, v11, "[reboot_retry_chassis]outcome=%s(pre_existing_reboot_retry_disabled)", v12);
  }
}

void sub_100010C48(const __CFString *a1)
{
  bzero(buffer, 0x400uLL);
  CFStringGetCString(a1, buffer, 1024, 0x8000100u);
  ramrod_delete_NVRAM_variable();
}

void sub_100010D0C(uint64_t a1, int a2)
{
  uint64_t v7 = 0;
  uint64_t v3 = *(unsigned int *)(a1 + 92);
  if (v3 > 0x21) {
    uint64_t v4 = "unknown";
  }
  else {
    uint64_t v4 = off_1000252F8[v3];
  }
  uint64_t v5 = *(unsigned int *)(a1 + 96);
  if (v5 > 0x21) {
    uint64_t v6 = "unknown";
  }
  else {
    uint64_t v6 = off_1000252F8[v5];
  }
  asprintf(&v7, "%s (%s) -> (%s)", off_100025058[a2], v4, v6);
  if (v7)
  {
    sub_10000E6F0(a1, 29, 1, 0, 260, v7, 0, 0, 0);
    if (v7) {
      free(v7);
    }
  }
}

uint64_t sub_100010DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      LODWORD(a2) = 0;
      goto LABEL_7;
    }
    LODWORD(a2) = off_100024A40[4 * a2 + 2];
  }
  if (a2 >= 0x30)
  {
    uint64_t v9 = 0;
    uint64_t v10 = a2;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v10 = a2;
  uint64_t v9 = HIDWORD(off_100024A40[4 * a2 + 2]);
LABEL_8:
  uint64_t v11 = checkpoint_nvram_encoder[v9];
  uint64_t v12 = *(void *)(a1 + 16 * v10 + 1496);

  return ((uint64_t (*)(uint64_t, uint64_t))v11)(a1, v12);
}

void sub_100010E8C(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = a3;
  if (*(unsigned char *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, (uint64_t)a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      uint64_t v11 = 0;
      goto LABEL_7;
    }
    a2 = LODWORD(off_100024A40[4 * a2 + 2]);
  }
  if (a2 > 0x2F) {
    goto LABEL_18;
  }
  uint64_t v11 = a2;
LABEL_7:
  if ((0x20420400uLL >> v11))
  {
    a2 = *(void *)(a1 + 16 * v11 + 1496);
    if (a2) {
      goto LABEL_21;
    }
  }
  if ((0x1001100uLL >> v11))
  {
    uint64_t v12 = *(void *)(a1 + 16 * v11 + 1496);
    if (v12)
    {
      unint64_t v13 = 0;
      a2 = v12 - 16;
      do
      {
        int v15 = *(_DWORD *)(a2 + 16);
        a2 += 16;
        int v14 = v15;
        if (v15) {
          BOOL v16 = v13 >= 7;
        }
        else {
          BOOL v16 = 1;
        }
        ++v13;
      }
      while (!v16);
      if (!v14)
      {
LABEL_21:
        *(_DWORD *)a2 = v9;
        sub_100011368(a1 + 1456, (char **)(a2 + 8), a4, (uint64_t)a4, a5, a6, a7, a8);
        *(unsigned char *)(a1 + 16 * v11 + 1492) = 1;
        return;
      }
    }
  }
LABEL_18:
  int v17 = *(_DWORD *)(a1 + 1476);
  if (!v17)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", a2, a3, (uint64_t)a4, a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
    int v17 = *(_DWORD *)(a1 + 1476);
  }
  *(_DWORD *)(a1 + 1476) = v17 + 1;
}

void sub_100010FCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      uint64_t v10 = 0;
      goto LABEL_7;
    }
    a2 = LODWORD(off_100024A40[4 * a2 + 2]);
  }
  if (a2 > 0x2F) {
    goto LABEL_10;
  }
  uint64_t v10 = a2;
LABEL_7:
  if ((0x3C03C0000uLL >> v10))
  {
    uint64_t v11 = a1 + 16 * v10;
    uint64_t v12 = *(uint64_t **)(v11 + 1496);
    if (v12)
    {
      *uint64_t v12 = a3;
      *(unsigned char *)(v11 + 1492) = 1;
      return;
    }
  }
LABEL_10:
  int v13 = *(_DWORD *)(a1 + 1476);
  if (!v13)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
    int v13 = *(_DWORD *)(a1 + 1476);
  }
  *(_DWORD *)(a1 + 1476) = v13 + 1;
}

void sub_1000110B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a5;
  int v9 = a4;
  int v10 = a3;
  if (*(unsigned char *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      uint64_t v12 = 0;
      goto LABEL_7;
    }
    a2 = LODWORD(off_100024A40[4 * a2 + 2]);
  }
  if (a2 > 0x2F) {
    goto LABEL_8;
  }
  uint64_t v12 = a2;
LABEL_7:
  if (((0xA00A000uLL >> v12) & 1) != 0 && v9 <= 7)
  {
    int v14 = *(_DWORD **)(a1 + 16 * v12 + 1496);
    if (v14)
    {
      unint64_t v15 = 0;
      BOOL v16 = 0;
      int v17 = *(_DWORD **)(a1 + 16 * v12 + 1496);
      do
      {
        int v19 = *v17;
        v17 += 11;
        int v18 = v19;
        if (v19) {
          BOOL v20 = 1;
        }
        else {
          BOOL v20 = v10 == 0;
        }
        if (!v20) {
          BOOL v16 = v14;
        }
        BOOL v21 = v18 == v10 || v15++ >= 7;
        int v14 = v17;
      }
      while (!v21);
      if (v18 == v10) {
        BOOL v16 = v17 - 11;
      }
      if (v16)
      {
        _DWORD *v16 = v10;
        v16[v9 + 1] = v8;
        *((unsigned char *)v16 + v9 + 36) = 1;
        *(unsigned char *)(a1 + 16 * v12 + 1492) = 1;
        return;
      }
    }
  }
LABEL_8:
  int v13 = *(_DWORD *)(a1 + 1476);
  if (!v13)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
    int v13 = *(_DWORD *)(a1 + 1476);
  }
  *(_DWORD *)(a1 + 1476) = v13 + 1;
}

void sub_100011208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = a4;
  int v10 = a3;
  if (*(unsigned char *)(a1 + 104))
  {
    if (a2 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, a4, (uint64_t)a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      uint64_t v12 = 0;
      goto LABEL_7;
    }
    a2 = LODWORD(off_100024A40[4 * a2 + 2]);
  }
  if (a2 > 0x2F) {
    goto LABEL_8;
  }
  uint64_t v12 = a2;
LABEL_7:
  if (((0x14014000uLL >> v12) & 1) != 0 && v9 <= 7)
  {
    int v14 = *(_DWORD **)(a1 + 16 * v12 + 1496);
    if (v14)
    {
      unint64_t v15 = 0;
      BOOL v16 = 0;
      int v17 = *(_DWORD **)(a1 + 16 * v12 + 1496);
      do
      {
        int v19 = *v17;
        v17 += 18;
        int v18 = v19;
        if (v19) {
          BOOL v20 = 1;
        }
        else {
          BOOL v20 = v10 == 0;
        }
        if (!v20) {
          BOOL v16 = v14;
        }
        BOOL v21 = v18 == v10 || v15++ >= 7;
        int v14 = v17;
      }
      while (!v21);
      if (v18 == v10) {
        BOOL v16 = v17 - 18;
      }
      if (v16)
      {
        _DWORD *v16 = v10;
        sub_100011368(a1 + 1456, (char **)&v16[2 * v9 + 2], a5, a4, (uint64_t)a5, a6, a7, a8);
        *(unsigned char *)(a1 + 16 * v12 + 1492) = 1;
        return;
      }
    }
  }
LABEL_8:
  int v13 = *(_DWORD *)(a1 + 1476);
  if (!v13)
  {
    ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", a2, a3, a4, (uint64_t)a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
    int v13 = *(_DWORD *)(a1 + 1476);
  }
  *(_DWORD *)(a1 + 1476) = v13 + 1;
}

void sub_100011368(uint64_t a1, char **a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    if (*a2)
    {
      free(*a2);
      *a2 = 0;
    }
    if (a3) {
      asprintf(a2, "%s", a3);
    }
  }
  else
  {
    int v11 = *(_DWORD *)(a1 + 20);
    if (!v11)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): {%s} tracking information lost on store [%s]\n", 0, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_store_lost");
      int v11 = *(_DWORD *)(a1 + 20);
    }
    *(_DWORD *)(a1 + 20) = v11 + 1;
  }
}

char *sub_100011410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = (char *)sub_100010DD4(a1, a2, a3, a4, a5, a6, a7, a8);
  int v10 = 0;
  if (result)
  {
    CFStringRef v9 = (const __CFString *)result;
    bzero(buffer, 0x400uLL);
    CFStringGetCString(v9, buffer, 1024, 0x8000100u);
    asprintf(&v10, "%s", buffer);
    CFRelease(v9);
    return v10;
  }
  return result;
}

char *sub_1000114C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v11 = 0;
  if (*(unsigned char *)(a1 + 104))
  {
    if (a3 > 0x2F)
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): invalid variable ID=%d\n", a2, a3, a4, a5, a6, a7, a8, (char)"checkpoint_nvram_adjust_id");
      LODWORD(a3) = 0;
    }
    else
    {
      LODWORD(a3) = off_100024A40[4 * a3 + 2];
    }
  }
  CFStringRef v9 = *(const __CFString **)(a2 + 8 * a3 + 8);
  if (!v9) {
    return 0;
  }
  bzero(buffer, 0x400uLL);
  CFStringGetCString(v9, buffer, 1024, 0x8000100u);
  asprintf(&v11, "%s", buffer);
  return v11;
}

char *sub_1000115B8(char *a1, char a2, const __CFString *a3, unsigned char *a4)
{
  if (a3)
  {
    bzero(buffer, 0x400uLL);
    CFStringGetCString(a3, buffer, 1024, 0x8000100u);
    if (*a4) {
      int v14 = "|%s(%s)";
    }
    else {
      int v14 = "%s(%s)";
    }
    a1 = sub_1000102F4(a1, v14, v8, v9, v10, v11, v12, v13, a2);
    *a4 = 1;
  }
  return a1;
}

void sub_10001168C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(unsigned char *)(a1 + 2274) && sub_10000DDF8(a1, 0, 0, a4, a5, a6, a7, a8))
  {
    CFStringRef v9 = *(const __CFString **)(a1 + 992);
    if (!v9) {
      goto LABEL_23;
    }
    bzero(&v28[4], 0x3FCuLL);
    *(_DWORD *)(a1 + 2276) = 0;
    *(void *)(a1 + 2288) = 0;
    bzero(v30, 0x3FBuLL);
    strcpy(__s, "SIM_");
    size_t v10 = strlen(__s);
    CFStringGetCString(v9, &__s[v10], 1024 - v10, 0x8000100u);
    strcpy(v28, "SIM");
    size_t v11 = strlen(v28);
    CFStringGetCString(*(CFStringRef *)(a1 + 992), &v28[v11], 1024 - v11, 0x8000100u);
    uint64_t v12 = 0;
    while (1)
    {
      uint64_t v13 = off_1000250C8[v12];
      if (!strncasecmp(__s, v13, 0x400uLL))
      {
        *(_DWORD *)(a1 + 2276) = v12;
        goto LABEL_11;
      }
      if (!strncasecmp(v28, v13, 0x400uLL)) {
        break;
      }
      if (++v12 == 34)
      {
        LODWORD(v12) = *(_DWORD *)(a1 + 2276);
        goto LABEL_11;
      }
    }
    *(_DWORD *)(a1 + 2276) = v12;
    *(unsigned char *)(a1 + 2275) = 1;
LABEL_11:
    if (!v12) {
      goto LABEL_23;
    }
    CFStringRef v20 = *(const __CFString **)(a1 + 1016);
    if (v20)
    {
      CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, v20, @",");
      *(void *)(a1 + 2288) = ArrayBySeparatingStrings;
      if (ArrayBySeparatingStrings)
      {
        CFIndex Count = CFArrayGetCount(ArrayBySeparatingStrings);
        if (Count >= 1)
        {
          CFIndex v23 = Count;
          for (CFIndex i = 0; i != v23; ++i)
          {
            CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 2288), i);
            CFStringGetCStringPtr(ValueAtIndex, 0x8000100u);
          }
        }
        CFStringRef v26 = *(const __CFString **)(a1 + 1000);
        if (v26) {
          *(_DWORD *)(a1 + 2280) = CFStringGetIntValue(v26);
        }
        CFStringRef v27 = *(const __CFString **)(a1 + 1008);
        if (v27) {
          *(_DWORD *)(a1 + 2284) = CFStringGetIntValue(v27);
        }
        goto LABEL_23;
      }
    }
    else
    {
      ramrod_log_msg("CHECKPOINT_INTERNAL_ERROR(%s): simulator command without stepName\n", 0, v14, v15, v16, v17, v18, v19, (char)"checkpoint_simulator_configure");
    }
    *(_DWORD *)(a1 + 2276) = 0;
LABEL_23:
    *(unsigned char *)(a1 + 2274) = 1;
  }
}

void *sub_1000118A8()
{
  uint64_t v5 = 0;
  io_object_t v0 = &v5;
  size_t v1 = 0x100000;
  do
  {
    CFStringRef v2 = malloc(v1);
    NSObject *v0 = v2;
    if (v2)
    {
      bzero(v2, v1);
      io_object_t v0 = (void **)*v0;
    }
    else
    {
      v1 >>= 1;
    }
  }
  while ((int)v1 > 4095);
  uint64_t result = v5;
  if (v5)
  {
    do
    {
      uint64_t v4 = (void *)*result;
      free(result);
      uint64_t result = v4;
    }
    while (v4);
  }
  return result;
}

uint64_t ramrod_hardware_partition_supports_bics()
{
  return sub_100011928();
}

uint64_t sub_100011928()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  if (!v0) {
    return 0;
  }
  CFBooleanRef v1 = v0;
  CFTypeID v2 = CFGetTypeID(v0);
  if (v2 == CFBooleanGetTypeID()) {
    uint64_t Value = CFBooleanGetValue(v1);
  }
  else {
    uint64_t Value = 0;
  }
  CFRelease(v1);
  return Value;
}

uint64_t ramrod_device_has_baseband()
{
  return 0;
}

CFDictionaryRef ramrod_device_has_stockholm()
{
  CFDictionaryRef result = IOServiceMatching("AppleStockholmControl");
  if (result)
  {
    CFDictionaryRef result = (const __CFDictionary *)IOServiceGetMatchingService(kIOMasterPortDefault, result);
    if (result)
    {
      IOObjectRelease((io_object_t)result);
      return (const __CFDictionary *)1;
    }
  }
  return result;
}

uint64_t _ramrod_device_has_sandcat()
{
  if (qword_10002E640 != -1) {
    dispatch_once(&qword_10002E640, &stru_100025518);
  }
  return byte_10002E638;
}

void sub_100011A20(id a1)
{
  io_registry_entry_t v1 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io/sep/iop-sep-nub/Sandcat");
  if (v1)
  {
    byte_10002E638 = 1;
    IOObjectRelease(v1);
  }
}

uint64_t ramrod_connect_to_ioservice(const char *a1, io_service_t *a2, io_connect_t *a3)
{
  char v5 = (char)a1;
  CFDictionaryRef v6 = IOServiceMatching(a1);
  if (v6)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v6);
    if (MatchingService)
    {
      io_service_t v22 = MatchingService;
      io_connect_t connect = 0;
      if (!IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
      {
        *a2 = v22;
        *a3 = connect;
        return 1;
      }
      ramrod_log_msg("IOServiceOpen failed for class '%s'\n", v23, v24, v25, v26, v27, v28, v29, v5);
    }
    else
    {
      ramrod_log_msg("IOServiceGetMatchingService failed\n", v15, v16, v17, v18, v19, v20, v21, v31);
    }
  }
  else
  {
    ramrod_log_msg("IOServiceMatching failed for %s\n", v7, v8, v9, v10, v11, v12, v13, v5);
  }
  return 0;
}

uint64_t ramrod_generate_apslot_copy_nonce(_DWORD *a1, CFDataRef *a2)
{
  size_t v35 = 4;
  *(void *)connection = 0;
  size_t v34 = 32;
  *(_OWORD *)bytes = 0u;
  long long v38 = 0u;
  if (!ramrod_connect_to_ioservice("AppleMobileApNonce", &connection[1], connection))
  {
    ramrod_log_msg("Failed to connect to AppleMobileApNonce to generate AP nonce slot.\n", v4, v5, v6, v7, v8, v9, v10, outputStruct);
    goto LABEL_5;
  }
  mach_port_t v11 = connection[0];
  mach_error_t v12 = IOConnectCallMethod(connection[0], 0xC8u, 0, 0, 0, 0, 0, 0, bytes, &v34);
  if (v12)
  {
    mach_error_string(v12);
    ramrod_log_msg("IOConnectCallMethod(%s,%u) failed: %s\n", v13, v14, v15, v16, v17, v18, v19, (char)"AppleMobileApNonce");
LABEL_5:
    uint64_t v20 = 0;
    goto LABEL_6;
  }
  uint64_t v20 = (int *)calloc(1uLL, 4uLL);
  mach_error_t v25 = IOConnectCallMethod(v11, 0xCBu, 0, 0, 0, 0, 0, 0, v20, &v35);
  if (v25)
  {
    mach_error_string(v25);
    ramrod_log_msg("IOConnectCallMethod(%s,%u) failed: %s\n", v26, v27, v28, v29, v30, v31, v32, (char)"AppleMobileApNonce");
LABEL_6:
    int v21 = 0;
    CFDataRef v22 = 0;
    uint64_t v23 = 0;
    if (!a1) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  int v21 = *v20;
  CFDataRef v22 = CFDataCreate(kCFAllocatorDefault, bytes, 32);
  uint64_t v23 = 1;
  if (a1) {
LABEL_7:
  }
    *a1 = v21;
LABEL_8:
  if (a2)
  {
    *a2 = v22;
  }
  else if (v22)
  {
    CFRelease(v22);
  }
  if (v20) {
    free(v20);
  }
  if (connection[1]) {
    IOObjectRelease(connection[1]);
  }
  if (connection[0]) {
    IOObjectRelease(connection[0]);
  }
  return v23;
}

uint64_t ramrod_generate_sepslot_copy_nonce(_DWORD *a1, CFDataRef *a2)
{
  *(void *)bytes = 0;
  uint64_t v30 = 0;
  int v31 = 0;
  CFIndex length = 20;
  *(void *)connection = 0;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  if (ramrod_connect_to_ioservice("AppleSEPManager", &connection[1], connection))
  {
    io_object_t v11 = connection[0];
    mach_error_t v12 = IOConnectCallMethod(connection[0], 0x53u, 0, 0, 0, 0, &output, &outputCnt, bytes, (size_t *)&length);
    if (v12)
    {
      mach_error_string(v12);
      ramrod_log_msg("IOConnectCallMethod(%s,%u) failed: %s\n", v13, v14, v15, v16, v17, v18, v19, (char)"AppleSEPManager");
      uint64_t v20 = 0;
      int v21 = 0;
      CFDataRef v22 = 0;
    }
    else
    {
      int v21 = output;
      CFDataRef v22 = CFDataCreate(kCFAllocatorDefault, bytes, length);
      uint64_t v20 = 1;
    }
    if (connection[1]) {
      IOObjectRelease(connection[1]);
    }
    if (v11) {
      IOObjectRelease(v11);
    }
    if (a1) {
      *a1 = v21;
    }
    if (a2)
    {
      *a2 = v22;
    }
    else if (v22)
    {
      CFRelease(v22);
    }
  }
  else
  {
    ramrod_log_msg("Failed to connect to AppleSEPManager to generate sep nonce.\n", v4, v5, v6, v7, v8, v9, v10, outputStruct);
    return 0;
  }
  return v20;
}

uint64_t ramrod_should_do_legacy_restored_behaviors()
{
  return 0;
}

uint64_t ramrod_should_do_legacy_restored_internal_behaviors()
{
  return 0;
}

void ramrod_create_error_cf(CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

void sub_100011EC0(CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, va_list a6)
{
  if (a1)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      uint64_t v13 = Mutable;
      CFStringRef v14 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, a5, a6);
      if (v14)
      {
        CFStringRef v15 = v14;
        CFDictionaryAddValue(v13, kCFErrorDescriptionKey, v14);
        CFRelease(v15);
      }
      if (a4) {
        CFDictionaryAddValue(v13, kCFErrorUnderlyingErrorKey, a4);
      }
      *a1 = CFErrorCreate(kCFAllocatorDefault, a2, a3, v13);
      CFRelease(v13);
    }
  }
}

CFDictionaryRef ramrod_should_update_stockholm(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    ramrod_log_msg("Skipping checking stockholm for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
    return 0;
  }
  else
  {
    return ramrod_device_has_stockholm();
  }
}

uint64_t ramrod_copy_updater_functions(void *a1, const char *a2, __CFDictionary *(***a3)(const __CFDictionary *a1, uint64_t a2, uint64_t a3, CFErrorRef *a4), CFErrorRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2 || !a3)
  {
    ramrod_create_error_cf(a4, @"RamrodErrorDomain", 3, 0, @"%s: invalid parameters", a6, a7, a8, (char)"ramrod_copy_updater_functions");
    return 0;
  }
  *a3 = 0;
  mach_error_t v12 = (__CFDictionary *(**)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))malloc(0x18uLL);
  if (!v12)
  {
    ramrod_create_error_cf(a4, @"RamrodErrorDomain", 6, 0, @"%s: failed to allocate tmp update_functions struct", v13, v14, v15, (char)"ramrod_copy_updater_functions");
    return 0;
  }
  uint64_t v16 = v12;
  *mach_error_t v12 = 0;
  v12[1] = 0;
  void v12[2] = 0;
  if (!strcmp(a2, "Canary"))
  {
    _DWORD *v16 = sub_1000122BC;
    v16[1] = (__CFDictionary *(*)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))sub_1000123D0;
    void v16[2] = (__CFDictionary *(*)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))sub_100012408;
  }
  else
  {
    int v21 = (__CFDictionary *(*)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))sub_100012198(a1, (uint64_t)a2, (uint64_t)"UpdaterCreate", a4, v17, v18, v19, v20);
    _DWORD *v16 = v21;
    if (!v21
      || (uint64_t v26 = (__CFDictionary *(*)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))sub_100012198(a1, (uint64_t)a2, (uint64_t)"UpdaterIsDone", a4, v22, v23, v24, v25),
          (v16[1] = v26) == 0)
      || (int v31 = (__CFDictionary *(*)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))sub_100012198(a1, (uint64_t)a2, (uint64_t)"UpdaterExecCommand", a4, v27, v28, v29, v30),
          (void v16[2] = v31) == 0))
    {
      free(v16);
      return 0;
    }
  }
  *a3 = v16;
  return 1;
}

void *sub_100012198(void *a1, uint64_t a2, uint64_t a3, CFErrorRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 && a3)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    *(_OWORD *)__symbol = 0u;
    long long v15 = 0u;
    __strlcpy_chk();
    __strlcat_chk();
    CFDictionaryRef result = dlsym(a1, __symbol);
    if (result) {
      return result;
    }
    dlerror();
    ramrod_create_error_cf(a4, @"RamrodErrorDomain", 1012, 0, @"%s: unable to find %s: %s", v11, v12, v13, (char)"load_function");
  }
  else
  {
    ramrod_create_error_cf(a4, @"RamrodErrorDomain", 3, 0, @"%s: invalid parameters", a6, a7, a8, (char)"load_function");
  }
  return 0;
}

__CFDictionary *sub_1000122BC(const __CFDictionary *a1, uint64_t a2, uint64_t a3, CFErrorRef *a4)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    if (a1)
    {
      uint64_t Value = CFDictionaryGetValue(a1, @"Options");
      if (Value) {
        CFDictionarySetValue(Mutable, @"Options", Value);
      }
    }
    CFDictionarySetValue(Mutable, @"IsDone", kCFBooleanFalse);
    CFDictionarySetValue(Mutable, @"Loop0", kCFBooleanTrue);
    CFDictionarySetValue(Mutable, @"QueryLoop0", kCFBooleanTrue);
  }
  else
  {
    ramrod_create_error_cf(a4, @"RamrodErrorDomain", 6, 0, @"%s: state allocation failed", v6, v7, v8, (char)"_CanaryUpdaterCreate");
  }
  return Mutable;
}

CFDictionaryRef sub_1000123D0(const __CFDictionary *result)
{
  if (result)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(result, @"IsDone");
    return (const __CFDictionary *)CFBooleanGetValue(Value);
  }
  return result;
}

uint64_t sub_100012408(const __CFDictionary *a1, CFStringRef theString1, uint64_t a3, CFMutableDictionaryRef *a4, CFErrorRef *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    CFStringRef v12 = @"%s: state is NULL";
    goto LABEL_7;
  }
  if (!theString1)
  {
    CFStringRef v12 = @"%s: command is NULL";
    goto LABEL_7;
  }
  if (!a4)
  {
    CFStringRef v12 = @"%s: output is NULL";
    goto LABEL_7;
  }
  if (CFStringCompare(theString1, @"queryInfo", 0))
  {
    if (CFStringCompare(theString1, @"performNextStage", 0))
    {
      CFStringRef v12 = @"%s: %@ invalid command";
LABEL_7:
      ramrod_create_error_cf(a5, @"RamrodErrorDomain", 3, 0, v12, a6, a7, a8, (char)"_CanaryUpdaterExecCmd");
      return 0;
    }
    CFDictionaryGetValue(a1, @"Loop0");
    AMSupportLogInternal();
    if (CFDictionaryGetValue(a1, @"Loop0") == kCFBooleanFalse) {
      CFDictionarySetValue(a1, @"IsDone", kCFBooleanTrue);
    }
    CFStringRef v20 = @"Loop0";
    long long v21 = a1;
    CFBooleanRef v22 = kCFBooleanFalse;
  }
  else
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    *a4 = Mutable;
    if (!Mutable)
    {
      ramrod_create_error_cf(a5, @"RamrodErrorDomain", 6, 0, @"%s: *output allocation failed", v15, v16, v17, (char)"_CanaryUpdaterExecCmd");
      return 0;
    }
    CFDictionaryGetValue(a1, @"QueryLoop0");
    AMSupportLogInternal();
    CFDictionarySetValue(*a4, @"ECID", @"1234567890");
    long long v18 = *a4;
    CFBooleanRef Value = CFDictionaryGetValue(a1, @"QueryLoop0");
    CFDictionarySetValue(v18, @"QueryLoop0", Value);
    CFDictionarySetValue(*a4, @"LocalSigningID", kCFBooleanTrue);
    if (CFDictionaryGetValue(a1, @"QueryLoop0") == kCFBooleanFalse) {
      CFDictionarySetValue(a1, @"IsDone", kCFBooleanTrue);
    }
    CFStringRef v20 = @"QueryLoop0";
    long long v21 = a1;
    CFBooleanRef v22 = kCFBooleanFalse;
  }
  CFDictionarySetValue(v21, v20, v22);
  return 1;
}

uint64_t ramrod_update_nvram_overrides(const char *a1, __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2)
  {
    uint64_t v33 = "options is NULL\n";
LABEL_22:
    ramrod_log_msg(v33, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v34);
    goto LABEL_6;
  }
  if (!a1)
  {
    uint64_t v33 = "updaterName is NULL\n";
    goto LABEL_22;
  }
  char CStringPtr = CFStringGetCStringPtr(@"T200", 0x8000100u);
  if (!strcmp(a1, CStringPtr)
    && (CFDataRef v14 = (const __CFData *)ramrod_copy_NVRAM_variable_from_devicetree(@"VeridianForceUpdate")) != 0)
  {
    CFStringRef v15 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v14, 0x8000100u);
    CFStringRef v11 = v15;
    if (v15)
    {
      CFTypeID v16 = CFGetTypeID(v15);
      if (v16 == CFStringGetTypeID() && CFStringCompare(v11, @"yes", 1uLL) == kCFCompareEqualTo)
      {
        ramrod_log_msg("Setting %s=false due to nvram variable %s=yes\n", v17, v18, v19, v20, v21, v22, v23, (char)"SkipSameVersion");
        CFDictionarySetValue(a2, @"SkipSameVersion", kCFBooleanFalse);
        CFDictionarySetValue(a2, @"RestoreInternal", kCFBooleanTrue);
      }
    }
  }
  else
  {
    CFStringRef v11 = 0;
  }
  CFStringRef v12 = CFStringGetCStringPtr(@"AppleTCON", 0x8000100u);
  if (!strcmp(a1, v12))
  {
    CFDataRef v24 = (const __CFData *)ramrod_copy_NVRAM_variable_from_devicetree(@"AppleTCONForceUpdate");
    if (v24) {
      CFStringRef v11 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v24, 0x8000100u);
    }
    if (v11)
    {
      CFTypeID v25 = CFGetTypeID(v11);
      if (v25 == CFStringGetTypeID() && CFStringCompare(v11, @"yes", 1uLL) == kCFCompareEqualTo)
      {
        ramrod_log_msg("Setting %s=false due to nvram variable %s=yes\n", v26, v27, v28, v29, v30, v31, v32, (char)"SkipSameVersion");
        CFDictionarySetValue(a2, @"SkipSameVersion", kCFBooleanFalse);
        CFDictionarySetValue(a2, @"RestoreInternal", kCFBooleanTrue);
      }
    }
  }
LABEL_6:
  AMSupportSafeRelease();

  return AMSupportSafeRelease();
}

__CFString **sub_10001292C(const __CFString *a1)
{
  sub_10001552C();
  if (a1)
  {
    uint64_t v2 = 0;
    while (1)
    {
      CFStringRef v3 = off_10002E348[v2];
      if (!v3) {
        break;
      }
      if (CFEqual(a1, v3)) {
        return &off_10002E348[v2];
      }
      v2 += 6;
      if (v2 == 72) {
        return 0;
      }
    }
  }
  AMSupportLogInternal();
  return 0;
}

__CFString *ramrod_update_get_dylib(const __CFString *a1)
{
  if (a1)
  {
    io_registry_entry_t v1 = sub_10001292C(a1);
    if (v1) {
      return v1[3];
    }
  }
  AMSupportLogInternal();
  return 0;
}

CFDictionaryRef ramrod_update_copy_ap_parameters_generating_nonces(CFDictionaryRef theDict)
{
  if (theDict) {
    MutableCFStringRef Copy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, theDict);
  }
  else {
    MutableCFStringRef Copy = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  CFDictionaryRef v9 = MutableCopy;
  if (MutableCopy)
  {
    CFDictionarySetValue(MutableCopy, @"GenerateNonces", kCFBooleanTrue);
    CFDictionaryRef updated = ramrod_update_copy_ap_parameters(v9);
    CFRelease(v9);
    return updated;
  }
  else
  {
    ramrod_log_msg("Failed to allocate ap options dictionary.\n", v2, v3, v4, v5, v6, v7, v8, v12);
    return 0;
  }
}

CFDictionaryRef ramrod_update_copy_ap_parameters(const __CFDictionary *a1)
{
  int BOOLean_option = get_BOOLean_option(a1, @"GenerateNonces", 0);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    AMSupportLogInternal();
    CFDictionaryRef Copy = 0;
    goto LABEL_29;
  }
  io_registry_entry_t v3 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/chosen");
  if (v3)
  {
    io_object_t v11 = v3;
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v3, @"esdm-fuses", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFDataRef v20 = CFProperty;
      CFTypeID v21 = CFGetTypeID(CFProperty);
      if (v21 == CFDataGetTypeID())
      {
        BytePtr = CFDataGetBytePtr(v20);
        CFNumberRef v30 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, BytePtr);
        if (v30) {
          goto LABEL_12;
        }
        uint64_t v31 = "could not create CFNumber for esdm-fuses\n";
      }
      else
      {
        uint64_t v31 = "esdm-fuses property is not a CFData\n";
      }
      ramrod_log_msg(v31, v22, v23, v24, v25, v26, v27, v28, v52);
      CFNumberRef v30 = 0;
LABEL_12:
      CFRelease(v20);
      IOObjectRelease(v11);
      if (v30) {
        CFDictionarySetValue(Mutable, kAMAuthInstallApParameterSiKA, v30);
      }
      goto LABEL_14;
    }
    ramrod_log_msg("unable to lookup esdm-fuses property\n", v13, v14, v15, v16, v17, v18, v19, v52);
    IOObjectRelease(v11);
  }
  else
  {
    ramrod_log_msg("unable to find 'chosen' registry entry\n", v4, v5, v6, v7, v8, v9, v10, v52);
  }
LABEL_14:
  if (BOOLean_option && _ramrod_device_has_sandcat())
  {
    int v55 = 2;
    int valuePtr = 0;
    CFTypeRef cf = 0;
    value = 0;
    if (ramrod_generate_apslot_copy_nonce(&valuePtr, (CFDataRef *)&value))
    {
      CFNumberRef v39 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
      if (v39)
      {
        CFNumberRef v40 = v39;
        CFDictionarySetValue(Mutable, kAMAuthInstallApParameterApNonceSlotID, v39);
        CFRelease(v40);
      }
      if (value)
      {
        CFDictionarySetValue(Mutable, kAMAuthInstallApParameterApNonce, value);
        CFRelease(value);
      }
    }
    else
    {
      ramrod_log_msg("unable to read the AP slot id will not set.\n", v32, v33, v34, v35, v36, v37, v38, v52);
    }
    if (ramrod_generate_sepslot_copy_nonce(&v55, (CFDataRef *)&cf))
    {
      CFNumberRef v48 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &v55);
      if (v48)
      {
        CFNumberRef v49 = v48;
        CFDictionarySetValue(Mutable, kAMAuthInstallApParameterSepNonceSlotID, v48);
        CFRelease(v49);
      }
      if (cf)
      {
        CFDictionarySetValue(Mutable, kAMAuthInstallApParameterSepNonce, cf);
        CFRelease(cf);
      }
    }
    else
    {
      ramrod_log_msg("unable to read the SEP slot id will not set.\n", v41, v42, v43, v44, v45, v46, v47, v52);
    }
  }
  CFDictionaryRef Copy = CFDictionaryCreateCopy(kCFAllocatorDefault, Mutable);
LABEL_29:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return Copy;
}

__CFDictionary *ramrod_update_copy_deviceinfo_with_options(const __CFDictionary *a1, CFErrorRef *a2)
{
  char v129 = 0;
  v130[0] = 0;
  char v128 = 0;
  sub_10001552C();
  CFTypeRef cf = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!cf)
  {
    ramrod_create_error_cf(a2, @"RamrodErrorDomain", 6, 0, @"%s: Failed to allocate outDict", v3, v4, v5, (char)"ramrod_update_copy_deviceinfo_with_options");
LABEL_144:
    char v102 = 1;
    goto LABEL_130;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    ramrod_create_error_cf(a2, @"RamrodErrorDomain", 6, 0, @"%s: Failed to allocate deviceInfo", v6, v7, v8, (char)"ramrod_update_copy_deviceinfo_with_options");
    goto LABEL_144;
  }
  CFMutableDictionaryRef v13 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v13)
  {
    ramrod_create_error_cf(a2, @"RamrodErrorDomain", 6, 0, @"%s: Failed to allocate disabledInfo", v10, v11, v12, (char)"ramrod_update_copy_deviceinfo_with_options");
    goto LABEL_144;
  }
  CFMutableDictionaryRef v17 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v17)
  {
    ramrod_create_error_cf(a2, @"RamrodErrorDomain", 6, 0, @"%s: Failed to allocate checkpointDict", v14, v15, v16, (char)"ramrod_update_copy_deviceinfo_with_options");
    goto LABEL_144;
  }
  if (!a1)
  {
    ramrod_create_error_cf(a2, @"RamrodErrorDomain", 2, 0, @"%s: options is NULL", v14, v15, v16, (char)"ramrod_update_copy_deviceinfo_with_options");
    goto LABEL_144;
  }
  v126 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v126
    || (theDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks)) == 0|| (uint64_t v18 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks), (v19 = v18) == 0))
  {
    AMSupportLogInternal();
    goto LABEL_144;
  }
  CFDictionarySetValue(v18, @"CreateFilesystemPartitions", kCFBooleanFalse);
  CFDictionarySetValue(v126, @"RestoreOptions", v19);
  if (CFDictionaryContainsKey(a1, @"PreflightRequired"))
  {
    CFBooleanRef Value = CFDictionaryGetValue(a1, @"PreflightRequired");
    CFDictionarySetValue(theDict, @"PreflightRequired", Value);
  }
  CFMutableDictionaryRef v118 = v17;
  CFMutableDictionaryRef v114 = v13;
  if (CFDictionaryContainsKey(a1, @"BootedUpdate"))
  {
    CFBooleanRef v21 = (CFBooleanRef)CFDictionaryGetValue(a1, @"BootedUpdate");
    CFDictionarySetValue(theDict, @"BootedUpdate", v21);
    BOOL v120 = v21 == kCFBooleanTrue;
  }
  else
  {
    BOOL v120 = 0;
  }
  CFMutableDictionaryRef v115 = Mutable;
  CFDictionaryRef v127 = a1;
  if (CFDictionaryContainsKey(a1, @"PreflightContext"))
  {
    CFStringRef v25 = (const __CFString *)CFDictionaryGetValue(a1, @"PreflightContext");
    CFDictionarySetValue(theDict, @"PreflightContext", v25);
    BOOL v26 = CFStringCompare(v25, @"Limited", 0) != kCFCompareEqualTo;
  }
  else
  {
    BOOL v26 = 1;
  }
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  CFMutableArrayRef v29 = 0;
  CFNumberRef v30 = 0;
  MutableCFDictionaryRef Copy = 0;
  if (v120) {
    BOOL v26 = 1;
  }
  BOOL v125 = v26;
  uint64_t v32 = "ramrod_update_copy_deviceinfo_with_options";
  while (1)
  {
    if (v28) {
      CFRelease(v28);
    }
    if (v129)
    {
      CFRelease(v129);
      char v129 = 0;
    }
    if (v29) {
      CFRelease(v29);
    }
    if (v30) {
      CFRelease(v30);
    }
    if (v130[0])
    {
      CFRelease(v130[0]);
      v130[0] = 0;
    }
    if (MutableCopy) {
      CFRelease(MutableCopy);
    }
    if (v128)
    {
      free(v128);
      char v128 = 0;
    }
    uint64_t v33 = (CFStringRef *)&off_10002E348[6 * v27];
    if (!*v33)
    {
      ramrod_create_error_cf(a2, @"RamrodErrorDomain", 6, v130[0], @"%s: Updater Name is NULL at index %d", v22, v23, v24, (char)v32);
      goto LABEL_129;
    }
    uint64_t v34 = v27 + 1;
    AMSupportLogInternal();
    CFStringRef v35 = *v33;
    if (!*v33) {
      break;
    }
    CFArrayRef v36 = (const __CFArray *)CFDictionaryGetValue(v127, @"SkipUpdaters");
    if (!v36) {
      break;
    }
    CFArrayRef v37 = v36;
    if (CFArrayGetCount(v36) < 1) {
      break;
    }
    CFIndex v38 = 0;
    while (1)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v37, v38);
      if (ValueAtIndex)
      {
        CFStringRef v40 = ValueAtIndex;
        CFTypeID v41 = CFGetTypeID(ValueAtIndex);
        if (v41 == CFStringGetTypeID() && CFEqual(v35, v40)) {
          break;
        }
      }
      if (++v38 >= CFArrayGetCount(v37)) {
        goto LABEL_43;
      }
    }
    AMSupportLogInternal();
    MutableCFDictionaryRef Copy = 0;
    CFNumberRef v30 = 0;
    CFMutableArrayRef v29 = 0;
    uint64_t v28 = 0;
LABEL_71:
    uint64_t v27 = v34;
    if (v34 == 12)
    {
      CFDictionaryRef updated = ramrod_update_copy_ap_parameters(v127);
      CFDictionaryAddValue(cf, @"DeviceInfo", v115);
      CFDictionaryAddValue(cf, @"DeviceInfoDisabled", v114);
      CFDictionaryAddValue(cf, @"DeviceInfoFailures", v118);
      CFDictionaryAddValue(cf, @"ApParameters", updated);
      char v102 = 0;
      goto LABEL_130;
    }
  }
LABEL_43:
  uint64_t v42 = v32;
  uint64_t v43 = &off_10002E348[6 * v27];
  uint64_t v46 = v43[2];
  uint64_t v45 = v43 + 2;
  uint64_t v44 = v46;
  if (!v46) {
    goto LABEL_55;
  }
  if (v125)
  {
    CFAllocatorRef v47 = kCFAllocatorDefault;
    goto LABEL_49;
  }
  CFAllocatorRef v47 = kCFAllocatorDefault;
  if (((unsigned int (*)(uint64_t))v44)(1))
  {
    char v48 = 0;
    goto LABEL_51;
  }
  uint64_t v44 = *v45;
LABEL_49:
  if (!((unsigned int (*)(BOOL))v44)(v120))
  {
LABEL_55:
    uint64_t v32 = v42;
    AMSupportLogInternal();
    MutableCFDictionaryRef Copy = 0;
    CFNumberRef v30 = 0;
    CFMutableArrayRef v29 = 0;
LABEL_70:
    uint64_t v28 = 0;
    goto LABEL_71;
  }
  char v48 = 1;
LABEL_51:
  char CStringPtr = CFStringGetCStringPtr(*v33, 0x8000100u);
  if (!CStringPtr)
  {
    ramrod_create_error_cf(a2, @"RamrodErrorDomain", 6, v130[0], @"%s: failed convert updaterName %@", v50, v51, v52, (char)v42);
    goto LABEL_129;
  }
  uint64_t v53 = CStringPtr;
  MutableCFDictionaryRef Copy = CFDictionaryCreateMutableCopy(v47, 0, theDict);
  if (!MutableCopy)
  {
    ramrod_create_error_cf(a2, @"RamrodErrorDomain", 6, v130[0], @"%s: Failed to copy subOptions for %s", v54, v55, v56, (char)v42);
    goto LABEL_129;
  }
  CFDictionarySetValue(v126, @"Options", MutableCopy);
  ramrod_update_nvram_overrides(v53, MutableCopy, v57, v58, v59, v60, v61, v62);
  if (AMAuthInstallUpdaterTwoStageEnabled())
  {
    ramrod_log_msg("%s Updater configured for two-stage update. DeferredCommit: YES.\n", v63, v64, v65, v66, v67, v68, v69, (char)v53);
    CFDictionarySetValue(MutableCopy, @"DeferredCommit", kCFBooleanTrue);
  }
  else
  {
    ramrod_log_msg("%s Updater: Legacy / single-stage updater.\n", v63, v64, v65, v66, v67, v68, v69, (char)v53);
  }
  if (BYTE4(off_10002E348[6 * v27 + 4]))
  {
    CFMutableArrayRef v29 = CFArrayCreateMutable(v47, 0, &kCFTypeArrayCallBacks);
    if (v29)
    {
      if ((v48 & 1) == 0) {
        goto LABEL_60;
      }
      goto LABEL_61;
    }
    ramrod_create_error_cf(a2, @"RamrodErrorDomain", 6, v130[0], @"%s: Failed to create queryResults array for %s", v70, v71, v72, (char)v42);
LABEL_129:
    char v102 = 1;
    goto LABEL_130;
  }
  CFMutableArrayRef v29 = 0;
  if ((v48 & 1) == 0)
  {
LABEL_60:
    AMSupportLogInternal();
    CFDictionarySetValue(MutableCopy, @"PreflightContext", @"BootedOS");
  }
LABEL_61:
  uint64_t v73 = dlopen((const char *)off_10002E348[6 * v27 + 3], 261);
  if (!v73)
  {
    dlerror();
    uint64_t v32 = v42;
LABEL_69:
    AMSupportLogInternal();
    CFNumberRef v30 = 0;
    goto LABEL_70;
  }
  if (!ramrod_copy_updater_functions(v73, v53, &v128, a2, v74, v75, v76, v77)
    || (uint64_t v32 = v42, v78 = ((uint64_t (*)(void, const void **))v128[1])(0, v130), v130[0]))
  {
LABEL_128:
    AMSupportLogInternal();
    goto LABEL_129;
  }
  if (v78) {
    goto LABEL_69;
  }
  AMSupportLogInternal();
  uint64_t v79 = (*v128)(v126, (uint64_t)sub_100013C00, (uint64_t)v53, (CFErrorRef *)v130);
  uint64_t v28 = v79;
  if (!v79)
  {
    AMSupportLogInternal();
    ramrod_create_error_cf(a2, @"RamrodErrorDomain", 1013, v130[0], @"%s: Preflight Create failed on %s", v106, v107, v108, (char)v42);
    goto LABEL_129;
  }
  int v80 = ((uint64_t (*)(__CFDictionary *, const void **))v128[1])(v79, v130);
  if (v130[0]) {
    goto LABEL_128;
  }
  if (v80)
  {
    AMSupportLogInternal();
    CFNumberRef v30 = 0;
    goto LABEL_71;
  }
  int v81 = 0;
  char v113 = 0;
  uint64_t v82 = &off_10002E348[6 * v27];
  uint64_t v119 = (char *)v82 + 33;
  uint64_t v117 = (const void **)(v82 + 1);
  char v111 = (const void **)(v82 + 5);
  v112 = (char *)v82 + 34;
  while (2)
  {
    if (v81 <= 1024) {
      int v83 = 1024;
    }
    else {
      int v83 = v81;
    }
    int key = v83;
    int v84 = v81 - 1;
    while (1)
    {
      if (v129)
      {
        CFRelease(v129);
        char v129 = 0;
      }
      if (key == v84 + 1)
      {
        AMSupportLogInternal();
        ramrod_create_error_cf(a2, @"RamrodErrorDomain", 1016, v130[0], @"%s: Exceeded maximum loops for %s", v103, v104, v105, (char)v42);
LABEL_121:
        char v102 = 1;
        goto LABEL_130;
      }
      if (v29)
      {
        AMSupportLogInternal();
        int v85 = ((uint64_t (*)(__CFDictionary *, const void **))v128[1])(v28, v130);
        if (v130[0])
        {
          AMSupportLogInternal();
          goto LABEL_121;
        }
        if (v85) {
          goto LABEL_119;
        }
      }
      AMSupportLogInternal();
      if (((unsigned int (*)(__CFDictionary *, const __CFString *, void, __CFDictionary **, const void **))v128[2])(v28, @"queryInfo", 0, &v129, v130))
      {
        break;
      }
      AMSupportLogInternal();
      if (*v119 == 1)
      {
        ramrod_log_msg("%s updater failed but not reporting error since it is best effort\n", v86, v87, v88, v89, v90, v91, v92, (char)v53);
      }
      else
      {
        CFDictionarySetValue(v118, *v33, *v117);
        ramrod_create_error_cf(a2, @"RamrodErrorDomain", 1016, v130[0], @"%s: Preflight QueryInfo failed on %s", v93, v94, v95, (char)v42);
      }
      ++v84;
      if (!v29) {
        goto LABEL_119;
      }
    }
    if (!v129)
    {
      uint64_t v97 = v115;
      goto LABEL_103;
    }
    CFTypeID TypeID = CFDictionaryGetTypeID();
    uint64_t v97 = v115;
    if (TypeID != CFGetTypeID(v129) || CFDictionaryGetValue(v127, @"PreflightRequired") != kCFBooleanFalse)
    {
LABEL_103:
      unint64_t v98 = (unint64_t)v129;
      if (v29)
      {
        CFArrayAppendValue(v29, v129);
        unint64_t v98 = (unint64_t)v129;
      }
      if (!v98 || v130[0])
      {
        if (v98 | (unint64_t)v130[0])
        {
          AMSupportLogInternal();
          if (*v112)
          {
            ramrod_create_error_cf(a2, @"RamrodErrorDomain", 1016, v130[0], @"%s: Preflight QueryInfo succeeded, but improper results on %s", v22, v23, v24, (char)v42);
            char v102 = 1;
            goto LABEL_130;
          }
        }
        else
        {
          AMSupportLogInternal();
        }
      }
      else
      {
        AMSupportLogInternal();
        if (v29) {
          CFMutableArrayRef v99 = v29;
        }
        else {
          CFMutableArrayRef v99 = v129;
        }
        if (*v112) {
          v100 = v97;
        }
        else {
          v100 = v114;
        }
        CFDictionarySetValue(v100, *v33, v99);
      }
      int v81 = v84 + 2;
      if (!v29)
      {
LABEL_119:
        uint64_t v32 = v42;
        CFNumberRef v30 = v113;
        goto LABEL_71;
      }
      continue;
    }
    break;
  }
  char v113 = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v129);
  if (v113)
  {
    if (*v111)
    {
      keya = (void *)*v111;
      if (CFDictionaryContainsKey(v113, *v111))
      {
        AMSupportLogInternal();
        CFDictionaryRemoveValue(v113, keya);
        CFRelease(v129);
        char v129 = v113;
        char v113 = 0;
      }
    }
    goto LABEL_103;
  }
  char v102 = 1;
LABEL_130:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  if (v128)
  {
    free(v128);
    char v128 = 0;
  }
  CFDictionaryRef result = cf;
  char v110 = v102 ^ 1;
  if (!cf) {
    char v110 = 1;
  }
  if ((v110 & 1) == 0)
  {
    CFRelease(cf);
    return 0;
  }
  return result;
}

void sub_100013C00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    ramrod_log_msg("updater_log: %s", a2, a3, a4, a5, a6, a7, a8, a2);
  }
}

__CFDictionary *ramrod_update_copy_deviceinfo(int a1, CFErrorRef *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  uint64_t v5 = Mutable;
  if (Mutable)
  {
    uint64_t v6 = (const void **)&kCFBooleanTrue;
    if (!a1) {
      uint64_t v6 = (const void **)&kCFBooleanFalse;
    }
    CFDictionarySetValue(Mutable, @"PreflightRequired", *v6);
    CFDictionarySetValue(v5, @"PreflightContext", @"BootedOS");
    CFDictionaryRef updated = ramrod_update_copy_deviceinfo_with_options(v5, a2);
  }
  else
  {
    AMSupportLogInternal();
    CFDictionaryRef updated = 0;
  }
  AMSupportSafeRelease();
  return updated;
}

BOOL ramrod_should_update_rose(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    BOOL v8 = 0;
    uint64_t v9 = "Skipping checking Rose for booted update\n";
  }
  else
  {
    int has_rose = ramrod_device_has_rose();
    BOOL v8 = has_rose != 0;
    if (has_rose) {
      uint64_t v9 = "Rose is present. Will update\n";
    }
    else {
      uint64_t v9 = "Rose not present\n";
    }
  }
  ramrod_log_msg(v9, a2, a3, a4, a5, a6, a7, a8, v12);
  return v8;
}

uint64_t ramrod_device_has_rose()
{
  CFDictionaryRef v0 = IOServiceNameMatching("rose");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v0);
  if (!MatchingService)
  {
    ramrod_log_msg("Service does not exist\n", v1, v2, v3, v4, v5, v6, v7, v51);
    uint64_t v42 = 0;
    goto LABEL_18;
  }
  if (!ramrod_should_do_legacy_restored_internal_behaviors()) {
    goto LABEL_17;
  }
  char valuePtr = 0;
  CFStringRef v9 = (const __CFString *)MGCopyAnswer();
  CFStringRef v17 = v9;
  if (!v9)
  {
    CFTypeID v41 = "Failed to get HW model\n";
    goto LABEL_16;
  }
  CFTypeID v18 = CFGetTypeID(v9);
  if (v18 != CFStringGetTypeID())
  {
    CFTypeID v41 = "HW model is not a string\n";
    goto LABEL_16;
  }
  if (!CFStringHasSuffix(v17, @"DEV"))
  {
    CFTypeID v41 = "Not a DEV board\n";
LABEL_16:
    ramrod_log_msg(v41, v10, v11, v12, v13, v14, v15, v16, v51);
    goto LABEL_17;
  }
  ramrod_log_msg("DEV board\n", v10, v11, v12, v13, v14, v15, v16, v51);
  CFNumberRef v26 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &valuePtr);
  if (!v26)
  {
    ramrod_log_msg("Failed to create zero\n", v19, v20, v21, v22, v23, v24, v25, v52);
    goto LABEL_17;
  }
  CFNumberRef v27 = (const __CFNumber *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"ECID", kCFAllocatorDefault, 1u);
  CFNumberRef v35 = v27;
  if (!v27)
  {
    CFStringRef v40 = "ECID property does not exist\n";
    goto LABEL_28;
  }
  CFTypeID v36 = CFGetTypeID(v27);
  if (v36 != CFNumberGetTypeID())
  {
    CFStringRef v40 = "ECID property is not a number\n";
    goto LABEL_28;
  }
  if (CFNumberCompare(v26, v35, 0) == kCFCompareEqualTo)
  {
    CFStringRef v40 = "ECID property is zero\n";
    goto LABEL_28;
  }
  CFNumberRef v37 = (const __CFNumber *)IORegistryEntrySearchCFProperty(MatchingService, "IOService", @"ChipID", kCFAllocatorDefault, 1u);
  CFNumberRef v38 = v37;
  if (!v37)
  {
    CFStringRef v40 = "ChipID property does not exist\n";
    goto LABEL_28;
  }
  CFTypeID v39 = CFGetTypeID(v37);
  if (v39 != CFNumberGetTypeID())
  {
    CFStringRef v40 = "ChipID property is not a number\n";
    goto LABEL_28;
  }
  if (CFNumberCompare(v26, v38, 0))
  {
LABEL_17:
    uint64_t v42 = 1;
    goto LABEL_18;
  }
  CFStringRef v40 = "ChipID property is zero\n";
LABEL_28:
  ramrod_log_msg(v40, v28, v29, v30, v31, v32, v33, v34, v52);
  uint64_t v42 = 0;
LABEL_18:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  if (MatchingService) {
    IOObjectRelease(MatchingService);
  }
  ramrod_log_msg("result: %u\n", v43, v44, v45, v46, v47, v48, v49, v42);
  return v42;
}

uint64_t ramrod_update_supported(CFStringRef theString, const __CFString *a2)
{
  uint64_t v2 = (uint64_t)theString;
  uint64_t v20 = 0;
  CFTypeRef cf = 0;
  uint64_t v19 = 0;
  if (theString)
  {
    char CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
    if (CStringPtr)
    {
      dylib = ramrod_update_get_dylib((const __CFString *)v2);
      if (dylib)
      {
        uint64_t v6 = dlopen((const char *)dylib, 261);
        if (!v6)
        {
          dlerror();
          AMSupportLogInternal();
          goto LABEL_14;
        }
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (Mutable)
        {
          CFMutableDictionaryRef v8 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (v8)
          {
            CFDictionarySetValue(Mutable, @"Options", v8);
            CFDictionarySetValue(v8, @"PreflightRequired", kCFBooleanTrue);
            if (ramrod_copy_updater_functions(v6, CStringPtr, (__CFDictionary *(***)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))&v19, 0, v9, v10, v11, v12)&& *((void *)v19 + 2)&& *((void *)v19 + 1)&& *(void *)v19)
            {
              uint64_t v13 = (*(uint64_t (**)(__CFDictionary *, void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), const char *, uint64_t *))v19)(Mutable, sub_100013C00, CStringPtr, &v20);
              uint64_t v14 = v13;
              if (v13)
              {
                CFErrorRef err = 0;
                if (!(*((unsigned int (**)(uint64_t, void))v19 + 1))(v13, 0))
                {
                  if ((*((unsigned int (**)(uint64_t, const __CFString *, void, CFTypeRef *, CFErrorRef *))v19
                        + 2))(v14, @"queryInfo", 0, &cf, &err) != 1|| err|| cf&& ((CFTypeID v15 = CFGetTypeID(cf), v15 != CFDictionaryGetTypeID())|| CFDictionaryGetCount((CFDictionaryRef)cf)))
                  {
                    if (!a2 || !err) {
                      goto LABEL_25;
                    }
                    CFStringRef v16 = CFErrorCopyDescription(err);
                    if (!v16 || CFStringCompare(v16, a2, 0))
                    {
                      AMSupportLogInternal();
LABEL_25:
                      AMSupportLogInternal();
                      uint64_t v2 = 1;
                      goto LABEL_26;
                    }
                  }
                }
              }
              AMSupportLogInternal();
            }
          }
          else
          {
            AMSupportLogInternal();
          }
LABEL_14:
          uint64_t v2 = 0;
          goto LABEL_26;
        }
      }
    }
    AMSupportLogInternal();
    goto LABEL_14;
  }
  AMSupportLogInternal();
LABEL_26:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  if (v19) {
    free(v19);
  }
  return v2;
}

BOOL ramrod_device_has_savage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v25 = 0;
  ramrod_log_msg("opening %s\n", a2, a3, a4, a5, a6, a7, a8, (char)"/usr/lib/updaters/libSavageUpdater_iOS.dylib");
  CFMutableDictionaryRef v8 = dlopen("/usr/lib/updaters/libSavageUpdater_iOS.dylib", 261);
  if (!v8)
  {
    dlerror();
    ramrod_log_msg("unable to open %s. %s, skipping step\n", v17, v18, v19, v20, v21, v22, v23, (char)"/usr/lib/updaters/libSavageUpdater_iOS.dylib");
    return 0;
  }
  int v13 = ramrod_copy_updater_functions(v8, "Savage", (__CFDictionary *(***)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))&v25, 0, v9, v10, v11, v12);
  uint64_t v14 = v25;
  if (!v13)
  {
    BOOL v16 = 0;
    if (!v25) {
      return v16;
    }
    goto LABEL_5;
  }
  CFTypeID v15 = (unsigned int (*)(void, void))*((void *)v25 + 1);
  if (!v15)
  {
    BOOL v16 = 0;
    goto LABEL_5;
  }
  BOOL v16 = v15(0, 0) == 0;
  uint64_t v14 = v25;
  if (v25) {
LABEL_5:
  }
    free(v14);
  return v16;
}

BOOL ramrod_should_update_savage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    ramrod_log_msg("Skipping checking Savage for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
    return 0;
  }
  else
  {
    return ramrod_device_has_savage(a1, a2, a3, a4, a5, a6, a7, a8);
  }
}

uint64_t ramrod_device_has_veridian()
{
  CFDictionaryRef v0 = IOServiceMatching("AppleGasGaugeUpdate");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v0);
  if (MatchingService)
  {
    io_object_t v9 = MatchingService;
    if (!ramrod_should_do_legacy_restored_internal_behaviors()) {
      goto LABEL_14;
    }
    CFStringRef v10 = (const __CFString *)MGCopyAnswer();
    CFStringRef v18 = v10;
    if (v10)
    {
      CFTypeID v19 = CFGetTypeID(v10);
      if (v19 == CFStringGetTypeID())
      {
        if (!CFStringHasSuffix(v18, @"DEV")) {
          goto LABEL_14;
        }
        keys = @"built-in";
        uint64_t v20 = IOServiceMatching("IOPMPowerSource");
        CFDictionaryRef v21 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (v20)
        {
          if (v21)
          {
            CFDictionarySetValue(v20, @"IOPropertyMatch", v21);
            io_service_t v29 = IOServiceGetMatchingService(kIOMasterPortDefault, v20);
            if (v29)
            {
              io_object_t v30 = v29;
              CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v29, @"Serial", kCFAllocatorDefault, 0);
              IOObjectRelease(v30);
              AMSupportSafeRelease();
              if (CFProperty)
              {
                CFTypeID v32 = CFGetTypeID(CFProperty);
                if (v32 == CFStringGetTypeID())
                {
                  if (!CFStringGetLength(CFProperty))
                  {
                    ramrod_log_msg("Dev board with no Veridian attached - pretending we don't support Veridian.\n", v40, v41, v42, v43, v44, v45, v46, v51);
                    uint64_t v47 = 0;
LABEL_15:
                    IOObjectRelease(v9);
                    goto LABEL_16;
                  }
                }
                else
                {
                  ramrod_log_msg("Veridian Serial not a string - not expected\n", v33, v34, v35, v36, v37, v38, v39, v51);
                }
LABEL_14:
                uint64_t v47 = 1;
                goto LABEL_15;
              }
              goto LABEL_23;
            }
            uint64_t v50 = "unable to find IOPMPowerSource service\n";
          }
          else
          {
            uint64_t v50 = "Failed to allocate properties\n";
          }
        }
        else
        {
          uint64_t v50 = "Failed to allocate matching\n";
        }
        ramrod_log_msg(v50, v22, v23, v24, v25, v26, v27, v28, v51);
        AMSupportSafeRelease();
LABEL_23:
        uint64_t v49 = "Veridian Serial is NULL - not expected\n";
        goto LABEL_24;
      }
      uint64_t v49 = "HW model is not a string\n";
    }
    else
    {
      uint64_t v49 = "Failed to get HW model\n";
    }
LABEL_24:
    ramrod_log_msg(v49, v11, v12, v13, v14, v15, v16, v17, v51);
    goto LABEL_14;
  }
  ramrod_log_msg("Not a Veridian device.\n", v2, v3, v4, v5, v6, v7, v8, v51);
  uint64_t v47 = 0;
LABEL_16:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v47;
}

BOOL ramrod_device_ota_veridian(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return ramrod_device_has_veridian() != 0;
  }
  ramrod_log_msg("Skipping checking Veridian for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t ramrod_device_has_appletcon(uint64_t a1)
{
  io_registry_entry_t v2 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/product");
  if (!v2) {
    goto LABEL_19;
  }
  io_object_t v3 = v2;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v2, @"tcon-path", kCFAllocatorDefault, 0);
  IOObjectRelease(v3);
  if (!CFProperty)
  {
    uint64_t v39 = "tcon-path pointer not found.\n";
LABEL_18:
    ramrod_log_msg(v39, v5, v6, v7, v8, v9, v10, v11, v49);
LABEL_19:
    uint64_t updated = 0;
    goto LABEL_20;
  }
  CFTypeID TypeID = CFDataGetTypeID();
  if (TypeID != CFGetTypeID(CFProperty))
  {
    uint64_t v39 = "IORegistryEntryCreateCFProperty returned non CFDataRef\n";
    goto LABEL_18;
  }
  CFIndex Length = CFDataGetLength((CFDataRef)CFProperty);
  if (!Length)
  {
    uint64_t v39 = "tcon-path contains invalid string\n";
    goto LABEL_18;
  }
  CFIndex v14 = Length;
  size_t v15 = Length + 15;
  uint64_t v16 = (char *)malloc(Length + 15);
  uint64_t v24 = v16;
  if (!v16)
  {
    uint64_t v41 = "malloc returned NULL\n";
LABEL_28:
    ramrod_log_msg(v41, v17, v18, v19, v20, v21, v22, v23, v49);
    goto LABEL_19;
  }
  if (snprintf(v16, v15, "%s", "IODeviceTree:/") != 14)
  {
    uint64_t v41 = "overflow";
    goto LABEL_28;
  }
  v51.CFIndex length = CFDataGetLength((CFDataRef)CFProperty);
  v51.location = 0;
  CFDataGetBytes((CFDataRef)CFProperty, v51, (UInt8 *)v24 + 14);
  v24[v14 + 14] = 0;
  ramrod_log_msg("Looking for entry under %s\n", v25, v26, v27, v28, v29, v30, v31, (char)v24);
  io_registry_entry_t v32 = IORegistryEntryFromPath(kIOMasterPortDefault, v24);
  if (!v32)
  {
    uint64_t v41 = "tcon-path points to non-existent node\n";
    goto LABEL_28;
  }
  io_object_t v33 = v32;
  CFTypeRef v34 = IORegistryEntryCreateCFProperty(v32, @"firmware", kCFAllocatorDefault, 0);
  IOObjectRelease(v33);
  if (!v34)
  {
    uint64_t v39 = "No 'firmware' property found.\n";
    goto LABEL_18;
  }
  CFTypeID v35 = CFDataGetTypeID();
  if (v35 != CFGetTypeID(v34))
  {
    uint64_t v39 = "IORegistryEntryCreateCFProperty returned non CFDataRef\n";
    goto LABEL_18;
  }
  if (CFDataGetLength((CFDataRef)v34) != 4)
  {
    char v50 = CFDataGetLength((CFDataRef)v34);
    ramrod_log_msg("version_data wrong length (%lu bytes)\n", v42, v43, v44, v45, v46, v47, v48, v50);
    goto LABEL_19;
  }
  BytePtr = CFDataGetBytePtr((CFDataRef)v34);
  if (!BytePtr)
  {
    uint64_t v39 = "CFDataGetBytePtr returned NULL\n";
    goto LABEL_18;
  }
  int v37 = *(_DWORD *)BytePtr;
  ramrod_log_msg("AppleTCON flashable node found. (firmware=%d)\n", v5, v6, v7, v8, v9, v10, v11, *(_DWORD *)BytePtr);
  CFRelease(v34);
  if (!v37) {
    goto LABEL_19;
  }
  if (a1 && (const CFBooleanRef)AMSupportGetValueForKeyPathInDict() == kCFBooleanTrue) {
    uint64_t updated = 1;
  }
  else {
    uint64_t updated = ramrod_update_supported(@"AppleTCON", @"AppleTCONUpdaterErrorDomain: AppleTCONUpdaterExecCommand - execCommand error");
  }
LABEL_20:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeFree();
  return updated;
}

BOOL ramrod_device_ota_appletcon(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return ramrod_device_has_appletcon(0) != 0;
  }
  ramrod_log_msg("Skipping checking TCON for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

BOOL ramrod_device_has_appletconuarp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v25 = 0;
  ramrod_log_msg("opening %s\n", a2, a3, a4, a5, a6, a7, a8, (char)"/usr/lib/updaters/libTconUpdaterUARP.dylib");
  uint64_t v8 = dlopen("/usr/lib/updaters/libTconUpdaterUARP.dylib", 261);
  if (!v8)
  {
    dlerror();
    ramrod_log_msg("unable to open %s. %s, skipping step\n", v17, v18, v19, v20, v21, v22, v23, (char)"/usr/lib/updaters/libTconUpdaterUARP.dylib");
    return 0;
  }
  int v13 = ramrod_copy_updater_functions(v8, "AppleTconUARP", (__CFDictionary *(***)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))&v25, 0, v9, v10, v11, v12);
  CFIndex v14 = v25;
  if (!v13)
  {
    BOOL v16 = 0;
    if (!v25) {
      return v16;
    }
    goto LABEL_5;
  }
  size_t v15 = (unsigned int (*)(void, void))*((void *)v25 + 1);
  if (!v15)
  {
    BOOL v16 = 0;
    goto LABEL_5;
  }
  BOOL v16 = v15(0, 0) == 0;
  CFIndex v14 = v25;
  if (v25) {
LABEL_5:
  }
    free(v14);
  return v16;
}

BOOL ramrod_should_update_appletconuarp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return ramrod_device_has_appletconuarp(a1, a2, a3, a4, a5, a6, a7, a8);
  }
  ramrod_log_msg("Skipping checking AppleTconUARP for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

uint64_t _ramrod_device_has_usbcretimer_callback(_DWORD *a1, io_iterator_t iterator)
{
  io_object_t v3 = IOIteratorNext(iterator);
  if (v3) {
    ++*a1;
  }

  return IOObjectRelease(v3);
}

BOOL _ramrod_device_has_usbcretimer(const __CFString *a1)
{
  kern_return_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  io_object_t v62;
  __CFRunLoop *Current;
  __CFRunLoop *v64;
  id v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  uint64_t v76;
  void *j;
  char v78;
  __CFRunLoopSource *source;
  io_registry_entry_t v80;
  long long v81;
  long long v82;
  long long v83;
  long long v84;
  long long v85;
  long long v86;
  long long v87;
  long long v88;
  uint64_t entryID;
  int refCon;
  io_iterator_t iterator;
  unsigned char v92[128];
  CFStringRef v93;
  CFTypeRef v94;
  unsigned char v95[128];

  iterator = 0;
  io_registry_entry_t v2 = objc_opt_new();
  io_object_t v3 = objc_opt_new();
  io_registry_entry_t v4 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/arm-io");
  refCon = 0;
  ramrod_log_msg("entering %s\n", v5, v6, v7, v8, v9, v10, v11, (char)"_ramrod_device_has_usbcretimer");
  if (ramrod_should_do_legacy_restored_internal_behaviors())
  {
    uint64_t entryID = 0;
    os_parse_boot_arg_int();
  }
  if (!v4)
  {
    uint64_t v19 = "Failed to create DT node for IODeviceTree\n";
    goto LABEL_7;
  }
  if (IORegistryEntryCreateIterator(v4, "IODeviceTree", 1u, &iterator))
  {
    uint64_t v19 = "Failed to create iterator for DeviceTree.\n";
LABEL_7:
    ramrod_log_msg(v19, v12, v13, v14, v15, v16, v17, v18, v78);
LABEL_8:
    BOOL v20 = 0;
    goto LABEL_9;
  }
  io_object_t v22 = IOIteratorNext(iterator);
  if (v22)
  {
    io_registry_entry_t v23 = v22;
    while (1)
    {
      CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v23, @"name", kCFAllocatorDefault, 0);
      if (CFProperty) {
        break;
      }
LABEL_24:
      IOObjectRelease(v23);
      io_registry_entry_t v23 = IOIteratorNext(iterator);
      if (!v23) {
        goto LABEL_25;
      }
    }
    CFDataRef v25 = CFProperty;
    uint64_t entryID = 0;
    IORegistryEntryGetRegistryEntryID(v23, &entryID);
    CFTypeID TypeID = CFDataGetTypeID();
    if (TypeID == CFGetTypeID(v25))
    {
      CFStringRef v34 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, v25, 0x8000100u);
      if (v34)
      {
        CFStringRef v35 = v34;
        if (CFStringHasPrefix(v34, a1)) {
          [v2 addObject:[+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", entryID)]];
        }
        CFRelease(v35);
        goto LABEL_23;
      }
      uint64_t v36 = "nameString NULL\n";
    }
    else
    {
      uint64_t v36 = "nameData not CFDataRef\n";
    }
    ramrod_log_msg(v36, v27, v28, v29, v30, v31, v32, v33, v78);
LABEL_23:
    CFRelease(v25);
    goto LABEL_24;
  }
LABEL_25:
  if (iterator) {
    IOObjectRelease(iterator);
  }
  iterator = 0;
  if (![v2 count]) {
    goto LABEL_8;
  }
  int v80 = v4;
  char v37 = [v2 count];
  ramrod_log_msg("Found %lu nodes in the device tree. Waiting some (small) amount of time for them to register as an IOSerivce\n", v38, v39, v40, v41, v42, v43, v44, v37);
  uint64_t v45 = IONotificationPortCreate(kIOMasterPortDefault);
  source = IONotificationPortGetRunLoopSource(v45);
  int v85 = 0u;
  uint64_t v86 = 0u;
  uint64_t v87 = 0u;
  uint64_t v88 = 0u;
  id v46 = [v2 countByEnumeratingWithState:&v85 objects:v95 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v86;
    do
    {
      for (CFIndex i = 0; i != v47; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v86 != v48) {
          objc_enumerationMutation(v2);
        }
        char v50 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        LODWORD(entryID) = 0;
        uint64_t v93 = @"IOParentMatch";
        CFMutableDictionaryRef v51 = IORegistryEntryIDMatching((uint64_t)[v50 longLongValue]);
        uint64_t v94 = (id)CFMakeCollectable(v51);
        char v52 = +[NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
        if (v52) {
          CFDictionaryRef v53 = (const __CFDictionary *)CFRetain(v52);
        }
        else {
          CFDictionaryRef v53 = 0;
        }
        uint64_t v54 = IOServiceAddMatchingNotification(v45, "IOServiceFirstMatch", v53, (IOServiceMatchingCallback)_ramrod_device_has_usbcretimer_callback, &refCon, (io_iterator_t *)&entryID);
        if (v54)
        {
          ramrod_log_msg("IOServiceAddMatchingNotification() failed with return %d", v55, v56, v57, v58, v59, v60, v61, v54);
        }
        else
        {
          [v3 addObject:[+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", entryID)]];
          uint64_t v62 = IOIteratorNext(entryID);
          if (v62) {
            ++refCon;
          }
          IOObjectRelease(v62);
        }
      }
      id v47 = [v2 countByEnumeratingWithState:&v85 objects:v95 count:16];
    }
    while (v47);
  }
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, source, kCFRunLoopDefaultMode);
  CFRunLoopRunInMode(kCFRunLoopDefaultMode, 5.0, 0);
  uint64_t v64 = CFRunLoopGetCurrent();
  CFRunLoopRemoveSource(v64, source, kCFRunLoopDefaultMode);
  IONotificationPortDestroy(v45);
  uint64_t v65 = (id)refCon;
  if ([v2 count] != v65)
  {
    uint64_t v66 = refCon;
    [v2 count];
    ramrod_log_msg("Found only %d when we should have found %d\n", v67, v68, v69, v70, v71, v72, v73, v66);
  }
  int v83 = 0u;
  int v84 = 0u;
  int v81 = 0u;
  uint64_t v82 = 0u;
  uint64_t v74 = [v3 countByEnumeratingWithState:&v81 objects:v92 count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v82;
    do
    {
      for (j = 0; j != v75; j = (char *)j + 1)
      {
        if (*(void *)v82 != v76) {
          objc_enumerationMutation(v3);
        }
        IOObjectRelease((io_object_t)[*(id *)(*((void *)&v81 + 1) + 8 * (void)j) unsignedIntValue]);
      }
      uint64_t v75 = [v3 countByEnumeratingWithState:&v81 objects:v92 count:16];
    }
    while (v75);
  }
  BOOL v20 = refCon != 0;
  io_registry_entry_t v4 = v80;
LABEL_9:

  if (v4) {
    IOObjectRelease(v4);
  }
  return v20;
}

BOOL ramrod_device_has_usbcretimer()
{
  return _ramrod_device_has_usbcretimer(@"atcrt") || _ramrod_device_has_usbcretimer(@"uatcrt");
}

BOOL ramrod_should_update_usbcretimer(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return ramrod_device_has_usbcretimer();
  }
  ramrod_log_msg("Skipping checking retimer for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

BOOL ramrod_should_update_usbcretimer_uarp(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return _ramrod_device_has_usbcretimer(@"uatcrt");
  }
  ramrod_log_msg("Skipping checking retimer for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

BOOL ramrod_device_has_ace3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDataRef v25 = 0;
  ramrod_log_msg("opening %s\n", a2, a3, a4, a5, a6, a7, a8, (char)"/usr/lib/updaters/libAce3Updater.dylib");
  uint64_t v8 = dlopen("/usr/lib/updaters/libAce3Updater.dylib", 261);
  if (!v8)
  {
    dlerror();
    ramrod_log_msg("unable to open %s. %s, skipping step\n", v17, v18, v19, v20, v21, v22, v23, (char)"/usr/lib/updaters/libAce3Updater.dylib");
    return 0;
  }
  int v13 = ramrod_copy_updater_functions(v8, "Ace3", (__CFDictionary *(***)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))&v25, 0, v9, v10, v11, v12);
  uint64_t v14 = v25;
  if (!v13)
  {
    BOOL v16 = 0;
    if (!v25) {
      return v16;
    }
    goto LABEL_5;
  }
  uint64_t v15 = (unsigned int (*)(void, void))*((void *)v25 + 1);
  if (!v15)
  {
    BOOL v16 = 0;
    goto LABEL_5;
  }
  BOOL v16 = v15(0, 0) == 0;
  uint64_t v14 = v25;
  if (v25) {
LABEL_5:
  }
    free(v14);
  return v16;
}

BOOL ramrod_should_update_ace3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    ramrod_log_msg("Skipping checking Ace3 for booted update\n", a2, a3, a4, a5, a6, a7, a8, vars0);
    return 0;
  }
  else
  {
    return ramrod_device_has_ace3(a1, a2, a3, a4, a5, a6, a7, a8);
  }
}

uint64_t ramrod_device_has_manta_mcu(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  ramrod_log_msg("entering %s\n", a2, a3, a4, a5, a6, a7, a8, (char)"ramrod_device_has_manta_mcu");
  CFDictionaryRef v8 = IOServiceNameMatching("manta-b");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v8);
  if (MatchingService)
  {
    io_object_t v17 = MatchingService;
    CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, @"supports-mcu-restore", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFDataRef v26 = CFProperty;
      CFTypeID TypeID = CFDataGetTypeID();
      if (TypeID == CFGetTypeID(v26))
      {
        if (CFDataGetLength(v26) <= 0)
        {
          char Length = CFDataGetLength(v26);
          ramrod_log_msg("supports-mcu-restore wrong length (%lu bytes)\n", v38, v39, v40, v41, v42, v43, v44, Length);
          goto LABEL_12;
        }
        if (*CFDataGetBytePtr(v26) == 1)
        {
          uint64_t v35 = 1;
LABEL_13:
          IOObjectRelease(v17);
          CFRelease(v26);
          return v35;
        }
        UInt8 v45 = *CFDataGetBytePtr(v26);
        uint64_t v36 = "supports-mcu-restore is %u, the device does not support manta mcu restore time firmware update.\n";
      }
      else
      {
        uint64_t v36 = "IORegistryEntryCreateCFProperty returned non CFDataRef for supports-mcu-restore property.\n";
      }
      ramrod_log_msg(v36, v28, v29, v30, v31, v32, v33, v34, v45);
LABEL_12:
      uint64_t v35 = 0;
      goto LABEL_13;
    }
    ramrod_log_msg("manta-b ioregistry entry does not have supports-mcu-restore property, the device does not support manta mcu restore time firmware update.\n", v19, v20, v21, v22, v23, v24, v25, v45);
    IOObjectRelease(v17);
  }
  else
  {
    ramrod_log_msg("Could not find manta-b ioregistry entry, the device does not support manta mcu.\n", v10, v11, v12, v13, v14, v15, v16, v45);
  }
  return 0;
}

BOOL ramrod_should_update_manta_mcu(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return ramrod_device_has_manta_mcu(a1, a2, a3, a4, a5, a6, a7, a8) != 0;
  }
  ramrod_log_msg("Skipping checking manta mcu for booted update.\n", a2, a3, a4, a5, a6, a7, a8, vars0);
  return 0;
}

BOOL ramrod_device_has_vinyl()
{
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  if (!ramrod_device_has_baseband()) {
    return 0;
  }
  ramrod_log_msg("opening %s\n", v0, v1, v2, v3, v4, v5, v6, (char)"/usr/lib/updaters/libVinylUpdater.dylib");
  uint64_t v7 = dlopen("/usr/lib/updaters/libVinylUpdater.dylib", 261);
  if (!v7)
  {
    dlerror();
    ramrod_log_msg("unable to open %s. %s, skipping step\n", v16, v17, v18, v19, v20, v21, v22, (char)"/usr/lib/updaters/libVinylUpdater.dylib");
    return 0;
  }
  int v12 = ramrod_copy_updater_functions(v7, "Vinyl", (__CFDictionary *(***)(const __CFDictionary *, uint64_t, uint64_t, CFErrorRef *))&v25, 0, v8, v9, v10, v11);
  uint64_t v13 = v25;
  if (!v12)
  {
    BOOL v15 = 0;
    if (!v25) {
      return v15;
    }
    goto LABEL_6;
  }
  uint64_t v14 = (unsigned int (*)(void, uint64_t *))*((void *)v25 + 1);
  if (!v14)
  {
    BOOL v15 = 0;
    goto LABEL_6;
  }
  BOOL v15 = v14(0, &v24) == 0;
  uint64_t v13 = v25;
  if (v25) {
LABEL_6:
  }
    free(v13);
  return v15;
}

BOOL ramrod_should_update_vinyl(int a1)
{
  return !a1 && ramrod_device_has_vinyl();
}

void sub_10001552C()
{
  if ((ramrod_should_do_legacy_restored_behaviors() & 1) == 0 && qword_10002E648 != -1)
  {
    dispatch_once(&qword_10002E648, &stru_100025540);
  }
}

void sub_100015580(id a1)
{
  for (uint64_t i = 0; i != 72; i += 6)
  {
    if (CFEqual(off_10002E348[i + 1], @"update_rose"))
    {
      int v9 = os_variant_uses_ephemeral_storage();
      if (v9) {
        uint64_t v10 = "ramrod_update running in limited environment\n";
      }
      else {
        uint64_t v10 = "ramrod_update running in normal env\n";
      }
      ramrod_log_msg(v10, v2, v3, v4, v5, v6, v7, v8, v11);
      if (v9) {
        BYTE1(off_10002E348[i + 4]) = 1;
      }
    }
  }
}

void sub_10001582C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015898()
{
  sub_1000039B4();
  sub_100003998((void *)&_mh_execute_header, v0, v1, "RSD Listener received an error", v2, v3, v4, v5, v6);
}

void sub_1000158CC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015938()
{
  sub_1000039B4();
  sub_100003998((void *)&_mh_execute_header, v0, v1, "RSD Peer received an error", v2, v3, v4, v5, v6);
}

void sub_10001596C()
{
}

void sub_100015988()
{
  sub_1000039B4();
  sub_100003998((void *)&_mh_execute_header, v0, v1, "request command missing", v2, v3, v4, v5, v6);
}

void sub_1000159BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015A34(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015AA0()
{
  sub_1000039B4();
  sub_100003998((void *)&_mh_execute_header, v0, v1, "Unable to copy AP nonce", v2, v3, v4, v5, v6);
}

void sub_100015AD4()
{
  sub_1000039B4();
  sub_100003998((void *)&_mh_execute_header, v0, v1, "Unable to copy SEP nonce", v2, v3, v4, v5, v6);
}

void sub_100015B08(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015B78(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015BE4()
{
  sub_1000039B4();
  sub_100003998((void *)&_mh_execute_header, v0, v1, "Bogus request: client doesn't expect reply", v2, v3, v4, v5, v6);
}

void sub_100015C18()
{
  sub_1000039B4();
  sub_100003998((void *)&_mh_execute_header, v0, v1, "language argument missing", v2, v3, v4, v5, v6);
}

void sub_100015C4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100015CC4(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_FAULT, "Failed to reboot the device: %{errno}d", (uint8_t *)v3, 8u);
}

void sub_100015D54(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  sub_100007598(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  _os_crash_msg();
  __break(1u);
}

void sub_100015E04(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  sub_100007598(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  _os_crash_msg();
  __break(1u);
}

void sub_100015EA0(void *a1, _OWORD *a2)
{
  sub_100007BAC(a1, a2);
  sub_100007BC4();
  sub_100007B90();
  sub_100007598(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg();
  __break(1u);
}

void sub_100015F34(void *a1, _OWORD *a2)
{
  sub_100007BAC(a1, a2);
  sub_100007BC4();
  sub_100007B90();
  sub_100007598(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg();
  __break(1u);
}

void sub_100015FB4(void *a1, _OWORD *a2)
{
  sub_100007BAC(a1, a2);
  sub_100007BC4();
  sub_100007B90();
  sub_100007598(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg();
  __break(1u);
}

void sub_100016048(void *a1, _OWORD *a2)
{
  sub_100007BAC(a1, a2);
  sub_100007BC4();
  sub_100007B90();
  sub_100007598(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg();
  __break(1u);
}

void sub_1000160C8(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  sub_100007B90();
  sub_100007598(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg();
  __break(1u);
}

void sub_10001616C(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  sub_100007B90();
  sub_100007598(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg();
  __break(1u);
}

void sub_1000161FC(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  sub_100007B90();
  sub_100007598(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg();
  __break(1u);
}

uint64_t AMAuthInstallApImg4EncodeRestoreInfo()
{
  return _AMAuthInstallApImg4EncodeRestoreInfo();
}

uint64_t AMAuthInstallUpdaterTwoStageEnabled()
{
  return _AMAuthInstallUpdaterTwoStageEnabled();
}

uint64_t AMSupportCreateURLFromString()
{
  return _AMSupportCreateURLFromString();
}

uint64_t AMSupportGetValueForKeyPathInDict()
{
  return _AMSupportGetValueForKeyPathInDict();
}

uint64_t AMSupportLogInternal()
{
  return _AMSupportLogInternal();
}

uint64_t AMSupportSafeFree()
{
  return _AMSupportSafeFree();
}

uint64_t AMSupportSafeRelease()
{
  return _AMSupportSafeRelease();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return _CC_SHA1_Final(md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return _CC_SHA1_Init(c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA1_Update(c, data, len);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA384(data, len, md);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return _CFCopyDescription(cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateCopy(allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return _CFErrorCopyDescription(err);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return _CFErrorCopyUserInfo(err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return _CFMakeCollectable(cf);
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return _CFNumberCompare(number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return _CFStringCreateFromExternalRepresentation(alloc, data, encoding);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return _CFStringGetIntValue(str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return _CFStringHasPrefix(theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return _CFStringHasSuffix(theString, suffix);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return _CFURLGetFileSystemRepresentation(url, resolveAgainstBase, buffer, maxBufLen);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

kern_return_t IORegistryCreateIterator(mach_port_t mainPort, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryCreateIterator(mainPort, plane, options, iterator);
}

CFStringRef IORegistryEntryCopyPath(io_registry_entry_t entry, const io_name_t plane)
{
  return _IORegistryEntryCopyPath(entry, plane);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryEntryCreateIterator(entry, plane, options, iterator);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceMatchPropertyTable(io_service_t service, CFDictionaryRef matching, BOOLean_t *matches)
{
  return _IOServiceMatchPropertyTable(service, matching, matches);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return _IOServiceWaitQuiet(service, waitTime);
}

uint64_t Img4DecodeGetManifest()
{
  return _Img4DecodeGetManifest();
}

uint64_t Img4DecodeInit()
{
  return _Img4DecodeInit();
}

uint64_t Img4DecodeParseLengthFromBuffer()
{
  return _Img4DecodeParseLengthFromBuffer();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetProductType()
{
  return _MGGetProductType();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

void _exit(int a1)
{
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _os_crash_msg()
{
  return __os_crash_msg();
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

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return _calloc(__count, __size);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return _dispatch_block_wait(block, timeout);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

pid_t fork(void)
{
  return _fork();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fsync(int a1)
{
  return _fsync(a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return _getpid();
}

pid_t getppid(void)
{
  return _getppid();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return _gmtime_r(a1, a2);
}

kern_return_t host_reboot(host_priv_t host_priv, int options)
{
  return _host_reboot(host_priv, options);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

mach_port_t mach_host_self(void)
{
  return _mach_host_self();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return _os_parse_boot_arg_int();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return _os_variant_uses_ephemeral_storage();
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_init(a1);
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return _realloc(__ptr, __size);
}

uint64_t reboot3()
{
  return _reboot3();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return _strncasecmp(a1, a2, a3);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return _vasprintf(a1, a2, a3);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_copy_clean_description()
{
  return _xpc_copy_clean_description();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return _xpc_dictionary_expects_reply();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return _xpc_dictionary_send_reply();
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

uint64_t xpc_remote_connection_activate()
{
  return _xpc_remote_connection_activate();
}

uint64_t xpc_remote_connection_create_remote_service_listener()
{
  return _xpc_remote_connection_create_remote_service_listener();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return _xpc_remote_connection_set_event_handler();
}

id objc_msgSend_IOMatchingPropertyTable(void *a1, const char *a2, ...)
{
  return [a1 IOMatchingPropertyTable];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__crossingRegionChangeBoundary(void *a1, const char *a2, ...)
{
  return [a1 _crossingRegionChangeBoundary];
}

id objc_msgSend__findFirmwareInfoEntry(void *a1, const char *a2, ...)
{
  return [a1 _findFirmwareInfoEntry];
}

id objc_msgSend__maxExtendedRegionSize(void *a1, const char *a2, ...)
{
  return [a1 _maxExtendedRegionSize];
}

id objc_msgSend__maxImageSize(void *a1, const char *a2, ...)
{
  return [a1 _maxImageSize];
}

id objc_msgSend__restoreInfoDictionary(void *a1, const char *a2, ...)
{
  return [a1 _restoreInfoDictionary];
}

id objc_msgSend__setupFileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 _setupFileDescriptor];
}

id objc_msgSend__stitchFirmwareImage(void *a1, const char *a2, ...)
{
  return [a1 _stitchFirmwareImage];
}

id objc_msgSend__updaterClasses(void *a1, const char *a2, ...)
{
  return [a1 _updaterClasses];
}

id objc_msgSend__usesExtendediBootRegion(void *a1, const char *a2, ...)
{
  return [a1 _usesExtendediBootRegion];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_ans2Data(void *a1, const char *a2, ...)
{
  return [a1 ans2Data];
}

id objc_msgSend_apNonce(void *a1, const char *a2, ...)
{
  return [a1 apNonce];
}

id objc_msgSend_apNonceSlotID(void *a1, const char *a2, ...)
{
  return [a1 apNonceSlotID];
}

id objc_msgSend_bootBlockImages(void *a1, const char *a2, ...)
{
  return [a1 bootBlockImages];
}

id objc_msgSend_bumpGeneration(void *a1, const char *a2, ...)
{
  return [a1 bumpGeneration];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_computeHash(void *a1, const char *a2, ...)
{
  return [a1 computeHash];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_devicePath(void *a1, const char *a2, ...)
{
  return [a1 devicePath];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_findHeaders(void *a1, const char *a2, ...)
{
  return [a1 findHeaders];
}

id objc_msgSend_findPreparedHeader(void *a1, const char *a2, ...)
{
  return [a1 findPreparedHeader];
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return [a1 finished];
}

id objc_msgSend_firmwareImages(void *a1, const char *a2, ...)
{
  return [a1 firmwareImages];
}

id objc_msgSend_firmwareWriter(void *a1, const char *a2, ...)
{
  return [a1 firmwareWriter];
}

id objc_msgSend_headerGeneration(void *a1, const char *a2, ...)
{
  return [a1 headerGeneration];
}

id objc_msgSend_headerHash(void *a1, const char *a2, ...)
{
  return [a1 headerHash];
}

id objc_msgSend_headerSignature(void *a1, const char *a2, ...)
{
  return [a1 headerSignature];
}

id objc_msgSend_headerVersion(void *a1, const char *a2, ...)
{
  return [a1 headerVersion];
}

id objc_msgSend_ibootData(void *a1, const char *a2, ...)
{
  return [a1 ibootData];
}

id objc_msgSend_imageAddress(void *a1, const char *a2, ...)
{
  return [a1 imageAddress];
}

id objc_msgSend_invalidHeaders(void *a1, const char *a2, ...)
{
  return [a1 invalidHeaders];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return [a1 isAvailable];
}

id objc_msgSend_isErase(void *a1, const char *a2, ...)
{
  return [a1 isErase];
}

id objc_msgSend_isSingleStageBoot(void *a1, const char *a2, ...)
{
  return [a1 isSingleStageBoot];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_llbData(void *a1, const char *a2, ...)
{
  return [a1 llbData];
}

id objc_msgSend_llbWriter(void *a1, const char *a2, ...)
{
  return [a1 llbWriter];
}

id objc_msgSend_logoData(void *a1, const char *a2, ...)
{
  return [a1 logoData];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_makeValid(void *a1, const char *a2, ...)
{
  return [a1 makeValid];
}

id objc_msgSend_matchedService(void *a1, const char *a2, ...)
{
  return [a1 matchedService];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nodeDescriptor(void *a1, const char *a2, ...)
{
  return [a1 nodeDescriptor];
}

id objc_msgSend_numberOfBytesRemainingInBlock(void *a1, const char *a2, ...)
{
  return [a1 numberOfBytesRemainingInBlock];
}

id objc_msgSend_openService(void *a1, const char *a2, ...)
{
  return [a1 openService];
}

id objc_msgSend_packStructure(void *a1, const char *a2, ...)
{
  return [a1 packStructure];
}

id objc_msgSend_preferredBlockSize(void *a1, const char *a2, ...)
{
  return [a1 preferredBlockSize];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return [a1 raise];
}

id objc_msgSend_requiresSEPInFW(void *a1, const char *a2, ...)
{
  return [a1 requiresSEPInFW];
}

id objc_msgSend_resetImages(void *a1, const char *a2, ...)
{
  return [a1 resetImages];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_secondaryPayloadOffset(void *a1, const char *a2, ...)
{
  return [a1 secondaryPayloadOffset];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceConnect(void *a1, const char *a2, ...)
{
  return [a1 serviceConnect];
}

id objc_msgSend_serviceWriter(void *a1, const char *a2, ...)
{
  return [a1 serviceWriter];
}

id objc_msgSend_setAsFirstGeneration(void *a1, const char *a2, ...)
{
  return [a1 setAsFirstGeneration];
}

id objc_msgSend_shouldCommit(void *a1, const char *a2, ...)
{
  return [a1 shouldCommit];
}

id objc_msgSend_spiDriverConnect(void *a1, const char *a2, ...)
{
  return [a1 spiDriverConnect];
}

id objc_msgSend_startLocation(void *a1, const char *a2, ...)
{
  return [a1 startLocation];
}

id objc_msgSend_supportsAFUH(void *a1, const char *a2, ...)
{
  return [a1 supportsAFUH];
}

id objc_msgSend_supportsDualiBoot(void *a1, const char *a2, ...)
{
  return [a1 supportsDualiBoot];
}

id objc_msgSend_supportsPCIeNANDBoot(void *a1, const char *a2, ...)
{
  return [a1 supportsPCIeNANDBoot];
}

id objc_msgSend_supportsSlotIDs(void *a1, const char *a2, ...)
{
  return [a1 supportsSlotIDs];
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return [a1 systemUptime];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updater(void *a1, const char *a2, ...)
{
  return [a1 updater];
}

id objc_msgSend_usesAFUH(void *a1, const char *a2, ...)
{
  return [a1 usesAFUH];
}

id objc_msgSend_valid(void *a1, const char *a2, ...)
{
  return [a1 valid];
}

id objc_msgSend_validHash(void *a1, const char *a2, ...)
{
  return [a1 validHash];
}

id objc_msgSend_validHeaderSignature(void *a1, const char *a2, ...)
{
  return [a1 validHeaderSignature];
}

id objc_msgSend_workBlock(void *a1, const char *a2, ...)
{
  return [a1 workBlock];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}

id objc_msgSend_writer(void *a1, const char *a2, ...)
{
  return [a1 writer];
}