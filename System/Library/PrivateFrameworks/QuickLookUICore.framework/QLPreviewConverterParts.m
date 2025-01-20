@interface QLPreviewConverterParts
+ (Class)urlProtocolClass;
+ (void)registerPreview:(id)a3;
+ (void)unregisterPreview:(id)a3;
- (BOOL)htmlErrorDisabled;
- (BOOL)isCancelled;
- (BOOL)isComputed;
- (BOOL)progressive;
- (BOOL)shouldRemoveURLAfterGeneration;
- (NSData)data;
- (NSString)fileName;
- (NSString)password;
- (NSString)uti;
- (NSURL)url;
- (NSURLConnection)connection;
- (NSURLResponse)previewResponse;
- (float)pageHeight;
- (float)pageWidth;
- (id)delegate;
- (id)mimeTypeForAttachmentURL:(id)a3;
- (id)newAttachmentURLWithID:(id)a3 properties:(id)a4;
- (id)previewRequest;
- (id)safeRequestForRequest:(id)a3;
- (int64_t)pageCount;
- (void)appendData:(id)a3 forURL:(id)a4 lastChunk:(BOOL)a5;
- (void)cancel;
- (void)computePreviewInThread;
- (void)dealloc;
- (void)registerURL:(id)a3 mimeType:(id)a4 textEncoding:(id)a5;
- (void)setConnection:(id)a3;
- (void)setData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setFileName:(id)a3;
- (void)setHtmlErrorDisabled:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setProgressive:(BOOL)a3;
- (void)setShouldRemoveURLAfterGeneration:(BOOL)a3;
- (void)setUrl:(id)a3;
- (void)setUti:(id)a3;
- (void)startComputingPreview;
- (void)startDataRepresentationWithContentType:(id)a3 properties:(id)a4;
@end

@implementation QLPreviewConverterParts

+ (Class)urlProtocolClass
{
  return (Class)objc_opt_class();
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  if (WeakRetained != obj)
  {
    v6 = self;
    objc_sync_enter(v6);
    objc_storeWeak(p_delegate, obj);
    objc_sync_exit(v6);
  }
}

+ (void)registerPreview:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_sync_enter(v3);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v3 setRegisteredURLs:v4];

  v5 = [v3 fileName];
  id v6 = +[QLPreviewURLProtocol newUniqueURLWithName:v5];
  [v3 setPreviewURL:v6];

  v7 = (void **)MEMORY[0x1E4F945F0];
  v8 = (void *)*MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    v8 = *v7;
  }
  v9 = v8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v3 previewURL];
    v11 = [v10 description];
    int v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_1E2805000, v9, OS_LOG_TYPE_DEFAULT, "%@ #Conversion", (uint8_t *)&v12, 0xCu);
  }
  +[QLPreviewConverterURLProtocol registerPreview:v3];
  objc_sync_exit(v3);
}

+ (void)unregisterPreview:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (NSObject **)MEMORY[0x1E4F945F0];
  v5 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    v7 = [v3 previewURL];
    v8 = [v7 description];
    int v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_1E2805000, v6, OS_LOG_TYPE_DEFAULT, "%@ #Conversion", (uint8_t *)&v12, 0xCu);
  }
  v9 = v3;
  objc_sync_enter(v9);
  v10 = [v9 registeredURLs];
  +[QLPreviewConverterURLProtocol unregisterURLs:v10 andPreview:v9];

  [v9 setRegisteredURLs:0];
  [v9 setPreviewURL:0];
  v11 = (void *)v9[15];
  v9[15] = 0;

  objc_sync_exit(v9);
}

- (void)dealloc
{
  [(QLPreviewConverterParts *)self setUrl:0];
  [(QLPreviewConverterParts *)self setData:0];
  [(QLPreviewConverterParts *)self setFileName:0];
  [(QLPreviewConverterParts *)self setUti:0];
  [(QLPreviewConverterParts *)self setPassword:0];
  [(QLPreviewConverterParts *)self setConnection:0];
  [(QLPreviewConverterParts *)self setDelegate:0];
  delegateCallbackThread = self->delegateCallbackThread;
  self->delegateCallbackThread = 0;

  mainError = self->mainError;
  self->mainError = 0;

  v5.receiver = self;
  v5.super_class = (Class)QLPreviewConverterParts;
  [(QLPreviewParts *)&v5 dealloc];
}

