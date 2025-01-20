@interface NSURLSessionTask
- (id)ITunesStoreCancelError;
- (id)ITunesStoreDataConsumer;
- (int64_t)ITunesStoreCancelReason;
- (void)cancelWithITunesStoreReason:(int64_t)a3 error:(id)a4;
- (void)setITunesStoreDataConsumer:(id)a3;
@end

@implementation NSURLSessionTask

- (void)cancelWithITunesStoreReason:(int64_t)a3 error:(id)a4
{
  id v6 = a4;
  id value = [objc_alloc((Class)NSNumber) initWithInteger:a3];
  objc_setAssociatedObject(self, "com.apple.itunesstored.cancelError", v6, (void *)0x301);

  objc_setAssociatedObject(self, "com.apple.itunesstored.cancelReason", value, (void *)0x301);
  [(NSURLSessionTask *)self cancel];
}

- (id)ITunesStoreCancelError
{
  return objc_getAssociatedObject(self, "com.apple.itunesstored.cancelError");
}

- (int64_t)ITunesStoreCancelReason
{
  v2 = objc_getAssociatedObject(self, "com.apple.itunesstored.cancelReason");
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (id)ITunesStoreDataConsumer
{
  return objc_getAssociatedObject(self, "com.apple.itunesstored.dataConsumer");
}

- (void)setITunesStoreDataConsumer:(id)a3
{
}

@end