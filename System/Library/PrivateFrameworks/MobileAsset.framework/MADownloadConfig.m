@interface MADownloadConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)discretionary;
- (MADownloadConfig)init;
- (MADownloadConfig)initWithCoder:(id)a3;
- (MADownloadConfig)initWithPlist:(id)a3;
- (id)encodeAsPlist;
- (id)summary;
- (void)encodeWithCoder:(id)a3;
- (void)logConfig;
- (void)setDiscretionary:(BOOL)a3;
@end

@implementation MADownloadConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADownloadConfig)init
{
  v3.receiver = self;
  v3.super_class = (Class)MADownloadConfig;
  result = [(MADownloadConfig *)&v3 init];
  if (result) {
    result->_discretionary = 1;
  }
  return result;
}

- (MADownloadConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MADownloadConfig;
  v5 = [(MADownloadConfig *)&v8 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"discretionary"];
    v5->_discretionary = [v6 BOOLValue];
  }
  return v5;
}

- (MADownloadConfig)initWithPlist:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADownloadConfig;
  v5 = [(MADownloadConfig *)&v7 init];
  if (v5) {
    v5->_discretionary = getPlistNumberAsBool(v4, @"discretionary");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3 = NSNumber;
  BOOL discretionary = self->_discretionary;
  id v5 = a3;
  id v6 = [v3 numberWithBool:discretionary];
  [v5 encodeObject:v6 forKey:@"discretionary"];
}

- (id)encodeAsPlist
{
  objc_super v3 = objc_opt_new();
  id v4 = [NSNumber numberWithBool:self->_discretionary];
  [v3 setValue:v4 forKey:@"discretionary"];

  return v3;
}

- (void)logConfig
{
  BOOL v2 = [(MADownloadConfig *)self discretionary];
  _MobileAssetLog(0, 6, (uint64_t)"-[MADownloadConfig logConfig]", @"The config is discretionary: %d", v3, v4, v5, v6, v2);
}

- (id)summary
{
  BOOL v2 = NSString;
  BOOL v3 = [(MADownloadConfig *)self discretionary];
  uint64_t v4 = @"NO";
  if (v3) {
    uint64_t v4 = @"YES";
  }
  return (id)[v2 stringWithFormat:@"discretionary:%@", v4];
}

- (BOOL)discretionary
{
  return self->_discretionary;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_BOOL discretionary = a3;
}

@end