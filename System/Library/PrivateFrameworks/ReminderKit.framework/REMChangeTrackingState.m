@interface REMChangeTrackingState
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)lastConsumedDate;
- (REMChangeToken)lastConsumedChangeToken;
- (REMChangeTrackingState)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLastConsumedChangeToken:(id)a3;
- (void)setLastConsumedDate:(id)a3;
@end

@implementation REMChangeTrackingState

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMChangeTrackingState *)self lastConsumedChangeToken];
  [v4 encodeObject:v5 forKey:@"lastConsumedChangeToken"];

  id v6 = [(REMChangeTrackingState *)self lastConsumedDate];
  [v4 encodeObject:v6 forKey:@"lastConsumedDate"];
}

- (REMChangeTrackingState)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)REMChangeTrackingState;
  v5 = [(REMChangeTrackingState *)&v13 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastConsumedChangeToken"];
    if (!v6)
    {
      v11 = 0;
      goto LABEL_6;
    }
    lastConsumedChangeToken = v5->_lastConsumedChangeToken;
    v5->_lastConsumedChangeToken = v6;
    v8 = v6;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastConsumedDate"];
    lastConsumedDate = v5->_lastConsumedDate;
    v5->_lastConsumedDate = (NSDate *)v9;
  }
  v11 = v5;
LABEL_6:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMChangeToken)lastConsumedChangeToken
{
  return self->_lastConsumedChangeToken;
}

- (void)setLastConsumedChangeToken:(id)a3
{
}

- (NSDate)lastConsumedDate
{
  return self->_lastConsumedDate;
}

- (void)setLastConsumedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastConsumedDate, 0);

  objc_storeStrong((id *)&self->_lastConsumedChangeToken, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMChangeTrackingState *)a3;
  v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(REMChangeTrackingState *)self lastConsumedChangeToken];
      uint64_t v8 = [(REMChangeTrackingState *)v6 lastConsumedChangeToken];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        uint64_t v9 = (void *)v8;
        v10 = [(REMChangeTrackingState *)self lastConsumedChangeToken];
        v11 = [(REMChangeTrackingState *)v6 lastConsumedChangeToken];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      v14 = [(REMChangeTrackingState *)self lastConsumedDate];
      uint64_t v15 = [(REMChangeTrackingState *)v6 lastConsumedDate];
      if (v14 == (void *)v15)
      {
        char v13 = 1;
        v16 = v14;
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(REMChangeTrackingState *)self lastConsumedDate];
        v18 = [(REMChangeTrackingState *)v6 lastConsumedDate];
        char v13 = [v17 isEqual:v18];
      }
      goto LABEL_12;
    }
LABEL_5:
    char v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  char v13 = 1;
LABEL_13:

  return v13;
}

@end