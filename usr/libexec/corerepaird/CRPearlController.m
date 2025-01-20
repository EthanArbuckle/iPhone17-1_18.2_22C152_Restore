@interface CRPearlController
- (id)_copyCombinedFDRData:(id)a3 withError:(id *)a4;
- (id)decompressPearlFrames;
- (id)updateBrunorDATFirmware;
- (id)updateSavageDATFirmware;
- (id)verifyPSD3;
@end

@implementation CRPearlController

- (id)decompressPearlFrames
{
  v3 = handleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[CRPearlController decompressPearlFrames]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v4 = +[NSFileManager defaultManager];
  unsigned int v5 = [v4 fileExistsAtPath:@"/var/hardware/Pearl"];

  if (v5)
  {
    v6 = handleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = @"/var/hardware/Pearl";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ directory exists, deleting...", buf, 0xCu);
    }

    v7 = +[NSFileManager defaultManager];
    id v23 = 0;
    unsigned int v8 = [v7 removeItemAtPath:@"/var/hardware/Pearl" error:&v23];
    id v9 = v23;

    if (!v8 || v9)
    {
      v19 = handleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10003E048((uint64_t)v9, v19);
      }

      sub_1000052D4((void *)0xFFFFFFFFFFFFFFD6, @"Failed to delete existing Pearl Data", v9);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  id v22 = 0;
  id v9 = [(CRPearlController *)self _copyCombinedFDRData:@"prf1" withError:&v22];
  id v10 = v22;
  v11 = v10;
  if (!v9 || v10)
  {
    v17 = sub_1000052D4((void *)0xFFFFFFFFFFFFFFD6, @"Found no prf1 data", v10);

    id v18 = v17;
LABEL_16:
    id v16 = v18;
    goto LABEL_17;
  }
  id v9 = v9;
  uint64_t v12 = decompressReferenceFrames([v9 bytes], (size_t)[v9 length], (uint64_t)[@"/private/var/hardware/Pearl" cStringUsingEncoding:4]);
  if (v12)
  {
    uint64_t v13 = v12;
    v14 = +[NSError errorWithDomain:@"BiometricError" code:(int)v12 userInfo:0];
    v15 = +[NSString stringWithFormat:@"Failed to decompress Pearl frames, error: 0x%x", v13];
    sub_1000052D4((void *)0xFFFFFFFFFFFFFFF7, v15, v14);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = handleForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Decompress Pearl frames successfully", buf, 2u);
    }

    id v16 = 0;
  }
LABEL_17:

  return v16;
}

- (id)_copyCombinedFDRData:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  v6 = handleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 136315138;
    *(id *)((char *)buf + 4) = "-[CRPearlController _copyCombinedFDRData:withError:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)buf, 0xCu);
  }

  buf[0] = 0;
  v10[0] = @"GetCombined";
  v10[1] = @"StripImg4";
  v11[0] = &__kCFBooleanTrue;
  v11[1] = &__kCFBooleanFalse;
  v10[2] = @"VerifyData";
  v11[2] = &__kCFBooleanFalse;
  v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  unsigned int v8 = (void *)AMFDRSealingManifestCopyLocalDataForClass();

  if (a4 && buf[0]) {
    *a4 = buf[0];
  }

  return v8;
}

