@interface NSPersistentCloudKitContainer
+ (id)defaultDirectoryURL;
@end

@implementation NSPersistentCloudKitContainer

+ (id)defaultDirectoryURL
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v8 = (char *)&v15 - v7;
  swift_getObjCClassMetadata();
  v15.receiver = (id)swift_getObjCClassFromMetadata();
  v15.super_class = (Class)&OBJC_METACLASS___NSPersistentCloudKitContainer;
  id v9 = [super defaultDirectoryURL];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  if (qword_1007F6C30 != -1) {
    swift_once();
  }
  if (byte_10083D220 == 1)
  {
    v10._countAndFlagsBits = 0x726F745374736554;
    v10._object = (void *)0xEA00000000007365;
    URL.appendPathComponent(_:)(v10);
  }
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v5, v2);
  URL._bridgeToObjectiveC()(v11);
  v13 = v12;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);

  return v13;
}

@end