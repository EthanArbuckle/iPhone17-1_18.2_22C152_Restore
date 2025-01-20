@interface TSTimeErrorValue
+ (id)timeErrorSequenceWithTimestamps:(unint64_t *)a3 timeError:(int64_t *)a4 count:(int64_t)a5;
- (TSTimeErrorValue)initWithTimestamp:(unint64_t)a3 andError:(int64_t)a4;
- (id)description;
- (int64_t)error;
- (unint64_t)timestamp;
@end

@implementation TSTimeErrorValue

- (TSTimeErrorValue)initWithTimestamp:(unint64_t)a3 andError:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSTimeErrorValue;
  result = [(TSTimeErrorValue *)&v7 init];
  if (result)
  {
    result->_timestamp = a3;
    result->_error = a4;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p: {%llu,%lld}>", v5, self, -[TSTimeErrorValue timestamp](self, "timestamp"), -[TSTimeErrorValue error](self, "error")];

  return v6;
}

+ (id)timeErrorSequenceWithTimestamps:(unint64_t *)a3 timeError:(int64_t *)a4 count:(int64_t)a5
{
  v8 = [MEMORY[0x1E4F1CA48] array];
  if (a3 && a4 && a5 >= 1)
  {
    do
    {
      v9 = [TSTimeErrorValue alloc];
      uint64_t v11 = *a3++;
      uint64_t v10 = v11;
      uint64_t v12 = *a4++;
      v13 = [(TSTimeErrorValue *)v9 initWithTimestamp:v10 andError:v12];
      [v8 addObject:v13];

      --a5;
    }
    while (a5);
  }
  return v8;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)error
{
  return self->_error;
}

@end