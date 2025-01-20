@interface FCMultiStepFetchOperationStep
- (BOOL)isCritical;
- (SEL)fetchSelector;
- (void)setFetchSelector:(SEL)a3;
- (void)setIsCritical:(BOOL)a3;
@end

@implementation FCMultiStepFetchOperationStep

- (void)setIsCritical:(BOOL)a3
{
  self->_isCritical = a3;
}

- (void)setFetchSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_fetchSelector = v3;
}

- (SEL)fetchSelector
{
  if (self->_fetchSelector) {
    return self->_fetchSelector;
  }
  else {
    return 0;
  }
}

- (BOOL)isCritical
{
  return self->_isCritical;
}

@end