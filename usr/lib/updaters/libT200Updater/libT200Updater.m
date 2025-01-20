const char *T200RestoreInfoLog(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const char *result;
  char __str[4096];
  uint64_t v11;

  result = (const char *)MEMORY[0x270FA5388]();
  v11 = *MEMORY[0x263EF8340];
  if (logSinkFunc)
  {
    vsnprintf(__str, 0x1000uLL, result, &a9);
    return (const char *)logSinkFunc(logContext, __str);
  }
  return result;
}

__CFDictionary *T200UpdaterGetTagsWithLogging(const __CFDictionary *a1, uint64_t (*a2)(void, void), uint64_t a3, CFTypeRef *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  logSinkFunc = a2;
  logContext = a3;
  T200RestoreInfoLog((uint64_t)"%s:%d Start\n", (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, a8, (char)"_T200UpdaterGetTagsWithLogging");
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "outputDict", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 622, 0);
    CFErrorRef CFError = createCFError("Cannot allocate memory for outputDict", 3u, "CFDictionaryCreateMutable", 0);
    v12 = 0;
LABEL_17:
    v14 = 0;
    goto LABEL_21;
  }
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v12 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
  if (!v12)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "tagsInBIRef", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 625, 0);
    CFErrorRef CFError = createCFError("Cannot allocate memory for tagsInBI", 3u, "CFArrayCreateMutable", 0);
    goto LABEL_17;
  }
  v13 = CFArrayCreateMutable(v11, 0, MEMORY[0x263EFFF70]);
  v14 = v13;
  if (v13)
  {
    CFArrayAppendValue(v13, @"BMU,Ticket");
    if (a1)
    {
      Value = CFDictionaryGetValue(a1, @"DeviceInfo");
      if (Value)
      {
        v16 = Value;
        CFTypeID v17 = CFGetTypeID(Value);
        if (v17 == CFDictionaryGetTypeID())
        {
          CFTypeRef v18 = CFRetain(v16);
          CFArrayAppendValue(v12, @"BMU,FirmwareMap");
          CFDictionaryAddValue(Mutable, @"BuildIdentityTags", v12);
          CFDictionaryAddValue(Mutable, @"ResponseTags", v14);
          T200RestoreInfoLog((uint64_t)"%s:%d End\n", v19, v20, v21, v22, v23, v24, v25, (char)"_T200UpdaterGetTagsWithLogging");
LABEL_8:
          CFRelease(v14);
          v26 = v18;
          goto LABEL_9;
        }
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "tmp && (CFGetTypeID(tmp)==CFDictionaryGetTypeID())", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 634, 0);
      v28 = "DeviceInfo is NULL";
      v29 = "CFDictionaryGetValue";
      unsigned int v30 = 2;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "options", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 632, 0);
      v28 = "options is NULL";
      unsigned int v30 = 2;
      v29 = 0;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "tagsInTssResponse", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 628, 0);
    v28 = "Cannot allocate memory for tagsInTssResponse";
    v29 = "CFArrayCreateMutable";
    unsigned int v30 = 3;
  }
  CFErrorRef CFError = createCFError(v28, v30, v29, 0);
LABEL_21:
  if (a4 && CFError)
  {
    *a4 = CFRetain(CFError);
    T200RestoreInfoLog((uint64_t)"%s:%d outputDict =\n", v32, v33, v34, v35, v36, v37, v38, (char)"_T200UpdaterGetTagsWithLogging");
    T200CFShow(Mutable);
    if (Mutable)
    {
      CFRelease(Mutable);
      Mutable = 0;
    }
  }
  else if (!CFError)
  {
    goto LABEL_27;
  }
  CFRelease(CFError);
LABEL_27:
  CFTypeRef v18 = 0;
  v26 = 0;
  if (v14) {
    goto LABEL_8;
  }
LABEL_9:
  if (v12) {
    CFRelease(v12);
  }
  if (v26) {
    CFRelease(v26);
  }
  return Mutable;
}

const void *T200UpdaterCopyFirmwareWithLogging(const __CFDictionary *a1, uint64_t (*a2)(void, void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8 = (void *)a4;
  uint64_t v99 = *MEMORY[0x263EF8340];
  logSinkFunc = a2;
  logContext = a3;
  T200RestoreInfoLog((uint64_t)"%s:%d Start\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (char)"_T200UpdaterCopyFirmwareWithLogging");
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "options", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 680, 0);
    v85 = "options is NULL";
    v86 = 0;
    goto LABEL_66;
  }
  Value = CFDictionaryGetValue(a1, @"DeviceInfo");
  if (!Value || (CFTypeID v11 = CFGetTypeID(Value), v11 != CFDictionaryGetTypeID()))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "tmp && (CFGetTypeID(tmp)==CFDictionaryGetTypeID())", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 683, 0);
    v85 = "Missing device info";
    v86 = "CFDictionaryGetValue";
LABEL_66:
    CFErrorRef CFError = createCFError(v85, 2u, v86, 0);
    v83 = 0;
    goto LABEL_57;
  }
  v96 = 0;
  uint64_t v19 = "copyFirmwareData";
  T200RestoreInfoLog((uint64_t)"%s:%d Start\n", v12, v13, v14, v15, v16, v17, v18, (char)"copyFirmwareData");
  if (CFStringGetCStringPtr(@"BMU,FirmwareMap", 0x8000100u)) {
    T200RestoreInfoLog((uint64_t)"%s:%d Start file_name=%s \n", v20, v21, v22, v23, v24, v25, v26, (char)"copyFirmwareData");
  }
  v27 = CFDictionaryGetValue(a1, @"BuildIdentity");
  if (!v27 || (CFDictionaryRef v28 = (const __CFDictionary *)CFRetain(v27)) == 0)
  {
    v94 = v8;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "buildIdentityDict", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 501, 0);
    CFErrorRef v70 = createCFError("Missing kT200OptionBuildIdentity", 0xEu, 0, 0);
    CFDictionaryRef v29 = 0;
    CFDictionaryRef v35 = 0;
    CFDictionaryRef v32 = 0;
    v61 = 0;
    uint64_t v38 = 0;
    CFDictionaryRef v43 = 0;
    CFStringRef v71 = 0;
    char v95 = 1;
    goto LABEL_34;
  }
  CFDictionaryRef v29 = v28;
  unsigned int v30 = CFDictionaryGetValue(v28, @"BMU,FirmwareMap");
  if (!v30 || (CFDictionaryRef v31 = (const __CFDictionary *)CFRetain(v30)) == 0)
  {
    v94 = v8;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "imageDict", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 504, 0);
    CStringPtr = (char *)CFStringGetCStringPtr(@"BMU,FirmwareMap", 0x600u);
    CFErrorRef v70 = createCFError(CStringPtr, 0xEu, 0, 0);
    char v95 = 0;
    CFDictionaryRef v35 = 0;
    CFDictionaryRef v32 = 0;
LABEL_31:
    v61 = 0;
    uint64_t v38 = 0;
LABEL_32:
    CFDictionaryRef v43 = 0;
LABEL_33:
    CFStringRef v71 = 0;
    goto LABEL_34;
  }
  CFDictionaryRef v32 = v31;
  uint64_t v33 = CFDictionaryGetValue(v31, @"Info");
  if (!v33 || (CFDictionaryRef v34 = (const __CFDictionary *)CFRetain(v33)) == 0)
  {
    v94 = v8;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "infoDict", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 507, 0);
    CFErrorRef v70 = createCFError("Missing kT200BuildIdentityInfoKey", 0x14u, 0, 0);
    char v95 = 0;
    CFDictionaryRef v35 = 0;
    goto LABEL_31;
  }
  CFDictionaryRef v35 = v34;
  uint64_t v36 = CFDictionaryGetValue(v34, @"Path");
  if (!v36 || (CFTypeRef v37 = CFRetain(v36)) == 0)
  {
    v94 = v8;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "relativePathStr", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 510, 0);
    CFErrorRef v70 = createCFError("Missing kT200BuildIdentityPathKey", 0x14u, 0, 0);
    char v95 = 0;
    goto LABEL_31;
  }
  uint64_t v38 = v37;
  v39 = CFDictionaryGetValue(a1, @"DeviceInfo");
  if (!v39 || (v40 = v39, v41 = CFGetTypeID(v39), v42 = v41 == CFDictionaryGetTypeID(), uint64_t v19 = "copyFirmwareData", !v42))
  {
    v94 = v8;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "tmp && (CFGetTypeID(tmp)==CFDictionaryGetTypeID())", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 513, 0);
    CFErrorRef v70 = createCFError("DeviceInfo is NULL", 2u, 0, 0);
    char v95 = 0;
    v61 = 0;
    goto LABEL_32;
  }
  CFDictionaryRef v43 = (const __CFDictionary *)CFRetain(v40);
  if (!getChemistryId(v43))
  {
    v94 = v8;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "chemistryID!=0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 517, 0);
    v87 = "Missing ChemistryID";
    v88 = "getChemistryId";
LABEL_70:
    CFErrorRef v70 = createCFError(v87, 0x14u, v88, 0);
    char v95 = 0;
    v61 = 0;
    goto LABEL_33;
  }
  CFStringRef v44 = (const __CFString *)CopyHWVersion(v43);
  if (!v44)
  {
    v94 = v8;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "hw_version!=NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 521, 0);
    v87 = "Missing HWVersion";
    v88 = "CopyHWVersion";
    goto LABEL_70;
  }
  *(_OWORD *)buffer = 0u;
  long long v98 = 0u;
  CFStringRef v93 = v44;
  CFStringGetCString(v44, buffer, 32, 0x600u);
  uint64_t v19 = "copyFirmwareData";
  T200RestoreInfoLog((uint64_t)"%s:%d chemistry=%u silicon_ver=%s\n", v45, v46, v47, v48, v49, v50, v51, (char)"copyFirmwareData");
  v52 = CFDictionaryGetValue(a1, @"BundlePath");
  if (v52)
  {
    CFTypeRef v60 = CFRetain(v52);
    if (v60)
    {
      v61 = v60;
      uint64_t v62 = AMSupportPlatformCopyURLWithAppendedComponent();
      if (v62)
      {
        uint64_t v89 = v62;
        v94 = v8;
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "kAMSupportErrorNone == status", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 534, 0);
        v90 = "Fail to run AMSupportPlatformCopyURLWithAppendedComponent";
        unsigned int v91 = v89;
        uint64_t v92 = v89;
      }
      else
      {
        v94 = v8;
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "filePathURL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 535, 0);
        v90 = "Fail to do AMSupportPlatformCopyURLWithAppendedComponent";
        unsigned int v91 = 3;
        uint64_t v92 = 0;
      }
      CFErrorRef v70 = createCFError(v90, v91, "AMSupportPlatformCopyURLWithAppendedComponent", v92);
      char v95 = 0;
      CFStringRef v71 = v93;
LABEL_34:
      if (v70)
      {
        CFErrorRef CFError = CFRetain(v70);
        CFStringRef v75 = CFErrorCopyDescription(v70);
        if (CFStringGetCStringPtr(v75, 0x8000100u)) {
          T200RestoreInfoLog((uint64_t)"%s:%d Error : %s\n", v76, v77, v78, v79, v80, v81, v82, (char)"copyFirmwareData");
        }
        if (v75) {
          CFRelease(v75);
        }
        CFRelease(v70);
        LOBYTE(v19) = "copyFirmwareData";
        v8 = v94;
      }
      else
      {
        CFErrorRef CFError = 0;
        v8 = v94;
      }
      goto LABEL_41;
    }
  }
  T200RestoreInfoLog((uint64_t)"%s:%d Override is set \n", v53, v54, v55, v56, v57, v58, v59, (char)"copyFirmwareData");
  v73 = CFDictionaryGetValue(a1, @"FirmwareData");
  if (v73) {
    v73 = CFRetain(v73);
  }
  CFStringRef v71 = v93;
  v61 = 0;
  v96 = v73;
  if (!v73)
  {
    v94 = v8;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwareData", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 572, 0);
    CFErrorRef v70 = createCFError("firmwareData is NULL", 3u, 0, 0);
    char v95 = 0;
    goto LABEL_34;
  }
  CFErrorRef CFError = 0;
  char v95 = 0;
LABEL_41:
  if (v61) {
    CFRelease(v61);
  }
  if (v38) {
    CFRelease(v38);
  }
  if (v35) {
    CFRelease(v35);
  }
  if (v32) {
    CFRelease(v32);
  }
  if ((v95 & 1) == 0) {
    CFRelease(v29);
  }
  if (v43) {
    CFRelease(v43);
  }
  if (v71) {
    CFRelease(v71);
  }
  T200RestoreInfoLog((uint64_t)"%s:%d End\n", v63, v64, v65, v66, v67, v68, v69, (char)v19);
  v83 = v96;
  if (!v96) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwareDataRef", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 689, 0);
  }
LABEL_57:
  if (v8 && CFError)
  {
    void *v8 = CFRetain(CFError);
LABEL_61:
    CFRelease(CFError);
    return v83;
  }
  if (CFError) {
    goto LABEL_61;
  }
  return v83;
}

CFTypeRef T200UpdaterCreateRequestWithLogging(const __CFDictionary *a1, uint64_t (*a2)(void, void), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8 = (void *)a4;
  uint64_t v258 = *MEMORY[0x263EF8340];
  logSinkFunc = a2;
  logContext = a3;
  T200RestoreInfoLog((uint64_t)"%s:%d Start\n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (char)"__T200UpdaterCreateRequestWithLogging");
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "options", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 719, 0);
    CFErrorRef CFError = createCFError("options is NULL", 2u, 0, 0);
    CFDictionaryRef v26 = 0;
    CFDictionaryRef v15 = 0;
    CFTypeRef v24 = 0;
    CFTypeRef v27 = 0;
    uint64_t v12 = 0;
    goto LABEL_14;
  }
  if (!CFDictionaryContainsKey(a1, @"BuildIdentity")
    || (v10 = CFDictionaryGetValue(a1, @"BuildIdentity")) == 0
    || (CFTypeRef v11 = CFRetain(v10)) == 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "buildIdentity", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 725, 0);
    CFErrorRef CFError = createCFError("BuildIdentity is NULL in input options", 2u, 0, 0);
    CFDictionaryRef v26 = 0;
    CFDictionaryRef v15 = 0;
    CFTypeRef v24 = 0;
    CFTypeRef v27 = 0;
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  uint64_t v12 = v11;
  if (!CFDictionaryContainsKey(a1, @"DeviceInfo")
    || (uint64_t v13 = CFDictionaryGetValue(a1, @"DeviceInfo")) == 0
    || (CFDictionaryRef v14 = (const __CFDictionary *)CFRetain(v13)) == 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "T200Parameters", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 731, 0);
    CFErrorRef CFError = createCFError("Cannot get DeviceInfo", 2u, 0, 0);
    CFDictionaryRef v26 = 0;
    CFDictionaryRef v15 = 0;
    CFTypeRef v24 = 0;
    CFTypeRef v27 = 0;
    goto LABEL_13;
  }
  CFDictionaryRef v15 = v14;
  if (CFDictionaryContainsKey(v14, @"UpdaterOptions"))
  {
    uint64_t v23 = CFDictionaryGetValue(v15, @"UpdaterOptions");
    if (v23)
    {
      CFTypeRef v24 = CFRetain(v23);
      goto LABEL_34;
    }
  }
  else
  {
    T200RestoreInfoLog((uint64_t)"%s:%d Updater options is empty\n", v16, v17, v18, v19, v20, v21, v22, (char)"__T200UpdaterCreateRequestWithLogging");
  }
  CFTypeRef v24 = 0;
LABEL_34:
  if (!CFDictionaryContainsKey(a1, @"Options"))
  {
    T200RestoreInfoLog((uint64_t)"%s:%d Restore options is empty\n", v38, v39, v40, v41, v42, v43, v44, (char)"__T200UpdaterCreateRequestWithLogging");
    goto LABEL_38;
  }
  uint64_t v45 = CFDictionaryGetValue(a1, @"Options");
  if (!v45)
  {
LABEL_38:
    CFTypeRef v27 = 0;
    goto LABEL_39;
  }
  CFTypeRef v27 = CFRetain(v45);
LABEL_39:
  uint64_t v46 = CFDictionaryGetValue(v15, @"LocalSigningID");
  if (v46)
  {
    CFTypeID v47 = CFGetTypeID(v46);
    if (v47 == CFBooleanGetTypeID())
    {
      if (!CFDictionaryContainsKey(a1, @"FirmwareData"))
      {
        T200RestoreInfoLog((uint64_t)"%s:%d Start\n", v48, v49, v50, v51, v52, v53, v54, (char)"_createRequestDictForTATSU");
        a1 = 0;
        goto LABEL_56;
      }
      uint64_t v55 = CFDictionaryGetValue(a1, @"FirmwareData");
      if (v55)
      {
        CFDictionaryRef v56 = (const __CFDictionary *)CFRetain(v55);
        if (v56)
        {
          a1 = v56;
          T200RestoreInfoLog((uint64_t)"%s:%d Start\n", v57, v58, v59, v60, v61, v62, v63, (char)"_createMeasurementDict");
          CFAllocatorRef v64 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          uint64_t v65 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
          uint64_t v66 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
          theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
          Mutable = CFDictionaryCreateMutable(v64, 0, v65, v66);
          *(_OWORD *)bytes = 0u;
          long long v257 = 0u;
          CFMutableDictionaryRef v67 = CFDictionaryCreateMutable(0, 0, v65, v66);
          CFMutableDictionaryRef v68 = CFDictionaryCreateMutable(0, 0, v65, v66);
          v247 = v67;
          CFMutableDictionaryRef v245 = v68;
          if (v67)
          {
            uint64_t v69 = v68;
            if (getChemistryId(v15))
            {
              CFTypeRef v70 = CopyHWVersion(v15);
              CFStringRef v71 = Mutable;
              if (v70)
              {
                CFTypeRef v72 = v70;
                CFStringRef v249 = CFStringCreateWithFormat(v64, 0, @"%@", @"board_id", 381);
                CFPropertyListRef v253 = CFPropertyListCreateWithData(v64, a1, 0, 0, 0);
                CFTypeRef v244 = v72;
                if (v253)
                {
                  CFTypeRef v246 = CFRetain(a1);
                  if (v246)
                  {
                    CFStringRef v243 = CFStringCreateWithFormat(v64, 0, @"%@.%@", @"digest_der", @"Digest");
                    ValueForKeyPathInDict = (const void *)AMSupportGetValueForKeyPathInDict();
                    if (ValueForKeyPathInDict && (CFTypeRef v74 = CFRetain(ValueForKeyPathInDict)) != 0)
                    {
                      CFTypeRef cf = v74;
                      CFDictionarySetValue(Mutable, @"Digest", v74);
                      CFDictionarySetValue(v69, @"BMU,DigestMap", Mutable);
                      CFStringRef v75 = (const void *)AMSupportGetValueForKeyPathInDict();
                      if (v75) {
                        CFStringRef v75 = CFRetain(v75);
                      }
                      if (v69)
                      {
                        uint64_t v76 = v75;
                        CFDictionaryRef v240 = (const __CFDictionary *)CFRetain(v69);
                        CFStringRef v75 = v76;
                      }
                      else
                      {
                        CFDictionaryRef v240 = 0;
                      }
                      CFTypeRef v242 = v75;
                      if (v75) {
                        CFTypeRef value = CFRetain(v75);
                      }
                      else {
                        CFTypeRef value = 0;
                      }
                      size_t Length = CFDataGetLength(a1);
                      v110 = (UInt8 *)calloc(Length, 1uLL);
                      if (v110)
                      {
                        v111 = v110;
                        v259.location = 0;
                        v259.length = Length;
                        CFDataGetBytes(a1, v259, v110);
                        computeFirmwareDigest(v111, Length, bytes, v112, v113, v114, v115, v116);
                        CFDataRef v108 = CFDataCreate(v64, bytes, 32);
                        CFDictionarySetValue(theDict, @"Digest", v108);
                        CFDictionarySetValue(v247, @"BMU,FirmwareMap", theDict);
                        CFDictionaryRef v26 = (const __CFDictionary *)CFRetain(v247);
                        T200RestoreInfoLog((uint64_t)"%s:%d End\n", v117, v118, v119, v120, v121, v122, v123, (char)"_createMeasurementDict");
                        free(v111);
                        uint64_t v100 = 0;
                        CFStringRef v71 = Mutable;
LABEL_68:
                        if (v71) {
                          CFRelease(v71);
                        }
                        if (cf) {
                          CFRelease(cf);
                        }
                        if (v243) {
                          CFRelease(v243);
                        }
                        if (v108) {
                          CFRelease(v108);
                        }
                        if (theDict) {
                          CFRelease(theDict);
                        }
                        if (v247) {
                          CFRelease(v247);
                        }
                        if (v245) {
                          CFRelease(v245);
                        }
                        if (v246) {
                          CFRelease(v246);
                        }
                        if (v242) {
                          CFRelease(v242);
                        }
                        if (v253) {
                          CFRelease(v253);
                        }
                        if (v244) {
                          CFRelease(v244);
                        }
                        if (v249) {
                          CFRelease(v249);
                        }
                        if (v100)
                        {
                          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 756, 0);
                          v221 = "_createMeasurementDict fails.";
                          v222 = "_createMeasurementDict";
                          unsigned int v223 = v100;
                          uint64_t v224 = v100;
LABEL_172:
                          CFErrorRef CFError = createCFError(v221, v223, v222, v224);
                          goto LABEL_14;
                        }
                        T200RestoreInfoLog((uint64_t)"%s:%d Start\n", v101, v102, v103, v104, v105, v106, v107, (char)"_createRequestDictForTATSU");
                        if (v26)
                        {
                          T200RestoreInfoLog((uint64_t)"%s:%d Restore Options\n", v124, v125, v126, v127, v128, v129, v130, (char)"_createRequestDictForTATSU");
                          T200CFShow(v27);
                          v131 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                          if (v131)
                          {
                            v132 = v131;
                            CFTypeRef v254 = (CFTypeRef)*MEMORY[0x263EFFB40];
                            CFDictionaryAddValue(v131, @"@BMU,Ticket", (const void *)*MEMORY[0x263EFFB40]);
                            v133 = CFDictionaryGetValue(v15, @"LocalSigningID");
                            if (v133 && (CFTypeID v134 = CFGetTypeID(v133), v134 == CFBooleanGetTypeID()))
                            {
                              v135 = CFDictionaryGetValue(v15, @"ChipID");
                              if (!v135 || (v136 = v135, CFTypeID v137 = CFGetTypeID(v135), v137 != CFNumberGetTypeID()))
                              {
                                v255 = v132;
                                v210 = (FILE *)*MEMORY[0x263EF8348];
                                int v211 = 280;
                                goto LABEL_158;
                              }
                              CFDictionarySetValue(v132, @"BMU,ChipID", v136);
                              CFBooleanRef v138 = (const __CFBoolean *)CFDictionaryGetValue(v15, @"ProductionMode");
                              if (v138)
                              {
                                CFBooleanRef v139 = v138;
                                CFTypeID v140 = CFGetTypeID(v138);
                                if (v140 == CFBooleanGetTypeID())
                                {
                                  if (CFBooleanGetValue(v139)) {
                                    v141 = v254;
                                  }
                                  else {
                                    v141 = (const void *)*MEMORY[0x263EFFB38];
                                  }
                                  CFDictionaryAddValue(v132, @"BMU,ProductionMode", v141);
                                  v142 = CFDictionaryGetValue(v15, @"UniqueID");
                                  if (v142)
                                  {
                                    v143 = v142;
                                    CFTypeID v144 = CFGetTypeID(v142);
                                    if (v144 == CFNumberGetTypeID())
                                    {
                                      CFDictionaryAddValue(v132, @"BMU,UniqueID", v143);
                                      v145 = CFDictionaryGetValue(v15, @"Nonce");
                                      if (v145 && (v146 = v145, CFTypeID v147 = CFGetTypeID(v145), v147 == CFDataGetTypeID()))
                                      {
                                        CFDictionaryAddValue(v132, @"BMU,Nonce", v146);
                                        v148 = CFDictionaryGetValue(v26, @"BMU,FirmwareMap");
                                        if (v148
                                          && (v149 = v148, CFTypeID v150 = CFGetTypeID(v148), v150 == CFDictionaryGetTypeID()))
                                        {
                                          CFDictionaryAddValue(v132, @"BMU,FirmwareMap", v149);
                                          if (!v240) {
                                            goto LABEL_114;
                                          }
                                          v151 = CFDictionaryGetValue(v240, @"BMU,DigestMap");
                                          if (v151)
                                          {
                                            v152 = v151;
                                            CFTypeID v153 = CFGetTypeID(v151);
                                            if (v153 == CFDictionaryGetTypeID())
                                            {
                                              CFDictionaryAddValue(v132, @"BMU,DigestMap", v152);
LABEL_114:
                                              if (value) {
                                                CFDictionaryAddValue(v132, @"BMU,BoardID", value);
                                              }
                                              if (CFDictionaryContainsKey(v15, @"UpdaterOptions"))
                                              {
                                                v154 = CFDictionaryGetValue(v15, @"UpdaterOptions");
                                                if (v154) {
                                                  v154 = CFRetain(v154);
                                                }
                                                CFTypeRef v252 = v154;
                                                int v155 = CheckKey((const __CFDictionary *)v154, @"RestoreInternal");
                                                v156 = CFDictionaryGetValue(v15, @"ForceFirmwareUpgrade");
                                                if (!v156)
                                                {
                                                  if (v155 == 1)
                                                  {
                                                    if (CheckKey((const __CFDictionary *)v27, @"SkipSameVersion"))
                                                    {
                                                      v168 = CFDictionaryGetValue(v15, @"RollbackFWVer");
                                                      if (v168)
                                                      {
LABEL_132:
                                                        CFTypeID v170 = CFGetTypeID(v168);
                                                        if (v170 == CFBooleanGetTypeID())
                                                        {
                                                          if (CFBooleanGetValue((CFBooleanRef)v168) != 1) {
                                                            goto LABEL_138;
                                                          }
                                                          goto LABEL_137;
                                                        }
                                                        v255 = v132;
                                                        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "tmpBool && (CFGetTypeID(tmpBool) == CFBooleanGetTypeID())", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 335, 0);
LABEL_164:
                                                        uint64_t v84 = 2;
                                                        T200RestoreInfoLog((uint64_t)"%s:%d End,Failed with ret=%d\n", v212, v213, v214, v215, v216, v217, v218, (char)"_createRequestDictForTATSU");
                                                        CFTypeRef v35 = 0;
                                                        char v200 = 0;
                                                        v199 = v255;
                                                        goto LABEL_143;
                                                      }
                                                      goto LABEL_136;
                                                    }
                                                    int v155 = 1;
                                                    goto LABEL_125;
                                                  }
LABEL_130:
                                                  v169 = CFDictionaryGetValue(v15, @"RollbackFWVer");
                                                  if (v169)
                                                  {
                                                    v168 = v169;
                                                    goto LABEL_132;
                                                  }
                                                  if (v155 != 1)
                                                  {
LABEL_138:
                                                    if (CheckKey((const __CFDictionary *)v27, @"EnableDeveloperCommands"))
                                                    {
                                                      T200RestoreInfoLog((uint64_t)"%s:%d Add Entitlements kT200TagFAEnableOption\n", v178, v179, v180, v181, v182, v183, v184, (char)"_createRequestDictForTATSU");
                                                      CFDictionaryAddValue(v132, @"BMU,EnableDeveloperCommands", v254);
                                                    }
                                                    if (CheckKey((const __CFDictionary *)v27, @"EnableValidationCommands"))
                                                    {
                                                      T200RestoreInfoLog((uint64_t)"%s:%d Add Entitlements kT200TagVNVEnableOption\n", v185, v186, v187, v188, v189, v190, v191, (char)"_createRequestDictForTATSU");
                                                      CFDictionaryAddValue(v132, @"BMU,EnableValidationCommands", v254);
                                                    }
                                                    CFTypeRef v35 = CFRetain(v132);
                                                    T200RestoreInfoLog((uint64_t)"%s:%d End\n", v192, v193, v194, v195, v196, v197, v198, (char)"_createRequestDictForTATSU");
                                                    uint64_t v84 = 0;
                                                    v199 = v132;
                                                    char v200 = 1;
LABEL_143:
                                                    CFRelease(v199);
                                                    if (v252) {
                                                      CFRelease(v252);
                                                    }
                                                    if (v200)
                                                    {
                                                      if (v35)
                                                      {
                                                        T200RestoreInfoLog((uint64_t)"%s:%d End\n", v201, v202, v203, v204, v205, v206, v207, (char)"__T200UpdaterCreateRequestWithLogging");
LABEL_20:
                                                        CFRelease(v26);
                                                        CFTypeRef v36 = v35;
LABEL_21:
                                                        if (!v12) {
                                                          goto LABEL_23;
                                                        }
                                                        goto LABEL_22;
                                                      }
                                                      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "requestDict", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 762, 0);
                                                      v221 = "TATSU request dict is NULL";
                                                      v222 = "_createRequestDictForTATSU";
                                                      unsigned int v223 = 12;
                                                      uint64_t v224 = v84;
                                                      goto LABEL_172;
                                                    }
                                                    goto LABEL_58;
                                                  }
LABEL_136:
                                                  if (CheckKey((const __CFDictionary *)v27, @"RollbackFWVer"))
                                                  {
LABEL_137:
                                                    T200RestoreInfoLog((uint64_t)"%s:%d Add Entitlements kT200TagEFFV\n", v171, v172, v173, v174, v175, v176, v177, (char)"_createRequestDictForTATSU");
                                                    CFDictionaryAddValue(v132, @"BMU,EnableFutureFWVersion", v254);
                                                    goto LABEL_138;
                                                  }
                                                  goto LABEL_138;
                                                }
                                                v157 = v156;
                                                v250 = v8;
                                                int v158 = v155;
                                              }
                                              else
                                              {
                                                v159 = CFDictionaryGetValue(v15, @"ForceFirmwareUpgrade");
                                                if (!v159)
                                                {
                                                  v168 = CFDictionaryGetValue(v15, @"RollbackFWVer");
                                                  CFTypeRef v252 = 0;
                                                  if (!v168) {
                                                    goto LABEL_138;
                                                  }
                                                  goto LABEL_132;
                                                }
                                                v157 = v159;
                                                v250 = v8;
                                                CFTypeRef v252 = 0;
                                                int v158 = 0;
                                              }
                                              CFTypeID v160 = CFGetTypeID(v157);
                                              if (v160 != CFBooleanGetTypeID())
                                              {
                                                v255 = v132;
                                                fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "tmpBool && (CFGetTypeID(tmpBool) == CFBooleanGetTypeID())", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 321, 0);
                                                v8 = v250;
                                                goto LABEL_164;
                                              }
                                              int v155 = v158;
                                              v8 = v250;
                                              if (CFBooleanGetValue((CFBooleanRef)v157) == 1)
                                              {
LABEL_125:
                                                T200RestoreInfoLog((uint64_t)"%s:%d Add Entitlements kT200TagFWOverWrite\n", v161, v162, v163, v164, v165, v166, v167, (char)"_createRequestDictForTATSU");
                                                CFDictionaryAddValue(v132, @"BMU,ForceFirmwareUpgrade", v254);
                                                goto LABEL_130;
                                              }
                                              goto LABEL_130;
                                            }
                                          }
                                          v255 = v132;
                                          v219 = (FILE *)*MEMORY[0x263EF8348];
                                          int v220 = 303;
                                        }
                                        else
                                        {
                                          v255 = v132;
                                          v219 = (FILE *)*MEMORY[0x263EF8348];
                                          int v220 = 298;
                                        }
                                        fprintf(v219, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "tmpDict && (CFGetTypeID(tmpDict) == CFDictionaryGetTypeID())", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", v220, 0);
                                      }
                                      else
                                      {
                                        v255 = v132;
                                        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "tmpData && (CFGetTypeID(tmpData) == CFDataGetTypeID())", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 294, 0);
                                      }
LABEL_163:
                                      CFTypeRef v252 = 0;
                                      goto LABEL_164;
                                    }
                                  }
                                  v255 = v132;
                                  v210 = (FILE *)*MEMORY[0x263EF8348];
                                  int v211 = 290;
LABEL_158:
                                  fprintf(v210, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "tmpNumb && (CFGetTypeID(tmpNumb) == CFNumberGetTypeID())", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", v211, 0);
                                  goto LABEL_163;
                                }
                              }
                              v255 = v132;
                              v208 = (FILE *)*MEMORY[0x263EF8348];
                              int v209 = 285;
                            }
                            else
                            {
                              v255 = v132;
                              v208 = (FILE *)*MEMORY[0x263EF8348];
                              int v209 = 277;
                            }
                            fprintf(v208, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "tmpBool && (CFGetTypeID(tmpBool) == CFBooleanGetTypeID())", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", v209, 0);
                            goto LABEL_163;
                          }
                          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "requestDict", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 270, 0);
                          uint64_t v84 = 3;
LABEL_57:
                          T200RestoreInfoLog((uint64_t)"%s:%d End,Failed with ret=%d\n", v77, v78, v79, v80, v81, v82, v83, (char)"_createRequestDictForTATSU");
LABEL_58:
                          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 761, 0);
                          CFErrorRef CFError = createCFError("_createRequestDictForTATSU fails.", v84, "_createRequestDictForTATSU", v84);
                          goto LABEL_14;
                        }
LABEL_56:
                        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "measurementDict", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 262, 0);
                        CFDictionaryRef v26 = 0;
                        uint64_t v84 = 2;
                        goto LABEL_57;
                      }
                      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "NULL != firmwareBytes", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 439, 0);
                      T200RestoreInfoLog((uint64_t)"%s:%d firmwareBytes is NULL\n", v232, v233, v234, v235, v236, v237, v238, (char)"_createMeasurementDict");
                      uint64_t v99 = 13;
                      CFStringRef v71 = Mutable;
                    }
                    else
                    {
                      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derDigestData!=NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 427, 0);
                      T200RestoreInfoLog((uint64_t)"%s:%d derDigestData is missing in Firmwaremap.plist\n", v85, v86, v87, v88, v89, v90, v91, (char)"_createMeasurementDict");
                      CFTypeRef value = 0;
                      CFDictionaryRef v240 = 0;
                      CFTypeRef cf = 0;
                      CFTypeRef v242 = 0;
                      uint64_t v99 = 66;
                    }
                  }
                  else
                  {
                    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "fwData!=NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 422, 0);
                    T200RestoreInfoLog((uint64_t)"%s:%d fwData is NULL\n", v225, v226, v227, v228, v229, v230, v231, (char)"_createMeasurementDict");
                    CFTypeRef value = 0;
                    CFDictionaryRef v240 = 0;
                    CFTypeRef cf = 0;
                    CFTypeRef v242 = 0;
                    CFStringRef v243 = 0;
                    CFTypeRef v246 = 0;
                    uint64_t v99 = 11;
                  }
                }
                else
                {
                  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "dataDictRef!=NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 419, 0);
                  CFTypeRef value = 0;
                  CFDictionaryRef v240 = 0;
                  CFTypeRef cf = 0;
                  CFTypeRef v242 = 0;
                  CFStringRef v243 = 0;
                  CFTypeRef v246 = 0;
                  CFPropertyListRef v253 = 0;
                  uint64_t v99 = 13;
                }
              }
              else
              {
                fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "hw_version!=NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 412, 0);
                CFTypeRef value = 0;
                CFDictionaryRef v240 = 0;
                CFTypeRef cf = 0;
                CFTypeRef v242 = 0;
                CFStringRef v243 = 0;
                CFTypeRef v244 = 0;
                CFStringRef v249 = 0;
                CFTypeRef v246 = 0;
                CFPropertyListRef v253 = 0;
                uint64_t v99 = 11;
              }
