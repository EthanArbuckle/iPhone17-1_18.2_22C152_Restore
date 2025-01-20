@interface XPCClient
- (void)receiveEvent:(int64_t)a3 data:(id)a4;
- (void)receiveRequest:(int64_t)a3 data:(id)a4 completion:(id)a5;
@end

@implementation XPCClient

- (void)receiveRequest:(int64_t)a3 data:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  swift_retain();
  if (a4)
  {
    id v9 = a4;
    a4 = (id)sub_1D5AB1C20();
    unint64_t v11 = v10;
  }
  else
  {
    unint64_t v11 = 0xF000000000000000;
  }
  v12 = *(void **)self->dispatchService;
  _Block_copy(v8);
  sub_1D5AB05B0(a3, (uint64_t)a4, v11, v12, (void (**)(void, void, void))v8);
  _Block_release(v8);
  _Block_release(v8);
  sub_1D5956DE4((uint64_t)a4, v11);
  swift_release();
}

- (void)receiveEvent:(int64_t)a3 data:(id)a4
{
  v4 = a4;
  if (a4)
  {
    swift_retain();
    id v6 = v4;
    v4 = (void *)sub_1D5AB1C20();
    v8 = v7;
  }
  else
  {
    swift_retain();
    v8 = 0xF000000000000000;
  }
  TransportDispatchService.dispatchEvent(_:data:)(a3, (uint64_t)v4, v8);
  sub_1D5956DE4((uint64_t)v4, (unint64_t)v8);
  swift_release();
}

@end