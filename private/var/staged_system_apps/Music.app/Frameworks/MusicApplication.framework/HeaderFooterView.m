@interface HeaderFooterView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView)initWithCoder:(id)a3;
- (_TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
@end

@implementation HeaderFooterView

- (_TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView *)sub_43446C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_436BA0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_434F90();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView_textView) sizeThatFits:a3.width, a3.height];
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = sub_436C60(v4);

  return v6;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v11 = sub_AB0930();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB08D0();
  id v15 = a3;
  id v16 = a4;
  v17 = self;
  LOBYTE(length) = sub_436D64((uint64_t)v14, location, length);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return length & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplicationP33_7919D88BB8212442612DA538E61A458116HeaderFooterView_textView);
}

@end