@interface NATreeNode
+ (NAIdentity)na_identity;
- (BOOL)isEqual:(id)a3;
- (NATreeNode)initWithRepresentedObject:(id)a3;
- (NATreeNode)initWithRepresentedObject:(id)a3 childNodes:(id)a4;
- (NSEnumerator)deepNodeEnumerator;
- (NSEnumerator)shallowNodeEnumerator;
- (NSEnumerator)shallowRepresentedObjectEnumerator;
- (NSMutableSet)internalChildNodes;
- (NSSet)childNodes;
- (NSString)description;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)childAtIndexPath:(id)a3 withChildrenSortedByComparator:(id)a4;
- (id)childrenSortedByComparator:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)representedObject;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)setInternalChildNodes:(id)a3;
- (void)setRepresentedObject:(id)a3;
@end

@implementation NATreeNode

- (NATreeNode)initWithRepresentedObject:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  v6 = [v4 set];
  v7 = [(NATreeNode *)self initWithRepresentedObject:v5 childNodes:v6];

  return v7;
}

- (NATreeNode)initWithRepresentedObject:(id)a3 childNodes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NATreeNode;
  v9 = [(NATreeNode *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_representedObject, a3);
    uint64_t v11 = [MEMORY[0x1E4F1CA80] setWithSet:v8];
    internalChildNodes = v10->_internalChildNodes;
    v10->_internalChildNodes = (NSMutableSet *)v11;
  }
  return v10;
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = +[NADescriptionBuilder builderWithObject:self];
  [v5 setActiveMultilinePrefix:v4];

  v6 = [(NATreeNode *)self representedObject];
  id v7 = (id)[v5 appendObject:v6 withName:@"representedObject"];

  id v8 = [(NATreeNode *)self internalChildNodes];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10 = [v5 activeMultilinePrefix];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53__NATreeNode__descriptionBuilderWithMultilinePrefix___block_invoke;
    v12[3] = &unk_1E61099B8;
    v12[4] = self;
    id v13 = v5;
    [v13 appendBodySectionWithName:@"childNodes" multilinePrefix:v10 block:v12];
  }
  return v5;
}

void __53__NATreeNode__descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) internalChildNodes];
  v3 = [v2 allObjects];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__NATreeNode__descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v4[3] = &unk_1E6109990;
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "na_each:", v4);
}

void __53__NATreeNode__descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 activeMultilinePrefix];
  v6 = [v4 _descriptionBuilderWithMultilinePrefix:v5];

  id v8 = [v6 build];

  id v7 = (id)[*(id *)(a1 + 32) appendObject:v8 withName:0];
}

- (NSString)description
{
  v2 = [(NATreeNode *)self _descriptionBuilderWithMultilinePrefix:&stru_1F0E49DB0];
  v3 = [v2 build];

  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NATreeNode allocWithZone:a3];
  id v5 = [(NATreeNode *)self representedObject];
  v6 = [(NATreeNode *)self childNodes];
  id v7 = [(NATreeNode *)v4 initWithRepresentedObject:v5 childNodes:v6];

  return v7;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[NAMutableTreeNode allocWithZone:a3];
  id v5 = [(NATreeNode *)self representedObject];
  v6 = [(NATreeNode *)self childNodes];
  id v7 = [(NATreeNode *)v4 initWithRepresentedObject:v5 childNodes:v6];

  return v7;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v8 = [(NATreeNode *)self deepNodeEnumerator];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

+ (NAIdentity)na_identity
{
  if (na_identity_onceToken != -1) {
    dispatch_once(&na_identity_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)na_identity_identity;
  return (NAIdentity *)v2;
}

void __25__NATreeNode_na_identity__block_invoke()
{
  id v4 = +[NAIdentityBuilder builder];
  v0 = [v4 appendCharacteristic:&__block_literal_global_37];
  v1 = [v0 appendCharacteristic:&__block_literal_global_39];
  uint64_t v2 = [v1 build];
  v3 = (void *)na_identity_identity;
  na_identity_identity = v2;
}

uint64_t __25__NATreeNode_na_identity__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 representedObject];
}

uint64_t __25__NATreeNode_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 internalChildNodes];
}

- (unint64_t)hash
{
  v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (NSSet)childNodes
{
  uint64_t v2 = [(NATreeNode *)self internalChildNodes];
  v3 = (void *)[v2 copy];

  return (NSSet *)v3;
}

- (NSEnumerator)deepNodeEnumerator
{
  uint64_t v2 = [[NATreeNodeDeepNodeEnumerator alloc] initWithNode:self];
  return (NSEnumerator *)v2;
}

- (NSEnumerator)shallowNodeEnumerator
{
  uint64_t v2 = [(NATreeNode *)self childNodes];
  v3 = [v2 objectEnumerator];

  return (NSEnumerator *)v3;
}

- (NSEnumerator)shallowRepresentedObjectEnumerator
{
  uint64_t v2 = [(NATreeNode *)self childNodes];
  v3 = [v2 valueForKey:@"representedObject"];
  id v4 = [v3 objectEnumerator];

  return (NSEnumerator *)v4;
}

- (id)childrenSortedByComparator:(id)a3
{
  id v4 = a3;
  id v5 = [(NATreeNode *)self childNodes];
  v6 = [v5 allObjects];
  id v7 = [v6 sortedArrayUsingComparator:v4];

  return v7;
}

- (id)childAtIndexPath:(id)a3 withChildrenSortedByComparator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = [(NATreeNode *)self childrenSortedByComparator:v7];
    unint64_t v9 = [v6 indexAtPosition:0];
    if ((unint64_t)[v6 length] > 1)
    {
      uint64_t v10 = objc_msgSend(v6, "na_indexPathStartingAtPosition:", 1);
    }
    else
    {
      uint64_t v10 = objc_opt_new();
    }
    v12 = (void *)v10;
    if ([v8 count] <= v9)
    {
      uint64_t v11 = 0;
    }
    else
    {
      id v13 = [v8 objectAtIndexedSubscript:v9];
      uint64_t v11 = [v13 childAtIndexPath:v12 withChildrenSortedByComparator:v7];
    }
  }
  else
  {
    uint64_t v11 = self;
  }

  return v11;
}

- (id)representedObject
{
  return self->_representedObject;
}

- (void)setRepresentedObject:(id)a3
{
}

- (NSMutableSet)internalChildNodes
{
  return self->_internalChildNodes;
}

- (void)setInternalChildNodes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalChildNodes, 0);
  objc_storeStrong(&self->_representedObject, 0);
}

@end