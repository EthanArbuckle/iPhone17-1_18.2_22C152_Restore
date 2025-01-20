@interface _PIParallaxColorAnalysisResult
- (NSArray)dominantColors;
- (NSString)description;
- (double)medianLuminance;
- (void)setDominantColors:(id)a3;
- (void)setMedianLuminance:(double)a3;
@end

@implementation _PIParallaxColorAnalysisResult

- (void).cxx_destruct
{
}

- (void)setDominantColors:(id)a3
{
}

- (NSArray)dominantColors
{
  return self->_dominantColors;
}

- (void)setMedianLuminance:(double)a3
{
  self->_medianLuminance = a3;
}

- (double)medianLuminance
{
  return self->_medianLuminance;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(_PIParallaxColorAnalysisResult *)self medianLuminance];
  uint64_t v6 = v5;
  v7 = [(_PIParallaxColorAnalysisResult *)self dominantColors];
  v8 = [v3 stringWithFormat:@"<%@: %p lum = %.3f colors = %@>", v4, self, v6, v7];;

  return (NSString *)v8;
}

@end