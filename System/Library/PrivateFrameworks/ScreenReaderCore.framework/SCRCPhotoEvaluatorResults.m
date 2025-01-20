@interface SCRCPhotoEvaluatorResults
- (SCRCPhotoEvaluatorResult)blurResult;
- (SCRCPhotoEvaluatorResult)colorResult;
- (SCRCPhotoEvaluatorResult)luminanceResult;
- (SCRCPhotoEvaluatorResults)initWithBlurResult:(id)a3 colorResult:(id)a4 luminanceResult:(id)a5;
@end

@implementation SCRCPhotoEvaluatorResults

- (SCRCPhotoEvaluatorResults)initWithBlurResult:(id)a3 colorResult:(id)a4 luminanceResult:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SCRCPhotoEvaluatorResults;
  v12 = [(SCRCPhotoEvaluatorResults *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_blurResult, a3);
    objc_storeStrong((id *)&v13->_colorResult, a4);
    objc_storeStrong((id *)&v13->_luminanceResult, a5);
    v14 = v13;
  }

  return v13;
}

- (SCRCPhotoEvaluatorResult)blurResult
{
  return self->_blurResult;
}

- (SCRCPhotoEvaluatorResult)colorResult
{
  return self->_colorResult;
}

- (SCRCPhotoEvaluatorResult)luminanceResult
{
  return self->_luminanceResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_luminanceResult, 0);
  objc_storeStrong((id *)&self->_colorResult, 0);
  objc_storeStrong((id *)&self->_blurResult, 0);
}

@end