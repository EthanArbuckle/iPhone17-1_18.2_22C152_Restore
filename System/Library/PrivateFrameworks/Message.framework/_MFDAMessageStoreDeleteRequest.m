@interface _MFDAMessageStoreDeleteRequest
- (BOOL)isUserRequested;
- (BOOL)shouldSend;
- (unint64_t)generationNumber;
@end

@implementation _MFDAMessageStoreDeleteRequest

- (unint64_t)generationNumber
{
  return 0;
}

- (BOOL)shouldSend
{
  return 1;
}

- (BOOL)isUserRequested
{
  return 1;
}

@end