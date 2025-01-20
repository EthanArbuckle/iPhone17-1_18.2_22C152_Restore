@interface FCDescription
+ (id)descriptionWithCFType:(void *)a3 format:(id)a4;
+ (id)descriptionWithObject:(id)a3;
+ (id)descriptionWithObject:(id)a3 class:(Class)a4;
+ (id)descriptionWithObject:(id)a3 class:(Class)a4 format:(id)a5;
+ (id)descriptionWithObject:(id)a3 format:(id)a4;
- (FCDescription)initWithCFType:(void *)a3 header:(id)a4;
- (FCDescription)initWithObject:(id)a3;
- (FCDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5;
- (FCDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5 arguments:(char *)a6;
- (FCDescription)initWithObject:(id)a3 class:(Class)a4 header:(id)a5;
- (FCDescription)initWithObject:(id)a3 format:(id)a4;
- (id)descriptionString;
- (id)p_header;
- (void)addField:(id)a3 format:(id)a4;
- (void)addField:(id)a3 target:(id)a4;
- (void)addField:(id)a3 value:(id)a4;
- (void)addFieldValue:(id)a3;
- (void)addFieldWithFormat:(id)a3;
- (void)addSuperDescription;
- (void)setFieldOptionCommaSeparated;
@end

@implementation FCDescription

- (id)descriptionString
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (!self->_fields) {
    goto LABEL_5;
  }
  unint64_t v3 = atomic_load((unint64_t *)&FCDescriptionDepth);
  if (v3 >= 5)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = [self->_object shortDescription];
LABEL_6:
      v5 = (void *)v4;
      goto LABEL_31;
    }
LABEL_5:
    uint64_t v4 = [(FCDescription *)self p_header];
    goto LABEL_6;
  }
  v6 = (void *)MEMORY[0x1E4F28E78];
  v7 = [(FCDescription *)self p_header];
  v5 = [v6 stringWithFormat:@"%@ {", v7];

  id v30 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v8 = self->_fieldOrder;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v26 = v5;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    v13 = &stru_1EF8299B8;
    uint64_t v14 = *(void *)v32;
    uint64_t v28 = *(void *)v32;
    do
    {
      uint64_t v15 = 0;
      uint64_t v27 = v12;
      uint64_t v16 = v12 + 1;
      v17 = v13;
      uint64_t v29 = v16;
      do
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v8);
        }
        if ((unint64_t)(v16 + v15) > 0x63)
        {
          ++v11;
        }
        else
        {
          v18 = v8;
          v19 = *(void **)(*((void *)&v31 + 1) + 8 * v15);
          v20 = [(NSMutableDictionary *)self->_fields objectForKey:v19];
          v21 = (void *)[v20 mutableCopy];

          v22 = v19;
          [v21 indentBy:self->_fieldNameWidth];
          if ([(__CFString *)v22 hasPrefix:@"$$$"])
          {

            v22 = &stru_1EF8299B8;
          }
          objc_msgSend(v21, "replaceCharactersInRange:withString:", 0, -[__CFString length](v22, "length"), v22);
          [v30 appendFormat:@"%@%@", v17, v21];

          v8 = v18;
          uint64_t v14 = v28;
          uint64_t v16 = v29;
        }
        v23 = @"\n";
        if (self->_commaSeparated) {
          v23 = @",\n";
        }
        v13 = v23;

        ++v15;
        v17 = v13;
      }
      while (v10 != v15);
      uint64_t v12 = v10 + v27;
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v10);

    if (v11)
    {
      v24 = "";
      if (v11 != 1) {
        v24 = "s";
      }
      [v30 appendFormat:@"%@...omitting %lu field%s (set to truncate after %lu field%s)", v13, v11, v24, 99, "s"];
    }
    v5 = v26;
  }
  else
  {

    v13 = &stru_1EF8299B8;
  }
  while (([v30 hasSuffix:@"\n"] & 1) != 0
       || [v30 hasSuffix:@" "])
    objc_msgSend(v30, "deleteCharactersInRange:", objc_msgSend(v30, "length") - 1, 1);
  [v30 indentBy:2];
  [v5 appendFormat:@"\n%@\n}", v30];

LABEL_31:
  atomic_fetch_add(&FCDescriptionDepth, 0xFFFFFFFFFFFFFFFFLL);
  return v5;
}

- (id)p_header
{
  if (self->_object)
  {
    unint64_t v3 = [NSString stringWithFormat:@"(%s*)%p%@", class_getName(self->_class), self->_object, self->_header];
  }
  else
  {
    cfType = self->_cfType;
    if (cfType)
    {
      CFTypeID v5 = CFGetTypeID(cfType);
      CFStringRef v6 = CFCopyTypeIDDescription(v5);
      unint64_t v3 = [NSString stringWithFormat:@"(%@Ref)%p%@", v6, self->_cfType, self->_header];
      CFRelease(v6);
    }
    else
    {
      unint64_t v3 = @"(void*)nil";
    }
  }
  return v3;
}

