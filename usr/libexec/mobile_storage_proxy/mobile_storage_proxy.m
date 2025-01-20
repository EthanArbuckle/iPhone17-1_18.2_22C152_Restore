id sub_100002D6C()
{
  void *v0;
  uint64_t vars8;

  if (qword_1000241E0 != -1) {
    dispatch_once(&qword_1000241E0, &stru_100020638);
  }
  v0 = (void *)qword_1000241E8;

  return v0;
}

void sub_100002DC0(id a1)
{
  qword_1000241E8 = (uint64_t)dispatch_queue_create("com.apple.mobile_storage_proxy.filetransfer", 0);

  _objc_release_x1();
}

id sub_100002E00()
{
  if (qword_1000241F0 != -1) {
    dispatch_once(&qword_1000241F0, &stru_100020658);
  }
  v0 = (void *)qword_1000241F8;

  return v0;
}

void sub_100002E54(id a1)
{
  qword_1000241F8 = (uint64_t)dispatch_queue_create("com.apple.mobile_storage_proxy.hostconnections", 0);

  _objc_release_x1();
}

void sub_100002E94(uint64_t a1)
{
  v2 = sub_100002D6C();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002F1C;
  block[3] = &unk_100020678;
  block[4] = a1;
  dispatch_sync(v2, block);
}

void sub_100002F1C(uint64_t a1)
{
  if (byte_100024200)
  {
    unlink(&byte_100024200);
    bzero(&byte_100024200, 0x400uLL);
  }
  v2 = *(const char **)(a1 + 32);
  if (v2)
  {
    strncpy(&byte_100024200, v2, 0x3FFuLL);
  }
}

uint64_t sub_100002F94()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  v0 = sub_100002D6C();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003048;
  block[3] = &unk_1000206A0;
  block[4] = &v4;
  dispatch_sync(v0, block);

  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t sub_100003048(uint64_t result)
{
  if (byte_100024200) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = &byte_100024200;
  }
  return result;
}

void sub_10000306C(char a1)
{
  v2 = sub_100002D6C();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000030F4;
  block[3] = &unk_1000206C0;
  char v4 = a1;
  dispatch_sync(v2, block);
}

uint64_t sub_1000030F4(uint64_t result)
{
  byte_100024600 = *(unsigned char *)(result + 32);
  return result;
}

uint64_t sub_100003104()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v0 = sub_100002D6C();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000031B8;
  block[3] = &unk_1000206A0;
  void block[4] = &v4;
  dispatch_sync(v0, block);

  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t sub_1000031B8(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = byte_100024600;
  return result;
}

uint64_t sub_1000031D0()
{
  uint64_t result = MKBGetDeviceLockState();
  if (result != 1) {
    return MKBGetDeviceLockState() == 2;
  }
  return result;
}

uint64_t sub_100003204(const __CFDictionary *a1, __CFDictionary *a2)
{
  if (!a1 || !a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v28 = @"Invalid input(s).";
    uint64_t v29 = 122;
    int v30 = -3;
    goto LABEL_34;
  }
  id value = objc_alloc_init((Class)NSMutableArray);
  if (!value)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create array.", buf, 2u);
    }
    v28 = @"Failed to create array.";
    uint64_t v29 = 128;
    int v30 = -2;
LABEL_34:
    v31 = sub_10000A984((uint64_t)"handle_lookup_image", v29, v30, 0, v28, v25, v26, v27, v41);
    id value = 0;
    uint64_t v6 = 0;
    uint64_t v4 = 0;
    goto LABEL_35;
  }
  uint64_t v4 = CFDictionaryGetValue(a1, @"ImageType");
  v5 = sub_10000A160(v4);

  if (v5)
  {
    uint64_t v6 = (void *)MobileStorageCopyDevicesWithError();
    char v7 = sub_10000A0F4(v6);

    if (v7)
    {
      if ([v6 count])
      {
        unint64_t v8 = 0;
        v9 = 0;
        v10 = 0;
        v11 = 0;
        v12 = 0;
        do
        {
          v13 = v9;
          v9 = [v6 objectAtIndexedSubscript:v8];

          v14 = sub_10000A088(v9);

          if (v14)
          {
            v15 = [v9 objectForKeyedSubscript:@"DeviceType"];

            v16 = sub_10000A160(v15);

            if (v16)
            {
              if ([v15 isEqualToString:@"DiskImage"])
              {
                v17 = [v9 objectForKeyedSubscript:@"DiskImageType"];

                v18 = sub_10000A160(v17);

                if (v18)
                {
                  if ([v4 isEqualToString:v17])
                  {
                    v19 = [v9 objectForKeyedSubscript:@"ImageSignature"];

                    v20 = sub_10000A1CC(v19);

                    if (v20)
                    {
                      [value addObject:v19];
                    }
                    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      unsigned int v24 = [v6 count];
                      *(_DWORD *)buf = 138412802;
                      *(void *)v44 = @"ImageSignature";
                      *(_WORD *)&v44[8] = 1024;
                      *(_DWORD *)v45 = v8 + 1;
                      *(_WORD *)&v45[4] = 1024;
                      *(_DWORD *)&v45[6] = v24;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value %@ for entry %d of %d.", buf, 0x18u);
                    }
                    v12 = v19;
                  }
                }
                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int v23 = [v6 count];
                  *(_DWORD *)buf = 138412802;
                  *(void *)v44 = @"DiskImageType";
                  *(_WORD *)&v44[8] = 1024;
                  *(_DWORD *)v45 = v8 + 1;
                  *(_WORD *)&v45[4] = 1024;
                  *(_DWORD *)&v45[6] = v23;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value %@ for entry %d of %d.", buf, 0x18u);
                }
                v11 = v17;
              }
            }
            else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v22 = [v6 count];
              *(_DWORD *)buf = 138412802;
              *(void *)v44 = @"DeviceType";
              *(_WORD *)&v44[8] = 1024;
              *(_DWORD *)v45 = v8 + 1;
              *(_WORD *)&v45[4] = 1024;
              *(_DWORD *)&v45[6] = v22;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value %@ for entry %d of %d.", buf, 0x18u);
            }
            v10 = v15;
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            unsigned int v21 = [v6 count];
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v44 = v8;
            *(_WORD *)&v44[4] = 1024;
            *(_DWORD *)&v44[6] = v21;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve entry %d of %d.", buf, 0xEu);
          }
          ++v8;
        }
        while (v8 < [v6 count]);
      }
      else
      {
        v12 = 0;
        v11 = 0;
        v10 = 0;
        v9 = 0;
      }
      CFDictionarySetValue(a2, @"ImageSignature", value);
      CFDictionarySetValue(a2, @"Status", @"Complete");
      v31 = 0;
      uint64_t v32 = 1;
      goto LABEL_49;
    }
    id v36 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to copy device list."];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v44 = v36;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v31 = sub_10000A984((uint64_t)"handle_lookup_image", 143, -2, 0, @"Failed to copy device list.", v37, v38, v39, v41);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)v44 = @"ImageType";
      *(_WORD *)&v44[8] = 2112;
      *(void *)v45 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
    }
    v31 = sub_10000A984((uint64_t)"handle_lookup_image", 135, -2, 0, @"Invalid value for %@: %@", v33, v34, v35, @"ImageType");
    CFDictionarySetValue(a2, @"Error", @"MissingImageType");
    uint64_t v6 = 0;
  }
LABEL_35:
  v9 = 0;
  uint64_t v32 = 0;
  if (a2 && v31)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v31 description]);
    uint64_t v32 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
  }
LABEL_49:

  return v32;
}

uint64_t sub_10000397C(const __CFDictionary *a1, __CFDictionary *a2)
{
  if (!a1 || !a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v18 = sub_10000A984((uint64_t)"handle_mount_image", 232, -3, 0, @"Invalid input(s).", v20, v21, v22, v58);
    unsigned int v23 = 0;
    v13 = 0;
    v9 = 0;
    unsigned int v24 = 0;
    uint64_t v6 = 0;
    uint64_t v4 = 0;
    goto LABEL_48;
  }
  uint64_t v4 = CFDictionaryGetValue(a1, @"ImageType");
  v5 = sub_10000A160(v4);

  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v60 = @"ImageType";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
    }
    v18 = sub_10000A984((uint64_t)"handle_mount_image", 239, -3, 0, @"Invalid value for %@.", v25, v26, v27, @"ImageType");
    CFDictionarySetValue(a2, @"Error", @"MissingImageType");
    unsigned int v23 = 0;
    v13 = 0;
    v9 = 0;
    unsigned int v24 = 0;
    uint64_t v6 = 0;
    goto LABEL_48;
  }
  uint64_t v6 = CFDictionaryGetValue(a1, @"ImageSignature");
  char v7 = sub_10000A1CC(v6);

  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v60 = @"ImageSignature";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
    }
    v18 = sub_10000A984((uint64_t)"handle_mount_image", 247, -3, 0, @"Invalid value for %@.", v28, v29, v30, @"ImageSignature");
    CFDictionarySetValue(a2, @"Error", @"MissingImageSignature");
    unsigned int v23 = 0;
    v13 = 0;
    v9 = 0;
    goto LABEL_47;
  }
  unint64_t v8 = CFDictionaryGetValue(a1, @"ImageTrustCache");
  v9 = v8;
  if (v8)
  {
    v10 = sub_10000A1CC(v8);

    if (!v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v60 = @"ImageTrustCache";
        __int16 v61 = 2112;
        v62 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for option %@: %@", buf, 0x16u);
      }
      sub_10000A984((uint64_t)"handle_mount_image", 254, -2, 0, @"Invalid value for option %@: %@", v37, v38, v39, @"ImageTrustCache");
      goto LABEL_43;
    }
  }
  if (![v4 isEqualToString:@"Cryptex"])
  {
    v13 = 0;
    goto LABEL_24;
  }
  v11 = sub_10000A1CC(v9);

  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v60 = @"ImageTrustCache";
      __int16 v61 = 2112;
      v62 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for required option %@: %@", buf, 0x16u);
    }
    sub_10000A984((uint64_t)"handle_mount_image", 261, -2, 0, @"Invalid value for required option %@: %@", v43, v44, v45, @"ImageTrustCache");
    v18 = LABEL_43:;
    CFDictionarySetValue(a2, @"Error", @"MissingTrustCache");
    unsigned int v23 = 0;
    v13 = 0;
    goto LABEL_47;
  }
  v12 = CFDictionaryGetValue(a1, @"ImageInfoPlist");
  v13 = v12;
  if (v12)
  {
    v14 = sub_10000A1CC(v12);

    if (!v14)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v60 = @"ImageInfoPlist";
        __int16 v61 = 2112;
        v62 = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for option %@: %@", buf, 0x16u);
      }
      v18 = sub_10000A984((uint64_t)"handle_mount_image", 268, -2, 0, @"Invalid value for option %@: %@", v15, v16, v17, @"ImageInfoPlist");
      v19 = off_100020908;
LABEL_39:
      CFDictionarySetValue(a2, @"Error", *v19);
      unsigned int v23 = 0;
LABEL_47:
      unsigned int v24 = 0;
      goto LABEL_48;
    }
  }
LABEL_24:
  id v31 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v31)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }
    v18 = sub_10000A984((uint64_t)"handle_mount_image", 277, -2, 0, @"Failed to create dictionary.", v40, v41, v42, v58);
    v19 = off_100020938;
    goto LABEL_39;
  }
  unsigned int v23 = v31;
  uint64_t v32 = sub_100002F94();
  if (!v32)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disk image is missing.", buf, 2u);
    }
    v18 = sub_10000A984((uint64_t)"handle_mount_image", 294, -2, 0, @"Disk image is missing.", v46, v47, v48, v58);
    CFDictionarySetValue(a2, @"Error", @"MissingImagePath");
    goto LABEL_47;
  }
  unsigned int v24 = +[NSString stringWithUTF8String:v32];
  uint64_t v33 = sub_10000A160(v24);

  if (v33)
  {
    [v23 setObject:@"DiskImage" forKeyedSubscript:@"DeviceType"];
    [v23 setObject:v4 forKeyedSubscript:@"DiskImageType"];
    [v23 setObject:v6 forKeyedSubscript:@"ImageSignature"];
    if (v9) {
      [v23 setObject:v9 forKeyedSubscript:@"ImageTrustCache"];
    }
    if (v13) {
      [v23 setObject:v13 forKeyedSubscript:@"ImageInfoPlist"];
    }
    uint64_t v34 = MobileStorageMountWithError();
    if (v34)
    {
      uint64_t v35 = (void *)v34;
      CFDictionarySetValue(a2, @"Status", @"Complete");

      v18 = 0;
      uint64_t v36 = 1;
      goto LABEL_53;
    }
    v54 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Failed to mount %@.", v24];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v60 = v54;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v18 = sub_10000A984((uint64_t)"handle_mount_image", 315, -2, 0, @"Failed to mount %@.", v55, v56, v57, (uint64_t)v24);

    v53 = off_100020940;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
    }
    v18 = sub_10000A984((uint64_t)"handle_mount_image", 289, -2, 0, @"Failed to create string.", v50, v51, v52, v58);
    v53 = off_100020928;
  }
  CFDictionarySetValue(a2, @"Error", *v53);
LABEL_48:
  sub_100002E94(0);
  uint64_t v36 = 0;
  if (a2 && v18)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v18 description]);
    uint64_t v36 = 0;
  }
LABEL_53:

  return v36;
}

uint64_t sub_1000042DC(const __CFDictionary *a1, __CFDictionary *a2)
{
  if (a1 && a2)
  {
    Value = (void *)CFDictionaryGetValue(a1, @"MountPath");
    uint64_t v4 = sub_10000A160(Value);

    if (v4)
    {
      if (!MobileStorageUnmountWithError())
      {
        CFDictionarySetValue(a2, @"Status", @"Complete");
        v9 = 0;
        uint64_t v16 = 1;
        goto LABEL_20;
      }
      v5 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Failed to unmount %@.", Value];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v20 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
      v9 = sub_10000A984((uint64_t)"handle_unmount_image", 368, -2, 0, @"Failed to unmount %@.", v6, v7, v8, (uint64_t)Value);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v20 = @"MountPath";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
      }
      v9 = sub_10000A984((uint64_t)"handle_unmount_image", 362, -3, 0, @"Invalid value for %@.", v13, v14, v15, @"MountPath");
      CFDictionarySetValue(a2, @"Error", @"MissingImagePath");
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v9 = sub_10000A984((uint64_t)"handle_unmount_image", 356, -3, 0, @"Invalid input(s).", v10, v11, v12, v18);
  }
  uint64_t v16 = 0;
  if (a2 && v9)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v9 description]);
    uint64_t v16 = 0;
  }
LABEL_20:

  return v16;
}

uint64_t sub_100004600(uint64_t a1, __CFDictionary *a2)
{
  if (a1 && a2)
  {
    if (MobileStorageRollPersonalizationNonceWithError())
    {
      CFDictionarySetValue(a2, @"Status", @"Complete");
      v3 = 0;
      uint64_t v4 = 1;
      goto LABEL_16;
    }
    id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to roll personalization nonce."];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v3 = sub_10000A984((uint64_t)"handle_roll_personalization_nonce", 409, -2, 0, @"Failed to roll personalization nonce.", v9, v10, v11, v13);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v3 = sub_10000A984((uint64_t)"handle_roll_personalization_nonce", 403, -3, 0, @"Invalid input(s).", v5, v6, v7, v13);
  }
  uint64_t v4 = 0;
  if (a2 && v3)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v3 description]);
    uint64_t v4 = 0;
  }
LABEL_16:

  return v4;
}

uint64_t sub_100004850(uint64_t a1, __CFDictionary *a2)
{
  if (a1 && a2)
  {
    if (MobileStorageRollCryptexNonceWithError())
    {
      CFDictionarySetValue(a2, @"Status", @"Complete");
      v3 = 0;
      uint64_t v4 = 1;
      goto LABEL_16;
    }
    id v8 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to roll cryptex nonce."];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v3 = sub_10000A984((uint64_t)"handle_roll_cryptex_nonce", 450, -2, 0, @"Failed to roll cryptex nonce.", v9, v10, v11, v13);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    v3 = sub_10000A984((uint64_t)"handle_roll_cryptex_nonce", 444, -3, 0, @"Invalid input(s).", v5, v6, v7, v13);
  }
  uint64_t v4 = 0;
  if (a2 && v3)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v3 description]);
    uint64_t v4 = 0;
  }
LABEL_16:

  return v4;
}

uint64_t sub_100004AA0(const __CFDictionary *a1, __CFDictionary *a2)
{
  if (a1 && a2)
  {
    uint64_t v4 = CFDictionaryGetValue(a1, @"PersonalizedImageType");
    uint64_t v5 = sub_10000A160(v4);

    if (v5)
    {
      uint64_t v6 = CFDictionaryGetValue(a1, @"ImageSignature");
      uint64_t v7 = sub_10000A1CC(v6);

      if (v7)
      {
        id v8 = (void *)MobileStorageCopyPersonalizationManifestWithError();
        if (v8)
        {
          uint64_t v9 = v8;
          CFDictionarySetValue(a2, @"ImageSignature", v8);

          uint64_t v10 = 0;
          uint64_t v11 = 1;
          goto LABEL_24;
        }
        uint64_t v21 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Failed to copy personalization manifest."];
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v28 = v21;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }
        uint64_t v10 = sub_10000A984((uint64_t)"handle_query_personalization_manifest", 505, -2, 0, @"Failed to copy personalization manifest.", v22, v23, v24, v26);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v28 = @"ImageSignature";
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
        }
        uint64_t v10 = sub_10000A984((uint64_t)"handle_query_personalization_manifest", 499, -3, 0, @"Invalid value for %@.", v18, v19, v20, @"ImageSignature");
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v28 = @"PersonalizedImageType";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
      }
      uint64_t v10 = sub_10000A984((uint64_t)"handle_query_personalization_manifest", 493, -3, 0, @"Invalid value for %@.", v15, v16, v17, @"PersonalizedImageType");
      uint64_t v6 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    uint64_t v10 = sub_10000A984((uint64_t)"handle_query_personalization_manifest", 487, -3, 0, @"Invalid input(s).", v12, v13, v14, v26);
    uint64_t v6 = 0;
    uint64_t v4 = 0;
  }
  uint64_t v11 = 0;
  if (a2 && v10)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v10 description]);
    uint64_t v11 = 0;
  }
LABEL_24:

  return v11;
}

uint64_t sub_100004E6C(const __CFDictionary *a1, __CFDictionary *a2)
{
  if (a1 && a2)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v5 = CFDictionaryGetValue(a1, @"PersonalizedImageType");
    uint64_t v6 = sub_10000A160(v5);

    if (v6) {
      [v4 setObject:v5 forKeyedSubscript:@"PersonalizedImageType"];
    }
    uint64_t v7 = (void *)MobileStorageCopyPersonalizationNonceWithError();
    if (v7)
    {
      id v8 = v7;
      CFDictionarySetValue(a2, @"PersonalizationNonce", v7);

      uint64_t v9 = 0;
      uint64_t v10 = 1;
      goto LABEL_18;
    }
    id v14 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to copy personalization nonce."];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    uint64_t v9 = sub_10000A984((uint64_t)"handle_query_personalization_nonce", 555, -2, 0, @"Failed to copy personalization nonce.", v15, v16, v17, v19);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    uint64_t v9 = sub_10000A984((uint64_t)"handle_query_personalization_nonce", 542, -3, 0, @"Invalid input(s).", v11, v12, v13, v19);
    id v4 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v10 = 0;
  if (a2 && v9)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v9 description]);
    uint64_t v10 = 0;
  }
LABEL_18:

  return v10;
}

uint64_t sub_10000512C(const __CFDictionary *a1, __CFDictionary *a2)
{
  if (a1 && a2)
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    uint64_t v5 = CFDictionaryGetValue(a1, @"PersonalizedImageType");
    uint64_t v6 = sub_10000A160(v5);

    if (v6) {
      [v4 setObject:v5 forKeyedSubscript:@"PersonalizedImageType"];
    }
    uint64_t v7 = (void *)MobileStorageCopyPersonalizationIdentifiersWithError();
    if (v7)
    {
      id v8 = v7;
      CFDictionarySetValue(a2, @"PersonalizationIdentifiers", v7);

      uint64_t v9 = 0;
      uint64_t v10 = 1;
      goto LABEL_18;
    }
    id v14 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to copy personalization identifiers."];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    uint64_t v9 = sub_10000A984((uint64_t)"handle_query_personalization_identifiers", 604, -2, 0, @"Failed to copy personalization identifiers.", v15, v16, v17, v19);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    uint64_t v9 = sub_10000A984((uint64_t)"handle_query_personalization_identifiers", 591, -3, 0, @"Invalid input(s).", v11, v12, v13, v19);
    id v4 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v10 = 0;
  if (a2 && v9)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v9 description]);
    uint64_t v10 = 0;
  }
LABEL_18:

  return v10;
}

uint64_t sub_1000053EC(uint64_t a1, __CFDictionary *a2)
{
  if (a1 && a2)
  {
    v3 = (void *)MobileStorageCopyCryptexNonceWithError();
    if (v3)
    {
      id v4 = v3;
      CFDictionarySetValue(a2, @"CryptexNonce", v3);

      uint64_t v5 = 0;
      uint64_t v6 = 1;
      goto LABEL_16;
    }
    id v10 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to copy cryptex nonce."];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    uint64_t v5 = sub_10000A984((uint64_t)"handle_query_cryptex_nonce", 644, -2, 0, @"Failed to copy cryptex nonce.", v11, v12, v13, v15);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    uint64_t v5 = sub_10000A984((uint64_t)"handle_query_cryptex_nonce", 638, -3, 0, @"Invalid input(s).", v7, v8, v9, v15);
  }
  uint64_t v6 = 0;
  if (a2 && v5)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v5 description]);
    uint64_t v6 = 0;
  }
LABEL_16:

  return v6;
}

uint64_t sub_10000563C(uint64_t a1, __CFDictionary *a2)
{
  if (a1 && a2)
  {
    uint64_t v3 = MobileStorageCopyDeveloperModeStatusWithError();
    CFDictionarySetValue(a2, @"DeveloperModeStatus", +[NSNumber numberWithBool:v3]);
    uint64_t v7 = 0;
    uint64_t v8 = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    uint64_t v7 = sub_10000A984((uint64_t)"handle_query_developer_mode_status", 678, -3, 0, @"Invalid input(s).", v4, v5, v6, v10);
    uint64_t v8 = 0;
    if (a2 && v7)
    {
      if (!CFDictionaryGetValue(a2, @"Error")) {
        CFDictionarySetValue(a2, @"Error", @"InternalError");
      }
      CFDictionarySetValue(a2, @"DetailedError", [v7 description]);
      uint64_t v8 = 0;
    }
  }

  return v8;
}

uint64_t sub_1000058A0(uint64_t a1, __CFDictionary *a2)
{
  if (a1 && a2)
  {
    uint64_t v3 = (void *)MobileStorageCopyDevicesWithError();
    uint64_t v4 = sub_10000A0F4(v3);

    if (v4)
    {
      if (v3) {
        CFDictionarySetValue(a2, @"EntryList", v3);
      }
      CFDictionarySetValue(a2, @"Status", @"Complete");
      uint64_t v5 = 0;
      uint64_t v6 = 1;
      goto LABEL_18;
    }
    id v10 = [objc_alloc((Class)NSString) initWithFormat:@"Failed to copy device list."];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    uint64_t v5 = sub_10000A984((uint64_t)"handle_copy_devices", 724, -2, 0, @"Failed to copy device list.", v11, v12, v13, v15);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    uint64_t v5 = sub_10000A984((uint64_t)"handle_copy_devices", 718, -3, 0, @"Invalid input(s).", v7, v8, v9, v15);
    uint64_t v3 = 0;
  }
  uint64_t v6 = 0;
  if (a2 && v5)
  {
    if (!CFDictionaryGetValue(a2, @"Error")) {
      CFDictionarySetValue(a2, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a2, @"DetailedError", [v5 description]);
    uint64_t v6 = 0;
  }
LABEL_18:

  return v6;
}

uint64_t sub_100005B28(uint64_t a1, CFMutableDictionaryRef theDict)
{
  if (a1) {
    BOOL v3 = theDict == 0;
  }
  else {
    BOOL v3 = 1;
  }
  uint64_t v4 = !v3;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", (uint8_t *)&v11, 2u);
    }
    uint64_t v9 = sub_10000A984((uint64_t)"handle_hangup", 760, -3, 0, @"Invalid input(s).", v6, v7, v8, v11);
    uint64_t v5 = (void *)v9;
    if (theDict && v9)
    {
      if (!CFDictionaryGetValue(theDict, @"Error")) {
        CFDictionarySetValue(theDict, @"Error", @"InternalError");
      }
      CFDictionarySetValue(theDict, @"DetailedError", [v5 description]);
    }
  }
  else
  {
    CFDictionarySetValue(theDict, @"Goodbye", kCFBooleanTrue);
    uint64_t v5 = 0;
  }

  return v4;
}

