@interface TSUBufferedReadChannelHelper
- (TSUBufferedReadChannelHelper)initWithBufferedReadChannel:(id)a3;
- (void)readWithQueue:(id)a3 handler:(id)a4;
@end

@implementation TSUBufferedReadChannelHelper

- (TSUBufferedReadChannelHelper)initWithBufferedReadChannel:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSUBufferedReadChannelHelper;
  v5 = [(TSUBufferedReadChannelHelper *)&v10 init];
  if (v5)
  {
    if (!v4)
    {
      v6 = +[TSUAssertionHandler currentHandler];
      v7 = [NSString stringWithUTF8String:"-[TSUBufferedReadChannelHelper initWithBufferedReadChannel:]"];
      v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUBufferedReadChannel.m"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 296, @"invalid nil value for '%s'", "bufferedReadChannel");
    }
    objc_storeWeak((id *)&v5->_bufferedReadChannel, v4);
  }

  return v5;
}

- (void)readWithQueue:(id)a3 handler:(id)a4
{
  p_bufferedReadChannel = &self->_bufferedReadChannel;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_bufferedReadChannel);
  [WeakRetained setStreamReadChannelSourceQueue:v7 handler:v6];
}

- (void).cxx_destruct
{
}

@end