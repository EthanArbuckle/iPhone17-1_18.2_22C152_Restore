@interface TSDPartitionedPartialRep
- (BOOL)directlyManagesLayerContent;
- (CGImage)p_newImageForCachingBaseRep;
- (CGRect)clipRect;
- (CGRect)layerFrameInScaledCanvas;
- (CGRect)p_clipRect;
- (CGRect)p_convertBaseToNaturalRect:(CGRect)a3;
- (TSDPartitionedPartialRep)initWithLayout:(id)a3 canvas:(id)a4;
- (UIEdgeInsets)p_edgeInsetsForClipping;
- (id)i_queueForTileProvider;
- (void)addBitmapsToRenderingQualityInfo:(id)a3 inContext:(CGContext *)a4;
- (void)didUpdateLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
- (void)resetCachedPartitionedRendering;
- (void)willBeRemoved;
@end

@implementation TSDPartitionedPartialRep

- (TSDPartitionedPartialRep)initWithLayout:(id)a3 canvas:(id)a4
{
  if (!a3)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSDPartitionedPartialRep initWithLayout:canvas:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDPartitionedPartialRep.m"), 39, @"invalid nil value for '%s'", "layout");
  }
  v12.receiver = self;
  v12.super_class = (Class)TSDPartitionedPartialRep;
  v9 = [(TSDRep *)&v12 initWithLayout:a3 canvas:a4];
  if (v9)
  {
    objc_opt_class();
    [a3 partitioner];
    v10 = (void *)TSUDynamicCast();
    if (v10) {
      objc_msgSend(v10, "i_registerPartialRep:", v9);
    }
  }
  return v9;
}

- (BOOL)directlyManagesLayerContent
{
  [(TSDRep *)self interactiveCanvasController];
  v2 = (void *)TSUProtocolCast();

  return [v2 shouldUseCachedPartitionRendering];
}

- (CGRect)layerFrameInScaledCanvas
{
  [(TSDPartitionedPartialRep *)self p_edgeInsetsForClipping];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(TSDRep *)self frameInUnscaledCanvas];
  -[TSDCanvas convertUnscaledToBoundsRect:](self->super.mCanvas, "convertUnscaledToBoundsRect:", v6 + v11, v4 + v12, v13 - (v6 + v10), v14 - (v4 + v8));

  return CGRectIntegral(*(CGRect *)&v15);
}

- (CGRect)clipRect
{
  [(TSDPartitionedPartialRep *)self p_edgeInsetsForClipping];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(TSDRep *)self naturalBounds];
  double v12 = v6 + v11;
  double v14 = v4 + v13;
  double v16 = v15 - (v6 + v10);
  double v18 = v17 - (v4 + v8);
  result.size.height = v18;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v12;
  return result;
}

- (void)willBeRemoved
{
  double v3 = [(TSDRep *)self layout];
  objc_opt_class();
  [(TSDLayout *)v3 partitioner];
  double v4 = (void *)TSUDynamicCast();
  if (v4) {
    objc_msgSend(v4, "i_unregisterPartialRep:", self);
  }
  v5.receiver = self;
  v5.super_class = (Class)TSDPartitionedPartialRep;
  [(TSDRep *)&v5 willBeRemoved];
}

- (void)drawInContext:(CGContext *)a3
{
  objc_super v5 = [(TSDRep *)self layout];
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TSDLayout partitioner](v5, "partitioner"), "i_layout"), "geometry"), "frame");
  CGContextTranslateCTM(a3, -v6, -v7);
  [(TSDLayout *)v5 bounds];
  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeTranslation(&v11, -v8, -v9);
  CGAffineTransform v10 = v11;
  CGContextConcatCTM(a3, &v10);
  objc_msgSend((id)objc_msgSend((id)-[TSDLayout partitioner](v5, "partitioner"), "i_repForCanvas:", -[TSDRep canvas](self, "canvas")), "recursivelyDrawInContext:", a3);
}

- (void)addBitmapsToRenderingQualityInfo:(id)a3 inContext:(CGContext *)a4
{
  double v6 = objc_msgSend((id)-[TSDLayout partitioner](-[TSDRep layout](self, "layout"), "partitioner"), "i_repForCanvas:", -[TSDRep canvas](self, "canvas"));

  [v6 recursivelyPerformSelector:sel_addBitmapsToRenderingQualityInfo_inContext_ withObject:a3 withObject:a4];
}

