@interface TSDContainerLayout
- (TSDContainerLayout)initWithInfo:(id)a3;
- (id)childInfosForLayout;
- (void)updateChildrenFromInfo;
@end

@implementation TSDContainerLayout

- (TSDContainerLayout)initWithInfo:(id)a3
{
  if (a3 && ([a3 conformsToProtocol:&unk_26D787C68] & 1) == 0)
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDContainerLayout initWithInfo:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDContainerLayout.m"), 19, @"info is wrong protocol for layout");
  }
  v8.receiver = self;
  v8.super_class = (Class)TSDContainerLayout;
  return [(TSDLayout *)&v8 initWithInfo:a3];
}

- (id)childInfosForLayout
{
  id v2 = [(TSDContainerLayout *)self containerInfo];

  return (id)[v2 childInfos];
}

- (void)updateChildrenFromInfo
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = [(TSDContainerLayout *)self childInfosForLayout];
  v4 = [(TSDAbstractLayout *)self children];
  uint64_t v5 = [v3 count];
  if (v5 == [(NSArray *)v4 count])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v6 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (!v6) {
      goto LABEL_22;
    }
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v25;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v25 != v9) {
        objc_enumerationMutation(v3);
      }
      uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * v10);
      if (objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", v8 + v10), "info") != v11) {
        break;
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [v3 countByEnumeratingWithState:&v24 objects:v29 count:16];
        v8 += v10;
        if (v7) {
          goto LABEL_4;
        }
        goto LABEL_22;
      }
    }
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v13 = [(TSDLayout *)self layoutController];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v14 = [v3 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v3);
        }
        v18 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v19 = (id)[v13 layoutForInfo:v18 childOfLayout:self];
        if (!v19)
        {
          id v19 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(v18, "layoutClass")), "initWithInfo:", v18);
          if (!v19) {
            continue;
          }
        }
        [v12 addObject:v19];
      }
      uint64_t v15 = [v3 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }
  [(TSDAbstractLayout *)self setChildren:v12];

  [(TSDLayout *)self invalidate];
LABEL_22:
  [(NSArray *)[(TSDAbstractLayout *)self children] makeObjectsPerformSelector:sel_updateChildrenFromInfo];
}

@end