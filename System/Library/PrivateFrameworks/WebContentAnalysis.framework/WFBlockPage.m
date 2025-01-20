@interface WFBlockPage
- (NSString)formActionURLString;
- (NSString)userVisibleURLString;
- (NSURL)pageTemplateURL;
- (WFBlockPage)initWithUsername:(id)a3 overridesAllowded:(BOOL)a4;
- (id)_css;
- (id)_fileContentWithName:(id)a3 extension:(id)a4;
- (id)_initWithUsername:(id)a3 fileName:(id)a4;
- (id)initNoOveridePageWithUsername:(id)a3;
- (id)page;
- (void)_blockpage;
- (void)dealloc;
- (void)page;
- (void)setFormActionURLString:(id)a3;
- (void)setUserVisibleURLString:(id)a3;
@end

@implementation WFBlockPage

- (id)initNoOveridePageWithUsername:(id)a3
{
  return [(WFBlockPage *)self _initWithUsername:a3 fileName:@"blockpage-nooverride"];
}

- (WFBlockPage)initWithUsername:(id)a3 overridesAllowded:(BOOL)a4
{
  v22.receiver = self;
  v22.super_class = (Class)WFBlockPage;
  v6 = [(WFBlockPage *)&v22 init];
  if (v6)
  {
    v7 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = PreferredLanguageForUserName((uint64_t)a3);
    if (v8) {
      v9 = (__CFString *)v8;
    }
    else {
      v9 = @"English";
    }
    v6->preferredLanguage = (NSString *)v9;
    v10 = @"blockpage";
    if (!a4) {
      v10 = (__CFString *)[NSString stringWithFormat:@"%@-nooverride", @"blockpage"];
    }
    uint64_t v11 = [v7 URLForResource:v10 withExtension:@"html" subdirectory:0 localization:v9];
    v6->pageTemplateURL = (NSURL *)v11;
    if (!v11)
    {
      v12 = __WFDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[WFBlockPage initWithUsername:overridesAllowded:](v12, v13, v14, v15, v16, v17, v18, v19);
      }
    }
    v20 = v6->pageTemplateURL;
  }
  return v6;
}

- (id)_initWithUsername:(id)a3 fileName:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)WFBlockPage;
  v6 = [(WFBlockPage *)&v21 init];
  if (v6)
  {
    v7 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = PreferredLanguageForUserName((uint64_t)a3);
    if (v8) {
      v9 = (__CFString *)v8;
    }
    else {
      v9 = @"English";
    }
    v6->preferredLanguage = (NSString *)v9;
    uint64_t v10 = [v7 URLForResource:a4 withExtension:@"html" subdirectory:0 localization:v9];
    v6->pageTemplateURL = (NSURL *)v10;
    if (!v10)
    {
      uint64_t v11 = __WFDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[WFBlockPage _initWithUsername:fileName:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
    uint64_t v19 = v6->pageTemplateURL;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WFBlockPage;
  [(WFBlockPage *)&v3 dealloc];
}

- (id)_fileContentWithName:(id)a3 extension:(id)a4
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "URLForResource:withExtension:subdirectory:localization:", a3, a4, 0, self->preferredLanguage);
  if (v5)
  {
    uint64_t v16 = 0;
    v6 = (void *)[NSString stringWithContentsOfURL:v5 encoding:4 error:&v16];
    if (!v6)
    {
      v7 = __WFDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[WFBlockPage _fileContentWithName:extension:]((uint64_t)a3, &v16, v7);
      }
    }
  }
  else
  {
    uint64_t v8 = __WFDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[WFBlockPage _fileContentWithName:extension:]((uint64_t)a3, v8, v9, v10, v11, v12, v13, v14);
    }
    return 0;
  }
  return v6;
}

- (id)_css
{
  return [(WFBlockPage *)self _fileContentWithName:@"blockpage_style" extension:@"css"];
}

- (id)page
{
  id v3 = [(WFBlockPage *)self _blockpage];
  if (!v3)
  {
    v7 = __WFDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WFBlockPage page](v7);
    }
    return 0;
  }
  v4 = v3;
  if (self->userVisibleURLString)
  {
    uint64_t v5 = objc_msgSend(NSURL, "URLWithString:");
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = objc_msgSend(v5, "_lp_simplifiedDisplayString");
    }
    else {
      uint64_t v6 = [v5 absoluteString];
    }
    v4 = (void *)[v4 stringByReplacingOccurrencesOfString:@"USER_VISIBLE_RESTRICTED_URL_NO_LOC" withString:v6];
  }
  if (self->formActionURLString) {
    v4 = objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", @"UNBLOCK_URL_NO_LOC");
  }
  id v8 = [(WFBlockPage *)self _css];
  if (!v8) {
    return v4;
  }
  return (id)[v4 stringByReplacingOccurrencesOfString:@"INCLUDE_CSS_FILE_NO_LOC" withString:v8];
}

- (NSURL)pageTemplateURL
{
  return self->pageTemplateURL;
}

- (NSString)userVisibleURLString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUserVisibleURLString:(id)a3
{
}

- (NSString)formActionURLString
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFormActionURLString:(id)a3
{
}

- (void)initWithUsername:(uint64_t)a3 overridesAllowded:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_initWithUsername:(uint64_t)a3 fileName:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_blockpage
{
}

- (void)_fileContentWithName:(uint64_t)a3 extension:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_fileContentWithName:(os_log_t)log extension:.cold.2(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_217734000, log, OS_LOG_TYPE_ERROR, "**** error loading:%@ error:%@", (uint8_t *)&v4, 0x16u);
}

- (void)page
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_217734000, log, OS_LOG_TYPE_ERROR, "**** ERROR block page is nil", v1, 2u);
}

@end