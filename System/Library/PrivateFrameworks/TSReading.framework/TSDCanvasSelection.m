@interface TSDCanvasSelection
+ (id)emptySelection;
- (BOOL)containsKindOfClass:(Class)a3;
- (BOOL)containsUnlockedKindOfClass:(Class)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSSet)infos;
- (NSSet)unlockedInfos;
- (TSDCanvasSelection)initWithInfos:(id)a3;
- (TSDCanvasSelection)initWithInfos:(id)a3 andContainer:(id)a4;
- (TSDContainerInfo)container;
- (id)copyExcludingInfo:(id)a3;
- (id)copyIncludingInfo:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)infosOfClass:(Class)a3;
- (unint64_t)infoCount;
- (unint64_t)unlockedInfoCount;
- (void)dealloc;
@end

@implementation TSDCanvasSelection

- (TSDCanvasSelection)initWithInfos:(id)a3 andContainer:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)TSDCanvasSelection;
  v6 = [(TSDCanvasSelection *)&v21 init];
  if (v6)
  {
    v7 = (NSSet *)[a3 copy];
    v6->mInfos = v7;
    if (!a4)
    {
      v8 = v7;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v9 = [(NSSet *)v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        a4 = 0;
        uint64_t v11 = *(void *)v18;
LABEL_5:
        uint64_t v12 = 0;
        while (1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
          if (!objc_msgSend(v13, "parentInfo", v16)) {
            break;
          }
          id v14 = (id)[v13 parentInfo];
          if (a4)
          {
            if (v14 != a4) {
              break;
            }
          }
          else
          {
            objc_opt_class();
            v16 = &unk_26D787C68;
            a4 = (id)TSUClassAndProtocolCast();
          }
          if (v10 == ++v12)
          {
            uint64_t v10 = [(NSSet *)v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
            if (v10) {
              goto LABEL_5;
            }
            goto LABEL_17;
          }
        }
      }
      a4 = 0;
    }
LABEL_17:
    v6->mContainer = (TSDContainerInfo *)a4;
  }
  return v6;
}

- (TSDCanvasSelection)initWithInfos:(id)a3
{
  return [(TSDCanvasSelection *)self initWithInfos:a3 andContainer:0];
}

+ (id)emptySelection
{
  id v3 = objc_alloc_init(MEMORY[0x263EFFA08]);
  v4 = (void *)[objc_alloc((Class)a1) initWithInfos:v3];

  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDCanvasSelection;
  [(TSDCanvasSelection *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  mInfos = self->mInfos;

  return (id)[v4 initWithInfos:mInfos];
}

- (NSSet)infos
{
  return self->mInfos;
}

- (unint64_t)infoCount
{
  unint64_t result = [(TSDCanvasSelection *)self infos];
  if (result)
  {
    return [(id)result count];
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v5 = [(TSDCanvasSelection *)self infos];
    v6 = v5;
    if (a3 || [(NSSet *)v5 count] || self->mContainer)
    {
      objc_opt_class();
      uint64_t v7 = TSUDynamicCast();
      if (v7)
      {
        v8 = (void *)v7;
        uint64_t v9 = [(NSSet *)v6 count];
        uint64_t v10 = (void *)[v8 infos];
        if (v9) {
          char v11 = [(NSSet *)v6 isEqual:v10];
        }
        else {
          char v11 = [v10 count] == 0;
        }
        if ([(TSDCanvasSelection *)self container]) {
          char v12 = -[TSDContainerInfo isEqual:](-[TSDCanvasSelection container](self, "container"), "isEqual:", [v8 container]);
        }
        else {
          char v12 = [v8 container] == 0;
        }
        LOBYTE(v7) = v11 & v12;
      }
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (BOOL)isEmpty
{
  uint64_t v3 = [(id)objc_opt_class() emptySelection];

  return [(TSDCanvasSelection *)self isEqual:v3];
}

- (id)infosOfClass:(Class)a3
{
  id v4 = [(TSDCanvasSelection *)self infos];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__TSDCanvasSelection_infosOfClass___block_invoke;
  v6[3] = &unk_2646B13C8;
  v6[4] = a3;
  return [(NSSet *)v4 objectsPassingTest:v6];
}

uint64_t __35__TSDCanvasSelection_infosOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)containsKindOfClass:(Class)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(TSDCanvasSelection *)self infos];
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v4;
}

- (NSSet)unlockedInfos
{
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = [(TSDCanvasSelection *)self infos];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __35__TSDCanvasSelection_unlockedInfos__block_invoke;
  v6[3] = &unk_2646B13C8;
  v6[4] = v3;
  return [(NSSet *)v4 objectsPassingTest:v6];
}

uint64_t __35__TSDCanvasSelection_unlockedInfos__block_invoke(uint64_t a1, void *a2)
{
  if (objc_opt_isKindOfClass()) {
    return [a2 isLocked] ^ 1;
  }
  else {
    return 1;
  }
}

- (unint64_t)unlockedInfoCount
{
  v2 = [(TSDCanvasSelection *)self unlockedInfos];

  return [(NSSet *)v2 count];
}

- (BOOL)containsUnlockedKindOfClass:(Class)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(TSDCanvasSelection *)self infos];
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        if ((objc_opt_isKindOfClass() & 1) != 0 && ![v8 isLocked])
        {
          LOBYTE(v4) = 1;
          return v4;
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v5 = v4;
      if (v4) {
        continue;
      }
      break;
    }
  }
  return v4;
}

- (id)copyIncludingInfo:(id)a3
{
  uint64_t v4 = (id *)[(TSDCanvasSelection *)self copy];
  id v5 = v4[1];
  if (v5) {
    id v6 = (id)[v5 mutableCopy];
  }
  else {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  uint64_t v7 = v6;
  [v6 addObject:a3];

  v4[1] = (id)[v7 copy];
  return v4;
}

- (id)copyExcludingInfo:(id)a3
{
  uint64_t v4 = (id *)[(TSDCanvasSelection *)self copy];
  id v5 = (void *)[v4[1] mutableCopy];
  [v5 removeObject:a3];

  v4[1] = (id)[v5 copy];
  return v4;
}

- (TSDContainerInfo)container
{
  return self->mContainer;
}

@end