LABEL_61:
              uint64_t v100 = v99;
              T200RestoreInfoLog((uint64_t)"%s:%d Failed with %d\n", v92, v93, v94, v95, v96, v97, v98, (char)"_createMeasurementDict");
              CFDictionaryRef v26 = 0;
              CFDataRef v108 = 0;
              goto LABEL_68;
            }
            fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "chemistryID!=0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 408, 0);
            CFTypeRef value = 0;
            CFDictionaryRef v240 = 0;
            CFTypeRef cf = 0;
            CFTypeRef v242 = 0;
            CFStringRef v243 = 0;
            CFTypeRef v244 = 0;
            CFStringRef v249 = 0;
            CFTypeRef v246 = 0;
            CFPropertyListRef v253 = 0;
            uint64_t v99 = 11;
          }
          else
          {
            fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "measurementDict", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 403, 0);
            CFTypeRef value = 0;
            CFDictionaryRef v240 = 0;
            CFTypeRef cf = 0;
            CFTypeRef v242 = 0;
            CFStringRef v243 = 0;
            CFTypeRef v244 = 0;
            CFStringRef v249 = 0;
            CFTypeRef v246 = 0;
            CFPropertyListRef v253 = 0;
            uint64_t v99 = 3;
          }
          CFStringRef v71 = Mutable;
          goto LABEL_61;
        }
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "fwDataRef", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 754, 0);
      CFErrorRef CFError = createCFError("FirmwareData is NULL in input options", 2u, 0, 0);
      CFDictionaryRef v26 = 0;
LABEL_13:
      a1 = 0;
LABEL_14:
      if (v8 && CFError)
      {
        void *v8 = CFRetain(CFError);
        T200RestoreInfoLog((uint64_t)"%s:%d requestDict =\n", v28, v29, v30, v31, v32, v33, v34, (char)"__T200UpdaterCreateRequestWithLogging");
      }
      else if (!CFError)
      {
        goto LABEL_19;
      }
      CFRelease(CFError);
LABEL_19:
      CFTypeRef v35 = 0;
      CFTypeRef v36 = 0;
      if (!v26) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "tmpBool && (CFGetTypeID(tmpBool) == CFBooleanGetTypeID())", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 749, 0);
  CFTypeRef v36 = 0;
  a1 = 0;
LABEL_22:
  CFRelease(v12);
LABEL_23:
  if (v15) {
    CFRelease(v15);
  }
  if (a1) {
    CFRelease(a1);
  }
  if (v27) {
    CFRelease(v27);
  }
  if (v24) {
    CFRelease(v24);
  }
  return v36;
}

void T200CFShow(const void *a1)
{
  if (a1)
  {
    CFStringRef v1 = CFCopyDescription(a1);
    CStringPtr = CFStringGetCStringPtr(v1, 0x8000100u);
    if (CStringPtr) {
      T200RestoreInfoLog((uint64_t)"[DICT] %s\n", v3, v4, v5, v6, v7, v8, v9, (char)CStringPtr);
    }
    if (v1)
    {
      CFRelease(v1);
    }
  }
}

uint64_t getChemistryId(const __CFDictionary *a1)
{
  uint64_t valuePtr = 0;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(a1, @"ChemistryID");
  if (!Value || (v2 = Value, CFTypeID v3 = CFGetTypeID(Value), v3 != CFNumberGetTypeID()))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "tmp && (CFGetTypeID(tmp)==CFNumberGetTypeID())", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 196, 0);
    return 0;
  }
  if (!CFNumberGetValue(v2, kCFNumberSInt64Type, &valuePtr))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "CFNumberGetValue((CFNumberRef)tmp, kCFNumberSInt64Type, &chemistryID_sint64)", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 197, 0);
    return 0;
  }
  return valuePtr;
}

CFTypeRef CopyHWVersion(const __CFDictionary *a1)
{
  CFNumberRef Value = CFDictionaryGetValue(a1, @"HWVersion");
  if (Value && (v2 = Value, CFTypeID v3 = CFGetTypeID(Value), v3 == CFStringGetTypeID()))
  {
    CFTypeRef result = CFRetain(v2);
    if (result) {
      return result;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "tmp && (CFGetTypeID(tmp)==CFStringGetTypeID())", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200RestoreInfo/T200RestoreInfo.c", 209, 0);
  }
  T200RestoreInfoLog((uint64_t)"%s:%d Failed getting hw_version\n", v5, v6, v7, v8, v9, v10, v11, (char)"CopyHWVersion");
  return 0;
}

uint64_t CheckKey(const __CFDictionary *a1, const void *a2)
{
  if (!a1) {
    return 0;
  }
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 0;
  }

  return CFBooleanGetValue(Value);
}

unsigned __int8 *dumpBuffer__(unsigned __int8 *result, int a2)
{
  if (a2)
  {
    int v2 = a2;
    CFTypeID v3 = result;
    do
    {
      int v4 = *v3++;
      CFTypeRef result = (unsigned __int8 *)printf("0x%02x ", v4);
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t dumpBuffer(unsigned __int8 *a1, int a2)
{
  printf("[ ");
  if (a2)
  {
    if (a2 == 2)
    {
      printf("0x%02x ");
    }
    else if (a2 == 4)
    {
      printf("0x%04x ");
    }
    else
    {
      int v4 = a2;
      do
      {
        int v5 = *a1++;
        printf("0x%02x ", v5);
        --v4;
      }
      while (v4);
    }
  }
  return printf("] %d\n", a2);
}

_DWORD *keyToString(_DWORD *result, unsigned char *a2)
{
  uint64_t v2 = 32;
  CFTypeID v3 = a2;
  do
  {
    v2 -= 8;
    *v3++ = *result >> v2;
  }
  while (v2);
  a2[4] = 0;
  return result;
}

uint64_t stringToKey(uint64_t result, int *a2)
{
  uint64_t v2 = 0;
  int v3 = 0;
  do
  {
    *a2 = v3 << 8;
    int v4 = *(unsigned __int8 *)(result + v2) | (v3 << 8);
    *a2 = v4;
    ++v2;
    int v3 = v4;
  }
  while (v2 != 4);
  return result;
}

uint64_t readSMCKey(mach_port_t a1, int a2, void *a3, size_t a4, int a5)
{
  kern_return_t v10;
  int v11;
  uint64_t v12;
  int v13;
  kern_return_t v14;
  kern_return_t v15;
  int v16;
  size_t outputStructCnt;
  char v19[5];
  long long outputStruct;
  long long v21;
  long long v22;
  _OWORD v23[7];
  uint64_t v24;
  int inputStruct;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  long long v34;
  long long v35;
  int v36;
  uint64_t v37;

  CFTypeRef v37 = *MEMORY[0x263EF8340];
  size_t v9 = 80;
  outputStructCnt = 80;
  if (a5)
  {
    size_t v9 = 168;
    outputStructCnt = 168;
  }
  CFTypeRef v36 = 0;
  uint64_t v34 = 0u;
  CFTypeRef v35 = 0u;
  uint64_t v32 = 0u;
  uint64_t v33 = 0u;
  uint64_t v30 = 0u;
  uint64_t v31 = 0u;
  uint64_t v28 = 0u;
  uint64_t v29 = 0u;
  CFDictionaryRef v26 = 0u;
  CFTypeRef v27 = 0u;
  outputStruct = 0u;
  uint64_t v21 = 0u;
  uint64_t v22 = 0u;
  memset(v23, 0, sizeof(v23));
  CFTypeRef v24 = 0;
  __memset_chk();
  __memset_chk();
  v19[0] = HIBYTE(a2);
  v19[1] = BYTE2(a2);
  v19[2] = BYTE1(a2);
  v19[3] = a2;
  v19[4] = 0;
  inputStruct = a2;
  BYTE6(v28) = 9;
  uint64_t v10 = IOConnectCallStructMethod(a1, 2u, &inputStruct, v9, &outputStruct, &outputStructCnt);
  uint64_t v11 = BYTE8(v22);
  if (v10 | BYTE8(v22))
  {
    if (v10)
    {
      printf("No info found for key '%s' (0x%X, 0x%X)\n\n", v19, v10, BYTE8(v22));
      uint64_t v11 = BYTE8(v22);
    }
    uint64_t v12 = 3758097136;
    if (v11) {
      printf("No info found for key '%s' (0x%X, 0x%X)\n\n");
    }
  }
  else
  {
    uint64_t v13 = HIDWORD(v21);
    __memset_chk();
    __memset_chk();
    inputStruct = a2;
    DWORD2(v27) = v13;
    BYTE6(v28) = 5;
    CFDictionaryRef v14 = IOConnectCallStructMethod(a1, 2u, &inputStruct, v9, &outputStruct, &outputStructCnt);
    CFDictionaryRef v15 = v14;
    if (gVerboseComms >= 2)
    {
      printf("%s:%d %c%c%c%c rc= %x", "readSMCKey", 207, (a2 >> 24), (a2 << 8 >> 24), ((__int16)a2 >> 8), (char)a2, v14);
      dumpBuffer((unsigned __int8 *)v23, a4);
    }
    uint64_t v16 = BYTE8(v22);
    if (v15 | BYTE8(v22))
    {
      if (v15)
      {
        printf("Read failed for key '%s' (0x%X, 0x%X)\n\n", v19, v15, BYTE8(v22));
        uint64_t v16 = BYTE8(v22);
      }
      uint64_t v12 = 3758097098;
      if (v16) {
        printf("Read failed for key '%s' (0x%X, 0x%X)\n\n");
      }
    }
    else
    {
      if (gVerboseComms >= 2) {
        printf("%s:%d data captured =%d\n", "readSMCKey", 213, v13);
      }
      memcpy(a3, v23, a4);
      return 0;
    }
  }
  return v12;
}

uint64_t writeSMCKey(mach_port_t a1, int a2, unsigned __int8 *a3, int a4, int a5)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  size_t v9 = 80;
  size_t outputStructCnt = 80;
  if (a5)
  {
    size_t v9 = 168;
    size_t outputStructCnt = 168;
  }
  int v36 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  memset(outputStruct, 0, sizeof(outputStruct));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v24 = 0;
  __memset_chk();
  __memset_chk();
  v14[0] = HIBYTE(a2);
  v14[1] = BYTE2(a2);
  v14[2] = BYTE1(a2);
  v14[3] = a2;
  v14[4] = 0;
  BYTE6(v28) = 6;
  int inputStruct = a2;
  DWORD2(v27) = a4;
  __memcpy_chk();
  uint64_t v10 = IOConnectCallStructMethod(a1, 2u, &inputStruct, v9, outputStruct, &outputStructCnt);
  uint64_t v11 = v10;
  if (gVerboseComms >= 2)
  {
    printf("%s:%d %c%c%c%c rc= %x", "writeSMCKey", 249, (a2 >> 24), (a2 << 8 >> 24), ((__int16)a2 >> 8), (char)a2, v10);
    dumpBuffer(a3, a4);
  }
  if (v11 || BYTE8(v16)) {
    printf("Write failed for key '%s' (0x%X, 0x%X)\n\n", v14, v11, BYTE8(v16));
  }
  return v11;
}

double veridian_cmd_init(uint64_t a1, char a2, char a3)
{
  *(_DWORD *)a1 = 0;
  *(_WORD *)(a1 + 4) = 0;
  *(unsigned char *)a1 = a2;
  *(void *)&double result = 16780032;
  *(_DWORD *)(a1 + 1) = 16780032;
  *(unsigned char *)(a1 + 5) = a3;
  return result;
}

uint64_t smcSMBWrite(unsigned __int8 a1, uint64_t a2, unsigned int a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  memset(&v26[70], 0, 50);
  if (a3 <= 2) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  memset(&v26[6], 0, 64);
  if (a3 <= 2) {
    unsigned __int8 v6 = 2;
  }
  else {
    unsigned __int8 v6 = 4;
  }
  v26[0] = v6;
  *(_WORD *)&v26[1] = 5634;
  v26[3] = a1;
  v26[4] = 1;
  v26[5] = a3;
  if (writeSMCKey(gSMCConnect, 1397572163, v26, 6, 1)) {
    return 0xFFFFFFFFLL;
  }
  memset(v26, 0, sizeof(v26));
  if (!a3) {
    goto LABEL_20;
  }
  int v7 = 0;
  do
  {
    unsigned __int8 v8 = v7++;
    v26[v8] = *(unsigned char *)(a2 + v8);
  }
  while (a3 > v7);
  if (!(_BYTE)v7)
  {
LABEL_20:
    LOBYTE(v7) = 0;
    v26[0] = 98;
    unsigned __int8 v14 = 1;
LABEL_21:
    bzero(&v26[v14], (30 - v7) + 1);
    goto LABEL_22;
  }
  size_t v9 = v26;
  int v10 = 98;
  int v11 = v7;
  do
  {
    v10 ^= *v9;
    int v12 = 8;
    do
    {
      int v13 = (char)v10;
      v10 *= 2;
      if (v13 < 0) {
        v10 ^= 7u;
      }
      --v12;
    }
    while ((_BYTE)v12);
    ++v9;
    --v11;
  }
  while ((_BYTE)v11);
  v26[v7] = v10;
  unsigned __int8 v14 = v8 + 2;
  if (v14 <= 0x1Fu) {
    goto LABEL_21;
  }
LABEL_22:
  if (writeSMCKey(gSMCConnect, 1397572183, v26, 32, 1) || smcI2CGO()) {
    return 0xFFFFFFFFLL;
  }
  memset(v25, 0, sizeof(v25));
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  size_t v16 = (v5 + a3);
  char v18 = 1;
  if (v16 > 0x1E) {
    int v17 = 1397572164;
  }
  else {
    int v17 = 1397572178;
  }
  if (readSMCKey(gSMCConnect, v17, &v18, v16, 1)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t smcI2CGO()
{
  uint64_t v0 = 3758097098;
  if (!writeSMCKey(gSMCConnect, 1397572167, byte_263E2ED48, 1, 1))
  {
    __int16 v4 = 1;
    int v2 = -11;
    while (1)
    {
      if (__CFADD__(v2++, 1)) {
        return 3758097110;
      }
      if (readSMCKey(gSMCConnect, 1397572179, &v4, 2uLL, 1)) {
        return v0;
      }
      if (!(_BYTE)v4) {
        break;
      }
      usleep(0x186A0u);
      if (v4 != 1) {
        return v0;
      }
    }
    return 0;
  }
  return v0;
}

uint64_t smcSMBRead(int a1, void *a2, unsigned int a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a3 <= 2) {
    int v6 = 1;
  }
  else {
    int v6 = 2;
  }
  unsigned int v7 = v6 + a3;
  if (a3 <= 2) {
    char v8 = 1;
  }
  else {
    char v8 = 3;
  }
  v23[0] = v8;
  *(_WORD *)&v23[1] = 5634;
  *(_WORD *)&v23[3] = a1;
  v23[5] = v7;
  if (writeSMCKey(gSMCConnect, 1397572163, v23, 6, 1)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v24 = 0;
  memset(v23, 0, sizeof(v23));
  if (writeSMCKey(gSMCConnect, 1397572181, v23, 120, 1) || smcI2CGO()) {
    return 0xFFFFFFFFLL;
  }
  memset(v22, 0, sizeof(v22));
  char v21 = 1;
  int v9 = v7 > 0x1Eu ? 1397572164 : 1397572178;
  if (readSMCKey(gSMCConnect, v9, &v21, v7, 1)) {
    return 0xFFFFFFFFLL;
  }
  int v11 = a1 ^ 0x62;
  int v12 = 8;
  do
  {
    int v13 = (char)v11;
    v11 *= 2;
    if (v13 < 0) {
      v11 ^= 7u;
    }
    --v12;
  }
  while ((_BYTE)v12);
  int v14 = v11 ^ 0x17;
  int v15 = 8;
  do
  {
    int v16 = (char)v14;
    v14 *= 2;
    if (v16 < 0) {
      v14 ^= 7u;
    }
    --v15;
  }
  while ((_BYTE)v15);
  if ((_BYTE)v7)
  {
    int v17 = &v21;
    do
    {
      v14 ^= *v17;
      int v18 = 8;
      do
      {
        int v19 = (char)v14;
        v14 *= 2;
        if (v19 < 0) {
          v14 ^= 7u;
        }
        --v18;
      }
      while ((_BYTE)v18);
      ++v17;
      --v7;
    }
    while ((_BYTE)v7);
  }
  if ((_BYTE)v14) {
    return 4294967293;
  }
  if (a3 <= 2) {
    long long v20 = &v21;
  }
  else {
    long long v20 = v22;
  }
  memcpy(a2, v20, a3);
  return 0;
}

uint64_t BC__connect()
{
  kern_return_t v5;

  if (gSMCConnect) {
    return 0;
  }
  mach_port_t v1 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v2 = IOServiceMatching("AppleSMC");
  io_service_t MatchingService = IOServiceGetMatchingService(v1, v2);
  if (!MatchingService
    || (io_object_t v4 = MatchingService,
        char v5 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, (io_connect_t *)&gSMCConnect),
        IOObjectRelease(v4),
        v5)
    || !gSMCConnect
    || IOConnectCallScalarMethod(gSMCConnect, 0, 0, 0, 0, 0))
  {
    gSMCConnect = 0;
  }
  else if (gSMCConnect)
  {
    return 0;
  }
  printf("cannot open gas gauge device");
  return 0xFFFFFFFFLL;
}

uint64_t BC__disconnect()
{
  if (gSMCConnect)
  {
    if (!IOConnectCallScalarMethod(gSMCConnect, 1u, 0, 0, 0, 0)) {
      IOServiceClose(gSMCConnect);
    }
    gSMCConnect = 0;
  }
  return 0;
}

uint64_t BC__transmit(int a1, unsigned int a2, unsigned __int8 *a3)
{
  if (BC__connect())
  {
    printf("Failed to BC__connect");
    return 0xFFFFFFFFLL;
  }
  if (gVerboseComms) {
    printf("%s cmd=0x%x amount=%d\n", "BC__transmit", a1, a2);
  }
  if (a2 > 0x20) {
    return 0xFFFFFFFFLL;
  }
  int v7 = smcSMBWrite(a1, (uint64_t)a3, a2);
  int v8 = v7;
  if (gVerboseComms)
  {
    printf("%s:%d status=%d", "BC__transmit", 552, v7);
    dumpBuffer(a3, a2);
    putchar(10);
  }
  return (v8 >> 31) & 0xFFFFFFFE;
}

uint64_t BC__receive(int a1, unsigned int a2, void *a3)
{
  unsigned __int8 v11 = a1;
  *(_WORD *)int v10 = a1;
  if (BC__connect())
  {
    printf("Failed to BC__connect");
  }
  else
  {
    if (gVerboseComms) {
      printf("%s cmd=0x%x amount=%d\n", "BC__receive", a1, a2);
    }
    if (a2 < 3)
    {
      if (writeSMCKey(gSMCConnect, 1196572996, &v11, 1, 1)) {
        return 0xFFFFFFFFLL;
      }
      mach_port_t v7 = gSMCConnect;
      size_t v8 = a2;
      int v9 = 1196577348;
    }
    else
    {
      if (writeSMCKey(gSMCConnect, 1195524941, v10, 2, 1)) {
        return 0xFFFFFFFFLL;
      }
      mach_port_t v7 = gSMCConnect;
      size_t v8 = a2;
      int v9 = 1195528791;
    }
    if (!readSMCKey(v7, v9, a3, v8, 1)) {
      return 0;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t Stop_smc_communication()
{
  unsigned __int8 v1 = 0;
  if (writeSMCKey(gSMCConnect, 1111576659, &v1, 1, 1)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t Enable_smc_communication()
{
  unsigned __int8 v1 = 1;
  if (writeSMCKey(gSMCConnect, 1111576659, &v1, 1, 1)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0;
  }
}

uint64_t BC__readSMCKey(int a1, void *a2, size_t a3)
{
  if (BC__connect())
  {
    printf("Failed to BC__connect");
    return 0xFFFFFFFFLL;
  }
  else if (readSMCKey(gSMCConnect, a1, a2, a3, 1))
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
}

uint64_t BC__writeSMCKey(int a1, unsigned __int8 *a2, int a3)
{
  if (BC__connect())
  {
    printf("Failed to BC__connect");
    return 0xFFFFFFFFLL;
  }
  else if (writeSMCKey(gSMCConnect, a1, a2, a3, 1))
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
}

uint64_t BC__getInfo(_DWORD *a1, size_t a2)
{
  kern_return_t v6;
  io_connect_t v8;
  size_t v9;

  int v9 = a2;
  size_t v8 = 0;
  if (BC__GasGauge_connect(&v8))
  {
    printf("Failed to BC__GasGauge_connect");
    return 0xFFFFFFFFLL;
  }
  else
  {
    unsigned int v4 = 0;
    int v5 = 5;
    do
    {
      if (v4)
      {
        printf("Error getting info: 0x%X. Retrying... \n", v5);
        usleep(0x186A0u);
      }
      int v6 = IOConnectCallMethod(v8, 0, 0, 0, 0, 0, 0, 0, a1, &v9);
      int v5 = v6;
      if (v4 > 8) {
        break;
      }
      ++v4;
    }
    while (v6);
    if (v6)
    {
      printf("Error getting info: 0x%X \n", v6);
      uint64_t v3 = v5 | (retrieveGasGaugeRegistryVal() << 8);
    }
    else
    {
      printf("fw:%u cfg:%u dnvd1:%u dnvd2:%u crypto:%u chipId:%u chemistry:%u hwId:%u isTwoStageSupported:%u \n", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[7], a1[8], *((unsigned char *)a1 + 62) & 1);
      uint64_t v3 = 0;
    }
    if (v8) {
      IOServiceClose(v8);
    }
  }
  return v3;
}

uint64_t BC__GasGauge_connect(io_connect_t *a1)
{
  kern_return_t v7;

  if (*a1) {
    return 0;
  }
  mach_port_t v3 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v4 = IOServiceMatching("AppleGasGaugeUpdate");
  io_service_t MatchingService = IOServiceGetMatchingService(v3, v4);
  if (MatchingService)
  {
    io_object_t v6 = MatchingService;
    mach_port_t v7 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, a1);
    IOObjectRelease(v6);
    if (!v7)
    {
      if (*a1) {
        return 0;
      }
    }
  }
  *a1 = 0;
  printf("cannot open gas gauge device");
  return 0xFFFFFFFFLL;
}

uint64_t retrieveGasGaugeRegistryVal()
{
  unsigned __int8 valuePtr = 0;
  CFDictionaryRef v0 = IOServiceMatching("AppleGasGaugeUpdate");
  if (v0)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v0);
    if (MatchingService + 1 < 2)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "MACH_PORT_VALID(service)", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/insystem_communication.c", 867, 0);
    }
    else
    {
      io_object_t v2 = MatchingService;
      CFNumberRef CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(MatchingService, @"CommunicationError", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
      if (CFProperty)
      {
        CFNumberRef v4 = CFProperty;
        CFTypeID v5 = CFGetTypeID(CFProperty);
        if (v5 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v4, kCFNumberSInt8Type, &valuePtr);
          printf("GasGauge Registry Value %d\n", valuePtr);
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "CFGetTypeID(smc_error_code) == CFNumberGetTypeID()", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/insystem_communication.c", 870, 0);
        }
        CFRelease(v4);
      }
      IOObjectRelease(v2);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "matchingDict", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/insystem_communication.c", 865, 0);
  }
  return valuePtr;
}

uint64_t BC__startUpdate(void *a1, size_t a2)
{
  kern_return_t v6;
  mach_port_t connection;
  size_t v9;

  int v9 = a2;
  connection = 0;
  printf("BC__startUpdate");
  if (BC__GasGauge_connect(&connection))
  {
    printf("Failed to BC__GasGauge_connect");
    return 0xFFFFFFFFLL;
  }
  else
  {
    unsigned int v4 = 0;
    int v5 = 5;
    do
    {
      if (v4)
      {
        printf("Error starting update: 0x%X. Retrying... \n", v5);
        usleep(0x186A0u);
      }
      io_object_t v6 = IOConnectCallMethod(connection, 1u, 0, 0, 0, 0, 0, 0, a1, &v9);
      int v5 = v6;
      if (v4 > 8) {
        break;
      }
      ++v4;
    }
    while (v6);
    if (v6)
    {
      printf("Error starting update: 0x%X \n", v6);
      uint64_t v3 = v5 | (retrieveGasGaugeRegistryVal() << 8);
    }
    else
    {
      uint64_t v3 = 0;
    }
    if (connection) {
      IOServiceClose(connection);
    }
  }
  return v3;
}

uint64_t BC__sendImage(void *a1)
{
  io_connect_t v5 = 0;
  printf("BC__sendImage");
  if (BC__GasGauge_connect(&v5))
  {
    printf("Failed to BC__GasGauge_connect");
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v3 = IOConnectCallMethod(v5, 2u, 0, 0, a1, a1[8] + 80, 0, 0, 0, 0);
    uint64_t v2 = v3;
    if (v3)
    {
      printf("Error writing image. 0x%X \n", v3);
      uint64_t v2 = v2 | (retrieveGasGaugeRegistryVal() << 8);
    }
    if (v5) {
      IOServiceClose(v5);
    }
  }
  return v2;
}

uint64_t BC__commitImage()
{
  io_connect_t v3 = 0;
  printf("BC__commitImage");
  if (BC__GasGauge_connect(&v3))
  {
    printf("Failed to BC__GasGauge_connect");
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v1 = IOConnectCallMethod(v3, 3u, 0, 0, 0, 0, 0, 0, 0, 0);
    uint64_t v0 = v1;
    if (v1)
    {
      printf("Error committing image. 0x%X \n", v1);
      uint64_t v0 = v0 | (retrieveGasGaugeRegistryVal() << 8);
    }
    if (v3) {
      IOServiceClose(v3);
    }
  }
  return v0;
}

uint64_t T200UpdaterInfoLog(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v9 = (const char *)MEMORY[0x270FA5388]();
  uint64_t v12 = *MEMORY[0x263EF8340];
  vsnprintf(__str, 0x1000uLL, v9, &a9);
  if (logSinkFuncUpdate) {
    return logSinkFuncUpdate(logContextUpdtaer, __str);
  }
  else {
    return printf("%s", __str);
  }
}

uint64_t T200UpdaterCreate(const void *a1, uint64_t (*a2)(void, void), uint64_t a3, CFErrorRef *a4)
{
  pthread_once(&_T200ClassInitializeOnce, (void (*)(void))_T200UpdaterClassInitialize);
  logSinkFuncUpdate = a2;
  logContextUpdtaer = a3;
  T200UpdaterInfoLog((uint64_t)"%s:%d Start \n", v8, v9, v10, v11, v12, v13, v14, (char)"_T200UpdaterCreate");
  T200CFShow_0(a1);
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  uint64_t Instance = _CFRuntimeCreateInstance();
  uint64_t v17 = Instance;
  if (!Instance)
  {
    CFErrorRef CFError = createCFError("Cannot allocate memory for updater", 3u, 0, 0);
    if (a4 && CFError)
    {
      *a4 = CFError;
    }
    else if (!CFError)
    {
      goto LABEL_39;
    }
    CFRelease(CFError);
    goto LABEL_39;
  }
  int v18 = (_WORD *)(Instance + 8481);
  int v19 = (CFDictionaryRef *)(Instance + 16);
  bzero((void *)(Instance + 16), 0x2148uLL);
  *(void *)(v17 + 16) = CFDictionaryCreateMutableCopy(v15, 0, (CFDictionaryRef)a1);
  *(_WORD *)(v17 + 8500) = 0;
  *(_DWORD *)(v17 + 8492) = 0;
  *int v18 = 0;
  *(unsigned char *)(v17 + 8483) = 0;
  *(_OWORD *)(v17 + 8448) = 0u;
  *(_DWORD *)(v17 + 8503) = 0;
  *(_WORD *)(v17 + 8507) = 0;
  *(_OWORD *)(v17 + 8512) = 0u;
  *(_DWORD *)(v17 + 8528) = 0;
  long long v20 = *(void **)(v17 + 40);
  if (v20)
  {
    free(v20);
    *(void *)(v17 + 40) = 0;
  }
  char v21 = *(void **)(v17 + 72);
  if (v21)
  {
    free(v21);
    *(void *)(v17 + 72) = 0;
  }
  long long v22 = *(void **)(v17 + 80);
  if (v22)
  {
    free(v22);
    *(void *)(v17 + 80) = 0;
  }
  long long v23 = *(void **)(v17 + 64);
  if (v23)
  {
    free(v23);
    *(void *)(v17 + 64) = 0;
  }
  uint64_t v24 = *(void **)(v17 + 48);
  if (v24)
  {
    free(v24);
    *(void *)(v17 + 48) = 0;
  }
  uint64_t v25 = *(void **)(v17 + 56);
  if (v25)
  {
    free(v25);
    *(void *)(v17 + 56) = 0;
  }
  long long v26 = *(const void **)(v17 + 32);
  if (v26)
  {
    CFRelease(v26);
    *(void *)(v17 + 32) = 0;
  }
  uint64_t v27 = *(const void **)(v17 + 24);
  if (v27)
  {
    CFRelease(v27);
    *(void *)(v17 + 24) = 0;
  }
  if (CFDictionaryContainsKey(*v19, @"Options"))
  {
    CFBooleanRef Value = CFDictionaryGetValue(*v19, @"Options");
    if (Value)
    {
      CFDictionaryRef v29 = (const __CFDictionary *)CFRetain(Value);
      if (v29)
      {
        CFDictionaryRef v30 = v29;
        *(unsigned char *)(v17 + 8506) = CheckKeyTrue(v29, @"DeferredCommit");
        long long v31 = CFDictionaryGetValue(v30, @"PreflightContext");
        if (v31)
        {
          CFStringRef v32 = (const __CFString *)CFRetain(v31);
          CFStringRef v33 = v32;
          if (v32) {
            *(unsigned char *)(v17 + 8507) = CFEqual(v32, @"BootedOS");
          }
        }
        else
        {
          CFStringRef v33 = 0;
        }
        int v35 = CheckKeyTrue(v30, @"RestoreInternal");
        *(unsigned char *)(v17 + 8504) = v35;
        if (v35)
        {
          BOOL v43 = CheckKeyTrue(v30, @"SkipSameVersion") == 0;
          int v44 = *(unsigned __int8 *)(v17 + 8504);
          *(unsigned char *)(v17 + 8508) = v43;
          if (v44) {
            BOOL v45 = CheckKeyTrue(v30, @"RollbackFWVer") != 0;
          }
          else {
            BOOL v45 = 0;
          }
        }
        else
        {
          BOOL v45 = 0;
          *(unsigned char *)(v17 + 8508) = 0;
        }
        *(unsigned char *)(v17 + 8503) = v45;
        T200UpdaterInfoLog((uint64_t)"%s:%d isOTA: %d \n", v36, v37, v38, v39, v40, v41, v42, (char)"_t200InitUpdater");
        T200UpdaterInfoLog((uint64_t)"%s:%d isBootedOS: %d \n", v46, v47, v48, v49, v50, v51, v52, (char)"_t200InitUpdater");
        T200UpdaterInfoLog((uint64_t)"%s:%d Internal Restore: %d \n", v53, v54, v55, v56, v57, v58, v59, (char)"_t200InitUpdater");
        T200UpdaterInfoLog((uint64_t)"%s:%d Force Firmware Upgrade: %d \n", v60, v61, v62, v63, v64, v65, v66, (char)"_t200InitUpdater");
        T200UpdaterInfoLog((uint64_t)"%s:%d Rollback FW Version: %d \n", v67, v68, v69, v70, v71, v72, v73, (char)"_t200InitUpdater");
        if (v33) {
          CFRelease(v33);
        }
        CFRelease(v30);
      }
    }
  }
  CFAutorelease(*v19);
  T200UpdaterInfoLog((uint64_t)"%s:%d End \n", v74, v75, v76, v77, v78, v79, v80, (char)"_T200UpdaterCreate");
LABEL_39:
  g_T200Ref = v17;
  return v17;
}

uint64_t _T200UpdaterExecCommand(uint64_t a1, const __CFString *a2, const __CFDictionary *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (CFErrorRef *)a5;
  uint64_t v839 = *MEMORY[0x263EF8340];
  T200UpdaterInfoLog((uint64_t)"%s:%d Start \n", (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, (char)"_T200UpdaterExecCommand");
  if (!v8)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "error != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 379, 0);
    T200UpdaterInfoLog((uint64_t)"%s:%d CFErrorRef is null", v679, v680, v681, v682, v683, v684, v685, (char)"_T200UpdaterExecCommand");
    uint64_t v46 = 0;
    goto LABEL_41;
  }
  CFErrorRef *v8 = 0;
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 381, 0);
    v145 = "T200: Invalid Updater Data ";
    unsigned int v147 = 69;
    v146 = 0;
LABEL_400:
    uint64_t v148 = 0;
    goto LABEL_40;
  }
  uint64_t v12 = (unsigned __int8 *)(a1 + 8481);
  if (a3) {
    *(void *)(a1 + 24) = a3;
  }
  T200CFShow_0(*(const void **)(a1 + 16));
  T200CFShow_0(*(const void **)(a1 + 24));
  if (CFEqual(a2, @"queryInfo"))
  {
    T200UpdaterInfoLog((uint64_t)"%s:%d Entering execCommand: command = queryInfo \n", v13, v14, v15, v16, v17, v18, v19, (char)"_T200UpdaterExecCommand");
    T200UpdaterInfoLog((uint64_t)"%s:%d OTA = %d, BootedOS = %d \n", v20, v21, v22, v23, v24, v25, v26, (char)"_T200UpdaterExecCommand");
    uint64_t v27 = *(const void **)(a1 + 32);
    if (v27)
    {
      CFRelease(v27);
      *(void *)(a1 + 32) = 0;
    }
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    *(void *)(a1 + 32) = Mutable;
    if (!Mutable)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData->fOutput != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 398, 0);
LABEL_399:
      *(_DWORD *)(a1 + 8492) = 70;
      v145 = "T200: Invalid Updater Data";
      v146 = "CFDictionaryCreateMutable";
      unsigned int v147 = 70;
      goto LABEL_400;
    }
    READ_DATA__getVersionInformation(0);
    uint64_t InfoSMCIF = _getInfoSMCIF(a1, v29, v30, v31, v32, v33, v34, v35);
    if (InfoSMCIF)
    {
      uint64_t v686 = InfoSMCIF;
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 403, 0);
LABEL_403:
      unsigned int v147 = *(_DWORD *)(a1 + 8492);
      v145 = "T200: Get T200 Info Failed";
      v146 = "_getInfoSMCIF";
LABEL_425:
      uint64_t v148 = v686;
      goto LABEL_40;
    }
  }
  CFTypeRef v44 = 0;
  if (CFStringCompare(a2, @"performNextStage", 0)) {
    goto LABEL_11;
  }
  T200UpdaterInfoLog((uint64_t)"%s:%d Entering execCommand: command = performNextStage \n", v37, v38, v39, v40, v41, v42, v43, (char)"_T200UpdaterExecCommand");
  uint64_t v775 = *(unsigned __int8 *)(a1 + 8506);
  uint64_t v777 = *(unsigned __int8 *)(a1 + 8507);
  T200UpdaterInfoLog((uint64_t)"%s:%d OTA = %d, BootedOS = %d \n", v47, v48, v49, v50, v51, v52, v53, (char)"_T200UpdaterExecCommand");
  uint64_t v54 = *(const void **)(a1 + 32);
  if (v54)
  {
    CFRelease(v54);
    *(void *)(a1 + 32) = 0;
  }
  CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFMutableDictionaryRef v55 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(void *)(a1 + 32) = v55;
  if (!v55)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData->fOutput != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 413, 0);
    goto LABEL_399;
  }
  READ_DATA__getVersionInformation(0);
  uint64_t v63 = _getInfoSMCIF(a1, v56, v57, v58, v59, v60, v61, v62);
  if (v63)
  {
    uint64_t v686 = v63;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 419, 0);
    goto LABEL_403;
  }
  T200UpdaterInfoLog((uint64_t)"%s:%d Start  \n", v64, v65, v66, v67, v68, v69, v70, (char)"_entitlementExist");
  CFDictionaryRef v71 = *(const __CFDictionary **)(a1 + 16);
  if (!v71)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData->fOptions", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2001, 0);
    T200UpdaterInfoLog((uint64_t)"%s:%d fOptions is NULL \n", v687, v688, v689, v690, v691, v692, v693, (char)"_entitlementExist");
    goto LABEL_31;
  }
  if (!CFDictionaryContainsKey(v71, @"Options")
    || (CFBooleanRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"Options")) == 0
    || (CFTypeRef v73 = CFRetain(Value)) == 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "restoreOptions", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2007, 0);
    T200UpdaterInfoLog((uint64_t)"%s:%d Failed getting the kT200OptionOptions \n", v96, v97, v98, v99, v100, v101, v102, (char)"_entitlementExist");
