@interface SYDocumentWorkflowsContentType
+ (BOOL)isImageContentType:(id)a3;
+ (BOOL)isMSWordContentType:(id)a3;
+ (BOOL)isPDFContentType:(id)a3;
+ (BOOL)isPagesContentType:(id)a3;
@end

@implementation SYDocumentWorkflowsContentType

+ (BOOL)isPagesContentType:(id)a3
{
  id v3 = a3;
  BOOL v4 = ![v3 caseInsensitiveCompare:@"com.apple.iwork.pages.pages"]
    || ![v3 caseInsensitiveCompare:@"com.apple.iwork.pages.sffpages"]
    || ![v3 caseInsensitiveCompare:@"com.apple.iwork.pages.template"]
    || [v3 caseInsensitiveCompare:@"com.apple.iwork.pages.sfftemplate"] == 0;

  return v4;
}

+ (BOOL)isMSWordContentType:(id)a3
{
  id v3 = a3;
  if ([v3 caseInsensitiveCompare:@"com.microsoft.word.doc"]) {
    BOOL v4 = [v3 caseInsensitiveCompare:@"com.microsoft.word.docx"] == 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

+ (BOOL)isPDFContentType:(id)a3
{
  return [a3 caseInsensitiveCompare:@"com.adobe.pdf"] == 0;
}

+ (BOOL)isImageContentType:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v3];
  if (!v4)
  {
    v5 = os_log_create("com.apple.synapse", "DocumentWorkflows");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[SYDocumentWorkflowsContentType isImageContentType:]((uint64_t)v3, v5);
    }
  }
  char v6 = [v4 conformsToType:*MEMORY[0x1E4F44400]];

  return v6;
}

+ (void)isImageContentType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "Unknown content type: %@", (uint8_t *)&v2, 0xCu);
}

@end