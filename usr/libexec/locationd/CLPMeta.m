@interface CLPMeta
+ (BOOL)isInCountry:(id)a3;
+ (BOOL)isInIndia;
+ (id)meta;
+ (void)updateRegulatoryDomainEstimates;
@end

@implementation CLPMeta

+ (BOOL)isInCountry:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [[+[CLPMeta meta](CLPMeta, "meta") regulatoryDomainEstimates];
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v8), "countryCode"), "isEqualToString:", a3))
        {
          LOBYTE(v5) = 1;
          return (char)v5;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      id v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }
  return (char)v5;
}

+ (BOOL)isInIndia
{
  return +[CLPMeta isInCountry:@"IN"];
}

+ (id)meta
{
  if (qword_102487970 != -1) {
    dispatch_once(&qword_102487970, &stru_102324838);
  }
  return (id)qword_102487968;
}

+ (void)updateRegulatoryDomainEstimates
{
  id v2 = +[CLPMeta meta];
  [v2 clearRegulatoryDomainEstimates];
  id v3 = +[RDEstimate currentEstimates];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        id v9 = objc_alloc_init((Class)CLPRegulatoryDomainEstimate);
        [v9 setCountryCode:[v8 countryCode]];
        [v9 setIsInDisputedArea:[v8 isInDisputedArea]];
        [v2 addRegulatoryDomainEstimates:v9];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

@end