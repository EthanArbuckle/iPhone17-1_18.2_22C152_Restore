@interface MenuCell
- (BOOL)accessibilityIsDimmed;
- (BOOL)isEditing;
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (NSString)accessoryText;
- (NSString)detailText;
- (NSString)titleText;
- (_TtC16MusicApplication8MenuCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication8MenuCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (int64_t)accessoryType;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessibilityIsDimmed:(BOOL)a3;
- (void)setAccessoryText:(id)a3;
- (void)setAccessoryType:(int64_t)a3;
- (void)setDetailText:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitleText:(id)a3;
- (void)switchValueChanged:(id)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MenuCell

- (_TtC16MusicApplication8MenuCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication8MenuCell *)sub_542614(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication8MenuCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_54541C();
}

- (NSString)titleText
{
  return (NSString *)sub_42EA8();
}

- (void)setTitleText:(id)a3
{
}

- (NSString)detailText
{
  return (NSString *)sub_42EA8();
}

- (void)setDetailText:(id)a3
{
}

- (NSString)accessoryText
{
  if (*(void *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8MenuCell_accessoryText])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setAccessoryText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_AB6510();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8MenuCell_accessoryText];
  uint64_t v7 = *(void *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8MenuCell_accessoryText];
  uint64_t v8 = *(void *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8MenuCell_accessoryText];
  uint64_t *v6 = v4;
  v6[1] = v5;
  v9 = self;
  sub_542D4C(v7, v8);

  swift_bridgeObjectRelease();
}

- (BOOL)accessibilityIsDimmed
{
  return self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8MenuCell_accessibilityIsDimmed];
}

- (void)setAccessibilityIsDimmed:(BOOL)a3
{
  self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8MenuCell_accessibilityIsDimmed] = a3;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  v6 = sub_545870(v4);

  return v6;
}

- (void)layoutSubviews
{
  NSString v2 = self;
  sub_5430A4();
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MenuCell();
  id v2 = v3.receiver;
  [(MenuCell *)&v3 tintColorDidChange];
  sub_544558();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_5434CC(a3);
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MenuCell();
  id v2 = (char *)v4.receiver;
  [(HorizontalLockupCollectionViewCell *)&v4 prepareForReuse];
  sub_544558();
  objc_super v3 = &v2[OBJC_IVAR____TtC16MusicApplication8MenuCell_notificationBadgeValue];
  *(void *)objc_super v3 = 0;
  v3[8] = 1;
}

- (BOOL)isEditing
{
  return sub_543BEC(self, (uint64_t)a2, (SEL *)&selRef_isEditing);
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (objc_class *)type metadata accessor for MenuCell();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  unsigned int v7 = [(HorizontalLockupCollectionViewCell *)&v9 isEditing];
  v8.receiver = v6;
  v8.super_class = v5;
  [(HorizontalLockupCollectionViewCell *)&v8 setEditing:v3];
  if (v7 != [(MenuCell *)v6 isEditing]) {
    sub_544558();
  }
}

- (BOOL)isHighlighted
{
  return sub_543BEC(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (objc_class *)type metadata accessor for MenuCell();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  unsigned int v7 = [(MenuCell *)&v9 isHighlighted];
  v8.receiver = v6;
  v8.super_class = v5;
  [(MenuCell *)&v8 setHighlighted:v3];
  if (v7 != [(MenuCell *)v6 isHighlighted]) {
    sub_544558();
  }
}

- (BOOL)isSelected
{
  return sub_543BEC(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (objc_class *)type metadata accessor for MenuCell();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  unsigned int v7 = [(HorizontalLockupCollectionViewCell *)&v9 isSelected];
  v8.receiver = v6;
  v8.super_class = v5;
  [(HorizontalLockupCollectionViewCell *)&v8 setSelected:v3];
  if (v7 != [(MenuCell *)v6 isSelected]
    || [(MenuCell *)v6 isSelected] && [(MenuCell *)v6 isEditing])
  {
    sub_544558();
  }
}

- (int64_t)accessoryType
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MenuCell();
  return [(MenuCell *)&v3 accessoryType];
}

- (void)setAccessoryType:(int64_t)a3
{
  id v5 = (objc_class *)type metadata accessor for MenuCell();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  id v7 = [(MenuCell *)&v9 accessoryType];
  v8.receiver = v6;
  v8.super_class = v5;
  [(MenuCell *)&v8 setAccessoryType:a3];
  sub_543DC0(v7);
}

- (void)switchValueChanged:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_544254(v4);
}

- (void).cxx_destruct
{
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC16MusicApplication8MenuCell_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_87510(*(id *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8MenuCell_titleCustomDeselectedTextColor]);
  objc_super v3 = *(void **)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8MenuCell_textComponents + 8];
  id v4 = *(void **)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8MenuCell_textComponents + 16];
  swift_release();
  swift_release();

  id v5 = *(void **)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8MenuCell____lazy_storage___notificationBadgeView];
}

@end