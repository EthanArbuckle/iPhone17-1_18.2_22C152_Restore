@interface CRLMediaItem
+ (float)defaultRoundedCornerAmount;
- (BOOL)canBeReplaced;
- (BOOL)canResetMediaSize;
- (BOOL)hasRoundedCorners;
- (BOOL)isAnimatedImage;
- (BOOL)isLooping;
- (BOOL)isSpatial;
- (BOOL)supportsTogglingLooping;
- (BOOL)supportsTogglingShadowAndRoundedCorners;
- (CGSize)mediaRawPixelSize;
- (float)roundedCornerAmount;
- (id)commandToSetLoopingEnabled:(BOOL)a3;
- (id)commandToSetRoundedCornersEnabled:(BOOL)a3;
- (void)scaleDownSizeToFitWithinSize:(CGSize)a3 board:(id)a4;
- (void)setIsLooping:(BOOL)a3;
- (void)takePropertiesFromReplacedBoardItem:(id)a3;
@end

@implementation CRLMediaItem

- (BOOL)canResetMediaSize
{
  v2 = self;
  char v3 = sub_1009DCFD0();

  return v3 & 1;
}

- (CGSize)mediaRawPixelSize
{
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)canBeReplaced
{
  return 1;
}

- (BOOL)isSpatial
{
  return 0;
}

- (void)takePropertiesFromReplacedBoardItem:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1009DD16C(v4);
}

- (BOOL)supportsTogglingShadowAndRoundedCorners
{
  return 1;
}

- (BOOL)supportsTogglingLooping
{
  return 0;
}

+ (float)defaultRoundedCornerAmount
{
  return 10.0;
}

- (BOOL)hasRoundedCorners
{
  double v2 = *(float (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x4A8);
  double v3 = self;
  float v4 = v2();

  return v4 != 0.0;
}

- (float)roundedCornerAmount
{
  return 0.0;
}

- (BOOL)isLooping
{
  return *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Freeform12CRLMediaItem_isLooping);
}

- (void)setIsLooping:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Freeform12CRLMediaItem_isLooping) = a3;
}

- (BOOL)isAnimatedImage
{
  return 0;
}

- (id)commandToSetRoundedCornersEnabled:(BOOL)a3
{
  return 0;
}

- (id)commandToSetLoopingEnabled:(BOOL)a3
{
  return 0;
}

- (void)scaleDownSizeToFitWithinSize:(CGSize)a3 board:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = self;
  sub_1009DD668(width, height);
}

@end