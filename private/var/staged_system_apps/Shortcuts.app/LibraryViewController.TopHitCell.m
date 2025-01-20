@interface LibraryViewController.TopHitCell
- (_TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE910TopHitCell)initWithCoder:(id)a3;
- (_TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE910TopHitCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation LibraryViewController.TopHitCell

- (void)layoutSubviews
{
  v2 = self;
  sub_1000AC244();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1000AC354();
}

- (_TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE910TopHitCell)initWithFrame:(CGRect)a3
{
  return (_TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE910TopHitCell *)sub_10002BECC();
}

- (_TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE910TopHitCell)initWithCoder:(id)a3
{
  return (_TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE910TopHitCell *)sub_1000AC764(a3, &OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE910TopHitCell_hostingView, 0, (uint64_t (*)(uint64_t))_s10TopHitCellCMa);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE910TopHitCell_hostingView));
}

@end