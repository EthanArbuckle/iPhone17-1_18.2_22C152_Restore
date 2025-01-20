@interface TSDBrushStrokeLayoutOptions
- (NSArray)patternOffsetsBySubpath;
- (NSArray)transparencyLayersBySubpath;
- (TSDBrushStrokeLayoutOptions)init;
- (double)strokeEnd;
- (void)setPatternOffsetsBySubpath:(id)a3;
- (void)setStrokeEnd:(double)a3;
- (void)setTransparencyLayersBySubpath:(id)a3;
@end

@implementation TSDBrushStrokeLayoutOptions

- (TSDBrushStrokeLayoutOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSDBrushStrokeLayoutOptions;
  result = [(TSDBrushStrokeLayoutOptions *)&v3 init];
  if (result) {
    result->_strokeEnd = 1.0;
  }
  return result;
}

- (void)setStrokeEnd:(double)a3
{
  TSUClamp();
  self->_strokeEnd = v5;
  if (v5 != a3)
  {
    id v8 = [MEMORY[0x263F7C7F0] currentHandler];
    v6 = [NSString stringWithUTF8String:"-[TSDBrushStrokeLayoutOptions setStrokeEnd:]"];
    v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDBrushStroke.mm"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 167, @"strokeEnd (%f) should be between 0 and 1 inclusive.", *(void *)&a3);
  }
}

- (NSArray)patternOffsetsBySubpath
{
  return self->_patternOffsetsBySubpath;
}

- (void)setPatternOffsetsBySubpath:(id)a3
{
}

- (NSArray)transparencyLayersBySubpath
{
  return self->_transparencyLayersBySubpath;
}

- (void)setTransparencyLayersBySubpath:(id)a3
{
}

- (double)strokeEnd
{
  return self->_strokeEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencyLayersBySubpath, 0);
  objc_storeStrong((id *)&self->_patternOffsetsBySubpath, 0);
}

@end