@interface SUPageSectionGroup
- (BOOL)isEqual:(id)a3;
- (BOOL)loadFromDictionary:(id)a3;
- (NSArray)sections;
- (SUPageSectionGroup)initWithSectionsDictionary:(id)a3;
- (UIColor)tintColor;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_sectionStyleForString:(id)a3;
- (int64_t)defaultSectionIndex;
- (int64_t)style;
- (int64_t)tintStyle;
- (void)dealloc;
- (void)setDefaultSectionIndex:(int64_t)a3;
- (void)setSections:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTintColor:(id)a3;
- (void)setTintStyle:(int64_t)a3;
@end

@implementation SUPageSectionGroup

- (SUPageSectionGroup)initWithSectionsDictionary:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SUPageSectionGroup;
  v4 = [(SUPageSectionGroup *)&v7 init];
  v5 = v4;
  if (v4 && ![(SUPageSectionGroup *)v4 loadFromDictionary:a3])
  {

    return 0;
  }
  return v5;
}

- (void)dealloc
{
  self->_sections = 0;
  self->_tintColor = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUPageSectionGroup;
  [(SUPageSectionGroup *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_defaultSectionIndex;
  v5[2] = [(NSArray *)self->_sections copyWithZone:a3];
  v5[3] = self->_style;
  v5[4] = [(UIColor *)self->_tintColor copyWithZone:a3];
  v5[5] = self->_tintStyle;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int64_t v5 = -[SUPageSectionGroup style](self, "style"), v5 == [a3 style]))
  {
    v6 = [(SUPageSectionGroup *)self sections];
    objc_super v7 = (void *)[a3 sections];
    uint64_t v8 = [(NSArray *)v6 count];
    LOBYTE(v9) = v8 == [v7 count];
    if ((_BYTE)v9 && v8 >= 1)
    {
      uint64_t v10 = 1;
      do
      {
        int v9 = objc_msgSend(-[NSArray objectAtIndex:](v6, "objectAtIndex:", v10 - 1), "isEqual:", objc_msgSend(v7, "objectAtIndex:", v10 - 1));
        if (!v9) {
          break;
        }
      }
      while (v10++ < v8);
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)loadFromDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v4 = (void *)[objc_alloc(MEMORY[0x263F7B2D0]) initWithDictionary:a3];
  int64_t v5 = (void *)[v4 dictionaryByEvaluatingConditions];

  [(SUPageSectionGroup *)self setDefaultSectionIndex:0];
  -[SUPageSectionGroup setStyle:](self, "setStyle:", -[SUPageSectionGroup _sectionStyleForString:](self, "_sectionStyleForString:", [v5 objectForKey:@"type"]));
  v6 = (void *)[v5 objectForKey:@"tint-color"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGColorRef v7 = SUCreateColorFromStyleString(v6);
    if (v7)
    {
      uint64_t v8 = v7;
      -[SUPageSectionGroup setTintColor:](self, "setTintColor:", [MEMORY[0x263F1C550] colorWithCGColor:v7]);
      CGColorRelease(v8);
    }
  }
  int v9 = (void *)[v5 objectForKey:@"tint-style"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = [v9 isEqualToString:@"dark"];
  }
  else {
    uint64_t v10 = 1;
  }
  [(SUPageSectionGroup *)self setTintStyle:v10];
  v11 = (void *)[v5 objectForKey:@"tabs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v11);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v18 = (void *)[v17 objectForKey:@"active-tab"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 integerValue] >= 1) {
            -[SUPageSectionGroup setDefaultSectionIndex:](self, "setDefaultSectionIndex:", [v12 count]);
          }
          v19 = objc_alloc_init(SUPageSection);
          if ([(SUPageSection *)v19 loadFromDictionary:v17]) {
            [v12 addObject:v19];
          }
        }
        uint64_t v14 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }
    [(SUPageSectionGroup *)self setSections:v12];
  }
  return [(NSArray *)[(SUPageSectionGroup *)self sections] count] != 0;
}

- (int64_t)_sectionStyleForString:(id)a3
{
  if (objc_opt_isKindOfClass()) {
    return [a3 isEqualToString:@"body"];
  }
  else {
    return 0;
  }
}

- (int64_t)defaultSectionIndex
{
  return self->_defaultSectionIndex;
}

- (void)setDefaultSectionIndex:(int64_t)a3
{
  self->_defaultSectionIndex = a3;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (int64_t)tintStyle
{
  return self->_tintStyle;
}

- (void)setTintStyle:(int64_t)a3
{
  self->_tintStyle = a3;
}

@end