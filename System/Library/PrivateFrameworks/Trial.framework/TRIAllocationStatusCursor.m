@interface TRIAllocationStatusCursor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)date;
- (TRIAllocationStatusCursor)initWithCoder:(id)a3;
- (TRIAllocationStatusCursor)initWithSecondsFromEpoch:(double)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRIAllocationStatusCursor

- (TRIAllocationStatusCursor)initWithSecondsFromEpoch:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TRIAllocationStatusCursor;
  result = [(TRIAllocationStatusCursor *)&v5 init];
  if (result) {
    result->_secondsFromEpoch = a3;
  }
  return result;
}

- (NSDate)date
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:self->_secondsFromEpoch];
  return (NSDate *)v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (double *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = [NSNumber numberWithDouble:self->_secondsFromEpoch];
    v6 = [NSNumber numberWithDouble:v4[1]];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [NSNumber numberWithDouble:self->_secondsFromEpoch];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIAllocationStatusCursor)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
  if (v5)
  {
    id v11 = 0;
    v6 = +[TRIPBMessage parseFromData:v5 error:&v11];
    id v7 = v11;
    if (v6)
    {
      if ([v6 hasLowerBoundExclusive])
      {
        v8 = [v6 lowerBoundExclusive];
        [v8 timeIntervalSince1970];
        self = -[TRIAllocationStatusCursor initWithSecondsFromEpoch:](self, "initWithSecondsFromEpoch:");

        v9 = self;
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      [v4 failWithError:v7];
    }
    v9 = 0;
    goto LABEL_8;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  objc_super v5 = objc_opt_new();
  v6 = (void *)[objc_alloc(MEMORY[0x1E4FB05F0]) initWithTimeIntervalSince1970:self->_secondsFromEpoch];
  [v5 setLowerBoundExclusive:v6];

  id v7 = [v5 data];
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"TRIAllocationStatusProvider.m", 90, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  [v9 encodeObject:v7 forKey:@"data"];
}

@end