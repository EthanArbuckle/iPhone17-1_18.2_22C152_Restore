@interface CRLTilingTileLayer
- (id)hitTest:(CGPoint)a3;
- (unint64_t)index;
- (void)drawInContext:(CGContext *)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setNeedsDisplayInRectIgnoringBackground:(CGRect)a3;
- (void)updateFrameWithTileSize:(CGSize)a3 tilesWide:(unint64_t)a4 tilesHigh:(unint64_t)a5;
@end

@implementation CRLTilingTileLayer

- (void)drawInContext:(CGContext *)a3
{
  v5 = +[NSThread currentThread];
  v6 = [v5 threadDictionary];
  [(CRLTilingTileLayer *)self position];
  v7 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
  [v6 setValue:v7 forKey:@"CRLTilingTileLayerPositionTLSKey"];

  v8 = [(CRLTilingTileLayer *)self superlayer];
  [v8 i_drawTile:self inContext:a3];

  id v10 = +[NSThread currentThread];
  v9 = [v10 threadDictionary];
  [v9 removeObjectForKey:@"CRLTilingTileLayerPositionTLSKey"];
}

- (id)hitTest:(CGPoint)a3
{
  return 0;
}

- (void)updateFrameWithTileSize:(CGSize)a3 tilesWide:(unint64_t)a4 tilesHigh:(unint64_t)a5
{
  double height = a3.height;
  double width = a3.width;
  id v10 = [(CRLTilingTileLayer *)self superlayer];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  CGFloat v43 = v16;
  CGFloat v44 = v15;

  unint64_t index = self->_index;
  unint64_t v18 = index / a4;
  unint64_t v19 = index % a4;
  double v20 = v14 + height * (double)(index / a4);
  [(CRLTilingTileLayer *)self position];
  if (v12 + width * (double)(index % a4) != v22 || v20 != v21) {
    -[CRLTilingTileLayer setPosition:](self, "setPosition:", v12 + width * (double)(index % a4), v20);
  }
  if (v19 == a4 - 1 || (double v24 = sub_100064070(), v18 == a5 - 1))
  {
    v46.origin.x = v12 + width * (double)(index % a4);
    v46.origin.y = v14 + height * (double)(index / a4);
    v46.size.double width = width;
    v46.size.double height = height;
    v49.origin.x = v12;
    v49.origin.y = v14;
    v49.size.double height = v43;
    v49.size.double width = v44;
    CGRectIntersection(v46, v49);
    double v28 = sub_100064070();
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
  }
  else
  {
    double v32 = v26;
    double v34 = v27;
    double v28 = v24;
    double v30 = v25;
  }
  [(CRLTilingTileLayer *)self bounds];
  v50.origin.x = v35;
  v50.origin.y = v36;
  v50.size.double width = v37;
  v50.size.double height = v38;
  v47.origin.x = v28;
  v47.origin.y = v30;
  v47.size.double width = v32;
  v47.size.double height = v34;
  if (!CGRectEqualToRect(v47, v50))
  {
    [(CRLTilingTileLayer *)self bounds];
    v51.origin.x = CGRectZero.origin.x;
    v51.origin.y = CGRectZero.origin.y;
    v51.size.double width = CGRectZero.size.width;
    v51.size.double height = CGRectZero.size.height;
    BOOL v39 = CGRectEqualToRect(v48, v51);
    -[CRLTilingTileLayer setBounds:](self, "setBounds:", v28, v30, v32, v34);
    if (v39)
    {
      [(CRLTilingTileLayer *)self setNeedsDisplay];
    }
    else
    {
      v40 = [(CRLTilingTileLayer *)self superlayer];
      [v40 setNeedsDisplay];
    }
  }
  unsigned int v41 = v19 == 0;
  if (v19 == a4 - 1) {
    v41 |= 2u;
  }
  if (index < a4) {
    v41 |= 4u;
  }
  if (v18 == a5 - 1) {
    uint64_t v42 = v41 | 8;
  }
  else {
    uint64_t v42 = v41;
  }
  if ([(CRLTilingTileLayer *)self edgeAntialiasingMask] != v42)
  {
    [(CRLTilingTileLayer *)self setEdgeAntialiasingMask:v42];
  }
}

- (void)setNeedsDisplayInRectIgnoringBackground:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CRLTilingTileLayer;
  -[CRLTilingTileLayer setNeedsDisplayInRect:](&v3, "setNeedsDisplayInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_unint64_t index = a3;
}

@end