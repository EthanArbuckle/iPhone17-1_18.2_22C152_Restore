@interface WFEntityPickerHostingControllerFactory
+ (id)makeHostingController:(id)a3 maxRows:(int64_t)a4 tapHandler:(id)a5;
- (WFEntityPickerHostingControllerFactory)init;
@end

@implementation WFEntityPickerHostingControllerFactory

+ (id)makeHostingController:(id)a3 maxRows:(int64_t)a4 tapHandler:(id)a5
{
  v7 = _Block_copy(a5);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  id v9 = a3;
  id v10 = sub_22DBCB3B4(v9, a4, (uint64_t)sub_22DBCB964, v8);

  swift_release();
  return v10;
}

- (WFEntityPickerHostingControllerFactory)init
{
  return (WFEntityPickerHostingControllerFactory *)sub_22DBCB870();
}

@end