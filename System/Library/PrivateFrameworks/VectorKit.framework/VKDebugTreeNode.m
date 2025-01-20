@interface VKDebugTreeNode
- (BOOL)isExpandable;
- (NSArray)children;
- (NSString)name;
- (VKDebugTreeNode)initWithParent:(id)a3;
- (VKDebugTreeNode)parent;
- (id)propertyColumn;
- (id)tagsColumn;
- (id)valueColumn;
- (void)setChildren:(id)a3;
@end

@implementation VKDebugTreeNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
}

- (void)setChildren:(id)a3
{
}

- (NSArray)children
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (VKDebugTreeNode)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (VKDebugTreeNode *)WeakRetained;
}

- (id)tagsColumn
{
  return @"error";
}

- (id)valueColumn
{
  return @"error";
}

- (id)propertyColumn
{
  return @"error";
}

- (NSString)name
{
  return (NSString *)@"unknown";
}

- (BOOL)isExpandable
{
  return 0;
}

- (VKDebugTreeNode)initWithParent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VKDebugTreeNode;
  v5 = [(VKDebugTreeNode *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_parent, v4);
  }

  return v6;
}

@end