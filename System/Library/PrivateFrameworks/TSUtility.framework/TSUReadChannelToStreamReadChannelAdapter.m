@interface TSUReadChannelToStreamReadChannelAdapter
- (TSUReadChannelToStreamReadChannelAdapter)initWithReadChannel:(id)a3;
- (void)addBarrier:(id)a3;
- (void)close;
- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 queue:(id)a5 handler:(id)a6;
- (void)readWithQueue:(id)a3 handler:(id)a4;
- (void)setLowWater:(unint64_t)a3;
@end

@implementation TSUReadChannelToStreamReadChannelAdapter

- (TSUReadChannelToStreamReadChannelAdapter)initWithReadChannel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSUReadChannelToStreamReadChannelAdapter;
  v6 = [(TSUReadChannelToStreamReadChannelAdapter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_readChannel, a3);
  }

  return v7;
}

- (void)readWithQueue:(id)a3 handler:(id)a4
{
}

- (void)close
{
}

- (void)readFromOffset:(int64_t)a3 length:(unint64_t)a4 queue:(id)a5 handler:(id)a6
{
}

- (void)setLowWater:(unint64_t)a3
{
}

- (void)addBarrier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end