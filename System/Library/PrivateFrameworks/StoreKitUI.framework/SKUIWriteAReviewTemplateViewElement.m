@interface SKUIWriteAReviewTemplateViewElement
- (NSString)reviewMetadataURLString;
- (SKUIWriteAReviewTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)itemIdentifier;
@end

@implementation SKUIWriteAReviewTemplateViewElement

- (SKUIWriteAReviewTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIWriteAReviewTemplateViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIWriteAReviewTemplateViewElement;
  v11 = [(SKUIViewElement *)&v16 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"data-content-id"];
    v11->_itemIdentifier = [v12 longLongValue];

    uint64_t v13 = [v8 getAttribute:@"src"];
    reviewMetadataURLString = v11->_reviewMetadataURLString;
    v11->_reviewMetadataURLString = (NSString *)v13;
  }
  return v11;
}

- (NSString)reviewMetadataURLString
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v3 = self->_reviewMetadataURLString;
  if (self->_itemIdentifier)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA82E0]);
    uint64_t v21 = 0;
    v22 = &v21;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__18;
    v25 = __Block_byref_object_dispose__18;
    id v26 = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    v6 = [NSNumber numberWithLongLong:self->_itemIdentifier];
    v27[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__SKUIWriteAReviewTemplateViewElement_reviewMetadataURLString__block_invoke;
    v18[3] = &unk_1E6425120;
    v20 = &v21;
    id v8 = v5;
    v19 = v8;
    [v4 getLibraryItemsForITunesStoreItemIdentifiers:v7 completionBlock:v18];

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    if (v22[5])
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:self->_reviewMetadataURLString];
      id v10 = [v9 queryItems];
      id v11 = (id)[v10 mutableCopy];

      if (!v11) {
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      v12 = (void *)MEMORY[0x1E4F290C8];
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend((id)v22[5], "longLongValue"));
      v14 = [v12 queryItemWithName:@"version-to-review" value:v13];
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

void __62__SKUIWriteAReviewTemplateViewElement_reviewMetadataURLString__block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 firstObject];
  uint64_t v3 = [v6 valueForProperty:*MEMORY[0x1E4FA8950]];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)applyUpdatesWithElement:(id)a3
{
  uint64_t v4 = (SKUIWriteAReviewTemplateViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIWriteAReviewTemplateViewElement;
  dispatch_semaphore_t v5 = [(SKUIViewElement *)&v10 applyUpdatesWithElement:v4];
  id v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_itemIdentifier = [(SKUIWriteAReviewTemplateViewElement *)v4 itemIdentifier];
    v7 = [(SKUIWriteAReviewTemplateViewElement *)v4 reviewMetadataURLString];
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

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIWriteAReviewTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end