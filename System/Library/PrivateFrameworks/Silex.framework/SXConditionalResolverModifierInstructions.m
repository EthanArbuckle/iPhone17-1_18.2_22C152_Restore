@interface SXConditionalResolverModifierInstructions
- (BOOL)shouldResolveAutoplacement;
- (BOOL)shouldResolveComponentLayouts;
- (BOOL)shouldResolveComponentStyles;
- (BOOL)shouldResolveComponentTextStyles;
- (BOOL)shouldResolveComponents;
- (BOOL)shouldResolveDocumentStyle;
- (BOOL)shouldResolveTextStyles;
- (SXConditionalResolverModifierInstructions)initWithDocumentProvider:(id)a3 hintsConfigurationOptionProvider:(id)a4;
- (SXDocumentProviding)documentProvider;
- (SXHintsConfigurationOptionProvider)hintsConfigurationOptionProvider;
- (id)hints;
@end

@implementation SXConditionalResolverModifierInstructions

- (SXConditionalResolverModifierInstructions)initWithDocumentProvider:(id)a3 hintsConfigurationOptionProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXConditionalResolverModifierInstructions;
  v9 = [(SXConditionalResolverModifierInstructions *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_documentProvider, a3);
    objc_storeStrong((id *)&v10->_hintsConfigurationOptionProvider, a4);
  }

  return v10;
}

- (BOOL)shouldResolveAutoplacement
{
  v2 = [(SXConditionalResolverModifierInstructions *)self hints];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 autoplacement] != 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)shouldResolveComponents
{
  v2 = [(SXConditionalResolverModifierInstructions *)self hints];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 components] != 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)shouldResolveComponentLayouts
{
  v2 = [(SXConditionalResolverModifierInstructions *)self hints];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 componentLayouts] != 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)shouldResolveComponentStyles
{
  v2 = [(SXConditionalResolverModifierInstructions *)self hints];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 componentStyles] != 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)shouldResolveComponentTextStyles
{
  v2 = [(SXConditionalResolverModifierInstructions *)self hints];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 componentTextStyles] != 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)shouldResolveDocumentStyle
{
  v2 = [(SXConditionalResolverModifierInstructions *)self hints];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 documentStyle] != 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (BOOL)shouldResolveTextStyles
{
  v2 = [(SXConditionalResolverModifierInstructions *)self hints];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 textStyles] != 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (id)hints
{
  v3 = [(SXHintsConfigurationOptionProvider *)self->_hintsConfigurationOptionProvider hints];
  char v4 = [v3 ignoreConditionalHints];

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = [(SXDocumentProviding *)self->_documentProvider document];
    id v7 = [v6 hints];
    v5 = [v7 conditionals];
  }
  return v5;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (SXHintsConfigurationOptionProvider)hintsConfigurationOptionProvider
{
  return self->_hintsConfigurationOptionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hintsConfigurationOptionProvider, 0);
  objc_storeStrong((id *)&self->_documentProvider, 0);
}

@end