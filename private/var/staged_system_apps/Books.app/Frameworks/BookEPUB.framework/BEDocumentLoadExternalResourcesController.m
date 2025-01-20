@interface BEDocumentLoadExternalResourcesController
- (BEDocumentLoadExternalResourcesController)init;
- (NSString)dataURLForPlaceholder;
- (NSURL)linkURLForAuthorization;
- (NSURL)linkURLForPlaceholder;
- (id)_defaultPlaceholderHTML;
- (id)_placeholderHTMLKeyWithIsInteractive:(BOOL)a3 themeClassName:(id)a4;
- (id)_preparePlaceholderHTMLWithIsInteractive:(BOOL)a3 themeClassName:(id)a4;
- (id)_templateStringForPlaceholder;
- (id)placeholderHTMLWithIsInteractive:(BOOL)a3 themeClassName:(id)a4;
@end

@implementation BEDocumentLoadExternalResourcesController

- (BEDocumentLoadExternalResourcesController)init
{
  v25.receiver = self;
  v25.super_class = (Class)BEDocumentLoadExternalResourcesController;
  v2 = [(BEDocumentLoadExternalResourcesController *)&v25 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    v4 = [v3 UUIDString];
    v5 = [v4 lowercaseString];

    id v6 = objc_alloc((Class)NSURL);
    v7 = +[NSString stringWithFormat:@"http://%@/", v5];
    v8 = (NSURL *)[v6 initWithString:v7];
    linkURLForPlaceholder = v2->_linkURLForPlaceholder;
    v2->_linkURLForPlaceholder = v8;

    v10 = +[NSUUID UUID];
    v11 = [v10 UUIDString];
    v12 = [v11 lowercaseString];

    id v13 = objc_alloc((Class)NSURL);
    v14 = +[NSString stringWithFormat:@"http://%@/", v12];
    v15 = (NSURL *)[v13 initWithString:v14];
    linkURLForAuthorization = v2->_linkURLForAuthorization;
    v2->_linkURLForAuthorization = v15;

    uint64_t v17 = +[NSMutableDictionary dictionary];
    placeholderHTMLs = v2->_placeholderHTMLs;
    v2->_placeholderHTMLs = (NSMutableDictionary *)v17;

    v19 = [(BEDocumentLoadExternalResourcesController *)v2 _defaultPlaceholderHTML];
    v20 = [v19 dataUsingEncoding:4];
    v21 = [v20 base64EncodedStringWithOptions:0];
    uint64_t v22 = +[NSString stringWithFormat:@"data:text/html;base64,%@", v21];
    dataURLForPlaceholder = v2->_dataURLForPlaceholder;
    v2->_dataURLForPlaceholder = (NSString *)v22;
  }
  return v2;
}

- (id)_placeholderHTMLKeyWithIsInteractive:(BOOL)a3 themeClassName:(id)a4
{
  return +[NSString stringWithFormat:@"isInteractive:%d::themeClassName:%@:", a3, a4];
}

- (id)placeholderHTMLWithIsInteractive:(BOOL)a3 themeClassName:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(BEDocumentLoadExternalResourcesController *)self _placeholderHTMLKeyWithIsInteractive:v4 themeClassName:v6];
  v8 = [(NSMutableDictionary *)self->_placeholderHTMLs objectForKey:v7];
  if (!v8)
  {
    v8 = [(BEDocumentLoadExternalResourcesController *)self _preparePlaceholderHTMLWithIsInteractive:v4 themeClassName:v6];
    [(NSMutableDictionary *)self->_placeholderHTMLs setObject:v8 forKey:v7];
  }

  return v8;
}

- (id)_defaultPlaceholderHTML
{
  return [(BEDocumentLoadExternalResourcesController *)self _preparePlaceholderHTMLWithIsInteractive:1 themeClassName:0];
}

- (id)_templateStringForPlaceholder
{
  v3 = BookEPUBBundle();
  BOOL v4 = [v3 pathForResource:@"BEExternalResourcesPlaceholder.html.tmpl" ofType:0];

  placeholderHTMLTemplate = self->_placeholderHTMLTemplate;
  if (placeholderHTMLTemplate) {
    goto LABEL_9;
  }
  if ([v4 length])
  {
    id v12 = 0;
    id v6 = +[NSString stringWithContentsOfFile:v4 encoding:4 error:&v12];
    id v7 = v12;
    v8 = self->_placeholderHTMLTemplate;
    self->_placeholderHTMLTemplate = v6;

    if (!self->_placeholderHTMLTemplate)
    {
      v9 = _BookEPUBLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v4;
        __int16 v15 = 2112;
        id v16 = v7;
        _os_log_impl(&def_7BFC0, v9, OS_LOG_TYPE_ERROR, "Failed to load external resources placeholder template {%@} -- %@", buf, 0x16u);
      }
    }
  }
  placeholderHTMLTemplate = self->_placeholderHTMLTemplate;
  if (placeholderHTMLTemplate) {
LABEL_9:
  }
    id v10 = [(NSString *)placeholderHTMLTemplate mutableCopy];
  else {
    id v10 = 0;
  }

  return v10;
}

- (id)_preparePlaceholderHTMLWithIsInteractive:(BOOL)a3 themeClassName:(id)a4
{
  BOOL v4 = a3;
  id v6 = (__CFString *)a4;
  id v7 = [(BEDocumentLoadExternalResourcesController *)self _templateStringForPlaceholder];
  v8 = @"iframe-epub-white";
  if (v6) {
    v8 = v6;
  }
  v9 = v8;
  id v10 = BookEPUBBundle();
  v11 = [v10 localizedStringForKey:@"Online Book Content" value:&stru_3D7B70 table:0];

  id v12 = BookEPUBBundle();
  id v13 = [v12 localizedStringForKey:@"Tap to View\\U2026" value:&stru_3D7B70 table:0];

  v14 = @"ButtonDisabled";
  if (v4) {
    v14 = &stru_3D7B70;
  }
  __int16 v15 = v14;
  [v7 replaceOccurrencesOfString:@"<!-- @@DOCUMENT_CLASS@@ -->" withString:v9 options:0 range:[v7 length]];

  [v7 replaceOccurrencesOfString:@"<!-- @@BUTTON_DISABLED_CLASS@@ -->" withString:v15 options:0 range:[v7 length]];
  id v16 = [(NSURL *)self->_linkURLForAuthorization absoluteString];
  [v7 replaceOccurrencesOfString:@"<!-- @@AUTHORIZATION_URL@@ -->" withString:v16 options:0 range:NSMakeRange(0, [v7 length])];

  [v7 replaceOccurrencesOfString:@"<!-- @@BUTTON_BODY_TEXT@@ -->" withString:v11 options:0 range:NSMakeRange(0, [v7 length])];
  [v7 replaceOccurrencesOfString:@"<!-- @@BUTTON_CAPTION_TEXT@@ -->" withString:v13 options:0 range:NSMakeRange(0, [v7 length])];

  return v7;
}

- (NSURL)linkURLForPlaceholder
{
  return self->_linkURLForPlaceholder;
}

- (NSURL)linkURLForAuthorization
{
  return self->_linkURLForAuthorization;
}

- (NSString)dataURLForPlaceholder
{
  return self->_dataURLForPlaceholder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataURLForPlaceholder, 0);
  objc_storeStrong((id *)&self->_linkURLForAuthorization, 0);
  objc_storeStrong((id *)&self->_linkURLForPlaceholder, 0);
  objc_storeStrong((id *)&self->_placeholderHTMLs, 0);

  objc_storeStrong((id *)&self->_placeholderHTMLTemplate, 0);
}

@end