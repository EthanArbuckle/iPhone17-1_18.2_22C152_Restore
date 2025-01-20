@interface NSMutableDictionary(NilProtection)
+ (id)npkDictionaryWithObjectsAndKeys:()NilProtection;
+ (uint64_t)_processArgumentWithMutableDictionary:()NilProtection object:key:;
- (uint64_t)npkSetObject:()NilProtection forKey:;
@end

@implementation NSMutableDictionary(NilProtection)

- (uint64_t)npkSetObject:()NilProtection forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKey:");
  }
  else {
    return [a1 removeObjectForKey:a4];
  }
}

+ (uint64_t)_processArgumentWithMutableDictionary:()NilProtection object:key:
{
  if (a4) {
    BOOL v5 = a5 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  uint64_t v6 = !v5;
  if (!v5) {
    [a3 npkSetObject:a4 forKey:a5];
  }
  return v6;
}

+ (id)npkDictionaryWithObjectsAndKeys:()NilProtection
{
  id v10 = a3;
  v11 = [MEMORY[0x263EFF9A0] dictionary];
  id v12 = v10;
  v20 = (id *)&a10;
  id v13 = a9;
  if ([MEMORY[0x263EFF9A0] _processArgumentWithMutableDictionary:v11 object:v12 key:v13])
  {
    v14 = v12;
    do
    {
      id v15 = *v20;

      v16 = v20 + 1;
      v20 += 2;
      id v17 = *v16;

      v14 = v15;
      id v13 = v17;
    }
    while (([MEMORY[0x263EFF9A0] _processArgumentWithMutableDictionary:v11 object:v15 key:v17] & 1) != 0);
  }
  else
  {
    id v17 = v13;
    id v15 = v12;
  }
  id v18 = v11;

  return v18;
}

@end