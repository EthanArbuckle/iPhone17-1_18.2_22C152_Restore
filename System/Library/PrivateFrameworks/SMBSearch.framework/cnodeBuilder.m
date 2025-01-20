@interface cnodeBuilder
- (cNodeRestriction)rootNode;
- (cnodeBuilder)initWithType:(unsigned int)a3 Weight:(unsigned int)a4;
- (int)appendRestriction:(id)a3;
- (unsigned)ulType;
- (unsigned)weight;
- (void)setRootNode:(id)a3;
- (void)setUlType:(unsigned int)a3;
- (void)setWeight:(unsigned int)a3;
@end

@implementation cnodeBuilder

- (cnodeBuilder)initWithType:(unsigned int)a3 Weight:(unsigned int)a4
{
  v10.receiver = self;
  v10.super_class = (Class)cnodeBuilder;
  v6 = [(cnodeBuilder *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_ulType = a3;
    v6->_weight = a4;
    rootNode = v6->_rootNode;
    v6->_rootNode = 0;
  }
  return v7;
}

- (int)appendRestriction:(id)a3
{
  id v4 = a3;
  rootNode = self->_rootNode;
  if (!rootNode)
  {
    v7 = [[cNodeRestriction alloc] initWithType:self->_ulType Weight:self->_weight];
    v8 = self->_rootNode;
    self->_rootNode = v7;

    v6 = self->_rootNode;
    if (v6) {
      goto LABEL_5;
    }
LABEL_9:
    int v13 = 12;
    goto LABEL_10;
  }
  if ([(cNodeRestriction *)rootNode nodeCount] > 1)
  {
    v9 = [[cNodeRestriction alloc] initWithType:self->_ulType Weight:self->_weight];
    if (v9)
    {
      objc_super v10 = v9;
      [(cNodeRestriction *)v9 appendRestriction:self->_rootNode];
      [(cNodeRestriction *)v10 appendRestriction:v4];
      v11 = self->_rootNode;
      self->_rootNode = v10;
      v12 = v10;

      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v6 = self->_rootNode;
LABEL_5:
  [(cNodeRestriction *)v6 appendRestriction:v4];
LABEL_8:
  int v13 = 0;
LABEL_10:

  return v13;
}

- (unsigned)ulType
{
  return self->_ulType;
}

- (void)setUlType:(unsigned int)a3
{
  self->_ulType = a3;
}

- (unsigned)weight
{
  return self->_weight;
}

- (void)setWeight:(unsigned int)a3
{
  self->_weight = a3;
}

- (cNodeRestriction)rootNode
{
  return (cNodeRestriction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRootNode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end