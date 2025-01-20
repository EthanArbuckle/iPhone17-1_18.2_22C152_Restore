@interface MXMSampleFilter
+ (BOOL)supportsSecureCoding;
+ (MXMSampleFilter)filterWithAttributeFilter:(id)a3;
+ (MXMSampleFilter)filterWithAttributeFilter:(id)a3 tagFilter:(id)a4;
+ (MXMSampleFilter)filterWithAttributeFilters:(id)a3;
+ (MXMSampleFilter)filterWithTagFilter:(id)a3;
+ (MXMSampleFilter)filterWithTagFilters:(id)a3;
- (BOOL)finite;
- (BOOL)matchesSample:(id)a3;
- (BOOL)matchesSampleSet:(id)a3;
- (BOOL)matchesSamplesWithAttribute:(id)a3;
- (BOOL)matchesSamplesWithAttributes:(id)a3;
- (BOOL)matchesSamplesWithTag:(id)a3;
- (MXMSampleFilter)initWithAttributeFilter:(id)a3;
- (MXMSampleFilter)initWithAttributeFilter:(id)a3 tagFilter:(id)a4;
- (MXMSampleFilter)initWithAttributeFilters:(id)a3;
- (MXMSampleFilter)initWithAttributeFilters:(id)a3 tagFilters:(id)a4;
- (MXMSampleFilter)initWithCoder:(id)a3;
- (MXMSampleFilter)initWithTagFilter:(id)a3;
- (MXMSampleFilter)initWithTagFilters:(id)a3;
- (NSMutableDictionary)attributeFilters;
- (NSSet)tagFilters;
- (id)attributeFilterWithName:(id)a3;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (void)addAttributeFilters:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributeFilters:(id)a3;
- (void)setTagFilters:(id)a3;
@end

@implementation MXMSampleFilter

+ (MXMSampleFilter)filterWithTagFilter:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithTagFilter:v4];

  return (MXMSampleFilter *)v5;
}

+ (MXMSampleFilter)filterWithTagFilters:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithTagFilters:v4];

  return (MXMSampleFilter *)v5;
}

+ (MXMSampleFilter)filterWithAttributeFilter:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithAttributeFilter:v4];

  return (MXMSampleFilter *)v5;
}

+ (MXMSampleFilter)filterWithAttributeFilters:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithAttributeFilters:v4];

  return (MXMSampleFilter *)v5;
}

+ (MXMSampleFilter)filterWithAttributeFilter:(id)a3 tagFilter:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithAttributeFilter:v7 tagFilter:v6];

  return (MXMSampleFilter *)v8;
}

- (MXMSampleFilter)initWithTagFilter:(id)a3
{
  id v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  v5 = [(MXMSampleFilter *)self initWithTagFilters:v4];

  return v5;
}

- (MXMSampleFilter)initWithTagFilters:(id)a3
{
  return [(MXMSampleFilter *)self initWithAttributeFilters:0 tagFilters:a3];
}

- (MXMSampleFilter)initWithAttributeFilter:(id)a3
{
  id v4 = [MEMORY[0x263EFFA08] setWithObject:a3];
  v5 = [(MXMSampleFilter *)self initWithAttributeFilters:v4 tagFilters:0];

  return v5;
}

- (MXMSampleFilter)initWithAttributeFilters:(id)a3
{
  return [(MXMSampleFilter *)self initWithAttributeFilters:a3 tagFilters:0];
}

- (MXMSampleFilter)initWithAttributeFilter:(id)a3 tagFilter:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a4;
  v8 = [v6 setWithObject:a3];
  v9 = [MEMORY[0x263EFFA08] setWithObject:v7];

  v10 = [(MXMSampleFilter *)self initWithAttributeFilters:v8 tagFilters:v9];
  return v10;
}

