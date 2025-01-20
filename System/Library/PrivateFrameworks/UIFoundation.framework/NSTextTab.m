@interface NSTextTab
+ (BOOL)supportsSecureCoding;
+ (NSCharacterSet)columnTerminatorsForLocale:(NSLocale *)aLocale;
+ (NSTextTab)allocWithZone:(_NSZone *)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (CGFloat)location;
- (NSDictionary)options;
- (NSTextAlignment)alignment;
- (NSTextTab)init;
- (NSTextTab)initWithCoder:(id)a3;
- (NSTextTab)initWithTextAlignment:(NSTextAlignment)alignment location:(CGFloat)loc options:(NSDictionary *)options;
- (NSTextTab)initWithType:(NSTextTabType)type location:(CGFloat)loc;
- (NSTextTabType)tabStopType;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)release;
@end

@implementation NSTextTab

- (CGFloat)location
{
  return self->_location;
}

- (void)release
{
  os_unfair_lock_lock_with_options();
  if ([(NSTextTab *)self retainCount] == 1
    && (NSTextTab *)__NSTextTabScratchInstance != self
    && (NSTextTab *)__NSTextTabAllocMarkerInstance != self
    && __NSTextTabTable != 0)
  {
    if (_NSTextTabTableIsCFSet == 1) {
      Value = (NSTextTab *)CFSetGetValue((CFSetRef)__NSTextTabTable, self);
    }
    else {
      Value = (NSTextTab *)[(id)__NSTextTabTable member:self];
    }
    if (Value == self)
    {
      if (_NSTextTabTableIsCFSet == 1) {
        CFSetRemoveValue((CFMutableSetRef)__NSTextTabTable, self);
      }
      else {
        [(id)__NSTextTabTable removeObject:self];
      }
    }
  }
  os_unfair_lock_unlock(&__NSTextTabLock);
  v5.receiver = self;
  v5.super_class = (Class)NSTextTab;
  [(NSTextTab *)&v5 release];
}

- (void)dealloc
{
  if ((NSTextTab *)__NSTextTabScratchInstance != self)
  {
    v2.receiver = self;
    v2.super_class = (Class)NSTextTab;
    [(NSTextTab *)&v2 dealloc];
  }
}

+ (NSTextTab)allocWithZone:(_NSZone *)a3
{
  result = (NSTextTab *)__NSTextTabAllocMarkerInstance;
  if (__NSTextTabAllocMarkerInstance) {
    BOOL v5 = __NSTextTabClass == (void)a1;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___NSTextTab;
    return (NSTextTab *)objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
  return result;
}

- (NSTextTab)initWithTextAlignment:(NSTextAlignment)alignment location:(CGFloat)loc options:(NSDictionary *)options
{
  if ((NSTextTab *)__NSTextTabAllocMarkerInstance == self)
  {
    os_unfair_lock_lock_with_options();
    CTTextAlignment v9 = NSTextAlignmentToCTTextAlignment(alignment);
    uint64_t v10 = __NSTextTabScratchInstance;
    *(_DWORD *)(__NSTextTabScratchInstance + 8) = *(_DWORD *)(__NSTextTabScratchInstance + 8) & 0xFFFFFFF0 | v9 & 0xF;
    *(CGFloat *)(v10 + 16) = loc;
    *(void *)(v10 + 24) = options;
    if (_NSTextTabTableIsCFSet == 1) {
      Value = (CGFloat *)CFSetGetValue((CFSetRef)__NSTextTabTable, (const void *)v10);
    }
    else {
      Value = (CGFloat *)[(id)__NSTextTabTable member:v10];
    }
    v12 = Value;
    if (Value)
    {
      v13 = Value;
    }
    else
    {
      v12 = (CGFloat *)NSAllocateObject((Class)__NSTextTabClass, 0, 0);
      *((_DWORD *)v12 + 2) = v12[1] & 0xFFFFFFF0 | NSTextAlignmentToCTTextAlignment(alignment) & 0xF;
      v12[2] = loc;
      *((void *)v12 + 3) = [(NSDictionary *)options copyWithZone:[(CGFloat *)v12 zone]];
      if (_NSTextTabTableIsCFSet == 1) {
        v14 = (NSTextTab *)CFSetGetValue((CFSetRef)__NSTextTabTable, v12);
      }
      else {
        v14 = (NSTextTab *)[(id)__NSTextTabTable member:v12];
      }
      v8 = v14;
      if (v14)
      {
        v15 = v14;
        os_unfair_lock_unlock(&__NSTextTabLock);

        return v8;
      }
      if (_NSTextTabTableIsCFSet == 1) {
        CFSetSetValue((CFMutableSetRef)__NSTextTabTable, v12);
      }
      else {
        [(id)__NSTextTabTable addObject:v12];
      }
    }
    os_unfair_lock_unlock(&__NSTextTabLock);
    return (NSTextTab *)v12;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)NSTextTab;
    v8 = [(NSTextTab *)&v17 init];
    if (v8)
    {
      v8->_flags = ($E8CC2FB65D3C9415B1353094956A9E28)(*(_DWORD *)&v8->_flags & 0xFFFFFFF0 | NSTextAlignmentToCTTextAlignment(alignment) & 0xF);
      v8->_location = loc;
      v8->_reserved = (id)[(NSDictionary *)options copyWithZone:[(NSTextTab *)v8 zone]];
    }
  }
  return v8;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __NSTextTabClass = (uint64_t)a1;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"__NSDisableSharingTextTabInstance") & 1) == 0)
    {
      __NSTextTabScratchInstance = (uint64_t)NSAllocateObject((Class)__NSTextTabClass, 0, 0);
      __NSTextTabAllocMarkerInstance = (uint64_t)NSAllocateObject((Class)__NSTextTabClass, 0, 0);
      _NSTextTabTableIsCFSet = 1;
      CFSetCallBacks v3 = *(CFSetCallBacks *)byte_1EDD499A8;
      __NSTextTabTable = (uint64_t)CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], 0, &v3);
    }
  }
}

