@interface MTNowPlayingArtworkProvider
- (MTNowPlayingArtworkProvider)init;
- (id)fetchInfoCenterArtworkWith:(id)a3 at:(double)a4 of:(CGSize)a5 completion:(id)a6;
@end

@implementation MTNowPlayingArtworkProvider

- (id)fetchInfoCenterArtworkWith:(id)a3 at:(double)a4 of:(CGSize)a5 completion:(id)a6
{
  double height = a5.height;
  double width = a5.width;
  v11 = _Block_copy(a6);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a3;
  v14 = self;
  id v15 = NowPlayingArtworkProviderObjCWrapper.fetchInfoCenterArtwork(with:at:of:completion:)(v13, (uint64_t)sub_1E3D4810C, v12, a4, width, height);

  swift_release();

  return v15;
}

- (MTNowPlayingArtworkProvider)init
{
  result = (MTNowPlayingArtworkProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end