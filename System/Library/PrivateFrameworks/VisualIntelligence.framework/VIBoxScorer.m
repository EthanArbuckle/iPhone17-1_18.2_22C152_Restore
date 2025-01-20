@interface VIBoxScorer
- (VIBoxScorer)initWithGranularity:(int64_t)a3 xMean:(double)a4 yMean:(double)a5 std:(double)a6;
- (double)scoreWithBoundingBox:(CGRect)a3;
- (double)scoreWithXTopLeft:(double)a3 yTopLeft:(double)a4 width:(double)a5 height:(double)a6;
@end

@implementation VIBoxScorer

- (VIBoxScorer)initWithGranularity:(int64_t)a3 xMean:(double)a4 yMean:(double)a5 std:(double)a6
{
  v14.receiver = self;
  v14.super_class = (Class)VIBoxScorer;
  v10 = [(VIBoxScorer *)&v14 init];
  if (v10)
  {
    v11 = [[_TtC18VisualIntelligence19BoxScorerCompatible alloc] initWithGranularity:a3 xMean:a4 yMean:a5 std:a6];
    boxScorer = v10->_boxScorer;
    v10->_boxScorer = v11;
  }
  return v10;
}

- (double)scoreWithXTopLeft:(double)a3 yTopLeft:(double)a4 width:(double)a5 height:(double)a6
{
  [(BoxScorerCompatible *)self->_boxScorer scoreWithXTopLeft:a3 yTopLeft:a4 width:a5 height:a6];
  return result;
}

- (double)scoreWithBoundingBox:(CGRect)a3
{
  [(BoxScorerCompatible *)self->_boxScorer scoreWithXTopLeft:a3.origin.x yTopLeft:a3.origin.y width:a3.size.width height:a3.size.height];
  return result;
}

- (void).cxx_destruct
{
}

@end