@interface NEIKEv2FallbackChildSession
- (id)description;
@end

@implementation NEIKEv2FallbackChildSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tunnelInterface, 0);
  objc_storeStrong((id *)&self->_tunnelSession, 0);

  objc_storeStrong((id *)&self->_tunnelName, 0);
}

- (id)description
{
  if (self)
  {
    self = (NEIKEv2FallbackChildSession *)objc_getProperty(self, a2, 16, 1);
    uint64_t v2 = vars8;
  }
  return self;
}

@end