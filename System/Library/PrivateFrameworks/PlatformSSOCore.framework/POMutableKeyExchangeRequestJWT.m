@interface POMutableKeyExchangeRequestJWT
- (POMutableKeyExchangeRequestJWTBody)body;
- (id)description;
- (void)setBody:(id)a3;
@end

@implementation POMutableKeyExchangeRequestJWT

- (id)description
{
  v3 = NSString;
  v4 = [(POMutableJWT *)self header];
  v5 = [(POMutableKeyExchangeRequestJWT *)self body];
  v6 = [(POJWT *)self stringRepresentation];
  v7 = [v3 stringWithFormat:@"%@.%@\n%@", v4, v5, v6];

  return v7;
}

- (POMutableKeyExchangeRequestJWTBody)body
{
  return (POMutableKeyExchangeRequestJWTBody *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBody:(id)a3
{
}

- (void).cxx_destruct
{
}

@end