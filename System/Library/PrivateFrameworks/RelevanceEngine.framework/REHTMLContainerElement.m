@interface REHTMLContainerElement
- (REHTMLContainerElement)initWithElements:(id)a3;
- (id)_encodedData;
- (id)append:(id)a3;
- (id)attributes;
- (id)classes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)elementBySettingAtttibutes:(id)a3;
- (id)elementBySettingClasses:(id)a3;
@end

@implementation REHTMLContainerElement

- (REHTMLContainerElement)initWithElements:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)REHTMLContainerElement;
  v5 = [(REHTMLElement *)&v30 init];
  if (v5)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {

            v12 = [MEMORY[0x263EFF980] array];
            long long v22 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id v13 = v6;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v31 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v23;
              do
              {
                uint64_t v17 = 0;
                do
                {
                  if (*(void *)v23 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * v17);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v12 addObjectsFromArray:*(void *)(v18 + 16)];
                  }
                  else {
                    objc_msgSend(v12, "addObject:", v18, (void)v22);
                  }
                  ++v17;
                }
                while (v15 != v17);
                uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v31 count:16];
              }
              while (v15);
            }

            uint64_t v19 = [v12 copy];
            elements = v5->_elements;
            v5->_elements = (NSArray *)v19;

            goto LABEL_22;
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    uint64_t v11 = [v6 copy];
    v12 = v5->_elements;
    v5->_elements = (NSArray *)v11;
LABEL_22:
  }
  return v5;
}

- (id)_encodedData
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF990] data];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = self->_elements;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v10 = [NSString alloc];
        uint64_t v11 = objc_msgSend(v9, "encodedData", (void)v17);
        v12 = (void *)[v10 initWithData:v11 encoding:4];

        [v12 length];
        id v13 = [v9 encodedData];
        [v3 appendData:v13];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  uint64_t v14 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
  [v14 length];
  uint64_t v15 = (void *)[v3 copy];

  return v15;
}

- (id)classes
{
  v2 = [(NSArray *)self->_elements firstObject];
  v3 = [v2 classes];
  id v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x263EFFA68];
  }
  id v5 = v3;

  return v5;
}

- (id)elementBySettingClasses:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSArray *)self->_elements count])
  {
    id v5 = [(NSArray *)self->_elements firstObject];
    uint64_t v6 = [v5 elementBySettingClasses:v4];

    v12[0] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    uint64_t v8 = -[NSArray subarrayWithRange:](self->_elements, "subarrayWithRange:", 1, [(NSArray *)self->_elements count] - 1);
    uint64_t v9 = [v7 arrayByAddingObjectsFromArray:v8];

    id v10 = (REHTMLContainerElement *)[objc_alloc((Class)objc_opt_class()) initWithElements:v9];
  }
  else
  {
    id v10 = self;
  }

  return v10;
}

- (id)attributes
{
  v2 = [(NSArray *)self->_elements firstObject];
  v3 = [v2 attributes];
  id v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x263EFFA78];
  }
  id v5 = v3;

  return v5;
}

- (id)elementBySettingAtttibutes:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSArray *)self->_elements count])
  {
    id v5 = [(NSArray *)self->_elements firstObject];
    uint64_t v6 = [v5 elementBySettingAtttibutes:v4];

    v12[0] = v6;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    uint64_t v8 = -[NSArray subarrayWithRange:](self->_elements, "subarrayWithRange:", 1, [(NSArray *)self->_elements count] - 1);
    uint64_t v9 = [v7 arrayByAddingObjectsFromArray:v8];

    id v10 = (REHTMLContainerElement *)[objc_alloc((Class)objc_opt_class()) initWithElements:v9];
  }
  else
  {
    id v10 = self;
  }

  return v10;
}

- (id)append:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v6 = [(NSArray *)self->_elements arrayByAddingObject:v4];

  uint64_t v7 = (void *)[v5 initWithElements:v6];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REHTMLContainerElement;
  id v4 = [(REHTMLElement *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 2, self->_elements);
  return v4;
}

- (void).cxx_destruct
{
}

@end