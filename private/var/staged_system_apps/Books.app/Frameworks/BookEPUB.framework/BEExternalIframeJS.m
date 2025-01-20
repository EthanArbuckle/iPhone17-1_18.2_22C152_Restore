@interface BEExternalIframeJS
- (BEDocumentLoadExternalResourcesController)documentLoadExternalResourcesController;
- (BEExternalIframeJS)init;
- (NSString)postApprovalToLoadScript;
- (NSURL)urlForExternalIframeAuthorization;
- (id)anyFrameJavascript:(int64_t)a3;
- (id)anyFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameJavascriptURL:(int64_t)a3;
- (id)mainFrameOnlyJavascript:(int64_t)a3;
- (id)preApprovalToLoadScriptForURL:(id)a3;
- (void)setDocumentLoadExternalResourcesController:(id)a3;
@end

@implementation BEExternalIframeJS

- (BEExternalIframeJS)init
{
  v6.receiver = self;
  v6.super_class = (Class)BEExternalIframeJS;
  v2 = [(BEExternalIframeJS *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(BEDocumentLoadExternalResourcesController);
    documentLoadExternalResourcesController = v2->_documentLoadExternalResourcesController;
    v2->_documentLoadExternalResourcesController = v3;
  }
  return v2;
}

- (NSString)postApprovalToLoadScript
{
  return (NSString *)@"__ibooks_external_iframe.refreshWithoutBlocker();";
}

- (NSURL)urlForExternalIframeAuthorization
{
  return [(BEDocumentLoadExternalResourcesController *)self->_documentLoadExternalResourcesController linkURLForAuthorization];
}

- (id)preApprovalToLoadScriptForURL:(id)a3
{
  v3 = [a3 absoluteString];
  v4 = +[NSJSONSerialization dataWithJSONObject:v3 options:4 error:0];

  id v5 = [objc_alloc((Class)NSString) initWithData:v4 encoding:4];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"__ibooks_external_iframe.addBlockedLink(%@);",
  objc_super v6 = v5);

  return v6;
}

- (id)mainFrameOnlyJavascript:(int64_t)a3
{
  return 0;
}

- (id)mainFrameJavascriptURL:(int64_t)a3
{
  return 0;
}

- (id)anyFrameJavascript:(int64_t)a3
{
  if (a3)
  {
    id v3 = 0;
  }
  else
  {
    id v5 = +[external_iframe source];
    objc_super v6 = [(BEDocumentLoadExternalResourcesController *)self->_documentLoadExternalResourcesController dataURLForPlaceholder];
    if ([v6 length])
    {
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"__ibooks_external_iframe.contentBlockerUrl='%@';",
      v7 = v6);
      id v3 = [v5 stringByAppendingString:v7];
    }
    else
    {
      id v3 = v5;
    }
  }

  return v3;
}

- (id)anyFrameJavascriptURL:(int64_t)a3
{
  if (a3)
  {
    id v3 = 0;
  }
  else
  {
    v4 = +[external_iframe sourceName];
    id v3 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v4);
  }

  return v3;
}

- (BEDocumentLoadExternalResourcesController)documentLoadExternalResourcesController
{
  return self->_documentLoadExternalResourcesController;
}

- (void)setDocumentLoadExternalResourcesController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end