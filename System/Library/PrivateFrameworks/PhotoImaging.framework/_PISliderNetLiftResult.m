@interface _PISliderNetLiftResult
- (NSData)contentFeatureVectorData;
- (NSData)styleFeatureVectorData;
- (NSString)description;
- (void)setContentFeatureVectorData:(id)a3;
- (void)setStyleFeatureVectorData:(id)a3;
@end

@implementation _PISliderNetLiftResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentFeatureVectorData, 0);
  objc_storeStrong((id *)&self->_styleFeatureVectorData, 0);
}

- (void)setContentFeatureVectorData:(id)a3
{
}

- (NSData)contentFeatureVectorData
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStyleFeatureVectorData:(id)a3
{
}

- (NSData)styleFeatureVectorData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(_PISliderNetLiftResult *)self styleFeatureVectorData];
  v6 = [v3 stringWithFormat:@"<%@:%p> data=%@", v4, self, v5];

  return (NSString *)v6;
}

@end