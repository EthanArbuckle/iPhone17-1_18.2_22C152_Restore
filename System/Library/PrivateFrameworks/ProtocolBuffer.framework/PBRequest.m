@interface PBRequest
- (Class)responseClass;
- (unsigned)requestTypeCode;
@end

@implementation PBRequest

- (Class)responseClass
{
  return 0;
}

- (unsigned)requestTypeCode
{
  return 0;
}

@end