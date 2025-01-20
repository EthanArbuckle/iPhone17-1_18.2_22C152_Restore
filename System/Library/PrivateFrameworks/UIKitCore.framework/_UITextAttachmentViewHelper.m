@interface _UITextAttachmentViewHelper
+ (id)helperForAttachment:(id)a3;
- (NSTextAttachment)attachment;
- (void)removeView;
- (void)setAttachment:(id)a3;
@end

@implementation _UITextAttachmentViewHelper

+ (id)helperForAttachment:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)a1);
  [v5 setAttachment:v4];

  return v5;
}

- (void)removeView
{
  id v3 = [(_UITextAttachmentViewHelper *)self attachment];
  v2 = [v3 attachmentCell];
  [v2 removeFromSuperview];
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