@interface TSUDescription
+ (id)descriptionWithCFType:(void *)a3 format:(id)a4;
+ (id)descriptionWithObject:(id)a3;
+ (id)descriptionWithObject:(id)a3 class:(Class)a4;
+ (id)descriptionWithObject:(id)a3 class:(Class)a4 format:(id)a5;
+ (id)descriptionWithObject:(id)a3 format:(id)a4;
+ (unint64_t)peekDescriptionDepth;
+ (unint64_t)popDescriptionDepth;
+ (unint64_t)pushDescriptionDepth;
- (NSString)descriptionString;
- (TSUDescription)initWithCFType:(void *)a3 header:(id)a4;
- (TSUDescription)initWithObject:(id)a3;
- (TSUDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5;
- (TSUDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5 arguments:(char *)a6;
- (TSUDescription)initWithObject:(id)a3 class:(Class)a4 header:(id)a5;
- (TSUDescription)initWithObject:(id)a3 format:(id)a4;
- (id)p_header;
- (void)addField:(id)a3 format:(id)a4;
- (void)addField:(id)a3 value:(id)a4;
- (void)addFieldValue:(id)a3;
- (void)addFieldWithFormat:(id)a3;
- (void)addSuperDescription;
- (void)setFieldOptionCommaSeparated;
@end

@implementation TSUDescription

- (TSUDescription)initWithObject:(id)a3 class:(Class)a4 header:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  +[TSUDescription pushDescriptionDepth];
  v15.receiver = self;
  v15.super_class = (Class)TSUDescription;
  v10 = [(TSUDescription *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_object, v8);
    v11->_class = a4;
    v12 = (NSString *)[v9 copy];
    header = v11->_header;
    v11->_header = v12;
  }
  return v11;
}

- (TSUDescription)initWithCFType:(void *)a3 header:(id)a4
{
  id v6 = a4;
  +[TSUDescription pushDescriptionDepth];
  v12.receiver = self;
  v12.super_class = (Class)TSUDescription;
  v7 = [(TSUDescription *)&v12 init];
  id v8 = v7;
  if (v7)
  {
    v7->_cfType = a3;
    id v9 = (NSString *)[v6 copy];
    header = v8->_header;
    v8->_header = v9;
  }
  return v8;
}

- (TSUDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5 arguments:(char *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [objc_alloc((Class)NSString) initWithFormat:v10 arguments:a6];

  v13 = [(TSUDescription *)self initWithObject:v11 class:a4 header:v12];
  return v13;
}

- (TSUDescription)initWithObject:(id)a3 class:(Class)a4 format:(id)a5
{
  return [(TSUDescription *)self initWithObject:a3 class:a4 format:a5 arguments:&v6];
}

- (TSUDescription)initWithObject:(id)a3 format:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TSUDescription *)self initWithObject:v7 class:object_getClass(v7) format:v6 arguments:&v10];

  return v8;
}

- (TSUDescription)initWithObject:(id)a3
{
  id v4 = a3;
  v5 = [(TSUDescription *)self initWithObject:v4 class:object_getClass(v4) format:&stru_1001D3790];

  return v5;
}

+ (id)descriptionWithObject:(id)a3 class:(Class)a4 format:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = [[TSUDescription alloc] initWithObject:v8 class:a4 format:v7 arguments:&v12];

  return v9;
}

+ (id)descriptionWithObject:(id)a3 class:(Class)a4
{
  id v5 = a3;
  id v6 = [[TSUDescription alloc] initWithObject:v5 class:a4 format:&stru_1001D3790];

  return v6;
}

+ (id)descriptionWithObject:(id)a3 format:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[TSUDescription alloc] initWithObject:v6 class:object_getClass(v6) format:v5 arguments:&v10];

  return v7;
}

+ (id)descriptionWithCFType:(void *)a3 format:(id)a4
{
  id v5 = a4;
  id v6 = [objc_alloc((Class)NSString) initWithFormat:v5 arguments:&v10];

  id v7 = [[TSUDescription alloc] initWithCFType:a3 header:v6];
  return v7;
}

