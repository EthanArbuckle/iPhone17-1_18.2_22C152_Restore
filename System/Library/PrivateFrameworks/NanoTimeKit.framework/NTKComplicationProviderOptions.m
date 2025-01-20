@interface NTKComplicationProviderOptions
- (BOOL)allowGenericDateComplication;
- (BOOL)includeDisabledTypes;
- (NSArray)rankedFamilies;
- (NSArray)supportedDateStyles;
- (NSIndexSet)allowedComplicationTypes;
- (NTKComplicationProviderOptions)init;
- (id)_initWithOptions:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAllowGenericDateComplication:(BOOL)a3;
- (void)setAllowedComplicationTypes:(id)a3;
- (void)setIncludeDisabledTypes:(BOOL)a3;
- (void)setRankedFamilies:(id)a3;
- (void)setSupportedDateStyles:(id)a3;
@end

@implementation NTKComplicationProviderOptions

- (NTKComplicationProviderOptions)init
{
  v10.receiver = self;
  v10.super_class = (Class)NTKComplicationProviderOptions;
  v2 = [(NTKComplicationProviderOptions *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    allowedComplicationTypes = v2->_allowedComplicationTypes;
    v2->_allowedComplicationTypes = (NSIndexSet *)v3;

    uint64_t v5 = objc_opt_new();
    rankedFamilies = v2->_rankedFamilies;
    v2->_rankedFamilies = (NSArray *)v5;

    uint64_t v7 = objc_opt_new();
    supportedDateStyles = v2->_supportedDateStyles;
    v2->_supportedDateStyles = (NSArray *)v7;

    *(_WORD *)&v2->_includeDisabledTypes = 0;
  }
  return v2;
}

- (id)_initWithOptions:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKComplicationProviderOptions;
  uint64_t v5 = [(NTKComplicationProviderOptions *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [*((id *)v4 + 2) copy];
    allowedComplicationTypes = v5->_allowedComplicationTypes;
    v5->_allowedComplicationTypes = (NSIndexSet *)v6;

    uint64_t v8 = [*((id *)v4 + 3) copy];
    rankedFamilies = v5->_rankedFamilies;
    v5->_rankedFamilies = (NSArray *)v8;

    uint64_t v10 = [*((id *)v4 + 4) copy];
    supportedDateStyles = v5->_supportedDateStyles;
    v5->_supportedDateStyles = (NSArray *)v10;

    v5->_includeDisabledTypes = *((unsigned char *)v4 + 8);
    v5->_allowGenericDateComplication = *((unsigned char *)v4 + 9);
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 _initWithOptions:self];
}

- (NSIndexSet)allowedComplicationTypes
{
  return self->_allowedComplicationTypes;
}

- (void)setAllowedComplicationTypes:(id)a3
{
}

- (NSArray)rankedFamilies
{
  return self->_rankedFamilies;
}

- (void)setRankedFamilies:(id)a3
{
}

- (NSArray)supportedDateStyles
{
  return self->_supportedDateStyles;
}

- (void)setSupportedDateStyles:(id)a3
{
}

- (BOOL)includeDisabledTypes
{
  return self->_includeDisabledTypes;
}

- (void)setIncludeDisabledTypes:(BOOL)a3
{
  self->_includeDisabledTypes = a3;
}

- (BOOL)allowGenericDateComplication
{
  return self->_allowGenericDateComplication;
}

- (void)setAllowGenericDateComplication:(BOOL)a3
{
  self->_allowGenericDateComplication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedDateStyles, 0);
  objc_storeStrong((id *)&self->_rankedFamilies, 0);
  objc_storeStrong((id *)&self->_allowedComplicationTypes, 0);
}

@end