@interface FCAggregateContentArchive
+ (BOOL)supportsSecureCoding;
- (FCAggregateContentArchive)initWithCoder:(id)a3;
- (id)description;
- (id)manifest;
- (id)unarchiveIntoContentContext:(id)a3;
- (int64_t)storageSize;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FCAggregateContentArchive

void __51__FCAggregateContentArchive_initWithChildArchives___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if (v9 && (objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          [v3 addObjectsFromArray:v10[1]];
        }
        else
        {
          objc_msgSend(v3, "addObject:", v9, (void)v11);
          v10 = 0;
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)description
{
  id v3 = [[FCDescription alloc] initWithObject:self];
  id v4 = FCCFArrayDescription((const __CFArray *)self->_childArchives);
  [(FCDescription *)v3 addField:@"childArchives" object:v4];

  uint64_t v5 = [(FCDescription *)v3 descriptionString];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FCAggregateContentArchive)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FCAggregateContentArchive;
  uint64_t v5 = [(FCAggregateContentArchive *)&v9 init];
  if (v5)
  {
    if (qword_1EB5D0FB0 != -1) {
      dispatch_once(&qword_1EB5D0FB0, &__block_literal_global_236);
    }
    uint64_t v6 = [v4 decodeObjectOfClasses:qword_1EB5D0FA8 forKey:@"childArchives"];
    childArchives = v5->_childArchives;
    v5->_childArchives = (NSArray *)v6;
  }
  return v5;
}

uint64_t __43__FCAggregateContentArchive_initWithCoder___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_msgSend(v0, "setWithObjects:", v1, objc_opt_class(), 0);
  uint64_t v3 = qword_1EB5D0FA8;
  qword_1EB5D0FA8 = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)unarchiveIntoContentContext:(id)a3
{
  id v4 = a3;
  childArchives = self->_childArchives;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__FCAggregateContentArchive_unarchiveIntoContentContext___block_invoke;
  v10[3] = &unk_1E5B4C318;
  id v11 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSArray *)childArchives fc_arrayByTransformingWithBlock:v10];
  uint64_t v8 = [[FCContentUnarchiveResult alloc] initWithInterestToken:v7 storageSize:[(FCAggregateContentArchive *)self storageSize]];

  return v8;
}

uint64_t __57__FCAggregateContentArchive_unarchiveIntoContentContext___block_invoke(uint64_t a1, void *a2)
{
  return [a2 unarchiveIntoContentContext:*(void *)(a1 + 32)];
}

- (id)manifest
{
  uint64_t v2 = [(NSArray *)self->_childArchives fc_arrayByTransformingWithBlock:&__block_literal_global_239];
  uint64_t v3 = [[FCContentManifest alloc] initWithManifests:v2];

  return v3;
}

uint64_t __37__FCAggregateContentArchive_manifest__block_invoke(uint64_t a1, void *a2)
{
  return [a2 manifest];
}

- (int64_t)storageSize
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = self->_childArchives;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 += objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "storageSize", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end