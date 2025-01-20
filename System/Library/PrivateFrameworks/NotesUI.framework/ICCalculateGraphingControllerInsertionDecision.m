@interface ICCalculateGraphingControllerInsertionDecision
+ (id)cache;
- (BOOL)allowsAddingToGraph;
- (BOOL)allowsInsertingNewGraph;
- (BOOL)prefersExistingGraph;
- (ICCalculateGraphingControllerInsertionDecision)initWithError:(id)a3 allowsInsertingNewGraph:(BOOL)a4 allowsAddingToGraph:(BOOL)a5 graphableVariables:(id)a6;
- (NSArray)graphableVariables;
- (NSError)error;
- (NSString)graphableVariable;
- (id)description;
- (id)makeMenu;
- (void)setGraphableVariable:(id)a3;
- (void)setPrefersExistingGraph:(BOOL)a3;
@end

@implementation ICCalculateGraphingControllerInsertionDecision

+ (id)cache
{
  if (cache_onceToken != -1) {
    dispatch_once(&cache_onceToken, &__block_literal_global_60);
  }
  v2 = (void *)cache_cache;
  return v2;
}

uint64_t __55__ICCalculateGraphingControllerInsertionDecision_cache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)cache_cache;
  cache_cache = (uint64_t)v0;

  v2 = (void *)cache_cache;
  return [v2 setCountLimit:8];
}

- (ICCalculateGraphingControllerInsertionDecision)initWithError:(id)a3 allowsInsertingNewGraph:(BOOL)a4 allowsAddingToGraph:(BOOL)a5 graphableVariables:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ICCalculateGraphingControllerInsertionDecision;
  v13 = [(ICCalculateGraphingControllerInsertionDecision *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_error, a3);
    v14->_allowsInsertingNewGraph = a4;
    v14->_allowsAddingToGraph = a5;
    objc_storeStrong((id *)&v14->_graphableVariables, a6);
  }

  return v14;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ICCalculateGraphingControllerInsertionDecision *)self error];
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[ICCalculateGraphingControllerInsertionDecision allowsInsertingNewGraph](self, "allowsInsertingNewGraph"));
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[ICCalculateGraphingControllerInsertionDecision allowsAddingToGraph](self, "allowsAddingToGraph"));
  v9 = [v3 stringWithFormat:@"<%@: %p, error: %@, allowsInsertingNewGraph: %@, allowsAddingToGraph: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (id)makeMenu
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = [v3 UUIDString];

  v5 = [(id)objc_opt_class() cache];
  [v5 setObject:self forKey:v4];

  v6 = [MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v6, "ic_addKey:forNonNilObject:", @"cacheKey", v4);
  v7 = [MEMORY[0x1E4F1CA48] array];
  v8 = [(ICCalculateGraphingControllerInsertionDecision *)self graphableVariables];
  unint64_t v9 = [v8 count];

  BOOL v10 = [(ICCalculateGraphingControllerInsertionDecision *)self allowsInsertingNewGraph];
  if (v9 < 2)
  {
    if (v10)
    {
      v39 = (void *)MEMORY[0x1E4FB1638];
      v40 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Insert Graph" value:@"Insert Graph" table:0 allowSiri:1];
      v41 = [v39 commandWithTitle:v40 image:0 action:sel_insertGraph_ propertyList:v6];

      [v7 addObject:v41];
    }
    if ([(ICCalculateGraphingControllerInsertionDecision *)self allowsAddingToGraph])
    {
      v42 = (void *)MEMORY[0x1E4FB1638];
      v43 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Add to Existing" value:@"Add to Existing" table:0 allowSiri:1];
      v44 = [v42 commandWithTitle:v43 image:0 action:sel_addToGraph_ propertyList:v6];

      [v7 addObject:v44];
    }
  }
  else
  {
    v51 = v7;
    v52 = v4;
    if (v10)
    {
      id v11 = [MEMORY[0x1E4F1CA48] array];
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      obuint64_t j = [(ICCalculateGraphingControllerInsertionDecision *)self graphableVariables];
      uint64_t v12 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v60 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v59 + 1) + 8 * i);
            v17 = NSString;
            v18 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%@ On X Axis" value:@"%@ On X Axis" table:0 allowSiri:1];
            v19 = objc_msgSend(v17, "localizedStringWithFormat:", v18, v16);

            [v6 setObject:v16 forKeyedSubscript:@"graphableVariable"];
            v20 = [MEMORY[0x1E4FB1638] commandWithTitle:v19 image:0 action:sel_insertGraph_ propertyList:v6];
            [v11 addObject:v20];
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
        }
        while (v13);
      }

      v21 = (void *)MEMORY[0x1E4FB1970];
      v22 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Insert Graph" value:@"Insert Graph" table:0 allowSiri:1];
      v23 = (void *)[v11 copy];
      v24 = [v21 menuWithTitle:v22 children:v23];

      [v7 addObject:v24];
      v4 = v52;
    }
    if ([(ICCalculateGraphingControllerInsertionDecision *)self allowsAddingToGraph])
    {
      v25 = [MEMORY[0x1E4F1CA48] array];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id obja = [(ICCalculateGraphingControllerInsertionDecision *)self graphableVariables];
      uint64_t v26 = [obja countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v56;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v56 != v28) {
              objc_enumerationMutation(obja);
            }
            uint64_t v30 = *(void *)(*((void *)&v55 + 1) + 8 * j);
            v31 = NSString;
            v32 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"%@ On X Axis" value:@"%@ On X Axis" table:0 allowSiri:1];
            v33 = objc_msgSend(v31, "localizedStringWithFormat:", v32, v30);

            [v6 setObject:v30 forKeyedSubscript:@"graphableVariable"];
            v34 = [MEMORY[0x1E4FB1638] commandWithTitle:v33 image:0 action:sel_addToGraph_ propertyList:v6];
            [v25 addObject:v34];
          }
          uint64_t v27 = [obja countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v27);
      }

      v35 = (void *)MEMORY[0x1E4FB1970];
      v36 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Add to Existing" value:@"Add to Existing" table:0 allowSiri:1];
      v37 = (void *)[v25 copy];
      v38 = [v35 menuWithTitle:v36 children:v37];

      v7 = v51;
      [v51 addObject:v38];

      v4 = v52;
    }
  }
  BOOL v45 = (unint64_t)[v7 count] < 2;
  v46 = (void *)MEMORY[0x1E4FB1970];
  v47 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Graphs" value:@"Graphs" table:0 allowSiri:1];
  v48 = (void *)[v7 copy];
  v49 = [v46 menuWithTitle:v47 image:0 identifier:0 options:v45 children:v48];

  return v49;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)allowsInsertingNewGraph
{
  return self->_allowsInsertingNewGraph;
}

- (BOOL)allowsAddingToGraph
{
  return self->_allowsAddingToGraph;
}

- (NSArray)graphableVariables
{
  return self->_graphableVariables;
}

- (BOOL)prefersExistingGraph
{
  return self->_prefersExistingGraph;
}

- (void)setPrefersExistingGraph:(BOOL)a3
{
  self->_prefersExistingGraph = a3;
}

- (NSString)graphableVariable
{
  return self->_graphableVariable;
}

- (void)setGraphableVariable:(id)a3
{
  self->_graphableVariable = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphableVariables, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end