- (void)cancel
{
  self->cancelled = 1;
}

- (id)safeRequestForRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 URL];
  if ([v5 isFileURL])
  {
    id v6 = [(QLPreviewParts *)self voidRequest];
    goto LABEL_14;
  }
  v7 = [v4 HTTPMethod];
  v8 = v7;
  if (!v7 || ![v7 caseInsensitiveCompare:@"get"])
  {
    v9 = [v5 scheme];
    v10 = [v9 lowercaseString];

    if ([v10 isEqual:@"about"])
    {
      id v11 = v4;
    }
    else
    {
      if (([v10 isEqual:@"applewebdata"] & 1) == 0
        && ![v10 isEqual:@"data"])
      {
        v13 = self;
        objc_sync_enter(v13);
        uint64_t v14 = [(QLPreviewParts *)v13 previewURL];

        if (!v14) {
          goto LABEL_23;
        }
        v15 = [(QLPreviewParts *)v13 previewURL];
        char v16 = [v5 isEqual:v15];

        if (v16) {
          goto LABEL_19;
        }
        if (!objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "urlProtocolClass"), "isSafeRequest:", v4))goto LABEL_23; {
        v18 = [v5 host];
        }
        v19 = [(QLPreviewParts *)v13 previewURL];
        v20 = [v19 host];
        char v21 = [v18 isEqual:v20];

        if ((v21 & 1) != 0
          || ([(QLPreviewParts *)v13 registeredURLs],
              v22 = objc_claimAutoreleasedReturnValue(),
              char v23 = [v22 containsObject:v5],
              v22,
              (v23 & 1) != 0))
        {
LABEL_19:
          id v17 = v4;
        }
        else
        {
LABEL_23:
          id v17 = [(QLPreviewParts *)v13 voidRequest];
        }
        id v6 = v17;
        objc_sync_exit(v13);

        goto LABEL_12;
      }
      id v11 = [(QLPreviewParts *)self requestForURL:v5];
    }
    id v6 = v11;
LABEL_12:

    goto LABEL_13;
  }
  id v6 = [(QLPreviewParts *)self voidRequest];
LABEL_13:

LABEL_14:
  return v6;
}

- (void)startComputingPreview
{
  id v3 = [MEMORY[0x1E4F29060] currentThread];
  delegateCallbackThread = self->delegateCallbackThread;
  self->delegateCallbackThread = v3;

  v5.receiver = self;
  v5.super_class = (Class)QLPreviewConverterParts;
  [(QLPreviewParts *)&v5 startComputingPreview];
}

