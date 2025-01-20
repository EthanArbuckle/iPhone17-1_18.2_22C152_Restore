@interface SKUIReviewViewElement
- (SKUIDialogTemplateViewElement)dialogTemplate;
- (SKUIResponseViewElement)response;
- (void)dialogTemplate;
- (void)response;
@end

@implementation SKUIReviewViewElement

- (SKUIResponseViewElement)response
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReviewViewElement response]();
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__SKUIReviewViewElement_response__block_invoke;
  v5[3] = &unk_1E6422498;
  v5[4] = &v6;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SKUIResponseViewElement *)v3;
}

void __33__SKUIReviewViewElement_response__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 elementType] == 102)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (SKUIDialogTemplateViewElement)dialogTemplate
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReviewViewElement dialogTemplate]();
  }
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26;
  v10 = __Block_byref_object_dispose__26;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__SKUIReviewViewElement_dialogTemplate__block_invoke;
  v5[3] = &unk_1E6422498;
  v5[4] = &v6;
  [(SKUIViewElement *)self enumerateChildrenUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SKUIDialogTemplateViewElement *)v3;
}

void __39__SKUIReviewViewElement_dialogTemplate__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 elementType] == 31)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (void)response
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIReviewViewElement response]";
}

- (void)dialogTemplate
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIReviewViewElement dialogTemplate]";
}

@end