@interface CoverViewActionButton
- (BOOL)isHighlighted;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC8NewsFeed21CoverViewActionButton)initWithCoder:(id)a3;
- (_TtC8NewsFeed21CoverViewActionButton)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation CoverViewActionButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CoverViewActionButton();
  return [(CoverViewActionButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_1C10840E4(a3);
}

- (_TtC8NewsFeed21CoverViewActionButton)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed21CoverViewActionButton *)sub_1C1084258(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed21CoverViewActionButton)initWithCoder:(id)a3
{
  id v3 = a3;
  _s8NewsFeed21CoverViewActionButtonC5coderACSgSo7NSCoderC_tcfc_0();
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v8 = self;
  [(CoverViewActionButton *)v8 bounds];
  v16.origin.CGFloat x = UIEdgeInsetsInsetRect(v9, v10, v11, v12, *(double *)((char *)&v8->super.super.super.super.super.isa+ OBJC_IVAR____TtC8NewsFeed21CoverViewActionButton_touchInsets), *(double *)((char *)&v8->super.super.super.super._responderFlags+ OBJC_IVAR____TtC8NewsFeed21CoverViewActionButton_touchInsets));
  v15.CGFloat x = x;
  v15.CGFloat y = y;
  BOOL v13 = CGRectContainsPoint(v16, v15);

  return v13;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21CoverViewActionButton_onTap));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21CoverViewActionButton_onMenuPresentation));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed21CoverViewActionButton_tintColorForNormalState);
}

@end