@interface PFUniformTypeUtilities
+ (BOOL)filenameExtension:(id)a3 conformsToOneOfTypes:(id)a4;
+ (BOOL)type:(id)a3 conformsToOneOfTypes:(id)a4;
+ (BOOL)url:(id)a3 conformsToOneOfTypes:(id)a4;
+ (BOOL)url:(id)a3 conformsToType:(id)a4;
+ (NSArray)imageTypesNotWellSupportedForSharing;
+ (NSArray)imageTypesUnsupportedForImport;
+ (NSArray)supportedAudioTypes;
+ (NSArray)supportedImageTypes;
+ (NSArray)supportedMovieTypes;
+ (NSArray)typesSupportedForImport;
+ (NSString)adobeIllustratorIdentifier;
+ (NSString)adobePhotoshopIdentifier;
+ (NSString)apertureLibraryIdentifier;
+ (NSString)avifIdentifier;
+ (NSString)canonCR2RAWImageIdentifier;
+ (NSString)canonCRWRAWImageIdentifier;
+ (NSString)canonTIFFRAWImageIdentifier;
+ (NSString)fujiRAWImageIdentifier;
+ (NSString)hasselblad3FRRAWImageIdentifier;
+ (NSString)hasselbladFFFRAWImageIdentifier;
+ (NSString)heicSequenceIdentifier;
+ (NSString)iPhotoLibraryIdentifier;
+ (NSString)icoIdentifier;
+ (NSString)jpeg2000Identifier;
+ (NSString)jpegXLIdentifier;
+ (NSString)leafamericaRAWImageIdentifier;
+ (NSString)livePhotoBundleIdentifier;
+ (NSString)livePhotoBundlePrivateIdentifier;
+ (NSString)macPaintIdentifier;
+ (NSString)nikonRAWImageIdentifier;
+ (NSString)olympusRAWImageIdentifier;
+ (NSString)openEXRImageIdentifier;
+ (NSString)panasonicRAWImageIdentifier;
+ (NSString)panasonicRW2RAWImageIdentifier;
+ (NSString)pentaxRAWImageIdentifier;
+ (NSString)photosLibraryIdentifier;
+ (NSString)pictIdentifier;
+ (NSString)quicktimeImageIdentifier;
+ (NSString)samsungRAWImageIdentifier;
+ (NSString)sonyARWRAWImageIdentifier;
+ (NSString)supplementalResourceAAEIdentifier;
+ (NSString)supplementalResourceXMPIdentifier;
+ (UTType)adobeIllustratorType;
+ (UTType)adobePhotoshopType;
+ (UTType)apertureLibraryType;
+ (UTType)avifType;
+ (UTType)canonCR2RAWImageType;
+ (UTType)canonCRWRAWImageType;
+ (UTType)canonTIFFRAWImageType;
+ (UTType)fujiRAWImageType;
+ (UTType)hasselblad3FRRAWImageType;
+ (UTType)hasselbladFFFRAWImageType;
+ (UTType)heicSequenceType;
+ (UTType)iPhotoLibraryType;
+ (UTType)icoType;
+ (UTType)jpeg2000Type;
+ (UTType)jpegXLType;
+ (UTType)leafamericaRAWImageType;
+ (UTType)livePhotoBundlePrivateType;
+ (UTType)livePhotoBundleType;
+ (UTType)macPaintType;
+ (UTType)nikonRAWImageType;
+ (UTType)olympusRAWImageType;
+ (UTType)openEXRImageType;
+ (UTType)panasonicRAWImageType;
+ (UTType)panasonicRW2RAWImageType;
+ (UTType)pentaxRAWImageType;
+ (UTType)photosLibraryType;
+ (UTType)pictType;
+ (UTType)quicktimeImageType;
+ (UTType)samsungRAWImageType;
+ (UTType)sonyARWRAWImageType;
+ (UTType)supplementalResourceAAEType;
+ (UTType)supplementalResourceXMPType;
+ (id)preferredOrFallbackFilenameExtensionForType:(id)a3;
+ (id)preferredOrFallbackFilenameExtensionForType:(id)a3 fallbackIdentifier:(id)a4;
+ (id)resourceModelTypeForFilenameExtension:(id)a3;
+ (id)typeForFilenameExtensionOrLastPathComponent:(id)a3;
+ (id)typeForHFSType:(unsigned int)a3;
+ (id)typeForHFSType:(unsigned int)a3 conformingToType:(id)a4;
+ (id)typeForURL:(id)a3 error:(id *)a4;
+ (id)typeWithFilenameExtension:(id)a3;
+ (id)typeWithFilenameExtension:(id)a3 conformingToType:(id)a4;
+ (id)typeWithIdentifier:(id)a3;
@end

