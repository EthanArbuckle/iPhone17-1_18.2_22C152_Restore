@interface OITSUDescription
+ (id)descriptionWithCFType:(void *)a3 format:(id)a4;
+ (id)descriptionWithObject:(id)a3;
+ (id)descriptionWithObject:(id)a3 class:(Class)a4;
+ (id)descriptionWithObject:(id)a3 class:(Class)a4 format:(id)a5;
+ (id)descriptionWithObject:(id)a3 format:(id)a4;
- (OITSUDescription)initWithCFType:(void *)a3 header:(id)a4;
- (OITSUDescription)initWithObject:(id)a3;
- (OITSUDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5;
- (OITSUDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5 arguments:(char *)a6;
- (OITSUDescription)initWithObject:(id)a3 class:(Class)a4 header:(id)a5;
- (OITSUDescription)initWithObject:(id)a3 format:(id)a4;
- (id)descriptionString;
- (id)p_header;
- (void)addField:(id)a3 format:(id)a4;
- (void)addField:(id)a3 value:(id)a4;
- (void)addFieldValue:(id)a3;
- (void)addFieldWithFormat:(id)a3;
- (void)addSuperDescription;
- (void)dealloc;
- (void)setFieldOptionCommaSeparated;
@end

@implementation OITSUDescription

- (OITSUDescription)initWithObject:(id)a3 class:(Class)a4 header:(id)a5
{
  ++TSUDescriptionDepth;
  v11.receiver = self;
  v11.super_class = (Class)OITSUDescription;
  v8 = [(OITSUDescription *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_object = a3;
    v8->_class = a4;
    v8->_header = (NSString *)[a5 copy];
  }
  return v9;
}

- (OITSUDescription)initWithCFType:(void *)a3 header:(id)a4
{
  ++TSUDescriptionDepth;
  v9.receiver = self;
  v9.super_class = (Class)OITSUDescription;
  v6 = [(OITSUDescription *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_cfType = a3;
    v6->_header = (NSString *)[a4 copy];
  }
  return v7;
}

- (OITSUDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5 arguments:(char *)a6
{
  objc_super v9 = (void *)[[NSString alloc] initWithFormat:a5 arguments:a6];
  v10 = [(OITSUDescription *)self initWithObject:a3 class:a4 header:v9];

  return v10;
}

- (OITSUDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5
{
  return [(OITSUDescription *)self initWithObject:a3 class:a4 format:a5 arguments:&v6];
}

- (OITSUDescription)initWithObject:(id)a3 format:(id)a4
{
  return [(OITSUDescription *)self initWithObject:a3 class:object_getClass(a3) format:a4 arguments:&v5];
}

- (OITSUDescription)initWithObject:(id)a3
{
  Class Class = object_getClass(a3);
  return [(OITSUDescription *)self initWithObject:a3 class:Class format:&stru_26EBF24D8];
}

+ (id)descriptionWithObject:(id)a3 class:(Class)a4 format:(id)a5
{
  return [[OITSUDescription alloc] initWithObject:a3 class:a4 format:a5 arguments:&v6];
}

+ (id)descriptionWithObject:(id)a3 format:(id)a4
{
  return [[OITSUDescription alloc] initWithObject:a3 class:object_getClass(a3) format:a4 arguments:&v5];
}

+ (id)descriptionWithObject:(id)a3 class:(Class)a4
{
  v4 = [[OITSUDescription alloc] initWithObject:a3 class:a4 format:&stru_26EBF24D8];
  return v4;
}

+ (id)descriptionWithCFType:(void *)a3 format:(id)a4
{
  uint64_t v5 = (void *)[[NSString alloc] initWithFormat:a4 arguments:&v8];
  uint64_t v6 = [[OITSUDescription alloc] initWithCFType:a3 header:v5];

  return v6;
}

+ (id)descriptionWithObject:(id)a3
{
  return (id)[a1 descriptionWithObject:a3 format:&stru_26EBF24D8];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OITSUDescription;
  [(OITSUDescription *)&v3 dealloc];
}

- (id)p_header
{
  if (self->_object) {
    return (id)[NSString stringWithFormat:@"(%s*)%p%@", class_getName(self->_class), self->_object, self->_header];
  }
  cfType = self->_cfType;
  if (!cfType) {
    return @"(void*)nil";
  }
  CFTypeID v5 = CFGetTypeID(cfType);
  CFStringRef v6 = CFCopyTypeIDDescription(v5);
  v7 = (void *)[NSString stringWithFormat:@"(%@Ref)%p%@", v6, self->_cfType, self->_header];
  CFRelease(v6);
  return v7;
}

- (void)addField:(id)a3 value:(id)a4
{
  if (!self->_fields)
  {
    self->_fields = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    self->_fieldOrder = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  if (!a4) {
    a4 = @"nil";
  }
  if (a3 && [a3 length]) {
    uint64_t v7 = [NSString stringWithFormat:@"%@: ", a3];
  }
  else {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"$$$%lu", -[NSMutableDictionary count](self->_fields, "count"));
  }
  uint64_t v8 = (void *)v7;
  [(NSMutableArray *)self->_fieldOrder addObject:v7];
  [(NSMutableDictionary *)self->_fields setObject:a4 forKey:v8];
  if (([v8 hasPrefix:@"$$$"] & 1) == 0)
  {
    unint64_t v9 = [v8 length];
    if (v9 > self->_fieldNameWidth) {
      self->_fieldNameWidth = v9;
    }
  }
}

- (void)addField:(id)a3 format:(id)a4
{
  CFStringRef v6 = (void *)[[NSString alloc] initWithFormat:a4 arguments:&v7];
  [(OITSUDescription *)self addField:a3 value:v6];
}

- (void)addFieldWithFormat:(id)a3
{
  v4 = (void *)[[NSString alloc] initWithFormat:a3 arguments:&v5];
  [(OITSUDescription *)self addField:0 value:v4];
}

- (void)addFieldValue:(id)a3
{
}

- (void)addSuperDescription
{
  object = self->_object;
  objc_super v3 = self->_class;
  v6.receiver = object;
  v6.super_class = class_getSuperclass(v3);
  id v5 = [(OITSUDescription *)&v6 description];
  -[OITSUDescription addFieldValue:](self, "addFieldValue:", v5, v6.receiver);
}

- (void)setFieldOptionCommaSeparated
{
  self->_commaSeparated = 1;
}

- (id)descriptionString
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (!self->_fields) {
    goto LABEL_5;
  }
  if ((unint64_t)TSUDescriptionDepth >= 5)
  {
    if (objc_opt_respondsToSelector())
    {
      id v3 = (id)[self->_object shortDescription];
LABEL_6:
      v4 = v3;
      goto LABEL_30;
    }
LABEL_5:
    id v3 = [(OITSUDescription *)self p_header];
    goto LABEL_6;
  }
  v4 = (void *)[MEMORY[0x263F089D8] stringWithFormat:@"%@ {", -[OITSUDescription p_header](self, "p_header")];
  id v5 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obj = self->_fieldOrder;
  uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v30 = v4;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    v10 = &stru_26EBF24D8;
    uint64_t v11 = *(void *)v36;
    v12 = @",\n";
    v13 = @"\n";
    do
    {
      uint64_t v14 = 0;
      uint64_t v31 = v8;
      uint64_t v15 = v8 + 1;
      v16 = self;
      uint64_t v32 = v15;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(obj);
        }
        if ((unint64_t)(v15 + v14) > 0x63)
        {
          ++v9;
        }
        else
        {
          v17 = v13;
          v18 = v12;
          id v19 = v5;
          v20 = *(__CFString **)(*((void *)&v35 + 1) + 8 * v14);
          v21 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](v16->_fields, "objectForKey:", v20), "mutableCopy");
          uint64_t v22 = v7;
          uint64_t v23 = v11;
          uint64_t v24 = v9;
          v25 = v21;
          objc_msgSend(v21, "tsu_indentBy:", self->_fieldNameWidth);
          if ([(__CFString *)v20 hasPrefix:@"$$$"]) {
            v20 = &stru_26EBF24D8;
          }
          uint64_t v26 = [(__CFString *)v20 length];
          v27 = v20;
          id v5 = v19;
          v12 = v18;
          v13 = v17;
          uint64_t v15 = v32;
          objc_msgSend(v25, "replaceCharactersInRange:withString:", 0, v26, v27);
          [v5 appendFormat:@"%@%@", v10, v25];

          uint64_t v9 = v24;
          uint64_t v11 = v23;
          uint64_t v7 = v22;
          v16 = self;
        }
        if (v16->_commaSeparated) {
          v10 = v12;
        }
        else {
          v10 = v13;
        }
        ++v14;
      }
      while (v7 != v14);
      uint64_t v8 = v31 + v7;
      uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v7);
    v4 = v30;
    if (v9)
    {
      v28 = "";
      if (v9 != 1) {
        v28 = "s";
      }
      [v5 appendFormat:@"%@...omitting %lu field%s (set to truncate after %lu field%s)", v10, v9, v28, 99, "s"];
    }
  }
  while (([v5 hasSuffix:@"\n"] & 1) != 0
       || [v5 hasSuffix:@" "])
    objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v5, "length") - 1, 1);
  objc_msgSend(v5, "tsu_indentBy:", 2);
  [v4 appendFormat:@"\n%@\n}", v5];

LABEL_30:
  --TSUDescriptionDepth;
  return v4;
}

@end