@interface PKEventDateInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)ignoreTimeComponents;
- (BOOL)isUnannounced;
- (BOOL)isUndetermined;
- (NSDate)date;
- (NSTimeZone)timeZone;
- (PKEventDateInfo)initWithCoder:(id)a3;
- (PKEventDateInfo)initWithDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKEventDateInfo

- (PKEventDateInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKEventDateInfo;
  v5 = [(PKEventDateInfo *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 PKDateForKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    v5->_ignoreTimeComponents = [v4 PKBoolForKey:@"ignoreTimeComponents"];
    v5->_unannounced = [v4 PKBoolForKey:@"unannounced"];
    v5->_undetermined = [v4 PKBoolForKey:@"undetermined"];
    v8 = [v4 PKStringForKey:@"timeZone"];
    v9 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:v8];
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CAF0] timeZoneWithAbbreviation:v8];
    }
    timeZone = v5->_timeZone;
    v5->_timeZone = v11;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKEventDateInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKEventDateInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v8;

    v5->_ignoreTimeComponents = [v4 decodeBoolForKey:@"ignoreTimeComponents"];
    v5->_unannounced = [v4 decodeBoolForKey:@"unannounced"];
    v5->_undetermined = [v4 decodeBoolForKey:@"undetermined"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"date"];
  [v5 encodeObject:self->_timeZone forKey:@"timeZone"];
  [v5 encodeBool:self->_ignoreTimeComponents forKey:@"ignoreTimeComponents"];
  [v5 encodeBool:self->_unannounced forKey:@"unannounced"];
  [v5 encodeBool:self->_undetermined forKey:@"undetermined"];
}

- (NSDate)date
{
  return self->_date;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (BOOL)ignoreTimeComponents
{
  return self->_ignoreTimeComponents;
}

- (BOOL)isUnannounced
{
  return self->_unannounced;
}

- (BOOL)isUndetermined
{
  return self->_undetermined;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end