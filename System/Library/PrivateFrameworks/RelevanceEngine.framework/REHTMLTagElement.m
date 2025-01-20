@interface REHTMLTagElement
- (REHTMLTagElement)initWithTag:(id)a3 content:(id)a4;
- (id)_contentString;
- (id)_prefixContentString;
- (id)_suffixContentString;
- (id)attributes;
- (id)classes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)elementByAddingClass:(id)a3;
- (id)elementByAddingClasses:(id)a3;
- (id)elementBySettingAtttibutes:(id)a3;
- (id)elementBySettingClasses:(id)a3;
@end

@implementation REHTMLTagElement

- (REHTMLTagElement)initWithTag:(id)a3 content:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)REHTMLTagElement;
  v8 = [(REHTMLElement *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    tag = v8->_tag;
    v8->_tag = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    content = v8->_content;
    v8->_content = (NSString *)v11;

    classes = v8->_classes;
    v8->_classes = (NSArray *)MEMORY[0x263EFFA68];

    attributes = v8->_attributes;
    v8->_attributes = (NSDictionary *)MEMORY[0x263EFFA78];
  }
  return v8;
}

- (id)_prefixContentString
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__5;
  v43 = __Block_byref_object_dispose__5;
  id v44 = 0;
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __40__REHTMLTagElement__prefixContentString__block_invoke;
  v38[3] = &unk_2644BD938;
  v38[4] = self;
  v38[5] = &v39;
  REHTMLElementAccessLock(v38);
  v2 = (void *)v40[5];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    v4 = self->_tag;
    NSUInteger v5 = [(NSDictionary *)self->_attributes count];
    unint64_t v6 = 0x263F08000;
    if (v5 || (v7 = [(NSArray *)self->_classes count], unint64_t v6 = 0x263F08000uLL, v7))
    {
      v8 = objc_msgSend(*(id *)(v6 + 2520), "stringWithString:", self->_tag, v4);
      [v8 appendString:@" "];
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v9 = self->_attributes;
      uint64_t v10 = [(NSDictionary *)v9 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v35 != v11) {
              objc_enumerationMutation(v9);
            }
            uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            v14 = [(NSDictionary *)self->_attributes objectForKeyedSubscript:v13];
            [v8 appendString:v13];
            [v8 appendString:@"=\""];
            [v8 appendString:v14];
            [v8 appendString:@"\" "];
          }
          uint64_t v10 = [(NSDictionary *)v9 countByEnumeratingWithState:&v34 objects:v46 count:16];
        }
        while (v10);
      }

      if ([(NSArray *)self->_classes count])
      {
        [v8 appendString:@"class=\""];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v15 = self->_classes;
        uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v30 objects:v45 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v31;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v31 != v17) {
                objc_enumerationMutation(v15);
              }
              [v8 appendString:*(void *)(*((void *)&v30 + 1) + 8 * j)];
              [v8 appendString:@" "];
            }
            uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v30 objects:v45 count:16];
          }
          while (v16);
        }

        [v8 appendString:@"\""];
      }
      v4 = (NSString *)[v8 copy];
    }
    v19 = v4;
    uint64_t v20 = [(NSString *)v19 length];
    uint64_t v21 = [@"<" length];
    uint64_t v22 = [@">" length];
    v23 = [MEMORY[0x263F089D8] stringWithCapacity:v21 + v20 + v22];
    [v23 appendString:@"<"];
    [v23 appendString:v19];
    [v23 appendString:@">"];
    uint64_t v24 = [v23 copy];

    v25 = (void *)v40[5];
    v40[5] = v24;

    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __40__REHTMLTagElement__prefixContentString__block_invoke_2;
    v29[3] = &unk_2644BD960;
    v29[4] = self;
    v29[5] = &v39;
    REHTMLElementAccessLock(v29);
    id v3 = (id)v40[5];
  }
  _Block_object_dispose(&v39, 8);

  return v3;
}

void __40__REHTMLTagElement__prefixContentString__block_invoke(uint64_t a1)
{
}

void __40__REHTMLTagElement__prefixContentString__block_invoke_2(uint64_t a1)
{
}

- (id)_contentString
{
  return self->_content;
}

- (id)_suffixContentString
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  uint64_t v20 = __Block_byref_object_dispose__5;
  id v21 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __40__REHTMLTagElement__suffixContentString__block_invoke;
  v15[3] = &unk_2644BD938;
  v15[4] = self;
  v15[5] = &v16;
  REHTMLElementAccessLock(v15);
  id v3 = (void *)v17[5];
  if (!v3)
  {
    v4 = [(REHTMLTagElement *)self _contentString];

    if (v4)
    {
      NSUInteger v5 = self->_tag;
      uint64_t v6 = [(NSString *)v5 length];
      uint64_t v7 = [@"</" length];
      uint64_t v8 = [@">" length];
      uint64_t v9 = [MEMORY[0x263F089D8] stringWithCapacity:v7 + v6 + v8];
      [v9 appendString:@"</"];
      [v9 appendString:v5];
      [v9 appendString:@">"];
      uint64_t v10 = [v9 copy];

      uint64_t v11 = (void *)v17[5];
      v17[5] = v10;
    }
    else
    {
      uint64_t v11 = (void *)v17[5];
      v17[5] = (uint64_t)&stru_26CFA57D0;
    }

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __40__REHTMLTagElement__suffixContentString__block_invoke_2;
    v14[3] = &unk_2644BD960;
    v14[4] = self;
    v14[5] = &v16;
    REHTMLElementAccessLock(v14);
    id v3 = (void *)v17[5];
  }
  id v12 = v3;
  _Block_object_dispose(&v16, 8);

  return v12;
}

void __40__REHTMLTagElement__suffixContentString__block_invoke(uint64_t a1)
{
}

void __40__REHTMLTagElement__suffixContentString__block_invoke_2(uint64_t a1)
{
}

- (id)classes
{
  return self->_classes;
}

- (id)elementByAddingClass:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = (void *)[(REHTMLTagElement *)self copy];
  uint64_t v6 = [(NSArray *)self->_classes arrayByAddingObject:v4];

  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

- (id)elementByAddingClasses:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = (void *)[(REHTMLTagElement *)self copy];
  uint64_t v6 = [(NSArray *)self->_classes arrayByAddingObjectsFromArray:v4];

  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

- (id)elementBySettingClasses:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = (void *)[(REHTMLTagElement *)self copy];
  uint64_t v6 = [v4 copy];

  uint64_t v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

- (id)attributes
{
  return self->_attributes;
}

- (id)elementBySettingAtttibutes:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = (void *)[(REHTMLTagElement *)self copy];
  uint64_t v6 = [v4 copy];

  uint64_t v7 = (void *)v5[5];
  v5[5] = v6;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REHTMLTagElement;
  id v4 = [(REHTMLElement *)&v6 copyWithZone:a3];
  objc_storeStrong(v4 + 2, self->_tag);
  objc_storeStrong(v4 + 3, self->_content);
  objc_storeStrong(v4 + 5, self->_attributes);
  objc_storeStrong(v4 + 4, self->_classes);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_classes, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_tag, 0);
}

@end