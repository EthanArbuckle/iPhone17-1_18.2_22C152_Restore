@interface SXParsedDate
- (BOOL)containedTime;
- (NSDate)date;
- (NSTimeZone)timeZone;
- (SXParsedDate)initWithDate:(id)a3 containedTime:(BOOL)a4 timeZone:(id)a5;
@end

@implementation SXParsedDate

- (SXParsedDate)initWithDate:(id)a3 containedTime:(BOOL)a4 timeZone:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SXParsedDate;
  v11 = [(SXParsedDate *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_date, a3);
    v12->_containedTime = a4;
    objc_storeStrong((id *)&v12->_timeZone, a5);
  }

  return v12;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)containedTime
{
  return self->_containedTime;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end