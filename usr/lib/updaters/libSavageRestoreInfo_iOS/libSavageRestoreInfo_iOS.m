void YonkersAddEntitlementsToTATSURequestDict(const __CFDictionary *a1, __CFDictionary *a2)
{
  CFBooleanRef Value;
  CFBooleanRef v5;
  CFTypeID v6;
  int v7;
  const void **v8;
  CFBooleanRef v9;
  CFBooleanRef v10;
  CFTypeID v11;
  int v12;
  const void **v13;
  CFBooleanRef v14;
  CFBooleanRef v15;
  CFTypeID v16;
  int v17;
  const void **v18;
  CFBooleanRef v19;
  CFBooleanRef v20;
  CFTypeID v21;
  int v22;
  const void **v23;
  CFBooleanRef v24;
  CFBooleanRef v25;
  CFTypeID v26;
  int v27;
  const void **v28;
  CFBooleanRef v29;
  CFBooleanRef v30;
  CFTypeID v31;
  int v32;
  const void **v33;
  CFBooleanRef v34;
  CFBooleanRef v35;
  CFTypeID v36;
  int v37;
  const void **v38;
  CFBooleanRef v39;
  CFBooleanRef v40;
  CFTypeID v41;
  int v42;
  const void **v43;
  CFBooleanRef v44;
  CFBooleanRef v45;
  CFTypeID v46;
  int v47;
  const void **v48;
  CFBooleanRef v49;
  CFBooleanRef v50;
  CFTypeID v51;
  int v52;
  const void **v53;
  CFBooleanRef v54;
  CFBooleanRef v55;
  CFTypeID v56;
  int v57;
  const void **v58;
  CFBooleanRef v59;
  CFBooleanRef v60;
  CFTypeID v61;
  int v62;
  const void **v63;
  CFBooleanRef v64;
  CFBooleanRef v65;
  CFTypeID v66;
  int v67;
  const void **v68;
  const void *v69;
  uint64_t vars8;

  Value = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,ReadECKey");
  if (Value)
  {
    v5 = Value;
    v6 = CFGetTypeID(Value);
    if (v6 == CFBooleanGetTypeID())
    {
      v7 = CFBooleanGetValue(v5);
      v8 = (const void **)MEMORY[0x263EFFB40];
      if (!v7) {
        v8 = (const void **)MEMORY[0x263EFFB38];
      }
      CFDictionaryAddValue(a2, @"Yonkers,ReadECKey", *v8);
    }
  }
  v9 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,WriteECKey");
  if (v9)
  {
    v10 = v9;
    v11 = CFGetTypeID(v9);
    if (v11 == CFBooleanGetTypeID())
    {
      v12 = CFBooleanGetValue(v10);
      v13 = (const void **)MEMORY[0x263EFFB40];
      if (!v12) {
        v13 = (const void **)MEMORY[0x263EFFB38];
      }
      CFDictionaryAddValue(a2, @"Yonkers,WriteECKey", *v13);
    }
  }
  v14 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,WriteECID");
  if (v14)
  {
    v15 = v14;
    v16 = CFGetTypeID(v14);
    if (v16 == CFBooleanGetTypeID())
    {
      v17 = CFBooleanGetValue(v15);
      v18 = (const void **)MEMORY[0x263EFFB40];
      if (!v17) {
        v18 = (const void **)MEMORY[0x263EFFB38];
      }
      CFDictionaryAddValue(a2, @"Yonkers,WriteECID", *v18);
    }
  }
  v19 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,WriteEpoch");
  if (v19)
  {
    v20 = v19;
    v21 = CFGetTypeID(v19);
    if (v21 == CFBooleanGetTypeID())
    {
      v22 = CFBooleanGetValue(v20);
      v23 = (const void **)MEMORY[0x263EFFB40];
      if (!v22) {
        v23 = (const void **)MEMORY[0x263EFFB38];
      }
      CFDictionaryAddValue(a2, @"Yonkers,WriteEpoch", *v23);
    }
  }
  v24 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,ReadGID");
  if (v24)
  {
    v25 = v24;
    v26 = CFGetTypeID(v24);
    if (v26 == CFBooleanGetTypeID())
    {
      v27 = CFBooleanGetValue(v25);
      v28 = (const void **)MEMORY[0x263EFFB40];
      if (!v27) {
        v28 = (const void **)MEMORY[0x263EFFB38];
      }
      CFDictionaryAddValue(a2, @"Yonkers,ReadGID", *v28);
    }
  }
  v29 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,ReadFWKey");
  if (v29)
  {
    v30 = v29;
    v31 = CFGetTypeID(v29);
    if (v31 == CFBooleanGetTypeID())
    {
      v32 = CFBooleanGetValue(v30);
      v33 = (const void **)MEMORY[0x263EFFB40];
      if (!v32) {
        v33 = (const void **)MEMORY[0x263EFFB38];
      }
      CFDictionaryAddValue(a2, @"Yonkers,ReadFWKey", *v33);
    }
  }
  v34 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,AllowOfflineBoot");
  if (v34)
  {
    v35 = v34;
    v36 = CFGetTypeID(v34);
    if (v36 == CFBooleanGetTypeID())
    {
      v37 = CFBooleanGetValue(v35);
      v38 = (const void **)MEMORY[0x263EFFB40];
      if (!v37) {
        v38 = (const void **)MEMORY[0x263EFFB38];
      }
      CFDictionaryAddValue(a2, @"Yonkers,AllowOfflineBoot", *v38);
    }
  }
  v39 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,TempDemote");
  if (v39)
  {
    v40 = v39;
    v41 = CFGetTypeID(v39);
    if (v41 == CFBooleanGetTypeID())
    {
      v42 = CFBooleanGetValue(v40);
      v43 = (const void **)MEMORY[0x263EFFB40];
      if (!v42) {
        v43 = (const void **)MEMORY[0x263EFFB38];
      }
      CFDictionaryAddValue(a2, @"Yonkers,TempDemote", *v43);
    }
  }
  v44 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,AccessSensor");
  if (v44)
  {
    v45 = v44;
    v46 = CFGetTypeID(v44);
    if (v46 == CFBooleanGetTypeID())
    {
      v47 = CFBooleanGetValue(v45);
      v48 = (const void **)MEMORY[0x263EFFB40];
      if (!v47) {
        v48 = (const void **)MEMORY[0x263EFFB38];
      }
      CFDictionaryAddValue(a2, @"Yonkers,AccessSensor", *v48);
    }
  }
  v49 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,AccessSecurity");
  if (v49)
  {
    v50 = v49;
    v51 = CFGetTypeID(v49);
    if (v51 == CFBooleanGetTypeID())
    {
      v52 = CFBooleanGetValue(v50);
      v53 = (const void **)MEMORY[0x263EFFB40];
      if (!v52) {
        v53 = (const void **)MEMORY[0x263EFFB38];
      }
      CFDictionaryAddValue(a2, @"Yonkers,AccessSecurity", *v53);
    }
  }
  v54 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,FADemote");
  if (v54)
  {
    v55 = v54;
    v56 = CFGetTypeID(v54);
    if (v56 == CFBooleanGetTypeID())
    {
      v57 = CFBooleanGetValue(v55);
      v58 = (const void **)MEMORY[0x263EFFB40];
      if (!v57) {
        v58 = (const void **)MEMORY[0x263EFFB38];
      }
      CFDictionaryAddValue(a2, @"Yonkers,FADemote", *v58);
    }
  }
  v59 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,DebugStatus");
  if (v59)
  {
    v60 = v59;
    v61 = CFGetTypeID(v59);
    if (v61 == CFBooleanGetTypeID())
    {
      v62 = CFBooleanGetValue(v60);
      v63 = (const void **)MEMORY[0x263EFFB40];
      if (!v62) {
        v63 = (const void **)MEMORY[0x263EFFB38];
      }
      CFDictionaryAddValue(a2, @"Yonkers,DebugStatus", *v63);
    }
  }
  v64 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,Provisioning");
  if (v64)
  {
    v65 = v64;
    v66 = CFGetTypeID(v64);
    if (v66 == CFBooleanGetTypeID())
    {
      v67 = CFBooleanGetValue(v65);
      v68 = (const void **)MEMORY[0x263EFFB40];
      if (!v67) {
        v68 = (const void **)MEMORY[0x263EFFB38];
      }
      v69 = *v68;
      CFDictionaryAddValue(a2, @"Yonkers,Provisioning", v69);
    }
  }
}

uint64_t CreateYonkersMeasurementDict(const __CFData *a1, CFTypeRef *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(_OWORD *)md = 0u;
  long long v18 = 0u;
  v8 = CFDictionaryCreateMutable(0, 0, v5, v6);
  v9 = 0;
  if (v8) {
    BOOL v10 = Mutable == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint64_t v11 = 2;
    if (a1 && a2)
    {
      unint64_t Length = CFDataGetLength(a1);
      v9 = (UInt8 *)calloc(Length, 1uLL);
      if (v9)
      {
        v20.location = 0;
        v20.length = Length;
        CFDataGetBytes(a1, v20, v9);
        if (!(Length >> 20))
        {
          CC_SHA256_Init(&c);
          CC_SHA256_Update(&c, v9, Length);
          CC_SHA256_Final(md, &c);
        }
        CFDataRef v13 = CFDataCreate(v4, md, 32);
        if (v13)
        {
          CFDataRef v14 = v13;
          CFDictionarySetValue(Mutable, @"Digest", v13);
          CFDictionarySetValue(v8, @"MeasurementDictPatch", Mutable);
          *a2 = SavageSafeRetain(v8);
          CFRelease(v14);
          uint64_t v11 = 0;
        }
        else
        {
          uint64_t v11 = 8;
        }
      }
      else
      {
        uint64_t v11 = 3;
      }
    }
    goto LABEL_12;
  }
  uint64_t v11 = 3;
  if (Mutable) {
LABEL_12:
  }
    CFRelease(Mutable);
  if (v8) {
    CFRelease(v8);
  }
  if (v9) {
    free(v9);
  }
  return v11;
}

