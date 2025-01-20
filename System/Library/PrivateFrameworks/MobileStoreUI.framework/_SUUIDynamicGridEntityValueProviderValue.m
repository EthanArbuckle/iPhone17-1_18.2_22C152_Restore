@interface _SUUIDynamicGridEntityValueProviderValue
- (IKEntityValueProviding)entityValueProvider;
- (int64_t)sectionIndex;
- (void)setEntityValueProvider:(id)a3;
- (void)setSectionIndex:(int64_t)a3;
@end

@implementation _SUUIDynamicGridEntityValueProviderValue

- (IKEntityValueProviding)entityValueProvider
{
  return self->_entityValueProvider;
}

- (void)setEntityValueProvider:(id)a3
{
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (void).cxx_destruct
{
}

@end