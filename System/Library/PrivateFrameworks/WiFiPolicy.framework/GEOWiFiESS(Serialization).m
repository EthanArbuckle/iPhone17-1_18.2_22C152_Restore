@interface GEOWiFiESS(Serialization)
+ (uint64_t)supportsSecureCoding;
- (BOOL)_hasAttribute:()Serialization;
- (id)accessPoints;
- (id)attributesDescription;
- (id)authDescription;
- (id)dictionaryRepresentation;
- (id)popularityScore;
- (id)qualityScore;
- (id)remoteIdentifier;
- (uint64_t)accessPointCount;
- (uint64_t)authMask;
- (uint64_t)isCaptive;
- (uint64_t)isLowQuality;
- (uint64_t)isMoving;
- (uint64_t)isPublic;
- (uint64_t)isSuspicious;
- (uint64_t)type;
- (void)encodeWithCoder:()Serialization;
@end

@implementation GEOWiFiESS(Serialization)

+ (uint64_t)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:()Serialization
{
  id v13 = a3;
  objc_msgSend(v13, "encodeBool:forKey:", objc_msgSend(a1, "isMoving"), @"moving");
  objc_msgSend(v13, "encodeBool:forKey:", objc_msgSend(a1, "isCaptive"), @"captive");
  objc_msgSend(v13, "encodeBool:forKey:", objc_msgSend(a1, "isSuspicious"), @"suspicious");
  objc_msgSend(v13, "encodeBool:forKey:", objc_msgSend(a1, "isPublic"), @"public");
  v4 = [a1 name];
  [v13 encodeObject:v4 forKey:@"name"];

  v5 = [a1 identifier];
  [v13 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v13, "encodeInt64:forKey:", objc_msgSend(a1, "authMask"), @"authMask");
  objc_msgSend(v13, "encodeInt64:forKey:", objc_msgSend(a1, "tileKey"), @"tileKey");
  v6 = [a1 popularityScore];

  if (v6)
  {
    v7 = [a1 popularityScore];
    objc_msgSend(v13, "encodeInt64:forKey:", objc_msgSend(v7, "score"), @"popularityScoreValue");
  }
  else
  {
    [v13 encodeInt64:0 forKey:@"popularityScoreValue"];
  }
  v8 = [a1 qualityScore];

  if (v8)
  {
    v9 = [a1 qualityScore];
    objc_msgSend(v13, "encodeInt64:forKey:", objc_msgSend(v9, "score"), @"qualityScoreValue");
  }
  else
  {
    [v13 encodeInt64:0 forKey:@"qualityScoreValue"];
  }
  v10 = [a1 accessPoints];
  [v13 encodeObject:v10 forKey:@"accessPoints"];

  v11 = [a1 ownerIdentifiers];

  if (v11)
  {
    v12 = [a1 ownerIdentifiers];
    [v13 encodeObject:v12 forKey:@"ownerIdentifiers"];
  }
  objc_msgSend(v13, "encodeInt32:forKey:", objc_msgSend(a1, "venueType"), @"venueType");
  objc_msgSend(v13, "encodeInteger:forKey:", (int)objc_msgSend(a1, "venueGroup"), @"venueGroup");
  objc_msgSend(v13, "encodeInteger:forKey:", objc_msgSend(a1, "type"), @"type");
}

- (id)dictionaryRepresentation
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isMoving"));
  [v2 setObject:v3 forKey:@"moving"];

  v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isCaptive"));
  [v2 setObject:v4 forKey:@"captive"];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isSuspicious"));
  [v2 setObject:v5 forKey:@"suspicious"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isPublic"));
  [v2 setObject:v6 forKey:@"public"];

  v7 = [a1 name];

  if (v7)
  {
    v8 = [a1 name];
    [v2 setObject:v8 forKey:@"name"];
  }
  v9 = [a1 identifier];

  if (v9)
  {
    v10 = [a1 identifier];
    [v2 setObject:v10 forKey:@"identifier"];
  }
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "authMask"));
  [v2 setObject:v11 forKey:@"authMask"];

  v12 = [a1 popularityScore];

  if (v12)
  {
    id v13 = NSNumber;
    v14 = [a1 popularityScore];
    v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "score"));
    [v2 setObject:v15 forKey:@"popularityScoreValue"];
  }
  v16 = [a1 qualityScore];

  if (v16)
  {
    v17 = NSNumber;
    v18 = [a1 qualityScore];
    v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "score"));
    [v2 setObject:v19 forKey:@"qualityScoreValue"];
  }
  v20 = [a1 accessPoints];

  if (v20)
  {
    v21 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v22 = objc_msgSend(a1, "accessPoints", 0);
    uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dictionaryRepresentation];
          [v21 addObject:v27];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v24);
    }

    [v2 setObject:v21 forKey:@"accessPoints"];
  }
  v28 = [a1 ownerIdentifiers];

  if (v28)
  {
    v29 = [a1 ownerIdentifiers];
    [v2 setObject:v29 forKey:@"ownerIdentifiers"];
  }
  v30 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "venueType"));
  [v2 setObject:v30 forKey:@"venueType"];

  v31 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a1, "venueGroup"));
  [v2 setObject:v31 forKey:@"venueGroup"];

  v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "type"));
  [v2 setObject:v32 forKey:@"type"];

  return v2;
}

