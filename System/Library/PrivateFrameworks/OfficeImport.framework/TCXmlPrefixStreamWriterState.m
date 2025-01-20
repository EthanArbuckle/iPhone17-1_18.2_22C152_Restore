@interface TCXmlPrefixStreamWriterState
- (NSString)attributePrefix;
- (NSString)elementPrefix;
- (void)setAttributePrefix:(id)a3;
- (void)setElementPrefix:(id)a3;
@end

@implementation TCXmlPrefixStreamWriterState

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributePrefix, 0);
  objc_storeStrong((id *)&self->_elementPrefix, 0);
}

@end