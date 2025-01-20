@interface doc_invalidObjCActionClass
- (_TtC5FilesP33_C5D1CB1CA0AFEDBC7090129A90982C9D26doc_invalidObjCActionClass)init;
- (void)actionNoOneImplements:(id)a3;
@end

@implementation doc_invalidObjCActionClass

- (void)actionNoOneImplements:(id)a3
{
  if (a3)
  {
    v3 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();

    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_1000CBBA4((uint64_t)v4, (uint64_t *)&unk_100705D60);
}

- (_TtC5FilesP33_C5D1CB1CA0AFEDBC7090129A90982C9D26doc_invalidObjCActionClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for doc_invalidObjCActionClass();
  return [(doc_invalidObjCActionClass *)&v3 init];
}

@end