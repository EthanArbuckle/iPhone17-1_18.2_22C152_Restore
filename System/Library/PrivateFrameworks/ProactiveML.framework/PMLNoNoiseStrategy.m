@interface PMLNoNoiseStrategy
- (BOOL)scaleAndAddNoiseToDenseVector:(id)a3 usingNorm:(BOOL)a4 scaleFactor:(float *)a5;
- (id)toPlistWithChunks:(id)a3;
@end

@implementation PMLNoNoiseStrategy

- (id)toPlistWithChunks:(id)a3
{
  return (id)MEMORY[0x263EFFA78];
}

- (BOOL)scaleAndAddNoiseToDenseVector:(id)a3 usingNorm:(BOOL)a4 scaleFactor:(float *)a5
{
  *a5 = 1.0;
  return 1;
}

@end