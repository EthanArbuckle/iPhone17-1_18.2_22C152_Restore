@interface WFSiriApplicationContextProvider
- (id)currentUserInterfaceTypeForWFApplicationContext:(id)a3;
@end

@implementation WFSiriApplicationContextProvider

- (id)currentUserInterfaceTypeForWFApplicationContext:(id)a3
{
  return WFUserInterfaceTypeSiri;
}

@end