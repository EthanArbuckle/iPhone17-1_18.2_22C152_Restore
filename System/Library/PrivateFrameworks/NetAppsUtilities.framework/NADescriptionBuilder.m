@interface NADescriptionBuilder
+ (NSString)componentSeparator;
+ (NSString)nameObjectSeparator;
+ (id)builderWithObject:(id)a3;
+ (id)descriptionForObject:(id)a3;
+ (id)descriptionForObject:(id)a3 withObjectsAndNames:(id)a4;
+ (id)succinctDescriptionForObject:(id)a3;
- (BOOL)useDebugDescription;
- (NADescriptionBuilder)initWithObject:(id)a3;
- (NSString)activeMultilinePrefix;
- (id)_activeComponentString;
- (id)appendBool:(BOOL)a3 withName:(id)a4;
- (id)appendBool:(BOOL)a3 withName:(id)a4 ifEqualTo:(BOOL)a5;
- (id)appendCString:(const char *)a3 withName:(id)a4;
- (id)appendClass:(Class)a3 withName:(id)a4;
- (id)appendDouble:(double)a3 withName:(id)a4 decimalPrecision:(unint64_t)a5;
- (id)appendFormat:(id)a3;
- (id)appendInt64:(int64_t)a3 withName:(id)a4;
- (id)appendInt:(int)a3 withName:(id)a4;
- (id)appendInteger:(int64_t)a3 withName:(id)a4;
- (id)appendKey:(id)a3;
- (id)appendKeys:(id)a3;
- (id)appendObject:(id)a3 withName:(id)a4;
- (id)appendObject:(id)a3 withName:(id)a4 skipIfNil:(BOOL)a5;
- (id)appendObjectsAndNames:(id)a3;
- (id)appendObjectsAndNames:(id)a3 args:(char *)a4;
- (id)appendPointer:(void *)a3 withName:(id)a4;
- (id)appendQueue:(id)a3 withName:(id)a4;
- (id)appendSelector:(SEL)a3 withName:(id)a4;
- (id)appendString:(id)a3;
- (id)appendSuper;
- (id)appendTimeInterval:(double)a3 withName:(id)a4 decomposeUnits:(BOOL)a5;
- (id)appendUInt64:(unint64_t)a3 withName:(id)a4;
- (id)appendUnsignedInt:(unsigned int)a3 withName:(id)a4;
- (id)appendUnsignedInteger:(unint64_t)a3 withName:(id)a4;
- (id)build;
- (id)modifyBody:(id)a3;
- (id)modifyProem:(id)a3;
- (int)activeComponent;
- (void)appendArraySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6;
- (void)appendArraySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6 objectTransformer:(id)a7;
- (void)appendArraySection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5;
- (void)appendArraySection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5 objectTransformer:(id)a6;
- (void)appendBodySectionWithName:(id)a3 multilinePrefix:(id)a4 block:(id)a5;
- (void)appendDictionarySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6;
- (void)appendDictionarySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6 objectTransformer:(id)a7;
- (void)appendDictionarySection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5;
- (void)appendString:(id)a3 withName:(id)a4;
- (void)appendString:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5;
- (void)setActiveComponent:(int)a3;
- (void)setActiveMultilinePrefix:(id)a3;
- (void)setUseDebugDescription:(BOOL)a3;
- (void)tryAppendKey:(id)a3;
@end

@implementation NADescriptionBuilder

- (void)appendArraySection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5 objectTransformer:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(NADescriptionBuilder *)self activeMultilinePrefix];
  [(NADescriptionBuilder *)self appendArraySection:v12 withName:v11 multilinePrefix:v13 skipIfEmpty:v6 objectTransformer:v10];
}

- (void)appendArraySection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(NADescriptionBuilder *)self activeMultilinePrefix];
  [(NADescriptionBuilder *)self appendArraySection:v9 withName:v8 multilinePrefix:v10 skipIfEmpty:v5];
}

- (NSString)activeMultilinePrefix
{
  if (self->_activePrefix) {
    return self->_activePrefix;
  }
  else {
    return (NSString *)&stru_1F0E49DB0;
  }
}

