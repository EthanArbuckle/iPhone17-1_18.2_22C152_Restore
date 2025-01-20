@interface PIDisparitySampleRequest
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sampleTime;
- (CGRect)sampleRect;
- (PIDisparitySampleRequest)initWithComposition:(id)a3 time:(id *)a4 sampleRect:(CGRect)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newRenderJob;
- (int64_t)mediaComponentType;
- (void)setSampleRect:(CGRect)a3;
- (void)setSampleTime:(id *)a3;
@end

@implementation PIDisparitySampleRequest

- (void)setSampleRect:(CGRect)a3
{
  self->_sampleRect = a3;
}

- (CGRect)sampleRect
{
  double x = self->_sampleRect.origin.x;
  double y = self->_sampleRect.origin.y;
  double width = self->_sampleRect.size.width;
  double height = self->_sampleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSampleTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_sampleTime.value = *(_OWORD *)&a3->var0;
  self->_sampleTime.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sampleTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 152);
  return self;
}

- (int64_t)mediaComponentType
{
  return 2;
}

- (id)newRenderJob
{
  v3 = [(NURenderJob *)[PIDisparitySampleJob alloc] initWithRequest:self];
  [(PIDisparitySampleRequest *)self sampleTime];
  long long v5 = v7;
  uint64_t v6 = v8;
  [(PIDisparitySampleJob *)v3 setSampleTime:&v5];
  [(PIDisparitySampleRequest *)self sampleRect];
  -[PIDisparitySampleJob setSampleRect:](v3, "setSampleRect:");
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PIDisparitySampleRequest;
  id v4 = [(NURenderRequest *)&v10 copyWithZone:a3];
  [(PIDisparitySampleRequest *)self sampleTime];
  long long v6 = v8;
  uint64_t v7 = v9;
  [v4 setSampleTime:&v6];
  [(PIDisparitySampleRequest *)self sampleRect];
  objc_msgSend(v4, "setSampleRect:");
  return v4;
}

- (PIDisparitySampleRequest)initWithComposition:(id)a3 time:(id *)a4 sampleRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v18[1] = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)PIDisparitySampleRequest;
  objc_super v10 = [(NURenderRequest *)&v17 initWithComposition:a3];
  v11 = v10;
  if (v10)
  {
    long long v15 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [(PIDisparitySampleRequest *)v10 setSampleTime:&v15];
    -[PIDisparitySampleRequest setSampleRect:](v11, "setSampleRect:", x, y, width, height);
    v12 = +[PIPipelineFilters sourceFilterNoOrientation];
    v18[0] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    [(NURenderRequest *)v11 setPipelineFilters:v13];
  }
  return v11;
}

@end