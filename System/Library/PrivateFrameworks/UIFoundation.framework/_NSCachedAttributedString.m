@interface _NSCachedAttributedString
+ (id)allocWithZone:(_NSZone *)a3;
+ (void)initialize;
- (BOOL)_baselineMode;
- (BOOL)_isDeallocating;
- (BOOL)_isStringDrawingTextStorage;
- (BOOL)_tryRetain;
- (BOOL)hasColorGlyphsInRange:(_NSRange)a3;
- (BOOL)isEqual:(id)a3;
- (_NSCachedAttributedString)init;
- (_NSCachedAttributedString)initWithAttributedString:(id)a3;
- (_NSCachedAttributedString)initWithString:(id)a3;
- (_NSCachedAttributedString)initWithString:(id)a3 attributes:(id)a4;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5;
- (id)copyCachedInstance;
- (id)string;
- (unint64_t)hash;
- (unint64_t)length;
- (void)cache;
- (void)dealloc;
- (void)finalize;
- (void)release;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
@end

@implementation _NSCachedAttributedString

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  int64_t length = self->_length;
  runs = self->_runs;
  if (runs) {
    BOOL v6 = length < 1;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
LABEL_8:
    NSUInteger v7 = 0;
  }
  else
  {
    NSUInteger v7 = 0;
    p_var1 = (NSUInteger *)&runs->var1;
    while (1)
    {
      NSUInteger v9 = *p_var1;
      unint64_t v10 = *p_var1 + v7;
      if (v10 > a3) {
        break;
      }
      p_var1 += 2;
      NSUInteger v7 = v10;
      if ((uint64_t)v10 >= length) {
        goto LABEL_8;
      }
    }
    baseAttributes = (NSAttributeDictionary *)*(p_var1 - 1);
    if (baseAttributes)
    {
      if (a4)
      {
        a4->location = v7;
        a4->int64_t length = v9;
      }
      return baseAttributes;
    }
    int64_t length = v9;
  }
  baseAttributes = self->_baseAttributes;
  if (!baseAttributes) {
    return (id)[self->_contents attributesAtIndex:a3 longestEffectiveRange:a4 inRange:v7];
  }
  if (a4)
  {
    a4->location = v7;
    a4->int64_t length = length;
    return self->_baseAttributes;
  }
  return baseAttributes;
}

- (id)string
{
  baseAttributes = self->_baseAttributes;
  id result = self->_contents;
  if (!baseAttributes) {
    return (id)[result string];
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  os_unfair_lock_lock_with_options();
  int v5 = __NSCachedAttrStringCacheNextIndex;
  if (!__NSCachedAttrStringCacheNextIndex)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSCachedAttrStringLock);
LABEL_5:
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS____NSCachedAttributedString;
    return objc_msgSendSuper2(&v8, sel_allocWithZone_, a3);
  }
  --__NSCachedAttrStringCacheNextIndex;
  BOOL v6 = (void *)__NSCachedAttrStringCache[v5 - 1];
  os_unfair_lock_unlock((os_unfair_lock_t)&__NSCachedAttrStringLock);
  if (!v6) {
    goto LABEL_5;
  }
  return v6;
}

- (void)release
{
  if ([(_NSCachedAttributedString *)self retainCount] != 1) {
    goto LABEL_11;
  }
  os_unfair_lock_lock_with_options();
  uint64_t v3 = __NSCachedAttrStringCacheNextIndex;
  if (__NSCachedAttrStringCacheNextIndex >= 3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSCachedAttrStringLock);
LABEL_11:
    v14.receiver = self;
    v14.super_class = (Class)_NSCachedAttributedString;
    [(_NSCachedAttributedString *)&v14 release];
    return;
  }
  ++__NSCachedAttrStringCacheNextIndex;
  __NSCachedAttrStringCache[v3] = self;
  Class = object_getClass(self);
  id contents = self->_contents;
  baseAttributes = self->_baseAttributes;
  runs = self->_runs;
  int64_t numRuns = self->_numRuns;
  NSUInteger v9 = (objc_class *)objc_opt_class();
  size_t InstanceSize = class_getInstanceSize(v9);
  bzero(self, InstanceSize);
  object_setClass(self, Class);
  os_unfair_lock_unlock((os_unfair_lock_t)&__NSCachedAttrStringLock);

  if (runs)
  {
    if (numRuns >= 1)
    {
      p_var0 = &runs->var0;
      do
      {
        v12 = *p_var0;
        p_var0 += 2;
      }
      while (p_var0 < &runs[numRuns].var0);
    }
    v13 = (NSZone *)MEMORY[0x192FADFB0](runs);
    NSZoneFree(v13, runs);
  }
}

