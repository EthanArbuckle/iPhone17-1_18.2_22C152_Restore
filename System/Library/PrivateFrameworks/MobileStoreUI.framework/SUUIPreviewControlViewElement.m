@interface SUUIPreviewControlViewElement
- (BOOL)isEnabled;
- (NSString)mediaURLString;
- (SUUIPreviewControlViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)itemIdentifier;
@end

@implementation SUUIPreviewControlViewElement

- (SUUIPreviewControlViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SUUIPreviewControlViewElement;
  v9 = [(SUUIViewElement *)&v16 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"disabled"];
    if ([v10 length]) {
      char v11 = [v10 BOOLValue] ^ 1;
    }
    else {
      char v11 = -1;
    }
    v9->_enabled = v11;
    v12 = [v8 getAttribute:@"data-content-id"];
    if ([v12 length]) {
      v9->_itemIdentifier = [v12 longLongValue];
    }
    uint64_t v13 = [v8 getAttribute:@"preview-url"];
    mediaURLString = v9->_mediaURLString;
    v9->_mediaURLString = (NSString *)v13;
  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUIPreviewControlViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIPreviewControlViewElement;
  v5 = [(SUUIViewElement *)&v10 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_enabled = v4->_enabled;
    self->_itemIdentifier = [(SUUIPreviewControlViewElement *)v4 itemIdentifier];
    v7 = [(SUUIPreviewControlViewElement *)v4 mediaURLString];
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
  v4.super_class = (Class)SUUIPreviewControlViewElement;
  return [(SUUIViewElement *)&v4 isEnabled];
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

@end