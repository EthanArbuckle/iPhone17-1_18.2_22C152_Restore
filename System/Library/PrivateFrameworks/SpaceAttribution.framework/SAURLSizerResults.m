@interface SAURLSizerResults
+ (BOOL)supportsSecureCoding;
- (NSDictionary)urlInfo;
- (SAURLSizerResults)init;
- (SAURLSizerResults)initWithCoder:(id)a3;
- (int64_t)timeNow;
- (void)addURL:(id)a3 withSizeInfo:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setTimeNow:(int64_t)a3;
- (void)setUrlInfo:(id)a3;
@end

@implementation SAURLSizerResults

- (SAURLSizerResults)init
{
  v7.receiver = self;
  v7.super_class = (Class)SAURLSizerResults;
  v2 = [(SAURLSizerResults *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_timeNow = 0;
    uint64_t v4 = objc_opt_new();
    urlInfo = v3->_urlInfo;
    v3->_urlInfo = (NSDictionary *)v4;
  }
  return v3;
}

- (void)addURL:(id)a3 withSizeInfo:(id)a4
{
}

- (void)encodeWithCoder:(id)a3
{
  int64_t timeNow = self->_timeNow;
  id v5 = a3;
  [v5 encodeInteger:timeNow forKey:@"time"];
  [v5 encodeObject:self->_urlInfo forKey:@"urlInfo"];
}

- (SAURLSizerResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SAURLSizerResults;
  id v5 = [(SAURLSizerResults *)&v13 init];
  if (v5)
  {
    v5->_int64_t timeNow = [v4 decodeIntegerForKey:@"time"];
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"urlInfo"];
    urlInfo = v5->_urlInfo;
    v5->_urlInfo = (NSDictionary *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)timeNow
{
  return self->_timeNow;
}

- (void)setTimeNow:(int64_t)a3
{
  self->_int64_t timeNow = a3;
}

- (NSDictionary)urlInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setUrlInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end