@interface SULoadNetworkSectionsOperation
- (BOOL)_loadArtworkForResponse:(id)a3;
- (ISStoreURLOperation)baseOperation;
- (NSString)expectedVersionString;
- (SULoadNetworkSectionsOperation)initWithURL:(id)a3 clientInterface:(id)a4;
- (SUSectionsResponse)sectionsResponse;
- (id)_bestItemImageForImages:(id)a3 withImageKind:(id)a4;
- (id)_copyImageWithURL:(id)a3 scale:(float)a4 error:(id *)a5;
- (id)_copyLoadedItemImage:(id)a3 error:(id *)a4;
- (void)_setSectionsResponse:(id)a3;
- (void)dealloc;
- (void)run;
- (void)setBaseOperation:(id)a3;
- (void)setExpectedVersionString:(id)a3;
@end

@implementation SULoadNetworkSectionsOperation

- (SULoadNetworkSectionsOperation)initWithURL:(id)a3 clientInterface:(id)a4
{
  v6 = [(SULoadNetworkSectionsOperation *)self init];
  if (v6)
  {
    v6->_clientInterface = (SUClientInterface *)a4;
    if (a3)
    {
      v7 = (void *)[objc_alloc(MEMORY[0x263F7B368]) initWithURL:a3];
      v8 = (ISStoreURLOperation *)objc_alloc_init(MEMORY[0x263F89528]);
      v6->_baseOperation = v8;
      [(ISStoreURLOperation *)v8 setTracksPerformanceMetrics:SSDebugShouldTrackPerformance()];
      [(ISStoreURLOperation *)v6->_baseOperation setRequestProperties:v7];
    }
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SULoadNetworkSectionsOperation;
  [(SULoadNetworkSectionsOperation *)&v3 dealloc];
}

- (ISStoreURLOperation)baseOperation
{
  [(SULoadNetworkSectionsOperation *)self lock];
  objc_super v3 = self->_baseOperation;
  [(SULoadNetworkSectionsOperation *)self unlock];
  return v3;
}

- (NSString)expectedVersionString
{
  [(SULoadNetworkSectionsOperation *)self lock];
  objc_super v3 = self->_expectedVersionString;
  [(SULoadNetworkSectionsOperation *)self unlock];
  return v3;
}

- (SUSectionsResponse)sectionsResponse
{
  [(SULoadNetworkSectionsOperation *)self lock];
  objc_super v3 = self->_sectionsResponse;
  [(SULoadNetworkSectionsOperation *)self unlock];
  return v3;
}

- (void)setBaseOperation:(id)a3
{
  [(SULoadNetworkSectionsOperation *)self lock];
  baseOperation = self->_baseOperation;
  if (baseOperation != a3)
  {

    self->_baseOperation = (ISStoreURLOperation *)a3;
  }

  [(SULoadNetworkSectionsOperation *)self unlock];
}

- (void)setExpectedVersionString:(id)a3
{
  [(SULoadNetworkSectionsOperation *)self lock];
  expectedVersionString = self->_expectedVersionString;
  if (expectedVersionString != a3)
  {

    self->_expectedVersionString = (NSString *)a3;
  }

  [(SULoadNetworkSectionsOperation *)self unlock];
}

- (void)run
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  objc_super v3 = self->_baseOperation;
  id v4 = objc_alloc_init(MEMORY[0x263F89500]);
  [(ISStoreURLOperation *)v3 setDataProvider:v4];
  v5 = objc_msgSend((id)-[ISStoreURLOperation requestProperties](v3, "requestProperties"), "mutableCopy");
  v6 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", -[SULoadNetworkSectionsOperation expectedVersionString](self, "expectedVersionString"), @"version", 0);
  [v5 setCachePolicy:1];
  [v5 setRequestParameters:v6];
  [(ISStoreURLOperation *)v3 setRequestProperties:v5];

  uint64_t v18 = 0;
  if ([(SULoadNetworkSectionsOperation *)self runSubOperation:v3 returningError:&v18])
  {
    v7 = -[SUSectionsResponse initWithClientInterface:sectionsDictionary:responseType:]([SUSectionsResponse alloc], "initWithClientInterface:sectionsDictionary:responseType:", self->_clientInterface, [v4 output], 1);
    BOOL v8 = [(SULoadNetworkSectionsOperation *)self _loadArtworkForResponse:v7];
    if (v8)
    {
      [(SUSectionsResponse *)v7 dropEmbeddedImages];
    }
    else
    {
      v9 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
      int v10 = [v9 shouldLog];
      if ([v9 shouldLogToDisk]) {
        int v11 = v10 | 2;
      }
      else {
        int v11 = v10;
      }
      if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v11 &= 2u;
      }
      if (v11)
      {
        uint64_t v12 = objc_opt_class();
        int v19 = 138412290;
        uint64_t v20 = v12;
        LODWORD(v17) = 12;
        v16 = &v19;
        uint64_t v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          v14 = (void *)v13;
          uint64_t v15 = objc_msgSend(NSString, "stringWithCString:encoding:", v13, 4, &v19, v17);
          free(v14);
          v16 = (int *)v15;
          SSFileLog();
        }
      }
    }
    -[SUSectionsResponse setCacheable:](v7, "setCacheable:", v8, v16);
    -[SUSectionsResponse setStoreFrontIdentifier:](v7, "setStoreFrontIdentifier:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B148], "currentDevice"), "storeFrontIdentifier"));
    [(SULoadNetworkSectionsOperation *)self _setSectionsResponse:v7];
    [(SULoadNetworkSectionsOperation *)self setSuccess:1];
  }
  else
  {
    [(SULoadNetworkSectionsOperation *)self setError:v18];
  }
}

