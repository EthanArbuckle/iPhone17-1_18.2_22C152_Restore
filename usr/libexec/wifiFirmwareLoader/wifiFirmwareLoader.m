void sub_10000120C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  NSObject *v8;
  long long v9;
  tm *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  IONotificationPort *v17;
  NSObject *v18;
  long long v19;
  tm *v20;
  __CFRunLoopSource *RunLoopSource;
  CFDictionaryRef v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  long long v30;
  tm *v31;
  long long v32;
  tm *v33;
  __CFRunLoop *Current;
  __CFRunLoop *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  long long v43;
  tm *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  long long v52;
  tm *v53;
  __CFRunLoop *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  BOOL v61;
  NSObject *v63;
  long long v64;
  tm *v65;
  char v66;
  char v67;
  char v68;
  uint64_t v69;
  char v70;
  const char *v71;
  void block[4];
  io_iterator_t v73;
  io_iterator_t v74;
  time_t v75;
  io_iterator_t notification[2];
  char v77[16];
  long long v78;
  long long v79;
  long long v80;
  long long v81;
  long long v82;
  long long v83;
  long long v84;

  *(void *)notification = 0;
  if (qword_100010218) {
    v8 = qword_100010218;
  }
  else {
    v8 = &_os_log_default;
  }
  sub_100008124(v8, "Going to discover services \n", a3, a4, a5, a6, a7, a8, v66);
  if (dword_100010220)
  {
    *(void *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v83 = v9;
    v84 = v9;
    v82 = v9;
    v80 = v9;
    v81 = v9;
    v78 = v9;
    v79 = v9;
    *(_OWORD *)v77 = v9;
    v75 = 0xAAAAAAAAAAAAAAAALL;
    time(&v75);
    v10 = localtime(&v75);
    strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v10);
    dprintf(dword_100010220, "%s ", v77);
    dprintf(dword_100010220, "Going to discover services \n");
  }
  v17 = IONotificationPortCreate(kIOMainPortDefault);
  if (qword_100010218) {
    v18 = qword_100010218;
  }
  else {
    v18 = &_os_log_default;
  }
  if (v17)
  {
    v71 = "com.apple.driver.AppleBCMWLANCore";
    sub_100008124(v18, "Matching with -> Core match:'%s', Bundle ID match:'%s'\n", v11, v12, v13, v14, v15, v16, (char)"AppleBCMWLANCore");
    if (dword_100010220)
    {
      *(void *)&v19 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v83 = v19;
      v84 = v19;
      v82 = v19;
      v80 = v19;
      v81 = v19;
      v78 = v19;
      v79 = v19;
      *(_OWORD *)v77 = v19;
      v75 = 0xAAAAAAAAAAAAAAAALL;
      time(&v75);
      v20 = localtime(&v75);
      strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v20);
      dprintf(dword_100010220, "%s ", v77);
      dprintf(dword_100010220, "Matching with -> Core match:'%s', Bundle ID match:'%s'\n", "AppleBCMWLANCore", "com.apple.driver.AppleBCMWLANCore");
    }
    RunLoopSource = IONotificationPortGetRunLoopSource(v17);
    v22 = IOServiceNameMatching("AppleBCMWLANCore");
    if (IOServiceAddMatchingNotification(v17, "IOServiceFirstMatch", v22, (IOServiceMatchingCallback)sub_1000017FC, notification, &notification[1]))
    {
      if (qword_100010218) {
        v29 = qword_100010218;
      }
      else {
        v29 = &_os_log_default;
      }
      sub_100008124(v29, "Failed to add matching notification\n", v23, v24, v25, v26, v27, v28, v68);
      if (dword_100010220)
      {
        *(void *)&v30 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v83 = v30;
        v84 = v30;
        v82 = v30;
        v80 = v30;
        v81 = v30;
        v78 = v30;
        v79 = v30;
        *(_OWORD *)v77 = v30;
        v75 = 0xAAAAAAAAAAAAAAAALL;
        time(&v75);
        v31 = localtime(&v75);
        strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v31);
        dprintf(dword_100010220, "%s ", v77);
        dprintf(dword_100010220, "Failed to add matching notification\n", v69, v71);
      }
    }
    else
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
      v35 = CFRunLoopGetCurrent();
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_1000017EC;
      block[3] = &unk_10000C408;
      v73 = notification[0];
      v74 = notification[1];
      CFRunLoopPerformBlock(v35, kCFRunLoopDefaultMode, block);
      if (qword_100010218) {
        v42 = qword_100010218;
      }
      else {
        v42 = &_os_log_default;
      }
      sub_100008124(v42, "Waiting for firmware to load\n", v36, v37, v38, v39, v40, v41, v68);
      if (dword_100010220)
      {
        *(void *)&v43 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v43 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v83 = v43;
        v84 = v43;
        v82 = v43;
        v80 = v43;
        v81 = v43;
        v78 = v43;
        v79 = v43;
        *(_OWORD *)v77 = v43;
        v75 = 0xAAAAAAAAAAAAAAAALL;
        time(&v75);
        v44 = localtime(&v75);
        strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v44);
        dprintf(dword_100010220, "%s ", v77);
        dprintf(dword_100010220, "Waiting for firmware to load\n");
      }
      if (CFRunLoopRunInMode(kCFRunLoopDefaultMode, 300.0, 0) == kCFRunLoopRunTimedOut)
      {
        v51 = qword_100010218 ? qword_100010218 : &_os_log_default;
        sub_100008124(v51, "Runloop timed out\n", v45, v46, v47, v48, v49, v50, v70);
        if (dword_100010220)
        {
          *(void *)&v52 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v52 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v83 = v52;
          v84 = v52;
          v82 = v52;
          v80 = v52;
          v81 = v52;
          v78 = v52;
          v79 = v52;
          *(_OWORD *)v77 = v52;
          v75 = 0xAAAAAAAAAAAAAAAALL;
          time(&v75);
          v53 = localtime(&v75);
          strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v53);
          dprintf(dword_100010220, "%s ", v77);
          dprintf(dword_100010220, "Runloop timed out\n");
        }
      }
      v54 = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(v54, RunLoopSource, kCFRunLoopDefaultMode);
      IONotificationPortDestroy(v17);
      v61 = dword_100010118 == 2 && dword_100010114 == 1 || dword_100010190 == 2 && dword_10001018C == 1;
      HIDWORD(qword_100010100) = v61;
      if (qword_100010218) {
        v63 = qword_100010218;
      }
      else {
        v63 = &_os_log_default;
      }
      sub_100008124(v63, "wifiFirmwareLoaderThread exiting with %d\n", v55, v56, v57, v58, v59, v60, v61);
      if (dword_100010220)
      {
        *(void *)&v64 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v64 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v83 = v64;
        v84 = v64;
        v82 = v64;
        v80 = v64;
        v81 = v64;
        v78 = v64;
        v79 = v64;
        *(_OWORD *)v77 = v64;
        v75 = 0xAAAAAAAAAAAAAAAALL;
        time(&v75);
        v65 = localtime(&v75);
        strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v65);
        dprintf(dword_100010220, "%s ", v77);
        dprintf(dword_100010220, "wifiFirmwareLoaderThread exiting with %d\n");
      }
    }
  }
  else
  {
    sub_100008124(v18, "Failed to create notification port\n", v11, v12, v13, v14, v15, v16, v67);
    if (dword_100010220)
    {
      *(void *)&v32 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v83 = v32;
      v84 = v32;
      v82 = v32;
      v80 = v32;
      v81 = v32;
      v78 = v32;
      v79 = v32;
      *(_OWORD *)v77 = v32;
      v75 = 0xAAAAAAAAAAAAAAAALL;
      time(&v75);
      v33 = localtime(&v75);
      strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v33);
      dprintf(dword_100010220, "%s ", v77);
      dprintf(dword_100010220, "Failed to create notification port\n");
    }
  }
}

uint64_t sub_1000017EC(uint64_t a1)
{
  return sub_1000017FC((io_registry_entry_t *)(a1 + 32), *(_DWORD *)(a1 + 36));
}

uint64_t sub_1000017FC(io_registry_entry_t *a1, io_iterator_t a2)
{
  v2 = a1;
  v3 = &stru_100010000;
  while (1)
  {
    uint64_t result = IOIteratorNext(a2);
    if (!result) {
      return result;
    }
    io_registry_entry_t v5 = result;
    __strlcpy_chk();
    CFStringRef CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v5, @"DriverKitDriverPlatformType", kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFStringRef v7 = CFProperty;
      CFTypeID TypeID = CFStringGetTypeID();
      BOOL v9 = TypeID == CFGetTypeID(v7);
      v3 = &stru_100010000;
      if (v9)
      {
        xmmword_100010031 = 0u;
        unk_100010041 = 0u;
        xmmword_100010011 = 0u;
        unk_100010021 = 0u;
        CFIndex v78 = 0;
        v87.length = CFStringGetLength(v7);
        v87.location = 0;
        if (!CFStringGetBytes(v7, v87, 0x8000100u, 0, 0, (UInt8 *)&xmmword_100010011, 64, &v78))
        {
          v16 = qword_100010218 ? qword_100010218 : &_os_log_default;
          sub_100008124(v16, "%s failed, no characters converted\n", v10, v11, v12, v13, v14, v15, (char)"__serviceCallback");
          if (dword_100010220)
          {
            *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
            long long v85 = v17;
            long long v86 = v17;
            long long v83 = v17;
            long long v84 = v17;
            long long v81 = v17;
            long long v82 = v17;
            *(_OWORD *)v79 = v17;
            long long v80 = v17;
            time_t v77 = 0xAAAAAAAAAAAAAAAALL;
            time(&v77);
            v18 = localtime(&v77);
            strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v18);
            dprintf(dword_100010220, "%s ", v79);
            dprintf(dword_100010220, "%s failed, no characters converted\n", "__serviceCallback");
          }
        }
        CFRelease(v7);
      }
    }
    CFBooleanRef v19 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v5, @"DriverKitDriver", kCFAllocatorDefault, 0);
    if (v19)
    {
      CFBooleanRef v26 = v19;
      LOBYTE(v3[1].__sig) = CFBooleanGetValue(v19) != 0;
      CFRelease(v26);
    }
    if (qword_100010218) {
      v27 = qword_100010218;
    }
    else {
      v27 = &_os_log_default;
    }
    if (LOBYTE(v3[1].__sig))
    {
      sub_100008124(v27, "We are using driverkit driver\n", v20, v21, v22, v23, v24, v25, (char)usedBufLen);
      if (dword_100010220)
      {
        *(void *)&long long v28 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v85 = v28;
        long long v86 = v28;
        long long v83 = v28;
        long long v84 = v28;
        long long v81 = v28;
        long long v82 = v28;
        *(_OWORD *)v79 = v28;
        long long v80 = v28;
        CFIndex v78 = 0xAAAAAAAAAAAAAAAALL;
        time(&v78);
        v29 = localtime(&v78);
        strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v29);
        dprintf(dword_100010220, "%s ", v79);
        dprintf(dword_100010220, "We are using driverkit driver\n");
      }
      CFStringRef v36 = (const __CFString *)IORegistryEntryCreateCFProperty(v5, @"IOUserClass", kCFAllocatorDefault, 0);
      if (!v36)
      {
        if (qword_100010218) {
          v37 = qword_100010218;
        }
        else {
          v37 = &_os_log_default;
        }
        sub_100008124(v37, "Property read for %s returned NULL\n", v30, v31, v32, v33, v34, v35, (char)"IOUserClass");
        if (dword_100010220)
        {
          *(void *)&long long v38 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v85 = v38;
          long long v86 = v38;
          long long v83 = v38;
          long long v84 = v38;
          long long v81 = v38;
          long long v82 = v38;
          *(_OWORD *)v79 = v38;
          long long v80 = v38;
          CFIndex v78 = 0xAAAAAAAAAAAAAAAALL;
          time(&v78);
          v39 = localtime(&v78);
          strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v39);
          dprintf(dword_100010220, "%s ", v79);
          dprintf(dword_100010220, "Property read for %s returned NULL\n", "IOUserClass");
        }
        goto LABEL_51;
      }
    }
    else
    {
      sub_100008124(v27, "We are using IOKit driver\n", v20, v21, v22, v23, v24, v25, (char)usedBufLen);
      if (dword_100010220)
      {
        *(void *)&long long v40 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v85 = v40;
        long long v86 = v40;
        long long v83 = v40;
        long long v84 = v40;
        long long v81 = v40;
        long long v82 = v40;
        *(_OWORD *)v79 = v40;
        long long v80 = v40;
        CFIndex v78 = 0xAAAAAAAAAAAAAAAALL;
        time(&v78);
        v41 = localtime(&v78);
        strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v41);
        dprintf(dword_100010220, "%s ", v79);
        dprintf(dword_100010220, "We are using IOKit driver\n");
      }
      CFStringRef v36 = IOObjectCopyClass(v5);
      if (!v36) {
        goto LABEL_51;
      }
    }
    if (CFEqual(v36, @"AppleBCMWLANCore"))
    {
      uint64_t v42 = qword_100010218;
      char CStringPtr = CFStringGetCStringPtr(v36, 0);
      v50 = &_os_log_default;
      if (v42) {
        v50 = v42;
      }
      sub_100008124(v50, "Matched class name '%s', starting ...\n", v44, v45, v46, v47, v48, v49, CStringPtr);
      if (dword_100010220)
      {
        *(void *)&long long v57 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v57 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v85 = v57;
        long long v86 = v57;
        long long v83 = v57;
        long long v84 = v57;
        long long v81 = v57;
        long long v82 = v57;
        *(_OWORD *)v79 = v57;
        long long v80 = v57;
        CFIndex v78 = 0xAAAAAAAAAAAAAAAALL;
        time(&v78);
        v58 = localtime(&v78);
        strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v58);
        dprintf(dword_100010220, "%s ", v79);
        int v59 = dword_100010220;
        v60 = CFStringGetCStringPtr(v36, 0);
        dprintf(v59, "Matched class name '%s', starting ...\n", v60);
      }
      if (qword_100010218) {
        v61 = qword_100010218;
      }
      else {
        v61 = &_os_log_default;
      }
      sub_100008124(v61, "%s()\n", v51, v52, v53, v54, v55, v56, (char)"startWiFiFirmwareLoaderService");
      if (dword_100010220)
      {
        *(void *)&long long v68 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v68 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v85 = v68;
        long long v86 = v68;
        long long v83 = v68;
        long long v84 = v68;
        long long v81 = v68;
        long long v82 = v68;
        *(_OWORD *)v79 = v68;
        long long v80 = v68;
        CFIndex v78 = 0xAAAAAAAAAAAAAAAALL;
        time(&v78);
        v69 = localtime(&v78);
        strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v69);
        dprintf(dword_100010220, "%s ", v79);
        usedBufLen = (CFIndex *)"startWiFiFirmwareLoaderService";
        dprintf(dword_100010220, "%s()\n");
      }
      v3 = &stru_100010000;
      if (qword_100010100 == 2)
      {
        if (qword_100010218) {
          v70 = qword_100010218;
        }
        else {
          v70 = &_os_log_default;
        }
        sub_100008124(v70, "No free interface slot, ignoring service..", v62, v63, v64, v65, v66, v67, (char)usedBufLen);
        v2 = a1;
        if (dword_100010220)
        {
          *(void *)&long long v71 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v71 + 1) = 0xAAAAAAAAAAAAAAAALL;
          long long v85 = v71;
          long long v86 = v71;
          long long v83 = v71;
          long long v84 = v71;
          long long v81 = v71;
          long long v82 = v71;
          *(_OWORD *)v79 = v71;
          long long v80 = v71;
          CFIndex v78 = 0xAAAAAAAAAAAAAAAALL;
          time(&v78);
          v72 = localtime(&v78);
          strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v72);
          dprintf(dword_100010220, "%s ", v79);
          dprintf(dword_100010220, "No free interface slot, ignoring service..");
        }
      }
      else
      {
        if (qword_100010100 >= 2)
        {
          __break(0x5512u);
LABEL_55:
          __break(0x5513u);
LABEL_56:
          __break(0x5500u);
        }
        v2 = a1;
        if (120 * (unint64_t)qword_100010100 > ~(unint64_t)&unk_100010108) {
          goto LABEL_55;
        }
        v73 = (char *)&unk_100010058 + 120 * qword_100010100;
        *((_DWORD *)v73 + 48) = 1;
        *((_DWORD *)v73 + 46) = v5;
        pthread_create((pthread_t *)v73 + 22, 0, (void *(__cdecl *)(void *))sub_100001F20, v73 + 176);
        if (__OFADD__(qword_100010100, 1)) {
          goto LABEL_56;
        }
        LODWORD(qword_100010100) = qword_100010100 + 1;
      }
    }
    CFRelease(v36);
LABEL_51:
    if (!*v2) {
      io_registry_entry_t *v2 = v5;
    }
  }
}

void sub_100001F20(uint64_t a1)
{
  kern_return_t v546;
  NSObject *v547;
  long long v548;
  tm *v549;
  CFArrayRef v550;
  uint64_t v551;
  uint64_t v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  NSObject *v557;
  long long v558;
  tm *v559;
  NSObject *v560;
  long long v561;
  tm *v562;
  uint64_t v563;
  uint64_t v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  NSObject *v569;
  long long v570;
  tm *v571;
  IOPMAssertionID v572;
  uint64_t v573;
  uint64_t v574;
  uint64_t v575;
  uint64_t v576;
  uint64_t v577;
  uint64_t v578;
  IOReturn v579;
  NSObject *v580;
  long long v581;
  tm *v582;
  const void *v583;
  const void *v584;
  const void *v585;
  const void *v586;
  const void *v587;
  const void *v588;
  const void *v589;
  const void *v590;
  const void *v591;
  io_object_t v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  uint64_t v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t v615;
  uint64_t v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  uint64_t v625;
  uint64_t v626;
  uint64_t v627;
  uint64_t v628;
  kern_return_t v629;
  NSObject *v630;
  long long v631;
  tm *v632;
  long long v633;
  tm *v634;
  uint64_t v635;
  uint64_t v636;
  uint64_t v637;
  uint64_t v638;
  uint64_t v639;
  uint64_t v640;
  NSObject *v641;
  long long v642;
  tm *v643;
  NSObject *v644;
  long long v645;
  tm *v646;
  NSObject *v647;
  long long v648;
  tm *v649;
  NSObject *v650;
  long long v651;
  tm *v652;
  NSObject *v653;
  long long v654;
  tm *v655;
  NSObject *v656;
  long long v657;
  tm *v658;
  NSObject *v659;
  long long v660;
  tm *v661;
  char outputStruct;
  char outputStructa;
  char outputStructb;
  char outputStructc;
  char outputStructd;
  char outputStructe;
  io_registry_entry_t entry;
  CFURLRef v669;
  CFStringRef v670;
  CFStringRef v671;
  uint64_t v672;
  uint64_t v673;
  BOOL v674;
  CFStringRef v675;
  __CFReadStream *stream;
  io_registry_entry_t streama;
  CFAllocatorRef allocator;
  const char *allocatora;
  uint64_t v680;
  int v681;
  const char *v682;
  time_t valuePtr;
  time_t v684;
  CFIndex length;
  size_t size[2];
  long long v687;
  unsigned char v688[32];
  long long v689;
  long long v690;
  long long v691;
  long long v692;
  long long outputStructCnt;
  long long v694;
  long long v695;
  long long v696;
  long long v697;
  long long v698;
  long long v699;
  long long v700;
  long long v701;
  long long v702;
  long long v703;
  long long v704;
  long long v705;
  long long v706;
  long long v707;
  long long v708;
  char cStr[32];
  long long v710;
  long long v711;
  long long v712;
  long long v713;
  long long v714;
  long long v715;
  long long v716;
  long long v717;
  long long v718;
  long long v719;
  long long v720;
  long long v721;
  long long v722;
  long long v723;

  uint64_t v1 = a1;
  *(void *)(a1 + 12) = 0x100000001;
  if (byte_100010010) {
    CFStringRef v2 = @"/System/Library/DriverExtensions/com.apple.DriverKit-AppleBCMWLAN.dext/Firmware/";
  }
  else {
    CFStringRef v2 = @"/usr/share/firmware/wifi/";
  }
  v675 = v2;
  if (qword_1000100A8)
  {
    CFAllocatorRef v3 = kCFAllocatorDefault;
    CFStringRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 255, (CFStringRef)qword_1000100A8);
    *(void *)(v1 + 112) = MutableCopy;
    if (!MutableCopy) {
      goto LABEL_15;
    }
    io_registry_entry_t v5 = *(_DWORD *)(v1 + 8);
    v722 = 0u;
    v723 = 0u;
    v720 = 0u;
    v721 = 0u;
    v718 = 0u;
    v719 = 0u;
    v716 = 0u;
    v717 = 0u;
    v714 = 0u;
    v715 = 0u;
    v712 = 0u;
    v713 = 0u;
    v710 = 0u;
    v711 = 0u;
    memset(cStr, 0, sizeof(cStr));
    size[0] = 0;
    if (!v5) {
      goto LABEL_15;
    }
    if (!CFStringGetCStringPtr(MutableCopy, 0)) {
      goto LABEL_15;
    }
    CFStringGetCStringPtr(*(CFStringRef *)(v1 + 112), 0);
    __strlcpy_chk();
    if (!sub_100007CC0(cStr, (off_t *)size)) {
      goto LABEL_15;
    }
    if (size[0] - 0x2000 <= 0xFFFFFFFFFFFFE080)
    {
      if (qword_100010218) {
        v224 = qword_100010218;
      }
      else {
        v224 = &_os_log_default;
      }
      sub_100008124(v224, "msf cal file is too big or too small\n", v6, v7, v8, v9, v10, v11, outputStruct);
      if (dword_100010220)
      {
        *(void *)&long long v225 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v225 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v699 = v225;
        v700 = v225;
        v697 = v225;
        v698 = v225;
        v695 = v225;
        v696 = v225;
        outputStructCnt = v225;
        v694 = v225;
        length = 0xAAAAAAAAAAAAAAAALL;
        time(&length);
        v226 = localtime(&length);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v226);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        dprintf(dword_100010220, "msf cal file is too big or too small\n");
      }
    }
    else
    {
      uint64_t v12 = (UInt8 *)malloc_type_malloc(size[0], 0x66D2A491uLL);
      if (v12)
      {
        CFBooleanRef v19 = v12;
        length = size[0];
        if (sub_1000083E8(cStr, v12, &length))
        {
          CFDataRef v26 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v19, length, kCFAllocatorNull);
          if (v26)
          {
            CFDataRef v33 = v26;
            IORegistryEntrySetCFProperty(v5, @"WiFiMSFCal", v26);
            free(v19);
            CFRelease(v33);
            goto LABEL_15;
          }
          if (qword_100010218) {
            v233 = qword_100010218;
          }
          else {
            v233 = &_os_log_default;
          }
          sub_100008124(v233, "failed to create MSF Data Ref\n", v27, v28, v29, v30, v31, v32, outputStruct);
          if (dword_100010220)
          {
            *(void *)&long long v234 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v234 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v699 = v234;
            v700 = v234;
            v697 = v234;
            v698 = v234;
            v695 = v234;
            v696 = v234;
            outputStructCnt = v234;
            v694 = v234;
            v684 = 0xAAAAAAAAAAAAAAAALL;
            time(&v684);
            v235 = localtime(&v684);
            strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v235);
            dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
            dprintf(dword_100010220, "failed to create MSF Data Ref\n");
          }
        }
        else
        {
          if (qword_100010218) {
            v230 = qword_100010218;
          }
          else {
            v230 = &_os_log_default;
          }
          sub_100008124(v230, "copy MSF CAL failed\n", v20, v21, v22, v23, v24, v25, outputStruct);
          if (dword_100010220)
          {
            *(void *)&long long v231 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v231 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v699 = v231;
            v700 = v231;
            v697 = v231;
            v698 = v231;
            v695 = v231;
            v696 = v231;
            outputStructCnt = v231;
            v694 = v231;
            v684 = 0xAAAAAAAAAAAAAAAALL;
            time(&v684);
            v232 = localtime(&v684);
            strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v232);
            dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
            dprintf(dword_100010220, "copy MSF CAL failed\n");
          }
        }
        free(v19);
      }
      else
      {
        if (qword_100010218) {
          v227 = qword_100010218;
        }
        else {
          v227 = &_os_log_default;
        }
        sub_100008124(v227, "failed to alloc memory for msf cal\n", v13, v14, v15, v16, v17, v18, outputStruct);
        if (dword_100010220)
        {
          *(void *)&long long v228 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v228 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v699 = v228;
          v700 = v228;
          v697 = v228;
          v698 = v228;
          v695 = v228;
          v696 = v228;
          outputStructCnt = v228;
          v694 = v228;
          length = 0xAAAAAAAAAAAAAAAALL;
          time(&length);
          v229 = localtime(&length);
          strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v229);
          dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
          dprintf(dword_100010220, "failed to alloc memory for msf cal\n");
        }
      }
    }
  }
  else
  {
    *(void *)(a1 + 112) = 0;
    CFAllocatorRef v3 = kCFAllocatorDefault;
  }
