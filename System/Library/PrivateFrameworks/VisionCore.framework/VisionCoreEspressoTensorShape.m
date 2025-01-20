@interface VisionCoreEspressoTensorShape
+ (id)shapeForBlobDimensions:(id *)a3;
- (unint64_t)batchNumber;
- (unint64_t)channels;
- (unint64_t)height;
- (unint64_t)width;
@end

@implementation VisionCoreEspressoTensorShape

+ (id)shapeForBlobDimensions:(id *)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithBatchNumber:a3->var4 channels:a3->var3 height:a3->var2 width:a3->var1];
  return v3;
}

- (unint64_t)width
{
  return [(VisionCoreTensorShape *)self sizes][24];
}

- (unint64_t)height
{
  return [(VisionCoreTensorShape *)self sizes][16];
}

- (unint64_t)channels
{
  return [(VisionCoreTensorShape *)self sizes][8];
}

- (unint64_t)batchNumber
{
  return *[(VisionCoreTensorShape *)self sizes];
}

@end