@interface TSUBufferedReadChannelHelper
- (TSUBufferedReadChannelHelper)init;
- (TSUBufferedReadChannelHelper)initWithBufferedReadChannel:(id)a3;
- (void)readWithHandler:(id)a3;
@end

@implementation TSUBufferedReadChannelHelper

- (TSUBufferedReadChannelHelper)initWithBufferedReadChannel:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSUBufferedReadChannelHelper;
  v5 = [(TSUBufferedReadChannelHelper *)&v9 init];
  if (v5)
  {
    if (!v4)
    {
      v6 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannelHelper initWithBufferedReadChannel:]"];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 347, 0, "invalid nil value for '%{public}s'", "bufferedReadChannel");

      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    objc_storeWeak((id *)&v5->_bufferedReadChannel, v4);
  }

  return v5;
}

- (TSUBufferedReadChannelHelper)init
{
  v2 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannelHelper init]"];
  v3 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUBufferedReadChannel.m"];
  +[OITSUAssertionHandler handleFailureInFunction:v2 file:v3 lineNumber:354 isFatal:0 description:"Do not call method"];

  +[OITSUAssertionHandler logBacktraceThrottled];
  id v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s", "Do not call method", "-[TSUBufferedReadChannelHelper init]");
  id v7 = [v4 exceptionWithName:v5 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

- (void)readWithHandler:(id)a3
{
  p_bufferedReadChannel = &self->_bufferedReadChannel;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_bufferedReadChannel);
  [WeakRetained setStreamReadChannelSourceHandler:v4];
}

- (void).cxx_destruct
{
}

@end