- (void)appendArraySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6 objectTransformer:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = (void *)MEMORY[0x1BA99CC90]();
  if (v15)
  {
    v17 = [MEMORY[0x1E4F1CA48] array];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __98__NADescriptionBuilder_appendArraySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke;
    v24[3] = &unk_1E6109E70;
    id v26 = v15;
    id v18 = v17;
    id v25 = v18;
    [v12 enumerateObjectsUsingBlock:v24];
    id v19 = v18;

    id v12 = v19;
  }
  if (!v8 || [v12 count])
  {
    if ([v12 count])
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __98__NADescriptionBuilder_appendArraySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke_2;
      v21[3] = &unk_1E61099B8;
      id v22 = v12;
      v23 = self;
      [(NADescriptionBuilder *)self appendBodySectionWithName:v13 multilinePrefix:v14 block:v21];
    }
    else if (v13)
    {
      id v20 = [(NADescriptionBuilder *)self appendObject:@"(empty)" withName:v13];
    }
  }
}

- (void)appendArraySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePrefix, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_proem, 0);
  objc_destroyWeak((id *)&self->_object);
}

+ (id)builderWithObject:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1BA99CC90]();
  BOOL v6 = (void *)[objc_alloc((Class)a1) initWithObject:v4];

  return v6;
}

- (NADescriptionBuilder)initWithObject:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NADescriptionBuilder;
  BOOL v5 = [(NADescriptionBuilder *)&v19 init];
  BOOL v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_object, v4);
    v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    description = v6->_description;
    v6->_description = v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"<"];
    proem = v6->_proem;
    v6->_proem = (NSMutableString *)v9;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_object);
    if (WeakRetained)
    {
      id v12 = v6->_proem;
      id v13 = objc_loadWeakRetained((id *)&v6->_object);
      id v14 = (objc_class *)objc_opt_class();
      id v15 = NSStringFromClass(v14);
      id v16 = objc_loadWeakRetained((id *)&v6->_object);
      [(NSMutableString *)v12 appendFormat:@"%@: %p", v15, v16];
    }
    v6->_activeComponent = 0;
    v17 = v6;
  }

  return v6;
}

id __98__NADescriptionBuilder_appendArraySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (id)[*(id *)(a1 + 32) appendObject:a2 withName:0];
}

- (id)appendObject:(id)a3 withName:(id)a4
{
  return [(NADescriptionBuilder *)self appendObject:a3 withName:a4 skipIfNil:0];
}

- (id)build
{
  [(NSMutableString *)self->_proem appendString:@">"];
  description = self->_description;
  id v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  BOOL v5 = [(NSMutableString *)description stringByTrimmingCharactersInSet:v4];

  if ([v5 length]) {
    uint64_t v6 = [[NSString alloc] initWithFormat:@"%@ %@", self->_proem, v5];
  }
  else {
    uint64_t v6 = [(NSMutableString *)self->_proem copy];
  }
  v7 = (void *)v6;

  return v7;
}

- (id)appendObject:(id)a3 withName:(id)a4 skipIfNil:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8 || !a5)
  {
    id v10 = (void *)MEMORY[0x1BA99CC90]();
    if ([v8 conformsToProtocol:&unk_1F0E4F718])
    {
      if (self->_useDebugDescription) {
        [v8 debugDescription];
      }
      else {
      uint64_t v11 = [v8 description];
      }
    }
    else
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v8);
    }
    id v12 = (void *)v11;
    if (self->_activeComponent == 1)
    {
      activePrefix = (__CFString *)self->_activePrefix;
      if (!activePrefix) {
        activePrefix = &stru_1F0E49DB0;
      }
      id v14 = [NSString stringWithFormat:@"%@", activePrefix];
      id v15 = @" = ";
      id v16 = @";\n";
    }
    else
    {
      id v14 = [(id)objc_opt_class() componentSeparator];
      id v15 = [(id)objc_opt_class() nameObjectSeparator];
      id v16 = &stru_1F0E49DB0;
    }
    uint64_t v17 = [v9 length];
    id v18 = [(NADescriptionBuilder *)self _activeComponentString];
    objc_super v19 = v18;
    if (v17) {
      [v18 appendFormat:@"%@%@%@%@%@", v14, v9, v15, v12, v16];
    }
    else {
      [v18 appendFormat:@"%@%@%@", v14, v12, v16, v21, v22];
    }
  }

  return self;
}

