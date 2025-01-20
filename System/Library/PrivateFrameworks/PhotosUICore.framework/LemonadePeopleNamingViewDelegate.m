@interface LemonadePeopleNamingViewDelegate
- (_TtC12PhotosUICore32LemonadePeopleNamingViewDelegate)init;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
@end

@implementation LemonadePeopleNamingViewDelegate

- (void)contactPickerDidCancel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AB23B21C();
  id v6 = (id)*sub_1A9BB963C();
  sub_1AB23563C();
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1AA7F0018(v7);
}

- (_TtC12PhotosUICore32LemonadePeopleNamingViewDelegate)init
{
  result = (_TtC12PhotosUICore32LemonadePeopleNamingViewDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore32LemonadePeopleNamingViewDelegate_dismissAction;
  uint64_t v4 = sub_1AB23690C();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
}

@end