- (void)computePreviewInThread
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [(QLPreviewParts *)self setOutstandingURLs:v3];

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(QLPreviewParts *)self setEncodingsForURLs:v4];

  id obj = self;
  objc_sync_enter(obj);
  objc_super v5 = [(QLPreviewParts *)obj previewURL];

  if (v5)
  {
    id v6 = [(QLPreviewParts *)obj outstandingURLs];
    v7 = [(QLPreviewParts *)obj previewURL];
    [v6 addObject:v7];

    objc_sync_exit(obj);
    v8 = (NSObject **)MEMORY[0x1E4F945F0];
    v9 = *MEMORY[0x1E4F945F0];
    if (!*MEMORY[0x1E4F945F0])
    {
      QLSInitLogging();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2805000, v9, OS_LOG_TYPE_DEFAULT, "will compute preview #Conversion", buf, 2u);
    }
    if (![(QLPreviewConverterParts *)obj isCancelled]) {
      [(QLPreviewConverterParts *)obj computePreview];
    }
    v10 = *v8;
    if (!*v8)
    {
      QLSInitLogging();
      v10 = *v8;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2805000, v10, OS_LOG_TYPE_DEFAULT, "did compute preview #Conversion", buf, 2u);
    }
    id v11 = obj;
    data = obj->_data;
    if (data)
    {
      obj->_data = 0;

      id v11 = obj;
    }
    if (v11->_url && v11->_shouldRemoveURLAfterGeneration)
    {
      v13 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v14 = *v8;
      if (!*v8)
      {
        QLSInitLogging();
        uint64_t v14 = *v8;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        url = obj->_url;
        *(_DWORD *)buf = 138412290;
        v64 = url;
        _os_log_impl(&dword_1E2805000, v14, OS_LOG_TYPE_DEFAULT, "Deleting temporary file created for the conversion %@. #Conversion", buf, 0xCu);
      }
      char v16 = obj->_url;
      id v61 = 0;
      char v17 = [v13 removeItemAtURL:v16 error:&v61];
      v18 = (NSURL *)v61;
      if ((v17 & 1) == 0)
      {
        v19 = *v8;
        if (!*v8)
        {
          QLSInitLogging();
          v19 = *v8;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v64 = v18;
          _os_log_impl(&dword_1E2805000, v19, OS_LOG_TYPE_DEFAULT, "Problem deleting the temporary file for the preview converter (%@) #Conversion", buf, 0xCu);
        }
      }
      v20 = obj->_url;
      obj->_url = 0;

      id v11 = obj;
    }
    BOOL v21 = [(QLPreviewConverterParts *)v11 htmlErrorDisabled];
    v22 = obj;
    objc_sync_enter(v22);
    char v23 = [(QLPreviewParts *)v22 registeredURLs];
    v24 = [(QLPreviewParts *)v22 previewURL];
    int v25 = [v23 containsObject:v24];

    int v26 = v21 | v25;
    if ([(NSError *)v22->mainError code] == 4)
    {
      v27 = [(NSError *)v22->mainError domain];
      int v28 = [v27 isEqualToString:@"QuickLookErrorDomain"];

      objc_sync_exit(v22);
      if ((v26 | v28)) {
        goto LABEL_41;
      }
    }
    else
    {
      objc_sync_exit(v22);

      if (v26)
      {
LABEL_41:
        v39 = [(QLPreviewParts *)v22 outstandingURLs];
        BOOL v40 = [v39 count] == 0;

        if (!v40)
        {
          v41 = +[QLPreviewConverterURLProtocol _errorForNoPreview];
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          id obja = [(QLPreviewParts *)v22 outstandingURLs];
          uint64_t v42 = [obja countByEnumeratingWithState:&v57 objects:v62 count:16];
          if (v42)
          {
            uint64_t v43 = *(void *)v58;
            do
            {
              for (uint64_t i = 0; i != v42; ++i)
              {
                if (*(void *)v58 != v43) {
                  objc_enumerationMutation(obja);
                }
                v45 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                v46 = [(QLPreviewParts *)v22 previewURL];
                int v47 = [v45 isEqual:v46];

                if (v47)
                {
                  mainError = v22->mainError;
                  if (!mainError) {
                    mainError = v41;
                  }
                  v49 = mainError;
                  +[QLPreviewURLProtocol setError:v49 forURL:v45];
                  id WeakRetained = objc_loadWeakRetained(&v22->_delegate);
                  char v51 = objc_opt_respondsToSelector();

                  if (v51)
                  {
                    v52 = [[QLThreadInvoker alloc] initWithConnection:v22->_connection data:0 error:v49];
                    delegateCallbackThread = v22->delegateCallbackThread;
                    id v54 = objc_loadWeakRetained(&v22->_delegate);
                    [(QLThreadInvoker *)v52 performSelector:sel_connectionDidFailWithError_ onThread:delegateCallbackThread withObject:v54 waitUntilDone:0];
                  }
                }
                else
                {
                  +[QLPreviewURLProtocol setError:v41 forURL:v45];
                }
              }
              uint64_t v42 = [obja countByEnumeratingWithState:&v57 objects:v62 count:16];
            }
            while (v42);
          }
        }
        [(QLPreviewParts *)v22 setOutstandingURLs:0];
        [(QLPreviewParts *)v22 setEncodingsForURLs:0];
        if (![(QLPreviewConverterParts *)v22 isCancelled]) {
          v22->computed = 1;
        }
        return;
      }
    }
    v29 = *v8;
    if (!*v8)
    {
      QLSInitLogging();
      v29 = *v8;
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2805000, v29, OS_LOG_TYPE_DEFAULT, "Preview failed #Conversion", buf, 2u);
    }
    v30 = v22->mainError;
    if (v30)
    {
      v31 = v30;
    }
    else
    {
      v31 = +[QLPreviewConverterURLProtocol _errorForNoPreview];
    }
    v32 = v31;
    v33 = [(NSError *)v31 localizedDescription];
    v34 = [(NSError *)v32 localizedRecoverySuggestion];
    objc_msgSend(NSString, "stringWithFormat:", @"<html><meta name=\"viewport\" content=\"width=device-width, minimum-scale=1.0, maximum-scale=1.6\"><style type=\"text/css\"> div {font-family: Arial;font-size: 18;}</style><body><div align=\"center\"><br><b>%@</b></div><br><div align=\"center\">%@</div></body></html>",
      v33,
    v35 = v34);
    v36 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"text/html", @"MimeType", @"UTF-8", @"TextEncoding", 0);
    v37 = [(id)*MEMORY[0x1E4F443F0] identifier];
    [(QLPreviewConverterParts *)v22 startDataRepresentationWithContentType:v37 properties:v36];

    v38 = [v35 dataUsingEncoding:4];
    [(QLPreviewConverterParts *)v22 appendData:v38 forURL:0 lastChunk:0];

    goto LABEL_41;
  }
  [(QLPreviewParts *)obj setOutstandingURLs:0];
  [(QLPreviewParts *)obj setEncodingsForURLs:0];
  objc_sync_exit(obj);
}