BOOL sub_100005C60()
{
  uint64_t v4 = 0;
  v5[0] = &v4;
  v5[1] = 0x2020000000;
  int v6 = 0;
  if (!&_lockdown_checkin_xpc)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Platform does not support lockdown.", buf, 2u);
    }
    goto LABEL_8;
  }
  v0 = sub_100002E00();
  *(_DWORD *)(v5[0] + 24) = lockdown_checkin_xpc();

  if (!*(_DWORD *)(v5[0] + 24))
  {
LABEL_8:
    BOOL v1 = 1;
    goto LABEL_9;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_100015228((uint64_t)v5);
  }
  BOOL v1 = *(_DWORD *)(v5[0] + 24) == 0;
LABEL_9:
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100005DBC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_100005DD4(uint64_t a1, uint64_t a2, CFDictionaryRef theDict, __n128 a4)
{
  if (theDict)
  {
    CFDictionaryGetValue(theDict, @"ClientName");
    id v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v21 = 0;
  }
  int v6 = 0;
  a4.n128_u64[0] = 138412290;
  __n128 v20 = a4;
  while (1)
  {
    CFMutableDictionaryRef v7 = sub_100009D0C();
    if (!v7) {
      break;
    }
    uint64_t v8 = (__CFString *)v7;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = lockdown_receive_message();
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v19;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive message: 0x%08x", buf, 8u);
      }
      CFRelease(v8);
      goto LABEL_104;
    }
    CFDictionaryGetValue(0, @"Command");
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    id v10 = sub_10000A160(v9);

    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (!v10)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v23 = @"Command";
        __int16 v24 = 2112;
        uint64_t v25 = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
      }
      id v14 = (__CFDictionary *)v8;
      CFStringRef v15 = @"MissingCommand";
LABEL_17:
      CFDictionarySetValue(v14, @"Error", v15);
LABEL_48:
      char v12 = 0;
      goto LABEL_49;
    }
    if (v11)
    {
      *(_DWORD *)buf = 138543618;
      CFStringRef v23 = v21;
      __int16 v24 = 2114;
      uint64_t v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Host connection (%{public}@): %{public}@", buf, 0x16u);
    }
    if ([(__CFString *)v9 isEqualToString:@"LookupImage", *(_OWORD *)&v20])
    {
      if (sub_100003204(0, (__CFDictionary *)v8)) {
        goto LABEL_39;
      }
      char v12 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v13 = "Failed to lookup image.";
        goto LABEL_46;
      }
    }
    else if ([(__CFString *)v9 isEqualToString:@"CopyDevices"])
    {
      if (sub_1000058A0(0, (__CFDictionary *)v8)) {
        goto LABEL_39;
      }
      char v12 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v13 = "Failed to copy device list.";
        goto LABEL_46;
      }
    }
    else if ([(__CFString *)v9 isEqualToString:@"MountImage"])
    {
      if (sub_1000031D0())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_29;
        }
        goto LABEL_30;
      }
      if (sub_10000397C(0, (__CFDictionary *)v8)) {
        goto LABEL_39;
      }
      char v12 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v13 = "Failed to mount image.";
        goto LABEL_46;
      }
    }
    else if ([(__CFString *)v9 isEqualToString:@"UnmountImage"])
    {
      if (sub_1000031D0())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_29;
        }
        goto LABEL_30;
      }
      if (sub_1000042DC(0, (__CFDictionary *)v8)) {
        goto LABEL_39;
      }
      char v12 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v13 = "Failed to unmount image.";
        goto LABEL_46;
      }
    }
    else
    {
      if (![(__CFString *)v9 isEqualToString:@"Hangup"])
      {
        if ([(__CFString *)v9 isEqualToString:@"ReceiveBytes"])
        {
          if (sub_1000031D0())
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_29;
            }
            goto LABEL_30;
          }
          CFDictionarySetValue((CFMutableDictionaryRef)v8, @"Status", @"ReceiveBytesAck");
          *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = lockdown_send_message();
          if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
          {
            char v12 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            int v18 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
            *(_DWORD *)buf = 67109120;
            LODWORD(v23) = v18;
            uint64_t v13 = "Failed to send message: 0x%08x";
            uint32_t v16 = 8;
            goto LABEL_47;
          }
          if (sub_1000068DC(a2, 0, (__CFDictionary *)v8))
          {
            char v12 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            *(_WORD *)buf = 0;
            uint64_t v13 = "Failed to receive bytes.";
            goto LABEL_46;
          }
        }
        else if ([(__CFString *)v9 isEqualToString:@"RollPersonalizationNonce"])
        {
          if (sub_1000031D0())
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_29;
            }
            goto LABEL_30;
          }
          if ((sub_100004600(0, (__CFDictionary *)v8) & 1) == 0)
          {
            char v12 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            *(_WORD *)buf = 0;
            uint64_t v13 = "Failed to roll personalization nonce.";
LABEL_46:
            uint32_t v16 = 2;
LABEL_47:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v13, buf, v16);
            goto LABEL_48;
          }
        }
        else if ([(__CFString *)v9 isEqualToString:@"RollCryptexNonce"])
        {
          if (sub_1000031D0())
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
LABEL_29:
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device is locked, denying host request.", buf, 2u);
            }
LABEL_30:
            id v14 = (__CFDictionary *)v8;
            CFStringRef v15 = @"DeviceLocked";
            goto LABEL_17;
          }
          if ((sub_100004850(0, (__CFDictionary *)v8) & 1) == 0)
          {
            char v12 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            *(_WORD *)buf = 0;
            uint64_t v13 = "Failed to roll cryptex nonce.";
            goto LABEL_46;
          }
        }
        else if ([(__CFString *)v9 isEqualToString:@"QueryPersonalizationManifest"])
        {
          if ((sub_100004AA0(0, (__CFDictionary *)v8) & 1) == 0)
          {
            char v12 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            *(_WORD *)buf = 0;
            uint64_t v13 = "Failed to query personalization manifest.";
            goto LABEL_46;
          }
        }
        else if ([(__CFString *)v9 isEqualToString:@"QueryNonce"])
        {
          if ((sub_100004E6C(0, (__CFDictionary *)v8) & 1) == 0)
          {
            char v12 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            goto LABEL_83;
          }
        }
        else if ([(__CFString *)v9 isEqualToString:@"QueryPersonalizationIdentifiers"])
        {
          if ((sub_10000512C(0, (__CFDictionary *)v8) & 1) == 0)
          {
            char v12 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            *(_WORD *)buf = 0;
            uint64_t v13 = "Failed to query personalization identifiers.";
            goto LABEL_46;
          }
        }
        else if ([(__CFString *)v9 isEqualToString:@"QueryCryptexNonce"])
        {
          if ((sub_1000053EC(0, (__CFDictionary *)v8) & 1) == 0)
          {
            char v12 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
LABEL_83:
            *(_WORD *)buf = 0;
            uint64_t v13 = "Failed to query personalization nonce.";
            goto LABEL_46;
          }
        }
        else
        {
          if (![(__CFString *)v9 isEqualToString:@"QueryDeveloperModeStatus"])
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v20.n128_u32[0];
              CFStringRef v23 = v9;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid command: %@", buf, 0xCu);
            }
            id v14 = (__CFDictionary *)v8;
            CFStringRef v15 = @"UnknownCommand";
            goto LABEL_17;
          }
          if ((sub_10000563C(0, (__CFDictionary *)v8) & 1) == 0)
          {
            char v12 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_49;
            }
            *(_WORD *)buf = 0;
            uint64_t v13 = "Failed to query developer mode status.";
            goto LABEL_46;
          }
        }
LABEL_39:
        char v12 = 1;
        goto LABEL_49;
      }
      if (sub_100005B28(0, (CFMutableDictionaryRef)v8)) {
        goto LABEL_48;
      }
      char v12 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v13 = "Failed to hangup.";
        goto LABEL_46;
      }
    }
LABEL_49:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sending response: %{public}@", buf, 0xCu);
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = lockdown_send_message();
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      char v12 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        *(_DWORD *)buf = 67109120;
        LODWORD(v23) = v17;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send message: 0x%08x", buf, 8u);
        char v12 = 0;
      }
    }
    CFRelease(v8);
    int v6 = v9;
    if ((v12 & 1) == 0) {
      goto LABEL_105;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
  }
LABEL_104:
  uint64_t v9 = v6;
LABEL_105:
  if (a2) {
    lockdown_disconnect();
  }
}

uint64_t sub_1000068DC(uint64_t a1, const __CFDictionary *a2, __CFDictionary *a3)
{
  bzero(__str, 0x400uLL);
  uint64_t v84 = 0;
  memset(v83, 0, sizeof(v83));
  if (!a1 || !a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    sub_10000A984((uint64_t)"handle_receive_bytes", 135, -3, 0, @"Invalid input(s).", v10, v11, v12, v73);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (sub_100003104())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Existing file transfer in progress.", buf, 2u);
    }
    sub_10000A984((uint64_t)"handle_receive_bytes", 140, -2, 0, @"Existing file transfer in progress.", v6, v7, v8, v73);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(a3, @"Error", @"ExistingTransferInProgress");
LABEL_10:
    id v13 = 0;
    id v14 = 0;
    CFStringRef v15 = 0;
    uint32_t v16 = 0;
LABEL_11:
    int v17 = -1;
LABEL_12:
    uint64_t v18 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }
  uint32_t v16 = CFDictionaryGetValue(a2, @"ImageType");
  __n128 v20 = sub_10000A160(v16);

  if (!v20)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"ImageType";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
    }
    sub_10000A984((uint64_t)"handle_receive_bytes", 148, -3, 0, @"Invalid value for %@.", v31, v32, v33, @"ImageType");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(a3, @"Error", @"MissingImageType");
    id v13 = 0;
    id v14 = 0;
    CFStringRef v15 = 0;
    goto LABEL_11;
  }
  CFStringRef v15 = CFDictionaryGetValue(a2, @"ImageSize");
  id v21 = sub_10000A01C(v15);

  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"ImageSize";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
    }
    sub_10000A984((uint64_t)"handle_receive_bytes", 156, -3, 0, @"Invalid value for %@.", v34, v35, v36, @"ImageSize");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(a3, @"Error", @"MissingImageSize");
    id v13 = 0;
    id v14 = 0;
    goto LABEL_11;
  }
  CFDictionaryGetValue(a2, @"ImageSignature");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = sub_10000A1CC(v14);

  if (!v22)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"ImageSignature";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
    }
    sub_10000A984((uint64_t)"handle_receive_bytes", 164, -3, 0, @"Invalid value for %@.", v37, v38, v39, @"ImageSignature");
    goto LABEL_68;
  }
  if (([v16 isEqualToString:@"Personalized"] & 1) != 0
    || [v16 isEqualToString:@"Cryptex"])
  {
    *(void *)buf = 0;
    uint64_t v75 = 0;
    unsigned int v23 = [v16 isEqualToString:@"Personalized"];
    id v14 = v14;
    uint64_t inited = Img4DecodeInitManifest([v14 bytes], [v14 length], v83);
    if (inited)
    {
      uint64_t v25 = inited;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v81 = 67109120;
        int v82 = v25;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to init img4 manifest: %d", v81, 8u);
      }
      uint64_t v29 = @"Failed to init img4 manifest: %d";
      uint64_t v73 = v25;
      uint64_t v30 = 186;
LABEL_67:
      sub_10000A984((uint64_t)"handle_receive_bytes", v30, -2, 0, v29, v26, v27, v28, v73);
LABEL_68:
      id v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_69:
      id v13 = 0;
      goto LABEL_11;
    }
    if (v23) {
      uint64_t v40 = 1885629799;
    }
    else {
      uint64_t v40 = 1668315236;
    }
    Img4DecodeGetObjectPropertyData((uint64_t)v83, v40, 1145525076, buf, &v75);
    uint64_t v42 = v41;
    if (v41 == 1)
    {
      if (![v16 isEqualToString:@"Cryptex"])
      {
        uint64_t v42 = 1;
        goto LABEL_61;
      }
      Img4DecodeGetObjectPropertyData((uint64_t)v83, 1885629799, 1145525076, buf, &v75);
      uint64_t v42 = v43;
    }
    if (!v42)
    {
      id v44 = objc_alloc((Class)NSData);
      id v45 = [v44 initWithBytes:*(void *)buf length:v75];

      if (!v45)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v81 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", v81, 2u);
        }
        sub_10000A984((uint64_t)"handle_receive_bytes", 206, -2, 0, @"Failed to create data.", v60, v61, v62, v73);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        id v14 = 0;
        goto LABEL_69;
      }
      id v14 = v45;
      goto LABEL_49;
    }
LABEL_61:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v81 = 67109120;
      int v82 = v42;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve data from manifest: %d", v81, 8u);
    }
    uint64_t v29 = @"Failed to retrieve data from manifest: %d";
    uint64_t v73 = v42;
    uint64_t v30 = 200;
    goto LABEL_67;
  }
LABEL_49:
  uint64_t v46 = sub_10000E940();
  if (!v46)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query working directory.", buf, 2u);
    }
    uint64_t v29 = @"Failed to query working directory.";
    uint64_t v30 = 213;
    goto LABEL_67;
  }
  uint64_t v47 = v46;
  sub_10000DE80(v14, v46);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v14;
      __int16 v79 = 2112;
      v80 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create path with signature %@ in %@.", buf, 0x16u);
    }
    uint64_t v29 = @"Failed to create path with signature %@ in %@.";
    uint64_t v73 = (uint64_t)v14;
    uint64_t v30 = 219;
    goto LABEL_67;
  }
  uint64_t v48 = +[NSFileManager defaultManager];
  NSFileAttributeKey v76 = NSFilePosixPermissions;
  v77 = &off_100023528;
  v49 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
  id v74 = 0;
  unsigned __int8 v50 = [v48 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:v49 error:&v74];
  id v9 = v74;

  if ((v50 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %@.", buf, 0xCu);
    }
    sub_10000A984((uint64_t)"handle_receive_bytes", 224, -2, 0, @"Failed to create %@.", v57, v58, v59, (uint64_t)v13);
    goto LABEL_79;
  }
  id v13 = v13;
  snprintf(__str, 0x400uLL, "%s/XXXXXX.dmg", (const char *)[v13 UTF8String]);
  int v51 = mkstemps(__str, 4);
  if (v51 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v63 = __error();
      v64 = strerror(*v63);
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = __str;
      __int16 v79 = 2080;
      v80 = v64;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %s: %s", buf, 0x16u);
    }
    v65 = __error();
    strerror(*v65);
    sub_10000A984((uint64_t)"handle_receive_bytes", 233, -2, 0, @"Failed to create %s: %s", v66, v67, v68, (uint64_t)__str);
    uint64_t v69 = LABEL_79:;

    CFDictionarySetValue(a3, @"Error", @"FileCreateFailed");
    int v17 = -1;
    id v9 = (id)v69;
    goto LABEL_12;
  }
  int v17 = v51;
  if (sub_10000E068(__str))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = __str;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Path is bad: %s", buf, 0xCu);
    }
    uint64_t v55 = sub_10000A984((uint64_t)"handle_receive_bytes", 239, -2, 0, @"Path is bad: %s", v52, v53, v54, (uint64_t)__str);

    uint64_t v56 = off_100020948;
  }
  else
  {
    sub_10000306C(1);
    sub_100002E94((uint64_t)__str);
    if (sub_1000074D4(v17, a1, (unint64_t)[v15 unsignedLongValue]))
    {
      CFDictionarySetValue(a3, @"Status", @"Complete");
      uint64_t v18 = 0;
      goto LABEL_13;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = __str;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive bytes into %s.", buf, 0xCu);
    }
    uint64_t v55 = sub_10000A984((uint64_t)"handle_receive_bytes", 249, -2, 0, @"Failed to receive bytes into %s.", v70, v71, v72, (uint64_t)__str);

    uint64_t v56 = off_100020968;
  }
  CFDictionarySetValue(a3, @"Error", *v56);
  uint64_t v18 = 0xFFFFFFFFLL;
  id v9 = (id)v55;
LABEL_13:
  if (v9)
  {
    if (!CFDictionaryGetValue(a3, @"Error")) {
      CFDictionarySetValue(a3, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a3, @"DetailedError", [v9 description]);
  }
  if (v17 != -1) {
    close(v17);
  }
  if (v9) {
    sub_100002E94(0);
  }
  sub_10000306C(0);

  return v18;
}

uint64_t sub_1000074D4(int a1, uint64_t a2, unint64_t a3)
{
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  int v23 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  CFStringRef v15 = sub_1000077C8;
  uint32_t v16 = &unk_100020710;
  uint64_t v18 = v22;
  unint64_t v19 = a3;
  int v17 = v21;
  int v20 = a1;
  uint64_t v4 = v14;
  if (a3 >= 0x20000) {
    size_t v5 = 0x20000;
  }
  else {
    size_t v5 = a3;
  }
  uint64_t v6 = malloc_type_malloc(v5, 0xF2ABD754uLL);
  if (v6)
  {
    if (!a3)
    {
LABEL_10:
      free(v6);

      uint64_t v9 = 1;
      goto LABEL_21;
    }
    unint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = lockdown_recv();
      if ((unint64_t)(v8 + 1) <= 1)
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        int v10 = *__error();
        *(_DWORD *)buf = 67109120;
        int v25 = v10;
        uint64_t v11 = "Failed to receive secure message: %{errno}d";
        uint32_t v12 = 8;
        goto LABEL_17;
      }
      if ((((uint64_t (*)(void *, void *, uint64_t))v15)(v4, v6, v8) & 1) == 0) {
        break;
      }
      v7 += v8;
      if (v7 >= a3) {
        goto LABEL_10;
      }
    }
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    uint64_t v11 = "Transfer cancelled.";
    uint32_t v12 = 2;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v11, buf, v12);
LABEL_18:
    free(v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate buffer.", buf, 2u);
  }

  uint64_t v9 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive data.", buf, 2u);
    uint64_t v9 = 0;
  }
LABEL_21:
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);
  return v9;
}

void sub_100007798(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
}

BOOL sub_1000077C8(uint64_t a1, void *__buf, size_t __nbyte)
{
  uint64_t v6 = a1 + 32;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += __nbyte;
  unint64_t v7 = (uint64_t *)(a1 + 48);
  int v8 = (int)(float)((float)((float)*(uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
                          / (float)*(unint64_t *)(a1 + 48))
                  * 100.0);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(_DWORD *)(v9 + 24) != v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000152B0(v6, v7, v8);
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  *(_DWORD *)(v9 + 24) = v8;
  ssize_t v10 = write(*(_DWORD *)(a1 + 56), __buf, __nbyte);
  if (v10 == -1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = *__error();
    v13[0] = 67109120;
    v13[1] = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Write failed: %{errno}d", (uint8_t *)v13, 8u);
  }
  return v10 != -1;
}

uint64_t sub_10000793C()
{
  v0 = (void *)MGCopyAnswer();
  if (!v0)
  {
    uint64_t remote_service_listener = 0;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    BOOL v3 = "Failed to read DeviceSupportsLockdown from gestalt.";
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v3, buf, 2u);
    uint64_t remote_service_listener = 0;
    goto LABEL_11;
  }
  uint64_t v1 = sub_100002E00();
  uint64_t remote_service_listener = xpc_remote_connection_create_remote_service_listener();

  if (!remote_service_listener)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    BOOL v3 = "Failed to create remote listener.";
    goto LABEL_10;
  }
  id v5 = v0;
  xpc_remote_connection_set_event_handler();
  xpc_remote_connection_activate();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    unint64_t v7 = "com.apple.mobile.storage_mounter_proxy.bridge";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RemoteXPC service (%s) alive.", buf, 0xCu);
  }

  uint64_t remote_service_listener = 1;
LABEL_11:

  return remote_service_listener;
}

void sub_100007B24(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = *(id *)(a1 + 32);
  id v3 = v4;
  xpc_remote_connection_set_event_handler();
  xpc_remote_connection_activate();
}

void sub_100007BD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    xpc_remote_connection_cancel();
    goto LABEL_18;
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  if (reply)
  {
    id v5 = reply;
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    if (v6)
    {
      dispatch_semaphore_t v7 = v6;
      int v8 = xpc_dictionary_get_value(v3, "XPCRequestDictionary");
      uint64_t v9 = v8;
      if (!v8 || xpc_get_type(v8) != (xpc_type_t)&_xpc_type_dictionary)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "XPCRequestDictionary";
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v9;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %s: %@", buf, 0x16u);
        }
        id v13 = @"Invalid value for %s: %@";
        v65 = "XPCRequestDictionary";
        uint64_t v14 = 796;
LABEL_9:
        sub_10000A984((uint64_t)"remote_service_init_block_invoke", v14, -2, 0, v13, v10, v11, v12, (uint64_t)v65);

LABEL_10:
LABEL_11:

        goto LABEL_18;
      }
      CFDictionaryRef v15 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCObject();
      if (!v15)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cannot create CF object from XPC request dictionary", buf, 2u);
        }
        id v13 = @"Cannot create CF object from XPC request dictionary";
        uint64_t v14 = 802;
        goto LABEL_9;
      }
      CFDictionaryRef v16 = v15;
      CFDictionaryGetValue(v15, @"HostProcessName");
      int v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = sub_10000A160(v17);

      if (!v18)
      {

        int v17 = @"unknown";
      }
      unint64_t v19 = CFDictionaryGetValue(v16, @"Command");
      int v20 = sub_10000A160(v19);

      BOOL v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v20)
      {
        if (v21)
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v17;
          *(_WORD *)&unsigned char buf[12] = 2114;
          *(void *)&buf[14] = v19;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Remote connection (%{public}@): %{public}@", buf, 0x16u);
        }
        CFMutableDictionaryRef v25 = sub_100009D0C();
        if (v25)
        {
          CFMutableDictionaryRef v26 = v25;
          if ([v19 isEqualToString:@"ReceiveBytes"])
          {
            if (sub_100008CA8(v3, v5, v16, v26))
            {

              CFRelease(v16);
LABEL_132:
              CFRelease(v26);

              goto LABEL_11;
            }
            uint64_t v69 = v17;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_103;
            }
            *(_WORD *)buf = 0;
            uint64_t v31 = "Failed to receive bytes.";
            goto LABEL_45;
          }
          uint64_t v69 = v17;
          if ([v19 isEqualToString:@"LookupImage"])
          {
            if ((sub_100003204(v16, v26) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_103;
            }
            *(_WORD *)buf = 0;
            uint64_t v31 = "Failed to lookup image.";
            goto LABEL_45;
          }
          if ([v19 isEqualToString:@"CopyDevices"])
          {
            if ((sub_1000058A0((uint64_t)v16, v26) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_103;
            }
            *(_WORD *)buf = 0;
            uint64_t v31 = "Failed to copy device list.";
            goto LABEL_45;
          }
          if ([v19 isEqualToString:@"MountImage"])
          {
            if (sub_1000031D0())
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device is locked.", buf, 2u);
              }
              uint64_t v35 = 855;
LABEL_60:
              uint64_t v36 = sub_10000A984((uint64_t)"remote_service_init_block_invoke", v35, -2, 0, @"Device is locked.", v32, v33, v34, (uint64_t)v65);
              uint64_t v37 = off_100020960;
LABEL_74:
              CFDictionarySetValue(v26, @"Error", *v37);
LABEL_104:
              int v68 = 0;
              goto LABEL_105;
            }
            if (sub_100003104())
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Existing file transfer in progress.", buf, 2u);
              }
              uint64_t v41 = 861;
LABEL_73:
              uint64_t v36 = sub_10000A984((uint64_t)"remote_service_init_block_invoke", v41, -2, 0, @"Existing file transfer in progress.", v38, v39, v40, (uint64_t)v65);
              uint64_t v37 = off_100020980;
              goto LABEL_74;
            }
            if ((sub_10000397C(v16, v26) & 1) == 0)
            {
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_103;
              }
              *(_WORD *)buf = 0;
              uint64_t v31 = "Failed to mount image.";
