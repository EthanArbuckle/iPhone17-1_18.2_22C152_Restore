@interface PITapToTrackRequest
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime;
- (CGPoint)normalizedImagePoint;
- (PITapToTrackRequest)initWithComposition:(id)a3 startTime:(id *)a4 pointToTrack:(CGPoint)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (id)progressHandler;
- (int64_t)mediaComponentType;
- (void)setNormalizedImagePoint:(CGPoint)a3;
- (void)setProgressHandler:(id)a3;
- (void)setStartTime:(id *)a3;
@end

@implementation PITapToTrackRequest

- (void).cxx_destruct
{
}

- (void)setNormalizedImagePoint:(CGPoint)a3
{
  self->_normalizedImagePoint = a3;
}

- (CGPoint)normalizedImagePoint
{
  double x = self->_normalizedImagePoint.x;
  double y = self->_normalizedImagePoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_startTime.value = *(_OWORD *)&a3->var0;
  self->_startTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 176);
  return self;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (int64_t)mediaComponentType
{
  return 2;
}

- (id)newRenderJob
{
  v3 = [(NURenderJob *)[PITapToTrackRenderJob alloc] initWithRequest:self];
  [(PITapToTrackRequest *)self startTime];
  long long v6 = v8;
  uint64_t v7 = v9;
  [(PITapToTrackRenderJob *)v3 setStartTime:&v6];
  [(PITapToTrackRequest *)self normalizedImagePoint];
  -[PITapToTrackRenderJob setNormalizedImagePoint:](v3, "setNormalizedImagePoint:");
  v4 = [(PITapToTrackRequest *)self progressHandler];
  [(PITapToTrackRenderJob *)v3 setProgressHandler:v4];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PITapToTrackRequest;
  id v4 = [(NURenderRequest *)&v11 copyWithZone:a3];
  [(PITapToTrackRequest *)self startTime];
  long long v7 = v9;
  uint64_t v8 = v10;
  [v4 setStartTime:&v7];
  [(PITapToTrackRequest *)self normalizedImagePoint];
  objc_msgSend(v4, "setNormalizedImagePoint:");
  v5 = [(PITapToTrackRequest *)self progressHandler];
  [v4 setProgressHandler:v5];

  return v4;
}

- (PITapToTrackRequest)initWithComposition:(id)a3 startTime:(id *)a4 pointToTrack:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  v16[1] = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PITapToTrackRequest;
  uint64_t v8 = [(NURenderRequest *)&v15 initWithComposition:a3];
  long long v9 = v8;
  if (v8)
  {
    long long v13 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [(PITapToTrackRequest *)v8 setStartTime:&v13];
    -[PITapToTrackRequest setNormalizedImagePoint:](v9, "setNormalizedImagePoint:", x, y);
    uint64_t v10 = +[PIPipelineFilters sourceFilterNoOrientation];
    v16[0] = v10;
    objc_super v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [(NURenderRequest *)v9 setPipelineFilters:v11];
  }
  return v9;
}

@end