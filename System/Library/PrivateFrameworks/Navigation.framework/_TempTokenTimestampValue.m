@interface _TempTokenTimestampValue
- (NSString)formatPattern;
- (NSTimeZone)timeZone;
- (_TempTokenTimestampValue)initWithCoder:(id)a3;
- (double)timeStamp;
- (void)encodeWithCoder:(id)a3;
- (void)setFormatPattern:(id)a3;
- (void)setTimeStamp:(double)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation _TempTokenTimestampValue

- (_TempTokenTimestampValue)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TempTokenTimestampValue;
  v5 = [(_TempTokenTimestampValue *)&v12 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timeStamp = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"formatPattern"];
    formatPattern = v5->_formatPattern;
    v5->_formatPattern = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timeStamp = self->_timeStamp;
  id v5 = a3;
  [v5 encodeDouble:@"timestamp" forKey:timeStamp];
  [v5 encodeObject:self->_timeZone forKey:@"timeZone"];
  [v5 encodeObject:self->_formatPattern forKey:@"formatPattern"];
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(double)a3
{
  self->_double timeStamp = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (NSString)formatPattern
{
  return self->_formatPattern;
}

- (void)setFormatPattern:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatPattern, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end