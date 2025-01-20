@interface WFResourceNode
+ (id)nodesWithDefinitions:(id)a3;
- (NSArray)subnodes;
- (NSString)description;
- (WFResource)resource;
- (WFResourceNode)initWithDefinition:(id)a3;
- (WFResourceNode)initWithResource:(id)a3;
- (WFResourceNode)initWithResource:(id)a3 subnodes:(id)a4;
- (WFResourceNodeDelegate)delegate;
- (id)resourceObjectsConformingToProtocol:(id)a3;
- (id)resourceObjectsOfClass:(Class)a3;
- (id)resourceObjectsOfClasses:(id)a3;
- (void)addResourceObjectsOfClassesOrProtocols:(id)a3 toSet:(id)a4;
- (void)dealloc;
- (void)refreshAvailability;
- (void)resourceUpdated;
- (void)setDelegate:(id)a3;
@end

@implementation WFResourceNode

+ (id)nodesWithDefinitions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    uint64_t v9 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [[WFResourceNode alloc] initWithResource:v11 subnodes:v9];
          goto LABEL_10;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = v11;
LABEL_10:
          v13 = v12;
          if (!v12) {
            goto LABEL_21;
          }
LABEL_11:
          objc_msgSend(v4, "addObject:", v13, (void)v17);
          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "length", (void)v17))
        {
          v21 = @"WFResourceClass";
          v22 = v11;
          id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_20;
          }
          id v14 = v11;
        }
        v15 = v14;
        if (!v14)
        {
LABEL_20:
          v13 = 0;
          goto LABEL_21;
        }
        v13 = [[WFResourceNode alloc] initWithDefinition:v14];

        if (v13) {
          goto LABEL_11;
        }
LABEL_21:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_subnodes, 0);
  objc_storeStrong((id *)&self->_resource, 0);
}

- (void)setDelegate:(id)a3
{
}

- (WFResourceNodeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFResourceNodeDelegate *)WeakRetained;
}

- (NSArray)subnodes
{
  return self->_subnodes;
}

- (WFResource)resource
{
  return self->_resource;
}

- (NSString)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(WFResourceNode *)self resource];
  uint64_t v7 = [(WFResourceNode *)self subnodes];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p, resource: %@, subnodes count: %lu>", v5, self, v6, objc_msgSend(v7, "count")];

  return (NSString *)v8;
}

- (void)addResourceObjectsOfClassesOrProtocols:(id)a3 toSet:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        BOOL isClass = object_isClass(v12);
        id v14 = [(WFResourceNode *)self resource];
        v15 = v14;
        if (!isClass)
        {
          int v17 = [v14 conformsToProtocol:v12];

          if (!v17) {
            continue;
          }
LABEL_10:
          long long v18 = [(WFResourceNode *)self resource];
          [v7 addObject:v18];

          continue;
        }
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          goto LABEL_10;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v9);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v19 = [(WFResourceNode *)self subnodes];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * j) addResourceObjectsOfClassesOrProtocols:v6 toSet:v7];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v21);
  }
}

- (id)resourceObjectsOfClasses:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  if ([v4 anyObject]) {
    [(WFResourceNode *)self addResourceObjectsOfClassesOrProtocols:v4 toSet:v5];
  }

  return v5;
}

- (id)resourceObjectsConformingToProtocol:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];

  [(WFResourceNode *)self addResourceObjectsOfClassesOrProtocols:v6 toSet:v5];
  return v5;
}

- (id)resourceObjectsOfClass:(Class)a3
{
  id v4 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  id v5 = [(WFResourceNode *)self resourceObjectsOfClasses:v4];

  return v5;
}

- (void)refreshAvailability
{
  id v3 = [(WFResourceNode *)self subnodes];
  [v3 makeObjectsPerformSelector:sel_refreshAvailability];

  id v4 = [(WFResourceNode *)self resource];
  [v4 refreshAvailabilityWithNotification];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"WFResourceAvailabilityChangedNotification" object:self->_resource];

  v4.receiver = self;
  v4.super_class = (Class)WFResourceNode;
  [(WFResourceNode *)&v4 dealloc];
}

- (void)resourceUpdated
{
  id v3 = [(WFResourceNode *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFResourceNode *)self delegate];
    [v5 resourceNodeAvailabilityChanged:self];
  }
}

- (WFResourceNode)initWithResource:(id)a3
{
  return [(WFResourceNode *)self initWithResource:a3 subnodes:MEMORY[0x1E4F1CBF0]];
}

- (WFResourceNode)initWithResource:(id)a3 subnodes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WFResourceNode;
  uint64_t v9 = [(WFResourceNode *)&v16 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resource, a3);
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v10 selector:sel_resourceUpdated name:@"WFResourceAvailabilityChangedNotification" object:v10->_resource];

    uint64_t v12 = [v8 copy];
    subnodes = v10->_subnodes;
    v10->_subnodes = (NSArray *)v12;

    [(NSArray *)v10->_subnodes makeObjectsPerformSelector:sel_setDelegate_ withObject:v10];
    id v14 = v10;
  }

  return v10;
}

- (WFResourceNode)initWithDefinition:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"WFResourceClass"];
  Class v6 = NSClassFromString(v5);

  if ([(objc_class *)v6 isSubclassOfClass:objc_opt_class()])
  {
    if ([(objc_class *)v6 isSingleton])
    {
      uint64_t v7 = [(objc_class *)v6 sharedInstance];
    }
    else
    {
      uint64_t v7 = [[v6 alloc] initWithDefinition:v4];
    }
    uint64_t v9 = (void *)v7;
    uint64_t v10 = objc_opt_class();
    v11 = [v4 objectForKey:@"RequiredResources"];
    uint64_t v12 = [v10 nodesWithDefinitions:v11];

    self = [(WFResourceNode *)self initWithResource:v9 subnodes:v12];
    id v8 = self;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

@end