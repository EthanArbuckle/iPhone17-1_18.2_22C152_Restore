@interface VisionCoreProcessingDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)URLForResourceNamed:(id)a3 error:(id *)a4;
+ (id)_identifierToSubclassMapping;
+ (id)_subclassResponsibleForIdentifier:(uint64_t)a1;
+ (id)availableIdentifiers;
+ (id)availableVersionsForIdentifier:(id)a3 error:(id *)a4;
+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 error:(id *)a5;
+ (id)descriptorForSpecifier:(id)a3 error:(id *)a4;
+ (id)descriptorsForIdentifier:(id)a3 error:(id *)a4;
+ (id)resourcesBundle;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (VisionCoreProcessingDescriptor)initWithCoder:(id)a3;
- (VisionCoreProcessingDescriptor)initWithSpecifier:(id)a3;
- (VisionCoreProcessingDescriptorSpecifier)specifier;
- (VisionCoreResourceVersion)version;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VisionCoreProcessingDescriptor

- (void).cxx_destruct
{
}

- (VisionCoreProcessingDescriptorSpecifier)specifier
{
  return self->_specifier;
}

- (VisionCoreProcessingDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"specifier"];

  if (v5)
  {
    self = [(VisionCoreProcessingDescriptor *)self initWithSpecifier:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VisionCoreProcessingDescriptor;
  id v4 = a3;
  [(VisionCoreDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_specifier, @"specifier", v5.receiver, v5.super_class);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VisionCoreProcessingDescriptor *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      v6 = [(VisionCoreProcessingDescriptor *)self specifier];
      v7 = [(VisionCoreProcessingDescriptor *)v5 specifier];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  return [(VisionCoreProcessingDescriptorSpecifier *)self->_specifier hash];
}

- (id)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)VisionCoreProcessingDescriptor;
  id v4 = [(VisionCoreDescriptor *)&v8 description];
  objc_super v5 = [(VisionCoreProcessingDescriptor *)self specifier];
  v6 = (void *)[v3 initWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (VisionCoreProcessingDescriptor)initWithSpecifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VisionCoreProcessingDescriptor;
  v6 = [(VisionCoreProcessingDescriptor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_specifier, a3);
  }

  return v7;
}

- (VisionCoreResourceVersion)version
{
  v2 = [(VisionCoreProcessingDescriptor *)self specifier];
  id v3 = [v2 version];

  return (VisionCoreResourceVersion *)v3;
}

- (NSString)identifier
{
  v2 = [(VisionCoreProcessingDescriptor *)self specifier];
  id v3 = [v2 identifier];

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)URLForResourceNamed:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 resourcesBundle];
  objc_super v8 = (void *)v7;
  if (a4 && !v7)
  {
    id v9 = [NSString alloc];
    v10 = NSStringFromClass((Class)a1);
    v11 = (void *)[v9 initWithFormat:@"%@ did not provide a valid resources bundle", v10];

    *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v11];
  }
  v12 = [v8 URLForResource:v6 withExtension:0];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else if (a4)
  {
    id v15 = [NSString alloc];
    v16 = [v8 bundlePath];
    v17 = (void *)[v15 initWithFormat:@"Could not locate resource %@ in %@", v6, v16];

    *a4 = [MEMORY[0x263F087E8] VisionCoreErrorForUnavailableResourceWithLocalizedDescription:v17];
  }
  return v13;
}

+ (id)resourcesBundle
{
  return (id)[MEMORY[0x263F086E0] bundleForClass:a1];
}

+ (id)descriptorsForIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [a1 availableVersionsForIdentifier:v6 error:a4];
  if (v7)
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = objc_msgSend(a1, "descriptorForIdentifier:version:error:", v6, *(void *)(*((void *)&v18 + 1) + 8 * i), a4, (void)v18);
          if (!v14)
          {

            id v16 = 0;
            goto LABEL_12;
          }
          id v15 = (void *)v14;
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v16 = v8;
LABEL_12:
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)descriptorForSpecifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 identifier];
  objc_super v8 = [v6 version];

  id v9 = [a1 descriptorForIdentifier:v7 version:v8 error:a4];

  return v9;
}

+ (id)descriptorForIdentifier:(id)a3 version:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = +[VisionCoreProcessingDescriptor _subclassResponsibleForIdentifier:]((uint64_t)a1, v8);
  if (v10)
  {
    uint64_t v11 = [v10 descriptorForIdentifier:v8 version:v9 error:a5];
  }
  else if (a5)
  {
    [MEMORY[0x263F087E8] VisionCoreErrorForUnknownProcessingDescriptorIdentifier:v8];
    uint64_t v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)_subclassResponsibleForIdentifier:(uint64_t)a1
{
  id v2 = a2;
  self;
  id v3 = +[VisionCoreProcessingDescriptor _identifierToSubclassMapping]();
  id v4 = (void *)[v3 objectForKey:v2];

  return v4;
}

+ (id)_identifierToSubclassMapping
{
  self;
  if (_identifierToSubclassMapping_ourOnceToken != -1) {
    dispatch_once(&_identifierToSubclassMapping_ourOnceToken, &__block_literal_global_3279);
  }
  v0 = (void *)_identifierToSubclassMapping_ourIdentifierToClassMapping;
  return v0;
}

void __62__VisionCoreProcessingDescriptor__identifierToSubclassMapping__block_invoke()
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v1 = +[VisionCoreRuntimeUtilities leafSubclassesOfClass:objc_opt_class() excludingRootClass:1 overridingClassSelector:sel_availableIdentifiers];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v7 = [v6 availableIdentifiers];
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v15;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v15 != v10) {
                objc_enumerationMutation(v7);
              }
              [v0 setObject:v6 forKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * j)];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
          }
          while (v9);
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v3);
  }
  uint64_t v12 = [v0 copy];
  v13 = (void *)_identifierToSubclassMapping_ourIdentifierToClassMapping;
  _identifierToSubclassMapping_ourIdentifierToClassMapping = v12;
}

+ (id)availableVersionsForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = +[VisionCoreProcessingDescriptor _subclassResponsibleForIdentifier:]((uint64_t)a1, v6);
  if (v7)
  {
    uint64_t v8 = [v7 availableVersionsForIdentifier:v6 error:a4];
  }
  else if (a4)
  {
    [MEMORY[0x263F087E8] VisionCoreErrorForUnknownProcessingDescriptorIdentifier:v6];
    uint64_t v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)availableIdentifiers
{
  uint64_t v2 = +[VisionCoreProcessingDescriptor _identifierToSubclassMapping]();
  uint64_t v3 = [v2 allKeys];

  return v3;
}

@end