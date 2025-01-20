@interface _PSPhotoSuggestionsOutstandingRequestsGuardedData
- (BOOL)waitingForRequestIDForCurrentThread;
- (_PSPhotoSuggestionsOutstandingRequestsGuardedData)init;
- (uint64_t)outstandingRequests;
- (uint64_t)setWaitingForRequestIDForCurrentThread:(uint64_t)result;
@end

@implementation _PSPhotoSuggestionsOutstandingRequestsGuardedData

- (_PSPhotoSuggestionsOutstandingRequestsGuardedData)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PSPhotoSuggestionsOutstandingRequestsGuardedData;
  v2 = [(_PSPhotoSuggestionsOutstandingRequestsGuardedData *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    outstandingRequests = v2->_outstandingRequests;
    v2->_outstandingRequests = (NSMutableDictionary *)v3;

    v2->_waitingForRequestIDForCurrentThread = 0;
  }
  return v2;
}

- (uint64_t)outstandingRequests
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (BOOL)waitingForRequestIDForCurrentThread
{
  if (result) {
    return *(unsigned char *)(result + 8) != 0;
  }
  return result;
}

- (uint64_t)setWaitingForRequestIDForCurrentThread:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 8) = a2;
  }
  return result;
}

- (void).cxx_destruct
{
}

@end