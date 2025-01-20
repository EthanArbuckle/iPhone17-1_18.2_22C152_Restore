@interface AccountsObserver
- (_TtC9BKLibraryP33_05F439DD99DBF9E3F4595B1087281DC916AccountsObserver)init;
- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4;
@end

@implementation AccountsObserver

- (void)account:(unint64_t)a3 didChangeWithReason:(unint64_t)a4
{
  v4 = self;
  sub_8AC64();
}

- (_TtC9BKLibraryP33_05F439DD99DBF9E3F4595B1087281DC916AccountsObserver)init
{
  result = (_TtC9BKLibraryP33_05F439DD99DBF9E3F4595B1087281DC916AccountsObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_76FC4((uint64_t)self + OBJC_IVAR____TtC9BKLibraryP33_05F439DD99DBF9E3F4595B1087281DC916AccountsObserver_provider);
  v3 = (char *)self + OBJC_IVAR____TtC9BKLibraryP33_05F439DD99DBF9E3F4595B1087281DC916AccountsObserver_continuation;
  uint64_t v4 = sub_71350((uint64_t *)&unk_EDFD0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end