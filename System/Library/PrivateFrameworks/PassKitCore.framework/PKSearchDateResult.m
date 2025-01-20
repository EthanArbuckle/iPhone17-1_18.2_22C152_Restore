@interface PKSearchDateResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)description;
- (PKSearchDateResult)initWithCoder:(id)a3;
- (unint64_t)hash;
- (unint64_t)tokenType;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation PKSearchDateResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)tokenType
{
  return 3;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
}

- (PKSearchDateResult)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKSearchDateResult *)self init];
  if (v5)
  {
    v5->_unint64_t type = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;
  }
  return v5;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)PKSearchDateResult;
  v3 = [(PKSearchDateResult *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [v4 appendFormat:@"startDate: '%@'; ", self->_startDate];
  [v4 appendFormat:@"endDate: '%@'; ", self->_endDate];
  objc_msgSend(v4, "appendFormat:", @"type: '%lu'; ", self->_type);
  [v4 appendFormat:@">"];
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_type != v4[1]) {
    goto LABEL_10;
  }
  startDate = self->_startDate;
  objc_super v6 = (NSDate *)v4[2];
  if (!startDate || !v6)
  {
    if (startDate == v6) {
      goto LABEL_6;
    }
LABEL_10:
    char v9 = 0;
    goto LABEL_11;
  }
  if ((-[NSDate isEqual:](startDate, "isEqual:") & 1) == 0) {
    goto LABEL_10;
  }
LABEL_6:
  endDate = self->_endDate;
  uint64_t v8 = (NSDate *)v4[3];
  if (endDate && v8) {
    char v9 = -[NSDate isEqual:](endDate, "isEqual:");
  }
  else {
    char v9 = endDate == v8;
  }
LABEL_11:

  return v9;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_startDate];
  [v3 safelyAddObject:self->_endDate];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_type - v4 + 32 * v4;

  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end