@interface PosterRenderer
- (_TtC20PhotosPosterProvider14PosterRenderer)init;
- (void)renderer:(PRRenderer *)a3 shouldDropExcessResourcesWithCompletionHandler:(id)a4;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)rendererDidInvalidate:(id)a3;
@end

@implementation PosterRenderer

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100002CD4(v4);
}

- (void)renderer:(PRRenderer *)a3 shouldDropExcessResourcesWithCompletionHandler:(id)a4
{
}

- (_TtC20PhotosPosterProvider14PosterRenderer)init
{
  return (_TtC20PhotosPosterProvider14PosterRenderer *)sub_100008FE4(&OBJC_IVAR____TtC20PhotosPosterProvider14PosterRenderer_controller, &OBJC_IVAR____TtC20PhotosPosterProvider14PosterRenderer_renderingEnvironment, (uint64_t)&OBJC_IVAR____TtC20PhotosPosterProvider14PosterRenderer_signpostID, type metadata accessor for PosterRenderer);
}

- (void).cxx_destruct
{
}

@end