@interface ICTextAttachmentViewProvider
- (BOOL)tracksTextAttachmentViewBounds;
- (void)loadView;
@end

@implementation ICTextAttachmentViewProvider

- (void)loadView
{
  objc_opt_class();
  v3 = [(NSTextAttachmentViewProvider *)self textAttachment];
  ICDynamicCast();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [(NSTextAttachmentViewProvider *)self layoutManager];
  v5 = [v6 viewForLayoutManager:v4];

  [(NSTextAttachmentViewProvider *)self setView:v5];
}

- (BOOL)tracksTextAttachmentViewBounds
{
  return 0;
}

@end