uint64_t CreateYonkersRequestDictForTATSU(const __CFDictionary *a1, const __CFDictionary *a2, CFDictionaryRef theDict, uint64_t a4, CFTypeRef *a5)
{
  CFMutableDictionaryRef Mutable = 0;
  CFTypeRef v74 = 0;
  key = 0;
  int valuePtr = 0;
  uint64_t v6 = 2;
  if (!a1 || !a2 || !theDict || !a4)
  {
    BOOL v10 = 0;
    goto LABEL_66;
  }
  BOOL v10 = 0;
  if (!a5) {
    goto LABEL_66;
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"MeasurementDictPatch");
  uint64_t v11 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  v12 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDataRef v13 = CFDictionaryCreateMutable(0, 0, v11, v12);
  BOOL v10 = v13;
  uint64_t v6 = 3;
  if (!v13 || !Mutable || !Value) {
    goto LABEL_66;
  }
  uint64_t v14 = *MEMORY[0x263EFFB40];
  CFDictionaryAddValue(v13, @"@Yonkers,Ticket", (const void *)*MEMORY[0x263EFFB40]);
  v15 = CFDictionaryGetValue(a2, @"Yonkers,BoardID");
  if (!v15) {
    goto LABEL_77;
  }
  v16 = v15;
  CFTypeID v17 = CFGetTypeID(v15);
  if (v17 != CFNumberGetTypeID()) {
    goto LABEL_77;
  }
  CFDictionaryAddValue(v10, @"Yonkers,BoardID", v16);
  long long v18 = CFDictionaryGetValue(a2, @"Yonkers,PatchEpoch");
  if (!v18) {
    goto LABEL_77;
  }
  uint64_t v19 = v18;
  CFTypeID v20 = CFGetTypeID(v18);
  if (v20 != CFNumberGetTypeID()) {
    goto LABEL_77;
  }
  CFDictionaryAddValue(v10, @"Yonkers,PatchEpoch", v19);
  v21 = CFDictionaryGetValue(a1, @"Yonkers,ChipID");
  if (!v21) {
    goto LABEL_77;
  }
  v22 = v21;
  CFTypeID v23 = CFGetTypeID(v21);
  if (v23 != CFNumberGetTypeID()) {
    goto LABEL_77;
  }
  CFDictionaryAddValue(v10, @"Yonkers,ChipID", v22);
  CFNumberGetValue((CFNumberRef)v22, kCFNumberSInt32Type, &valuePtr);
  CFBooleanRef v24 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,ProductionMode");
  if (!v24) {
    goto LABEL_77;
  }
  CFBooleanRef v25 = v24;
  CFTypeID v26 = CFGetTypeID(v24);
  if (v26 != CFBooleanGetTypeID()) {
    goto LABEL_77;
  }
  int v71 = CFBooleanGetValue(v25);
  v27 = (const void *)(v71 ? v14 : *MEMORY[0x263EFFB38]);
  CFDictionaryAddValue(v10, @"Yonkers,ProductionMode", v27);
  CFBooleanRef v28 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"YonkersIsProvisioned");
  if (v28 && (CFBooleanRef v29 = v28, v30 = CFGetTypeID(v28), v30 == CFBooleanGetTypeID())) {
    int v31 = CFBooleanGetValue(v29);
  }
  else {
    int v31 = 1;
  }
  CFBooleanRef v32 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"YonkersIsYmgt");
  if (v32 && (CFBooleanRef v33 = v32, v34 = CFGetTypeID(v32), v34 == CFBooleanGetTypeID())) {
    int v67 = CFBooleanGetValue(v33);
  }
  else {
    int v67 = 0;
  }
  CFBooleanRef v35 = (const __CFBoolean *)CFDictionaryGetValue(a1, @"Yonkers,WriteECID");
  if (v35 && (CFBooleanRef v36 = v35, v37 = CFGetTypeID(v35), v37 == CFBooleanGetTypeID())) {
    int v38 = CFBooleanGetValue(v36);
  }
  else {
    int v38 = 0;
  }
  v39 = CFDictionaryGetValue(a1, @"Yonkers,ECID");
  if (!v39) {
    goto LABEL_77;
  }
  v40 = v39;
  CFTypeID v41 = CFGetTypeID(v39);
  if (v41 != CFDataGetTypeID()) {
    goto LABEL_77;
  }
  CFDictionaryAddValue(v10, @"Yonkers,ECID", v40);
  v42 = CFDictionaryGetValue(a1, @"Yonkers,Nonce");
  if (!v42) {
    goto LABEL_77;
  }
  v43 = v42;
  CFTypeID v44 = CFGetTypeID(v42);
  if (v44 != CFDataGetTypeID()) {
    goto LABEL_77;
  }
  CFDictionaryAddValue(v10, @"Yonkers,Nonce", v43);
  int YonkersMeasurementTags = GetYonkersMeasurementTags(a1, (CFTypeRef *)&key, &v74);
  v46 = key;
  uint64_t v6 = 17;
  if (!YonkersMeasurementTags && key)
  {
    v47 = CFDictionaryGetValue(theDict, @"MeasurementDictPatch");
    v48 = (__CFDictionary *)SavageSafeRetain(v47);
    if (!v48)
    {
LABEL_66:
      v46 = key;
      goto LABEL_67;
    }
    v49 = v48;
    CFTypeID v50 = CFGetTypeID(v48);
    if (v50 == CFDictionaryGetTypeID())
    {
      v68 = a5;
      v69 = Mutable;
      CFDictionaryAddValue(v49, @"EPRO", v27);
      v51 = CFDictionaryGetValue(a1, @"Yonkers,FabRevision");
      CFDictionaryAddValue(v49, @"FabRevision", v51);
      CFDictionaryAddValue(v10, key, v49);
      CFRelease(v49);
      if (!(v31 | v38))
      {
        CFDictionaryRemoveValue(v10, key);
        if (valuePtr == 1300)
        {
          uint64_t v59 = 4 * (v67 != 0);
          CFAllocatorRef v60 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          if (v67) {
            unint64_t v61 = 8;
          }
          else {
            unint64_t v61 = 4;
          }
          while (1)
          {
            int v62 = dword_221616D58[v59];
            if (GetYonkersFabRevisionTags(v62, v71, (CFTypeRef *)&key, 0) || key == 0) {
              goto LABEL_74;
            }
            CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(v60, 0, Value);
            if (!MutableCopy) {
              goto LABEL_74;
            }
            v49 = MutableCopy;
            CFTypeID v65 = CFGetTypeID(MutableCopy);
            if (v65 != CFDictionaryGetTypeID())
            {
LABEL_75:
              CFMutableDictionaryRef Mutable = v69;
              goto LABEL_76;
            }
            CFDictionarySetValue(v49, @"EPRO", v27);
            SavageCFDictionarySetInteger32(v49, @"FabRevision", v62);
            CFDictionarySetValue(v10, key, v49);
            CFRelease(v49);
            if (++v59 >= v61) {
              goto LABEL_64;
            }
          }
        }
        if (valuePtr == 1044)
        {
          uint64_t v52 = 4 * (v67 != 0);
          CFAllocatorRef v53 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
          if (v67) {
            unint64_t v54 = 6;
          }
          else {
            unint64_t v54 = 4;
          }
          while (1)
          {
            int v55 = dword_221616D40[v52];
            if (GetYonkersFabRevisionTags(v55, v71, (CFTypeRef *)&key, 0) || key == 0) {
              break;
            }
            CFMutableDictionaryRef v57 = CFDictionaryCreateMutableCopy(v53, 0, Value);
            if (!v57) {
              break;
            }
            v49 = v57;
            CFTypeID v58 = CFGetTypeID(v57);
            if (v58 != CFDictionaryGetTypeID()) {
              goto LABEL_75;
            }
            CFDictionarySetValue(v49, @"EPRO", v27);
            SavageCFDictionarySetInteger32(v49, @"FabRevision", v55);
            CFDictionarySetValue(v10, key, v49);
            CFRelease(v49);
            if (++v52 >= v54) {
              goto LABEL_64;
            }
          }
LABEL_74:
          uint64_t v6 = 17;
          goto LABEL_65;
        }
      }
LABEL_64:
      YonkersAddEntitlementsToTATSURequestDict(a1, v10);
      uint64_t v6 = 0;
      CFTypeRef *v68 = SavageSafeRetain(v10);
LABEL_65:
      CFMutableDictionaryRef Mutable = v69;
      goto LABEL_66;
    }
LABEL_76:
    CFRelease(v49);
LABEL_77:
    uint64_t v6 = 17;
    goto LABEL_66;
  }
LABEL_67:
  if (v46)
  {
    CFRelease(v46);
    key = 0;
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v10) {
    CFRelease(v10);
  }
  return v6;
}

CFDataRef SavageUpdaterCreateLocalCertificateSignature(CFDictionaryRef theDict, CFTypeRef *a2)
{
  CFDictionaryRef v2 = theDict;
  size_t v39 = 0;
  v40 = 0;
  long long v38 = xmmword_2645BA5D0;
  if (!theDict)
  {
    BOOL v35 = 0;
    goto LABEL_43;
  }
  CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"Savage,WriteUID");
  if (Value && (v5 = Value, CFTypeID v6 = CFGetTypeID(Value), v6 == CFBooleanGetTypeID()) && CFBooleanGetValue(v5))
  {
    puts("Local Signing - Handling fusing option.");
    v7 = &kSavageProvisioningFirmwareCert;
  }
  else
  {
    v7 = &kSavageSecureBootFirmwareCert;
  }
  CFBooleanRef v8 = (const __CFBoolean *)CFDictionaryGetValue(v2, @"Savage,ReadGID");
  if (v8)
  {
    CFBooleanRef v9 = v8;
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFBooleanGetTypeID())
    {
      if (CFBooleanGetValue(v9))
      {
        puts("Local Signing - Handling cert option.");
        v7 = &kSavageGidHmacFirmwareCert;
      }
    }
  }
  CFDataRef v11 = (const __CFData *)CFDictionaryGetValue(v2, @"Savage,Nonce");
  CFDataRef v12 = v11;
  if (!v11) {
    goto LABEL_44;
  }
  CFTypeID v13 = CFGetTypeID(v11);
  if (v13 != CFDataGetTypeID()) {
    goto LABEL_42;
  }
  v41.location = 0;
  v41.length = 16;
  CFDataGetBytes(v12, v41, (UInt8 *)v7 + 65);
  CFDataRef v14 = (const __CFData *)CFDictionaryGetValue(v2, @"Savage,ProductionMode");
  CFDataRef v12 = v14;
  if (!v14) {
    goto LABEL_44;
  }
  CFTypeID v15 = CFGetTypeID(v14);
  if (v15 != CFBooleanGetTypeID())
  {
LABEL_42:
    BOOL v35 = 0;
    CFDictionaryRef v2 = 0;
LABEL_43:
    CFDataRef v34 = 0;
    CFDataRef v12 = 0;
    goto LABEL_35;
  }
  *((unsigned char *)v7 + 25) = CFBooleanGetValue(v12) != 0;
  if (CFBooleanGetValue(v12))
  {
    CFDataRef v12 = (const __CFData *)CFDictionaryGetValue(v2, @"Savage,B0-Prod-Patch");
    if (v12) {
      goto LABEL_21;
    }
    v16 = &kSavageTagMeasurementB2ProdPatch;
  }
  else
  {
    CFDataRef v12 = (const __CFData *)CFDictionaryGetValue(v2, @"Savage,B0-Dev-Patch");
    if (v12) {
      goto LABEL_21;
    }
    v16 = &kSavageTagMeasurementB2DevPatch;
  }
  CFDataRef v12 = (const __CFData *)CFDictionaryGetValue(v2, *v16);
  if (!v12) {
    goto LABEL_44;
  }
LABEL_21:
  CFTypeID v17 = CFGetTypeID(v12);
  if (v17 != CFDictionaryGetTypeID()) {
    goto LABEL_42;
  }
  CFDataRef v18 = (const __CFData *)CFDictionaryGetValue(v12, @"Digest");
  CFDataRef v12 = v18;
  if (!v18) {
    goto LABEL_44;
  }
  CFTypeID v19 = CFGetTypeID(v18);
  if (v19 != CFDataGetTypeID() || CFDataGetLength(v12) != 32) {
    goto LABEL_42;
  }
  v42.length = CFDataGetLength(v12);
  v42.location = 0;
  CFDataGetBytes(v12, v42, (UInt8 *)v7 + 31);
  CFDataRef v20 = (const __CFData *)CFDictionaryGetValue(v2, @"Savage,ChipID");
  CFDataRef v12 = v20;
  if (!v20) {
    goto LABEL_44;
  }
  CFTypeID v21 = CFGetTypeID(v20);
  if (v21 != CFNumberGetTypeID() || !CFNumberGetValue(v12, kCFNumberSInt8Type, (char *)v7 + 4)) {
    goto LABEL_42;
  }
  CFDataRef v22 = (const __CFData *)CFDictionaryGetValue(v2, @"Savage,UID");
  CFDataRef v12 = v22;
  if (!v22)
  {
LABEL_44:
    BOOL v35 = 0;
    CFDictionaryRef v2 = 0;
    CFDataRef v34 = 0;
    goto LABEL_35;
  }
  CFTypeID v23 = CFGetTypeID(v22);
  if (v23 != CFDataGetTypeID()) {
    goto LABEL_42;
  }
  v43.location = 0;
  v43.length = 16;
  CFDataGetBytes(v12, v43, (UInt8 *)v7 + 7);
  CFDataRef v12 = 0;
  if (_createDataSignature(0, v7, 0x73uLL, &v40, &v39, &v38))
  {
    CFBooleanRef v24 = "failed to Img4EncodeCreateManifest";
  }
  else
  {
    CFBooleanRef v24 = "manifest is null or zero manifesetLen";
    if (v40 && v39)
    {
      size_t v25 = v39 + kSavageSignedLeafCertificate_len + 115;
      printf("Result of creating signature: outDataLen = %d, leafCertLen = %d, certLen = %d, manifestLen = %d \n", v39 + kSavageSignedLeafCertificate_len + 115, kSavageSignedLeafCertificate_len, 115, v39);
      CFDataRef v12 = (const __CFData *)calloc(1uLL, v25);
      memcpy(v12, &kSavageSignedLeafCertificate, kSavageSignedLeafCertificate_len);
      CFTypeID v26 = (char *)v12 + kSavageSignedLeafCertificate_len;
      long long v27 = v7[3];
      long long v29 = *v7;
      long long v28 = v7[1];
      *((_OWORD *)v26 + 2) = v7[2];
      *((_OWORD *)v26 + 3) = v27;
      *(_OWORD *)CFTypeID v26 = v29;
      *((_OWORD *)v26 + 1) = v28;
      long long v31 = v7[5];
      long long v30 = v7[6];
      long long v32 = v7[4];
      *(_DWORD *)(v26 + 111) = *(_DWORD *)((char *)v7 + 111);
      *((_OWORD *)v26 + 5) = v31;
      *((_OWORD *)v26 + 6) = v30;
      *((_OWORD *)v26 + 4) = v32;
      memcpy(v26 + 115, v40, v39);
      CFDataRef v33 = CFDataCreate(0, (const UInt8 *)v12, v25);
      if (v33)
      {
        CFDataRef v34 = v33;
        BOOL v35 = 0;
        CFDictionaryRef v2 = 0;
        goto LABEL_35;
      }
      CFBooleanRef v24 = "failed to CFDataCreate for manifest data";
    }
  }
  CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v24, 0xEu, (uint64_t)v2, @"SavageErrorDomain");
  CFDictionaryRef v2 = CFErrorWithDomain;
  CFDataRef v34 = 0;
  BOOL v35 = CFErrorWithDomain != 0;
  if (a2 && CFErrorWithDomain)
  {
    CFDataRef v34 = 0;
    *a2 = SavageSafeRetain(CFErrorWithDomain);
    BOOL v35 = 1;
  }