LABEL_31:
    T200UpdaterInfoLog((uint64_t)"%s:%d End \n", v103, v104, v105, v106, v107, v108, v109, (char)"_entitlementExist");
    int v791 = 0;
    goto LABEL_32;
  }
  uint64_t v81 = v73;
  T200UpdaterInfoLog((uint64_t)"%s:%d Restore Options:  \n", v74, v75, v76, v77, v78, v79, v80, (char)"_entitlementExist");
  T200CFShow_0(v81);
  if (CheckKeyTrue((const __CFDictionary *)v81, @"EnableDeveloperCommands")
    || CheckKeyTrue((const __CFDictionary *)v81, @"EnableValidationCommands"))
  {
    T200UpdaterInfoLog((uint64_t)"%s:%d FA/VNV Entitlement Exist. \n", v82, v83, v84, v85, v86, v87, v88, (char)"_entitlementExist");
    int v791 = 1;
  }
  else
  {
    int v791 = 0;
  }
  T200UpdaterInfoLog((uint64_t)"%s:%d End \n", v82, v83, v84, v85, v86, v87, v88, (char)"_entitlementExist");
  CFRelease(v81);
LABEL_32:
  T200UpdaterInfoLog((uint64_t)"%s:%d Start  \n", v89, v90, v91, v92, v93, v94, v95, (char)"_getFirmware");
  v110 = *(const void **)(a1 + 32);
  if (!v110 || (CFTypeRef v111 = CFRetain(v110)) == 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "deviceInfoRef", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2038, 0);
    uint64_t v137 = 85;
    T200UpdaterInfoLog((uint64_t)"%s:%d End with error %d \n", v138, v139, v140, v141, v142, v143, v144, (char)"_getFirmware");
LABEL_39:
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 429, 0);
    *(_DWORD *)(a1 + 8492) = v137;
    v145 = "T200: Get Firmware Image(s) Failed";
    v146 = "_getFirmware";
    unsigned int v147 = v137;
    uint64_t v148 = v137;
LABEL_40:
    uint64_t v46 = 0;
    CFErrorRef *v8 = createCFError(v145, v147, v146, v148);
    goto LABEL_41;
  }
  uint64_t v119 = v111;
  T200UpdaterInfoLog((uint64_t)"%s:%d show deviceInfoRef \n", v112, v113, v114, v115, v116, v117, v118, (char)"_getFirmware");
  T200CFShow_0(v119);
  uint64_t v120 = *(const void **)(a1 + 24);
  v787 = v8;
  uint64_t v788 = a1;
  v792 = (unsigned __int8 *)(a1 + 8481);
  if (!v120 || (CFTypeRef v121 = CFRetain(v120)) == 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "fDataIn", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2043, 0);
    uint64_t v129 = 0;
    uint64_t v137 = 83;
    goto LABEL_45;
  }
  uint64_t v129 = v121;
  T200UpdaterInfoLog((uint64_t)"%s:%d  show fOptions \n", v122, v123, v124, v125, v126, v127, v128, (char)"_getFirmware");
  T200CFShow_0(v129);
  if (v791) {
    goto LABEL_73;
  }
  uint64_t v165 = CFDictionaryGetValue((CFDictionaryRef)v119, @"ChemistryID");
  uint64_t v166 = CFDictionaryGetValue((CFDictionaryRef)v119, @"HWVersion");
  T200UpdaterInfoLog((uint64_t)"%s:%d start \n", v167, v168, v169, v170, v171, v172, v173, (char)"_extract_cell_ID_Supported");
  uint64_t v794 = (uint64_t)v166;
  CFStringRef v174 = CFStringCreateWithFormat(alloc, 0, @"%@.%@.%@.%@.%@", @"hw_version", v166, @"chemistry", v165, @"cell_id_skip");
  uint64_t v796 = (uint64_t)v165;
  if (!v174)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "keyCellIDSkip!=NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1708, 0);
    goto LABEL_64;
  }
  CFStringRef v175 = v174;
  uint64_t v176 = CFDictionaryGetValue((CFDictionaryRef)v129, @"FirmwareData");
  if (!v176 || (CFTypeRef v177 = CFRetain(v176)) == 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "dataRef && CFGetTypeID(dataRef) == CFDataGetTypeID()", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1713, 0);
LABEL_63:
    CFRelease(v175);
LABEL_64:
    a1 = v788;
LABEL_65:
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret==kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2056, 0);
    uint64_t v137 = 68;
    T200UpdaterInfoLog((uint64_t)"%s:%d cell_ID %d not supported. Error: %d \n", v204, v205, v206, v207, v208, v209, v210, (char)"_getFirmware");
LABEL_85:
    CFRelease(v119);
    uint64_t v12 = v792;
    goto LABEL_86;
  }
  uint64_t v178 = v177;
  CFTypeID v179 = CFGetTypeID(v177);
  if (v179 != CFDataGetTypeID())
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "dataRef && CFGetTypeID(dataRef) == CFDataGetTypeID()", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1713, 0);
    CFRelease(v178);
    goto LABEL_63;
  }
  CFPropertyListRef v180 = CFPropertyListCreateWithData(alloc, (CFDataRef)v178, 0, 0, 0);
  uint64_t v181 = v180;
  if (v180 && (CFTypeID v182 = CFGetTypeID(v180), v182 == CFDictionaryGetTypeID()))
  {
    ValueForKeyPathInDict = (const void *)AMSupportGetValueForKeyPathInDict();
    if (ValueForKeyPathInDict)
    {
      CFBooleanRef v191 = (const __CFBoolean *)CFRetain(ValueForKeyPathInDict);
      if (v191)
      {
        CFBooleanRef v192 = v191;
        CFTypeID v193 = CFGetTypeID(v191);
        if (v193 == CFBooleanGetTypeID() && CFBooleanGetValue(v192) == 1)
        {
          T200UpdaterInfoLog((uint64_t)"%s:%d Cell_iD is Skip \n", v194, v195, v196, v197, v198, v199, v200, (char)"_extract_cell_ID_Supported");
          int v201 = 68;
        }
        else
        {
          int v201 = 0;
        }
        CFRelease(v178);
        CFRelease(v192);
        CFRelease(v175);
        uint64_t v8 = v787;
        goto LABEL_68;
      }
    }
    T200UpdaterInfoLog((uint64_t)"%s:%d Cell_iD is not skip: \n", v184, v185, v186, v187, v188, v189, v190, (char)"_extract_cell_ID_Supported");
    int v201 = 0;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwareDictRef && CFGetTypeID(firmwareDictRef) == CFDictionaryGetTypeID()", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1717, 0);
    int v201 = 31;
  }
  CFRelease(v178);
  CFRelease(v175);
  if (v181) {
LABEL_68:
  }
    CFRelease(v181);
  a1 = v788;
  if (v201) {
    goto LABEL_65;
  }
  if (_extract_data_map(0, (const __CFDictionary *)v129, v796, v794, (CFTypeRef *)(v788 + 40), (unsigned int *)(v788 + 8448), v202, v203))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret==kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2059, 0);
    uint64_t v137 = 31;
    goto LABEL_420;
  }
  if (_extract_data_map(1, (const __CFDictionary *)v129, v796, v794, (CFTypeRef *)(v788 + 80), (unsigned int *)(v788 + 8456), v211, v212))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret==kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2062, 0);
    uint64_t v137 = 65;
    goto LABEL_420;
  }
  if (_extract_data_map(2, (const __CFDictionary *)v129, v796, v794, (CFTypeRef *)(v788 + 72), (unsigned int *)(v788 + 8452), v213, v214))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret==kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2065, 0);
    uint64_t v137 = 64;
    a1 = v788;
    goto LABEL_420;
  }
LABEL_73:
  T200UpdaterInfoLog((uint64_t)"%s:%d start  \n", v130, v131, v132, v133, v134, v135, v136, (char)"_extract_digest_map");
  CFDataRef v215 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)v129, @"FirmwareData");
  if (v215 && (CFDataRef v216 = v215, v217 = CFGetTypeID(v215), v217 == CFDataGetTypeID()))
  {
    CFPropertyListRef v218 = CFPropertyListCreateWithData(alloc, v216, 0, 0, 0);
    if (v218)
    {
      v219 = v218;
      CFTypeID v220 = CFGetTypeID(v218);
      if (v220 == CFDictionaryGetTypeID())
      {
        CFStringRef v221 = CFStringCreateWithFormat(alloc, 0, @"%@.%@", @"digest_der", @"payload", v775, v777);
        v222 = (const void *)AMSupportGetValueForKeyPathInDict();
        if (v222 && (CFDataRef v223 = (const __CFData *)CFRetain(v222)) != 0)
        {
          CFDataRef v224 = v223;
          size_t v225 = (CFDataGetLength(v223) + 31) & 0xFFFFFFE0;
          *(_DWORD *)(v788 + 8460) = CFDataGetLength(v224);
          char v226 = 1;
          uint64_t v227 = calloc(v225, 1uLL);
          *(void *)(v788 + 64) = v227;
          bzero(v227, v225);
          v840.length = *(unsigned int *)(v788 + 8460);
          v840.location = 0;
          CFDataGetBytes(v224, v840, *(UInt8 **)(v788 + 64));
          T200UpdaterInfoLog((uint64_t)"%s:%d lenDigestData=%d \n", v228, v229, v230, v231, v232, v233, v234, (char)"_extract_digest_map");
          T200UpdaterInfoLog((uint64_t)"%s:%d end \n", v235, v236, v237, v238, v239, v240, v241, (char)"_extract_digest_map");
          CFRelease(v224);
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "digestMapDataRef", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1671, 0);
          char v226 = 0;
        }
        uint64_t v8 = v787;
        if (v221) {
          CFRelease(v221);
        }
        CFRelease(v219);
        a1 = v788;
        if (v226)
        {
          T200UpdaterInfoLog((uint64_t)"%s:%d End \n", v242, v243, v244, v245, v246, v247, v248, (char)"_getFirmware");
          uint64_t v137 = 0;
          goto LABEL_85;
        }
        goto LABEL_419;
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwareDictRef && CFGetTypeID(firmwareDictRef) == CFDictionaryGetTypeID()", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1666, 0);
      CFRelease(v219);
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwareDictRef && CFGetTypeID(firmwareDictRef) == CFDictionaryGetTypeID()", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1666, 0);
    }
    a1 = v788;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "dataRef && CFGetTypeID(dataRef) == CFDataGetTypeID()", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1662, 0);
    a1 = v788;
  }
LABEL_419:
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret==kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2068, 0);
  uint64_t v137 = 66;
LABEL_420:
  uint64_t v12 = v792;
LABEL_45:
  T200UpdaterInfoLog((uint64_t)"%s:%d End with error %d \n", v151, v152, v153, v154, v155, v156, v157, (char)"_getFirmware");
  CFRelease(v119);
  if (v129) {
LABEL_86:
  }
    CFRelease(v129);
  if (v137 == 68)
  {
    *(_WORD *)uint64_t v12 = 0;
    v12[2] = 0;
    T200UpdaterInfoLog((uint64_t)"%s:%d Skip updating as this is not supported cell-id \n", v158, v159, v160, v161, v162, v163, v164, (char)"_T200UpdaterExecCommand");
    goto LABEL_93;
  }
  if (v137) {
    goto LABEL_39;
  }
  BOOL v256 = v12[27] == 0;
  uint64_t v257 = _check_update_needed(a1, (BOOL *)(a1 + 8481), 0, 0, v256, v162, v163, v164);
  if (v257)
  {
    uint64_t v686 = v257;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 433, 0);
    *(_DWORD *)(a1 + 8492) = v686;
    v145 = "T200: Check Update Needed Failed for Firmware Image";
LABEL_424:
    v146 = "_check_update_needed";
    unsigned int v147 = v686;
    goto LABEL_425;
  }
  uint64_t v261 = _check_update_needed(a1, (BOOL *)(a1 + 8483), 1, 0, v256, v258, v259, v260);
  if (v261)
  {
    uint64_t v686 = v261;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 436, 0);
    *(_DWORD *)(a1 + 8492) = v686;
    v145 = "T200: Check Update Needed Failed for Configuration Image";
    goto LABEL_424;
  }
  uint64_t v265 = _check_update_needed(a1, (BOOL *)(a1 + 8482), 2, 0, v256, v262, v263, v264);
  if (v265)
  {
    uint64_t v686 = v265;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 439, 0);
    *(_DWORD *)(a1 + 8492) = v686;
    v145 = "T200: Check Update Needed Failed for DNVD Image";
    goto LABEL_424;
  }
