@interface CALayer(TSDTilingLayerSupport)
- (BOOL)tilingSafeHasContents;
- (uint64_t)setNeedsDisplayForDirtyTiles:()TSDTilingLayerSupport;
- (uint64_t)setNeedsLayoutForTilingLayers;
- (uint64_t)setTileContents:()TSDTilingLayerSupport;
- (uint64_t)tileContentsLayer;
- (uint64_t)tilingSafeSetSublayers:()TSDTilingLayerSupport;
@end

@implementation CALayer(TSDTilingLayerSupport)

- (uint64_t)setNeedsLayoutForTilingLayers
{
  v3 = (void *)[a1 sublayers];

  return [v3 makeObjectsPerformSelector:a2];
}

- (uint64_t)tilingSafeSetSublayers:()TSDTilingLayerSupport
{
  uint64_t result = objc_msgSend(a3, "isEqualToArray:", objc_msgSend(a1, "sublayers"));
  if ((result & 1) == 0)
  {
    return [a1 setSublayers:a3];
  }
  return result;
}

- (BOOL)tilingSafeHasContents
{
  return [a1 contents] != 0;
}

- (uint64_t)setNeedsDisplayForDirtyTiles:()TSDTilingLayerSupport
{
  v4 = (void *)[a1 superlayer];

  return [v4 setNeedsDisplayForDirtyTiles:a3];
}

- (uint64_t)setTileContents:()TSDTilingLayerSupport
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!a3 || (isKindOfClass & 1) != 0)
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "sublayers"), "objectAtIndex:", 0), "setDelegate:", 0);
    if (a3) {
      uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObject:a3];
    }
    else {
      uint64_t v7 = 0;
    }
    [a1 setSublayers:v7];
    [a1 setContents:0];
    objc_msgSend(a3, "setEdgeAntialiasingMask:", objc_msgSend(a1, "edgeAntialiasingMask"));
    uint64_t v8 = [a1 superlayer];
    return [a3 setDelegate:v8];
  }
  else
  {
    return [a1 setContents:a3];
  }
}

- (uint64_t)tileContentsLayer
{
  return 0;
}

@end