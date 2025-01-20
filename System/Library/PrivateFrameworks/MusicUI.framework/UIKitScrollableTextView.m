@interface UIKitScrollableTextView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView)initWithCoder:(id)a3;
- (_TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)willMoveToWindow:(id)a3;
@end

@implementation UIKitScrollableTextView

- (void)willMoveToWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_229B0FE30((uint64_t)a3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  double v6 = sub_229B0FEFC(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_229B0FFA8();
}

- (_TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView)initWithFrame:(CGRect)a3
{
  return (_TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView *)sub_229B1057C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView)initWithCoder:(id)a3
{
  return (_TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView *)sub_229B106F4(a3);
}

- (void).cxx_destruct
{
  v3 = (char *)self
     + OBJC_IVAR____TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView_attributedText;
  uint64_t v4 = sub_22A168C20();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView_textView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView_preferredFont));
  id v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7MusicUIP33_5E55BD6998E5885F12992DFD4348C85023UIKitScrollableTextView____lazy_storage___sizingTextView);
}

@end