LABEL_93:
  uint64_t v778 = v12[2];
  uint64_t v779 = *v12;
  uint64_t v776 = v12[1];
  T200UpdaterInfoLog((uint64_t)"%s:%d Update status:dnvd:%d conf:%d firmware:%d \n", v249, v250, v251, v252, v253, v254, v255, (char)"_T200UpdaterExecCommand");
  int is_recovery = os_variant_is_recovery();
  if (v12[26] != 1)
  {
    if (!v12[24]) {
      goto LABEL_101;
    }
    int v274 = v12[25] ? is_recovery : 1;
    if (v274 == 1) {
      goto LABEL_101;
    }
    if (*v12 || v12[2])
    {
      if (v791)
      {
LABEL_112:
        T200UpdaterInfoLog((uint64_t)"%s:%d Skipping Second stage in update \n", v267, v268, v269, v270, v271, v272, v273, (char)"_T200UpdaterExecCommand");
        goto LABEL_113;
      }
    }
    else if (v791 || !v12[1])
    {
      goto LABEL_112;
    }
    uint64_t v678 = _commitImageSMCIF(a1, v267, v268, v269, v270, v271, v272, v273);
    if (!v678)
    {
      CFTypeRef v44 = 0;
LABEL_11:
      *(_DWORD *)(a1 + 8492) = 0;
      if (a4)
      {
        uint64_t v45 = *(void *)(a1 + 32);
        if (v45)
        {
          *a4 = v45;
          T200CFShow_0(*(const void **)(a1 + 32));
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_263E1A000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Send out the results in fOutput of the commad processed\n", buf, 2u);
          }
        }
      }
      T200UpdaterInfoLog((uint64_t)"%s:%d End \n", v37, v38, v39, v40, v41, v42, v43, (char)"_T200UpdaterExecCommand");
      uint64_t v46 = 1;
      goto LABEL_16;
    }
    uint64_t v686 = v678;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 485, 0);
    unsigned int v147 = *(_DWORD *)(a1 + 8492);
    v145 = "T200: Commit Image Failed";
    v146 = "_commitImageSMCIF";
    goto LABEL_425;
  }
  if (!v12[24])
  {
    T200UpdaterInfoLog((uint64_t)"%s:%d In BootedOS, performNextStage is Skipped if isTwoStageSupported is False \n", v267, v268, v269, v270, v271, v272, v273, (char)"_T200UpdaterExecCommand");
LABEL_113:
    CFTypeRef v44 = 0;
LABEL_114:
    v12[19] = 1;
    goto LABEL_11;
  }
LABEL_101:
  if (v791)
  {
    CFTypeRef v44 = 0;
    goto LABEL_206;
  }
  *(void *)buf = 0;
  v807[0] = 0;
  CFDictionaryRef v275 = *(const __CFDictionary **)(a1 + 16);
  if (!v275)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData->fOptions", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 638, 0);
    v715 = "Error: fOptions is NULL.";
    uint64_t v716 = 638;
LABEL_483:
    CFErrorRef CFError = createCFError(v715, 0xCu, "storeFirmwarePlist", v716);
    CFTypeRef v784 = 0;
    CFDataRef v279 = 0;
    goto LABEL_127;
  }
  CFDictionaryRef v276 = (const __CFDictionary *)CFDictionaryGetValue(v275, @"Options");
  if (!v276)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "updaterOptions", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 641, 0);
    v715 = "Error: kT200OptionOptions is NULL.";
    uint64_t v716 = 641;
    goto LABEL_483;
  }
  CFDictionaryRef v277 = v276;
  if (CheckKeyTrue(v276, @"SkipFirmwareMapStore"))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "skipPlistStore == FALSE", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 644, 0);
    CFTypeRef v44 = 0;
    CFDataRef v279 = 0;
    CFTypeRef v293 = 0;
    CFErrorRef CFError = 0;
    LODWORD(v342) = 0;
    CFDictionaryRef v785 = 0;
    int v343 = 0;
    goto LABEL_196;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "input", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 646, 0);
    v715 = "Error: input is NULL.";
    uint64_t v716 = 646;
    goto LABEL_483;
  }
  CFDictionaryGetValue(v277, @"RestoreSystemPartition");
  v278 = CFDictionaryGetValue(a3, @"FirmwareData");
  if (v278) {
    CFDataRef v279 = (const __CFData *)CFRetain(v278);
  }
  else {
    CFDataRef v279 = 0;
  }
  uint64_t URLFromString = AMSupportCreateURLFromString();
  if (!URLFromString)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "mountURL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 652, 0);
    CFErrorRef CFError = createCFError("Error: mountURL is NULL.", 0xCu, "storeFirmwarePlist", 652);
    CFTypeRef v784 = 0;
    goto LABEL_127;
  }
  v281 = (const void *)URLFromString;
  AMSupportCopyURLWithAppendedComponent();
  AMSupportCopyURLWithAppendedComponent();
  MEMORY[0x263E71990](*(void *)buf);
  v282 = *(const void **)(a1 + 32);
  CFTypeRef v784 = v281;
  if (!v282 || (CFDictionaryRef v283 = (const __CFDictionary *)CFRetain(v282)) == 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "deviceInfoRef", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 659, 0);
    CFErrorRef CFError = createCFError("Error: fOutput is NULL.", 0xCu, "storeFirmwarePlist", 659);
LABEL_127:
    CFTypeRef v293 = 0;
    CFDictionaryRef v294 = 0;
    goto LABEL_187;
  }
  CFDictionaryRef v785 = v283;
  v790 = CFDictionaryGetValue(v283, @"HWVersion");
  CFDictionaryRef v284 = (const __CFDictionary *)CFPropertyListCreateWithData(alloc, v279, 0, 0, 0);
  CFDictionaryRef cf = v284;
  if (!v284 || (CFTypeID v285 = CFGetTypeID(v284), v285 != CFDictionaryGetTypeID()))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "fwPlistDictRef && CFGetTypeID(fwPlistDictRef) == CFDictionaryGetTypeID()", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 841, 0);
    T200UpdaterInfoLog((uint64_t)"%s:%d Error: CFPropertyListCreateWithData failed. \n", v708, v709, v710, v711, v712, v713, v714, (char)"copyStrippedFirmwarePlist");
    CFTypeRef v293 = 0;
    CFDictionaryRef v288 = 0;
    CFStringRef v782 = 0;
    CFStringRef v783 = 0;
    CFDictionaryRef v781 = 0;
    CFStringRef v324 = 0;
    CFStringRef v325 = 0;
    v296 = 0;
    goto LABEL_165;
  }
  CFStringRef v286 = CFStringCreateWithFormat(alloc, 0, @"%@.%@", @"hw_version", @"a0p2", v776, v778, v779);
  if (v286)
  {
    CFStringRef v783 = v286;
    CFDictionaryRef DictionaryRemovingKeyPath = T200CreateDictionaryRemovingKeyPath(alloc, cf, v286);
    if (DictionaryRemovingKeyPath)
    {
      CFDictionaryRef v288 = DictionaryRemovingKeyPath;
      CFStringRef v289 = CFStringCreateWithFormat(alloc, 0, @"%@.%@.%@", @"hw_version", v790, @"chemistry");
      if (v289)
      {
        CFStringRef v782 = v289;
        v290 = (const void *)AMSupportGetValueForKeyPathInDict();
        if (v290) {
          CFDictionaryRef v291 = (const __CFDictionary *)CFRetain(v290);
        }
        else {
          CFDictionaryRef v291 = 0;
        }
        CFDataRef v780 = v279;
        CFIndex Count = CFDictionaryGetCount(v291);
        v296 = (const void **)malloc(8 * Count);
        CFDictionaryRef v781 = v291;
        CFDictionaryGetKeysAndValues(v291, v296, 0);
        if (Count >= 1)
        {
          uint64_t v297 = 0;
          unsigned int v298 = 1;
          v789 = v296;
          while (!v288)
          {
            fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "fwPlist", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 799, 0);
            T200UpdaterInfoLog((uint64_t)"%s:%d Error: fwPlist is NULL. \n", v310, v311, v312, v313, v314, v315, v316, (char)"createStrippedConfigDNVD");
            CFDictionaryRef v308 = 0;
LABEL_150:
            uint64_t v297 = v298;
            BOOL v309 = Count <= v298++;
            CFDictionaryRef v288 = v308;
            if (v309) {
              goto LABEL_157;
            }
          }
          v299 = v296[v297];
          CFStringRef v797 = CFStringCreateWithFormat(alloc, 0, @"%@.%@.%@.%@.%@.%@", @"hw_version", v790, @"chemistry", v299, @"configuration", @"Digest");
          CFStringRef v300 = CFStringCreateWithFormat(alloc, 0, @"%@.%@.%@.%@.%@.%@", @"hw_version", v790, @"chemistry", v299, @"configuration", @"payload");
          CFStringRef v301 = CFStringCreateWithFormat(alloc, 0, @"%@.%@.%@.%@.%@.%@", @"hw_version", v790, @"chemistry", v299, @"dnvd", @"Digest");
          CFStringRef v302 = CFStringCreateWithFormat(alloc, 0, @"%@.%@.%@.%@.%@.%@", @"hw_version", v790, @"chemistry", v299, @"dnvd", @"payload");
          CFStringRef v303 = v302;
          if (v797 && v300 && v301 && v302)
          {
            CFDictionaryRef v304 = T200CreateDictionaryRemovingKeyPath(alloc, v288, v797);
            CFDictionaryRef v305 = T200CreateDictionaryRemovingKeyPath(alloc, v304, v300);
            CFDictionaryRef v306 = T200CreateDictionaryRemovingKeyPath(alloc, v305, v301);
            CFDictionaryRef v307 = T200CreateDictionaryRemovingKeyPath(alloc, v306, v303);
            if (v304) {
              CFRelease(v304);
            }
            if (v305) {
              CFRelease(v305);
            }
            if (v306) {
              CFRelease(v306);
            }
          }
          else
          {
            fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "config_digest && config_payload && dnvd_digest && dnvd_payload", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 806, 0);
            T200UpdaterInfoLog((uint64_t)"%s:%d Error: CFStringCreateWithFormat failed. \n", v317, v318, v319, v320, v321, v322, v323, (char)"createStrippedConfigDNVD");
            CFDictionaryRef v307 = 0;
            CFDictionaryRef v308 = 0;
            if (!v797) {
              goto LABEL_143;
            }
          }
          CFRelease(v797);
          CFDictionaryRef v308 = v307;
LABEL_143:
          if (v300) {
            CFRelease(v300);
          }
          uint64_t v12 = v792;
          if (v301) {
            CFRelease(v301);
          }
          v296 = v789;
          if (v303) {
            CFRelease(v303);
          }
          CFRelease(v288);
          goto LABEL_150;
        }
        CFDictionaryRef v308 = v288;
LABEL_157:
        CFStringRef v324 = CFStringCreateWithFormat(alloc, 0, @"%@.%@.%@.%@", @"hw_version", v790, @"firmware", @"Digest");
        CFStringRef v325 = CFStringCreateWithFormat(alloc, 0, @"%@.%@.%@.%@", @"hw_version", v790, @"firmware", @"payload");
        CFDictionaryRef v326 = T200CreateDictionaryRemovingKeyPath(alloc, v308, v324);
        if (v308) {
          CFRelease(v308);
        }
        CFDictionaryRef v288 = T200CreateDictionaryRemovingKeyPath(alloc, v326, v325);
        if (v326) {
          CFRelease(v326);
        }
        CFDataRef v279 = v780;
        if (v288) {
          CFTypeRef v293 = CFRetain(v288);
        }
        else {
          CFTypeRef v293 = 0;
        }
        T200UpdaterInfoLog((uint64_t)"%s:%d Successfully stripped firmware PLIST. \n", v327, v328, v329, v330, v331, v332, v333, (char)"copyStrippedFirmwarePlist");
LABEL_165:
        CFDictionaryRef v334 = cf;
        if (!cf) {
          goto LABEL_167;
        }
        goto LABEL_166;
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "chem_node != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 852, 0);
      T200UpdaterInfoLog((uint64_t)"%s:%d Error: CFStringCreateWithFormat failed.\n", v732, v733, v734, v735, v736, v737, v738, (char)"copyStrippedFirmwarePlist");
      v296 = 0;
      CFStringRef v325 = 0;
      CFStringRef v324 = 0;
      CFDictionaryRef v781 = 0;
      CFStringRef v782 = 0;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "fwPlistMutableRef", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 848, 0);
      T200UpdaterInfoLog((uint64_t)"%s:%d Error: T200CreateDictionaryRemovingKeyPath failed. \n", v725, v726, v727, v728, v729, v730, v731, (char)"copyStrippedFirmwarePlist");
      v296 = 0;
      CFStringRef v325 = 0;
      CFStringRef v324 = 0;
      CFDictionaryRef v781 = 0;
      CFStringRef v782 = 0;
      CFDictionaryRef v288 = 0;
    }
    CFTypeRef v293 = 0;
    CFDictionaryRef v334 = cf;
  }
  else
  {
    CFDictionaryRef v334 = cf;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "a0p2_node != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 845, 0);
    T200UpdaterInfoLog((uint64_t)"%s:%d Error: CFStringCreateWithFormat failed. \n", v718, v719, v720, v721, v722, v723, v724, (char)"copyStrippedFirmwarePlist");
    v296 = 0;
    CFStringRef v325 = 0;
    CFStringRef v324 = 0;
    CFDictionaryRef v781 = 0;
    CFStringRef v782 = 0;
    CFStringRef v783 = 0;
    CFDictionaryRef v288 = 0;
    CFTypeRef v293 = 0;
  }
LABEL_166:
  CFRelease(v334);
LABEL_167:
  if (v783) {
    CFRelease(v783);
  }
  if (v288) {
    CFRelease(v288);
  }
  if (v782) {
    CFRelease(v782);
  }
  if (v781) {
    CFRelease(v781);
  }
  if (v296) {
    free(v296);
  }
  if (v324) {
    CFRelease(v324);
  }
  if (v325) {
    CFRelease(v325);
  }
  a1 = v788;
  if (!v293)
  {
    uint64_t v344 = AMSupportWriteDataToFileURL();
    if (!v344)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "fwStrippedPlist", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 671, 0);
      CFErrorRef CFError = createCFError("Error: Plist strip failed.", 0xCu, "storeFirmwarePlist", 671);
      CFTypeRef v293 = 0;
LABEL_186:
      CFDictionaryRef v294 = v785;
LABEL_187:
      CFDictionaryRef v785 = v294;
      if (CFError)
      {
        CFTypeRef v44 = CFRetain(CFError);
        CFStringRef v345 = CFErrorCopyDescription(CFError);
        if (CFStringGetCStringPtr(v345, 0x8000100u)) {
          T200UpdaterInfoLog((uint64_t)"%s:%d %s \n", v267, v268, v269, v270, v271, v272, v273, (char)"storeFirmwarePlist");
        }
        if (v345) {
          CFRelease(v345);
        }
        LODWORD(v342) = 12;
        int v343 = 1;
      }
      else
      {
        CFTypeRef v44 = 0;
        int v343 = 0;
        LODWORD(v342) = 12;
      }
      goto LABEL_194;
    }
    uint64_t v342 = v344;
LABEL_540:
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "amerror == kAMSupportErrorNone", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 670, 0);
    CFErrorRef CFError = createCFError("Error: Write PLIST is failed.", 0xCu, "AMSupportWriteDictionarytoFileURL", v342);
    a1 = v788;
    uint64_t v12 = v792;
    goto LABEL_186;
  }
  uint64_t v342 = AMSupportWriteDictionarytoFileURL();
  if (v342) {
    goto LABEL_540;
  }
  T200UpdaterInfoLog((uint64_t)"%s:%d Successfully stored firmware PLIST. \n", v335, v336, v337, v338, v339, v340, v341, (char)"storeFirmwarePlist");
  CFTypeRef v44 = 0;
  int v343 = 0;
  CFErrorRef CFError = 0;
LABEL_194:
  if (v784) {
    CFRelease(v784);
  }
LABEL_196:
  if (v279) {
    CFRelease(v279);
  }
  if (v293) {
    CFRelease(v293);
  }
  if (v343) {
    CFRelease(CFError);
  }
  if (v785) {
    CFRelease(v785);
  }
  if (v342 && v12[23])
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result == kT200Success || t200UpdaterData->internalRestore == FALSE", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 457, 0);
    *(_DWORD *)(a1 + 8492) = 91;
    if (v44) {
      v717 = (__CFError *)CFRetain(v44);
    }
    else {
      v717 = 0;
    }
    uint64_t v46 = 0;
    a1 = v788;
    CFErrorRef *v787 = v717;
    goto LABEL_16;
  }
LABEL_206:
  if (!*v12 && !v12[2] && !(v12[1] | v791))
  {
    T200UpdaterInfoLog((uint64_t)"%s:%d Skipping update \n", v267, v268, v269, v270, v271, v272, v273, (char)"_T200UpdaterExecCommand");
    goto LABEL_114;
  }
  uint64_t v838 = 0;
  long long v836 = 0u;
  long long v837 = 0u;
  long long v834 = 0u;
  long long v835 = 0u;
  long long v832 = 0u;
  long long v833 = 0u;
  long long v830 = 0u;
  long long v831 = 0u;
  long long v828 = 0u;
  long long v829 = 0u;
  long long v826 = 0u;
  long long __n = 0u;
  long long v824 = 0u;
  long long v825 = 0u;
  long long v822 = 0u;
  long long v823 = 0u;
  long long v820 = 0u;
  long long v821 = 0u;
  long long v818 = 0u;
  long long v819 = 0u;
  long long v816 = 0u;
  long long v817 = 0u;
  long long v814 = 0u;
  long long v815 = 0u;
  long long v812 = 0u;
  long long v813 = 0u;
  *(_OWORD *)buf = 0u;
  long long v811 = 0u;
  int v804 = 0;
  uint64_t v802 = 0;
  v803 = 0;
  unsigned __int8 v801 = 0;
  int valuePtr = 0;
  T200UpdaterInfoLog((uint64_t)"%s:%d Start \n", v267, v268, v269, v270, v271, v272, v273, (char)"_parseTatsuResponse");
  CFDictionaryRef v346 = *(const __CFDictionary **)(a1 + 24);
  if (!v346)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData->fInput", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2107, 0);
    CFDataRef v349 = 0;
    v354 = 0;
    CFDictionaryRef v438 = 0;
    v352 = 0;
    uint64_t v387 = 83;
    goto LABEL_308;
  }
  v347 = CFDictionaryGetValue(v346, @"BMU,Ticket");
  if (!v347 || (CFDataRef v348 = (const __CFData *)CFRetain(v347)) == 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "manifestDataRef != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2110, 0);
    CFDataRef v349 = 0;
    v354 = 0;
    CFDictionaryRef v438 = 0;
    v352 = 0;
    uint64_t v387 = 29;
    goto LABEL_308;
  }
  CFDataRef v349 = v348;
  CFIndex Length = CFDataGetLength(v348);
  v351 = (UInt8 *)malloc(Length);
  v352 = v351;
  if (!Length || !v351)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "manifestLen && manifestBuffer", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2114, 0);
    v354 = 0;
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 8;
    goto LABEL_308;
  }
  v841.location = 0;
  v841.length = Length;
  CFDataGetBytes(v349, v841, v351);
  if (Img4DecodeInitManifest())
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == DR_Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2118, 0);
    v354 = 0;
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 16;
    goto LABEL_308;
  }
  v353 = (char *)malloc(0x120uLL);
  v354 = v353;
  if (!v353)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "certificate", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2122, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 71;
    goto LABEL_308;
  }
  uint64_t v355 = *((void *)&v828 + 1);
  if (!*((void *)&v828 + 1))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "certData != ((void *)0)", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2533, 0);
LABEL_444:
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "err == kAMSupportErrorNone", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2128, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 30;
    goto LABEL_308;
  }
  uint64_t v356 = v829;
  if (!v829)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "certDataLength != 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2534, 0);
    goto LABEL_444;
  }
  *((_OWORD *)v353 + 16) = 0u;
  *((_OWORD *)v353 + 17) = 0u;
  *((_OWORD *)v353 + 14) = 0u;
  *((_OWORD *)v353 + 15) = 0u;
  *((_OWORD *)v353 + 12) = 0u;
  *((_OWORD *)v353 + 13) = 0u;
  *((_OWORD *)v353 + 10) = 0u;
  *((_OWORD *)v353 + 11) = 0u;
  *((_OWORD *)v353 + 8) = 0u;
  *((_OWORD *)v353 + 9) = 0u;
  *((_OWORD *)v353 + 6) = 0u;
  *((_OWORD *)v353 + 7) = 0u;
  *((_OWORD *)v353 + 4) = 0u;
  *((_OWORD *)v353 + 5) = 0u;
  *((_OWORD *)v353 + 2) = 0u;
  *((_OWORD *)v353 + 3) = 0u;
  *(_OWORD *)v353 = 0u;
  *((_OWORD *)v353 + 1) = 0u;
  *((void *)v353 + 32) = v355;
  *((void *)v353 + 33) = v356;
  int v357 = DERParseSequence((uint64_t)(v353 + 256), (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, (unint64_t)v353, 0x30uLL);
  if (v357)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == 0 ", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2545, v357);
    goto LABEL_444;
  }
  v793 = v352;
  CFDataRef v795 = v349;
  int v358 = DERParseSequence((uint64_t)v354, 0xAu, (uint64_t)&T200X509DERTBSCertItemSpecs, (unint64_t)(v354 + 48), 0xA0uLL);
  if (v358)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == 0 ", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2551, v358);
LABEL_443:
    v352 = v793;
    CFDataRef v349 = v795;
    goto LABEL_444;
  }
  *(_OWORD *)v807 = 0u;
  long long v808 = 0u;
  LOBYTE(error) = 0;
  unint64_t v805 = 0;
  v806[0] = 0;
  v806[1] = 0;
  int v359 = DERParseSequence((uint64_t)(v354 + 144), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)v807, 0x20uLL);
  if (v359)
  {
    int v707 = v359;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == 0 ", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2486, v359);
    goto LABEL_442;
  }
  signed int v360 = DERParseSequenceContent((unint64_t *)v807, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)(v354 + 224), 0x20uLL);
  if (v360)
  {
    int v707 = v360;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == 0 ", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2490, v360);
    goto LABEL_442;
  }
  if (!DEROidCompare((uint64_t)(v354 + 224), (uint64_t)&oidEcPubKey))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2494, 0);
LABEL_441:
    int v707 = 2;
    goto LABEL_442;
  }
  v361 = (uint64_t *)(v354 + 208);
  int v362 = DERParseBitString((uint64_t)&v808, (unint64_t *)v354 + 26, &error);
  if (v362)
  {
    int v707 = v362;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == 0 ", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2502, v362);
    goto LABEL_442;
  }
  if (*(unsigned char *)*v361 == 4)
  {
    uint64_t v363 = *((void *)v354 + 27) - 1;
    *((void *)v354 + 26) = *v361 + 1;
    *((void *)v354 + 27) = v363;
    if ((_BYTE)error)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "numUnused == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2509, 0);
      int v707 = 3;
    }
    else
    {
      int v364 = DERDecodeItemPartialBufferGetLength((uint64_t)(v354 + 240), &v805, 0);
      if (!v364)
      {
        if (DEROidCompare((uint64_t)v806, (uint64_t)&oidEcPrime256v1)) {
          goto LABEL_228;
        }
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2516, 0);
        goto LABEL_441;
      }
      int v707 = v364;
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == DR_Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2513, 0);
    }
LABEL_442:
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == 0 ", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2554, v707);
    goto LABEL_443;
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "pubKeyPkcs1->data[0] == 0x04", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2505, 0);
LABEL_228:
  v365 = *(const void **)v354;
  size_t v366 = *((void *)v354 + 1);
  *(_WORD *)(v12 + 3) = v366;
  memcpy((void *)(a1 + 88), v365, v366);
  if (_retrieveSignature(*((void *)v354 + 4), *((unsigned int *)v354 + 10), (char *)(a1 + 8280), v367, v368, v369, v370, v371))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "err == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2135, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 58;
LABEL_465:
    v352 = v793;
    CFDataRef v349 = v795;
    goto LABEL_308;
  }
  size_t v372 = __n;
  v373 = (const void *)*((void *)&v826 + 1);
  *(_WORD *)(v12 + 5) = __n;
  memcpy((void *)(a1 + 4184), v373, v372);
  if (_retrieveSignature(*((uint64_t *)&__n + 1), v828, (char *)(a1 + 8344), v374, v375, v376, v377, v378))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "err == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2144, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 59;
    goto LABEL_465;
  }
  if (_T200VerifySignature((uint64_t)&raw_root_public_ec_p256_key, a1 + 88, *(unsigned __int16 *)(v12 + 3), a1 + 8280))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "err == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2150, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 94;
    goto LABEL_465;
  }
  if (_T200VerifySignature(*v361, a1 + 4184, *(unsigned __int16 *)(v12 + 5), a1 + 8344))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "err == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2156, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 95;
    goto LABEL_465;
  }
  if (Img4DecodeGetIntegerFromSection())
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == DR_Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2159, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 108;
    goto LABEL_465;
  }
  if (*(_DWORD *)(a1 + 8472) != v804)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData->chipID == uint32Val", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2160, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 97;
    goto LABEL_465;
  }
  if (Img4DecodeGetIntegerFromSection())
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == DR_Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2163, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 109;
    goto LABEL_465;
  }
  if (*(_DWORD *)(a1 + 8464) != v804)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData->battarey_id == uint32Val", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2164, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 98;
    goto LABEL_465;
  }
  if (Img4DecodeGetObjectPropertyData())
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == DR_Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2167, 0);
LABEL_455:
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 110;
    goto LABEL_465;
  }
  if (v802 != 32)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "digestMapPropertyLength == T200_UPDATER__FIRMWARE_HASH_SIZE", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2168, 0);
    goto LABEL_455;
  }
  if (_T200VerifyDigest(*(void *)(a1 + 64), *(_DWORD *)(a1 + 8460), v803))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "err == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2170, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 103;
    goto LABEL_465;
  }
  if (Img4DecodeGetIntegerFromSection())
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == DR_Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2173, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 120;
    goto LABEL_465;
  }
  io_registry_entry_t v379 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/product");
  if (!v379)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "product_node", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2576, 0);
    uint64_t v387 = 117;
    goto LABEL_464;
  }
  io_object_t v380 = v379;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v379, @"bmu-board-id", alloc, 0);
  if (!CFProperty)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "board_id_data", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2579, 0);
    IOObjectRelease(v380);
LABEL_463:
    uint64_t v387 = 118;
    goto LABEL_464;
  }
  v382 = CFProperty;
  CFTypeID v383 = CFGetTypeID(CFProperty);
  if (v383 != CFDataGetTypeID())
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "CFGetTypeID(board_id_data) == CFDataGetTypeID()", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2580, 0);
LABEL_462:
    IOObjectRelease(v380);
    CFRelease(v382);
    goto LABEL_463;
  }
  BytePtr = CFDataGetBytePtr((CFDataRef)v382);
  CFNumberRef v385 = CFNumberCreate(alloc, kCFNumberIntType, BytePtr);
  if (!v385)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "num", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2583, 0);
    goto LABEL_462;
  }
  CFNumberRef v386 = v385;
  if (CFNumberGetValue(v385, kCFNumberIntType, &valuePtr))
  {
    if (valuePtr)
    {
      uint64_t v387 = 0;
      char v388 = 1;
      goto LABEL_247;
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "*board_id", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2587, 0);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2586, 0);
  }
  char v388 = 0;
  uint64_t v387 = 118;