LABEL_15:
  if (qword_1000100A0) {
    CFMutableStringRef v34 = CFStringCreateMutableCopy(v3, 255, (CFStringRef)qword_1000100A0);
  }
  else {
    CFMutableStringRef v34 = 0;
  }
  *(void *)(v1 + 104) = v34;
  CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(*(_DWORD *)(v1 + 8), @"FirmwareLoaded", v3, 0);
  if (CFProperty)
  {
    CFBooleanRef v36 = CFProperty;
    BOOL v37 = CFBooleanGetValue(CFProperty) != 0;
    CFRelease(v36);
  }
  else
  {
    BOOL v37 = 0;
  }
  io_registry_entry_t v38 = *(_DWORD *)(v1 + 8);
  length = 0;
  size[0] = 0;
  *(void *)&long long v39 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v722 = v39;
  v723 = v39;
  v720 = v39;
  v721 = v39;
  v718 = v39;
  v719 = v39;
  v716 = v39;
  v717 = v39;
  v714 = v39;
  v715 = v39;
  v712 = v39;
  v713 = v39;
  v710 = v39;
  v711 = v39;
  *(_OWORD *)cStr = v39;
  *(_OWORD *)&cStr[16] = v39;
  CFStringRef v40 = *(const __CFString **)(v1 + 104);
  allocator = v3;
  if (v40)
  {
    CFStringGetCStringPtr(v40, 0);
    __strlcpy_chk();
    CFStringRef v41 = 0;
  }
  else
  {
    CFStringRef v42 = (const __CFString *)IORegistryEntryCreateCFProperty(v38, @"PlatformConfigFileName", v3, 0);
    if (!v42)
    {
      if (qword_100010218) {
        v236 = qword_100010218;
      }
      else {
        v236 = &_os_log_default;
      }
      sub_100008124(v236, "no PlatformConfigFileName in ioreg\n", v43, v44, v45, v46, v47, v48, outputStruct);
      if (dword_100010220)
      {
        *(void *)&long long v237 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v237 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v699 = v237;
        v700 = v237;
        v697 = v237;
        v698 = v237;
        v695 = v237;
        v696 = v237;
        outputStructCnt = v237;
        v694 = v237;
        v684 = 0xAAAAAAAAAAAAAAAALL;
        time(&v684);
        v238 = localtime(&v684);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v238);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        CFStringRef v41 = 0;
        stream = 0;
        CFStringRef v91 = 0;
        CFURLRef v99 = 0;
        dprintf(dword_100010220, "no PlatformConfigFileName in ioreg\n");
        goto LABEL_173;
      }
      CFStringRef v41 = 0;
      goto LABEL_177;
    }
    CFStringRef v41 = v42;
    CFTypeID TypeID = CFStringGetTypeID();
    if (TypeID != CFGetTypeID(v41))
    {
      if (qword_100010218) {
        v239 = qword_100010218;
      }
      else {
        v239 = &_os_log_default;
      }
      sub_100008124(v239, "PlatformConfigFileName is not CFstring!\n", v50, v51, v52, v53, v54, v55, outputStruct);
      if (dword_100010220)
      {
        *(void *)&long long v240 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v240 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v699 = v240;
        v700 = v240;
        v697 = v240;
        v698 = v240;
        v695 = v240;
        v696 = v240;
        outputStructCnt = v240;
        v694 = v240;
        v684 = 0xAAAAAAAAAAAAAAAALL;
        time(&v684);
        v241 = localtime(&v684);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v241);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        stream = 0;
        CFStringRef v91 = 0;
        CFURLRef v99 = 0;
        dprintf(dword_100010220, "PlatformConfigFileName is not CFstring!\n");
        goto LABEL_173;
      }
      goto LABEL_177;
    }
    if (byte_100010010)
    {
      __strlcpy_chk();
      __strlcat_chk();
      __strlcat_chk();
      if (qword_100010218) {
        uint64_t v62 = qword_100010218;
      }
      else {
        uint64_t v62 = &_os_log_default;
      }
      sub_100008124(v62, "platformType:'%s' platformConfig path:'%s'\n", v56, v57, v58, v59, v60, v61, (char)&xmmword_100010011);
      if (dword_100010220)
      {
        *(void *)&long long v63 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v63 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v699 = v63;
        v700 = v63;
        v697 = v63;
        v698 = v63;
        v695 = v63;
        v696 = v63;
        outputStructCnt = v63;
        v694 = v63;
        v684 = 0xAAAAAAAAAAAAAAAALL;
        time(&v684);
        uint64_t v64 = localtime(&v684);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v64);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        dprintf(dword_100010220, "platformType:'%s' platformConfig path:'%s'\n", (const char *)&xmmword_100010011, cStr);
      }
    }
    else
    {
      __strlcpy_chk();
    }
    CFStringGetCStringPtr(v41, 0);
    __strlcat_chk();
  }
  int v71 = sub_100007CC0(cStr, &length);
  if (qword_100010218) {
    v72 = qword_100010218;
  }
  else {
    v72 = &_os_log_default;
  }
  sub_100008124(v72, "config full name %s size %zu\n", v65, v66, v67, v68, v69, v70, (char)cStr);
  if (dword_100010220)
  {
    *(void *)&long long v79 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v79 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v699 = v79;
    v700 = v79;
    v697 = v79;
    v698 = v79;
    v695 = v79;
    v696 = v79;
    outputStructCnt = v79;
    v694 = v79;
    v684 = 0xAAAAAAAAAAAAAAAALL;
    time(&v684);
    long long v80 = localtime(&v684);
    strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v80);
    dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
    dprintf(dword_100010220, "config full name %s size %zu\n", cStr, length);
  }
  if (!v71)
  {
LABEL_177:
    v242 = 0;
    CFStringRef v91 = 0;
    goto LABEL_178;
  }
  if (qword_100010218) {
    long long v81 = qword_100010218;
  }
  else {
    long long v81 = &_os_log_default;
  }
  if ((unint64_t)(length - 0x2000) <= 0xFFFFFFFFFFFFE080)
  {
    sub_100008124(v81, "Platform config file is too big or too small\n", v73, v74, v75, v76, v77, v78, outputStructa);
    if (dword_100010220)
    {
      *(void *)&long long v199 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v199 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v699 = v199;
      v700 = v199;
      v697 = v199;
      v698 = v199;
      v695 = v199;
      v696 = v199;
      outputStructCnt = v199;
      v694 = v199;
      v684 = 0xAAAAAAAAAAAAAAAALL;
      time(&v684);
      v200 = localtime(&v684);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v200);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      stream = 0;
      CFStringRef v91 = 0;
      CFURLRef v99 = 0;
      dprintf(dword_100010220, "Platform config file is too big or too small\n");
LABEL_173:
      v242 = stream;
      goto LABEL_179;
    }
    goto LABEL_177;
  }
  sub_100008124(v81, "config full name %s\n", v73, v74, v75, v76, v77, v78, (char)cStr);
  if (dword_100010220)
  {
    *(void *)&long long v82 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v82 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v699 = v82;
    v700 = v82;
    v697 = v82;
    v698 = v82;
    v695 = v82;
    v696 = v82;
    outputStructCnt = v82;
    v694 = v82;
    v684 = 0xAAAAAAAAAAAAAAAALL;
    time(&v684);
    long long v83 = localtime(&v684);
    strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v83);
    dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
    dprintf(dword_100010220, "config full name %s\n", cStr);
  }
  CFStringRef v84 = CFStringCreateWithCString(0, cStr, 0);
  if (!v84)
  {
    if (qword_100010218) {
      v201 = qword_100010218;
    }
    else {
      v201 = &_os_log_default;
    }
    sub_100008124(v201, "fail to create CFStringRef for file w path\n", v85, v86, v87, v88, v89, v90, outputStructb);
    if (dword_100010220)
    {
      *(void *)&long long v202 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v202 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v699 = v202;
      v700 = v202;
      v697 = v202;
      v698 = v202;
      v695 = v202;
      v696 = v202;
      outputStructCnt = v202;
      v694 = v202;
      v684 = 0xAAAAAAAAAAAAAAAALL;
      time(&v684);
      v203 = localtime(&v684);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v203);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      stream = 0;
      CFStringRef v91 = 0;
      CFURLRef v99 = 0;
      dprintf(dword_100010220, "fail to create CFStringRef for file w path\n");
      goto LABEL_173;
    }
    goto LABEL_177;
  }
  CFStringRef v91 = v84;
  CFURLRef v92 = CFURLCreateWithFileSystemPath(v3, v84, kCFURLPOSIXPathStyle, 0);
  if (!v92)
  {
    if (qword_100010218) {
      v204 = qword_100010218;
    }
    else {
      v204 = &_os_log_default;
    }
    sub_100008124(v204, "fail to create fileURL\n", v93, v94, v95, v96, v97, v98, outputStructb);
    if (dword_100010220)
    {
      *(void *)&long long v205 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v205 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v699 = v205;
      v700 = v205;
      v697 = v205;
      v698 = v205;
      v695 = v205;
      v696 = v205;
      outputStructCnt = v205;
      v694 = v205;
      v684 = 0xAAAAAAAAAAAAAAAALL;
      time(&v684);
      v206 = localtime(&v684);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v206);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      stream = 0;
      CFURLRef v99 = 0;
      dprintf(dword_100010220, "fail to create fileURL\n");
      goto LABEL_173;
    }
    v242 = 0;
LABEL_178:
    CFURLRef v99 = 0;
    goto LABEL_179;
  }
  CFURLRef v99 = v92;
  v100 = CFReadStreamCreateWithFile(v3, v92);
  if (!v100)
  {
    if (qword_100010218) {
      v207 = qword_100010218;
    }
    else {
      v207 = &_os_log_default;
    }
    sub_100008124(v207, "fail to create fileStream\n", v101, v102, v103, v104, v105, v106, outputStructb);
    if (dword_100010220)
    {
      *(void *)&long long v208 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v208 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v699 = v208;
      v700 = v208;
      v697 = v208;
      v698 = v208;
      v695 = v208;
      v696 = v208;
      outputStructCnt = v208;
      v694 = v208;
      v684 = 0xAAAAAAAAAAAAAAAALL;
      time(&v684);
      v209 = localtime(&v684);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v209);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      stream = 0;
      dprintf(dword_100010220, "fail to create fileStream\n");
      goto LABEL_173;
    }
    v242 = 0;
LABEL_179:
    LOBYTE(v149) = 0;
    v122 = 0;
    v148 = 0;
    stream = v242;
    BOOL v195 = v242 != 0;
    if (!v41) {
      goto LABEL_181;
    }
    goto LABEL_180;
  }
  v107 = v100;
  int v108 = CFReadStreamOpen(v100);
  stream = v107;
  if (!v108)
  {
    if (qword_100010218) {
      v210 = qword_100010218;
    }
    else {
      v210 = &_os_log_default;
    }
    sub_100008124(v210, "fail to open fileStream\n", v109, v110, v111, v112, v113, v114, outputStructb);
    if (dword_100010220)
    {
      *(void *)&long long v211 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v211 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v699 = v211;
      v700 = v211;
      v697 = v211;
      v698 = v211;
      v695 = v211;
      v696 = v211;
      outputStructCnt = v211;
      v694 = v211;
      v684 = 0xAAAAAAAAAAAAAAAALL;
      time(&v684);
      v212 = localtime(&v684);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v212);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "fail to open fileStream\n");
    }
    goto LABEL_173;
  }
  int v115 = v108;
  entry = v38;
  v122 = (const __CFArray **)CFPropertyListCreateWithStream(v3, v107, 0, 2uLL, 0, (CFErrorRef *)size);
  if (!v122)
  {
    CFReadStreamClose(v107);
LABEL_132:
    LOBYTE(v149) = 0;
    v148 = 0;
    goto LABEL_91;
  }
  if (qword_100010218) {
    v123 = qword_100010218;
  }
  else {
    v123 = &_os_log_default;
  }
  sub_100008124(v123, "Setting property list  errorCode:%d, status:%u\n", v116, v117, v118, v119, v120, v121, 0);
  if (dword_100010220)
  {
    *(void *)&long long v130 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v130 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v699 = v130;
    v700 = v130;
    v697 = v130;
    v698 = v130;
    v695 = v130;
    v696 = v130;
    outputStructCnt = v130;
    v694 = v130;
    v684 = 0xAAAAAAAAAAAAAAAALL;
    time(&v684);
    v131 = localtime(&v684);
    strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v131);
    dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
    dprintf(dword_100010220, "Setting property list  errorCode:%d, status:%u\n", 0, v115);
  }
  if (size[0])
  {
    if (qword_100010218) {
      v213 = qword_100010218;
    }
    else {
      v213 = &_os_log_default;
    }
    sub_100008124(v213, "fail to create property list\n", v124, v125, v126, v127, v128, v129, outputStructc);
    if (dword_100010220)
    {
      *(void *)&long long v214 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v214 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v699 = v214;
      v700 = v214;
      v697 = v214;
      v698 = v214;
      v695 = v214;
      v696 = v214;
      outputStructCnt = v214;
      v694 = v214;
      v684 = 0xAAAAAAAAAAAAAAAALL;
      time(&v684);
      v215 = localtime(&v684);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v215);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "fail to create property list\n");
    }
    goto LABEL_132;
  }
  CFTypeID v132 = CFDictionaryGetTypeID();
  if (v132 != CFGetTypeID(v122))
  {
    if (qword_100010218) {
      v216 = qword_100010218;
    }
    else {
      v216 = &_os_log_default;
    }
    sub_100008124(v216, "Propery list is not CFDictionary!\n", v133, v134, v135, v136, v137, v138, outputStructc);
    if (dword_100010220)
    {
      *(void *)&long long v217 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v217 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v699 = v217;
      v700 = v217;
      v697 = v217;
      v698 = v217;
      v695 = v217;
      v696 = v217;
      outputStructCnt = v217;
      v694 = v217;
      v684 = 0xAAAAAAAAAAAAAAAALL;
      time(&v684);
      v218 = localtime(&v684);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v218);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "Propery list is not CFDictionary!\n");
    }
    goto LABEL_132;
  }
  CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)v122);
  unsigned int v140 = Count;
  if (Count != (int)Count) {
    goto LABEL_627;
  }
  v671 = v41;
  if (Count << 32 < 0)
  {
LABEL_628:
    __break(0x550Cu);
    return;
  }
  v141 = (const void **)malloc_type_malloc((8 * Count) & 0x7FFFFFFFFLL, 0x6004044C4A2DFuLL);
  if (v141)
  {
    v148 = v141;
    v669 = v99;
    v670 = v91;
    v674 = v37;
    v672 = v1;
    CFDictionaryGetKeysAndValues((CFDictionaryRef)v122, v141, 0);
    int v149 = 0;
    CFIndex v150 = 0;
    v680 = v140;
    unint64_t v151 = ~(unint64_t)v148;
    while (v150 < CFDictionaryGetCount((CFDictionaryRef)v122))
    {
      if (v151 < 8 * v150)
      {
        __break(0x5513u);
LABEL_600:
        __break(1u);
        goto LABEL_601;
      }
      if (v150 == v680) {
        goto LABEL_600;
      }
      int v158 = v149;
      v159 = v122;
      v160 = v148;
      char CStringPtr = CFStringGetCStringPtr((CFStringRef)v148[v150], 0);
      uint64_t v162 = 0;
      uint64_t v163 = qword_100010218;
      do
      {
        if (!strcmp(CStringPtr, off_10000C468[v162])) {
          break;
        }
        ++v162;
      }
      while (v162 != 50);
      if (v163) {
        v170 = v163;
      }
      else {
        v170 = &_os_log_default;
      }
      sub_100008124(v170, "%5ld: %s allow: %d\n", v164, v165, v166, v167, v168, v169, v150);
      if (dword_100010220)
      {
        *(void *)&long long v171 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v171 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v699 = v171;
        v700 = v171;
        v697 = v171;
        v698 = v171;
        v695 = v171;
        v696 = v171;
        outputStructCnt = v171;
        v694 = v171;
        v684 = 0xAAAAAAAAAAAAAAAALL;
        time(&v684);
        v172 = localtime(&v684);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v172);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        unint64_t v173 = 0;
        int v174 = dword_100010220;
        BOOL v175 = 1;
        do
        {
          if (!strcmp(CStringPtr, off_10000C468[v173])) {
            break;
          }
          BOOL v175 = v173++ < 0x31;
        }
        while (v173 != 50);
        dprintf(v174, "%5ld: %s allow: %d\n", v150, CStringPtr, v175);
      }
      unint64_t v176 = 0;
      BOOL v177 = 1;
      do
      {
        if (!strcmp(CStringPtr, off_10000C468[v176])) {
          break;
        }
        BOOL v177 = v176++ < 0x31;
      }
      while (v176 != 50);
      v122 = v159;
      if (!v177)
      {
        if (qword_100010218) {
          v196 = qword_100010218;
        }
        else {
          v196 = &_os_log_default;
        }
        sub_100008124(v196, "key not in allowList\n", v178, v179, v180, v181, v182, v183, outputStructc);
        LOBYTE(v149) = v158;
        v148 = v160;
        if (dword_100010220)
        {
          *(void *)&long long v197 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v197 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v699 = v197;
          v700 = v197;
          v697 = v197;
          v698 = v197;
          v695 = v197;
          v696 = v197;
          outputStructCnt = v197;
          v694 = v197;
          v684 = 0xAAAAAAAAAAAAAAAALL;
          time(&v684);
          v198 = localtime(&v684);
          strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v198);
          dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
          dprintf(dword_100010220, "key not in allowList\n");
        }
        CFStringRef v41 = v671;
        uint64_t v1 = v672;
        BOOL v37 = v674;
LABEL_90:
        CFURLRef v99 = v669;
        CFStringRef v91 = v670;
        goto LABEL_91;
      }
      if (!strncmp(CStringPtr, "wlan.is.fdr.cal", 0x10uLL)) {
        int v149 = 1;
      }
      else {
        int v149 = v158;
      }
      ++v150;
      v148 = v160;
    }
    CFTypeID v184 = CFDictionaryGetTypeID();
    CFTypeID v191 = CFGetTypeID(v122);
    if (qword_100010218) {
      v192 = qword_100010218;
    }
    else {
      v192 = &_os_log_default;
    }
    CFStringRef v41 = v671;
    if (v184 == v191)
    {
      sub_100008124(v192, "%s isFdrCal %d\n", v185, v186, v187, v188, v189, v190, (char)"writePlatformConfig");
      uint64_t v1 = v672;
      BOOL v37 = v674;
      if (dword_100010220)
      {
        *(void *)&long long v193 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v193 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v699 = v193;
        v700 = v193;
        v697 = v193;
        v698 = v193;
        v695 = v193;
        v696 = v193;
        outputStructCnt = v193;
        v694 = v193;
        v684 = 0xAAAAAAAAAAAAAAAALL;
        time(&v684);
        v194 = localtime(&v684);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v194);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        dprintf(dword_100010220, "%s isFdrCal %d\n", "writePlatformConfig", v149);
      }
      IORegistryEntrySetCFProperty(entry, @"PlatformConfig", v122);
      goto LABEL_90;
    }
    sub_100008124(v192, "Propery list is not CFDictionary!\n", v185, v186, v187, v188, v189, v190, outputStructc);
    uint64_t v1 = v672;
    BOOL v37 = v674;
    CFURLRef v99 = v669;
    CFStringRef v91 = v670;
    if (dword_100010220)
    {
      *(void *)&long long v222 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v222 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v699 = v222;
      v700 = v222;
      v697 = v222;
      v698 = v222;
      v695 = v222;
      v696 = v222;
      outputStructCnt = v222;
      v694 = v222;
      v684 = 0xAAAAAAAAAAAAAAAALL;
      time(&v684);
      v223 = localtime(&v684);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v223);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "Propery list is not CFDictionary!\n");
    }
  }
  else
  {
    if (qword_100010218) {
      v219 = qword_100010218;
    }
    else {
      v219 = &_os_log_default;
    }
    sub_100008124(v219, "fail to allocate memory for keys\n", v142, v143, v144, v145, v146, v147, outputStructc);
    if (dword_100010220)
    {
      *(void *)&long long v220 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v220 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v699 = v220;
      v700 = v220;
      v697 = v220;
      v698 = v220;
      v695 = v220;
      v696 = v220;
      outputStructCnt = v220;
      v694 = v220;
      v684 = 0xAAAAAAAAAAAAAAAALL;
      time(&v684);
      v221 = localtime(&v684);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v221);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "fail to allocate memory for keys\n");
    }
    LOBYTE(v149) = 0;
    v148 = 0;
  }
