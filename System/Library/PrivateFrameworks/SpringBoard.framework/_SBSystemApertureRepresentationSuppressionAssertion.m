@interface _SBSystemApertureRepresentationSuppressionAssertion
- (BOOL)_isValid;
- (BOOL)isCoverSheetVisible;
- (BOOL)isLiquidDetectionVisible;
- (BOOL)isProximityReaderVisible;
- (BOOL)suppressForSystemChromeSuppression;
- (NSString)description;
- (_SBSystemApertureRepresentationSuppressionAssertion)initWithCoverSheetVisible:(BOOL)a3 liquidDetectionVisible:(BOOL)a4 proximityReaderVisible:(BOOL)a5 suppressForSystemChromeSuppression:(BOOL)a6 invalidationBlock:(id)a7;
- (void)_setValid:(BOOL)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _SBSystemApertureRepresentationSuppressionAssertion

- (BOOL)suppressForSystemChromeSuppression
{
  return self->_suppressForSystemChromeSuppression;
}

- (BOOL)isProximityReaderVisible
{
  return self->_proximityReaderVisible;
}

- (BOOL)isLiquidDetectionVisible
{
  return self->_liquidDetectionVisible;
}

- (BOOL)isCoverSheetVisible
{
  return self->_coverSheetVisible;
}

- (_SBSystemApertureRepresentationSuppressionAssertion)initWithCoverSheetVisible:(BOOL)a3 liquidDetectionVisible:(BOOL)a4 proximityReaderVisible:(BOOL)a5 suppressForSystemChromeSuppression:(BOOL)a6 invalidationBlock:(id)a7
{
  id v12 = a7;
  v18.receiver = self;
  v18.super_class = (Class)_SBSystemApertureRepresentationSuppressionAssertion;
  v13 = [(_SBSystemApertureRepresentationSuppressionAssertion *)&v18 init];
  v14 = v13;
  if (v13)
  {
    [(_SBSystemApertureRepresentationSuppressionAssertion *)v13 _setValid:1];
    v14->_coverSheetVisible = a3;
    v14->_liquidDetectionVisible = a4;
    v14->_proximityReaderVisible = a5;
    v14->_suppressForSystemChromeSuppression = a6;
    uint64_t v15 = [v12 copy];
    id invalidationBlock = v14->_invalidationBlock;
    v14->_id invalidationBlock = (id)v15;
  }
  return v14;
}

- (void)_setValid:(BOOL)a3
{
  self->__valid = a3;
}

- (void)dealloc
{
  if ([(_SBSystemApertureRepresentationSuppressionAssertion *)self _isValid])
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"SBSystemApertureViewController.m" lineNumber:4268 description:@"Must be invalidated before deallocation"];
  }
  v5.receiver = self;
  v5.super_class = (Class)_SBSystemApertureRepresentationSuppressionAssertion;
  [(_SBSystemApertureRepresentationSuppressionAssertion *)&v5 dealloc];
}

- (NSString)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)_SBSystemApertureRepresentationSuppressionAssertion;
  v4 = [(_SBSystemApertureRepresentationSuppressionAssertion *)&v7 description];
  objc_super v5 = [v3 stringWithFormat:@"%@ coverSheetVisible: %{BOOL}u suppressForSystemChromeSuppression: %{BOOL}u", v4, self->_coverSheetVisible, self->_suppressForSystemChromeSuppression];

  return (NSString *)v5;
}

- (void)invalidate
{
  [(_SBSystemApertureRepresentationSuppressionAssertion *)self _setValid:0];
  id invalidationBlock = (void (**)(id, _SBSystemApertureRepresentationSuppressionAssertion *))self->_invalidationBlock;
  if (invalidationBlock)
  {
    invalidationBlock[2](invalidationBlock, self);
    id v4 = self->_invalidationBlock;
    self->_id invalidationBlock = 0;
  }
}

- (BOOL)_isValid
{
  return self->__valid;
}

- (void).cxx_destruct
{
}

@end