- (id)updateSavageDATFirmware
{
  v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v88 = "-[CRPearlController updateSavageDATFirmware]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v85 = 0;
  v86 = 0;
  uint64_t v84 = 0;
  CStringPtr = CFStringGetCStringPtr(@"Savage", 0x8000100u);
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  id v83 = 0;
  id v5 = +[NSString stringWithContentsOfFile:@"/private/preboot/active" encoding:1 error:&v83];
  id v6 = v83;
  v7 = +[NSString stringWithFormat:@"%s/%@/", "/private/preboot/", v5];
  CFURLRef v8 = CFURLCreateWithFileSystemPath(0, @"/tmp/", kCFURLPOSIXPathStyle, 1u);
  v73 = v7;
  v74 = Mutable;
  CFURLRef cf = v8;
  if (!CStringPtr || (CFURLRef v9 = v8) == 0 || (Mutable ? (v10 = v7 == 0) : (v10 = 1), v10))
  {
    v37 = sub_1000052D4((void *)0xFFFFFFFFFFFFFFFBLL, @"Failed to allocate resources", 0);
    v11 = 0;
LABEL_85:
    id v29 = 0;
    id v12 = 0;
    goto LABEL_50;
  }
  v11 = +[NSString stringWithFormat:@"Faild to read OS Boot hash from %@, error: %@", @"/private/preboot/active", v6];
  if (!v5)
  {
    v37 = sub_1000052D4((void *)0xFFFFFFFFFFFFFFFBLL, v11, 0);
    goto LABEL_85;
  }
  id v12 = +[CRPersonalizationManager getDefaultAMAuthInstallRef];
  if (!v12)
  {
    v67 = @"Failed to get default AMAuthInstallRef";
LABEL_90:
    v37 = sub_1000052D4((void *)0xFFFFFFFFFFFFFFFBLL, v67, 0);
    id v29 = 0;
    goto LABEL_50;
  }
  if (+[CRPersonalizationManager shouldPersonalizeWithSSOByDefault](CRPersonalizationManager, "shouldPersonalizeWithSSOByDefault")&& +[CRPersonalizationManager enableSSO:v12])
  {
    v67 = @"Failed to enable SSO";
    goto LABEL_90;
  }
  id v77 = v12;
  v71 = v5;
  CFMutableDictionaryRef v13 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v13)
  {
    v37 = sub_1000052D4((void *)0xFFFFFFFFFFFFFFFBLL, @"Failed to allocate updater options", 0);
    id v29 = 0;
    id v16 = v11;
    goto LABEL_49;
  }
  v14 = v13;
  CFDictionarySetValue(Mutable, @"RestoreSystemPartition", v7);
  CFDictionarySetValue(Mutable, @"PostFDRSealing", kCFBooleanFalse);
  CFDictionarySetValue(Mutable, @"PreflightContext", @"Limited");
  CFDictionaryAddValue(v14, @"Options", Mutable);
  CFDictionarySetValue(v14, @"BundlePath", v9);
  uint64_t v15 = SavageUpdaterCreate();
  id v16 = +[NSString stringWithFormat:@"Failed to create SavageUpdater: %s, error: %@", CStringPtr, 0];

  if (!v15 || v86)
  {
    AMSupportSafeRelease();
    v68 = v86;
    v37 = sub_1000052D4((void *)0xFFFFFFFFFFFFFFFBLL, v16, v86);

    id v29 = 0;
    goto LABEL_49;
  }
  id v69 = v6;
  if (SavageUpdaterIsDone())
  {
LABEL_45:
    v36 = handleForCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Savage Updater done", buf, 2u);
    }

    AMSupportSafeRelease();
    AMSupportSafeRelease();
    id v29 = 0;
    v37 = 0;
    goto LABEL_48;
  }
  int v17 = 3;
  id v18 = (const void *)kSavageOptionReceiptManifest;
  v75 = (const void *)kSavageTagResponseTicket;
  v76 = (const void *)kYonkersTagResponseTicket;
  while (1)
  {
    value = 0;
    v19 = v86;
    if (v86)
    {
      v66 = @"SavageUpdaterIsDone failed";
      goto LABEL_77;
    }
    if (!--v17)
    {
      v37 = sub_1000052D4((void *)0xFFFFFFFFFFFFFFFBLL, @"updater not done after 2 iterations", 0);
      goto LABEL_78;
    }
    int v20 = SavageUpdaterExecCommand();
    v19 = v86;
    if (!v20 || v86 || !v85)
    {
      v66 = @"Failed to run SavageUpdaterExecCommand";
LABEL_77:
      v37 = sub_1000052D4((void *)0xFFFFFFFFFFFFFFFBLL, v66, v19);

LABEL_78:
      id v29 = 0;
      goto LABEL_79;
    }
    CFDictionarySetValue(v14, @"DeviceInfo", v85);
    CFDictionarySetValue(v14, v18, v85);
    v21 = CFDictionaryGetValue((CFDictionaryRef)v85, @"YonkersDeviceInfo");
    id v22 = handleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v23 = @"Savage";
      if (v21) {
        CFStringRef v23 = @"Yonkers";
      }
      *(_DWORD *)buf = 138412290;
      v88 = (const char *)v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Patch type: %@", buf, 0xCu);
    }

    v24 = +[CRPersonalizationManager initWithAuthInstallObj:v77];
    v25 = v24;
    if (v21)
    {
      uint64_t v81 = 0;
      v26 = (id *)&v81;
      unsigned int v27 = [v24 getYonkersTicketForZenithYonkersFWUpdateWithOptions:v14 YonkersTicket:&value error:&v81];
    }
    else
    {
      uint64_t v80 = 0;
      v26 = (id *)&v80;
      unsigned int v27 = [v24 getSavageTicketForZenithSavageFWUpdateWithOptions:v14 SavageTicket:&value error:&v80];
    }
    unsigned int v28 = v27;
    id v29 = *v26;

    v30 = +[NSString stringWithFormat:@"Failed to personalize Savage FW, status: %d, error: %@", v28, v29];

    if (v29 || !v28 || !value) {
      break;
    }
    if (v21) {
      v31 = v76;
    }
    else {
      v31 = v75;
    }
    CFDictionaryAddValue(v14, v31, value);
    v32 = handleForCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v88 = (const char *)v14;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Perform next stage, updaterOptions: %@", buf, 0xCu);
    }

    int v33 = SavageUpdaterExecCommand();
    id v16 = +[NSString stringWithFormat:@"Failed to exec SavageUpdater command, result: %@", v84];

    v19 = v86;
    if (!v33 || v86)
    {
      v66 = v16;
      goto LABEL_77;
    }
    v34 = handleForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v35 = @"Savage";
      if (v21) {
        CFStringRef v35 = @"Yonkers";
      }
      *(_DWORD *)buf = 138412290;
      v88 = (const char *)v35;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Update %@ FW Successfully", buf, 0xCu);
    }

    AMSupportSafeRelease();
    AMSupportSafeRelease();
    uint64_t v84 = 0;
    v85 = 0;

    if (SavageUpdaterIsDone()) {
      goto LABEL_45;
    }
  }
  v37 = sub_1000052D4((void *)0xFFFFFFFFFFFFFFFBLL, v30, 0);
  id v16 = v30;
