@interface CHDOfficeArtClient
- (BOOL)hasBounds;
- (CGRect)bounds;
- (id)anchor;
- (void)setAnchor:(id)a3;
@end

@implementation CHDOfficeArtClient

- (void)setAnchor:(id)a3
{
}

- (id)anchor
{
  return self->mAnchor;
}

- (BOOL)hasBounds
{
  return 0;
}

- (CGRect)bounds
{
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
}

@end