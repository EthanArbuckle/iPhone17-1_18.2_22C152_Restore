@interface CRLWPTabs
+ (id)tabs;
- (BOOL)isEqual:(id)a3;
- (CRLWPTabs)init;
- (CRLWPTabs)initWithTabs:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)tabAfterPosition:(double)a3;
- (id)tabAtIndex:(unint64_t)a3;
- (id)tabAtPosition:(double)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (unint64_t)indexForTabWithPosition:(double)a3 alignment:(int)a4 leader:(id)a5;
- (void)insertTab:(id)a3;
- (void)removeTabAtIndex:(unint64_t)a3;
- (void)setPosition:(double)a3 forTab:(id)a4;
@end

@implementation CRLWPTabs

+ (id)tabs
{
  v2 = objc_alloc_init(CRLWPTabs);

  return v2;
}

- (CRLWPTabs)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRLWPTabs;
  v2 = [(CRLWPTabs *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    tabs = v2->_tabs;
    v2->_tabs = v3;
  }
  return v2;
}

- (CRLWPTabs)initWithTabs:(id)a3
{
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLWPTabs;
  v5 = [(CRLWPTabs *)&v9 init];
  if (v5)
  {
    objc_super v6 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v4[1] copyItems:1];
    tabs = v5->_tabs;
    v5->_tabs = v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];

  return _[v4 initWithTabs:self];
}

- (unint64_t)count
{
  return (unint64_t)[(NSMutableArray *)self->_tabs count];
}

- (id)tabAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_tabs objectAtIndexedSubscript:a3];
}

- (id)tabAtPosition:(double)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_tabs;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v8 position:v12];
        if (v9 == a3 || vabdd_f64(a3, v9) < fabs(v9 * 0.000000999999997))
        {
          id v10 = v8;
          goto LABEL_13;
        }
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v10 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v10 = 0;
  }
LABEL_13:

  return v10;
}

- (id)tabAfterPosition:(double)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_tabs;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v8 position:(void)v12];
        BOOL v10 = v9 <= a3 || v9 == a3;
        if (!v10 && vabdd_f64(a3, v9) >= 0.00999999978)
        {
          id v5 = v8;
          goto LABEL_15;
        }
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return v5;
}

- (void)insertTab:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 position];
    double v7 = v6;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = self->_tabs;
    double v9 = (char *)[(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      BOOL v10 = 0;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        long long v12 = 0;
        long long v13 = &v9[(void)v10];
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) position:(void)v15];
          if (v7 < v14)
          {
            long long v13 = &v12[(void)v10];
            goto LABEL_13;
          }
          ++v12;
        }
        while (v9 != v12);
        double v9 = (char *)[(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        BOOL v10 = v13;
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      long long v13 = 0;
    }
LABEL_13:

    [(NSMutableArray *)self->_tabs insertObject:v5 atIndex:v13];
  }
}

- (void)removeTabAtIndex:(unint64_t)a3
{
}

- (void)setPosition:(double)a3 forTab:(id)a4
{
  id v8 = a4;
  [v8 position];
  if (v6 != a3)
  {
    double v7 = [(CRLWPTabs *)self tabAtPosition:a3];

    if (v7)
    {
      [v8 setPosition:a3];
    }
    else
    {
      [(NSMutableArray *)self->_tabs removeObjectIdenticalTo:v8];
      [v8 setPosition:a3];
      [(CRLWPTabs *)self insertTab:v8];
    }
  }
}

- (unint64_t)indexForTabWithPosition:(double)a3 alignment:(int)a4 leader:(id)a5
{
  id v8 = (__CFString *)a5;
  id v9 = [(NSMutableArray *)self->_tabs count];
  if (v9)
  {
    unint64_t v10 = 0;
    if (v8) {
      uint64_t v11 = v8;
    }
    else {
      uint64_t v11 = @" ";
    }
    while (1)
    {
      long long v12 = [(NSMutableArray *)self->_tabs objectAtIndexedSubscript:v10];
      if ([v12 alignment] == a4)
      {
        [v12 position];
        if (v13 == a3 || vabdd_f64(a3, v13) < fabs(v13 * 0.000000999999997))
        {
          double v14 = [v12 leader];
          long long v15 = v8;
          CFStringRef v16 = v14;
          long long v17 = (__CFString *)v16;
          long long v18 = v16 ? (__CFString *)v16 : @" ";
          unsigned int v19 = [(__CFString *)v11 isEqualToString:v18];

          if (v19) {
            break;
          }
        }
      }

      if (v9 == (id)++v10) {
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  double v6 = sub_1002469D0(v5, v4);
  if (v6)
  {
    tabs = self->_tabs;
    id v8 = (NSMutableArray *)v6[1];
    if (tabs == v8)
    {
      unsigned __int8 v9 = 1;
    }
    else
    {
      unsigned __int8 v9 = 0;
      if (tabs && v8) {
        unsigned __int8 v9 = -[NSMutableArray isEqualToArray:](tabs, "isEqualToArray:");
      }
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSMutableArray *)self->_tabs count];
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = +[NSString stringWithFormat:@"<%@: tabs=%@>", v4, self->_tabs];

  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return (unint64_t)[(NSMutableArray *)self->_tabs countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void).cxx_destruct
{
}

@end