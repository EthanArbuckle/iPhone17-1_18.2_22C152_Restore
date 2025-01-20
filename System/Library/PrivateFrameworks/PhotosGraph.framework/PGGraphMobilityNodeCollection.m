@interface PGGraphMobilityNodeCollection
+ (Class)nodeClass;
- (NSArray)locationMobilityTypes;
@end

@implementation PGGraphMobilityNodeCollection

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

- (NSArray)locationMobilityTypes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(MANodeCollection *)self labels];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[PGGraphMobilityNode mobilityTypeForMobilityLabel:](PGGraphMobilityNode, "mobilityTypeForMobilityLabel:", *(void *)(*((void *)&v11 + 1) + 8 * i)));
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

@end