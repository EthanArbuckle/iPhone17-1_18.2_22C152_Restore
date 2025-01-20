@interface PPKImageReader
+ (id)_privateImageMetadataDescriptors;
- (id)_readAnnotationsFromDataProvider:(CGDataProvider *)a3;
- (id)_readDataFromTagAtPath:(id)a3 inMetadata:(CGImageMetadata *)a4;
@end

@implementation PPKImageReader

- (id)_readAnnotationsFromDataProvider:(CGDataProvider *)a3
{
  v4 = CGImageSourceCreateWithDataProvider(a3, 0);
  if (v4)
  {
    v5 = v4;
    CGImageMetadataRef v6 = CGImageSourceCopyMetadataAtIndex(v4, 0, 0);
    if (v6)
    {
      CGImageMetadataRef v7 = v6;
      v8 = [NSString stringWithFormat:@"%@:%@", kMetadataPrefixPaperKit, kMetadataEncryptedModelTag];
      v9 = [(PPKImageReader *)self _readDataFromTagAtPath:v8 inMetadata:v7];
      +[PPKPayloadEncryption sharedInstance]();
      v10 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      v11 = -[PPKPayloadEncryption decryptData:](v10, v9);

      if (!v11)
      {
        v12 = +[PPKImageWriter log]();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20C2D7000, v12, OS_LOG_TYPE_DEFAULT, "Did not find enc_model, attempting to read unencrypted model", buf, 2u);
        }

        v13 = [NSString stringWithFormat:@"%@:%@", kMetadataPrefixPaperKit, kMetadataModelTag];
        v11 = [(PPKImageReader *)self _readDataFromTagAtPath:v13 inMetadata:v7];
      }
      CFRelease(v7);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)_readDataFromTagAtPath:(id)a3 inMetadata:(CGImageMetadata *)a4
{
  v4 = CGImageMetadataCopyTagWithPath(a4, 0, (CFStringRef)a3);
  if (v4)
  {
    v5 = v4;
    CFTypeRef v6 = CGImageMetadataTagCopyValue(v4);
    if (v6)
    {
      CGImageMetadataRef v7 = (void *)v6;
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 == CFStringGetTypeID())
      {
        v9 = (objc_class *)MEMORY[0x263EFF8F8];
        id v10 = v7;
        v11 = (void *)[[v9 alloc] initWithBase64EncodedString:v10 options:0];
      }
      else
      {
        v11 = 0;
      }
      CFRelease(v7);
    }
    else
    {
      v11 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (id)_privateImageMetadataDescriptors
{
  v9[2] = *MEMORY[0x263EF8340];
  v8[0] = kMetadataPrefixAnnotationKit;
  v7[0] = kMetadataEncryptedBaseImageModelTag;
  v7[1] = kMetadataBaseImageTag;
  v7[2] = kMetadataEncryptedModelTag;
  v7[3] = kMetadataModelTag;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:4];
  v9[0] = v2;
  v8[1] = kMetadataPrefixPaperKit;
  v6[0] = kMetadataEncryptedModelTag;
  v6[1] = kMetadataModelTag;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  v9[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v4;
}

@end