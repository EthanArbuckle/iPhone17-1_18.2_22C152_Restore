@interface LibraryMainViewController.AccountButtonWrapper
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC5Music25LibraryMainViewControllerP33_A0D16B479CF880998704DD7DB9390D9020AccountButtonWrapper)init;
- (_TtCC5Music25LibraryMainViewControllerP33_A0D16B479CF880998704DD7DB9390D9020AccountButtonWrapper)initWithCoder:(id)a3;
- (_TtCC5Music25LibraryMainViewControllerP33_A0D16B479CF880998704DD7DB9390D9020AccountButtonWrapper)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LibraryMainViewController.AccountButtonWrapper

- (_TtCC5Music25LibraryMainViewControllerP33_A0D16B479CF880998704DD7DB9390D9020AccountButtonWrapper)init
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music25LibraryMainViewControllerP33_A0D16B479CF880998704DD7DB9390D9020AccountButtonWrapper_button) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LibraryMainViewController.AccountButtonWrapper();
  v2 = -[LibraryMainViewController.AccountButtonWrapper initWithFrame:](&v4, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  [(LibraryMainViewController.AccountButtonWrapper *)v2 sizeToFit];
  return v2;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 34.0;
  double v3 = 34.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(LibraryMainViewController.AccountButtonWrapper *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtCC5Music25LibraryMainViewControllerP33_A0D16B479CF880998704DD7DB9390D9020AccountButtonWrapper)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Music25LibraryMainViewControllerP33_A0D16B479CF880998704DD7DB9390D9020AccountButtonWrapper_button) = 0;
  id v4 = a3;

  CGSize result = (_TtCC5Music25LibraryMainViewControllerP33_A0D16B479CF880998704DD7DB9390D9020AccountButtonWrapper *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LibraryMainViewController.AccountButtonWrapper();
  double v2 = (char *)v5.receiver;
  [(LibraryMainViewController.AccountButtonWrapper *)&v5 layoutSubviews];
  double v3 = *(void **)&v2[OBJC_IVAR____TtCC5Music25LibraryMainViewControllerP33_A0D16B479CF880998704DD7DB9390D9020AccountButtonWrapper_button];
  if (v3)
  {
    id v4 = v3;
    [v2 bounds];
    [v4 setFrame:];

    double v2 = v4;
  }
}

- (_TtCC5Music25LibraryMainViewControllerP33_A0D16B479CF880998704DD7DB9390D9020AccountButtonWrapper)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtCC5Music25LibraryMainViewControllerP33_A0D16B479CF880998704DD7DB9390D9020AccountButtonWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5Music25LibraryMainViewControllerP33_A0D16B479CF880998704DD7DB9390D9020AccountButtonWrapper_button));
}

@end