@interface VUIMediaEntityKind
- (NSArray)propertyDescriptors;
- (NSDictionary)propertyDescriptorsByName;
- (NSString)mediaEntityClassName;
- (VUIMediaEntityKind)init;
- (VUIMediaEntityKind)initWithMediaEntityClassName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)propertyDescriptorForName:(id)a3;
- (id)sortingPropertyDescriptorForName:(id)a3;
- (void)_updatePropertyDescriptorsByName;
- (void)setPropertyDescriptors:(id)a3;
- (void)setPropertyDescriptorsByName:(id)a3;
@end

@implementation VUIMediaEntityKind

- (VUIMediaEntityKind)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMediaEntityKind)initWithMediaEntityClassName:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VUIMediaEntityKind;
  v6 = [(VUIMediaEntityKind *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaEntityClassName, a3);
    propertyDescriptors = v7->_propertyDescriptors;
    v7->_propertyDescriptors = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v7;
}

- (void)setPropertyDescriptors:(id)a3
{
  uint64_t v4 = (NSArray *)[a3 copy];
  propertyDescriptors = self->_propertyDescriptors;
  self->_propertyDescriptors = v4;

  [(VUIMediaEntityKind *)self _updatePropertyDescriptorsByName];
}

- (NSDictionary)propertyDescriptorsByName
{
  return self->_propertyDescriptorsByName;
}

- (id)propertyDescriptorForName:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIMediaEntityKind *)self propertyDescriptorsByName];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)sortingPropertyDescriptorForName:(id)a3
{
  id v4 = [(VUIMediaEntityKind *)self propertyDescriptorForName:a3];
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 sortAsName];
    if (v6)
    {
      uint64_t v7 = [(VUIMediaEntityKind *)self propertyDescriptorForName:v6];

      id v5 = (void *)v7;
      if (!v7) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unknown sortAs property %@", v6 format];
      }
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[VUIMediaEntityKind alloc] initWithMediaEntityClassName:self->_mediaEntityClassName];
  uint64_t v5 = [(NSArray *)self->_propertyDescriptors copy];
  propertyDescriptors = v4->_propertyDescriptors;
  v4->_propertyDescriptors = (NSArray *)v5;

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15.receiver = self;
  v15.super_class = (Class)VUIMediaEntityKind;
  id v4 = [(VUIMediaEntityKind *)&v15 description];
  [v3 addObject:v4];

  uint64_t v5 = NSString;
  v6 = [(VUIMediaEntityKind *)self mediaEntityClassName];
  uint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"mediaEntityClassName", v6];
  [v3 addObject:v7];

  v8 = NSString;
  v9 = [(VUIMediaEntityKind *)self propertyDescriptors];
  objc_super v10 = [v8 stringWithFormat:@"%@=%@", @"propertyDescriptors", v9];
  [v3 addObject:v10];

  v11 = NSString;
  v12 = [v3 componentsJoinedByString:@", "];
  v13 = [v11 stringWithFormat:@"<%@>", v12];

  return v13;
}

- (void)_updatePropertyDescriptorsByName
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(VUIMediaEntityKind *)v2 propertyDescriptors];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "name", (void)v12);
        [v3 setObject:v8 forKey:v9];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [v3 copy];
  propertyDescriptorsByName = v2->_propertyDescriptorsByName;
  v2->_propertyDescriptorsByName = (NSDictionary *)v10;

  objc_sync_exit(v2);
}

- (NSString)mediaEntityClassName
{
  return self->_mediaEntityClassName;
}

- (void)setPropertyDescriptorsByName:(id)a3
{
}

- (NSArray)propertyDescriptors
{
  return self->_propertyDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyDescriptors, 0);
  objc_storeStrong((id *)&self->_propertyDescriptorsByName, 0);
  objc_storeStrong((id *)&self->_mediaEntityClassName, 0);
}

@end