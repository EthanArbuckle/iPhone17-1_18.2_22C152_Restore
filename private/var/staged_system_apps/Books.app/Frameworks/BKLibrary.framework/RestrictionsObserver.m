@interface RestrictionsObserver
- (_TtC9BKLibraryP33_58FC24B0C0DE226ACFC9DF3CB0D6712B20RestrictionsObserver)init;
- (void)restrictionsForBookStoreAllowedChanged:(BOOL)a3;
@end

@implementation RestrictionsObserver

- (void)restrictionsForBookStoreAllowedChanged:(BOOL)a3
{
  uint64_t v5 = sub_71350(&qword_EE578);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10[15] = a3;
  v9 = self;
  sub_71350((uint64_t *)&unk_EE580);
  sub_93BC0();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC9BKLibraryP33_58FC24B0C0DE226ACFC9DF3CB0D6712B20RestrictionsObserver)init
{
  result = (_TtC9BKLibraryP33_58FC24B0C0DE226ACFC9DF3CB0D6712B20RestrictionsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC9BKLibraryP33_58FC24B0C0DE226ACFC9DF3CB0D6712B20RestrictionsObserver_continuation;
  uint64_t v3 = sub_71350((uint64_t *)&unk_EE580);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end