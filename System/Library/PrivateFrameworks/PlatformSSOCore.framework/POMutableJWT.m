@interface POMutableJWT
- (BOOL)isJWE;
- (POMutableJWTBody)body;
- (POMutableJWTHeader)header;
- (void)setBody:(id)a3;
- (void)setBodyData:(id)a3;
- (void)setHeader:(id)a3;
@end

@implementation POMutableJWT

- (BOOL)isJWE
{
  v2 = [(POMutableJWT *)self header];
  v3 = [v2 enc];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)setBodyData:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)POMutableJWT;
  [(POMutableJWT *)&v3 setBodyData:a3];
}

- (POMutableJWTHeader)header
{
  return (POMutableJWTHeader *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHeader:(id)a3
{
}

- (POMutableJWTBody)body
{
  return (POMutableJWTBody *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end