LABEL_45:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
LABEL_103:
              uint64_t v36 = 0;
              goto LABEL_104;
            }
            goto LABEL_84;
          }
          if ([v19 isEqualToString:@"UnmountImage"])
          {
            if (sub_1000031D0())
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device is locked.", buf, 2u);
              }
              uint64_t v35 = 876;
              goto LABEL_60;
            }
            if (sub_100003104())
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Existing file transfer in progress.", buf, 2u);
              }
              uint64_t v41 = 882;
              goto LABEL_73;
            }
            if ((sub_1000042DC(v16, v26) & 1) == 0)
            {
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_103;
              }
              *(_WORD *)buf = 0;
              uint64_t v31 = "Failed to unmount image.";
              goto LABEL_45;
            }
LABEL_84:
            uint64_t v36 = 0;
            int v68 = 1;
            goto LABEL_105;
          }
          if ([v19 isEqualToString:@"Hangup"])
          {
            if ((sub_100005B28((uint64_t)v16, v26) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_103;
            }
            *(_WORD *)buf = 0;
            uint64_t v31 = "Failed to hangup.";
            goto LABEL_45;
          }
          if ([v19 isEqualToString:@"RollPersonalizationNonce"])
          {
            if (sub_1000031D0())
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device is locked.", buf, 2u);
              }
              uint64_t v35 = 904;
              goto LABEL_60;
            }
            if ((sub_100004600((uint64_t)v16, v26) & 1) == 0
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to roll personalization nonce.", buf, 2u);
            }
            int v68 = 0;
            uint64_t v36 = 0;
LABEL_105:
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              *(void *)&uint8_t buf[4] = v26;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sending response: %{public}@", buf, 0xCu);
            }
            uint64_t v43 = _CFXPCCreateXPCObjectFromCFObject();
            uint64_t v70 = (void *)v43;
            if (v43)
            {
              id v44 = (void *)v43;
              id v45 = v5;
              *(void *)buf = _NSConcreteStackBlock;
              *(void *)&buf[8] = 3221225472;
              *(void *)&uint8_t buf[16] = sub_100009BAC;
              uint64_t v73 = &unk_1000207D8;
              id v74 = v45;
              LOBYTE(v44) = xpc_dictionary_apply(v44, buf);

              if (v44) {
                goto LABEL_119;
              }
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create XPC object from CF object.", buf, 2u);
              }
              uint64_t v49 = sub_10000A984((uint64_t)"remote_service_init_block_invoke", 1038, -2, 0, @"Failed to create XPC object from CF object.", v46, v47, v48, (uint64_t)v65);

              uint64_t v36 = (void *)v49;
            }
            BOOL v50 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
            if (v36)
            {
              if (v50)
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to merge XPC dictionary.", buf, 2u);
              }
              goto LABEL_120;
            }
            if (v50)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to merge XPC dictionary.", buf, 2u);
            }
            uint64_t v36 = sub_10000A984((uint64_t)"remote_service_init_block_invoke", 1043, -2, 0, @"Failed to merge XPC dictionary.", v51, v52, v53, (uint64_t)v65);
LABEL_119:
            if (!v36)
            {
LABEL_123:
              xpc_dictionary_send_reply();
              int v17 = v69;
              uint64_t v62 = v70;
              if (v68)
              {
                if ([*(id *)(a1 + 40) BOOLValue])
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Delegating RSD reset to lockdownd.", buf, 2u);
                  }
                }
                else
                {
                  v63 = dispatch_get_global_queue(0, 0);
                  uint64_t v71 = v7;
                  remote_device_browse_present();

                  dispatch_time_t v64 = dispatch_time(0, 20000000000);
                  if (dispatch_semaphore_wait(v71, v64)
                    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
                  {
                    sub_100015354();
                  }

                  uint64_t v62 = v70;
                }
              }
              CFRelease(v16);

              goto LABEL_132;
            }
LABEL_120:
            uint64_t v67 = v26;
            uint64_t v66 = v19;
            CStringPtr = CFStringGetCStringPtr(@"Error", 0x8000100u);
            uint64_t v55 = xpc_dictionary_get_value(v5, CStringPtr);

            if (!v55)
            {
              uint64_t v56 = CFStringGetCStringPtr(@"Error", 0x8000100u);
              uint64_t v57 = CFStringGetCStringPtr(@"InternalError", 0x8000100u);
              xpc_object_t v58 = xpc_string_create(v57);
              xpc_dictionary_set_value(v5, v56, v58);
            }
            uint64_t v59 = CFStringGetCStringPtr(@"DetailedError", 0x8000100u);
            id v60 = [v36 description];
            xpc_object_t v61 = xpc_string_create((const char *)[v60 UTF8String]);
            xpc_dictionary_set_value(v5, v59, v61);

            unint64_t v19 = v66;
            CFMutableDictionaryRef v26 = v67;
            goto LABEL_123;
          }
          if ([v19 isEqualToString:@"RollCryptexNonce"])
          {
            if (!sub_1000031D0())
            {
              if ((sub_100004850((uint64_t)v16, v26) & 1) != 0
                || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                goto LABEL_103;
              }
              *(_WORD *)buf = 0;
              uint64_t v31 = "Failed to roll cryptex nonce.";
              goto LABEL_45;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device is locked.", buf, 2u);
            }
            uint64_t v35 = 917;
            goto LABEL_60;
          }
          if ([v19 isEqualToString:@"QueryPersonalizationManifest"])
          {
            if ((sub_100004AA0(v16, v26) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_150;
            }
            *(_WORD *)buf = 0;
            uint64_t v42 = "Failed to query personalization manifest.";
          }
          else if ([v19 isEqualToString:@"QueryNonce"])
          {
            if ((sub_100004E6C(v16, v26) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_150;
            }
            *(_WORD *)buf = 0;
            uint64_t v42 = "Failed to query personalization nonce.";
          }
          else if ([v19 isEqualToString:@"QueryPersonalizationIdentifiers"])
          {
            if ((sub_10000512C(v16, v26) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_150;
            }
            *(_WORD *)buf = 0;
            uint64_t v42 = "Failed to query personalization identifiers.";
          }
          else if ([v19 isEqualToString:@"QueryCryptexNonce"])
          {
            if ((sub_1000053EC((uint64_t)v16, v26) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              goto LABEL_150;
            }
            *(_WORD *)buf = 0;
            uint64_t v42 = "Failed to query cryptex nonce.";
          }
          else
          {
            if (![v19 isEqualToString:@"QueryDeveloperModeStatus"])
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v19;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid command: %@", buf, 0xCu);
              }
              CFDictionarySetValue(v26, @"Error", @"UnknownCommand");
              goto LABEL_150;
            }
            if ((sub_10000563C((uint64_t)v16, v26) & 1) != 0
              || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
LABEL_150:
              uint64_t v36 = 0;
              int v68 = 0;
              goto LABEL_105;
            }
            *(_WORD *)buf = 0;
            uint64_t v42 = "Failed to query developer mode status.";
          }
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v42, buf, 2u);
          goto LABEL_150;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
        }
        uint64_t v27 = sub_10000A984((uint64_t)"remote_service_init_block_invoke", 822, -2, 0, @"Failed to create dictionary.", v28, v29, v30, (uint64_t)v65);
      }
      else
      {
        if (v21)
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = @"Command";
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v19;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
        }
        uint64_t v27 = sub_10000A984((uint64_t)"remote_service_init_block_invoke", 813, -2, 0, @"Invalid value for %@: %@", v22, v23, v24, @"Command");
        CFDictionarySetValue(0, @"Error", @"MissingCommand");
      }
      CFRelease(v16);

      goto LABEL_10;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create semaphore.", buf, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create reply.", buf, 2u);
  }
LABEL_18:
}

uint64_t sub_100008CA8(void *a1, void *a2, const __CFDictionary *a3, __CFDictionary *a4)
{
  id v7 = a1;
  id v8 = a2;
  bzero(__str, 0x400uLL);
  uint64_t v93 = 0;
  memset(v92, 0, sizeof(v92));
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    sub_10000A984((uint64_t)"handle_receive_bytes", 59, -3, 0, @"Invalid input(s).", v14, v15, v16, v79);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (sub_100003104())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Existing file transfer in progress.", buf, 2u);
    }
    sub_10000A984((uint64_t)"handle_receive_bytes", 64, -2, 0, @"Existing file transfer in progress.", v9, v10, v11, v79);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = off_100020980;
LABEL_21:
    CFDictionarySetValue(a4, @"Error", *v13);
LABEL_22:
    id v32 = 0;
    id v22 = 0;
    unint64_t v19 = 0;
LABEL_23:
    uint64_t v33 = 0;
    int v34 = -1;
    goto LABEL_24;
  }
  uint64_t v17 = xpc_dictionary_get_value(v7, "XPCRequestRecvTx");
  if (!v17)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "XPCRequestRecvTx";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %s.", buf, 0xCu);
    }
    sub_10000A984((uint64_t)"handle_receive_bytes", 71, -3, 0, @"Invalid value for %s.", v29, v30, v31, (uint64_t)"XPCRequestRecvTx");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = off_100020970;
    goto LABEL_21;
  }
  uint64_t v18 = (void *)v17;
  unint64_t v19 = CFDictionaryGetValue(a3, @"ImageType");
  int v20 = sub_10000A160(v19);

  if (!v20)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"ImageType";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
    }
    sub_10000A984((uint64_t)"handle_receive_bytes", 79, -3, 0, @"Invalid value for %@.", v37, v38, v39, @"ImageType");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(a4, @"Error", @"MissingImageType");
    goto LABEL_40;
  }
  uint64_t v21 = CFDictionaryGetValue(a3, @"ImageSignature");
  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = @"ImageSignature";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
    }
    sub_10000A984((uint64_t)"handle_receive_bytes", 87, -3, 0, @"Invalid value for %@.", v40, v41, v42, @"ImageSignature");
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_40:

    id v32 = 0;
    id v22 = 0;
    goto LABEL_23;
  }
  id v22 = (id)v21;
  if (([v19 isEqualToString:@"Personalized"] & 1) == 0
    && ![v19 isEqualToString:@"Cryptex"])
  {
    goto LABEL_50;
  }
  *(void *)buf = 0;
  uint64_t v84 = 0;
  unsigned int v23 = [v19 isEqualToString:@"Personalized"];
  id v22 = v22;
  uint64_t inited = Img4DecodeInitManifest([v22 bytes], [v22 length], v92);
  if (inited)
  {
    uint64_t v25 = inited;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v90 = 67109120;
      int v91 = v25;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to init img4 manifest: %d", v90, 8u);
    }
    sub_10000A984((uint64_t)"handle_receive_bytes", 109, -2, 0, @"Failed to init img4 manifest: %d", v26, v27, v28, v25);
    goto LABEL_69;
  }
  if (v23) {
    uint64_t v43 = 1885629799;
  }
  else {
    uint64_t v43 = 1668315236;
  }
  Img4DecodeGetObjectPropertyData((uint64_t)v92, v43, 1145525076, buf, &v84);
  uint64_t v45 = v44;
  if (v44 == 1)
  {
    if (![v19 isEqualToString:@"Cryptex"])
    {
      uint64_t v45 = 1;
      goto LABEL_62;
    }
    Img4DecodeGetObjectPropertyData((uint64_t)v92, 1885629799, 1145525076, buf, &v84);
    uint64_t v45 = v46;
  }
  if (v45)
  {
LABEL_62:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v90 = 67109120;
      int v91 = v45;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve data from manifest: %d", v90, 8u);
    }
    sub_10000A984((uint64_t)"handle_receive_bytes", 123, -2, 0, @"Failed to retrieve data from manifest: %d", v64, v65, v66, v45);
    goto LABEL_69;
  }
  id v47 = objc_alloc((Class)NSData);
  id v48 = [v47 initWithBytes:*(void *)buf length:v84];

  if (!v48)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v90 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", v90, 2u);
    }
    sub_10000A984((uint64_t)"handle_receive_bytes", 129, -2, 0, @"Failed to create data.", v70, v71, v72, v79);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v22 = 0;
    goto LABEL_70;
  }
  id v22 = v48;
LABEL_50:
  uint64_t v49 = sub_10000E940();
  if (!v49)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query working directory.", buf, 2u);
    }
    uint64_t v62 = @"Failed to query working directory.";
    uint64_t v63 = 136;
    goto LABEL_68;
  }
  BOOL v50 = v49;
  sub_10000DE80(v22, v49);
  id v32 = (id)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v22;
      __int16 v88 = 2112;
      v89 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create path with signature %@ in %@.", buf, 0x16u);
    }
    uint64_t v62 = @"Failed to create path with signature %@ in %@.";
    uint64_t v79 = (uint64_t)v22;
    uint64_t v63 = 142;
LABEL_68:
    sub_10000A984((uint64_t)"handle_receive_bytes", v63, -2, 0, v62, v59, v60, v61, v79);
LABEL_69:
    id v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_70:

    id v32 = 0;
    goto LABEL_23;
  }
  v80 = +[NSFileManager defaultManager];
  NSFileAttributeKey v85 = NSFilePosixPermissions;
  v86 = &off_100023540;
  uint64_t v51 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
  id v83 = 0;
  unsigned __int8 v52 = [v80 createDirectoryAtPath:v32 withIntermediateDirectories:1 attributes:v51 error:&v83];
  id v12 = v83;

  if ((v52 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v32;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %@.", buf, 0xCu);
    }
    sub_10000A984((uint64_t)"handle_receive_bytes", 147, -2, 0, @"Failed to create %@.", v67, v68, v69, (uint64_t)v32);
    goto LABEL_80;
  }
  id v32 = v32;
  snprintf(__str, 0x400uLL, "%s/XXXXXX.dmg", (const char *)[v32 UTF8String]);
  int v53 = mkstemps(__str, 4);
  if (v53 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v73 = __error();
      id v74 = strerror(*v73);
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = __str;
      __int16 v88 = 2080;
      v89 = v74;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %s: %s", buf, 0x16u);
    }
    uint64_t v75 = __error();
    strerror(*v75);
    sub_10000A984((uint64_t)"handle_receive_bytes", 156, -2, 0, @"Failed to create %s: %s", v76, v77, v78, (uint64_t)__str);
    uint64_t v81 = LABEL_80:;

    CFDictionarySetValue(a4, @"Error", @"FileCreateFailed");
    uint64_t v33 = 0;
    int v34 = -1;
LABEL_81:
    id v12 = (id)v81;
    goto LABEL_24;
  }
  int v34 = v53;
  int v54 = sub_10000E068(__str);
  BOOL v55 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v54)
  {
    if (v55)
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = __str;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Path is bad: %s", buf, 0xCu);
    }
    uint64_t v81 = sub_10000A984((uint64_t)"handle_receive_bytes", 162, -2, 0, @"Path is bad: %s", v56, v57, v58, (uint64_t)__str);

    CFDictionarySetValue(a4, @"Error", @"FileCreateFailed");
    uint64_t v33 = 0;
    goto LABEL_81;
  }
  if (v55)
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = __str;
    __int16 v88 = 1024;
    LODWORD(v89) = v34;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Writing file %s (%d) ...", buf, 0x12u);
  }
  uint64_t v33 = 1;
  sub_10000306C(1);
  sub_100002E94((uint64_t)__str);
  id v82 = v8;
  xpc_file_transfer_write_to_fd();

LABEL_24:
  if (v12)
  {
    if (!CFDictionaryGetValue(a4, @"Error")) {
      CFDictionarySetValue(a4, @"Error", @"InternalError");
    }
    CFDictionarySetValue(a4, @"DetailedError", [v12 description]);
  }
  if (v34 == -1) {
    char v35 = 1;
  }
  else {
    char v35 = v33;
  }
  if ((v35 & 1) == 0) {
    close(v34);
  }

  return v33;
}

void sub_100009874(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Done resetting devices.", buf, 2u);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    if (v6)
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Resetting device.", v7, 2u);
    }
    if ((remote_device_reset() & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000153D8();
    }
  }
}

void sub_10000995C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to write from remote file: %d", buf, 8u);
    }
    id v7 = sub_10000A984((uint64_t)"handle_receive_bytes_block_invoke", 185, -2, 0, @"Failed to write from remote file: %d", v4, v5, v6, a2);
    id v8 = *(void **)(a1 + 32);
    CStringPtr = CFStringGetCStringPtr(@"Error", 0x8000100u);
    uint64_t v10 = CFStringGetCStringPtr(@"InternalError", 0x8000100u);
    xpc_object_t v11 = xpc_string_create(v10);
    xpc_dictionary_set_value(v8, CStringPtr, v11);

    id v12 = *(void **)(a1 + 32);
    id v13 = CFStringGetCStringPtr(@"DetailedError", 0x8000100u);
    id v14 = [v7 description];
    xpc_object_t v15 = xpc_string_create((const char *)[v14 UTF8String]);
    xpc_dictionary_set_value(v12, v13, v15);

    xpc_dictionary_send_reply();
    if (v7)
    {
      sub_100002E94(0);
    }
  }
  else
  {
    uint64_t v16 = *(void **)(a1 + 32);
    uint64_t v17 = CFStringGetCStringPtr(@"Status", 0x8000100u);
    uint64_t v18 = CFStringGetCStringPtr(@"Complete", 0x8000100u);
    xpc_object_t v19 = xpc_string_create(v18);
    xpc_dictionary_set_value(v16, v17, v19);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully wrote remote file.", buf, 2u);
    }
    xpc_dictionary_send_reply();
  }
  sub_10000306C(0);
}

uint64_t sub_100009BAC(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

uint64_t start()
{
  if ((_set_user_dir_suffix() & 1) == 0) {
    sub_100015518();
  }
  uint64_t v0 = sub_10000E940();
  if (!v0) {
    sub_100015420(0, v1, v2, v3, v4, v5, v6, v7);
  }
  id v8 = (void *)v0;
  uint64_t v9 = +[NSFileManager defaultManager];
  NSFileAttributeKey v21 = NSFilePosixPermissions;
  id v22 = &off_100023558;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v20 = 0;
  unsigned __int8 v11 = [v9 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:v10 error:&v20];
  id v12 = v20;

  if ((v11 & 1) == 0) {
    sub_1000154AC(v12, (uint64_t)v8, v13, v14, v15, v16, v17, v18);
  }
  if ((sub_10000793C() & 1) == 0) {
    sub_100015490();
  }
  if (!sub_100005C60()) {
    sub_100015474();
  }
  CFRunLoopRun();

  return 0;
}

CFMutableDictionaryRef sub_100009D0C()
{
  return CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
}

id sub_100009D30(void *a1)
{
  io_registry_entry_t entry = 0;
  uint64_t v1 = sub_100009EB4(a1);
  uint64_t v2 = v1;
  if (!v1
    || (CFDictionaryRef v3 = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)[v1 UTF8String]), MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v3), (entry = MatchingService) == 0))
  {
    id v8 = 0;
    CFProperty = 0;
    goto LABEL_18;
  }
  io_object_t v5 = MatchingService;
  if (!IOObjectConformsTo(MatchingService, "AppleAPFSVolume"))
  {
    id v8 = 0;
    CFProperty = 0;
    goto LABEL_17;
  }
  if (sub_100009F68(&entry, "AppleAPFSContainer")
    && sub_100009F68(&entry, "AppleAPFSMedia")
    && sub_100009F68(&entry, "AppleAPFSContainerScheme")
    && sub_100009F68(&entry, "IOMedia"))
  {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(entry, @"BSD Name", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      id v7 = [objc_alloc((Class)NSString) initWithFormat:@"/dev/%@", CFProperty];
      if (v7)
      {
        id v8 = v7;
        goto LABEL_14;
      }
    }
  }
  else
  {
    CFProperty = 0;
  }
  id v8 = 0;
LABEL_14:
  io_object_t v5 = entry;
  if (entry) {
LABEL_17:
  }
    IOObjectRelease(v5);
LABEL_18:

  return v8;
}

id sub_100009EB4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1;
    uint64_t v4 = @"/dev/r";
    if (([v3 hasPrefix:@"/dev/r"] & 1) != 0
      || (uint64_t v4 = @"/dev/", [v3 hasPrefix:@"/dev/"]))
    {
      uint64_t v5 = [[v3 substringFromIndex:-[__CFString length](v4, "length")];

      id v3 = (id)v5;
    }
    id v6 = v3;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t sub_100009F68(io_object_t *a1, const char *a2)
{
  uint64_t result = 0;
  io_registry_entry_t parent = 0;
  if (a1 && a2)
  {
    if (IORegistryEntryGetParentEntry(*a1, "IOService", &parent) || !IOObjectConformsTo(parent, a2))
    {
      uint64_t result = parent;
      if (parent)
      {
        IOObjectRelease(parent);
        return 0;
      }
    }
    else
    {
      IOObjectRelease(*a1);
      *a1 = parent;
      return 1;
    }
  }
  return result;
}

id sub_100009FF4(void *a1)
{
  id v1 = a1;

  return v1;
}

id sub_10000A01C(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id sub_10000A088(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id sub_10000A0F4(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id sub_10000A160(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id sub_10000A1CC(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id sub_10000A238(void *a1)
{
  id v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

uint64_t sub_10000A2A4()
{
  uint64_t v0 = (void *)__chkstk_darwin();
  id v2 = v1;
  id v3 = v0;
  bzero(v26, 0x1000uLL);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)io_registry_entry_t entry = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", entry, 2u);
    }
    id v3 = 0;
    goto LABEL_32;
  }
  uint64_t v4 = sub_100009EB4(v3);
  uint64_t v5 = v4;
  if (!v4
    || (id v6 = v4,
        CFDictionaryRef v7 = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)[v6 UTF8String]),
        io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v7),
        (*(_DWORD *)io_registry_entry_t entry = MatchingService) == 0))
  {

    goto LABEL_16;
  }
  io_object_t v9 = MatchingService;
  if (!IOObjectConformsTo(MatchingService, "IOMedia"))
  {
    IOObjectRelease(v9);

    goto LABEL_16;
  }
  if (!sub_10000EC68((io_object_t *)entry, "AppleAPFSContainerScheme")
    || !sub_10000EC68((io_object_t *)entry, "AppleAPFSMedia"))
  {
    char v20 = 0;
    uint64_t v10 = 0;
LABEL_45:
    id CFProperty = 0;
    goto LABEL_46;
  }
  uint64_t v10 = (void *)IORegistryEntrySearchCFProperty(*(io_registry_entry_t *)entry, "IOService", @"Content Hint", kCFAllocatorDefault, 0);
  if (!v10 || ![@"EF57347C-0000-11AA-AA11-00306543ECAC" isEqualToString:v10]) {
    goto LABEL_44;
  }
  if (!v2)
  {
    id CFProperty = 0;
    goto LABEL_55;
  }
  if (!sub_10000EC68((io_object_t *)entry, "AppleAPFSContainer")
    || !sub_10000EC68((io_object_t *)entry, "AppleAPFSVolume"))
  {
LABEL_44:
    char v20 = 0;
    goto LABEL_45;
  }
  id CFProperty = (id)IORegistryEntryCreateCFProperty(*(io_registry_entry_t *)entry, @"BSD Name", kCFAllocatorDefault, 0);
  id v12 = sub_10000A160(CFProperty);

  if (v12)
  {
    uint64_t v13 = [@"/dev/" stringByAppendingString:CFProperty];

    if (v13)
    {
      id CFProperty = v13;
      void *v2 = CFProperty;
LABEL_55:
      char v20 = 1;
      goto LABEL_46;
    }
    goto LABEL_44;
  }
  char v20 = 0;
LABEL_46:
  if (*(_DWORD *)entry) {
    IOObjectRelease(*(io_object_t *)entry);
  }

  if (v20)
  {
    uint64_t v17 = 6;
    goto LABEL_53;
  }
LABEL_16:
  if ((objc_msgSend(v3, "hasPrefix:", @"/dev/", *(void *)entry) & 1) == 0)
  {
    uint64_t v14 = [@"/dev" stringByAppendingString:v3];

    id v3 = (id)v14;
  }
  id v3 = v3;
  int v15 = open((const char *)[v3 UTF8String], 0);
  if (v15 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = *__error();
      *(_DWORD *)io_registry_entry_t entry = 138412546;
      *(void *)&entry[4] = v3;
      __int16 v24 = 1024;
      int v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to open %@: %{errno}d", entry, 0x12u);
    }
LABEL_32:
    uint64_t v17 = 0;
    goto LABEL_53;
  }
  int v16 = v15;
  if (read(v15, v26, 0x1000uLL) == 4096)
  {
    if (v26[0] == 233 || v26[0] == 235 && v26[2] == 144)
    {
      if (v27 == 0x202020205346544ELL)
      {
        uint64_t v17 = 5;
      }
      else if (v27 == 0x2020205441465845)
      {
        uint64_t v17 = 4;
      }
      else
      {
        uint64_t v17 = 1;
      }
    }
    else if (v28 == 11080)
    {
      uint64_t v17 = 2 * (v29 == 4);
    }
    else if (v29 == 5 && v28 == 22600)
    {
      uint64_t v17 = 3;
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = *__error();
      *(_DWORD *)io_registry_entry_t entry = 138412546;
      *(void *)&entry[4] = v3;
      __int16 v24 = 1024;
      int v25 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to read %@ volume header: %{errno}d", entry, 0x12u);
      uint64_t v17 = 0;
    }
  }
  close(v16);
LABEL_53:

  return v17;
}

