@interface SIRINLUResponseStatus
+ (BOOL)supportsSecureCoding;
- (NSString)statusDescription;
- (SIRINLUResponseStatus)initWithCoder:(id)a3;
- (id)description;
- (id)initStatusCode:(int)a3 statusDescription:(id)a4;
- (int)statusCode;
- (void)encodeWithCoder:(id)a3;
- (void)setStatusCode:(int)a3;
- (void)setStatusDescription:(id)a3;
@end

@implementation SIRINLUResponseStatus

- (void).cxx_destruct
{
}

- (void)setStatusDescription:(id)a3
{
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (void)setStatusCode:(int)a3
{
  self->_statusCode = a3;
}

- (int)statusCode
{
  return self->_statusCode;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"{ResponseStatus\n  statusCode: %d\n  statusDescription: %@\n}", self->_statusCode, self->_statusDescription];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[SIRINLUResponseStatus statusCode](self, "statusCode"), @"statusCode");
  id v5 = [(SIRINLUResponseStatus *)self statusDescription];
  [v4 encodeObject:v5 forKey:@"statusDescription"];
}

- (SIRINLUResponseStatus)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLUResponseStatus;
  id v5 = [(SIRINLUResponseStatus *)&v9 init];
  if (v5)
  {
    v5->_statusCode = [v4 decodeIntForKey:@"statusCode"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusDescription"];
    statusDescription = v5->_statusDescription;
    v5->_statusDescription = (NSString *)v6;
  }
  return v5;
}

- (id)initStatusCode:(int)a3 statusDescription:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLUResponseStatus;
  v8 = [(SIRINLUResponseStatus *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    v8->_statusCode = a3;
    objc_storeStrong((id *)&v8->_statusDescription, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end