uint64_t start()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.streamingzip", "conduit");
  v1 = (void *)qword_10000C108;
  qword_10000C108 = (uint64_t)v0;

  lockdown_checkin_xpc();
  CFRunLoopRun();
  return 0;
}

void sub_100004278(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  uint64_t v112 = 0;
  v113 = &v112;
  uint64_t v114 = 0x2020000000;
  uint64_t v115 = 0;
  uint64_t v106 = 0;
  v107 = &v106;
  uint64_t v108 = 0x3032000000;
  v109 = sub_100005510;
  v110 = sub_100005520;
  id v111 = 0;
  v5 = malloc_type_calloc(1uLL, 0x38uLL, 0x1060040262EED4CuLL);
  void *v5 = a2;
  CFTypeRef v6 = CFRetain(a3);
  v5[2] = 0;
  v5[1] = v6;
  *((unsigned char *)v5 + 48) = 0;
  v5[5] = 0;
  v5[3] = 0;
  uint64_t v94 = mach_absolute_time();
  *(void *)buf = 0;
  int v7 = lockdown_receive_message();
  int v8 = v7;
  v9 = *(void **)buf;
  if (v7 || !*(void *)buf)
  {
    if (v7)
    {
      v16 = qword_10000C108;
      if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)handler = 67109120;
        *(_DWORD *)&handler[4] = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "lockdown_receive_message returned error %x", handler, 8u);
        v9 = *(void **)buf;
        if (!*(void *)buf) {
          goto LABEL_23;
        }
        goto LABEL_22;
      }
    }
LABEL_21:
    if (!v9) {
      goto LABEL_23;
    }
LABEL_22:
    CFRelease(v9);
    goto LABEL_23;
  }
  CFTypeID v10 = CFGetTypeID(*(CFTypeRef *)buf);
  CFTypeID TypeID = CFDictionaryGetTypeID();
  v9 = *(void **)buf;
  if (v10 != TypeID) {
    goto LABEL_21;
  }
  if (!*(void *)buf)
  {
LABEL_23:
    v17 = (id)qword_10000C108;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      Value = CFDictionaryGetValue(a3, kLockdownCheckinClientNameKey);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = Value;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to receive initial message from client %@", buf, 0xCu);
    }

    sub_100005528((uint64_t)v5, @"NoInitialMessage");
    v9 = 0;
    goto LABEL_26;
  }
  v101 = [*(id *)buf objectForKeyedSubscript:@"MediaSubdir"];
  if (!v101)
  {
    v22 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to get destination directory from client message", buf, 2u);
    }
    sub_100005528((uint64_t)v5, @"MalformedSetupMessage");
LABEL_26:
    v18 = 0;
    v19 = 0;
    id v15 = 0;
    v20 = 0;
    v97 = 0;
    v98 = 0;
    id v21 = 0;
    v13 = 0;
    v99 = 0;
    v100 = 0;
    v101 = 0;
LABEL_27:
    sub_100006138(v5);
    goto LABEL_28;
  }
  v12 = NSHomeDirectory();
  v100 = [v12 stringByAppendingPathComponent:@"Media"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Destination directory in client message was not a string", buf, 2u);
    }
    sub_100005528((uint64_t)v5, @"MalformedSetupMessage");
    v18 = 0;
    v19 = 0;
    id v15 = 0;
    v20 = 0;
    v97 = 0;
    v98 = 0;
    id v21 = 0;
    v13 = 0;
    v99 = 0;
    goto LABEL_27;
  }
  v99 = [v100 stringByAppendingPathComponent:v101];
  v13 = [v99 stringByResolvingSymlinksInPath];
  if (([v13 hasPrefix:v100] & 1) == 0)
  {
    v25 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Dest path specified resolved to unpermitted path: %@", buf, 0xCu);
    }
    sub_100005528((uint64_t)v5, @"InvalidPath");
    v18 = 0;
    v19 = 0;
    id v15 = 0;
    v20 = 0;
    v97 = 0;
    v98 = 0;
    goto LABEL_63;
  }
  v97 = [v9 objectForKeyedSubscript:@"InstallTransferredDirectory"];
  if (v97)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v97 BOOLValue]) {
        v5[2] = v13;
      }
    }
  }
  v98 = [v9 objectForKeyedSubscript:@"UserInitiatedTransfer"];
  if (v98)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v98 BOOLValue]) {
        *((unsigned char *)v5 + 49) = 1;
      }
    }
  }
  v14 = [v9 objectForKeyedSubscript:@"SpringBoardIconLayoutData"];
  if (!v14) {
    goto LABEL_43;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "SpringBoard icon layout value was not data; ignoring",
        buf,
        2u);
    }

