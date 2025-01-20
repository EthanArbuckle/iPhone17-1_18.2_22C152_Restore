@interface ICInlineAttachmentView
- (void)openURL:(id)a3;
@end

@implementation ICInlineAttachmentView

- (void)openURL:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  v4 = [(ICInlineAttachmentView *)self window];
  v5 = ICCheckedDynamicCast();

  v6 = [v5 ic_viewControllerManager];
  v7 = v6;
  if (v6) {
    [v6 openURL:v8];
  }
}

@end