@interface _UIWTCProofreadingDecorationInfo
+ (id)highlightInfoWithIdentifier:(id)a3 ranges:(id)a4 decorationPaths:(id)a5 containers:(id)a6;
+ (id)underlineInfoWithIdentifier:(id)a3 ranges:(id)a4 decorationPaths:(id)a5 containers:(id)a6;
- (NSArray)ranges;
- (NSDictionary)paths;
- (NSMapTable)containers;
- (NSUUID)identifier;
- (_UIWTCProofreadingDecorationInfo)initWithType:(int64_t)a3 identifier:(id)a4 ranges:(id)a5 decorationPaths:(id)a6 containers:(id)a7;
- (id)description;
- (int64_t)type;
@end

@implementation _UIWTCProofreadingDecorationInfo

- (_UIWTCProofreadingDecorationInfo)initWithType:(int64_t)a3 identifier:(id)a4 ranges:(id)a5 decorationPaths:(id)a6 containers:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v35 = a6;
  id v16 = a7;
  uint64_t v17 = [v15 count];
  if (v17 != [v16 count])
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"_UIWTCProofreadingDecorationInfo.m" lineNumber:16 description:@"range<->container count mismatch"];
  }
  v40.receiver = self;
  v40.super_class = (Class)_UIWTCProofreadingDecorationInfo;
  v18 = [(_UIWTCProofreadingDecorationInfo *)&v40 init];
  v19 = v18;
  if (v18)
  {
    id v34 = v14;
    objc_storeStrong((id *)&v18->_identifier, a4);
    objc_storeStrong((id *)&v19->_ranges, a5);
    objc_storeStrong((id *)&v19->_paths, a6);
    uint64_t v20 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    containers = v19->_containers;
    v19->_containers = (NSMapTable *)v20;

    v19->_type = a3;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v33 = v15;
    id v22 = v15;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = 0;
      uint64_t v26 = *(void *)v37;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v37 != v26) {
            objc_enumerationMutation(v22);
          }
          uint64_t v28 = *(void *)(*((void *)&v36 + 1) + 8 * v27);
          v29 = v19->_containers;
          v30 = [v16 objectAtIndexedSubscript:v25 + v27];
          [(NSMapTable *)v29 setObject:v30 forKey:v28];

          ++v27;
        }
        while (v24 != v27);
        uint64_t v24 = [v22 countByEnumeratingWithState:&v36 objects:v41 count:16];
        v25 += v27;
      }
      while (v24);
    }

    id v15 = v33;
    id v14 = v34;
  }

  return v19;
}

+ (id)underlineInfoWithIdentifier:(id)a3 ranges:(id)a4 decorationPaths:(id)a5 containers:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) initWithType:0 identifier:v13 ranges:v12 decorationPaths:v11 containers:v10];

  return v14;
}

+ (id)highlightInfoWithIdentifier:(id)a3 ranges:(id)a4 decorationPaths:(id)a5 containers:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = (void *)[objc_alloc((Class)a1) initWithType:1 identifier:v13 ranges:v12 decorationPaths:v11 containers:v10];

  return v14;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)_UIWTCProofreadingDecorationInfo;
  v3 = [(_UIWTCProofreadingDecorationInfo *)&v11 description];
  if (self->_type) {
    v4 = @"Highlight";
  }
  else {
    v4 = @"Underline";
  }
  long long v10 = *(_OWORD *)&self->_identifier;
  paths = self->_paths;
  v6 = [(NSMapTable *)self->_containers objectEnumerator];
  v7 = [v6 allObjects];
  v8 = [v3 stringByAppendingFormat:@" %@ ID=%@ ranges=%@ paths=%@ containers=%@", v4, v10, paths, v7];

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSArray)ranges
{
  return self->_ranges;
}

- (NSDictionary)paths
{
  return self->_paths;
}

- (NSMapTable)containers
{
  return self->_containers;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_ranges, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end