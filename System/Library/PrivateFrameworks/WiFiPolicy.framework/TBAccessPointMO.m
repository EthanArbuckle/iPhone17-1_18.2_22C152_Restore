@interface TBAccessPointMO
+ (BOOL)supportsSecureCoding;
+ (id)entityName;
+ (id)fetchRequest;
+ (id)generateNewAccessPointObjectFromMOC:(id)a3;
+ (void)removeAllAccessPointsInMOC:(id)a3;
- (TBAccessPointMO)initWithCoder:(id)a3;
- (TBScore)popularityScore;
- (TBScore)qualityScore;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TBAccessPointMO

+ (id)entityName
{
  return @"AccessPoint";
}

- (TBScore)qualityScore
{
  uint64_t v2 = (int)[(TBAccessPointMO *)self qualityScoreValue];

  return (TBScore *)+[TBQualityScore qualityScoreWithValue:v2];
}

- (TBScore)popularityScore
{
  uint64_t v2 = (int)[(TBAccessPointMO *)self popularityScoreValue];

  return (TBScore *)+[TBPopularityScore popularityScoreWithValue:v2];
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = objc_msgSend(NSNumber, "numberWithBool:", -[TBAccessPointMO edge](self, "edge"));
  [v3 setObject:v4 forKey:@"edge"];

  v5 = [(TBAccessPointMO *)self BSSID];

  if (v5)
  {
    v6 = [(TBAccessPointMO *)self BSSID];
    [v3 setObject:v6 forKey:@"bssid"];
  }
  v7 = NSNumber;
  [(TBAccessPointMO *)self latitude];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  [v3 setObject:v8 forKey:@"latitude"];

  v9 = NSNumber;
  [(TBAccessPointMO *)self longitude];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  [v3 setObject:v10 forKey:@"longitude"];

  v11 = [(TBAccessPointMO *)self popularityScore];

  if (v11)
  {
    v12 = NSNumber;
    v13 = [(TBAccessPointMO *)self popularityScore];
    v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "score"));
    [v3 setObject:v14 forKey:@"popularityScoreValue"];
  }
  v15 = [(TBAccessPointMO *)self qualityScore];

  if (v15)
  {
    v16 = NSNumber;
    v17 = [(TBAccessPointMO *)self qualityScore];
    v18 = objc_msgSend(v16, "numberWithUnsignedInteger:", objc_msgSend(v17, "score"));
    [v3 setObject:v18 forKey:@"qualityScoreValue"];
  }

  return v3;
}

- (TBAccessPointMO)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TBAccessPointMO;
  return [(TBAccessPointMO *)&v4 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[TBAccessPointMO edge](self, "edge"), @"edge");
  objc_msgSend(v5, "encodeBool:forKey:", -[TBAccessPointMO tcpGood](self, "tcpGood"), @"tcpGood");
  objc_super v4 = [(TBAccessPointMO *)self bssid];
  [v5 encodeObject:v4 forKey:@"bssid"];

  [(TBAccessPointMO *)self latitude];
  objc_msgSend(v5, "encodeDouble:forKey:", @"latitude");
  [(TBAccessPointMO *)self longitude];
  objc_msgSend(v5, "encodeDouble:forKey:", @"longitude");
  objc_msgSend(v5, "encodeInt32:forKey:", -[TBAccessPointMO popularityScoreValue](self, "popularityScoreValue"), @"popularityScoreValue");
  objc_msgSend(v5, "encodeInt32:forKey:", -[TBAccessPointMO qualityScoreValue](self, "qualityScoreValue"), @"qualityScoreValue");
}

+ (id)generateNewAccessPointObjectFromMOC:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__9;
  v14 = __Block_byref_object_dispose__9;
  id v15 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__TBAccessPointMO_generateNewAccessPointObjectFromMOC___block_invoke;
  v7[3] = &unk_1E69BD558;
  v9 = &v10;
  id v4 = v3;
  id v8 = v4;
  [v4 performBlockAndWait:v7];
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

void __55__TBAccessPointMO_generateNewAccessPointObjectFromMOC___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1C0A8];
  id v6 = +[TBAccessPointMO entityName];
  uint64_t v3 = [v2 insertNewObjectForEntityForName:v6 inManagedObjectContext:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

+ (void)removeAllAccessPointsInMOC:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = +[TBAccessPointMO fetchRequest];
  id v5 = [v3 executeFetchRequest:v4 error:0];

  if (v5)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(v3, "deleteObject:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }
  }
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"AccessPoint"];
}

@end