LABEL_91:
  CFReadStreamClose(stream);
  BOOL v195 = 1;
  if (v41) {
LABEL_180:
  }
    CFRelease(v41);
LABEL_181:
  if (v91) {
    CFRelease(v91);
  }
  if (v99) {
    CFRelease(v99);
  }
  if (v195) {
    CFRelease(stream);
  }
  if (size[0]) {
    CFRelease((CFTypeRef)size[0]);
  }
  size[0] = 0;
  if (v122) {
    CFRelease(v122);
  }
  if (v148) {
    free(v148);
  }
  io_service_t v243 = *(_DWORD *)(v1 + 8);
  if (!qword_100010210) {
    pthread_once(&stru_100010000, (void (*)(void))sub_100007A88);
  }
  uint64_t Instance = _CFRuntimeCreateInstance();
  v251 = &stru_100010000;
  if (!Instance) {
    goto LABEL_588;
  }
  uint64_t v252 = Instance;
  *(void *)(Instance + 20) = 0;
  v253 = (mach_port_t *)(Instance + 20);
  *(_DWORD *)(Instance + 16) = v243;
  if (IOServiceOpen(v243, mach_task_self_, 0x57694669u, (io_connect_t *)(Instance + 20))
    || IOConnectCallScalarMethod(*v253, 0, 0, 0, 0, 0))
  {
    CFRelease((CFTypeRef)v252);
LABEL_588:
    *(void *)(v1 + 24) = 0;
    goto LABEL_507;
  }
  *(unsigned char *)(v252 + 24) = 1;
  *(void *)(v1 + 24) = v252;
  CFTypeRef v254 = IORegistryEntryCreateCFProperty(*(_DWORD *)(v252 + 16), @"RequestedFiles", v3, 0);
  *(void *)(v1 + 32) = v254;
  if (v254)
  {
    *(void *)(v1 + 40) = IORegistryEntryCreateCFProperty(*(_DWORD *)(*(void *)(v1 + 24) + 16), @"FileExtensions", v3, 0);
    CFDictionaryRef v255 = (const __CFDictionary *)IORegistryEntryCreateCFProperty(*(_DWORD *)(*(void *)(v1 + 24) + 16), @"RequestedFilesOverride", v3, 0);
    *(void *)(v1 + 48) = v255;
    CFArrayRef v256 = *(const __CFArray **)(v1 + 32);
    if (v255)
    {
      CFDataRef Value = (const __CFData *)CFDictionaryGetValue(v255, @"wifi-fw-path");
      CFStringRef v258 = (const __CFString *)*((void *)&xmmword_100010070 + 1);
      if (!*((void *)&xmmword_100010070 + 1))
      {
        CFDataRef v259 = Value;
        if (Value)
        {
          CFTypeID v260 = CFGetTypeID(Value);
          if (v260 == CFDataGetTypeID())
          {
            CFStringRef v261 = CFStringCreateFromExternalRepresentation(v3, v259, 0);
            goto LABEL_207;
          }
        }
        goto LABEL_206;
      }
    }
    else
    {
      CFStringRef v258 = (const __CFString *)*((void *)&xmmword_100010070 + 1);
      if (!*((void *)&xmmword_100010070 + 1))
      {
LABEL_206:
        CFStringRef v261 = sub_100008C00(v256, @"Firmware", dword_1000100E8, v675);
LABEL_207:
        CFStringRef v268 = v261;
        if (BYTE1(dword_1000100B0))
        {
          v269 = CFStringGetCStringPtr(v261, 0);
          v270 = (const char *)&unk_10000AE43;
          if (v269) {
            v270 = v269;
          }
          fprintf(__stdoutp, "Resolved to Firmware file path: \"%s\"\n", v270);
        }
        *(void *)(v1 + 64) = v268;
        if (!v268)
        {
          IOConnectCallScalarMethod(*(_DWORD *)(*(void *)(v1 + 24) + 20), 4u, 0, 0, 0, 0);
          goto LABEL_507;
        }
        if (qword_100010218) {
          v271 = qword_100010218;
        }
        else {
          v271 = &_os_log_default;
        }
        sub_100008124(v271, "%s: enter\n", v262, v263, v264, v265, v266, v267, (char)"handleFdr");
        if (dword_100010220)
        {
          *(void *)&long long v278 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v278 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v714 = v278;
          v715 = v278;
          v712 = v278;
          v713 = v278;
          v710 = v278;
          v711 = v278;
          *(_OWORD *)cStr = v278;
          *(_OWORD *)&cStr[16] = v278;
          *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
          time((time_t *)&outputStructCnt);
          v279 = localtime((const time_t *)&outputStructCnt);
          strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v279);
          dprintf(dword_100010220, "%s ", cStr);
          dprintf(dword_100010220, "%s: enter\n", "handleFdr");
        }
        if (!(_BYTE)v149)
        {
          if (qword_100010218) {
            v289 = qword_100010218;
          }
          else {
            v289 = &_os_log_default;
          }
          sub_100008124(v289, "%s: platform does not need FDR.\n", v272, v273, v274, v275, v276, v277, (char)"handleFdr");
          if (dword_100010220)
          {
            *(void *)&long long v290 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v290 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v714 = v290;
            v715 = v290;
            v712 = v290;
            v713 = v290;
            v710 = v290;
            v711 = v290;
            *(_OWORD *)cStr = v290;
            *(_OWORD *)&cStr[16] = v290;
            *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)&outputStructCnt);
            v291 = localtime((const time_t *)&outputStructCnt);
            strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v291);
            dprintf(dword_100010220, "%s ", cStr);
            dprintf(dword_100010220, "%s: platform does not need FDR.\n");
          }
LABEL_295:
          if (BYTE2(dword_1000100B0)) {
            BOOL v364 = 0;
          }
          else {
            BOOL v364 = v37;
          }
          if (v364 && !BYTE1(dword_1000100B0))
          {
            if (qword_100010218) {
              v365 = qword_100010218;
            }
            else {
              v365 = &_os_log_default;
            }
            sub_100008124(v365, "Already loaded, bailing use '-r' to force load\n", v281, v282, v283, v284, v285, v286, outputStructd);
            if (dword_100010220)
            {
              *(void *)&long long v366 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v366 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v714 = v366;
              v715 = v366;
              v712 = v366;
              v713 = v366;
              v710 = v366;
              v711 = v366;
              *(_OWORD *)cStr = v366;
              *(_OWORD *)&cStr[16] = v366;
              *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
              time((time_t *)&outputStructCnt);
              v367 = localtime((const time_t *)&outputStructCnt);
              strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v367);
              dprintf(dword_100010220, "%s ", cStr);
              dprintf(dword_100010220, "Already loaded, bailing use '-r' to force load\n");
            }
            fwrite("Already loaded, bailing, use '-r' to force load\n", 0x30uLL, 1uLL, __stderrp);
