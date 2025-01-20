@interface SPTreeNode
- (id)debugDescription;
- (void)dealloc;
@end

@implementation SPTreeNode

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SPTreeNode;
  [(SPTreeNode *)&v3 dealloc];
}

- (id)debugDescription
{
  angleBracketContents = self->_angleBracketContents;
  if (angleBracketContents)
  {
    if (self->_isKernel) {
      v4 = "*";
    }
    else {
      v4 = " ";
    }
    return +[NSString stringWithFormat:@"%s%d %@ (%@)", v4, self->_count, angleBracketContents, self->_stateInfo, v9, v10];
  }
  else
  {
    bodies = self->_bodies;
    if (self->_isKernel) {
      v7 = "*";
    }
    else {
      v7 = " ";
    }
    if (bodies) {
      return +[NSString stringWithFormat:@"%s%d %@ (x%lu) [0x%llx] (%@)", v7, self->_count, [(NSArray *)bodies firstObject], [(NSArray *)self->_bodies count], self->_address, self->_stateInfo];
    }
    else {
      return +[NSString stringWithFormat:@"%s%d (%@)", v7, self->_count, self->_stateInfo, v8, v9, v10];
    }
  }
}

- (void).cxx_destruct
{
}

@end