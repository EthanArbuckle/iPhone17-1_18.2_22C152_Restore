@interface TSWPTabs
+ (id)tabs;
- (BOOL)isEqual:(id)a3;
- (TSWPTabs)init;
- (TSWPTabs)initWithTabs:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)tabAfterPosition:(double)a3;
- (id)tabAtIndex:(unint64_t)a3;
- (id)tabAtPosition:(double)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexForTabWithPosition:(double)a3 alignment:(int)a4 leader:(id)a5;
- (void)dealloc;
- (void)insertTab:(id)a3;
- (void)removeTabAtIndex:(unint64_t)a3;
- (void)setPosition:(double)a3 forTab:(id)a4;
@end

@implementation TSWPTabs

- (unint64_t)count
{
  return [(NSMutableArray *)self->_tabs count];
}

+ (id)tabs
{
  v2 = objc_alloc_init(TSWPTabs);

  return v2;
}

- (TSWPTabs)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPTabs;
  v2 = [(TSWPTabs *)&v4 init];
  if (v2) {
    v2->_tabs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  return v2;
}

- (TSWPTabs)initWithTabs:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPTabs;
  objc_super v4 = [(TSWPTabs *)&v6 init];
  if (v4) {
    v4->_tabs = (NSMutableArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:*((void *)a3 + 1) copyItems:1];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPTabs;
  [(TSWPTabs *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 initWithTabs:self];
}

- (id)tabAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_tabs objectAtIndexedSubscript:a3];
}

- (id)tabAtPosition:(double)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  tabs = self->_tabs;
  uint64_t v5 = [(NSMutableArray *)tabs countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v13;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v13 != v7) {
      objc_enumerationMutation(tabs);
    }
    v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
    [v9 position];
    if (vabdd_f64(a3, v10) <= 0.0000999999975) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)tabs countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (id)tabAfterPosition:(double)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  tabs = self->_tabs;
  uint64_t v5 = [(NSMutableArray *)tabs countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v13;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v13 != v7) {
      objc_enumerationMutation(tabs);
    }
    v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
    [v9 position];
    if (v10 > a3) {
      return v9;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [(NSMutableArray *)tabs countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)insertTab:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (a3)
  {
    [a3 position];
    double v6 = v5;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    tabs = self->_tabs;
    uint64_t v8 = [(NSMutableArray *)tabs countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        uint64_t v12 = 0;
        uint64_t v13 = v10 + v9;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(tabs);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v12) position];
          if (v6 < v14)
          {
            uint64_t v13 = v10 + v12;
            goto LABEL_13;
          }
          ++v12;
        }
        while (v9 != v12);
        uint64_t v9 = [(NSMutableArray *)tabs countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v10 = v13;
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
LABEL_13:
    [(NSMutableArray *)self->_tabs insertObject:a3 atIndex:v13];
  }
}

- (void)removeTabAtIndex:(unint64_t)a3
{
}

- (void)setPosition:(double)a3 forTab:(id)a4
{
  [a4 position];
  if (v6 != a3)
  {
    if ([(TSWPTabs *)self tabAtPosition:a3])
    {
      [a4 setPosition:a3];
    }
    else
    {
      id v7 = a4;
      [(NSMutableArray *)self->_tabs removeObjectIdenticalTo:a4];
      [a4 setPosition:a3];
      [(TSWPTabs *)self insertTab:a4];
    }
  }
}

- (unint64_t)indexForTabWithPosition:(double)a3 alignment:(int)a4 leader:(id)a5
{
  uint64_t v9 = [(NSMutableArray *)self->_tabs count];
  if (!v9) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v10 = v9;
  unint64_t v11 = 0;
  if (!a5) {
    a5 = @" ";
  }
  while (1)
  {
    uint64_t v12 = (void *)[(NSMutableArray *)self->_tabs objectAtIndexedSubscript:v11];
    if ([v12 alignment] == a4)
    {
      [v12 position];
      if (vabdd_f64(a3, v13) <= 0.0000999999975)
      {
        double v14 = (__CFString *)[v12 leader];
        long long v15 = v14 ? v14 : @" ";
        if ([a5 isEqualToString:v15]) {
          break;
        }
      }
    }
    if (v10 == ++v11) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  uint64_t v4 = TSUDynamicCast();
  if (v4)
  {
    tabs = self->_tabs;
    double v6 = *(NSMutableArray **)(v4 + 8);
    if (tabs == v6)
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = 0;
      if (tabs && v6)
      {
        id v7 = self->_tabs;
        LOBYTE(v4) = -[NSMutableArray isEqualToArray:](v7, "isEqualToArray:");
      }
    }
  }
  return v4;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: tabs=%@>", NSStringFromClass(v4), self->_tabs];
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return [(NSMutableArray *)self->_tabs countByEnumeratingWithState:a3 objects:a4 count:a5];
}

@end