@interface PPKImageWriter
+ (id)log;
- (BOOL)writeUsingBaseImage:(id)a3 annotationImage:(CGImage *)a4 asImageOfType:(id)a5 toConsumer:(CGDataConsumer *)a6 annotationMetadata:(id)a7 modifiedImageDescription:(id)a8 encryptPrivateMetadata:(BOOL)a9 error:(id *)a10;
- (id)encodedModelFromData:(int)a3 encrypt:;
- (void)writeUsingBaseImageData:(uint64_t)a3 annotationImage:(uint64_t)a4 asImageOfType:(uint64_t)a5 toConsumer:(uint64_t)a6 annotationMetadata:(uint64_t)a7 modifiedImageDescription:(char)a8 encryptPrivateMetadata:(uint64_t)a9 error:;
@end

@implementation PPKImageWriter

+ (id)log
{
  self;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)log__sharedLog;
  return v0;
}

uint64_t __21__PPKImageWriter_log__block_invoke()
{
  log__sharedLog = (uint64_t)os_log_create("com.apple.PaperKit", "image-writer");
  return MEMORY[0x270F9A758]();
}

- (void)writeUsingBaseImageData:(uint64_t)a3 annotationImage:(uint64_t)a4 asImageOfType:(uint64_t)a5 toConsumer:(uint64_t)a6 annotationMetadata:(uint64_t)a7 modifiedImageDescription:(char)a8 encryptPrivateMetadata:(uint64_t)a9 error:
{
  if (result)
  {
    LOBYTE(v9) = a8;
    return (void *)[result writeUsingBaseImage:a2 annotationImage:a3 asImageOfType:a4 toConsumer:a5 annotationMetadata:a6 modifiedImageDescription:a7 encryptPrivateMetadata:v9 error:a9];
  }
  return result;
}

- (BOOL)writeUsingBaseImage:(id)a3 annotationImage:(CGImage *)a4 asImageOfType:(id)a5 toConsumer:(CGDataConsumer *)a6 annotationMetadata:(id)a7 modifiedImageDescription:(id)a8 encryptPrivateMetadata:(BOOL)a9 error:(id *)a10
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  CFURLRef v16 = (const __CFURL *)a3;
  type = (__CFString *)a5;
  id v59 = a7;
  id v58 = a8;
  v17 = &kMetadataEncryptedModelTag;
  if (!a9) {
    v17 = &kMetadataModelTag;
  }
  name = *v17;
  objc_opt_class();
  v55 = self;
  CFURLRef v56 = v16;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v19 = 0;
LABEL_12:
      CGImageRef cf = 0;
      CFDictionaryRef options = 0;
      BOOL v24 = 0;
LABEL_15:
      Mutable = CGImageMetadataCreateMutable();
      goto LABEL_16;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    CGImageSourceRef v18 = CGImageSourceCreateWithURL(v16, 0);
  }
  else {
    CGImageSourceRef v18 = CGImageSourceCreateWithData(v16, 0);
  }
  v19 = v18;
  if (!v18) {
    goto LABEL_12;
  }
  uint64_t v69 = *MEMORY[0x263F0F5A0];
  uint64_t v70 = MEMORY[0x263EFFA88];
  CFDictionaryRef v20 = [NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
  CFDictionaryRef v21 = CGImageSourceCopyPropertiesAtIndex(v19, 0, v20);
  CFDictionaryRef options = (CFDictionaryRef)[(__CFDictionary *)v21 muDeepMutableCopy];

  v22 = CGImageSourceCopyMetadataAtIndex(v19, 0, 0);
  v23 = v22;
  BOOL v24 = v22 != 0;
  if (v22)
  {
    Mutable = CGImageMetadataCreateMutableCopy(v22);
    CFRelease(v23);
  }
  else
  {
    Mutable = 0;
  }
  CGImageRef cf = CGImageSourceCreateImageAtIndex(v19, 0, 0);

  if (!Mutable) {
    goto LABEL_15;
  }
LABEL_16:
  CFErrorRef err = 0;
  CGImageMetadataRegisterNamespaceForPrefix(Mutable, kMetadataNamespacePaperKit, kMetadataPrefixPaperKit, &err);
  if (v24)
  {
    v26 = [NSString stringWithFormat:@"%@:%@", kMetadataPrefixAnnotationKit, name, v55, v56, type];
    CGImageMetadataRemoveTagWithPath(Mutable, 0, v26);
    v27 = [NSString stringWithFormat:@"%@:%@", kMetadataPrefixPaperKit, name];
    CGImageMetadataRemoveTagWithPath(Mutable, 0, v27);
  }
  if (!cf)
  {
    v38 = +[PPKImageWriter log]();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_20C2D7000, v38, OS_LOG_TYPE_DEFAULT, "Failed to create a CGImageRef.", (uint8_t *)&buf, 2u);
    }
    v28 = 0;
    goto LABEL_38;
  }
  v28 = CGImageRetain(a4);
  v29 = CGImageDestinationCreateWithDataConsumer(a6, type, 1uLL, 0);
  if (!v29)
  {
    v38 = +[PPKImageWriter log]();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_20C2D7000, v38, OS_LOG_TYPE_DEFAULT, "Failed to create CGImageDestinationRef.", (uint8_t *)&buf, 2u);
    }
