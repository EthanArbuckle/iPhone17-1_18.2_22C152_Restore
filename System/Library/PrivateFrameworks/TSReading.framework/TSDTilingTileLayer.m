@interface TSDTilingTileLayer
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)location;
- (BOOL)needsTileDisplay;
- (id)hitTest:(CGPoint)a3;
- (id)tileContentsLayer;
- (unint64_t)index;
- (void)display;
- (void)drawInContext:(CGContext *)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setLocation:(id)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setNeedsDisplayInRectIgnoringBackground:(CGRect)a3;
- (void)setNeedsTileDisplay:(BOOL)a3;
- (void)updateFrameWithTileSize:(CGSize)a3 tilesWide:(unint64_t)a4 tilesHigh:(unint64_t)a5 geometryProvider:(id)a6;
@end

@implementation TSDTilingTileLayer

- (void)display
{
  v3 = (void *)[(TSDTilingTileLayer *)self superlayer];
  v4 = (void *)[v3 delegate];
  if ([v3 drawsInBackground]
    && (objc_opt_respondsToSelector() & 1) != 0
    && (uint64_t v5 = [v4 queueForDrawingTilingLayerInBackground:v3]) != 0
    && (v6 = (void *)v5, [MEMORY[0x263F08B88] isMainThread]))
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __29__TSDTilingTileLayer_display__block_invoke;
    v8[3] = &unk_2646AF7B8;
    v8[4] = self;
    [v6 drainAndPerformSync:v8];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TSDTilingTileLayer;
    [(TSDTilingTileLayer *)&v7 display];
  }
}

id __29__TSDTilingTileLayer_display__block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)TSDTilingTileLayer;
  return objc_msgSendSuper2(&v2, sel_display);
}

- (void)drawInContext:(CGContext *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "threadDictionary");
  v6 = (void *)MEMORY[0x263F08D40];
  [(TSDTilingTileLayer *)self position];
  objc_msgSend(v5, "setValue:forKey:", objc_msgSend(v6, "valueWithCGPoint:"), @"TSDTilingTileLayerPositionTLSKey");
  objc_msgSend((id)-[TSDTilingTileLayer superlayer](self, "superlayer"), "i_drawTile:inContext:", self, a3);
  objc_super v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08B88], "currentThread"), "threadDictionary");

  [v7 removeObjectForKey:@"TSDTilingTileLayerPositionTLSKey"];
}

- (id)hitTest:(CGPoint)a3
{
  return 0;
}

- (void)updateFrameWithTileSize:(CGSize)a3 tilesWide:(unint64_t)a4 tilesHigh:(unint64_t)a5 geometryProvider:(id)a6
{
  double height = a3.height;
  double width = a3.width;
  objc_msgSend((id)-[TSDTilingTileLayer superlayer](self, "superlayer"), "bounds");
  unint64_t mIndex = self->mIndex;
  unint64_t v15 = mIndex / a4;
  unint64_t v16 = mIndex % a4;
  unsigned int v49 = 0;
  CGFloat v47 = v13;
  CGFloat v48 = v12;
  CGFloat v45 = v18;
  CGFloat v46 = v17;
  if (a6)
  {
    objc_msgSend(a6, "tileGeometryRectWithLayer:atIndex:mask:", -[TSDTilingTileLayer superlayer](self, "superlayer"), self->mIndex, &v49);
    double v20 = v19;
    double v22 = v21;
  }
  else
  {
    double v20 = v12 + width * (double)v16;
    double v22 = v13 + height * (double)v15;
  }
  [(TSDTilingTileLayer *)self position];
  if (v20 != v24 || v22 != v23) {
    -[TSDTilingTileLayer setPosition:](self, "setPosition:", v20, v22);
  }
  double v26 = TSDRectWithSize();
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  if (!a6 && (v16 == a4 - 1 || v15 == a5 - 1))
  {
    v50.origin.x = v20;
    v50.origin.y = v22;
    v50.size.double width = width;
    v50.size.double height = height;
    v53.origin.y = v47;
    v53.origin.x = v48;
    v53.size.double height = v45;
    v53.size.double width = v46;
    CGRectIntersection(v50, v53);
    double v26 = TSDRectWithSize();
    double v28 = v34;
    double v30 = v35;
    double v32 = v36;
  }
  [(TSDTilingTileLayer *)self bounds];
  v54.origin.x = v37;
  v54.origin.y = v38;
  v54.size.double width = v39;
  v54.size.double height = v40;
  v51.origin.x = v26;
  v51.origin.y = v28;
  v51.size.double width = v30;
  v51.size.double height = v32;
  if (!CGRectEqualToRect(v51, v54))
  {
    [(TSDTilingTileLayer *)self bounds];
    BOOL v41 = CGRectEqualToRect(v52, *MEMORY[0x263F001A8]);
    -[TSDTilingTileLayer setBounds:](self, "setBounds:", v26, v28, v30, v32);
    v42 = (void *)[(TSDTilingTileLayer *)self superlayer];
    if (v41) {
      objc_msgSend(v42, "i_setNeedsTileDisplayForTile:", self);
    }
    else {
      [v42 setNeedsDisplay];
    }
  }
  uint64_t v43 = v49;
  if (!a6)
  {
    unsigned int v44 = v49 | (v16 == 0);
    if (v16 == a4 - 1) {
      v44 |= 2u;
    }
    if (mIndex < a4) {
      v44 |= 4u;
    }
    if (v15 == a5 - 1) {
      uint64_t v43 = v44 | 8;
    }
    else {
      uint64_t v43 = v44;
    }
  }
  if ([(TSDTilingTileLayer *)self edgeAntialiasingMask] != v43) {
    [(TSDTilingTileLayer *)self setEdgeAntialiasingMask:v43];
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (void *)[(TSDTilingTileLayer *)self superlayer];
  if ([v8 drawsInBackground]
    && ([v8 delegate], (objc_opt_respondsToSelector() & 1) != 0)
    && objc_msgSend((id)objc_msgSend(v8, "delegate"), "canDrawTilingLayerInBackground:", v8))
  {
    objc_msgSend(v8, "i_drawTileInBackground:inRect:", self, x, y, width, height);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TSDTilingTileLayer;
    -[TSDTilingTileLayer setNeedsDisplayInRect:](&v9, sel_setNeedsDisplayInRect_, x, y, width, height);
  }
}

- (void)setNeedsDisplayInRectIgnoringBackground:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TSDTilingTileLayer;
  -[TSDTilingTileLayer setNeedsDisplayInRect:](&v3, sel_setNeedsDisplayInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)tileContentsLayer
{
  objc_super v2 = (void *)[(TSDTilingTileLayer *)self sublayers];

  return (id)[v2 objectAtIndex:0];
}

- (unint64_t)index
{
  return self->mIndex;
}

- (void)setIndex:(unint64_t)a3
{
  self->unint64_t mIndex = a3;
}

- (BOOL)needsTileDisplay
{
  return self->mNeedsTileDisplay;
}

- (void)setNeedsTileDisplay:(BOOL)a3
{
  self->mNeedsTileDispladouble y = a3;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)location
{
  p_mLocation = &self->mLocation;
  unint64_t x = self->mLocation.x;
  unint64_t y = p_mLocation->y;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setLocation:(id)a3
{
  self->mLocation = ($E140945EF3E8D97A3C8D58D8215F2D07)a3;
}

@end