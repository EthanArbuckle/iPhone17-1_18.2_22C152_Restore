@interface CRCTLDDelegateTablesFine
- (id)groupWithQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5;
- (int64_t)groupingConstraintForRegion1:(id)a3 region2:(id)a4;
@end

@implementation CRCTLDDelegateTablesFine

- (int64_t)groupingConstraintForRegion1:(id)a3 region2:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v16 = 0;
  id v8 = [(CRCTLDDelegateTablesCoarse *)self tableForRegion:v6 outCell:&v16];
  unint64_t v9 = (unint64_t)v16;
  id v15 = 0;
  id v10 = [(CRCTLDDelegateTablesCoarse *)self tableForRegion:v7 outCell:&v15];
  unint64_t v11 = (unint64_t)v15;
  uint64_t v12 = 1;
  if (v9 == v11) {
    uint64_t v12 = 2;
  }
  if (v9 | v11) {
    int64_t v13 = v12;
  }
  else {
    int64_t v13 = 0;
  }

  return v13;
}

- (id)groupWithQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([v9 count])
  {
    id v10 = [v9 firstObject];
    id v16 = 0;
    id v11 = [(CRCTLDDelegateTablesCoarse *)self tableForRegion:v10 outCell:&v16];
    id v12 = v16;

    if (v12)
    {
      [v12 setSubregions:v9];
      int64_t v13 = (CRGroupRegion *)v12;
    }
    else
    {
      int64_t v13 = [[CRGroupRegion alloc] initWithBoundingQuad:v8 layoutDirection:a4 subregions:v9];
    }
    v14 = v13;
  }
  else
  {
    v14 = [[CRGroupRegion alloc] initWithBoundingQuad:v8 layoutDirection:a4 subregions:v9];
  }

  return v14;
}

@end