- (id)_activeComponentString
{
  uint64_t v2 = 24;
  if (!self->_activeComponent) {
    uint64_t v2 = 16;
  }
  return *(id *)((char *)&self->super.isa + v2);
}

- (void)appendBodySectionWithName:(id)a3 multilinePrefix:(id)a4 block:(id)a5
{
  id v17 = a3;
  id v8 = (void (**)(void))a5;
  int activeComponent = self->_activeComponent;
  self->_int activeComponent = 1;
  id v10 = &stru_1F0E49DB0;
  if (a4) {
    id v10 = (__CFString *)a4;
  }
  uint64_t v11 = v10;
  id v12 = v11;
  if (v17) {
    [(NSMutableString *)self->_description appendFormat:@"%@%@ = ", v11, v17];
  }
  [(NSMutableString *)self->_description appendString:@"{"];
  description = self->_description;
  if (v8)
  {
    id v14 = (void *)MEMORY[0x1BA99CC90]([(NSMutableString *)description appendString:@"\n"]);
    id v15 = (void *)[(NSString *)self->_activePrefix copy];
    id v16 = [(__CFString *)v12 stringByAppendingString:@"    "];
    [(NADescriptionBuilder *)self setActiveMultilinePrefix:v16];

    v8[2](v8);
    [(NADescriptionBuilder *)self setActiveMultilinePrefix:v15];

    [(NSMutableString *)self->_description appendFormat:@"%@}\n", v12];
  }
  else
  {
    [(NSMutableString *)description appendString:@" }\n"];
  }
  self->_int activeComponent = activeComponent;
}

- (void)setActiveMultilinePrefix:(id)a3
{
}

+ (NSString)nameObjectSeparator
{
  return (NSString *)@": ";
}

+ (NSString)componentSeparator
{
  return (NSString *)@"; ";
}

uint64_t __98__NADescriptionBuilder_appendArraySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __98__NADescriptionBuilder_appendArraySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke_3;
  v3[3] = &unk_1E610A520;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateObjectsUsingBlock:v3];
}

+ (id)descriptionForObject:(id)a3
{
  return (id)[a1 descriptionForObject:a3 withObjectsAndNames:0];
}

+ (id)descriptionForObject:(id)a3 withObjectsAndNames:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      id v8 = +[NADescriptionBuilder builderWithObject:v5];
      id v9 = (id)[v8 appendObjectsAndNames:v7 args:&v15];
      [v8 build];
    }
    else
    {
      uint64_t v11 = NSString;
      id v12 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v12);
      [v11 stringWithFormat:@"<%@: %p>", v8, v5];
    }
    id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = @"(null)";
  }

  return v10;
}

+ (id)succinctDescriptionForObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v5 = [v4 description];
  }
  else
  {
    uint64_t v5 = [a1 descriptionForObject:v4];
  }
  id v6 = (void *)v5;

  return v6;
}

- (id)appendSuper
{
  uint64_t v2 = self;
  p_object = &self->_object;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);

  if (WeakRetained)
  {
    v29 = v2;
    id v5 = objc_loadWeakRetained((id *)p_object);
    Class = object_getClass(v5);

    if (!Class)
    {
LABEL_18:
      uint64_t v2 = v29;
      id v16 = [(NADescriptionBuilder *)v29 appendObject:@"(super does not implement description)" withName:0];
      return v2;
    }
    int v7 = 0;
    while (1)
    {
      unsigned int outCount = 0;
      id v8 = class_copyMethodList(Class, &outCount);
      id v9 = v8;
      if (outCount)
      {
        unint64_t v10 = 0;
        IMP Implementation = 0;
        do
        {
          char v12 = v7;
          id v13 = v9[v10];
          Name = (char *)method_getName(v13);
          v7 |= Name == sel_description;
          if (Name == sel_description && (v12 & 1) != 0)
          {
            IMP Implementation = method_getImplementation(v13);
            int v7 = 1;
          }
          ++v10;
        }
        while (Name != sel_description && v10 < outCount);
        free(v9);
        if (Implementation)
        {
          id v17 = objc_loadWeakRetained((id *)p_object);
          id v18 = ((void (*)(id, char *))Implementation)(v17, sel_description);

          objc_super v19 = NSString;
          id v20 = objc_loadWeakRetained((id *)p_object);
          uint64_t v21 = objc_msgSend(v19, "stringWithFormat:", @"%p ", v20);;
          uint64_t v22 = [v18 rangeOfString:v21];
          uint64_t v24 = v23;

          if (v22 == 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v2 = v29;
            id v25 = [(NADescriptionBuilder *)v29 appendObject:@"(super's description format doesn't match)" withName:0];
          }
          else
          {
            id v26 = objc_msgSend(v18, "substringWithRange:", v22 + v24, objc_msgSend(v18, "length") + ~(v22 + v24));
            uint64_t v2 = v29;
            id v27 = [(NADescriptionBuilder *)v29 appendObject:v26 withName:0 skipIfNil:1];
          }
          return v2;
        }
      }
      else
      {
        free(v8);
      }
      Class = class_getSuperclass(Class);
      if (!Class) {
        goto LABEL_18;
      }
    }
  }
  return v2;
}

