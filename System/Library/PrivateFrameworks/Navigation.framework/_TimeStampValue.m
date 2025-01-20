@interface _TimeStampValue
- (NSString)formatPattern;
- (NSTimeZone)timeZone;
- (_TimeStampValue)initWithCoder:(id)a3;
- (_TimeStampValue)initWithTimeStamp:(double)a3 timeZone:(id)a4 formatPattern:(id)a5;
- (double)timeStamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _TimeStampValue

- (_TimeStampValue)initWithTimeStamp:(double)a3 timeZone:(id)a4 formatPattern:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_TimeStampValue;
  v11 = [(_TimeStampValue *)&v16 init];
  v12 = v11;
  if (v11)
  {
    v11->_timeStamp = a3;
    objc_storeStrong((id *)&v11->_timeZone, a4);
    uint64_t v13 = [v10 copy];
    formatPattern = v12->_formatPattern;
    v12->_formatPattern = (NSString *)v13;
  }
  return v12;
}

- (_TimeStampValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_TimeStampValue;
  v5 = [(_TimeStampValue *)&v13 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timeStamp"];
    v5->_timeStamp = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formatPattern"];
    uint64_t v10 = [v9 copy];
    formatPattern = v5->_formatPattern;
    v5->_formatPattern = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timeStamp = self->_timeStamp;
  id v5 = a3;
  [v5 encodeDouble:@"timeStamp" forKey:timeStamp];
  [v5 encodeObject:self->_timeZone forKey:@"timeZone"];
  [v5 encodeObject:self->_formatPattern forKey:@"formatPattern"];
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSString)formatPattern
{
  return self->_formatPattern;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatPattern, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end