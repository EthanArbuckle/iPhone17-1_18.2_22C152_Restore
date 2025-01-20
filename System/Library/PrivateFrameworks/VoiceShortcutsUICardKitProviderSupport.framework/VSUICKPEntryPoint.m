@interface VSUICKPEntryPoint
- (NSString)providerIdentifier;
- (id)cardViewControllerForCard:(id)a3;
- (unint64_t)displayPriorityForCard:(id)a3;
@end

@implementation VSUICKPEntryPoint

- (unint64_t)displayPriorityForCard:(id)a3
{
  v3 = [a3 interactions];
  v4 = [v3 anyObject];
  unint64_t v5 = 2 * (v4 != 0);

  return v5;
}

- (id)cardViewControllerForCard:(id)a3
{
  id v3 = a3;
  v4 = [v3 interactions];
  unint64_t v5 = [v4 anyObject];

  if (!v5)
  {
    v14 = 0;
    goto LABEL_20;
  }
  id v6 = v3;
  v7 = [v6 interactions];
  v8 = [v7 anyObject];

  v9 = [v8 intent];
  v10 = [v9 _metadata];
  if (!v9) {
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && [v10 executionContext] != 2
    && [v10 executionContext] != 9)
  {
    if ([v6 asynchronous])
    {
      id v12 = v6;
      goto LABEL_8;
    }
    if ([v10 executionContext] == 1 || (objc_msgSend(v10, "hasExecutionContext") & 1) == 0)
    {
      v11 = VSUIAsyncLoadingCard;
      goto LABEL_7;
    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  v11 = VSUIVoiceShortcutCard;
LABEL_7:
  id v12 = (id)[[v11 alloc] initWithCard:v6];
LABEL_8:
  v13 = v12;
LABEL_15:

  v15 = [v6 interactions];
  v16 = [v15 anyObject];

  v17 = [v16 intent];
  uint64_t v18 = [v17 _intentCategory];

  v19 = (Class *)0x263F31600;
  if (v13) {
    id v6 = v13;
  }
  if (v18 != 1) {
    v19 = (Class *)off_2649FBF88;
  }
  v14 = (void *)[objc_alloc(*v19) _initWithCard:v6 delegate:0 loadProvidersImmediately:0];

LABEL_20:
  return v14;
}

- (NSString)providerIdentifier
{
  return (NSString *)@"com.apple.cards.VoiceShortcutsUICardKitProvider";
}

@end