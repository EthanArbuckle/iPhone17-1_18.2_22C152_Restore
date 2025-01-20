@interface PGFilterMatchingPublicEvents
@end

@implementation PGFilterMatchingPublicEvents

uint64_t ___PGFilterMatchingPublicEvents_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "muid"));
  v9 = [v7 objectForKeyedSubscript:v8];

  v10 = *(void **)(a1 + 32);
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "muid"));
  v12 = [v10 objectForKeyedSubscript:v11];

  if ([v9 compare:v12])
  {
    uint64_t v13 = [v9 compare:v12];
  }
  else
  {
    v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "muid"));
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "muid"));
    uint64_t v13 = [v14 compare:v15];
  }
  return v13;
}

@end