- (id)_bestItemImageForImages:(id)a3 withImageKind:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C920], "mainScreen"), "scale");
  double v7 = v6;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v8) {
    return 0;
  }
  uint64_t v9 = v8;
  int v10 = 0;
  uint64_t v11 = *(void *)v23;
  double v12 = 1.79769313e308;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v23 != v11) {
        objc_enumerationMutation(a3);
      }
      v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      [v14 imageScale];
      double v16 = v15;
      int v17 = objc_msgSend((id)objc_msgSend(v14, "imageKind"), "isEqualToString:", a4);
      double v18 = vabdd_f64(v16, v7);
      double v19 = vabdd_f64(v12, v7);
      if (v17) {
        BOOL v20 = v18 < v19;
      }
      else {
        BOOL v20 = 0;
      }
      if (v20)
      {
        int v10 = v14;
        double v12 = v16;
      }
    }
    uint64_t v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16, v18);
  }
  while (v9);
  return v10;
}

- (id)_copyImageWithURL:(id)a3 scale:(float)a4 error:(id *)a5
{
  double v15 = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "scheme"), "isEqualToString:", @"data"))
  {
    uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:a3 options:0 error:&v15];
    if (v9)
    {
      id v10 = (id)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v9 scale:a4];
      if (!a5) {
        return v10;
      }
    }
    else
    {
      id v10 = 0;
      if (!a5) {
        return v10;
      }
    }
    goto LABEL_9;
  }
  id v11 = objc_alloc_init(MEMORY[0x263F89528]);
  double v12 = objc_alloc_init(SUImageDataProvider);
  [(SUImageDataProvider *)v12 setInputImageScale:a4];
  [v11 setDataProvider:v12];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F7B290]) initWithURL:a3];
  [v13 setCachePolicy:1];
  [v11 setRequestProperties:v13];

  if ([(SULoadNetworkSectionsOperation *)self runSubOperation:v11 returningError:&v15])
  {
    id v10 = [(ISDataProvider *)v12 output];
  }
  else
  {
    [(SULoadNetworkSectionsOperation *)self setError:v15];
    id v10 = 0;
  }

  if (a5) {
LABEL_9:
  }
    *a5 = v15;
  return v10;
}

- (id)_copyLoadedItemImage:(id)a3 error:(id *)a4
{
  uint64_t v7 = [a3 URL];
  [a3 imageScale];
  *(float *)&double v8 = v8;

  return [(SULoadNetworkSectionsOperation *)self _copyImageWithURL:v7 scale:a4 error:v8];
}

