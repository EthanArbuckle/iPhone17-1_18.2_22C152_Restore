@interface SharedTranslations
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (_TtC13TranslationUI18SharedTranslations)init;
- (void)dealloc;
- (void)presentedItemDidChange;
- (void)setPresentedItemOperationQueue:(id)a3;
- (void)setPresentedItemURL:(id)a3;
@end

@implementation SharedTranslations

- (NSOperationQueue)presentedItemOperationQueue
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI18SharedTranslations_presentedItemOperationQueue);
  swift_beginAccess();
  return (NSOperationQueue *)*v2;
}

- (void)setPresentedItemOperationQueue:(id)a3
{
  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC13TranslationUI18SharedTranslations_presentedItemOperationQueue);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (NSURL)presentedItemURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA4CF78);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (char *)self + OBJC_IVAR____TtC13TranslationUI18SharedTranslations_presentedItemURL;
  swift_beginAccess();
  sub_1DB1693CC((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = sub_1DB1EF480();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1DB1EF430();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (void)setPresentedItemURL:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA4CF78);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1DB1EF450();
    uint64_t v8 = sub_1DB1EF480();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_1DB1EF480();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC13TranslationUI18SharedTranslations_presentedItemURL;
  swift_beginAccess();
  uint64_t v11 = self;
  sub_1DB1695D0((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

- (void)dealloc
{
  v2 = self;
  sub_1DB16A858();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for SharedTranslations(0);
  [(SharedTranslations *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13TranslationUI18SharedTranslations_presentedItemOperationQueue));
  sub_1DB0E8BD4((uint64_t)self + OBJC_IVAR____TtC13TranslationUI18SharedTranslations_presentedItemURL, &qword_1EBA4CF78);
  swift_bridgeObjectRelease();
  sub_1DB0EB788(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC13TranslationUI18SharedTranslations_presentedItemChangedAction));
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13TranslationUI18SharedTranslations_fileAccessQueue);
}

- (void)presentedItemDidChange
{
  v2 = self;
  sub_1DB16E0A8();
}

- (_TtC13TranslationUI18SharedTranslations)init
{
  result = (_TtC13TranslationUI18SharedTranslations *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end