LABEL_79:

LABEL_48:
  id v6 = v69;
LABEL_49:
  id v5 = v71;
  id v12 = v77;
  v11 = v16;
LABEL_50:
  v38 = +[NSFileManager defaultManager];
  unsigned int v39 = [v38 fileExistsAtPath:@"/tmp/Savage.fw"];

  if (v39)
  {
    v40 = handleForCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Find Savage.fw, deleting...", buf, 2u);
    }

    v41 = +[NSFileManager defaultManager];
    id v79 = 0;
    unsigned __int8 v42 = [v41 removeItemAtPath:@"/tmp/Savage.fw" error:&v79];
    id v43 = v79;

    if ((v42 & 1) == 0)
    {
      v44 = handleForCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        sub_10003E140((uint64_t)v43, v44, v45, v46, v47, v48, v49, v50);
      }
    }
  }
  v51 = +[NSFileManager defaultManager];
  unsigned int v52 = [v51 fileExistsAtPath:@"/tmp/Yonkers.fw"];

  if (v52)
  {
    v53 = handleForCategory();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Find Yonkers.fw, deleting...", buf, 2u);
    }

    v54 = +[NSFileManager defaultManager];
    id v78 = 0;
    unsigned __int8 v55 = [v54 removeItemAtPath:@"/tmp/Yonkers.fw" error:&v78];
    id v56 = v78;

    if ((v55 & 1) == 0)
    {
      v57 = handleForCategory();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        sub_10003E0D4((uint64_t)v56, v57, v58, v59, v60, v61, v62, v63);
      }
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v74) {
    CFRelease(v74);
  }
  if (v12) {
    CFRelease(v12);
  }
  id v64 = v37;

  return v64;
}

