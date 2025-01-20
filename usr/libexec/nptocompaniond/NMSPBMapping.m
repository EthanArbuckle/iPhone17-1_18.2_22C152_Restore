@interface NMSPBMapping
- (Class)requestClass;
- (Class)responseClass;
- (void)setRequestClass:(Class)a3;
- (void)setResponseClass:(Class)a3;
@end

@implementation NMSPBMapping

- (Class)requestClass
{
  return self->_requestClass;
}

- (void)setRequestClass:(Class)a3
{
}

- (Class)responseClass
{
  return self->_responseClass;
}

- (void)setResponseClass:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseClass, 0);

  objc_storeStrong((id *)&self->_requestClass, 0);
}

@end