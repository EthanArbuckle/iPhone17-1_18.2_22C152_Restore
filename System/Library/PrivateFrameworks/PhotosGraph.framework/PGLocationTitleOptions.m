@interface PGLocationTitleOptions
+ (id)onlyPeopleLocationTitleOptions;
- (BOOL)allowFamilyHome;
- (BOOL)showAllCities;
- (BOOL)useBusinessItems;
- (BOOL)useCities;
- (BOOL)useDistrict;
- (BOOL)useTripTitleForLongDuration;
- (NSSet)curationAddressNodes;
- (NSSet)momentNodes;
- (PGGraphAddressNode)keyAssetAddressNode;
- (PGLocationTitleOptions)init;
- (unint64_t)aoiDisplayType;
- (unint64_t)filterSignificantLocationsType;
- (unint64_t)lineBreakBehavior;
- (unint64_t)peopleDisplayType;
- (void)setAllowFamilyHome:(BOOL)a3;
- (void)setAoiDisplayType:(unint64_t)a3;
- (void)setCurationAddressNodes:(id)a3;
- (void)setFilterSignificantLocationsType:(unint64_t)a3;
- (void)setKeyAssetAddressNode:(id)a3;
- (void)setLineBreakBehavior:(unint64_t)a3;
- (void)setMomentNodes:(id)a3;
- (void)setPeopleDisplayType:(unint64_t)a3;
- (void)setShowAllCities:(BOOL)a3;
- (void)setUseBusinessItems:(BOOL)a3;
- (void)setUseCities:(BOOL)a3;
- (void)setUseDistrict:(BOOL)a3;
- (void)setUseTripTitleForLongDuration:(BOOL)a3;
@end

@implementation PGLocationTitleOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationAddressNodes, 0);
  objc_storeStrong((id *)&self->_keyAssetAddressNode, 0);
  objc_storeStrong((id *)&self->_momentNodes, 0);
}

- (void)setAllowFamilyHome:(BOOL)a3
{
  self->_allowFamilyHome = a3;
}

- (BOOL)allowFamilyHome
{
  return self->_allowFamilyHome;
}

- (void)setUseDistrict:(BOOL)a3
{
  self->_useDistrict = a3;
}

- (BOOL)useDistrict
{
  return self->_useDistrict;
}

- (void)setUseBusinessItems:(BOOL)a3
{
  self->_useBusinessItems = a3;
}

- (BOOL)useBusinessItems
{
  return self->_useBusinessItems;
}

- (void)setLineBreakBehavior:(unint64_t)a3
{
  self->_lineBreakBehavior = a3;
}

- (unint64_t)lineBreakBehavior
{
  return self->_lineBreakBehavior;
}

- (void)setFilterSignificantLocationsType:(unint64_t)a3
{
  self->_filterSignificantLocationsType = a3;
}

- (unint64_t)filterSignificantLocationsType
{
  return self->_filterSignificantLocationsType;
}

- (void)setUseTripTitleForLongDuration:(BOOL)a3
{
  self->_useTripTitleForLongDuration = a3;
}

- (BOOL)useTripTitleForLongDuration
{
  return self->_useTripTitleForLongDuration;
}

- (void)setPeopleDisplayType:(unint64_t)a3
{
  self->_peopleDisplayType = a3;
}

- (unint64_t)peopleDisplayType
{
  return self->_peopleDisplayType;
}

- (void)setShowAllCities:(BOOL)a3
{
  self->_showAllCities = a3;
}

- (BOOL)showAllCities
{
  return self->_showAllCities;
}

- (void)setUseCities:(BOOL)a3
{
  self->_useCities = a3;
}

- (BOOL)useCities
{
  return self->_useCities;
}

- (void)setAoiDisplayType:(unint64_t)a3
{
  self->_aoiDisplayType = a3;
}

- (unint64_t)aoiDisplayType
{
  return self->_aoiDisplayType;
}

- (void)setCurationAddressNodes:(id)a3
{
}

- (NSSet)curationAddressNodes
{
  return self->_curationAddressNodes;
}

- (void)setKeyAssetAddressNode:(id)a3
{
}

- (PGGraphAddressNode)keyAssetAddressNode
{
  return self->_keyAssetAddressNode;
}

- (void)setMomentNodes:(id)a3
{
}

- (NSSet)momentNodes
{
  return self->_momentNodes;
}

- (PGLocationTitleOptions)init
{
  v8.receiver = self;
  v8.super_class = (Class)PGLocationTitleOptions;
  v2 = [(PGLocationTitleOptions *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
    v4 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v3;

    uint64_t v5 = [MEMORY[0x1E4F1CAD0] set];
    v6 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v5;

    *(int64x2_t *)(v2 + 40) = vdupq_n_s64(1uLL);
    *(_OWORD *)(v2 + 56) = xmmword_1D1F48050;
    *((_DWORD *)v2 + 2) = 65537;
    *((_WORD *)v2 + 6) = 0;
  }
  return (PGLocationTitleOptions *)v2;
}

+ (id)onlyPeopleLocationTitleOptions
{
  v2 = objc_alloc_init(PGLocationTitleOptions);
  [(PGLocationTitleOptions *)v2 setAoiDisplayType:0];
  [(PGLocationTitleOptions *)v2 setFilterSignificantLocationsType:0];
  [(PGLocationTitleOptions *)v2 setPeopleDisplayType:2];
  [(PGLocationTitleOptions *)v2 setUseTripTitleForLongDuration:0];
  [(PGLocationTitleOptions *)v2 setUseCities:0];
  return v2;
}

@end