+ (id)descriptionWithObject:(id)a3
{
  return [a1 descriptionWithObject:a3 format:&stru_1001D3790];
}

+ (unint64_t)pushDescriptionDepth
{
  v2 = +[NSThread currentThread];
  v3 = [v2 threadDictionary];

  id v4 = [v3 objectForKeyedSubscript:@"TSUDescriptionDepthThreadLocalKey"];
  id v5 = (char *)[v4 unsignedIntegerValue];

  unint64_t v6 = (unint64_t)(v5 + 1);
  id v7 = +[NSNumber numberWithUnsignedInteger:v5 + 1];
  [v3 setObject:v7 forKeyedSubscript:@"TSUDescriptionDepthThreadLocalKey"];

  return v6;
}

+ (unint64_t)popDescriptionDepth
{
  v2 = +[NSThread currentThread];
  v3 = [v2 threadDictionary];

  id v4 = [v3 objectForKeyedSubscript:@"TSUDescriptionDepthThreadLocalKey"];
  id v5 = [v4 unsignedIntegerValue];

  if (v5) {
    unint64_t v6 = (unint64_t)v5 - 1;
  }
  else {
    unint64_t v6 = 0;
  }
  id v7 = +[NSNumber numberWithUnsignedInteger:v6];
  [v3 setObject:v7 forKeyedSubscript:@"TSUDescriptionDepthThreadLocalKey"];

  return v6;
}

+ (unint64_t)peekDescriptionDepth
{
  v2 = +[NSThread currentThread];
  v3 = [v2 threadDictionary];

  id v4 = [v3 objectForKeyedSubscript:@"TSUDescriptionDepthThreadLocalKey"];
  id v5 = [v4 unsignedIntegerValue];

  return (unint64_t)v5;
}

- (id)p_header
{
  p_object = &self->_object;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);

  if (WeakRetained)
  {
    Name = class_getName(self->_class);
    id v6 = objc_loadWeakRetained((id *)p_object);
    id v7 = +[NSString stringWithFormat:@"(%s*)%p%@", Name, v6, self->_header];
  }
  else
  {
    cfType = self->_cfType;
    if (cfType)
    {
      CFTypeID v9 = CFGetTypeID(cfType);
      CFStringRef v10 = CFCopyTypeIDDescription(v9);
      id v7 = +[NSString stringWithFormat:@"(%@Ref)%p%@", v10, self->_cfType, self->_header];
      CFRelease(v10);
    }
    else
    {
      id v7 = @"(void*)nil";
    }
  }
  return v7;
}

- (void)addField:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  if (!self->_fields)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fields = self->_fields;
    self->_fields = v8;

    CFStringRef v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    fieldOrder = self->_fieldOrder;
    self->_fieldOrder = v10;
  }
  if (!v7) {
    id v7 = @"nil";
  }
  if (v6 && [v6 length]) {
    +[NSString stringWithFormat:@"%@: ", v6];
  }
  else {
  id v13 = +[NSString stringWithFormat:@"$$$%lu", [(NSMutableDictionary *)self->_fields count]];
  }

  [(NSMutableArray *)self->_fieldOrder addObject:v13];
  [(NSMutableDictionary *)self->_fields setObject:v7 forKey:v13];
  if (([v13 hasPrefix:@"$$$"] & 1) == 0)
  {
    id v12 = [v13 length];
    if ((unint64_t)v12 > self->_fieldNameWidth) {
      self->_fieldNameWidth = (unint64_t)v12;
    }
  }
}

- (void)addField:(id)a3 format:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)NSString) initWithFormat:v6 arguments:&v9];

  [(TSUDescription *)self addField:v7 value:v8];
}

- (void)addFieldWithFormat:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSString) initWithFormat:v4 arguments:&v6];

  [(TSUDescription *)self addField:0 value:v5];
}