LABEL_247:
  IOObjectRelease(v380);
  CFRelease(v386);
  CFRelease(v382);
  if ((v388 & 1) == 0)
  {
LABEL_464:
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "err == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2176, 0);
    CFDictionaryRef v438 = 0;
    goto LABEL_465;
  }
  if (valuePtr != v804)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "dt_board_id == uint32Val", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2178, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 119;
    goto LABEL_465;
  }
  if (Img4DecodeGetBooleanFromSection())
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == DR_Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2181, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 123;
    goto LABEL_465;
  }
  if (v12[21] != v801)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData->productionMode == BOOLVal", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2182, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 124;
    goto LABEL_465;
  }
  v807[0] = 0;
  unint64_t v805 = 0;
  CFErrorRef error = 0;
  T200UpdaterInfoLog((uint64_t)"%s:%d Start \n", v389, v390, v391, v392, v393, v394, v395, (char)"_parseFWMapDigest");
  if (!*(void *)(a1 + 24))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData->fInput != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2663, 0);
    CFStringRef v402 = 0;
    v427 = 0;
    CFDictionaryRef v406 = 0;
    uint64_t v387 = 107;
    goto LABEL_275;
  }
  if (Img4DecodeGetObjectPropertyData())
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == DR_Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2666, 0);
LABEL_476:
    CFStringRef v402 = 0;
    v427 = 0;
    CFDictionaryRef v406 = 0;
    uint64_t v387 = 111;
    goto LABEL_275;
  }
  if (v805 != 32)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwareMapPropertyLength == T200_UPDATER__FIRMWARE_HASH_SIZE", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2667, 0);
    goto LABEL_476;
  }
  v396 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 24), @"FirmwareData");
  if (!v396 || (CFDataRef v397 = (const __CFData *)CFRetain(v396)) == 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwareMapDataRef != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2670, 0);
    CFStringRef v402 = 0;
    v427 = 0;
    CFDictionaryRef v406 = 0;
    uint64_t v387 = 106;
    goto LABEL_275;
  }
  CFDataRef v398 = v397;
  CFIndex v399 = CFDataGetLength(v397);
  v400 = (UInt8 *)malloc(v399);
  v401 = v400;
  CFStringRef v402 = 0;
  uint64_t v403 = 107;
  int v404 = 2674;
  if (!v399 || !v400)
  {
    v427 = 0;
    CFDictionaryRef v406 = 0;
    goto LABEL_524;
  }
  v842.location = 0;
  v842.length = v399;
  CFDataGetBytes(v398, v842, v400);
  if (!_T200VerifyDigest((uint64_t)v401, v399, (unint64_t *)v807[0]))
  {
    CFStringRef v402 = 0;
    v427 = 0;
    CFDictionaryRef v406 = 0;
    goto LABEL_272;
  }
  CFDictionaryRef v405 = (const __CFDictionary *)CFPropertyListCreateWithData(alloc, v398, 2uLL, 0, &error);
  CFDictionaryRef v406 = v405;
  if (!v405)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwareMapDataMutableDict != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2681, 0);
    CFStringRef v402 = 0;
    v427 = 0;
    uint64_t v403 = 106;
    goto LABEL_278;
  }
  if (CFDictionaryContainsKey(v405, @"fw_map_digest") != 1
    && CFDictionaryContainsKey(v406, @"restore_options") != 1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2728, 0);
    CFStringRef v402 = 0;
    v427 = 0;
LABEL_277:
    uint64_t v403 = 105;
LABEL_278:
    T200UpdaterInfoLog((uint64_t)"%s:%d Failed %d \n", v453, v454, v455, v456, v457, v458, v459, (char)"_parseFWMapDigest");
    goto LABEL_279;
  }
  CFStringGetCStringPtr(@"fw_map_digest", 0x8000100u);
  CFStringGetCStringPtr(@"restore_options", 0x8000100u);
  T200UpdaterInfoLog((uint64_t)"%s:%d Removing %s and %s key-value pairs before digest computation \n", v407, v408, v409, v410, v411, v412, v413, (char)"_parseFWMapDigest");
  CFDictionaryRemoveValue(v406, @"fw_map_digest");
  CFDictionaryRemoveValue(v406, @"restore_options");
  CFRelease(v398);
  free(v401);
  CFDataRef Data = CFPropertyListCreateData(alloc, v406, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (!Data)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwareMapDataRef!=NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2694, 0);
    CFStringRef v402 = 0;
    v427 = 0;
    uint64_t v387 = 107;
    goto LABEL_275;
  }
  CFDataRef v398 = Data;
  CFIndex v415 = CFDataGetLength(Data);
  v416 = (UInt8 *)malloc(v415);
  v401 = v416;
  CFStringRef v402 = 0;
  uint64_t v403 = 107;
  int v404 = 2698;
  if (!v415)
  {
    v427 = 0;
    goto LABEL_524;
  }
  if (!v416)
  {
    v427 = 0;
    goto LABEL_524;
  }
  v843.location = 0;
  v843.length = v415;
  CFDataGetBytes(v398, v843, v416);
  if (!_T200VerifyDigest((uint64_t)v401, v415, (unint64_t *)v807[0]))
  {
    CFStringRef v402 = 0;
    v427 = 0;
    goto LABEL_272;
  }
  T200UpdaterInfoLog((uint64_t)"%s:%d Replacing LF with CRLF before digest computation \n", v417, v418, v419, v420, v421, v422, v423, (char)"_parseFWMapDigest");
  CFStringRef v424 = CFStringCreateFromExternalRepresentation(alloc, v398, 0x8000100u);
  CFStringRef v402 = v424;
  if (!v424)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "plistStr != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2706, 0);
    v427 = 0;
LABEL_503:
    uint64_t v403 = 121;
    goto LABEL_278;
  }
  CFIndex v425 = CFStringGetLength(v424);
  CFStringRef MutableCopy = CFStringCreateMutableCopy(alloc, v425, v402);
  v427 = (__CFString *)MutableCopy;
  if (!MutableCopy)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "plistMutableStr != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2709, 0);
    goto LABEL_503;
  }
  v845.length = CFStringGetLength(MutableCopy);
  v845.location = 0;
  CFStringFindAndReplace(v427, @"\n", @"\r\n", v845, 0);
  CFRelease(v398);
  free(v401);
  CFDataRef ExternalRepresentation = CFStringCreateExternalRepresentation(alloc, v427, 0x8000100u, 0);
  if (ExternalRepresentation)
  {
    CFDataRef v398 = ExternalRepresentation;
    CFIndex v429 = CFDataGetLength(ExternalRepresentation);
    v430 = (UInt8 *)malloc(v429);
    v401 = v430;
    uint64_t v403 = 121;
    int v404 = 2721;
    if (v429 && v430)
    {
      v844.location = 0;
      v844.length = v429;
      CFDataGetBytes(v398, v844, v430);
      if (!_T200VerifyDigest((uint64_t)v401, v429, (unint64_t *)v807[0]))
      {
LABEL_272:
        uint64_t v403 = 0;
LABEL_279:
        free(v401);
LABEL_280:
        CFRelease(v398);
        uint64_t v387 = v403;
        goto LABEL_281;
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "err == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2725, 0);
      goto LABEL_277;
    }
LABEL_524:
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwareMapLen && firmwareMapBuffer", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", v404, 0);
    T200UpdaterInfoLog((uint64_t)"%s:%d Failed %d \n", v747, v748, v749, v750, v751, v752, v753, (char)"_parseFWMapDigest");
    if (!v401) {
      goto LABEL_280;
    }
    goto LABEL_279;
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwareMapDataRef!=NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2717, 0);
  uint64_t v387 = 121;
LABEL_275:
  T200UpdaterInfoLog((uint64_t)"%s:%d Failed %d \n", v439, v440, v441, v442, v443, v444, v445, (char)"_parseFWMapDigest");
LABEL_281:
  if (v406) {
    CFRelease(v406);
  }
  a1 = v788;
  if (v402) {
    CFRelease(v402);
  }
  v352 = v793;
  CFDataRef v349 = v795;
  if (v427) {
    CFRelease(v427);
  }
  T200UpdaterInfoLog((uint64_t)"%s:%d End \n", v446, v447, v448, v449, v450, v451, v452, (char)"_parseFWMapDigest");
  if (v387)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "err == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2185, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v12 = v792;
    goto LABEL_308;
  }
  uint64_t v12 = v792;
  if (!CFDictionaryContainsKey(*(CFDictionaryRef *)(v788 + 16), @"Options"))
  {
    CFDictionaryRef v438 = 0;
    goto LABEL_305;
  }
  v467 = CFDictionaryGetValue(*(CFDictionaryRef *)(v788 + 16), @"Options");
  if (!v467 || (CFDictionaryRef v468 = (const __CFDictionary *)CFRetain(v467)) == 0)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "restoreOptions", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2190, 0);
    CFDictionaryRef v438 = 0;
    uint64_t v387 = 104;
    goto LABEL_308;
  }
  CFDictionaryRef v438 = v468;
  if (CheckKeyTrue(v468, @"EnableDeveloperCommands"))
  {
    if (Img4DecodeGetBooleanFromSection())
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == DR_Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2194, 0);
      uint64_t v387 = 112;
      goto LABEL_308;
    }
    if (!v801)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "1 == BOOLVal", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2195, 0);
      uint64_t v387 = 100;
      goto LABEL_308;
    }
  }
  if (CheckKeyTrue(v438, @"EnableValidationCommands"))
  {
    if (Img4DecodeGetBooleanFromSection())
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == DR_Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2200, 0);
      uint64_t v387 = 113;
      goto LABEL_308;
    }
    if (!v801)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "TRUE == BOOLVal", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2201, 0);
      uint64_t v387 = 101;
      goto LABEL_308;
    }
  }
  if (v792[22] == 1)
  {
    if (Img4DecodeGetBooleanFromSection())
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == DR_Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2206, 0);
      uint64_t v387 = 125;
      goto LABEL_308;
    }
    if (!v801)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "TRUE == BOOLVal", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2207, 0);
      uint64_t v387 = 126;
      goto LABEL_308;
    }
  }
  if (v792[27] != 1) {
    goto LABEL_305;
  }
  if (Img4DecodeGetBooleanFromSection())
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derstat == DR_Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2212, 0);
    uint64_t v387 = 114;
LABEL_308:
    T200UpdaterInfoLog((uint64_t)"%s:%d End Failed with %d  \n", v431, v432, v433, v434, v435, v436, v437, (char)"_parseTatsuResponse");
    if (!v438) {
      goto LABEL_310;
    }
    goto LABEL_309;
  }
  if (!v801)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "TRUE == BOOLVal", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2213, 0);
    uint64_t v387 = 102;
    goto LABEL_308;
  }
LABEL_305:
  T200UpdaterInfoLog((uint64_t)"%s:%d End \n", v460, v461, v462, v463, v464, v465, v466, (char)"_parseTatsuResponse");
  uint64_t v387 = 0;
  if (v438) {
LABEL_309:
  }
    CFRelease(v438);
LABEL_310:
  if (v354) {
    free(v354);
  }
  if (v352) {
    free(v352);
  }
  if (v349) {
    CFRelease(v349);
  }
  if (v387)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 464, 0);
    *(_DWORD *)(a1 + 8492) = v387;
    v694 = "T200: Parse Tatsu response Failed";
    v695 = "_parseTatsuResponse";
    unsigned int v696 = v387;
    uint64_t v697 = v387;
LABEL_415:
    uint64_t v46 = 0;
    CFErrorRef *v787 = createCFError(v694, v696, v695, v697);
    goto LABEL_16;
  }
  long long v812 = 0u;
  long long v813 = 0u;
  *(_OWORD *)buf = 0u;
  long long v811 = 0u;
  T200UpdaterInfoLog((uint64_t)"%s:%d Start \n", v469, v470, v471, v472, v473, v474, v475, (char)"_programImageSMCIF");
  T200UpdaterInfoLog((uint64_t)"%s:%d start Send Certificate smc API  \n", v476, v477, v478, v479, v480, v481, v482, (char)"_send_certificate");
  v483 = calloc(1uLL, *(unsigned __int16 *)(v12 + 3) + 80);
  if (v483)
  {
    v484 = v483;
    size_t v485 = *(unsigned __int16 *)(v12 + 3);
    v483[8] = v485;
    long long v486 = *(_OWORD *)(a1 + 8280);
    long long v487 = *(_OWORD *)(a1 + 8296);
    long long v488 = *(_OWORD *)(a1 + 8328);
    *((_OWORD *)v483 + 2) = *(_OWORD *)(a1 + 8312);
    *((_OWORD *)v483 + 3) = v488;
    *(_OWORD *)v483 = v486;
    *((_OWORD *)v483 + 1) = v487;
    memcpy(v483 + 10, (const void *)(a1 + 88), v485);
    v484[9] = 0;
    T200UpdaterInfoLog((uint64_t)"%s:%d cert len:%u \n", v489, v490, v491, v492, v493, v494, v495, (char)"_send_certificate");
    int v496 = BC__sendImage(v484);
    if (v496)
    {
      unsigned __int16 v504 = v496;
      T200UpdaterInfoLog((uint64_t)"%s:%d Certificate BC__sendImage failed commStatus=0x%X \n", v497, v498, v499, v500, v501, v502, v503, (char)"_send_certificate");
      free(v484);
      T200UpdaterInfoLog((uint64_t)"%s:%d End Send Certificate smc API \n", v505, v506, v507, v508, v509, v510, v511, (char)"_send_certificate");
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "commStatus == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1296, 0);
      *(_DWORD *)(a1 + 8492) = (v504 << 8) | 0x32;
      BOOL v512 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (v512) {
        _T200UpdaterExecCommand_cold_15(v512, v513, v514, v515, v516, v517, v518, v519);
      }
    }
    else
    {
      free(v484);
      T200UpdaterInfoLog((uint64_t)"%s:%d End Send Certificate smc API \n", v520, v521, v522, v523, v524, v525, v526, (char)"_send_certificate");
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "data", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1282, 0);
    *(_DWORD *)(a1 + 8492) = 73;
    BOOL v698 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v698) {
      _T200UpdaterExecCommand_cold_5(v698, v513, v514, v515, v516, v517, v518, v519);
    }
  }
  v527 = (unsigned int *)(a1 + 8492);
  if (*(_DWORD *)(a1 + 8492))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData->targetUpdaterError == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1484, 0);
    if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      goto LABEL_351;
    }
    goto LABEL_350;
  }
  T200UpdaterInfoLog((uint64_t)"%s:%d Start Send Manifest smc API \n", v513, v514, v515, v516, v517, v518, v519, (char)"_send_manifest");
  v528 = calloc(1uLL, *(unsigned __int16 *)(v12 + 5) + 80);
  if (!v528)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "data", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1180, 0);
    unsigned int *v527 = 75;
    BOOL v699 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (!v699) {
      goto LABEL_326;
    }
    _T200UpdaterExecCommand_cold_5(v699, v700, v701, v702, v703, v704, v705, v706);
LABEL_330:
    if (*v527) {
      goto LABEL_326;
    }
    if (v791)
    {
      if (v12[23] != 1) {
        goto LABEL_353;
      }
      T200UpdaterInfoLog((uint64_t)"%s:%d Send dummy Digest Dictionary for Access Mode Enable \n", v565, v566, v567, v568, v569, v570, v571, (char)"_send_diget_map");
      v580 = calloc(1uLL, 0x54uLL);
      if (v580)
      {
        v581 = v580;
        *((_OWORD *)v580 + 4) = xmmword_263E2ED70;
        unsigned char *v580 = 4;
        BC__sendImage(v580);
        free(v581);
        unsigned int v582 = 0;
        LOWORD(v807[0]) = 0;
        do
        {
          sleep(1u);
          LOWORD(v807[0]) = 255;
          int v590 = BC__receive(80, 2u, v807);
          int v591 = LOWORD(v807[0]);
          if (v582 > 0x95) {
            break;
          }
          ++v582;
        }
        while (LOWORD(v807[0]) == 2);
        if (((uint64_t)v807[0] & 0xFFEF) != 1)
        {
          T200UpdaterInfoLog((uint64_t)"%s:%d Failed to wait return status = %d \n", v583, v584, v585, v586, v587, v588, v589, (char)"_waitTillTargetUpdaterReady");
          int v591 = LOWORD(v807[0]);
        }
        if (v590)
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "commStatus == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1266, 0);
          unsigned int *v527 = 57;
          if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            goto LABEL_349;
          }
          _T200UpdaterExecCommand_cold_9();
        }
        else if (v591 == 17)
        {
          T200UpdaterInfoLog((uint64_t)"%s:%d End Crypto \n", v583, v584, v585, v586, v587, v588, v589, (char)"_send_diget_map");
          T200UpdaterInfoLog((uint64_t)"%s:%d Entitlment update successful  \n", v592, v593, v594, v595, v596, v597, v598, (char)"_send_diget_map");
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "targetUpdaterStatus == SU__STATUS__SUCCESS", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1267, 0);
          unsigned int *v527 = 67;
          if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            goto LABEL_349;
          }
          _T200UpdaterExecCommand_cold_8();
        }
LABEL_353:
        if (!*v527)
        {
          if (v791)
          {
            uint64_t v572 = 0;
            unsigned int *v527 = 0;
            goto LABEL_376;
          }
          if (v12[24]) {
            uint64_t v641 = 0;
          }
          else {
            uint64_t v641 = 3;
          }
          if (_send_bin_retry(a1, 2, v641, v567, v568, v569, v570, v571))
          {
            fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "commStatus == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1505, 0);
            if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
              _T200UpdaterExecCommand_cold_3();
            }
            uint64_t v572 = 1;
            a1 = v788;
          }
          else
          {
            if (_send_bin_retry(a1, 1, v641, v642, v643, v644, v645, v646))
            {
              fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "commStatus == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1508, 0);
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                _T200UpdaterExecCommand_cold_2();
              }
            }
            else
            {
              if (!_send_bin_retry(a1, 0, v641, v647, v648, v649, v650, v651))
              {
                if (!v12[24])
                {
                  LOBYTE(v807[0]) = 0;
                  LOBYTE(v805) = 0;
                  LOBYTE(error) = 0;
                  uint64_t v652 = _check_update_needed(a1, (BOOL *)v807, 0, 1, 0, v569, v570, v571);
                  if (v652)
                  {
                    uint64_t v572 = v652;
                    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1521, 0);
                    unsigned int *v527 = v572;
                    T200UpdaterInfoLog((uint64_t)"T200: Check Update Needed Failed for Firmware Image %d \n", v754, v755, v756, v757, v758, v759, v760, v572);
                    goto LABEL_376;
                  }
                  uint64_t v656 = _check_update_needed(a1, (BOOL *)&v805, 1, 1, 0, v653, v654, v655);
                  if (v656)
                  {
                    uint64_t v572 = v656;
                    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1524, 0);
                    unsigned int *v527 = v572;
                    T200UpdaterInfoLog((uint64_t)"T200: Check Update Needed Failed for Configuration Image %d \n", v761, v762, v763, v764, v765, v766, v767, v572);
                    goto LABEL_376;
                  }
                  uint64_t v660 = _check_update_needed(a1, (BOOL *)&error, 2, 1, 0, v657, v658, v659);
                  if (v660)
                  {
                    uint64_t v572 = v660;
                    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1527, 0);
                    unsigned int *v527 = v572;
                    T200UpdaterInfoLog((uint64_t)"T200: Check Update Needed Failed for DNVD Image %d \n", v768, v769, v770, v771, v772, v773, v774, v572);
                    goto LABEL_376;
                  }
                  if (*v12 == 1 && LOBYTE(v807[0]) == 1)
                  {
                    T200UpdaterInfoLog((uint64_t)"%s:%d ERROR:Failed Updating the Firmware \n", v661, v662, v663, v664, v665, v666, v667, (char)"_programImageSMCIF");
                    unsigned int *v527 = 89;
                  }
                  if (v12[2] == 1 && v805 == 1)
                  {
                    T200UpdaterInfoLog((uint64_t)"%s:%d ERROR:Failed Updating the Configuration \n", v661, v662, v663, v664, v665, v666, v667, (char)"_programImageSMCIF");
                    unsigned int *v527 = 88;
                  }
                  if (v12[1] == 1 && error == 1)
                  {
                    T200UpdaterInfoLog((uint64_t)"%s:%d ERROR:Failed Updating the DNVD \n", v661, v662, v663, v664, v665, v666, v667, (char)"_programImageSMCIF");
                    unsigned int *v527 = 87;
                  }
                  READ_DATA__getVersionInformation(0);
                }
                uint64_t v572 = 0;
                goto LABEL_376;
              }
              fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "commStatus == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1511, 0);
              if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                _T200UpdaterExecCommand_cold_1();
              }
            }
            uint64_t v572 = 1;
            a1 = v788;
          }
          uint64_t v12 = v792;
          goto LABEL_376;
        }
LABEL_349:
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData->targetUpdaterError == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1496, 0);
        if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
        {
LABEL_351:
          uint64_t v572 = 1;
          goto LABEL_376;
        }
LABEL_350:
        _T200UpdaterExecCommand_cold_4(a1 + 8492, v565, v566, v567, v568, v569, v570, v571);
        goto LABEL_351;
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "data", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1248, 0);
      unsigned int *v527 = 74;
      BOOL v739 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (!v739) {
        goto LABEL_349;
      }
    }
    else
    {
      T200UpdaterInfoLog((uint64_t)"%s:%d Start Send DigestMap+Crypto smc API \n", v565, v566, v567, v568, v569, v570, v571, (char)"_send_diget_map");
      size_t v599 = *(unsigned int *)(a1 + 8460);
      v600 = calloc(1uLL, v599 + 80);
      if (v600)
      {
        v601 = v600;
        v600[8] = v599;
        memcpy(v600 + 10, *(const void **)(a1 + 64), v599);
        v601[9] = 2;
        *(unsigned char *)v601 = 0;
        char v609 = *v12 == 1;
        *(unsigned char *)v601 = v609;
        if (v12[2] == 1)
        {
          v609 |= 2u;
          *(unsigned char *)v601 = v609;
        }
        if (v12[1] == 1) {
          *(unsigned char *)v601 = v609 | 4;
        }
        T200UpdaterInfoLog((uint64_t)"%s:%d digestmap len:%u \n", v602, v603, v604, v605, v606, v607, v608, (char)"_send_diget_map");
        int v610 = BC__sendImage(v601);
        if (v610)
        {
          unsigned __int16 v618 = v610;
          T200UpdaterInfoLog((uint64_t)"%s:%d DigestMap BC__sendImage failed commStatus=0x%X \n", v611, v612, v613, v614, v615, v616, v617, (char)"_send_diget_map");
          free(v601);
          T200UpdaterInfoLog((uint64_t)"%s:%d End Send DigestMap+Crypto smc API \n", v619, v620, v621, v622, v623, v624, v625, (char)"_send_diget_map");
          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "commStatus == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1238, 0);
          unsigned int *v527 = (v618 << 8) | 0x20;
          BOOL v626 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
          if (!v626) {
            goto LABEL_349;
          }
          _T200UpdaterExecCommand_cold_6(v626, v627, v628, v629, v630, v631, v632, v633);
        }
        else
        {
          free(v601);
          T200UpdaterInfoLog((uint64_t)"%s:%d End Send DigestMap+Crypto smc API \n", v634, v635, v636, v637, v638, v639, v640, (char)"_send_diget_map");
        }
        goto LABEL_353;
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "data", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1212, 0);
      unsigned int *v527 = 74;
      BOOL v739 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
      if (!v739) {
        goto LABEL_349;
      }
    }
    _T200UpdaterExecCommand_cold_5(v739, v740, v741, v742, v743, v744, v745, v746);
    goto LABEL_353;
  }
  v529 = v528;
  size_t v530 = *(unsigned __int16 *)(v12 + 5);
  v528[8] = v530;
  long long v531 = *(_OWORD *)(a1 + 8344);
  long long v532 = *(_OWORD *)(a1 + 8360);
  long long v533 = *(_OWORD *)(a1 + 8392);
  *((_OWORD *)v528 + 2) = *(_OWORD *)(a1 + 8376);
  *((_OWORD *)v528 + 3) = v533;
  *(_OWORD *)v528 = v531;
  *((_OWORD *)v528 + 1) = v532;
  memcpy(v528 + 10, (const void *)(a1 + 4184), v530);
  v529[9] = 1;
  T200UpdaterInfoLog((uint64_t)"%s:%d manifest len:%u \n", v534, v535, v536, v537, v538, v539, v540, (char)"_send_manifest");
  int v541 = BC__sendImage(v529);
  if (!v541)
  {
    free(v529);
    T200UpdaterInfoLog((uint64_t)"%s:%d End Send Manifest smc API \n", v573, v574, v575, v576, v577, v578, v579, (char)"_send_manifest");
    goto LABEL_330;
  }
  unsigned __int16 v549 = v541;
  T200UpdaterInfoLog((uint64_t)"%s:%d Manifest BC__sendImage failed commStatus=0x%X \n", v542, v543, v544, v545, v546, v547, v548, (char)"_send_manifest");
  free(v529);
  T200UpdaterInfoLog((uint64_t)"%s:%d End Send Manifest smc API \n", v550, v551, v552, v553, v554, v555, v556, (char)"_send_manifest");
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "commStatus == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1194, 0);
  unsigned int *v527 = (v549 << 8) | 0x34;
  BOOL v557 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
  if (v557)
  {
    _T200UpdaterExecCommand_cold_12(v557, v558, v559, v560, v561, v562, v563, v564);
    goto LABEL_330;
  }
LABEL_326:
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData->targetUpdaterError == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1491, 0);
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    _T200UpdaterExecCommand_cold_4(a1 + 8492, v565, v566, v567, v568, v569, v570, v571);
  }
  uint64_t v572 = 1;
LABEL_376:
  v12[19] = 1;
  v668 = *(void **)(a1 + 40);
  if (v668)
  {
    free(v668);
    *(void *)(a1 + 40) = 0;
  }
  T200UpdaterInfoLog((uint64_t)"%s:%d End \n", v565, v566, v567, v568, v569, v570, v571, (char)"_programImageSMCIF");
  if (*v527)
  {
    WORD2(v812) = 24;
    BC__getInfo(buf, 0x40uLL);
    *(_DWORD *)(a1 + 8492) = *(_DWORD *)(a1 + 8492) & 0xFFFFFF | (BYTE4(v812) << 24);
    T200UpdaterInfoLog((uint64_t)"%s:%d End  Failed  Error:%d  \n", v669, v670, v671, v672, v673, v674, v675, (char)"_programImageSMCIF");
    if (v12[23] == 1) {
      displayVeridianInfoOnFailure();
    }
    uint64_t v572 = *(unsigned __int8 *)v527;
  }
  if (v572)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 468, 0);
    unsigned int v696 = *v527;
    v694 = "T200: Program Image(s) Failed";
    v695 = "_programImageSMCIF";
    uint64_t v697 = v572;
    goto LABEL_415;
  }
  if (v12[24] != 1) {
    goto LABEL_11;
  }
  if (v12[25]) {
    goto LABEL_11;
  }
  if (v12[26]) {
    goto LABEL_11;
  }
  uint64_t v676 = _commitImageSMCIF(a1, v37, v38, v39, v40, v41, v42, v43);
  if (!v676) {
    goto LABEL_11;
  }
  uint64_t v677 = v676;
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 474, 0);
  uint64_t v46 = 0;
  CFErrorRef *v787 = createCFError("T200: Commit Image Failed", *v527, "_commitImageSMCIF", v677);
LABEL_16:
  if (v44) {
    CFRelease(v44);
  }
LABEL_41:
  v149 = *(void **)(a1 + 40);
  if (v149)
  {
    free(v149);
    *(void *)(a1 + 40) = 0;
  }
  *(void *)(a1 + 32) = 0;
  return v46;
}

uint64_t T200UpdaterIsDone(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  T200UpdaterInfoLog((uint64_t)"%s:%d Start \n", a2, a3, a4, a5, a6, a7, a8, (char)"T200UpdaterIsDone");
  if (!a1) {
    return 0;
  }
  if (!*(unsigned char *)(a1 + 8500))
  {
    CFDictionaryRef v21 = *(const __CFDictionary **)(a1 + 16);
    if (v21)
    {
      if (CFDictionaryContainsKey(v21, @"Options"))
      {
        CFBooleanRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"Options");
        if (Value)
        {
          CFTypeRef v23 = CFRetain(Value);
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v20 = 0;
            os_parse_boot_arg_int();
            CFRelease(v24);
            return v20;
          }
        }
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "T200Options", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 560, 0);
      T200UpdaterInfoLog((uint64_t)"%s:%d Failed getting the kT200OptionOptions \n", v25, v26, v27, v28, v29, v30, v31, (char)"T200UpdaterIsDone");
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData->fOptions", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 554, 0);
      T200UpdaterInfoLog((uint64_t)"%s:%d fOptions getting the kT200OptionOptions \n", v33, v34, v35, v36, v37, v38, v39, (char)"T200UpdaterIsDone");
    }
    return 0;
  }
  uint64_t v16 = *(__CFDictionary **)(a1 + 32);
  if (v16) {
    CFDictionaryRemoveAllValues(v16);
  }
  uint64_t v17 = *(void **)(a1 + 48);
  if (v17)
  {
    free(v17);
    *(void *)(a1 + 48) = 0;
  }
  uint64_t v18 = *(void **)(a1 + 40);
  if (v18)
  {
    free(v18);
    *(void *)(a1 + 40) = 0;
  }
  uint64_t v19 = *(void **)(a1 + 56);
  if (v19)
  {
    free(v19);
    *(void *)(a1 + 56) = 0;
  }
  T200UpdaterInfoLog((uint64_t)"%s:%d This is Tatsu signing ,we are done  \n", v9, v10, v11, v12, v13, v14, v15, (char)"T200UpdaterIsDone");
  return 1;
}

