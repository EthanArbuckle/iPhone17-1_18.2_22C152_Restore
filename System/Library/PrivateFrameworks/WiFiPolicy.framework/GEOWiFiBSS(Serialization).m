@interface GEOWiFiBSS(Serialization)
+ (uint64_t)supportsSecureCoding;
- (BOOL)_hasAttribute:()Serialization;
- (double)latitude;
- (double)longitude;
- (id)BSSID;
- (id)dictionaryRepresentation;
- (id)popularityScore;
- (id)qualityScore;
- (uint64_t)isEdge;
- (uint64_t)isTCPGood;
- (void)encodeWithCoder:()Serialization;
@end

@implementation GEOWiFiBSS(Serialization)

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:()Serialization
{
  id v9 = a3;
  objc_msgSend(v9, "encodeBool:forKey:", objc_msgSend(a1, "isEdge"), @"edge");
  v4 = [a1 BSSID];
  [v9 encodeObject:v4 forKey:@"bssid"];

  [a1 latitude];
  objc_msgSend(v9, "encodeDouble:forKey:", @"latitude");
  [a1 longitude];
  objc_msgSend(v9, "encodeDouble:forKey:", @"longitude");
  v5 = [a1 popularityScore];

  if (v5)
  {
    v6 = [a1 popularityScore];
    objc_msgSend(v9, "encodeInt64:forKey:", objc_msgSend(v6, "score"), @"popularityScoreValue");
  }
  else
  {
    [v9 encodeInt64:0 forKey:@"popularityScoreValue"];
  }
  v7 = [a1 qualityScore];

  if (v7)
  {
    v8 = [a1 qualityScore];
    objc_msgSend(v9, "encodeInt64:forKey:", objc_msgSend(v8, "score"), @"qualityScoreValue");
  }
  else
  {
    [v9 encodeInt64:0 forKey:@"qualityScoreValue"];
  }
}

- (id)dictionaryRepresentation
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isEdge"));
  [v2 setObject:v3 forKey:@"edge"];

  v4 = [a1 BSSID];

  if (v4)
  {
    v5 = [a1 BSSID];
    [v2 setObject:v5 forKey:@"bssid"];
  }
  v6 = NSNumber;
  [a1 latitude];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  [v2 setObject:v7 forKey:@"latitude"];

  v8 = NSNumber;
  [a1 longitude];
  id v9 = objc_msgSend(v8, "numberWithDouble:");
  [v2 setObject:v9 forKey:@"longitude"];

  v10 = [a1 popularityScore];

  if (v10)
  {
    v11 = NSNumber;
    v12 = [a1 popularityScore];
    v13 = objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "score"));
    [v2 setObject:v13 forKey:@"popularityScoreValue"];
  }
  v14 = [a1 qualityScore];

  if (v14)
  {
    v15 = NSNumber;
    v16 = [a1 qualityScore];
    v17 = objc_msgSend(v15, "numberWithUnsignedInteger:", objc_msgSend(v16, "score"));
    [v2 setObject:v17 forKey:@"qualityScoreValue"];
  }

  return v2;
}

- (double)latitude
{
  if ([a1 hasLatLngE7])
  {
    v2 = [a1 latLngE7];
    double v3 = (double)(int)[v2 latE7] / 10000000.0;
  }
  else
  {
    v2 = [a1 location];
    [v2 lat];
    double v3 = v4;
  }

  return v3;
}

- (double)longitude
{
  if ([a1 hasLatLngE7])
  {
    v2 = [a1 latLngE7];
    double v3 = (double)(int)[v2 lngE7] / 10000000.0;
  }
  else
  {
    v2 = [a1 location];
    [v2 lng];
    double v3 = v4;
  }

  return v3;
}

- (id)BSSID
{
  if ([a1 hasUniqueIdentifier])
  {
    v2 = TBMacAdressFromLong([a1 uniqueIdentifier]);
  }
  else
  {
    double v3 = [a1 identifier];
    v2 = [v3 lowercaseString];
  }

  return v2;
}

- (id)popularityScore
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [a1 qualities];

  if (!v2) {
    goto LABEL_19;
  }
  double v3 = [a1 qualities];
  v2 = [v3 firstObject];

  double v4 = [a1 qualities];
  unint64_t v5 = [v4 count];

  if (v5 >= 2) {
    NSLog(&cfstr_SMulitpleQuali.isa, "-[GEOWiFiBSS(Serialization) popularityScore]");
  }
  if ([v2 qualitiesCount])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = [v2 qualities];
    v7 = (void *)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v10 type] == 1)
          {
            v7 = +[TBPopularityScore popularityScoreWithValue:](TBPopularityScore, "popularityScoreWithValue:", [v10 score]);
            goto LABEL_15;
          }
        }
        v7 = (void *)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
LABEL_19:
    v7 = 0;
  }

  return v7;
}

- (id)qualityScore
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [a1 qualities];

  if (!v2) {
    goto LABEL_19;
  }
  double v3 = [a1 qualities];
  v2 = [v3 firstObject];

  double v4 = [a1 qualities];
  unint64_t v5 = [v4 count];

  if (v5 >= 2) {
    NSLog(&cfstr_SMulitpleQuali.isa, "-[GEOWiFiBSS(Serialization) qualityScore]");
  }
  if ([v2 qualitiesCount])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = [v2 qualities];
    v7 = (void *)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v10 type] == 2)
          {
            v7 = +[TBQualityScore qualityScoreWithValue:](TBQualityScore, "qualityScoreWithValue:", [v10 score]);
            goto LABEL_15;
          }
        }
        v7 = (void *)[v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  else
  {
LABEL_19:
    v7 = 0;
  }

  return v7;
}

- (uint64_t)isEdge
{
  return [a1 _hasAttribute:1];
}

- (uint64_t)isTCPGood
{
  return 0;
}

- (BOOL)_hasAttribute:()Serialization
{
  if (![a1 attributes] || !objc_msgSend(a1, "attributesCount")) {
    return 0;
  }
  unint64_t v5 = 0;
  do
  {
    int v6 = [a1 attributesAtIndex:v5];
    BOOL v7 = v6 == a3;
    if (v6 == a3) {
      break;
    }
    ++v5;
  }
  while ([a1 attributesCount] > v5);
  return v7;
}

@end