@interface NVMEiBootUpdater
+ (id)IOMatchingPropertyTable;
- (BOOL)_copyIBICFromPath:(char *)a3 withOptions:(__CFDictionary *)a4 intoArray:(const __CFArray *)a5 withError:(__CFError *)a6;
- (BOOL)generateFirmwareImagesWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4;
- (BOOL)updateBootFirmwareWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4 error:(id *)a5;
- (DevNodeWriter)writer;
- (NVMEiBootUpdater)initWithIOService:(unsigned int)a3;
- (void)dealloc;
@end

@implementation NVMEiBootUpdater

+ (id)IOMatchingPropertyTable
{
  CFStringRef v3 = @"IOProviderClass";
  CFStringRef v4 = @"AppleEmbeddedNVMeController";
  return +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];
}

- (NVMEiBootUpdater)initWithIOService:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v7.receiver = self;
  v7.super_class = (Class)NVMEiBootUpdater;
  CFStringRef v4 = -[MSUBootFirmwareUpdater initWithIOService:](&v7, "initWithIOService:");
  if (v4)
  {
    v5 = [[DevNodeWriter alloc] initWithServiceNamed:@"EmbeddedDeviceTypeFirmware" parent:v3];
    v4->_writer = v5;
    if (!v5)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NVMEiBootUpdater;
  [(MSUBootFirmwareUpdater *)&v3 dealloc];
}

- (BOOL)generateFirmwareImagesWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NVMEiBootUpdater;
  return [(MSUBootFirmwareUpdater *)&v5 generateFirmwareImagesWithCallback:a3 context:a4];
}

