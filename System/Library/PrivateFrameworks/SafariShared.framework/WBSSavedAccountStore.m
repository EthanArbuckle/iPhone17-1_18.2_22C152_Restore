@interface WBSSavedAccountStore
@end

@implementation WBSSavedAccountStore

uint64_t __77__WBSSavedAccountStore_SafariSharedExtras__numberOfSavedAccountsToBeExported__block_invoke(uint64_t a1, void *a2)
{
  return [a2 canBeExportedToPasswordsCSVFile];
}

@end