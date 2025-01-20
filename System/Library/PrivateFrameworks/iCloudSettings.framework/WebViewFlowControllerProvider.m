@interface WebViewFlowControllerProvider
- (_TtC14iCloudSettings29WebViewFlowControllerProvider)init;
- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5;
@end

@implementation WebViewFlowControllerProvider

- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_262AA52C4(a5);
}

- (_TtC14iCloudSettings29WebViewFlowControllerProvider)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14iCloudSettings29WebViewFlowControllerProvider_webViewController) = 0;
  *(void *)&self->webViewController[OBJC_IVAR____TtC14iCloudSettings29WebViewFlowControllerProvider_flowCompletionDelegate] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for WebViewFlowControllerProvider();
  return [(WebViewFlowControllerProvider *)&v4 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings29WebViewFlowControllerProvider_webViewController));
  v3 = (char *)self + OBJC_IVAR____TtC14iCloudSettings29WebViewFlowControllerProvider_flowCompletionDelegate;

  sub_262A4A318((uint64_t)v3);
}

@end