LABEL_35:
  if (v40)
  {
    free(v40);
    v40 = 0;
  }
  if (v12) {
    free(v12);
  }
  if (v35) {
    CFRelease(v2);
  }
  return v34;
}

uint64_t _computeDigestSHA256(const void *a1, unint64_t a2, unsigned __int8 *a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a3)
  {
    CC_LONG v6 = a2;
    if (a2 < 0x100000)
    {
      memset(&c, 0, sizeof(c));
      CC_SHA256_Init(&c);
      CC_SHA256_Update(&c, a1, v6);
      return CC_SHA256_Final(a3, &c);
    }
    else
    {
      printf("Computing signature for buffer %p whose size 0x%08zx is too large.  Failing. \n", a1, a2);
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

void _loadAndMeasureFile(const char *a1, unsigned __int8 *a2, CFDataRef *a3)
{
  CFBooleanRef v5 = fopen(a1, "rb");
  if (v5)
  {
    CC_LONG v6 = v5;
    fseeko(v5, 0, 2);
    off_t v7 = ftello(v6);
    fseeko(v6, 0, 0);
    if (v7 >= 0x100000)
    {
      puts("Input firmware file too large.  Failing. ");
    }
    else
    {
      CFBooleanRef v8 = calloc(v7, 1uLL);
      if (v8)
      {
        CFBooleanRef v9 = v8;
        size_t v10 = fread(v8, 1uLL, v7, v6);
        fclose(v6);
        if (v10 == v7)
        {
          _computeDigestSHA256(v9, v7, a2);
          if (a3) {
            *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB18], (const UInt8 *)v9, v7);
          }
        }
        else
        {
          puts("Could not read Savage firmware patch file");
        }
        free(v9);
      }
      else
      {
        puts("Could not allocate Savage firmware buffer");
        fclose(v6);
      }
    }
  }
  else
  {
    perror("Error opening Savage firmware patch file \n");
  }
}

void _loadAndMeasureVTFile(const char *a1, unsigned __int8 *a2, CFDataRef *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  CFBooleanRef v5 = fopen(a1, "rb");
  if (v5)
  {
    CC_LONG v6 = v5;
    fseeko(v5, 0, 2);
    int64_t v7 = ftello(v6);
    if (v7 < 0x100000 && (size_t v8 = v7, (v9 = (char *)calloc(v7, 1uLL)) != 0))
    {
      size_t v10 = v9;
      fseeko(v6, 0, 0);
      size_t v11 = fread(v10, 1uLL, v8, v6);
      fclose(v6);
      if (v11 == v8)
      {
        uint64_t v12 = 0;
        CFTypeID v13 = v10;
        CFDataRef v14 = (unint64_t *)&qword_221616EC0;
        do
        {
          unint64_t v15 = *v14++;
          _computeDigestSHA256(v13, v15, &v16[v12]);
          v13 += v15;
          v12 += 32;
        }
        while (v12 != 224);
        _computeDigestSHA256(v16, 0xE0uLL, a2);
        if (a3) {
          *a3 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB18], (const UInt8 *)v10, v8);
        }
      }
      fclose(v6);
      free(v10);
    }
    else
    {
      fclose(v6);
    }
  }
}

uint64_t _createDataSignature(uint64_t a1, const void *a2, unint64_t a3, void *a4, size_t *a5, void *a6)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  memset(v21, 0, sizeof(v21));
  uint64_t v11 = MEMORY[0x223C85D70]();
  size_t v12 = (((unint64_t)(cczp_bitlen() + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) + 9;
  size_t v20 = v12;
  MEMORY[0x270FA5388]();
  CFDataRef v14 = (uint64_t *)((char *)&v19 - v13);
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v15 = 0xFFFFFFFFLL;
  if (!a4) {
    return v15;
  }
  if (!a5) {
    return v15;
  }
  uint64_t v15 = 0xFFFFFFFFLL;
  if (!a2 || !a3) {
    return v15;
  }
  if (!*a6 || !a6[1]) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v15 = _computeDigestSHA256(a2, a3, (unsigned __int8 *)v21);
  *CFDataRef v14 = v11;
  if (!ccec_der_import_priv())
  {
    v16 = calloc(1uLL, v12);
    if (v16)
    {
      uint64_t v17 = v16;
      ccDRBGGetRngState();
      if (!ccec_sign())
      {
        *a4 = v17;
        *a5 = v20;
        printf("Result of creating signature: %d \n", v15);
        return 0;
      }
    }
  }
  return v15;
}

__CFDictionary *SavageUpdaterGetTagsWithLogging(const __CFDictionary *a1, uint64_t (*a2)(void, void), uint64_t a3, CFTypeRef *a4)
{
  logSinkFunCC_SHA256_CTX c = a2;
  logContext = a3;
  return SavageUpdaterGetTags(a1, a4);
}

__CFDictionary *SavageUpdaterGetTags(const __CFDictionary *a1, CFTypeRef *a2)
{
  v40 = 0;
  CFRange v41 = 0;
  long long v38 = 0;
  value = 0;
  *(_DWORD *)buffer = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  if (!Mutable)
  {
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterGetTags: Cannot allocate memory for outputDict", 3u, 0, @"SavageErrorDomain");
    CFTypeRef v15 = 0;
    CC_LONG v6 = 0;
    goto LABEL_50;
  }
  if (a1)
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CC_LONG v6 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF70]);
    if (v6)
    {
      int64_t v7 = CFArrayCreateMutable(v5, 0, MEMORY[0x263EFFF70]);
      if (v7)
      {
        size_t v8 = CFDictionaryGetValue(a1, @"DeviceInfo");
        if (v8)
        {
          CFBooleanRef v9 = v8;
          CFTypeID v10 = CFGetTypeID(v8);
          if (v10 == CFDictionaryGetTypeID())
          {
            CFStringRef v11 = CFCopyDescription(v9);
            if (v11)
            {
              CFStringRef v12 = v11;
              if (CFStringGetCString(v11, logString, 4096, 0)) {
                uint64_t v13 = logString;
              }
              else {
                uint64_t v13 = "No C string description available.";
              }
              SavageRestoreInfoLog("%s [input]: DeviceInfo %s \n", "SavageUpdaterGetTags", v13);
              CFRelease(v12);
            }
            else
            {
              SavageRestoreInfoLog("%s [input]: DeviceInfo %s \n", "SavageUpdaterGetTags", "No C string description available.");
            }
            a1 = (const __CFDictionary *)SavageSafeRetain(v9);
            CFDataRef v14 = CFDictionaryGetValue(a1, @"YonkersDeviceInfo");
            CFTypeRef v15 = v14;
            if (v14)
            {
              CFTypeID v16 = CFGetTypeID(v14);
              if (v16 == CFDictionaryGetTypeID())
              {
                CFTypeRef v15 = SavageSafeRetain(v15);
                unsigned int YonkersMeasurementTags = GetYonkersMeasurementTags((CFDictionaryRef)v15, (CFTypeRef *)&value, (CFTypeRef *)&v38);
                if (YonkersMeasurementTags || !value)
                {
                  CFStringRef v30 = @"YonkersErrorDomain";
                  long long v31 = "SavageUpdaterGetTags: Unable to get kYonkersTagMeasurementPatch";
                  uint64_t v32 = (uint64_t)v15;
LABEL_57:
                  CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v31, YonkersMeasurementTags, v32, v30);
                  goto LABEL_58;
                }
                CFArrayAppendValue(v6, @"SEP");
                CFArrayAppendValue(v6, @"Yonkers,BoardID");
                CFArrayAppendValue(v6, @"Yonkers,ChipID");
                CFArrayAppendValue(v6, @"Yonkers,PatchEpoch");
                CFArrayAppendValue(v6, value);
                CFArrayAppendValue(v6, v38);
                CFArrayAppendValue(v7, @"Yonkers,Ticket");
                if (v15 && CFDictionaryGetCount(a1) == 1)
                {
LABEL_30:
                  CFDictionaryAddValue(Mutable, @"BuildIdentityTags", v6);
                  CFDictionaryAddValue(Mutable, @"ResponseTags", v7);
                  CFStringRef v22 = CFCopyDescription(Mutable);
                  if (v22)
                  {
                    CFStringRef v23 = v22;
                    if (CFStringGetCString(v22, logString, 4096, 0)) {
                      CFBooleanRef v24 = logString;
                    }
                    else {
                      CFBooleanRef v24 = "No C string description available.";
                    }
                    SavageRestoreInfoLog("%s [output]: %s \n", "SavageUpdaterGetTags", v24);
                    CFRelease(v23);
                  }
                  else
                  {
                    SavageRestoreInfoLog("%s [output]: %s \n", "SavageUpdaterGetTags", "No C string description available.");
                  }
                  goto LABEL_36;
                }
              }
              else
              {
                CFTypeRef v15 = 0;
              }
            }
            unsigned int YonkersMeasurementTags = GetRelevantMeasurementTags(a1, (__CFString **)&v41, (__CFString **)&v40);
            if (v41)
            {
              if (v40)
              {
                CFArrayAppendValue(v6, @"Savage,ChipID");
                CFArrayAppendValue(v6, @"Savage,PatchEpoch");
                CFArrayAppendValue(v6, v41);
                CFArrayAppendValue(v6, v40);
                CFDataRef v18 = (const __CFData *)CFDictionaryGetValue(a1, @"Savage,ChipID");
                if (v18)
                {
                  CFDataRef v19 = v18;
                  CFTypeID v20 = CFGetTypeID(v18);
                  CFTypeID v21 = @"Savage,Ticket";
                  if (v20 == CFDataGetTypeID())
                  {
                    v42.location = 0;
                    v42.length = 4;
                    CFDataGetBytes(v19, v42, buffer);
                    *(_DWORD *)buffer = bswap32(*(unsigned int *)buffer);
                    if (*(_DWORD *)buffer > 0x5064u) {
                      CFTypeID v21 = @"Brunor,Ticket";
                    }
                  }
                }
                else
                {
                  CFTypeID v21 = @"Savage,Ticket";
                }
                CFArrayAppendValue(v7, v21);
                goto LABEL_30;
              }
              CFStringRef v30 = @"SavageErrorDomain";
              long long v31 = "SavageUpdaterGetTags: Unable to get kSavageTagMeasurementPatchRepair";
            }
            else
            {
              CFStringRef v30 = @"SavageErrorDomain";
              long long v31 = "SavageUpdaterGetTags: Unable to get kSavageTagMeasurementPatch";
            }
            uint64_t v32 = (uint64_t)a1;
            goto LABEL_57;
          }
        }
        CFTypeID v26 = "SavageUpdaterGetTags: DeviceInfo is NULL?";
        unsigned int v27 = 17;
        uint64_t v28 = (uint64_t)a1;
      }
      else
      {
        CFTypeID v26 = "SavageUpdaterGetTags: Cannot allocate memory for tagsInTssResponse";
        unsigned int v27 = 3;
        uint64_t v28 = 0;
      }
      CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v26, v27, v28, @"SavageErrorDomain");
      CFTypeRef v15 = 0;
      goto LABEL_53;
    }
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterGetTags: Cannot allocate memory for tagsInBI", 3u, 0, @"SavageErrorDomain");
    CFTypeRef v15 = 0;
