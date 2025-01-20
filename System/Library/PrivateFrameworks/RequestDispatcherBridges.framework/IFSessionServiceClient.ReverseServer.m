@interface IFSessionServiceClient.ReverseServer
- (void)sendWithMessageData:(id)a3 reply:(id)a4;
- (void)sessionDidFailWithError:(id)a3 reply:(id)a4;
@end

@implementation IFSessionServiceClient.ReverseServer

- (void)sendWithMessageData:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  id v7 = a3;
  swift_retain();
  uint64_t v8 = sub_1C9306DA8();
  unint64_t v10 = v9;

  _Block_copy(v6);
  sub_1C92FC1E4(v8, v10, (uint64_t)self, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  sub_1C91E7EE4(v8, v10);
  swift_release();
}

- (void)sessionDidFailWithError:(id)a3 reply:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  swift_retain();
  sub_1C92FC7C4(v7, (uint64_t)self, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
  swift_release();
}

@end