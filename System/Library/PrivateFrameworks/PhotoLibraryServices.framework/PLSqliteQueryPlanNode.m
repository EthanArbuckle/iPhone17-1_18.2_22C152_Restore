@interface PLSqliteQueryPlanNode
- (NSString)nodeDescription;
- (PLSqliteQueryPlanNode)initWithIdentifier:(int)a3 parentIdentifier:(int)a4 unused:(int)a5 nodeDescription:(id)a6;
- (int)identifier;
- (int)parentIdentifier;
- (int)unused;
@end

@implementation PLSqliteQueryPlanNode

- (void).cxx_destruct
{
}

- (NSString)nodeDescription
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (int)unused
{
  return self->_unused;
}

- (int)parentIdentifier
{
  return self->_parentIdentifier;
}

- (int)identifier
{
  return self->_identifier;
}

- (PLSqliteQueryPlanNode)initWithIdentifier:(int)a3 parentIdentifier:(int)a4 unused:(int)a5 nodeDescription:(id)a6
{
  id v10 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PLSqliteQueryPlanNode;
  v11 = [(PLSqliteQueryPlanNode *)&v17 init];
  v12 = v11;
  if (v11)
  {
    v11->_identifier = a3;
    v11->_parentIdentifier = a4;
    v11->_unused = a5;
    uint64_t v13 = [v10 copy];
    nodeDescription = v12->_nodeDescription;
    v12->_nodeDescription = (NSString *)v13;

    v15 = v12;
  }

  return v12;
}

@end