- (uint64_t)authMask
{
  if (![a1 authTraitsCount] || !objc_msgSend(a1, "authTraitsCount")) {
    return 0;
  }
  unint64_t v2 = 0;
  uint64_t v3 = 0;
  do
  {
    switch([a1 authTraitsAtIndex:v2])
    {
      case 1u:
        v3 |= 1uLL;
        break;
      case 2u:
        v3 |= 2uLL;
        break;
      case 3u:
        v3 |= 4uLL;
        break;
      case 4u:
        v3 |= 8uLL;
        break;
      default:
        break;
    }
    ++v2;
  }
  while (v2 < [a1 authTraitsCount]);
  return v3;
}

- (id)authDescription
{
  if ([a1 authTraitsCount])
  {
    unint64_t v2 = [MEMORY[0x1E4F28E78] string];
    if ([a1 authTraitsCount])
    {
      unint64_t v3 = 0;
      do
      {
        v4 = NSString;
        v5 = objc_msgSend(a1, "authTraitsAsString:", objc_msgSend(a1, "authTraitsAtIndex:", v3));
        v6 = [v4 stringWithFormat:@"%@", v5];
        [v2 appendString:v6];

        if (v3 < [a1 authTraitsCount] - 1) {
          [v2 appendString:@", "];
        }
        ++v3;
      }
      while (v3 < [a1 authTraitsCount]);
    }
  }
  else
  {
    unint64_t v2 = 0;
  }

  return v2;
}

- (id)attributesDescription
{
  if ([a1 attributesCount])
  {
    unint64_t v2 = [MEMORY[0x1E4F28E78] string];
    if ([a1 attributesCount])
    {
      unint64_t v3 = 0;
      do
      {
        v4 = NSString;
        v5 = objc_msgSend(a1, "attributesAsString:", objc_msgSend(a1, "attributesAtIndex:", v3));
        v6 = [v4 stringWithFormat:@"%@", v5];
        [v2 appendString:v6];

        if (v3 < [a1 attributesCount] - 1) {
          [v2 appendString:@", "];
        }
        ++v3;
      }
      while (v3 < [a1 attributesCount]);
    }
  }
  else
  {
    unint64_t v2 = 0;
  }

  return v2;
}

- (id)remoteIdentifier
{
  if ([a1 hasUniqueIdentifier]) {
    objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(a1, "uniqueIdentifier"));
  }
  else {
  unint64_t v2 = [a1 identifier];
  }

  return v2;
}

- (id)accessPoints
{
  unint64_t v2 = [a1 bss];

  if (v2)
  {
    unint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
    v4 = [a1 bss];
    v5 = [v3 setWithArray:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)popularityScore
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [a1 qualities];

  if (!v2) {
    goto LABEL_19;
  }
  unint64_t v3 = [a1 qualities];
  unint64_t v2 = [v3 firstObject];

  v4 = [a1 qualities];
  unint64_t v5 = [v4 count];

  if (v5 >= 2) {
    NSLog(&cfstr_SMulitpleQuali.isa, "-[GEOWiFiESS(Serialization) popularityScore]");
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
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
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
  unint64_t v2 = [a1 qualities];

  if (!v2) {
    goto LABEL_19;
  }
  unint64_t v3 = [a1 qualities];
  unint64_t v2 = [v3 firstObject];

  v4 = [a1 qualities];
  unint64_t v5 = [v4 count];

  if (v5 >= 2) {
    NSLog(&cfstr_SMulitpleQuali.isa, "-[GEOWiFiESS(Serialization) qualityScore]");
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
        for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
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

- (uint64_t)isCaptive
{
  return [a1 _hasAttribute:1];
}

- (uint64_t)isMoving
{
  return [a1 _hasAttribute:2];
}

- (uint64_t)isSuspicious
{
  return [a1 _hasAttribute:4];
}

- (uint64_t)isPublic
{
  return [a1 _hasAttribute:3];
}

- (uint64_t)isLowQuality
{
  return [a1 _hasAttribute:5];
}

- (uint64_t)type
{
  return (int)[a1 networkType];
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

- (uint64_t)accessPointCount
{
  v1 = [a1 accessPoints];
  uint64_t v2 = [v1 count];

  return v2;
}

@end