LABEL_43:
    id v15 = 0;
    goto LABEL_44;
  }
  id v15 = v14;
  v5[3] = v15;
LABEL_44:
  v19 = [v9 objectForKeyedSubscript:@"InstallOptionsDictionary"];
  if (v19)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v27 = v19;
      v5[4] = v27;
      v28 = [v27 objectForKeyedSubscript:@"IsUserInitiated"];
      if (v28)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v28 BOOLValue]) {
            *((unsigned char *)v5 + 49) = 1;
          }
        }
      }
      v29 = [v27 objectForKeyedSubscript:@"PackageType"];
      if ((MGGetBoolAnswer() & 1) == 0 && [v29 isEqualToString:@"System"])
      {
        id v90 = v28;
        v30 = qword_10000C108;
        if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Installing system apps from the host is prohibited.", buf, 2u);
        }
        sub_100005528((uint64_t)v5, @"InstallationProhibited");

        v18 = 0;
        v20 = 0;
        goto LABEL_96;
      }
    }
  }
  v20 = [v9 objectForKeyedSubscript:@"PassThroughFileWithLength"];
  if (v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5[5] = [v20 longLongValue];
    }
  }
  v31 = +[NSFileManager defaultManager];
  [v31 removeItemAtPath:v13 error:0];

  v32 = +[NSFileManager defaultManager];
  unsigned int v33 = [v32 fileExistsAtPath:v13];

  if (v33)
  {
    v34 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Item exists at destination path %@", buf, 0xCu);
    }
    sub_100005528((uint64_t)v5, @"DestinationExists");
    v18 = 0;
LABEL_63:
    id v21 = 0;
    goto LABEL_27;
  }
  if (v20)
  {
    id v90 = [v13 stringByDeletingLastPathComponent];
    int v35 = mkpath_np((const char *)[v90 fileSystemRepresentation], 0x1EDu);
    int v36 = v35;
    if (v35 && v35 != 17)
    {
      v54 = (id)qword_10000C108;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v68 = strerror(v36);
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v90;
        *(_WORD *)&buf[22] = 2080;
        *(void *)&buf[24] = v68;
        _os_log_error_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Failed to make parent directory of %@ at %@: %s", buf, 0x20u);
      }

      if (v36 == 28) {
        CFStringRef v55 = @"NoSpace";
      }
      else {
        CFStringRef v55 = @"SetupFailed";
      }
      sub_100005528((uint64_t)v5, (uint64_t)v55);
    }
    else
    {
      id v37 = v13;
      int v38 = open_dprotected_np((const char *)[v37 fileSystemRepresentation], 2818, 4, 0, 420);
      if ((v38 & 0x80000000) == 0)
      {
        int v88 = v38;
        v18 = 0;
        id v21 = 0;

        goto LABEL_69;
      }
      v56 = (id)qword_10000C108;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        v69 = __error();
        v70 = strerror(*v69);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v37;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v70;
        _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Failed to open pass through file at %@ : %s", buf, 0x16u);
      }

      sub_100005528((uint64_t)v5, @"SetupFailed");
    }
    v18 = 0;
