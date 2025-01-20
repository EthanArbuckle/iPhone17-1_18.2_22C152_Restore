@interface SPKeySyncRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)lastIndexObservationDate;
- (NSUUID)identifier;
- (SPKeySyncRecord)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (unint64_t)lastIndexObserved;
- (void)encodeWithCoder:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLastIndexObservationDate:(id)a3;
- (void)setLastIndexObserved:(unint64_t)a3;
@end

@implementation SPKeySyncRecord

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SPKeySyncRecord *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(SPKeySyncRecord *)v5 identifier];
      v7 = [(SPKeySyncRecord *)self identifier];
      if ([v6 isEqual:v7]
        && (uint64_t v8 = [(SPKeySyncRecord *)v5 lastIndexObserved],
            v8 == [(SPKeySyncRecord *)self lastIndexObserved]))
      {
        v9 = [(SPKeySyncRecord *)v5 lastIndexObservationDate];
        v10 = [(SPKeySyncRecord *)self lastIndexObservationDate];
        char v11 = [v9 isEqualToDate:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_identifier hash];
  lastIndexObservationDate = self->_lastIndexObservationDate;
  unint64_t v5 = self->_lastIndexObserved ^ v3;
  return v5 ^ [(NSDate *)lastIndexObservationDate hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  unint64_t v5 = [(SPKeySyncRecord *)self identifier];
  v6 = (void *)[v5 copy];
  [v4 setIdentifier:v6];

  objc_msgSend(v4, "setLastIndexObserved:", -[SPKeySyncRecord lastIndexObserved](self, "lastIndexObserved"));
  v7 = [(SPKeySyncRecord *)self lastIndexObservationDate];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setLastIndexObservationDate:v8];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeDouble:@"lastIndexObserved" forKey:(double)self->_lastIndexObserved];
  [v5 encodeObject:self->_lastIndexObservationDate forKey:@"lastIndexObservationDate"];
}

- (SPKeySyncRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  identifier = self->_identifier;
  self->_identifier = v5;

  [v4 decodeDoubleForKey:@"lastIndexObserved"];
  self->_lastIndexObserved = (unint64_t)v7;
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastIndexObservationDate"];

  lastIndexObservationDate = self->_lastIndexObservationDate;
  self->_lastIndexObservationDate = v8;

  return self;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)lastIndexObserved
{
  return self->_lastIndexObserved;
}

- (void)setLastIndexObserved:(unint64_t)a3
{
  self->_lastIndexObserved = a3;
}

- (NSDate)lastIndexObservationDate
{
  return self->_lastIndexObservationDate;
}

- (void)setLastIndexObservationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastIndexObservationDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end