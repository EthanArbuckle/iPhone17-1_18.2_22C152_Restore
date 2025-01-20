@interface PFXMPMetadataBuilder
+ (id)xmpCreateDateFormatter;
- (id)xmpData;
@end

@implementation PFXMPMetadataBuilder

+ (id)xmpCreateDateFormatter
{
  if (xmpCreateDateFormatter_onceToken != -1) {
    dispatch_once(&xmpCreateDateFormatter_onceToken, &__block_literal_global_217);
  }
  v2 = (void *)xmpCreateDateFormatter_xmpCreateDateFormatter;

  return v2;
}

uint64_t __46__PFXMPMetadataBuilder_xmpCreateDateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28D48]);
  v1 = (void *)xmpCreateDateFormatter_xmpCreateDateFormatter;
  xmpCreateDateFormatter_xmpCreateDateFormatter = (uint64_t)v0;

  v2 = (void *)xmpCreateDateFormatter_xmpCreateDateFormatter;

  return [v2 setFormatOptions:1907];
}

- (id)xmpData
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  Mutable = CGImageMetadataCreateMutable();
  v4 = [(PFMetadataBuilder *)self title];
  uint64_t v5 = [v4 length];
  v6 = (const __CFString **)MEMORY[0x1E4F2FB80];
  if (v5) {
    PIImageMedataSetValueMatchingImageProperty(Mutable, (const __CFString *)*MEMORY[0x1E4F2FB80], (const __CFString *)*MEMORY[0x1E4F2FBC8], v4);
  }
  v7 = [(PFMetadataBuilder *)self caption];
  if ([v7 length]) {
    PIImageMedataSetValueMatchingImageProperty(Mutable, *v6, (const __CFString *)*MEMORY[0x1E4F2FB58], v7);
  }
  v8 = [(PFMetadataBuilder *)self accessibilityDescription];
  if ([v8 length]) {
    PIImageMedataSetValueMatchingImageProperty(Mutable, *v6, (const __CFString *)*MEMORY[0x1E4F2FB98], v8);
  }
  v9 = [(PFMetadataBuilder *)self combinedKeywordsAndPeople];
  if ([v9 count]) {
    PIImageMedataSetValueMatchingImageProperty(Mutable, *v6, (const __CFString *)*MEMORY[0x1E4F2FBC0], v9);
  }
  v10 = [(PFMetadataBuilder *)self creationDate];
  if (v10)
  {
    v11 = [(id)objc_opt_class() xmpCreateDateFormatter];
    v12 = [(PFMetadataBuilder *)self creationTimeZone];
    [v11 setTimeZone:v12];

    v13 = [v11 stringFromDate:v10];
    PIImageMedataSetValueMatchingImageProperty(Mutable, (const __CFString *)*MEMORY[0x1E4F2F800], (const __CFString *)*MEMORY[0x1E4F2F7F0], v13);
  }
  v14 = [(PFMetadataBuilder *)self location];
  if (v14)
  {
    +[PFSharingUtilities gpsDictionaryForLocation:v14];
    v28 = v9;
    v15 = v8;
    v16 = v7;
    v18 = v17 = v4;
    v19 = (void *)[v18 mutableCopy];

    v20 = [(id)objc_opt_class() xmpCreateDateFormatter];
    v21 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v20 setTimeZone:v21];

    [v19 setObject:0 forKeyedSubscript:*MEMORY[0x1E4F2F9D0]];
    v22 = [v14 timestamp];
    v23 = [v20 stringFromDate:v22];
    [v19 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F2FA98]];

    v4 = v17;
    v7 = v16;
    v8 = v15;
    v9 = v28;
    uint64_t v24 = *MEMORY[0x1E4F2FA18];
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v30 = __PIUpdateMetadataValuesFromDicationary_block_invoke;
    v31 = &__block_descriptor_48_e15_v32__0_8_16_B24l;
    v32 = Mutable;
    uint64_t v33 = v24;
    [v19 enumerateKeysAndObjectsUsingBlock:&buf];
  }
  CFDataRef XMPData = CGImageMetadataCreateXMPData(Mutable, 0);
  if (!XMPData)
  {
    v26 = PFMetadataBuilderLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = Mutable;
      _os_log_error_impl(&dword_1A41FE000, v26, OS_LOG_TYPE_ERROR, "[XMP metadata builder] Failed create data from XMP metadata %@", (uint8_t *)&buf, 0xCu);
    }
  }
  CFRelease(Mutable);

  return XMPData;
}

@end