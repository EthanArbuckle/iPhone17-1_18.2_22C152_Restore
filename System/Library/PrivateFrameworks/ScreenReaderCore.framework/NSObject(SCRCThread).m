@interface NSObject(SCRCThread)
+ (uint64_t)performSelector:()SCRCThread withThreadKey:count:objects:;
+ (uint64_t)performSelector:()SCRCThread withThreadKey:waitTime:cancelMask:count:objects:;
- (NSString)threadDescription;
- (char)performSelector:()SCRCThread withObjectsAsArray:;
- (id)valueForBlock:()SCRCThread forThreadKey:waitTime:;
- (id)valueForKeyPath:()SCRCThread forThreadKey:waitTime:;
- (id)valueForKeyPathOnMainThread:()SCRCThread;
- (id)valueForSelector:()SCRCThread forThreadKey:waitTime:copyValue:withObjects:;
- (uint64_t)_getRetainedValueForKeyPath:()SCRCThread forThreadKey:waitTime:copy:;
- (uint64_t)_getRetainedValueForKeyPathOnMainThread:()SCRCThread copy:;
- (uint64_t)_scr_safeGetValueForKeyPath:()SCRCThread;
- (uint64_t)copyValueForKeyPath:()SCRCThread forThreadKey:;
- (uint64_t)copyValueForKeyPath:()SCRCThread forThreadKey:waitTime:;
- (uint64_t)copyValueForKeyPathOnMainThread:()SCRCThread;
- (uint64_t)performSelector:()SCRCThread withThreadKey:count:objects:;
- (uint64_t)performSelector:()SCRCThread withThreadKey:waitTime:cancelMask:count:objects:;
- (uint64_t)valueForKeyPath:()SCRCThread forThreadKey:;
- (void)_scr_safeGetValueForBlock:()SCRCThread lock:;
- (void)_scr_safeGetValueForKeyPath:()SCRCThread lock:;
- (void)_scr_safeGetValueForSelector:()SCRCThread lock:;
- (void)_scr_safePerformBlock:()SCRCThread lock:;
- (void)performAsyncBlock:()SCRCThread forThreadKey:;
@end

@implementation NSObject(SCRCThread)