- (void)addField:(id)a3 target:(id)a4
{
}

- (void)addField:(id)a3 format:(id)a4
{
  CFStringRef v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[[v6 alloc] initWithFormat:v7 arguments:&v10];

  [(FCDescription *)self addField:v8 value:v9];
}

- (void)addField:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  if (!self->_fields)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    fields = self->_fields;
    self->_fields = v8;

    uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    fieldOrder = self->_fieldOrder;
    self->_fieldOrder = v10;
  }
  if (!v7) {
    id v7 = @"nil";
  }
  if (v6 && [v6 length]) {
    [NSString stringWithFormat:@"%@: ", v6];
  }
  else {
    objc_msgSend(NSString, "stringWithFormat:", @"$$$%lu", -[NSMutableDictionary count](self->_fields, "count"));
  }
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  [(NSMutableArray *)self->_fieldOrder addObject:v13];
  [(NSMutableDictionary *)self->_fields setObject:v7 forKey:v13];
  if (([v13 hasPrefix:@"$$$"] & 1) == 0)
  {
    unint64_t v12 = [v13 length];
    if (v12 > self->_fieldNameWidth) {
      self->_fieldNameWidth = v12;
    }
  }
}

+ (id)descriptionWithObject:(id)a3 format:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[FCDescription alloc] initWithObject:v6 class:object_getClass(v6) format:v5 arguments:&v10];

  return v7;
}

- (FCDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5 arguments:(char *)a6
{
  uint64_t v10 = (objc_class *)NSString;
  id v11 = a5;
  id v12 = a3;
  id v13 = (void *)[[v10 alloc] initWithFormat:v11 arguments:a6];

  uint64_t v14 = [(FCDescription *)self initWithObject:v12 class:a4 header:v13];
  return v14;
}

- (FCDescription)initWithObject:(id)a3 class:(Class)a4 header:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  atomic_fetch_add(&FCDescriptionDepth, 1uLL);
  v16.receiver = self;
  v16.super_class = (Class)FCDescription;
  id v11 = [(FCDescription *)&v16 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_object, a3);
    v12->_class = a4;
    uint64_t v13 = [v10 copy];
    header = v12->_header;
    v12->_header = (NSString *)v13;
  }
  return v12;
}

+ (id)descriptionWithObject:(id)a3
{
  return (id)[a1 descriptionWithObject:a3 format:&stru_1EF8299B8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldOrder, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_object, 0);
}

- (FCDescription)initWithCFType:(void *)a3 header:(id)a4
{
  id v6 = a4;
  atomic_fetch_add(&FCDescriptionDepth, 1uLL);
  v12.receiver = self;
  v12.super_class = (Class)FCDescription;
  id v7 = [(FCDescription *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    v7->_cfType = a3;
    uint64_t v9 = [v6 copy];
    header = v8->_header;
    v8->_header = (NSString *)v9;
  }
  return v8;
}

- (FCDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5
{
  return [(FCDescription *)self initWithObject:a3 class:a4 format:a5 arguments:&v6];
}

- (FCDescription)initWithObject:(id)a3 format:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FCDescription *)self initWithObject:v7 class:object_getClass(v7) format:v6 arguments:&v10];

  return v8;
}

- (FCDescription)initWithObject:(id)a3
{
  id v4 = a3;
  id v5 = [(FCDescription *)self initWithObject:v4 class:object_getClass(v4) format:&stru_1EF8299B8];

  return v5;
}

+ (id)descriptionWithObject:(id)a3 class:(Class)a4 format:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  uint64_t v9 = [[FCDescription alloc] initWithObject:v8 class:a4 format:v7 arguments:&v12];

  return v9;
}

+ (id)descriptionWithObject:(id)a3 class:(Class)a4
{
  id v5 = a3;
  id v6 = [[FCDescription alloc] initWithObject:v5 class:a4 format:&stru_1EF8299B8];

  return v6;
}

+ (id)descriptionWithCFType:(void *)a3 format:(id)a4
{
  id v5 = (objc_class *)NSString;
  id v6 = a4;
  id v7 = (void *)[[v5 alloc] initWithFormat:v6 arguments:&v11];

  id v8 = [[FCDescription alloc] initWithCFType:a3 header:v7];
  return v8;
}

- (void)addFieldWithFormat:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(FCDescription *)self addField:0 value:v6];
}

- (void)addFieldValue:(id)a3
{
}

- (void)addSuperDescription
{
  object = self->_object;
  unint64_t v3 = self->_class;
  v6.receiver = object;
  v6.super_class = class_getSuperclass(v3);
  id v5 = [(FCDescription *)&v6 description];
  -[FCDescription addFieldValue:](self, "addFieldValue:", v5, v6.receiver);
}

- (void)setFieldOptionCommaSeparated
{
  self->_commaSeparated = 1;
}

@end