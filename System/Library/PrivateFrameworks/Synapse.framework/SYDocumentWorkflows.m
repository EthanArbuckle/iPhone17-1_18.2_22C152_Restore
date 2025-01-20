@interface SYDocumentWorkflows
+ (BOOL)isSupportedContentType:(id)a3;
+ (BOOL)isSupportedContentTypeTree:(id)a3;
+ (id)localizedStringRemove;
+ (id)localizedStringReply:(id)a3;
+ (id)localizedStringShowInAppWithBundleIdentifier:(id)a3 error:(id *)a4;
+ (id)localizedStringShowInMail;
@end

@implementation SYDocumentWorkflows

+ (BOOL)isSupportedContentType:(id)a3
{
  if (!a3)
  {
    v4 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[SYDocumentWorkflows isSupportedContentType:](v4);
    }
  }
  return a3 != 0;
}

+ (BOOL)isSupportedContentTypeTree:(id)a3
{
  return 1;
}

+ (id)localizedStringReply:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = NSString;
    v5 = _SYBundle();
    v6 = [v5 localizedStringForKey:@"Reply to %@" value:@"Reply to %@" table:@"Localizable"];
    v7 = [v3 preferredFormattedName];
    v8 = objc_msgSend(v4, "stringWithFormat:", v6, v7);
  }
  else
  {
    v5 = _SYBundle();
    v8 = [v5 localizedStringForKey:@"Reply" value:@"Reply" table:@"Localizable"];
  }

  return v8;
}

+ (id)localizedStringShowInMail
{
  v2 = _SYBundle();
  id v3 = [v2 localizedStringForKey:@"Show in Mail" value:@"Show in Mail" table:@"Localizable"];

  return v3;
}

+ (id)localizedStringShowInAppWithBundleIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v15 = 0;
  v6 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v5 allowPlaceholder:1 error:&v15];
  id v7 = v15;
  if (v6)
  {
    v8 = [v6 localizedName];
    v9 = NSString;
    v10 = _SYBundle();
    v11 = [v10 localizedStringForKey:@"Show in %@" value:@"Show in %@" table:@"Localizable"];
    v12 = objc_msgSend(v9, "stringWithFormat:", v11, v8);
  }
  else
  {
    v13 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[SYDocumentWorkflows localizedStringShowInAppWithBundleIdentifier:error:]((uint64_t)v5, (uint64_t)v7, v13);
    }

    v12 = 0;
    if (a4) {
      *a4 = v7;
    }
  }

  return v12;
}

+ (id)localizedStringRemove
{
  v2 = _SYBundle();
  id v3 = [v2 localizedStringForKey:@"Remove" value:@"Remove" table:@"Localizable"];

  return v3;
}

+ (void)isSupportedContentType:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
}

+ (void)localizedStringShowInAppWithBundleIdentifier:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1C2C5F000, log, OS_LOG_TYPE_ERROR, "Unable to find record for bundle identifier: %@, error: %@", (uint8_t *)&v3, 0x16u);
}

@end