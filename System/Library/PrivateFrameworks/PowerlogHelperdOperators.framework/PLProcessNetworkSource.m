@interface PLProcessNetworkSource
- (NSDictionary)countsDictionary;
- (NSDictionary)descriptionDictionary;
- (PLProcessNetworkSource)initWithSource:(__NStatSource *)a3;
- (__NStatSource)source;
- (void)setCountsDictionary:(id)a3;
- (void)setDescriptionDictionary:(id)a3;
- (void)setSource:(__NStatSource *)a3;
@end

@implementation PLProcessNetworkSource

- (PLProcessNetworkSource)initWithSource:(__NStatSource *)a3
{
  self->_source = a3;
  return self;
}

- (NSDictionary)descriptionDictionary
{
  return self->_descriptionDictionary;
}

- (void)setDescriptionDictionary:(id)a3
{
}

- (NSDictionary)countsDictionary
{
  return self->_countsDictionary;
}

- (void)setCountsDictionary:(id)a3
{
}

- (__NStatSource)source
{
  return self->_source;
}

- (void)setSource:(__NStatSource *)a3
{
  self->_source = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countsDictionary, 0);
  objc_storeStrong((id *)&self->_descriptionDictionary, 0);
}

@end