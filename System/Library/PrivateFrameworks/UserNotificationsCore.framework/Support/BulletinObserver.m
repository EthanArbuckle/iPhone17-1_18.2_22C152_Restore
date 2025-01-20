@interface BulletinObserver
- (_TtC18usernotificationsd16BulletinObserver)init;
- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7;
@end

@implementation BulletinObserver

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7
{
  BOOL v7 = a6;
  v11 = _Block_copy(a7);
  if (v11)
  {
    *(void *)(swift_allocObject() + 16) = v11;
    v11 = sub_100005A20;
  }
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_100005800(a4, v7, (uint64_t)v11);
  sub_1000059D8((uint64_t)v11);
}

- (_TtC18usernotificationsd16BulletinObserver)init
{
  result = (_TtC18usernotificationsd16BulletinObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18usernotificationsd16BulletinObserver____lazy_storage___queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18usernotificationsd16BulletinObserver____lazy_storage___observerQueue));
  swift_release();

  swift_release();
}

@end