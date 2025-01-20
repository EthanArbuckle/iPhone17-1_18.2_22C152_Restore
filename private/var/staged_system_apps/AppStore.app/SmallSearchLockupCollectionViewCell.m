@interface SmallSearchLockupCollectionViewCell
- (_TtC8AppStore35SmallSearchLockupCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore35SmallSearchLockupCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SmallSearchLockupCollectionViewCell

- (_TtC8AppStore35SmallSearchLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore35SmallSearchLockupCollectionViewCell *)sub_100345098(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore35SmallSearchLockupCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8AppStore35SmallSearchLockupCollectionViewCell_lockupView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for SmallLockupView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0, 0.0, 0.0, 0.0];

  result = (_TtC8AppStore35SmallSearchLockupCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for SmallSearchLockupCollectionViewCell();
  v2 = (char *)v13.receiver;
  [(SmallSearchLockupCollectionViewCell *)&v13 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore35SmallSearchLockupCollectionViewCell_lockupView];
  id v4 = [v2 contentView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [v3 setFrame:v6, v8, v10, v12];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore35SmallSearchLockupCollectionViewCell_lockupView));
}

@end