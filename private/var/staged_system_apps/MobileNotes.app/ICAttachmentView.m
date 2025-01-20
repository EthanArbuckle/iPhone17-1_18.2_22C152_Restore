@interface ICAttachmentView
- (void)app_updateViewAnnotation;
@end

@implementation ICAttachmentView

- (void)app_updateViewAnnotation
{
  id v3 = [(ICAttachmentView *)self attachment];
  [(ICAttachmentView *)self ic_annotateWithAttachment:v3];
}

@end