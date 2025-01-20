@interface _MFDAMessageStoreGetUpdatesRequest
- (BOOL)isUserRequested;
- (BOOL)mf_alwaysReportFailures;
- (BOOL)shouldSend;
- (id)initRequestForBodyFormat:(int)a3 withBodySizeLimit:(int)a4 isUserRequested:(BOOL)a5;
- (unint64_t)generationNumber;
@end

@implementation _MFDAMessageStoreGetUpdatesRequest

- (id)initRequestForBodyFormat:(int)a3 withBodySizeLimit:(int)a4 isUserRequested:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)_MFDAMessageStoreGetUpdatesRequest;
  id result = [(DAMailboxGetUpdatesRequest *)&v7 initRequestForBodyFormat:*(void *)&a3 withBodySizeLimit:*(void *)&a4];
  if (result) {
    *((unsigned char *)result + 28) = a5;
  }
  return result;
}

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
  return *((unsigned char *)&self->super._maxSize + 4);
}

- (BOOL)mf_alwaysReportFailures
{
  return 1;
}

@end