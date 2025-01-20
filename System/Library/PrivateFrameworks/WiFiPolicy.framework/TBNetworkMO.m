@interface TBNetworkMO
+ (BOOL)supportsSecureCoding;
+ (id)entityName;
+ (id)fetchRequest;
+ (id)generateNewNetworkObjectFromMOC:(id)a3;
+ (void)removeAllNetworksInMOC:(id)a3;
+ (void)removeNetworksUsingPredicate:(id)a3 moc:(id)a4;
- (NSString)attributesDescription;
- (NSString)authDescription;
- (TBNetworkMO)initWithCoder:(id)a3;
- (TBScore)popularityScore;
- (TBScore)qualityScore;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TBNetworkMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Network"];
}

+ (id)entityName
{
  return @"Network";
}

- (NSString)authDescription
{
  v3 = [MEMORY[0x1E4F28E78] string];
  if ([(TBNetworkMO *)self authMask]) {
    [v3 appendString:@"OPEN "];
  }
  if (([(TBNetworkMO *)self authMask] & 2) != 0) {
    [v3 appendString:@"WEP "];
  }
  if (([(TBNetworkMO *)self authMask] & 4) != 0) {
    [v3 appendString:@"WPA "];
  }
  if (([(TBNetworkMO *)self authMask] & 8) != 0) {
    [v3 appendString:@"EAP "];
  }
  if ([v3 length]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (NSString)attributesDescription
{
  v3 = [MEMORY[0x1E4F28E78] string];
  if ([(TBNetworkMO *)self isPublic]) {
    [v3 appendString:@"isPublic "];
  }
  if ([(TBNetworkMO *)self isMoving]) {
    [v3 appendString:@"isMoving "];
  }
  if ([(TBNetworkMO *)self isSuspicious]) {
    [v3 appendString:@"isSuspicious "];
  }
  if ([(TBNetworkMO *)self isCaptive]) {
    [v3 appendString:@"isCaptive "];
  }
  if ([(TBNetworkMO *)self isLowQuality]) {
    [v3 appendString:@"isLowQuality "];
  }
  if ([v3 length]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

- (TBScore)qualityScore
{
  uint64_t v2 = (int)[(TBNetworkMO *)self qualityScoreValue];

  return (TBScore *)+[TBQualityScore qualityScoreWithValue:v2];
}

- (TBScore)popularityScore
{
  uint64_t v2 = (int)[(TBNetworkMO *)self popularityScoreValue];

  return (TBScore *)+[TBPopularityScore popularityScoreWithValue:v2];
}

- (id)dictionaryRepresentation
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[TBNetworkMO moving](self, "moving"));
  [v3 setObject:v4 forKey:@"moving"];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[TBNetworkMO suspicious](self, "suspicious"));
  [v3 setObject:v5 forKey:@"suspicious"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[TBNetworkMO captive](self, "captive"));
  [v3 setObject:v6 forKey:@"captive"];

  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[TBNetworkMO public](self, "public"));
  [v3 setObject:v7 forKey:@"public"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[TBNetworkMO lowQuality](self, "lowQuality"));
  [v3 setObject:v8 forKey:@"lowQuality"];

  v9 = [(TBNetworkMO *)self name];

  if (v9)
  {
    v10 = [(TBNetworkMO *)self name];
    [v3 setObject:v10 forKey:@"name"];
  }
  v11 = [(TBNetworkMO *)self identifier];

  if (v11)
  {
    v12 = [(TBNetworkMO *)self identifier];
    [v3 setObject:v12 forKey:@"identifier"];
  }
  v13 = objc_msgSend(NSNumber, "numberWithLongLong:", -[TBNetworkMO authMask](self, "authMask"));
  [v3 setObject:v13 forKey:@"authMask"];

  v14 = objc_msgSend(NSNumber, "numberWithLongLong:", -[TBNetworkMO tileKey](self, "tileKey"));
  [v3 setObject:v14 forKey:@"tileKey"];

  v15 = objc_msgSend(NSNumber, "numberWithLongLong:", -[TBNetworkMO timestamp](self, "timestamp"));
  [v3 setObject:v15 forKey:@"timestamp"];

  v16 = [(TBNetworkMO *)self popularityScore];

  if (v16)
  {
    v17 = NSNumber;
    v18 = [(TBNetworkMO *)self popularityScore];
    v19 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "score"));
    [v3 setObject:v19 forKey:@"popularityScoreValue"];
  }
  v20 = [(TBNetworkMO *)self qualityScore];

  if (v20)
  {
    v21 = NSNumber;
    v22 = [(TBNetworkMO *)self qualityScore];
    v23 = objc_msgSend(v21, "numberWithUnsignedInteger:", objc_msgSend(v22, "score"));
    [v3 setObject:v23 forKey:@"qualityScoreValue"];
  }
  v24 = [(TBNetworkMO *)self accessPoints];

  if (v24)
  {
    v25 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v26 = [(TBNetworkMO *)self accessPoints];
    uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [*(id *)(*((void *)&v35 + 1) + 8 * i) dictionaryRepresentation];
          [v25 addObject:v31];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v28);
    }

    [v3 setObject:v25 forKey:@"accessPoints"];
  }
  v32 = [(TBNetworkMO *)self ownerIdentifiers];

  if (v32)
  {
    v33 = [(TBNetworkMO *)self ownerIdentifiers];
    [v3 setObject:v33 forKey:@"ownerIdentifiers"];
  }

  return v3;
}

