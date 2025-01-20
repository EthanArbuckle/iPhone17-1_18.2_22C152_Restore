@interface UIStoreResponseDelegate
- (_TtC10PodcastsUI23UIStoreResponseDelegate)init;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6;
- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6;
@end

@implementation UIStoreResponseDelegate

- (void)AMSURLSession:(id)a3 task:(id)a4 handleDialogRequest:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  sub_1E3C8DB34(v14, (uint64_t)sub_1E3C8E01C, v11, (uint64_t)&unk_1F3F4AB18, (uint64_t)sub_1E3C8E13C, (uint64_t)&block_descriptor_26);

  swift_release();
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleEngagementRequest:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  sub_1E3C8DB34(v14, (uint64_t)sub_1E3C8E198, v11, (uint64_t)&unk_1F3F4AAA0, (uint64_t)sub_1E3C8E07C, (uint64_t)&block_descriptor_4);

  swift_release();
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v15 = self;
  sub_1E3C8DB34(v14, (uint64_t)sub_1E3C8E198, v11, (uint64_t)&unk_1F3F4AB90, (uint64_t)sub_1E3C8E18C, (uint64_t)&block_descriptor_35);

  swift_release();
}

- (_TtC10PodcastsUI23UIStoreResponseDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UIStoreResponseDelegate();
  return [(UIStoreResponseDelegate *)&v3 init];
}

@end