BOOL sub_10000A748()
{
  size_t v4 = 8;
  uint64_t v5 = 0;
  if (!sysctlbyname("security.mac.amfi.developer_mode_status", &v5, &v4, 0, 0)) {
    return v5 == 1;
  }
  uint64_t v0 = __error();
  BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v1)
  {
    int v3 = *v0;
    *(_DWORD *)buf = 67109120;
    int v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to read developer mode status: %{darwin.errno}d", buf, 8u);
    return 0;
  }
  return result;
}

BOOL sub_10000A834(BOOL *a1, void *a2)
{
  int v12 = 0;
  size_t v11 = 4;
  if (sysctlbyname("security.codesigning.config", &v12, &v11, 0, 0))
  {
    int v4 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v14 = "security.codesigning.config";
      __int16 v15 = 1024;
      int v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to read sysctl (%s): %{darwin.errno}d", buf, 0x12u);
    }
    sub_10000A984((uint64_t)"systemSupportsRestrictedExecutionMode", 773, -2, 0, @"Failed to read sysctl (%s): %{darwin.errno}d", v5, v6, v7, (uint64_t)"security.codesigning.config");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (a2 && v8)
    {
      id v8 = v8;
      *a2 = v8;
    }
  }
  else
  {
    id v8 = 0;
    if (a1) {
      *a1 = (v12 & 0x2000000) != 0;
    }
  }
  BOOL v9 = v8 == 0;

  return v9;
}

id sub_10000A984(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13 = a4;
  id v14 = a5;
  id v15 = [objc_alloc((Class)NSMutableString) initWithFormat:v14 arguments:&a9];

  id v16 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v17 = v16;
  if (v15) {
    [v16 setObject:v15 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  if (v13) {
    [v17 setObject:v13 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  if (os_variant_allows_internal_security_policies())
  {
    if (a1)
    {
      int v18 = +[NSString stringWithUTF8String:a1];
      [v17 setObject:v18 forKeyedSubscript:@"FunctionName"];
    }
    if (a2)
    {
      int v19 = +[NSNumber numberWithInt:a2];
      [v17 setObject:v19 forKeyedSubscript:@"SourceLine"];
    }
  }
  char v20 = +[NSError errorWithDomain:@"com.apple.MobileStorage.ErrorDomain" code:a3 userInfo:v17];

  return v20;
}

uint64_t sub_10000AB0C()
{
  if (os_parse_boot_arg_int())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      int v4 = " not";
      __int16 v5 = 2080;
      uint64_t v6 = "allow_msm_to_invalidate_attestations";
      __int16 v7 = 2048;
      uint64_t v8 = 0;
      uint64_t v0 = "Invalidating system attestation is%s allowed per boot-arg %s=%lld";
      uint32_t v1 = 32;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v0, buf, v1);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v4 = "allow_msm_to_invalidate_attestations";
    uint64_t v0 = "You can set the boot-arg %s=1 to allow invalidating the system's attestation.";
    uint32_t v1 = 12;
    goto LABEL_6;
  }
  return 0;
}

BOOL sub_10000AC54(io_registry_entry_t a1)
{
  CFDictionaryRef v1 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(a1, "IOService", @"Protocol Characteristics", kCFAllocatorDefault, 3u);
  if (!v1) {
    return 0;
  }
  CFDictionaryRef v2 = v1;
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v1, @"Physical Interconnect");
  if (Value) {
    BOOL v4 = CFEqual(Value, @"Virtual Interface");
  }
  else {
    BOOL v4 = 0;
  }
  CFRelease(v2);
  return v4;
}

id sub_10000ACE0()
{
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  id v37 = objc_alloc_init((Class)NSMutableDictionary);
  if (v37)
  {
    int v0 = getfsstat(0, 0, 2);
    if (v0 < 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get mount information: %{errno}d", buf, 8u);
      }
      __int16 v7 = 0;
    }
    else
    {
      int v1 = v0;
      unint64_t v2 = 0;
      int v3 = 0;
      while (1)
      {
        unint64_t v4 = 2168 * v1;
        if (v2 > v4) {
          goto LABEL_11;
        }
        if (v3) {
          free(v3);
        }
        unint64_t v2 = v4 + 2168;
        __int16 v5 = (statfs *)malloc_type_malloc(v4 + 2168, 0x809D8011uLL);
        if (!v5) {
          break;
        }
        int v3 = v5;
        int v1 = getfsstat(v5, v4 + 2168, 2);
        if (v1 < 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            int v6 = *__error();
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v6;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get mount information: %{errno}d", buf, 8u);
          }
LABEL_11:
          __int16 v7 = v3;
          goto LABEL_21;
        }
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v10;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate memory: %{errno}d", buf, 8u);
      }
      __int16 v7 = 0;
LABEL_21:
      if (v1 > 0)
      {
        uint64_t v38 = v7;
        size_t v11 = (void *)MGCopyAnswer();
        unsigned int v12 = [v11 BOOLValue];

        if (((v12 | os_variant_is_recovery()) & 1) == 0)
        {
          int v14 = cryptex_copy_list_4MSM();
          if ((v14 & 0xFFFFFFFD) != 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = strerror(v14);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&uint8_t buf[4] = v14;
              LOWORD(v51) = 2080;
              *(void *)((char *)&v51 + 2) = v15;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to copy cryptex list (%d (%s)), non-fatal.", buf, 0x12u);
            }
            uint64_t v44 = 0;
          }
        }
        unint64_t v16 = 0;
        uint64_t v17 = 0;
        uint64_t v18 = v1;
        __int16 v7 = v38;
        f_mntonname = v38->f_mntonname;
        *(void *)&long long v13 = 136315138;
        long long v35 = v13;
        while (1)
        {
          *(void *)buf = 0;
          *(void *)&long long v51 = buf;
          *((void *)&v51 + 1) = 0x2020000000;
          char v52 = 0;
          int v19 = sub_10000B6B4((uint64_t)&v7[v16], v45, v44);
          char v20 = v19;
          if (!v19) {
            break;
          }
          NSFileAttributeKey v21 = [v19 objectForKeyedSubscript:@"MountPath"];
          if (!v21)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)id v48 = 138412290;
              CFStringRef v49 = @"MountPath";
              int v25 = "Map entry missing value for key %@.";
              uint32_t v26 = 12;
LABEL_36:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v25, v48, v26);
            }
            goto LABEL_37;
          }
          id v22 = v21;
          unsigned int v23 = [v20 objectForKeyedSubscript:@"DiskImageType"];
          unsigned int v24 = [v23 isEqualToString:@"Cryptex"];

          if (v24)
          {
            *(unsigned char *)(v51 + 24) = 1;
          }
          else
          {
            v40[0] = _NSConcreteStackBlock;
            v40[1] = 3221225472;
            v40[2] = sub_10000C3D8;
            v40[3] = &unk_100020C78;
            id v31 = v22;
            id v41 = v31;
            id v42 = v20;
            uint64_t v43 = buf;
            [&off_1000235E8 enumerateObjectsUsingBlock:v40];

            if (!*(unsigned char *)(v51 + 24))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                sub_1000155F8(v46, (uint64_t)v31, &v47);
              }
              uint64_t v27 = 0;
              __int16 v28 = 0;
              char v29 = 0;
              id v30 = 0;
              uint64_t v39 = (uint64_t)v17;
              id v22 = v31;
              goto LABEL_59;
            }
          }
          uint64_t v39 = [v20 objectForKeyedSubscript:@"DeviceNode" v35 f_mntonname];

          if (v39)
          {
            uint64_t v27 = [v20 objectForKeyedSubscript:@"DeviceType"];
            if (v27)
            {
              if ([@"DiskImage" isEqualToString:v27])
              {
                sub_10000C460((uint64_t)v38[v16].f_mntfromname);
                id v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
                if (v32)
                {
                  [v20 setObject:v32 forKeyedSubscript:@"BackingImage"];
                  id v30 = [v20 objectForKeyedSubscript:@"ImageSignature"];
                  if (v30)
                  {
                    __int16 v28 = 0;
                    char v29 = v32;
LABEL_58:
                    [v37 setObject:v20 forKeyedSubscript:v39];
                    goto LABEL_59;
                  }
                  sub_10000C460((uint64_t)v38[v16].f_mntfromname);
                  char v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  if (v29)
                  {
                    __int16 v28 = sub_10000C618(v29);
                    if (v28)
                    {
                      id v30 = [objc_alloc((Class)NSMutableData) initDataWithHexString:v28];
                      if (v30)
                      {
                        [v20 setObject:v30 forKeyedSubscript:@"ImageSignature"];
                      }
                      else
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)id v48 = 138412290;
                          CFStringRef v49 = v29;
                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to convert signature from %@", v48, 0xCu);
                        }
                        id v30 = 0;
                      }
                      goto LABEL_58;
                    }
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)id v48 = 138412290;
                      CFStringRef v49 = v29;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to recover signature from %@", v48, 0xCu);
                    }
                    id v30 = 0;
                    goto LABEL_57;
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
LABEL_55:
                    *(_DWORD *)id v48 = v35;
                    CFStringRef v49 = (const __CFString *)&f_mntonname[v16 * 2168];
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get backing image path for %s", v48, 0xCu);
                  }
                }
                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  goto LABEL_55;
                }
              }
              id v30 = 0;
              char v29 = 0;
LABEL_57:
              __int16 v28 = 0;
              goto LABEL_58;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)id v48 = 138412290;
              CFStringRef v49 = @"DeviceType";
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Map entry missing %@.", v48, 0xCu);
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)id v48 = 138412290;
              CFStringRef v49 = @"DeviceNode";
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Map entry missing %@.", v48, 0xCu);
            }
            uint64_t v39 = 0;
          }
          uint64_t v27 = 0;
          __int16 v28 = 0;
          char v29 = 0;
          id v30 = 0;
LABEL_59:
          _Block_object_dispose(buf, 8);

          ++v16;
          __int16 v7 = v38;
          uint64_t v8 = (void *)v39;
          uint64_t v17 = (void *)v39;
          if (!--v18) {
            goto LABEL_76;
          }
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v48 = 0;
          int v25 = "Failed to create map entry.";
          uint32_t v26 = 2;
          goto LABEL_36;
        }
LABEL_37:
        uint64_t v27 = 0;
        __int16 v28 = 0;
        id v22 = 0;
        char v29 = 0;
        id v30 = 0;
        uint64_t v39 = (uint64_t)v17;
        goto LABEL_59;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v33;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get mount information: %{errno}d", buf, 8u);
    }
    uint64_t v8 = 0;
LABEL_76:
    if (v7) {
      free(v7);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }
    uint64_t v8 = 0;
  }
  if (v45) {
    cryptex_msm_array_destroy();
  }

  return v37;
}

void sub_10000B694(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

id sub_10000B6B4(uint64_t a1, char *a2, uint64_t a3)
{
  if (!a1 || (v3 = a3, (unint64_t v4 = a2) == 0) && a3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:
      id v7 = 0;
      uint64_t v8 = 0;
      id v9 = 0;
      int v10 = 0;
      unint64_t v4 = 0;
      size_t v11 = 0;
      unsigned int v12 = 0;
      id v13 = 0;
      int v14 = 0;
LABEL_8:
      id v15 = 0;
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    int v6 = "Invalid intput.";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    goto LABEL_7;
  }
  uint64_t v17 = (__CFString *)[objc_alloc((Class)NSString) initWithCString:a1 + 1112 encoding:4];
  if (!v17)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    int v6 = "Failed to create string.";
    goto LABEL_6;
  }
  int v14 = v17;
  id v18 = [objc_alloc((Class)NSString) initWithCString:a1 + 88 encoding:4];
  if (!v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
    }
    id v7 = 0;
    uint64_t v8 = 0;
    id v9 = 0;
    int v10 = 0;
    unint64_t v4 = 0;
    size_t v11 = 0;
    unsigned int v12 = 0;
    id v13 = 0;
    goto LABEL_8;
  }
  id v13 = v18;
  int v19 = (char *)[v13 UTF8String];
  if (!v19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v35 = "Failed to get C string.";
LABEL_53:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
    }
LABEL_54:
    id v7 = 0;
    uint64_t v8 = 0;
    id v9 = 0;
    int v10 = 0;
    unint64_t v4 = 0;
    size_t v11 = 0;
    unsigned int v12 = 0;
    goto LABEL_8;
  }
  char v20 = v19;
  id v21 = [objc_alloc((Class)NSString) initWithCString:a1 + 72 encoding:4];
  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      long long v35 = "Failed to create string.";
      goto LABEL_53;
    }
    goto LABEL_54;
  }
  unsigned int v12 = v21;
  id v22 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v22)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }
    id v7 = 0;
    uint64_t v8 = 0;
    id v9 = 0;
    int v10 = 0;
    unint64_t v4 = 0;
    size_t v11 = 0;
    goto LABEL_8;
  }
  id v15 = v22;
  __s2 = v20;
  [v22 setObject:@"MassStorage" forKeyedSubscript:x0];
  [v15 setObject:v14 forKeyedSubscript:@"DeviceNode"];
  [v15 setObject:v13 forKeyedSubscript:@"MountPath"];
  [v15 setObject:v12 forKeyedSubscript:@"FilesystemType"];
  [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:@"IsMounted"];
  id v23 = [objc_alloc((Class)NSURL) initWithString:v14];
  if (!v23)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v56 = v14;
      __int16 v57 = 2080;
      id v58 = (id)(a1 + 88);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create URL (%@ / %s).", buf, 0x16u);
    }
    id v7 = 0;
    uint64_t v8 = 0;
    id v9 = 0;
    int v10 = 0;
    goto LABEL_64;
  }
  int v10 = v23;
  id v24 = [v23 lastPathComponent];
  CFDictionaryRef matching = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)[v24 UTF8String]);

  if (!matching)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = [v10 lastPathComponent];
      *(_DWORD *)buf = 138412290;
      CFStringRef v56 = v36;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create a BSD matching dictionary for %@.", buf, 0xCu);
    }
    id v7 = 0;
    uint64_t v8 = 0;
    id v9 = 0;
LABEL_64:
    unint64_t v4 = 0;
    size_t v11 = 0;
    goto LABEL_9;
  }
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, matching);
  mach_port_t mainPort = MatchingService;
  if (!MatchingService || !sub_10000AC54(MatchingService)) {
    goto LABEL_101;
  }
  [v15 setObject:@"DiskImage" forKeyedSubscript:@"DeviceType"];
  if (!strcmp("/Developer", __s2))
  {
    CFStringRef v37 = @"Developer";
    uint64_t v38 = off_100020B38;
LABEL_100:
    [v15 setObject:v37 forKeyedSubscript:*v38];
    goto LABEL_101;
  }
  if (__s2 == strnstr(__s2, "/private/var/personalized_automation", 0x24uLL))
  {
    [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
    uint64_t v39 = off_100020B80;
LABEL_99:
    CFStringRef v37 = *v39;
    uint64_t v38 = off_100020B58;
    goto LABEL_100;
  }
  if (__s2 == strnstr(__s2, "/private/var/personalized_demo", 0x1EuLL))
  {
    [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
    uint64_t v39 = off_100020B70;
    goto LABEL_99;
  }
  if (__s2 == strnstr(__s2, "/private/var/personalized_debug", 0x1FuLL))
  {
    [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
    uint64_t v39 = off_100020B60;
    goto LABEL_99;
  }
  if (__s2 != strnstr(__s2, "/System/Developer", 0x11uLL))
  {
    if (__s2 == strnstr(__s2, "/private/var/personalized_factory", 0x21uLL))
    {
      [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      uint64_t v39 = off_100020B78;
    }
    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldService", 0x1CuLL))
    {
      [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      uint64_t v39 = off_100020B90;
    }
    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldServiceDiagnostic", 0x26uLL))
    {
      [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      uint64_t v39 = off_100020B98;
    }
    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldServiceRepair", 0x22uLL))
    {
      [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      uint64_t v39 = off_100020BA0;
    }
    else if (__s2 == strnstr(__s2, "/private/var/personalized_quality", 0x21uLL))
    {
      [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      uint64_t v39 = off_100020BA8;
    }
    else
    {
      if (__s2 != strnstr(__s2, "/private/var/personalized_repair", 0x20uLL))
      {
        if (!v4)
        {
          CFDictionaryRef matchinga = 0;
          uint64_t v8 = 0;
          id v9 = 0;
          goto LABEL_102;
        }
        [v15 setObject:@"Cryptex" forKeyedSubscript:@"DiskImageType"];
        if (v3)
        {
          while (1)
          {
            uint64_t string = cryptex_msm_get_string();
            if (string)
            {
              uint64_t v27 = (const char *)string;
              size_t v28 = strlen((const char *)(a1 + 1112));
              if (strnstr(v27, (const char *)(a1 + 1112), v28))
              {
                uint64_t v29 = cryptex_msm_get_string();
                if (v29)
                {
                  uint64_t v30 = v29;
                  uint64_t v31 = cryptex_msm_get_string();
                  if (v31) {
                    break;
                  }
                }
              }
            }
            v4 += 8;
            if (!--v3) {
              goto LABEL_39;
            }
          }
          id v48 = +[NSString stringWithUTF8String:v31];
          [v15 setObject:v48 forKeyedSubscript:@"CryptexName"];

          CFStringRef v49 = +[NSString stringWithUTF8String:v30];
          [v15 setObject:v49 forKeyedSubscript:@"CryptexVersion"];
        }
LABEL_39:
        uint64_t v32 = [v15 objectForKeyedSubscript:@"CryptexName"];
        if (!v32
          || (int v33 = (void *)v32,
              [v15 objectForKeyedSubscript:@"CryptexVersion"],
              int v34 = objc_claimAutoreleasedReturnValue(),
              v34,
              v33,
              !v34))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            CFStringRef v56 = v14;
            __int16 v57 = 2112;
            id v58 = v13;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Mount (%@ / %@) is not a cryptex or personalized image (not fatal).", buf, 0x16u);
          }
          id v7 = 0;
          CFDictionaryRef matchinga = 0;
          uint64_t v8 = 0;
          id v9 = 0;
          unint64_t v4 = 0;
          size_t v11 = 0;
LABEL_110:
          io_object_t v45 = mainPort;
          if (!mainPort) {
            goto LABEL_112;
          }
          goto LABEL_111;
        }
LABEL_101:
        CFDictionaryRef matchinga = 0;
        uint64_t v8 = 0;
        id v9 = 0;
        unint64_t v4 = 0;
LABEL_102:
        size_t v11 = 0;
        goto LABEL_103;
      }
      [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
      uint64_t v39 = off_100020BB0;
    }
    goto LABEL_99;
  }
  uint64_t v40 = [v13 stringByAppendingPathComponent:@"Library/Frameworks/DTRemoteServices.framework"];
  if (!v40)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create path.", buf, 2u);
    }
    size_t v11 = 0;
    unint64_t v4 = 0;
    goto LABEL_88;
  }
  unint64_t v4 = (char *)v40;
  +[NSURL fileURLWithPath:v40 isDirectory:0];
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (!Unique)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query bundle for DTRemoteServices.framework.", buf, 2u);
    }
    size_t v11 = 0;
LABEL_88:
    id v9 = 0;
    uint64_t v8 = 0;
    CFDictionaryRef matchinga = 0;
    goto LABEL_97;
  }
  CFDictionaryRef matchinga = Unique;
  uint64_t v42 = CFBundleGetValueForInfoDictionaryKey(Unique, kCFBundleVersionKey);
  if (v42)
  {
    size_t v11 = (void *)v42;
    uint64_t v43 = [v13 stringByAppendingPathComponent:@"version.plist"];
    if (v43)
    {
      uint64_t v8 = (void *)v43;
      uint64_t v44 = +[NSFileManager defaultManager];
      unsigned int __s2a = [v44 fileExistsAtPath:v8];

      if (__s2a)
      {
        id v9 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:v8];
        if (v9)
        {
LABEL_78:
          [v15 setObject:v11 forKeyedSubscript:@"PersonalizedImageVersion"];
          [v15 setObject:v9 forKeyedSubscript:@"PersonalizedImageVersionInfo"];
          [v15 setObject:@"Personalized" forKeyedSubscript:@"DiskImageType"];
          [v15 setObject:@"DeveloperDiskImage" forKeyedSubscript:@"PersonalizedImageType"];
LABEL_103:
          if (*(_DWORD *)(a1 + 64)) {
            uint64_t v46 = &__kCFBooleanTrue;
          }
          else {
            uint64_t v46 = &__kCFBooleanFalse;
          }
          [v15 setObject:v46 forKeyedSubscript:@"IsReadOnly"];
          if ((*(_DWORD *)(a1 + 64) & 0x80) != 0) {
            uint64_t v47 = &__kCFBooleanTrue;
          }
          else {
            uint64_t v47 = &__kCFBooleanFalse;
          }
          [v15 setObject:v47 forKeyedSubscript:@"SupportsContentProtection"];
          id v7 = v15;
          goto LABEL_110;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
          sub_100015644((uint64_t)v8, (uint64_t)v11);
        }
      }
      id v9 = 0;
      goto LABEL_78;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create path.", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v56 = kCFBundleVersionKey;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query bundle key %@.", buf, 0xCu);
    }
    size_t v11 = 0;
  }
  id v9 = 0;
  uint64_t v8 = 0;
LABEL_97:
  id v7 = 0;
  io_object_t v45 = mainPort;
LABEL_111:
  IOObjectRelease(v45);
LABEL_112:
  if (matchinga) {
    CFRelease(matchinga);
  }
LABEL_9:

  return v7;
}

void sub_10000C3D8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (([*(id *)(a1 + 32) hasPrefix:a2] & 1) != 0
    || ([*(id *)(a1 + 40) objectForKeyedSubscript:@"DiskImageType"],
        int v6 = objc_claimAutoreleasedReturnValue(),
        unsigned int v7 = [v6 isEqualToString:@"Cryptex"],
        v6,
        v7))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

id sub_10000C460(uint64_t a1)
{
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v6 = "Invalid input.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
LABEL_10:
    __int16 v5 = 0;
    unint64_t v2 = 0;
    id v4 = 0;
    goto LABEL_11;
  }
  id v1 = [objc_alloc((Class)NSString) initWithUTF8String:a1];
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v6 = "Failed to create string.";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  unint64_t v2 = v1;
  id v8 = 0;
  uint64_t v3 = +[DiskImages2 imageURLFromDevice:v1 error:&v8];
  id v4 = v8;
  if (v3)
  {
    __int16 v5 = [v3 path];
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve image URL: %@", buf, 0xCu);
  }
  __int16 v5 = 0;
LABEL_11:
  uint64_t v3 = 0;
LABEL_12:

  return v5;
}

id sub_10000C618(void *a1)
{
  id v1 = [a1 pathComponents];
  if ((unint64_t)[v1 count] >= 4)
  {
    id v3 = objc_alloc((Class)NSString);
    id v4 = [v1 objectAtIndexedSubscript:[v1 count] - 3];
    __int16 v5 = [v1 objectAtIndexedSubscript:((char *)[v1 count] - 2)];
    id v2 = [v3 initWithFormat:@"%@%@", v4, v5];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

id sub_10000C6E4()
{
  kern_return_t v8;
  __int16 v9;
  void *Value;
  id v11;
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v15;
  uint64_t vars8;

  properties = 0;
  existing = 0;
  id v0 = objc_alloc_init((Class)NSMutableDictionary);
  if (v0)
  {
    CFMutableDictionaryRef v1 = IOServiceMatching("IOUSBInterface");
    if (v1
      && (CFMutableDictionaryRef v2 = v1,
          [(__CFDictionary *)v1 setObject:&off_100023570 forKeyedSubscript:@"bInterfaceClass"], [(__CFDictionary *)v2 setObject:&off_100023588 forKeyedSubscript:@"bInterfaceSubClass"], [(__CFDictionary *)v2 setObject:&off_100023588 forKeyedSubscript:@"bInterfaceProtocol"], !IOServiceGetMatchingServices(kIOMasterPortDefault, v2, &existing))&& (io_object_t v6 = IOIteratorNext(existing)) != 0)
    {
      io_object_t v7 = v6;
      id v4 = 0;
      id v3 = 0;
      do
      {
        id v8 = IORegistryEntryCreateCFProperties(v7, &properties, 0, 0);
        if (v8)
        {
          id v9 = v8;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v15) = v9 & 0x3FFF;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IORegistryEntryCreateCFProperties failed: 0x%04x", buf, 8u);
          }
        }
        else
        {
          CFStringRef Value = (void *)CFDictionaryGetValue(properties, @"locationID");

          if (Value)
          {
            size_t v11 = objc_alloc_init((Class)NSMutableDictionary);

            if (v11)
            {
              [v11 setObject:Value forKeyedSubscript:@"LocationID"];
              [v11 setObject:@"PTPCamera" forKeyedSubscript:@"DeviceType"];
              [v0 setObject:v11 forKeyedSubscript:@"PTPNode"];
              id v3 = v11;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
              }
              id v3 = 0;
            }
            id v4 = Value;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              id v15 = "locationID";
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve %s.", buf, 0xCu);
            }
            id v4 = 0;
          }
        }
        if (properties) {
          CFRelease(properties);
        }
        properties = 0;
        IOObjectRelease(v7);
        io_object_t v7 = IOIteratorNext(existing);
      }
      while (v7);
    }
    else
    {
      id v3 = 0;
      id v4 = 0;
    }
    if (existing) {
      IOObjectRelease(existing);
    }
  }
  else
  {
    id v4 = 0;
    id v3 = 0;
  }

  return v0;
}

