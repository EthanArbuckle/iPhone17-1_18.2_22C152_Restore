@interface UIDescriptionBuilder
+ (UIDescriptionBuilder)descriptionBuilderWithObject:(id)a3;
+ (id)descriptionForObject:(id)a3 keys:(id)a4;
+ (id)descriptionForObject:(id)a3 namesAndObjects:(id)a4;
- (NSMutableString)descriptionString;
- (NSObject)object;
- (NSString)separator;
- (NSString)string;
- (UIDescriptionBuilder)initWithObject:(id)a3;
- (id)appendKey:(id)a3;
- (id)appendKeys:(id)a3;
- (id)appendName:(id)a3 BOOLValue:(BOOL)a4;
- (id)appendName:(id)a3 doubleValue:(double)a4;
- (id)appendName:(id)a3 intValue:(int)a4;
- (id)appendName:(id)a3 integerValue:(int64_t)a4;
- (id)appendName:(id)a3 object:(id)a4;
- (id)appendName:(id)a3 object:(id)a4 usingLightweightDescription:(BOOL)a5;
- (id)appendName:(id)a3 pointerValue:(void *)a4;
- (id)appendName:(id)a3 selector:(SEL)a4;
- (id)appendName:(id)a3 unsignedInteger:(unint64_t)a4;
- (id)appendNamesAndObjects:(id)a3;
- (id)appendObject:(id)a3 withName:(id)a4;
- (void)setDescriptionString:(id)a3;
- (void)setObject:(id)a3;
- (void)setSeparator:(id)a3;
- (void)tryAppendKey:(id)a3;
@end

@implementation UIDescriptionBuilder

- (id)appendName:(id)a3 object:(id)a4 usingLightweightDescription:(BOOL)a5
{
  BOOL v5 = a5;
  descriptionString = self->_descriptionString;
  separator = self->_separator;
  id v11 = a4;
  id v12 = a3;
  v13 = v12;
  if (a4 && v5) {
    [(NSMutableString *)descriptionString appendFormat:@"%@ %@=<%s: %p>", separator, v12, object_getClassName(v11), v11];
  }
  else {
    [(NSMutableString *)descriptionString appendFormat:@"%@ %@=%@", separator, v12, v11, v15];
  }

  [(UIDescriptionBuilder *)self setSeparator:@","];
  return self;
}

- (void)setSeparator:(id)a3
{
}

- (id)appendName:(id)a3 object:(id)a4
{
  return [(UIDescriptionBuilder *)self appendName:a3 object:a4 usingLightweightDescription:0];
}

- (NSString)string
{
  return (NSString *)[(NSMutableString *)self->_descriptionString stringByAppendingString:@">"];
}

+ (UIDescriptionBuilder)descriptionBuilderWithObject:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)[objc_alloc((Class)a1) initWithObject:v4];

  return (UIDescriptionBuilder *)v5;
}

- (UIDescriptionBuilder)initWithObject:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIDescriptionBuilder;
  BOOL v5 = [(UIDescriptionBuilder *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_object = v4;
    v7 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    descriptionString = v6->_descriptionString;
    v6->_descriptionString = v7;

    [(NSMutableString *)v6->_descriptionString appendFormat:@"<%s: %p", object_getClassName(v6->_object), v6->_object];
    separator = v6->_separator;
    v6->_separator = (NSString *)@":";

    v10 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionString, 0);
  objc_storeStrong((id *)&self->_separator, 0);
}

+ (id)descriptionForObject:(id)a3 namesAndObjects:(id)a4
{
  id v5 = a4;
  v6 = +[UIDescriptionBuilder descriptionBuilderWithObject:a3];
  id v7 = (id)[v6 appendNamesAndObjects:v5];
  v8 = [v6 string];

  return v8;
}

+ (id)descriptionForObject:(id)a3 keys:(id)a4
{
  id v5 = a4;
  v6 = +[UIDescriptionBuilder descriptionBuilderWithObject:a3];
  id v7 = (id)[v6 appendKeys:v5];
  v8 = [v6 string];

  return v8;
}

- (id)appendObject:(id)a3 withName:(id)a4
{
  return [(UIDescriptionBuilder *)self appendName:a4 object:a3];
}

- (id)appendName:(id)a3 BOOLValue:(BOOL)a4
{
  if (a4) {
    id v5 = @"YES";
  }
  else {
    id v5 = @"NO";
  }
  id v6 = [(UIDescriptionBuilder *)self appendName:a3 object:v5];
  return self;
}

- (id)appendName:(id)a3 integerValue:(int64_t)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a4);
  id v8 = [(UIDescriptionBuilder *)self appendName:v6 object:v7];

  return self;
}

- (id)appendName:(id)a3 unsignedInteger:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", a4);
  id v8 = [(UIDescriptionBuilder *)self appendName:v6 object:v7];

  return self;
}

- (id)appendName:(id)a3 intValue:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%d", v4);
  id v8 = [(UIDescriptionBuilder *)self appendName:v6 object:v7];

  return self;
}

- (id)appendName:(id)a3 doubleValue:(double)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&a4);
  id v8 = [(UIDescriptionBuilder *)self appendName:v6 object:v7];

  return self;
}

- (id)appendName:(id)a3 pointerValue:(void *)a4
{
  id v6 = a3;
  id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%p", a4);
  id v8 = [(UIDescriptionBuilder *)self appendName:v6 object:v7];

  return self;
}

- (id)appendName:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  id v7 = NSStringFromSelector(a4);
  id v8 = [(UIDescriptionBuilder *)self appendName:v6 object:v7];

  return self;
}

- (id)appendNamesAndObjects:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__UIDescriptionBuilder_appendNamesAndObjects___block_invoke;
  v5[3] = &unk_1E52DD258;
  v5[4] = self;
  [a3 enumerateKeysAndObjectsUsingBlock:v5];
  return self;
}

id __46__UIDescriptionBuilder_appendNamesAndObjects___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)[*(id *)(a1 + 32) appendName:a2 object:a3];
}

- (id)appendKey:(id)a3
{
  id v4 = a3;
  [(UIDescriptionBuilder *)self tryAppendKey:v4];

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
        -[UIDescriptionBuilder tryAppendKey:](self, "tryAppendKey:", *(void *)(*((void *)&v9 + 1) + 8 * v7++), (void)v9);
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
  id v6 = a3;
  id v4 = -[NSObject valueForKey:](self->_object, "valueForKey:");
  if (v4) {
    id v5 = [(UIDescriptionBuilder *)self appendObject:v4 withName:v6];
  }
}

- (NSString)separator
{
  return self->_separator;
}

- (NSObject)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  self->_object = a3;
}

- (NSMutableString)descriptionString
{
  return self->_descriptionString;
}

- (void)setDescriptionString:(id)a3
{
}

@end