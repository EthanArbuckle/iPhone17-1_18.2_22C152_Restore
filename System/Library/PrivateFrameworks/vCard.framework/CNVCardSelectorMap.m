@interface CNVCardSelectorMap
- (CNVCardSelectorMap)init;
- (SEL)selectorForString:(id)a3;
- (void)setSelector:(SEL)a3 forString:(id)a4;
@end

@implementation CNVCardSelectorMap

- (CNVCardSelectorMap)init
{
  v9.receiver = self;
  v9.super_class = (Class)CNVCardSelectorMap;
  v2 = [(CNVCardSelectorMap *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    strings = v2->_strings;
    v2->_strings = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    selectors = v2->_selectors;
    v2->_selectors = v5;

    v7 = v2;
  }

  return v2;
}

- (void)setSelector:(SEL)a3 forString:(id)a4
{
  strings = self->_strings;
  id v7 = a4;
  uint64_t v8 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](strings, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, [(NSMutableArray *)strings count], 1024, &__block_literal_global_0);
  [(NSMutableArray *)self->_strings insertObject:v7 atIndex:v8];

  selectors = self->_selectors;
  id v10 = [MEMORY[0x1E4F29238] valueWithPointer:a3];
  [(NSMutableArray *)selectors insertObject:v10 atIndex:v8];
}

- (SEL)selectorForString:(id)a3
{
  strings = self->_strings;
  id v5 = a3;
  uint64_t v6 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](strings, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, [(NSMutableArray *)strings count], 256, &__block_literal_global_0);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v8 = [(NSMutableArray *)self->_selectors objectAtIndex:v6];
  objc_super v9 = (const char *)[v8 pointerValue];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectors, 0);
  objc_storeStrong((id *)&self->_strings, 0);
}

@end