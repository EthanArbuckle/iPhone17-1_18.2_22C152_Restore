@interface PosterRenderer
- (_TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD414PosterRenderer)init;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didReceiveTapAtPoint:(CGPoint)a4;
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
  sub_1000059B8(v4);
}

- (void)renderer:(id)a3 didReceiveTapAtPoint:(CGPoint)a4
{
  id v5 = a3;
  v6 = self;
  sub_100005C88(v5);
}

- (_TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD414PosterRenderer)init
{
  return (_TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD414PosterRenderer *)sub_10000B014(&OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD414PosterRenderer_controller, &OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD414PosterRenderer_renderingEnvironment, (uint64_t)&OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD414PosterRenderer_signpostID, type metadata accessor for PosterRenderer);
}

- (void).cxx_destruct
{
}

@end