LABEL_50:
    int64_t v7 = 0;
LABEL_53:
    a1 = 0;
    goto LABEL_58;
  }
  CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterGetTags: options is NULL", 2u, 0, @"SavageErrorDomain");
  CFTypeRef v15 = 0;
  CC_LONG v6 = 0;
  int64_t v7 = 0;
LABEL_58:
  if (a2 && CFErrorWithDomain)
  {
    *a2 = SavageSafeRetain(CFErrorWithDomain);
    CFStringRef v33 = CFErrorCopyDescription(CFErrorWithDomain);
    if (v33)
    {
      CFStringRef v34 = v33;
      int CString = CFStringGetCString(v33, logString, 4096, 0);
      CFBooleanRef v36 = "No C string description available.";
      if (CString) {
        CFBooleanRef v36 = logString;
      }
      SavageRestoreInfoLog("%s [error]: %s \n", "SavageUpdaterGetTags", v36);
      CFRelease(v34);
    }
    else
    {
      SavageRestoreInfoLog("%s [error]: %s \n", "SavageUpdaterGetTags", "No C string description available.");
    }
    if (Mutable)
    {
      CFRelease(Mutable);
      CFMutableDictionaryRef Mutable = 0;
    }
    goto LABEL_69;
  }
  if (CFErrorWithDomain) {
LABEL_69:
  }
    CFRelease(CFErrorWithDomain);
  if (v7) {
LABEL_36:
  }
    CFRelease(v7);
  if (v6) {
    CFRelease(v6);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (a1) {
    CFRelease(a1);
  }
  if (value) {
    CFRelease(value);
  }
  return Mutable;
}

__CFData *SavageUpdaterCopyFirmwareWithLogging(const __CFDictionary *a1, uint64_t (*a2)(void, void), uint64_t a3, CFTypeRef *a4)
{
  logSinkFunCC_SHA256_CTX c = a2;
  logContext = a3;
  return SavageUpdaterCopyFirmware(a1, a4);
}

__CFData *SavageUpdaterCopyFirmware(const __CFDictionary *a1, CFTypeRef *a2)
{
  *(void *)bytes = 0;
  CFTypeRef v52 = 0;
  CFTypeRef cf = 0;
  CFTypeID v50 = 0;
  v51 = 0;
  uint64_t v48 = 0;
  CFErrorRef err = 0;
  if (!a1)
  {
    v40 = "SavageUpdaterCopyFirmware: options is NULL";
    uint64_t v41 = 0;
    goto LABEL_81;
  }
  CFBooleanRef Value = CFDictionaryGetValue(a1, @"DeviceInfo");
  if (!Value || (CFAllocatorRef v4 = Value, v5 = CFGetTypeID(Value), v5 != CFDictionaryGetTypeID()))
  {
    v40 = "SavageUpdaterCopyFirmware: Missing device info";
    uint64_t v41 = (uint64_t)a1;
LABEL_81:
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v40, 2u, v41, @"SavageErrorDomain");
    CFTypeID v20 = 0;
    CFDataRef v12 = 0;
    CFDataRef v18 = 0;
    CFDictionaryRef v10 = 0;
    CFTypeID v21 = 0;
    CFDataRef v22 = 0;
    CFDataRef v23 = 0;
    CFDictionaryRef v14 = 0;
    goto LABEL_98;
  }
  CFStringRef v6 = CFCopyDescription(v4);
  if (v6)
  {
    CFStringRef v7 = v6;
    int CString = CFStringGetCString(v6, logString, 4096, 0);
    CFBooleanRef v9 = "No C string description available.";
    if (CString) {
      CFBooleanRef v9 = logString;
    }
    SavageRestoreInfoLog("%s [input]: DeviceInfo %s \n", "SavageUpdaterCopyFirmware", v9);
    CFRelease(v7);
  }
  else
  {
    SavageRestoreInfoLog("%s [input]: DeviceInfo %s \n", "SavageUpdaterCopyFirmware", "No C string description available.");
  }
  CFDictionaryRef v10 = (const __CFDictionary *)SavageSafeRetain(v4);
  CFDataRef v11 = (const __CFData *)CFDictionaryGetValue(v10, @"YonkersDeviceInfo");
  CFDataRef v12 = v11;
  if (!v11)
  {
    CFDictionaryRef v14 = 0;
    CFDataRef v18 = 0;
LABEL_24:
    CFTypeID v20 = 0;
    goto LABEL_25;
  }
  CFTypeID v13 = CFGetTypeID(v11);
  if (v13 != CFDictionaryGetTypeID())
  {
    CFDictionaryRef v14 = 0;
    CFDataRef v18 = 0;
    CFDataRef v12 = 0;
    goto LABEL_24;
  }
  CFDictionaryRef v14 = (const __CFDictionary *)SavageSafeRetain(v12);
  unsigned int YonkersMeasurementTags = GetYonkersMeasurementTags(v14, &cf, &v52);
  if (YonkersMeasurementTags)
  {
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCopyFirmware: Didn't get yonkers patch measurement tags", YonkersMeasurementTags, (uint64_t)v14, @"YonkersErrorDomain");
    CFTypeID v20 = 0;
    CFDataRef v12 = 0;
    goto LABEL_89;
  }
  CFDataRef FileData = (const __CFData *)CreateFileData(a1, (const __CFString *)cf, (CFTypeRef *)&err);
  CFDataRef v12 = FileData;
  if (err)
  {
    CFTypeID v20 = 0;
    CFDataRef v18 = 0;
LABEL_92:
    CFTypeID v21 = 0;
    CFDataRef v22 = 0;
    goto LABEL_93;
  }
  if (!FileData || !CFDataGetLength(FileData))
  {
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCopyFirmware: Empty Yonkers firmware file?", 4u, (uint64_t)a1, @"YonkersErrorDomain");
    CFTypeID v20 = 0;
LABEL_89:
    CFDataRef v18 = 0;
    goto LABEL_96;
  }
  CFDataRef v17 = (const __CFData *)CreateFileData(a1, (const __CFString *)v52, (CFTypeRef *)&err);
  CFDataRef v18 = v17;
  if (err)
  {
    CFTypeID v20 = 0;
    goto LABEL_92;
  }
  if (!v17 || !CFDataGetLength(v17))
  {
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCopyFirmware: Empty Yonkers alt firmware file?", 4u, (uint64_t)a1, @"YonkersErrorDomain");
    CFTypeID v20 = 0;
LABEL_96:
    CFTypeID v21 = 0;
    CFDataRef v22 = 0;
    goto LABEL_97;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFTypeID v20 = Mutable;
  if (!Mutable)
  {
    CFTypeID v44 = "SavageUpdaterCopyFirmware: Cannot allocate memory for outputDict";
    unsigned int v43 = 3;
    uint64_t v45 = (uint64_t)a1;
LABEL_95:
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v44, v43, v45, @"SavageErrorDomain");
    goto LABEL_96;
  }
  CFDictionaryAddValue(Mutable, @"YonkersFirmware", v12);
  CFDictionaryAddValue(v20, @"YonkersFirmwareAlt", v18);
  if (!v14 || CFDictionaryGetCount(v10) != 1)
  {
LABEL_25:
    unsigned int RelevantMeasurementTags = GetRelevantMeasurementTags(v10, &v51, &v50);
    if (!RelevantMeasurementTags)
    {
      CFDataRef v25 = (const __CFData *)CreateFileData(a1, v51, (CFTypeRef *)&err);
      CFDataRef v22 = v25;
      if (!err)
      {
        if (v25 && CFDataGetLength(v25))
        {
          CFDataRef v23 = (const __CFData *)CreateFileData(a1, v50, (CFTypeRef *)&err);
          if (err && CFErrorGetCode(err) == 19)
          {
            CFTypeID v21 = 0;
            goto LABEL_48;
          }
          CFTypeID v21 = CFDataCreateMutable(0, 0);
          if (v21)
          {
            *(_DWORD *)&bytes[4] = CFDataGetLength(v22);
            CFDataAppendBytes(v21, bytes, 16);
            BytePtr = CFDataGetBytePtr(v22);
            CFIndex Length = CFDataGetLength(v22);
            CFDataAppendBytes(v21, BytePtr, Length);
            if (v23)
            {
              LODWORD(v48) = CFDataGetLength(v23);
              v54.location = 0;
              v54.length = 16;
              CFDataReplaceBytes(v21, v54, bytes, 16);
              uint64_t v28 = CFDataGetBytePtr(v23);
              CFIndex v29 = CFDataGetLength(v23);
              CFDataAppendBytes(v21, v28, v29);
            }
            if (v20)
            {
              CFDictionaryAddValue(v20, @"SavageFirmware", v21);
              CFRelease(v21);
              CFTypeID v21 = 0;
            }
            goto LABEL_36;
          }
          CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCopyFirmware: Cannot allocate memory for savageFirmwareData", 3u, (uint64_t)a1, @"SavageErrorDomain");
LABEL_98:
          CFErrorRef err = CFErrorWithDomain;
          goto LABEL_48;
        }
        CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCopyFirmware: Empty Savage firmware file", 4u, (uint64_t)a1, @"SavageErrorDomain");
        CFTypeID v21 = 0;
LABEL_97:
        CFDataRef v23 = 0;
        goto LABEL_98;
      }
      CFTypeID v21 = 0;
LABEL_93:
      CFDataRef v23 = 0;
      goto LABEL_48;
    }
    unsigned int v43 = RelevantMeasurementTags;
    CFTypeID v44 = "SavageUpdaterCopyFirmware: Unable to get savage patch measurement tags";
    uint64_t v45 = (uint64_t)v10;
    goto LABEL_95;
  }
  CFTypeID v21 = 0;
  CFDataRef v22 = 0;
  CFDataRef v23 = 0;
LABEL_36:
  CFStringRef v30 = CFCopyDescription(v20);
  if (v30)
  {
    CFStringRef v31 = v30;
    if (CFStringGetCString(v30, logString, 4096, 0)) {
      uint64_t v32 = logString;
    }
    else {
      uint64_t v32 = "No C string description available.";
    }
    SavageRestoreInfoLog("%s [output]: %s \n", "SavageUpdaterCopyFirmware", v32);
    CFRelease(v31);
  }
  else
  {
    SavageRestoreInfoLog("%s [output]: %s \n", "SavageUpdaterCopyFirmware", "No C string description available.");
  }
  CFStringRef v33 = CFCopyDescription(v21);
  if (v33)
  {
    CFStringRef v34 = v33;
    if (CFStringGetCString(v33, logString, 4096, 0)) {
      BOOL v35 = logString;
    }
    else {
      BOOL v35 = "No C string description available.";
    }
    SavageRestoreInfoLog("%s [output]: %s \n", "SavageUpdaterCopyFirmware", v35);
    CFRelease(v34);
  }
  else
  {
    SavageRestoreInfoLog("%s [output]: %s \n", "SavageUpdaterCopyFirmware", "No C string description available.");
  }
