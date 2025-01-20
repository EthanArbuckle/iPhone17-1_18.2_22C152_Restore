@interface JSRecentSearchItem
- (JSValue)contentDescriptor;
- (JSValue)timestamp;
- (_TtC7MusicUI18JSRecentSearchItem)init;
@end

@implementation JSRecentSearchItem

- (JSValue)timestamp
{
  v2 = self;
  v3 = (void *)sub_22A024980();

  return (JSValue *)v3;
}

- (JSValue)contentDescriptor
{
  v2 = self;
  v3 = (void *)sub_22A024980();

  return (JSValue *)v3;
}

- (_TtC7MusicUI18JSRecentSearchItem)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7MusicUI18JSRecentSearchItem__timestamp;
  uint64_t v4 = sub_22A1691B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_22947A480((uint64_t)self + OBJC_IVAR____TtC7MusicUI18JSRecentSearchItem__contentDescriptor);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7MusicUI18JSRecentSearchItem____lazy_storage___context);
}

@end