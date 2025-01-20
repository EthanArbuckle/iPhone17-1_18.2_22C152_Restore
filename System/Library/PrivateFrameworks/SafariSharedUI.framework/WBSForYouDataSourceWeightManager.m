@interface WBSForYouDataSourceWeightManager
- (WBSForYouDataSourceWeightManager)initWithKeyValueStore:(id)a3;
- (double)weightForSource:(unint64_t)a3;
- (void)clear;
- (void)downvoteSource:(unint64_t)a3;
@end

@implementation WBSForYouDataSourceWeightManager

- (WBSForYouDataSourceWeightManager)initWithKeyValueStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSForYouDataSourceWeightManager;
  v6 = [(WBSForYouDataSourceWeightManager *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = v7;
  }

  return v7;
}

- (void)downvoteSource:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    v4 = @"bookmarks";
  }
  else {
    v4 = off_1E5E428A8[a3 - 1];
  }
  id v5 = [(WBSDictionaryKeyValueStore *)self->_store dictionaryForKey:@"ForYouDataSourceWeights"];
  id v10 = (id)[v5 mutableCopy];

  v6 = v10;
  if (!v10)
  {
    v6 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v11 = v6;
  v7 = objc_msgSend(v6, "safari_numberForKey:", v4);
  uint64_t v8 = [v7 integerValue];

  v9 = [NSNumber numberWithInteger:v8 + 1];
  [v11 setObject:v9 forKey:v4];

  [(WBSDictionaryKeyValueStore *)self->_store setObject:v11 forKey:@"ForYouDataSourceWeights"];
}

- (double)weightForSource:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    v3 = @"bookmarks";
  }
  else {
    v3 = off_1E5E428A8[a3 - 1];
  }
  v4 = [(WBSDictionaryKeyValueStore *)self->_store dictionaryForKey:@"ForYouDataSourceWeights"];
  id v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "safari_numberForKey:", v3);
    uint64_t v7 = [v6 integerValue];

    double v8 = exp((double)-v7 * 1.61803);
  }
  else
  {
    double v8 = 1.0;
  }

  return v8;
}

- (void)clear
{
}

- (void).cxx_destruct
{
}

@end