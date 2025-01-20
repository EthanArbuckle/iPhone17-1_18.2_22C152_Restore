@interface NFHceTagReadCALogger
- (NFHceTagReadCALogger)init;
@end

@implementation NFHceTagReadCALogger

- (NFHceTagReadCALogger)init
{
  v3.receiver = self;
  v3.super_class = (Class)NFHceTagReadCALogger;
  result = [(NFHceTagReadCALogger *)&v3 init];
  if (result)
  {
    result->_readStart = 0;
    result->_wasRead = 0;
    result->_didUsePayment = 0;
    result->_rawBytesTx = 0;
    result->_rawBytesRx = 0;
    result->_rawCommandCount = 0;
    result->_resultCode = 0;
    result->_connectionCount = 0;
    *(void *)&result->_sessionDuration = 0;
    *(void *)&result->_sessionTotalRx = 0;
    result->_sessionStart = 0;
    *(void *)((char *)&result->_sessionTotalTx + 1) = 0;
  }
  return result;
}

@end