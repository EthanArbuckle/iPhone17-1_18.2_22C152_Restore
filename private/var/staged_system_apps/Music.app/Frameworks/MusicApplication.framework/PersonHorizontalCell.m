@interface PersonHorizontalCell
- (BOOL)showsContextMenu;
- (NSString)accessibilityPersonName;
- (NSString)accessibilityPersonSubtitle;
- (_TtC16MusicApplication20PersonHorizontalCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication20PersonHorizontalCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PersonHorizontalCell

- (_TtC16MusicApplication20PersonHorizontalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication20PersonHorizontalCell *)sub_17EEE0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication20PersonHorizontalCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_180A7C();
}

- (BOOL)showsContextMenu
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_17F87C();
}

- (NSString)accessibilityPersonName
{
  return (NSString *)sub_42EA8();
}

- (NSString)accessibilityPersonSubtitle
{
  return (NSString *)sub_42EA8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  id v3 = *(void **)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication20PersonHorizontalCell____lazy_storage___disclosureIndicator];
}

@end