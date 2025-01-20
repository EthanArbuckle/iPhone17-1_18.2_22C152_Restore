@interface _MFDAMessageStoreFetchUsingRemoteIDRequest
- (BOOL)isUserRequested;
- (BOOL)shouldSend;
- (unint64_t)generationNumber;
@end

@implementation _MFDAMessageStoreFetchUsingRemoteIDRequest

- (BOOL)isUserRequested
{
  return 1;
}

- (BOOL)shouldSend
{
  return 1;
}

- (unint64_t)generationNumber
{
  return 0;
}

@end