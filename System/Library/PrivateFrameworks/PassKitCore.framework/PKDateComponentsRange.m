@interface PKDateComponentsRange
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDateComponentsRange:(id)a3;
- (NSDateComponents)endDateComponents;
- (NSDateComponents)startDateComponents;
- (PKDateComponentsRange)initWithCoder:(id)a3;
- (PKDateComponentsRange)initWithStartDateComponents:(NSDateComponents *)startDateComponents endDateComponents:(NSDateComponents *)endDateComponents;
- (id)dateInterval;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKDateComponentsRange

- (PKDateComponentsRange)initWithStartDateComponents:(NSDateComponents *)startDateComponents endDateComponents:(NSDateComponents *)endDateComponents
{
  v6 = startDateComponents;
  v7 = endDateComponents;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if ([(NSDateComponents *)v6 isValidDate] && [(NSDateComponents *)v8 isValidDate])
    {
      v16.receiver = self;
      v16.super_class = (Class)PKDateComponentsRange;
      v10 = [(PKDateComponentsRange *)&v16 init];
      if (v10)
      {
        uint64_t v11 = [(NSDateComponents *)v6 copy];
        v12 = v10->_startDateComponents;
        v10->_startDateComponents = (NSDateComponents *)v11;

        uint64_t v13 = [(NSDateComponents *)v8 copy];
        v14 = v10->_endDateComponents;
        v10->_endDateComponents = (NSDateComponents *)v13;
      }
      self = v10;
      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)dateInterval
{
  v3 = [(NSDateComponents *)self->_startDateComponents date];
  uint64_t v4 = [(NSDateComponents *)self->_endDateComponents date];
  v5 = (void *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    v7 = 0;
  }
  else {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v3 endDate:v4];
  }

  return v7;
}

- (unint64_t)hash
{
  v6[2] = *MEMORY[0x1E4F143B8];
  endDateComponents = self->_endDateComponents;
  v6[0] = self->_startDateComponents;
  v6[1] = endDateComponents;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKDateComponentsRange *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKDateComponentsRange *)self isEqualToDateComponentsRange:v5];

  return v6;
}

- (BOOL)isEqualToDateComponentsRange:(id)a3
{
  unint64_t v4 = a3;
  startDateComponents = self->_startDateComponents;
  BOOL v6 = (NSDateComponents *)v4[1];
  if (startDateComponents) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[NSDateComponents isEqual:](startDateComponents, "isEqual:")) {
      goto LABEL_9;
    }
LABEL_7:
    char v8 = 0;
    goto LABEL_13;
  }
  if (startDateComponents != v6) {
    goto LABEL_7;
  }
LABEL_9:
  endDateComponents = self->_endDateComponents;
  v10 = (NSDateComponents *)v4[2];
  if (endDateComponents && v10) {
    char v8 = -[NSDateComponents isEqual:](endDateComponents, "isEqual:");
  }
  else {
    char v8 = endDateComponents == v10;
  }
LABEL_13:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  startDateComponents = self->_startDateComponents;
  id v5 = a3;
  [v5 encodeObject:startDateComponents forKey:@"startDateComponents"];
  [v5 encodeObject:self->_endDateComponents forKey:@"endDateComponents"];
}

- (PKDateComponentsRange)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDateComponents"];
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDateComponents"];

  BOOL v7 = [(PKDateComponentsRange *)self initWithStartDateComponents:v5 endDateComponents:v6];
  return v7;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(NSDateComponents *)self->_startDateComponents description];
  [v3 appendFormat:@"startDateComponents: '%@'; ", v4];

  id v5 = [(NSDateComponents *)self->_endDateComponents description];
  [v3 appendFormat:@"endDateComponents: '%@'; ", v5];

  [v3 appendFormat:@">"];
  BOOL v6 = (void *)[v3 copy];

  return v6;
}

- (NSDateComponents)startDateComponents
{
  return self->_startDateComponents;
}

- (NSDateComponents)endDateComponents
{
  return self->_endDateComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDateComponents, 0);
  objc_storeStrong((id *)&self->_startDateComponents, 0);
}

@end