@interface PGTimeTitleOptions
- (BOOL)filterDates;
- (BOOL)filterForSignificantDateNodes;
- (BOOL)usePeopleSubtitleFormatWithYears;
- (NSLocale)locale;
- (NSSet)locationNodes;
- (NSSet)momentNodes;
- (PGGraphYearNodeCollection)featuredYearNodes;
- (PGTimeTitleOptions)init;
- (unint64_t)allowedFormats;
- (void)setAllowedFormats:(unint64_t)a3;
- (void)setFeaturedYearNodes:(id)a3;
- (void)setFilterDates:(BOOL)a3;
- (void)setFilterForSignificantDateNodes:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setLocationNodes:(id)a3;
- (void)setMomentNodes:(id)a3;
- (void)setUsePeopleSubtitleFormatWithYears:(BOOL)a3;
@end

@implementation PGTimeTitleOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_locationNodes, 0);
  objc_storeStrong((id *)&self->_featuredYearNodes, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
}

- (void)setFilterForSignificantDateNodes:(BOOL)a3
{
  self->_filterForSignificantDateNodes = a3;
}

- (BOOL)filterForSignificantDateNodes
{
  return self->_filterForSignificantDateNodes;
}

- (void)setUsePeopleSubtitleFormatWithYears:(BOOL)a3
{
  self->_usePeopleSubtitleFormatWithYears = a3;
}

- (BOOL)usePeopleSubtitleFormatWithYears
{
  return self->_usePeopleSubtitleFormatWithYears;
}

- (void)setLocale:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setFilterDates:(BOOL)a3
{
  self->_filterDates = a3;
}

- (BOOL)filterDates
{
  return self->_filterDates;
}

- (void)setAllowedFormats:(unint64_t)a3
{
  self->_allowedFormats = a3;
}

- (unint64_t)allowedFormats
{
  return self->_allowedFormats;
}

- (void)setLocationNodes:(id)a3
{
}

- (NSSet)locationNodes
{
  return self->_locationNodes;
}

- (void)setFeaturedYearNodes:(id)a3
{
}

- (PGGraphYearNodeCollection)featuredYearNodes
{
  return self->_featuredYearNodes;
}

- (void)setMomentNodes:(id)a3
{
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (PGTimeTitleOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)PGTimeTitleOptions;
  v2 = [(PGTimeTitleOptions *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
    momentNodes = v2->_momentNodes;
    v2->_momentNodes = (NSSet *)v3;

    v2->_allowedFormats = 7;
    *(_WORD *)&v2->_filterDates = 1;
    v2->_filterForSignificantDateNodes = 1;
  }
  return v2;
}

@end