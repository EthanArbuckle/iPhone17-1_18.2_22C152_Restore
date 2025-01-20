@interface _RESmallSetFeatureValue
- (_RESmallSetFeatureValue)initWithSet:(id)a3;
- (id)setValue;
@end

@implementation _RESmallSetFeatureValue

- (_RESmallSetFeatureValue)initWithSet:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_RESmallSetFeatureValue;
  v5 = [(_RESmallSetFeatureValue *)&v18 init];
  if (!v5) {
    goto LABEL_13;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (!v7)
  {

    unint64_t v9 = 0;
    do
    {
LABEL_12:
      unint64_t v12 = v9;
      v5->_values[v9] = 0;
      unint64_t v9 = 1;
    }
    while (!v12);
    goto LABEL_13;
  }
  uint64_t v8 = v7;
  unint64_t v9 = 0;
  uint64_t v10 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v6);
      }
      v5->_values[v9 + i] = RECreateFeatureValueTaggedPointer(*(void **)(*((void *)&v14 + 1) + 8 * i));
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    v9 += i;
  }
  while (v8);

  if (v9 <= 1) {
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (id)setValue
{
  v3 = [MEMORY[0x263EFF9C0] setWithCapacity:2];
  uint64_t v4 = 0;
  values = self->_values;
  char v6 = 1;
  do
  {
    char v7 = v6;
    uint64_t v8 = REFeatureValueForTaggedPointer(values[v4]);
    if (v8) {
      [v3 addObject:v8];
    }

    char v6 = 0;
    uint64_t v4 = 1;
  }
  while ((v7 & 1) != 0);
  unint64_t v9 = (void *)[v3 copy];

  return v9;
}

@end