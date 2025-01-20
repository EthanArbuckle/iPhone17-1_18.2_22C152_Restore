@interface CRIntermediateDetectorResult
- (CRIntermediateDetectorResult)initWithNumberOfScales:(int64_t)a3;
- (NSMutableArray)pyramidPostInterScaleNMSTextFeatures;
- (NSMutableArray)pyramidPostIntraScaleNMSTextFeatures;
- (NSMutableArray)pyramidPreIntraScaleNMSTextFeatures;
- (NSMutableArray)pyramidScaleName;
- (NSMutableArray)pyramidScaleSize;
- (void)setPyramidPostInterScaleNMSTextFeatures:(id)a3;
- (void)setPyramidPostIntraScaleNMSTextFeatures:(id)a3;
- (void)setPyramidPreIntraScaleNMSTextFeatures:(id)a3;
- (void)setPyramidScaleName:(id)a3;
- (void)setPyramidScaleSize:(id)a3;
@end

@implementation CRIntermediateDetectorResult

- (CRIntermediateDetectorResult)initWithNumberOfScales:(int64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CRIntermediateDetectorResult;
  v4 = [(CRIntermediateDetectorResult *)&v18 init];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    [(CRIntermediateDetectorResult *)v4 setPyramidScaleSize:v5];

    v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    [(CRIntermediateDetectorResult *)v4 setPyramidScaleName:v6];

    v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    [(CRIntermediateDetectorResult *)v4 setPyramidPreIntraScaleNMSTextFeatures:v7];

    v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    [(CRIntermediateDetectorResult *)v4 setPyramidPostIntraScaleNMSTextFeatures:v8];

    v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    [(CRIntermediateDetectorResult *)v4 setPyramidPostInterScaleNMSTextFeatures:v9];

    if (a3)
    {
      uint64_t v10 = 0;
      do
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v12 = [(CRIntermediateDetectorResult *)v4 pyramidPreIntraScaleNMSTextFeatures];
        [v12 setObject:v11 atIndexedSubscript:v10];

        id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v14 = [(CRIntermediateDetectorResult *)v4 pyramidPostIntraScaleNMSTextFeatures];
        [v14 setObject:v13 atIndexedSubscript:v10];

        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v16 = [(CRIntermediateDetectorResult *)v4 pyramidPostInterScaleNMSTextFeatures];
        [v16 setObject:v15 atIndexedSubscript:v10];

        ++v10;
      }
      while (a3 != v10);
    }
  }
  return v4;
}

- (NSMutableArray)pyramidPreIntraScaleNMSTextFeatures
{
  return self->_pyramidPreIntraScaleNMSTextFeatures;
}

- (void)setPyramidPreIntraScaleNMSTextFeatures:(id)a3
{
}

- (NSMutableArray)pyramidPostIntraScaleNMSTextFeatures
{
  return self->_pyramidPostIntraScaleNMSTextFeatures;
}

- (void)setPyramidPostIntraScaleNMSTextFeatures:(id)a3
{
}

- (NSMutableArray)pyramidPostInterScaleNMSTextFeatures
{
  return self->_pyramidPostInterScaleNMSTextFeatures;
}

- (void)setPyramidPostInterScaleNMSTextFeatures:(id)a3
{
}

- (NSMutableArray)pyramidScaleSize
{
  return self->_pyramidScaleSize;
}

- (void)setPyramidScaleSize:(id)a3
{
}

- (NSMutableArray)pyramidScaleName
{
  return self->_pyramidScaleName;
}

- (void)setPyramidScaleName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pyramidScaleName, 0);
  objc_storeStrong((id *)&self->_pyramidScaleSize, 0);
  objc_storeStrong((id *)&self->_pyramidPostInterScaleNMSTextFeatures, 0);
  objc_storeStrong((id *)&self->_pyramidPostIntraScaleNMSTextFeatures, 0);
  objc_storeStrong((id *)&self->_pyramidPreIntraScaleNMSTextFeatures, 0);
}

@end