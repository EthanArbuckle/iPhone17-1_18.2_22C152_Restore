@interface GQUSimpleURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (id)canonicalRequestForRequest:(id)a3;
+ (void)setResourcesDictionary:(id)a3;
- (void)startLoading;
@end

@implementation GQUSimpleURLProtocol

+ (void)setResourcesDictionary:(id)a3
{
  v4 = objc_opt_class();
  objc_sync_enter(v4);
  id v5 = (id)qword_A4450;
  qword_A4450 = (uint64_t)a3;
  objc_sync_exit(v4);
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(a3, "URL"), "scheme");
  v4 = off_9CBA0;
  return [v3 isEqual:v4];
}

+ (id)canonicalRequestForRequest:(id)a3
{
  return a3;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return 0;
}

- (void)startLoading
{
  id v3 = objc_opt_class();
  objc_sync_enter(v3);
  id v4 = (id)qword_A4450;
  objc_sync_exit(v3);
  id v5 = objc_msgSend(-[GQUSimpleURLProtocol request](self, "request"), "URL");
  id v6 = [v5 resourceSpecifier];
  if (v6 && (v7 = v6, (id v8 = objc_msgSend(v4, "objectForKey:", objc_msgSend(v6, "lastPathComponent"))) != 0))
  {
    v9 = v8;
    v10 = (NSData *)[v8 objectForKey:kQLPreviewPropertyAttachmentDataKey];
    v11 = (__CFString *)[v9 objectForKey:kQLPreviewPropertyMIMETypeKey];
    id v12 = [v9 objectForKey:kQLPreviewPropertyTextEncodingNameKey];
    if (!v11)
    {
      v18 = (__CFString *)[v7 pathExtension];
      v11 = v18;
      if (v18)
      {
        if ([(__CFString *)v18 caseInsensitiveCompare:@"html"])
        {
          if ([(__CFString *)v11 caseInsensitiveCompare:@"xhtml"])
          {
            if ([(__CFString *)v11 caseInsensitiveCompare:@"pdf"]) {
              v11 = 0;
            }
            else {
              v11 = @"application/pdf";
            }
          }
          else
          {
            v11 = @"text/xhtml";
          }
        }
        else
        {
          v11 = @"text/html";
        }
      }
    }
    if (!v10) {
      v10 = +[NSData data];
    }
    id v13 = objc_msgSend(objc_alloc((Class)NSURLResponse), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", v5, v11, -[NSData length](v10, "length"), v12);
    objc_msgSend(-[GQUSimpleURLProtocol client](self, "client"), "URLProtocol:didReceiveResponse:cacheStoragePolicy:", self, v13, 2);

    objc_msgSend(-[GQUSimpleURLProtocol client](self, "client"), "URLProtocol:didLoadData:", self, v10);
    id v14 = [(GQUSimpleURLProtocol *)self client];
    objc_msgSend(v14, "URLProtocolDidFinishLoading:", self, v15);
  }
  else
  {
    v16 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSURLErrorDomain, -1008, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", [v5 absoluteString], NSURLErrorFailingURLStringErrorKey, 0));
    id v17 = [(GQUSimpleURLProtocol *)self client];
    [v17 URLProtocol:self didFailWithError:v16];
  }
}

@end