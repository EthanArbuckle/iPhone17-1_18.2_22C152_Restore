@interface NSKeyedUnarchiver(NNMKUnarchivingUtils)
+ (id)nnmk_allowedClasses;
+ (id)unarchiveObjectOfClass:()NNMKUnarchivingUtils withData:;
+ (id)unarchiveObjectOfClasses:()NNMKUnarchivingUtils withData:;
@end

@implementation NSKeyedUnarchiver(NNMKUnarchivingUtils)

+ (id)unarchiveObjectOfClass:()NNMKUnarchivingUtils withData:
{
  if (a4)
  {
    v5 = (objc_class *)MEMORY[0x263F08928];
    id v6 = a4;
    id v12 = 0;
    v7 = (void *)[[v5 alloc] initForReadingFromData:v6 error:&v12];

    id v8 = v12;
    if (v8)
    {
      v9 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
        +[NSKeyedUnarchiver(NNMKUnarchivingUtils) unarchiveObjectOfClass:withData:]((uint64_t)v8, v9);
      }
    }
    v10 = [v7 decodeObjectOfClass:a3 forKey:*MEMORY[0x263F081D0]];
    [v7 finishDecoding];
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)unarchiveObjectOfClasses:()NNMKUnarchivingUtils withData:
{
  id v5 = a3;
  if (a4)
  {
    id v6 = (objc_class *)MEMORY[0x263F08928];
    id v7 = a4;
    id v13 = 0;
    id v8 = (void *)[[v6 alloc] initForReadingFromData:v7 error:&v13];

    id v9 = v13;
    if (v9)
    {
      v10 = qword_26AC21850;
      if (os_log_type_enabled((os_log_t)qword_26AC21850, OS_LOG_TYPE_ERROR)) {
        +[NSKeyedUnarchiver(NNMKUnarchivingUtils) unarchiveObjectOfClass:withData:]((uint64_t)v9, v10);
      }
    }
    v11 = [v8 decodeObjectOfClasses:v5 forKey:*MEMORY[0x263F081D0]];
    [v8 finishDecoding];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)nnmk_allowedClasses
{
  if (nnmk_allowedClasses_onceToken != -1) {
    dispatch_once(&nnmk_allowedClasses_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)nnmk_allowedClasses_allowedClasses;
  return v0;
}

+ (void)unarchiveObjectOfClass:()NNMKUnarchivingUtils withData:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23D3DF000, a2, OS_LOG_TYPE_ERROR, "Error unarchiving object. %{public}@", (uint8_t *)&v2, 0xCu);
}

@end