@interface SFSearchSuggestion(SearchToShare)
- (id)prediction;
- (void)setPrediction:()SearchToShare;
@end

@implementation SFSearchSuggestion(SearchToShare)

- (void)setPrediction:()SearchToShare
{
}

- (id)prediction
{
  return objc_getAssociatedObject(a1, sel_prediction);
}

@end