- (void)dealloc
{
  runs = self->_runs;
  if (runs)
  {
    int64_t numRuns = self->_numRuns;
    if (numRuns >= 1)
    {
      int v5 = &runs[numRuns];
      BOOL v6 = self->_runs;
      do
      {
        id var0 = v6->var0;
        ++v6;
      }
      while (v6 < v5);
    }
    objc_super v8 = (NSZone *)MEMORY[0x192FADFB0](runs);
    NSZoneFree(v8, runs);
  }
  v9.receiver = self;
  v9.super_class = (Class)_NSCachedAttributedString;
  [(_NSCachedAttributedString *)&v9 dealloc];
}

- (_NSCachedAttributedString)initWithAttributedString:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NSCachedAttributedString;
  v4 = [(_NSCachedAttributedString *)&v6 init];
  if (v4)
  {
    v4->_id contents = (id)[a3 copyWithZone:0];
    v4->_int64_t length = [a3 length];
  }
  return v4;
}

- (_NSCachedAttributedString)initWithString:(id)a3 attributes:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_NSCachedAttributedString;
  objc_super v6 = [(_NSCachedAttributedString *)&v8 init];
  if (v6)
  {
    v6->_id contents = (id)[a3 copyWithZone:0];
    v6->_baseAttributes = (NSAttributeDictionary *)+[NSAttributeDictionary newWithDictionary:a4];
    v6->_int64_t length = [a3 length];
  }
  return v6;
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  if (!a3) {
    return;
  }
  NSUInteger length = a4.length;
  if (!a4.length) {
    return;
  }
  NSUInteger location = a4.location;
  int64_t v7 = a4.location + a4.length;
  int64_t v8 = self->_length;
  if (a4.location + a4.length > v8 || v8 < 1) {
    return;
  }
  runs = self->_runs;
  if (!runs)
  {
    runs = ($46F502DC38217A82D4112E7F869769E9 *)NSAllocateScannedUncollectable();
    self->_runs = runs;
    int64_t v12 = self->_length;
    runs->id var0 = 0;
    runs->var1 = v12;
    self->_int64_t numRuns = 1;
    self->_int64_t allocedRunsSize = 5;
    int64_t v8 = self->_length;
  }
  int64_t v13 = 0;
  int64_t v14 = 0;
  v15 = runs;
LABEL_10:
  p_id var0 = 0;
  while (2)
  {
    unint64_t v17 = v14;
    int64_t v18 = v14;
    v19 = ($46F502DC38217A82D4112E7F869769E9 *)p_var0;
    while (1)
    {
      if (v13 >= v8)
      {
        uint64_t v21 = 0;
        goto LABEL_19;
      }
      int64_t v14 = v18;
      if (v19) {
        break;
      }
      NSUInteger v20 = v15->var1 + v13;
      int64_t v18 = v13;
      v19 = v15;
      if (location >= v20)
      {
        ++v15;
        int64_t v13 = v20;
        goto LABEL_10;
      }
    }
    v13 += v19->var1;
    uint64_t v21 = v13 - v7;
    if (v13 < v7)
    {
      p_id var0 = &v19[1].var0;
      continue;
    }
    break;
  }
  unint64_t v17 = v18;
  p_id var0 = &v19->var0;
