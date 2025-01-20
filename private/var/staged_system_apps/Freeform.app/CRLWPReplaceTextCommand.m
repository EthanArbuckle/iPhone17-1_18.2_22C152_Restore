@interface CRLWPReplaceTextCommand
- (BOOL)canCoalesce;
- (BOOL)wantsToCoalesceWith:(id)a3;
- (NSString)actionString;
- (_TtC8Freeform14CRLWPShapeItem)shapeItem;
- (_TtC8Freeform23CRLWPReplaceTextCommand)init;
- (_TtC8Freeform23CRLWPReplaceTextCommand)initWithShapeItem:(id)a3 range:(_NSRange)a4 text:(id)a5;
@end

@implementation CRLWPReplaceTextCommand

- (_TtC8Freeform14CRLWPShapeItem)shapeItem
{
  return (_TtC8Freeform14CRLWPShapeItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                  + OBJC_IVAR____TtC8Freeform23CRLWPReplaceTextCommand_shapeItem));
}

- (_TtC8Freeform23CRLWPReplaceTextCommand)initWithShapeItem:(id)a3 range:(_NSRange)a4 text:(id)a5
{
  NSUInteger length = a4.length;
  location = (_TtC8Freeform23CRLWPReplaceTextCommand *)a4.location;
  uint64_t v8 = sub_1005057FC((uint64_t *)&unk_101687B10);
  __chkstk_darwin(v8 - 8, v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1005057FC((uint64_t *)&unk_1016837D0);
  __chkstk_darwin(v12 - 8, v13);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  id v19 = a3;
  result = (_TtC8Freeform23CRLWPReplaceTextCommand *)NSNotFound.getter();
  if (location == result)
  {
    __break(1u);
  }
  else
  {
    BOOL v21 = __OFADD__(location, length);
    uint64_t v22 = (uint64_t)location + length;
    if (!v21)
    {
      uint64_t v23 = sub_1005057FC((uint64_t *)&unk_101683740);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v15, 1, 1, v23);
      uint64_t v24 = sub_1005057FC(&qword_101687A90);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v11, 1, 1, v24);
      id v25 = objc_allocWithZone((Class)type metadata accessor for CRLWPReplaceTextCommand(0));
      v26 = (_TtC8Freeform23CRLWPReplaceTextCommand *)sub_1007A8FA0((uint64_t)v19, (uint64_t)location, v22, v16, v18, 0, (uint64_t)v15, (uint64_t)v11);
      swift_getObjectType();
      swift_deallocPartialClassInstance();
      return v26;
    }
  }
  __break(1u);
  return result;
}

- (BOOL)canCoalesce
{
  return 1;
}

- (BOOL)wantsToCoalesceWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1007AAF00();

  return self & 1;
}

- (NSString)actionString
{
  v3 = self;
  id v4 = self;
  id v5 = [v3 mainBundle];
  NSString v6 = String._bridgeToObjectiveC()();
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [v5 localizedStringForKey:v6 value:v7 table:0];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v9;
}

- (_TtC8Freeform23CRLWPReplaceTextCommand)init
{
  result = (_TtC8Freeform23CRLWPReplaceTextCommand *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform23CRLWPReplaceTextCommand_replacement, &qword_101680258);
}

@end