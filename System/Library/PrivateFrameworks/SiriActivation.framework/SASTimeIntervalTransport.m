@interface SASTimeIntervalTransport
+ (BOOL)supportsSecureCoding;
- (NSNumber)transport;
- (SASTimeIntervalTransport)initWithCoder:(id)a3;
- (SASTimeIntervalTransport)initWithTimeInterval:(double)a3;
- (double)timeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setTransport:(id)a3;
@end

@implementation SASTimeIntervalTransport

- (SASTimeIntervalTransport)initWithTimeInterval:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SASTimeIntervalTransport;
  v4 = [(SASTimeIntervalTransport *)&v7 init];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
    [(SASTimeIntervalTransport *)v4 setTransport:v5];
  }
  return v4;
}

- (id)description
{
  v2 = NSString;
  v3 = [(SASTimeIntervalTransport *)self transport];
  v4 = [v2 stringWithFormat:@"SASTimeIntervalTransport:%@", v3];

  return v4;
}

- (double)timeInterval
{
  v2 = [(SASTimeIntervalTransport *)self transport];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  [(SASTimeIntervalTransport *)self timeInterval];
  return (id)objc_msgSend(v4, "initWithTimeInterval:");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASTimeIntervalTransport)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SASTimeIntervalTransport;
  v5 = [(SASTimeIntervalTransport *)&v9 init];
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
  id v5 = [(SASTimeIntervalTransport *)self transport];
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