@implementation PFUniformTypeUtilities

+ (id)preferredOrFallbackFilenameExtensionForType:(id)a3
{
  return (id)[a1 preferredOrFallbackFilenameExtensionForType:a3 fallbackIdentifier:0];
}

+ (id)preferredOrFallbackFilenameExtensionForType:(id)a3 fallbackIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__onceToken[0] == -1)
  {
    if (v6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = [v6 identifier];
    v10 = (void *)v9;
    if (v9) {
      v11 = (void *)v9;
    }
    else {
      v11 = v7;
    }
    id v12 = v11;

    v13 = [a1 canonTIFFRAWImageIdentifier];
    char v14 = [v12 isEqualToString:v13];

    if (v14)
    {
      v8 = @"tiff";
    }
    else
    {
      v15 = [a1 supplementalResourceAAEIdentifier];
      char v16 = [v12 isEqualToString:v15];

      if (v16)
      {
        v8 = @"aae";
      }
      else
      {
        v17 = [(id)*MEMORY[0x1E4F44378] identifier];
        int v18 = [v12 isEqualToString:v17];

        if (v18) {
          v8 = @"dat";
        }
        else {
          v8 = 0;
        }
      }
    }

    goto LABEL_16;
  }
  dispatch_once(preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__onceToken, &__block_literal_global_172);
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  os_unfair_lock_lock((os_unfair_lock_t)&preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__sLock);
  v8 = [(id)preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__sTypeToPreferredExtensionMap objectForKeyedSubscript:v6];
  os_unfair_lock_unlock((os_unfair_lock_t)&preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__sLock);
  if (v8) {
    goto LABEL_19;
  }
  v8 = [v6 preferredFilenameExtension];
  if (!v8) {
    goto LABEL_5;
  }
LABEL_16:
  if (v6 && v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__sLock);
    [(id)preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__sTypeToPreferredExtensionMap setObject:v8 forKeyedSubscript:v6];
    os_unfair_lock_unlock((os_unfair_lock_t)&preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__sLock);
  }
LABEL_19:

  return v8;
}

+ (NSString)supplementalResourceAAEIdentifier
{
  return (NSString *)@"com.apple.photos.apple-adjustment-envelope";
}

+ (NSString)canonTIFFRAWImageIdentifier
{
  return (NSString *)@"com.canon.tif-raw-image";
}

+ (NSString)sonyARWRAWImageIdentifier
{
  return (NSString *)@"com.sony.arw-raw-image";
}

+ (NSString)samsungRAWImageIdentifier
{
  return (NSString *)@"com.samsung.raw-image";
}

+ (NSString)pentaxRAWImageIdentifier
{
  return (NSString *)@"com.pentax.raw-image";
}

+ (NSString)panasonicRW2RAWImageIdentifier
{
  return (NSString *)@"com.panasonic.rw2-raw-image";
}

+ (NSString)panasonicRAWImageIdentifier
{
  return (NSString *)@"com.panasonic.raw-image";
}

+ (NSString)olympusRAWImageIdentifier
{
  return (NSString *)@"com.olympus.raw-image";
}

+ (NSString)nikonRAWImageIdentifier
{
  return (NSString *)@"com.nikon.raw-image";
}

+ (NSString)leafamericaRAWImageIdentifier
{
  return (NSString *)@"com.leafamerica.raw-image";
}

+ (NSString)jpegXLIdentifier
{
  return (NSString *)@"public.jpeg-xl";
}

+ (NSString)hasselbladFFFRAWImageIdentifier
{
  return (NSString *)@"com.hasselblad.fff-raw-image";
}

+ (NSString)hasselblad3FRRAWImageIdentifier
{
  return (NSString *)@"com.hasselblad.3fr-raw-image";
}

+ (NSString)fujiRAWImageIdentifier
{
  return (NSString *)@"com.fuji.raw-image";
}

+ (NSString)canonCRWRAWImageIdentifier
{
  return (NSString *)@"com.canon.crw-raw-image";
}

+ (NSString)canonCR2RAWImageIdentifier
{
  return (NSString *)@"com.canon.cr2-raw-image";
}

+ (NSString)avifIdentifier
{
  return (NSString *)@"public.avif";
}

