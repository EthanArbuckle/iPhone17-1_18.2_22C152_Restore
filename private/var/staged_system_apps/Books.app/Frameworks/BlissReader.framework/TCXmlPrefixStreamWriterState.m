@interface TCXmlPrefixStreamWriterState
- (NSString)attributePrefix;
- (NSString)elementPrefix;
- (void)dealloc;
- (void)setAttributePrefix:(id)a3;
- (void)setElementPrefix:(id)a3;
@end

@implementation TCXmlPrefixStreamWriterState

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TCXmlPrefixStreamWriterState;
  [(TCXmlPrefixStreamWriterState *)&v3 dealloc];
}

- (NSString)elementPrefix
{
  return self->_elementPrefix;
}

- (void)setElementPrefix:(id)a3
{
}

- (NSString)attributePrefix
{
  return self->_attributePrefix;
}

- (void)setAttributePrefix:(id)a3
{
}

@end