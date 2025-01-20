@interface CRNonSplittingTextFeatureSplitterV3
- (void)enumerateLineRegions:(id)a3 usingBlock:(id)a4;
@end

@implementation CRNonSplittingTextFeatureSplitterV3

- (void)enumerateLineRegions:(id)a3 usingBlock:(id)a4
{
  v5 = (void (**)(id, void, void *, char *, double))a4;
  id v6 = a3;
  v7 = [(id)objc_opt_class() _recognizerRegionsFromLineRegions:v6];

  char v8 = 0;
  v5[2](v5, 0, v7, &v8, 1.0);
}

@end