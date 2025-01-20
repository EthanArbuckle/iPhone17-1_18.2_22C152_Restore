@interface SCRCUserDefaultsBase
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)BOOLForKeyPath:(id)a3;
- (float)floatForKey:(id)a3;
- (float)floatForKeyPath:(id)a3;
- (id)dictForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (id)stringForKeyPath:(id)a3;
- (id)valueForUndefinedKey:(id)a3;
- (int)intForKey:(id)a3;
- (int)intForKeyPath:(id)a3;
- (void)addObserver:(id)a3 forKey:(id)a4;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setBool:(BOOL)a3 forKeyPath:(id)a4;
- (void)setFloat:(float)a3 forKey:(id)a4;
- (void)setFloat:(float)a3 forKeyPath:(id)a4;
- (void)setInt:(int)a3 forKey:(id)a4;
- (void)setInt:(int)a3 forKeyPath:(id)a4;
@end

@implementation SCRCUserDefaultsBase

- (void)addObserver:(id)a3 forKey:(id)a4
{
}

- (id)valueForUndefinedKey:(id)a3
{
  return 0;
}

- (id)stringForKey:(id)a3
{
  v3 = [(SCRCUserDefaultsBase *)self valueForKey:a3];
  v4 = v3;
  if (!v3 || (CFTypeID v5 = CFGetTypeID(v3), v5 == CFStringGetTypeID()))
  {
    id v6 = v4;
LABEL_4:
    v7 = v6;
    goto LABEL_5;
  }
  if (v5 == CFNumberGetTypeID())
  {
    id v6 = [v4 stringValue];
    goto LABEL_4;
  }
  v7 = 0;
LABEL_5:

  return v7;
}

- (id)stringForKeyPath:(id)a3
{
  v3 = [(SCRCUserDefaultsBase *)self valueForKeyPath:a3];
  v4 = v3;
  if (!v3 || (CFTypeID v5 = CFGetTypeID(v3), v5 == CFStringGetTypeID()))
  {
    id v6 = v4;
LABEL_4:
    v7 = v6;
    goto LABEL_5;
  }
  if (v5 == CFNumberGetTypeID())
  {
    id v6 = [v4 stringValue];
    goto LABEL_4;
  }
  v7 = 0;
LABEL_5:

  return v7;
}

- (void)setInt:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInt:v4];
  [(SCRCUserDefaultsBase *)self setValue:v8 forKey:v7];
}

- (int)intForKey:(id)a3
{
  v3 = [(SCRCUserDefaultsBase *)self valueForKey:a3];
  uint64_t v4 = v3;
  if (v3 && ((CFTypeID v5 = CFGetTypeID(v3), v5 == CFStringGetTypeID()) || v5 == CFNumberGetTypeID())) {
    int v6 = [v4 intValue];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (void)setInt:(int)a3 forKeyPath:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  int v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInt:v4];
  [(SCRCUserDefaultsBase *)self setValue:v8 forKeyPath:v7];
}

- (int)intForKeyPath:(id)a3
{
  v3 = [(SCRCUserDefaultsBase *)self valueForKeyPath:a3];
  uint64_t v4 = v3;
  if (v3 && ((CFTypeID v5 = CFGetTypeID(v3), v5 == CFStringGetTypeID()) || v5 == CFNumberGetTypeID())) {
    int v6 = [v4 intValue];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (void)setFloat:(float)a3 forKey:(id)a4
{
  int v6 = NSNumber;
  id v7 = a4;
  *(float *)&double v8 = a3;
  id v9 = [v6 numberWithFloat:v8];
  [(SCRCUserDefaultsBase *)self setValue:v9 forKey:v7];
}

- (float)floatForKey:(id)a3
{
  v3 = [(SCRCUserDefaultsBase *)self valueForKey:a3];
  uint64_t v4 = v3;
  float v5 = 0.0;
  if (v3)
  {
    CFTypeID v6 = CFGetTypeID(v3);
    if (v6 == CFStringGetTypeID() || v6 == CFNumberGetTypeID())
    {
      [v4 floatValue];
      float v5 = v7;
    }
  }

  return v5;
}

- (void)setFloat:(float)a3 forKeyPath:(id)a4
{
  CFTypeID v6 = NSNumber;
  id v7 = a4;
  *(float *)&double v8 = a3;
  id v9 = [v6 numberWithFloat:v8];
  [(SCRCUserDefaultsBase *)self setValue:v9 forKeyPath:v7];
}

- (float)floatForKeyPath:(id)a3
{
  v3 = [(SCRCUserDefaultsBase *)self valueForKeyPath:a3];
  uint64_t v4 = v3;
  float v5 = 0.0;
  if (v3)
  {
    CFTypeID v6 = CFGetTypeID(v3);
    if (v6 == CFStringGetTypeID() || v6 == CFNumberGetTypeID())
    {
      [v4 floatValue];
      float v5 = v7;
    }
  }

  return v5;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  CFTypeID v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(SCRCUserDefaultsBase *)self setValue:v8 forKey:v7];
}

- (BOOL)BOOLForKey:(id)a3
{
  CFBooleanRef v3 = [(SCRCUserDefaultsBase *)self valueForKey:a3];
  CFBooleanRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  CFTypeID v5 = CFGetTypeID(v3);
  if (v5 != CFStringGetTypeID() && v5 != CFNumberGetTypeID())
  {
    if (v5 == CFBooleanGetTypeID())
    {
      char v6 = CFBooleanGetValue(v4) != 0;
      goto LABEL_8;
    }
LABEL_7:
    char v6 = 0;
    goto LABEL_8;
  }
  char v6 = [(__CFBoolean *)v4 BOOLValue];
LABEL_8:

  return v6;
}

- (id)dictForKey:(id)a3
{
  CFBooleanRef v3 = [(SCRCUserDefaultsBase *)self valueForKey:a3];
  CFBooleanRef v4 = v3;
  if (v3 && (CFTypeID v5 = CFGetTypeID(v3), v5 == CFDictionaryGetTypeID())) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)setBool:(BOOL)a3 forKeyPath:(id)a4
{
  BOOL v4 = a3;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(SCRCUserDefaultsBase *)self setValue:v8 forKeyPath:v7];
}

- (BOOL)BOOLForKeyPath:(id)a3
{
  CFBooleanRef v3 = [(SCRCUserDefaultsBase *)self valueForKeyPath:a3];
  CFBooleanRef v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  CFTypeID v5 = CFGetTypeID(v3);
  if (v5 != CFStringGetTypeID() && v5 != CFNumberGetTypeID())
  {
    if (v5 == CFBooleanGetTypeID())
    {
      char v6 = CFBooleanGetValue(v4) != 0;
      goto LABEL_8;
    }
LABEL_7:
    char v6 = 0;
    goto LABEL_8;
  }
  char v6 = [(__CFBoolean *)v4 BOOLValue];
LABEL_8:

  return v6;
}

@end