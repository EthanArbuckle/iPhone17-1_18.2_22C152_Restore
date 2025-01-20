@interface UIGestureGraphElement
- (BOOL)hasProperties:(id)a3;
- (NSString)label;
- (UIGestureGraphElement)initWithLabel:(id)a3;
- (id)description;
- (id)propertyForKey:(id)a3;
- (void)enumeratePropertiesUsingBlock:(id)a3;
- (void)removeAllProperties;
- (void)removePropertyForKey:(id)a3;
- (void)setProperties:(id)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
@end

@implementation UIGestureGraphElement

- (void)setProperties:(id)a3
{
  properties = self->_properties;
  if (!properties)
  {
    v6 = (NSMutableDictionary *)objc_opt_new();
    v7 = self->_properties;
    self->_properties = v6;

    properties = self->_properties;
  }
  [(NSMutableDictionary *)properties setDictionary:a3];
}

- (UIGestureGraphElement)initWithLabel:(id)a3
{
  if (!a3)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"UIGestureGraphElement.m", 22, @"Invalid parameter not satisfying: %@", @"label" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)UIGestureGraphElement;
  v5 = [(UIGestureGraphElement *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [a3 copy];
    label = v5->_label;
    v5->_label = (NSString *)v6;
  }
  return v5;
}

- (NSString)label
{
  return self->_label;
}

- (void)removePropertyForKey:(id)a3
{
}

- (id)propertyForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_properties objectForKey:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

- (BOOL)hasProperties:(id)a3
{
  unint64_t v5 = [a3 count];
  if (v5 > [(NSMutableDictionary *)self->_properties count]) {
    return 0;
  }
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__UIGestureGraphElement_hasProperties___block_invoke;
  v8[3] = &unk_1E52E4F80;
  v8[4] = self;
  v8[5] = &v9;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
  BOOL v6 = *((unsigned char *)v10 + 24) != 0;
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __39__UIGestureGraphElement_hasProperties___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v7 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:a2];
  LOBYTE(a3) = [v7 isEqual:a3];

  if ((a3 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)enumeratePropertiesUsingBlock:(id)a3
{
}

- (void)removeAllProperties
{
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  properties = self->_properties;
  if (!properties)
  {
    v8 = (NSMutableDictionary *)objc_opt_new();
    uint64_t v9 = self->_properties;
    self->_properties = v8;

    properties = self->_properties;
  }
  [(NSMutableDictionary *)properties setObject:a3 forKey:a4];
}

- (id)description
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendString:@"{"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [(NSMutableDictionary *)self->_properties keyEnumerator];
  unint64_t v5 = [v4 allObjects];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [(UIGestureGraphElement *)self propertyForKey:v10];
        if (v11)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = v11;
          }
          else
          {
            if (objc_opt_respondsToSelector()) {
              [v11 stringValue];
            }
            else {
            id v12 = [v11 description];
            }
          }
          v13 = v12;
          [v3 appendFormat:@"%@:'%@'; ", v10, v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  if ((unint64_t)[v3 length] >= 2) {
    objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 2, 2);
  }
  [v3 appendString:@"}"];
  v14 = NSString;
  v15 = [(UIGestureGraphElement *)self label];
  v16 = [v14 stringWithFormat:@"(%@ %@)", v15, v3];

  return v16;
}

@end