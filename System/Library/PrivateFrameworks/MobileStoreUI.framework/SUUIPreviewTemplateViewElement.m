@interface SUUIPreviewTemplateViewElement
- (NSString)previewURLString;
- (SUUILockupViewElement)previewLockup;
- (SUUIPreviewTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)itemIdentifier;
@end

@implementation SUUIPreviewTemplateViewElement

- (SUUIPreviewTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SUUIPreviewTemplateViewElement;
  v9 = [(SUUIViewElement *)&v14 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"data-content-id"];
    if ([v10 length]) {
      v9->_itemIdentifier = [v10 longLongValue];
    }
    uint64_t v11 = [v8 getAttribute:@"preview-url"];
    previewURLString = v9->_previewURLString;
    v9->_previewURLString = (NSString *)v11;
  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIPreviewTemplateViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIPreviewTemplateViewElement;
  v5 = [(SUUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_itemIdentifier = [(SUUIPreviewTemplateViewElement *)v4 itemIdentifier];
    v7 = [(SUUIPreviewTemplateViewElement *)v4 previewURLString];
    previewURLString = self->_previewURLString;
    self->_previewURLString = v7;
  }
  return v6;
}

- (SUUILockupViewElement)previewLockup
{
  return (SUUILockupViewElement *)[(SUUIViewElement *)self firstChildForElementType:66];
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

@end