LABEL_306:
            *(_DWORD *)(v1 + 12) = 0;
            goto LABEL_507;
          }
          if (byte_1000101F8)
          {
            if ((qword_1000101FC - 1) > 3) {
              CFStringRef v368 = @"PreventUserIdleSystemSleep";
            }
            else {
              CFStringRef v368 = off_10000C5F8[(qword_1000101FC - 1)];
            }
            int v369 = HIDWORD(qword_1000101FC);
            double v370 = (double)SHIDWORD(qword_1000101FC);
            uint64_t v371 = qword_100010218;
            char v372 = CFStringGetCStringPtr(v368, 0);
            CFStringGetCStringPtr(@"com.apple.wifiFirmwareLoader.IOPMAssertion.loading-firmware", 0);
            CFStringGetCStringPtr(@"wifiFirmwareLoader: IOPMAssertion: Loading firmware", 0);
            CFStringGetCStringPtr(@"TimeoutActionTurnOff", 0);
            v379 = &_os_log_default;
            if (v371) {
              v379 = v371;
            }
            sub_100008124(v379, "_createIOPMHelperCreateAssertion assertionType[%s] assertionName[%s] details[%s] reason[%s] bundle[%s] timeout[%f sec] assertionID[%p] assertionLevel[0x%08x]\n", v373, v374, v375, v376, v377, v378, v372);
            if (dword_100010220)
            {
              *(void *)&long long v386 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v386 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v714 = v386;
              v715 = v386;
              v712 = v386;
              v713 = v386;
              v710 = v386;
              v711 = v386;
              *(_OWORD *)cStr = v386;
              *(_OWORD *)&cStr[16] = v386;
              *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
              time((time_t *)&outputStructCnt);
              v387 = localtime((const time_t *)&outputStructCnt);
              strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v387);
              dprintf(dword_100010220, "%s ", cStr);
              int v388 = dword_100010220;
              v389 = CFStringGetCStringPtr(v368, 0);
              v390 = CFStringGetCStringPtr(@"com.apple.wifiFirmwareLoader.IOPMAssertion.loading-firmware", 0);
              v391 = CFStringGetCStringPtr(@"wifiFirmwareLoader: IOPMAssertion: Loading firmware", 0);
              v392 = CFStringGetCStringPtr(@"TimeoutActionTurnOff", 0);
              dprintf(v388, "_createIOPMHelperCreateAssertion assertionType[%s] assertionName[%s] details[%s] reason[%s] bundle[%s] timeout[%f sec] assertionID[%p] assertionLevel[0x%08x]\n", v389, v390, v391, (const char *)&unk_10000AE43, (const char *)&unk_10000AE43, v370, v392, 0);
            }
            CFAllocatorRef v3 = allocator;
            if (v369 <= 0)
            {
              v251 = &stru_100010000;
              IOReturn v399 = -536870911;
            }
            else
            {
              LODWORD(size[0]) = 0;
              IOReturn v399 = IOPMAssertionCreateWithDescription(v368, @"com.apple.wifiFirmwareLoader.IOPMAssertion.loading-firmware", @"wifiFirmwareLoader: IOPMAssertion: Loading firmware", 0, 0, v370, @"TimeoutActionTurnOff", (IOPMAssertionID *)size);
              if (qword_100010218) {
                v400 = qword_100010218;
              }
              else {
                v400 = &_os_log_default;
              }
              sub_100008124(v400, "_createIOPMHelperCreateAssertion 'IOPMAssertionCreateWithDescription': return [0x%08x], id[0x%08x]\n", v393, v394, v395, v396, v397, v398, v399);
              v251 = &stru_100010000;
              if (dword_100010220)
              {
                *(void *)&long long v401 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v401 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v714 = v401;
                v715 = v401;
                v712 = v401;
                v713 = v401;
                v710 = v401;
                v711 = v401;
                *(_OWORD *)cStr = v401;
                *(_OWORD *)&cStr[16] = v401;
                *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
                time((time_t *)&outputStructCnt);
                v402 = localtime((const time_t *)&outputStructCnt);
                strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v402);
                dprintf(dword_100010220, "%s ", cStr);
                dprintf(dword_100010220, "_createIOPMHelperCreateAssertion 'IOPMAssertionCreateWithDescription': return [0x%08x], id[0x%08x]\n", v399, LODWORD(size[0]));
              }
              dword_100010208 = size[0];
            }
            if (qword_100010218) {
              v403 = qword_100010218;
            }
            else {
              v403 = &_os_log_default;
            }
            sub_100008124(v403, "wifiFirmwareLoaderServiceThread: _createIOPMHelperCreateAssertion return[0x%08x], id[0x%08x]\n", v380, v381, v382, v383, v384, v385, v399);
            if (dword_100010220)
            {
              *(void *)&long long v404 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v404 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v714 = v404;
              v715 = v404;
              v712 = v404;
              v713 = v404;
              v710 = v404;
              v711 = v404;
              *(_OWORD *)cStr = v404;
              *(_OWORD *)&cStr[16] = v404;
              *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
              time((time_t *)&outputStructCnt);
              v405 = localtime((const time_t *)&outputStructCnt);
              strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v405);
              dprintf(dword_100010220, "%s ", cStr);
              dprintf(dword_100010220, "wifiFirmwareLoaderServiceThread: _createIOPMHelperCreateAssertion return[0x%08x], id[0x%08x]\n", v399, dword_100010208);
            }
          }
          v412 = CFStringGetCStringPtr(*(CFStringRef *)(v1 + 64), 0);
          if (qword_100010218) {
            v413 = qword_100010218;
          }
          else {
            v413 = &_os_log_default;
          }
          sub_100008124(v413, "full path firmwareName is %s\n", v406, v407, v408, v409, v410, v411, (char)v412);
          if (dword_100010220)
          {
            *(void *)&long long v414 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v414 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v714 = v414;
            v715 = v414;
            v712 = v414;
            v713 = v414;
            v710 = v414;
            v711 = v414;
            *(_OWORD *)cStr = v414;
            *(_OWORD *)&cStr[16] = v414;
            *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)&outputStructCnt);
            v415 = localtime((const time_t *)&outputStructCnt);
            strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v415);
            dprintf(dword_100010220, "%s ", cStr);
            dprintf(dword_100010220, "full path firmwareName is %s\n", v412);
          }
          if ((sub_100007CC0(v412, &qword_1000100B8) & 1) == 0) {
            goto LABEL_383;
          }
          if (!sub_100008D78(*(void *)(v1 + 32), @"Signature"))
          {
            v424 = 0;
            goto LABEL_375;
          }
          CFArrayRef v416 = *(const __CFArray **)(v1 + 32);
          CFDictionaryRef v417 = *(const __CFDictionary **)(v1 + 48);
          if (v417)
          {
            CFDataRef v418 = (const __CFData *)CFDictionaryGetValue(v417, @"wifi-signature-path");
            CFStringRef v419 = (const __CFString *)qword_100010080;
            if (!qword_100010080)
            {
              CFDataRef v420 = v418;
              if (!v418) {
                goto LABEL_365;
              }
              CFTypeID v421 = CFGetTypeID(v418);
              BOOL v422 = v421 == CFDataGetTypeID();
              CFAllocatorRef v3 = allocator;
              if (!v422) {
                goto LABEL_365;
              }
              CFStringRef v423 = CFStringCreateFromExternalRepresentation(allocator, v420, 0);
LABEL_366:
              CFStringRef v453 = v423;
              if (!v423)
              {
                *(void *)(v1 + 72) = 0;
                goto LABEL_383;
              }
              v454 = CFStringGetCStringPtr(v423, 0);
              v455 = (const char *)&unk_10000AE43;
              if (v454) {
                v455 = v454;
              }
              fprintf(__stdoutp, "Resolved to signature file path: \"%s\"\n", v455);
              *(void *)(v1 + 72) = v453;
              v424 = CFStringGetCStringPtr(v453, 0);
              char v462 = sub_100007CC0(v424, &qword_1000100C0);
              if (qword_100010218) {
                v463 = qword_100010218;
              }
              else {
                v463 = &_os_log_default;
              }
              sub_100008124(v463, "full path signatureName is %s (%zu bytes)\n", v456, v457, v458, v459, v460, v461, (char)v424);
              if (dword_100010220)
              {
                *(void *)&long long v464 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v464 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v714 = v464;
                v715 = v464;
                v712 = v464;
                v713 = v464;
                v710 = v464;
                v711 = v464;
                *(_OWORD *)cStr = v464;
                *(_OWORD *)&cStr[16] = v464;
                *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
                time((time_t *)&outputStructCnt);
                v465 = localtime((const time_t *)&outputStructCnt);
                strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v465);
                dprintf(dword_100010220, "%s ", cStr);
                dprintf(dword_100010220, "full path signatureName is %s (%zu bytes)\n", v424, qword_1000100C0);
              }
              if ((v462 & 1) == 0) {
                goto LABEL_383;
              }
LABEL_375:
              if (!sub_100008D78(*(void *)(v1 + 32), @"Platcfg"))
              {
                v479 = 0;
                goto LABEL_400;
              }
              CFArrayRef v466 = *(const __CFArray **)(v1 + 32);
              CFDictionaryRef v467 = *(const __CFDictionary **)(v1 + 48);
              if (v467)
              {
                CFDataRef v468 = (const __CFData *)CFDictionaryGetValue(v467, @"wifi-platcfg-path");
                CFStringRef v469 = (const __CFString *)*((void *)&xmmword_100010090 + 1);
                if (!*((void *)&xmmword_100010090 + 1))
                {
                  CFDataRef v470 = v468;
                  if (v468)
                  {
                    CFTypeID v471 = CFGetTypeID(v468);
                    if (v471 == CFDataGetTypeID())
                    {
                      CFStringRef v472 = CFStringCreateFromExternalRepresentation(v3, v470, 0);
                      goto LABEL_387;
                    }
                  }
                  goto LABEL_386;
                }
              }
              else
              {
                CFStringRef v469 = (const __CFString *)*((void *)&xmmword_100010090 + 1);
                if (!*((void *)&xmmword_100010090 + 1))
                {
LABEL_386:
                  CFStringRef v472 = sub_100008C00(v466, @"Platcfg", &qword_1000100E0, v675);
LABEL_387:
                  CFStringRef v480 = v472;
                  if (v472)
                  {
                    v481 = CFStringGetCStringPtr(v472, 0);
                    v482 = (const char *)&unk_10000AE43;
                    if (v481) {
                      v482 = v481;
                    }
                    fprintf(__stdoutp, "Resolved to platcfg file path: \"%s\"\n", v482);
                    *(void *)(v1 + 96) = v480;
                    v479 = CFStringGetCStringPtr(v480, 0);
                    int v483 = sub_100007CC0(v479, &qword_1000100E0);
                    if (*(void *)(v1 + 96) && v483) {
                      goto LABEL_395;
                    }
                  }
                  else
                  {
                    v479 = 0;
                    *(void *)(v1 + 96) = 0;
                  }
                  qword_1000100E0 = 0;
LABEL_395:
                  if (qword_100010218) {
                    v484 = qword_100010218;
                  }
                  else {
                    v484 = &_os_log_default;
                  }
                  sub_100008124(v484, "full path platcfgName is %s (%zu bytes)\n", v473, v474, v475, v476, v477, v478, (char)v479);
                  if (dword_100010220)
                  {
                    *(void *)&long long v485 = 0xAAAAAAAAAAAAAAAALL;
                    *((void *)&v485 + 1) = 0xAAAAAAAAAAAAAAAALL;
                    v714 = v485;
                    v715 = v485;
                    v712 = v485;
                    v713 = v485;
                    v710 = v485;
                    v711 = v485;
                    *(_OWORD *)cStr = v485;
                    *(_OWORD *)&cStr[16] = v485;
                    *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
                    time((time_t *)&outputStructCnt);
                    v486 = localtime((const time_t *)&outputStructCnt);
                    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v486);
                    dprintf(dword_100010220, "%s ", cStr);
                    dprintf(dword_100010220, "full path platcfgName is %s (%zu bytes)\n", v479, qword_1000100E0);
                  }
LABEL_400:
                  v682 = v479;
                  CFArrayRef v487 = *(const __CFArray **)(v1 + 32);
                  CFDictionaryRef v488 = *(const __CFDictionary **)(v1 + 48);
                  if (v488)
                  {
                    CFDataRef v489 = (const __CFData *)CFDictionaryGetValue(v488, @"wifi-nvram-path");
                    CFStringRef v490 = (const __CFString *)xmmword_100010070;
                    if (!(void)xmmword_100010070)
                    {
                      CFDataRef v491 = v489;
                      if (v489)
                      {
                        v492 = v424;
                        CFTypeID v493 = CFGetTypeID(v489);
                        BOOL v422 = v493 == CFDataGetTypeID();
                        v424 = v492;
                        if (v422)
                        {
                          CFStringRef v494 = CFStringCreateFromExternalRepresentation(v3, v491, 0);
                          goto LABEL_409;
                        }
                      }
                      goto LABEL_408;
                    }
                  }
                  else
                  {
                    CFStringRef v490 = (const __CFString *)xmmword_100010070;
                    if (!(void)xmmword_100010070)
                    {
LABEL_408:
                      CFStringRef v494 = sub_100008C00(v487, @"NVRAM", dword_1000100F0, v675);
LABEL_409:
                      CFStringRef v495 = v494;
                      if (BYTE1(dword_1000100B0))
                      {
                        v496 = CFStringGetCStringPtr(v494, 0);
                        v497 = (const char *)&unk_10000AE43;
                        if (v496) {
                          v497 = v496;
                        }
                        fprintf(__stdoutp, "Resolved to NVRAM file path: \"%s\"\n", v497);
                      }
                      *(void *)(v1 + 56) = v495;
                      if (v495)
                      {
                        allocatora = v424;
                        v504 = CFStringGetCStringPtr(v495, 0);
                        if (qword_100010218) {
                          v505 = qword_100010218;
                        }
                        else {
                          v505 = &_os_log_default;
                        }
                        sub_100008124(v505, "full path NVRAM is %s\n", v498, v499, v500, v501, v502, v503, (char)v504);
                        if (dword_100010220)
                        {
                          *(void *)&long long v506 = 0xAAAAAAAAAAAAAAAALL;
                          *((void *)&v506 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          v714 = v506;
                          v715 = v506;
                          v712 = v506;
                          v713 = v506;
                          v710 = v506;
                          v711 = v506;
                          *(_OWORD *)cStr = v506;
                          *(_OWORD *)&cStr[16] = v506;
                          *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
                          time((time_t *)&outputStructCnt);
                          v507 = localtime((const time_t *)&outputStructCnt);
                          strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v507);
                          dprintf(dword_100010220, "%s ", cStr);
                          dprintf(dword_100010220, "full path NVRAM is %s\n", v504);
                        }
                        if (sub_100007CC0(v504, &qword_1000100C8))
                        {
                          if ((_BYTE)dword_1000100B0 && !HIBYTE(dword_1000100B0))
                          {
                            v122 = (const __CFArray **)v1;
                            v508 = 0;
                            goto LABEL_451;
                          }
                          if (qword_100010088)
                          {
                            CFMutableStringRef v509 = CFStringCreateMutableCopy(v3, 255, (CFStringRef)qword_100010088);
                          }
                          else
                          {
                            if (*(void *)(v1 + 40))
                            {
                              if (qword_100010218) {
                                v511 = qword_100010218;
                              }
                              else {
                                v511 = &_os_log_default;
                              }
                              sub_100008284(v511, "Deprecated feature\n", 0, v246, v247, v248, v249, v250, outputStructe);
                              if (dword_100010220)
                              {
                                *(void *)&long long v512 = 0xAAAAAAAAAAAAAAAALL;
                                *((void *)&v512 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                v714 = v512;
                                v715 = v512;
                                v712 = v512;
                                v713 = v512;
                                v710 = v512;
                                v711 = v512;
                                *(_OWORD *)cStr = v512;
                                *(_OWORD *)&cStr[16] = v512;
                                *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
                                time((time_t *)&outputStructCnt);
                                v513 = localtime((const time_t *)&outputStructCnt);
                                strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v513);
                                dprintf(dword_100010220, "%s ", cStr);
                                dprintf(dword_100010220, "Deprecated feature\n");
                              }
                              CFStringRef v510 = 0;
LABEL_433:
                              if (BYTE1(dword_1000100B0))
                              {
                                if (v510) {
                                  v514 = CFStringGetCStringPtr(v510, 0);
                                }
                                else {
                                  v514 = 0;
                                }
                                v515 = (const char *)&unk_10000AE43;
                                if (v514) {
                                  v515 = v514;
                                }
                                fprintf(__stdoutp, "Resolved to Regulatory file path: \"%s\"\n", v515);
                              }
                              v122 = (const __CFArray **)v1;
                              *(void *)(v1 + 80) = v510;
                              if (v510)
                              {
                                v508 = CFStringGetCStringPtr(v510, 0);
                                if (qword_100010218) {
                                  v522 = qword_100010218;
                                }
                                else {
                                  v522 = &_os_log_default;
                                }
                                sub_100008124(v522, "full path Regulatory is %s\n", v516, v517, v518, v519, v520, v521, (char)v508);
                                if (dword_100010220)
                                {
                                  *(void *)&long long v523 = 0xAAAAAAAAAAAAAAAALL;
                                  *((void *)&v523 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                  v714 = v523;
                                  v715 = v523;
                                  v712 = v523;
                                  v713 = v523;
                                  v710 = v523;
                                  v711 = v523;
                                  *(_OWORD *)cStr = v523;
                                  *(_OWORD *)&cStr[16] = v523;
                                  *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
                                  time((time_t *)&outputStructCnt);
                                  v524 = localtime((const time_t *)&outputStructCnt);
                                  strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v524);
                                  dprintf(dword_100010220, "%s ", cStr);
                                  dprintf(dword_100010220, "full path Regulatory is %s\n", v508);
                                }
                                if ((sub_100007CC0(v508, &qword_1000100D0) & 1) == 0
                                  || (unint64_t)qword_1000100D0 >= 0x19000
                                  || (unint64_t)qword_1000100D0 <= 0x20)
                                {
                                  goto LABEL_590;
                                }
                              }
                              else
                              {
                                v508 = 0;
                                qword_1000100F8 = -1;
                              }
LABEL_451:
                              if ((_BYTE)dword_1000100B0 && !(_BYTE)word_1000100B4)
                              {
                                v525 = 0;
LABEL_473:
                                if (BYTE1(dword_1000100B0))
                                {
                                  uint64_t v1 = (uint64_t)v122;
                                  *((_DWORD *)v122 + 3) = 0;
                                  goto LABEL_506;
                                }
                                v714 = 0u;
                                v715 = 0u;
                                v712 = 0u;
                                v713 = 0u;
                                v710 = 0u;
                                v711 = 0u;
                                memset(cStr, 0, sizeof(cStr));
                                if (!byte_100010010)
                                {
                                  v550 = v122[3];
                                  *(void *)&outputStructCnt = 128;
                                  v546 = IOConnectCallMethod(*((_DWORD *)v550 + 5), 2u, 0, 0, &qword_1000100B8, 0x48uLL, 0, 0, cStr, (size_t *)&outputStructCnt);
                                  if (qword_100010218) {
                                    v557 = qword_100010218;
                                  }
                                  else {
                                    v557 = &_os_log_default;
                                  }
                                  sub_100008124(v557, "WiFiUserClientPrepareMapping return %x firmwarebuffer len %lld nvrambuffer len %lld reg len %lld signatureBuffer len %lld platcfgBuffer len %lld\n", v551, v552, v553, v554, v555, v556, v546);
                                  if (dword_100010220)
                                  {
                                    *(void *)&v558 = 0xAAAAAAAAAAAAAAAALL;
                                    *((void *)&v558 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                    v699 = v558;
                                    v700 = v558;
                                    v697 = v558;
                                    v698 = v558;
                                    v695 = v558;
                                    v696 = v558;
                                    outputStructCnt = v558;
                                    v694 = v558;
                                    size[0] = 0xAAAAAAAAAAAAAAAALL;
                                    time((time_t *)size);
                                    v559 = localtime((const time_t *)size);
                                    strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v559);
                                    dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                                    dprintf(dword_100010220, "WiFiUserClientPrepareMapping return %x firmwarebuffer len %lld nvrambuffer len %lld reg len %lld signatureBuffer len %lld platcfgBuffer len %lld\n", v546, *(void *)&cStr[8], (void)v710, *((void *)&v713 + 1), (void)v711, (void)v712);
                                  }
                                  goto LABEL_504;
                                }
                                *(void *)&long long v538 = 0xAAAAAAAAAAAAAAAALL;
                                *((void *)&v538 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                v699 = v538;
                                v700 = v538;
                                v697 = v538;
                                v698 = v538;
                                v695 = v538;
                                v696 = v538;
                                outputStructCnt = v538;
                                v694 = v538;
                                CFArrayRef v539 = v122[3];
                                size[0] = 128;
                                v546 = IOConnectCallMethod(*((_DWORD *)v539 + 5), 2u, 0, 0, &qword_1000100B8, 0x48uLL, 0, 0, &outputStructCnt, size);
                                if (qword_100010218) {
                                  v547 = qword_100010218;
                                }
                                else {
                                  v547 = &_os_log_default;
                                }
                                sub_100008124(v547, "WiFiUserClientPrepareMappingDK return %x firmware len %lld nvram len %lld reg len %lld txcap len %lld signature len %lld platcfg len %lld\n", v540, v541, v542, v543, v544, v545, v546);
                                if (dword_100010220)
                                {
                                  *(void *)&v548 = 0xAAAAAAAAAAAAAAAALL;
                                  *((void *)&v548 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                  v692 = v548;
                                  v690 = v548;
                                  v691 = v548;
                                  *(_OWORD *)&v688[16] = v548;
                                  v689 = v548;
                                  v687 = v548;
                                  *(_OWORD *)v688 = v548;
                                  *(_OWORD *)size = v548;
                                  length = 0xAAAAAAAAAAAAAAAALL;
                                  time(&length);
                                  v549 = localtime(&length);
                                  strftime((char *)size, 0x80uLL, "%b %d %H:%M:%S", v549);
                                  dprintf(dword_100010220, "%s ", (const char *)size);
                                  dprintf(dword_100010220, "WiFiUserClientPrepareMappingDK return %x firmware len %lld nvram len %lld reg len %lld txcap len %lld signature len %lld platcfg len %lld\n", v546, *((void *)&outputStructCnt + 1), (void)v695, *((void *)&v698 + 1), (void)v700, (void)v696, (void)v697);
                                }
                                if (*((void *)&outputStructCnt + 1))
                                {
                                  if (DWORD1(outputStructCnt)) {
                                    goto LABEL_627;
                                  }
                                  *(void *)cStr = sub_100007B98(*((_DWORD *)v122[3] + 5), outputStructCnt, (mach_vm_size_t *)&cStr[8]);
                                  *(_DWORD *)&cStr[16] = v694;
                                }
                                if ((void)v695)
                                {
                                  if (HIDWORD(v694)) {
                                    goto LABEL_627;
                                  }
                                  *(void *)&cStr[24] = sub_100007B98(*((_DWORD *)v122[3] + 5), DWORD2(v694), (mach_vm_size_t *)&v710);
                                }
                                if (*((void *)&v698 + 1))
                                {
                                  if (DWORD1(v698)) {
                                    goto LABEL_627;
                                  }
                                  *(void *)&v713 = sub_100007B98(*((_DWORD *)v122[3] + 5), v698, (mach_vm_size_t *)&v713 + 1);
                                  LOBYTE(v714) = v699;
                                }
                                if ((void)v700)
                                {
                                  if (HIDWORD(v699)) {
                                    goto LABEL_627;
                                  }
                                  *((void *)&v714 + 1) = sub_100007B98(*((_DWORD *)v122[3] + 5), DWORD2(v699), (mach_vm_size_t *)&v715);
                                  BYTE8(v715) = BYTE8(v700);
                                }
                                if (!(void)v696)
                                {
LABEL_496:
                                  if (!(void)v697)
                                  {
LABEL_504:
                                    if (!v546)
                                    {
                                      if (sub_1000083E8(v412, *(void **)cStr, (off_t *)&cStr[8]))
                                      {
                                        if (*((void *)&v713 + 1)
                                          && (void)v713
                                          && (sub_1000083E8(v508, (void *)v713, (off_t *)&v713 + 1) & 1) == 0)
                                        {
LABEL_601:
                                          if (qword_100010218) {
                                            v647 = qword_100010218;
                                          }
                                          else {
                                            v647 = &_os_log_default;
                                          }
                                          sub_100008124(v647, "copy RegTable to image map fail\n", v152, v153, v154, v155, v156, v157, outputStructc);
                                          if (dword_100010220)
                                          {
                                            *(void *)&v648 = 0xAAAAAAAAAAAAAAAALL;
                                            *((void *)&v648 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                            v699 = v648;
                                            v700 = v648;
                                            v697 = v648;
                                            v698 = v648;
                                            v695 = v648;
                                            v696 = v648;
                                            outputStructCnt = v648;
                                            v694 = v648;
                                            size[0] = 0xAAAAAAAAAAAAAAAALL;
                                            time((time_t *)size);
                                            v649 = localtime((const time_t *)size);
                                            strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v649);
                                            dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                                            dprintf(dword_100010220, "copy RegTable to image map fail\n");
                                          }
                                        }
                                        else if ((void)v715 {
                                               && *((void *)&v714 + 1)
                                        }
                                               && (sub_1000083E8(v525, *((void **)&v714 + 1), (off_t *)&v715) & 1) == 0)
                                        {
                                          if (qword_100010218) {
                                            v650 = qword_100010218;
                                          }
                                          else {
                                            v650 = &_os_log_default;
                                          }
                                          sub_100008124(v650, "copy txCapTable to image map fail\n", v599, v600, v601, v602, v603, v604, outputStructc);
                                          if (dword_100010220)
                                          {
                                            *(void *)&v651 = 0xAAAAAAAAAAAAAAAALL;
                                            *((void *)&v651 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                            v699 = v651;
                                            v700 = v651;
                                            v697 = v651;
                                            v698 = v651;
                                            v695 = v651;
                                            v696 = v651;
                                            outputStructCnt = v651;
                                            v694 = v651;
                                            size[0] = 0xAAAAAAAAAAAAAAAALL;
                                            time((time_t *)size);
                                            v652 = localtime((const time_t *)size);
                                            strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v652);
                                            dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                                            dprintf(dword_100010220, "copy txCapTable to image map fail\n");
                                          }
                                        }
                                        else
                                        {
                                          uint64_t v1 = (uint64_t)v122;
                                          if ((void)v710
                                            && *(void *)&cStr[24]
                                            && (sub_1000083E8(v504, *(void **)&cStr[24], (off_t *)&v710) & 1) == 0)
                                          {
                                            if (qword_100010218) {
                                              v653 = qword_100010218;
                                            }
                                            else {
                                              v653 = &_os_log_default;
                                            }
                                            sub_100008124(v653, "copy NVRAM to image map fail\n", v605, v606, v607, v608, v609, v610, outputStructc);
                                            if (dword_100010220)
                                            {
                                              *(void *)&v654 = 0xAAAAAAAAAAAAAAAALL;
                                              *((void *)&v654 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                              v699 = v654;
                                              v700 = v654;
                                              v697 = v654;
                                              v698 = v654;
                                              v695 = v654;
                                              v696 = v654;
                                              outputStructCnt = v654;
                                              v694 = v654;
                                              size[0] = 0xAAAAAAAAAAAAAAAALL;
                                              time((time_t *)size);
                                              v655 = localtime((const time_t *)size);
                                              strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v655);
                                              dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                                              dprintf(dword_100010220, "copy NVRAM to image map fail\n");
                                            }
                                          }
                                          else
                                          {
                                            v251 = &stru_100010000;
                                            if ((void)v711
                                              && *((void *)&v710 + 1)
                                              && (sub_1000083E8(allocatora, *((void **)&v710 + 1), (off_t *)&v711) & 1) == 0)
                                            {
                                              v122 = (const __CFArray **)v1;
                                              if (qword_100010218) {
                                                v656 = qword_100010218;
                                              }
                                              else {
                                                v656 = &_os_log_default;
                                              }
                                              sub_100008124(v656, "copy Signature to image map fail\n", v611, v612, v613, v614, v615, v616, outputStructc);
                                              if (dword_100010220)
                                              {
                                                *(void *)&v657 = 0xAAAAAAAAAAAAAAAALL;
                                                *((void *)&v657 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                                v699 = v657;
                                                v700 = v657;
                                                v697 = v657;
                                                v698 = v657;
                                                v695 = v657;
                                                v696 = v657;
                                                outputStructCnt = v657;
                                                v694 = v657;
                                                size[0] = 0xAAAAAAAAAAAAAAAALL;
                                                time((time_t *)size);
                                                v658 = localtime((const time_t *)size);
                                                strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v658);
                                                dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                                                dprintf(dword_100010220, "copy Signature to image map fail\n");
                                              }
                                            }
                                            else
                                            {
                                              if (!(void)v712
                                                || !*((void *)&v711 + 1)
                                                || (sub_1000083E8(v682, *((void **)&v711 + 1), (off_t *)&v712) & 1) != 0)
                                              {
                                                *(_DWORD *)&cStr[16] = dword_1000100B0;
                                                LOBYTE(v714) = HIBYTE(dword_1000100B0);
                                                BYTE8(v712) = HIBYTE(word_1000100B4);
                                                BYTE8(v715) = word_1000100B4;
                                                v629 = IOConnectCallMethod(*(_DWORD *)(*(void *)(v1 + 24) + 20), 3u, 0, 0, cStr, 0x80uLL, 0, 0, 0, 0);
                                                if (qword_100010218) {
                                                  v630 = qword_100010218;
                                                }
                                                else {
                                                  v630 = &_os_log_default;
                                                }
                                                sub_100008124(v630, "WiFiUserClientCompleteMapping return %x\n", v623, v624, v625, v626, v627, v628, v629);
                                                if (dword_100010220)
                                                {
                                                  *(void *)&v631 = 0xAAAAAAAAAAAAAAAALL;
                                                  *((void *)&v631 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                                  v699 = v631;
                                                  v700 = v631;
                                                  v697 = v631;
                                                  v698 = v631;
                                                  v695 = v631;
                                                  v696 = v631;
                                                  outputStructCnt = v631;
                                                  v694 = v631;
                                                  size[0] = 0xAAAAAAAAAAAAAAAALL;
                                                  time((time_t *)size);
                                                  v632 = localtime((const time_t *)size);
                                                  strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v632);
                                                  dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                                                  dprintf(dword_100010220, "WiFiUserClientCompleteMapping return %x\n", v629);
                                                }
                                                if (v629) {
                                                  goto LABEL_507;
                                                }
                                                goto LABEL_306;
                                              }
                                              v122 = (const __CFArray **)v1;
                                              if (qword_100010218) {
                                                v659 = qword_100010218;
                                              }
                                              else {
                                                v659 = &_os_log_default;
                                              }
                                              sub_100008124(v659, "copy PLatcfg to image map fail\n", v617, v618, v619, v620, v621, v622, outputStructc);
                                              if (dword_100010220)
                                              {
                                                *(void *)&v660 = 0xAAAAAAAAAAAAAAAALL;
                                                *((void *)&v660 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                                v699 = v660;
                                                v700 = v660;
                                                v697 = v660;
                                                v698 = v660;
                                                v695 = v660;
                                                v696 = v660;
                                                outputStructCnt = v660;
                                                v694 = v660;
                                                size[0] = 0xAAAAAAAAAAAAAAAALL;
                                                time((time_t *)size);
                                                v661 = localtime((const time_t *)size);
                                                strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v661);
                                                dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                                                dprintf(dword_100010220, "copy PLatcfg to image map fail\n");
                                              }
                                            }
                                          }
                                        }
                                      }
                                      else
                                      {
                                        if (qword_100010218) {
                                          v644 = qword_100010218;
                                        }
                                        else {
                                          v644 = &_os_log_default;
                                        }
                                        sub_100008124(v644, "copy FW to image map fail\n", v593, v594, v595, v596, v597, v598, outputStructc);
                                        if (dword_100010220)
                                        {
                                          *(void *)&v645 = 0xAAAAAAAAAAAAAAAALL;
                                          *((void *)&v645 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                          v699 = v645;
                                          v700 = v645;
                                          v697 = v645;
                                          v698 = v645;
                                          v695 = v645;
                                          v696 = v645;
                                          outputStructCnt = v645;
                                          v694 = v645;
                                          size[0] = 0xAAAAAAAAAAAAAAAALL;
                                          time((time_t *)size);
                                          v646 = localtime((const time_t *)size);
                                          strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v646);
                                          dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                                          dprintf(dword_100010220, "copy FW to image map fail\n");
                                        }
                                      }
                                    }
                                    uint64_t v1 = (uint64_t)v122;
LABEL_506:
                                    v251 = &stru_100010000;
                                    goto LABEL_507;
                                  }
                                  if (!HIDWORD(v696))
                                  {
                                    *((void *)&v711 + 1) = sub_100007B98(*((_DWORD *)v122[3] + 5), DWORD2(v696), (mach_vm_size_t *)&v712);
                                    BYTE8(v712) = BYTE8(v697);
                                    goto LABEL_504;
                                  }
                                  goto LABEL_627;
                                }
                                if (!HIDWORD(v695))
                                {
                                  *((void *)&v710 + 1) = sub_100007B98(*((_DWORD *)v122[3] + 5), DWORD2(v695), (mach_vm_size_t *)&v711);
                                  goto LABEL_496;
                                }
LABEL_627:
                                __break(0x5507u);
                                goto LABEL_628;
                              }
                              if ((void)xmmword_100010090) {
                                CFStringRef v526 = CFStringCreateMutableCopy(v3, 255, (CFStringRef)xmmword_100010090);
                              }
                              else {
                                CFStringRef v526 = sub_100008C00(v122[4], @"TxCap", cStr, v675);
                              }
                              v525 = (const char *)v526;
                              if (BYTE1(dword_1000100B0))
                              {
                                if (v526) {
                                  v527 = CFStringGetCStringPtr(v526, 0);
                                }
                                else {
                                  v527 = 0;
                                }
                                v528 = (const char *)&unk_10000AE43;
                                if (v527) {
                                  v528 = v527;
                                }
                                fprintf(__stdoutp, "Resolved to TxCap file path: \"%s\"\n", v528);
                              }
                              v122[11] = (const __CFArray *)v525;
                              if (!v525) {
                                goto LABEL_473;
                              }
                              v525 = CFStringGetCStringPtr((CFStringRef)v525, 0);
                              if (qword_100010218) {
                                v535 = qword_100010218;
                              }
                              else {
                                v535 = &_os_log_default;
                              }
                              sub_100008124(v535, "full path TxCap is %s\n", v529, v530, v531, v532, v533, v534, (char)v525);
                              if (dword_100010220)
                              {
                                *(void *)&long long v536 = 0xAAAAAAAAAAAAAAAALL;
                                *((void *)&v536 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                v714 = v536;
                                v715 = v536;
                                v712 = v536;
                                v713 = v536;
                                v710 = v536;
                                v711 = v536;
                                *(_OWORD *)cStr = v536;
                                *(_OWORD *)&cStr[16] = v536;
                                *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
                                time((time_t *)&outputStructCnt);
                                v537 = localtime((const time_t *)&outputStructCnt);
                                strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v537);
                                dprintf(dword_100010220, "%s ", cStr);
                                dprintf(dword_100010220, "full path TxCap is %s\n", v525);
                              }
                              if ((sub_100007CC0(v525, &qword_1000100D8) & 1) != 0
                                && (unint64_t)qword_1000100D8 < 0x8000
                                && (unint64_t)qword_1000100D8 > 0x20)
                              {
                                goto LABEL_473;
                              }
LABEL_590:
                              uint64_t v1 = (uint64_t)v122;
                              IOConnectCallScalarMethod(*((_DWORD *)v122[3] + 5), 4u, 0, 0, 0, 0);
                              goto LABEL_506;
                            }
                            CFMutableStringRef v509 = sub_100008C00(*(const __CFArray **)(v1 + 32), @"Regulatory", &qword_1000100F8, v675);
                          }
                          CFStringRef v510 = v509;
                          goto LABEL_433;
                        }
                      }
LABEL_383:
                      IOConnectCallScalarMethod(*(_DWORD *)(*(void *)(v1 + 24) + 20), 4u, 0, 0, 0, 0);
                      goto LABEL_507;
                    }
                  }
                  CFStringRef v494 = CFStringCreateMutableCopy(v3, 255, v490);
                  goto LABEL_409;
                }
              }
              CFStringRef v472 = CFStringCreateMutableCopy(v3, 255, v469);
              goto LABEL_387;
            }
          }
          else
          {
            CFStringRef v419 = (const __CFString *)qword_100010080;
            if (!qword_100010080)
            {
LABEL_365:
              CFStringRef v423 = sub_100008C00(v416, @"Signature", &qword_1000100C0, v675);
              goto LABEL_366;
            }
          }
          CFStringRef v423 = CFStringCreateMutableCopy(v3, 255, v419);
          goto LABEL_366;
        }
        if (qword_100010218) {
          v280 = qword_100010218;
        }
        else {
          v280 = &_os_log_default;
        }
        if (BYTE1(dword_1000100B0))
        {
          sub_100008124(v280, "%s: showFilesOnly mode does not need FDR.\n", v272, v273, v274, v275, v276, v277, (char)"handleFdr");
          if (dword_100010220)
          {
            *(void *)&long long v287 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v287 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v714 = v287;
            v715 = v287;
            v712 = v287;
            v713 = v287;
            v710 = v287;
            v711 = v287;
            *(_OWORD *)cStr = v287;
            *(_OWORD *)&cStr[16] = v287;
            *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)&outputStructCnt);
            v288 = localtime((const time_t *)&outputStructCnt);
            strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v288);
            dprintf(dword_100010220, "%s ", cStr);
            dprintf(dword_100010220, "%s: showFilesOnly mode does not need FDR.\n");
          }
          goto LABEL_295;
        }
        sub_100008124(v280, "%s enter\n", v272, v273, v274, v275, v276, v277, (char)"getFDRCal");
        if (dword_100010220)
        {
          *(void *)&long long v298 = 0xAAAAAAAAAAAAAAAALL;
          *((void *)&v298 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v714 = v298;
          v715 = v298;
          v712 = v298;
          v713 = v298;
          v710 = v298;
          v711 = v298;
          *(_OWORD *)cStr = v298;
          *(_OWORD *)&cStr[16] = v298;
          *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
          time((time_t *)&outputStructCnt);
          v299 = localtime((const time_t *)&outputStructCnt);
          strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v299);
          dprintf(dword_100010220, "%s ", cStr);
          dprintf(dword_100010220, "%s enter\n", "getFDRCal");
        }
        LODWORD(v684) = 0;
        if (qword_100010218) {
          v300 = qword_100010218;
        }
        else {
          v300 = &_os_log_default;
        }
        sub_100008124(v300, "%s enter\n", v292, v293, v294, v295, v296, v297, (char)"findHwIdentifiersPolling");
        *(void *)&long long v301 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v301 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v714 = v301;
        v715 = v301;
        v712 = v301;
        v713 = v301;
        v710 = v301;
        v711 = v301;
        *(_OWORD *)cStr = v301;
        *(_OWORD *)&cStr[16] = v301;
        if (dword_100010220)
        {
          v699 = v301;
          v700 = v301;
          v697 = v301;
          v698 = v301;
          v695 = v301;
          v696 = v301;
          outputStructCnt = v301;
          v694 = v301;
          size[0] = 0xAAAAAAAAAAAAAAAALL;
          time((time_t *)size);
          v302 = localtime((const time_t *)size);
          strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v302);
          dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
          dprintf(dword_100010220, "%s enter\n", "findHwIdentifiersPolling");
        }
        streama = IORegistryGetRootEntry(kIOMainPortDefault);
        if (!streama || IORegistryCreateIterator(kIOMainPortDefault, "IOService", 0, (io_iterator_t *)&v684))
        {
          v681 = 1;
          v251 = &stru_100010000;
        }
        else
        {
          v673 = v1;
          int v309 = 1;
          v681 = 1;
          while (1)
          {
            io_object_t v310 = IOIteratorNext(v684);
            if (!v310) {
              break;
            }
            io_registry_entry_t v311 = v310;
            strcpy(cStr, "IOPlatformExpertDevice");
            if (IOObjectConformsTo(v310, cStr))
            {
              do
              {
                if (qword_100010218) {
                  v318 = qword_100010218;
                }
                else {
                  v318 = &_os_log_default;
                }
                sub_100008124(v318, "%s Find HWIdentifiers...%d\n", v312, v313, v314, v315, v316, v317, (char)"findHwIdentifiersPolling");
                if (dword_100010220)
                {
                  *(void *)&long long v319 = 0xAAAAAAAAAAAAAAAALL;
                  *((void *)&v319 + 1) = 0xAAAAAAAAAAAAAAAALL;
                  v699 = v319;
                  v700 = v319;
                  v697 = v319;
                  v698 = v319;
                  v695 = v319;
                  v696 = v319;
                  outputStructCnt = v319;
                  v694 = v319;
                  size[0] = 0xAAAAAAAAAAAAAAAALL;
                  time((time_t *)size);
                  v320 = localtime((const time_t *)size);
                  strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v320);
                  dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                  dprintf(dword_100010220, "%s Find HWIdentifiers...%d\n", "findHwIdentifiersPolling", v309);
                }
                CFDictionaryRef v321 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(v311, "IOService", @"HWIdentifiers", v3, 1u);
                CFDictionaryRef v322 = v321;
                if (v309 <= 2 && !v321) {
                  usleep(0x222E0u);
                }
                int v323 = v309 + 1;
                if (__OFADD__(v309, 1)) {
                  __break(0x5500u);
                }
                if (v323 > 3) {
                  break;
                }
                ++v309;
              }
              while (!v322);
              if (v322)
              {
                CFStringRef v324 = (const __CFString *)CFDictionaryGetValue(v322, @"P");
                *(void *)&long long v325 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v325 + 1) = 0xAAAAAAAAAAAAAAAALL;
                *(_OWORD *)&v688[12] = v325;
                v687 = v325;
                *(_OWORD *)v688 = v325;
                *(_OWORD *)size = v325;
                CFStringGetCString(v324, (char *)size, 60, 0x8000100u);
                CFNumberRef v326 = (const __CFNumber *)CFDictionaryGetValue(v322, @"C");
                LODWORD(valuePtr) = -1431655766;
                CFNumberGetValue(v326, kCFNumberIntType, &valuePtr);
                if (qword_100010218) {
                  v333 = qword_100010218;
                }
                else {
                  v333 = &_os_log_default;
                }
                sub_100008124(v333, "%s HWIdentifiers: chipNumber %d platformName %s\n", v327, v328, v329, v330, v331, v332, (char)"findHwIdentifiersPolling");
                if (dword_100010220)
                {
                  *(void *)&long long v334 = 0xAAAAAAAAAAAAAAAALL;
                  *((void *)&v334 + 1) = 0xAAAAAAAAAAAAAAAALL;
                  v699 = v334;
                  v700 = v334;
                  v697 = v334;
                  v698 = v334;
                  v695 = v334;
                  v696 = v334;
                  outputStructCnt = v334;
                  v694 = v334;
                  length = 0xAAAAAAAAAAAAAAAALL;
                  time(&length);
                  v335 = localtime(&length);
                  strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v335);
                  dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                  dprintf(dword_100010220, "%s HWIdentifiers: chipNumber %d platformName %s\n", "findHwIdentifiersPolling", valuePtr, (const char *)size);
                }
                v681 = 0;
              }
              else
              {
                if (qword_100010218) {
                  v336 = qword_100010218;
                }
                else {
                  v336 = &_os_log_default;
                }
                sub_100008124(v336, "%s No %s in ioreg\n", v312, v313, v314, v315, v316, v317, (char)"findHwIdentifiersPolling");
                if (dword_100010220)
                {
                  *(void *)&long long v337 = 0xAAAAAAAAAAAAAAAALL;
                  *((void *)&v337 + 1) = 0xAAAAAAAAAAAAAAAALL;
                  v699 = v337;
                  v700 = v337;
                  v697 = v337;
                  v698 = v337;
                  v695 = v337;
                  v696 = v337;
                  outputStructCnt = v337;
                  v694 = v337;
                  size[0] = 0xAAAAAAAAAAAAAAAALL;
                  time((time_t *)size);
                  v338 = localtime((const time_t *)size);
                  strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v338);
                  dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                  dprintf(dword_100010220, "%s No %s in ioreg\n", "findHwIdentifiersPolling", "HWIdentifiers");
                }
              }
              IOObjectRelease(v311);
              int v309 = v323;
            }
          }
          uint64_t v1 = v673;
          if (v309 >= 3) {
            IORegistryEntrySetCFProperty(*(_DWORD *)(v673 + 8), @"HWIdentifiersLate", kCFBooleanTrue);
          }
          v251 = &stru_100010000;
        }
        if (v684) {
          IOObjectRelease(v684);
        }
        if (streama) {
          IOObjectRelease(streama);
        }
        if (!v681)
        {
          if (qword_100010218) {
            v425 = qword_100010218;
          }
          else {
            v425 = &_os_log_default;
          }
          sub_100008124(v425, "%s dataClass %s\n", v303, v304, v305, v306, v307, v308, (char)"getFDRCal");
          if (dword_100010220)
          {
            *(void *)&long long v426 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v426 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v714 = v426;
            v715 = v426;
            v712 = v426;
            v713 = v426;
            v710 = v426;
            v711 = v426;
            *(_OWORD *)cStr = v426;
            *(_OWORD *)&cStr[16] = v426;
            *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)&outputStructCnt);
            v427 = localtime((const time_t *)&outputStructCnt);
            strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v427);
            dprintf(dword_100010220, "%s ", cStr);
            dprintf(dword_100010220, "%s dataClass %s\n", "getFDRCal", "BWCl");
          }
          CFStringRef v428 = CFStringCreateWithCString(0, "BWCl", 0);
          *(void *)&outputStructCnt = 0;
          CFDictionaryRef v435 = (const __CFDictionary *)AMFDRSealingMapCopyLocalDictForClass();
          v436 = (const void *)outputStructCnt;
          int v437 = 1;
          if (v435 && !(void)outputStructCnt)
          {
            if (qword_100010218) {
              v438 = qword_100010218;
            }
            else {
              v438 = &_os_log_default;
            }
            sub_100008124(v438, "%s successful fdr\n", v429, v430, v431, v432, v433, v434, (char)"getFDRCal");
            if (dword_100010220)
            {
              *(void *)&long long v439 = 0xAAAAAAAAAAAAAAAALL;
              *((void *)&v439 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v714 = v439;
              v715 = v439;
              v712 = v439;
              v713 = v439;
              v710 = v439;
              v711 = v439;
              *(_OWORD *)cStr = v439;
              *(_OWORD *)&cStr[16] = v439;
              size[0] = 0xAAAAAAAAAAAAAAAALL;
              time((time_t *)size);
              v440 = localtime((const time_t *)size);
              strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v440);
              dprintf(dword_100010220, "%s ", cStr);
              dprintf(dword_100010220, "%s successful fdr\n", "getFDRCal");
            }
            v447 = CFDictionaryGetValue(v435, @"WCAL");
            if (qword_100010218) {
              v448 = qword_100010218;
            }
            else {
              v448 = &_os_log_default;
            }
            if (v447)
            {
              sub_100008124(v448, "%s add fdr cal\n", v441, v442, v443, v444, v445, v446, (char)"getFDRCal");
              if (dword_100010220)
              {
                *(void *)&long long v449 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v449 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v714 = v449;
                v715 = v449;
                v712 = v449;
                v713 = v449;
                v710 = v449;
                v711 = v449;
                *(_OWORD *)cStr = v449;
                *(_OWORD *)&cStr[16] = v449;
                size[0] = 0xAAAAAAAAAAAAAAAALL;
                time((time_t *)size);
                v450 = localtime((const time_t *)size);
                strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v450);
                dprintf(dword_100010220, "%s ", cStr);
                dprintf(dword_100010220, "%s add fdr cal\n", "getFDRCal");
              }
              IORegistryEntrySetCFProperty(*(_DWORD *)(v1 + 8), @"WiFiFdrCal", v447);
              int v437 = 0;
              CFAllocatorRef v3 = allocator;
            }
            else
            {
              sub_100008124(v448, "%s failed dict get value\n", v441, v442, v443, v444, v445, v446, (char)"getFDRCal");
              if (dword_100010220)
              {
                *(void *)&v633 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v633 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v714 = v633;
                v715 = v633;
                v712 = v633;
                v713 = v633;
                v710 = v633;
                v711 = v633;
                *(_OWORD *)cStr = v633;
                *(_OWORD *)&cStr[16] = v633;
                size[0] = 0xAAAAAAAAAAAAAAAALL;
                time((time_t *)size);
                v634 = localtime((const time_t *)size);
                strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v634);
                dprintf(dword_100010220, "%s ", cStr);
                dprintf(dword_100010220, "%s failed dict get value\n", "getFDRCal");
              }
              int v437 = 1;
              CFAllocatorRef v3 = allocator;
            }
            v436 = (const void *)outputStructCnt;
          }
          if (v436) {
            CFRelease(v436);
          }
          *(void *)&outputStructCnt = 0;
          if (v428) {
            CFRelease(v428);
          }
          if (v435) {
            CFRelease(v435);
          }
          CFRelease(@"WCAL");
          if (!v437)
          {
            v352 = "fdr";
            goto LABEL_288;
          }
          if (qword_100010218) {
            v641 = qword_100010218;
          }
          else {
            v641 = &_os_log_default;
          }
          sub_100008124(v641, "%s failed\n", v635, v636, v637, v638, v639, v640, (char)"getFDRCal");
          if (dword_100010220)
          {
            *(void *)&v642 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v642 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v714 = v642;
            v715 = v642;
            v712 = v642;
            v713 = v642;
            v710 = v642;
            v711 = v642;
            *(_OWORD *)cStr = v642;
            *(_OWORD *)&cStr[16] = v642;
            *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)&outputStructCnt);
            v643 = localtime((const time_t *)&outputStructCnt);
            strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v643);
            dprintf(dword_100010220, "%s ", cStr);
            dprintf(dword_100010220, "%s failed\n", "getFDRCal");
          }
        }
        v722 = 0u;
        v723 = 0u;
        v720 = 0u;
        v721 = 0u;
        v718 = 0u;
        v719 = 0u;
        v716 = 0u;
        v717 = 0u;
        v714 = 0u;
        v715 = 0u;
        v712 = 0u;
        v713 = 0u;
        v710 = 0u;
        v711 = 0u;
        memset(cStr, 0, sizeof(cStr));
        length = 0;
        v707 = 0u;
        v708 = 0u;
        v705 = 0u;
        v706 = 0u;
        v703 = 0u;
        v704 = 0u;
        v701 = 0u;
        v702 = 0u;
        v699 = 0u;
        v700 = 0u;
        v697 = 0u;
        v698 = 0u;
        v695 = 0u;
        v696 = 0u;
        outputStructCnt = 0u;
        v694 = 0u;
        if (byte_100010010)
        {
LABEL_287:
          v352 = "genCal";
          goto LABEL_288;
        }
        if (!sub_1000060C8(v1, cStr, "cal"))
        {
          if (sub_100007CC0(cStr, &length))
          {
            if ((unint64_t)(length - 0x2000) >= 0xFFFFFFFFFFFFE081)
            {
              v339 = (UInt8 *)malloc_type_malloc(length, 0xDBEE3B7BuLL);
              if (v339)
              {
                v340 = v339;
                v684 = length;
                if (sub_1000083E8(cStr, v339, &v684))
                {
                  CFDataRef v341 = CFDataCreateWithBytesNoCopy(v3, v340, v684, kCFAllocatorNull);
                  if (v341)
                  {
                    CFDataRef v348 = v341;
                    if (qword_100010218) {
                      v349 = qword_100010218;
                    }
                    else {
                      v349 = &_os_log_default;
                    }
                    sub_100008124(v349, "%s writes %s size %zu to %s\n", v342, v343, v344, v345, v346, v347, (char)"getGenericCalibrationData");
                    if (dword_100010220)
                    {
                      *(void *)&long long v350 = 0xAAAAAAAAAAAAAAAALL;
                      *((void *)&v350 + 1) = 0xAAAAAAAAAAAAAAAALL;
                      v692 = v350;
                      v690 = v350;
                      v691 = v350;
                      *(_OWORD *)&v688[16] = v350;
                      v689 = v350;
                      v687 = v350;
                      *(_OWORD *)v688 = v350;
                      *(_OWORD *)size = v350;
                      valuePtr = 0xAAAAAAAAAAAAAAAALL;
                      time(&valuePtr);
                      v351 = localtime(&valuePtr);
                      strftime((char *)size, 0x80uLL, "%b %d %H:%M:%S", v351);
                      dprintf(dword_100010220, "%s ", (const char *)size);
                      dprintf(dword_100010220, "%s writes %s size %zu to %s\n", "getGenericCalibrationData", cStr, length, "wifi-calibration-gen");
                    }
                    IORegistryEntrySetCFProperty(*(_DWORD *)(v1 + 8), @"WiFiGenericCal", v348);
                    CFAllocatorRef v3 = allocator;
                    if (!sub_1000060C8(v1, (char *)&outputStructCnt, "clmb"))
                    {
                      HIBYTE(dword_1000100B0) = 1;
                      qword_100010088 = (uint64_t)CFStringCreateWithCString(0, (const char *)&outputStructCnt, 0);
                      free(v340);
                      goto LABEL_287;
                    }
                  }
                }
                free(v340);
              }
            }
          }
        }
        v352 = "unavailable";