- (MXMSampleFilter)initWithAttributeFilters:(id)a3 tagFilters:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)MXMSampleFilter;
  v8 = [(MXMSampleFilter *)&v27 init];
  if (v8)
  {
    if (v7)
    {
      uint64_t v9 = [v7 copy];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x263EFFA08] set];
    }
    tagFilters = v8->_tagFilters;
    v8->_tagFilters = (NSSet *)v9;

    uint64_t v11 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    attributeFilters = v8->_attributeFilters;
    v8->_attributeFilters = (NSMutableDictionary *)v11;

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v13 = v6;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "copy", (void)v23);
          v20 = v8->_attributeFilters;
          v21 = [v18 name];
          [(NSMutableDictionary *)v20 setObject:v19 forKeyedSubscript:v21];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v15);
    }
  }
  return v8;
}

- (void)addAttributeFilters:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = (void *)[v9 copy];
        attributeFilters = self->_attributeFilters;
        v12 = [v9 name];
        [(NSMutableDictionary *)attributeFilters setObject:v10 forKeyedSubscript:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (id)attributeFilterWithName:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_attributeFilters objectForKeyedSubscript:a3];
}

- (BOOL)finite
{
  return 1;
}

- (BOOL)matchesSample:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 tag];
  if ([(MXMSampleFilter *)self matchesSamplesWithTag:v5])
  {
    uint64_t v6 = [v4 attributes];
    BOOL v7 = [(MXMSampleFilter *)self matchesSamplesWithAttributes:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)matchesSampleSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 tag];
  if ([(MXMSampleFilter *)self matchesSamplesWithTag:v5])
  {
    uint64_t v6 = [v4 attributes];
    BOOL v7 = [(MXMSampleFilter *)self matchesSamplesWithAttributes:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)matchesSamplesWithAttribute:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 name];
  uint64_t v6 = [(MXMSampleFilter *)self attributeFilterWithName:v5];

  if (v6) {
    char v7 = [v6 matchesSampleWithAttribute:v4];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (BOOL)matchesSamplesWithAttributes:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!-[MXMSampleFilter matchesSamplesWithAttribute:](self, "matchesSamplesWithAttribute:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (BOOL)matchesSamplesWithTag:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_tagFilters;
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "matchesSampleWithTag:", v4, (void)v12))
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

- (id)copy
{
  return [(MXMSampleFilter *)self copyWithZone:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = [(NSMutableDictionary *)self->_attributeFilters allValues];
  uint64_t v7 = [v5 setWithArray:v6];
  uint64_t v8 = (void *)[(NSSet *)self->_tagFilters copy];
  BOOL v9 = (void *)[v4 initWithAttributeFilters:v7 tagFilters:v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  tagFilters = self->_tagFilters;
  id v5 = a3;
  [v5 encodeObject:tagFilters forKey:@"_tagFilters"];
  [v5 encodeObject:self->_attributeFilters forKey:@"_attributeFilters"];
}

- (MXMSampleFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MXMSampleFilter;
  id v5 = [(MXMSampleFilter *)&v22 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_tagFilters"];
    tagFilters = v5->_tagFilters;
    v5->_tagFilters = (NSSet *)v9;

    long long v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    long long v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"_attributeFilters"];
    attributeFilters = v5->_attributeFilters;
    v5->_attributeFilters = (NSMutableDictionary *)v15;
  }
  uint64_t v17 = [(MXMSampleFilter *)v5 tagFilters];
  if (v17)
  {
    uint64_t v18 = [(MXMSampleFilter *)v5 attributeFilters];
    if (v18) {
      v19 = v5;
    }
    else {
      v19 = 0;
    }
    v20 = v19;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (NSSet)tagFilters
{
  return self->_tagFilters;
}

- (void)setTagFilters:(id)a3
{
}

- (NSMutableDictionary)attributeFilters
{
  return self->_attributeFilters;
}

- (void)setAttributeFilters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeFilters, 0);
  objc_storeStrong((id *)&self->_tagFilters, 0);
}

@end