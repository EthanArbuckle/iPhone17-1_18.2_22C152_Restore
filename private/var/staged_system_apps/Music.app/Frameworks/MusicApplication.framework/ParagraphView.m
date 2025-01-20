@interface ParagraphView
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CGRect)bounds;
- (CGRect)frame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (NSString)title;
- (_TtC16MusicApplication13ParagraphView)initWithCoder:(id)a3;
- (_TtC16MusicApplication13ParagraphView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setText:(id)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ParagraphView

- (_TtC16MusicApplication13ParagraphView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication13ParagraphView *)sub_521EC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication13ParagraphView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_526024();
}

- (NSString)title
{
  return (NSString *)sub_42EA8();
}

- (void)setTitle:(id)a3
{
}

- (NSString)text
{
  return (NSString *)sub_42EA8();
}

- (void)setText:(id)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_5231F4(a3);
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v2 = self;
  sub_5233DC();
}

- (CGRect)frame
{
  sub_9103C(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_5235FC((SEL *)&selRef_frame, (SEL *)&selRef_setFrame_, x, y, width, height);
}

- (CGRect)bounds
{
  sub_9103C(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_5235FC((SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_, x, y, width, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self;
  sub_521350(width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_523798();
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
  LOBYTE(length) = sub_5261DC((uint64_t)v14, location, length);

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return length & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_3750C(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication13ParagraphView_textStyle));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication13ParagraphView_textViewLabelPropertiesHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication13ParagraphView_layoutInvalidationHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication13ParagraphView_moreButtonHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13ParagraphView____lazy_storage___divider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13ParagraphView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13ParagraphView____lazy_storage___textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13ParagraphView____lazy_storage___sizingTextView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13ParagraphView____lazy_storage___moreButton));

  swift_bridgeObjectRelease();
}

@end