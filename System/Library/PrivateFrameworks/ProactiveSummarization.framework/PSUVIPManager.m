@interface PSUVIPManager
- (NSSet)emailVIPAddresses;
@end

@implementation PSUVIPManager

- (NSSet)emailVIPAddresses
{
  v2 = (void *)MEMORY[0x26114B190](self, a2);
  v3 = objc_opt_new();
  v4 = [v3 vipManager];
  if ([v4 conformsToProtocol:&unk_27087BED0]) {
    id v5 = (id)[v4 allVIPWaitForResult];
  }
  v6 = [v4 allVIPEmailAddresses];
  v7 = (void *)[v6 copy];
  v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  v10 = v9;

  return (NSSet *)v10;
}

@end