- (NSTextTab)initWithType:(NSTextTabType)type location:(CGFloat)loc
{
  if (type == NSDecimalTabStopType)
  {
    if (__NSDecimalTabAlignment) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 4;
    }
    if (__NSCachedDecimalTabAttribute_onceToken != -1)
    {
      v11 = self;
      double v10 = loc;
      uint64_t v9 = v6;
      dispatch_once(&__NSCachedDecimalTabAttribute_onceToken, &__block_literal_global_447);
      uint64_t v6 = v9;
      self = v11;
      loc = v10;
    }
    uint64_t v7 = __NSCachedDecimalTabAttribute___NSDefaultDecimalTabOptions;
  }
  else
  {
    uint64_t v5 = 2;
    if (type != NSRightTabStopType) {
      uint64_t v5 = 0;
    }
    if (type == NSCenterTabStopType) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v5;
    }
    uint64_t v7 = 0;
  }
  return [(NSTextTab *)self initWithTextAlignment:v6 location:v7 options:loc];
}

- (NSTextTab)init
{
  return [(NSTextTab *)self initWithTextAlignment:0 location:MEMORY[0x1E4F1CC08] options:0.0];
}

+ (NSCharacterSet)columnTerminatorsForLocale:(NSLocale *)aLocale
{
  CFSetCallBacks v3 = aLocale;
  if (!aLocale) {
    CFSetCallBacks v3 = (NSLocale *)[MEMORY[0x1E4F1CA20] systemLocale];
  }
  uint64_t v4 = [(NSLocale *)v3 objectForKey:*MEMORY[0x1E4F1C418]];
  if ([(__CFString *)v4 length]) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = @".";
  }
  unsigned int v6 = [(__CFString *)v5 characterAtIndex:0];
  uint64_t v7 = v6;
  if ((v6 & 0xFC00) == 0xD800 && (unint64_t)[(__CFString *)v5 length] >= 2)
  {
    int v8 = [(__CFString *)v5 characterAtIndex:1];
    if ((v8 & 0xFC00) == 0xDC00) {
      uint64_t v7 = (v8 + (v7 << 10) - 56613888);
    }
  }
  uint64_t v9 = (void *)MEMORY[0x1E4F28B88];

  return (NSCharacterSet *)objc_msgSend(v9, "characterSetWithRange:", v7, 1);
}

- (NSTextAlignment)alignment
{
  return NSTextAlignmentFromCTTextAlignment((CTTextAlignment)(*(_DWORD *)&self->_flags & 0xF));
}

