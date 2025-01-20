@interface TSKChangeGroup
- (NSMutableArray)changesArray;
- (TSKChangeGroup)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)registerChange:(int)a3 details:(id)a4 forChangeSource:(id)a5;
@end

@implementation TSKChangeGroup

- (TSKChangeGroup)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSKChangeGroup;
  v2 = [(TSKChangeGroup *)&v4 init];
  if (v2) {
    v2->mChangesArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKChangeGroup;
  [(TSKChangeGroup *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (id *)objc_alloc_init((Class)objc_opt_class());

  v4[1] = (id)[(NSMutableArray *)self->mChangesArray mutableCopy];
  return v4;
}

- (void)registerChange:(int)a3 details:(id)a4 forChangeSource:(id)a5
{
  uint64_t v7 = *(void *)&a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  mChangesArray = self->mChangesArray;
  uint64_t v10 = [(NSMutableArray *)mChangesArray countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v10) {
    goto LABEL_11;
  }
  uint64_t v11 = v10;
  v12 = 0;
  uint64_t v13 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v18 != v13) {
        objc_enumerationMutation(mChangesArray);
      }
      v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      if ((id)[v15 changeSource] == a5) {
        v12 = (void *)[v15 changes];
      }
    }
    uint64_t v11 = [(NSMutableArray *)mChangesArray countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v11);
  if (!v12)
  {
LABEL_11:
    v12 = (void *)[MEMORY[0x263EFF980] array];
    v16 = [[TSKChangeEntry alloc] initWithChangeSource:a5 changes:v12];
    [(NSMutableArray *)self->mChangesArray addObject:v16];
  }
  objc_msgSend(v12, "addObject:", +[TSKChangeRecord changeRecordWithKind:details:](TSKChangeRecord, "changeRecordWithKind:details:", v7, a4));
  if (unint64_t)[v12 count] >= 2 && (objc_opt_respondsToSelector()) {
    [a5 coalesceChanges:v12];
  }
}

- (NSMutableArray)changesArray
{
  return self->mChangesArray;
}

@end