@interface DownloadButton
- (BOOL)isHighlighted;
- (_TtC9SeymourUI14DownloadButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI14DownloadButton)initWithFrame:(CGRect)a3;
- (int64_t)accessibilityState;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DownloadButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DownloadButton();
  return [(DownloadButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DownloadButton();
  id v4 = v5.receiver;
  [(DownloadButton *)&v5 setHighlighted:v3];
  sub_23A78B74C((char)objc_msgSend(v4, sel_isHighlighted, v5.receiver, v5.super_class));
}

- (_TtC9SeymourUI14DownloadButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI14DownloadButton *)sub_23A78A644(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI14DownloadButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A78D870();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23A78ADEC();
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_23A78B038();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_23A78B1FC(a3);
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI14DownloadButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14DownloadButton_backgroundLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14DownloadButton_contentLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14DownloadButton_contentView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14DownloadButton_alphaAnimator));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI14DownloadButton_contentWidthConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI14DownloadButton_propertyAnimator);
}

- (int64_t)accessibilityState
{
  int v2 = *((unsigned __int8 *)&self->super.super.super._responderFlags
       + OBJC_IVAR____TtC9SeymourUI14DownloadButton_currentState);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI14DownloadButton_currentState);
  int64_t result = 3;
  switch(v2)
  {
    case 0:
      int64_t result = v3 == 3;
      break;
    case 1:
      if (v3) {
        int64_t result = 6;
      }
      else {
        int64_t result = 5;
      }
      break;
    case 2:
      return result;
    case 3:
      int64_t result = qword_23A842090[v3];
      break;
    default:
      int64_t result = 7;
      break;
  }
  return result;
}

@end