- (void)didUpdateLayer:(id)a3
{
  v27.receiver = self;
  v27.super_class = (Class)TSDPartitionedPartialRep;
  -[TSDRep didUpdateLayer:](&v27, sel_didUpdateLayer_);
  if ([(TSDPartitionedPartialRep *)self directlyManagesLayerContent])
  {
    objc_super v5 = [(TSDRep *)self layout];
    double v6 = (CGImage *)objc_msgSend((id)-[TSDLayout partitioner](v5, "partitioner"), "i_cachedImageForCanvas:", -[TSDRep canvas](self, "canvas"));
    if (!v6)
    {
      double v6 = [(TSDPartitionedPartialRep *)self p_newImageForCachingBaseRep];
      objc_msgSend((id)-[TSDLayout partitioner](v5, "partitioner"), "i_setCachedImage:forCanvas:", v6, -[TSDRep canvas](self, "canvas"));
      CFRelease(v6);
    }
    [a3 setContents:v6];
    [(TSDLayout *)v5 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [(TSDPartitionedPartialRep *)self p_edgeInsetsForClipping];
    double v16 = v8 + v15;
    double v18 = v10 + v17;
    double v20 = v12 - (v15 + v19);
    double v22 = v14 - (v17 + v21);
    [(TSDPartitionedPartialRep *)self p_clipRect];
    objc_msgSend(a3, "setContentsRect:", (v16 - v23) / v24, (v18 - v25) / v26, v20 / v24, v22 / v26);
  }
}

- (void)resetCachedPartitionedRendering
{
  double v3 = [(TSDRep *)self layout];
  [(TSDLayout *)v3 invalidate];
  [(TSDRep *)self setNeedsDisplay];
  double v4 = (void *)[(TSDLayout *)v3 partitioner];
  objc_super v5 = [(TSDRep *)self canvas];

  objc_msgSend(v4, "i_removeCachedImageForCanvas:", v5);
}

- (id)i_queueForTileProvider
{
  v2 = objc_msgSend((id)-[TSDLayout partitioner](-[TSDRep layout](self, "layout"), "partitioner"), "i_repForCanvas:", -[TSDRep canvas](self, "canvas"));

  return (id)objc_msgSend(v2, "i_queueForTileProvider");
}

- (UIEdgeInsets)p_edgeInsetsForClipping
{
  double v3 = [(TSDRep *)self layout];
  [(TSDLayout *)v3 bounds];
  CGFloat v50 = v5;
  CGFloat v51 = v4;
  CGFloat v7 = v6;
  CGFloat v44 = v8;
  double v9 = objc_msgSend((id)-[TSDLayout partitioner](v3, "partitioner"), "i_layout");
  double v10 = objc_msgSend((id)-[TSDLayout partitioner](v3, "partitioner"), "i_repForCanvas:", -[TSDRep canvas](self, "canvas"));
  objc_msgSend((id)objc_msgSend(v9, "geometry"), "frame");
  CGFloat v54 = v12;
  CGFloat v55 = v11;
  CGFloat v52 = v14;
  CGFloat v53 = v13;
  [(TSDPartitionedPartialRep *)self p_clipRect];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v56 = v19;
  CGFloat v21 = v20;
  [v10 naturalBounds];
  -[TSDPartitionedPartialRep p_convertBaseToNaturalRect:](self, "p_convertBaseToNaturalRect:");
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  v57.size.height = v50;
  v57.origin.x = v51;
  v57.origin.y = v7;
  v57.size.width = v44;
  CGFloat v48 = v16;
  CGFloat v49 = v21;
  CGFloat rect = v29;
  CGFloat v46 = v18;
  if (fabs(CGRectGetMinY(v57)) >= 0.00999999978)
  {
    double v31 = 0.0;
  }
  else
  {
    v58.origin.x = v16;
    v58.origin.y = v18;
    v58.size.width = v56;
    v58.size.height = v21;
    double MinY = CGRectGetMinY(v58);
    v59.origin.x = v23;
    v59.origin.y = v25;
    v59.size.width = v27;
    v59.size.height = v29;
    double v31 = MinY - CGRectGetMinY(v59);
  }
  v60.origin.x = v51;
  v60.origin.y = v7;
  v60.size.width = v44;
  v60.size.height = v50;
  double MaxY = CGRectGetMaxY(v60);
  v61.origin.y = v54;
  v61.origin.x = v55;
  v61.size.height = v52;
  v61.size.width = v53;
  if (vabdd_f64(MaxY, CGRectGetHeight(v61)) >= 0.00999999978)
  {
    double v45 = 0.0;
    CGFloat v34 = v46;
  }
  else
  {
    v62.origin.x = v23;
    v62.size.width = v27;
    v62.origin.y = v25;
    v62.size.height = v29;
    double v33 = CGRectGetMaxY(v62);
    v63.origin.x = v48;
    v63.size.height = v21;
    CGFloat v34 = v46;
    v63.origin.y = v46;
    v63.size.width = v56;
    double v45 = v33 - CGRectGetMaxY(v63);
  }
  CGFloat v35 = v23;
  v64.origin.x = v51;
  v64.origin.y = v7;
  v64.size.width = v44;
  v64.size.height = v50;
  if (fabs(CGRectGetMinX(v64)) >= 0.00999999978)
  {
    double v37 = 0.0;
  }
  else
  {
    v65.origin.x = v48;
    v65.size.height = v21;
    v65.origin.y = v34;
    v65.size.width = v56;
    double MinX = CGRectGetMinX(v65);
    v66.origin.x = v35;
    v66.size.width = v27;
    v66.origin.y = v25;
    v66.size.height = rect;
    double v37 = MinX - CGRectGetMinX(v66);
  }
  v67.origin.x = v51;
  v67.origin.y = v7;
  v67.size.width = v44;
  v67.size.height = v50;
  double MaxX = CGRectGetMaxX(v67);
  v68.origin.y = v54;
  v68.origin.x = v55;
  v68.size.height = v52;
  v68.size.width = v53;
  if (vabdd_f64(MaxX, CGRectGetWidth(v68)) >= 0.00999999978)
  {
    double v40 = 0.0;
  }
  else
  {
    v69.origin.x = v35;
    v69.size.width = v27;
    v69.origin.y = v25;
    v69.size.height = rect;
    double v39 = CGRectGetMaxX(v69);
    v70.origin.x = v48;
    v70.size.height = v49;
    v70.origin.y = v34;
    v70.size.width = v56;
    double v40 = v39 - CGRectGetMaxX(v70);
  }
  double v41 = v31;
  double v42 = v37;
  double v43 = v45;
  result.right = v40;
  result.bottom = v43;
  result.left = v42;
  result.top = v41;
  return result;
}

- (CGRect)p_clipRect
{
  double v3 = objc_msgSend((id)-[TSDLayout partitioner](-[TSDRep layout](self, "layout"), "partitioner"), "i_repForCanvas:", -[TSDRep canvas](self, "canvas"));
  if ([v3 masksToBounds]) {
    [v3 clipRect];
  }
  else {
    objc_msgSend(v3, "i_partition_deepClipRect");
  }

  -[TSDPartitionedPartialRep p_convertBaseToNaturalRect:](self, "p_convertBaseToNaturalRect:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGImage)p_newImageForCachingBaseRep
{
  double v3 = [(TSDRep *)self layout];
  double v4 = objc_msgSend((id)-[TSDLayout partitioner](v3, "partitioner"), "i_repForCanvas:", -[TSDRep canvas](self, "canvas"));
  [(TSDPartitionedPartialRep *)self p_clipRect];
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  v29.origin.double x = TSDMultiplyRectScalar(v6, v8, v10, v12, v13);
  double x = v29.origin.x;
  double y = v29.origin.y;
  CGRect v30 = CGRectIntegral(v29);
  double v16 = v30.origin.x;
  double v17 = v30.origin.y;
  CGFloat v18 = TSDBitmapContextCreate(11, v30.size.width);
  [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
  TSDSetCGContextInfo((uint64_t)v18, 0, 0, 0, 0, v19);
  CGContextTranslateCTM(v18, x - v16, y - v17);
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  CGFloat v21 = v20;
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  CGContextScaleCTM(v18, v21, v22);
  [v4 naturalBounds];
  CGContextTranslateCTM(v18, v23 - v6, v24 - v8);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TSDLayout partitioner](v3, "partitioner"), "i_layout"), "geometry"), "frame");
  CGContextTranslateCTM(v18, -v25, -v26);
  [v4 recursivelyDrawInContext:v18];
  Image = CGBitmapContextCreateImage(v18);
  CGContextRelease(v18);
  return Image;
}

- (CGRect)p_convertBaseToNaturalRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = objc_msgSend((id)objc_msgSend((id)-[TSDLayout partitioner](-[TSDRep layout](self, "layout"), "partitioner"), "i_layout"), "geometry");
  CGFloat v8 = v7;
  if (v7) {
    [v7 transform];
  }
  else {
    memset(&v20, 0, sizeof(v20));
  }
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRect v22 = CGRectApplyAffineTransform(v21, &v20);
  double v9 = v22.origin.x;
  double v10 = v22.origin.y;
  CGFloat v11 = v22.size.width;
  CGFloat v12 = v22.size.height;
  [v8 frame];
  double v14 = v9 - v13;
  [v8 frame];
  double v16 = v10 - v15;
  double v17 = v14;
  double v18 = v11;
  double v19 = v12;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v17;
  return result;
}

@end