uint64_t __89__PFUniformTypeUtilities_preferredOrFallbackFilenameExtensionForType_fallbackIdentifier___block_invoke()
{
  preferredOrFallbackFilenameExtensionForType_fallbackIdentifier__sTypeToPreferredExtensionMap = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

+ (id)typeForHFSType:(unsigned int)a3 conformingToType:(id)a4
{
  return 0;
}

+ (id)typeForHFSType:(unsigned int)a3
{
  return 0;
}

+ (NSArray)imageTypesNotWellSupportedForSharing
{
  if (imageTypesNotWellSupportedForSharing_onceToken[0] != -1) {
    dispatch_once(imageTypesNotWellSupportedForSharing_onceToken, &__block_literal_global_200);
  }
  v2 = (void *)imageTypesNotWellSupportedForSharing_notWellSupportedTypes;

  return (NSArray *)v2;
}

void __62__PFUniformTypeUtilities_imageTypesNotWellSupportedForSharing__block_invoke()
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = *MEMORY[0x1E4F44568];
  v0 = +[PFUniformTypeUtilities avifType];
  v5[1] = v0;
  v1 = +[PFUniformTypeUtilities jpegXLType];
  v5[2] = v1;
  v2 = +[PFUniformTypeUtilities openEXRImageType];
  v5[3] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];
  v4 = (void *)imageTypesNotWellSupportedForSharing_notWellSupportedTypes;
  imageTypesNotWellSupportedForSharing_notWellSupportedTypes = v3;
}

+ (NSArray)imageTypesUnsupportedForImport
{
  if (imageTypesUnsupportedForImport_onceToken[0] != -1) {
    dispatch_once(imageTypesUnsupportedForImport_onceToken, &__block_literal_global_195_2001);
  }
  v2 = (void *)imageTypesUnsupportedForImport_unsupportedTypes;

  return (NSArray *)v2;
}

void __56__PFUniformTypeUtilities_imageTypesUnsupportedForImport__block_invoke()
{
  v8[3] = *MEMORY[0x1E4F143B8];
  v0 = +[PFUniformTypeUtilities quicktimeImageType];
  v1 = +[PFUniformTypeUtilities pictType];
  v8[1] = v1;
  v2 = +[PFUniformTypeUtilities icoType];
  v8[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3];
  v4 = (void *)[v3 mutableCopy];

  v5 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:@"FPX"];
  if (v5) {
    [v4 addObject:v5];
  }
  uint64_t v6 = [v4 copy];
  id v7 = (void *)imageTypesUnsupportedForImport_unsupportedTypes;
  imageTypesUnsupportedForImport_unsupportedTypes = v6;
}

+ (NSArray)supportedAudioTypes
{
  if (supportedAudioTypes_onceToken != -1) {
    dispatch_once(&supportedAudioTypes_onceToken, &__block_literal_global_193);
  }
  v2 = (void *)supportedAudioTypes_supportedTypes;

  return (NSArray *)v2;
}

void __45__PFUniformTypeUtilities_supportedAudioTypes__block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F166C8] audiovisualTypes];
  v1 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    uint64_t v6 = *MEMORY[0x1E4F44330];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v8 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:", *(void *)(*((void *)&v11 + 1) + 8 * v7), (void)v11);
        if ([v8 conformsToType:v6]) {
          [v1 addObject:v8];
        }

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  uint64_t v9 = [v1 copy];
  v10 = (void *)supportedAudioTypes_supportedTypes;
  supportedAudioTypes_supportedTypes = v9;
}

+ (NSArray)supportedMovieTypes
{
  if (supportedMovieTypes_onceToken != -1) {
    dispatch_once(&supportedMovieTypes_onceToken, &__block_literal_global_190);
  }
  id v2 = (void *)supportedMovieTypes_supportedMovieTypes;

  return (NSArray *)v2;
}

void __45__PFUniformTypeUtilities_supportedMovieTypes__block_invoke()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F166C8] audiovisualTypes];
  v1 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = v0;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    uint64_t v6 = *MEMORY[0x1E4F44448];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v8 = objc_msgSend(MEMORY[0x1E4F442D8], "typeWithIdentifier:", *(void *)(*((void *)&v11 + 1) + 8 * v7), (void)v11);
        if ([v8 conformsToType:v6]) {
          [v1 addObject:v8];
        }

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  uint64_t v9 = [v1 copy];
  v10 = (void *)supportedMovieTypes_supportedMovieTypes;
  supportedMovieTypes_supportedMovieTypes = v9;
}

+ (NSArray)supportedImageTypes
{
  if (supportedImageTypes_onceToken[0] != -1) {
    dispatch_once(supportedImageTypes_onceToken, &__block_literal_global_187);
  }
  id v2 = (void *)supportedImageTypes_supportedImageTypes;

  return (NSArray *)v2;
}

