@interface SXDOMCacheKey
- (BOOL)isEqual:(id)a3;
- (SXConditionHints)hints;
- (SXDOMCacheKey)initWithLayoutOptions:(id)a3 hints:(id)a4;
- (SXLayoutOptions)options;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation SXDOMCacheKey

- (SXDOMCacheKey)initWithLayoutOptions:(id)a3 hints:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXDOMCacheKey;
  v9 = [(SXDOMCacheKey *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_options, a3);
    objc_storeStrong((id *)&v10->_hints, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SXDOMCacheKey *)a3;
  if (!v4) {
    goto LABEL_43;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_43;
  }
  if (self == v4
    || (options = self->_options, options == v4->_options)
    || (uint64_t v6 = [(SXLayoutOptions *)options diffWithLayoutOptions:"diffWithLayoutOptions:"]) == 0)
  {
LABEL_44:
    BOOL v10 = 1;
    goto LABEL_45;
  }
  __int16 v7 = v6;
  hints = self->_hints;
  if (!hints) {
    goto LABEL_43;
  }
  v9 = v4->_hints;
  if (!v9 || hints != v9 && !-[SXJSONObject isEqual:](hints, "isEqual:")) {
    goto LABEL_43;
  }
  if ((v7 & 1) != 0
    && ([(SXConditionHints *)self->_hints minColumns]
     || [(SXConditionHints *)self->_hints maxColumns])
    || (v7 & 2) != 0
    && ([(SXConditionHints *)self->_hints minViewportWidth]
     || [(SXConditionHints *)self->_hints maxViewportWidth]
     || [(SXConditionHints *)self->_hints minViewportAspectRatio]
     || [(SXConditionHints *)self->_hints maxViewportAspectRatio]))
  {
    goto LABEL_43;
  }
  if ((v7 & 4) != 0)
  {
    if ([(SXConditionHints *)self->_hints minContentSizeCategory]
      || [(SXConditionHints *)self->_hints maxContentSizeCategory] | v7 & 0x100)
    {
      goto LABEL_43;
    }
    goto LABEL_25;
  }
  if ((v7 & 0x100) == 0)
  {
LABEL_25:
    if ((v7 & 8) != 0 && [(SXConditionHints *)self->_hints subscriptionStatus]
      || (v7 & 0x10) != 0 && [(SXConditionHints *)self->_hints subscriptionStatus]
      || (v7 & 0x200) != 0 && [(SXConditionHints *)self->_hints horizontalSizeClass]
      || (v7 & 0x400) != 0 && [(SXConditionHints *)self->_hints verticalSizeClass]
      || (v7 & 0x40) != 0 && [(SXConditionHints *)self->_hints testing]
      || (v7 & 0x20) != 0 && [(SXConditionHints *)self->_hints viewLocation]
      || (v7 & 0x800) != 0 && [(SXConditionHints *)self->_hints newsletter]
      || (v7 & 0x1000) != 0 && [(SXConditionHints *)self->_hints upsellScenario]
      || (v7 & 0x2000) != 0
      && [(SXConditionHints *)self->_hints subscriptionActivationEligibility])
    {
      goto LABEL_43;
    }
    goto LABEL_44;
  }
LABEL_43:
  BOOL v10 = 0;
LABEL_45:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [SXDOMCacheKey alloc];
  options = self->_options;
  hints = self->_hints;
  return [(SXDOMCacheKey *)v4 initWithLayoutOptions:options hints:hints];
}

- (SXLayoutOptions)options
{
  return self->_options;
}

- (SXConditionHints)hints
{
  return self->_hints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hints, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end