LABEL_288:
        size_t v353 = strlen(v352);
        CFStringRef v360 = CFStringCreateWithBytes(v3, (const UInt8 *)v352, v353, 0x8000100u, 0);
        if (qword_100010218) {
          v361 = qword_100010218;
        }
        else {
          v361 = &_os_log_default;
        }
        if (v360)
        {
          sub_100008124(v361, "%s add msfSource %s\n", v354, v355, v356, v357, v358, v359, (char)"handleFdr");
          if (dword_100010220)
          {
            *(void *)&long long v362 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v362 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v714 = v362;
            v715 = v362;
            v712 = v362;
            v713 = v362;
            v710 = v362;
            v711 = v362;
            *(_OWORD *)cStr = v362;
            *(_OWORD *)&cStr[16] = v362;
            *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)&outputStructCnt);
            v363 = localtime((const time_t *)&outputStructCnt);
            strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v363);
            dprintf(dword_100010220, "%s ", cStr);
            dprintf(dword_100010220, "%s add msfSource %s\n", "handleFdr", v352);
          }
          IORegistryEntrySetCFProperty(*(_DWORD *)(v1 + 8), @"WiFiMSFSource", v360);
        }
        else
        {
          sub_100008124(v361, "%s failed to create msfSourceRef\n", v354, v355, v356, v357, v358, v359, (char)"handleFdr");
          if (dword_100010220)
          {
            *(void *)&long long v451 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v451 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v714 = v451;
            v715 = v451;
            v712 = v451;
            v713 = v451;
            v710 = v451;
            v711 = v451;
            *(_OWORD *)cStr = v451;
            *(_OWORD *)&cStr[16] = v451;
            *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)&outputStructCnt);
            v452 = localtime((const time_t *)&outputStructCnt);
            strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v452);
            dprintf(dword_100010220, "%s ", cStr);
            dprintf(dword_100010220, "%s failed to create msfSourceRef\n");
          }
        }
        goto LABEL_295;
      }
    }
    CFStringRef v261 = CFStringCreateMutableCopy(v3, 255, v258);
    goto LABEL_207;
  }