void __45__PFUniformTypeUtilities_supportedImageTypes__block_invoke()
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F44400];
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  v1 = (void *)supportedImageTypes_supportedImageTypes;
  supportedImageTypes_supportedImageTypes = v0;
}

+ (id)typeForFilenameExtensionOrLastPathComponent:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = [v3 pathExtension];
    if ([v4 isEqualToString:&stru_1EF7AE1F8]) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = v4;
    }
    id v6 = v5;

    uint64_t v7 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (NSArray)typesSupportedForImport
{
  if (typesSupportedForImport_onceToken != -1) {
    dispatch_once(&typesSupportedForImport_onceToken, &__block_literal_global_181);
  }
  id v2 = (void *)typesSupportedForImport_supportedTypes;

  return (NSArray *)v2;
}

void __49__PFUniformTypeUtilities_typesSupportedForImport__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CA48];
  v1 = +[PFUniformTypeUtilities supportedImageTypes];
  id v6 = [v0 arrayWithArray:v1];

  id v2 = +[PFUniformTypeUtilities supportedMovieTypes];
  [v6 addObjectsFromArray:v2];

  id v3 = +[PFUniformTypeUtilities supportedAudioTypes];
  [v6 addObjectsFromArray:v3];

  uint64_t v4 = [v6 copy];
  uint64_t v5 = (void *)typesSupportedForImport_supportedTypes;
  typesSupportedForImport_supportedTypes = v4;
}

+ (id)typeForURL:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v13 = 0;
  uint64_t v6 = *MEMORY[0x1E4F1C538];
  id v12 = 0;
  char v7 = [v5 getResourceValue:&v13 forKey:v6 error:&v12];
  id v8 = v13;
  id v9 = v12;
  if ((v7 & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      if (!a4) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    long long v11 = [v5 path];
    *(_DWORD *)buf = 138412546;
    v15 = v11;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to get NSURLContentTypeKey resource value for %@: %@", buf, 0x16u);

    if (a4) {
LABEL_4:
    }
      *a4 = v9;
  }
LABEL_5:

  return v8;
}

+ (id)resourceModelTypeForFilenameExtension:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (!v3)
  {
LABEL_6:
    id v5 = 0;
    goto LABEL_10;
  }
  if ([v3 caseInsensitiveCompare:@"xmp"])
  {
    if ([v4 caseInsensitiveCompare:@"aae"])
    {
      id v5 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v4];
      if (![v5 isDynamic]) {
        goto LABEL_10;
      }

      goto LABEL_6;
    }
    uint64_t v6 = +[PFUniformTypeUtilities supplementalResourceAAEType];
  }
  else
  {
    uint64_t v6 = +[PFUniformTypeUtilities supplementalResourceXMPType];
  }
  id v5 = (void *)v6;
LABEL_10:

  return v5;
}

+ (BOOL)url:(id)a3 conformsToOneOfTypes:(id)a4
{
  id v6 = a4;
  char v7 = [a1 typeForURL:a3 error:0];
  BOOL v8 = v7 && ([a1 type:v7 conformsToOneOfTypes:v6] & 1) != 0;

  return v8;
}

+ (BOOL)url:(id)a3 conformsToType:(id)a4
{
  id v6 = a4;
  char v7 = [a1 typeForURL:a3 error:0];
  LOBYTE(a1) = [v7 conformsToType:v6];

  return (char)a1;
}

+ (BOOL)filenameExtension:(id)a3 conformsToOneOfTypes:(id)a4
{
  id v6 = a4;
  char v7 = [a1 typeForFilenameExtensionOrLastPathComponent:a3];
  LOBYTE(a1) = [a1 type:v7 conformsToOneOfTypes:v6];

  return (char)a1;
}

