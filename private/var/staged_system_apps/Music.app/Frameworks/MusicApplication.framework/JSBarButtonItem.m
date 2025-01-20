@interface JSBarButtonItem
@end

@implementation JSBarButtonItem

- (void).cxx_destruct
{
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore15JSBarButtonItem_barButtonItemDelegate);
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore15JSBarButtonItem__title;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_DD74E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore15JSBarButtonItem__menu;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFCA78);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end