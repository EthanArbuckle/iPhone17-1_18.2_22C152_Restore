@interface SKUIPreviewControlViewElement
- (BOOL)isEnabled;
- (NSString)mediaURLString;
- (SKUIPreviewControlViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)itemIdentifier;
@end

@implementation SKUIPreviewControlViewElement

- (SKUIPreviewControlViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIPreviewControlViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIPreviewControlViewElement;
  v11 = [(SKUIViewElement *)&v18 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"disabled"];
    if ([v12 length]) {
      char v13 = [v12 BOOLValue] ^ 1;
    }
    else {
      char v13 = -1;
    }
    v11->_enabled = v13;
    v14 = [v8 getAttribute:@"data-content-id"];
    if ([v14 length]) {
      v11->_itemIdentifier = [v14 longLongValue];
    }
    uint64_t v15 = [v8 getAttribute:@"preview-url"];
    mediaURLString = v11->_mediaURLString;
    v11->_mediaURLString = (NSString *)v15;
  }
  return v11;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SKUIPreviewControlViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SKUIPreviewControlViewElement;
  v5 = [(SKUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_enabled = v4->_enabled;
    self->_itemIdentifier = [(SKUIPreviewControlViewElement *)v4 itemIdentifier];
    v7 = [(SKUIPreviewControlViewElement *)v4 mediaURLString];
    mediaURLString = self->_mediaURLString;
    self->_mediaURLString = v7;
  }

  return v6;
}

- (BOOL)isEnabled
{
  int enabled = self->_enabled;
  if (enabled != 255) {
    return enabled != 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKUIPreviewControlViewElement;
  return [(SKUIViewElement *)&v4 isEnabled];
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)mediaURLString
{
  return self->_mediaURLString;
}

- (void).cxx_destruct
{
}

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIPreviewControlViewElement initWithDOMElement:parent:elementFactory:]";
}

@end