+ (BOOL)type:(id)a3 conformsToOneOfTypes:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(v5, "conformsToType:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)typeWithFilenameExtension:(id)a3 conformingToType:(id)a4
{
  if (a3)
  {
    id v5 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:a3 conformingToType:a4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)typeWithFilenameExtension:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (typeWithFilenameExtension__onceToken == -1)
  {
    if (v3) {
      goto LABEL_3;
    }
LABEL_8:
    id v5 = 0;
    goto LABEL_9;
  }
  dispatch_once(&typeWithFilenameExtension__onceToken, &__block_literal_global_170);
  if (!v4) {
    goto LABEL_8;
  }
LABEL_3:
  os_unfair_lock_lock((os_unfair_lock_t)&typeWithFilenameExtension__sTypeWithExtensionCacheLock);
  id v5 = [(id)typeWithFilenameExtension__sTypeWithExtensionCache objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v4];
    if (v5) {
      [(id)typeWithFilenameExtension__sTypeWithExtensionCache setObject:v5 forKeyedSubscript:v4];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&typeWithFilenameExtension__sTypeWithExtensionCacheLock);
LABEL_9:

  return v5;
}

uint64_t __52__PFUniformTypeUtilities_typeWithFilenameExtension___block_invoke()
{
  typeWithFilenameExtension__sTypeWithExtensionCache = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

+ (id)typeWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (typeWithIdentifier__onceToken[0] == -1)
  {
    if (v3) {
      goto LABEL_3;
    }
LABEL_8:
    id v5 = 0;
    goto LABEL_9;
  }
  dispatch_once(typeWithIdentifier__onceToken, &__block_literal_global_167);
  if (!v4) {
    goto LABEL_8;
  }
LABEL_3:
  os_unfair_lock_lock((os_unfair_lock_t)&typeWithIdentifier__sTypeWithIdentifierCacheLock);
  id v5 = [(id)typeWithIdentifier__sTypeWithIdentifierCache objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v4];
    if (v5) {
      [(id)typeWithIdentifier__sTypeWithIdentifierCache setObject:v5 forKeyedSubscript:v4];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&typeWithIdentifier__sTypeWithIdentifierCacheLock);
LABEL_9:

  return v5;
}

uint64_t __45__PFUniformTypeUtilities_typeWithIdentifier___block_invoke()
{
  typeWithIdentifier__sTypeWithIdentifierCache = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

+ (NSString)openEXRImageIdentifier
{
  return (NSString *)@"com.ilm.openexr-image";
}

+ (UTType)openEXRImageType
{
  if (openEXRImageType_onceToken[0] != -1) {
    dispatch_once(openEXRImageType_onceToken, &__block_literal_global_162);
  }
  id v2 = (void *)openEXRImageType_type;

  return (UTType *)v2;
}

uint64_t __42__PFUniformTypeUtilities_openEXRImageType__block_invoke()
{
  openEXRImageType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.ilm.openexr-image"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)hasselbladFFFRAWImageType
{
  if (hasselbladFFFRAWImageType_onceToken[0] != -1) {
    dispatch_once(hasselbladFFFRAWImageType_onceToken, &__block_literal_global_157);
  }
  id v2 = (void *)hasselbladFFFRAWImageType_type;

  return (UTType *)v2;
}

uint64_t __51__PFUniformTypeUtilities_hasselbladFFFRAWImageType__block_invoke()
{
  hasselbladFFFRAWImageType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.hasselblad.fff-raw-image"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)hasselblad3FRRAWImageType
{
  if (hasselblad3FRRAWImageType_onceToken[0] != -1) {
    dispatch_once(hasselblad3FRRAWImageType_onceToken, &__block_literal_global_152);
  }
  id v2 = (void *)hasselblad3FRRAWImageType_type;

  return (UTType *)v2;
}

uint64_t __51__PFUniformTypeUtilities_hasselblad3FRRAWImageType__block_invoke()
{
  hasselblad3FRRAWImageType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.hasselblad.3fr-raw-image"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)leafamericaRAWImageType
{
  if (leafamericaRAWImageType_onceToken[0] != -1) {
    dispatch_once(leafamericaRAWImageType_onceToken, &__block_literal_global_147);
  }
  id v2 = (void *)leafamericaRAWImageType_type;

  return (UTType *)v2;
}

uint64_t __49__PFUniformTypeUtilities_leafamericaRAWImageType__block_invoke()
{
  leafamericaRAWImageType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.leafamerica.raw-image"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)fujiRAWImageType
{
  if (fujiRAWImageType_onceToken[0] != -1) {
    dispatch_once(fujiRAWImageType_onceToken, &__block_literal_global_142);
  }
  id v2 = (void *)fujiRAWImageType_type;

  return (UTType *)v2;
}

uint64_t __42__PFUniformTypeUtilities_fujiRAWImageType__block_invoke()
{
  fujiRAWImageType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.fuji.raw-image"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)samsungRAWImageType
{
  if (samsungRAWImageType_onceToken[0] != -1) {
    dispatch_once(samsungRAWImageType_onceToken, &__block_literal_global_137);
  }
  id v2 = (void *)samsungRAWImageType_type;

  return (UTType *)v2;
}

uint64_t __45__PFUniformTypeUtilities_samsungRAWImageType__block_invoke()
{
  samsungRAWImageType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.samsung.raw-image"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)nikonRAWImageType
{
  if (nikonRAWImageType_onceToken[0] != -1) {
    dispatch_once(nikonRAWImageType_onceToken, &__block_literal_global_132);
  }
  id v2 = (void *)nikonRAWImageType_type;

  return (UTType *)v2;
}

uint64_t __43__PFUniformTypeUtilities_nikonRAWImageType__block_invoke()
{
  nikonRAWImageType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.nikon.raw-image"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)pentaxRAWImageType
{
  if (pentaxRAWImageType_onceToken[0] != -1) {
    dispatch_once(pentaxRAWImageType_onceToken, &__block_literal_global_127);
  }
  id v2 = (void *)pentaxRAWImageType_type;

  return (UTType *)v2;
}

uint64_t __44__PFUniformTypeUtilities_pentaxRAWImageType__block_invoke()
{
  pentaxRAWImageType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.pentax.raw-image"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)panasonicRAWImageType
{
  if (panasonicRAWImageType_onceToken[0] != -1) {
    dispatch_once(panasonicRAWImageType_onceToken, &__block_literal_global_122);
  }
  id v2 = (void *)panasonicRAWImageType_type;

  return (UTType *)v2;
}

uint64_t __47__PFUniformTypeUtilities_panasonicRAWImageType__block_invoke()
{
  panasonicRAWImageType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.panasonic.raw-image"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)panasonicRW2RAWImageType
{
  if (panasonicRW2RAWImageType_onceToken[0] != -1) {
    dispatch_once(panasonicRW2RAWImageType_onceToken, &__block_literal_global_117);
  }
  id v2 = (void *)panasonicRW2RAWImageType_type;

  return (UTType *)v2;
}

uint64_t __50__PFUniformTypeUtilities_panasonicRW2RAWImageType__block_invoke()
{
  panasonicRW2RAWImageType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.panasonic.rw2-raw-image"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)olympusRAWImageType
{
  if (olympusRAWImageType_onceToken[0] != -1) {
    dispatch_once(olympusRAWImageType_onceToken, &__block_literal_global_112);
  }
  id v2 = (void *)olympusRAWImageType_type;

  return (UTType *)v2;
}

uint64_t __45__PFUniformTypeUtilities_olympusRAWImageType__block_invoke()
{
  olympusRAWImageType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.olympus.raw-image"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)canonTIFFRAWImageType
{
  if (canonTIFFRAWImageType_onceToken[0] != -1) {
    dispatch_once(canonTIFFRAWImageType_onceToken, &__block_literal_global_107);
  }
  id v2 = (void *)canonTIFFRAWImageType_type;

  return (UTType *)v2;
}

uint64_t __47__PFUniformTypeUtilities_canonTIFFRAWImageType__block_invoke()
{
  canonTIFFRAWImageType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.canon.tif-raw-image"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)canonCRWRAWImageType
{
  if (canonCRWRAWImageType_onceToken[0] != -1) {
    dispatch_once(canonCRWRAWImageType_onceToken, &__block_literal_global_102);
  }
  id v2 = (void *)canonCRWRAWImageType_type;

  return (UTType *)v2;
}

uint64_t __46__PFUniformTypeUtilities_canonCRWRAWImageType__block_invoke()
{
  canonCRWRAWImageType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.canon.crw-raw-image"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)canonCR2RAWImageType
{
  if (canonCR2RAWImageType_onceToken[0] != -1) {
    dispatch_once(canonCR2RAWImageType_onceToken, &__block_literal_global_97);
  }
  id v2 = (void *)canonCR2RAWImageType_type;

  return (UTType *)v2;
}

uint64_t __46__PFUniformTypeUtilities_canonCR2RAWImageType__block_invoke()
{
  canonCR2RAWImageType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.canon.cr2-raw-image"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)sonyARWRAWImageType
{
  if (sonyARWRAWImageType_onceToken[0] != -1) {
    dispatch_once(sonyARWRAWImageType_onceToken, &__block_literal_global_92);
  }
  id v2 = (void *)sonyARWRAWImageType_type;

  return (UTType *)v2;
}

uint64_t __45__PFUniformTypeUtilities_sonyARWRAWImageType__block_invoke()
{
  sonyARWRAWImageType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.sony.arw-raw-image"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)jpegXLType
{
  if (jpegXLType_onceToken != -1) {
    dispatch_once(&jpegXLType_onceToken, &__block_literal_global_87);
  }
  id v2 = (void *)jpegXLType_type;

  return (UTType *)v2;
}

uint64_t __36__PFUniformTypeUtilities_jpegXLType__block_invoke()
{
  jpegXLType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"public.jpeg-xl"];

  return MEMORY[0x1F41817F8]();
}

+ (NSString)jpeg2000Identifier
{
  return (NSString *)@"public.jpeg-2000";
}

+ (UTType)jpeg2000Type
{
  if (jpeg2000Type_onceToken != -1) {
    dispatch_once(&jpeg2000Type_onceToken, &__block_literal_global_82);
  }
  id v2 = (void *)jpeg2000Type_type;

  return (UTType *)v2;
}

uint64_t __38__PFUniformTypeUtilities_jpeg2000Type__block_invoke()
{
  jpeg2000Type_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"public.jpeg-2000"];

  return MEMORY[0x1F41817F8]();
}

+ (NSString)macPaintIdentifier
{
  return (NSString *)@"com.apple.macpaint-image";
}

+ (UTType)macPaintType
{
  if (macPaintType_onceToken != -1) {
    dispatch_once(&macPaintType_onceToken, &__block_literal_global_77);
  }
  id v2 = (void *)macPaintType_type;

  return (UTType *)v2;
}

uint64_t __38__PFUniformTypeUtilities_macPaintType__block_invoke()
{
  macPaintType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.macpaint-image"];

  return MEMORY[0x1F41817F8]();
}

+ (NSString)icoIdentifier
{
  return (NSString *)@"com.microsoft.ico";
}

+ (UTType)icoType
{
  if (icoType_onceToken != -1) {
    dispatch_once(&icoType_onceToken, &__block_literal_global_72);
  }
  id v2 = (void *)icoType_type;

  return (UTType *)v2;
}

uint64_t __33__PFUniformTypeUtilities_icoType__block_invoke()
{
  icoType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.microsoft.ico"];

  return MEMORY[0x1F41817F8]();
}

+ (NSString)quicktimeImageIdentifier
{
  return (NSString *)@"com.apple.quicktime-image";
}

+ (UTType)quicktimeImageType
{
  if (quicktimeImageType_onceToken != -1) {
    dispatch_once(&quicktimeImageType_onceToken, &__block_literal_global_67);
  }
  id v2 = (void *)quicktimeImageType_type;

  return (UTType *)v2;
}

uint64_t __44__PFUniformTypeUtilities_quicktimeImageType__block_invoke()
{
  quicktimeImageType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.quicktime-image"];

  return MEMORY[0x1F41817F8]();
}

+ (NSString)pictIdentifier
{
  return (NSString *)@"com.apple.pict";
}

+ (UTType)pictType
{
  if (pictType_onceToken != -1) {
    dispatch_once(&pictType_onceToken, &__block_literal_global_62);
  }
  id v2 = (void *)pictType_type;

  return (UTType *)v2;
}

uint64_t __34__PFUniformTypeUtilities_pictType__block_invoke()
{
  pictType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.pict"];

  return MEMORY[0x1F41817F8]();
}

+ (NSString)heicSequenceIdentifier
{
  return (NSString *)@"public.heics";
}

+ (UTType)heicSequenceType
{
  if (heicSequenceType_onceToken[0] != -1) {
    dispatch_once(heicSequenceType_onceToken, &__block_literal_global_57);
  }
  id v2 = (void *)heicSequenceType_type;

  return (UTType *)v2;
}

uint64_t __42__PFUniformTypeUtilities_heicSequenceType__block_invoke()
{
  heicSequenceType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"public.heics"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)avifType
{
  if (avifType_onceToken[0] != -1) {
    dispatch_once(avifType_onceToken, &__block_literal_global_52);
  }
  id v2 = (void *)avifType_type;

  return (UTType *)v2;
}

uint64_t __34__PFUniformTypeUtilities_avifType__block_invoke()
{
  avifType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"public.avif"];

  return MEMORY[0x1F41817F8]();
}

+ (NSString)livePhotoBundlePrivateIdentifier
{
  return (NSString *)@"com.apple.private.live-photo-bundle";
}

+ (UTType)livePhotoBundlePrivateType
{
  if (livePhotoBundlePrivateType_onceToken[0] != -1) {
    dispatch_once(livePhotoBundlePrivateType_onceToken, &__block_literal_global_47);
  }
  id v2 = (void *)livePhotoBundlePrivateType_type;

  return (UTType *)v2;
}

uint64_t __52__PFUniformTypeUtilities_livePhotoBundlePrivateType__block_invoke()
{
  livePhotoBundlePrivateType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.private.live-photo-bundle"];

  return MEMORY[0x1F41817F8]();
}

+ (NSString)livePhotoBundleIdentifier
{
  return (NSString *)@"com.apple.live-photo-bundle";
}

+ (UTType)livePhotoBundleType
{
  if (livePhotoBundleType_onceToken[0] != -1) {
    dispatch_once(livePhotoBundleType_onceToken, &__block_literal_global_42);
  }
  id v2 = (void *)livePhotoBundleType_type;

  return (UTType *)v2;
}

uint64_t __45__PFUniformTypeUtilities_livePhotoBundleType__block_invoke()
{
  livePhotoBundleType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.live-photo-bundle"];

  return MEMORY[0x1F41817F8]();
}

+ (UTType)supplementalResourceAAEType
{
  if (supplementalResourceAAEType_onceToken != -1) {
    dispatch_once(&supplementalResourceAAEType_onceToken, &__block_literal_global_37);
  }
  id v2 = (void *)supplementalResourceAAEType_type;

  return (UTType *)v2;
}

uint64_t __53__PFUniformTypeUtilities_supplementalResourceAAEType__block_invoke()
{
  supplementalResourceAAEType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.photos.apple-adjustment-envelope"];

  return MEMORY[0x1F41817F8]();
}

+ (NSString)supplementalResourceXMPIdentifier
{
  return (NSString *)@"public.data";
}

+ (UTType)supplementalResourceXMPType
{
  if (supplementalResourceXMPType_onceToken[0] != -1) {
    dispatch_once(supplementalResourceXMPType_onceToken, &__block_literal_global_32);
  }
  id v2 = (void *)supplementalResourceXMPType_type;

  return (UTType *)v2;
}

uint64_t __53__PFUniformTypeUtilities_supplementalResourceXMPType__block_invoke()
{
  supplementalResourceXMPType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"public.data"];

  return MEMORY[0x1F41817F8]();
}

+ (NSString)adobeIllustratorIdentifier
{
  return (NSString *)@"com.adobe.illustrator.ai-image";
}

+ (UTType)adobeIllustratorType
{
  if (adobeIllustratorType_onceToken[0] != -1) {
    dispatch_once(adobeIllustratorType_onceToken, &__block_literal_global_27);
  }
  id v2 = (void *)adobeIllustratorType_type;

  return (UTType *)v2;
}

uint64_t __46__PFUniformTypeUtilities_adobeIllustratorType__block_invoke()
{
  adobeIllustratorType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.adobe.illustrator.ai-image"];

  return MEMORY[0x1F41817F8]();
}

+ (NSString)adobePhotoshopIdentifier
{
  return (NSString *)@"com.adobe.photoshop-image";
}

+ (UTType)adobePhotoshopType
{
  if (adobePhotoshopType_onceToken[0] != -1) {
    dispatch_once(adobePhotoshopType_onceToken, &__block_literal_global_22);
  }
  id v2 = (void *)adobePhotoshopType_type;

  return (UTType *)v2;
}

uint64_t __44__PFUniformTypeUtilities_adobePhotoshopType__block_invoke()
{
  adobePhotoshopType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.adobe.photoshop-image"];

  return MEMORY[0x1F41817F8]();
}

+ (NSString)apertureLibraryIdentifier
{
  return (NSString *)@"com.apple.aperture.library";
}

+ (UTType)apertureLibraryType
{
  if (apertureLibraryType_onceToken != -1) {
    dispatch_once(&apertureLibraryType_onceToken, &__block_literal_global_17);
  }
  id v2 = (void *)apertureLibraryType_type;

  return (UTType *)v2;
}

uint64_t __45__PFUniformTypeUtilities_apertureLibraryType__block_invoke()
{
  apertureLibraryType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.aperture.library"];

  return MEMORY[0x1F41817F8]();
}

+ (NSString)iPhotoLibraryIdentifier
{
  return (NSString *)@"com.apple.photo.library";
}

+ (UTType)iPhotoLibraryType
{
  if (iPhotoLibraryType_onceToken != -1) {
    dispatch_once(&iPhotoLibraryType_onceToken, &__block_literal_global_12);
  }
  id v2 = (void *)iPhotoLibraryType_type;

  return (UTType *)v2;
}

uint64_t __43__PFUniformTypeUtilities_iPhotoLibraryType__block_invoke()
{
  iPhotoLibraryType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.photo.library"];

  return MEMORY[0x1F41817F8]();
}

+ (NSString)photosLibraryIdentifier
{
  return (NSString *)@"com.apple.photos.library";
}

+ (UTType)photosLibraryType
{
  if (photosLibraryType_onceToken != -1) {
    dispatch_once(&photosLibraryType_onceToken, &__block_literal_global_2107);
  }
  id v2 = (void *)photosLibraryType_type;

  return (UTType *)v2;
}

uint64_t __43__PFUniformTypeUtilities_photosLibraryType__block_invoke()
{
  photosLibraryType_type = [MEMORY[0x1E4F442D8] typeWithIdentifier:@"com.apple.photos.library"];

  return MEMORY[0x1F41817F8]();
}

@end