uint64_t isVeridianUpdateRequired(uint64_t a1, CFErrorRef *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (a2)
  {
    *a2 = 0;
    if (a1)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      cf[0] = 0;
      uint64_t URLFromString = AMSupportCreateURLFromString();
      if (URLFromString)
      {
        unsigned int v4 = (const void *)URLFromString;
        AMSupportCopyURLWithAppendedComponent();
        AMSupportPlatformFileURLExists();
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "fileExists", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 910, 0);
        *a2 = createCFError("Error: firmwareURL doesn't exist.", 0x5Cu, "copyRetrievedFirmwarePlist", 910);
        CFRelease(v4);
        if (cf[0]) {
          CFRelease(cf[0]);
        }
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "mountURL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 905, 0);
        *a2 = createCFError("Error: mountURL is NULL.", 0x5Cu, "copyRetrievedFirmwarePlist", 905);
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "fwPlist", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 592, 0);
      T200UpdaterInfoLog((uint64_t)"%s:%d Error: Failed to retrieve Firmware PLIST. \n", v13, v14, v15, v16, v17, v18, v19, (char)"isVeridianUpdateRequired");
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "restoreSystemPartition", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 589, 0);
      *a2 = createCFError("Error: restoreSystemPartition is NULL.", 0xCu, "isVeridianUpdateRequired", 589);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "error != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 587, 0);
    T200UpdaterInfoLog((uint64_t)"%s:%d Error: CFErrorRef is NULL. \n", v6, v7, v8, v9, v10, v11, v12, (char)"isVeridianUpdateRequired");
  }
  return 1;
}

uint64_t performVersionCheck(uint64_t a1, unsigned int *a2, uint64_t a3, CFErrorRef *a4)
{
  CFTypeRef cf = 0;
  uint64_t v49 = 0;
  CFTypeRef v46 = 0;
  CFTypeRef v47 = 0;
  uint64_t valuePtr = a2[7];
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFNumberRef v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt64Type, &valuePtr);
  if (!v8)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "chemID != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 941, 0);
    *a4 = createCFError("Error: Failed to get chem ID.", 0x5Du, "performVersionCheck", 941);
LABEL_43:
    uint64_t v19 = 1;
    goto LABEL_34;
  }
  CFNumberRef v9 = v8;
  CFStringRef v10 = CFStringCreateWithFormat(v7, 0, @"%u", (*a2 / 0x2710 - 100 * ((42949673 * (unint64_t)(*a2 / 0x2710)) >> 32)));
  if (!v10)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "hwVersionstr != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 945, 0);
    *a4 = createCFError("Error: Failed to get HW Version.", 0x5Du, "performVersionCheck", 945);
    CFRelease(v9);
    goto LABEL_43;
  }
  CFStringRef v11 = v10;
  _create_key_payload_Verison(a1, (CFStringRef *)&cf, (CFStringRef *)&v47, (CFStringRef *)&v46, (uint64_t)v9, (uint64_t)v10);
  ValueForKeyPathInDict = (const void *)AMSupportGetValueForKeyPathInDict();
  if (ValueForKeyPathInDict)
  {
    CFStringRef v13 = (const __CFString *)CFRetain(ValueForKeyPathInDict);
    CFStringRef v14 = v13;
    if (v13)
    {
      CFTypeID v15 = CFGetTypeID(v13);
      if (v15 == CFNumberGetTypeID() || (CFTypeID v16 = CFGetTypeID(v14), v16 == CFStringGetTypeID()))
      {
        CFTypeID v17 = CFGetTypeID(v14);
        if (v17 == CFNumberGetTypeID())
        {
          CFNumberGetValue((CFNumberRef)v14, kCFNumberSInt32Type, (char *)&v49 + 4);
        }
        else
        {
          CFTypeID v20 = CFGetTypeID(v14);
          if (v20 == CFStringGetTypeID()) {
            _AMSupportCFStringToUInt32(v14, (_DWORD *)&v49 + 1);
          }
        }
        long long v21 = (const void *)AMSupportGetValueForKeyPathInDict();
        if (v21)
        {
          CFNumberRef v29 = (const __CFNumber *)CFRetain(v21);
          CFNumberRef v18 = v29;
          if (v29)
          {
            CFTypeID v30 = CFGetTypeID(v29);
            if (v30 == CFNumberGetTypeID())
            {
              CFNumberGetValue(v18, kCFNumberSInt32Type, &v49);
            }
            else
            {
              CFTypeID v31 = CFGetTypeID(v18);
              if (v31 == CFStringGetTypeID()) {
                _AMSupportCFStringToUInt32((const __CFString *)v18, &v49);
              }
            }
          }
        }
        else
        {
          CFNumberRef v18 = 0;
        }
        if (a1 == 1)
        {
          uint64_t v35 = (unsigned int *)((char *)a2 + 50);
          uint64_t v36 = a2 + 1;
        }
        else
        {
          if (!a1)
          {
            unsigned int v32 = 0;
            unsigned int v33 = *a2;
            int v34 = v49;
            goto LABEL_26;
          }
          uint64_t v35 = (unsigned int *)((char *)a2 + 58);
          uint64_t v36 = a2 + 3;
        }
        unsigned int v32 = *v35;
        unsigned int v33 = *v36;
        int v34 = v49;
        if (v32 > v49)
        {
LABEL_28:
          uint64_t v19 = 0;
LABEL_29:
          T200UpdaterInfoLog((uint64_t)"%s:%d Device Img Version= %d  SetID= %d. \n", v22, v23, v24, v25, v26, v27, v28, (char)"performVersionCheck");
          T200UpdaterInfoLog((uint64_t)"%s:%d PLIST  Img Version= %d  SetID= %d. \n", v37, v38, v39, v40, v41, v42, v43, (char)"performVersionCheck");
          goto LABEL_30;
        }
LABEL_26:
        uint64_t v19 = 1;
        if (v32 != v34 || v33 < HIDWORD(v49)) {
          goto LABEL_29;
        }
        goto LABEL_28;
      }
    }
  }
  else
  {
    CFStringRef v14 = 0;
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "imgVerRef && (CFGetTypeID(imgVerRef) == CFNumberGetTypeID() || CFGetTypeID(imgVerRef) ==CFStringGetTypeID())", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 950, 0);
  CFNumberRef v18 = 0;
  *a4 = createCFError("Error: Failed to parse Image Version.", 0x5Du, "performVersionCheck", 950);
  uint64_t v19 = 1;
LABEL_30:
  CFRelease(v9);
  CFRelease(v11);
  if (v14) {
    CFRelease(v14);
  }
  if (v18) {
    CFRelease(v18);
  }
LABEL_34:
  if (cf) {
    CFRelease(cf);
  }
  if (v47) {
    CFRelease(v47);
  }
  if (v46) {
    CFRelease(v46);
  }
  return v19;
}

uint64_t READ_DATA__getVIQTReadings()
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  uint64_t v0 = BC__receive(168, 0x18u, v97);
  T200UpdaterInfoLog((uint64_t)"<VIQTReadings> \n", v1, v2, v3, v4, v5, v6, v7, v86);
  T200UpdaterInfoLog((uint64_t)"\t<ServiceType>Read Data</ServiceType> \n", v8, v9, v10, v11, v12, v13, v14, v87);
  if (v0)
  {
    T200UpdaterInfoLog((uint64_t)"\t<CommunicationStatus>%d</CommunicationStatus> \n", v15, v16, v17, v18, v19, v20, v21, v0);
  }
  else
  {
    T200UpdaterInfoLog((uint64_t)"\t<CommunicationStatus>%d</CommunicationStatus> \n", v15, v16, v17, v18, v19, v20, v21, 0);
    T200UpdaterInfoLog((uint64_t)"\t<ADCReadings> \n", v29, v30, v31, v32, v33, v34, v35, v89);
    double v90 = (float)((float)v97[0] * 0.0000076294);
    T200UpdaterInfoLog((uint64_t)"\t\t<Voltage>%f</Voltage> \n", v36, v37, v38, v39, v40, v41, v42, SLOBYTE(v90));
    double v91 = (float)((float)v97[1] * 0.0000076294);
    T200UpdaterInfoLog((uint64_t)"\t\t<Current>%f</Current> \n", v43, v44, v45, v46, v47, v48, v49, SLOBYTE(v91));
    double v92 = (float)((float)v97[2] * 0.0000076294);
    T200UpdaterInfoLog((uint64_t)"\t\t<OneSecondPassedCharge>%f</OneSecondPassedCharge> \n", v50, v51, v52, v53, v54, v55, v56, SLOBYTE(v92));
    double v93 = (float)((float)v97[3] * 0.0000076294);
    T200UpdaterInfoLog((uint64_t)"\t\t<NTCTemperature>%f</NTCTemperature> \n", v57, v58, v59, v60, v61, v62, v63, SLOBYTE(v93));
    double v94 = (float)((float)v97[4] * 0.0000076294);
    T200UpdaterInfoLog((uint64_t)"\t\t<InternalTemperature>%f</InternalTemperature> \n", v64, v65, v66, v67, v68, v69, v70, SLOBYTE(v94));
    double v95 = (float)((float)v97[5] * 0.0000076294);
    T200UpdaterInfoLog((uint64_t)"\t\t<PackVoltage>%f</PackVoltage> \n", v71, v72, v73, v74, v75, v76, v77, SLOBYTE(v95));
    T200UpdaterInfoLog((uint64_t)"\t</ADCReadings> \n", v78, v79, v80, v81, v82, v83, v84, v96);
  }
  T200UpdaterInfoLog((uint64_t)"</VIQTReadings> \n", v22, v23, v24, v25, v26, v27, v28, v88);
  return v0;
}

uint64_t READ_DATA__getVersionInformation(int a1)
{
  uint64_t v175 = *MEMORY[0x263EF8340];
  unint64_t v164 = 0;
  unint64_t v165 = 0;
  unint64_t v162 = 0;
  unint64_t v163 = 0;
  int v161 = 0;
  int v174 = 0;
  uint64_t v173 = 0;
  int v172 = 0;
  uint64_t v171 = 0;
  int v170 = 0;
  uint64_t v169 = 0;
  __int16 v160 = -1;
  if (a1)
  {
    uint64_t v9 = BC__receive(167, 4u, (char *)&v165 + 4);
    if (v9) {
      goto LABEL_15;
    }
    uint64_t v9 = BC__receive(175, 4u, &v165);
    if (v9) {
      goto LABEL_15;
    }
    uint64_t v9 = BC__receive(170, 4u, (char *)&v164 + 4);
    if (v9) {
      goto LABEL_15;
    }
    uint64_t v9 = BC__receive(171, 4u, &v164);
    if (v9) {
      goto LABEL_15;
    }
    uint64_t v9 = BC__receive(172, 4u, (char *)&v163 + 4);
    if (v9) {
      goto LABEL_15;
    }
    uint64_t v9 = BC__receive(82, 4u, &v163);
    if (v9
      || (uint64_t v9 = BC__receive(61, 4u, &v161), v9)
      || (uint64_t v9 = BC__receive(173, 4u, (char *)&v162 + 4), v9)
      || (uint64_t v9 = BC__receive(80, 2u, &v160), v9)
      || (uint64_t v9 = BC__receive(124, 0xCu, &v173), v9)
      || (uint64_t v9 = BC__receive(62, 0xCu, &v169), v9)
      || (uint64_t v9 = BC__receive(63, 0xCu, &v171), v9)
      || (uint64_t v9 = BC__receive(119, 4u, &v162), v9))
    {
LABEL_15:
      T200UpdaterInfoLog((uint64_t)"<VersionInformation \n", v2, v3, v4, v5, v6, v7, v8, v152);
      T200UpdaterInfoLog((uint64_t)"\t<ServiceType>Read Data</ServiceType> \n", v10, v11, v12, v13, v14, v15, v16, v153);
      T200UpdaterInfoLog((uint64_t)"\t<CommunicationStatus>%d</CommunicationStatus> \n", v17, v18, v19, v20, v21, v22, v23, v9);
      T200UpdaterInfoLog((uint64_t)"</VersionInformation> \n", v24, v25, v26, v27, v28, v29, v30, v154);
      return v9;
    }
  }
  else
  {
    memset(v168, 0, sizeof(v168));
    long long v166 = 0u;
    long long v167 = 0u;
    uint64_t Info = BC__getInfo(&v166, 0x40uLL);
    if (Info)
    {
      uint64_t v9 = Info;
      T200UpdaterInfoLog((uint64_t)"%s:%d Failed getting info %d  \n", v2, v3, v4, v5, v6, v7, v8, (char)"READ_DATA__getVersionInformation");
      return v9;
    }
    unint64_t v165 = __PAIR64__(v167, v166);
    unint64_t v164 = __PAIR64__(DWORD1(v166), DWORD2(v166));
    unint64_t v163 = __PAIR64__(HIDWORD(v166), DWORD1(v167));
    int v161 = v168[0];
    unint64_t v162 = __PAIR64__(DWORD2(v167), HIDWORD(v167));
    __int16 v160 = WORD2(v168[0]);
    uint64_t v171 = *(void *)((char *)&v168[1] + 2);
    int v172 = *(_DWORD *)((char *)&v168[1] + 10);
    uint64_t v169 = *(void *)((char *)v168 + 6);
    int v170 = *(_DWORD *)((char *)v168 + 14);
    LOBYTE(v9) = BYTE14(v168[1]) & 1;
  }
  T200UpdaterInfoLog((uint64_t)"<AMSResponse> \n", v2, v3, v4, v5, v6, v7, v8, v152);
  T200UpdaterInfoLog((uint64_t)"\t<ServiceType>Read Data</ServiceType> \n", v32, v33, v34, v35, v36, v37, v38, v155);
  T200UpdaterInfoLog((uint64_t)"\t<CommunicationStatus>%d</CommunicationStatus> \n", v39, v40, v41, v42, v43, v44, v45, 0);
  T200UpdaterInfoLog((uint64_t)"\t<VersionInformation> \n", v46, v47, v48, v49, v50, v51, v52, v156);
  T200UpdaterInfoLog((uint64_t)"\t\t<SerialNumber>%u</SerialNumber> \n", v53, v54, v55, v56, v57, v58, v59, v163);
  T200UpdaterInfoLog((uint64_t)"\t\t<ChemID>%lu</ChemID> \n", v60, v61, v62, v63, v64, v65, v66, v162);
  T200UpdaterInfoLog((uint64_t)"\t\t<Crypto>%u</Crypto> \n", v67, v68, v69, v70, v71, v72, v73, SBYTE4(v165));
  T200UpdaterInfoLog((uint64_t)"\t\t<Firmware>%u</Firmware> \n", v74, v75, v76, v77, v78, v79, v80, v165);
  T200UpdaterInfoLog((uint64_t)"\t\t<Firmware> maj=%d med=%d min=%d rev=%d</Firmware> \n", v81, v82, v83, v84, v85, v86, v87, v165 / 0x5F5E100 - 10 * ((unsigned __int16)(26 * (v165 / 0x5F5E100)) >> 8));
  T200UpdaterInfoLog((uint64_t)"\t\t<Configuration>%u</Configuration> \n", v88, v89, v90, v91, v92, v93, v94, SBYTE4(v164));
  T200UpdaterInfoLog((uint64_t)"\t\t<DNVDSector1>%u</DNVDSector1> \n", v95, v96, v97, v98, v99, v100, v101, v164);
  T200UpdaterInfoLog((uint64_t)"\t\t<DNVDSector2>%u</DNVDSector2> \n", v102, v103, v104, v105, v106, v107, v108, SBYTE4(v163));
  T200UpdaterInfoLog((uint64_t)"\t\t<DeviceId>%d</DeviceId> \n", v109, v110, v111, v112, v113, v114, v115, v161);
  T200UpdaterInfoLog((uint64_t)"\t\t<DeviceType>%d</DeviceType> \n", v116, v117, v118, v119, v120, v121, v122, SBYTE4(v162));
  if (v173) {
    T200UpdaterInfoLog((uint64_t)"\t\t<CellIDs> DNVD1:%u  DNVD2:%u Config:%u </CellIDs> \n", v123, v124, v125, v126, v127, v128, v129, v173);
  }
  if (v169) {
    T200UpdaterInfoLog((uint64_t)"\t\t<Firmware supported SetIds> DNVD1:0x%x  DNVD2:0x%x Config:0x%x </Firmware supported SetIds> \n", v123, v124, v125, v126, v127, v128, v129, SBYTE4(v169));
  }
  if (v171) {
    T200UpdaterInfoLog((uint64_t)"\t\t<SetIds> DNVD1:0x%x  DNVD2:0x%x Config:0x%x </SetIds> \n", v123, v124, v125, v126, v127, v128, v129, SBYTE4(v171));
  }
  T200UpdaterInfoLog((uint64_t)"\t\t<UpdaterStatus>%d</UpdaterStatus> \n", v123, v124, v125, v126, v127, v128, v129, v160);
  if (!a1) {
    T200UpdaterInfoLog((uint64_t)"\t\t<TwoStageSupported>%u</TwoStageSupported> \n", v130, v131, v132, v133, v134, v135, v136, v9);
  }
  T200UpdaterInfoLog((uint64_t)"\t</VersionInformation> \n", v130, v131, v132, v133, v134, v135, v136, v157);
  T200UpdaterInfoLog((uint64_t)"</AMSResponse> \n", v137, v138, v139, v140, v141, v142, v143, v158);
  if (v173 == v174) {
    return 0;
  }
  uint64_t v9 = 0;
  if (v173 && v173 != HIDWORD(v173))
  {
    T200UpdaterInfoLog((uint64_t)"\x1B[31mCell ID's doesn't match ,must be fixed\x1B[0m", v144, v145, v146, v147, v148, v149, v150, v159);
    return 0;
  }
  return v9;
}

uint64_t _AMSupportCFStringToUInt32(const __CFString *a1, _DWORD *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t result = CFStringGetCString(a1, buffer, 32, 0x600u);
  if (result)
  {
    *__error() = 0;
    *a2 = strtol(buffer, 0, 0);
    return *__error() == 0;
  }
  return result;
}

uint64_t _T200UpdaterClassInitialize()
{
  uint64_t result = _CFRuntimeRegisterClass();
  _T200TypeID = result;
  return result;
}

void T200CFShow_0(const void *a1)
{
  if (a1)
  {
    CFStringRef v1 = CFCopyDescription(a1);
    CStringPtr = CFStringGetCStringPtr(v1, 0x8000100u);
    if (CStringPtr) {
      T200UpdaterInfoLog((uint64_t)"[DICT] %s \n", v3, v4, v5, v6, v7, v8, v9, (char)CStringPtr);
    }
    if (v1)
    {
      CFRelease(v1);
    }
  }
}

void _AMAuthInstallFinalize(uint64_t a1)
{
  if (!a1) {
    _AMAuthInstallFinalize_cold_1();
  }
  uint64_t v2 = (void *)(a1 + 16);
  bzero(v2, 0x2148uLL);
}

uint64_t CheckKeyTrue(const __CFDictionary *a1, const void *a2)
{
  if (!CFDictionaryContainsKey(a1, a2)) {
    return 0;
  }
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (!Value) {
    return 0;
  }
  CFBooleanRef v5 = Value;
  CFTypeID v6 = CFGetTypeID(Value);
  if (v6 != CFBooleanGetTypeID()) {
    return 0;
  }

  return CFBooleanGetValue(v5);
}

uint64_t _getInfoSMCIF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  int v88 = 0;
  long long v86 = 0u;
  long long v87 = 0u;
  uint64_t valuePtr = 0;
  T200UpdaterInfoLog((uint64_t)"%s:%d Start \n", a2, a3, a4, a5, a6, a7, a8, (char)"_getInfoSMCIF");
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1066, 0);
    CFDataRef v76 = 0;
    CFDataRef v50 = 0;
    CFNumberRef v47 = 0;
    CFNumberRef v48 = 0;
    CFNumberRef v49 = 0;
    CFStringRef v39 = 0;
    uint64_t v29 = 26;
    goto LABEL_52;
  }
  *(unsigned char *)(a1 + 8480) = 0;
  int Info = BC__getInfo(&v89, 0x40uLL);
  if (Info)
  {
    unsigned __int16 v78 = Info;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "rc == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1072, 0);
    CFDataRef v76 = 0;
    CFDataRef v50 = 0;
    CFNumberRef v47 = 0;
    CFNumberRef v48 = 0;
    CFNumberRef v49 = 0;
    CFStringRef v39 = 0;
    int v79 = (v78 << 8) | 0x23;
LABEL_84:
    *(_DWORD *)(a1 + 8492) = v79;
    uint64_t v29 = 1;
    goto LABEL_52;
  }
  *(unsigned char *)(a1 + 8505) = BYTE14(v92) & 1;
  unsigned int v10 = v89;
  *(_DWORD *)(a1 + 8468) = HIDWORD(v90);
  io_registry_entry_t v11 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], "IODeviceTree:/product");
  if (!v11)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "product_node", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2612, 0);
    uint64_t v29 = 117;
    goto LABEL_70;
  }
  io_object_t v12 = v11;
  uint64_t v13 = (_DWORD *)(a1 + 8472);
  CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v11, @"bmu-chip-id", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFDataRef v16 = CFProperty;
  if (CFProperty)
  {
    CFTypeID v17 = CFGetTypeID(CFProperty);
    if (v17 == CFDataGetTypeID())
    {
      BytePtr = CFDataGetBytePtr(v16);
      CFNumberRef v19 = CFNumberCreate(v14, kCFNumberIntType, BytePtr);
      if (v19)
      {
        CFNumberRef v20 = v19;
        if (CFNumberGetValue(v19, kCFNumberIntType, (void *)(a1 + 8472)))
        {
          uint64_t v82 = *v13;
          uint64_t v81 = 2624;
          T200UpdaterInfoLog((uint64_t)"%s:%d ChipId from IODT %08x \n", v21, v22, v23, v24, v25, v26, v27, (char)"_T200GetChipIdFromDT");
          uint64_t v28 = 0;
          while (*v13 != kT200ValidChipIds[v28])
          {
            if (++v28 == 8)
            {
              fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "found", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2632, 0);
              goto LABEL_12;
            }
          }
          uint64_t v29 = 0;
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "result", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2622, 0);
LABEL_12:
          uint64_t v29 = 127;
        }
        IOObjectRelease(v12);
        CFRelease(v20);
        if (v16) {
          goto LABEL_15;
        }
        goto LABEL_16;
      }
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "num", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2619, 0);
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "CFGetTypeID(chip_id_data) == CFDataGetTypeID()", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2616, 0);
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "chip_id_data", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2615, 0);
  }
  IOObjectRelease(v12);
  uint64_t v29 = 127;
  if (v16) {
LABEL_15:
  }
    CFRelease(v16);
LABEL_16:
  if (v29)
  {
LABEL_70:
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "rc == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1080, 0);
    CFDataRef v76 = 0;
    CFDataRef v50 = 0;
    CFNumberRef v47 = 0;
    CFNumberRef v48 = 0;
    CFNumberRef v49 = 0;
    CFStringRef v39 = 0;
    goto LABEL_52;
  }
  *(unsigned char *)(a1 + 8502) = (DWORD2(v90) & 0x30000) != 0x20000;
  *(_DWORD *)(a1 + 8492) = 0;
  if (!*(unsigned char *)(a1 + 8505) || !*(unsigned char *)(a1 + 8506) || *(unsigned char *)(a1 + 8507) == 1)
  {
    uint64_t v81 = 1089;
    T200UpdaterInfoLog((uint64_t)"%s:%d Signal Start Update \n", v30, v31, v32, v33, v34, v35, v36, (char)"_getInfoSMCIF");
    int started = BC__startUpdate(&v86, 0x24uLL);
    if (started)
    {
      unsigned __int16 v80 = started;
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "commStatus == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1093, 0);
      CFDataRef v76 = 0;
      CFDataRef v50 = 0;
      CFNumberRef v47 = 0;
      CFNumberRef v48 = 0;
      CFNumberRef v49 = 0;
      CFStringRef v39 = 0;
      int v79 = (v80 << 8) | 0x5A;
      goto LABEL_84;
    }
    *(_DWORD *)(a1 + 8464) = v88;
    long long v38 = v87;
    *(_OWORD *)(a1 + 8408) = v86;
    *(_OWORD *)(a1 + 8424) = v38;
  }
  CFStringRef v39 = CFStringCreateWithFormat(v14, 0, @"%u", (v10 / 0x2710 - 100 * ((42949673 * (unint64_t)(v10 / 0x2710)) >> 32)), v81, v82);
  if (CFStringGetCStringPtr(v39, 0x8000100u)) {
    T200UpdaterInfoLog((uint64_t)"%s:%d hwVersionstr = %s  \n", v40, v41, v42, v43, v44, v45, v46, (char)"_getInfoSMCIF");
  }
  T200UpdaterInfoLog((uint64_t)"%s:%d Veridian Fw  detected maj=%d med=%d min=%d rev=%d \n", v40, v41, v42, v43, v44, v45, v46, (char)"_getInfoSMCIF");
  if (!v39)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "hwVersionstr != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1109, 0);
    CFDataRef v76 = 0;
    CFDataRef v50 = 0;
    CFNumberRef v47 = 0;
    CFNumberRef v48 = 0;
    CFNumberRef v49 = 0;
    int v79 = 77;
    goto LABEL_84;
  }
  CFNumberRef v47 = CFNumberCreate(v14, kCFNumberSInt32Type, (const void *)(a1 + 8464));
  if (!v47)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "deviceIDRef != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1112, 0);
    CFDataRef v76 = 0;
    CFDataRef v50 = 0;
    CFNumberRef v48 = 0;
    CFNumberRef v49 = 0;
    int v79 = 78;
    goto LABEL_84;
  }
  CFNumberRef v48 = CFNumberCreate(v14, kCFNumberSInt32Type, (const void *)(a1 + 8472));
  if (!v48)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "chipIDRef != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1115, 0);
    CFDataRef v76 = 0;
    CFDataRef v50 = 0;
    CFNumberRef v49 = 0;
    int v79 = 79;
    goto LABEL_84;
  }
  CFDataRef value = CFDataCreate(v14, (const UInt8 *)(a1 + 8408), 32);
  if (!value)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "nonceData != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1118, 0);
    CFDataRef v76 = 0;
    CFDataRef v50 = 0;
    CFNumberRef v49 = 0;
    int v79 = 80;
    goto LABEL_84;
  }
  uint64_t valuePtr = *(unsigned int *)(a1 + 8468);
  CFNumberRef v49 = CFNumberCreate(v14, kCFNumberSInt64Type, &valuePtr);
  if (v49)
  {
    CFDataRef v50 = CFDataCreate(v14, (const UInt8 *)(a1 + 8476), 4);
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), @"Options")) {
      uint64_t v51 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), @"Options");
    }
    else {
      uint64_t v51 = 0;
    }
    uint64_t v52 = *(__CFDictionary **)(a1 + 32);
    int v85 = 0;
    CFNumberRef v53 = CFNumberCreate(v14, kCFNumberSInt32Type, &v85);
    if (!v53) {
      _getInfoSMCIF_cold_1();
    }
    CFNumberRef v54 = v53;
    CFDictionarySetValue(v52, @"UpdateType", v53);
    CFRelease(v54);
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), @"Nonce", value);
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), @"ChipID", v48);
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), @"UniqueID", v47);
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), @"HWVersion", v39);
    uint64_t v55 = (const void *)*MEMORY[0x263EFFB40];
    uint64_t v56 = (const void *)*MEMORY[0x263EFFB38];
    if (*(unsigned char *)(a1 + 8502)) {
      uint64_t v57 = (const void *)*MEMORY[0x263EFFB40];
    }
    else {
      uint64_t v57 = (const void *)*MEMORY[0x263EFFB38];
    }
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), @"ProductionMode", v57);
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), @"Revision", v50);
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), @"ChemistryID", v49);
    if (*(unsigned char *)(a1 + 8480)) {
      uint64_t v58 = v55;
    }
    else {
      uint64_t v58 = v56;
    }
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), @"LocalSigningID", v58);
    if (*(unsigned char *)(a1 + 8508)) {
      uint64_t v59 = v55;
    }
    else {
      uint64_t v59 = v56;
    }
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), @"ForceFirmwareUpgrade", v59);
    if (*(unsigned char *)(a1 + 8503)) {
      uint64_t v60 = v55;
    }
    else {
      uint64_t v60 = v56;
    }
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), @"RollbackFWVer", v60);
    if (*(unsigned char *)(a1 + 8505)) {
      uint64_t v61 = v55;
    }
    else {
      uint64_t v61 = v56;
    }
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), @"IsTwoStageSupported", v61);
    if (v51) {
      CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), @"UpdaterOptions", v51);
    }
    T200UpdaterInfoLog((uint64_t)"%s:%d End \n", v62, v63, v64, v65, v66, v67, v68, (char)"_getInfoSMCIF");
    uint64_t v29 = 0;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "chemID != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1122, 0);
    CFDataRef v50 = 0;
    *(_DWORD *)(a1 + 8492) = 76;
    uint64_t v29 = 1;
  }
  CFDataRef v76 = value;