LABEL_96:
    id v21 = 0;

    goto LABEL_27;
  }
  id v92 = v13;
  int v44 = mkpath_np((const char *)[v92 fileSystemRepresentation], 0x1EDu);
  int v45 = v44;
  if (v44 != 17)
  {
    if (v44)
    {
      v57 = (id)qword_10000C108;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        v71 = strerror(v45);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v92;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v71;
        _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "Failed to create dest path %@ : %s", buf, 0x16u);
      }

      if (v45 == 28) {
        CFStringRef v58 = @"NoSpace";
      }
      else {
        CFStringRef v58 = @"InvalidPath";
      }
      goto LABEL_114;
    }
    id v89 = v92;
    int v46 = open((const char *)[v89 fileSystemRepresentation], 1048832);
    int v47 = v46;
    if (v46 < 0)
    {
      v66 = (void *)qword_10000C108;
      if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
      {
        id v76 = v89;
        v77 = v66;
        id v78 = [v76 fileSystemRepresentation];
        v79 = __error();
        v80 = strerror(*v79);
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = v78;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v80;
        _os_log_error_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "Failed to open %s : %s", buf, 0x16u);
      }
    }
    else
    {
      int v87 = fcntl(v46, 64, 4);
      if (v87)
      {
        v48 = (void *)qword_10000C108;
        if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
        {
          id v84 = v89;
          v73 = v48;
          id v85 = [v84 fileSystemRepresentation];
          v74 = __error();
          v75 = strerror(*v74);
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = v85;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 4;
          *(_WORD *)&buf[18] = 2080;
          *(void *)&buf[20] = v75;
          _os_log_error_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "Failed to set protection class on %s to %d: %s", buf, 0x1Cu);
        }
      }
      close(v47);

      if (!v87) {
        goto LABEL_81;
      }
    }
    v64 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v65 = "Failed to set protection class";
      goto LABEL_122;
    }
LABEL_113:
    CFStringRef v58 = @"SetupFailed";
LABEL_114:
    sub_100005528((uint64_t)v5, (uint64_t)v58);
    v18 = 0;
    v20 = 0;
    id v21 = 0;
    v13 = v92;
    goto LABEL_27;
  }
LABEL_81:
  id v49 = objc_alloc((Class)SZExtractor);
  uint64_t v119 = SZExtractorOptionsDenyInvalidSymlinks;
  v120 = &__kCFBooleanTrue;
  v50 = +[NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
  id v21 = [v49 initWithPath:v92 options:v50];

  if (!v21)
  {
    v64 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v65 = "Failed to set up extractor";
LABEL_122:
      _os_log_error_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, v65, buf, 2u);
      goto LABEL_113;
    }
    goto LABEL_113;
  }
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_100005614;
  v102[3] = &unk_1000083A0;
  v104 = &v106;
  v105 = &v112;
  v18 = dispatch_semaphore_create(0);
  v103 = v18;
  [v21 prepareForExtraction:v102];
  dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  if (v107[5])
  {
    uint64_t v51 = v107[5];
    v52 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v51;
      _os_log_error_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "-prepareForExtraction returned error %@", buf, 0xCu);
    }
    CFStringRef v53 = @"SetupFailed";
LABEL_119:
    sub_100005528((uint64_t)v5, (uint64_t)v53);
    v20 = 0;

    goto LABEL_27;
  }
  if (v113[3])
  {
    v67 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v92;
      _os_log_error_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "Item exists at destination path %@", buf, 0xCu);
    }
    CFStringRef v53 = @"DestinationExists";
    goto LABEL_119;
  }
  int v88 = -1;

