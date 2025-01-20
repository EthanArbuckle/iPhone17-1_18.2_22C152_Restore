@interface STCoreTransportPayload
+ (id)fetchLastTransportPayloadInContext:(id)a3 ofType:(id)a4 error:(id *)a5;
+ (id)fetchRequestForPayloadsOfType:(id)a3;
+ (id)fetchTransportPayloadContext:(id)a3 withIdentifier:(id)a4 error:(id *)a5;
- (NSArray)destinations;
- (id)description;
- (void)setDestinations:(id)a3;
@end

@implementation STCoreTransportPayload

- (id)description
{
  v3 = NSString;
  v4 = [(STCoreTransportPayload *)self type];
  v5 = [(STCoreTransportPayload *)self destinations];
  v6 = [v3 stringWithFormat:@"%p - TYPE: %@ DEST: %@", self, v4, v5];

  return v6;
}

- (void)setDestinations:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "dictionaryRepresentation", (void)v12);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(STCoreTransportPayload *)self managedObjectOriginal_setDestinations:v5];
}

- (NSArray)destinations
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(STCoreTransportPayload *)self managedObjectOriginal_destinations];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = objc_opt_new();
        objc_msgSend(v10, "updateWithDictionaryRepresentation:", v9, (void)v12);
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

+ (id)fetchRequestForPayloadsOfType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 fetchRequest];
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"type", v4];

  [v5 setPredicate:v6];
  return v5;
}

+ (id)fetchLastTransportPayloadInContext:(id)a3 ofType:(id)a4 error:(id *)a5
{
  uint64_t v6 = [a1 fetchRequestForPayloadsOfType:a4];
  uint64_t v7 = [v6 execute:a5];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 lastObject];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)fetchTransportPayloadContext:(id)a3 withIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a4;
  uint64_t v8 = [a1 fetchRequest];
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"identifier", v7];

  [v8 setPredicate:v9];
  uint64_t v10 = [v8 execute:a5];
  v11 = v10;
  if (v10)
  {
    long long v12 = [v10 firstObject];
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

@end