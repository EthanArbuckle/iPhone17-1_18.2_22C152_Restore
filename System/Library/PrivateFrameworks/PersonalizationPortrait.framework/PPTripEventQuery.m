@interface PPTripEventQuery
+ (BOOL)supportsSecureCoding;
- (PPTripEventQuery)initWithCoder:(id)a3;
- (id)description;
- (unsigned)tripOptions;
- (void)encodeWithCoder:(id)a3;
- (void)setTripOptions:(unsigned __int8)a3;
@end

@implementation PPTripEventQuery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PPTripEventQuery;
  id v4 = a3;
  [(PPEventQuery *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInt32:forKey:", self->_tripOptions, @"triop", v5.receiver, v5.super_class);
}

- (PPTripEventQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PPTripEventQuery;
  objc_super v5 = [(PPEventQuery *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_tripOptions = [v4 decodeInt32ForKey:@"triop"];
  }

  return v5;
}

- (void)setTripOptions:(unsigned __int8)a3
{
  self->_tripOptions = a3;
}

- (unsigned)tripOptions
{
  return self->_tripOptions;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(PPEventQuery *)self fromDate];
  objc_super v5 = [(PPEventQuery *)self toDate];
  v6 = (void *)[v3 initWithFormat:@"<PPTripEventQuery f:%@ t:%@ o:%d>", v4, v5, self->_tripOptions];

  return v6;
}

@end