- (void)appendString:(id)a3 withName:(id)a4
{
}

- (void)appendString:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5
{
  BOOL v5 = a5;
  id v16 = a3;
  id v8 = a4;
  if (!v5)
  {
    unint64_t v10 = v16;
    if (!v16)
    {
      id v13 = 0;
LABEL_12:
      id v16 = v13;
      id v15 = -[NADescriptionBuilder appendObject:withName:skipIfNil:](self, "appendObject:withName:skipIfNil:");
      goto LABEL_13;
    }
LABEL_6:
    if ([v10 length]
      && ([MEMORY[0x1E4F28B88] whitespaceCharacterSet],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          uint64_t v12 = [v16 rangeOfCharacterFromSet:v11],
          v11,
          v12 == 0x7FFFFFFFFFFFFFFFLL))
    {
      id v13 = v16;
    }
    else
    {
      uint64_t v14 = [NSString stringWithFormat:@"\"%@\"", v16];

      id v13 = (id)v14;
    }
    goto LABEL_12;
  }
  if (!v16)
  {
    id v16 = 0;
    goto LABEL_13;
  }
  uint64_t v9 = [v16 length];
  unint64_t v10 = v16;
  if (v9) {
    goto LABEL_6;
  }
LABEL_13:
}

- (id)appendBool:(BOOL)a3 withName:(id)a4
{
  id v5 = a4;
  id v6 = NSStringFromBOOL();
  id v7 = [(NADescriptionBuilder *)self appendObject:v6 withName:v5];

  return self;
}

- (id)appendBool:(BOOL)a3 withName:(id)a4 ifEqualTo:(BOOL)a5
{
  if (a3 == a5) {
    id v6 = -[NADescriptionBuilder appendBool:withName:](self, "appendBool:withName:");
  }
  return self;
}

- (id)appendInteger:(int64_t)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
  id v8 = [(NADescriptionBuilder *)self appendObject:v7 withName:v6];

  return self;
}

- (id)appendUnsignedInteger:(unint64_t)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a3);
  id v8 = [(NADescriptionBuilder *)self appendObject:v7 withName:v6];

  return self;
}

- (id)appendInt:(int)a3 withName:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v4);
  id v8 = [(NADescriptionBuilder *)self appendObject:v7 withName:v6];

  return self;
}

- (id)appendInt64:(int64_t)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", a3);
  id v8 = [(NADescriptionBuilder *)self appendObject:v7 withName:v6];

  return self;
}

- (id)appendUnsignedInt:(unsigned int)a3 withName:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%u", v4);
  id v8 = [(NADescriptionBuilder *)self appendObject:v7 withName:v6];

  return self;
}

- (id)appendUInt64:(unint64_t)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", a3);
  id v8 = [(NADescriptionBuilder *)self appendObject:v7 withName:v6];

  return self;
}

- (id)appendDouble:(double)a3 withName:(id)a4 decimalPrecision:(unint64_t)a5
{
  id v8 = a4;
  if (a5 == 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&a3, v12);
  }
  else {
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%.*f", a5, *(void *)&a3);
  }
  id v10 = [(NADescriptionBuilder *)self appendObject:v9 withName:v8];

  return self;
}

