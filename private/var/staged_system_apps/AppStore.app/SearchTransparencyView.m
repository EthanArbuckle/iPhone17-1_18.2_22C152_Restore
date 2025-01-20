@interface SearchTransparencyView
- (_TtC8AppStore22SearchTransparencyView)initWithCoder:(id)a3;
- (_TtC8AppStore22SearchTransparencyView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SearchTransparencyView

- (_TtC8AppStore22SearchTransparencyView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore22SearchTransparencyView *)sub_100387D8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore22SearchTransparencyView)initWithCoder:(id)a3
{
  uint64_t v5 = type metadata accessor for FontUseCase();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtC8AppStore22SearchTransparencyView_linkedLabel;
  uint64_t v10 = qword_10097F5D0;
  id v11 = a3;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_100087728(v5, (uint64_t)qword_1009E4BC8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
  id v13 = objc_allocWithZone((Class)type metadata accessor for DynamicTypeLinkedLabel());
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = (Class)sub_10034EA28((uint64_t)v8, 0, 0);

  result = (_TtC8AppStore22SearchTransparencyView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003881B0();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchTransparencyView();
  id v2 = v3.receiver;
  [(SearchTransparencyView *)&v3 prepareForReuse];
  sub_10034F1CC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore22SearchTransparencyView_linkedLabel));
}

@end