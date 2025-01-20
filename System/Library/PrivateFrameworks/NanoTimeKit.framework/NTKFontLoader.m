@interface NTKFontLoader
+ (id)fontDescriptorForSectName:(id)a3;
+ (id)fontDescriptorForSectName:(id)a3 fromMachO:(const mach_header_64 *)a4;
+ (id)fontDescriptorForSectName:(id)a3 uniqueCacheIdentifier:(id)a4 fromMachO:(const mach_header_64 *)a5;
+ (id)registerFontDescriptorsForSectName:(id)a3 fromMachO:(const mach_header_64 *)a4;
+ (void)_registerFontDescriptor:(id)a3;
@end

@implementation NTKFontLoader

+ (id)fontDescriptorForSectName:(id)a3
{
  return (id)[a1 fontDescriptorForSectName:a3 fromMachO:&dword_1BC5A9000];
}

+ (id)fontDescriptorForSectName:(id)a3 fromMachO:(const mach_header_64 *)a4
{
  return (id)[a1 fontDescriptorForSectName:a3 uniqueCacheIdentifier:@"FontLoader" fromMachO:a4];
}

+ (id)fontDescriptorForSectName:(id)a3 uniqueCacheIdentifier:(id)a4 fromMachO:(const mach_header_64 *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (fontDescriptorForSectName_uniqueCacheIdentifier_fromMachO__onceToken != -1) {
    dispatch_once(&fontDescriptorForSectName_uniqueCacheIdentifier_fromMachO__onceToken, &__block_literal_global_31);
  }
  v9 = [NSString stringWithFormat:@"%@-%@", v8, v7];
  FontDescriptorFromData = [(id)fontDescriptorForSectName_uniqueCacheIdentifier_fromMachO____fontDescriptorCache objectForKey:v9];
  if (!FontDescriptorFromData)
  {
    unint64_t size = 0;
    v11 = getsectiondata(a5, "__FONT_DATA", (const char *)[v7 cStringUsingEncoding:4], &size);
    if (v11)
    {
      CFDataRef v12 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v11, size, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
      FontDescriptorFromData = CTFontManagerCreateFontDescriptorFromData(v12);
      [(id)fontDescriptorForSectName_uniqueCacheIdentifier_fromMachO____fontDescriptorCache setObject:FontDescriptorFromData forKey:v9];
      CFRelease(v12);
    }
    else
    {
      FontDescriptorFromData = 0;
    }
  }

  return FontDescriptorFromData;
}

void __75__NTKFontLoader_fontDescriptorForSectName_uniqueCacheIdentifier_fromMachO___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)fontDescriptorForSectName_uniqueCacheIdentifier_fromMachO____fontDescriptorCache;
  fontDescriptorForSectName_uniqueCacheIdentifier_fromMachO____fontDescriptorCache = (uint64_t)v0;
}

+ (id)registerFontDescriptorsForSectName:(id)a3 fromMachO:(const mach_header_64 *)a4
{
  id v5 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__7;
  v18 = __Block_byref_object_dispose__7;
  id v19 = (id)objc_opt_new();
  unint64_t size = 0;
  id v6 = v5;
  id v7 = getsectiondata(a4, "__FONT_DATA", (const char *)[v6 cStringUsingEncoding:4], &size);
  if (v7)
  {
    CFDataRef v8 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v7, size, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
    CFArrayRef FontDescriptorsFromData = CTFontManagerCreateFontDescriptorsFromData(v8);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__NTKFontLoader_registerFontDescriptorsForSectName_fromMachO___block_invoke;
    v12[3] = &unk_1E62C2538;
    v12[4] = &v14;
    [(__CFArray *)FontDescriptorsFromData enumerateObjectsUsingBlock:v12];
    CFRelease(v8);
  }
  id v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __62__NTKFontLoader_registerFontDescriptorsForSectName_fromMachO___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[NTKFontLoader _registerFontDescriptor:v3];
  v4 = [v3 fontAttributes];
  id v5 = [v4 objectForKey:*MEMORY[0x1E4FB0918]];

  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v3 forKey:v5];
  }
  else
  {
    id v6 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __62__NTKFontLoader_registerFontDescriptorsForSectName_fromMachO___block_invoke_cold_1((uint64_t)v3, v6);
    }
  }
}

+ (void)_registerFontDescriptor:(id)a3
{
  id v3 = CTFontCreateWithFontDescriptor((CTFontDescriptorRef)a3, 12.0, 0);
  v4 = CTFontCopyGraphicsFont(v3, 0);
  CFErrorRef error = 0;
  CTFontManagerRegisterGraphicsFont(v4, &error);
  CGFontRelease(v4);
  CFRelease(v3);
  if (error)
  {
    id v5 = _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[NTKFontLoader _registerFontDescriptor:]((uint64_t *)&error, v5);
    }

    CFRelease(error);
  }
}

void __62__NTKFontLoader_registerFontDescriptorsForSectName_fromMachO___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Got unnamed font descriptor %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_registerFontDescriptor:(uint64_t *)a1 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_ERROR, "Got error registering font descriptor %@", (uint8_t *)&v3, 0xCu);
}

@end