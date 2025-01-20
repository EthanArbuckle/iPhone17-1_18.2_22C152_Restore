@interface DBTDuxburyFormatNode
+ (NSSet)innerCodes;
+ (NSString)beginCode;
+ (NSString)endCode;
- (BOOL)foundInnerCode:(id)a3;
- (BOOL)isClosed;
- (DBTDuxburyFormatNode)init;
- (NSMutableArray)children;
- (id)LaTeXRepresentation;
- (id)_debugDescriptionWithIndent:(unint64_t)a3;
- (id)debugDescription;
- (id)firstChildMatchingBlock:(id)a3;
- (void)addChild:(id)a3;
- (void)addChildren:(id)a3;
- (void)foundEndCode:(id)a3;
- (void)removeAllChildren;
- (void)setChildren:(id)a3;
@end

@implementation DBTDuxburyFormatNode

- (DBTDuxburyFormatNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)DBTDuxburyFormatNode;
  v2 = [(DBTDuxburyFormatNode *)&v6 init];
  uint64_t v3 = +[NSMutableArray array];
  children = v2->_children;
  v2->_children = (NSMutableArray *)v3;

  v2->_closed = 0;
  return v2;
}

+ (NSString)beginCode
{
  return 0;
}

+ (NSString)endCode
{
  return 0;
}

+ (NSSet)innerCodes
{
  return 0;
}

- (void)addChild:(id)a3
{
}

- (void)addChildren:(id)a3
{
}

- (void)removeAllChildren
{
}

- (id)firstChildMatchingBlock:(id)a3
{
  v4 = (uint64_t (**)(id, void *))a3;
  v5 = [(DBTDuxburyFormatNode *)self children];
  id v6 = [v5 mutableCopy];

  if ([v6 count])
  {
    while (1)
    {
      v7 = [v6 lastObject];
      [v6 removeLastObject];
      if (v4[2](v4, v7)) {
        break;
      }
      v8 = [v7 children];
      [v6 addObjectsFromArray:v8];

      if (![v6 count]) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    v7 = 0;
  }

  return v7;
}

- (BOOL)foundInnerCode:(id)a3
{
  return 1;
}

- (void)foundEndCode:(id)a3
{
  self->_closed = 1;
}

- (id)LaTeXRepresentation
{
  uint64_t v3 = +[NSMutableString string];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_children;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "LaTeXRepresentation", (void)v11);
        [v3 appendString:v9];
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)debugDescription
{
  return [(DBTDuxburyFormatNode *)self _debugDescriptionWithIndent:0];
}

- (id)_debugDescriptionWithIndent:(unint64_t)a3
{
  id v5 = +[NSMutableString string];
  if (a3)
  {
    unint64_t v6 = a3;
    do
    {
      [v5 appendString:@" "];
      --v6;
    }
    while (v6);
  }
  uint64_t v7 = [(DBTDuxburyFormatNode *)self description];
  [v5 appendString:v7];

  if ([(NSMutableArray *)self->_children count])
  {
    [v5 appendString:@"\n"];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v8 = self->_children;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      unint64_t v12 = a3 + 2;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "_debugDescriptionWithIndent:", v12, (void)v18);
          [v5 appendString:v15];

          v16 = [(NSMutableArray *)self->_children lastObject];

          if (v14 != v16) {
            [v5 appendString:@"\n"];
          }
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }

  return v5;
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (BOOL)isClosed
{
  return self->_closed;
}

- (void).cxx_destruct
{
}

@end