@interface HTTPServerProtocolH1
+ (BOOL)requiresTLS;
+ (NSString)alpnIdentifier;
- (void)stop;
@end

@implementation HTTPServerProtocolH1

+ (NSString)alpnIdentifier
{
  return (NSString *)@"http/1.1";
}

+ (BOOL)requiresTLS
{
  return 0;
}

- (void)stop
{
  if (self) {
    objc_storeWeak((id *)&self->_connectionHandle, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentRequest, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_responseHandler);
  objc_storeStrong((id *)&self->_readBuffer, 0);

  objc_destroyWeak((id *)&self->_connectionHandle);
}

@end