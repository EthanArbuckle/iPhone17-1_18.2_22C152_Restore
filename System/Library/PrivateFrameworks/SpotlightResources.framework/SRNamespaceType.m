@interface SRNamespaceType
- (NSSet)parameterNames;
- (NSString)namespaceId;
- (NSString)namespaceName;
- (SRNamespaceType)init;
- (void)addParameterName:(id)a3;
- (void)setNamespaceId:(id)a3;
- (void)setNamespaceName:(id)a3;
- (void)setParameterNames:(id)a3;
@end

@implementation SRNamespaceType

- (SRNamespaceType)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRNamespaceType;
  v2 = [(SRNamespaceType *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    parameterNames = v2->_parameterNames;
    v2->_parameterNames = v3;
  }
  return v2;
}

- (void)addParameterName:(id)a3
{
}

- (NSSet)parameterNames
{
  return (NSSet *)self->_parameterNames;
}

- (NSString)namespaceName
{
  return self->_namespaceName;
}

- (void)setNamespaceName:(id)a3
{
}

- (NSString)namespaceId
{
  return self->_namespaceId;
}

- (void)setNamespaceId:(id)a3
{
}

- (void)setParameterNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaceId, 0);
  objc_storeStrong((id *)&self->_namespaceName, 0);
  objc_storeStrong((id *)&self->_parameterNames, 0);
}

@end