- (NSDictionary)options
{
  if (self->_reserved) {
    return (NSDictionary *)self->_reserved;
  }
  else {
    return (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
}

- (NSTextTabType)tabStopType
{
  NSTextAlignment v3 = NSTextAlignmentFromCTTextAlignment((CTTextAlignment)(*(_DWORD *)&self->_flags & 0xF));
  uint64_t v4 = v3;
  uint64_t v5 = 4;
  if (__NSDecimalTabAlignment) {
    uint64_t v5 = 2;
  }
  if (v3 == v5)
  {
    id reserved = self->_reserved;
    if (__NSCachedDecimalTabAttribute_onceToken != -1) {
      dispatch_once(&__NSCachedDecimalTabAttribute_onceToken, &__block_literal_global_447);
    }
    if ([reserved isEqualToDictionary:__NSCachedDecimalTabAttribute___NSDefaultDecimalTabOptions]) {
      return 3;
    }
  }
  if ((unint64_t)v4 < 3) {
    return qword_18E5F7590[v4];
  }
  if (v4 > 4) {
    return 0;
  }
  return (unint64_t)(+[NSParagraphStyle _defaultWritingDirection] == 1);
}

- (NSTextTab)initWithCoder:(id)a3
{
  unsigned __int8 v18 = 0;
  if (![a3 allowsKeyedCoding])
  {
    float v17 = 0.0;
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "Cf", &v18, &v17);
    self->_double location = v17;
    unsigned int v15 = v18;
    return -[NSTextTab initWithType:location:](self, "initWithType:location:", v15);
  }
  [a3 decodeDoubleForKey:@"NSLocation"];
  self->_double location = v5;
  if (![a3 containsValueForKey:@"NSTextAlignment"])
  {
    char v16 = [a3 decodeIntegerForKey:@"NSType"];
    unsigned int v15 = v16 & 0xF;
    unsigned __int8 v18 = v16 & 0xF;
    return -[NSTextTab initWithType:location:](self, "initWithType:location:", v15);
  }
  NSTextAlignment v6 = NSTextAlignmentFromCTTextAlignment((CTTextAlignment)[a3 decodeIntegerForKey:@"NSTextAlignment"]);
  double location = self->_location;
  int v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0), @"NSTabOptions");

  return [(NSTextTab *)self initWithTextAlignment:v6 location:v13 options:location];
}

- (void)encodeWithCoder:(id)a3
{
  unsigned __int8 v5 = [(NSTextTab *)self tabStopType];
  unsigned __int8 v11 = v5;
  if ([a3 allowsKeyedCoding])
  {
    if (NSTextAlignmentFromCTTextAlignment((CTTextAlignment)(*(_DWORD *)&self->_flags & 0xF)) > NSTextAlignmentCenter
      || self->_reserved && v5 != 3)
    {
      $E8CC2FB65D3C9415B1353094956A9E28 flags = self->_flags;
      if ((*(unsigned char *)&flags & 0xF) != 0) {
        [a3 encodeInteger:*(unsigned char *)&flags & 0xF forKey:@"NSTextAlignment"];
      }
      id reserved = self->_reserved;
      if (reserved) {
        [a3 encodeObject:reserved forKey:@"NSTabOptions"];
      }
    }
    if (v5) {
      [a3 encodeInteger:v5 forKey:@"NSType"];
    }
    double location = self->_location;
    [a3 encodeDouble:@"NSLocation" forKey:location];
  }
  else
  {
    float v9 = self->_location;
    float v10 = v9;
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "Cf", &v11, &v10);
  }
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (a3 == self) {
    return 1;
  }
  if (__NSTextTabScratchInstance)
  {
    Class = object_getClass(a3);
    if (Class == object_getClass(self) && object_getClass(self) == (Class)__NSTextTabClass) {
      return 0;
    }
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  NSTextAlignment v6 = NSTextAlignmentFromCTTextAlignment((CTTextAlignment)(*(_DWORD *)&self->_flags & 0xF));
  if (v6 != [a3 alignment]) {
    return 0;
  }
  double location = self->_location;
  [a3 location];
  if (location != v8) {
    return 0;
  }
  id reserved = self->_reserved;
  uint64_t v10 = [a3 options];

  return [reserved isEqualToDictionary:v10];
}

- (id)description
{
  char v3 = [(NSTextTab *)self tabStopType];
  uint64_t v4 = NSString;
  double location = self->_location;
  if (v3 == 3)
  {
    NSTextAlignment v6 = "D";
  }
  else if (NSTextAlignmentFromCTTextAlignment((CTTextAlignment)(*(_DWORD *)&self->_flags & 0xF)) <= NSTextAlignmentNatural)
  {
    NSTextAlignment v6 = __NSAlignmentTable[*(_DWORD *)&self->_flags & 0xF];
  }
  else
  {
    NSTextAlignment v6 = "?";
  }
  if ([self->_reserved count]) {
    id reserved = (__CFString *)self->_reserved;
  }
  else {
    id reserved = &stru_1EDD49F70;
  }
  return (id)[v4 stringWithFormat:@"%g%s%@", *(void *)&location, v6, reserved];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end