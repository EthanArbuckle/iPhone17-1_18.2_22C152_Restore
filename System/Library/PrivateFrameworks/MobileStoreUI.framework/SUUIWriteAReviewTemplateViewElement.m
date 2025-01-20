@interface SUUIWriteAReviewTemplateViewElement
- (NSString)reviewMetadataURLString;
- (SUUIWriteAReviewTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)itemIdentifier;
@end

@implementation SUUIWriteAReviewTemplateViewElement

- (SUUIWriteAReviewTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIWriteAReviewTemplateViewElement;
  v9 = [(SUUIViewElement *)&v14 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"data-content-id"];
    v9->_itemIdentifier = [v10 longLongValue];

    uint64_t v11 = [v8 getAttribute:@"src"];
    reviewMetadataURLString = v9->_reviewMetadataURLString;
    v9->_reviewMetadataURLString = (NSString *)v11;
  }
  return v9;
}

- (NSString)reviewMetadataURLString
{
  v27[1] = *MEMORY[0x263EF8340];
  v3 = self->_reviewMetadataURLString;
  if (self->_itemIdentifier)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F7B330]);
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__72;
    v25 = __Block_byref_object_dispose__72;
    id v26 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v6 = [NSNumber numberWithLongLong:self->_itemIdentifier];
    v27[0] = v6;
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __62__SUUIWriteAReviewTemplateViewElement_reviewMetadataURLString__block_invoke;
    v18[3] = &unk_265402D60;
    v20 = &v21;
    id v8 = v5;
    v19 = v8;
    [v4 getLibraryItemsForITunesStoreItemIdentifiers:v7 completionBlock:v18];

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    if (v22[5])
    {
      v9 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithString:self->_reviewMetadataURLString];
      v10 = [v9 queryItems];
      id v11 = (id)[v10 mutableCopy];

      if (!v11) {
        id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
      }
      v12 = (void *)MEMORY[0x263F08BD0];
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend((id)v22[5], "longLongValue"));
      objc_super v14 = [v12 queryItemWithName:@"version-to-review" value:v13];
      [v11 addObject:v14];

      [v9 setQueryItems:v11];
      v15 = [v9 URL];
      uint64_t v16 = [v15 absoluteString];

      v3 = (NSString *)v16;
    }

    _Block_object_dispose(&v21, 8);
  }
  return v3;
}

void __62__SUUIWriteAReviewTemplateViewElement_reviewMetadataURLString__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 firstObject];
  uint64_t v3 = [v6 valueForProperty:*MEMORY[0x263F7BCA8]];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)applyUpdatesWithElement:(id)a3
{
  uint64_t v4 = (SUUIWriteAReviewTemplateViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIWriteAReviewTemplateViewElement;
  dispatch_semaphore_t v5 = [(SUUIViewElement *)&v10 applyUpdatesWithElement:v4];
  id v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_itemIdentifier = [(SUUIWriteAReviewTemplateViewElement *)v4 itemIdentifier];
    v7 = [(SUUIWriteAReviewTemplateViewElement *)v4 reviewMetadataURLString];
    reviewMetadataURLString = self->_reviewMetadataURLString;
    self->_reviewMetadataURLString = v7;
  }
  return v6;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void).cxx_destruct
{
}

@end