LABEL_69:
  unsigned int socket = lockdown_get_socket();
  if ((socket & 0x80000000) != 0)
  {
    v59 = (id)qword_10000C108;
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v72 = CFDictionaryGetValue(a3, kLockdownCheckinClientNameKey);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v72;
      _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "Failed to get socket for connection from client %@", buf, 0xCu);
    }

    sub_100005528((uint64_t)v5, @"NoSocket");
    goto LABEL_27;
  }
  id v91 = v21;
  dispatch_semaphore_t v40 = dispatch_semaphore_create(0);
  v41 = malloc_type_valloc(0x100000uLL, 0xF4337BF3uLL);
  v117[0] = 0;
  v117[1] = v117;
  v117[2] = 0x3032000000;
  v117[3] = sub_100005510;
  v117[4] = sub_100005520;
  id v118 = 0;
  v116[0] = 0;
  v116[1] = v116;
  v116[2] = 0x2020000000;
  v116[3] = 0;
  v82 = (void *)os_transaction_create();
  dispatch_semaphore_t v83 = v40;
  v86 = v41;
  if (*((unsigned char *)v5 + 49))
  {
    v42 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Receiving transfer as QOS_CLASS_USER_INITIATED", buf, 2u);
    }
    intptr_t v43 = 25;
  }
  else
  {
    intptr_t v43 = 9;
  }
  v81 = dispatch_get_global_queue(v43, 0);
  v60 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, socket, 0, v81);
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = sub_100005694;
  *(void *)&buf[24] = &unk_100008488;
  uint64_t v140 = v94;
  v138 = v116;
  int v143 = v88;
  id v95 = v91;
  id v135 = v95;
  v139 = v117;
  v61 = v83;
  v141 = v5;
  v142 = v86;
  v136 = v61;
  id v137 = v82;
  id v93 = v82;
  dispatch_source_set_cancel_handler(v60, buf);
  *(void *)handler = _NSConcreteStackBlock;
  uint64_t v122 = 3221225472;
  v123 = sub_100005CE4;
  v124 = &unk_100008488;
  v131 = v86;
  uint64_t v132 = 0x100000;
  int v133 = v88;
  v125 = v60;
  id v126 = v95;
  v127 = v61;
  v129 = v117;
  v130 = v5;
  v128 = v116;
  v62 = v60;
  id v21 = v95;
  v63 = v61;
  dispatch_source_set_event_handler(v62, handler);
  dispatch_resume(v62);

  _Block_object_dispose(v116, 8);
  _Block_object_dispose(v117, 8);

LABEL_28:
  _Block_object_dispose(&v106, 8);

  _Block_object_dispose(&v112, 8);
}

void sub_100005490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t sub_100005510(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005520(uint64_t a1)
{
}

void sub_100005528(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = a1;
    *(unsigned char *)(a1 + 48) = 1;
    CFStringRef v6 = @"Error";
    uint64_t v7 = a2;
    v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
    LOBYTE(v2) = sub_10000676C(v2, v3);

    if ((v2 & 1) == 0)
    {
      v4 = qword_10000C108;
      if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Could not send error response to host", v5, 2u);
      }
    }
  }
}

