@interface _NUAuxiliaryPropertiesResult
- (BOOL)canPropagateOriginalAuxiliaryData;
- (NUImageProperties)properties;
- (void)setCanPropagateOriginalAuxiliaryData:(BOOL)a3;
- (void)setProperties:(id)a3;
@end

@implementation _NUAuxiliaryPropertiesResult

- (void).cxx_destruct
{
}

- (void)setProperties:(id)a3
{
}

- (NUImageProperties)properties
{
  return (NUImageProperties *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCanPropagateOriginalAuxiliaryData:(BOOL)a3
{
  self->_canPropagateOriginalAuxiliaryData = a3;
}

- (BOOL)canPropagateOriginalAuxiliaryData
{
  return self->_canPropagateOriginalAuxiliaryData;
}

@end