LABEL_48:
  if (a2 && err)
  {
    *a2 = SavageSafeRetain(err);
    CFStringRef v36 = CFErrorCopyDescription(err);
    if (v36)
    {
      CFStringRef v37 = v36;
      if (CFStringGetCString(v36, logString, 4096, 0)) {
        long long v38 = logString;
      }
      else {
        long long v38 = "No C string description available.";
      }
      SavageRestoreInfoLog("%s [error]: %s \n", "SavageUpdaterCopyFirmware", v38);
      CFRelease(v37);
    }
    else
    {
      SavageRestoreInfoLog("%s [error]: %s \n", "SavageUpdaterCopyFirmware", "No C string description available.");
    }
  }
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v52)
  {
    CFRelease(v52);
    CFTypeRef v52 = 0;
  }
  if (err)
  {
    CFRelease(err);
    CFErrorRef err = 0;
  }
  if (v14) {
    CFRelease(v14);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v22) {
    CFRelease(v22);
  }
  if (v23) {
    CFRelease(v23);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (v18) {
    CFRelease(v18);
  }
  if (v20) {
    return v20;
  }
  else {
    return v21;
  }
}

CFAllocatorRef SavageUpdaterCreateRequestWithLogging(const __CFDictionary *a1, uint64_t (*a2)(void, void), uint64_t a3, CFTypeRef *a4)
{
  logSinkFunCC_SHA256_CTX c = a2;
  logContext = a3;
  return SavageUpdaterCreateRequest(a1, a4);
}

