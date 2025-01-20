@interface CRCTLDDelegateTablesCoarse
+ (id)delegateWithTableGroups:(id)a3 textRegions:(id)a4;
- (CRCTLDDelegateTablesCoarse)initWithTableGroups:(id)a3 textRegions:(id)a4;
- (id)groupWithQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5;
- (id)tableForRegion:(id)a3 outCell:(id *)a4;
- (int64_t)groupingConstraintForRegion1:(id)a3 region2:(id)a4;
@end

@implementation CRCTLDDelegateTablesCoarse

- (CRCTLDDelegateTablesCoarse)initWithTableGroups:(id)a3 textRegions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRCTLDDelegateTablesCoarse;
  v9 = [(CRCTLDDelegateTablesCoarse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tableGroups, a3);
    objc_storeStrong((id *)&v10->_textRegions, a4);
  }

  return v10;
}

+ (id)delegateWithTableGroups:(id)a3 textRegions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)[objc_alloc((Class)a1) initWithTableGroups:v6 textRegions:v7];

  return v8;
}

- (id)tableForRegion:(id)a3 outCell:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obuint64_t j = self->_tableGroups;
  uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      uint64_t v18 = v6;
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        v9 = objc_msgSend(v8, "cells", v18);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v9);
              }
              v13 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              v14 = [v13 subregions];
              int v15 = [v14 containsObject:v5];

              if (v15)
              {
                if (a4) {
                  *a4 = v13;
                }
                id v16 = v8;

                goto LABEL_21;
              }
            }
            uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      id v16 = 0;
    }
    while (v6);
  }
  else
  {
    id v16 = 0;
  }
LABEL_21:

  return v16;
}

- (int64_t)groupingConstraintForRegion1:(id)a3 region2:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(CRCTLDDelegateTablesCoarse *)self tableForRegion:a3 outCell:0];
  uint64_t v8 = [(CRCTLDDelegateTablesCoarse *)self tableForRegion:v6 outCell:0];
  uint64_t v9 = 1;
  if (v7 == v8) {
    uint64_t v9 = 2;
  }
  if (v7 | v8) {
    int64_t v10 = v9;
  }
  else {
    int64_t v10 = 0;
  }

  return v10;
}

- (id)groupWithQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v9 count])
  {
    int64_t v10 = [v9 firstObject];
    uint64_t v11 = [(CRCTLDDelegateTablesCoarse *)self tableForRegion:v10 outCell:0];

    if (v11) {
      objc_super v12 = v11;
    }
    else {
      objc_super v12 = [[CRGroupRegion alloc] initWithBoundingQuad:v8 layoutDirection:a4 subregions:v9];
    }
    v13 = v12;
  }
  else
  {
    v13 = [[CRGroupRegion alloc] initWithBoundingQuad:v8 layoutDirection:a4 subregions:v9];
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textRegions, 0);
  objc_storeStrong((id *)&self->_tableGroups, 0);
}

@end