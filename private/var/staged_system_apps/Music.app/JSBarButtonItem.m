@interface JSBarButtonItem
@end

@implementation JSBarButtonItem

- (void).cxx_destruct
{
  sub_100046744((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore15JSBarButtonItem_barButtonItemDelegate);
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore15JSBarButtonItem__title;
  uint64_t v4 = sub_100063814(&qword_10109C170);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore15JSBarButtonItem__menu;
  uint64_t v6 = sub_100063814(&qword_1010D2500);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end