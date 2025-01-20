@interface DistanceAccessoryLabelViewModel
- (UIView)labelView;
- (_TtC4Maps31DistanceAccessoryLabelViewModel)init;
- (void)setLabelView:(id)a3;
- (void)setString:(id)a3;
@end

@implementation DistanceAccessoryLabelViewModel

- (_TtC4Maps31DistanceAccessoryLabelViewModel)init
{
  return (_TtC4Maps31DistanceAccessoryLabelViewModel *)sub_1002AE730();
}

- (void)setString:(id)a3
{
  uint64_t v5 = type metadata accessor for AttributedString();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v11 = (char *)&v15 - v10;
  id v12 = a3;
  v13 = self;
  AttributedString.init(_:)();
  swift_getKeyPath();
  swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
  v14 = v13;
  static Published.subscript.setter();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
}

- (UIView)labelView
{
  v2 = self;
  id v3 = sub_1002AEA90();

  return (UIView *)v3;
}

- (void)setLabelView:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC4Maps31DistanceAccessoryLabelViewModel____lazy_storage___labelView);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC4Maps31DistanceAccessoryLabelViewModel____lazy_storage___labelView) = (Class)a3;
  id v4 = a3;

  sub_10010B3BC(v3);
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC4Maps31DistanceAccessoryLabelViewModel__distanceString;
  uint64_t v4 = sub_1000FF33C(&qword_1015D9720);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC4Maps31DistanceAccessoryLabelViewModel____lazy_storage___labelView);

  sub_10010B3BC(v5);
}

@end