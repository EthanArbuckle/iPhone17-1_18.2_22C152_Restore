@interface MarketingEngagementSheetHandler
- (BOOL)engagementViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5;
- (_TtC9SeymourUI31MarketingEngagementSheetHandler)init;
- (void)engagementViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5;
@end

@implementation MarketingEngagementSheetHandler

- (_TtC9SeymourUI31MarketingEngagementSheetHandler)init
{
  result = (_TtC9SeymourUI31MarketingEngagementSheetHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)engagementViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v11 = a5;
  v10 = self;
  sub_239CD2568(v11);
}

- (BOOL)engagementViewController:(id)a3 handleDynamicDelegateAction:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  LOBYTE(self) = sub_239CD2870();
  _Block_release(v8);

  return self & 1;
}

@end