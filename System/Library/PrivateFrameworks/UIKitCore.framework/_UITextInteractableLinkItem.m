@interface _UITextInteractableLinkItem
- (BOOL)isEqual:(id)a3;
- (BOOL)isLinkItem;
- (NSURL)link;
- (id)_itemRepresentationWithRange:(_NSRange)a3;
- (void)setLink:(id)a3;
@end

@implementation _UITextInteractableLinkItem

- (BOOL)isLinkItem
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UITextInteractableLinkItem;
  if ([(_UITextInteractableItem *)&v12 isEqual:v4])
  {
    v5 = [v4 link];
    v6 = [(_UITextInteractableLinkItem *)self link];
    id v7 = v5;
    id v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
      if (v7 && v8) {
        char v10 = [v7 isEqual:v8];
      }
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)_itemRepresentationWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = [(_UITextInteractableLinkItem *)self link];
  v6 = +[UITextItem _itemWithLink:range:](UITextItem, "_itemWithLink:range:", v5, location, length);

  return v6;
}

- (NSURL)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
}

- (void).cxx_destruct
{
}

@end