LABEL_507:
  if (*(_DWORD *)v251[32].__opaque)
  {
    if (dword_100010204)
    {
      if (qword_100010218) {
        v560 = qword_100010218;
      }
      else {
        v560 = &_os_log_default;
      }
      sub_100008124(v560, "wifiFirmwareLoaderServiceThread: delay[%u sec] - started\n", v245, v246, v247, v248, v249, v250, dword_100010204);
      if (dword_100010220)
      {
        *(void *)&v561 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v561 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v714 = v561;
        v715 = v561;
        v712 = v561;
        v713 = v561;
        v710 = v561;
        v711 = v561;
        *(_OWORD *)cStr = v561;
        *(_OWORD *)&cStr[16] = v561;
        *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&outputStructCnt);
        v562 = localtime((const time_t *)&outputStructCnt);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v562);
        dprintf(dword_100010220, "%s ", cStr);
        dprintf(dword_100010220, "wifiFirmwareLoaderServiceThread: delay[%u sec] - started\n", dword_100010204);
      }
      sleep(dword_100010204);
      if (qword_100010218) {
        v569 = qword_100010218;
      }
      else {
        v569 = &_os_log_default;
      }
      sub_100008124(v569, "wifiFirmwareLoaderServiceThread: delay[%u sec] - ended\n", v563, v564, v565, v566, v567, v568, dword_100010204);
      if (dword_100010220)
      {
        *(void *)&v570 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v570 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v714 = v570;
        v715 = v570;
        v712 = v570;
        v713 = v570;
        v710 = v570;
        v711 = v570;
        *(_OWORD *)cStr = v570;
        *(_OWORD *)&cStr[16] = v570;
        *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&outputStructCnt);
        v571 = localtime((const time_t *)&outputStructCnt);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v571);
        dprintf(dword_100010220, "%s ", cStr);
        dprintf(dword_100010220, "wifiFirmwareLoaderServiceThread: delay[%u sec] - ended\n", dword_100010204);
      }
    }
    v572 = *(_DWORD *)v251[32].__opaque;
    v579 = IOPMAssertionRelease(v572);
    *(_DWORD *)v251[32].__opaque = 0;
    if (qword_100010218) {
      v580 = qword_100010218;
    }
    else {
      v580 = &_os_log_default;
    }
    sub_100008124(v580, "wifiFirmwareLoaderServiceThread: _releaseIOPMHelperAssertionRelease return[0x%08x], id[0x%08x], release id[0x%08x]\n", v573, v574, v575, v576, v577, v578, v579);
    if (dword_100010220)
    {
      *(void *)&v581 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v581 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v714 = v581;
      v715 = v581;
      v712 = v581;
      v713 = v581;
      v710 = v581;
      v711 = v581;
      *(_OWORD *)cStr = v581;
      *(_OWORD *)&cStr[16] = v581;
      *(void *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&outputStructCnt);
      v582 = localtime((const time_t *)&outputStructCnt);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v582);
      dprintf(dword_100010220, "%s ", cStr);
      dprintf(dword_100010220, "wifiFirmwareLoaderServiceThread: _releaseIOPMHelperAssertionRelease return[0x%08x], id[0x%08x], release id[0x%08x]\n", v579, v572, *(_DWORD *)v251[32].__opaque);
    }
  }
  *(_DWORD *)(v1 + 16) = 2;
  v583 = *(const void **)(v1 + 24);
  if (v583) {
    CFRelease(v583);
  }
  *(void *)(v1 + 24) = 0;
  v584 = *(const void **)(v1 + 32);
  if (v584) {
    CFRelease(v584);
  }
  *(void *)(v1 + 32) = 0;
  v585 = *(const void **)(v1 + 40);
  if (v585) {
    CFRelease(v585);
  }
  *(void *)(v1 + 40) = 0;
  v586 = *(const void **)(v1 + 48);
  if (v586) {
    CFRelease(v586);
  }
  *(void *)(v1 + 48) = 0;
  v587 = *(const void **)(v1 + 64);
  if (v587) {
    CFRelease(v587);
  }
  *(void *)(v1 + 64) = 0;
  v588 = *(const void **)(v1 + 56);
  if (v588) {
    CFRelease(v588);
  }
  *(void *)(v1 + 56) = 0;
  v589 = *(const void **)(v1 + 80);
  if (v589) {
    CFRelease(v589);
  }
  *(void *)(v1 + 80) = 0;
  v590 = *(const void **)(v1 + 88);
  if (v590) {
    CFRelease(v590);
  }
  *(void *)(v1 + 88) = 0;
  v591 = *(const void **)(v1 + 96);
  if (v591) {
    CFRelease(v591);
  }
  *(void *)(v1 + 96) = 0;
  v592 = *(_DWORD *)(v1 + 8);
  if (v592)
  {
    IOObjectRelease(v592);
    *(_DWORD *)(v1 + 8) = 0;
  }
  CFRunLoopStop((CFRunLoopRef)qword_100010060);
}

uint64_t sub_1000060C8(uint64_t a1, char *a2, const char *a3)
{
  if (!CFStringGetCStringPtr(*(CFStringRef *)(a1 + 64), 0)) {
    return 1;
  }
  CFIndex Length = CFStringGetLength(*(CFStringRef *)(a1 + 64));
  if (__OFSUB__(Length, 4))
  {
    __break(0x5515u);
LABEL_12:
    __break(0x5500u);
  }
  size_t v7 = Length - 3;
  if (Length == 3) {
    goto LABEL_12;
  }
  char CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 64), 0);
  strlcpy(a2, CStringPtr, v7);
  strlcat(a2, "_gen.", 0xFFuLL);
  strlcat(a2, a3, 0xFFuLL);
  uint64_t v9 = qword_100010218;
  CFStringGetCStringPtr(*(CFStringRef *)(a1 + 64), 0);
  uint64_t v16 = &_os_log_default;
  if (v9) {
    uint64_t v16 = v9;
  }
  sub_100008124(v16, "%s %s from FW path %s\n", v10, v11, v12, v13, v14, v15, (char)"createGenericPath");
  if (dword_100010220)
  {
    *(void *)&long long v17 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v29 = v17;
    long long v30 = v17;
    long long v27 = v17;
    long long v28 = v17;
    long long v25 = v17;
    long long v26 = v17;
    *(_OWORD *)uint64_t v23 = v17;
    long long v24 = v17;
    time_t v22 = 0xAAAAAAAAAAAAAAAALL;
    time(&v22);
    uint64_t v18 = localtime(&v22);
    strftime(v23, 0x80uLL, "%b %d %H:%M:%S", v18);
    dprintf(dword_100010220, "%s ", v23);
    int v19 = dword_100010220;
    uint64_t v20 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 64), 0);
    dprintf(v19, "%s %s from FW path %s\n", "createGenericPath", a2, v20);
  }
  return 0;
}

uint64_t start(int a1, char *const *a2)
{
  xpc_set_event_stream_handler("com.apple.iokit.matching", 0, &stru_10000C448);
  errorbuf = 0;
  if (sandbox_init("wifiFirmwareLoader", 1uLL, &errorbuf) == -1)
  {
    fprintf(__stderrp, "wifiFirmwareLoader sandbox_init: \"%s\", attempting default compiled profile\n", errorbuf);
    sandbox_free_error(errorbuf);
    if (qword_100010218) {
      uint64_t v10 = qword_100010218;
    }
    else {
      uint64_t v10 = &_os_log_default;
    }
    sub_100008124(v10, "Sandboxing init issue, couldn't find profile in default paths, attempting default compiled profile", v4, v5, v6, v7, v8, v9, v238);
    if (dword_100010220)
    {
      *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v250 = v11;
      long long v251 = v11;
      long long v248 = v11;
      long long v249 = v11;
      long long v246 = v11;
      long long v247 = v11;
      *(_OWORD *)valuePtr = v11;
      long long v245 = v11;
      time_t v242 = 0xAAAAAAAAAAAAAAAALL;
      time(&v242);
      uint64_t v12 = localtime(&v242);
      strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v12);
      dprintf(dword_100010220, "%s ", valuePtr);
      dprintf(dword_100010220, "Sandboxing init issue, couldn't find profile in default paths, attempting default compiled profile");
    }
    if (sandbox_init("(version 1)(deny default)(import \"system.sb\")(allow file-read-metadata (literal \"/Library/Preferences\"))(allow file-read-data (literal \"/private/var/preferences/SystemConfiguration/com.apple.wifi.plist\"))(allow file-read-data (literal \"/Library/Managed Preferences/mobile/com.apple.wifiFirmwareLoader.plist\"))(allow mach-lookup (global-name \"com.apple.system.logger\"))(allow mach-lookup (global-name \"com.apple.system.notification_center\"))(allow mach-lookup (global-name \"com.apple.corecaptured\"))(allow mach-lookup (global-name \"com.apple.PowerManagement.control\"))(allow ipc-posix-shm-read-data (ipc-posix-name \"apple.shm.notification_center\"))(allow sysctl-read)(allow iokit-open (iokit-user-client-class \"IOUserUserClient\"))(allow iokit-open (iokit-user-client-class \"AppleBCMWLANUserClient\"))(allow iokit-open (iokit-user-client-class \"AppleKeyStoreUserClient\"))(allow iokit-set-properties (iokit-property \"PlatformConfig\"))(allow iokit-set-properties (iokit-property \"WiFiMSFCal\"))(allow iokit-set-properties (iokit-property \"WiFiFdrCal\"))(allow iokit-set-properties (iokit-property \"WiFiGenericCal\"))(allow iokit-set-properties (iokit-property \"WiFiMSFSource\"))(allow iokit-set-properties (iokit-property \"HWIdentifiersLate\"))(allow file-read* (subpath \"/usr/share/firmware/wifi\"))(allow file-read* (subpath \"/usr/local/share/firmware\"))(allow file-read* (subpath \"/AppleInternal\"))(allow file-read-metadata (literal \"/usr\"))(allow file-read-metadata (regex #\"^/usr/.*$\"))(allow file-read-metadata (literal \"/var\"))(allow file-write* (literal \"/private/var/logs/wifiFirmwareLoader.log\"))(allow file-read* (literal \"/private/var/logs/wifiFirmwareLoader.log\"))(allow file-read-metadata (regex #\"^/private/var/db/timezone/.*$\"))(allow file-read-data (regex #\"^/usr/share/zoneinfo.default/.*$\"))(allow file-read-data (literal \"/Library/Preferences/SystemConfiguration/com.apple.wifiFirmwareLoader.plist\"))", 0,
           &errorbuf) == -1)
    {
      time_t v22 = errorbuf;
      if (!errorbuf) {
        time_t v22 = (char *)&unk_10000AE43;
      }
      fprintf(__stderrp, "wifiFirmwareLoader sandbox_init: \"%s\" \nwifiFirmwareLoader failed to run, check profile\n", v22);
      sandbox_free_error(errorbuf);
      if (qword_100010218) {
        long long v29 = qword_100010218;
      }
      else {
        long long v29 = &_os_log_default;
      }
      sub_100008124(v29, "Sandboxing init issue failed, wifiFirmwareLoader failed to run, check profile", v23, v24, v25, v26, v27, v28, v240);
      if (dword_100010220)
      {
        *(void *)&long long v30 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v250 = v30;
        long long v251 = v30;
        long long v248 = v30;
        long long v249 = v30;
        long long v246 = v30;
        long long v247 = v30;
        *(_OWORD *)valuePtr = v30;
        long long v245 = v30;
        time_t v242 = 0xAAAAAAAAAAAAAAAALL;
        time(&v242);
        uint64_t v31 = localtime(&v242);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v31);
        dprintf(dword_100010220, "%s ", valuePtr);
        dprintf(dword_100010220, "Sandboxing init issue failed, wifiFirmwareLoader failed to run, check profile");
      }
    }
    else
    {
      fwrite("wifiFirmwareLoader sandbox_init: Success\n", 0x29uLL, 1uLL, __stderrp);
      if (qword_100010218) {
        int v19 = qword_100010218;
      }
      else {
        int v19 = &_os_log_default;
      }
      sub_100008124(v19, "Sandboxing init issue resolved: \"Success\"", v13, v14, v15, v16, v17, v18, v239);
      if (dword_100010220)
      {
        *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v250 = v20;
        long long v251 = v20;
        long long v248 = v20;
        long long v249 = v20;
        long long v246 = v20;
        long long v247 = v20;
        *(_OWORD *)valuePtr = v20;
        long long v245 = v20;
        time_t v242 = 0xAAAAAAAAAAAAAAAALL;
        time(&v242);
        uint64_t v21 = localtime(&v242);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v21);
        dprintf(dword_100010220, "%s ", valuePtr);
        dprintf(dword_100010220, "Sandboxing init issue resolved: \"Success\"");
      }
    }
  }
  char v32 = 0;
  qword_100010100 = (uint64_t)&_mh_execute_header;
  dword_100010110 = 0;
  dword_100010118 = 0;
  dword_100010188 = 0;
  dword_100010190 = 0;
  *(_OWORD *)&qword_1000100B8 = 0u;
  *(_OWORD *)&qword_1000100C8 = 0u;
  *(_OWORD *)&qword_1000100D8 = 0u;
  dword_1000100B0 = 0;
  word_1000100B4 = 0;
  xmmword_100010070 = 0u;
  *(_OWORD *)&qword_100010080 = 0u;
  xmmword_100010090 = 0u;
  qword_1000100A0 = 0;
  while (1)
  {
    int v33 = getopt(a1, a2, "fF:N:C:S:rR:T:MmP:p:");
    if (v33 < 0) {
      break;
    }
    if (v33 > 101)
    {
      if (v33 > 111)
      {
        if (v33 == 112)
        {
          if (!optarg)
          {
LABEL_55:
            puts("\nUsage:\n\n  -F <filename> [\"mfg\"]\n                    uploads firmware data from a file \n                    <filename>  specifies the path to a binary image of firmware.\n                    \"mfg\" denotes a manufacturing firmware; if given the driver will omit initial setup "
              "after writing the firmware.\n"
              "  -N <filename>     uploads nvram data from a file\n"
              "                    <filename>  specifies the path to a text file of NVRAM data\n"
              "  -S <filename>     uploads signature data from a file\n"
              "                    <filename>  specifies the path to a text file of signature data\n"
              "  -p <filename>     uploads platcfg blob data from a file\n"
              "                    <filename>  specifies the path to a binary file of platcfg blob data\n"
              "  -R <filename>     uploads regulatory table from a file\n"
              "                    <filename>  specifies the path to a text file of clmb data\n"
              "  -T <filename>     uploads tx cap table from a file\n"
              "                    <filename>  specifies the path to a text file of cap tx table\n"
              "  -P <filename>     Sets the Platform Config from a file\n"
              "                    <filename>  specifies the path to a the PlatformConfig file\n"
              "  -f                Prints the file paths for Firmware image and NVRAM file (doesn't perform an upload).\n"
              "  -r                Force to load Firmware\n"
              "  -M                Set MFG firmware flag\n"
              "  -m                Clear MFG firmware flag\n");
            return 1;
          }
          *((void *)&xmmword_100010090 + 1) = CFStringCreateWithCString(0, optarg, 0);
          HIBYTE(word_1000100B4) = 1;
        }
        else
        {
          if (v33 != 114) {
            goto LABEL_55;
          }
          BYTE2(dword_1000100B0) = 1;
        }
      }
      else if (v33 == 102)
      {
        BYTE1(dword_1000100B0) = 1;
      }
      else
      {
        if (v33 != 109) {
          goto LABEL_55;
        }
LABEL_29:
        LOBYTE(dword_1000100B0) = v33 == 77;
        char v32 = 1;
      }
    }
    else
    {
      switch(v33)
      {
        case 'C':
          if (!optarg) {
            goto LABEL_55;
          }
          qword_1000100A8 = (uint64_t)CFStringCreateWithCString(0, optarg, 0);
          break;
        case 'F':
          if (!optarg) {
            goto LABEL_55;
          }
          *((void *)&xmmword_100010070 + 1) = CFStringCreateWithCString(0, optarg, 0);
          if (v32) {
            int v34 = dword_1000100B0;
          }
          else {
            int v34 = strcasestr(optarg, "mfg") != 0;
          }
          LOBYTE(dword_1000100B0) = v34 != 0;
          break;
        case 'M':
          goto LABEL_29;
        case 'N':
          if (!optarg) {
            goto LABEL_55;
          }
          *(void *)&xmmword_100010070 = CFStringCreateWithCString(0, optarg, 0);
          break;
        case 'P':
          if (!optarg) {
            goto LABEL_55;
          }
          qword_1000100A0 = (uint64_t)CFStringCreateWithCString(0, optarg, 0);
          break;
        case 'R':
          if (!optarg) {
            goto LABEL_55;
          }
          qword_100010088 = (uint64_t)CFStringCreateWithCString(0, optarg, 0);
          HIBYTE(dword_1000100B0) = 1;
          break;
        case 'S':
          if (!optarg) {
            goto LABEL_55;
          }
          qword_100010080 = (uint64_t)CFStringCreateWithCString(0, optarg, 0);
          break;
        case 'T':
          if (!optarg) {
            goto LABEL_55;
          }
          *(void *)&xmmword_100010090 = CFStringCreateWithCString(0, optarg, 0);
          LOBYTE(word_1000100B4) = 1;
          break;
        default:
          goto LABEL_55;
      }
    }
  }
  uint64_t v35 = SCPreferencesCreate(0, @"com.apple.wifiFirmwareLoader", @"/Library/Managed Preferences/mobile/com.apple.wifiFirmwareLoader.plist");
  *(_DWORD *)valuePtr = 0;
  if (v35)
  {
    CFBooleanRef v36 = v35;
    CFNumberRef Value = (const __CFNumber *)SCPreferencesGetValue(v35, @"LoggingEnabled");
    if (!Value) {
      goto LABEL_61;
    }
    CFNumberRef v38 = Value;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v38))
    {
      CFNumberGetValue(v38, kCFNumberIntType, valuePtr);
      goto LABEL_61;
    }
    CFTypeID v41 = CFBooleanGetTypeID();
    if (v41 == CFGetTypeID(v38))
    {
      IntCFNumberRef Value = CFEqual(v38, kCFBooleanTrue);
    }
    else
    {
      CFTypeID v43 = CFStringGetTypeID();
      if (v43 != CFGetTypeID(v38)) {
        goto LABEL_61;
      }
      IntCFNumberRef Value = CFStringGetIntValue((CFStringRef)v38);
    }
    *(_DWORD *)valuePtr = IntValue;
