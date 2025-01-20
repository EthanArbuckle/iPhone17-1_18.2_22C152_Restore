@interface SUUIBadgeTextAttachmentLoader
- (BOOL)loadImageForBadge:(id)a3 layout:(id)a4 reason:(int64_t)a5;
- (SUUIBadgeTextAttachmentLoader)initWithResourceLoader:(id)a3;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)connectStringView:(id)a3;
- (void)disconnectStringView:(id)a3;
@end

@implementation SUUIBadgeTextAttachmentLoader

- (SUUIBadgeTextAttachmentLoader)initWithResourceLoader:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIBadgeTextAttachmentLoader;
  v6 = [(SUUIBadgeTextAttachmentLoader *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_resourceLoader, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    imageRequests = v7->_imageRequests;
    v7->_imageRequests = (NSMapTable *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:0];
    stringViews = v7->_stringViews;
    v7->_stringViews = (NSHashTable *)v10;
  }
  return v7;
}

- (void)connectStringView:(id)a3
{
  stringViews = self->_stringViews;
  id v4 = a3;
  [(NSHashTable *)stringViews addObject:v4];
}

- (void)disconnectStringView:(id)a3
{
}

- (BOOL)loadImageForBadge:(id)a3 layout:(id)a4 reason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 imageURL];
  if (v10 && ([v8 image], v11 = objc_claimAutoreleasedReturnValue(), v11, !v11))
  {
    p_isa = [(NSMapTable *)self->_imageRequests objectForKey:v8];
    if (p_isa
      && [(SUUIResourceLoader *)self->_resourceLoader trySetReason:a5 forRequestWithIdentifier:p_isa[1]])
    {
      BOOL v12 = 0;
    }
    else
    {
      v14 = objc_alloc_init(SUUIArtworkRequest);
      v15 = +[SSVURLDataConsumer consumer];
      [(SUUIArtworkRequest *)v14 setDataConsumer:v15];

      [(SUUIArtworkRequest *)v14 setDelegate:self];
      [(SUUIArtworkRequest *)v14 setURL:v10];
      v16 = objc_alloc_init(SUUIBadgeImageRequest);

      v16->_requestIdentifier = [(SUUIResourceRequest *)v14 requestIdentifier];
      objc_storeStrong((id *)&v16->_stringLayout, a4);
      [(NSMapTable *)self->_imageRequests setObject:v16 forKey:v8];
      BOOL v12 = [(SUUIResourceLoader *)self->_resourceLoader loadResourceWithRequest:v14 reason:a5];

      p_isa = &v16->super.isa;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [a3 requestIdentifier];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = self->_imageRequests;
  id v9 = (id)[(NSMapTable *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v28;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v28 != v10) {
        objc_enumerationMutation(v8);
      }
      BOOL v12 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
      objc_super v13 = [(NSMapTable *)self->_imageRequests objectForKey:v12];
      v14 = v13;
      if ((id)v7 == v13[1]) {
        break;
      }

      if (v9 == (id)++v11)
      {
        id v9 = (id)[(NSMapTable *)v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v15 = v12;
    id v9 = v14[2];

    if (!v15) {
      goto LABEL_24;
    }
    [v15 setImage:v6];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v16 = self->_stringViews;
    uint64_t v17 = [(NSHashTable *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          objc_msgSend(v21, "layout", (void)v23);
          id v22 = (id)objc_claimAutoreleasedReturnValue();

          if (v22 == v9)
          {
            id v8 = v21;

            if (v8)
            {
              [(NSMapTable *)v8 setNeedsDisplay];
              [(NSHashTable *)self->_stringViews removeObject:v8];
            }
            goto LABEL_22;
          }
        }
        uint64_t v18 = [(NSHashTable *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    id v8 = 0;
LABEL_22:
    -[NSMapTable removeObjectForKey:](self->_imageRequests, "removeObjectForKey:", v15, (void)v23);
  }
  else
  {
LABEL_9:
    id v15 = 0;
  }

LABEL_24:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringViews, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_storeStrong((id *)&self->_imageRequests, 0);
}

@end