- (BOOL)isCancelled
{
  if (self->cancelled) {
    return 1;
  }
  id v3 = [(QLPreviewParts *)self previewURL];
  BOOL v2 = v3 == 0;

  return v2;
}

- (BOOL)isComputed
{
  return self->computed;
}

- (void)registerURL:(id)a3 mimeType:(id)a4 textEncoding:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)QLPreviewConverterParts;
  [(QLPreviewParts *)&v13 registerURL:v8 mimeType:v9 textEncoding:a5];
  previewResponse = self->previewResponse;
  if (previewResponse)
  {
    id v11 = [(NSURLResponse *)previewResponse URL];
    int v12 = [v11 isEqual:v8];

    if (v12) {
      [(NSURLResponse *)self->previewResponse _setMIMEType:v9];
    }
  }
}

- (void)startDataRepresentationWithContentType:(id)a3 properties:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v6 = a4;
  v7 = (NSObject **)MEMORY[0x1E4F945F0];
  id v8 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    id v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v49 = v38;
    __int16 v50 = 2112;
    id v51 = v6;
    _os_log_impl(&dword_1E2805000, v8, OS_LOG_TYPE_DEFAULT, "contentType = %@, properties = %@ #Conversion", buf, 0x16u);
  }
  BOOL v40 = v6;
  id v9 = self;
  objc_sync_enter(v9);
  id obj = v9;
  v10 = [(QLPreviewParts *)v9 previewURL];
  LOBYTE(v9) = v10 == 0;

  if ((v9 & 1) == 0)
  {
    uint64_t v11 = 134217984;
    if (!v6)
    {
      v37 = 0;
      theString = 0;
      goto LABEL_24;
    }
    theString = [v6 objectForKey:@"TextEncoding"];
    if (theString)
    {
      CFStringEncoding v12 = CFStringConvertIANACharSetNameToEncoding(theString);
      if (v12 == -1) {
        uint64_t v11 = 134217984;
      }
      else {
        uint64_t v11 = v12;
      }
    }
    v37 = [v6 objectForKey:@"MimeType"];
    objc_super v13 = [v6 objectForKey:@"HTMLPageCount"];
    uint64_t v14 = v13;
    if (v13) {
      obj->_pageCount = (int)[v13 intValue];
    }
    v15 = [v6 objectForKey:@"Width"];

    if (v15)
    {
      [v15 floatValue];
    }
    else
    {
      char v17 = [v6 objectForKey:@"HTMLWidth"];
      v15 = v17;
      if (!v17)
      {
LABEL_19:
        v18 = [v6 objectForKey:@"Height"];

        if (v18)
        {
          [v18 floatValue];
LABEL_23:
          obj->_pageHeight = v19;

          goto LABEL_24;
        }
        v20 = [v6 objectForKey:@"HTMLHeight"];
        v18 = v20;
        if (v20)
        {
          [v20 floatValue];
          goto LABEL_23;
        }
LABEL_24:
        BOOL v21 = [(QLPreviewParts *)obj encodingsForURLs];
        v22 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v11];
        char v23 = [(QLPreviewParts *)obj previewURL];
        [v21 setObject:v22 forKey:v23];

        v24 = [(QLPreviewParts *)obj previewURL];
        [(QLPreviewConverterParts *)obj registerURL:v24 mimeType:v37 textEncoding:theString];

        [v6 objectForKey:@"Attachments"];
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v26)
        {
          uint64_t v41 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v44 != v41) {
                objc_enumerationMutation(v25);
              }
              uint64_t v28 = *(void *)(*((void *)&v43 + 1) + 8 * i);
              v29 = [v25 objectForKey:v28];
              v30 = [v29 objectForKey:@"MimeType"];
              v31 = [v29 objectForKey:@"TextEncoding"];
              v32 = [v29 objectForKey:@"AttachmentData"];
              v33 = (void *)MEMORY[0x1E4F1CB10];
              v34 = [(QLPreviewParts *)obj previewURL];
              v35 = [v33 URLWithString:v28 relativeToURL:v34];
              v36 = [v35 absoluteURL];

              if (v36)
              {
                [(QLPreviewConverterParts *)obj registerURL:v36 mimeType:v30 textEncoding:v31];
                +[QLPreviewURLProtocol appendData:v32 forURL:v36 lastChunk:1];
              }
            }
            uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v47 count:16];
          }
          while (v26);
        }

        goto LABEL_34;
      }
      [v17 floatValue];
    }
    obj->_pageWidth = v16;
    goto LABEL_19;
  }