LABEL_61:
    CFRelease(v36);
    if (*(_DWORD *)valuePtr)
    {
      uint64_t v50 = qword_100010218;
      if (!qword_100010218)
      {
        qword_100010218 = (uint64_t)os_log_create("com.apple.wififirmwareloaderdaemon", "wififirmwareloader");
        char v237 = -92;
        dword_100010220 = open("/private/var/logs/wifiFirmwareLoader.log", 522);
        if (qword_100010218) {
          uint64_t v50 = qword_100010218;
        }
        else {
          uint64_t v50 = &_os_log_default;
        }
      }
      sub_100008124(v50, "WiFi Firmware Loader logging enabled\n", v44, v45, v46, v47, v48, v49, v237);
      if (dword_100010220)
      {
        *(void *)&long long v57 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v57 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v250 = v57;
        long long v251 = v57;
        long long v248 = v57;
        long long v249 = v57;
        long long v246 = v57;
        long long v247 = v57;
        *(_OWORD *)valuePtr = v57;
        long long v245 = v57;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        uint64_t v58 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v58);
        dprintf(dword_100010220, "%s ", valuePtr);
        dprintf(dword_100010220, "WiFi Firmware Loader logging enabled\n");
      }
      if (qword_100010218) {
        uint64_t v59 = qword_100010218;
      }
      else {
        uint64_t v59 = &_os_log_default;
      }
      sub_100008124(v59, "Kicking corecaptured to start logging...\n", v51, v52, v53, v54, v55, v56, v241);
      if (dword_100010220)
      {
        *(void *)&long long v60 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v60 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v250 = v60;
        long long v251 = v60;
        long long v248 = v60;
        long long v249 = v60;
        long long v246 = v60;
        long long v247 = v60;
        *(_OWORD *)valuePtr = v60;
        long long v245 = v60;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        uint64_t v61 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v61);
        dprintf(dword_100010220, "%s ", valuePtr);
        dprintf(dword_100010220, "Kicking corecaptured to start logging...\n");
      }
      if (&_CoreCaptureControlCreate) {
        CoreCaptureControlCreate();
      }
      if (&_CoreCaptureControlStart) {
        CoreCaptureControlStart();
      }
    }
  }
  qword_1000101FC = 0xA00000002;
  dword_100010204 = 0;
  SCPreferencesRef v62 = SCPreferencesCreate(0, @"com.apple.wifiFirmwareLoader", @"/Library/Managed Preferences/mobile/com.apple.wifiFirmwareLoader.plist");
  LODWORD(v242) = 0;
  if (v62)
  {
    uint64_t v69 = v62;
    if (qword_100010218) {
      uint64_t v70 = qword_100010218;
    }
    else {
      uint64_t v70 = &_os_log_default;
    }
    sub_100008124(v70, "WiFi Firmware processing preferences\n", v63, v64, v65, v66, v67, v68, v237);
    if (dword_100010220)
    {
      *(void *)&long long v71 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v71 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v250 = v71;
      long long v251 = v71;
      long long v248 = v71;
      long long v249 = v71;
      long long v246 = v71;
      long long v247 = v71;
      *(_OWORD *)valuePtr = v71;
      long long v245 = v71;
      errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&errorbuf);
      v72 = localtime((const time_t *)&errorbuf);
      strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v72);
      dprintf(dword_100010220, "%s ", valuePtr);
      dprintf(dword_100010220, "WiFi Firmware processing preferences\n");
    }
    CFPropertyListRef v73 = SCPreferencesGetValue(v69, @"assertionEnabled");
    if (v73)
    {
      uint64_t v74 = v73;
      CFTypeID v75 = CFBooleanGetTypeID();
      if (v75 == CFGetTypeID(v74)) {
        byte_1000101F8 = CFEqual(v74, kCFBooleanTrue) != 0;
      }
    }
    CFNumberRef v76 = (const __CFNumber *)SCPreferencesGetValue(v69, @"assertionType");
    if (v76)
    {
      CFNumberRef v77 = v76;
      CFTypeID v78 = CFNumberGetTypeID();
      if (v78 == CFGetTypeID(v77))
      {
        if (CFNumberGetValue(v77, kCFNumberIntType, &v242)) {
          LODWORD(qword_1000101FC) = v242;
        }
      }
    }
    CFPropertyListRef v79 = SCPreferencesGetValue(v69, @"assertionTimeout");
    if (v79)
    {
      long long v80 = v79;
      CFTypeID v81 = CFNumberGetTypeID();
      if (v81 == CFGetTypeID(v80)
        && CFNumberGetValue((CFNumberRef)v80, kCFNumberIntType, &v242)
        && (int)v242 >= 1
        && (int)v242 <= 10)
      {
        HIDWORD(qword_1000101FC) = v242;
      }
    }
    CFNumberRef v82 = (const __CFNumber *)SCPreferencesGetValue(v69, @"assertionReleaseDelay");
    if (v82)
    {
      CFNumberRef v83 = v82;
      CFTypeID v84 = CFNumberGetTypeID();
      if (v84 == CFGetTypeID(v83))
      {
        if (CFNumberGetValue(v83, kCFNumberIntType, &v242))
        {
          if ((v242 & 0x80000000) == 0 && (int)v242 <= 3)
          {
            dword_100010204 = v242;
            if (v242)
            {
              char v91 = BYTE4(qword_1000101FC) + v242;
              if (__OFADD__(HIDWORD(qword_1000101FC), v242))
              {
                __break(0x5500u);
                JUMPOUT(0x100007780);
              }
              HIDWORD(qword_1000101FC) += v242;
              if (qword_100010218) {
                CFURLRef v92 = qword_100010218;
              }
              else {
                CFURLRef v92 = &_os_log_default;
              }
              sub_100008124(v92, "WiFi Firmware processing preferences, adjusting timeout -> timeout[%u sec], adjusted[%u sec]\n", v85, v86, v87, v88, v89, v90, v91);
              if (dword_100010220)
              {
                *(void *)&long long v93 = 0xAAAAAAAAAAAAAAAALL;
                *((void *)&v93 + 1) = 0xAAAAAAAAAAAAAAAALL;
                long long v250 = v93;
                long long v251 = v93;
                long long v248 = v93;
                long long v249 = v93;
                long long v246 = v93;
                long long v247 = v93;
                *(_OWORD *)valuePtr = v93;
                long long v245 = v93;
                errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
                time((time_t *)&errorbuf);
                uint64_t v94 = localtime((const time_t *)&errorbuf);
                strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v94);
                dprintf(dword_100010220, "%s ", valuePtr);
                dprintf(dword_100010220, "WiFi Firmware processing preferences, adjusting timeout -> timeout[%u sec], adjusted[%u sec]\n", HIDWORD(qword_1000101FC), dword_100010204);
              }
            }
          }
        }
      }
    }
    uint64_t v95 = qword_100010218;
    char v96 = byte_1000101F8;
    if (qword_100010218)
    {
      switch((int)qword_1000101FC)
      {
        case 1:
          CFStringRef v97 = @"PreventUserIdleDisplaySleep";
          break;
        case 2:
          CFStringRef v97 = @"PreventSystemSleep";
          break;
        case 3:
          CFStringRef v97 = @"NoIdleSleepAssertion";
          break;
        case 4:
          CFStringRef v97 = @"NoDisplaySleepAssertion";
          break;
        default:
          goto LABEL_114;
      }
    }
    else if ((qword_1000101FC - 1) > 3)
    {
      uint64_t v95 = &_os_log_default;
LABEL_114:
      CFStringRef v97 = @"PreventUserIdleSystemSleep";
    }
    else
    {
      CFStringRef v97 = off_10000C5F8[(qword_1000101FC - 1)];
      uint64_t v95 = &_os_log_default;
    }
    CFStringGetCStringPtr(v97, 0);
    sub_100008124(v95, "WiFi Firmware processing preferences using: assertionEnabled:%u, assertionType:%u mapped['%s'], timeout[%u sec], assertionReleaseDelay[%u sec]\n", v98, v99, v100, v101, v102, v103, v96);
    if (dword_100010220)
    {
      *(void *)&long long v104 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v104 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v250 = v104;
      long long v251 = v104;
      long long v248 = v104;
      long long v249 = v104;
      long long v246 = v104;
      long long v247 = v104;
      *(_OWORD *)valuePtr = v104;
      long long v245 = v104;
      errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&errorbuf);
      uint64_t v105 = localtime((const time_t *)&errorbuf);
      strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v105);
      dprintf(dword_100010220, "%s ", valuePtr);
      int v106 = dword_100010220;
      int v107 = byte_1000101F8;
      int v108 = qword_1000101FC;
      if ((qword_1000101FC - 1) > 3) {
        CFStringRef v109 = @"PreventUserIdleSystemSleep";
      }
      else {
        CFStringRef v109 = off_10000C5F8[(qword_1000101FC - 1)];
      }
      char CStringPtr = CFStringGetCStringPtr(v109, 0);
      dprintf(v106, "WiFi Firmware processing preferences using: assertionEnabled:%u, assertionType:%u mapped['%s'], timeout[%u sec], assertionReleaseDelay[%u sec]\n", v107, v108, CStringPtr, HIDWORD(qword_1000101FC), dword_100010204);
    }
    CFRelease(v69);
  }
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)xmmword_100010070), (int32x4_t)vceqzq_s64(*(int64x2_t *)&qword_100010088))))) & 1) != 0|| qword_1000100A0|| __PAIR128__(qword_1000100A8, 0) != *((unint64_t *)&xmmword_100010090 + 1))
  {
    if (qword_100010218) {
      uint64_t v111 = qword_100010218;
    }
    else {
      uint64_t v111 = &_os_log_default;
    }
    sub_100008124(v111, "Settings:\n", v63, v64, v65, v66, v67, v68, v237);
    if (dword_100010220)
    {
      *(void *)&long long v112 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v112 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v250 = v112;
      long long v251 = v112;
      long long v248 = v112;
      long long v249 = v112;
      long long v246 = v112;
      long long v247 = v112;
      *(_OWORD *)valuePtr = v112;
      long long v245 = v112;
      errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&errorbuf);
      uint64_t v113 = localtime((const time_t *)&errorbuf);
      strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v113);
      dprintf(dword_100010220, "%s ", valuePtr);
      dprintf(dword_100010220, "Settings:\n");
    }
    if (qword_1000100A0 && CFStringGetCStringPtr((CFStringRef)qword_1000100A0, 0))
    {
      uint64_t v114 = (void *)qword_100010218;
      char v115 = CFStringGetCStringPtr((CFStringRef)qword_1000100A0, 0);
      v122 = (v114 ? v114 : &_os_log_default);
      sub_100008124(v122, "    pathPlatformConfig: %s\n", v116, v117, v118, v119, v120, v121, v115);
      if (dword_100010220)
      {
        *(void *)&long long v123 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v123 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v250 = v123;
        long long v251 = v123;
        long long v248 = v123;
        long long v249 = v123;
        long long v246 = v123;
        long long v247 = v123;
        *(_OWORD *)valuePtr = v123;
        long long v245 = v123;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        uint64_t v124 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v124);
        dprintf(dword_100010220, "%s ", valuePtr);
        int v125 = dword_100010220;
        uint64_t v126 = CFStringGetCStringPtr((CFStringRef)qword_1000100A0, 0);
        dprintf(v125, "    pathPlatformConfig: %s\n", v126);
      }
    }
    if (*((void *)&xmmword_100010070 + 1) && CFStringGetCStringPtr(*((CFStringRef *)&xmmword_100010070 + 1), 0))
    {
      uint64_t v127 = qword_100010218;
      char v128 = CFStringGetCStringPtr(*((CFStringRef *)&xmmword_100010070 + 1), 0);
      if (v127) {
        uint64_t v135 = v127;
      }
      else {
        uint64_t v135 = &_os_log_default;
      }
      sub_100008124(v135, "          pathFirmware: %s\n", v129, v130, v131, v132, v133, v134, v128);
      if (dword_100010220)
      {
        *(void *)&long long v142 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v142 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v250 = v142;
        long long v251 = v142;
        long long v248 = v142;
        long long v249 = v142;
        long long v246 = v142;
        long long v247 = v142;
        *(_OWORD *)valuePtr = v142;
        long long v245 = v142;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        uint64_t v143 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v143);
        dprintf(dword_100010220, "%s ", valuePtr);
        int v144 = dword_100010220;
        uint64_t v145 = CFStringGetCStringPtr(*((CFStringRef *)&xmmword_100010070 + 1), 0);
        dprintf(v144, "          pathFirmware: %s\n", v145);
      }
      if (qword_100010218) {
        uint64_t v146 = qword_100010218;
      }
      else {
        uint64_t v146 = &_os_log_default;
      }
      sub_100008124(v146, "                   mfg: %d\n", v136, v137, v138, v139, v140, v141, dword_1000100B0);
      if (dword_100010220)
      {
        *(void *)&long long v147 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v147 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v250 = v147;
        long long v251 = v147;
        long long v248 = v147;
        long long v249 = v147;
        long long v246 = v147;
        long long v247 = v147;
        *(_OWORD *)valuePtr = v147;
        long long v245 = v147;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v148 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v148);
        dprintf(dword_100010220, "%s ", valuePtr);
        dprintf(dword_100010220, "                   mfg: %d\n", dword_1000100B0);
      }
    }
    if ((void)xmmword_100010070 && CFStringGetCStringPtr((CFStringRef)xmmword_100010070, 0))
    {
      int v149 = (void *)qword_100010218;
      char v150 = CFStringGetCStringPtr((CFStringRef)xmmword_100010070, 0);
      uint64_t v157 = (v149 ? v149 : &_os_log_default);
      sub_100008124(v157, "             pathNVRAM: %s\n", v151, v152, v153, v154, v155, v156, v150);
      if (dword_100010220)
      {
        *(void *)&long long v158 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v158 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v250 = v158;
        long long v251 = v158;
        long long v248 = v158;
        long long v249 = v158;
        long long v246 = v158;
        long long v247 = v158;
        *(_OWORD *)valuePtr = v158;
        long long v245 = v158;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v159 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v159);
        dprintf(dword_100010220, "%s ", valuePtr);
        int v160 = dword_100010220;
        v161 = CFStringGetCStringPtr((CFStringRef)xmmword_100010070, 0);
        dprintf(v160, "             pathNVRAM: %s\n", v161);
      }
    }
    if (qword_100010080 && CFStringGetCStringPtr((CFStringRef)qword_100010080, 0))
    {
      uint64_t v162 = (void *)qword_100010218;
      char v163 = CFStringGetCStringPtr((CFStringRef)qword_100010080, 0);
      v170 = (v162 ? v162 : &_os_log_default);
      sub_100008124(v170, "             pathSignature: %s\n", v164, v165, v166, v167, v168, v169, v163);
      if (dword_100010220)
      {
        *(void *)&long long v171 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v171 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v250 = v171;
        long long v251 = v171;
        long long v248 = v171;
        long long v249 = v171;
        long long v246 = v171;
        long long v247 = v171;
        *(_OWORD *)valuePtr = v171;
        long long v245 = v171;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v172 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v172);
        dprintf(dword_100010220, "%s ", valuePtr);
        int v173 = dword_100010220;
        int v174 = CFStringGetCStringPtr((CFStringRef)qword_100010080, 0);
        dprintf(v173, "             pathSignature: %s\n", v174);
      }
    }
    if (*((void *)&xmmword_100010090 + 1) && CFStringGetCStringPtr(*((CFStringRef *)&xmmword_100010090 + 1), 0))
    {
      BOOL v175 = (void *)qword_100010218;
      char v176 = CFStringGetCStringPtr(*((CFStringRef *)&xmmword_100010090 + 1), 0);
      uint64_t v183 = (v175 ? v175 : &_os_log_default);
      sub_100008124(v183, "             pathPlatcfg: %s\n", v177, v178, v179, v180, v181, v182, v176);
      if (dword_100010220)
      {
        *(void *)&long long v184 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v184 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v250 = v184;
        long long v251 = v184;
        long long v248 = v184;
        long long v249 = v184;
        long long v246 = v184;
        long long v247 = v184;
        *(_OWORD *)valuePtr = v184;
        long long v245 = v184;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        uint64_t v185 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v185);
        dprintf(dword_100010220, "%s ", valuePtr);
        int v186 = dword_100010220;
        uint64_t v187 = CFStringGetCStringPtr(*((CFStringRef *)&xmmword_100010090 + 1), 0);
        dprintf(v186, "             pathPlatcfg: %s\n", v187);
      }
    }
    if (qword_100010088 && CFStringGetCStringPtr((CFStringRef)qword_100010088, 0))
    {
      uint64_t v188 = (void *)qword_100010218;
      char v189 = CFStringGetCStringPtr((CFStringRef)qword_100010088, 0);
      v196 = (v188 ? v188 : &_os_log_default);
      sub_100008124(v196, "               pathReg: %s\n", v190, v191, v192, v193, v194, v195, v189);
      if (dword_100010220)
      {
        *(void *)&long long v197 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v197 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v250 = v197;
        long long v251 = v197;
        long long v248 = v197;
        long long v249 = v197;
        long long v246 = v197;
        long long v247 = v197;
        *(_OWORD *)valuePtr = v197;
        long long v245 = v197;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v198 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v198);
        dprintf(dword_100010220, "%s ", valuePtr);
        int v199 = dword_100010220;
        v200 = CFStringGetCStringPtr((CFStringRef)qword_100010088, 0);
        dprintf(v199, "               pathReg: %s\n", v200);
      }
    }
    if ((void)xmmword_100010090 && CFStringGetCStringPtr((CFStringRef)xmmword_100010090, 0))
    {
      v201 = (void *)qword_100010218;
      char v202 = CFStringGetCStringPtr((CFStringRef)xmmword_100010090, 0);
      v209 = (v201 ? v201 : &_os_log_default);
      sub_100008124(v209, "             pathTxCap: %s\n", v203, v204, v205, v206, v207, v208, v202);
      if (dword_100010220)
      {
        *(void *)&long long v210 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v210 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v250 = v210;
        long long v251 = v210;
        long long v248 = v210;
        long long v249 = v210;
        long long v246 = v210;
        long long v247 = v210;
        *(_OWORD *)valuePtr = v210;
        long long v245 = v210;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        long long v211 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v211);
        dprintf(dword_100010220, "%s ", valuePtr);
        int v212 = dword_100010220;
        v213 = CFStringGetCStringPtr((CFStringRef)xmmword_100010090, 0);
        dprintf(v212, "             pathTxCap: %s\n", v213);
      }
    }
    if (qword_1000100A8 && CFStringGetCStringPtr((CFStringRef)qword_1000100A8, 0))
    {
      long long v214 = (void *)qword_100010218;
      char v215 = CFStringGetCStringPtr((CFStringRef)qword_1000100A8, 0);
      long long v222 = (v214 ? v214 : &_os_log_default);
      sub_100008124(v222, "             pathMSFCal: %s\n", v216, v217, v218, v219, v220, v221, v215);
      if (dword_100010220)
      {
        *(void *)&long long v223 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v223 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v250 = v223;
        long long v251 = v223;
        long long v248 = v223;
        long long v249 = v223;
        long long v246 = v223;
        long long v247 = v223;
        *(_OWORD *)valuePtr = v223;
        long long v245 = v223;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v224 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v224);
        dprintf(dword_100010220, "%s ", valuePtr);
        int v225 = dword_100010220;
        v226 = CFStringGetCStringPtr((CFStringRef)qword_1000100A8, 0);
        dprintf(v225, "             pathMSFCal: %s\n", v226);
      }
    }
  }
  signal(2, (void (__cdecl *)(int))sub_10000796C);
  signal(3, (void (__cdecl *)(int))sub_10000796C);
  signal(15, (void (__cdecl *)(int))sub_10000796C);
  signal(1, (void (__cdecl *)(int))sub_10000796C);
  qword_100010060 = (uint64_t)CFRunLoopGetCurrent();
  os_transaction_create();
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  long long v228 = CFRunLoopTimerCreate(kCFAllocatorDefault, Current + 360.0, 0.0, 0, 0, (CFRunLoopTimerCallBack)sub_100007944, 0);
  qword_100010068 = (uint64_t)v228;
  if (v228)
  {
    CFRunLoopAddTimer((CFRunLoopRef)qword_100010060, v228, kCFRunLoopDefaultMode);
    sub_10000120C(v229, v230, v231, v232, v233, v234, v235, v236);
    CFRunLoopRemoveTimer((CFRunLoopRef)qword_100010060, (CFRunLoopTimerRef)qword_100010068, kCFRunLoopDefaultMode);
    sub_1000077D8();
  }
  return HIDWORD(qword_100010100);
}

void sub_1000077D8()
{
  signal(2, (void (__cdecl *)(int))1);
  signal(3, (void (__cdecl *)(int))1);
  signal(15, (void (__cdecl *)(int))1);
  signal(1, (void (__cdecl *)(int))1);
  if (qword_100010218) {
    uint64_t v6 = qword_100010218;
  }
  else {
    uint64_t v6 = &_os_log_default;
  }
  sub_100008124(v6, "Shutting down\n", v0, v1, v2, v3, v4, v5, v9);
  if (dword_100010220)
  {
    *(void *)&long long v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v17 = v7;
    long long v18 = v7;
    long long v15 = v7;
    long long v16 = v7;
    long long v13 = v7;
    long long v14 = v7;
    *(_OWORD *)long long v11 = v7;
    long long v12 = v7;
    time_t v10 = 0xAAAAAAAAAAAAAAAALL;
    time(&v10);
    uint64_t v8 = localtime(&v10);
    strftime(v11, 0x80uLL, "%b %d %H:%M:%S", v8);
    dprintf(dword_100010220, "%s ", v11);
    dprintf(dword_100010220, "Shutting down\n");
  }
  if ((void)xmmword_100010070) {
    CFRelease((CFTypeRef)xmmword_100010070);
  }
  *(void *)&xmmword_100010070 = 0;
  if (*((void *)&xmmword_100010070 + 1)) {
    CFRelease(*((CFTypeRef *)&xmmword_100010070 + 1));
  }
  *((void *)&xmmword_100010070 + 1) = 0;
  if (qword_100010088) {
    CFRelease((CFTypeRef)qword_100010088);
  }
  qword_100010088 = 0;
  if ((void)xmmword_100010090) {
    CFRelease((CFTypeRef)xmmword_100010090);
  }
  *(void *)&xmmword_100010090 = 0;
  if (dword_100010220)
  {
    close(dword_100010220);
    dword_100010220 = 0;
  }
  if (qword_100010218) {
    qword_100010218 = 0;
  }
  exit(SHIDWORD(qword_100010100));
}

void sub_100007944()
{
  CFAbsoluteTime Current = CFRunLoopGetCurrent();

  CFRunLoopStop(Current);
}

uint64_t sub_10000796C(uint64_t result)
{
  if (result <= 0xF && ((1 << result) & 0x800C) != 0) {
    sub_1000077D8();
  }
  return result;
}

void sub_10000799C(id a1, void *a2)
{
  if (qword_100010218) {
    uint64_t v8 = qword_100010218;
  }
  else {
    uint64_t v8 = &_os_log_default;
  }
  sub_100008124(v8, "Woken up by IOKit matching\n", v2, v3, v4, v5, v6, v7, v11);
  if (dword_100010220)
  {
    *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v19 = v9;
    long long v20 = v9;
    long long v17 = v9;
    long long v18 = v9;
    long long v15 = v9;
    long long v16 = v9;
    *(_OWORD *)long long v13 = v9;
    long long v14 = v9;
    time_t v12 = 0xAAAAAAAAAAAAAAAALL;
    time(&v12);
    time_t v10 = localtime(&v12);
    strftime(v13, 0x80uLL, "%b %d %H:%M:%S", v10);
    dprintf(dword_100010220, "%s ", v13);
    dprintf(dword_100010220, "Woken up by IOKit matching\n");
  }
}

uint64_t sub_100007A88()
{
  uint64_t result = _CFRuntimeRegisterClass();
  qword_100010210 = result;
  return result;
}

CFStringRef sub_100007AB0(uint64_t a1)
{
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"WiFiUserClient@%p", a1);
}

CFStringRef sub_100007AF0(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat(kCFAllocatorDefault, a2, @"WiFiUserClient@%p", a1);
}

BOOL sub_100007B30(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_100007B3C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 24))
  {
    mach_port_t v2 = *(_DWORD *)(a1 + 20);
    if (v2) {
      IOConnectCallScalarMethod(v2, 1u, 0, 0, 0, 0);
    }
  }
  uint64_t result = *(unsigned int *)(a1 + 20);
  if (result) {
    uint64_t result = IOServiceClose(result);
  }
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 16) = 0;
  return result;
}

mach_vm_address_t sub_100007B98(io_connect_t a1, uint32_t a2, mach_vm_size_t *ofSize)
{
  kern_return_t v10;
  NSObject *v11;
  long long v12;
  tm *v13;
  time_t v15;
  mach_vm_address_t atAddress;
  char v17[16];
  long long v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;

  atAddress = 0xAAAAAAAAAAAAAAAALL;
  time_t v10 = IOConnectMapMemory(a1, a2, mach_task_self_, &atAddress, ofSize, 1u);
  if (qword_100010218) {
    char v11 = qword_100010218;
  }
  else {
    char v11 = &_os_log_default;
  }
  sub_100008124(v11, "WiFiUserClientGetMemoryDescriptorForType return %d for type %d\n", v4, v5, v6, v7, v8, v9, v10);
  if (dword_100010220)
  {
    *(void *)&time_t v12 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v23 = v12;
    uint64_t v24 = v12;
    uint64_t v21 = v12;
    time_t v22 = v12;
    long long v19 = v12;
    long long v20 = v12;
    *(_OWORD *)long long v17 = v12;
    long long v18 = v12;
    long long v15 = 0xAAAAAAAAAAAAAAAALL;
    time(&v15);
    long long v13 = localtime(&v15);
    strftime(v17, 0x80uLL, "%b %d %H:%M:%S", v13);
    dprintf(dword_100010220, "%s ", v17);
    dprintf(dword_100010220, "WiFiUserClientGetMemoryDescriptorForType return %d for type %d\n", v10, a2);
  }
  return atAddress;
}

