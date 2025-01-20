@interface NSUserDefaults(TSKRoleAdditions)
- (double)doubleForKey:()TSKRoleAdditions inRole:;
- (double)floatForKey:()TSKRoleAdditions inRole:;
- (uint64_t)BOOLForKey:()TSKRoleAdditions inRole:;
- (uint64_t)BOOLForKeyInCurrentRole:()TSKRoleAdditions;
- (uint64_t)arrayForKey:()TSKRoleAdditions inRole:;
- (uint64_t)arrayForKeyInCurrentRole:()TSKRoleAdditions;
- (uint64_t)dataForKey:()TSKRoleAdditions inRole:;
- (uint64_t)dataForKeyInCurrentRole:()TSKRoleAdditions;
- (uint64_t)dictionaryForKey:()TSKRoleAdditions inRole:;
- (uint64_t)dictionaryForKeyInCurrentRole:()TSKRoleAdditions;
- (uint64_t)doubleForKeyInCurrentRole:()TSKRoleAdditions;
- (uint64_t)floatForKeyInCurrentRole:()TSKRoleAdditions;
- (uint64_t)integerForKey:()TSKRoleAdditions inRole:;
- (uint64_t)integerForKeyInCurrentRole:()TSKRoleAdditions;
- (uint64_t)keyForRole:()TSKRoleAdditions;
- (uint64_t)objectForKey:()TSKRoleAdditions inRole:;
- (uint64_t)objectForKeyInCurrentRole:()TSKRoleAdditions;
- (uint64_t)p_currentRole;
- (uint64_t)removeObjectForKey:()TSKRoleAdditions inRole:;
- (uint64_t)removeObjectForKeyInCurrentRole:()TSKRoleAdditions;
- (uint64_t)setBool:()TSKRoleAdditions forKey:inRole:;
- (uint64_t)setBool:()TSKRoleAdditions forKeyInCurrentRole:;
- (uint64_t)setDouble:()TSKRoleAdditions forKey:inRole:;
- (uint64_t)setDouble:()TSKRoleAdditions forKeyInCurrentRole:;
- (uint64_t)setFloat:()TSKRoleAdditions forKey:inRole:;
- (uint64_t)setFloat:()TSKRoleAdditions forKeyInCurrentRole:;
- (uint64_t)setInteger:()TSKRoleAdditions forKey:inRole:;
- (uint64_t)setInteger:()TSKRoleAdditions forKeyInCurrentRole:;
- (uint64_t)setObject:()TSKRoleAdditions forKey:inRole:;
- (uint64_t)setObject:()TSKRoleAdditions forKeyInCurrentRole:;
- (uint64_t)stringForKey:()TSKRoleAdditions inRole:;
- (uint64_t)stringForKeyInCurrentRole:()TSKRoleAdditions;
@end

@implementation NSUserDefaults(TSKRoleAdditions)

- (uint64_t)keyForRole:()TSKRoleAdditions
{
  return [@"RoleDefaults" stringByAppendingFormat:@"-%@", a3];
}

- (uint64_t)p_currentRole
{
  id v0 = +[TSKApplicationDelegate sharedDelegate];

  return [v0 applicationName];
}

- (uint64_t)objectForKey:()TSKRoleAdditions inRole:
{
  v5 = objc_msgSend(a1, "objectForKey:", objc_msgSend(a1, "keyForRole:", a4));

  return [v5 objectForKey:a3];
}

- (uint64_t)setObject:()TSKRoleAdditions forKey:inRole:
{
  objc_sync_enter(a1);
  id v9 = (id)objc_msgSend((id)objc_msgSend(a1, "objectForKey:", objc_msgSend(a1, "keyForRole:", a5)), "mutableCopy");
  if (!v9) {
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  [v9 setObject:a3 forKey:a4];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "setObject:forKey:", v9, objc_msgSend(a1, "keyForRole:", a5));

  objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "synchronize");

  return objc_sync_exit(a1);
}

- (uint64_t)removeObjectForKey:()TSKRoleAdditions inRole:
{
  objc_sync_enter(a1);
  v7 = objc_msgSend((id)objc_msgSend(a1, "objectForKey:", objc_msgSend(a1, "keyForRole:", a4)), "mutableCopy");
  [v7 removeObjectForKey:a3];
  if (v7)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults"), "setObject:forKey:", v7, objc_msgSend(a1, "keyForRole:", a4));
  }

  return objc_sync_exit(a1);
}

- (uint64_t)stringForKey:()TSKRoleAdditions inRole:
{
  uint64_t result = objc_msgSend(a1, "objectForKey:inRole:");
  if (result)
  {
    uint64_t v2 = result;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)arrayForKey:()TSKRoleAdditions inRole:
{
  uint64_t result = objc_msgSend(a1, "objectForKey:inRole:");
  if (result)
  {
    uint64_t v2 = result;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)dictionaryForKey:()TSKRoleAdditions inRole:
{
  uint64_t result = objc_msgSend(a1, "objectForKey:inRole:");
  if (result)
  {
    uint64_t v2 = result;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)dataForKey:()TSKRoleAdditions inRole:
{
  uint64_t result = objc_msgSend(a1, "objectForKey:inRole:");
  if (result)
  {
    uint64_t v2 = result;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      return v2;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (uint64_t)integerForKey:()TSKRoleAdditions inRole:
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:inRole:");
  if (!v1) {
    return 0;
  }
  uint64_t v2 = (void *)v1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }

  return [v2 integerValue];
}

- (double)floatForKey:()TSKRoleAdditions inRole:
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:inRole:");
  if (!v1) {
    return 0.0;
  }
  uint64_t v2 = (void *)v1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0.0;
    }
  }

  [v2 floatValue];
  return result;
}

