@interface MSDPingResponse
- (NSNumber)statusCode;
- (void)setStatusCode:(id)a3;
@end

@implementation MSDPingResponse

- (NSNumber)statusCode
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStatusCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end