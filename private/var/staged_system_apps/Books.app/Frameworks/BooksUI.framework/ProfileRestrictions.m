@interface ProfileRestrictions
- (_TtC7BooksUI19ProfileRestrictions)init;
- (void)dealloc;
- (void)restrictionsForAccountModificationAllowedChanged:(BOOL)a3;
- (void)restrictionsForBookStoreAllowedChanged:(BOOL)a3;
- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3;
@end

@implementation ProfileRestrictions

- (_TtC7BooksUI19ProfileRestrictions)init
{
  return (_TtC7BooksUI19ProfileRestrictions *)ProfileRestrictions.init()();
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  objc_msgSend(objc_msgSend(v3, "sharedInstance"), "removeObserver:", v4);
  swift_unknownObjectRelease();
  v5.receiver = v4;
  v5.super_class = (Class)type metadata accessor for ProfileRestrictions();
  [(ProfileRestrictions *)&v5 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7BooksUI19ProfileRestrictions__isExplicitContentAllowed;
  uint64_t v4 = sub_4A98(&qword_2F7208);
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v6((char *)self + OBJC_IVAR____TtC7BooksUI19ProfileRestrictions__isBookStoreAllowed, v4);
  objc_super v5 = (char *)self + OBJC_IVAR____TtC7BooksUI19ProfileRestrictions__isAccountModificationAllowed;

  v6(v5, v4);
}

- (void)restrictionsForExplicitContentAllowedChanged:(BOOL)a3
{
}

- (void)restrictionsForBookStoreAllowedChanged:(BOOL)a3
{
}

- (void)restrictionsForAccountModificationAllowedChanged:(BOOL)a3
{
}

@end