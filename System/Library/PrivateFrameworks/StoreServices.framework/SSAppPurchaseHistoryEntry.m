@interface SSAppPurchaseHistoryEntry
+ (id)databaseTable;
+ (id)disambiguatedSQLForProperty:(id)a3;
+ (id)predicateForAccountIdentifier:(id)a3;
+ (id)predicateForHasMessagesExtension;
+ (id)predicateForIs32BitOnly:(BOOL)a3;
+ (id)predicateForNotFirstParty;
+ (id)predicateForNotHidden;
+ (id)supportsPlatformPredicate:(BOOL)a3;
@end

@implementation SSAppPurchaseHistoryEntry

+ (id)databaseTable
{
  return @"app_purchase_history";
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  v5 = @"IFNULL(app_purchase_history.is_first_party, 0)";
  if (([a3 isEqualToString:@"IFNULL(app_purchase_history.is_first_party, 0)"] & 1) == 0)
  {
    v5 = @"IFNULL(app_purchase_history.is_preorder, 0)";
    if (([a3 isEqualToString:@"IFNULL(app_purchase_history.is_preorder, 0)"] & 1) == 0)
    {
      v7.receiver = a1;
      v7.super_class = (Class)&OBJC_METACLASS___SSAppPurchaseHistoryEntry;
      return objc_msgSendSuper2(&v7, sel_disambiguatedSQLForProperty_, a3);
    }
  }
  return v5;
}

+ (id)supportsPlatformPredicate:(BOOL)a3
{
  if (a3) {
    v3 = @"supports_ipad";
  }
  else {
    v3 = @"supports_iphone";
  }
  uint64_t v4 = [NSNumber numberWithBool:1];
  return +[SSSQLiteComparisonPredicate predicateWithProperty:v3 equalToValue:v4];
}

+ (id)predicateForAccountIdentifier:(id)a3
{
  return +[SSSQLiteComparisonPredicate predicateWithProperty:@"account_unique_identifier" equalToValue:a3];
}

+ (id)predicateForNotFirstParty
{
  return +[SSSQLiteComparisonPredicate predicateWithProperty:@"IFNULL(app_purchase_history.is_first_party, 0)" equalToLongLong:0];
}

+ (id)predicateForNotHidden
{
  uint64_t v2 = [NSNumber numberWithBool:0];
  return +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_hidden" equalToValue:v2];
}

+ (id)predicateForHasMessagesExtension
{
  uint64_t v2 = [NSNumber numberWithBool:1];
  return +[SSSQLiteComparisonPredicate predicateWithProperty:@"has_messages_extension" equalToValue:v2];
}

+ (id)predicateForIs32BitOnly:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  return +[SSSQLiteComparisonPredicate predicateWithProperty:@"is_32_bit_only" equalToValue:v3];
}

@end