- (id)appendTimeInterval:(double)a3 withName:(id)a4 decomposeUnits:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  double v9 = (a3 - (double)(uint64_t)a3) * 1000.0;
  if (v5)
  {
    if (appendTimeInterval_withName_decomposeUnits__onceToken != -1) {
      dispatch_once(&appendTimeInterval_withName_decomposeUnits__onceToken, &__block_literal_global_7);
    }
    id v10 = [(id)appendTimeInterval_withName_decomposeUnits____formatter stringFromTimeInterval:a3];
    uint64_t v11 = v10;
    if (fabs(v9) >= 2.22044605e-16)
    {
      uint64_t v12 = objc_msgSend(v10, "stringByAppendingFormat:", @" %.0fms", *(void *)&v9);

      uint64_t v11 = (void *)v12;
    }
  }
  else
  {
    if (fabs(v9) >= 2.22044605e-16) {
      [NSString stringWithFormat:@"%.2fs", *(void *)&a3];
    }
    else {
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%.1fs", *(void *)&a3);
    }
  }
  id v13 = [(NADescriptionBuilder *)self appendObject:v11 withName:v8];

  return v13;
}

uint64_t __67__NADescriptionBuilder_appendTimeInterval_withName_decomposeUnits___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C00]);
  v1 = (void *)appendTimeInterval_withName_decomposeUnits____formatter;
  appendTimeInterval_withName_decomposeUnits____formatter = (uint64_t)v0;

  uint64_t v2 = (void *)appendTimeInterval_withName_decomposeUnits____formatter;
  return [v2 setUnitsStyle:1];
}

- (id)appendPointer:(void *)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%p", a3);
  id v8 = [(NADescriptionBuilder *)self appendObject:v7 withName:v6];

  return self;
}

- (id)appendSelector:(SEL)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = NSStringFromSelector(a3);
  id v8 = [(NADescriptionBuilder *)self appendObject:v7 withName:v6];

  return self;
}

- (id)appendCString:(const char *)a3 withName:(id)a4
{
  id v6 = NSString;
  id v7 = a4;
  id v8 = objc_msgSend(v6, "stringWithFormat:", @"%s", a3);
  [(NADescriptionBuilder *)self appendString:v8 withName:v7];

  return self;
}

- (id)appendQueue:(id)a3 withName:(id)a4
{
  label = dispatch_queue_get_label((dispatch_queue_t)a3);
  return [(NADescriptionBuilder *)self appendCString:label withName:a4];
}

- (id)appendClass:(Class)a3 withName:(id)a4
{
  id v6 = a4;
  id v7 = NSStringFromClass(a3);
  id v8 = [(NADescriptionBuilder *)self appendObject:v7 withName:v6];

  return self;
}

- (id)appendObjectsAndNames:(id)a3
{
  id v4 = [(NADescriptionBuilder *)self appendObjectsAndNames:a3 args:&v6];
  return self;
}

- (id)appendObjectsAndNames:(id)a3 args:(char *)a4
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
    do
    {
      id v8 = *(id *)a4;
      id v9 = [(NADescriptionBuilder *)self appendObject:v7 withName:v8];
      id v10 = (id *)(a4 + 8);
      a4 += 16;
      id v11 = *v10;

      id v7 = v11;
    }
    while (v11);
  }

  return self;
}

- (id)appendKey:(id)a3
{
  id v4 = a3;
  [(NADescriptionBuilder *)self tryAppendKey:v4];

  return self;
}

- (id)appendKeys:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        -[NADescriptionBuilder tryAppendKey:](self, "tryAppendKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7++), (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return self;
}

- (void)tryAppendKey:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  uint64_t v5 = [WeakRetained valueForKey:v7];

  id v6 = [(NADescriptionBuilder *)self appendObject:v5 withName:v7];
}

- (id)modifyProem:(id)a3
{
  if (a3)
  {
    int activeComponent = self->_activeComponent;
    self->_int activeComponent = 0;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_int activeComponent = activeComponent;
  }
  return self;
}