- (BOOL)updateBootFirmwareWithCallback:(ramrod_update_callbacks *)a3 context:(firmware_update_context *)a4 error:(id *)a5
{
  v8 = [(MSUBootFirmwareUpdater *)self llbData];
  id v115 = (id)__NSArray0__;
  __int16 v114 = 0;
  uint64_t v113 = 0;
  if (ramrod_hardware_partition_supports_bics()
    && ![(NVMEiBootUpdater *)self _copyIBICFromPath:[(NSString *)[(DevNodeWriter *)[(NVMEiBootUpdater *)self writer] devicePath] UTF8String] withOptions:a4->var1 intoArray:&v115 withError:&v113])
  {
    iBU_LOG_real(@"Copy iBIC failed.", "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v9, v10, v11, v12, v13, v14, v101);
    if (!a5) {
      return 0;
    }
    v42 = MSUBootFirmwareError(1, v113, @"Copy iBIC failed.", v43, v44, v45, v46, v47, v104);
    goto LABEL_10;
  }
  unsigned __int8 v15 = [(DevNodeWriter *)[(NVMEiBootUpdater *)self writer] isAvailable];
  v16 = [(NVMEiBootUpdater *)self writer];
  if ((v15 & 1) == 0)
  {
    iBU_LOG_real(@"Writer %@ was unavailable at write-time", "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    if (!a5) {
      return 0;
    }
    v103 = [(NVMEiBootUpdater *)self writer];
    v42 = MSUBootFirmwareError(6, 0, @"Writer %@ was unavailable at write-time", v37, v38, v39, v40, v41, (uint64_t)v103);
LABEL_10:
    v48 = v42;
    BOOL result = 0;
    *a5 = v48;
    return result;
  }
  v23 = [(DevNodeWriter *)v16 devicePath];
  iBU_LOG_real(@"Writing lldb data to dev node %@", "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v24, v25, v26, v27, v28, v29, (uint64_t)v23);
  if ([(MSUBootFirmwareUpdater *)self _encodeAndWriteFirmware:v8 toWriter:[(NVMEiBootUpdater *)self writer] withError:a5])
  {
    CFStringRef v36 = @"Failed to write lldb data to dev node.";
LABEL_31:
    iBU_LOG_real((uint64_t)v36, "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v30, v31, v32, v33, v34, v35, v102);
    return 0;
  }
  uint64_t v50 = [(NSArray *)[(MSUBootFirmwareUpdater *)self firmwareImages] count];
  [(DevNodeWriter *)[(NVMEiBootUpdater *)self writer] devicePath];
  iBU_LOG_real(@"Writing %lu firmware images to dev node %@", "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v51, v52, v53, v54, v55, v56, v50);
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  v57 = [(MSUBootFirmwareUpdater *)self firmwareImages];
  id v58 = [(NSArray *)v57 countByEnumeratingWithState:&v109 objects:v117 count:16];
  if (v58)
  {
    id v65 = v58;
    uint64_t v66 = *(void *)v110;
    while (2)
    {
      for (i = 0; i != v65; i = (char *)i + 1)
      {
        if (*(void *)v110 != v66) {
          objc_enumerationMutation(v57);
        }
        if ([(MSUBootFirmwareUpdater *)self _encodeAndWriteFirmware:*(void *)(*((void *)&v109 + 1) + 8 * i) toWriter:[(NVMEiBootUpdater *)self writer] withError:a5])
        {
          CFStringRef v36 = @"Failed to write firmware data to dev node.";
          goto LABEL_31;
        }
      }
      id v65 = [(NSArray *)v57 countByEnumeratingWithState:&v109 objects:v117 count:16];
      if (v65) {
        continue;
      }
      break;
    }
  }
  if (v115)
  {
    id v68 = [v115 count];
    [(DevNodeWriter *)[(NVMEiBootUpdater *)self writer] devicePath];
    iBU_LOG_real(@"Writing %d iBIC firmware image segments to dev node %@", "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v69, v70, v71, v72, v73, v74, (uint64_t)v68);
    long long v107 = 0u;
    long long v108 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    id v75 = v115;
    id v76 = [v115 countByEnumeratingWithState:&v105 objects:v116 count:16];
    if (v76)
    {
      id v77 = v76;
      uint64_t v78 = *(void *)v106;
      while (2)
      {
        for (j = 0; j != v77; j = (char *)j + 1)
        {
          if (*(void *)v106 != v78) {
            objc_enumerationMutation(v75);
          }
          if ([(DevNodeWriter *)[(NVMEiBootUpdater *)self writer] writeData:*(void *)(*((void *)&v105 + 1) + 8 * (void)j) withError:a5])
          {
            CFStringRef v36 = @"Failed to write ibic data to dev node.";
            goto LABEL_31;
          }
        }
        id v77 = [v75 countByEnumeratingWithState:&v105 objects:v116 count:16];
        if (v77) {
          continue;
        }
        break;
      }
    }
  }
  iBU_LOG_real(@"Writing end_of_contents_bytes to dev node.", "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v59, v60, v61, v62, v63, v64, v102);
  if ([(DevNodeWriter *)[(NVMEiBootUpdater *)self writer] writeData:+[NSData dataWithBytes:&v114 length:2] withError:a5])
  {
    CFStringRef v36 = @"Failed to write end_of_contents bytes.";
    goto LABEL_31;
  }
  uint64_t v80 = [(DevNodeWriter *)[(NVMEiBootUpdater *)self writer] numberOfBytesRemainingInBlock];
  if (v80)
  {
    uint64_t v87 = v80;
    iBU_LOG_real(@"There are %lu bytes remaining in the boot block. Padding with zeroes.", "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v81, v82, v83, v84, v85, v86, v80);
    if ([(DevNodeWriter *)[(NVMEiBootUpdater *)self writer] writeData:+[NSMutableData dataWithLength:v87] withError:a5])
    {
      CFStringRef v36 = @"Failed to pad zeroes to the end of the block.";
      goto LABEL_31;
    }
  }
  if (![(DevNodeWriter *)[(NVMEiBootUpdater *)self writer] finished]) {
    iBU_LOG_real(@"Failed to clean up writer.", "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v88, v89, v90, v91, v92, v93, v102);
  }
  uint64_t v94 = IORegistryEntrySetCFProperty([(MSUBootFirmwareUpdater *)self matchedService], @"fw-write-done", kCFBooleanTrue);
  if (!v94)
  {
    iBU_LOG_real(@"Successfully updated iBoot firmware images", "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v95, v96, v97, v98, v99, v100, v102);
    return 1;
  }
  iBU_LOG_real(@"Failed to set 'fw-write-done' property on dev node. Kernel error: %d", "-[NVMEiBootUpdater updateBootFirmwareWithCallback:context:error:]", v95, v96, v97, v98, v99, v100, v94);
  return 0;
}

- (BOOL)_copyIBICFromPath:(char *)a3 withOptions:(__CFDictionary *)a4 intoArray:(const __CFArray *)a5 withError:(__CFError *)a6
{
  if (!a6)
  {
    iBU_LOG_real(@"error parameter is NULL", "-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]", (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, 0, v6, v7, v55);
LABEL_30:
    BOOL v53 = 0;
    goto LABEL_26;
  }
  if (!a5)
  {
    ramrod_create_error_cf(a6, @"RamrodErrorDomain", 2, 0, @"%s: outDataArray is NULL", (uint64_t)a6, v6, v7, (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    goto LABEL_30;
  }
  if (!a3)
  {
    ramrod_create_error_cf(a6, @"RamrodErrorDomain", 2, 0, @"%s: path parameter is NULL", (uint64_t)a6, v6, v7, (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    BOOL v53 = 0;
    goto LABEL_26;
  }
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!Mutable)
  {
    ramrod_create_error_cf(a6, @"RamrodErrorDomain", 6, 0, @"%s: segment_data_array failed to allocate", v12, v13, v14, (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    BOOL v53 = 0;
    goto LABEL_26;
  }
  v16 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  uint64_t v20 = v16;
  if (!v16)
  {
    ramrod_create_error_cf(a6, @"RamrodErrorDomain", 6, 0, @"%s: segment_keys_array failed to allocate", v17, v18, v19, (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    goto LABEL_37;
  }
  CFArrayAppendValue(v16, @"ibic");
  if (a4)
  {
    Value = CFDictionaryGetValue(a4, @"iBICRequired");
    uint64_t v22 = CFDictionaryGetValue(a4, @"iBICAdditionalTag");
    if (!v22) {
      goto LABEL_11;
    }
    v23 = v22;
    CFTypeID v24 = CFGetTypeID(v22);
    if (v24 == CFStringGetTypeID())
    {
      CFArrayAppendValue(v20, v23);
      goto LABEL_11;
    }
    ramrod_create_error_cf(a6, @"RamrodErrorDomain", 2, 0, @"%s: kAMRestoreOptionsiBICAdditionalTag is not a CFStringRef", v25, v26, v27, (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
LABEL_37:
    BOOL v53 = 0;
    goto LABEL_26;
  }
  Value = 0;
LABEL_11:
  if (CFStringCreateWithCString(kCFAllocatorDefault, a3, 0x8000100u))
  {
    CFURLRef URLFromString = (const __CFURL *)AMSupportCreateURLFromString();
    if (URLFromString)
    {
      uint64_t v56 = a5;
      CFMutableArrayRef v35 = Mutable;
      if (CFArrayGetCount(v20) < 1)
      {
LABEL_25:
        *uint64_t v56 = (const __CFArray *)CFRetain(v35);
        BOOL v53 = 1;
      }
      else
      {
        CFIndex v36 = 0;
        while (1)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v20, v36);
          CStringPtr = CFStringGetCStringPtr(ValueAtIndex, 0x8000100u);
          uint64_t v45 = AMRestorePartitionFWCopyTagData(URLFromString);
          if (Value)
          {
            CFTypeID v46 = CFGetTypeID(Value);
            if (v46 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)Value) == 1 && v45) {
              break;
            }
          }
          if (v45 == 8)
          {
            iBU_LOG_real(@"FW tag %s missing, but this is not fatal.\n", "-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]", v39, v40, v41, v42, v43, v44, (uint64_t)CStringPtr);
          }
          else if (v45)
          {
            iBU_LOG_real(@"Unexpected error %d scanning for FW tag %s - corrupt FW partition?\n", "-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]", v39, v40, v41, v42, v43, v44, v45);
          }
          else
          {
            CFDataGetLength(0);
            iBU_LOG_real(@"Found FW tag %s of %lu length.\n", "-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]", v47, v48, v49, v50, v51, v52, (uint64_t)CStringPtr);
            CFArrayAppendValue(v35, 0);
          }
          if (CFArrayGetCount(v20) <= ++v36) {
            goto LABEL_25;
          }
        }
        ramrod_create_error_cf(a6, @"RamrodErrorDomain", 3, 0, @"%s: AMRestorePartitionFWCopyTagData returned %d", v42, v43, v44, (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
        BOOL v53 = 0;
      }
    }
    else
    {
      ramrod_create_error_cf(a6, @"RamrodErrorDomain", 6, 0, @"%s: _copy_ibic unable to create url", v31, v32, v33, (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
      BOOL v53 = 0;
    }
  }
  else
  {
    ramrod_create_error_cf(a6, @"RamrodErrorDomain", 6, 0, @"%s: _copy_ibic unable to create fw_path", v28, v29, v30, (char)"-[NVMEiBootUpdater _copyIBICFromPath:withOptions:intoArray:withError:]");
    BOOL v53 = 0;
  }
LABEL_26:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  return v53;
}

- (DevNodeWriter)writer
{
  return (DevNodeWriter *)objc_getProperty(self, a2, 88, 1);
}

@end