id sub_10000CA20()
{
  kern_return_t v12;
  __int16 v13;
  const char *v14;
  uint32_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  unsigned __int8 v30;
  int v31;
  id v32;
  void *v33;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  uint8_t v39;
  unsigned char v40[15];
  uint8_t v41;
  unsigned char v42[3];
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t v45[4];
  uint64_t v46;
  uint8_t v47[4];
  uint64_t v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  const char *v52;
  unsigned char v53[2168];
  uint64_t vars8;

  properties = 0;
  existing = 0;
  bzero(v53, 0x878uLL);
  CFDictionaryRef v0 = IOServiceMatching("IOMedia");
  CFMutableDictionaryRef v1 = 0;
  CFMutableDictionaryRef v2 = 0;
  id v3 = 0;
  id v4 = 0;
  __int16 v5 = 0;
  io_object_t v6 = 0;
  io_object_t v7 = 0;
  id v8 = 0;
  if (!IOServiceGetMatchingServices(kIOMasterPortDefault, v0, &existing))
  {
    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    if (v9)
    {
      CFMutableDictionaryRef v1 = v9;
      io_object_t v10 = IOIteratorNext(existing);
      if (v10)
      {
        io_object_t v11 = v10;
        CFStringRef v37 = v1;
        uint64_t v38 = 0;
        id v8 = 0;
        io_object_t v7 = 0;
        io_object_t v6 = 0;
        __int16 v5 = 0;
        id v4 = 0;
        id v3 = 0;
        uint64_t v36 = 1;
        while (1)
        {
          if (!sub_10000AC54(v11))
          {
            unsigned int v12 = IORegistryEntryCreateCFProperties(v11, &properties, 0, 0);
            if (v12)
            {
              id v13 = v12;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v50) = v13 & 0x3FFF;
                int v14 = "IORegistryEntryCreateCFProperties failed: 0x%04x";
                id v15 = 8;
LABEL_9:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
              }
            }
            else
            {
              if (properties)
              {
                unint64_t v16 = CFDictionaryGetValue(properties, @"BSD Name");

                uint64_t v17 = sub_10000A160(v16);

                if (v17)
                {
                  id v18 = [objc_alloc((Class)NSString) initWithFormat:@"/dev/%@", v16];

                  if (v18)
                  {
                    int v19 = CFDictionaryGetValue(properties, @"Content");

                    char v20 = sub_10000A160(v19);

                    if (v20)
                    {
                      if ([@"C12A7328-F81F-11D2-BA4B-00A0C93EC93B" isEqualToString:v19])
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                          sub_1000156D0(&v41, v42, v21);
                        }
LABEL_32:
                        id v3 = v18;
                        __int16 v5 = v19;
                        io_object_t v6 = v16;
                        goto LABEL_33;
                      }
                      if ([@"Apple_partition_map" isEqualToString:v19])
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                          sub_10001570C(&v39, v40, v22);
                        }
                        goto LABEL_32;
                      }
                      id v23 = CFDictionaryGetValue(properties, @"Removable");

                      id v24 = sub_10000A01C(v23);

                      if (v24)
                      {
                        if (([v23 BOOLValue] & 1) == 0 && (sub_10000D4D8(v11) & 1) == 0)
                        {
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                            sub_100015794(v47, (uint64_t)v16, &v48);
                          }
                          id v3 = v18;
                          __int16 v5 = v19;
                          io_object_t v6 = v16;
LABEL_59:
                          id v8 = v23;
                          goto LABEL_33;
                        }
                        int v25 = CFDictionaryGetValue(properties, @"Leaf");

                        uint32_t v26 = sub_10000A01C(v25);

                        if (v26)
                        {
                          if ([v25 BOOLValue])
                          {
                            long long v35 = v25;
                            uint64_t v27 = CFDictionaryGetValue(properties, @"Writable");

                            size_t v28 = sub_10000A01C(v27);
                            if (v28)
                            {
                              uint64_t v29 = (void *)v28;
                              uint64_t v30 = [v27 BOOLValue];

                              v36 &= v30 ^ 1;
                            }
                            uint64_t v31 = sub_10000A2A4();
                            if (v31 == 4 || (v31 & 3) == 1)
                            {
                              id v3 = v18;
                              [v3 UTF8String];
                              if ((unint64_t)__strlcpy_chk() >= 0x400)
                              {
                                id v8 = v23;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                  goto LABEL_72;
                                }
LABEL_71:
                                *(_WORD *)buf = 0;
                                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid string size.", buf, 2u);
                                goto LABEL_72;
                              }
                              id v3 = v3;
                              [v3 UTF8String];
                              if ((unint64_t)__strlcpy_chk() >= 0x400)
                              {
                                id v8 = v23;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                  goto LABEL_72;
                                }
                                goto LABEL_71;
                              }
                              if ((unint64_t)__strlcpy_chk() >= 0x10)
                              {
                                id v8 = v23;
                                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
                                  goto LABEL_71;
                                }
LABEL_72:
                                id v4 = v27;
                                __int16 v5 = v19;
                                io_object_t v6 = v16;
                                io_object_t v7 = v35;
                                goto LABEL_33;
                              }
                              sub_10000B6B4((uint64_t)v53, 0, 0);
                              uint64_t v32 = (id)objc_claimAutoreleasedReturnValue();

                              if (!v32)
                              {
                                id v8 = v23;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                {
                                  uint64_t v38 = 0;
                                  id v4 = v27;
                                  __int16 v5 = v19;
                                  io_object_t v6 = v16;
                                  io_object_t v7 = v35;
                                  goto LABEL_33;
                                }
                                *(_DWORD *)buf = 138412290;
                                BOOL v50 = (const char *)v3;
                                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create map entry for %@.", buf, 0xCu);
                                uint64_t v38 = 0;
                                goto LABEL_72;
                              }
                            }
                            else
                            {
                              uint64_t v32 = objc_alloc_init((Class)NSMutableDictionary);

                              if (!v32)
                              {
                                id v8 = v23;
                                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_WORD *)buf = 0;
                                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
                                }
                                uint64_t v38 = 0;
                                id v3 = v18;
                                goto LABEL_72;
                              }
                              [v32 setObject:@"MassStorage" forKeyedSubscript:@"DeviceType"];
                              [v32 setObject:v18 forKeyedSubscript:@"DeviceNode"];
                              [v32 setObject:&__kCFBooleanFalse forKeyedSubscript:@"IsMounted"];
                              int v33 = +[NSNumber numberWithBool:v36 & 1];
                              [v32 setObject:v33 forKeyedSubscript:@"IsReadOnly"];
                            }
                            [v37 setObject:v32 forKeyedSubscript:v18];
                            uint64_t v38 = v32;
                            id v3 = v18;
                            id v4 = v27;
                            __int16 v5 = v19;
                            io_object_t v6 = v16;
                            io_object_t v7 = v25;
                          }
                          else
                          {
                            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                              sub_100015748(v45, (uint64_t)v16, &v46);
                            }
                            id v3 = v18;
                            __int16 v5 = v19;
                            io_object_t v6 = v16;
                            io_object_t v7 = v25;
                          }
                          goto LABEL_59;
                        }
                        io_object_t v7 = v25;
                        id v8 = v23;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          BOOL v50 = (const char *)v16;
                          long long v51 = 2080;
                          char v52 = "Leaf";
LABEL_26:
                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The attached media object %@ does not have a '%s' flag.", buf, 0x16u);
                        }
                      }
                      else
                      {
                        id v8 = v23;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          BOOL v50 = (const char *)v16;
                          long long v51 = 2080;
                          char v52 = "Removable";
                          goto LABEL_26;
                        }
                      }
                    }
                    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      BOOL v50 = (const char *)v16;
                      long long v51 = 2080;
                      char v52 = "Content";
                      goto LABEL_26;
                    }
                    id v3 = v18;
                    __int16 v5 = v19;
                  }
                  else
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
                    }
                    id v3 = 0;
                  }
                }
                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  BOOL v50 = "BSD Name";
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve %s.", buf, 0xCu);
                }
                io_object_t v6 = v16;
                goto LABEL_33;
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                int v14 = "Failed to retrieve any properties for the matched service.";
                id v15 = 2;
                goto LABEL_9;
              }
            }
          }
LABEL_33:
          IOObjectRelease(v11);
          if (properties) {
            CFRelease(properties);
          }
          properties = 0;
          io_object_t v11 = IOIteratorNext(existing);
          if (!v11)
          {
            CFMutableDictionaryRef v1 = v37;
            CFMutableDictionaryRef v2 = v38;
            goto LABEL_81;
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
      }
      CFMutableDictionaryRef v1 = 0;
    }
    CFMutableDictionaryRef v2 = 0;
    id v3 = 0;
    id v4 = 0;
    __int16 v5 = 0;
    io_object_t v6 = 0;
    io_object_t v7 = 0;
    id v8 = 0;
  }
LABEL_81:
  if (existing) {
    IOObjectRelease(existing);
  }

  return v1;
}

uint64_t sub_10000D4D8(io_object_t a1)
{
  kern_return_t ParentEntry;
  void v8[2];
  void (*v9)(void);
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  io_registry_entry_t parent;
  char v17;
  uint8_t buf[4];
  int v19;

  unsigned int v12 = 0;
  id v13 = &v12;
  int v14 = 0x2020000000;
  id v15 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  id v9 = (void (*)(void))sub_10000DDE4;
  io_object_t v10 = &unk_100020CA0;
  io_object_t v11 = &v12;
  CFMutableDictionaryRef v2 = v8;
  uint64_t v17 = 0;
  v9();
  if (!v17)
  {
    IOObjectRetain(a1);
    if (!v17)
    {
      while (1)
      {
        io_registry_entry_t parent = 0;
        ParentEntry = IORegistryEntryGetParentEntry(a1, "IOService", &parent);
        IOObjectRelease(a1);
        if (ParentEntry != -536870208 && ParentEntry != 0) {
          break;
        }
        a1 = parent;
        if (!parent) {
          goto LABEL_3;
        }
        ((void (*)(void *, void, char *))v9)(v2, parent, &v17);
        if (v17)
        {
          IOObjectRelease(a1);
          goto LABEL_3;
        }
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v19 = ParentEntry & 0x3FFF;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IORegistryEntryGetParentEntry failed: 0x%04x", buf, 8u);
      }
    }
  }
LABEL_3:

  uint64_t v3 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v3;
}

void sub_10000D6AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
}

id sub_10000D6D0()
{
  id v0 = objc_alloc_init((Class)NSMutableDictionary);
  if (v0)
  {
    CFMutableDictionaryRef v1 = sub_10000C6E4();
    if (v1) {
      [v0 addEntriesFromDictionary:v1];
    }
    CFMutableDictionaryRef v2 = sub_10000CA20();

    if (v2) {
      [v0 addEntriesFromDictionary:v2];
    }
    uint64_t v3 = sub_10000ACE0();

    if (v3)
    {
      [v0 addEntriesFromDictionary:v3];
    }
  }

  return v0;
}

id sub_10000D784(void *a1)
{
  CFMutableDictionaryRef v1 = sub_10000D844(@"MassStorage", @"DeviceNode", a1);
  CFMutableDictionaryRef v2 = v1;
  if (v1
    && [v1 count]
    && ([v2 objectAtIndex:0],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        sub_10000A088(v3),
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    __int16 v5 = [v2 objectAtIndex:0];
  }
  else
  {
    __int16 v5 = 0;
  }

  return v5;
}

id sub_10000D844(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v29 = a2;
  id v28 = a3;
  if (!v5 || !v29 || !v28)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    goto LABEL_26;
  }
  uint64_t v6 = sub_10000D6D0();
  if (!v6)
  {
    BOOL v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v22) {
      sub_1000157E0(v22, v23, v24);
    }
LABEL_26:
    id v27 = 0;
    int v25 = 0;
    io_object_t v10 = 0;
    id v7 = 0;
    goto LABEL_32;
  }
  id v7 = (id)v6;
  id v27 = objc_alloc_init((Class)NSMutableArray);
  if (v27)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v7 = v7;
    id v8 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v31 = 0;
      io_object_t v10 = 0;
      uint64_t v11 = *(void *)v33;
      do
      {
        unsigned int v12 = 0;
        id v30 = v9;
        do
        {
          id v13 = v10;
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v7);
          }
          int v14 = [v7 objectForKey:*(void *)(*((void *)&v32 + 1) + 8 * (void)v12)];
          io_object_t v10 = [v14 objectForKeyedSubscript:@"DeviceType"];

          if (v10)
          {
            if ([v10 isEqual:v5])
            {
              uint64_t v15 = v11;
              id v16 = v7;
              id v17 = v5;
              id v18 = [v14 objectForKeyedSubscript:v29];

              uint64_t v19 = sub_10000A160(v18);
              if (v19)
              {
                char v20 = (void *)v19;
                unsigned int v21 = [v18 isEqual:v28];

                if (v21) {
                  [v27 addObject:v14];
                }
              }
              uint64_t v31 = v18;
              id v5 = v17;
              id v7 = v16;
              uint64_t v11 = v15;
              id v9 = v30;
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v37 = @"DeviceType";
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
          }

          unsigned int v12 = (char *)v12 + 1;
        }
        while (v9 != v12);
        id v9 = [v7 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v31 = 0;
      io_object_t v10 = 0;
    }

    int v25 = v31;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create array.", buf, 2u);
    }
    id v27 = 0;
    int v25 = 0;
    io_object_t v10 = 0;
  }
LABEL_32:

  return v27;
}

id sub_10000DBCC(void *a1)
{
  return sub_10000D844(@"DiskImage", @"DiskImageType", a1);
}

id sub_10000DBF0(void *a1)
{
  id v1 = a1;
  CFMutableDictionaryRef v2 = sub_10000D6D0();
  uint64_t v3 = v2;
  if (v2)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = v2;
    id v5 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v5)
    {
      id v6 = v5;
      char v20 = v3;
      id v7 = 0;
      uint64_t v8 = *(void *)v22;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        io_object_t v10 = [v4 objectForKey:*(void *)(*((void *)&v21 + 1) + 8 * v9)];
        uint64_t v11 = sub_10000A088(v10);

        if (v11)
        {
          uint64_t v12 = [v10 objectForKeyedSubscript:@"MountPath"];

          id v7 = (void *)v12;
        }
        uint64_t v13 = sub_10000A160(v7);
        if (v13)
        {
          int v14 = (void *)v13;
          unsigned __int8 v15 = [v7 isEqualToString:v1];

          if (v15) {
            break;
          }
        }

        if (v6 == (id)++v9)
        {
          id v6 = [v4 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v6) {
            goto LABEL_4;
          }
          io_object_t v10 = 0;
          break;
        }
      }
      uint64_t v3 = v20;
    }
    else
    {
      id v7 = 0;
      io_object_t v10 = 0;
    }
  }
  else
  {
    BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v16) {
      sub_1000157E0(v16, v17, v18);
    }
    id v7 = 0;
    io_object_t v10 = 0;
  }

  return v10;
}

void sub_10000DDE4(uint64_t a1, io_registry_entry_t entry, unsigned char *a3)
{
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(entry, @"removable", 0, 0);
  if (CFProperty)
  {
    id v6 = CFProperty;
    if (CFEqual(CFProperty, kCFBooleanTrue))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
    CFRelease(v6);
  }
}

id sub_10000DE80(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [objc_alloc((Class)NSString) initHexStringWithData:v3];
  id v6 = v5;
  if (!v5)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      uint64_t v8 = 0;
      id v7 = 0;
      id v9 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    io_object_t v10 = "Failed to create hex string with data.";
    uint32_t v11 = 2;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
    goto LABEL_9;
  }
  if ([v5 length] != (id)256
    && [v6 length] != (id)96
    && [v6 length] != (id)40)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 67109378;
    unsigned int v15 = [v6 length];
    __int16 v16 = 2112;
    id v17 = v3;
    io_object_t v10 = "Unsupported signature length: %d characters (%@)";
    uint32_t v11 = 18;
    goto LABEL_8;
  }
  id v7 = [v6 substringToIndex:((unint64_t)[v6 length]) >> 1];
  uint64_t v8 = [v6 substringFromIndex:[v6 length] >> 1];
  id v9 = [objc_alloc((Class)NSString) initWithFormat:@"%@/%@/%@", v4, v7, v8];
LABEL_10:
  id v12 = v9;

  return v12;
}

uint64_t sub_10000E068(const char *a1)
{
  bzero(__s1, 0x400uLL);
  if (strlen(a1) > 0x400) {
    goto LABEL_18;
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v21 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  unsigned int v15 = sub_10000ED18;
  __int16 v16 = &unk_100020CE8;
  id v17 = buf;
  uint64_t v18 = a1;
  CFMutableDictionaryRef v2 = v14;
  id v3 = +[NSFileManager defaultManager];
  id v4 = [v3 stringWithFileSystemRepresentation:a1 length:strlen(a1)];

  id v5 = [v4 pathComponents];
  id v6 = [v5 mutableCopy];

  if (v6)
  {
    id v7 = (char *)[v6 count];
    if (v7)
    {
      do
      {
        uint64_t v8 = +[NSString pathWithComponents:v6];
        id v9 = v8;
        if (v8)
        {
          id v10 = v8;
          id v11 = [v10 fileSystemRepresentation];
          if (!((unsigned int (*)(void *, id))v15)(v2, v11))
          {

            break;
          }
          [v6 removeLastObject];
        }
      }
      while (--v7);
    }
  }

  int v12 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  if (v12 || !realpath_DARWIN_EXTSN(a1, __s1) || (uint64_t result = strcmp(__s1, a1), result))
  {
LABEL_18:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = __s1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Paths don't match: (%s/%s)", buf, 0x16u);
    }
    return 1;
  }
  return result;
}

void sub_10000E2CC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E2F0(const char *a1, removefile_flags_t a2)
{
  int value = 0;
  id v4 = removefile_state_alloc();
  if (v4)
  {
    id v5 = v4;
    if (removefile_state_set(v4, 3u, sub_10000E534)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *__error();
      id v7 = __error();
      uint64_t v8 = strerror(*v7);
      *(_DWORD *)buf = 67109378;
      int v19 = v6;
      __int16 v20 = 2080;
      char v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removefile_state_set failed: %d (%s)", buf, 0x12u);
    }
    if (removefile_state_set(v5, 4u, &value) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *__error();
      id v10 = __error();
      id v11 = strerror(*v10);
      *(_DWORD *)buf = 67109378;
      int v19 = v9;
      __int16 v20 = 2080;
      char v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removefile_state_set failed: %d (%s)", buf, 0x12u);
    }
    if (removefile(a1, v5, a2))
    {
      uint64_t v12 = 0;
      if (*__error() != 2 || value) {
        goto LABEL_17;
      }
    }
    else if (value)
    {
      uint64_t v12 = 0;
LABEL_17:
      removefile_state_free(v5);
      return v12;
    }
    uint64_t v12 = 1;
    goto LABEL_17;
  }
  uint64_t v12 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *__error();
    int v14 = __error();
    unsigned int v15 = strerror(*v14);
    *(_DWORD *)buf = 67109378;
    int v19 = v13;
    __int16 v20 = 2080;
    char v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removefile_state_alloc failed: %d (%s)", buf, 0x12u);
    return 0;
  }
  return v12;
}

uint64_t sub_10000E534(_removefile_state *a1, const char *a2, int *a3)
{
  int dst = 0;
  memset(&v17, 0, sizeof(v17));
  if (removefile_state_get(a1, 5u, &dst))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removefile_state_get failed: %{errno}d", buf, 8u);
    }
    int dst = 2;
    goto LABEL_17;
  }
  if (dst == 1)
  {
    if (lstat(a2, &v17))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *__error();
        id v7 = __error();
        uint64_t v8 = strerror(*v7);
        *(_DWORD *)buf = 136315650;
        __int16 v20 = a2;
        __int16 v21 = 1024;
        int v22 = v6;
        __int16 v23 = 2080;
        long long v24 = v8;
        int v9 = "lstat failed for %s: %d (%s)";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, 0x1Cu);
      }
    }
    else
    {
      if ((v17.st_flags & 2) == 0) {
        goto LABEL_17;
      }
      if (lchflags(a2, v17.st_flags & 0xFFFFFFFD))
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        int v10 = *__error();
        id v11 = __error();
        uint64_t v12 = strerror(*v11);
        *(_DWORD *)buf = 136315650;
        __int16 v20 = a2;
        __int16 v21 = 1024;
        int v22 = v10;
        __int16 v23 = 2080;
        long long v24 = v12;
        int v9 = "lchflags failed for %s: %d (%s)";
        goto LABEL_9;
      }
      if (!unlink(a2)) {
        return 0;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *__error();
        int v14 = __error();
        unsigned int v15 = strerror(*v14);
        *(_DWORD *)buf = 136315650;
        __int16 v20 = a2;
        __int16 v21 = 1024;
        int v22 = v13;
        __int16 v23 = 2080;
        long long v24 = v15;
        int v9 = "Failed to unlink %s: %d (%s)";
        goto LABEL_9;
      }
    }
  }
LABEL_17:
  if (a3 && !*a3) {
    *a3 = dst;
  }
  return 0;
}

id sub_10000E7D0(void *a1)
{
  id v1 = a1;
  CFMutableDictionaryRef v2 = v1;
  if (v1)
  {
    id v3 = v1;
    [v3 UTF8String];
    uint64_t v4 = container_system_group_path_for_identifier();
    if (v4)
    {
      int v5 = (void *)v4;
      id v6 = [objc_alloc((Class)NSString) initWithUTF8String:v4];
      free(v5);
      goto LABEL_10;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v11 = v3;
      __int16 v12 = 1024;
      int v13 = 1;
      id v7 = "Failed to copy system group container (%@): %d";
      uint32_t v8 = 18;
      goto LABEL_8;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v7 = "Invalid input.";
    uint32_t v8 = 2;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, buf, v8);
  }
  id v6 = 0;
LABEL_10:

  return v6;
}

id sub_10000E940()
{
  if (qword_100024608 != -1) {
    dispatch_once(&qword_100024608, &stru_100020CC0);
  }
  id v0 = (void *)qword_100024610;

  return v0;
}

void sub_10000E994(id a1)
{
  sub_10000E7D0(@"systemgroup.com.apple.mobilestorageproxy");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"backingStore"];
  CFMutableDictionaryRef v2 = (void *)qword_100024610;
  qword_100024610 = v1;
}

uint64_t sub_10000E9FC(void *a1, void *a2, id a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = v6;
  uint64_t v8 = 0;
  if (v5 && v6)
  {
    do
    {
      int v9 = [v5 domain];
      if ([v9 isEqualToString:v7])
      {
        id v10 = [v5 code];

        if (v10 == a3)
        {
          uint64_t v8 = 1;
          goto LABEL_9;
        }
      }
      else
      {
      }
      id v11 = [v5 userInfo];
      uint64_t v12 = [v11 objectForKeyedSubscript:NSUnderlyingErrorKey];

      id v5 = (id)v12;
    }
    while (v12);
    uint64_t v8 = 0;
  }
LABEL_9:

  return v8;
}

