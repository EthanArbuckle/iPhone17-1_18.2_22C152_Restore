@interface CollectionsPosterRenderDelegate
- (_TtC17CollectionsPoster31CollectionsPosterRenderDelegate)init;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)rendererDidInvalidate:(id)a3;
@end

@implementation CollectionsPosterRenderDelegate

- (_TtC17CollectionsPoster31CollectionsPosterRenderDelegate)init
{
  return (_TtC17CollectionsPoster31CollectionsPosterRenderDelegate *)sub_100003F04();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_renderer));
  sub_100006348((uint64_t)self + OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_environmentSnapshot);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CollectionsPoster31CollectionsPosterRenderDelegate_renderingEnvironment));
  swift_release();
}

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1000046B8(v6, a4);

  swift_unknownObjectRelease();
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_100005184((uint64_t)v8, a4, a5);

  swift_unknownObjectRelease();
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100005C84();
}

@end