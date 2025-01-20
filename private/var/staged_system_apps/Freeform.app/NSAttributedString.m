@interface NSAttributedString
- (id)crl_writeToFileUsingName:(id)a3 type:(int64_t)a4 error:(id *)a5;
@end

@implementation NSAttributedString

- (id)crl_writeToFileUsingName:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;
  v15 = self;
  sub_1006A1820(v12, v14, (void *)a4, (uint64_t)v11);
  swift_bridgeObjectRelease();

  URL._bridgeToObjectiveC()(v16);
  v18 = v17;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

  return v18;
}

@end