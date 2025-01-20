@interface HorizontalStackView
- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4;
- (CGSize)effectiveLayoutSizeFittingSize:(CGSize)a3;
- (_TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView)initWithArrangedSubviews:(id)isa;
- (_TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView)initWithCoder:(id)a3;
- (_TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView)initWithFrame:(CGRect)a3;
- (void)invalidateInternalStateForInvalidation:(int64_t)a3;
@end

@implementation HorizontalStackView

- (_TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = &self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_rootStackViewWidth];
  *(void *)v9 = 0;
  v9[8] = 1;
  *(void *)&self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_sizeCache] = _swiftEmptyDictionarySingleton;
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[HorizontalStackView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  [(HorizontalStackView *)v10 setNeverCacheEffectiveLayoutSize:1];
  return v10;
}

- (_TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView)initWithArrangedSubviews:(id)isa
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (isa)
  {
    sub_1000368FC(0, (unint64_t *)&qword_100788600);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = &self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_rootStackViewWidth];
    *(void *)v6 = 0;
    v6[8] = 1;
    *(void *)&self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_sizeCache] = _swiftEmptyDictionarySingleton;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = &self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_rootStackViewWidth];
    *(void *)v7 = 0;
    v7[8] = 1;
    *(void *)&self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_sizeCache] = _swiftEmptyDictionarySingleton;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = [(HorizontalStackView *)&v10 initWithArrangedSubviews:isa];

  [(HorizontalStackView *)v8 setNeverCacheEffectiveLayoutSize:1];
  return v8;
}

- (_TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView)initWithCoder:(id)a3
{
  v4 = &self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_rootStackViewWidth];
  *(void *)v4 = 0;
  v4[8] = 1;
  *(void *)&self->superclass_opaque[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_sizeCache] = _swiftEmptyDictionarySingleton;
  id v5 = a3;

  result = (_TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = self;
  sub_10064C71C((uint64_t)v7, width, height);
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)effectiveLayoutSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  double v6 = sub_10064C844(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)invalidateInternalStateForInvalidation:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  [(HorizontalStackView *)&v6 invalidateInternalStateForInvalidation:a3];
  if (a3 > 1)
  {
    id v5 = &v4[OBJC_IVAR____TtC9RemindersP33_A9D13F37E55CE2918CCED93628D156D919HorizontalStackView_sizeCache];
    swift_beginAccess();
    *(void *)id v5 = _swiftEmptyDictionarySingleton;

    swift_bridgeObjectRelease();
  }
  else
  {
  }
}

- (void).cxx_destruct
{
}

@end