LABEL_52:
  if (*(_DWORD *)(a1 + 8492))
  {
    T200UpdaterInfoLog((uint64_t)"%s:%d Failed with Error:%d  \n", v69, v70, v71, v72, v73, v74, v75, (char)"_getInfoSMCIF");
    WORD2(v91) = 24;
    BC__getInfo(&v89, 0x40uLL);
    uint64_t v29 = *(unsigned __int8 *)(a1 + 8492);
    *(unsigned char *)(a1 + 8495) = BYTE4(v91);
  }
  if (v47) {
    CFRelease(v47);
  }
  if (v48) {
    CFRelease(v48);
  }
  if (v76) {
    CFRelease(v76);
  }
  if (v49) {
    CFRelease(v49);
  }
  if (v50) {
    CFRelease(v50);
  }
  if (v39) {
    CFRelease(v39);
  }
  return v29;
}

uint64_t _check_update_needed(uint64_t a1, BOOL *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a5;
  int v9 = a4;
  uint64_t v116 = *MEMORY[0x263EF8340];
  CFStringRef v112 = 0;
  CFStringRef v113 = 0;
  uint64_t valuePtr = 0;
  CFTypeRef cf = 0;
  T200UpdaterInfoLog((uint64_t)"%s:%d start \n", (uint64_t)a2, a3, a4, a5, a6, a7, a8, (char)"_check_update_needed");
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1830, 0);
LABEL_104:
    uint64_t v55 = 122;
LABEL_106:
    T200UpdaterInfoLog((uint64_t)"%s:%d failed with result =%d \n", v97, v98, v99, v100, v101, v102, v103, (char)"_check_update_needed");
    uint64_t v52 = 0;
    CFNumberRef v54 = 0;
    goto LABEL_28;
  }
  io_object_t v12 = *(const void **)(a1 + 32);
  if (!v12)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData->fOutput", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1831, 0);
    goto LABEL_104;
  }
  if (!*(void *)(a1 + 24))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "t200UpdaterData->fInput", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1832, 0);
    goto LABEL_104;
  }
  CFDictionaryRef v13 = (const __CFDictionary *)CFRetain(v12);
  if (!v13)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "deviceInfoRef", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1835, 0);
    uint64_t v55 = 85;
    goto LABEL_106;
  }
  CFDictionaryRef v14 = v13;
  CFBooleanRef Value = CFDictionaryGetValue(v13, @"ChemistryID");
  CFDataRef v16 = CFDictionaryGetValue(v14, @"HWVersion");
  _create_key_payload_Verison(a3, &v113, &v112, (CFStringRef *)&cf, (uint64_t)Value, (uint64_t)v16);
  CFStringRef v17 = v112;
  CFStringRef v18 = v113;
  if (v113 && v112)
  {
    CFNumberRef v19 = *(const void **)(a1 + 24);
    if (v19)
    {
      CFDictionaryRef v20 = (const __CFDictionary *)CFRetain(v19);
      if (v20)
      {
        CFDictionaryRef v21 = v20;
        CFDataRef v22 = (const __CFData *)CFDictionaryGetValue(v20, @"FirmwareData");
        CFDictionaryRef v108 = v21;
        if (v22 && (CFDataRef v23 = v22, v24 = CFGetTypeID(v22), v24 == CFDataGetTypeID()))
        {
          int v107 = v9;
          CFPropertyListRef v25 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], v23, 0, 0, 0);
          CFPropertyListRef v26 = v25;
          if (v25)
          {
            CFTypeID v27 = CFGetTypeID(v25);
            if (v27 == CFDictionaryGetTypeID())
            {
              ValueForKeyPathInDict = (const void *)AMSupportGetValueForKeyPathInDict();
              if (ValueForKeyPathInDict)
              {
                int v105 = v8;
                CFStringRef v29 = (const __CFString *)CFRetain(ValueForKeyPathInDict);
                CFStringRef v30 = v29;
                if (v29)
                {
                  CFTypeID v31 = CFGetTypeID(v29);
                  if (v31 == CFNumberGetTypeID() || (CFTypeID v32 = CFGetTypeID(v30), v32 == CFStringGetTypeID()))
                  {
                    uint64_t v33 = (const void *)AMSupportGetValueForKeyPathInDict();
                    if (v33)
                    {
                      CFNumberRef v34 = (const __CFNumber *)CFRetain(v33);
                      CFNumberRef v35 = v34;
                      if (v34)
                      {
                        CFTypeID v36 = CFGetTypeID(v34);
                        if (v36 == CFNumberGetTypeID())
                        {
                          if (!CFNumberGetValue(v35, kCFNumberSInt32Type, (char *)&valuePtr + 4))
                          {
                            fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "success==true", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1863, 0);
LABEL_100:
                            uint64_t v57 = 31;
                            goto LABEL_37;
                          }
                        }
                        else
                        {
                          CFTypeID v59 = CFGetTypeID(v35);
                          if (v59 == CFStringGetTypeID()) {
                            _AMSupportCFStringToUInt32((const __CFString *)v35, (_DWORD *)&valuePtr + 1);
                          }
                        }
                        int v58 = 0;
                        goto LABEL_43;
                      }
                    }
                    else
                    {
                      CFNumberRef v35 = 0;
                    }
                    int v58 = 1;
LABEL_43:
                    CFTypeID v60 = CFGetTypeID(v30);
                    if (v60 == CFNumberGetTypeID()) {
                      CFNumberGetValue((CFNumberRef)v30, kCFNumberSInt32Type, &valuePtr);
                    }
                    CFTypeID v61 = CFGetTypeID(v30);
                    if (v61 == CFStringGetTypeID()) {
                      _AMSupportCFStringToUInt32(v30, &valuePtr);
                    }
                    long long v115 = 0u;
                    memset(v114, 0, sizeof(v114));
                    int Info = BC__getInfo(v114, 0x40uLL);
                    if (!Info)
                    {
                      CFNumberRef v106 = v35;
                      if (a3 == 1)
                      {
                        if (v58)
                        {
                          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "set_id", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1887, 0);
                          uint64_t v57 = 115;
                          goto LABEL_37;
                        }
                        int v70 = 0;
                        unsigned int v71 = DWORD1(v114[0]);
                        unsigned int v72 = *(_DWORD *)((char *)&v115 + 2);
                      }
                      else if (a3 == 2)
                      {
                        if (v58)
                        {
                          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "set_id", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1892, 0);
                          uint64_t v57 = 116;
                          goto LABEL_37;
                        }
                        int v70 = 1;
                        unsigned int v71 = HIDWORD(v114[0]);
                        unsigned int v72 = *(_DWORD *)((char *)&v115 + 10);
                      }
                      else
                      {
                        int v70 = 0;
                        unsigned int v72 = 0;
                        unsigned int v71 = v114[0];
                      }
                      T200UpdaterInfoLog((uint64_t)"%s:%d set_id_0=%d set_id_1=%d set_id_2=%d \n", v63, v64, v65, v66, v67, v68, v69, (char)"_check_update_needed");
                      *a2 = 0;
                      unsigned int v80 = valuePtr;
                      if (v107)
                      {
                        *a2 = valuePtr != v71;
                        uint64_t v81 = "%s:%d Does Image updated (0-No 1-Yes)= %d, Veridian Image Loaded: %d set-id:%d    Veridian"
                              " Image Requested:%d new_set-id:%d \n";
                      }
                      else
                      {
                        uint64_t v82 = (unsigned char *)(a1 + 8503);
                        if (a3)
                        {
                          unsigned int v83 = HIDWORD(valuePtr);
                          if (a3 == 1)
                          {
                            BOOL v86 = (valuePtr >= v71 && v105 == 0 || valuePtr > v71)
                               && v72 == HIDWORD(valuePtr);
                            if (v86 || v72 < HIDWORD(valuePtr) || *v82) {
                              *a2 = 1;
                            }
                            *(_DWORD *)(a1 + 8520) = v80;
                            *(_DWORD *)(a1 + 8524) = v83;
                          }
                        }
                        else
                        {
                          BOOL v87 = v105 == 0;
                          if (valuePtr < v71) {
                            BOOL v87 = 0;
                          }
                          if (valuePtr > v71
                            || v87
                            || *(unsigned char *)(a1 + 8504) == 1
                            && (int v88 = valuePtr / 0xF4240
                                    - 100 * ((42949673 * (unint64_t)(valuePtr / 0xF4240)) >> 32),
                                v88 != v71 / 0xF4240 - 100 * ((42949673 * (unint64_t)(v71 / 0xF4240)) >> 32))
                            && v88 != 8
                            || *v82)
                          {
                            *a2 = 1;
                          }
                          *(_DWORD *)(a1 + 8528) = v80;
                          unsigned int v83 = HIDWORD(valuePtr);
                        }
                        if (v70)
                        {
                          BOOL v89 = v72 == v83 && v80 > v71;
                          if (v89 || v72 < v83 || *v82) {
                            *a2 = 1;
                          }
                          *(_DWORD *)(a1 + 8512) = v80;
                          *(_DWORD *)(a1 + 8516) = v83;
                        }
                        uint64_t v81 = "%s:%d Do we need to update(0-No 1-Yes)= %d, current veridian fw: %d set-id:%d    new_firmw"
                              "are:%d new_set-id:%d \n";
                      }
                      T200UpdaterInfoLog((uint64_t)v81, v73, v74, v75, v76, v77, v78, v79, (char)"_check_update_needed");
                      T200UpdaterInfoLog((uint64_t)"%s:%d end \n", v90, v91, v92, v93, v94, v95, v96, (char)"_check_update_needed");
                      uint64_t v57 = 0;
                      CFNumberRef v35 = v106;
                      goto LABEL_94;
                    }
                    unsigned __int16 v104 = Info;
                    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "rc==KERN_SUCCESS", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1880, 0);
                    uint64_t v57 = (v104 << 8) | 0x56u;
LABEL_37:
                    T200UpdaterInfoLog((uint64_t)"%s:%d failed with result =%d \n", v37, v38, v39, v40, v41, v42, v43, (char)"_check_update_needed");
LABEL_94:
                    CFRelease(v108);
                    CFRelease(v14);
                    uint64_t v51 = v57;
                    goto LABEL_95;
                  }
                }
              }
              else
              {
                CFStringRef v30 = 0;
              }
              fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwareVersionRef && (CFGetTypeID(firmwareVersionRef) == CFNumberGetTypeID() || CFGetTypeID(firmwareVersionRef) ==CFStringGetTypeID())", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1855, 0);
              CFNumberRef v35 = 0;
              uint64_t v57 = 31;
              goto LABEL_37;
            }
          }
          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwareDictRef && CFGetTypeID(firmwareDictRef) == CFDictionaryGetTypeID()", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1852, 0);
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwaredataRef && CFGetTypeID(firmwaredataRef) == CFDataGetTypeID()", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1849, 0);
          CFPropertyListRef v26 = 0;
        }
        CFStringRef v30 = 0;
        CFNumberRef v35 = 0;
        goto LABEL_100;
      }
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "fOptions", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1846, 0);
    uint64_t v51 = 83;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "keyFwPayload!=NULL && keyFwVersion!=NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1843, 0);
    uint64_t v51 = 31;
  }
  T200UpdaterInfoLog((uint64_t)"%s:%d failed with result =%d \n", v44, v45, v46, v47, v48, v49, v50, (char)"_check_update_needed");
  CFRelease(v14);
  CFPropertyListRef v26 = 0;
  CFStringRef v30 = 0;
  CFNumberRef v35 = 0;
  uint64_t v52 = 0;
  CFStringRef v53 = 0;
  CFNumberRef v54 = 0;
  uint64_t v55 = v51;
  if (!v18)
  {
    if (!v17) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_95:
  CFRelease(v18);
  CFStringRef v113 = 0;
  uint64_t v55 = v51;
  uint64_t v52 = v26;
  CFStringRef v53 = v30;
  CFNumberRef v54 = v35;
  if (v17)
  {
LABEL_25:
    CFRelease(v17);
    CFStringRef v112 = 0;
  }
LABEL_26:
  if (v53) {
    CFRelease(v53);
  }
LABEL_28:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v52) {
    CFRelease(v52);
  }
  if (v54) {
    CFRelease(v54);
  }
  return v55;
}

uint64_t _commitImageSMCIF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  int v9 = (unsigned char *)(a1 + 8481);
  long long v83 = 0u;
  long long v84 = 0u;
  memset(v82, 0, sizeof(v82));
  T200UpdaterInfoLog((uint64_t)"%s:%d Start", a2, a3, a4, a5, a6, a7, a8, (char)"_commitImageSMCIF");
  int v10 = BC__commitImage();
  if (v10)
  {
    unsigned __int16 v42 = v10;
    T200UpdaterInfoLog((uint64_t)"%s:%d BC__commitImage failed commStatus=0x%X", v11, v12, v13, v14, v15, v16, v17, (char)"_commitImageSMCIF");
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "commStatus == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1577, 0);
    *(_DWORD *)(a1 + 8492) = (v42 << 8) | 0x81;
    BOOL v43 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR);
    if (v43) {
      _commitImageSMCIF_cold_1(v43, v44, v45, v46, v47, v48, v49, v50);
    }
    uint64_t v41 = 1;
  }
  else
  {
    __int16 v81 = 0;
    BOOL v80 = 0;
    uint64_t v18 = _check_update_needed(a1, (BOOL *)&v81 + 1, 0, 1, 0, v15, v16, v17);
    if (v18)
    {
      uint64_t v41 = v18;
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1584, 0);
      *(_DWORD *)(a1 + 8492) = v41;
      T200UpdaterInfoLog((uint64_t)"T200: Check Update Needed Failed for Firmware Image %d", v59, v60, v61, v62, v63, v64, v65, v41);
    }
    else
    {
      uint64_t v22 = _check_update_needed(a1, (BOOL *)&v81, 1, 1, 0, v19, v20, v21);
      if (v22)
      {
        uint64_t v41 = v22;
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1587, 0);
        *(_DWORD *)(a1 + 8492) = v41;
        T200UpdaterInfoLog((uint64_t)"T200: Check Update Needed Failed for Configuration Image %d", v66, v67, v68, v69, v70, v71, v72, v41);
      }
      else
      {
        uint64_t v26 = _check_update_needed(a1, &v80, 2, 1, 0, v23, v24, v25);
        if (v26)
        {
          uint64_t v41 = v26;
          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret == kT200Success", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1590, 0);
          *(_DWORD *)(a1 + 8492) = v41;
          T200UpdaterInfoLog((uint64_t)"T200: Check Update Needed Failed for DNVD Image %d", v73, v74, v75, v76, v77, v78, v79, v41);
        }
        else
        {
          if (*v9 == 1 && HIBYTE(v81) == 1)
          {
            T200UpdaterInfoLog((uint64_t)"%s:%d ERROR:Failed Updating the Firmware ", v27, v28, v29, v30, v31, v32, v33, (char)"_commitImageSMCIF");
            *(_DWORD *)(a1 + 8492) = 89;
          }
          if (v9[2] == 1 && v81 == 1)
          {
            T200UpdaterInfoLog((uint64_t)"%s:%d ERROR:Failed Updating the Configuration ", v27, v28, v29, v30, v31, v32, v33, (char)"_commitImageSMCIF");
            *(_DWORD *)(a1 + 8492) = 88;
          }
          if (v9[1] == 1 && v80)
          {
            T200UpdaterInfoLog((uint64_t)"%s:%d ERROR:Failed Updating the DNVD ", v27, v28, v29, v30, v31, v32, v33, (char)"_commitImageSMCIF");
            *(_DWORD *)(a1 + 8492) = 87;
          }
          READ_DATA__getVersionInformation(0);
          *(_DWORD *)(a1 + 8492) = 0;
          T200UpdaterInfoLog((uint64_t)"%s:%d End", v34, v35, v36, v37, v38, v39, v40, (char)"_commitImageSMCIF");
          uint64_t v41 = 0;
        }
      }
    }
  }
  v9[19] = 1;
  if (*(_DWORD *)(a1 + 8492))
  {
    WORD2(v83) = 24;
    BC__getInfo(v82, 0x40uLL);
    *(_DWORD *)(a1 + 8492) = *(_DWORD *)(a1 + 8492) & 0xFFFFFF | (BYTE4(v83) << 24);
    T200UpdaterInfoLog((uint64_t)"%s:%d End  Failed  Error:%d ", v51, v52, v53, v54, v55, v56, v57, (char)"_commitImageSMCIF");
    if (v9[23] == 1) {
      displayVeridianInfoOnFailure();
    }
    return *(unsigned __int8 *)(a1 + 8492);
  }
  return v41;
}

uint64_t _extract_data_map(uint64_t a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4, CFTypeRef *a5, unsigned int *a6, uint64_t a7, uint64_t a8)
{
  CFStringRef v46 = 0;
  CFStringRef v47 = 0;
  CFTypeRef cf = 0;
  T200UpdaterInfoLog((uint64_t)"%s:%d start \n", (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t)a6, a7, a8, (char)"_extract_data_map");
  _create_key_payload_Verison(a1, &v47, &v46, (CFStringRef *)&cf, a3, a4);
  CFStringRef v14 = v46;
  CFStringRef v15 = v47;
  if (v47) {
    BOOL v16 = v46 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(a2, @"FirmwareData");
    if (Value && (CFDataRef v18 = Value, v19 = CFGetTypeID(Value), v19 == CFDataGetTypeID()))
    {
      CFPropertyListRef v20 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x263EFFB08], v18, 0, 0, 0);
      uint64_t v21 = v20;
      if (v20 && (CFTypeID v22 = CFGetTypeID(v20), v22 == CFDictionaryGetTypeID()))
      {
        ValueForKeyPathInDict = (const void *)AMSupportGetValueForKeyPathInDict();
        if (ValueForKeyPathInDict)
        {
          CFDataRef v31 = (const __CFData *)CFRetain(ValueForKeyPathInDict);
          if (v31)
          {
            CFDataRef v32 = v31;
            if (*a5)
            {
              CFRelease(*a5);
              *a5 = 0;
            }
            unsigned int Length = CFDataGetLength(v32);
            *a6 = Length;
            if (Length > 0x40000)
            {
              fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "Allocation_size <= SU__SIZE__MAX_IMAGE", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1783, 0);
              uint64_t v43 = 128;
            }
            else
            {
              size_t v34 = Length;
              uint64_t v35 = calloc(Length, 1uLL);
              *a5 = v35;
              if (v35)
              {
                bzero(v35, v34);
                v48.length = *a6;
                v48.location = 0;
                CFDataGetBytes(v32, v48, (UInt8 *)*a5);
                T200UpdaterInfoLog((uint64_t)"%s:%d end \n", v36, v37, v38, v39, v40, v41, v42, (char)"_extract_data_map");
                uint64_t v43 = 0;
              }
              else
              {
                fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "NULL != *firmwareData", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1785, 0);
                uint64_t v43 = 72;
              }
            }
            CFRelease(v32);
            goto LABEL_19;
          }
        }
        T200UpdaterInfoLog((uint64_t)"%s:%d This hardware configuration doesn't exist in FirmwareMap. \n", v24, v25, v26, v27, v28, v29, v30, (char)"_extract_data_map");
        T200CFShow_0(v15);
        T200CFShow_0(v21);
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwareDataRef", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1778, 0);
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwareDictRef && CFGetTypeID(firmwareDictRef) == CFDictionaryGetTypeID()", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1769, 0);
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "dataRef && CFGetTypeID(dataRef) == CFDataGetTypeID()", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1765, 0);
      uint64_t v21 = 0;
    }
    uint64_t v43 = 31;
LABEL_19:
    CFRelease(v15);
    goto LABEL_20;
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "keyFwPayload!=NULL && keyFwVersion!=NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1761, 0);
  uint64_t v21 = 0;
  uint64_t v43 = 31;
  if (v15) {
    goto LABEL_19;
  }
LABEL_20:
  if (v14) {
    CFRelease(v14);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v21) {
    CFRelease(v21);
  }
  return v43;
}

uint64_t _create_key_payload_Verison(uint64_t result, CFStringRef *a2, CFStringRef *a3, CFStringRef *a4, uint64_t a5, uint64_t a6)
{
  switch(result)
  {
    case 2:
      CFAllocatorRef v18 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      *a2 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@.%@.%@.%@.%@.%@", @"hw_version", a6, @"chemistry", a5, @"dnvd", @"payload");
      *a3 = CFStringCreateWithFormat(v18, 0, @"%@.%@.%@.%@.%@.%@", @"hw_version", a6, @"chemistry", a5, @"dnvd", @"version");
      *a4 = CFStringCreateWithFormat(v18, 0, @"%@.%@.%@.%@.%@.%@", @"hw_version", a6, @"chemistry", a5, @"dnvd", @"set_id");
      return T200UpdaterInfoLog((uint64_t)"%s:%d Update type kT200UpdateTypeDNVD \n", v19, v20, v21, v22, v23, v24, v25, (char)"_create_key_payload_Verison");
    case 1:
      CFAllocatorRef v26 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      *a2 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@.%@.%@.%@.%@.%@", @"hw_version", a6, @"chemistry", a5, @"configuration", @"payload");
      *a3 = CFStringCreateWithFormat(v26, 0, @"%@.%@.%@.%@.%@.%@", @"hw_version", a6, @"chemistry", a5, @"configuration", @"version");
      *a4 = CFStringCreateWithFormat(v26, 0, @"%@.%@.%@.%@.%@.%@", @"hw_version", a6, @"chemistry", a5, @"configuration", @"set_id");
      return T200UpdaterInfoLog((uint64_t)"%s:%d Update type kT200UpdateTypeConfiguration \n", v27, v28, v29, v30, v31, v32, v33, (char)"_create_key_payload_Verison");
    case 0:
      CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      *a2 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@.%@.%@.%@", @"hw_version", a6, @"firmware", @"payload");
      *a3 = CFStringCreateWithFormat(v10, 0, @"%@.%@.%@.%@", @"hw_version", a6, @"firmware", @"version");
      *a4 = 0;
      return T200UpdaterInfoLog((uint64_t)"%s:%d Update type kT200UpdateTypeFirmware \n", v11, v12, v13, v14, v15, v16, v17, (char)"_create_key_payload_Verison");
  }
  return result;
}

CFDictionaryRef T200CreateDictionaryRemovingKeyPath(const __CFAllocator *a1, const __CFDictionary *a2, const __CFString *a3)
{
  CFDictionaryRef v3 = a2;
  if (a2)
  {
    if (a3)
    {
      CFIndex location = CFStringFind(a3, @".", 0).location;
      if (location == -1)
      {
        CFIndex Count = CFDictionaryGetCount(v3);
        CFStringRef MutableCopy = CFDictionaryCreateMutableCopy(a1, Count, v3);
        if (MutableCopy)
        {
          uint64_t v21 = MutableCopy;
          CFDictionaryRemoveValue(MutableCopy, a3);
          CFTypeRef v22 = CFRetain(v21);
          CFRelease(v21);
          return (const __CFDictionary *)v22;
        }
        fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "valueDict != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 725, 0);
      }
      else
      {
        CFIndex v7 = location;
        CFIndex v8 = location + 1;
        v62.length = CFStringGetLength(a3) - (location + 1);
        v62.CFIndex location = v8;
        CFStringRef v9 = CFStringCreateWithSubstring(a1, a3, v62);
        if (v9)
        {
          CFStringRef v10 = v9;
          v63.CFIndex location = 0;
          v63.length = v7;
          CFStringRef v11 = CFStringCreateWithSubstring(a1, a3, v63);
          if (v11)
          {
            CFStringRef v12 = v11;
            CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v3, v11);
            if (Value)
            {
              CFDictionaryRef v14 = Value;
              CFTypeID v15 = CFGetTypeID(Value);
              if (v15 == CFDictionaryGetTypeID())
              {
                CFMutableDictionaryRef v16 = CFDictionaryCreateMutableCopy(a1, 0, v14);
                CFDictionaryRef DictionaryRemovingKeyPath = (const void *)T200CreateDictionaryRemovingKeyPath(a1, v16, v10);
                CFAllocatorRef v18 = CFDictionaryCreateMutableCopy(a1, 0, v3);
                CFDictionaryRef v3 = v18;
                if (v18) {
                  CFDictionarySetValue(v18, v12, DictionaryRemovingKeyPath);
                }
                else {
                  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "outDict != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 769, 0);
                }
                goto LABEL_15;
              }
              fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "CFGetTypeID(tmpDict) == CFDictionaryGetTypeID()", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 752, 0);
              T200UpdaterInfoLog((uint64_t)"%s:%d item %@ not a dictionary \n", v55, v56, v57, v58, v59, v60, v61, (char)"T200CreateDictionaryRemovingKeyPath");
            }
            else
            {
              CFIndex v24 = CFDictionaryGetCount(v3);
              CFMutableDictionaryRef v25 = CFDictionaryCreateMutableCopy(a1, v24, v3);
              if (v25)
              {
                CFMutableDictionaryRef v26 = v25;
                CFDictionaryRef v3 = (const __CFDictionary *)CFRetain(v25);
                CFRelease(v26);
LABEL_14:
                CFMutableDictionaryRef v16 = 0;
                CFDictionaryRef DictionaryRemovingKeyPath = 0;
LABEL_15:
                CFRelease(v10);
                CFRelease(v12);
                if (v16) {
                  CFRelease(v16);
                }
                if (DictionaryRemovingKeyPath) {
                  CFRelease(DictionaryRemovingKeyPath);
                }
                return v3;
              }
              fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "valueDict != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 758, 0);
            }
            CFDictionaryRef v3 = 0;
            goto LABEL_14;
          }
          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "currentKey != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 747, 0);
          T200UpdaterInfoLog((uint64_t)"%s:%d failed to create current substring \n", v48, v49, v50, v51, v52, v53, v54, (char)"T200CreateDictionaryRemovingKeyPath");
          CFRelease(v10);
        }
        else
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "innerKeyPath != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 740, 0);
          T200UpdaterInfoLog((uint64_t)"%s:%d failed to create key substring \n", v41, v42, v43, v44, v45, v46, v47, (char)"T200CreateDictionaryRemovingKeyPath");
        }
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "keyPath != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 719, 0);
      T200UpdaterInfoLog((uint64_t)"%s:%d keyPath is NULL \n", v34, v35, v36, v37, v38, v39, v40, (char)"T200CreateDictionaryRemovingKeyPath");
    }
    return 0;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "dict != NULL", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 718, 0);
    T200UpdaterInfoLog((uint64_t)"%s:%d dict is NULL \n", v27, v28, v29, v30, v31, v32, v33, (char)"T200CreateDictionaryRemovingKeyPath");
  }
  return v3;
}

uint64_t _T200VerifySignature(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  MEMORY[0x263E71EA0]();
  MEMORY[0x270FA5388]();
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "data != ((void *)0)", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2439, 0);
    return 0xFFFFFFFFLL;
  }
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "public_key != ((void *)0)", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2440, 0);
    return 0xFFFFFFFFLL;
  }
  if (!a4)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "signature != ((void *)0)", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2441, 0);
    return 0xFFFFFFFFLL;
  }
  if (_T200CopyDigest(a2, a3, (uint64_t)v11))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2444, 0);
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = ccec_raw_import_pub();
  if (v8)
  {
    uint64_t v9 = v8;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2447, 0);
  }
  else
  {
    uint64_t v9 = ccec_verify_composite();
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "valid == 1", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2450, 0);
  }
  return v9;
}