- (id)modifyBody:(id)a3
{
  if (a3)
  {
    int activeComponent = self->_activeComponent;
    self->_int activeComponent = 1;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_int activeComponent = activeComponent;
  }
  return self;
}

uint64_t __98__NADescriptionBuilder_appendArraySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    id v7 = v3;
    uint64_t v5 = (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

    id v3 = (id)v5;
  }
  if (v3) {
    objc_msgSend(*(id *)(a1 + 32), "addObject:");
  }
  return MEMORY[0x1F4181820]();
}

- (void)appendDictionarySection:(id)a3 withName:(id)a4 skipIfEmpty:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(NADescriptionBuilder *)self activeMultilinePrefix];
  [(NADescriptionBuilder *)self appendDictionarySection:v9 withName:v8 multilinePrefix:v10 skipIfEmpty:v5];
}

- (void)appendDictionarySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6
{
}

- (void)appendDictionarySection:(id)a3 withName:(id)a4 multilinePrefix:(id)a5 skipIfEmpty:(BOOL)a6 objectTransformer:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = (void *)MEMORY[0x1BA99CC90]();
  if (v15)
  {
    id v17 = [MEMORY[0x1E4F1CA60] dictionary];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __103__NADescriptionBuilder_appendDictionarySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke;
    v25[3] = &unk_1E61098C8;
    id v27 = v15;
    id v18 = v17;
    id v26 = v18;
    [v12 enumerateKeysAndObjectsUsingBlock:v25];
    id v19 = v18;

    id v12 = v19;
  }
  if (!v8 || [v12 count])
  {
    if ([v12 count])
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __103__NADescriptionBuilder_appendDictionarySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke_2;
      v21[3] = &unk_1E610A570;
      id v22 = v12;
      uint64_t v23 = self;
      BOOL v24 = v8;
      [(NADescriptionBuilder *)self appendBodySectionWithName:v13 multilinePrefix:v14 block:v21];
    }
    else if (v13)
    {
      id v20 = [(NADescriptionBuilder *)self appendObject:@"(empty)" withName:v13];
    }
  }
}

void __103__NADescriptionBuilder_appendDictionarySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);

    id v5 = (id)v7;
  }
  if (v5) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v8];
  }
}

uint64_t __103__NADescriptionBuilder_appendDictionarySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __103__NADescriptionBuilder_appendDictionarySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke_3;
  v3[3] = &unk_1E610A548;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  char v4 = *(unsigned char *)(a1 + 48);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

void __103__NADescriptionBuilder_appendDictionarySection_withName_multilinePrefix_skipIfEmpty_objectTransformer___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = a2;
  uint64_t v6 = [(id)objc_opt_class() succinctDescriptionForObject:v5];

  if ([v10 isNSDictionary])
  {
    [*(id *)(a1 + 32) appendDictionarySection:v10 withName:v6 skipIfEmpty:*(unsigned __int8 *)(a1 + 40)];
  }
  else
  {
    int v7 = [v10 isNSArray];
    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 appendArraySection:v10 withName:v6 skipIfEmpty:*(unsigned __int8 *)(a1 + 40)];
    }
    else {
      id v9 = (id)[v8 appendObject:v10 withName:v6];
    }
  }
}

- (id)appendString:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(NADescriptionBuilder *)self _activeComponentString];
    [v5 appendString:v4];
  }
  return self;
}

- (id)appendFormat:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)NSString;
    id v5 = a3;
    uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v10];
  }
  else
  {
    uint64_t v6 = 0;
  }
  int v7 = [(NADescriptionBuilder *)self appendString:v6];

  return v7;
}

- (int)activeComponent
{
  return self->_activeComponent;
}

- (void)setActiveComponent:(int)a3
{
  self->_int activeComponent = a3;
}

- (BOOL)useDebugDescription
{
  return self->_useDebugDescription;
}

- (void)setUseDebugDescription:(BOOL)a3
{
  self->_useDebugDescription = a3;
}

- (void)appendKey:(void *)a1 .cold.1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v1 = objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v2 = 138543362;
    id v3 = v1;
    _os_log_error_impl(&dword_1B561D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Exception: %{public}@", (uint8_t *)&v2, 0xCu);
  }
  objc_end_catch();
}

- (void)appendKeys:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1B561D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Exception: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end