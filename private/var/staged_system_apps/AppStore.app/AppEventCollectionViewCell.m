@interface AppEventCollectionViewCell
- (_TtC8AppStore26AppEventCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore26AppEventCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation AppEventCollectionViewCell

- (_TtC8AppStore26AppEventCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore26AppEventCollectionViewCell *)sub_100245230();
}

- (_TtC8AppStore26AppEventCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore26AppEventCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  id v7 = a3;

  result = (_TtC8AppStore26AppEventCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v2 = (char *)v9.receiver;
  [(AppEventCollectionViewCell *)&v9 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore26AppEventCollectionViewCell_appEventView];
  [v2 bounds];
  [v3 setBounds:0.0, 0.0];
  [v2 bounds];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  double MidX = CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  [v3 setCenter:MidX, CGRectGetMidY(v11)];
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10024483C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore26AppEventCollectionViewCell_appEventView));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore26AppEventCollectionViewCell_itemLayoutContext, &qword_100984EA0);
}

@end