LABEL_19:
  if (location > v17)
  {
    v15->var1 = location - v17;
    ++v15;
  }
  if (p_var0 > (id *)v15)
  {
    if (v21 >= 1)
    {
      p_var0[1] = (id)v21;
      p_var0 -= 2;
    }
    goto LABEL_26;
  }
  if (v15 != ($46F502DC38217A82D4112E7F869769E9 *)p_var0 || v21 >= 1)
  {
    if (!p_var0) {
      return;
    }
    BOOL v27 = p_var0 < (id *)v15;
    BOOL v28 = v21 > 0;
    BOOL v29 = v27 && v28;
    if (v27 && v28) {
      uint64_t v30 = 2;
    }
    else {
      uint64_t v30 = 1;
    }
    int64_t numRuns = self->_numRuns;
    int64_t allocedRunsSize = self->_allocedRunsSize;
    if (numRuns + v30 > allocedRunsSize)
    {
      int64_t v33 = (char *)v15 - (char *)runs;
      int64_t v34 = (char *)p_var0 - (char *)runs;
      self->_int64_t allocedRunsSize = allocedRunsSize + 5;
      runs = ($46F502DC38217A82D4112E7F869769E9 *)NSReallocateScannedUncollectable();
      self->_runs = runs;
      v15 = ($46F502DC38217A82D4112E7F869769E9 *)((char *)runs + v33);
      p_id var0 = (id *)((char *)&runs->var0 + v34);
      int64_t numRuns = self->_numRuns;
    }
    memmove(&p_var0[2 * v30], p_var0, (char *)&runs[numRuns] - (char *)p_var0);
    if (v29)
    {
      id v35 = *p_var0;
    }
    else if (v21 < 1)
    {
LABEL_44:
      v15->id var0 = +[NSAttributeDictionary newWithDictionary:a3];
      v15->var1 = length;
      self->_numRuns += v30;
      return;
    }
    p_var0[2 * v30 + 1] = (id)v21;
    goto LABEL_44;
  }
LABEL_26:
  if (v15 <= ($46F502DC38217A82D4112E7F869769E9 *)p_var0)
  {
    unint64_t v22 = 0;
    v23 = &v15->var0;
    do
    {
      ++v22;
      v24 = *v23;
      v23 += 2;
    }
    while (v23 <= p_var0);
  }
  else
  {
    unint64_t v22 = 0;
    v23 = &v15->var0;
  }
  v15->id var0 = +[NSAttributeDictionary newWithDictionary:a3];
  v15->var1 = length;
  if (v22 >= 2)
  {
    int64_t v25 = self->_numRuns;
    int64_t v26 = (char *)&self->_runs[v25] - (char *)v23;
    if (v26 >= 1)
    {
      memmove(&v15[1], v23, v26);
      int64_t v25 = self->_numRuns;
    }
    self->_int64_t numRuns = v25 - ((uint64_t)(16 * v22 - 16) >> 4);
  }
}

- (unint64_t)length
{
  return self->_length;
}

- (BOOL)_isStringDrawingTextStorage
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v3 = [v2 integerForKey:@"NSStringDrawingLongTermCacheSize"];
    if (v3) {
      __NSCachedAttrStringLongTermCacheSize = v3 & ~(v3 >> 63);
    }
    uint64_t v4 = [v2 integerForKey:@"NSStringDrawingLongTermThreshold"];
    if (v4 >= 1) {
      __NSCachedAttrStringLongTermPromotionThreshold = v4;
    }
    uint64_t v5 = [v2 integerForKey:@"NSStringDrawingShortTermCacheSize"];
    if (v5) {
      __NSCachedAttrStringShortTermCacheSize = v5 & ~(v5 >> 63);
    }
  }
}

