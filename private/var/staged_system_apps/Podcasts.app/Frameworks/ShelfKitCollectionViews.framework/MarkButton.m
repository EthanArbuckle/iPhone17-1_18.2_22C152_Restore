@interface MarkButton
- (BOOL)isHighlighted;
- (BOOL)isUserInteractionEnabled;
- (_TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation MarkButton

- (_TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton_styleDidChange);
  void *v4 = 0;
  v4[1] = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton_labelActive) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton_style) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton_animateHoverChanges) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton_isHovering) = 0;
  id v5 = a3;

  result = (_TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton *)sub_385890();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  return sub_2F9878(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
}

- (BOOL)isUserInteractionEnabled
{
  return sub_2F9878(self, (uint64_t)a2, (SEL *)&selRef_isUserInteractionEnabled);
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
}

- (_TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_8011BE26F891C4A443938FF26204113410MarkButton_styleDidChange);

  sub_27760(v3);
}

@end