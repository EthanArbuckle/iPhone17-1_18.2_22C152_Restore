@interface URLProtocolDelegate
- (_TtC7MusicUI19URLProtocolDelegate)init;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
@end

@implementation URLProtocolDelegate

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  _Block_copy(v10);
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = self;
  sub_229B22540((uint64_t)v11, (uint64_t)v12, v13, (uint64_t)v14, (void (**)(void, void, void))v10);
  _Block_release(v10);
}

- (_TtC7MusicUI19URLProtocolDelegate)init
{
  return (_TtC7MusicUI19URLProtocolDelegate *)sub_229B22950();
}

- (void).cxx_destruct
{
}

@end