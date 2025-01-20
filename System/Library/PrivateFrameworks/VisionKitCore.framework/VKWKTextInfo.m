@interface VKWKTextInfo
- (NSString)string;
- (VKQuad)quad;
- (void)setQuad:(id)a3;
- (void)setString:(id)a3;
@end

@implementation VKWKTextInfo

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (VKQuad)quad
{
  return self->_quad;
}

- (void)setQuad:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end