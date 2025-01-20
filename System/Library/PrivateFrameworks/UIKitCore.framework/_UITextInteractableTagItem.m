@interface _UITextInteractableTagItem
- (BOOL)_showsPreviewByDefault;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTagItem;
- (NSString)tag;
- (id)_itemRepresentationWithRange:(_NSRange)a3;
- (void)setTag:(id)a3;
@end

@implementation _UITextInteractableTagItem

- (BOOL)isTagItem
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UITextInteractableTagItem;
  if ([(_UITextInteractableItem *)&v12 isEqual:v4])
  {
    v5 = [v4 tag];
    v6 = [(_UITextInteractableTagItem *)self tag];
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
  v5 = [(_UITextInteractableTagItem *)self tag];
  v6 = +[UITextItem _itemWithTag:range:](UITextItem, "_itemWithTag:range:", v5, location, length);

  return v6;
}

- (BOOL)_showsPreviewByDefault
{
  return 0;
}

- (NSString)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
}

- (void).cxx_destruct
{
}

@end