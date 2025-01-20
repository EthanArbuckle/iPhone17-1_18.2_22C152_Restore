@interface ICQRemoteExtensionHost
- (ICQRemoteExtensionHost)init;
- (void)dismissViewControllerWithError:(id)a3;
- (void)presentRemoteViewControllerWithContext:(id)a3 presentingViewController:(id)a4 completion:(id)a5;
@end

@implementation ICQRemoteExtensionHost

- (void)presentRemoteViewControllerWithContext:(id)a3 presentingViewController:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = sub_22C9A3618();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  id v11 = a4;
  v10 = self;
  sub_22C8EB86C(v8, v11, (uint64_t)sub_22C8ECBD0, v9);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)dismissViewControllerWithError:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_22C8EBF60(a3);
}

- (ICQRemoteExtensionHost)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQRemoteExtensionHost_presentingVC) = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICQRemoteExtensionHost_flowCompletion);
  v4 = (objc_class *)type metadata accessor for RemoteExtensionHost();
  void *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return [(ICQRemoteExtensionHost *)&v6 init];
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICQRemoteExtensionHost_flowCompletion);
  sub_22C8CD4A0(v3);
}

@end