id sub_10000EADC(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  CFTypeRef CFProperty = 0;
  if (a1 && v3)
  {
    io_registry_entry_t v6 = IORegistryEntryFromPath(kIOMainPortDefault, (const char *)[a1 fileSystemRepresentation]);
    if (v6)
    {
      io_object_t v7 = v6;
      CFTypeRef CFProperty = (void *)IORegistryEntryCreateCFProperty(v6, v4, 0, 0);
      IOObjectRelease(v7);
    }
    else
    {
      CFTypeRef CFProperty = 0;
    }
  }

  return CFProperty;
}

id sub_10000EB80(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  io_registry_entry_t v6 = v5;
  io_object_t v7 = 0;
  unsigned int v13 = 0;
  if (!a1) {
    goto LABEL_6;
  }
  uint64_t v8 = v5;
  if (!a2) {
    goto LABEL_7;
  }
  io_object_t v7 = sub_10000EADC(a1, a2);
  uint64_t v9 = sub_10000A1CC(v7);
  if (v9 && (id v10 = (void *)v9, v11 = [v7 length], v10, v11 == (id)4))
  {
    [v7 getBytes:&v13 length:4];
    uint64_t v8 = +[NSNumber numberWithInt:v13];
  }
  else
  {
LABEL_6:
    uint64_t v8 = v6;
  }
LABEL_7:

  return v8;
}

uint64_t sub_10000EC68(io_object_t *a1, const char *a2)
{
  uint64_t v2 = 0;
  io_iterator_t iterator = 0;
  if (a1 && a2)
  {
    if (IORegistryEntryGetChildIterator(*a1, "IOService", &iterator))
    {
      uint64_t v2 = 0;
    }
    else
    {
      while (1)
      {
        uint64_t v5 = IOIteratorNext(iterator);
        uint64_t v2 = v5;
        if (!v5) {
          break;
        }
        if (IOObjectConformsTo(v5, a2))
        {
          IOObjectRelease(*a1);
          *a1 = v2;
          uint64_t v2 = 1;
          break;
        }
        IOObjectRelease(v2);
      }
    }
    if (iterator) {
      IOObjectRelease(iterator);
    }
  }
  return v2;
}

uint64_t sub_10000ED18(uint64_t a1)
{
  memset(&v8, 0, sizeof(v8));
  if (!lstat(*(const char **)(a1 + 40), &v8))
  {
    uint64_t result = 1;
    if ((v8.st_mode & 0xF000) != 0xA000) {
      return result;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  if (*__error() == 2) {
    return 1;
  }
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = *__error();
    io_registry_entry_t v6 = __error();
    io_object_t v7 = strerror(*v6);
    *(_DWORD *)buf = 136315650;
    uint64_t v10 = v4;
    __int16 v11 = 1024;
    int v12 = v5;
    __int16 v13 = 2080;
    int v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "lstat failed for %s: %d (%s)", buf, 0x1Cu);
    return 0;
  }
  return result;
}

void sub_10000EE64(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  uint64_t v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  uint64_t v5 = &v4[v3];
  io_registry_entry_t v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    int v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      int v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            uint64_t result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          id v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    int v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  uint64_t v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_54;
  }
  uint64_t v5 = &v4[v3];
  io_registry_entry_t v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    int v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_55;
      }
      int v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        BOOL v17 = v16 < v15 && a3 == 0;
        unint64_t v18 = (unint64_t)(v12 + 1);
        if (v17) {
          return 3;
        }
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL)) {
          return 7;
        }
        if (v18 <= v18 + v15)
        {
          uint64_t result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_55;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_56;
        }
        unsigned int v23 = *v14++;
        unint64_t v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (v15 <= v22) {
            char v24 = 1;
          }
          else {
            char v24 = a3;
          }
          uint64_t result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0) {
            goto LABEL_28;
          }
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_54;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_55;
    }
    int v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, unsigned char *a3)
{
  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(result + 8)) {
    return 3;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  if (a1[1] != (unsigned __int8 *)1) {
    return 3;
  }
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3;
  }
  uint64_t result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned int v3 = a1[1];
  if (!v3) {
    goto LABEL_9;
  }
  if (v3 == (unsigned __int8 *)1)
  {
    int v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      uint64_t result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  unint64_t v4 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, &v4);
  if (!result)
  {
    if (HIDWORD(v4))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4;
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  memset(v8, 170, sizeof(v8));
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  memset(v12, 170, sizeof(v12));
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!result)
  {
    if (v12[0] == 0x2000000000000010) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v32 = 0;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    id v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if (result) {
        break;
      }
      if (a2 <= v13) {
        return 2;
      }
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3) {
          goto LABEL_58;
        }
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24 * v13 + 8)) {
          break;
        }
        uint64_t result = 2;
        if (v18)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1)) {
            continue;
          }
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4) {
          goto LABEL_59;
        }
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }
    if (result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        BOOL v25 = (__int16 *)(a3 + 24 * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  memset(v4, 170, sizeof(v4));
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL) {
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  v9[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4) {
    goto LABEL_13;
  }
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  char v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if (result) {
      break;
    }
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if (result) {
      break;
    }
    if (v7) {
      return 0;
    }
  }
  if (result <= 1) {
    return 0;
  }
  else {
    return result;
  }
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  BOOL result = 0;
  if (a1 && a2)
  {
    size_t v4 = *(void *)(a1 + 8);
    return v4 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

uint64_t Img4DecodeSecureBootRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&SecureBoot_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeLocalRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&unk_100017EC8, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeShamRsa4kSha384IM4C(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&unk_1000180D6, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

void Img4DecodeEvaluateTrust(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
}

double Img4DecodeCopyPayloadHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyPayloadHashWithCallback(a1, (void (*)(void, void, long long *))sha1_digest, a2, a3);
}

double Img4DecodeCopyManifestHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyManifestHashWithCallback(a1, (void (*)(void))sha1_digest, a2, a3);
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v7 = 0;
  long long v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      double result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }
  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  v6[0] = 0;
  v6[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v6)) {
    return DERImg4DecodeFindInSequence(v6, a2, a3);
  }
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 4) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != 4) {
    return 1;
  }
  unsigned int v5 = 0;
  if (DERParseInteger((char **)a1, &v5)) {
    return 4294967294;
  }
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return v5 > a2;
}

uint64_t DERImg4Decode(void *a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      unint64_t v6 = 0;
      unint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t result = DERDecodeItem((uint64_t)a1, &v6);
      if (!result)
      {
        if (v6 == 0x2000000000000010)
        {
          uint64_t v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            uint64_t result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0);
            if (!result) {
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
            }
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  unsigned int v5 = 2;
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceContentToObject(a1, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)a2, 0x20uLL, 0);
      if (!result)
      {
        uint64_t result = DERParseInteger(a2, &v5);
        if (!result)
        {
          if (v5 <= 1) {
            return 0;
          }
          else {
            return 6;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0);
      if (!result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(void *)(a2 + 80) {
               || (long long v7 = 0u,
        }
                   long long v8 = 0u,
                   uint64_t result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !result))
        {
          uint64_t v6 = *(void *)(a2 + 96);
          uint64_t v5 = a2 + 96;
          if (!v6) {
            return 0;
          }
          long long v7 = 0u;
          long long v8 = 0u;
          uint64_t result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!result) {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (DERImg4DecodeTagCompare(a2, 0x50415950u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if (result)
    {
      uint64_t result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0);
      if (!result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          uint64_t v6 = *(void *)(a2 + 80);
          uint64_t v5 = (unint64_t *)(a2 + 80);
          if (!v6) {
            return 0;
          }
          memset(v10, 0, sizeof(v10));
          uint64_t result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!result) {
            return 0;
          }
        }
      }
    }
    else
    {
      long long v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      long long v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      long long v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t DERImg4DecodeManifest(void *a1, unint64_t a2)
{
  return sub_10001020C(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t sub_10001020C(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1]) {
      return 0;
    }
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    uint64_t result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!result)
    {
      if (DERImg4DecodeTagCompare(a4, a5)) {
        return 2;
      }
      unsigned int v9 = 0;
      uint64_t result = DERParseInteger((char **)(a4 + 16), &v9);
      if (result) {
        return result;
      }
      if (v9 > 2) {
        return 2;
      }
      return 0;
    }
  }
  return result;
}

uint64_t DERImg4DecodeUnsignedManifest(void *a1, unint64_t a2)
{
  return sub_10001020C(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeCertificate(void *a1, unint64_t a2)
{
  return sub_10001020C(a1, 4uLL, (uint64_t)&DERImg4CertificateItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeUnsignedCertificate(void *a1, unint64_t a2)
{
  return sub_10001020C(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeCertificatePropertiesAndPubKey(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              v21[0] = a1;
              v21[1] = a2;
              long long v16 = 0u;
              long long v17 = 0u;
              long long v14 = 0u;
              long long v15 = 0u;
              uint64_t result = DERDecodeItem((uint64_t)v21, &v18);
              if (!result)
              {
                if (v18 != 0x2000000000000011) {
                  return 2;
                }
                if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERIM4CItemSpecs, (unint64_t)&v16, 0x20uLL, 0))
                {
                  uint64_t result = DERDecodeItem((uint64_t)&v16, &v18);
                  if (result) {
                    return result;
                  }
                  if (v18 != 0x2000000000000010) {
                    return 2;
                  }
                  if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERCRTPSequenceItemSpecs, (unint64_t)&v14, 0x20uLL, 0))
                  {
                    uint64_t v12 = *((void *)&v15 + 1);
                    *a3 = v15;
                    *a4 = v12;
                    uint64_t result = DERDecodeItem((uint64_t)&v17, &v18);
                    if (result) {
                      return result;
                    }
                    if (v18 == 4)
                    {
                      uint64_t result = 0;
                      uint64_t v13 = v20;
                      *a5 = v19;
                      *a6 = v13;
                      return result;
                    }
                    return 2;
                  }
                }
                return 0xFFFFFFFFLL;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2) {
      return 6;
    }
    if (*(void *)result && *(void *)(result + 8))
    {
      uint64_t result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0);
      if (result) {
        return result;
      }
      if (DERImg4DecodeTagCompare(a2, 0x494D3452u)) {
        return 2;
      }
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodeProperty(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a3)
    {
      unint64_t v14 = 0;
      long long v15 = 0uLL;
      long long v13 = 0uLL;
      uint64_t v11 = 0;
      unint64_t v12 = 0;
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      unsigned int v8 = 0;
      uint64_t result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!result)
      {
        if (v9 != 0x2000000000000010) {
          return 2;
        }
        uint64_t result = DERDecodeSeqNext(&v10, &v14);
        if (result) {
          return result;
        }
        if (v14 != 22) {
          return 2;
        }
        uint64_t result = DERParseInteger((char **)&v15, &v8);
        if (result) {
          return result;
        }
        if ((v8 | 0xE000000000000000) != a2) {
          return 2;
        }
        *(_OWORD *)a3 = v15;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if (result) {
          return result;
        }
        *(void *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if (result != 1) {
          return 2;
        }
        uint64_t v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }
        else if (v11 == *a1 + v7)
        {
          return 0;
        }
        else
        {
          return 7;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unsigned int v8 = 0;
  v9[0] = 0;
  unint64_t v9[2] = 0;
  v9[1] = 22;
  v9[3] = 24;
  long long v10 = a3;
  uint64_t result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0);
  if (!result)
  {
    uint64_t result = DERParseInteger((char **)a4, &v8);
    if (!result)
    {
      if ((v8 | 0xE000000000000000) == a2)
      {
        uint64_t result = 0;
        *(void *)(a4 + 16) = a2 | 0xE000000000000000;
        *(void *)(a4 + 40) = a3;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

void DERImg4DecodeFindPropertyInSequence(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  long long v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7) {
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
  }
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  v7[0] = 0;
  v7[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v7)) {
    DERImg4DecodeFindPropertyInSequence(v7, a2, a3, a4);
  }
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

void sub_1000107B8(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  int v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      unint64_t v14 = 0;
      v15[0] = 0;
      v15[1] = 0;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        unint64_t v8 = v11 == 2 ? 0x2000000000000010 : 0x2000000000000011;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2) {
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          }
          DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, 0xE00000004D414E50, 0x2000000000000011uLL, (unint64_t)v12);
          if (a3)
          {
            if (!v10) {
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
            }
          }
        }
      }
    }
  }
}

void DERImg4DecodeParseCertificateProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  unint64_t v11 = 0;
  unint64_t v12 = 0;
  v16[0] = 0;
  v16[1] = 0;
  v14[1] = 0;
  unint64_t v15 = 0;
  uint64_t result = 0xFFFFFFFFLL;
  unint64_t v13 = 0;
  v14[0] = 0;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010) {
            return 2;
          }
          uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if (result) {
            return result;
          }
          if (v11)
          {
            uint64_t result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!result)
            {
              uint64_t v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1)) {
                return 7;
              }
              BOOL v9 = __CFADD__(v12, v8);
              uint64_t v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }
              else
              {
                uint64_t result = 0;
                *a4 = v10;
              }
              return result;
            }
            return 2;
          }
        }
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeParseLengthFromBuffer(uint64_t a1, uint64_t a2, void *a3)
{
  return Img4DecodeParseLengthFromBufferWithTag(a1, a2, 0x494D4734u, a3);
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 136)) {
      BOOL v4 = *(void *)(a1 + 144) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayload(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadType(uint64_t a1, _DWORD *a2)
{
  BOOL v5 = 0;
  uint64_t result = 6;
  if (!a1 || !a2 || (uint64_t result = Img4DecodePayloadExists(a1, &v5), result))
  {
LABEL_6:
    if (!a2) {
      return result;
    }
    goto LABEL_7;
  }
  if (v5)
  {
    uint64_t result = DERParseInteger((char **)(a1 + 104), a2);
    goto LABEL_6;
  }
  uint64_t result = 1;
  if (!a2) {
    return result;
  }
LABEL_7:
  if (result) {
    *a2 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadVersion(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 120);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadKeybagExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 152)) {
      BOOL v4 = *(void *)(a1 + 160) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadKeybag(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
  {
    BOOL v5 = 0;
    uint64_t result = Img4DecodePayloadExists(a1, &v5);
    if (!result)
    {
      if (v5)
      {
        uint64_t result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 152);
        return result;
      }
      uint64_t result = 1;
    }
    goto LABEL_9;
  }
  uint64_t result = 6;
  if (a2)
  {
LABEL_9:
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadCompressionInfoExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 168)) {
      BOOL v4 = *(void *)(a1 + 176) != 0;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadCompressionInfo(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  BOOL v11 = 0;
  uint64_t result = 6;
  if (!a1) {
    goto LABEL_14;
  }
  if (!a2) {
    goto LABEL_14;
  }
  if (!a3) {
    goto LABEL_14;
  }
  uint64_t result = Img4DecodePayloadExists(a1, &v11);
  if (result) {
    goto LABEL_14;
  }
  if (!v11) {
    goto LABEL_13;
  }
  uint64_t result = Img4DecodePayloadCompressionInfoExists(a1, &v11);
  if (result) {
    goto LABEL_14;
  }
  if (!v11)
  {
LABEL_13:
    uint64_t result = 1;
    goto LABEL_14;
  }
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v8 = *(void *)(a1 + 168);
  int v7 = (unint64_t *)(a1 + 168);
  if (!v8)
  {
    uint64_t result = 0xFFFFFFFFLL;
    if (!a2) {
      return result;
    }
LABEL_15:
    if (a3)
    {
      *a2 = -1;
      *a3 = -1;
    }
    return result;
  }
  uint64_t result = DERParseSequenceContentToObject(v7, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)&v9, 0x20uLL, 0);
  if (result
    || (uint64_t result = DERParseInteger((char **)&v9, a2), result)
    || (uint64_t result = DERParseInteger((char **)&v10, a3), result))
  {
LABEL_14:
    if (!a2) {
      return result;
    }
    goto LABEL_15;
  }
  return result;
}

double Img4DecodeCopyPayloadHashWithCallback(uint64_t a1, void (*a2)(void, void, long long *), uint64_t a3, int a4)
{
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v7;
    }
LABEL_9:
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    return *(double *)&v7;
  }
  BOOL v9 = 0;
  if (Img4DecodePayloadExists(a1, &v9) || !v9) {
    goto LABEL_9;
  }
  if (*(unsigned char *)a1)
  {
    long long v7 = *(_OWORD *)(a1 + 184);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 200);
    *(_OWORD *)a3 = v7;
  }
  else
  {
    long long v10 = 0uLL;
    int v11 = 0;
    a2(*(void *)(a1 + 8), *(void *)(a1 + 16), &v10);
    *(void *)&long long v7 = v10;
    *(_OWORD *)a3 = v10;
    *(_DWORD *)(a3 + 16) = v11;
  }
  return *(double *)&v7;
}

uint64_t Img4DecodeCopyPayloadDigest(uint64_t a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t v4 = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          BOOL v10 = 0;
          if (*a4)
          {
            if (!Img4DecodePayloadExists(a1, &v10))
            {
              if (v10)
              {
                if (a3 > 0x30)
                {
                  return 7;
                }
                else if (*(unsigned char *)a1)
                {
                  memcpy(a2, (const void *)(a1 + 184), a3);
                  return 0;
                }
                else
                {
                  memset(__src, 0, sizeof(__src));
                  uint64_t v4 = (*a4)(*(void *)(a1 + 8), *(void *)(a1 + 16), __src, a3, a4);
                  if (!v4) {
                    memcpy(a2, __src, a3);
                  }
                }
              }
              else
              {
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeManifestExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(a1 + 24) != 0;
    }
  }
  return result;
}

double Img4DecodeCopyManifestHashWithCallback(uint64_t a1, void (*a2)(void), uint64_t a3, int a4)
{
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3) {
      return *(double *)&v5;
    }
LABEL_8:
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    return *(double *)&v5;
  }
  if (!*(void *)(a1 + 24)) {
    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 1))
  {
    long long v5 = *(_OWORD *)(a1 + 328);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 344);
    *(_OWORD *)a3 = v5;
  }
  else
  {
    a2();
    *(void *)&long long v5 = 0;
    *(_OWORD *)a3 = 0uLL;
    *(_DWORD *)(a3 + 16) = 0;
  }
  return *(double *)&v5;
}

uint64_t Img4DecodeCopyManifestDigest(uint64_t a1, void *__dst, size_t __n, uint64_t (**a4)(uint64_t, void, _OWORD *, size_t, void))
{
  uint64_t v4 = 6;
  if (a1)
  {
    if (__dst)
    {
      if (__n)
      {
        if (a4)
        {
          long long v7 = *a4;
          if (*a4)
          {
            uint64_t v8 = *(void *)(a1 + 24);
            if (v8)
            {
              if (__n > 0x30)
              {
                return 7;
              }
              else if (*(unsigned char *)(a1 + 1))
              {
                memcpy(__dst, (const void *)(a1 + 328), __n);
                return 0;
              }
              else
              {
                memset(v10, 0, sizeof(v10));
                uint64_t v4 = v7(v8, *(void *)(a1 + 32), v10, __n, a4);
                if (!v4) {
                  memcpy(__dst, v10, __n);
                }
              }
            }
            else
            {
              return 1;
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeGetManifest(uint64_t a1, void *a2, _DWORD *a3)
{
  uint64_t result = 6;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(void *)(a1 + 24);
    *a2 = v5;
    int v6 = *(_DWORD *)(a1 + 32);
    *a3 = v6;
    if (v5) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    int v8 = v7;
    return (v8 << 31 >> 31);
  }
  return result;
}

uint64_t Img4DecodeSectionExists(void *a1, unsigned int a2, char *a3)
{
  uint64_t v3 = 6;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56]) {
        goto LABEL_11;
      }
    }
    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      char v4 = 0;
      goto LABEL_12;
    }
    char v4 = 1;
LABEL_12:
    uint64_t v3 = 0;
    *a3 = v4;
  }
  return v3;
}

uint64_t Img4DecodeRestoreInfoExists(void *a1, char *a2)
{
  return Img4DecodeSectionExists(a1, 1u, a2);
}

uint64_t Img4DecodeGetRestoreInfoBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  return Img4DecodeGetBooleanFromSection(a1, 1u, a2, a3);
}

uint64_t Img4DecodeGetBooleanFromSection(uint64_t a1, unsigned int a2, uint64_t a3, BOOL *a4)
{
  memset(v8, 0, sizeof(v8));
  uint64_t v4 = 6;
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
      uint64_t v4 = v6;
      if (!v6) {
        return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
      }
    }
  }
  return v4;
}

void Img4DecodeGetRestoreInfoInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
}

void Img4DecodeGetIntegerFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger((char **)&v6[1] + 1, a4)) {
          *a4 = 0;
        }
      }
    }
  }
}

void Img4DecodeGetRestoreInfoInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
}

void Img4DecodeGetInteger64FromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger64((char **)&v6[1] + 1, a4)) {
          *a4 = 0;
        }
      }
    }
  }
}

void Img4DecodeGetRestoreInfoData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
}

void Img4DecodeGetDataFromSection(uint64_t a1, unsigned int a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      *a5 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
      *a5 = v8;
    }
  }
}

uint64_t Img4DecodePayloadPropertiesExists(uint64_t a1, BOOL *a2)
{
  if (!a1) {
    return 6;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = 6;
  memset(v7, 0, sizeof(v7));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v7);
      if (!result) {
        *a2 = (void)v8 != 0;
      }
    }
  }
  return result;
}

