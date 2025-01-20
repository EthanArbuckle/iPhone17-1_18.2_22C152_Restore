@interface SmallLockupCollectionViewTableCell
- (_TtC8AppStore15SmallLockupView)accessibilityLockupView;
- (_TtC8AppStore34SmallLockupCollectionViewTableCell)initWithCoder:(id)a3;
- (_TtC8AppStore34SmallLockupCollectionViewTableCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SmallLockupCollectionViewTableCell

- (_TtC8AppStore34SmallLockupCollectionViewTableCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore34SmallLockupCollectionViewTableCell *)sub_1004F4C28(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore34SmallLockupCollectionViewTableCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore34SmallLockupCollectionViewTableCell_lockupView;
  type metadata accessor for SmallLockupView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(void *)&self->UICollectionViewTableCell_opaque[v5] = [v6 init];

  result = (_TtC8AppStore34SmallLockupCollectionViewTableCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004F4E60();
}

- (_TtC8AppStore15SmallLockupView)accessibilityLockupView
{
  return (_TtC8AppStore15SmallLockupView *)*(id *)&self->UICollectionViewTableCell_opaque[OBJC_IVAR____TtC8AppStore34SmallLockupCollectionViewTableCell_lockupView];
}

- (void).cxx_destruct
{
}

@end