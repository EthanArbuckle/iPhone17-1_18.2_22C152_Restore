@interface _UITextInteractableAttachmentItem
- (BOOL)isAttachmentItem;
- (BOOL)isEqual:(id)a3;
- (NSTextAttachment)attachment;
- (id)_itemRepresentationWithRange:(_NSRange)a3;
- (void)setAttachment:(id)a3;
@end

@implementation _UITextInteractableAttachmentItem

- (BOOL)isAttachmentItem
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UITextInteractableAttachmentItem;
  if ([(_UITextInteractableItem *)&v12 isEqual:v4])
  {
    v5 = [v4 attachment];
    v6 = [(_UITextInteractableAttachmentItem *)self attachment];
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
  v5 = [(_UITextInteractableAttachmentItem *)self attachment];
  v6 = +[UITextItem _itemWithTextAttachment:range:](UITextItem, "_itemWithTextAttachment:range:", v5, location, length);

  return v6;
}

- (NSTextAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
}

- (void).cxx_destruct
{
}

@end