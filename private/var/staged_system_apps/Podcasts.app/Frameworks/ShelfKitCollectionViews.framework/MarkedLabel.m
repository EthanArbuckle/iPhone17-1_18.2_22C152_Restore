@interface MarkedLabel
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC23ShelfKitCollectionViews11MarkedLabel)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews11MarkedLabel)initWithFrame:(CGRect)a3;
- (void)buttonTriggeredWithButton:(id)a3;
- (void)layoutSubviews;
@end

@implementation MarkedLabel

- (_TtC23ShelfKitCollectionViews11MarkedLabel)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2FA370();
}

- (void)buttonTriggeredWithButton:(id)a3
{
  id v3 = *(void (**)(id, uint64_t))((char *)&self->super.super.super.isa
                                          + OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_markTriggered);
  if (v3)
  {
    uint64_t v5 = *(void *)((char *)a3
                   + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton_mark
                   + 16);
    id v6 = a3;
    v7 = self;
    sub_3C800((uint64_t)v3);
    swift_bridgeObjectRetain();
    v3(v6, v5);
    sub_27760((uint64_t)v3);

    swift_bridgeObjectRelease();
  }
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2F8658();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_textView) sizeThatFits:a3.width, a3.height];
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC23ShelfKitCollectionViews11MarkedLabel)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_markInteractionValidation));
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_markTriggered));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_textView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews11MarkedLabel_labelTextColor));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end