LABEL_34:
  objc_sync_exit(obj);
}

- (id)newAttachmentURLWithID:(id)a3 properties:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 objectForKey:@"TextEncoding"];
  id v9 = [v6 objectForKey:@"MimeType"];

  id v10 = [(QLPreviewParts *)self newAttachmentURLWithID:v7 mimeType:v9 textEncoding:v8];
  return v10;
}

- (void)appendData:(id)a3 forURL:(id)a4 lastChunk:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (NSObject **)MEMORY[0x1E4F945F0];
  uint64_t v11 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    uint64_t v11 = *v10;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    CFStringEncoding v12 = v11;
    uint64_t v13 = [v9 description];
    uint64_t v14 = (void *)v13;
    v15 = &stru_1F3DC97E0;
    if (v5) {
      v15 = @"(last chunk)";
    }
    int v23 = 138412546;
    uint64_t v24 = v13;
    __int16 v25 = 2112;
    uint64_t v26 = v15;
    _os_log_impl(&dword_1E2805000, v12, OS_LOG_TYPE_DEFAULT, "%@ %@ #Conversion", (uint8_t *)&v23, 0x16u);
  }
  float v16 = self;
  objc_sync_enter(v16);
  char v17 = [(QLPreviewParts *)v16 previewURL];
  BOOL v18 = v17 == 0;

  if (!v18)
  {
    uint64_t v19 = (uint64_t)v9;
    if (!v9)
    {
      uint64_t v19 = [(QLPreviewParts *)v16 previewURL];
    }
    id WeakRetained = objc_loadWeakRetained(&v16->_delegate);
    objc_sync_exit(v16);

    +[QLPreviewURLProtocol appendData:v8 forURL:v19 lastChunk:v5];
    if (v9)
    {
      if (!v5) {
        goto LABEL_24;
      }
LABEL_22:
      float v16 = [(QLPreviewParts *)v16 outstandingURLs];
      [(QLPreviewConverterParts *)v16 removeObject:v19];
      id v9 = (id)v19;
      goto LABEL_23;
    }
    if (objc_opt_respondsToSelector())
    {
      BOOL v21 = &selRef_connectionDidReceiveDataLengthReceived_;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_19:
        if (!v5)
        {
LABEL_24:
          id v9 = (id)v19;
          goto LABEL_25;
        }
        if (objc_opt_respondsToSelector()) {
          [WeakRetained performSelector:sel_connectionDidFinishLoading_ onThread:v16->delegateCallbackThread withObject:v16->_connection waitUntilDone:0];
        }
        goto LABEL_22;
      }
      BOOL v21 = &selRef_connectionDidReceiveData_;
    }
    v22 = [[QLThreadInvoker alloc] initWithConnection:v16->_connection data:v8 error:0];
    [(QLThreadInvoker *)v22 performSelector:*v21 onThread:v16->delegateCallbackThread withObject:WeakRetained waitUntilDone:0];

    goto LABEL_19;
  }
  objc_sync_exit(v16);
  id WeakRetained = 0;
