@interface QLPreviewConverterURLProtocol
+ (id)_errorForNoPreview;
+ (id)protocolScheme;
+ (void)initialize;
+ (void)registerPreview:(id)a3;
+ (void)unregisterURLs:(id)a3 andPreview:(id)a4;
@end

@implementation QLPreviewConverterURLProtocol

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = (NSObject **)MEMORY[0x1E4F945F0];
    v4 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1E2805000, v4, OS_LOG_TYPE_DEFAULT, " #Conversion", v5, 2u);
    }
    [MEMORY[0x1E4F290C0] registerClass:a1];
  }
}

+ (void)registerPreview:(id)a3
{
  id v4 = a3;
  id v5 = [v4 previewURL];
  [a1 registerPreview:v4 forPreviewURL:v5];
}

+ (id)_errorForNoPreview
{
  id v2 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v3 = QLLocalizedStringFromTable(@"This file cannot be previewed", @"Errors");
  uint64_t v4 = *MEMORY[0x1E4F28568];
  id v5 = QLLocalizedStringFromTable(@"It might be corrupted or of an unknown file format.", @"Errors");
  v6 = objc_msgSend(v2, "initWithObjectsAndKeys:", v3, v4, v5, *MEMORY[0x1E4F285A0], 0);

  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"QuickLookErrorDomain" code:912 userInfo:v6];
  return v7;
}

+ (void)unregisterURLs:(id)a3 andPreview:(id)a4
{
  id v6 = a3;
  id v7 = [a4 previewURL];
  [a1 unregisterURLs:v6 andPreviewURL:v7];
}

+ (id)protocolScheme
{
  return @"x-apple-ql-id";
}

@end