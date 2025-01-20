@interface SASRequestSourceTransport
+ (BOOL)supportsSecureCoding;
- (NSNumber)transport;
- (SASRequestSourceTransport)initWithCoder:(id)a3;
- (SASRequestSourceTransport)initWithSASRequestSource:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)SASRequestSource;
- (void)encodeWithCoder:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation SASRequestSourceTransport

- (SASRequestSourceTransport)initWithSASRequestSource:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SASRequestSourceTransport;
  v4 = [(SASRequestSourceTransport *)&v7 init];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    [(SASRequestSourceTransport *)v4 setTransport:v5];
  }
  return v4;
}

- (id)description
{
  v2 = NSString;
  v3 = [(SASRequestSourceTransport *)self transport];
  v4 = [v2 stringWithFormat:@"SASRequestSourceTransport:%@", v3];

  return v4;
}

- (int64_t)SASRequestSource
{
  v2 = [(SASRequestSourceTransport *)self transport];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t v5 = [(SASRequestSourceTransport *)self SASRequestSource];
  return (id)[v4 initWithSASRequestSource:v5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASRequestSourceTransport)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SASRequestSourceTransport;
  int64_t v5 = [(SASRequestSourceTransport *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transport"];
    transport = v5->_transport;
    v5->_transport = (NSNumber *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SASRequestSourceTransport *)self transport];
  [v4 encodeObject:v5 forKey:@"transport"];
}

- (NSNumber)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
}

- (void).cxx_destruct
{
}

@end