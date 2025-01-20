@interface ESDRoot
- (ESDRoot)init;
- (ESDRoot)initWithEshObject:(EshObject *)a3;
- (ESDRoot)initWithPbState:(id)a3;
- (id)childAt:(unint64_t)a3;
- (id)initFromReader:(OcReader *)a3;
- (id)pbReferenceWithID:(unsigned int)a3;
- (unint64_t)childCount;
- (void)addChild:(id)a3;
- (void)eshRoot;
- (void)writeToWriter:(OcWriter *)a3;
@end

@implementation ESDRoot

- (ESDRoot)initWithPbState:(id)a3
{
  id v4 = a3;
  v5 = [(ESDRoot *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 reader];
    (*(void (**)(uint64_t, void *))(*(void *)v6 + 72))(v6, [(ESDRoot *)v5 eshRoot]);
    +[ESDContainer pbReadChildrenOfObject:v5->super.mEshObject toArray:v5->mChildren state:v4];
  }

  return v5;
}

- (ESDRoot)init
{
  return [(ESDObject *)self initWithType:1];
}

- (ESDRoot)initWithEshObject:(EshObject *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ESDRoot;
  v3 = [(ESDObject *)&v7 initWithEshObject:a3];
  if (v3)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mChildren = v3->mChildren;
    v3->mChildren = v4;
  }
  return v3;
}

- (void)eshRoot
{
  result = self->super.mEshObject;
  if (result) {
  return result;
  }
}

- (id)pbReferenceWithID:(unsigned int)a3
{
  unint64_t v5 = [(ESDRoot *)self childCount];
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = 0;
    while (1)
    {
      v8 = [(ESDRoot *)self childAt:v7];
      v9 = (const void *)[v8 eshObject];
      if (v9)
      {
        if (v10)
        {
          v11 = v10;
          if ((*(unsigned int (**)(void *))(*(void *)v10 + 16))(v10))
          {
            if ((*(unsigned int (**)(void *))(*(void *)v11 + 32))(v11) == a3) {
              break;
            }
          }
        }
      }

      if (v6 == ++v7) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    v8 = 0;
  }
  return v8;
}

- (unint64_t)childCount
{
  return [(NSMutableArray *)self->mChildren count];
}

- (id)childAt:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->mChildren objectAtIndex:a3];
}

- (id)initFromReader:(OcReader *)a3
{
  id v4 = [(ESDRoot *)self init];
  unint64_t v5 = v4;
  if (v4)
  {
    (*((void (**)(OcReader *, void *))a3->var0 + 15))(a3, [(ESDRoot *)v4 eshRoot]);
    +[ESDContainer readChildrenOfObject:v5->super.mEshObject reader:a3 toArray:v5->mChildren];
  }
  return v5;
}

- (void)addChild:(id)a3
{
  id v4 = a3;
  -[NSMutableArray addObject:](self->mChildren, "addObject:");
  EshRoot::appendChild((EshRoot *)-[ESDRoot eshRoot](self, "eshRoot"), (EshObject *)[v4 eshObject]);
}

- (void)writeToWriter:(OcWriter *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ESDRoot;
  -[ESDObject writeToWriter:](&v8, sel_writeToWriter_);
  unint64_t v5 = [(NSMutableArray *)self->mChildren objectEnumerator];
  while (1)
  {
    unint64_t v6 = [v5 nextObject];
    uint64_t v7 = v6;
    if (!v6) {
      break;
    }
    [v6 writeToWriter:a3];
  }
}

- (void).cxx_destruct
{
}

@end