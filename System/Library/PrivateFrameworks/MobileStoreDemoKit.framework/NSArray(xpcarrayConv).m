@interface NSArray(xpcarrayConv)
+ (id)arrayWithXPCArray:()xpcarrayConv;
- (id)initWithXPCArray:()xpcarrayConv;
- (id)xpcArrayFromArray;
@end

@implementation NSArray(xpcarrayConv)

+ (id)arrayWithXPCArray:()xpcarrayConv
{
  v3 = (objc_class *)MEMORY[0x263EFF8C0];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithXPCArray:v4];

  return v5;
}

- (id)initWithXPCArray:()xpcarrayConv
{
  id v4 = a3;
  uint64_t v15 = 0;
  v16[0] = &v15;
  v16[1] = 0x3032000000;
  v16[2] = __Block_byref_object_copy_;
  v16[3] = __Block_byref_object_dispose_;
  id v17 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __42__NSArray_xpcarrayConv__initWithXPCArray___block_invoke;
  v12 = &unk_2644FC530;
  v14 = &v15;
  id v5 = a1;
  id v13 = v5;
  if (xpc_array_apply(v4, &v9))
  {
    v6 = defaultLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[NSArray(xpcarrayConv) initWithXPCArray:]((uint64_t)v16, v6);
    }

    id v5 = (id)objc_msgSend(v5, "initWithArray:", *(void *)(v16[0] + 40), v9, v10, v11, v12);
    id v7 = v5;
  }
  else
  {
    id v7 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v7;
}

- (id)xpcArrayFromArray
{
  xpc_object_t v2 = xpc_array_create(0, 0);
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__NSArray_xpcarrayConv__xpcArrayFromArray__block_invoke;
  v6[3] = &unk_2644FC558;
  id v3 = v2;
  id v7 = v3;
  v8 = &v9;
  [a1 enumerateObjectsUsingBlock:v6];
  if (*((unsigned char *)v10 + 24)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (void)initWithXPCArray:()xpcarrayConv .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_21EF08000, a2, OS_LOG_TYPE_DEBUG, "Converted from xpc to NSArray: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end