@interface SBUISystemApertureContentProvider
- (SBUISystemApertureContentViewProviding)actionContentViewProvider;
- (SBUISystemApertureContentViewProviding)leadingContentViewProvider;
- (SBUISystemApertureContentViewProviding)minimalContentViewProvider;
- (SBUISystemApertureContentViewProviding)primaryContentViewProvider;
- (SBUISystemApertureContentViewProviding)secondaryContentViewProvider;
- (SBUISystemApertureContentViewProviding)trailingContentViewProvider;
- (void)setActionContentViewProvider:(id)a3;
- (void)setLeadingContentViewProvider:(id)a3;
- (void)setMinimalContentViewProvider:(id)a3;
- (void)setPrimaryContentViewProvider:(id)a3;
- (void)setSecondaryContentViewProvider:(id)a3;
- (void)setTrailingContentViewProvider:(id)a3;
@end

@implementation SBUISystemApertureContentProvider

- (SBUISystemApertureContentViewProviding)leadingContentViewProvider
{
  return self->_leadingContentViewProvider;
}

- (void)setLeadingContentViewProvider:(id)a3
{
}

- (SBUISystemApertureContentViewProviding)trailingContentViewProvider
{
  return self->_trailingContentViewProvider;
}

- (void)setTrailingContentViewProvider:(id)a3
{
}

- (SBUISystemApertureContentViewProviding)primaryContentViewProvider
{
  return self->_primaryContentViewProvider;
}

- (void)setPrimaryContentViewProvider:(id)a3
{
}

- (SBUISystemApertureContentViewProviding)secondaryContentViewProvider
{
  return self->_secondaryContentViewProvider;
}

- (void)setSecondaryContentViewProvider:(id)a3
{
}

- (SBUISystemApertureContentViewProviding)actionContentViewProvider
{
  return self->_actionContentViewProvider;
}

- (void)setActionContentViewProvider:(id)a3
{
}

- (SBUISystemApertureContentViewProviding)minimalContentViewProvider
{
  return self->_minimalContentViewProvider;
}

- (void)setMinimalContentViewProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimalContentViewProvider, 0);
  objc_storeStrong((id *)&self->_actionContentViewProvider, 0);
  objc_storeStrong((id *)&self->_secondaryContentViewProvider, 0);
  objc_storeStrong((id *)&self->_primaryContentViewProvider, 0);
  objc_storeStrong((id *)&self->_trailingContentViewProvider, 0);
  objc_storeStrong((id *)&self->_leadingContentViewProvider, 0);
}

@end