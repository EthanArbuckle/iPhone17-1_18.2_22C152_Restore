@interface _BKMousePointerServerClientPerDisplay
- (BSInvalidatable)modelUpdateAssertion;
- (BSInvalidatable)renderingAssertion;
- (NSMutableDictionary)buttonDownRepositionUniqueIdentifierToAssertionMap;
- (void)setButtonDownRepositionUniqueIdentifierToAssertionMap:(id)a3;
- (void)setModelUpdateAssertion:(id)a3;
- (void)setRenderingAssertion:(id)a3;
@end

@implementation _BKMousePointerServerClientPerDisplay

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonDownRepositionUniqueIdentifierToAssertionMap, 0);
  objc_storeStrong((id *)&self->_modelUpdateAssertion, 0);

  objc_storeStrong((id *)&self->_renderingAssertion, 0);
}

- (void)setButtonDownRepositionUniqueIdentifierToAssertionMap:(id)a3
{
}

- (NSMutableDictionary)buttonDownRepositionUniqueIdentifierToAssertionMap
{
  return self->_buttonDownRepositionUniqueIdentifierToAssertionMap;
}

- (void)setModelUpdateAssertion:(id)a3
{
}

- (BSInvalidatable)modelUpdateAssertion
{
  return self->_modelUpdateAssertion;
}

- (void)setRenderingAssertion:(id)a3
{
}

- (BSInvalidatable)renderingAssertion
{
  return self->_renderingAssertion;
}

@end