void sub_100005614(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005694(uint64_t a1)
{
  uint64_t v2 = mach_absolute_time();
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  v3 = qword_10000C108;
  if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    LODWORD(v4) = info.numer;
    LODWORD(v5) = info.denom;
    double v38 = (double)v4 / (double)v5 * (double)(v2 - *(void *)(a1 + 72)) / 1000000000.0;
    *(_DWORD *)buf = 134218496;
    CFIndex v58 = v37;
    __int16 v59 = 2048;
    double v60 = v38;
    __int16 v61 = 2048;
    double v62 = (double)(v37 >> 20) / v38;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Transferred %llu archived bytes in %.3f seconds (%.3f MB/sec)", buf, 0x20u);
  }
  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 0x80000000) == 0) {
    close(v6);
  }
  uint64_t v7 = *(void **)(a1 + 32);
  if (v7)
  {
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_10000630C;
    v51[3] = &unk_1000083C8;
    uint64_t v53 = *(void *)(a1 + 64);
    id v52 = *(id *)(a1 + 40);
    [v7 finishStreamWithCompletionBlock:v51];
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
  }
  int v8 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v8)
  {
    v9 = [v8 domain];
    if ([v9 isEqualToString:NSPOSIXErrorDomain])
    {
      id v10 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) code];

      if (v10 == (id)28)
      {
        CFStringRef v11 = @"NoSpace";
LABEL_16:
        uint64_t v15 = *(void *)(a1 + 80);
        goto LABEL_17;
      }
    }
    else
    {
    }
    CFStringRef v11 = @"ExtractionFailed";
    goto LABEL_16;
  }
  uint64_t v12 = *(void *)(a1 + 80);
  if (!*(void *)(v12 + 16))
  {
    sub_100006680(v12);
    goto LABEL_18;
  }
  v13 = +[MCProfileConnection sharedConnection];
  unsigned int v14 = [v13 effectiveBoolValueForSetting:MCFeatureAppInstallationAllowed];

  uint64_t v15 = *(void *)(a1 + 80);
  if (v14 == 2)
  {
    CFStringRef v11 = @"InstallationProhibited";
LABEL_17:
    sub_100005528(v15, (uint64_t)v11);
    v16 = +[NSFileManager defaultManager];
    [v16 removeItemAtPath:*(void *)(*(void *)(a1 + 80) + 16) error:0];

    goto LABEL_18;
  }
  CFDataRef v17 = *(const __CFData **)(v15 + 24);
  if (v17)
  {
    v18 = (void *)qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_DEBUG))
    {
      v39 = v18;
      CFIndex Length = CFDataGetLength(v17);
      *(_DWORD *)buf = 134217984;
      CFIndex v58 = Length;
      _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "Sending icon state with length %ld", buf, 0xCu);
    }
    SBSSpringBoardBlockableServerPort();
    CFDataGetBytePtr(*(CFDataRef *)(*(void *)(a1 + 80) + 24));
    CFDataGetLength(*(CFDataRef *)(*(void *)(a1 + 80) + 24));
    int v19 = SBSetIconState();
    if (v19)
    {
      int v20 = v19;
      id v21 = qword_10000C108;
      if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v58) = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "SBSetIconState returned 0x%x", buf, 8u);
      }
    }
  }
  v22 = +[NSURL fileURLWithPath:*(void *)(*(void *)(a1 + 80) + 16)];
  id v23 = *(id *)(*(void *)(a1 + 80) + 32);
  if (!v23)
  {
    uint64_t v55 = LSPackageTypeKey;
    uint64_t v56 = LSPackageTypeCustomer;
    id v23 = +[NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  }
  id v24 = [v23 mutableCopy];
  [v24 setObject:&__kCFBooleanTrue forKeyedSubscript:@"AllowInstallLocalProvisioned"];
  v25 = +[UMUserManager sharedManager];
  unsigned int v26 = [v25 isMultiUser];

  if (v26)
  {
    dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
    v28 = +[UMUserManager sharedManager];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000063E8;
    v49[3] = &unk_1000083F0;
    dispatch_semaphore_t v50 = v27;
    v29 = v27;
    [v28 terminateSyncWithCompletionHandler:v49];

    dispatch_semaphore_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
  }
  dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
  id v31 = [objc_alloc((Class)MIInstallOptions) initWithLegacyOptionsDictionary:v24];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_1000063F0;
  v48[3] = &unk_100008410;
  v48[4] = *(void *)(a1 + 80);
  v32 = objc_retainBlock(v48);
  v41 = _NSConcreteStackBlock;
  uint64_t v42 = 3221225472;
  intptr_t v43 = sub_1000064E4;
  int v44 = &unk_100008438;
  id v33 = v22;
  uint64_t v34 = *(void *)(a1 + 80);
  id v45 = v33;
  uint64_t v47 = v34;
  int v35 = v30;
  int v46 = v35;
  +[IXAppInstallCoordinator installApplication:v33 consumeSource:1 options:v31 legacyProgressBlock:v32 completion:&v41];
  dispatch_semaphore_wait(v35, 0xFFFFFFFFFFFFFFFFLL);
  if (v26)
  {
    int v36 = +[UMUserManager sharedManager];
    [v36 resumeSync];
  }
LABEL_18:
  sub_100006138(*(uint64_t **)(a1 + 80));
  free(*(void **)(a1 + 88));
}

