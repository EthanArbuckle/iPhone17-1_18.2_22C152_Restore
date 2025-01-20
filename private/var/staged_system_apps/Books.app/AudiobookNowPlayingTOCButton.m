@interface AudiobookNowPlayingTOCButton
- (BOOL)hasSupplementalContent;
- (NSString)accessibilityValue;
- (_TtC5Books28AudiobookNowPlayingTOCButton)initWithCoder:(id)a3;
- (_TtC5Books28AudiobookNowPlayingTOCButton)initWithFrame:(CGRect)a3;
- (void)setAccessibilityValue:(id)a3;
- (void)setHasSupplementalContent:(BOOL)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
@end

@implementation AudiobookNowPlayingTOCButton

- (BOOL)hasSupplementalContent
{
  return *((unsigned char *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_hasSupplementalContent);
}

- (void)setHasSupplementalContent:(BOOL)a3
{
  int v3 = *((unsigned __int8 *)&self->super.super.super.super.super.isa
       + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_hasSupplementalContent);
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_hasSupplementalContent) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_1002E30D0();
  }
}

- (_TtC5Books28AudiobookNowPlayingTOCButton)initWithFrame:(CGRect)a3
{
  return (_TtC5Books28AudiobookNowPlayingTOCButton *)sub_1002E29FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AudiobookNowPlayingTOCButton();
  [(AudiobookNowPlayingTOCButton *)&v6 setImage:a3 forState:a4];
}

- (_TtC5Books28AudiobookNowPlayingTOCButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_hasSupplementalContent) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_platterColor) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_docIconColor) = 0;
  uint64_t v4 = OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_supplementalView;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_1002E25C8();

  result = (_TtC5Books28AudiobookNowPlayingTOCButton *)sub_1007FF260();
  __break(1u);
  return result;
}

- (NSString)accessibilityValue
{
  v2 = self;
  sub_1002E33C0();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setAccessibilityValue:(id)a3
{
  if (a3)
  {
    sub_1007FDC70();
    uint64_t v4 = self;
    NSString v5 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v6 = self;
    NSString v5 = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AudiobookNowPlayingTOCButton();
  [(AudiobookNowPlayingTOCButton *)&v7 setAccessibilityValue:v5];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_platterColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_docIconColor));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Books28AudiobookNowPlayingTOCButton_supplementalView);
}

@end