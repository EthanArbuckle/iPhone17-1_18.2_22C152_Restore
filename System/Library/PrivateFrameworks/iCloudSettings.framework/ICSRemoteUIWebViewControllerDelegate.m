@interface ICSRemoteUIWebViewControllerDelegate
- (void)remoteUIWebViewController:(id)a3 dismissWithPayload:(id)a4;
@end

@implementation ICSRemoteUIWebViewControllerDelegate

- (void)remoteUIWebViewController:(id)a3 dismissWithPayload:(id)a4
{
  if (a4)
  {
    id v5 = a3;
    swift_retain();
    swift_unknownObjectRetain();
    sub_262B04918();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    id v6 = a3;
    swift_retain();
  }
  if (qword_26B422A10 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_262B02DF8();
  __swift_project_value_buffer(v7, (uint64_t)qword_26B422A88);
  v8 = sub_262B02DD8();
  os_log_type_t v9 = sub_262B047C8();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_262993000, v8, v9, "ICSRemoteUIWebViewControllerDelegate dismissing", v10, 2u);
    MEMORY[0x263E5C600](v10, -1, -1);
  }

  sub_262B032A8();
  swift_release();
  sub_2629F23F8((uint64_t)v11, &qword_26B422A70);
}

@end