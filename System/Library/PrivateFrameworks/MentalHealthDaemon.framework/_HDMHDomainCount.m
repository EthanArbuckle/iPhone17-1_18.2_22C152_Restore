@interface _HDMHDomainCount
- (NSDate)mostRecentDate;
- (_HDMHDomainCount)initWithCount:(int64_t)a3 mostRecentDate:(id)a4;
- (int64_t)count;
- (void)setCount:(int64_t)a3;
- (void)setMostRecentDate:(id)a3;
@end

@implementation _HDMHDomainCount

- (_HDMHDomainCount)initWithCount:(int64_t)a3 mostRecentDate:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_HDMHDomainCount;
  v7 = [(_HDMHDomainCount *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(_HDMHDomainCount *)v7 setCount:a3];
    [(_HDMHDomainCount *)v8 setMostRecentDate:v6];
  }

  return v8;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSDate)mostRecentDate
{
  return self->_mostRecentDate;
}

- (void)setMostRecentDate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end