- (id)copyCachedInstance
{
  if (__NSCachedAttrStringShortTermCacheSize >= 1)
  {
    os_unfair_lock_lock_with_options();
    if (__NSCachedAttrStringShortTermCache)
    {
      uint64_t v3 = (void *)[(id)__NSCachedAttrStringShortTermCache member:self];
      uint64_t v4 = v3;
      if (v3) {
        uint64_t v5 = v3;
      }
    }
    else
    {
      uint64_t v4 = 0;
    }
    if (__NSCachedAttrStringLongTermCacheSize >= 1)
    {
      if (v4)
      {
        uint64_t v6 = v4[8] + 1;
        v4[8] = v6;
        if (v6 >= __NSCachedAttrStringLongTermPromotionThreshold)
        {
          if (__NSCachedAttrStringLongTermStack)
          {
            id v7 = (id)__NSCachedAttrStringLongTermCache;
          }
          else
          {
            __NSCachedAttrStringLongTermStack = NSAllocateScannedUncollectable();
            id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            __NSCachedAttrStringLongTermCache = (uint64_t)v7;
          }
          if (![v7 member:v4])
          {
            unint64_t v10 = *(void **)(__NSCachedAttrStringLongTermStack + 8 * __NSCachedAttrStringLongTermStackIndex);
            if (v10)
            {
              id v12 = v10;
              [(id)__NSCachedAttrStringLongTermCache removeObject:v10];
            }
            [(id)__NSCachedAttrStringLongTermCache addObject:v4];
            uint64_t v13 = __NSCachedAttrStringLongTermStackIndex++;
            *(void *)(__NSCachedAttrStringLongTermStack + 8 * v13) = v4;
            if (v13 + 1 >= __NSCachedAttrStringLongTermCacheSize) {
              __NSCachedAttrStringLongTermStackIndex = 0;
            }
            goto LABEL_19;
          }
        }
      }
      else if (__NSCachedAttrStringLongTermCache)
      {
        int64_t v8 = (void *)[(id)__NSCachedAttrStringLongTermCache member:self];
        uint64_t v4 = v8;
        if (v8) {
          objc_super v9 = v8;
        }
      }
      else
      {
        uint64_t v4 = 0;
      }
    }
    unint64_t v10 = 0;
LABEL_19:
    os_unfair_lock_unlock((os_unfair_lock_t)&__NSCachedAttrStringLock);

    return v4;
  }
  return 0;
}

- (void)cache
{
  if (__NSCachedAttrStringShortTermCacheSize < 1 || !self->_runs) {
    return;
  }
  os_unfair_lock_lock_with_options();
  if (([(id)__NSCachedAttrStringShortTermCache containsObject:self] & 1) == 0
    && ([(id)__NSCachedAttrStringLongTermCache containsObject:self] & 1) == 0)
  {
    if (__NSCachedAttrStringShortTermCache)
    {
      unint64_t v3 = [(id)__NSCachedAttrStringShortTermCache count];
      uint64_t v4 = (void *)__NSCachedAttrStringShortTermCache;
      if (v3 >= __NSCachedAttrStringShortTermCacheSize)
      {
        __NSCachedAttrStringShortTermCache = 0;
        id v5 = v4;
      }
      else
      {
        id v5 = 0;
        if (__NSCachedAttrStringShortTermCache)
        {
LABEL_14:
          [v4 addObject:self];
          goto LABEL_15;
        }
      }
    }
    else
    {
      id v5 = 0;
    }
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:0];
    __NSCachedAttrStringShortTermCache = (uint64_t)v4;
    goto LABEL_14;
  }
  id v5 = 0;
LABEL_15:
  os_unfair_lock_unlock((os_unfair_lock_t)&__NSCachedAttrStringLock);
}

