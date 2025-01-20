@interface REExportedObjectValue
- (BOOL)shouldEncodeProperty:(id)a3;
- (REExportedObjectValue)initWithObject:(id)a3;
- (id)exportedValueForKey:(id)a3;
- (id)objectValue;
- (unint64_t)propertyCount;
- (unint64_t)type;
- (void)enumerateValuesUsingBlock:(id)a3;
@end

@implementation REExportedObjectValue

- (REExportedObjectValue)initWithObject:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REExportedObjectValue;
  v6 = [(REExportedObjectValue *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_object, a3);
    v7->_allowsEncoding = objc_opt_respondsToSelector() & 1;
  }

  return v7;
}

- (id)objectValue
{
  return self->_object;
}

- (unint64_t)type
{
  return 2;
}

- (void)enumerateValuesUsingBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[RESingleton sharedInstance];
    uint64_t v6 = objc_opt_class();
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__REExportedObjectValue_enumerateValuesUsingBlock___block_invoke;
    v7[3] = &unk_2644BC948;
    v7[4] = self;
    id v8 = v4;
    [v5 enumerateExportedPropertiesOfClass:v6 usingBlock:v7];
  }
}

void __51__REExportedObjectValue_enumerateValuesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  id v4 = a2;
  id v5 = [v3 valueForKey:v4];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (unint64_t)propertyCount
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__REExportedObjectValue_propertyCount__block_invoke;
  v4[3] = &unk_2644BC970;
  v4[4] = &v5;
  [(REExportedObjectValue *)self enumerateValuesUsingBlock:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__REExportedObjectValue_propertyCount__block_invoke(uint64_t result)
{
  return result;
}

- (BOOL)shouldEncodeProperty:(id)a3
{
  if (self->_allowsEncoding) {
    return [self->_object shouldEncodeProperty:a3];
  }
  else {
    return 1;
  }
}

- (id)exportedValueForKey:(id)a3
{
  id v4 = (NSString *)a3;
  NSSelectorFromString(v4);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [self->_object valueForKey:v4];
    if (v5)
    {
      uint64_t v6 = +[REExportedValue exportedValueForObject:v5];

      goto LABEL_7;
    }
    -[REExportedValue exportedValueForKey:](&v8, sel_exportedValueForKey_, v4, self, REExportedObjectValue, exc_buf.receiver, exc_buf.super_class);
  }
  else
  {
    -[REExportedValue exportedValueForKey:](&exc_buf, sel_exportedValueForKey_, v4, v8.receiver, v8.super_class, self, REExportedObjectValue);
  uint64_t v6 = };
LABEL_7:

  return v6;
}

- (void).cxx_destruct
{
}

@end