CFAllocatorRef SavageUpdaterCreateRequest(const __CFDictionary *a1, CFTypeRef *a2)
{
  CFTypeRef v171 = 0;
  CFTypeRef cf = 0;
  CFAllocatorRef allocator = 0;
  if (a1)
  {
    if (CFDictionaryContainsKey(a1, @"BuildIdentity"))
    {
      CFBooleanRef Value = CFDictionaryGetValue(a1, @"BuildIdentity");
      CFTypeRef v5 = SavageSafeRetain(Value);
      CFStringRef v6 = CFCopyDescription(v5);
      if (v6)
      {
        CFStringRef v7 = v6;
        if (CFStringGetCString(v6, logString, 4096, 0)) {
          size_t v8 = logString;
        }
        else {
          size_t v8 = "No C string description available.";
        }
        SavageRestoreInfoLog("%s [input]: BuildIdentity %s \n", "SavageUpdaterCreateRequest", v8);
        CFRelease(v7);
        if (v5)
        {
LABEL_8:
          if (CFDictionaryContainsKey(a1, @"DeviceInfo"))
          {
            CFBooleanRef v9 = CFDictionaryGetValue(a1, @"DeviceInfo");
            CFTypeRef v10 = SavageSafeRetain(v9);
            CFStringRef v11 = CFCopyDescription(v10);
            if (v11)
            {
              CFStringRef v12 = v11;
              if (CFStringGetCString(v11, logString, 4096, 0)) {
                CFTypeID v13 = logString;
              }
              else {
                CFTypeID v13 = "No C string description available.";
              }
              SavageRestoreInfoLog("%s [input]: DeviceInfo %s \n", "SavageUpdaterCreateRequest", v13);
              CFRelease(v12);
              if (v10) {
                goto LABEL_14;
              }
            }
            else
            {
              SavageRestoreInfoLog("%s [input]: DeviceInfo %s \n", "SavageUpdaterCreateRequest", "No C string description available.");
              if (v10)
              {
LABEL_14:
                if (!CFDictionaryContainsKey(a1, @"FirmwareData")) {
                  goto LABEL_49;
                }
                CFDictionaryRef v14 = CFDictionaryGetValue(a1, @"FirmwareData");
                CFStringRef v15 = CFCopyDescription(v14);
                if (v15)
                {
                  CFStringRef v16 = v15;
                  if (CFStringGetCString(v15, logString, 4096, 0)) {
                    CFDataRef v17 = logString;
                  }
                  else {
                    CFDataRef v17 = "No C string description available.";
                  }
                  SavageRestoreInfoLog("%s [input]: FirmwareData %s \n", "SavageUpdaterCreateRequest", v17);
                  CFRelease(v16);
                  if (v14) {
                    goto LABEL_20;
                  }
                }
                else
                {
                  SavageRestoreInfoLog("%s [input]: FirmwareData %s \n", "SavageUpdaterCreateRequest", "No C string description available.");
                  if (v14)
                  {
LABEL_20:
                    CFTypeID v18 = CFGetTypeID(v14);
                    if (v18 == CFDictionaryGetTypeID())
                    {
                      CFDataRef v19 = CFDictionaryGetValue((CFDictionaryRef)v14, @"SavageFirmware");
                      CFDataRef v20 = (const __CFData *)SavageSafeRetain(v19);
                      if (v20)
                      {
                        CFDataRef v21 = v20;
                        unsigned int v22 = CreateMeasurementDict(v20, &cf);
                        CFRelease(v21);
                        if (v22)
                        {
                          CFStringRef v26 = @"SavageErrorDomain";
                          unsigned int v27 = "SavageUpdaterCreateRequest: CreateMeasurementDict fails for Savage.";
                          goto LABEL_256;
                        }
                      }
                      CFDataRef v23 = CFDictionaryGetValue((CFDictionaryRef)v14, @"YonkersFirmware");
                      CFDataRef v24 = (const __CFData *)SavageSafeRetain(v23);
                      if (v24)
                      {
                        CFDataRef v25 = v24;
                        unsigned int v22 = CreateYonkersMeasurementDict(v24, &v171);
                        CFRelease(v25);
                        if (v22)
                        {
                          CFStringRef v26 = @"YonkersErrorDomain";
                          unsigned int v27 = "SavageUpdaterCreateRequest: CreateMeasurementDict fails for Yonkers.";
LABEL_256:
                          unsigned int v51 = v22;
                          uint64_t v52 = (uint64_t)v14;
                          goto LABEL_66;
                        }
                      }
                    }
                    else
                    {
                      CFTypeID v32 = CFGetTypeID(v14);
                      if (v32 == CFDataGetTypeID())
                      {
                        CFDataRef v33 = (const __CFData *)SavageSafeRetain(v14);
                        unsigned int v22 = CreateMeasurementDict(v33, &cf);
                        if (v33) {
                          CFRelease(v33);
                        }
                        if (v22)
                        {
                          CFStringRef v26 = @"SavageErrorDomain";
                          unsigned int v27 = "SavageUpdaterCreateRequest: CreateMeasurementDict fails for Savage (Old way).";
                          goto LABEL_256;
                        }
                      }
                    }
                    CFStringRef v34 = CFCopyDescription(cf);
                    if (v34)
                    {
                      CFStringRef v35 = v34;
                      if (CFStringGetCString(v34, logString, 4096, 0)) {
                        CFStringRef v36 = logString;
                      }
                      else {
                        CFStringRef v36 = "No C string description available.";
                      }
                      SavageRestoreInfoLog("%s [input]: SavageMeasurementDict - %s \n", "SavageUpdaterCreateRequest", v36);
                      CFRelease(v35);
                    }
                    else
                    {
                      SavageRestoreInfoLog("%s [input]: SavageMeasurementDict - %s \n", "SavageUpdaterCreateRequest", "No C string description available.");
                    }
                    CFStringRef v37 = CFCopyDescription(v171);
                    if (v37)
                    {
                      CFStringRef v38 = v37;
                      if (CFStringGetCString(v37, logString, 4096, 0)) {
                        size_t v39 = logString;
                      }
                      else {
                        size_t v39 = "No C string description available.";
                      }
                      SavageRestoreInfoLog("%s [input]: YonkersMeasurementDict - %s \n", "SavageUpdaterCreateRequest", v39);
                      CFRelease(v38);
                    }
                    else
                    {
                      SavageRestoreInfoLog("%s [input]: YonkersMeasurementDict - %s \n", "SavageUpdaterCreateRequest", "No C string description available.");
                    }
LABEL_49:
                    if (!CFDictionaryContainsKey(a1, @"ReceiptManifest")) {
                      goto LABEL_65;
                    }
                    v40 = CFDictionaryGetValue(a1, @"ReceiptManifest");
                    CFDictionaryRef v14 = SavageSafeRetain(v40);
                    CFDictionaryRef v41 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v14, @"SEP");
                    if (v41)
                    {
                      CFDictionaryRef v42 = v41;
                      CFTypeID v43 = CFGetTypeID(v41);
                      if (v43 == CFDictionaryGetTypeID())
                      {
                        CFTypeID v44 = CFDictionaryGetValue(v42, @"Digest");
                        CFStringRef v45 = CFCopyDescription(v44);
                        if (v45)
                        {
                          CFStringRef v46 = v45;
                          if (CFStringGetCString(v45, logString, 4096, 0)) {
                            v47 = logString;
                          }
                          else {
                            v47 = "No C string description available.";
                          }
                          SavageRestoreInfoLog("%s [input]: SEP Digest from ReceiptManifest - %s \n", "SavageUpdaterCreateRequest", v47);
                          CFRelease(v46);
                        }
                        else
                        {
                          SavageRestoreInfoLog("%s [input]: SEP Digest from ReceiptManifest - %s \n", "SavageUpdaterCreateRequest", "No C string description available.");
                        }
                      }
                    }
                    if (!v14)
                    {
LABEL_65:
                      CFStringRef v26 = @"SavageErrorDomain";
                      unsigned int v27 = "SavageUpdaterCreateRequest: ReceiptManifest is missing in input options";
                      unsigned int v51 = 6;
                      uint64_t v52 = (uint64_t)a1;
LABEL_66:
                      CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v27, v51, v52, v26);
                      CFDictionaryRef v14 = 0;
                      goto LABEL_67;
                    }
                    if (CFDictionaryContainsKey((CFDictionaryRef)v10, @"YonkersDeviceInfo"))
                    {
                      uint64_t v48 = CFDictionaryGetValue((CFDictionaryRef)v10, @"YonkersDeviceInfo");
                      CFDictionaryRef v31 = (const __CFDictionary *)SavageSafeRetain(v48);
                      unsigned int YonkersRequestDictForTATSU = CreateYonkersRequestDictForTATSU(v31, (const __CFDictionary *)v5, (CFDictionaryRef)v171, (uint64_t)v14, (CFTypeRef *)&allocator);
                      if (YonkersRequestDictForTATSU || !allocator)
                      {
                        CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCreateRequest: CreateYonkersRequestDictForTATSU fails.", YonkersRequestDictForTATSU, (uint64_t)a1, @"YonkersErrorDomain");
                        goto LABEL_68;
                      }
                      if (v31 && CFDictionaryGetCount((CFDictionaryRef)v10) == 1)
                      {
                        CFAllocatorRef v50 = allocator;
                        goto LABEL_224;
                      }
                      v165 = a2;
                    }
                    else
                    {
                      v165 = a2;
                      CFDictionaryRef v31 = 0;
                    }
                    CFDictionaryRef v57 = (const __CFDictionary *)cf;
                    *(_DWORD *)buffer = 0;
                    v173 = 0;
                    key = 0;
                    CFMutableDataRef Mutable = CFDataCreateMutable(0, 0);
                    CFMutableDictionaryRef v59 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                    if (!v57)
                    {
                      CFAllocatorRef v60 = 0;
                      unsigned int v101 = 2;
                      goto LABEL_216;
                    }
                    if (allocator)
                    {
                      CFAllocatorRef v60 = (__CFDictionary *)SavageSafeRetain(allocator);
                    }
                    else
                    {
                      CFAllocatorRef v60 = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
                      if (!v60)
                      {
                        unsigned int v101 = 3;
                        goto LABEL_216;
                      }
                    }
                    CFStringRef v61 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v5, @"Savage,ChipID");
                    if (!v61)
                    {
                      unsigned int v101 = 17;
                      goto LABEL_216;
                    }
                    CFStringRef v62 = v61;
                    theDict = v59;
                    CFTypeID v63 = CFGetTypeID(v61);
                    if (v63 != CFStringGetTypeID())
                    {
LABEL_245:
                      unsigned int v101 = 17;
                      goto LABEL_215;
                    }
                    if (!SavageCFStringToUInt32(v62, buffer, 0)) {
                      goto LABEL_246;
                    }
                    SavageCFDictionarySetInteger32(v60, @"Savage,ChipID", *(int *)buffer);
                    CFStringRef v64 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v5, @"Savage,PatchEpoch");
                    if (!v64) {
                      goto LABEL_245;
                    }
                    CFStringRef v65 = v64;
                    CFTypeID v66 = CFGetTypeID(v64);
                    if (v66 != CFStringGetTypeID()) {
                      goto LABEL_245;
                    }
                    if (!SavageCFStringToUInt32(v65, buffer, 0))
                    {
LABEL_246:
                      unsigned int v101 = 11;
                      goto LABEL_215;
                    }
                    SavageCFDictionarySetInteger32(v60, @"Savage,PatchEpoch", *(int *)buffer);
                    CFDataRef v67 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,ChipID");
                    if (v67 && (CFDataRef v68 = v67, v69 = CFGetTypeID(v67), v69 == CFDataGetTypeID()))
                    {
                      v176.location = 0;
                      v176.length = 4;
                      CFDataGetBytes(v68, v176, buffer);
                      *(_DWORD *)buffer = bswap32(*(unsigned int *)buffer);
                      v70 = (__CFData *)*MEMORY[0x263EFFB40];
                      if (*(_DWORD *)buffer >= 0x5065u)
                      {
                        CFDictionaryAddValue(v60, @"@Brunor,Ticket", (const void *)*MEMORY[0x263EFFB40]);
                        int v71 = @"Brunor,FdrRootCaDigest";
                        v72 = v60;
                        CFMutableDataRef v73 = Mutable;
                        goto LABEL_98;
                      }
                    }
                    else
                    {
                      v70 = (__CFData *)*MEMORY[0x263EFFB40];
                    }
                    int v71 = @"@Savage,Ticket";
                    v72 = v60;
                    CFMutableDataRef v73 = v70;
LABEL_98:
                    CFDictionaryAddValue(v72, v71, v73);
                    CFBooleanRef v74 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,ProductionMode");
                    if (v74)
                    {
                      CFBooleanRef v75 = v74;
                      v167 = Mutable;
                      CFTypeID v76 = CFGetTypeID(v74);
                      if (v76 != CFBooleanGetTypeID()) {
                        goto LABEL_244;
                      }
                      int v77 = CFBooleanGetValue(v75);
                      v169 = (__CFData *)*MEMORY[0x263EFFB38];
                      v78 = v77 ? v70 : (__CFData *)*MEMORY[0x263EFFB38];
                      CFDictionaryAddValue(v60, @"Savage,ProductionMode", v78);
                      v79 = CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,UID");
                      if (!v79
                        || (v80 = v79, CFTypeID v81 = CFGetTypeID(v79), v81 != CFDataGetTypeID())
                        || (CFDictionaryAddValue(v60, @"Savage,UID", v80),
                            (v82 = CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,Nonce")) == 0)
                        || (v83 = v82, CFTypeID v84 = CFGetTypeID(v82), v84 != CFDataGetTypeID()))
                      {
LABEL_244:
                        unsigned int v101 = 17;
LABEL_214:
                        CFMutableDataRef Mutable = v167;
LABEL_215:
                        CFMutableDictionaryRef v59 = theDict;
                        goto LABEL_216;
                      }
                      CFDictionaryRef v166 = v31;
                      CFDictionaryAddValue(v60, @"Savage,Nonce", v83);
                      unsigned int RelevantMeasurementTags = GetRelevantMeasurementTags((CFDictionaryRef)v10, (__CFString **)&key, &v173);
                      unsigned int v86 = RelevantMeasurementTags;
                      if (key && v173)
                      {
                        v87 = CFDictionaryGetValue(v57, @"MeasurementDictPatch");
                        if (v87)
                        {
                          v88 = v87;
                          CFTypeID v89 = CFGetTypeID(v87);
                          if (v89 == CFDictionaryGetTypeID())
                          {
                            CFDictionaryAddValue(v60, key, v88);
                            CFDictionaryRef v90 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v14, @"SEP");
                            if (v90)
                            {
                              CFDictionaryRef v91 = v90;
                              CFTypeID v92 = CFGetTypeID(v90);
                              if (v92 == CFDictionaryGetTypeID())
                              {
                                v93 = CFDictionaryGetValue(v91, @"Digest");
                                if (v93)
                                {
                                  v94 = v93;
                                  CFTypeID v95 = CFGetTypeID(v93);
                                  if (v95 == CFDataGetTypeID())
                                  {
                                    CFDictionarySetValue(theDict, @"Digest", v94);
                                    CFDictionaryAddValue(v60, @"SEP", theDict);
                                  }
                                }
                              }
                            }
                            CFBooleanRef v96 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Brunor,HarvestWrap");
                            if (v96)
                            {
                              CFBooleanRef v97 = v96;
                              CFTypeID v98 = CFGetTypeID(v96);
                              if (v98 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v97)) {
                                  v99 = v70;
                                }
                                else {
                                  v99 = v169;
                                }
                                CFDictionaryAddValue(v60, @"Brunor,HarvestWrap", v99);
                              }
                            }
                            CFBooleanRef v100 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Brunor,HarvestUnwrap");
                            unsigned int v101 = v86;
                            if (v100)
                            {
                              CFBooleanRef v102 = v100;
                              CFTypeID v103 = CFGetTypeID(v100);
                              if (v103 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v102)) {
                                  v104 = v70;
                                }
                                else {
                                  v104 = v169;
                                }
                                CFDictionaryAddValue(v60, @"Brunor,HarvestUnwrap", v104);
                              }
                            }
                            CFBooleanRef v105 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Brunor,Authenticate");
                            CFDictionaryRef v31 = v166;
                            if (v105)
                            {
                              CFBooleanRef v106 = v105;
                              CFTypeID v107 = CFGetTypeID(v105);
                              if (v107 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v106)) {
                                  v108 = v70;
                                }
                                else {
                                  v108 = v169;
                                }
                                CFDictionaryAddValue(v60, @"Brunor,Authenticate", v108);
                              }
                            }
                            CFBooleanRef v109 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,ReadECKey");
                            if (v109)
                            {
                              CFBooleanRef v110 = v109;
                              CFTypeID v111 = CFGetTypeID(v109);
                              if (v111 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v110)) {
                                  v112 = v70;
                                }
                                else {
                                  v112 = v169;
                                }
                                CFDictionaryAddValue(v60, @"Savage,ReadECKey", v112);
                              }
                            }
                            CFBooleanRef v113 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,WriteECKey");
                            if (v113)
                            {
                              CFBooleanRef v114 = v113;
                              CFTypeID v115 = CFGetTypeID(v113);
                              if (v115 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v114)) {
                                  v116 = v70;
                                }
                                else {
                                  v116 = v169;
                                }
                                CFDictionaryAddValue(v60, @"Savage,WriteECKey", v116);
                              }
                            }
                            CFBooleanRef v117 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,WriteUID");
                            if (v117)
                            {
                              CFBooleanRef v118 = v117;
                              CFTypeID v119 = CFGetTypeID(v117);
                              if (v119 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v118)) {
                                  v120 = v70;
                                }
                                else {
                                  v120 = v169;
                                }
                                CFDictionaryAddValue(v60, @"Savage,WriteUID", v120);
                              }
                            }
                            CFBooleanRef v121 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,WriteEpoch");
                            if (v121)
                            {
                              CFBooleanRef v122 = v121;
                              CFTypeID v123 = CFGetTypeID(v121);
                              if (v123 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v122)) {
                                  v124 = v70;
                                }
                                else {
                                  v124 = v169;
                                }
                                CFDictionaryAddValue(v60, @"Savage,WriteEpoch", v124);
                              }
                            }
                            CFBooleanRef v125 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,ReadGID");
                            if (v125)
                            {
                              CFBooleanRef v126 = v125;
                              CFTypeID v127 = CFGetTypeID(v125);
                              if (v127 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v126)) {
                                  v128 = v70;
                                }
                                else {
                                  v128 = v169;
                                }
                                CFDictionaryAddValue(v60, @"Savage,ReadGID", v128);
                              }
                            }
                            CFBooleanRef v129 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,ReadFWKey");
                            if (v129)
                            {
                              CFBooleanRef v130 = v129;
                              CFTypeID v131 = CFGetTypeID(v129);
                              if (v131 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v130)) {
                                  v132 = v70;
                                }
                                else {
                                  v132 = v169;
                                }
                                CFDictionaryAddValue(v60, @"Savage,ReadFWKey", v132);
                              }
                            }
                            CFBooleanRef v133 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,AllowOfflineBoot");
                            if (v133)
                            {
                              CFBooleanRef v134 = v133;
                              CFTypeID v135 = CFGetTypeID(v133);
                              if (v135 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v134)) {
                                  v136 = v70;
                                }
                                else {
                                  v136 = v169;
                                }
                                CFDictionaryAddValue(v60, @"Savage,AllowOfflineBoot", v136);
                              }
                            }
                            CFBooleanRef v137 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,TempDemote");
                            if (v137)
                            {
                              CFBooleanRef v138 = v137;
                              CFTypeID v139 = CFGetTypeID(v137);
                              if (v139 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v138)) {
                                  v140 = v70;
                                }
                                else {
                                  v140 = v169;
                                }
                                CFDictionaryAddValue(v60, @"Savage,TempDemote", v140);
                              }
                            }
                            CFBooleanRef v141 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,AccessSensor");
                            if (v141)
                            {
                              CFBooleanRef v142 = v141;
                              CFTypeID v143 = CFGetTypeID(v141);
                              if (v143 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v142)) {
                                  v144 = v70;
                                }
                                else {
                                  v144 = v169;
                                }
                                CFDictionaryAddValue(v60, @"Savage,AccessSensor", v144);
                              }
                            }
                            CFBooleanRef v145 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,AccessSecurity");
                            if (v145)
                            {
                              CFBooleanRef v146 = v145;
                              CFTypeID v147 = CFGetTypeID(v145);
                              if (v147 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v146)) {
                                  v148 = v70;
                                }
                                else {
                                  v148 = v169;
                                }
                                CFDictionaryAddValue(v60, @"Savage,AccessSecurity", v148);
                              }
                            }
                            CFBooleanRef v149 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,FADemote");
                            if (v149)
                            {
                              CFBooleanRef v150 = v149;
                              CFTypeID v151 = CFGetTypeID(v149);
                              if (v151 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v150)) {
                                  v152 = v70;
                                }
                                else {
                                  v152 = v169;
                                }
                                CFDictionaryAddValue(v60, @"Savage,FADemote", v152);
                              }
                            }
                            CFBooleanRef v153 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,DebugStatus");
                            if (v153)
                            {
                              CFBooleanRef v154 = v153;
                              CFTypeID v155 = CFGetTypeID(v153);
                              if (v155 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v154)) {
                                  v156 = v70;
                                }
                                else {
                                  v156 = v169;
                                }
                                CFDictionaryAddValue(v60, @"Savage,DebugStatus", v156);
                              }
                            }
                            CFBooleanRef v157 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v10, @"Savage,Provisioning");
                            if (v157)
                            {
                              CFBooleanRef v158 = v157;
                              CFTypeID v159 = CFGetTypeID(v157);
                              if (v159 == CFBooleanGetTypeID())
                              {
                                if (CFBooleanGetValue(v158)) {
                                  v160 = v70;
                                }
                                else {
                                  v160 = v169;
                                }
                                CFDictionaryAddValue(v60, @"Savage,Provisioning", v160);
                              }
                            }
                            if (!allocator) {
                              CFAllocatorRef allocator = (CFAllocatorRef)SavageSafeRetain(v60);
                            }
                            goto LABEL_214;
                          }
                        }
                        unsigned int v101 = 17;
                        CFMutableDataRef Mutable = v167;
                        CFMutableDictionaryRef v59 = theDict;
                      }
                      else
                      {
                        CFMutableDataRef Mutable = v167;
                        CFMutableDictionaryRef v59 = theDict;
                        unsigned int v101 = RelevantMeasurementTags;
                      }
                      CFDictionaryRef v31 = v166;
