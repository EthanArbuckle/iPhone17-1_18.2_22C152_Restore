@interface GlyphPlayButton
- (BOOL)isEnabled;
- (BOOL)isSelected;
- (_TtC23ShelfKitCollectionViews15GlyphPlayButton)initWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation GlyphPlayButton

- (BOOL)isSelected
{
  return sub_C30C0(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
}

- (BOOL)isEnabled
{
  return sub_C30C0(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
}

- (_TtC23ShelfKitCollectionViews15GlyphPlayButton)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews15GlyphPlayButton_isHovering) = 0;
  v6 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews15GlyphPlayButton_playButtonState;
  *(void *)v6 = 0;
  v6[8] = 1;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(GlyphButton *)&v8 initWithCoder:a3];
}

@end