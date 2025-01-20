@interface _UIDebugLogNode
+ (id)rootNode;
- (BOOL)_isNode;
- (BOOL)hasMessages;
- (_UIDebugLogNode)initWithString:(id)a3 attributedString:(id)a4;
- (_UIDebugLogNodeTreeStyle)treeStyle;
- (id)attributedDescription;
- (id)description;
- (void)__genericAppendChildDescription:(id)a3 withPrefix:(id)a4 inheritedTreeStyle:(id)a5 recursionSelector:(SEL)a6 appendHandler:(id)a7;
- (void)_appendAttributedChildDescription:(id)a3 withPrefix:(id)a4 inheritedTreeStyle:(id)a5;
- (void)_appendChildDescription:(id)a3 withPrefix:(id)a4 inheritedTreeStyle:(id)a5;
- (void)addMessage:(id)a3;
- (void)setTreeStyle:(id)a3;
@end

@implementation _UIDebugLogNode

- (_UIDebugLogNode)initWithString:(id)a3 attributedString:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIDebugLogNode;
  v4 = [(_UIDebugLogMessage *)&v8 initWithString:a3 attributedString:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    childMessages = v4->_childMessages;
    v4->_childMessages = (NSMutableArray *)v5;
  }
  return v4;
}

+ (id)rootNode
{
  v2 = [(_UIDebugLogNode *)[__UIDebugLogRootNode alloc] initWithString:@"@rootNode" attributedString:0];
  return v2;
}

- (BOOL)_isNode
{
  return 1;
}

- (BOOL)hasMessages
{
  return [(NSMutableArray *)self->_childMessages count] != 0;
}

- (void)addMessage:(id)a3
{
}

- (void)__genericAppendChildDescription:(id)a3 withPrefix:(id)a4 inheritedTreeStyle:(id)a5 recursionSelector:(SEL)a6 appendHandler:(id)a7
{
  id v32 = a3;
  id v31 = a4;
  id v11 = a5;
  v30 = (void (**)(id, void *, void *, id))a7;
  if ([(NSMutableArray *)self->_childMessages count])
  {
    unint64_t v12 = [(NSMutableArray *)self->_childMessages indexOfObjectWithOptions:2 passingTest:&__block_literal_global_109_0];
    v13 = [(_UIDebugLogNode *)self treeStyle];
    v14 = v13;
    id v28 = v11;
    if (v13 || (v14 = v11) != 0)
    {
      id v15 = v14;
    }
    else
    {
      id v15 = +[_UIDebugLogNodeTreeStyle defaultStyle];
    }
    v16 = v15;

    if ([(NSMutableArray *)self->_childMessages count])
    {
      unint64_t v17 = 0;
      do
      {
        v18 = [(NSMutableArray *)self->_childMessages objectAtIndexedSubscript:v17];
        int v19 = [v18 _isNode];
        BOOL v21 = v12 != 0x7FFFFFFFFFFFFFFFLL && v12 > v17;
        if (([v18 _isTransparent] & 1) == 0)
        {
          v22 = NSString;
          v23 = _prefixForItem(v19, v21, v16);
          v24 = [v22 stringWithFormat:@"\n%@%@", v31, v23];

          v30[2](v30, v18, v24, v32);
        }
        if (v19)
        {
          id v25 = v18;
          if ([v25 _isTransparent])
          {
            id v26 = v31;
          }
          else
          {
            v27 = _prefixForItem(0, v21, v16);
            id v26 = [v31 stringByAppendingString:v27];
          }
          objc_msgSend(v25, a6, v32, v26, v16);
        }
        ++v17;
      }
      while (v17 < [(NSMutableArray *)self->_childMessages count]);
    }

    id v11 = v28;
  }
}

- (void)_appendChildDescription:(id)a3 withPrefix:(id)a4 inheritedTreeStyle:(id)a5
{
}

- (void)_appendAttributedChildDescription:(id)a3 withPrefix:(id)a4 inheritedTreeStyle:(id)a5
{
}

- (id)description
{
  v3 = [(_UIDebugLogMessage *)self _stringRepresentation];
  v4 = (void *)[v3 mutableCopy];

  [(_UIDebugLogNode *)self _appendChildDescription:v4 withPrefix:&stru_1ED0E84C0 inheritedTreeStyle:0];
  return v4;
}

- (id)attributedDescription
{
  v3 = [(_UIDebugLogMessage *)self _attributedStringRepresentation];
  v4 = (void *)[v3 mutableCopy];

  [(_UIDebugLogNode *)self _appendAttributedChildDescription:v4 withPrefix:&stru_1ED0E84C0 inheritedTreeStyle:0];
  return v4;
}

- (_UIDebugLogNodeTreeStyle)treeStyle
{
  return self->_treeStyle;
}

- (void)setTreeStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treeStyle, 0);
  objc_storeStrong((id *)&self->_childMessages, 0);
}

@end