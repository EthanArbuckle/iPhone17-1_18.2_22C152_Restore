@interface ATLHardwareCapabilities
- (BOOL)supportsQuickModeToGenericAFallback;
- (BOOL)supportsTypeAExpress;
- (void)setSupportsQuickModeToGenericAFallback:(BOOL)a3;
- (void)setSupportsTypeAExpress:(BOOL)a3;
@end

@implementation ATLHardwareCapabilities

- (BOOL)supportsTypeAExpress
{
  return self->_supportsTypeAExpress;
}

- (void)setSupportsTypeAExpress:(BOOL)a3
{
  self->_supportsTypeAExpress = a3;
}

- (BOOL)supportsQuickModeToGenericAFallback
{
  return self->_supportsQuickModeToGenericAFallback;
}

- (void)setSupportsQuickModeToGenericAFallback:(BOOL)a3
{
  self->_supportsQuickModeToGenericAFallback = a3;
}

@end