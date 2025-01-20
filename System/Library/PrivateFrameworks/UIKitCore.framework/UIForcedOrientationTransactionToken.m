@interface UIForcedOrientationTransactionToken
@end

@implementation UIForcedOrientationTransactionToken

void __78___UIForcedOrientationTransactionToken_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = [*(id *)(a1 + 40) state];
  if (v3 > 2) {
    v4 = @"unknown";
  }
  else {
    v4 = off_1E52FA3B8[v3];
  }
  [v2 appendString:v4 withName:@"state"];
  id v5 = (id)objc_msgSend(*(id *)(a1 + 32), "ui_appendInterfaceOrientation:withName:", objc_msgSend(*(id *)(a1 + 40), "originalInterfaceOrientation"), @"originalOrientation");
  v6 = *(void **)(a1 + 32);
  v7 = [*(id *)(a1 + 40) transactionReason];
  [v6 appendString:v7 withName:@"reason"];

  v8 = *(void **)(a1 + 32);
  id v14 = [*(id *)(a1 + 40) transactionHandler];
  if (v14)
  {
    v9 = NSString;
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = [v9 stringWithFormat:@"<%@: %p>", v11, v14];
  }
  else
  {
    v12 = @"(nil)";
  }
  id v13 = (id)[v8 appendObject:v12 withName:@"handler"];
}

@end