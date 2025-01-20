@interface SPCSTopHitResult
- (SPCSTopHitResult)initWithRankingItem:(id)a3 clientData:(id)a4;
- (id)clientData;
@end

@implementation SPCSTopHitResult

- (SPCSTopHitResult)initWithRankingItem:(id)a3 clientData:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SPCSTopHitResult;
  v8 = [(SPTopHitResult *)&v11 initWithRankingItem:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong(&v8->_clientData, a4);
  }

  return v9;
}

- (id)clientData
{
  return self->_clientData;
}

- (void).cxx_destruct
{
}

@end