- (void)addFieldValue:(id)a3
{
}

- (void)addSuperDescription
{
  v4.receiver = objc_loadWeakRetained((id *)&self->_object);
  v4.super_class = class_getSuperclass(self->_class);

  v3 = [(TSUDescription *)&v4 description];
  -[TSUDescription addFieldValue:](self, "addFieldValue:", v3, v4.receiver, v4.super_class);
}

- (void)setFieldOptionCommaSeparated
{
  self->_commaSeparated = 1;
}

- (NSString)descriptionString
{
  p_info = &OBJC_METACLASS___TSUExtendedAttributeCollection.info;
  if (!self->_fields) {
    goto LABEL_5;
  }
  if (+[TSUDescription peekDescriptionDepth] < 5)
  {
    id v8 = [(TSUDescription *)self p_header];
    id v7 = +[NSMutableString stringWithFormat:@"%@ {", v8];

    id v31 = objc_alloc_init((Class)NSMutableString);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v9 = self->_fieldOrder;
    CFStringRef v10 = (char *)[(NSMutableArray *)v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10)
    {
      id v11 = v10;
      v27 = v7;
      uint64_t v12 = 0;
      id v13 = 0;
      v14 = &stru_1001D3790;
      uint64_t v15 = *(void *)v33;
      uint64_t v29 = *(void *)v33;
      do
      {
        v16 = 0;
        v28 = v13;
        v17 = v13 + 1;
        v18 = v14;
        v30 = v17;
        do
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v9);
          }
          if (&v16[(void)v17] > (char *)0x63)
          {
            ++v12;
          }
          else
          {
            v19 = v9;
            v20 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v16);
            v21 = [(NSMutableDictionary *)self->_fields objectForKey:v20];
            id v22 = [v21 mutableCopy];

            v23 = v20;
            objc_msgSend(v22, "tsu_indentBy:", self->_fieldNameWidth);
            if ([(__CFString *)v23 hasPrefix:@"$$$"])
            {

              v23 = &stru_1001D3790;
            }
            objc_msgSend(v22, "replaceCharactersInRange:withString:", 0, -[__CFString length](v23, "length"), v23);
            [v31 appendFormat:@"%@%@", v18, v22];

            uint64_t v9 = v19;
            uint64_t v15 = v29;
            v17 = v30;
          }
          v24 = @"\n";
          if (self->_commaSeparated) {
            v24 = @",\n";
          }
          v14 = v24;

          ++v16;
          v18 = v14;
        }
        while (v11 != v16);
        id v13 = &v11[(void)v28];
        id v11 = (char *)[(NSMutableArray *)v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v11);

      if (v12)
      {
        v25 = "";
        if (v12 != 1) {
          v25 = "s";
        }
        [v31 appendFormat:@"%@...omitting %lu field%s (set to truncate after %lu field%s)", v14, v12, v25, 99, "s"];
      }
      p_info = (__objc2_class_ro **)(&OBJC_METACLASS___TSUExtendedAttributeCollection + 32);
      id v7 = v27;
    }
    else
    {

      v14 = &stru_1001D3790;
    }
    while (([v31 hasSuffix:@"\n"] & 1) != 0
         || [v31 hasSuffix:@" "])
      objc_msgSend(v31, "deleteCharactersInRange:", (char *)objc_msgSend(v31, "length") - 1, 1);
    id v6 = v31;
    objc_msgSend(v31, "tsu_indentBy:", 2);
    [v7 appendFormat:@"\n%@\n}", v31];

    goto LABEL_30;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_object);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
  {
LABEL_5:
    id v7 = [(TSUDescription *)self p_header];
    goto LABEL_31;
  }
  id v6 = objc_loadWeakRetained((id *)&self->_object);
  id v7 = [v6 shortDescription];
LABEL_30:

LABEL_31:
  [p_info + 141 popDescriptionDepth];
  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldOrder, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_destroyWeak((id *)&self->_object);
}

@end