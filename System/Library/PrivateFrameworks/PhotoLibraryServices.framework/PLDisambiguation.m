@interface PLDisambiguation
- (NSIndexSet)indexingCategories;
- (NSString)queryTerm;
- (PLDisambiguation)initWithQueryTerm:(id)a3 disambiguationType:(unint64_t)a4 indexingCategories:(id)a5 maxNumberOfResults:(unint64_t)a6 matchOptions:(unint64_t)a7;
- (id)description;
- (unint64_t)disambiguationType;
- (unint64_t)matchOptions;
- (unint64_t)maxNumberOfResults;
@end

@implementation PLDisambiguation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexingCategories, 0);
  objc_storeStrong((id *)&self->_queryTerm, 0);
}

- (unint64_t)matchOptions
{
  return self->_matchOptions;
}

- (unint64_t)maxNumberOfResults
{
  return self->_maxNumberOfResults;
}

- (unint64_t)disambiguationType
{
  return self->_disambiguationType;
}

- (NSIndexSet)indexingCategories
{
  return self->_indexingCategories;
}

- (NSString)queryTerm
{
  return self->_queryTerm;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PLDisambiguation *)self queryTerm];
  unint64_t v5 = [(PLDisambiguation *)self disambiguationType];
  if (v5 - 1 > 2) {
    v6 = @"PLDisambiguationTypeUndefined";
  }
  else {
    v6 = off_1E586F080[v5 - 1];
  }
  v7 = [v3 stringWithFormat:@"QueryTerm: %@, disambiguationType: %@", v4, v6];

  return v7;
}

- (PLDisambiguation)initWithQueryTerm:(id)a3 disambiguationType:(unint64_t)a4 indexingCategories:(id)a5 maxNumberOfResults:(unint64_t)a6 matchOptions:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a5;
  if ([v13 length])
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PLDisambiguation.m", 17, @"Invalid parameter not satisfying: %@", @"queryTerm.length > 0" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"PLDisambiguation.m", 18, @"Invalid parameter not satisfying: %@", @"disambiguationType != PLDisambiguationTypeUndefined" object file lineNumber description];

LABEL_3:
  v30.receiver = self;
  v30.super_class = (Class)PLDisambiguation;
  v15 = [(PLDisambiguation *)&v30 init];
  if (v15)
  {
    uint64_t v16 = [v13 copy];
    queryTerm = v15->_queryTerm;
    v15->_queryTerm = (NSString *)v16;

    v15->_disambiguationType = a4;
    v15->_maxNumberOfResults = a6;
    v15->_matchOptions = a7;
    if ([v14 count])
    {
      v18 = (NSIndexSet *)v14;
      indexingCategories = v15->_indexingCategories;
      v15->_indexingCategories = v18;
LABEL_13:

      goto LABEL_14;
    }
    switch(a4)
    {
      case 1uLL:
        indexingCategories = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
        v22 = PLSearchIndexCategoriesForCategoryMask(1);
        [(NSIndexSet *)indexingCategories addIndexes:v22];

        v23 = PLSearchIndexCategoriesForCategoryMask(64);
        [(NSIndexSet *)indexingCategories addIndexes:v23];

        v24 = PLSearchIndexCategoriesForCategoryMask(0x40000);
        [(NSIndexSet *)indexingCategories addIndexes:v24];

        [(NSIndexSet *)indexingCategories addIndex:1700];
        [(NSIndexSet *)indexingCategories addIndex:1520];
        v20 = indexingCategories;
        uint64_t v21 = 1521;
        goto LABEL_12;
      case 2uLL:
        indexingCategories = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
        [(NSIndexSet *)indexingCategories addIndex:1500];
        [(NSIndexSet *)indexingCategories addIndex:1501];
        [(NSIndexSet *)indexingCategories addIndex:1510];
        [(NSIndexSet *)indexingCategories addIndex:1511];
        [(NSIndexSet *)indexingCategories addIndex:1520];
        [(NSIndexSet *)indexingCategories addIndex:1521];
        [(NSIndexSet *)indexingCategories addIndex:1530];
        [(NSIndexSet *)indexingCategories addIndex:1531];
        [(NSIndexSet *)indexingCategories addIndex:1600];
        [(NSIndexSet *)indexingCategories addIndex:1601];
        [(NSIndexSet *)indexingCategories addIndex:1700];
        [(NSIndexSet *)indexingCategories addIndex:1701];
        [(NSIndexSet *)indexingCategories addIndex:1800];
        [(NSIndexSet *)indexingCategories addIndex:1802];
        v20 = indexingCategories;
        uint64_t v21 = 1803;
        goto LABEL_12;
      case 3uLL:
        indexingCategories = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
        [(NSIndexSet *)indexingCategories addIndex:1300];
        [(NSIndexSet *)indexingCategories addIndex:1301];
        [(NSIndexSet *)indexingCategories addIndex:1330];
        v20 = indexingCategories;
        uint64_t v21 = 1331;
LABEL_12:
        [(NSIndexSet *)v20 addIndex:v21];
        uint64_t v25 = [(NSIndexSet *)indexingCategories copy];
        v26 = v15->_indexingCategories;
        v15->_indexingCategories = (NSIndexSet *)v25;

        goto LABEL_13;
    }
  }
LABEL_14:

  return v15;
}

@end