@interface ICTableAttachmentView
- (NSMutableArray)outsideViews;
- (void)setOutsideViews:(id)a3;
- (void)sharedInit:(BOOL)a3;
- (void)updateHighlights;
@end

@implementation ICTableAttachmentView

- (void)sharedInit:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICTableAttachmentView;
  [(ICAttachmentView *)&v5 sharedInit:a3];
  v4 = [MEMORY[0x263EFF980] array];
  [(ICTableAttachmentView *)self setOutsideViews:v4];
}

- (void)updateHighlights
{
  [(ICTableAttachmentView *)self foregroundAlpha];

  -[ICTableAttachmentView ic_setAlpha:](self, "ic_setAlpha:");
}

- (NSMutableArray)outsideViews
{
  return self->_outsideViews;
}

- (void)setOutsideViews:(id)a3
{
}

- (void).cxx_destruct
{
}

@end