LABEL_216:
                      if (Mutable) {
                        CFRelease(Mutable);
                      }
                      if (v59) {
                        CFRelease(v59);
                      }
                      if (v60) {
                        CFRelease(v60);
                      }
                      if (v101 || (CFAllocatorRef v50 = allocator) == 0)
                      {
                        CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCreateRequest: CreateRequestDictForTATSU fails.", v101, (uint64_t)a1, @"SavageErrorDomain");
                        a2 = v165;
                        goto LABEL_68;
                      }
LABEL_224:
                      CFStringRef v161 = CFCopyDescription(v50);
                      if (v161)
                      {
                        CFStringRef v162 = v161;
                        if (CFStringGetCString(v161, logString, 4096, 0)) {
                          v163 = logString;
                        }
                        else {
                          v163 = "No C string description available.";
                        }
                        SavageRestoreInfoLog("%s [output]: %s \n", "SavageUpdaterCreateRequest", v163);
                        CFRelease(v162);
                      }
                      else
                      {
                        SavageRestoreInfoLog("%s [output]: %s \n", "SavageUpdaterCreateRequest", "No C string description available.");
                      }
                      goto LABEL_230;
                    }
                    goto LABEL_245;
                  }
                }
                CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCreateRequest: kSavageOptionFirmwareData is NULL in input options", 2u, (uint64_t)a1, @"SavageErrorDomain");
LABEL_67:
                CFDictionaryRef v31 = 0;
                goto LABEL_68;
              }
            }
          }
          CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"SavageUpdaterCreateRequest: Cannot get DeviceInfo", 2u, (uint64_t)a1, @"SavageErrorDomain");
          CFDictionaryRef v14 = 0;
          CFTypeRef v10 = 0;
          goto LABEL_67;
        }
      }
      else
      {
        SavageRestoreInfoLog("%s [input]: BuildIdentity %s \n", "SavageUpdaterCreateRequest", "No C string description available.");
        if (v5) {
          goto LABEL_8;
        }
      }
    }
    uint64_t v28 = "SavageUpdaterCreateRequest: BuildIdentity is NULL in input options";
    uint64_t v29 = (uint64_t)a1;
  }
  else
  {
    uint64_t v28 = "SavageUpdaterCreateRequest: options is NULL";
    uint64_t v29 = 0;
  }
  CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v28, 2u, v29, @"SavageErrorDomain");
  CFDictionaryRef v14 = 0;
  CFTypeRef v10 = 0;
  CFDictionaryRef v31 = 0;
  CFTypeRef v5 = 0;
LABEL_68:
  if (a2 && CFErrorWithDomain)
  {
    *a2 = SavageSafeRetain(CFErrorWithDomain);
    CFStringRef v53 = CFErrorCopyDescription(CFErrorWithDomain);
    if (v53)
    {
      CFStringRef v54 = v53;
      int CString = CFStringGetCString(v53, logString, 4096, 0);
      v56 = "No C string description available.";
      if (CString) {
        v56 = logString;
      }
      SavageRestoreInfoLog("%s [error]: %s \n", "SavageUpdaterCreateRequest", v56);
      CFRelease(v54);
    }
    else
    {
      SavageRestoreInfoLog("%s [error]: %s \n", "SavageUpdaterCreateRequest", "No C string description available.");
    }
  }
  else if (!CFErrorWithDomain)
  {
    if (!v14) {
      goto LABEL_231;
    }
LABEL_230:
    CFRelease(v14);
    goto LABEL_231;
  }
  CFRelease(CFErrorWithDomain);
  if (v14) {
    goto LABEL_230;
  }
LABEL_231:
  if (cf)
  {
    CFRelease(cf);
    CFTypeRef cf = 0;
  }
  if (v171)
  {
    CFRelease(v171);
    CFTypeRef v171 = 0;
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v31) {
    CFRelease(v31);
  }
  return allocator;
}

const char *SavageRestoreInfoLog(const char *a1, ...)
{
  va_start(va, a1);
  uint64_t result = (const char *)MEMORY[0x270FA5388](a1);
  uint64_t v3 = *MEMORY[0x263EF8340];
  if (logSinkFunc)
  {
    vsnprintf(__str, 0x1000uLL, result, va);
    return (const char *)logSinkFunc(logContext, __str);
  }
  return result;
}

CFTypeRef CreateFileData(const __CFDictionary *a1, const __CFString *a2, CFTypeRef *a3)
{
  CFTypeRef cf = 0;
  CFStringRef v6 = CFCopyDescription(a1);
  if (v6)
  {
    CFStringRef v7 = v6;
    CFIndex Length = CFStringGetLength(v6);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    CFTypeRef v10 = (char *)malloc(MaximumSizeForEncoding + 1);
    CFStringRef v11 = CFStringGetCString(v7, v10, MaximumSizeForEncoding, 0x8000100u) ? v10 : "No C string description available.";
    SavageRestoreInfoLog("%s [input]: Input Options - %s \n", "CreateFileData", v11);
    CFRelease(v7);
    if (v10) {
      free(v10);
    }
  }
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a1, @"BundleDataDict");
  if (Value)
  {
    CFDictionaryRef v13 = Value;
    SavageRestoreInfoLog("%s: Device side restoreInfo path \n", "CreateFileData");
    CFDictionaryRef v14 = CFDictionaryGetValue(v13, a2);
    CFTypeRef cf = SavageSafeRetain(v14);
    if (cf)
    {
      CFDictionaryRef v15 = 0;
      CFDictionaryRef v16 = 0;
      CFDictionaryRef v17 = 0;
      CFTypeRef v18 = 0;
      CFTypeRef v19 = 0;
      CFStringRef v29 = CFCopyDescription(cf);
      if (!v29)
      {
        SavageRestoreInfoLog("%s [output]: %s \n", "CreateFileData", "No C string description available.");
        goto LABEL_23;
      }
      CFStringRef v30 = v29;
      if (CFStringGetCString(v29, logString, 4096, 0)) {
        CFDictionaryRef v31 = logString;
      }
      else {
        CFDictionaryRef v31 = "No C string description available.";
      }
      SavageRestoreInfoLog("%s [output]: %s \n", "CreateFileData", v31);
      CFErrorRef v32 = (CFErrorRef)v30;
      goto LABEL_22;
    }
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"CreateFileData: bundleDataDict missing expected tag", 0x13u, (uint64_t)a1, @"SavageErrorDomain");
    CFDictionaryRef v15 = 0;
    goto LABEL_36;
  }
  SavageRestoreInfoLog("%s: Host side restoreInfo path \n", "CreateFileData");
  CFDataRef v20 = CFDictionaryGetValue(a1, @"BuildIdentity");
  CFDictionaryRef v21 = (const __CFDictionary *)SavageSafeRetain(v20);
  CFDictionaryRef v15 = v21;
  if (!v21)
  {
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"CreateFileData: Missing kSavageOptionBuildIdentity", 0xAu, (uint64_t)a1, @"SavageErrorDomain");
LABEL_36:
    CFDictionaryRef v16 = 0;
    CFDictionaryRef v17 = 0;
LABEL_39:
    CFTypeRef v18 = 0;
    CFTypeRef v19 = 0;
    goto LABEL_43;
  }
  unsigned int v22 = CFDictionaryGetValue(v21, a2);
  CFDictionaryRef v23 = (const __CFDictionary *)SavageSafeRetain(v22);
  CFDictionaryRef v17 = v23;
  if (!v23)
  {
    CStringPtr = CFStringGetCStringPtr(a2, 0x600u);
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)CStringPtr, 0xAu, (uint64_t)a1, @"SavageErrorDomain");
    CFDictionaryRef v16 = 0;
    goto LABEL_39;
  }
  CFDataRef v24 = CFDictionaryGetValue(v23, @"Info");
  CFDictionaryRef v25 = (const __CFDictionary *)SavageSafeRetain(v24);
  CFDictionaryRef v16 = v25;
  if (!v25)
  {
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"CreateFileData: Missing kSavageBuildIdentityInfoKey", 0xCu, (uint64_t)a1, @"SavageErrorDomain");
    goto LABEL_39;
  }
  CFStringRef v26 = CFDictionaryGetValue(v25, @"Path");
  CFTypeRef v19 = SavageSafeRetain(v26);
  if (v19)
  {
    unsigned int v27 = CFDictionaryGetValue(a1, @"BundlePath");
    CFTypeRef v18 = SavageSafeRetain(v27);
    if (v18)
    {
      unsigned int v28 = AMSupportPlatformCopyURLWithAppendedComponent();
      CFStringRef v36 = "CreateFileData: Fail to run AMSupportPlatformCopyURLWithAppendedComponent with srcBundleURL";
    }
    else
    {
      CFStringRef v36 = "CreateFileData: Missing kSavageOptionSourceBundlePath";
      unsigned int v28 = 10;
    }
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)v36, v28, (uint64_t)a1, @"SavageErrorDomain");
  }
  else
  {
    CFErrorRef CFErrorWithDomain = createCFErrorWithDomain((uint64_t)"CreateFileData: Missing kSavageBuildIdentityPathKey", 0xCu, (uint64_t)a1, @"SavageErrorDomain");
    CFTypeRef v18 = 0;
  }
LABEL_43:
  if (a3 && CFErrorWithDomain)
  {
    *a3 = SavageSafeRetain(CFErrorWithDomain);
    CFStringRef v37 = CFErrorCopyDescription(CFErrorWithDomain);
    if (v37)
    {
      CFStringRef v38 = v37;
      int CString = CFStringGetCString(v37, logString, 4096, 0);
      v40 = logString;
      if (!CString) {
        v40 = "No C string description available.";
      }
      SavageRestoreInfoLog("%s [error]: %s \n", "CreateFileData", v40);
      CFRelease(v38);
    }
    else
    {
      SavageRestoreInfoLog("%s [error]: %s \n", "CreateFileData", "No C string description available.");
    }
    goto LABEL_52;
  }
  if (CFErrorWithDomain)
  {
LABEL_52:
    CFErrorRef v32 = CFErrorWithDomain;
LABEL_22:
    CFRelease(v32);
  }
LABEL_23:
  if (v18) {
    CFRelease(v18);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (v15) {
    CFRelease(v15);
  }
  return cf;
}

uint64_t CreateMeasurementDict(const __CFData *a1, CFTypeRef *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  *(void *)buffer = 0;
  uint64_t v17 = 0;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFTypeRef v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFF88];
  CFStringRef v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  CFMutableDataRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  *(_OWORD *)md = 0u;
  long long v20 = 0u;
  size_t v8 = CFDictionaryCreateMutable(0, 0, v5, v6);
  CFBooleanRef v9 = 0;
  if (v8) {
    BOOL v10 = Mutable == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint64_t v11 = 2;
    if (a1 && a2)
    {
      v22.location = 0;
      v22.length = 16;
      CFDataGetBytes(a1, v22, buffer);
      if (*(_DWORD *)&buffer[4])
      {
        CFBooleanRef v9 = (UInt8 *)calloc(*(unsigned int *)&buffer[4], 1uLL);
        if (v9)
        {
          v23.length = *(unsigned int *)&buffer[4];
          v23.location = 16;
          CFDataGetBytes(a1, v23, v9);
          CC_LONG v12 = *(_DWORD *)&buffer[4];
          if (!(*(_DWORD *)&buffer[4] >> 20))
          {
            CC_SHA256_Init(&c);
            CC_SHA256_Update(&c, v9, v12);
            CC_SHA256_Final(md, &c);
          }
          CFDataRef v13 = CFDataCreate(v4, md, 32);
          if (v13)
          {
            CFDataRef v14 = v13;
            CFDictionarySetValue(Mutable, @"Digest", v13);
            CFDictionarySetValue(v8, @"MeasurementDictPatch", Mutable);
            *a2 = SavageSafeRetain(v8);
            CFRelease(v14);
            uint64_t v11 = 0;
          }
          else
          {
            uint64_t v11 = 8;
          }
        }
        else
        {
          uint64_t v11 = 3;
        }
      }
      else
      {
        CFBooleanRef v9 = 0;
        uint64_t v11 = 4;
      }
    }
    goto LABEL_13;
  }
  uint64_t v11 = 3;
  if (Mutable) {
LABEL_13:
  }
    CFRelease(Mutable);
  if (v8) {
    CFRelease(v8);
  }
  if (v9) {
    free(v9);
  }
  return v11;
}