LABEL_38:
    BOOL v45 = 0;
    goto LABEL_52;
  }
  if (v59)
  {
    v30 = (void *)MEMORY[0x21054F8B0]();
    v31 = -[PPKImageWriter encodedModelFromData:encrypt:]((uint64_t)v55, v59, a9);
    v32 = [v31 base64EncodedStringWithOptions:0];
    v33 = CGImageMetadataTagCreate(kMetadataNamespacePaperKit, kMetadataPrefixPaperKit, name, kCGImageMetadataTypeString, v32);
    if (v33)
    {
      v34 = [NSString stringWithFormat:@"%@:%@", kMetadataPrefixPaperKit, name];
      CGImageMetadataSetTagWithPath(Mutable, 0, v34, v33);
      CFRelease(v33);
    }
  }
  uint64_t v35 = *MEMORY[0x263F0F4C8];
  [(__CFDictionary *)options setObject:&unk_26C180270 forKey:*MEMORY[0x263F0F4C8]];
  CFStringRef v36 = (const __CFString *)*MEMORY[0x263F0F518];
  v37 = [(__CFDictionary *)options objectForKey:*MEMORY[0x263F0F518]];
  v38 = v37;
  if (v37) {
    [v37 setObject:&unk_26C180270 forKey:v35];
  }
  CGImageMetadataSetValueMatchingImageProperty(Mutable, v36, (CFStringRef)*MEMORY[0x263F0F540], &unk_26C180270);
  size_t Width = CGImageGetWidth(v28);
  size_t Height = CGImageGetHeight(v28);
  v41 = [NSNumber numberWithUnsignedLong:Width];
  [(__CFDictionary *)options setObject:v41 forKey:*MEMORY[0x263F0F590]];

  v42 = [NSNumber numberWithUnsignedLong:Height];
  [(__CFDictionary *)options setObject:v42 forKey:*MEMORY[0x263F0F460]];

  if (!v58) {
    goto LABEL_47;
  }
  CFErrorRef v63 = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  v43 = (uint64_t (*)(CGImageMetadata *, id, CFErrorRef *))getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_ptr;
  v68 = getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_ptr;
  if (!getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v72 = __getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_block_invoke;
    v73 = &unk_2640D3AD8;
    v74 = &v65;
    __getMAImageCaptioningSetCaptionIntoMetadataSymbolLoc_block_invoke((uint64_t)&buf);
    v43 = (uint64_t (*)(CGImageMetadata *, id, CFErrorRef *))v66[3];
  }
  _Block_object_dispose(&v65, 8);
  if (!v43)
  {
    -[PPKImageWriter writeUsingBaseImage:annotationImage:asImageOfType:toConsumer:annotationMetadata:modifiedImageDescription:encryptPrivateMetadata:error:]();
    __break(1u);
  }
  if (v43(Mutable, v58, &v63)) {
    goto LABEL_47;
  }
  if (v63)
  {
    v44 = (__CFString *)CFErrorCopyDescription(v63);
    CFRelease(v63);
  }
  else
  {
    v44 = 0;
  }
  BOOL v46 = [(__CFString *)v44 length] == 0;
  v47 = +[PPKImageWriter log]();
  BOOL v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);
  if (v46)
  {
    if (v48)
    {
      LOWORD(buf) = 0;
      v49 = "Error setting image description into metadata";
      v50 = v47;
      uint32_t v51 = 2;
      goto LABEL_45;
    }
  }
  else if (v48)
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v44;
    v49 = "Error setting image description: %@";
    v50 = v47;
    uint32_t v51 = 12;
LABEL_45:
    _os_log_impl(&dword_20C2D7000, v50, OS_LOG_TYPE_DEFAULT, v49, (uint8_t *)&buf, v51);
  }

LABEL_47:
  CGImageDestinationAddImageAndMetadata(v29, v28, Mutable, options);
  BOOL v45 = CGImageDestinationFinalize(v29);
  if (!v45)
  {
    v52 = +[PPKImageWriter log]();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_20C2D7000, v52, OS_LOG_TYPE_DEFAULT, "CGImageDestinationFinalize failed.", (uint8_t *)&buf, 2u);
    }
  }
  CFRelease(v29);
LABEL_52:

  if (v19) {
    CFRelease(v19);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v28) {
    CFRelease(v28);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (a10) {
    char v53 = v45;
  }
  else {
    char v53 = 1;
  }
  if ((v53 & 1) == 0)
  {
    *a10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:512 userInfo:0];
  }

  return v45;
}

- (id)encodedModelFromData:(int)a3 encrypt:
{
  id v5 = a2;
  if (a1)
  {
    if (a3)
    {
      +[PPKPayloadEncryption sharedInstance]();
      v6 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = -[PPKPayloadEncryption encryptData:](v6, v5);

      id v5 = (id)v7;
    }
    id v5 = v5;
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)writeUsingBaseImage:annotationImage:asImageOfType:toConsumer:annotationMetadata:modifiedImageDescription:encryptPrivateMetadata:error:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getPXDisplayAssetViewClass_block_invoke_cold_1(v0);
}

@end