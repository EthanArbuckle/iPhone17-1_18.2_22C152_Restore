@interface TSTWPColumnCache
- (id)description;
@end

@implementation TSTWPColumnCache

- (id)description
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__26;
  v13 = __Block_byref_object_dispose__26;
  uint64_t v14 = 0;
  v3 = (void *)MEMORY[0x263F089D8];
  v4 = (objc_class *)objc_opt_class();
  uint64_t v14 = [v3 stringWithFormat:@"<%@ %p with %d key/value pairs \n{\n", NSStringFromClass(v4), self, objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F7C8E8]), "count")];
  v5 = *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F7C8F0]);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__TSTWPColumnCache_description__block_invoke;
  v8[3] = &unk_2646B3398;
  v8[4] = self;
  v8[5] = &v9;
  [v5 performSyncRead:v8];
  [(id)v10[5] appendString:@"}>"];
  v6 = (void *)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __31__TSTWPColumnCache_description__block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F7C8E8]);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __31__TSTWPColumnCache_description__block_invoke_2;
  v3[3] = &unk_2646B3370;
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __31__TSTWPColumnCache_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5 = [a2 unsignedIntValue];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendFormat:@"  { key: cellID   : %@\n", objc_msgSend(NSString, "stringWithFormat:", @"(%hu, %hu)", v5, HIWORD(v5))];
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendFormat:@"wpColumn:  object : %@\n           string : %@\n  },\n", a3, objc_msgSend((id)objc_msgSend(a3, "storage"), "string")];
}

@end