uint64_t _T200VerifyDigest(uint64_t a1, int a2, unint64_t *a3)
{
  v8[4] = *MEMORY[0x263EF8340];
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "data != ((void *)0)", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2412, 0);
    return 0xFFFFFFFFLL;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "digest != ((void *)0)", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2413, 0);
    return 0xFFFFFFFFLL;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "data_len > 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2414, 0);
    return 0xFFFFFFFFLL;
  }
  if (_T200CopyDigest(a1, a2, (uint64_t)v8))
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2417, 0);
    return 0xFFFFFFFFLL;
  }
  unint64_t v4 = bswap64(*a3);
  unint64_t v5 = bswap64(v8[0]);
  if (v4 == v5)
  {
    unint64_t v4 = bswap64(a3[1]);
    unint64_t v5 = bswap64(v8[1]);
    if (v4 == v5)
    {
      unint64_t v4 = bswap64(a3[2]);
      unint64_t v5 = bswap64(v8[2]);
      if (v4 == v5)
      {
        unint64_t v4 = bswap64(a3[3]);
        unint64_t v5 = bswap64(v8[3]);
        if (v4 == v5) {
          return 0;
        }
      }
    }
  }
  if (v4 < v5) {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v6 = 1;
  }
  _T200PrintDigest((uint64_t)"Actual   :", (uint64_t)v8);
  _T200PrintDigest((uint64_t)"Expected :", (uint64_t)a3);
  fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "ret == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2424, 0);
  return v6;
}

uint64_t _T200CopyDigest(uint64_t a1, int a2, uint64_t a3)
{
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "data != ((void *)0)", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2393, 0);
    return 0xFFFFFFFFLL;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "digest != ((void *)0)", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2394, 0);
    return 0xFFFFFFFFLL;
  }
  if (!a2)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "data_len > 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 2395, 0);
    return 0xFFFFFFFFLL;
  }
  ccdigest();
  return 0;
}

uint64_t _T200PrintDigest(uint64_t result, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (result && a2)
  {
    char v3 = result;
    uint64_t v4 = 0;
    int v5 = 0;
    do
      v5 += snprintf(&v13[v5], 256 - v5, "%02X", *(unsigned __int8 *)(a2 + v4++));
    while (v4 != 32);
    return T200UpdaterInfoLog((uint64_t)" Digest: %s %s \n", v6, v7, v8, v9, v10, v11, v12, v3);
  }
  return result;
}

uint64_t _send_bin_retry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v62 = a3;
  int v8 = a2;
  unsigned int v10 = 0;
  uint64_t v82 = *MEMORY[0x263EF8340];
  uint64_t v11 = (unsigned char *)(a1 + 8481);
  uint64_t v12 = (unsigned char *)(a1 + 8482);
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v60 = (unsigned char *)(a1 + 8483);
  long long v75 = 0u;
  long long v76 = 0u;
  uint64_t v13 = (FILE **)MEMORY[0x263EF8348];
  uint64_t v61 = (unsigned char *)(a1 + 8482);
  int v59 = a2;
  do
  {
    if (v10)
    {
      T200UpdaterInfoLog((uint64_t)"%s:%d _send_bin failed, commStatus=0x%X, Retry...%d \n", a2, a3, a4, a5, a6, a7, a8, (char)"_send_bin_retry");
      sleep(3u);
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      WORD2(v77) = 24;
      if (!BC__getInfo(&v75, 0x40uLL))
      {
        T200UpdaterInfoLog((uint64_t)"%s:%d Updater Status (%d) before retry. \n", a2, a3, a4, a5, a6, a7, a8, (char)"_send_bin_retry");
        if (v8)
        {
          if (v8 == 1)
          {
            if (__PAIR64__(*(unsigned int *)((char *)&v78 + 2), DWORD1(v75)) != *(void *)(a1 + 8520))
            {
LABEL_20:
              T200UpdaterInfoLog((uint64_t)"%s:%d start Send Binary Image to Update Configuration SMC API, update %d \n", a2, a3, a4, a5, a6, a7, a8, (char)"_send_bin");
              uint64_t v33 = calloc(1uLL, *(unsigned int *)(a1 + 8456) + 80);
              uint64_t v21 = v33;
              if (v33)
              {
                size_t v23 = *(unsigned int *)(a1 + 8456);
                v33[8] = v23;
                CFIndex v24 = *(const void **)(a1 + 80);
                v33[9] = 4;
                CFTypeRef v22 = v60;
                int v8 = v59;
                goto LABEL_25;
              }
              fprintf(*v13, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "data", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1363, 0);
              *(_DWORD *)(a1 + 8492) = 81;
              int v8 = v59;
              if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                goto LABEL_46;
              }
              _send_bin_retry_cold_1(&v71, v72);
LABEL_62:
              uint64_t v21 = 0;
              goto LABEL_46;
            }
            T200UpdaterInfoLog((uint64_t)"%s:%d Success. Valid Configuration Version (%u) found on HW. Skip Retry. \n", a2, a3, a4, a5, a6, a7, a8, (char)"_send_bin_retry");
          }
          else
          {
            if (v8 != 2)
            {
LABEL_14:
              CFMutableDictionaryRef v25 = calloc(1uLL, 0x50uLL);
              uint64_t v21 = v25;
              if (v25)
              {
                v25[8] = 0;
                v25[9] = 0;
                goto LABEL_16;
              }
              fprintf(*v13, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "data", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1380, 0);
              *(_DWORD *)(a1 + 8492) = 81;
              if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                goto LABEL_46;
              }
              _send_bin_retry_cold_1(&v67, v68);
              goto LABEL_62;
            }
            if (__PAIR64__(*(unsigned int *)((char *)&v78 + 10), HIDWORD(v75)) != *(void *)(a1 + 8512))
            {
LABEL_12:
              T200UpdaterInfoLog((uint64_t)"%s:%d start Send Binary Image to Update DNVD SMC API, update %d \n", a2, a3, a4, a5, a6, a7, a8, (char)"_send_bin");
              uint64_t v14 = calloc(1uLL, *(unsigned int *)(a1 + 8452) + 80);
              uint64_t v21 = v14;
              if (v14)
              {
                CFTypeRef v22 = v12;
                size_t v23 = *(unsigned int *)(a1 + 8452);
                v14[8] = v23;
                CFIndex v24 = *(const void **)(a1 + 72);
                v14[9] = 3;
                goto LABEL_25;
              }
              fprintf(*v13, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "data", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1372, 0);
              *(_DWORD *)(a1 + 8492) = 81;
              if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
                goto LABEL_46;
              }
              _send_bin_retry_cold_1(&v69, v70);
              goto LABEL_62;
            }
            T200UpdaterInfoLog((uint64_t)"%s:%d Success. Valid DNVD2 Version (%u) found on HW. Skip Retry. \n", a2, a3, a4, a5, a6, a7, a8, (char)"_send_bin_retry");
          }
        }
        else
        {
          if (v75 != *(_DWORD *)(a1 + 8528)) {
            goto LABEL_23;
          }
          T200UpdaterInfoLog((uint64_t)"%s:%d Success. Valid Firmware Version (%u) found on HW. Skip Retry. \n", a2, a3, a4, a5, a6, a7, a8, (char)"_send_bin_retry");
        }
        uint64_t result = 0;
        *(_DWORD *)(a1 + 8492) = 0;
        return result;
      }
    }
    if (v8 == 2) {
      goto LABEL_12;
    }
    if (v8 == 1) {
      goto LABEL_20;
    }
    if (v8) {
      goto LABEL_14;
    }
LABEL_23:
    T200UpdaterInfoLog((uint64_t)"%s:%d start Send Binary Image to Update Firmware SMC API, update %d \n", a2, a3, a4, a5, a6, a7, a8, (char)"_send_bin");
    uint64_t v34 = calloc(1uLL, *(unsigned int *)(a1 + 8448) + 80);
    uint64_t v21 = v34;
    if (!v34)
    {
      fprintf(*v13, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "data", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1354, 0);
      *(_DWORD *)(a1 + 8492) = 81;
      if (!os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        goto LABEL_46;
      }
      _send_bin_retry_cold_1(&v73, v74);
      goto LABEL_62;
    }
    v34[9] = 5;
    size_t v23 = *(unsigned int *)(a1 + 8448);
    v34[8] = v23;
    CFIndex v24 = *(const void **)(a1 + 40);
    CFTypeRef v22 = v11;
LABEL_25:
    if (!v24)
    {
      uint64_t v12 = v61;
LABEL_16:
      fprintf(*v13, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "firmwareData", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1388, 0);
      *(_DWORD *)(a1 + 8492) = 82;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        _send_bin_retry_cold_2(&v65, v66);
      }
      goto LABEL_46;
    }
    if (!*v22)
    {
      T200UpdaterInfoLog((uint64_t)"%s:%d Skipping update \n", (uint64_t)v24, v15, v16, v17, v18, v19, v20, (char)"_send_bin");
      goto LABEL_45;
    }
    memcpy(v21 + 10, v24, v23);
    T200UpdaterInfoLog((uint64_t)"%s:%d image len:%u \n", v35, v36, v37, v38, v39, v40, v41, (char)"_send_bin");
    int v49 = BC__sendImage(v21);
    if (v49)
    {
      T200UpdaterInfoLog((uint64_t)"%s:%d BC__sendImage failed commStatus=0x%X \n", v42, v43, v44, v45, v46, v47, v48, (char)"_send_bin");
      fprintf(*v13, "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "commStatus == 0", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200Updater.c", 1401, 0);
      *(_DWORD *)(a1 + 8492) = ((unsigned __int16)v49 << 8) | 0x37;
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        _send_bin_retry_cold_4(&v63, v64);
      }
      goto LABEL_45;
    }
    long long v80 = 0u;
    long long v81 = 0u;
    memset(v79, 0, sizeof(v79));
    WORD2(v80) = 24;
    while (1)
    {
      sleep(5u);
      if (!BC__getInfo(v79, 0x40uLL)) {
        break;
      }
      T200UpdaterInfoLog((uint64_t)"%s:%d Failed getting info try %d \n", v50, v51, v52, v53, v54, v55, v56, (char)"_waitTillTargetUpdaterNotBusy_SMCAPI");
LABEL_32:
      if (++v49 == 20) {
        goto LABEL_38;
      }
    }
    if (WORD2(v80) == 2) {
      goto LABEL_32;
    }
    T200UpdaterInfoLog((uint64_t)"%s:%d Busy loop end with status %d \n", v50, v51, v52, v53, v54, v55, v56, (char)"_waitTillTargetUpdaterNotBusy_SMCAPI");
LABEL_38:
    int v57 = WORD2(v80);
    T200UpdaterInfoLog((uint64_t)"%s:%d sendbin status  %d \n", v50, v51, v52, v53, v54, v55, v56, (char)"_send_bin");
    if (v11[24])
    {
      if (v57 != 1)
      {
        *(_DWORD *)(a1 + 8492) = 55;
        goto LABEL_44;
      }
    }
    else if (v57 && v57 != 17)
    {
      *(_DWORD *)(a1 + 8492) = 55;
LABEL_44:
      T200UpdaterInfoLog((uint64_t)"%s:%d Failed to send bin with status %d \n", v26, v27, v28, v29, v30, v31, v32, (char)"_send_bin");
    }
LABEL_45:
    uint64_t v12 = v61;
LABEL_46:
    T200UpdaterInfoLog((uint64_t)"%s:%d End Send Binary Image %d  \n", v26, v27, v28, v29, v30, v31, v32, (char)"_send_bin");
    if (*(_DWORD *)(a1 + 8492)) {
      T200UpdaterInfoLog((uint64_t)"%s:%d End Send Binary Image %d  Faild targetUpdaterError=%d \n", a2, a3, a4, a5, a6, a7, a8, (char)"_send_bin");
    }
    if (v21) {
      free(v21);
    }
    uint64_t result = *(unsigned __int16 *)(a1 + 8492);
    if (v10 >= v62) {
      break;
    }
    if (!*(_WORD *)(a1 + 8492)) {
      break;
    }
    ++v10;
  }
  while (!v11[23]);
  return result;
}

uint64_t displayVeridianInfoOnFailure()
{
  uint64_t v126 = *MEMORY[0x263EF8340];
  __int16 v123 = 99;
  __int16 v122 = 99;
  int v125 = 0;
  uint64_t v124 = 0;
  int v121 = 0;
  int VersionInformation = READ_DATA__getVersionInformation(1);
  if (VersionInformation
    || (int VersionInformation = BC__receive(64, 4u, &v121)) != 0
    || (int VersionInformation = READ_DATA__getVIQTReadings()) != 0
    || (int VersionInformation = BC__receive(80, 2u, &v123)) != 0
    || (int VersionInformation = BC__receive(94, 2u, &v122)) != 0
    || (int VersionInformation = BC__receive(158, 0xBu, &v124)) != 0)
  {
    T200UpdaterInfoLog((uint64_t)"<VeridianInternalInfo \n", v0, v1, v2, v3, v4, v5, v6, v115);
    T200UpdaterInfoLog((uint64_t)"\t<ServiceType>Read Data</ServiceType> \n", v8, v9, v10, v11, v12, v13, v14, v116);
    char v117 = VersionInformation;
    CFTypeRef v22 = "\t<CommunicationStatus>%d</CommunicationStatus> \n";
  }
  else
  {
    T200UpdaterInfoLog((uint64_t)"<VeridianInternalInfo> \n", v0, v1, v2, v3, v4, v5, v6, v115);
    T200UpdaterInfoLog((uint64_t)"\t<ServiceType>Read Data</ServiceType> \n", v31, v32, v33, v34, v35, v36, v37, v119);
    T200UpdaterInfoLog((uint64_t)"\t<CommunicationStatus>%d</CommunicationStatus> \n", v38, v39, v40, v41, v42, v43, v44, 0);
    T200UpdaterInfoLog((uint64_t)"\t<TimeStamp>0x%x</TimeStamp> \n", v45, v46, v47, v48, v49, v50, v51, v121);
    T200UpdaterInfoLog((uint64_t)"\t<UpdaterStatus>%u</UpdaterStatus> \n", v52, v53, v54, v55, v56, v57, v58, v123);
    T200UpdaterInfoLog((uint64_t)"\t<UpdaterState>%u</UpdaterState> \n", v59, v60, v61, v62, v63, v64, v65, v122);
    T200UpdaterInfoLog((uint64_t)"\t<ResetCount> \n", v66, v67, v68, v69, v70, v71, v72, v120);
    T200UpdaterInfoLog((uint64_t)"\t\t<HWReset>%u</HWReset> \n", v73, v74, v75, v76, v77, v78, v79, v124);
    T200UpdaterInfoLog((uint64_t)"\t\t<WDTReset>%u</WDTReset> \n", v80, v81, v82, v83, v84, v85, v86, SBYTE2(v124));
    T200UpdaterInfoLog((uint64_t)"\t\t<COMMReset>%u</COMMReset> \n", v87, v88, v89, v90, v91, v92, v93, SBYTE4(v124));
    T200UpdaterInfoLog((uint64_t)"\t\t<SWReset>%u</SWReset> \n", v94, v95, v96, v97, v98, v99, v100, SBYTE6(v124));
    T200UpdaterInfoLog((uint64_t)"\t\t<UPDReset>%u</UPDReset> \n", v101, v102, v103, v104, v105, v106, v107, v125);
    T200UpdaterInfoLog((uint64_t)"\t\t<ResetReason>%u</ResetReason> \n", v108, v109, v110, v111, v112, v113, v114, SBYTE2(v125));
    CFTypeRef v22 = "\t</ResetCount> \n";
  }
  T200UpdaterInfoLog((uint64_t)v22, v15, v16, v17, v18, v19, v20, v21, v117);
  return T200UpdaterInfoLog((uint64_t)"</VeridianInternalInfo> \n", v23, v24, v25, v26, v27, v28, v29, v118);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

unsigned char *OUTLINED_FUNCTION_3(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

uint64_t computeFirmwareDigest(const void *a1, unint64_t a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  T200RestoreInfoLog((uint64_t)"%s:%d Start\n", a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"computeFirmwareDigest");
  if (a2 >> 20 > 4) {
    return 2;
  }
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  T200RestoreInfoLog((uint64_t)"%s:%d CC_SHA256_Init %d\n", v12, v13, v14, v15, v16, v17, v18, (char)"computeFirmwareDigest");
  CC_SHA256_Update(&c, a1, a2);
  T200RestoreInfoLog((uint64_t)"%s:%d CC_SHA256_Update %d\n", v19, v20, v21, v22, v23, v24, v25, (char)"computeFirmwareDigest");
  uint64_t v11 = CC_SHA256_Final(a3, &c);
  T200RestoreInfoLog((uint64_t)"%s:%d CC_SHA256_Final %d\n", v26, v27, v28, v29, v30, v31, v32, (char)"computeFirmwareDigest");
  return v11;
}

CFErrorRef createCFError(char *cStr, unsigned int a2, const char *a3, uint64_t a4)
{
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], cStr, 0x8000100u);
  if (!v8)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "cfErrMsg", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200UpdaterPrivateHelper.c", 62, 0);
    return 0;
  }
  CFStringRef v9 = v8;
  if (a3 || a4)
  {
    if (!a3)
    {
      CFStringRef v12 = CFStringCreateWithFormat(v7, 0, @"%@; %u", v8, a4);
      goto LABEL_9;
    }
    CFStringRef v11 = CFStringCreateWithCString(v7, a3, 0x8000100u);
    if (v11)
    {
      a3 = (const char *)v11;
      CFStringRef v12 = CFStringCreateWithFormat(v7, 0, @"%@; %@: %u", v9, v11, a4);
LABEL_9:
      CFStringRef v10 = v12;
      goto LABEL_10;
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "apiNameRef", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200UpdaterPrivateHelper.c", 69, 0);
    CFRelease(v9);
    return 0;
  }
  CFStringRef v10 = CFStringCreateWithFormat(v7, 0, @"%@", v8);
  a3 = 0;
LABEL_10:
  if (v10)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v7, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263EFFC70], v10);
    CFErrorRef v14 = CFErrorCreate(v7, @"T200ErrorDomain", a2, Mutable);
    CFRelease(v10);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "totalErrMsg", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200UpdaterPrivateHelper.c", 72, 0);
    CFMutableDictionaryRef Mutable = 0;
    CFErrorRef v14 = 0;
  }
  CFRelease(v9);
  if (a3) {
    CFRelease(a3);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v14;
}

uint64_t CreateDataFromFile(const char *a1, void *a2, _DWORD *a3)
{
  uint64_t v5 = fopen(a1, "rb");
  if (v5)
  {
    uint64_t v6 = v5;
    fseek(v5, 0, 2);
    size_t v7 = MEMORY[0x263E71F30](v6);
    CFStringRef v8 = malloc(v7);
    if (v8)
    {
      CFStringRef v9 = v8;
      rewind(v6);
      if (fread(v9, v7, 1uLL, v6) == 1)
      {
        fclose(v6);
        uint64_t result = 0;
        *a2 = v9;
        *a3 = v7;
        return result;
      }
    }
  }
  else
  {
    AMSupportLogInternal();
  }
  return 0xFFFFFFFFLL;
}

uint64_t _retrieveSignature(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "derSignature != ((void *)0)", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200UpdaterPrivateHelper.c", 132, 0);
    return 0xFFFFFFFFLL;
  }
  if (!a3)
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "rawSignature != ((void *)0)", (const char *)&unk_263E2AEBD, "/Library/Caches/com.apple.xbs/Sources/VeridianDylibs/T200Updater/T200UpdaterPrivateHelper.c", 133, 0);
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = 2;
  do
  {
    unint64_t v11 = v10 - 2;
    int v12 = *(unsigned __int8 *)(a1 + v10++ - 2);
  }
  while (v11 < a2 && v12 != 48);
  if (v11 >= a2)
  {
    T200RestoreInfoLog((uint64_t)"%s:%d Could not find the signature =%d\n", a2, (uint64_t)a3, a4, a5, a6, a7, a8, (char)"_retrieveSignature");
    return 5;
  }
  if (v12 != 48) {
    return 4;
  }
  if (*(unsigned char *)(a1 + (v10 - 1)) != 2) {
    return 2;
  }
  int v14 = *(unsigned __int8 *)(a1 + v10);
  unsigned int v15 = *(unsigned __int8 *)(a1 + (v14 + v10 + 2));
  if (v14 + v15 + 4 != *(unsigned __int8 *)(a1 + (v10 - 2))) {
    return 0xFFFFFFFFLL;
  }
  if (v14 == 33) {
    int v16 = 5;
  }
  else {
    int v16 = 4;
  }
  int v17 = v16 + v10;
  if (v14 == 33) {
    unsigned int v18 = 32;
  }
  else {
    unsigned int v18 = *(unsigned __int8 *)(a1 + v10);
  }
  unsigned int v19 = v17 - 3;
  if (v18 > 0x1F)
  {
    unsigned int v20 = 0;
LABEL_23:
    uint64_t v22 = &a3[v20];
    unsigned int v23 = v18;
    do
    {
      char v24 = *(unsigned char *)(a1 + v19++);
      *v22++ = v24;
      --v23;
    }
    while (v23);
    if (v18 <= 0x20) {
      int v25 = 32;
    }
    else {
      int v25 = v18;
    }
    unsigned int v21 = v25;
    goto LABEL_29;
  }
  unsigned int v20 = 32 - v18;
  bzero(a3, 32 - v18);
  if (v18) {
    goto LABEL_23;
  }
  unsigned int v21 = 32;
LABEL_29:
  if (*(unsigned char *)(a1 + v19) != 2) {
    return 8;
  }
  if (v15 != *(unsigned __int8 *)(a1 + v19 + 1)) {
    return 9;
  }
  if (v15 == 33) {
    int v26 = 3;
  }
  else {
    int v26 = 2;
  }
  if (v15 == 33) {
    unsigned int v27 = 32;
  }
  else {
    unsigned int v27 = v15;
  }
  if (v27 <= 0x1F)
  {
    bzero(&a3[v21], 32 - v27);
    int v28 = 0;
    uint32x2_t v29 = (uint32x2_t)vdup_n_s32(31 - v27);
    int64x2_t v30 = (int64x2_t)v21;
    int64x2_t v31 = vdupq_n_s64(1uLL);
    do
    {
      int8x16_t v32 = (int8x16_t)v30;
      int64x2_t v30 = vaddq_s64(v30, v31);
      v28 += 2;
    }
    while (((33 - v27) & 0xFFFFFFFE) != v28);
    if (!v27) {
      return 0;
    }
    uint32x2_t v33 = vcgt_u32((uint32x2_t)vorr_s8((int8x8_t)vdup_n_s32(v28 - 2), (int8x8_t)0x100000000), v29);
    v34.i64[0] = v33.i32[0];
    v34.i64[1] = v33.i32[1];
    unsigned int v21 = vaddvq_s64((int64x2_t)vbslq_s8(v34, v32, (int8x16_t)v30));
  }
  unsigned int v35 = v19 + v26;
  uint64_t v36 = &a3[v21];
  uint64_t result = 0;
  do
  {
    char v37 = *(unsigned char *)(a1 + v35++);
    *v36++ = v37;
    --v27;
  }
  while (v27);
  return result;
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
  uint64_t v6 = v4 + 1;
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
          int v28 = &v5[-v23];
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
  uint64_t v6 = v4 + 1;
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
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, v4);
  if (!result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4[0];
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
  v8[3] = *MEMORY[0x263EF8340];
  memset(v8, 170, 24);
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
  v10[2] = *MEMORY[0x263EF8340];
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
  v12[3] = *MEMORY[0x263EF8340];
  memset(v12, 170, 24);
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
  uint64_t v34 = *MEMORY[0x263EF8340];
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
    uint32x2_t v29 = (char *)(a4 + a5);
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
  v4[3] = *MEMORY[0x263EF8340];
  memset(v4, 170, 24);
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
  v9[2] = *MEMORY[0x263EF8340];
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

void _T200UpdaterExecCommand_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_263E1A000, MEMORY[0x263EF8438], v0, "Firmware Update Failed with CommStatus = %d", v1, v2, v3, v4, v5);
}

void _T200UpdaterExecCommand_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_263E1A000, MEMORY[0x263EF8438], v0, "Config Update Failed with CommStatus = %d", v1, v2, v3, v4, v5);
}

void _T200UpdaterExecCommand_cold_3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_263E1A000, MEMORY[0x263EF8438], v0, "DNVD Update Failed with CommStatus = %d", v1, v2, v3, v4, v5);
}

void _T200UpdaterExecCommand_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_263E1A000, MEMORY[0x263EF8438], a3, "t200UpdaterData->targetUpdaterError = %d", a5, a6, a7, a8, 0);
}

void _T200UpdaterExecCommand_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _T200UpdaterExecCommand_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _T200UpdaterExecCommand_cold_8()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_263E1A000, MEMORY[0x263EF8438], v0, "targetUpdaterStatus = %d", v1, v2, v3, v4, v5);
}

void _T200UpdaterExecCommand_cold_9()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_263E1A000, MEMORY[0x263EF8438], v0, "CommStatus = %d", v1, v2, v3, v4, v5);
}

void _T200UpdaterExecCommand_cold_12(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _T200UpdaterExecCommand_cold_15(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _AMAuthInstallFinalize_cold_1()
{
  __assert_rtn("_AMAuthInstallFinalize", "T200Updater.c", 226, "type != NULL");
}

void _getInfoSMCIF_cold_1()
{
  __assert_rtn("_CFDictionarySetInteger32", "T200UpdaterPrivateHelper.h", 237, "num != NULL");
}

void _commitImageSMCIF_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _send_bin_retry_cold_1(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_263E1A000, MEMORY[0x263EF8438], v2, "failed to allocate memory", v3);
}

void _send_bin_retry_cold_2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_263E1A000, MEMORY[0x263EF8438], v2, "Data src is NULL", v3);
}

void _send_bin_retry_cold_4(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_263E1A000, MEMORY[0x263EF8438], v2, "Failed on BC__sendImage.", v3);
}

uint64_t AMSupportCopyFile()
{
  return MEMORY[0x270F979D0]();
}

uint64_t AMSupportCopyURLWithAppendedComponent()
{
  return MEMORY[0x270F979F8]();
}

uint64_t AMSupportCreateDataFromFileURL()
{
  return MEMORY[0x270F97A08]();
}

uint64_t AMSupportCreateDictionaryFromFileURL()
{
  return MEMORY[0x270F97A10]();
}

uint64_t AMSupportCreateURLFromString()
{
  return MEMORY[0x270F97A38]();
}

uint64_t AMSupportGetValueForKeyPathInDict()
{
  return MEMORY[0x270F97A90]();
}

uint64_t AMSupportLogInternal()
{
  return MEMORY[0x270F97AC0]();
}

uint64_t AMSupportMakeDirectory()
{
  return MEMORY[0x270F97AD0]();
}

uint64_t AMSupportPlatformCopyURLWithAppendedComponent()
{
  return MEMORY[0x270F97AD8]();
}

uint64_t AMSupportPlatformFileURLExists()
{
  return MEMORY[0x270F97AE0]();
}

uint64_t AMSupportWriteDataToFileURL()
{
  return MEMORY[0x270F97B50]();
}

uint64_t AMSupportWriteDictionarytoFileURL()
{
  return MEMORY[0x270F97B58]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _fprintf((FILE *)md, (const char *)c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _fread(c, v1, v2, v3);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  _free(c);
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x270EE4788](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4928](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x270EE4D10](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x270EE4D40](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x270EE50A0](alloc, theString, *(void *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50A8](alloc, data, *(void *)&encoding);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.length = v4;
  result.CFIndex location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5150](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F30](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x270EF49E8](*(void *)&mainPort, path);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

uint64_t Img4DecodeGetBooleanFromSection()
{
  return MEMORY[0x270F97C18]();
}

uint64_t Img4DecodeGetIntegerFromSection()
{
  return MEMORY[0x270F97C20]();
}

uint64_t Img4DecodeGetObjectPropertyData()
{
  return MEMORY[0x270F97C30]();
}

uint64_t Img4DecodeInitManifest()
{
  return MEMORY[0x270F97C70]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x270EE56F0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x270EE5700]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x270ED7E48]();
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

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

uint64_t ccdigest()
{
  return MEMORY[0x270ED8A40]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x270ED8A98]();
}

uint64_t ccec_raw_import_pub()
{
  return MEMORY[0x270ED8AE8]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x270ED8B08]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x270ED9AC0](a1, a2, *(void *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x270EDAA30]();
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x270EDAB58]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x270EDAFA0](a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

void rewind(FILE *a1)
{
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x270EDB508](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}