void Img4DecodePayloadProperty(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1)
  {
    if (a4)
    {
      if (*(void *)(a1 + 8))
      {
        long long v10 = 0uLL;
        long long v9 = 0uLL;
        memset(v11, 0, sizeof(v11));
        memset(v12, 0, sizeof(v12));
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)v11))
        {
          if (*(void *)&v12[0])
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)v12, 0x2000000000000010, &v10);
            if (!v7)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v8) {
                DERImg4DecodeFindProperty((unint64_t *)&v9, a2, a3, a4);
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePayloadPropertyExistsByTag(uint64_t a1, uint64_t a2, BOOL *a3)
{
  if (a1)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0uLL;
    long long v9 = 0uLL;
    long long v8 = 0uLL;
    if (a3)
    {
      if (*(void *)(a1 + 8))
      {
        long long v19 = 0uLL;
        long long v20 = 0uLL;
        long long v17 = 0uLL;
        long long v18 = 0uLL;
        long long v15 = 0uLL;
        long long v16 = 0uLL;
        long long v13 = 0uLL;
        long long v14 = 0uLL;
        long long v11 = 0uLL;
        long long v12 = 0uLL;
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)&v11))
        {
          if ((void)v17)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v17, 0x2000000000000010, &v10);
            if (!v5)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v6)
              {
                DERImg4DecodeContentFindItemWithTag((unint64_t *)&v9, a2, &v8);
                if (!v7) {
                  *a3 = (void)v8 != 0;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeGetPayloadProperties(uint64_t a1, void *a2)
{
  if (!a1) {
    return 6;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t result = 6;
  memset(v8, 0, sizeof(v8));
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v5 = a1 + 8;
    if (v6)
    {
      uint64_t result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v8);
      if (!result)
      {
        if ((void)v9)
        {
          uint64_t result = 0;
          uint64_t v7 = *((void *)&v9 + 1);
          *a2 = v9;
          a2[1] = v7;
          return result;
        }
        return 6;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeCopyPayloadPropertiesDigest(void *a1, void *a2, size_t a3, uint64_t (**a4)(void, void, _OWORD *, size_t, void))
{
  uint64_t result = 6;
  if (a1 && a2 && a3)
  {
    if (a3 > 0x30)
    {
      return 7;
    }
    else if (a4)
    {
      long long v8 = *a4;
      if (*a4)
      {
        memset(v9, 0, sizeof(v9));
        uint64_t result = v8(*a1, a1[1], v9, a3, a4);
        if (!result)
        {
          memcpy(a2, v9, a3);
          return 0;
        }
      }
    }
  }
  return result;
}

void Img4DecodePayloadPropertiesFindItemWithTag(unint64_t *a1, unsigned int a2, void *a3)
{
  if (a1)
  {
    v23[0] = 0;
    v23[1] = 0;
    v22[0] = 0;
    v22[1] = 0;
    v21[0] = 0;
    v21[1] = 0;
    unint64_t v20 = 0;
    v19[0] = 0;
    v19[1] = 0;
    unint64_t v18 = 0;
    memset(v17, 0, sizeof(v17));
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    unint64_t v14 = 0;
    long long v13 = 0uLL;
    long long v12 = 0uLL;
    long long v11 = 0uLL;
    if (a3)
    {
      if (*a1)
      {
        DERImg4DecodeContentFindItemWithTag(a1, 0x2000000000000010, &v11);
        if (!v5)
        {
          if ((void)v11)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 22, &v13);
            if (!v6 && !DERImg4DecodeTagCompare((uint64_t)&v13, 0x50415950u))
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 0x2000000000000011, &v12);
              if (!v7 && !DERDecodeSeqContentInit((unint64_t *)&v12, v23))
              {
                while (1)
                {
                  do
                  {
                    while (1)
                    {
                      int v8 = DERDecodeSeqNext(v23, &v20);
                      if (!v8) {
                        break;
                      }
                      if (v8 == 1) {
                        return;
                      }
                    }
                  }
                  while (DERDecodeItem((uint64_t)v21, &v18));
                  DERImg4DecodeContentFindItemWithTag(v19, 22, &v13);
                  if (v9) {
                    break;
                  }
                  if (!DERImg4DecodeTagCompare((uint64_t)&v13, a2)
                    && !DERDecodeSeqContentInit(v19, v22)
                    && !DERDecodeSeqNext(v22, v17)
                    && v17[0] == 22
                    && !DERDecodeSeqNext(v22, &v14))
                  {
                    if (v15)
                    {
                      uint64_t v10 = v16;
                      *a3 = v15;
                      a3[1] = v10;
                    }
                    return;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodeGetPayloadPropertiesBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 1uLL, (unint64_t)v5);
  if (!v4) {
    DERParseBoolean((unsigned __int8 **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4) {
    DERParseInteger((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4) {
    DERParseInteger64((char **)&v5[1] + 1, a3);
  }
}

void Img4DecodeGetPayloadPropertiesData(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  Img4DecodePayloadProperty(a1, a2, 4uLL, (unint64_t)&v8);
  if (!v6)
  {
    uint64_t v7 = v10;
    *a3 = *((void *)&v9 + 1);
    *a4 = v7;
  }
}

double Img4DecodeGetObjectProperty(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  v14[0] = 0;
  v14[1] = 0;
  double result = 0.0;
  memset(v13, 0, sizeof(v13));
  if (a1)
  {
    if (a5)
    {
      DERImg4DecodeParseManifestProperties(a1, (unint64_t)v14, 0);
      if (v10
        || (DERImg4DecodeFindProperty(v14, a2 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v13), v11)
        || (DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, a3, a4, (unint64_t)a5), v12))
      {
        double result = 0.0;
        a5[1] = 0u;
        a5[2] = 0u;
        *a5 = 0u;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeGetObjectPropertyBoolean(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  memset(v8, 0, sizeof(v8));
  uint64_t v4 = 6;
  if (a1 && a4)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
    if (!v6) {
      return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    }
    return v6;
  }
  return v4;
}

void Img4DecodeGetObjectPropertyInteger(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger((char **)&v6[1] + 1, a4)) {
        *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetObjectPropertyInteger64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger64((char **)&v6[1] + 1, a4)) {
        *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetObjectPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetObjectPropertyString(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 0x16uLL, &v9);
    if (v7)
    {
      uint64_t v8 = 0;
      *a4 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a4 = *((void *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetPayloadVersionPropertyString(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a3 && a4)
  {
    uint64_t v14 = 0;
    v15[0] = 0;
    v15[1] = 0;
    memset(v13, 0, sizeof(v13));
    long long v12 = 0uLL;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    if (DERDecodeItem(a1, (unint64_t *)&v14)
      || DERImg4DecodeProperty(v15, v14, (uint64_t)v13)
      || (DERImg4DecodeContentFindItemWithTag((unint64_t *)&v13[1] + 1, a2, &v12), v7)
      || DERImg4DecodeProperty(&v12, a2, (uint64_t)&v9))
    {
      uint64_t v8 = 0;
      *a3 = 0;
    }
    else
    {
      uint64_t v8 = v11;
      *a3 = *((void *)&v10 + 1);
    }
    *a4 = v8;
  }
}

double Img4DecodeGetPropertyFromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  *(_OWORD *)long long v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    char v14 = 0;
    if (!Img4DecodeSectionExists((void *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)long long v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }
      DERImg4DecodeParseManifestProperties(a1, 0, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12) {
          return result;
        }
      }
    }
    double result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) != 2)
    {
      uint64_t result = 2;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }
    if (!a3) {
      return 6;
    }
    uint64_t result = DERParseInteger((char **)&v8 + 1, a3);
  }
  if (!a3) {
    return result;
  }
LABEL_6:
  if (result) {
    *a3 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) != 2)
    {
      uint64_t result = 2;
      if (!a3) {
        return result;
      }
      goto LABEL_6;
    }
    if (!a3) {
      return 6;
    }
    uint64_t result = DERParseInteger64((char **)&v8 + 1, a3);
  }
  if (!a3) {
    return result;
  }
LABEL_6:
  if (result) {
    *a3 = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(void *)a1;
  v6[1] = v4;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!result)
  {
    if (*((void *)&v9 + 1) == 1)
    {
      if (a3) {
        return DERParseBoolean((unsigned __int8 **)&v8 + 1, a3);
      }
      else {
        return 6;
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t Img4DecodeGetPropertyData(uint64_t *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  uint64_t result = 6;
  if (a3 && a4)
  {
    uint64_t v8 = *a1;
    uint64_t v9 = *((unsigned int *)a1 + 2);
    v11[0] = v8;
    v11[1] = v9;
    uint64_t result = DERImg4DecodeProperty(v11, a2 | 0xE000000000000000, (uint64_t)&v12);
    if (!result)
    {
      if (*((void *)&v14 + 1) == 4)
      {
        uint64_t result = 0;
        *a3 = *((void *)&v13 + 1);
        int v10 = v14;
LABEL_6:
        *a4 = v10;
        return result;
      }
      uint64_t result = 2;
    }
    int v10 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  return result;
}

void Img4DecodeEvaluateCertificateProperties(void *a1)
{
}

void sub_1000122A8(void *a1, _OWORD *a2)
{
  v21[0] = 0;
  v21[1] = 0;
  v20[0] = 0;
  v20[1] = 0;
  uint64_t v19 = 0;
  long long v18 = 0uLL;
  size_t __n = 0;
  uint64_t v17 = 0;
  uint64_t v14 = 0;
  __s1 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  memset(v9, 0, sizeof(v9));
  long long __s2 = 0uLL;
  long long v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011)
  {
    while (1)
    {
      if (DERDecodeSeqNext(v21, (unint64_t *)&v17)) {
        return;
      }
      uint64_t v4 = (long long *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50:
LABEL_11:
          long long v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((void *)&v13 + 1) != 0x2000000000000011
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }
          while (1)
          {
            int v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5) {
              break;
            }
            if (DERImg4DecodeProperty(&__s1, v14, (uint64_t)v9)) {
              return;
            }
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((void *)&v10 + 1) <= 4uLL && ((1 << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6) {
                return;
              }
              if (__n != *((void *)&__s2 + 1)) {
                return;
              }
              int v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6) {
                return;
              }
            }
            else if (*((void *)&v10 + 1) != 0xA000000000000000)
            {
              if (*((void *)&v10 + 1) != 0xA000000000000001 || v6 != 1) {
                return;
              }
              int v6 = 0;
            }
            if (v6) {
              return;
            }
          }
          if (v5 != 1) {
            return;
          }
          break;
        case 0xE00000006D616E78:
          if (a2) {
            *a2 = v18;
          }
          break;
        case 0xE00000004F424A50:
          uint64_t v4 = (long long *)(a1 + 9);
          if (a1[9]) {
            goto LABEL_11;
          }
          uint64_t v4 = (long long *)(a1 + 9);
          if (a1[10]) {
            goto LABEL_11;
          }
          break;
        default:
          return;
      }
    }
  }
}

void Img4DecodeCopyManifestTrustedBootPolicyMeasurement(void *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  if (a4)
  {
    if (a5)
    {
      if (a5 <= 0x30)
      {
        memset(v17, 0, sizeof(v17));
        memset(v16, 0, sizeof(v16));
        v10[0] = Img4DecodeDigestInit;
        v10[1] = Img4DecodeDigestUpdate;
        _OWORD v10[2] = Img4DecodeDigestReturnHash;
        *(void *)&long long v13 = &unk_100019378;
        *((void *)&v13 + 1) = 156;
        uint64_t v14 = a3;
        uint64_t v15 = v10;
        sub_1000122A8(a1, &v13);
        if (!v9)
        {
          if (a1)
          {
            if (a2)
            {
              v11[0] = &v13;
              v11[1] = a2;
              void v11[2] = a1;
              long long v12 = v17;
              if (!((unsigned int (*)(void, unsigned char **))*v15)(*(void *)(v14 + 32), &v12)
                && !Img4DecodeEvaluateDictionaryProperties(a1 + 7, 0, (uint64_t (*)(unint64_t, uint64_t *, uint64_t, uint64_t))sub_1000133F0, (uint64_t)v11)&& !((unsigned int (*)(void, unsigned char **, uint64_t, unsigned char *))v15[2])(*(void *)(v14 + 32), &v12, 48, v16))
              {
                memcpy(a4, v16, a5);
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeEvaluateManifestProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 56), 0, a2, a3);
}

uint64_t Img4DecodeEvaluateDictionaryProperties(unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v15 = 0;
  unint64_t v16 = 0;
  unint64_t v14 = 0;
  v13[0] = 0;
  v13[1] = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  memset(v8, 0, sizeof(v8));
  long long v9 = 0u;
  if (!a3) {
    return 6;
  }
  uint64_t result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!result)
  {
    while (1)
    {
      uint64_t result = DERDecodeSeqNext(v13, &v14);
      if (result == 1) {
        return 0;
      }
      if (result) {
        return result;
      }
      uint64_t result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if (result) {
        return result;
      }
      uint64_t result = 2;
      if (*((void *)&v9 + 1) > 0x16uLL
        || ((1 << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000) == 0)
      {
        return result;
      }
      if (HIDWORD(v16)) {
        break;
      }
      uint64_t v10 = v15;
      LODWORD(v11) = v16;
      uint64_t v12 = *((void *)&v9 + 1);
      uint64_t result = a3(v14, &v10, a2, a4);
      if (result) {
        return result;
      }
    }
    return 7;
  }
  return result;
}

uint64_t Img4DecodeEvaluateObjectProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 72), 1, a2, a3);
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      long long v7 = 0u;
      long long v8 = 0u;
      long long v5 = 0u;
      long long v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(void *)(a3 + 448) = 0;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        double result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

double Img4DecodeInitPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a3)
  {
    *(void *)&long long v5 = a1;
    *((void *)&v5 + 1) = a2;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a3 + 128) = 0u;
    *(_OWORD *)(a3 + 144) = 0u;
    *(_OWORD *)(a3 + 160) = 0u;
    *(_OWORD *)(a3 + 176) = 0u;
    *(_OWORD *)(a3 + 192) = 0u;
    *(_OWORD *)(a3 + 208) = 0u;
    *(_OWORD *)(a3 + 224) = 0u;
    *(_OWORD *)(a3 + 240) = 0u;
    *(_OWORD *)(a3 + 256) = 0u;
    *(_OWORD *)(a3 + 272) = 0u;
    *(_OWORD *)(a3 + 288) = 0u;
    *(_OWORD *)(a3 + 304) = 0u;
    *(_OWORD *)(a3 + 320) = 0u;
    *(_OWORD *)(a3 + 336) = 0u;
    *(_OWORD *)(a3 + 352) = 0u;
    *(_OWORD *)(a3 + 368) = 0u;
    *(_OWORD *)(a3 + 384) = 0u;
    *(_OWORD *)(a3 + 400) = 0u;
    *(_OWORD *)(a3 + 416) = 0u;
    *(_OWORD *)(a3 + 432) = 0u;
    *(void *)(a3 + 448) = 0;
    if (!DERImg4DecodePayload((uint64_t)&v5, a3 + 88))
    {
      double result = *(double *)&v5;
      *(_OWORD *)(a3 + 8) = v5;
    }
  }
  return result;
}

uint64_t Img4DecodeInitManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000129A8(a1, a2, 1, a3, 1229796429);
}

uint64_t sub_1000129A8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result = 6;
  if (a1 && a4)
  {
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(void *)(a4 + 448) = 0;
    if (a5 == 1229796419)
    {
      unint64_t v10 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeCertificate(&v15, v10);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedCertificate(&v15, v10);
      }
    }
    else
    {
      if (a5 != 1229796429) {
        return 2;
      }
      unint64_t v9 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeManifest(&v15, v9);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedManifest(&v15, v9);
      }
    }
    if (!result)
    {
      if (*(void *)(a4 + 264))
      {
        unint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v15 = a1;
        uint64_t v16 = a2;
        uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)&v15, &v12, 0);
        if (!result)
        {
          *(void *)(a4 + 24) = a1;
          uint64_t v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }
          else
          {
            *(void *)(a4 + 32) = v11;
            if (v11 == a2) {
              return 0;
            }
            else {
              return 7;
            }
          }
        }
      }
      else
      {
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeInitUnsignedManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000129A8(a1, a2, 0, a3, 1229796429);
}

uint64_t Img4DecodeInitCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000129A8(a1, a2, 1, a3, 1229796419);
}

uint64_t Img4DecodeInitUnsignedCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000129A8(a1, a2, 0, a3, 1229796419);
}

uint64_t Img4DecodeEvaluateCertificateChain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 6;
  if (a1 && a2 && a3 && a4 && a7 && a6)
  {
    unint64_t v9 = *(void (**)(uint64_t))(a4 + 8);
    if (v9)
    {
      v9(a1);
      return 3;
    }
  }
  return result;
}

void Img4DecodeEvaluateTrustWithCallbacks(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), unsigned int (*a4)(void, void, void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), unsigned int (*a5)(uint64_t, uint64_t), void (*a6)(void, void, uint64_t), uint64_t a7)
{
  memset(v17, 0, sizeof(v17));
  if (a2)
  {
    if (a3)
    {
      if (*(void *)(a2 + 24))
      {
        BOOL v16 = 0;
        a6(*(void *)(a2 + 264), *(void *)(a2 + 272), a2 + 376);
        if (!a4(*(void *)(a2 + 296), *(unsigned int *)(a2 + 304), *(void *)(a2 + 280), *(unsigned int *)(a2 + 288), a2 + 376, 20, a2 + 312, a2 + 320, a7))
        {
          DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
          if (!v14)
          {
            DERImg4DecodeFindProperty((unint64_t *)(a2 + 40), a1 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v17);
            if (!v15)
            {
              *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v17[1] + 8);
              if (!a5(a2, a7) && !Img4DecodePayloadExists(a2, &v16))
              {
                if (v16)
                {
                  a6(*(void *)(a2 + 8), *(void *)(a2 + 16), a2 + 184);
                  *(unsigned char *)a2 = 1;
                }
                if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, a3, a7)
                  && !Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, a3, a7))
                {
                  a6(*(void *)(a2 + 24), *(void *)(a2 + 32), a2 + 328);
                  *(unsigned char *)(a2 + 1) = 1;
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformTrustEvaluation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0;
  void v5[2] = 0;
  v5[0] = a3;
  sub_100013128(a1, a2, (uint64_t)v5, a4, 0, a5);
}

void Img4DecodePerformTrustEvaluatationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void Img4DecodePerformTrustEvaluatation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0;
  void v5[2] = 0;
  v5[0] = a3;
  sub_100013128(a1, a2, (uint64_t)v5, a4, 0, a5);
}

uint64_t Img4DecodeVerifyChainIM4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, uint64_t a9, uint64_t a10)
{
  uint64_t v41 = 0;
  long long v39 = 0u;
  memset(v40, 0, sizeof(v40));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t result = 6;
  long long v17 = 0u;
  long long v18 = 0u;
  if (a3 && a4 && a5 && a6 && a7 && a8 && a9)
  {
    if (sub_1000129A8(a3, a4, 1, (uint64_t)&v17, 1229796419)
      || (*(unsigned int (**)(void, void, char *, void, uint64_t))a9)(*((void *)&v33 + 1), v34, (char *)v40 + 8, **(void **)(a9 + 32), a9)|| (*(unsigned int (**)(uint64_t, uint64_t, void, void, char *, void, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))(a9 + 16))(a1, a2, *((void *)&v34 + 1), v35, (char *)v40 + 8, **(void **)(a9 + 32), a9, a10, v17, *((void *)&v17 + 1), v18, *((void *)&v18 + 1), v19,
           *((void *)&v19 + 1),
           v20,
           *((void *)&v20 + 1),
           v21,
           *((void *)&v21 + 1),
           v22,
           *((void *)&v22 + 1),
           v23,
           *((void *)&v23 + 1),
           v24,
           *((void *)&v24 + 1),
           v25,
           *((void *)&v25 + 1),
           v26,
           *((void *)&v26 + 1),
           v27,
           *((void *)&v27 + 1),
           v28,
           *((void *)&v28 + 1),
           v29,
           *((void *)&v29 + 1),
           v30,
           *((void *)&v30 + 1),
           v31,
           *((void *)&v31 + 1),
           v32,
           *((void *)&v32 + 1),
           v33))
    {
      return 0xFFFFFFFFLL;
    }
    else if (DERImg4DecodeCertificatePropertiesAndPubKey(*((uint64_t *)&v33 + 1), v34, a7, a8, a5, a6))
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void Img4DecodePerformTrustEvaluationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

void sub_100013128(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      BOOL v21 = 0;
      if (a4)
      {
        if (*(void *)a3)
        {
          if (*(void *)a4)
          {
            if (*(void *)(a4 + 24))
            {
              if (*(void *)(a4 + 8))
              {
                if (*(void *)(a4 + 16))
                {
                  unint64_t v9 = *(void **)(a4 + 32);
                  if (v9)
                  {
                    if (*(void *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(unsigned char *)(a2 + 1) = 1;
                      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (int v14 = (const void *)v13(a2, a6)) != 0
                        && !memcmp((const void *)(a2 + 328), v14, **(void **)(a4 + 32)))
                      {
                        int v15 = 0;
                      }
                      else
                      {
                        if ((*(unsigned int (**)(void, void, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))(*(void *)(a2 + 296), *(void *)(a2 + 304), &v22, &v23, a2 + 312, a2 + 320, a4, a6)|| **(void **)(a4 + 32) > 0x30uLL|| (*(unsigned int (**)(void, void, uint64_t))a4)(*(void *)(a2 + 264), *(void *)(a2 + 272), a2 + 376)|| (*(unsigned int (**)(uint64_t, uint64_t, void, void, uint64_t, void, uint64_t, uint64_t))(a4 + 16))(v22, v23, *(void *)(a2 + 280), *(void *)(a2 + 288), a2 + 376,
                               **(void **)(a4 + 32),
                               a4,
                               a6))
                        {
                          return;
                        }
                        int v15 = 1;
                      }
                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16) {
                        return;
                      }
                      if ((a5 & 1) == 0)
                      {
                        long long v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        unint64_t v18 = a1 | 0xE000000000000000;
                        long long v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011, v24, a6)) {
                            return;
                          }
                        }
                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20) {
                            return;
                          }
                        }
                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }
                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(void **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(void, void, uint64_t, void, uint64_t))a4)(*(void *)(a2 + 8), *(void *)(a2 + 16), a2 + 184, **(void **)(a4 + 32), a4))
                          {
                            return;
                          }
                          *(unsigned char *)a2 = 1;
                        }
                        if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6)&& (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformManifestTrustEvaluationWithCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_1000133F0(unsigned int a1, uint64_t a2, int a3, uint64_t a4)
{
  unsigned int v10 = a1;
  if (a3) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void **)a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  v12[0] = 0;
  v12[1] = 0;
  memset(v11, 0, sizeof(v11));
  if (v8
    && !DERImg4DecodeProperty(v8, 0xE00000006D616E78, (uint64_t)&v13)
    && *((void *)&v15 + 1) == 0x2000000000000011
    && !DERDecodeSeqContentInit((unint64_t *)&v14 + 1, v12))
  {
    unint64_t v9 = a1 | 0xE000000000000000;
    while (!DERDecodeSeqNext(v12, v11))
    {
      if (v11[0] == v9)
      {
        (*(void (**)(void, uint64_t, uint64_t, unsigned int *))(*(void *)(*(void *)a4 + 24) + 8))(*(void *)(*(void *)(*(void *)a4 + 16) + 32), a4 + 24, 4, &v10);
        return 0;
      }
    }
  }
  (*(void (**)(void, uint64_t, void, void))(*(void *)(*(void *)a4 + 24) + 8))(*(void *)(*(void *)(*(void *)a4 + 16) + 32), a4 + 24, *(unsigned int *)(a2 + 8), *(void *)a2);
  return 0;
}

uint64_t sha1_digest()
{
  return ccdigest();
}

uint64_t verify_signature_rsa3k(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = sub_1000135B0((uint64_t)v13, v9[4], (uint64_t)v11, (uint64_t)v12, 3072);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_1000135B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5 != 4096 && a5 != 3072) {
    return 0xFFFFFFFFLL;
  }
  v18[2] = 0;
  v18[3] = 0;
  unint64_t v6 = (unint64_t)(a5 + 63) >> 6;
  __chkstk_darwin();
  long long v8 = (unint64_t *)((char *)v17 - v7);
  bzero((char *)v17 - v7, v7);
  *long long v8 = v6;
  uint64_t v9 = *(unsigned int *)(a1 + 8);
  v18[0] = *(void *)a1;
  v18[1] = v9;
  memset(v17, 0, sizeof(v17));
  uint64_t result = DERParseSequenceToObject((uint64_t)v18, (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs, (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs, (unint64_t)v17, 0x20uLL, 0x20uLL);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v11 = *((void *)&v17[0] + 1);
  for (i = *(unsigned char **)&v17[0]; v11; --v11)
  {
    if (*i) {
      break;
    }
    if (i == (unsigned char *)-1) {
      __break(0x5513u);
    }
    ++i;
  }
  if (v11 >= 0xFFFFFFFFFFFFFFF8)
  {
    __break(0x5500u);
    return result;
  }
  unint64_t v13 = (v11 + 7) >> 3;
  if (v13 > *v8) {
    return 0xFFFFFFFFLL;
  }
  *long long v8 = v13;
  if (ccrsa_make_pub()) {
    return 0xFFFFFFFFLL;
  }
  if (&_ccrsa_verify_pkcs1v15_digest) {
    BOOL v14 = &CCRSA_PKCS1_FAULT_CANARY == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    int v16 = ccrsa_verify_pkcs1v15_digest();
    if (!v16 && !cc_cmp_safe()) {
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  LOBYTE(v17[0]) = 0;
  int v15 = ccrsa_verify_pkcs1v15();
  uint64_t result = 0xFFFFFFFFLL;
  if (!v15 && LOBYTE(v17[0])) {
    return 0;
  }
  return result;
}

uint64_t verify_signature_rsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  long long v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = sub_1000135B0((uint64_t)v13, v9[4], (uint64_t)v11, (uint64_t)v12, 4096);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

void verify_signature_ecdsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              if (a7)
              {
                uint64_t v7 = *(void **)(a7 + 32);
                if (v7)
                {
                  if (v7[2] && *(void *)(a7 + 48) && *v7 == a6) {
                    sub_1000138EC();
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void sub_1000138EC()
{
  v10[7] = 0;
  ccec_x963_import_pub_size();
  if (ccec_keysize_is_supported())
  {
    cp = (void *)ccec_get_cp();
    uint64_t v1 = *cp;
    if (*cp >> 61 || !is_mul_ok(8 * v1, 3uLL))
    {
      __break(0x550Cu);
    }
    else
    {
      uint64_t v2 = 24 * v1;
      BOOL v3 = __CFADD__(v2, 16);
      uint64_t v4 = v2 + 16;
      if (!v3)
      {
        BOOL v3 = __CFADD__(v4, 16);
        uint64_t v5 = v4 + 16;
        if (!v3)
        {
          unint64_t v6 = cp;
          unint64_t v7 = v5 - 1;
          __chkstk_darwin();
          uint64_t v9 = &v10[-v8];
          bzero(&v10[-v8], v8);
          if (v7 < 0x10)
          {
            __break(1u);
          }
          else
          {
            void *v9 = v6;
            if (!ccec_import_pub()) {
              ccec_verify();
            }
          }
          return;
        }
      }
    }
    __break(0x5500u);
  }
}

uint64_t verify_chain_img4_v1(unint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215;
        if (!sub_100014FEC(v26, (uint64_t)v27, 3u)
          && !sub_100013D40((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          long long v24 = a6;
          uint64_t v15 = 0;
          int v16 = (const void **)v32;
          long long v17 = &v30;
          unint64_t v18 = (const void **)v32;
          while (1)
          {
            long long v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            BOOL v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21) {
              break;
            }
            if (memcmp((const void *)v19[36], *(v16 - 1), v20)) {
              break;
            }
            uint64_t result = sub_100013FA8(&v34[v15], v17, a7);
            if (result) {
              break;
            }
            v17 += 6;
            ++v15;
            int v16 = v18;
            if (v15 == 2)
            {
              long long v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }
              v42[0] = 0;
              v42[1] = 0;
              unint64_t v40 = 0;
              v41[0] = 0;
              v41[1] = 0;
              if (DERDecodeSeqContentInit(v33, v42)) {
                return 0xFFFFFFFFLL;
              }
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011)
              {
                v47[0] = 0;
                v47[1] = 0;
                unint64_t v45 = 0;
                v46[0] = 0;
                v46[1] = 0;
                long long v43 = 0u;
                long long v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    int v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1) {
                        goto LABEL_14;
                      }
                      return 0xFFFFFFFFLL;
                    }
                    if (v45 != 0x2000000000000010
                      || DERParseSequenceContentToObject(v46, (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs, (uint64_t)&DERAttributeTypeAndValueItemSpecs, (unint64_t)&v43, 0x20uLL, 0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }
                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  long long v25 = v44;
                  uint64_t result = DEROidCompare((uint64_t)&off_100021C50, (uint64_t)&v25);
                  if (!result) {
                    return 0xFFFFFFFFLL;
                  }
                  if ((unint64_t)v34 > 0xFFFFFFFFFFFFFFDFLL) {
                    goto LABEL_34;
                  }
                  *a3 = v35;
                  *a4 = v36;
                  if ((unint64_t)v37 > 0xFFFFFFFFFFFFFFDFLL) {
                    goto LABEL_34;
                  }
                  if (!v38) {
                    return 0;
                  }
                  uint64_t v23 = v39;
                  if (!v39) {
                    return 0;
                  }
                  uint64_t result = 0;
                  if (a5)
                  {
                    if (v24)
                    {
                      uint64_t result = 0;
                      *a5 = v38;
                      *long long v24 = v23;
                    }
                  }
                  return result;
                }
              }
              return 0xFFFFFFFFLL;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t sub_100013D40(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a2) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v15 = result;
  unint64_t v18 = ~result;
  unint64_t v17 = ~a3;
  unint64_t v14 = ~a4;
  unint64_t v13 = ~a5;
  unint64_t v11 = ~a6;
  uint64_t v10 = a2;
  while (1)
  {
    unint64_t v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(v15 + 16 * v8, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + 48 * v8, 0x30uLL, 0x30uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (160 * v8 > v14) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(a3 + 48 * v8, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + 160 * v8, 0xA0uLL, 0xA0uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v13) {
      break;
    }
    long long v22 = 0u;
    long long v23 = 0u;
    char v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + 160 * v8 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v22, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL; {
    if (DERParseSequenceContentToObject((unint64_t *)&v22, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v19, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    }
    uint64_t result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!result) {
      return 0xFFFFFFFFLL;
    }
    if (*((void *)&v20 + 1))
    {
      if (*((void *)&v20 + 1) != 2 || *(unsigned char *)v20 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v20 == -1) {
        break;
      }
      if (*(unsigned char *)(v20 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
    uint64_t result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if (result || v21) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v11) {
      break;
    }
    uint64_t result = sub_1000150C8(a4 + 160 * v8, (void *)(a6 + 16 * v8));
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (++v8 == v10) {
      return 0;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_100013FA8(void *a1, void *a2, uint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  char v10 = 0;
  memset(v13, 0, sizeof(v13));
  unint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v5 = *(void **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(void *)a3
    || !*(void *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject(a2 + 2, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v11, 0x20uLL, 0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }
  if (*((void *)&v12 + 1))
  {
    uint64_t result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((void *)&v12 + 1) != 2 || *(unsigned char *)v12 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v12 == -1)
      {
        __break(0x5513u);
        return result;
      }
      if (*(unsigned char *)(v12 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
  }
  if (!DEROidCompare((uint64_t)&v11, *(void *)(a3 + 40))) {
    return 0xFFFFFFFFLL;
  }
  if ((*(unsigned int (**)(void, void, _OWORD *, void, uint64_t))a3)(*a2, a2[1], v13, **(void **)(a3 + 32), a3))
  {
    return 0xFFFFFFFFLL;
  }
  if (DERParseBitString((uint64_t)(a2 + 4), &v8, &v10)) {
    return 0xFFFFFFFFLL;
  }
  if (v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = (*(uint64_t (**)(void, void, unint64_t, uint64_t, _OWORD *, void, uint64_t, void))(a3 + 16))(*a1, a1[1], v8, v9, v13, **(void **)(a3 + 32), a3, 0);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_chain_img4_x86(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_100014164(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_1000142F8);
}

uint64_t sub_100014164(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v22, 0x300uLL);
        v21[0] = a1;
        v21[1] = v10;
        if (a8(v21, v22, 2)) {
          return 0xFFFFFFFFLL;
        }
        uint64_t result = sub_100013D40((uint64_t)v22, 2u, (uint64_t)v23, (uint64_t)&v24, (uint64_t)v27, (uint64_t)v28);
        if (result)
        {
          return 0xFFFFFFFFLL;
        }
        else
        {
          char v16 = 1;
          uint64_t v17 = 1;
          while ((v16 & 1) != 0)
          {
            unint64_t v18 = &v21[20 * v17];
            if (__n == v18[33] && !memcmp(__s1, (const void *)v18[32], __n))
            {
              uint64_t result = sub_100013FA8(v27, &v23[3 * v17], a7);
              char v16 = 0;
              uint64_t v17 = 2;
              if (!result) {
                continue;
              }
            }
            return 0xFFFFFFFFLL;
          }
          if ((unint64_t)v27 > 0xFFFFFFFFFFFFFFEFLL
            || (*a3 = v27[2], *a4 = v27[3], (unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL))
          {
            __break(0x5513u);
          }
          else if (v29 && (uint64_t v19 = v30) != 0)
          {
            uint64_t result = 0;
            if (a5 && a6)
            {
              uint64_t result = 0;
              *a5 = v29;
              *a6 = v19;
            }
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_1000142F8(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_X86_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (sub_100014FEC(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_100014164(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_100014344);
}

uint64_t sub_100014344(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_ROOT_CA_CERTIFICATE;
  a2[1] = 1394;
  if (sub_100014FEC(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_global(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_100014164(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_100014390);
}

uint64_t sub_100014390(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1404;
  if (sub_100014FEC(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_fake(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_100014164(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_1000143DC);
}

uint64_t sub_1000143DC(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_ROOT_CA_CERTIFICATE;
  a2[1] = 1425;
  if (sub_100014FEC(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ddi_fake_global(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_100014164(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_100014428);
}

uint64_t sub_100014428(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1435;
  if (sub_100014FEC(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_avp(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_100014164(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_100014474);
}

uint64_t sub_100014474(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_AVP_ROOT_CA_CERTIFICATE;
  a2[1] = 1431;
  if (sub_100014FEC(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_100014164(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_1000144C0);
}

uint64_t sub_1000144C0(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (sub_100014FEC(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_tatsu_local_policy_hacktivate(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_100014164(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001450C);
}

uint64_t sub_10001450C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1442;
  if (sub_100014FEC(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_rsa3k(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_100014164(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_100014558);
}

uint64_t sub_100014558(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA3K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1118;
  if (sub_100014FEC(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_100014164(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_1000145A4);
}

uint64_t sub_1000145A4(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1374;
  if (sub_100014FEC(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_AWG1(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_100014164(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_1000145F0);
}

uint64_t sub_1000145F0(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE_AWG1;
  a2[1] = 1404;
  if (sub_100014FEC(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_v2_PED(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_100014164(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_10001463C);
}

uint64_t sub_10001463C(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_PED_ROOT_CA_CERTIFICATE;
  a2[1] = 1400;
  if (sub_100014FEC(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ec_v1(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v27, 0x330uLL);
        v26[0] = a1;
        v26[1] = v10;
        if (!a8(v26, v27, 3)
          && !sub_100014828((uint64_t)v27, 3u, (uint64_t)&v28, (uint64_t)&v30, (unint64_t)v32, (unint64_t)&v35, (uint64_t)v36))
        {
          long long v25 = a4;
          uint64_t v15 = 0;
          char v16 = (const void **)v31;
          uint64_t v17 = &v29;
          unint64_t v18 = (const void **)v31;
          while (1)
          {
            uint64_t v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            char v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21) {
              break;
            }
            if (memcmp((const void *)v19[36], *(v16 - 1), v20)) {
              break;
            }
            uint64_t result = sub_100013FA8(&v32[v15], v17, a7);
            if (result) {
              break;
            }
            v17 += 6;
            ++v15;
            char v16 = v18;
            if (v15 == 2)
            {
              if ((unint64_t)v32 > 0xFFFFFFFFFFFFFFDFLL
                || (*a3 = v33, *long long v25 = v34, (unint64_t)v36 > 0xFFFFFFFFFFFFFFDFLL))
              {
                __break(0x5513u);
              }
              else if (v37 && (uint64_t v22 = v38) != 0)
              {
                uint64_t result = 0;
                if (a5)
                {
                  if (a6)
                  {
                    uint64_t result = 0;
                    *a5 = v37;
                    *a6 = v22;
                  }
                }
              }
              else
              {
                return 0;
              }
              return result;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t sub_100014828(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  if (!a2) {
    return 0;
  }
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  unint64_t v11 = 0;
  uint64_t v21 = result;
  unint64_t v24 = ~result;
  unint64_t v23 = ~a3;
  unint64_t v20 = ~a4;
  if (a5 <= a6) {
    unint64_t v12 = a6;
  }
  else {
    unint64_t v12 = a5;
  }
  unint64_t v19 = ~v12;
  unint64_t v16 = ~a7;
  uint64_t v15 = 16 * a2;
  while (v11 <= v24 && v10 <= v23)
  {
    uint64_t result = DERParseSequenceToObject(v21 + v11, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + v10, 0x30uLL, 0x30uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v20) {
      break;
    }
    uint64_t result = DERParseSequenceToObject(a3 + v10, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + v9, 0xA0uLL, 0xA0uLL);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (v11 > v19) {
      break;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    char v30 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + v9 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v31, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL; {
    if (DERParseSequenceContentToObject((unint64_t *)&v31, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v28, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    }
    if (!DEROidCompare((uint64_t)&v28, (uint64_t)&oidEcPubKey)) {
      return 0xFFFFFFFFLL;
    }
    if (DERParseBitString((uint64_t)&v32, (unint64_t *)(a5 + v11), &v30)) {
      return 0xFFFFFFFFLL;
    }
    if (v30) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t result = DERDecodeItem((uint64_t)&v29, &v25);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v13 = (void *)(a6 + v11);
    uint64_t v14 = v27;
    void *v13 = v26;
    v13[1] = v14;
    if (v11 > v16) {
      break;
    }
    uint64_t result = sub_1000150C8(a4 + v9, (void *)(a7 + v11));
    if (result) {
      return 0xFFFFFFFFLL;
    }
    v11 += 16;
    v10 += 48;
    v9 += 160;
    if (v15 == v11) {
      return 0;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t verify_chain_img4_ecdsa256(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_100014AB0(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_100014C34);
}

uint64_t sub_100014AB0(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, unsigned char *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (!a1) {
    return result;
  }
  unsigned int v10 = a2;
  if (!a2 || !a3 || !a4) {
    return result;
  }
  bzero(v20, 0x220uLL);
  v19[0] = a1;
  v19[1] = v10;
  if (a8(v19, v20, 2)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = sub_100014828((uint64_t)v20, 2u, (uint64_t)v21, (uint64_t)v23, (unint64_t)v28, (unint64_t)&v29, (uint64_t)v30);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v23 > 0xFFFFFFFFFFFFFF5FLL) {
    goto LABEL_22;
  }
  if (__n != v27) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = memcmp(__s1, __s2, __n);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v21 > 0xFFFFFFFFFFFFFFCFLL)
  {
LABEL_22:
    __break(0x5513u);
    return result;
  }
  uint64_t result = sub_100013FA8(v28, v22, a7);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL) {
    goto LABEL_22;
  }
  uint64_t v16 = v28[3];
  *a3 = v28[2];
  *a4 = v16;
  if ((unint64_t)v30 > 0xFFFFFFFFFFFFFFEFLL) {
    goto LABEL_22;
  }
  if (!v31) {
    return 0;
  }
  uint64_t v17 = v32;
  if (!v32) {
    return 0;
  }
  uint64_t result = 0;
  if (a5)
  {
    if (a6)
    {
      uint64_t result = 0;
      *a5 = v31;
      *a6 = v17;
    }
  }
  return result;
}

uint64_t sub_100014C34(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC256_SHA256_ROOT_CA_CERTIFICATE;
  a2[1] = 551;
  if (sub_100014FEC(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_100014AB0(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_100014C80);
}

uint64_t sub_100014C80(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 610;
  if (sub_100014FEC(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384_local_policy(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_100014CE8);
}

uint64_t sub_100014CE8(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &EC384_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 542;
  if (sub_100014FEC(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t verify_chain_img4_ecdsa384_hacktivate(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_100014C80);
}

uint64_t verify_chain_img4_ecdsa384_qa(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(void *, unsigned char *, uint64_t))sub_100014D80);
}

uint64_t sub_100014D80(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &QA_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 540;
  if (sub_100014FEC(a1, (uint64_t)a2, a3)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t Img4DecodeDigestInit(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = *(void **)(a1 + 16);
  if (!v1 || !*v1) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_init();
  return 0;
}

uint64_t Img4DecodeDigestUpdate(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!**(void **)(a1 + 16)) {
    return 0xFFFFFFFFLL;
  }
  ccdigest_update();
  return 0;
}

uint64_t Img4DecodeDigestReturnHash(uint64_t a1, void *a2, unint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = **(void **)(a1 + 16);
  if (!v4 || *(void *)v4 > a3) {
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 56))(v4, *a2, a4);
  return 0;
}

uint64_t Img4DecodeDigestFinal(uint64_t a1, void *a2, uint64_t a3)
{
  if (a1 && (BOOL v3 = **(unint64_t ***)(a1 + 16)) != 0) {
    return Img4DecodeDigestReturnHash(a1, a2, *v3, a3);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    unint64_t v8 = *(void **)(a5 + 32);
    if (v8 && (unint64_t v9 = (void *)v8[2]) != 0 && *v8 == a4 && *v9 && *(void *)*v9 == a4)
    {
      ccdigest();
      return 0;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t img4_verify_signature_with_chain(unint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, void *a7, void *a8)
{
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (verify_chain_img4_v1(a1, a2, &v17, &v18, &v15, &v16, (uint64_t)kImg4DecodeSecureBootRsa1kSha1)) {
    return 0xFFFFFFFFLL;
  }
  *a7 = v15;
  *a8 = v16;
  uint64_t result = verify_signature_rsa(v17, v18, a3, a4, a5, a6, (uint64_t)kImg4DecodeSecureBootRsa1kSha1);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_100014FEC(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v18 = 0;
  unint64_t v19 = 0;
  unint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  unint64_t v5 = ~a2;
  unsigned int v6 = 1;
  unint64_t v7 = *a1;
  unint64_t v8 = a1[1];
  while (1)
  {
    unint64_t v18 = v7;
    unint64_t v19 = v8;
    uint64_t result = DERDecodeItem((uint64_t)&v18, &v15);
    if (result) {
      return 0xFFFFFFFFLL;
    }
    if (__CFADD__(v16, v17)) {
      break;
    }
    unint64_t v10 = v16 + v17;
    unint64_t v11 = v16 + v17 - v7;
    BOOL v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3) {
      return 0xFFFFFFFFLL;
    }
    if (v5 < 16 * (unint64_t)v6) {
      break;
    }
    uint64_t v14 = (unint64_t *)(a2 + 16 * v6);
    unint64_t *v14 = v7;
    v14[1] = v11;
    if (v10 < v7) {
      break;
    }
    BOOL v12 = v8 >= v11;
    v8 -= v11;
    if (!v12) {
      goto LABEL_21;
    }
    ++v6;
    unint64_t v7 = v10;
    if (!v8)
    {
      if (v6 == a3) {
        return 0;
      }
      return 0xFFFFFFFFLL;
    }
  }
  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t sub_1000150C8(uint64_t a1, void *a2)
{
  v11[0] = 0;
  v11[1] = 0;
  v9[1] = 0;
  uint64_t v10 = 0;
  unint64_t v8 = 0;
  v9[0] = 0;
  long long v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(a1 + 152)) {
    return 0;
  }
  if (DERDecodeSeqInit(a1 + 144, &v10, v11) || v10 != 0x2000000000000010) {
    return 0xFFFFFFFFLL;
  }
  char v3 = 1;
  while (1)
  {
    int v4 = DERDecodeSeqNext(v11, &v8);
    if (v4) {
      break;
    }
    if (v8 != 0x2000000000000010
      || DERParseSequenceContentToObject(v9, (unsigned __int16)DERNumExtensionItemSpecs, (uint64_t)&DERExtensionItemSpecs, (unint64_t)v6, 0x30uLL, 0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }
    char v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      if (DERDecodeItem((uint64_t)&v7, v12) || v12[0] != 0x2000000000000011) {
        return 0xFFFFFFFFLL;
      }
      char v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }
  if (v4 != 1 || (v3 & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

void sub_100015228(uint64_t a1)
{
  int v1 = *(_DWORD *)(*(void *)a1 + 24);
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to checkin with lockdown: 0x%08x", (uint8_t *)v2, 8u);
}

void sub_1000152B0(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)a1 + 8) + 24);
  uint64_t v4 = *a2;
  v5[0] = 67109632;
  v5[1] = a3;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  uint64_t v9 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received bytes: %d %% (%ld/%ld).", (uint8_t *)v5, 0x1Cu);
}

void sub_100015354()
{
  v0[0] = 67109120;
  v0[1] = 20;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Resetting remote services timed out after %d seconds.", (uint8_t *)v0, 8u);
}

void sub_1000153D8()
{
  *(_WORD *)id v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to reset device.", v0, 2u);
}

void sub_100015420(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A984((uint64_t)"main", 36, -2, 0, @"Failed to query working directory.", a6, a7, a8, v9);
  id v8 = [(id)objc_claimAutoreleasedReturnValue() description];
  [v8 UTF8String];
  _os_crash();

  __break(1u);
}

void sub_100015474()
{
}

void sub_100015490()
{
}

void sub_1000154AC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = sub_10000A984((uint64_t)"main", 41, -2, a1, @"Failed to create %@.", a6, a7, a8, a2);

  id v10 = [v9 description];
  [v10 UTF8String];
  _os_crash();

  __break(1u);
}

void sub_100015518()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v0 = *__error();
    int v1 = __error();
    uint64_t v2 = strerror(*v1);
    *(_DWORD *)buf = 67109378;
    int v10 = v0;
    __int16 v11 = 2080;
    BOOL v12 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set temporary directory subpath: %d (%s)", buf, 0x12u);
  }
  uint64_t v3 = *__error();
  uint64_t v4 = __error();
  strerror(*v4);
  sub_10000A984((uint64_t)"main", 28, -2, 0, @"Failed to set temporary directory subpath: %d (%s)", v5, v6, v7, v3);
  id v8 = [(id)objc_claimAutoreleasedReturnValue() description];
  [v8 UTF8String];
  _os_crash();

  __break(1u);
}

void sub_1000155F8(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Skipping %@, as we didn't mount it.", buf, 0xCu);
}

void sub_100015644(uint64_t a1, uint64_t a2)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to load version dictionary at %@ (image version: %@).", (uint8_t *)&v2, 0x16u);
}

void sub_1000156D0(uint8_t *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10000EE64((void *)&_mh_execute_header, &_os_log_default, a3, "Ignoring EFI partition.", a1);
}

void sub_10001570C(uint8_t *a1, unsigned char *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_10000EE64((void *)&_mh_execute_header, &_os_log_default, a3, "Ignoring Apple_partition_map partition.", a1);
}

void sub_100015748(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "The attached media %@ is not a leaf, ignoring.", buf, 0xCu);
}

void sub_100015794(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "The attached media %@ is not removable, ignoring.", buf, 0xCu);
}

void sub_1000157E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_WORD *)uint64_t v3 = 0;
  sub_10000EE64((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to retrieve the list of attached devices.", v3);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return _CFBundleGetValueForInfoDictionaryKey(bundle, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return _IOBSDNameMatching(mainPort, options, bsdName);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
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

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t MobileStorageCopyCryptexNonceWithError()
{
  return _MobileStorageCopyCryptexNonceWithError();
}

uint64_t MobileStorageCopyDeveloperModeStatusWithError()
{
  return _MobileStorageCopyDeveloperModeStatusWithError();
}

uint64_t MobileStorageCopyDevicesWithError()
{
  return _MobileStorageCopyDevicesWithError();
}

uint64_t MobileStorageCopyPersonalizationIdentifiersWithError()
{
  return _MobileStorageCopyPersonalizationIdentifiersWithError();
}

uint64_t MobileStorageCopyPersonalizationManifestWithError()
{
  return _MobileStorageCopyPersonalizationManifestWithError();
}

uint64_t MobileStorageCopyPersonalizationNonceWithError()
{
  return _MobileStorageCopyPersonalizationNonceWithError();
}

uint64_t MobileStorageMountWithError()
{
  return _MobileStorageMountWithError();
}

uint64_t MobileStorageRollCryptexNonceWithError()
{
  return _MobileStorageRollCryptexNonceWithError();
}

uint64_t MobileStorageRollPersonalizationNonceWithError()
{
  return _MobileStorageRollPersonalizationNonceWithError();
}

uint64_t MobileStorageUnmountWithError()
{
  return _MobileStorageUnmountWithError();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateUnique()
{
  return __CFBundleCreateUnique();
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

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t _os_crash()
{
  return __os_crash();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_cmp_safe()
{
  return _cc_cmp_safe();
}

uint64_t ccdigest()
{
  return _ccdigest();
}

uint64_t ccdigest_init()
{
  return _ccdigest_init();
}

uint64_t ccdigest_update()
{
  return _ccdigest_update();
}

uint64_t ccec_get_cp()
{
  return _ccec_get_cp();
}

uint64_t ccec_import_pub()
{
  return _ccec_import_pub();
}

uint64_t ccec_keysize_is_supported()
{
  return _ccec_keysize_is_supported();
}

uint64_t ccec_verify()
{
  return _ccec_verify();
}

uint64_t ccec_x963_import_pub_size()
{
  return _ccec_x963_import_pub_size();
}

uint64_t ccrsa_make_pub()
{
  return _ccrsa_make_pub();
}

uint64_t ccrsa_verify_pkcs1v15()
{
  return _ccrsa_verify_pkcs1v15();
}

uint64_t ccrsa_verify_pkcs1v15_digest()
{
  return _ccrsa_verify_pkcs1v15_digest();
}

int close(int a1)
{
  return _close(a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

uint64_t cryptex_copy_list_4MSM()
{
  return _cryptex_copy_list_4MSM();
}

uint64_t cryptex_msm_array_destroy()
{
  return _cryptex_msm_array_destroy();
}

uint64_t cryptex_msm_get_string()
{
  return _cryptex_msm_get_string();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return _getfsstat(a1, a2, a3);
}

int lchflags(const char *a1, __uint32_t a2)
{
  return _lchflags(a1, a2);
}

uint64_t lockdown_checkin_xpc()
{
  return _lockdown_checkin_xpc();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_receive_message()
{
  return _lockdown_receive_message();
}

uint64_t lockdown_recv()
{
  return _lockdown_recv();
}

uint64_t lockdown_send_message()
{
  return _lockdown_send_message();
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

int mkstemps(char *a1, int a2)
{
  return _mkstemps(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return _os_parse_boot_arg_int();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

uint64_t os_variant_is_recovery()
{
  return _os_variant_is_recovery();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t remote_device_browse_present()
{
  return _remote_device_browse_present();
}

uint64_t remote_device_reset()
{
  return _remote_device_reset();
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return _removefile(path, state, flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return _removefile_state_alloc();
}

int removefile_state_free(removefile_state_t a1)
{
  return _removefile_state_free(a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return _removefile_state_get(state, key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return _removefile_state_set(state, key, value);
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

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return _strnstr(__big, __little, __len);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return _xpc_dictionary_send_reply();
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

uint64_t xpc_file_transfer_write_to_fd()
{
  return _xpc_file_transfer_write_to_fd();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_remote_connection_activate()
{
  return _xpc_remote_connection_activate();
}

uint64_t xpc_remote_connection_cancel()
{
  return _xpc_remote_connection_cancel();
}

uint64_t xpc_remote_connection_create_remote_service_listener()
{
  return _xpc_remote_connection_create_remote_service_listener();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return _xpc_remote_connection_set_event_handler();
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}