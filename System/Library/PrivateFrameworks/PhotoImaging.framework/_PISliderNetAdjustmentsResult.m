@interface _PISliderNetAdjustmentsResult
- (NSDictionary)adjustments;
- (NSString)description;
- (float)similarityScore;
- (void)setAdjustments:(id)a3;
- (void)setSimilarityScore:(float)a3;
@end

@implementation _PISliderNetAdjustmentsResult

- (void).cxx_destruct
{
}

- (void)setSimilarityScore:(float)a3
{
  self->_similarityScore = a3;
}

- (float)similarityScore
{
  return self->_similarityScore;
}

- (void)setAdjustments:(id)a3
{
}

- (NSDictionary)adjustments
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_PISliderNetAdjustmentsResult *)self adjustments];
  v6 = [v3 stringWithFormat:@"<%@:%p> adjustments=%@", v4, self, v5];

  return (NSString *)v6;
}

@end