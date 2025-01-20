@interface VSUIAsyncLoadingCard
- (BOOL)asynchronous;
- (VSUIAsyncLoadingCard)initWithCard:(id)a3;
- (void)loadCardWithCompletion:(id)a3;
@end

@implementation VSUIAsyncLoadingCard

- (VSUIAsyncLoadingCard)initWithCard:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VSUIAsyncLoadingCard;
  v6 = [(CRBasicCard *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storedCard, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)asynchronous
{
  return 1;
}

- (void)loadCardWithCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end