uint64_t sub_100007CC0(const char *a1, off_t *a2)
{
  memset(&v69, 0, sizeof(v69));
  bzero(v68, 0x401uLL);
  if (!a1 || !a2)
  {
    if (qword_100010218) {
      uint64_t v54 = qword_100010218;
    }
    else {
      uint64_t v54 = &_os_log_default;
    }
    sub_100008124(v54, "'%s' failed !!\n", v4, v5, v6, v7, v8, v9, (char)"getSizeFromFile");
    if (dword_100010220)
    {
      *(void *)&long long v55 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v55 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v66 = v55;
      long long v67 = v55;
      long long v64 = v55;
      long long v65 = v55;
      long long v62 = v55;
      long long v63 = v55;
      *(_OWORD *)long long v60 = v55;
      long long v61 = v55;
      time_t v59 = 0xAAAAAAAAAAAAAAAALL;
      time(&v59);
      uint64_t v56 = localtime(&v59);
      strftime(v60, 0x80uLL, "%b %d %H:%M:%S", v56);
      dprintf(dword_100010220, "%s ", v60);
      dprintf(dword_100010220, "'%s' failed !!\n");
    }
    return 0;
  }
  realpath_DARWIN_EXTSN(a1, v68);
  long long v16 = &_os_log_default;
  if (qword_100010218) {
    long long v17 = qword_100010218;
  }
  else {
    long long v17 = &_os_log_default;
  }
  uint64_t v58 = v68;
  sub_100008124(v17, "%s: path['%s'], resolved['%s']\n", v10, v11, v12, v13, v14, v15, (char)"getSizeFromFile");
  if (dword_100010220)
  {
    *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v66 = v18;
    long long v67 = v18;
    long long v64 = v18;
    long long v65 = v18;
    long long v62 = v18;
    long long v63 = v18;
    *(_OWORD *)long long v60 = v18;
    long long v61 = v18;
    time_t v59 = 0xAAAAAAAAAAAAAAAALL;
    time(&v59);
    long long v19 = localtime(&v59);
    strftime(v60, 0x80uLL, "%b %d %H:%M:%S", v19);
    dprintf(dword_100010220, "%s ", v60);
    dprintf(dword_100010220, "%s: path['%s'], resolved['%s']\n", "getSizeFromFile", a1, v68);
  }
  if (lstat(v68, &v69))
  {
    long long v20 = qword_100010218;
    uint64_t v21 = __error();
    if (!v20) {
      long long v20 = &_os_log_default;
    }
    strerror(*v21);
    sub_100008284(v20, "Error: Could not stat %s (%s)\n", v22, v23, v24, v25, v26, v27, (char)v68);
    if (!dword_100010220) {
      return 0;
    }
    *(void *)&long long v28 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v66 = v28;
    long long v67 = v28;
    long long v64 = v28;
    long long v65 = v28;
    long long v62 = v28;
    long long v63 = v28;
    *(_OWORD *)long long v60 = v28;
    long long v61 = v28;
    time_t v59 = 0xAAAAAAAAAAAAAAAALL;
    time(&v59);
    long long v29 = localtime(&v59);
    strftime(v60, 0x80uLL, "%b %d %H:%M:%S", v29);
    dprintf(dword_100010220, "%s ", v60);
    int v30 = dword_100010220;
    uint64_t v31 = __error();
    long long v57 = strerror(*v31);
    char v32 = "Error: Could not stat %s (%s)\n";
    goto LABEL_13;
  }
  int v34 = open(v68, 0);
  if (qword_100010218) {
    long long v16 = qword_100010218;
  }
  if (v34 < 0)
  {
    uint64_t v44 = __error();
    strerror(*v44);
    sub_100008124(v16, "Could not Open file %s (%s)\n", v45, v46, v47, v48, v49, v50, (char)v68);
    if (!dword_100010220) {
      return 0;
    }
    *(void *)&long long v51 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v51 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v66 = v51;
    long long v67 = v51;
    long long v64 = v51;
    long long v65 = v51;
    long long v62 = v51;
    long long v63 = v51;
    *(_OWORD *)long long v60 = v51;
    long long v61 = v51;
    time_t v59 = 0xAAAAAAAAAAAAAAAALL;
    time(&v59);
    uint64_t v52 = localtime(&v59);
    strftime(v60, 0x80uLL, "%b %d %H:%M:%S", v52);
    dprintf(dword_100010220, "%s ", v60);
    int v30 = dword_100010220;
    uint64_t v53 = __error();
    long long v57 = strerror(*v53);
    char v32 = "Could not Open file %s (%s)\n";
LABEL_13:
    dprintf(v30, v32, v68, v57, v58);
    return 0;
  }
  int v41 = v34;
  sub_100008124(v16, "Get size of \"%s\", size = %d bytes\n", v35, v36, v37, v38, v39, v40, (char)v68);
  if (dword_100010220)
  {
    *(void *)&long long v42 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v66 = v42;
    long long v67 = v42;
    long long v64 = v42;
    long long v65 = v42;
    long long v62 = v42;
    long long v63 = v42;
    *(_OWORD *)long long v60 = v42;
    long long v61 = v42;
    time_t v59 = 0xAAAAAAAAAAAAAAAALL;
    time(&v59);
    CFTypeID v43 = localtime(&v59);
    strftime(v60, 0x80uLL, "%b %d %H:%M:%S", v43);
    dprintf(dword_100010220, "%s ", v60);
    dprintf(dword_100010220, "Get size of \"%s\", size = %d bytes\n", v68, LODWORD(v69.st_size));
  }
  *a2 = v69.st_size;
  close(v41);
  return 1;
}

void sub_100008124(NSObject *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  bzero(__str, 0x800uLL);
  vsnprintf(__str, 0x800uLL, a2, &a9);
  uint64_t v11 = mach_continuous_time();
  *(void *)info = 0xAAAAAAAAAAAAAAAALL;
  mach_timebase_info((mach_timebase_info_t)info);
  if (is_mul_ok(v11, *(unsigned int *)info) && *(_DWORD *)&info[4]) {
    unint64_t v12 = v11 * *(unsigned int *)info / *(unsigned int *)&info[4];
  }
  else {
    unint64_t v12 = 0;
  }
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)info = 134218498;
    *(void *)&info[4] = v12 / 0x3B9ACA00;
    __int16 v14 = 2048;
    unint64_t v15 = v12 % 0x3B9ACA00 / 0x3E8;
    __int16 v16 = 2082;
    long long v17 = __str;
    _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEFAULT, "%06llu.%06llu %{public}s", info, 0x20u);
  }
}

void sub_100008284(NSObject *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  bzero(__str, 0x800uLL);
  vsnprintf(__str, 0x800uLL, a2, &a9);
  uint64_t v11 = mach_continuous_time();
  *(void *)info = 0xAAAAAAAAAAAAAAAALL;
  mach_timebase_info((mach_timebase_info_t)info);
  if (is_mul_ok(v11, *(unsigned int *)info) && *(_DWORD *)&info[4]) {
    unint64_t v12 = v11 * *(unsigned int *)info / *(unsigned int *)&info[4];
  }
  else {
    unint64_t v12 = 0;
  }
  if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)info = 134218498;
    *(void *)&info[4] = v12 / 0x3B9ACA00;
    __int16 v14 = 2048;
    unint64_t v15 = v12 % 0x3B9ACA00 / 0x3E8;
    __int16 v16 = 2082;
    long long v17 = __str;
    _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "%06llu.%06llu %{public}s", info, 0x20u);
  }
}

uint64_t sub_1000083E8(const char *a1, void *a2, off_t *a3)
{
  memset(&v131, 0, sizeof(v131));
  bzero(v130, 0x401uLL);
  if (!a2 || !a3)
  {
    if (qword_100010218) {
      uint64_t v26 = qword_100010218;
    }
    else {
      uint64_t v26 = &_os_log_default;
    }
    sub_100008284(v26, "Error: copyDataFromFile data/datalength is null\n", v6, v7, v8, v9, v10, v11, v118);
    if (!dword_100010220) {
      return 0;
    }
    *(void *)&long long v27 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v128 = v27;
    long long v129 = v27;
    long long v126 = v27;
    long long v127 = v27;
    long long v124 = v27;
    long long v125 = v27;
    *(_OWORD *)v122 = v27;
    long long v123 = v27;
    time_t v121 = 0xAAAAAAAAAAAAAAAALL;
    time(&v121);
    long long v28 = localtime(&v121);
    strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v28);
    dprintf(dword_100010220, "%s ", v122);
    int v25 = dword_100010220;
    uint64_t v24 = "Error: copyDataFromFile data/datalength is null\n";
    goto LABEL_14;
  }
  if (!lstat(a1, &v131))
  {
    uint64_t v31 = realpath_DARWIN_EXTSN(a1, v130);
    uint64_t v38 = qword_100010218;
    if (!v31)
    {
      uint64_t v54 = __error();
      if (v38) {
        long long v55 = v38;
      }
      else {
        long long v55 = &_os_log_default;
      }
      strerror(*v54);
      sub_100008284(v55, "Error: Could not resolve path %s (%s)\n", v56, v57, v58, v59, v60, v61, (char)a1);
      if (!dword_100010220) {
        return 0;
      }
      *(void *)&long long v62 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v62 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v128 = v62;
      long long v129 = v62;
      long long v126 = v62;
      long long v127 = v62;
      long long v124 = v62;
      long long v125 = v62;
      *(_OWORD *)v122 = v62;
      long long v123 = v62;
      time_t v121 = 0xAAAAAAAAAAAAAAAALL;
      time(&v121);
      long long v63 = localtime(&v121);
      strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v63);
      dprintf(dword_100010220, "%s ", v122);
      int v22 = dword_100010220;
      long long v64 = __error();
      uint64_t v119 = (char *)a1;
      uint64_t v120 = strerror(*v64);
      uint64_t v24 = "Error: Could not resolve path %s (%s)\n";
      goto LABEL_8;
    }
    if (qword_100010218) {
      uint64_t v39 = qword_100010218;
    }
    else {
      uint64_t v39 = &_os_log_default;
    }
    sub_100008124(v39, "%s: path['%s'], resolved['%s']\n", v32, v33, v34, v35, v36, v37, (char)"copyDataFromFile");
    if (dword_100010220)
    {
      *(void *)&long long v40 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v128 = v40;
      long long v129 = v40;
      long long v126 = v40;
      long long v127 = v40;
      long long v124 = v40;
      long long v125 = v40;
      *(_OWORD *)v122 = v40;
      long long v123 = v40;
      time_t v121 = 0xAAAAAAAAAAAAAAAALL;
      time(&v121);
      int v41 = localtime(&v121);
      strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v41);
      dprintf(dword_100010220, "%s ", v122);
      dprintf(dword_100010220, "%s: path['%s'], resolved['%s']\n", "copyDataFromFile", a1, v130);
    }
    if (lstat(v130, &v131))
    {
      long long v42 = qword_100010218;
      CFTypeID v43 = __error();
      if (!v42) {
        long long v42 = &_os_log_default;
      }
      strerror(*v43);
      sub_100008284(v42, "Error: Could not stat %s (%s)\n", v44, v45, v46, v47, v48, v49, (char)v130);
      if (!dword_100010220) {
        return 0;
      }
      *(void *)&long long v50 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v50 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v128 = v50;
      long long v129 = v50;
      long long v126 = v50;
      long long v127 = v50;
      long long v124 = v50;
      long long v125 = v50;
      *(_OWORD *)v122 = v50;
      long long v123 = v50;
      time_t v121 = 0xAAAAAAAAAAAAAAAALL;
      time(&v121);
      long long v51 = localtime(&v121);
      strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v51);
      dprintf(dword_100010220, "%s ", v122);
      int v52 = dword_100010220;
      uint64_t v53 = __error();
      uint64_t v119 = v130;
      uint64_t v120 = strerror(*v53);
      uint64_t v24 = "Error: Could not stat %s (%s)\n";
LABEL_28:
      int v25 = v52;
      goto LABEL_14;
    }
    int v65 = open(v130, 0);
    if (qword_100010218) {
      v72 = qword_100010218;
    }
    else {
      v72 = &_os_log_default;
    }
    if (v65 < 0)
    {
      uint64_t v85 = __error();
      strerror(*v85);
      sub_100008124(v72, "Could not Open file %s (%s)\n", v86, v87, v88, v89, v90, v91, (char)v130);
      if (!dword_100010220) {
        return 0;
      }
      *(void *)&long long v92 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v92 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v128 = v92;
      long long v129 = v92;
      long long v126 = v92;
      long long v127 = v92;
      long long v124 = v92;
      long long v125 = v92;
      *(_OWORD *)v122 = v92;
      long long v123 = v92;
      time_t v121 = 0xAAAAAAAAAAAAAAAALL;
      time(&v121);
      long long v93 = localtime(&v121);
      strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v93);
      dprintf(dword_100010220, "%s ", v122);
      int v52 = dword_100010220;
      uint64_t v94 = __error();
      uint64_t v119 = v130;
      uint64_t v120 = strerror(*v94);
      uint64_t v24 = "Could not Open file %s (%s)\n";
      goto LABEL_28;
    }
    int v73 = v65;
    sub_100008124(v72, "Copying \"%s\", file size = %d bytes\n", v66, v67, v68, v69, v70, v71, (char)v130);
    if (dword_100010220)
    {
      *(void *)&long long v79 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v79 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v128 = v79;
      long long v129 = v79;
      long long v126 = v79;
      long long v127 = v79;
      long long v124 = v79;
      long long v125 = v79;
      *(_OWORD *)v122 = v79;
      long long v123 = v79;
      time_t v121 = 0xAAAAAAAAAAAAAAAALL;
      time(&v121);
      long long v80 = localtime(&v121);
      strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v80);
      dprintf(dword_100010220, "%s ", v122);
      dprintf(dword_100010220, "Copying \"%s\", file size = %d bytes\n", v130, LODWORD(v131.st_size));
    }
    off_t st_size = v131.st_size;
    if (v131.st_size > (unint64_t)*a3)
    {
      if (qword_100010218) {
        CFNumberRef v82 = qword_100010218;
      }
      else {
        CFNumberRef v82 = &_os_log_default;
      }
      sub_100008284(v82, "Error: copyDataFromFile ilestat.st_size %lld is bigger then supplied buffer %lld\n", v131.st_size, v74, v75, v76, v77, v78, v131.st_size);
      if (dword_100010220)
      {
        *(void *)&long long v83 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v83 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v128 = v83;
        long long v129 = v83;
        long long v126 = v83;
        long long v127 = v83;
        long long v124 = v83;
        long long v125 = v83;
        *(_OWORD *)v122 = v83;
        long long v123 = v83;
        time_t v121 = 0xAAAAAAAAAAAAAAAALL;
        time(&v121);
        CFTypeID v84 = localtime(&v121);
        strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v84);
        dprintf(dword_100010220, "%s ", v122);
        dprintf(dword_100010220, "Error: copyDataFromFile ilestat.st_size %lld is bigger then supplied buffer %lld\n", v131.st_size, *a3);
      }
      close(v73);
      return 0;
    }
    *a3 = v131.st_size;
    ssize_t v95 = read(v73, a2, st_size);
    if (v95 < 0)
    {
      uint64_t v103 = qword_100010218;
      long long v104 = __error();
      if (!v103) {
        uint64_t v103 = &_os_log_default;
      }
      strerror(*v104);
      sub_100008284(v103, "Error: read %s (%s)\n", v105, v106, v107, v108, v109, v110, (char)a1);
      if (dword_100010220)
      {
        *(void *)&long long v111 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v111 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v128 = v111;
        long long v129 = v111;
        long long v126 = v111;
        long long v127 = v111;
        long long v124 = v111;
        long long v125 = v111;
        *(_OWORD *)v122 = v111;
        long long v123 = v111;
        time_t v121 = 0xAAAAAAAAAAAAAAAALL;
        time(&v121);
        long long v112 = localtime(&v121);
        strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v112);
        dprintf(dword_100010220, "%s ", v122);
        int v113 = dword_100010220;
        uint64_t v114 = __error();
        strerror(*v114);
        dprintf(v113, "Error: read %s (%s)\n");
      }
    }
    else
    {
      char v102 = v95;
      if (v95 == v131.st_size)
      {
        uint64_t v29 = 1;
LABEL_62:
        close(v73);
        return v29;
      }
      if (qword_100010218) {
        char v115 = qword_100010218;
      }
      else {
        char v115 = &_os_log_default;
      }
      sub_100008284(v115, "Error: Only read %ld of %d files\n", v96, v97, v98, v99, v100, v101, v102);
      if (dword_100010220)
      {
        *(void *)&long long v116 = 0xAAAAAAAAAAAAAAAALL;
        *((void *)&v116 + 1) = 0xAAAAAAAAAAAAAAAALL;
        long long v128 = v116;
        long long v129 = v116;
        long long v126 = v116;
        long long v127 = v116;
        long long v124 = v116;
        long long v125 = v116;
        *(_OWORD *)v122 = v116;
        long long v123 = v116;
        time_t v121 = 0xAAAAAAAAAAAAAAAALL;
        time(&v121);
        uint64_t v117 = localtime(&v121);
        strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v117);
        dprintf(dword_100010220, "%s ", v122);
        dprintf(dword_100010220, "Error: Only read %ld of %d files\n");
      }
    }
    uint64_t v29 = 0;
    goto LABEL_62;
  }
  unint64_t v12 = qword_100010218;
  uint64_t v13 = __error();
  if (!v12) {
    unint64_t v12 = &_os_log_default;
  }
  strerror(*v13);
  sub_100008284(v12, "Error: Could not stat %s (%s)\n", v14, v15, v16, v17, v18, v19, (char)a1);
  if (!dword_100010220) {
    return 0;
  }
  *(void *)&long long v20 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v128 = v20;
  long long v129 = v20;
  long long v126 = v20;
  long long v127 = v20;
  long long v124 = v20;
  long long v125 = v20;
  *(_OWORD *)v122 = v20;
  long long v123 = v20;
  time_t v121 = 0xAAAAAAAAAAAAAAAALL;
  time(&v121);
  uint64_t v21 = localtime(&v121);
  strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v21);
  dprintf(dword_100010220, "%s ", v122);
  int v22 = dword_100010220;
  uint64_t v23 = __error();
  uint64_t v119 = (char *)a1;
  uint64_t v120 = strerror(*v23);
  uint64_t v24 = "Error: Could not stat %s (%s)\n";
LABEL_8:
  int v25 = v22;
LABEL_14:
  dprintf(v25, v24, v119, v120);
  return 0;
}

CFMutableStringRef sub_100008C00(const __CFArray *a1, const void *a2, _DWORD *a3, const __CFString *a4)
{
  *a3 = -1;
  if (!a1) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1) {
    return 0;
  }
  CFIndex v9 = Count;
  CFIndex v10 = 0;
  while (1)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v10);
    if (!CFDictionaryGetValue(ValueAtIndex, a2)) {
      goto LABEL_12;
    }
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, a2);
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 255, Value);
    if (!MutableCopy) {
      goto LABEL_12;
    }
    CFStringRef v14 = MutableCopy;
    CFTypeID v15 = CFGetTypeID(MutableCopy);
    if (v15 == CFStringGetTypeID())
    {
      off_t v19 = 0xAAAAAAAAAAAAAAAALL;
      CFMutableStringRef v16 = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, a4);
      CFStringAppend(v16, v14);
      char CStringPtr = CFStringGetCStringPtr(v16, 0);
      if ((sub_100007CC0(CStringPtr, &v19) & 1) == 0)
      {
        CFRelease(v16);
        goto LABEL_11;
      }
      if (v16) {
        break;
      }
    }
LABEL_11:
    CFRelease(v14);
LABEL_12:
    if (v9 == ++v10) {
      return 0;
    }
  }
  CFRelease(v14);
  *a3 = v10;
  return v16;
}

BOOL sub_100008D78(BOOL result, const void *a2)
{
  if (result)
  {
    CFArrayRef v3 = (const __CFArray *)result;
    CFIndex Count = CFArrayGetCount((CFArrayRef)result);
    CFIndex v5 = Count - 1;
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      CFIndex v6 = 0;
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v6);
        CFStringRef Value = CFDictionaryGetValue(ValueAtIndex, a2);
        uint64_t result = Value != 0;
        if (Value) {
          break;
        }
      }
      while (v5 != v6++);
    }
  }
  return result;
}

uint64_t AMFDRSealingMapCopyLocalDictForClass()
{
  return _AMFDRSealingMapCopyLocalDictForClass();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
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

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return _CFDataCreateWithBytesNoCopy(allocator, bytes, length, bytesDeallocator);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithStream(allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFReadStreamCreateWithFile(alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return _CFRunLoopTimerCreate(allocator, fireDate, interval, flags, order, callout, context);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return _CFStringCreateFromExternalRepresentation(alloc, data, encoding);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
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

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
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

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

uint64_t CoreCaptureControlCreate()
{
  return _CoreCaptureControlCreate();
}

uint64_t CoreCaptureControlStart()
{
  return _CoreCaptureControlStart();
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return _IOConnectMapMemory(connect, memoryType, intoTask, atAddress, ofSize, options);
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

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return _IOObjectCopyClass(object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithDescription(AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, Timeout, TimeoutAction, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

kern_return_t IORegistryCreateIterator(mach_port_t mainPort, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryCreateIterator(mainPort, plane, options, iterator);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

io_registry_entry_t IORegistryGetRootEntry(mach_port_t mainPort)
{
  return _IORegistryGetRootEntry(mainPort);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesGetValue(prefs, key);
}

uint64_t _CFRuntimeCreateInstance()
{
  return __CFRuntimeCreateInstance();
}

uint64_t _CFRuntimeRegisterClass()
{
  return __CFRuntimeRegisterClass();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

int dprintf(int a1, const char *a2, ...)
{
  return _dprintf(a1, a2);
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

int lstat(const char *a1, stat *a2)
{
  return _lstat(a1, a2);
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return _pthread_once(a1, a2);
}

int puts(const char *a1)
{
  return _puts(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

void sandbox_free_error(char *errorbuf)
{
}

int sandbox_init(const char *profile, uint64_t flags, char **errorbuf)
{
  return _sandbox_init(profile, flags, errorbuf);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return _strcasestr(__big, __little);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return _strlcat(__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}