- (id)updateBrunorDATFirmware
{
  CFStringGetCStringPtr(@"Savage", 0x8000100u);
  uint64_t v49 = 0;
  v2 = +[NSString stringWithContentsOfFile:@"/private/preboot/active" encoding:1 error:0];
  if (!v2)
  {
    CFMutableDictionaryRef v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003E1AC();
    }
    goto LABEL_61;
  }
  uint64_t v3 = +[NSString stringWithFormat:@"%s/%@/", "/private/preboot/", v2];
  if (!v3)
  {
    CFMutableDictionaryRef v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003E1E0();
    }
LABEL_61:
    id v16 = 0;
    v4 = 0;
    goto LABEL_56;
  }
  v4 = (void *)v3;
  id v5 = +[CRPersonalizationManager getDefaultAMAuthInstallRef];
  if (!v5)
  {
    CFMutableDictionaryRef v13 = handleForCategory();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v16 = 0;
      goto LABEL_56;
    }
    sub_10003E214();
    goto LABEL_79;
  }
  if (+[CRPersonalizationManager shouldPersonalizeWithSSOByDefault](CRPersonalizationManager, "shouldPersonalizeWithSSOByDefault")&& +[CRPersonalizationManager enableSSO:v5])
  {
    CFMutableDictionaryRef v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      sub_10003E4BC();
      goto LABEL_79;
    }
LABEL_76:
    id v16 = 0;
    goto LABEL_56;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    CFMutableDictionaryRef v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      sub_10003E248();
LABEL_79:
      id v16 = 0;
      goto LABEL_56;
    }
    goto LABEL_76;
  }
  v7 = Mutable;
  CFMutableDictionaryRef v8 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v8)
  {
    CFMutableDictionaryRef v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003E27C();
    }
    id v16 = 0;
    goto LABEL_56;
  }
  CFURLRef v9 = v8;
  CFDictionarySetValue(v7, @"RestoreSystemPartition", v4);
  CFDictionarySetValue(v7, @"PostFDRSealing", kCFBooleanFalse);
  CFDictionarySetValue(v7, @"PreflightContext", @"Limited");
  CFDictionaryAddValue(v9, @"Options", v7);
  if (!SavageUpdaterCreate())
  {
    CFMutableDictionaryRef v13 = handleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003E2B0();
    }
    goto LABEL_55;
  }
  unsigned __int8 v42 = v2;
  int v10 = 0;
  if (SavageUpdaterIsDone())
  {
LABEL_10:
    uint64_t v11 = v49;
    id v12 = handleForCategory();
    CFMutableDictionaryRef v13 = v12;
    if (v11)
    {
      v2 = v42;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10003E420();
      }
      goto LABEL_55;
    }
    v2 = v42;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v51) = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "SavageUpdater work done. LoopCounter = %d.", buf, 8u);
    }

    id v44 = 0;
    unsigned int v14 = +[CRUtils powerCycleSensor:&v44];
    id v15 = v44;
    id v16 = v15;
    if (!v14 || v15)
    {
      CFMutableDictionaryRef v13 = handleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_10003E3B4((uint64_t)v16, v13, v36, v37, v38, v39, v40, v41);
      }
      goto LABEL_56;
    }
    int v17 = 0;
    goto LABEL_16;
  }
  v19 = (const void *)kYonkersTagResponseTicket;
  key = (void *)kBrunorTagResponseTicket;
  while (1)
  {
    value = 0;
    uint64_t v48 = 0;
    v46[1] = 0;
    int v20 = handleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v51 = v9;
      __int16 v52 = 1024;
      int v53 = v10 + 1;
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "updaterOptions: %@ updaterLoopCount: %d", buf, 0x12u);
    }

    int v21 = SavageUpdaterExecCommand();
    uint64_t v22 = v49;
    CFStringRef v23 = handleForCategory();
    v24 = v23;
    if (!v21 || v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        goto LABEL_48;
      }
      goto LABEL_49;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v51 = value;
      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "deviceInfoDict: %@", buf, 0xCu);
    }

    CFDictionarySetValue(v9, @"DeviceInfo", value);
    v25 = CFDictionaryGetValue((CFDictionaryRef)value, @"YonkersDeviceInfo");
    v26 = handleForCategory();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (!v25) {
      break;
    }
    if (v27)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Updating Yonkers ...", buf, 2u);
    }

    unsigned int v28 = +[CRPersonalizationManager initWithAuthInstallObj:v5];
    v46[0] = 0;
    unsigned int v29 = [v28 getYonkersTicketForZenithYonkersFWUpdateWithOptions:v9 YonkersTicket:&v48 error:v46];
    CFMutableDictionaryRef v13 = v46[0];

    if (!v29 || (v30 = v48) == 0 || v13)
    {
      v24 = handleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10003E488();
      }
      goto LABEL_54;
    }
    v31 = v9;
    v32 = v19;
