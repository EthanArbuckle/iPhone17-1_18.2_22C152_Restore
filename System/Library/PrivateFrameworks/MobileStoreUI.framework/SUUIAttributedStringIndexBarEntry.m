@interface SUUIAttributedStringIndexBarEntry
- (BOOL)isEqual:(id)a3;
- (CGSize)_calculatedContentSize;
- (NSAttributedString)attributedString;
- (NSDictionary)defaultTextAttributes;
- (SUUIAttributedStringIndexBarEntry)initWithAttributedString:(id)a3;
- (id)_synthesizedAttributedString;
- (id)description;
- (id)entryAttributedString;
- (unint64_t)hash;
- (void)_drawContentInRect:(CGRect)a3;
- (void)_invalidateSynthesizedAttributedString;
- (void)_tintColorDidChange;
- (void)setDefaultTextAttributes:(id)a3;
@end

@implementation SUUIAttributedStringIndexBarEntry

- (SUUIAttributedStringIndexBarEntry)initWithAttributedString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIAttributedStringIndexBarEntry;
  v5 = [(SUUIAttributedStringIndexBarEntry *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    attributedString = v5->_attributedString;
    v5->_attributedString = (NSAttributedString *)v6;

    [(SUUIIndexBarEntry *)v5 setEntryType:1];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p attributedString:%@>", v5, self, self->_attributedString];

  return v6;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)SUUIAttributedStringIndexBarEntry;
  unint64_t v3 = [(SUUIIndexBarEntry *)&v5 hash];
  return [(NSAttributedString *)self->_attributedString hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SUUIAttributedStringIndexBarEntry *)a3;
  if (v4 == self) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (v8.receiver = self,
        v8.super_class = (Class)SUUIAttributedStringIndexBarEntry,
        ![(SUUIIndexBarEntry *)&v8 isEqual:v4]))
  {
    char v6 = 0;
    goto LABEL_8;
  }
  attributedString = v4->_attributedString;
  if (attributedString == self->_attributedString)
  {
LABEL_7:
    char v6 = 1;
    goto LABEL_8;
  }
  char v6 = -[NSAttributedString isEqualToAttributedString:](attributedString, "isEqualToAttributedString:");
LABEL_8:

  return v6;
}

- (CGSize)_calculatedContentSize
{
  v2 = [(SUUIAttributedStringIndexBarEntry *)self _synthesizedAttributedString];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)_drawContentInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(SUUIAttributedStringIndexBarEntry *)self _synthesizedAttributedString];
  objc_msgSend(v7, "drawInRect:", x, y, width, height);
}

- (void)_tintColorDidChange
{
  [(SUUIAttributedStringIndexBarEntry *)self _invalidateSynthesizedAttributedString];
  v3.receiver = self;
  v3.super_class = (Class)SUUIAttributedStringIndexBarEntry;
  [(SUUIIndexBarEntry *)&v3 _tintColorDidChange];
}

- (id)entryAttributedString
{
  return self->_attributedString;
}

- (void)setDefaultTextAttributes:(id)a3
{
  id v4 = a3;
  uint64_t defaultTextAttributes = (uint64_t)self->_defaultTextAttributes;
  if ((id)defaultTextAttributes != v4)
  {
    double v8 = v4;
    uint64_t defaultTextAttributes = [(id)defaultTextAttributes isEqualToDictionary:v4];
    id v4 = v8;
    if ((defaultTextAttributes & 1) == 0)
    {
      double v6 = (NSDictionary *)[v8 copy];
      id v7 = self->_defaultTextAttributes;
      self->_uint64_t defaultTextAttributes = v6;

      uint64_t defaultTextAttributes = [(SUUIAttributedStringIndexBarEntry *)self _invalidateSynthesizedAttributedString];
      id v4 = v8;
    }
  }
  MEMORY[0x270F9A758](defaultTextAttributes, v4);
}

- (void)_invalidateSynthesizedAttributedString
{
  self->_hasValidSynthesizedAttributedString = 0;
  self->_synthesizedAttributedString = 0;
  MEMORY[0x270F9A758]();
}

- (id)_synthesizedAttributedString
{
  if (!self->_hasValidSynthesizedAttributedString)
  {
    objc_super v3 = (void *)MEMORY[0x263EFF9A0];
    id v4 = [(SUUIIndexBarEntry *)self tintColor];
    uint64_t v5 = *MEMORY[0x263F81500];
    double v6 = [MEMORY[0x263F81708] boldSystemFontOfSize:11.0];
    id v7 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, v5, v6, *MEMORY[0x263F814F0], 0);

    double v8 = [(SUUIAttributedStringIndexBarEntry *)self defaultTextAttributes];
    [v7 addEntriesFromDictionary:v8];

    if (-[NSAttributedString length](self->_attributedString, "length") && [v7 count])
    {
      id v9 = objc_alloc(MEMORY[0x263F089B8]);
      v10 = [(NSAttributedString *)self->_attributedString string];
      v11 = (void *)[v9 initWithString:v10 attributes:v7];

      attributedString = self->_attributedString;
      uint64_t v13 = [(NSAttributedString *)attributedString length];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __65__SUUIAttributedStringIndexBarEntry__synthesizedAttributedString__block_invoke;
      v19[3] = &unk_2654042F0;
      v14 = v11;
      v20 = v14;
      -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](attributedString, "enumerateAttributesInRange:options:usingBlock:", 0, v13, 0, v19);
      synthesizedAttributedString = self->_synthesizedAttributedString;
      self->_synthesizedAttributedString = v14;
      v16 = v14;
    }
    self->_hasValidSynthesizedAttributedString = 1;
  }
  v17 = self->_synthesizedAttributedString;
  return v17;
}

uint64_t __65__SUUIAttributedStringIndexBarEntry__synthesizedAttributedString__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (NSDictionary)defaultTextAttributes
{
  return self->_defaultTextAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTextAttributes, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_synthesizedAttributedString, 0);
}

@end