- (double)doubleForKey:()TSKRoleAdditions inRole:
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:inRole:");
  if (!v1) {
    return 0.0;
  }
  uint64_t v2 = (void *)v1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0.0;
    }
  }

  [v2 doubleValue];
  return result;
}

- (uint64_t)BOOLForKey:()TSKRoleAdditions inRole:
{
  uint64_t v1 = objc_msgSend(a1, "objectForKey:inRole:");
  if (!v1) {
    return 0;
  }
  uint64_t v2 = (void *)v1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v2 isEqual:@"YES"]) {
      return 1;
    }
    uint64_t v5 = [v2 length];
    BOOL v3 = 1;
    if (objc_msgSend(v2, "compare:options:range:", @"YES", 1, 0, v5))
    {
      uint64_t v6 = objc_msgSend(v2, "compare:options:range:", @"Y", 1, 0, v5);
      BOOL v3 = v6 == 0;
      if (v6) {
        return [v2 integerValue] != 0;
      }
    }
    return v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [v2 BOOLValue];
}

- (uint64_t)setInteger:()TSKRoleAdditions forKey:inRole:
{
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:");

  return [a1 setObject:v8 forKey:a4 inRole:a5];
}

- (uint64_t)setFloat:()TSKRoleAdditions forKey:inRole:
{
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithFloat:");

  return [a1 setObject:v7 forKey:a3 inRole:a4];
}

- (uint64_t)setDouble:()TSKRoleAdditions forKey:inRole:
{
  *(float *)&a2 = a2;
  uint64_t v8 = [NSNumber numberWithFloat:a2];

  return [a1 setObject:v8 forKey:a4 inRole:a5];
}

- (uint64_t)setBool:()TSKRoleAdditions forKey:inRole:
{
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:");

  return [a1 setObject:v8 forKey:a4 inRole:a5];
}

- (uint64_t)objectForKeyInCurrentRole:()TSKRoleAdditions
{
  uint64_t v5 = objc_msgSend(a1, "p_currentRole");

  return [a1 objectForKey:a3 inRole:v5];
}

- (uint64_t)setObject:()TSKRoleAdditions forKeyInCurrentRole:
{
  uint64_t v7 = objc_msgSend(a1, "p_currentRole");

  return [a1 setObject:a3 forKey:a4 inRole:v7];
}

- (uint64_t)removeObjectForKeyInCurrentRole:()TSKRoleAdditions
{
  uint64_t v5 = objc_msgSend(a1, "p_currentRole");

  return [a1 removeObjectForKey:a3 inRole:v5];
}

- (uint64_t)stringForKeyInCurrentRole:()TSKRoleAdditions
{
  uint64_t v5 = objc_msgSend(a1, "p_currentRole");

  return [a1 stringForKey:a3 inRole:v5];
}

- (uint64_t)arrayForKeyInCurrentRole:()TSKRoleAdditions
{
  uint64_t v5 = objc_msgSend(a1, "p_currentRole");

  return [a1 arrayForKey:a3 inRole:v5];
}

- (uint64_t)dictionaryForKeyInCurrentRole:()TSKRoleAdditions
{
  uint64_t v5 = objc_msgSend(a1, "p_currentRole");

  return [a1 dictionaryForKey:a3 inRole:v5];
}

- (uint64_t)dataForKeyInCurrentRole:()TSKRoleAdditions
{
  uint64_t v5 = objc_msgSend(a1, "p_currentRole");

  return [a1 dataForKey:a3 inRole:v5];
}

- (uint64_t)integerForKeyInCurrentRole:()TSKRoleAdditions
{
  uint64_t v5 = objc_msgSend(a1, "p_currentRole");

  return [a1 integerForKey:a3 inRole:v5];
}

- (uint64_t)floatForKeyInCurrentRole:()TSKRoleAdditions
{
  uint64_t v5 = objc_msgSend(a1, "p_currentRole");

  return [a1 floatForKey:a3 inRole:v5];
}

- (uint64_t)doubleForKeyInCurrentRole:()TSKRoleAdditions
{
  uint64_t v5 = objc_msgSend(a1, "p_currentRole");

  return [a1 doubleForKey:a3 inRole:v5];
}

- (uint64_t)BOOLForKeyInCurrentRole:()TSKRoleAdditions
{
  uint64_t v5 = objc_msgSend(a1, "p_currentRole");

  return [a1 BOOLForKey:a3 inRole:v5];
}

- (uint64_t)setInteger:()TSKRoleAdditions forKeyInCurrentRole:
{
  uint64_t v7 = objc_msgSend(a1, "p_currentRole");

  return [a1 setInteger:a3 forKey:a4 inRole:v7];
}

- (uint64_t)setFloat:()TSKRoleAdditions forKeyInCurrentRole:
{
  uint64_t v7 = objc_msgSend(a1, "p_currentRole");
  *(float *)&double v8 = a2;

  return [a1 setFloat:a4 forKey:v7 inRole:v8];
}

- (uint64_t)setDouble:()TSKRoleAdditions forKeyInCurrentRole:
{
  uint64_t v7 = objc_msgSend(a1, "p_currentRole");

  return [a1 setDouble:a4 forKey:v7 inRole:a2];
}

- (uint64_t)setBool:()TSKRoleAdditions forKeyInCurrentRole:
{
  uint64_t v7 = objc_msgSend(a1, "p_currentRole");

  return [a1 setBool:a3 forKey:a4 inRole:v7];
}

@end