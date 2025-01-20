@interface PXSyntheticPerson
- (BOOL)isPersonModel;
- (BOOL)isVerified;
- (BOOL)px_isHuman;
- (BOOL)px_isPet;
- (NSString)px_localIdentifier;
- (PXSyntheticPerson)init;
- (id)name;
- (int)requestFaceCropImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 cropFactor:(int64_t)a5 style:(int64_t)a6 cacheResult:(BOOL)a7 synchronous:(BOOL)a8 resultHandler:(id)a9;
- (int64_t)numberOfAssets;
- (signed)detectionType;
@end

@implementation PXSyntheticPerson

- (int)requestFaceCropImageWithTargetSize:(CGSize)a3 displayScale:(double)a4 cropFactor:(int64_t)a5 style:(int64_t)a6 cacheResult:(BOOL)a7 synchronous:(BOOL)a8 resultHandler:(id)a9
{
  v10 = (void (**)(void *, void, void *))_Block_copy(a9);
  v11 = self;
  sub_1A9F837C4(MEMORY[0x1E4FBC860]);
  v12 = (void *)sub_1AB23A4CC();
  v10[2](v10, 0, v12);
  swift_bridgeObjectRelease();

  _Block_release(v10);
  return 0;
}

- (int64_t)numberOfAssets
{
  return 42;
}

- (id)name
{
  if (*(void *)(a1 + OBJC_IVAR___PXSyntheticPerson_name + 8)) {
    _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  }
  return 0;
}

- (NSString)px_localIdentifier
{
}

- (BOOL)isVerified
{
  return 1;
}

- (BOOL)isPersonModel
{
  return 1;
}

- (signed)detectionType
{
  return 1;
}

- (BOOL)px_isHuman
{
  return 1;
}

- (BOOL)px_isPet
{
  return 0;
}

- (PXSyntheticPerson)init
{
  result = (PXSyntheticPerson *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end