- (TBNetworkMO)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TBNetworkMO;
  return [(TBNetworkMO *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", -[TBNetworkMO moving](self, "moving"), @"moving");
  objc_msgSend(v8, "encodeBool:forKey:", -[TBNetworkMO captive](self, "captive"), @"captive");
  objc_msgSend(v8, "encodeBool:forKey:", -[TBNetworkMO suspicious](self, "suspicious"), @"suspicious");
  objc_msgSend(v8, "encodeBool:forKey:", -[TBNetworkMO public](self, "public"), @"public");
  objc_msgSend(v8, "encodeBool:forKey:", -[TBNetworkMO lowQuality](self, "lowQuality"), @"lowQuality");
  objc_super v4 = [(TBNetworkMO *)self name];
  [v8 encodeObject:v4 forKey:@"name"];

  v5 = [(TBNetworkMO *)self identifier];
  [v8 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v8, "encodeInt64:forKey:", -[TBNetworkMO authMask](self, "authMask"), @"authMask");
  objc_msgSend(v8, "encodeInt64:forKey:", -[TBNetworkMO tileKey](self, "tileKey"), @"tileKey");
  objc_msgSend(v8, "encodeInt64:forKey:", -[TBNetworkMO timestamp](self, "timestamp"), @"timestamp");
  objc_msgSend(v8, "encodeInt32:forKey:", -[TBNetworkMO popularityScoreValue](self, "popularityScoreValue"), @"popularityScoreValue");
  objc_msgSend(v8, "encodeInt32:forKey:", -[TBNetworkMO qualityScoreValue](self, "qualityScoreValue"), @"qualityScoreValue");
  v6 = [(TBNetworkMO *)self accessPoints];
  [v8 encodeObject:v6 forKey:@"accessPoints"];

  v7 = [(TBNetworkMO *)self ownerIdentifiers];
  [v8 encodeObject:v7 forKey:@"ownerIdentifiers"];

  objc_msgSend(v8, "encodeInt64:forKey:", -[TBNetworkMO type](self, "type"), @"type");
  objc_msgSend(v8, "encodeInt64:forKey:", -[TBNetworkMO venueGroup](self, "venueGroup"), @"venueGroup");
  objc_msgSend(v8, "encodeInt64:forKey:", (int)-[TBNetworkMO venueType](self, "venueType"), @"venueType");
}

+ (id)generateNewNetworkObjectFromMOC:(id)a3
{
  id v3 = a3;
  objc_super v4 = (void *)MEMORY[0x1D9440170]();
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__TBNetworkMO_generateNewNetworkObjectFromMOC___block_invoke;
  v8[3] = &unk_1E69BD558;
  v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [v5 performBlockAndWait:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __47__TBNetworkMO_generateNewNetworkObjectFromMOC___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0A8];
  id v6 = +[TBNetworkMO entityName];
  uint64_t v3 = [v2 insertNewObjectForEntityForName:v6 inManagedObjectContext:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (void)removeNetworksUsingPredicate:(id)a3 moc:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)MEMORY[0x1D9440170]();
  id v8 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Network"];
  [v8 setPredicate:v5];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__TBNetworkMO_removeNetworksUsingPredicate_moc___block_invoke;
  v13[3] = &unk_1E69BCEC8;
  id v10 = v6;
  id v14 = v10;
  id v15 = v9;
  id v11 = v5;
  id v16 = v11;
  id v12 = v9;
  [v10 performBlockAndWait:v13];
}

void __48__TBNetworkMO_removeNetworksUsingPredicate_moc___block_invoke(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x1D9440170]();
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v8 = 0;
  id v5 = (id)[v3 executeRequest:v4 error:&v8];
  id v6 = v8;
  v7 = v6;
  if (v6) {
    NSLog(&cfstr_SError.isa, "+[TBNetworkMO removeNetworksUsingPredicate:moc:]_block_invoke", v6);
  }
  else {
    NSLog(&cfstr_SRemovedNetwor.isa, "+[TBNetworkMO removeNetworksUsingPredicate:moc:]_block_invoke", a1[6]);
  }
}

+ (void)removeAllNetworksInMOC:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1D9440170]();
  id v5 = objc_alloc(MEMORY[0x1E4F1C018]);
  id v6 = +[TBNetworkMO fetchRequest];
  v7 = (void *)[v5 initWithFetchRequest:v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__TBNetworkMO_removeAllNetworksInMOC___block_invoke;
  v10[3] = &unk_1E69BC8B0;
  id v8 = v3;
  id v11 = v8;
  id v12 = v7;
  id v9 = v7;
  [v8 performBlockAndWait:v10];
}

void __38__TBNetworkMO_removeAllNetworksInMOC___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1D9440170]();
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = 0;
  id v5 = (id)[v3 executeRequest:v4 error:&v8];
  id v6 = v8;
  v7 = v6;
  if (v6) {
    NSLog(&cfstr_SError.isa, "+[TBNetworkMO removeAllNetworksInMOC:]_block_invoke", v6);
  }
  else {
    NSLog(&cfstr_SRemovedAllNet.isa, "+[TBNetworkMO removeAllNetworksInMOC:]_block_invoke");
  }
}

@end