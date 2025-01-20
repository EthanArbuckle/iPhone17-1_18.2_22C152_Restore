@interface SKUIPreviewTemplateViewElement
- (NSString)previewURLString;
- (SKUILockupViewElement)previewLockup;
- (SKUIPreviewTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)itemIdentifier;
@end

@implementation SKUIPreviewTemplateViewElement

- (SKUIPreviewTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPreviewTemplateViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v16.receiver = self;
  v16.super_class = (Class)SKUIPreviewTemplateViewElement;
  v11 = [(SKUIViewElement *)&v16 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"data-content-id"];
    if ([v12 length]) {
      v11->_itemIdentifier = [v12 longLongValue];
    }
    uint64_t v13 = [v8 getAttribute:@"preview-url"];
    previewURLString = v11->_previewURLString;
    v11->_previewURLString = (NSString *)v13;
  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIPreviewTemplateViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIPreviewTemplateViewElement;
  v5 = [(SKUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_itemIdentifier = [(SKUIPreviewTemplateViewElement *)v4 itemIdentifier];
    v7 = [(SKUIPreviewTemplateViewElement *)v4 previewURLString];
    previewURLString = self->_previewURLString;
    self->_previewURLString = v7;
  }

  return v6;
}

- (SKUILockupViewElement)previewLockup
{
  return (SKUILockupViewElement *)[(SKUIViewElement *)self firstChildForElementType:66];
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)previewURLString
{
  return self->_previewURLString;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPreviewTemplateViewElement initWithDOMElement:parent:elementFactory:]";
}

@end