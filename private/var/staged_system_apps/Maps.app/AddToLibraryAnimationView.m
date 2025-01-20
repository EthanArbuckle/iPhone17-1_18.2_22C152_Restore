@interface AddToLibraryAnimationView
- (_TtC4Maps25AddToLibraryAnimationView)initWithCoder:(id)a3;
- (_TtC4Maps25AddToLibraryAnimationView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AddToLibraryAnimationView

- (_TtC4Maps25AddToLibraryAnimationView)initWithFrame:(CGRect)a3
{
  return (_TtC4Maps25AddToLibraryAnimationView *)sub_1001E32EC();
}

- (_TtC4Maps25AddToLibraryAnimationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001E33E4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001E2AA4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps25AddToLibraryAnimationView_labelWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps25AddToLibraryAnimationView____lazy_storage___gradientView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps25AddToLibraryAnimationView____lazy_storage___blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps25AddToLibraryAnimationView____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC4Maps25AddToLibraryAnimationView____lazy_storage___button));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC4Maps25AddToLibraryAnimationView____lazy_storage___label);
}

@end