- (BOOL)hasColorGlyphsInRange:(_NSRange)a3
{
  NSUInteger v3 = a3.location + a3.length;
  if (a3.location < a3.location + a3.length)
  {
    int64_t v5 = 0;
    runs = self->_runs;
    while (1)
    {
      if (runs && (int64_t length = self->_length, v5 < length))
      {
        while (1)
        {
          int64_t var1 = runs->var1;
          int64_t v9 = var1 + v5;
          if (var1 + v5 > a3.location) {
            break;
          }
          ++runs;
          v5 += var1;
          if (v9 >= length)
          {
            int64_t var1 = 0;
            uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
            int64_t v5 = v9;
            goto LABEL_9;
          }
        }
        id var0 = (NSAttributeDictionary *)runs->var0;
        uint64_t v10 = v5;
        if (runs->var0) {
          goto LABEL_12;
        }
      }
      else
      {
        int64_t var1 = 0;
        uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
LABEL_9:
      id var0 = self->_baseAttributes;
      if (!var0) {
        id var0 = (NSAttributeDictionary *)objc_msgSend(self->_contents, "attributesAtIndex:longestEffectiveRange:inRange:", a3.location, 0, a3.location, v3 - a3.location);
      }
LABEL_12:
      BOOL result = objc_msgSend((id)-[NSAttributeDictionary objectForKeyedSubscript:](var0, "objectForKeyedSubscript:", @"NSFont"), "_hasColorGlyphs");
      if (!result)
      {
        a3.NSUInteger location = v10 + var1;
        if (v10 + var1 < v3) {
          continue;
        }
      }
      return result;
    }
  }
  return 0;
}

- (BOOL)_baselineMode
{
  return 1;
}

- (id)attributesAtIndex:(unint64_t)a3 longestEffectiveRange:(_NSRange *)a4 inRange:(_NSRange)a5
{
  runs = self->_runs;
  if (!runs) {
    goto LABEL_10;
  }
  int64_t length = self->_length;
  if (length < 1) {
    goto LABEL_10;
  }
  v10.NSUInteger location = 0;
  p_int64_t var1 = (NSUInteger *)&runs->var1;
  while (1)
  {
    NSUInteger v12 = *p_var1 + v10.location;
    if (v12 > a3) {
      break;
    }
    p_var1 += 2;
    v10.NSUInteger location = v12;
    if ((uint64_t)v12 >= length) {
      goto LABEL_10;
    }
  }
  v10.int64_t length = *p_var1;
  NSRange v13 = NSIntersectionRange(v10, a5);
  a5 = v13;
  id result = (id)*(p_var1 - 1);
  if (result)
  {
    if (a4) {
      *a4 = v13;
    }
  }
  else
  {
LABEL_10:
    id result = self->_baseAttributes;
    if (result)
    {
      if (a4)
      {
        *a4 = a5;
        return self->_baseAttributes;
      }
    }
    else
    {
      id contents = self->_contents;
      return (id)objc_msgSend(contents, "attributesAtIndex:longestEffectiveRange:inRange:", a3, a4, a5.location, a5.length);
    }
  }
  return result;
}

- (BOOL)_tryRetain
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 1;
}

- (_NSCachedAttributedString)initWithString:(id)a3
{
  return [(_NSCachedAttributedString *)self initWithString:a3 attributes:0];
}

- (_NSCachedAttributedString)init
{
  v4.receiver = self;
  v4.super_class = (Class)_NSCachedAttributedString;
  v2 = [(_NSCachedAttributedString *)&v4 init];
  v2->_id contents = (id)[&stru_1EDD49F70 copyWithZone:0];
  v2->_baseAttributes = (NSAttributeDictionary *)+[NSAttributeDictionary newWithDictionary:0];
  return v2;
}

- (void)finalize
{
  runs = self->_runs;
  if (runs)
  {
    int64_t numRuns = self->_numRuns;
    if (numRuns >= 1)
    {
      int64_t v5 = &runs[numRuns];
      uint64_t v6 = self->_runs;
      do
      {
        id var0 = v6->var0;
        ++v6;
      }
      while (v6 < v5);
    }
    int64_t v8 = (NSZone *)MEMORY[0x192FADFB0](runs, a2);
    NSZoneFree(v8, runs);
  }
  v9.receiver = self;
  v9.super_class = (Class)_NSCachedAttributedString;
  [(_NSCachedAttributedString *)&v9 finalize];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!isEqual___NSCachedAttributedStringClass) {
    isEqual___NSCachedAttributedStringClass = objc_opt_class();
  }
  if (objc_opt_class() != isEqual___NSCachedAttributedStringClass) {
    return 0;
  }
  if (self->_hashValue) {
    [(_NSCachedAttributedString *)self hash];
  }
  uint64_t v6 = *((void *)a3 + 4);
  if (v6)
  {
    [a3 hash];
    uint64_t v6 = *((void *)a3 + 4);
  }
  unint64_t hashValue = self->_hashValue;
  BOOL v5 = hashValue == v6;
  if (hashValue == v6)
  {
    baseAttributes = self->_baseAttributes;
    if (baseAttributes != *((NSAttributeDictionary **)a3 + 2)
      && !-[NSAttributeDictionary isEqual:](baseAttributes, "isEqual:"))
    {
      return 0;
    }
    if (![self->_contents isEqual:*((void *)a3 + 1)]) {
      return 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t result = self->_hashValue;
  if (!result)
  {
    uint64_t v4 = [self->_contents hash];
    unint64_t result = [(NSAttributeDictionary *)self->_baseAttributes hash] + v4;
    self->_unint64_t hashValue = result;
  }
  return result;
}

@end