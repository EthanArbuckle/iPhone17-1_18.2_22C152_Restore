@interface EBEscher
+ (id)readRootObjectWithType:(int)a3 state:(id)a4;
+ (void)readChildrenOfObject:(EshObject *)a3 toArray:(id)a4 state:(id)a5;
@end

@implementation EBEscher

+ (id)readRootObjectWithType:(int)a3 state:(id)a4
{
  id v6 = a4;
  v7 = objc_alloc_init(ESDRoot);
  v8 = [(ESDObject *)v7 eshObject];
  if (v8) {
  else
  }
    v9 = 0;
  v9[10] = a3;
  uint64_t v10 = [v6 xlReader];
  (*(void (**)(uint64_t, _DWORD *))(*(void *)v10 + 136))(v10, v9);
  if (v9[11])
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    [a1 readChildrenOfObject:v9 toArray:v11 state:v6];
    if ([v11 count])
    {
      [v11 count];
      v12 = [v11 objectAtIndex:0];
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  return v13;
}

+ (void)readChildrenOfObject:(EshObject *)a3 toArray:(id)a4 state:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  int v8 = (*((uint64_t (**)(EshObject *))a3->var0 + 5))(a3);
  if (v8)
  {
    uint64_t v9 = 0;
    do
    {
      if (((*((uint64_t (**)(EshObject *, uint64_t))a3->var0 + 8))(a3, v9) & 0x1000) == 0)
      {
        uint64_t v10 = (*((uint64_t (**)(EshObject *, uint64_t))a3->var0 + 6))(a3, v9);
        uint64_t v11 = (*((uint64_t (**)(EshObject *, uint64_t))a3->var0 + 7))(a3, v9);
        v12 = (void *)[objc_alloc((Class)objc_opt_class()) initForExcelBinaryWithType:v10 version:v11 state:v7];
        if (v12) {
          [v13 addObject:v12];
        }
      }
      uint64_t v9 = (v9 + 1);
    }
    while (v8 != v9);
  }
}

@end