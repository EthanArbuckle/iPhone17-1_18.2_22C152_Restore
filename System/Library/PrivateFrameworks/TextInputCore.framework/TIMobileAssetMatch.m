@interface TIMobileAssetMatch
+ (id)knownAssetRegionAttributes;
+ (id)mobileAssetMatchWithTypes:(id)a3 inputModeLevels:(id)a4 regions:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)inputModeLevels;
- (NSArray)regions;
- (NSArray)types;
- (TIMobileAssetMatch)initWithTypes:(id)a3 inputModeLevels:(id)a4 regions:(id)a5;
- (id)description;
- (unint64_t)hash;
@end

@implementation TIMobileAssetMatch

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_inputModeLevels, 0);

  objc_storeStrong((id *)&self->_types, 0);
}

- (NSArray)regions
{
  return self->_regions;
}

- (NSArray)inputModeLevels
{
  return self->_inputModeLevels;
}

- (NSArray)types
{
  return self->_types;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(TIMobileAssetMatch *)self types];
  v7 = [(TIMobileAssetMatch *)self inputModeLevels];
  v8 = [(TIMobileAssetMatch *)self regions];
  v9 = [v3 stringWithFormat:@"<%@: types=%@, inputModeLevels=%@, regions=%@>", v5, v6, v7, v8];

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = 257 * [(NSArray *)self->_types hash];
  uint64_t v4 = 257 * ([(NSArray *)self->_inputModeLevels hash] + v3);
  return v4 + [(NSArray *)self->_regions hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    types = self->_types;
    if ((types == (NSArray *)v5[1] || -[NSArray isEqual:](types, "isEqual:"))
      && ((inputModeLevels = self->_inputModeLevels, inputModeLevels == (NSArray *)v5[2])
       || -[NSArray isEqual:](inputModeLevels, "isEqual:")))
    {
      regions = self->_regions;
      if (regions == (NSArray *)v5[3]) {
        char v9 = 1;
      }
      else {
        char v9 = -[NSArray isEqual:](regions, "isEqual:");
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (TIMobileAssetMatch)initWithTypes:(id)a3 inputModeLevels:(id)a4 regions:(id)a5
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v55 = a5;
  v75.receiver = self;
  v75.super_class = (Class)TIMobileAssetMatch;
  v10 = [(TIMobileAssetMatch *)&v75 init];
  if (!v10) {
    goto LABEL_48;
  }
  id v54 = v8;
  uint64_t v11 = [v8 copy];
  types = v10->_types;
  v10->_types = (NSArray *)v11;

  id v53 = v9;
  uint64_t v13 = [v9 copy];
  inputModeLevels = v10->_inputModeLevels;
  v10->_inputModeLevels = (NSArray *)v13;

  v15 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  regions = v10->_regions;
  v52 = v10;
  v10->_regions = v15;

  v17 = [MEMORY[0x1E4F1CA48] array];
  for (int i = 0; i != 3; ++i)
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v19 = v55;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v71 objects:v79 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v72;
LABEL_5:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v72 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v71 + 1) + 8 * v23);
        if ((unint64_t)[v17 count] > 1) {
          break;
        }
        uint64_t v25 = [v17 count];
        if (v25 == [v19 count]) {
          break;
        }
        if (i == 1)
        {
          v29 = [v24 objectForKeyedSubscript:@"ContactLabel"];
          uint64_t v30 = [v29 length];

          if (v30) {
            goto LABEL_19;
          }
        }
        else
        {
          if (i) {
            goto LABEL_19;
          }
          v26 = [v24 objectForKeyedSubscript:@"ContactLabel"];
          if (v26)
          {
            v27 = v26;
            if (![v26 caseInsensitiveCompare:@"Home"])
            {

LABEL_19:
              if (([v17 containsObject:v24] & 1) == 0) {
                [v17 addObject:v24];
              }
              goto LABEL_21;
            }
            uint64_t v28 = [v27 caseInsensitiveCompare:@"Work"];

            if (!v28) {
              goto LABEL_19;
            }
          }
        }
LABEL_21:
        if (v21 == ++v23)
        {
          uint64_t v21 = [v19 countByEnumeratingWithState:&v71 objects:v79 count:16];
          if (v21) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
  }
  v58 = [MEMORY[0x1E4F1CA48] array];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = v17;
  uint64_t v31 = [obj countByEnumeratingWithState:&v67 objects:v78 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v57 = *(void *)v68;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v68 != v57) {
          objc_enumerationMutation(obj);
        }
        v34 = (void *)[*(id *)(*((void *)&v67 + 1) + 8 * j) mutableCopy];
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        v35 = +[TIMobileAssetMatch knownAssetRegionAttributes];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v63 objects:v77 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v64;
          do
          {
            for (uint64_t k = 0; k != v37; ++k)
            {
              if (*(void *)v64 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = *(void *)(*((void *)&v63 + 1) + 8 * k);
              v41 = [v34 objectForKeyedSubscript:v40];

              if (!v41) {
                [v34 setObject:&stru_1F3F7A998 forKeyedSubscript:v40];
              }
            }
            uint64_t v37 = [v35 countByEnumeratingWithState:&v63 objects:v77 count:16];
          }
          while (v37);
        }

        [v58 addObject:v34];
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v67 objects:v78 count:16];
    }
    while (v32);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v42 = v58;
  uint64_t v43 = [v42 countByEnumeratingWithState:&v59 objects:v76 count:16];
  v10 = v52;
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v60;
    do
    {
      for (uint64_t m = 0; m != v44; ++m)
      {
        if (*(void *)v60 != v45) {
          objc_enumerationMutation(v42);
        }
        v47 = *(void **)(*((void *)&v59 + 1) + 8 * m);
        v48 = [v47 keysOfEntriesPassingTest:&__block_literal_global_48];
        v49 = [v48 allObjects];
        v50 = [v47 dictionaryWithValuesForKeys:v49];

        [(NSArray *)v52->_regions addObject:v50];
      }
      uint64_t v44 = [v42 countByEnumeratingWithState:&v59 objects:v76 count:16];
    }
    while (v44);
  }

  id v9 = v53;
  id v8 = v54;
LABEL_48:

  return v10;
}

uint64_t __60__TIMobileAssetMatch_initWithTypes_inputModeLevels_regions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = +[TIMobileAssetMatch knownAssetRegionAttributes];
  uint64_t v4 = [v3 containsObject:v2];

  return v4;
}

+ (id)mobileAssetMatchWithTypes:(id)a3 inputModeLevels:(id)a4 regions:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[objc_alloc((Class)a1) initWithTypes:v10 inputModeLevels:v9 regions:v8];

  return v11;
}

+ (id)knownAssetRegionAttributes
{
  if (knownAssetRegionAttributes_onceToken != -1) {
    dispatch_once(&knownAssetRegionAttributes_onceToken, &__block_literal_global_4030);
  }
  id v2 = (void *)knownAssetRegionAttributes_assetRegionAttributes;

  return v2;
}

void __48__TIMobileAssetMatch_knownAssetRegionAttributes__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = @"City";
  v3[1] = @"Province";
  v3[2] = @"Country";
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  uint64_t v1 = [v0 copy];
  id v2 = (void *)knownAssetRegionAttributes_assetRegionAttributes;
  knownAssetRegionAttributes_assetRegionAttributes = v1;
}

@end