@interface VSUIPerformActionCardProvider
- (NSString)providerIdentifier;
- (id)cardViewControllerForCard:(id)a3;
- (unint64_t)displayPriorityForCard:(id)a3;
@end

@implementation VSUIPerformActionCardProvider

- (NSString)providerIdentifier
{
  return (NSString *)@"com.apple.cards.VoiceShortcutsUICardKitProvider.VSUIPerformActionCardProvider";
}

- (id)cardViewControllerForCard:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = [[VSUIProgressCardViewController alloc] _initWithCard:v3 delegate:0 loadProvidersImmediately:0];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (unint64_t)displayPriorityForCard:(id)a3
{
  return 2;
}

@end