void sub_100005CE4(uint64_t a1)
{
  uint64_t v2 = lockdown_recv();
  uint64_t v3 = v2;
  if (v2 < 0)
  {
    v9 = (void *)qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      id v10 = v9;
      CFStringRef v11 = __error();
      uint64_t v12 = strerror(*v11);
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "lockdown_recv returned %zd and error %s", buf, 0x16u);
    }
    goto LABEL_14;
  }
  if (!v2)
  {
    v13 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "lockdown_recv returned 0; canceling",
        buf,
        2u);
    }
    goto LABEL_14;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += v2;
  unint64_t v4 = qword_10000C108;
  if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "lockdown_recv returned %zd", buf, 0xCu);
  }
  int v5 = *(_DWORD *)(a1 + 96);
  if (v5 < 0 || *(void *)(a1 + 40))
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v36) = 0;
    int v6 = +[NSData dataWithBytesNoCopy:*(void *)(a1 + 80) length:v3 freeWhenDone:0];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100006214;
    v31[3] = &unk_100008460;
    uint64_t v7 = *(void *)(a1 + 64);
    id v33 = buf;
    uint64_t v34 = v7;
    int v8 = *(void **)(a1 + 40);
    id v32 = *(id *)(a1 + 48);
    [v8 supplyBytes:v6 withCompletionBlock:v31];
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL);
    if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    }

    _Block_object_dispose(buf, 8);
    return;
  }
  uint64_t v14 = *(void *)(a1 + 72);
  uint64_t v15 = *(void *)(v14 + 40);
  uint64_t v16 = v15 - v3;
  if (v15 < v3)
  {
    CFDataRef v17 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Received %ld bytes but only %lld bytes remain!", buf, 0x16u);
    }
    uint64_t v18 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:5 userInfo:0];
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
    int v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

LABEL_14:
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    return;
  }
  uint64_t v21 = 0;
  *(void *)(v14 + 40) = v16;
  uint64_t v22 = *(void *)(a1 + 80);
  while (v3 != v21)
  {
    ssize_t v23 = write(v5, (const void *)(v22 + v21), v3 - v21);
    v21 += v23;
    if (v23 < 0)
    {
      if (v3 != -1)
      {
        uint64_t v24 = *__error();
        v25 = (void *)qword_10000C108;
        if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
        {
          v29 = v25;
          dispatch_semaphore_t v30 = strerror(v24);
          *(_DWORD *)buf = 134218498;
          *(void *)&uint8_t buf[4] = v3;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = -1;
          *(_WORD *)&buf[22] = 2080;
          int v36 = v30;
          _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to write %ld bytes to passthrough file: write returned %ld : %s", buf, 0x20u);
        }
        uint64_t v26 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v24 userInfo:0];
        uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
        v28 = *(void **)(v27 + 40);
        *(void *)(v27 + 40) = v26;

        dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
      }
      break;
    }
  }
  if (*(uint64_t *)(*(void *)(a1 + 72) + 40) <= 0) {
    goto LABEL_14;
  }
}

