@interface PLSqliteQueryPlan
- (NSString)graphDescription;
- (NSString)listDescription;
- (PLSqliteQueryPlan)init;
- (id)_stringRepresentationRegex;
- (void)_renderLevelWithParentIdentifier:(int)a3 prefix:(id)a4 intoLines:(id)a5;
- (void)addNodeWithIdentifier:(int)a3 parentIdentifier:(int)a4 unused:(int)a5 nodeDescription:(id)a6;
- (void)addNodeWithStringRepresentation:(id)a3;
@end

@implementation PLSqliteQueryPlan

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringRepresentationRegex, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

- (void)_renderLevelWithParentIdentifier:(int)a3 prefix:(id)a4 intoLines:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  nodes = self->_nodes;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__PLSqliteQueryPlan__renderLevelWithParentIdentifier_prefix_intoLines___block_invoke;
  v20[3] = &__block_descriptor_36_e31_B16__0__PLSqliteQueryPlanNode_8l;
  int v21 = a3;
  v11 = [(NSMutableArray *)nodes _pl_filter:v20];
  uint64_t v12 = [v11 count];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__PLSqliteQueryPlan__renderLevelWithParentIdentifier_prefix_intoLines___block_invoke_2;
  v15[3] = &unk_1E586AA30;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  uint64_t v19 = v12;
  id v13 = v9;
  id v14 = v8;
  [v11 enumerateObjectsUsingBlock:v15];
}

BOOL __71__PLSqliteQueryPlan__renderLevelWithParentIdentifier_prefix_intoLines___block_invoke(uint64_t a1, void *a2)
{
  return [a2 parentIdentifier] == *(_DWORD *)(a1 + 32);
}

void __71__PLSqliteQueryPlan__renderLevelWithParentIdentifier_prefix_intoLines___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v5 = *(void *)(a1 + 56) - 1;
  v6 = NSString;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = a2;
  uint64_t v9 = [v8 nodeDescription];
  v10 = (void *)v9;
  if (v5 <= a3) {
  else
  }
    v11 = @"|--";
  if (v5 <= a3) {
    uint64_t v12 = @"   ";
  }
  else {
    uint64_t v12 = @"|  ";
  }
  id v16 = [v6 stringWithFormat:@"%@%@%@", v7, v11, v9];

  [*(id *)(a1 + 40) addObject:v16];
  id v13 = [*(id *)(a1 + 32) stringByAppendingString:v12];
  id v14 = *(void **)(a1 + 48);
  uint64_t v15 = [v8 identifier];

  [v14 _renderLevelWithParentIdentifier:v15 prefix:v13 intoLines:*(void *)(a1 + 40)];
}

- (NSString)graphDescription
{
  v2 = pl_result_with_autoreleasepool();
  return (NSString *)v2;
}

id __37__PLSqliteQueryPlan_graphDescription__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  [*(id *)(a1 + 32) _renderLevelWithParentIdentifier:0 prefix:&stru_1EEB2EB80 intoLines:v2];
  v3 = [v2 componentsJoinedByString:@"\n"];
  v4 = (void *)[v3 copy];

  return v4;
}

- (NSString)listDescription
{
  v2 = pl_result_with_autoreleasepool();
  return (NSString *)v2;
}

id __36__PLSqliteQueryPlan_listDescription__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v8 = NSString;
        uint64_t v9 = [v7 identifier];
        uint64_t v10 = [v7 parentIdentifier];
        uint64_t v11 = [v7 unused];
        uint64_t v12 = [v7 nodeDescription];
        id v13 = [v8 stringWithFormat:@"%d|%d|%d|%@", v9, v10, v11, v12];

        [v2 addObject:v13];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v4);
  }

  id v14 = [v2 componentsJoinedByString:@"\n"];
  uint64_t v15 = (void *)[v14 copy];

  return v15;
}

- (id)_stringRepresentationRegex
{
  stringRepresentationRegex = self->_stringRepresentationRegex;
  if (!stringRepresentationRegex)
  {
    uint64_t v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\s*(\\d+)[ |\\|](\\d+)[ |\\|](\\d+)[ |\\|](.*)$" options:0 error:0];
    uint64_t v5 = self->_stringRepresentationRegex;
    self->_stringRepresentationRegex = v4;

    stringRepresentationRegex = self->_stringRepresentationRegex;
  }
  return stringRepresentationRegex;
}

- (void)addNodeWithStringRepresentation:(id)a3
{
  id v23 = a3;
  uint64_t v4 = [(PLSqliteQueryPlan *)self _stringRepresentationRegex];
  uint64_t v5 = objc_msgSend(v4, "firstMatchInString:options:range:", v23, 0, 0, objc_msgSend(v23, "length"));
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 rangeAtIndex:1];
    if (v8)
    {
      uint64_t v9 = objc_msgSend(v23, "substringWithRange:", v7, v8);
      uint64_t v10 = [v9 intValue];
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v11 = [v6 rangeAtIndex:2];
    if (v12)
    {
      id v13 = objc_msgSend(v23, "substringWithRange:", v11, v12);
      uint64_t v14 = [v13 intValue];
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v15 = [v6 rangeAtIndex:3];
    if (v16)
    {
      id v17 = objc_msgSend(v23, "substringWithRange:", v15, v16);
      uint64_t v18 = [v17 intValue];
    }
    else
    {
      uint64_t v18 = 0;
    }
    uint64_t v19 = [v6 rangeAtIndex:4];
    if (v20)
    {
      long long v21 = objc_msgSend(v23, "substringWithRange:", v19, v20);
      v22 = (__CFString *)[v21 copy];
    }
    else
    {
      v22 = &stru_1EEB2EB80;
    }
    [(PLSqliteQueryPlan *)self addNodeWithIdentifier:v10 parentIdentifier:v14 unused:v18 nodeDescription:v22];
  }
}

- (void)addNodeWithIdentifier:(int)a3 parentIdentifier:(int)a4 unused:(int)a5 nodeDescription:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  uint64_t v11 = [[PLSqliteQueryPlanNode alloc] initWithIdentifier:v8 parentIdentifier:v7 unused:v6 nodeDescription:v10];

  [(NSMutableArray *)self->_nodes addObject:v11];
}

- (PLSqliteQueryPlan)init
{
  v7.receiver = self;
  v7.super_class = (Class)PLSqliteQueryPlan;
  v2 = [(PLSqliteQueryPlan *)&v7 init];
  if (v2)
  {
    uint64_t v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    nodes = v2->_nodes;
    v2->_nodes = v3;

    uint64_t v5 = v2;
  }

  return v2;
}

@end