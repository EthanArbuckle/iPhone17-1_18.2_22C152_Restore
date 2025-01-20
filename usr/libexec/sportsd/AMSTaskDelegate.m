@interface AMSTaskDelegate
- (_TtC7sportsdP33_A8771DFE83AFD6B69A2F0EF64D464ABD15AMSTaskDelegate)init;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
@end

@implementation AMSTaskDelegate

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_10004E290((uint64_t)v8, v9, v10);
}

- (_TtC7sportsdP33_A8771DFE83AFD6B69A2F0EF64D464ABD15AMSTaskDelegate)init
{
  return (_TtC7sportsdP33_A8771DFE83AFD6B69A2F0EF64D464ABD15AMSTaskDelegate *)sub_10004E6D0();
}

@end