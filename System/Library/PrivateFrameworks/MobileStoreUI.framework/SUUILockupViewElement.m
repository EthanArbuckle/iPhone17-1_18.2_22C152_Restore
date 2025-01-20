@interface SUUILockupViewElement
- (BOOL)containsElementGroups;
- (BOOL)isEnabled;
- (BOOL)isSelectable;
- (SUUIFullscreenImageViewElement)fullscreenImage;
- (SUUILockupViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)lockupViewType;
- (int64_t)pageComponentType;
@end

@implementation SUUILockupViewElement

- (SUUILockupViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SUUILockupViewElement;
  v9 = [(SUUIViewElement *)&v16 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"disabled"];
    if ([v10 length]) {
      int v11 = [v10 BOOLValue] ^ 1;
    }
    else {
      LOBYTE(v11) = -1;
    }
    v9->_enabled = v11;
    v12 = [v8 getAttribute:@"selectable"];
    if ([v12 length])
    {
      v13 = [v12 lowercaseString];
      v9->_selectable = [v13 isEqualToString:@"true"];
    }
    v14 = [v8 getAttribute:@"type"];
    v9->_lockupViewType = SUUILockupViewTypeForString(v14);
  }
  return v9;
}

- (BOOL)containsElementGroups
{
  v2 = [(SUUIViewElement *)self firstChildForElementType:127];
  BOOL v3 = v2 != 0;

  return v3;
}

- (SUUIFullscreenImageViewElement)fullscreenImage
{
  return (SUUIFullscreenImageViewElement *)[(SUUIViewElement *)self firstChildForElementType:42];
}

- (id)applyUpdatesWithElement:(id)a3
{
  v4 = (SUUILockupViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUILockupViewElement;
  v5 = [(SUUIViewElement *)&v8 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self || [v5 updateType])
  {
    self->_enabled = v4->_enabled;
    self->_lockupViewType = [(SUUILockupViewElement *)v4 lockupViewType];
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
  v4.super_class = (Class)SUUILockupViewElement;
  return [(SUUIViewElement *)&v4 isEnabled];
}

- (int64_t)pageComponentType
{
  return 24;
}

- (int64_t)lockupViewType
{
  return self->_lockupViewType;
}

- (BOOL)isSelectable
{
  return self->_selectable;
}

@end