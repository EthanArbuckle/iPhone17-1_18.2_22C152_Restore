@interface REExportedArrayValue
- (REExportedArrayValue)initWithArray:(id)a3;
- (id)arrayValue;
- (id)exportedValueForKey:(id)a3;
- (unint64_t)propertyCount;
- (unint64_t)type;
- (void)enumerateValuesUsingBlock:(id)a3;
@end

@implementation REExportedArrayValue

- (REExportedArrayValue)initWithArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REExportedArrayValue;
  v6 = [(REExportedArrayValue *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_array, a3);
  }

  return v7;
}

- (id)arrayValue
{
  return self->_array;
}

- (unint64_t)type
{
  return 0;
}

- (unint64_t)propertyCount
{
  return [(NSArray *)self->_array count];
}

- (void)enumerateValuesUsingBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = self->_array;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          (*((void (**)(id, void, void))v4 + 2))(v4, 0, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (id)exportedValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F08B08] scannerWithString:v4];
  unint64_t v11 = 0;
  if ([v5 scanInteger:&v11] && (unint64_t v6 = v11, v6 < -[NSArray count](self->_array, "count")))
  {
    uint64_t v7 = [(NSArray *)self->_array objectAtIndexedSubscript:v11];
    uint64_t v8 = +[REExportedValue exportedValueForObject:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)REExportedArrayValue;
    uint64_t v8 = [(REExportedValue *)&v10 exportedValueForKey:v4];
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end