LABEL_23:

LABEL_25:
}

- (void)setError:(id)a3
{
  id v4 = (NSError *)a3;
  id obj = self;
  objc_sync_enter(obj);
  mainError = obj->mainError;
  obj->mainError = v4;

  objc_sync_exit(obj);
}

- (id)previewRequest
{
  id v3 = objc_alloc(MEMORY[0x1E4F290D0]);
  id v4 = [(QLPreviewParts *)self previewURL];
  BOOL v5 = (void *)[v3 initWithURL:v4 cachePolicy:1 timeoutInterval:300.0];

  return v5;
}

- (NSURLResponse)previewResponse
{
  previewResponse = self->previewResponse;
  if (!previewResponse)
  {
    id v4 = [(QLPreviewParts *)self previewURL];
    BOOL v5 = +[QLPreviewURLProtocol mimeTypeForAttachmentURL:v4];

    if (!v5) {
      BOOL v5 = @"text/html";
    }
    id v6 = objc_alloc(MEMORY[0x1E4F290D8]);
    id v7 = [(QLPreviewParts *)self previewURL];
    id v8 = (NSURLResponse *)[v6 initWithURL:v7 MIMEType:v5 expectedContentLength:-1 textEncodingName:@"UTF-8"];
    id v9 = self->previewResponse;
    self->previewResponse = v8;

    previewResponse = self->previewResponse;
  }
  return previewResponse;
}

- (id)mimeTypeForAttachmentURL:(id)a3
{
  return +[QLPreviewURLProtocol mimeTypeForAttachmentURL:a3];
}

- (NSURLConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  return WeakRetained;
}

- (int64_t)pageCount
{
  return self->_pageCount;
}

- (float)pageWidth
{
  return self->_pageWidth;
}

- (float)pageHeight
{
  return self->_pageHeight;
}

- (BOOL)htmlErrorDisabled
{
  return self->htmlErrorDisabled;
}

- (void)setHtmlErrorDisabled:(BOOL)a3
{
  self->htmlErrorDisabled = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (NSString)uti
{
  return self->_uti;
}

- (void)setUti:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (BOOL)progressive
{
  return self->_progressive;
}

- (void)setProgressive:(BOOL)a3
{
  self->_progressive = a3;
}

- (BOOL)shouldRemoveURLAfterGeneration
{
  return self->_shouldRemoveURLAfterGeneration;
}

- (void)setShouldRemoveURLAfterGeneration:(BOOL)a3
{
  self->_shouldRemoveURLAfterGeneration = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->mainError, 0);
  objc_storeStrong((id *)&self->delegateCallbackThread, 0);
  objc_storeStrong((id *)&self->previewResponse, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_uti, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end