CFTypeRef SavageSafeRetain(CFTypeRef cf)
{
  if (cf) {
    return CFRetain(cf);
  }
  return cf;
}

void SavageCFDictionarySetInteger32(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberSInt32Type, &valuePtr);
  if (!v5) {
    SavageCFDictionarySetInteger32_cold_1();
  }
  CFNumberRef v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

void SavageCFDictionarySetBoolean(__CFDictionary *a1, const void *a2, int a3)
{
  uint64_t v3 = (const void **)MEMORY[0x263EFFB40];
  if (!a3) {
    uint64_t v3 = (const void **)MEMORY[0x263EFFB38];
  }
  CFDictionarySetValue(a1, a2, *v3);
}

void SavageCFDictionarySetData(__CFDictionary *a1, const void *a2, UInt8 *bytes, CFIndex length)
{
  CFDataRef v6 = CFDataCreate(0, bytes, length);
  if (!v6) {
    SavageCFDictionarySetData_cold_1();
  }
  CFDataRef v7 = v6;
  CFDictionarySetValue(a1, a2, v6);

  CFRelease(v7);
}

uint64_t SavageCFStringToUInt32(const __CFString *a1, _DWORD *a2, int a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t result = CFStringGetCString(a1, buffer, 32, 0x600u);
  if (result)
  {
    *__error() = 0;
    *a2 = strtol(buffer, 0, a3);
    return *__error() == 0;
  }
  return result;
}

CFErrorRef createCFErrorWithDomain(uint64_t a1, unsigned int a2, uint64_t a3, const __CFString *a4)
{
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%@: %s", a4, a1);
  if (!v8) {
    return 0;
  }
  CFBooleanRef v9 = v8;
  CFStringRef v10 = CFStringCreateWithFormat(v7, 0, @"%@: Input Options: %@", v8, a3);
  if (!v10)
  {
    CFErrorRef v13 = 0;
    goto LABEL_4;
  }
  CFStringRef v11 = v10;
  CFMutableDataRef Mutable = CFDictionaryCreateMutable(v7, 0, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263EFFC70], v9);
  CFErrorRef v13 = CFErrorCreate(v7, a4, a2, Mutable);
  CFRelease(v11);
  CFRelease(v9);
  CFBooleanRef v9 = Mutable;
  if (Mutable) {
LABEL_4:
  }
    CFRelease(v9);
  return v13;
}

uint64_t GetRelevantMeasurementTags(CFDictionaryRef theDict, __CFString **a2, __CFString **a3)
{
  uint64_t result = 2;
  if (theDict && a2 && a3)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"Savage,ProductionMode");
    if (!Value) {
      return 17;
    }
    CFBooleanRef v8 = Value;
    CFTypeID v9 = CFGetTypeID(Value);
    if (v9 != CFBooleanGetTypeID()) {
      return 17;
    }
    int v10 = CFBooleanGetValue(v8);
    CFDataRef v11 = (const __CFData *)CFDictionaryGetValue(theDict, @"Savage,Revision");
    if (!v11) {
      return 17;
    }
    CFDataRef v12 = v11;
    CFTypeID v13 = CFGetTypeID(v11);
    if (v13 != CFDataGetTypeID()) {
      return 17;
    }
    BytePtr = CFDataGetBytePtr(v12);
    if (BytePtr)
    {
      unsigned int v15 = *BytePtr;
      int v16 = ((v15 & 0xF0) + 96) >> 4;
      if ((v16 - 8) < 2)
      {
        CFTypeRef v19 = &kSavageTagMeasurementB2ProdPatch;
        long long v20 = &kSavageTagMeasurementB2DevPatch;
LABEL_23:
        BOOL v22 = v10 == 0;
        if (!v10) {
          CFTypeRef v19 = v20;
        }
        *a2 = *v19;
        CFRange v23 = &kSavageTagMeasurementBFProdPatch;
        CFDataRef v24 = &kSavageTagMeasurementBFDevPatch;
LABEL_26:
        if (v22) {
          CFRange v23 = v24;
        }
        CFDictionaryRef v25 = *v23;
        goto LABEL_29;
      }
      if (!(((v15 & 0xF0) + 96) >> 4))
      {
        uint64_t v21 = &kSavageTagMeasurementBAProdPatch;
        BOOL v22 = v10 == 0;
        if (!v10) {
          uint64_t v21 = &kSavageTagMeasurementBADevPatch;
        }
        *a2 = *v21;
        CFRange v23 = &kSavageTagMeasurementBEProdPatch;
        CFDataRef v24 = &kSavageTagMeasurementBEDevPatch;
        goto LABEL_26;
      }
      if (v16 == 4)
      {
        uint64_t v17 = &kSavageTagMeasurementBEProdPatch;
        CFTypeRef v18 = &kSavageTagMeasurementBEDevPatch;
LABEL_19:
        if (!v10) {
          uint64_t v17 = v18;
        }
        CFDictionaryRef v25 = *v17;
        *a2 = v25;
LABEL_29:
        uint64_t result = 0;
        *a3 = v25;
        return result;
      }
      if (v15 >= 0xF0)
      {
        uint64_t v17 = &kSavageTagMeasurementBFProdPatch;
        CFTypeRef v18 = &kSavageTagMeasurementBFDevPatch;
        goto LABEL_19;
      }
    }
    CFTypeRef v19 = &kSavageTagMeasurementB0ProdPatch;
    long long v20 = &kSavageTagMeasurementB0DevPatch;
    goto LABEL_23;
  }
  return result;
}

uint64_t GetYonkersMeasurementTags(CFDictionaryRef theDict, CFTypeRef *a2, CFTypeRef *a3)
{
  int valuePtr = 0;
  uint64_t result = 2;
  if (theDict && a2)
  {
    CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"Yonkers,ProductionMode");
    if (Value
      && (CFBooleanRef v8 = Value, v9 = CFGetTypeID(Value), v9 == CFBooleanGetTypeID())
      && (BOOL v10 = CFBooleanGetValue(v8) != 0,
          (CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(theDict, @"Yonkers,FabRevision")) != 0)
      && (v12 = v11, CFTypeID v13 = CFGetTypeID(v11), v13 == CFNumberGetTypeID()))
    {
      CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
      return GetYonkersFabRevisionTags(valuePtr, v10, a2, a3);
    }
    else
    {
      return 17;
    }
  }
  return result;
}

uint64_t GetYonkersFabRevisionTags(int a1, int a2, CFTypeRef *a3, CFTypeRef *a4)
{
  int v8 = 0;
  uint64_t v9 = 0;
  while (dword_221616EF8[v9] != a1)
  {
    ++v9;
    v8 -= 2;
    if (v9 == 6)
    {
      CFStringRef v10 = 0;
      CFStringRef v11 = 0;
      uint64_t v12 = 2;
      goto LABEL_6;
    }
  }
  BOOL v13 = a2 != 0;
  uint64_t v14 = v13 | (8 * (v9 < 4));
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"Yonkers,SysTopPatch%X", (v13 - v8));
  CFStringRef v11 = CFStringCreateWithFormat(v15, 0, @"Yonkers,SysTopPatch%X", v14);
  uint64_t v12 = 0;
LABEL_6:
  uint64_t v16 = 0;
  uint64_t v17 = &dword_221616F10;
  while (1)
  {
    int v18 = *v17++;
    if (v18 == a1) {
      break;
    }
    v16 -= 2;
    if (v16 == -16)
    {
      if (!a3) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }
  }
  BOOL v19 = a2 != 0;
  if ((v19 - v16) < 8) {
    int v20 = 8;
  }
  else {
    int v20 = -8;
  }
  uint64_t v21 = (v20 | v19) - v16;
  CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFStringRef v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"Yonkers,SysTopPatch%X", v19 - v16);
  CFStringRef v11 = CFStringCreateWithFormat(v22, 0, @"Yonkers,SysTopPatch%X", v21);
  uint64_t v12 = 0;
  if (!a3) {
    goto LABEL_17;
  }
LABEL_15:
  if (v10) {
    *a3 = CFRetain(v10);
  }
LABEL_17:
  if (a4 && v11) {
    *a4 = CFRetain(v11);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v11) {
    CFRelease(v11);
  }
  return v12;
}

uint64_t _hexStringToBytes(unsigned char *a1, uint64_t *a2, unsigned __int8 *a3, unint64_t a4)
{
  uint64_t v4 = 2;
  if ((a4 & 1) == 0 && *a2 >= a4 >> 1 && a1 && a3)
  {
    uint64_t v5 = 0;
    *a2 = 0;
    if (a4 < 2)
    {
LABEL_27:
      uint64_t v4 = 0;
      *a2 = v5;
      a1[v5] = 0;
    }
    else
    {
      if (a4 >> 1 <= 1) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = a4 >> 1;
      }
      uint64_t v6 = MEMORY[0x263EF8318];
      CFAllocatorRef v7 = a1;
      uint64_t v8 = v5;
      while (1)
      {
        uint64_t v9 = *a3;
        if ((*(_DWORD *)(v6 + 4 * v9 + 60) & 0x10000) == 0) {
          return 2;
        }
        uint64_t v10 = a3[1];
        if ((*(_DWORD *)(v6 + 4 * v10 + 60) & 0x10000) == 0) {
          return 2;
        }
        unsigned int v11 = v9 - 48;
        unsigned int v12 = v9 - 97;
        if ((v9 - 65) >= 6) {
          char v13 = -1;
        }
        else {
          char v13 = v9 - 55;
        }
        char v14 = v9 - 87;
        if (v12 > 5) {
          char v14 = v13;
        }
        if (v11 < 0xA) {
          char v14 = v11;
        }
        char v15 = 16 * v14;
        unsigned int v16 = v10 - 48;
        unsigned int v17 = v10 - 97;
        if ((v10 - 65) >= 6) {
          char v18 = -1;
        }
        else {
          char v18 = v10 - 55;
        }
        char v19 = v10 - 87;
        if (v17 > 5) {
          char v19 = v18;
        }
        if (v16 < 0xA) {
          char v19 = v16;
        }
        *v7++ = v19 | v15;
        a3 += 2;
        if (!--v8) {
          goto LABEL_27;
        }
      }
    }
  }
  return v4;
}

void SavageCFDictionarySetInteger32_cold_1()
{
  __assert_rtn("SavageCFDictionarySetInteger32", "SavagePrivateHelper.cpp", 35, "num != NULL");
}

void SavageCFDictionarySetData_cold_1()
{
}

uint64_t AMSupportCreateDataFromFileURL()
{
  return MEMORY[0x270F97A08]();
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

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
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

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
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

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
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

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x270EE49C0](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x270EE49D0](err);
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

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
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

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x270ED87B0](__count, __size);
}

uint64_t ccDRBGGetRngState()
{
  return MEMORY[0x270ED87C8]();
}

uint64_t ccec_cp_224()
{
  return MEMORY[0x270ED8A90]();
}

uint64_t ccec_der_import_priv()
{
  return MEMORY[0x270ED8AB0]();
}

uint64_t ccec_sign()
{
  return MEMORY[0x270ED8AF0]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x270ED8E70]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9A28](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x270ED9AC8](__stream, a2, *(void *)&__whence);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x270ED9B20](__stream);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x270EDA328](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void perror(const char *a1)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}