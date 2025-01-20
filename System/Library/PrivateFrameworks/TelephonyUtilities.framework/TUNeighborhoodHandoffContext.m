@interface TUNeighborhoodHandoffContext
+ (BOOL)supportsSecureCoding;
- (TUNeighborhoodHandoffContext)initWithCoder:(id)a3;
- (TUNeighborhoodHandoffContext)initWithHandoffType:(int64_t)a3;
- (TUNeighborhoodHandoffContext)initWithPullContext:(int64_t)a3;
- (id)description;
- (int64_t)pullContext;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUNeighborhoodHandoffContext

- (TUNeighborhoodHandoffContext)initWithHandoffType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TUNeighborhoodHandoffContext;
  result = [(TUNeighborhoodHandoffContext *)&v5 init];
  if (result)
  {
    result->_type = a3;
    result->_pullContext = 0;
  }
  return result;
}

- (TUNeighborhoodHandoffContext)initWithPullContext:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TUNeighborhoodHandoffContext;
  result = [(TUNeighborhoodHandoffContext *)&v5 init];
  if (result)
  {
    result->_type = 1;
    result->_pullContext = a3;
  }
  return result;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  unint64_t v7 = self->_type - 1;
  if (v7 > 3) {
    v8 = @"Unknown";
  }
  else {
    v8 = off_1E58E6388[v7];
  }
  [v6 appendFormat:@" type=%@", v8];
  unint64_t v9 = self->_pullContext - 1;
  if (v9 > 4) {
    v10 = @"Unknown";
  }
  else {
    v10 = off_1E58E63A8[v9];
  }
  [v6 appendFormat:@" pullContext=%@", v10];
  [v6 appendString:@">"];
  v11 = (void *)[v6 copy];

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUNeighborhoodHandoffContext)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = NSStringFromSelector(sel_type);
  uint64_t v6 = [v4 decodeIntegerForKey:v5];

  unint64_t v7 = NSStringFromSelector(sel_pullContext);
  uint64_t v8 = [v4 decodeIntegerForKey:v7];

  if (v6 == 1)
  {
    return [(TUNeighborhoodHandoffContext *)self initWithPullContext:v8];
  }
  else
  {
    return [(TUNeighborhoodHandoffContext *)self initWithHandoffType:v6];
  }
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  uint64_t v6 = NSStringFromSelector(sel_type);
  [v5 encodeInteger:type forKey:v6];

  int64_t pullContext = self->_pullContext;
  NSStringFromSelector(sel_pullContext);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:pullContext forKey:v8];
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)pullContext
{
  return self->_pullContext;
}

@end