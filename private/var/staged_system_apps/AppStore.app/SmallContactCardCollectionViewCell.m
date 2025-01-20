@interface SmallContactCardCollectionViewCell
- (_TtC8AppStore34SmallContactCardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC8AppStore34SmallContactCardCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SmallContactCardCollectionViewCell

- (_TtC8AppStore34SmallContactCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore34SmallContactCardCollectionViewCell *)sub_1005D44AC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore34SmallContactCardCollectionViewCell)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore34SmallContactCardCollectionViewCell_itemLayoutContext;
  uint64_t v6 = type metadata accessor for ItemLayoutContext();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore34SmallContactCardCollectionViewCell_recommendationsDataUpdateDelegate) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore34SmallContactCardCollectionViewCell_requestSentDataUpdateDelegate) = 0;
  id v7 = a3;

  result = (_TtC8AppStore34SmallContactCardCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(SmallContactCardCollectionViewCell *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore34SmallContactCardCollectionViewCell_smallPlayerCard];
  [v2 bounds];
  [v3 setFrame:];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(SmallContactCardCollectionViewCell *)&v3 prepareForReuse];
  dispatch thunk of SmallPlayerCardView.prepareForReuse()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34SmallContactCardCollectionViewCell_smallPlayerCard));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore34SmallContactCardCollectionViewCell_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore34SmallContactCardCollectionViewCell_recommendationsDataUpdateDelegate));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore34SmallContactCardCollectionViewCell_requestSentDataUpdateDelegate);
}

@end