void sub_100006118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006138(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    dispatch_time_t v3 = dispatch_time(0, 5000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000620C;
    block[3] = &unk_1000084A8;
    block[4] = v2;
    dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  unint64_t v4 = (const void *)a1[1];
  if (v4) {
    CFRelease(v4);
  }
  int v5 = (const void *)a1[2];
  if (v5) {
    CFRelease(v5);
  }
  int v6 = (const void *)a1[3];
  if (v6) {
    CFRelease(v6);
  }
  uint64_t v7 = (const void *)a1[4];
  if (v7) {
    CFRelease(v7);
  }
  free(a1);
}

uint64_t sub_10000620C(uint64_t a1)
{
  return _lockdown_disconnect(*(void *)(a1 + 32));
}

void sub_100006214(uint64_t a1, void *a2, int a3)
{
  id v6 = a2;
  uint64_t v7 = v6;
  if (v6 || a3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    if (v6)
    {
      int v8 = qword_10000C108;
      if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        id v10 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Stream extractor got error: %@", (uint8_t *)&v9, 0xCu);
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000630C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    int v5 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to finish extraction: %@", (uint8_t *)&v6, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_1000063E8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000063F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  CFStringRef v8 = @"InstallProgressDict";
  id v9 = v3;
  int v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  LOBYTE(v4) = sub_10000676C(v4, v5);

  if ((v4 & 1) == 0)
  {
    int v6 = qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to send install progress", v7, 2u);
    }
  }
}

void sub_1000064E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)qword_10000C108;
    if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void **)(a1 + 32);
      v13 = v7;
      uint64_t v14 = [v12 path];
      int v15 = 138412546;
      uint64_t v16 = v14;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to install application at %@ : %@", (uint8_t *)&v15, 0x16u);
    }
    CFStringRef v8 = [v6 domain];
    if ([v8 isEqualToString:IXUserPresentableErrorDomain])
    {
      id v9 = [v6 code];

      if (v9 == (id)11)
      {
        CFStringRef v10 = @"NoSpace";
LABEL_10:
        sub_100005528(*(void *)(a1 + 48), (uint64_t)v10);
        CFStringRef v11 = +[NSFileManager defaultManager];
        [v11 removeItemAtPath:*(void *)(*(void *)(a1 + 48) + 16) error:0];

        goto LABEL_11;
      }
    }
    else
    {
    }
    CFStringRef v10 = @"InstallationFailed";
    goto LABEL_10;
  }
  sub_100006680(*(void *)(a1 + 48));
LABEL_11:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100006680(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v1 = a1;
    CFStringRef v5 = @"Status";
    CFStringRef v6 = @"DataComplete";
    uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];
    LOBYTE(v1) = sub_10000676C(v1, v2);

    if ((v1 & 1) == 0)
    {
      id v3 = qword_10000C108;
      if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Could not send error response to host", v4, 2u);
      }
    }
  }
}

uint64_t sub_10000676C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    int v4 = lockdown_send_message();
    if (v4)
    {
      int v5 = v4;
      CFStringRef v6 = qword_10000C108;
      if (os_log_type_enabled((os_log_t)qword_10000C108, OS_LOG_TYPE_ERROR))
      {
        v8[0] = 67109120;
        v8[1] = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Got error %x from lockdown_send_message", (uint8_t *)v8, 8u);
      }
      a1 = 0;
    }
    else
    {
      a1 = 1;
    }
  }

  return a1;
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopRun(void)
{
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

uint64_t SBSSpringBoardBlockableServerPort()
{
  return _SBSSpringBoardBlockableServerPort();
}

uint64_t SBSetIconState()
{
  return _SBSetIconState();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_resume(dispatch_object_t object)
{
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

uint64_t lockdown_checkin_xpc()
{
  return _lockdown_checkin_xpc();
}

uint64_t lockdown_get_socket()
{
  return _lockdown_get_socket();
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

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_valloc(size, type_id);
}

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return _open_dprotected_np(a1, a2, a3, a4);
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

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isMultiUser];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_resumeSync(void *a1, const char *a2, ...)
{
  return [a1 resumeSync];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByResolvingSymlinksInPath];
}

id objc_msgSend_terminateSyncWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 terminateSyncWithCompletionHandler:];
}