- (NSString)threadDescription
{
  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

+ (uint64_t)performSelector:()SCRCThread withThreadKey:count:objects:
{
  return +[SCRCThread _performSelector:withThreadKey:onTarget:waitTime:cancelMask:count:firstObject:moreObjects:](SCRCThread, "_performSelector:withThreadKey:onTarget:waitTime:cancelMask:count:firstObject:moreObjects:", a3, a4, a1, 0, a5, a6, -1.0, &a9, &a9);
}

+ (uint64_t)performSelector:()SCRCThread withThreadKey:waitTime:cancelMask:count:objects:
{
  return +[SCRCThread _performSelector:a3 withThreadKey:a4 onTarget:a1 waitTime:a5 cancelMask:a6 count:a7 firstObject:&a9 moreObjects:&a9];
}

- (uint64_t)performSelector:()SCRCThread withThreadKey:count:objects:
{
  return +[SCRCThread _performSelector:withThreadKey:onTarget:waitTime:cancelMask:count:firstObject:moreObjects:](SCRCThread, "_performSelector:withThreadKey:onTarget:waitTime:cancelMask:count:firstObject:moreObjects:", a3, a4, a1, 0, a5, a6, -1.0, &a9, &a9);
}

- (uint64_t)performSelector:()SCRCThread withThreadKey:waitTime:cancelMask:count:objects:
{
  return +[SCRCThread _performSelector:a3 withThreadKey:a4 onTarget:a1 waitTime:a5 cancelMask:a6 count:a7 firstObject:&a9 moreObjects:&a9];
}

- (char)performSelector:()SCRCThread withObjectsAsArray:
{
  id v6 = a4;
  v7 = v6;
  if (a3)
  {
    switch([v6 count])
    {
      case 0:
        a3 = [a1 a3];
        break;
      case 1:
        v8 = [v7 objectAtIndex:0];
        objc_msgSend(a1, a3, v8);
        a3 = (char *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 2:
        v8 = [v7 objectAtIndex:0];
        v9 = [v7 objectAtIndex:1];
        objc_msgSend(a1, a3, v8, v9);
        a3 = (char *)objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      case 3:
        v8 = [v7 objectAtIndex:0];
        v9 = [v7 objectAtIndex:1];
        v10 = [v7 objectAtIndex:2];
        objc_msgSend(a1, a3, v8, v9, v10);
        a3 = (char *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      case 4:
        v8 = [v7 objectAtIndex:0];
        v9 = [v7 objectAtIndex:1];
        v10 = [v7 objectAtIndex:2];
        v11 = [v7 objectAtIndex:3];
        objc_msgSend(a1, a3, v8, v9, v10, v11);
        a3 = (char *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      case 5:
        v8 = [v7 objectAtIndex:0];
        v9 = [v7 objectAtIndex:1];
        v10 = [v7 objectAtIndex:2];
        v11 = [v7 objectAtIndex:3];
        v12 = [v7 objectAtIndex:4];
        objc_msgSend(a1, a3, v8, v9, v10, v11, v12);
        a3 = (char *)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      case 6:
        v8 = [v7 objectAtIndex:0];
        v9 = [v7 objectAtIndex:1];
        v10 = [v7 objectAtIndex:2];
        v11 = [v7 objectAtIndex:3];
        v12 = [v7 objectAtIndex:4];
        v13 = [v7 objectAtIndex:5];
        objc_msgSend(a1, a3, v8, v9, v10, v11, v12, v13);
        a3 = (char *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 7:
        v8 = [v7 objectAtIndex:0];
        v9 = [v7 objectAtIndex:1];
        v10 = [v7 objectAtIndex:2];
        v11 = [v7 objectAtIndex:3];
        v12 = [v7 objectAtIndex:4];
        v13 = [v7 objectAtIndex:5];
        v14 = [v7 objectAtIndex:6];
        objc_msgSend(a1, a3, v8, v9, v10, v11, v12, v13, v14);
        a3 = (char *)objc_claimAutoreleasedReturnValue();

LABEL_13:
LABEL_14:

LABEL_15:
LABEL_16:

LABEL_17:
LABEL_18:

        break;
      default:
        a3 = 0;
        break;
    }
  }

  return a3;
}

- (void)_scr_safeGetValueForSelector:()SCRCThread lock:
{
  id v15 = a3;
  id v6 = a4;
  [v6 lock];
  v7 = [v15 objectForKey:@"selector"];
  v8 = [v15 objectForKey:@"copy"];
  v9 = [v15 objectForKey:@"objects"];
  [v6 unlock];
  SEL v10 = NSSelectorFromString(v7);
  int v11 = [v8 BOOLValue];
  v12 = [a1 performSelector:v10 withObjectsAsArray:v9];
  if (v12)
  {
    v13 = v12;
    if (v11)
    {
      uint64_t v14 = [v12 copy];

      v13 = (void *)v14;
    }
    [v6 lock];
    [v15 setObject:v13 forKey:@"result"];
    [v6 unlock];
  }
}

- (void)_scr_safeGetValueForBlock:()SCRCThread lock:
{
  id v8 = a3;
  id v5 = a4;
  [v5 lock];
  id v6 = [v8 objectForKey:@"block"];
  [v5 unlock];
  if (v6)
  {
    v7 = v6[2](v6);
    if (v7)
    {
      [v5 lock];
      [v8 setObject:v7 forKey:@"result"];
      [v5 unlock];
    }
  }
}

- (void)_scr_safeGetValueForKeyPath:()SCRCThread lock:
{
  id v13 = a3;
  id v6 = a4;
  [v6 lock];
  v7 = [v13 objectForKey:@"keypath"];
  id v8 = [v13 objectForKey:@"copy"];
  int v9 = [v8 BOOLValue];

  [v6 unlock];
  SEL v10 = [a1 valueForKeyPath:v7];
  if (v10)
  {
    int v11 = v10;
    if (v9)
    {
      uint64_t v12 = [v10 copy];

      int v11 = (void *)v12;
    }
    [v6 lock];
    [v13 setObject:v11 forKey:@"result"];
    [v6 unlock];
  }
}

- (uint64_t)_scr_safeGetValueForKeyPath:()SCRCThread
{
  return objc_msgSend(a1, "_scr_safeGetValueForKeyPath:lock:", a3, 0);
}

- (void)_scr_safePerformBlock:()SCRCThread lock:
{
  id v5 = a4;
  id v6 = a3;
  [v5 lock];
  uint64_t v8 = [v6 objectForKey:@"block"];

  [v5 unlock];
  v7 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
    v7 = (void *)v8;
  }
}

- (uint64_t)_getRetainedValueForKeyPathOnMainThread:()SCRCThread copy:
{
  id v6 = (objc_class *)MEMORY[0x263EFF9A0];
  id v7 = a3;
  uint64_t v8 = (void *)[[v6 alloc] initWithCapacity:2];
  [v8 setObject:v7 forKey:@"keypath"];

  if (a4)
  {
    int v9 = [NSNumber numberWithBool:1];
    [v8 setObject:v9 forKey:@"copy"];
  }
  [a1 performSelectorOnMainThread:sel__scr_safeGetValueForKeyPath_ withObject:v8 waitUntilDone:1];
  uint64_t v10 = [v8 objectForKey:@"result"];

  return v10;
}

- (id)valueForKeyPathOnMainThread:()SCRCThread
{
  v3 = (void *)[a1 _getRetainedValueForKeyPathOnMainThread:a3 copy:0];
  return v3;
}

- (uint64_t)copyValueForKeyPathOnMainThread:()SCRCThread
{
  return [a1 _getRetainedValueForKeyPathOnMainThread:a3 copy:1];
}

- (uint64_t)_getRetainedValueForKeyPath:()SCRCThread forThreadKey:waitTime:copy:
{
  id v10 = a5;
  int v11 = (objc_class *)MEMORY[0x263F08958];
  id v12 = a4;
  id v13 = objc_alloc_init(v11);
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:2];
  [v14 setObject:v12 forKey:@"keypath"];

  if (a6)
  {
    id v15 = [NSNumber numberWithBool:1];
    [v14 setObject:v15 forKey:@"copy"];
  }
  objc_msgSend(a1, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", sel__scr_safeGetValueForKeyPath_lock_, v10, 0, 2, v14, a2, v13);
  [v13 lock];
  uint64_t v16 = [v14 objectForKey:@"result"];
  [v13 unlock];

  return v16;
}

- (uint64_t)valueForKeyPath:()SCRCThread forThreadKey:
{
  return objc_msgSend(a1, "valueForKeyPath:forThreadKey:waitTime:", 0.5);
}

- (id)valueForKeyPath:()SCRCThread forThreadKey:waitTime:
{
  v4 = objc_msgSend(a1, "_getRetainedValueForKeyPath:forThreadKey:waitTime:copy:", a3, a4, 0);
  return v4;
}

- (uint64_t)copyValueForKeyPath:()SCRCThread forThreadKey:
{
  return objc_msgSend(a1, "copyValueForKeyPath:forThreadKey:waitTime:", 0.5);
}

- (uint64_t)copyValueForKeyPath:()SCRCThread forThreadKey:waitTime:
{
  return objc_msgSend(a1, "_getRetainedValueForKeyPath:forThreadKey:waitTime:copy:", a3, a4, 1);
}

- (id)valueForSelector:()SCRCThread forThreadKey:waitTime:copyValue:withObjects:
{
  id v15 = a5;
  id v16 = a7;
  id v17 = objc_alloc_init(MEMORY[0x263F08958]);
  v18 = NSStringFromSelector(a4);
  id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
  v29 = (id *)&a10;
  id v20 = v16;
  v21 = v20;
  if (v20)
  {
    v22 = v20;
    do
    {
      [v19 addObject:v22];
      v23 = v29++;
      id v24 = *v23;

      v22 = v24;
    }
    while (v24);
  }
  v25 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  [v25 setObject:v18 forKey:@"selector"];
  [v25 setObject:v19 forKey:@"objects"];
  if (a6)
  {
    v26 = [NSNumber numberWithBool:1];
    [v25 setObject:v26 forKey:@"copy"];
  }
  objc_msgSend(a1, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", sel__scr_safeGetValueForSelector_lock_, v15, 0, 2, v25, a2, v17);
  [v17 lock];
  v27 = [v25 objectForKey:@"result"];
  [v17 unlock];

  return v27;
}

- (id)valueForBlock:()SCRCThread forThreadKey:waitTime:
{
  uint64_t v8 = (objc_class *)MEMORY[0x263F08958];
  id v9 = a5;
  id v10 = a4;
  id v11 = objc_alloc_init(v8);
  id v12 = (void *)[v10 copy];

  id v13 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  uint64_t v14 = (void *)MEMORY[0x21D4A07D0](v12);
  [v13 setObject:v14 forKey:@"block"];

  objc_msgSend(a1, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", sel__scr_safeGetValueForBlock_lock_, v9, 0, 2, v13, a2, v11);
  [v11 lock];
  id v15 = [v13 objectForKey:@"result"];
  [v13 removeObjectForKey:@"block"];
  [v11 unlock];

  return v15;
}

- (void)performAsyncBlock:()SCRCThread forThreadKey:
{
  id v6 = a4;
  id v7 = a3;
  id v11 = (id)objc_opt_new();
  uint64_t v8 = (void *)[v7 copy];

  id v9 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
  id v10 = (void *)MEMORY[0x21D4A07D0](v8);
  [v9 setObject:v10 forKey:@"block"];

  objc_msgSend(a1, "performSelector:withThreadKey:waitTime:cancelMask:count:objects:", sel__scr_safePerformBlock_lock_, v6, 0, 2, v9, -1.0, v11);
  [v11 lock];
  [v11 unlock];
}

@end