LABEL_39:
    CFDictionaryAddValue(v31, v32, v30);
    CFStringRef v35 = handleForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "perform next stage: %@", buf, 0xCu);
    }

    if (!SavageUpdaterExecCommand() || v49)
    {
      v24 = handleForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
LABEL_48:
      }
        sub_10003E318();
LABEL_49:
      CFMutableDictionaryRef v13 = 0;
      goto LABEL_54;
    }
    AMSupportSafeRelease();
    AMSupportSafeRelease();

    ++v10;
    if (SavageUpdaterIsDone()) {
      goto LABEL_10;
    }
  }
  if (v27)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Updating Brunor ...", buf, 2u);
  }

  int v33 = +[CRPersonalizationManager initWithAuthInstallObj:v5];
  id v45 = 0;
  unsigned int v34 = [v33 getBrunorTicketForBrunorFWUpdateWithOptions:v9 BrunorTicket:&v48 auth:0 error:&v45];
  CFMutableDictionaryRef v13 = v45;

  if (v34)
  {
    v30 = v48;
    if (v48)
    {
      if (!v13)
      {
        v31 = v9;
        v32 = key;
        goto LABEL_39;
      }
    }
  }
  v24 = handleForCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_10003E380();
  }
LABEL_54:
  v2 = v42;

LABEL_55:
  id v16 = 0;
LABEL_56:

  int v17 = sub_1000052D4((void *)0xFFFFFFFFFFFFFFFBLL, @"Update streaming DAT file failed", 0);
LABEL_16:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return v17;
}

- (id)verifyPSD3
{
  uint64_t v14 = 0;
  CFStringRef v15 = @"VerifyData";
  id v16 = &__kCFBooleanTrue;
  v2 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  uint64_t v3 = (void *)AMFDRSealingManifestCopyLocalDataForClass();
  v4 = v3;
  if (v3) {
    BOOL v5 = v14 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    uint64_t v11 = handleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003E4F0();
    }
LABEL_17:

    CFURLRef v9 = sub_1000052D4((void *)0xFFFFFFFFFFFFFFF5, @"Verify PSD3 failed", 0);
    goto LABEL_10;
  }
  id v6 = v3;
  int v7 = verifyFDRData((const char *)[v6 bytes], (size_t)[v6 length]);
  CFMutableDictionaryRef v8 = handleForCategory();
  uint64_t v11 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003E558(v7, v11);
    }
    goto LABEL_17;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFMutableDictionaryRef v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Verify psd3 successfully", v13, 2u);
  }

  CFURLRef v9 = 0;
LABEL_10:
  AMSupportSafeRelease();

  return v9;
}

@end