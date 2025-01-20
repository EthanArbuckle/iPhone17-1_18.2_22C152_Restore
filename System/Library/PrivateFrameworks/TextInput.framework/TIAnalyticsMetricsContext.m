@interface TIAnalyticsMetricsContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)inputLanguage;
- (NSString)inputLanguageAndRegion;
- (NSString)inputRegion;
- (TIAnalyticsMetricsContext)initWithCoder:(id)a3;
- (TIAnalyticsMetricsContext)initWithInputLanguage:(id)a3 inputRegion:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TIAnalyticsMetricsContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputRegion, 0);

  objc_storeStrong((id *)&self->_inputLanguage, 0);
}

- (NSString)inputRegion
{
  return self->_inputRegion;
}

- (NSString)inputLanguage
{
  return self->_inputLanguage;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TIAnalyticsMetricsContext *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    inputLanguage = self->_inputLanguage;
    if ((unint64_t)inputLanguage | (unint64_t)v6->_inputLanguage
      && !-[NSString isEqualToString:](inputLanguage, "isEqualToString:"))
    {
      char v9 = 0;
    }
    else
    {
      inputRegion = self->_inputRegion;
      if ((unint64_t)inputRegion | (unint64_t)v6->_inputRegion) {
        char v9 = -[NSString isEqualToString:](inputRegion, "isEqualToString:");
      }
      else {
        char v9 = 1;
      }
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = 257 * [(NSString *)self->_inputLanguage hash];
  return [(NSString *)self->_inputRegion hash] + v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_inputLanguage copyWithZone:a3];
    v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(NSString *)self->_inputRegion copyWithZone:a3];
    char v9 = (void *)v5[2];
    v5[2] = v8;
  }
  v10 = self;

  return v10;
}

- (NSString)inputLanguageAndRegion
{
  return (NSString *)[NSString stringWithFormat:@"%@_%@", self->_inputLanguage, self->_inputRegion];
}

- (TIAnalyticsMetricsContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIAnalyticsMetricsContext;
  v5 = [(TIAnalyticsMetricsContext *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputLanguage"];
    uint64_t v7 = [v6 copy];
    inputLanguage = v5->_inputLanguage;
    v5->_inputLanguage = (NSString *)v7;

    char v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"inputRegion"];
    uint64_t v10 = [v9 copy];
    inputRegion = v5->_inputRegion;
    v5->_inputRegion = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  inputLanguage = self->_inputLanguage;
  id v5 = a3;
  [v5 encodeObject:inputLanguage forKey:@"inputLanguage"];
  [v5 encodeObject:self->_inputRegion forKey:@"inputRegion"];
}

- (TIAnalyticsMetricsContext)initWithInputLanguage:(id)a3 inputRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TIAnalyticsMetricsContext;
  uint64_t v8 = [(TIAnalyticsMetricsContext *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    inputLanguage = v8->_inputLanguage;
    v8->_inputLanguage = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    inputRegion = v8->_inputRegion;
    v8->_inputRegion = (NSString *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end