@interface AMBNRBuffers
- (AMBNRBuffers)init;
- (void)releaseBuffers;
- (void)releasePyramidsBottom;
@end

@implementation AMBNRBuffers

- (AMBNRBuffers)init
{
  v11.receiver = self;
  v11.super_class = (Class)AMBNRBuffers;
  v2 = [(AMBNRBuffers *)&v11 init];
  if (v2)
  {
    v3 = objc_alloc_init(PyramidStorage);
    pyramid = v2->pyramid;
    v2->pyramid = v3;

    v2->pyramid->levels = 4;
    v5 = objc_alloc_init(PyramidStorage);
    noiseMapPyramid = v2->noiseMapPyramid;
    v2->noiseMapPyramid = v5;

    v2->noiseMapPyramid->levels = 4;
    v7 = objc_alloc_init(PyramidStorage);
    sharpeningPyramid = v2->sharpeningPyramid;
    v2->sharpeningPyramid = v7;

    v2->sharpeningPyramid->levels = 4;
    v9 = v2;
  }

  return v2;
}

- (void)releaseBuffers
{
  [(PyramidStorage *)self->pyramid releaseBuffers];
  [(PyramidStorage *)self->noiseMapPyramid releaseBuffers];
  sharpeningPyramid = self->sharpeningPyramid;

  [(PyramidStorage *)sharpeningPyramid releaseBuffers];
}

- (void)releasePyramidsBottom
{
  [(PyramidStorage *)self->pyramid clearLevel:0];
  [(PyramidStorage *)self->noiseMapPyramid clearLevel:0];
  sharpeningPyramid = self->sharpeningPyramid;

  [(PyramidStorage *)sharpeningPyramid clearLevel:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->sharpeningPyramid, 0);
  objc_storeStrong((id *)&self->noiseMapPyramid, 0);

  objc_storeStrong((id *)&self->pyramid, 0);
}

@end