- (BOOL)_loadArtworkForResponse:(id)a3
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  obuint64_t j = (id)[a3 allSections];
  uint64_t v66 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
  if (v66)
  {
    uint64_t v64 = *MEMORY[0x263F7B860];
    uint64_t v65 = *(void *)v76;
    uint64_t v62 = *MEMORY[0x263F7B868];
    uint64_t v63 = *MEMORY[0x263F7B878];
    uint64_t v61 = *MEMORY[0x263F7B870];
    BOOL v59 = 1;
    do
    {
      for (uint64_t i = 0; i != v66; ++i)
      {
        if (*(void *)v76 != v65) {
          objc_enumerationMutation(obj);
        }
        v5 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        id v6 = -[SULoadNetworkSectionsOperation _bestItemImageForImages:withImageKind:](self, "_bestItemImageForImages:withImageKind:", objc_msgSend(v5, "itemImages", v56, v57), v64);
        if (v6)
        {
          id v7 = [(SULoadNetworkSectionsOperation *)self _copyLoadedItemImage:v6 error:0];
          char v8 = v7 != 0;
          [v5 setImage:v7];
        }
        else
        {
          char v8 = 1;
        }
        id v9 = -[SULoadNetworkSectionsOperation _bestItemImageForImages:withImageKind:](self, "_bestItemImageForImages:withImageKind:", [v5 itemImages], v63);
        if (v9)
        {
          id v10 = [(SULoadNetworkSectionsOperation *)self _copyLoadedItemImage:v9 error:0];
          if (!v10) {
            char v8 = 0;
          }
          [v5 setSelectedImage:v10];
        }
        id v11 = -[SULoadNetworkSectionsOperation _bestItemImageForImages:withImageKind:](self, "_bestItemImageForImages:withImageKind:", [v5 itemImages], v62);
        if (v11)
        {
          id v12 = [(SULoadNetworkSectionsOperation *)self _copyLoadedItemImage:v11 error:0];
          if (!v12) {
            char v8 = 0;
          }
          [v5 setMoreListImage:v12];
        }
        id v13 = -[SULoadNetworkSectionsOperation _bestItemImageForImages:withImageKind:](self, "_bestItemImageForImages:withImageKind:", [v5 itemImages], v61);
        if (v13)
        {
          id v14 = [(SULoadNetworkSectionsOperation *)self _copyLoadedItemImage:v13 error:0];
          if (!v14) {
            char v8 = 0;
          }
          [v5 setSelectedMoreListImage:v14];
        }
        double v15 = (void *)[v5 leftSectionButtons];
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v71 objects:v84 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v72;
          do
          {
            for (uint64_t j = 0; j != v17; ++j)
            {
              if (*(void *)v72 != v18) {
                objc_enumerationMutation(v15);
              }
              BOOL v20 = *(void **)(*((void *)&v71 + 1) + 8 * j);
              uint64_t v21 = [v20 imageURL];
              if (v21)
              {
                uint64_t v22 = v21;
                [v20 imageURLScale];
                id v23 = -[SULoadNetworkSectionsOperation _copyImageWithURL:scale:error:](self, "_copyImageWithURL:scale:error:", v22, 0);
                v8 &= v23 != 0;
                objc_msgSend(v5, "setSectionButtonImage:forTag:", v23, objc_msgSend(v20, "tag"));
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v71 objects:v84 count:16];
          }
          while (v17);
        }
        long long v24 = (void *)[v5 rightSectionButtons];
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v67 objects:v83 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v68;
          do
          {
            for (uint64_t k = 0; k != v26; ++k)
            {
              if (*(void *)v68 != v27) {
                objc_enumerationMutation(v24);
              }
              v29 = *(void **)(*((void *)&v67 + 1) + 8 * k);
              uint64_t v30 = [v29 imageURL];
              if (v30)
              {
                uint64_t v31 = v30;
                [v29 imageURLScale];
                id v32 = -[SULoadNetworkSectionsOperation _copyImageWithURL:scale:error:](self, "_copyImageWithURL:scale:error:", v31, 0);
                v8 &= v32 != 0;
                objc_msgSend(v5, "setSectionButtonImage:forTag:", v32, objc_msgSend(v29, "tag"));
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v67 objects:v83 count:16];
          }
          while (v26);
        }
        if ((v8 & 1) == 0)
        {
          v33 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
          int v34 = [v33 shouldLog];
          if ([v33 shouldLogToDisk]) {
            v34 |= 2u;
          }
          if (!os_log_type_enabled((os_log_t)[v33 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
            v34 &= 2u;
          }
          if (v34)
          {
            uint64_t v35 = objc_opt_class();
            int v79 = 138412546;
            uint64_t v80 = v35;
            __int16 v81 = 2112;
            v82 = v5;
            LODWORD(v57) = 22;
            v56 = &v79;
            uint64_t v36 = _os_log_send_and_compose_impl();
            if (v36)
            {
              v37 = (void *)v36;
              uint64_t v38 = objc_msgSend(NSString, "stringWithCString:encoding:", v36, 4, &v79, v57);
              free(v37);
              v56 = (int *)v38;
              SSFileLog();
            }
          }
          BOOL v59 = 0;
        }
      }
      uint64_t v66 = [obj countByEnumeratingWithState:&v75 objects:v85 count:16];
    }
    while (v66);
  }
  else
  {
    BOOL v59 = 1;
  }
  v39 = objc_msgSend((id)objc_msgSend(a3, "moreListImageCollection", v56), "itemImages");
  if (![v39 count]) {
    return v59;
  }
  id v40 = [(SULoadNetworkSectionsOperation *)self _bestItemImageForImages:v39 withImageKind:*MEMORY[0x263F7B860]];
  if (!v40)
  {
    id v45 = [(SULoadNetworkSectionsOperation *)self _bestItemImageForImages:v39 withImageKind:*MEMORY[0x263F7B878]];
    if (v45)
    {
      id v44 = v45;
      BOOL v42 = 1;
LABEL_58:
      id v46 = [(SULoadNetworkSectionsOperation *)self _copyLoadedItemImage:v44 error:0];
      [a3 setMoreListSelectedImage:v46];

      BOOL v47 = !v42 || v46 == 0;
      BOOL v48 = v59;
      if (!v47) {
        return v48;
      }
      goto LABEL_65;
    }
    return v59;
  }
  id v41 = [(SULoadNetworkSectionsOperation *)self _copyLoadedItemImage:v40 error:0];
  BOOL v42 = v41 != 0;
  [a3 setMoreListImage:v41];

  id v43 = [(SULoadNetworkSectionsOperation *)self _bestItemImageForImages:v39 withImageKind:*MEMORY[0x263F7B878]];
  if (v43)
  {
    id v44 = v43;
    goto LABEL_58;
  }
  BOOL v48 = v59;
  if (v41) {
    return v48;
  }
LABEL_65:
  v49 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
  int v50 = [v49 shouldLog];
  if ([v49 shouldLogToDisk]) {
    int v51 = v50 | 2;
  }
  else {
    int v51 = v50;
  }
  if (!os_log_type_enabled((os_log_t)[v49 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v51 &= 2u;
  }
  if (v51)
  {
    uint64_t v52 = objc_opt_class();
    int v79 = 138412290;
    uint64_t v80 = v52;
    LODWORD(v57) = 12;
    uint64_t v53 = _os_log_send_and_compose_impl();
    if (v53)
    {
      v54 = (void *)v53;
      objc_msgSend(NSString, "stringWithCString:encoding:", v53, 4, &v79, v57);
      free(v54);
      SSFileLog();
    }
  }
  return 0;
}

- (void)_setSectionsResponse:(id)a3
{
  [(SULoadNetworkSectionsOperation *)self lock];
  sectionsResponse = self->_sectionsResponse;
  if (sectionsResponse != a3)
  {

    self->_sectionsResponse = (SUSectionsResponse *)a3;
  }

  [(SULoadNetworkSectionsOperation *)self unlock];
}

@end