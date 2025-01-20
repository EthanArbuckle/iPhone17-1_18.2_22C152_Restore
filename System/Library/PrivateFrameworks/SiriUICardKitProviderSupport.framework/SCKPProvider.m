@interface SCKPProvider
- (NSString)providerIdentifier;
- (SCKPProvider)init;
- (void)requestCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5;
- (void)requestIdentifiedCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5;
@end

@implementation SCKPProvider

- (SCKPProvider)init
{
  v4.receiver = self;
  v4.super_class = (Class)SCKPProvider;
  v2 = [(SCKPProvider *)&v4 init];
  if (v2 && init_onceToken != -1) {
    dispatch_once(&init_onceToken, &__block_literal_global);
  }
  return v2;
}

uint64_t __20__SCKPProvider_init__block_invoke()
{
  return +[CRKCardSectionViewController _registerWithCardKit];
}

- (void)requestCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__SCKPProvider_requestCardSectionViewProviderForCard_delegate_reply___block_invoke;
  v10[3] = &unk_26484DE40;
  id v11 = v8;
  id v9 = v8;
  [(SCKPProvider *)self requestIdentifiedCardSectionViewProviderForCard:a3 delegate:a4 reply:v10];
}

uint64_t __69__SCKPProvider_requestCardSectionViewProviderForCard_delegate_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestIdentifiedCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5
{
  if (a5)
  {
    v6 = (void (**)(id, void, SCKPCardSectionViewProvider *))a5;
    id v7 = a3;
    id v8 = [[SCKPCardSectionViewProvider alloc] initWithCard:v7];

    v6[2](v6, 0, v8);
  }
}

- (NSString)providerIdentifier
{
  return (NSString *)@"com.apple.cards.SiriUICardKitProvider";
}

@end