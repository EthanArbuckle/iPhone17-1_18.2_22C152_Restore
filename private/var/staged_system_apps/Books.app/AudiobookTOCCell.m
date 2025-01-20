@interface AudiobookTOCCell
- (NSArray)accessibilityUserInputLabels;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC5Books16AudiobookTOCCell)initWithCoder:(id)a3;
- (_TtC5Books16AudiobookTOCCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
- (void)setAccessibilityLabel:(id)a3;
- (void)setAccessibilityUserInputLabels:(id)a3;
- (void)setAccessibilityValue:(id)a3;
@end

@implementation AudiobookTOCCell

- (_TtC5Books16AudiobookTOCCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)sub_1007FDC70();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC5Books16AudiobookTOCCell *)sub_10054B3EC(a3, (uint64_t)a4, v6);
}

- (_TtC5Books16AudiobookTOCCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10054D0AC();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10054BFA0();
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_10054C3D4(self, (uint64_t)a2, (void (*)(void))sub_10054C168);
}

- (void)setAccessibilityLabel:(id)a3
{
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_10054C3D4(self, (uint64_t)a2, (void (*)(void))sub_10054C454);
}

- (void)setAccessibilityValue:(id)a3
{
}

- (NSArray)accessibilityUserInputLabels
{
  v2 = self;
  id v3 = sub_10054CC60();

  if (v3)
  {
    v4.super.isa = sub_1007FDFE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityUserInputLabels:(id)a3
{
  if (a3)
  {
    sub_1007FDFF0();
    NSArray v4 = self;
    v5.super.isa = sub_1007FDFE0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = self;
    v5.super.isa = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AudiobookTOCCell();
  [(AudiobookTOCCell *)&v7 setAccessibilityUserInputLabels:v5.super.isa];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books16AudiobookTOCCell_chapterTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books16AudiobookTOCCell_chapterTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books16AudiobookTOCCell_bookmarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books16AudiobookTOCCell_nowPlayingIndicator));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5Books16AudiobookTOCCell_nowPlayingView);
}

@end