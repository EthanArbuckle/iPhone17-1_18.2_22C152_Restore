@interface SSAppPurchaseHistoryAccount
+ (id)databaseTable;
@end

@implementation SSAppPurchaseHistoryAccount

+ (id)databaseTable
{
  return @"app_purchase_history_accounts";
}

@end