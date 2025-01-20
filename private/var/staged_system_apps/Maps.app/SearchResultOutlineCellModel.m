@interface SearchResultOutlineCellModel
- (BOOL)displayDistance;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsReloadFromPreviousViewModel:(id)a3;
- (BOOL)prefersAddressOverCategory;
- (GEOLocation)currentLocation;
- (GEOSearchCategory)searchCategory;
- (PlaceContextViewModel)placeContextViewModel;
- (PlaceContextViewModelCellDelegate)placeContextViewModelDelegate;
- (SearchResult)searchResult;
- (SearchResultOutlineCellModel)initWithSearchResult:(id)a3 currentLocation:(id)a4 searchCategory:(id)a5 displayDistance:(BOOL)a6 distanceUnit:(int64_t)a7 prefersAddressOverCategory:(BOOL)a8 placeContextViewModel:(id)a9 placeContextViewModelDelegate:(id)a10;
- (UICollectionViewCellRegistration)cellRegistration;
- (int64_t)distanceUnit;
- (unint64_t)hash;
@end

@implementation SearchResultOutlineCellModel

- (SearchResultOutlineCellModel)initWithSearchResult:(id)a3 currentLocation:(id)a4 searchCategory:(id)a5 displayDistance:(BOOL)a6 distanceUnit:(int64_t)a7 prefersAddressOverCategory:(BOOL)a8 placeContextViewModel:(id)a9 placeContextViewModelDelegate:(id)a10
{
  id v24 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a9;
  id v17 = a10;
  v25.receiver = self;
  v25.super_class = (Class)SearchResultOutlineCellModel;
  v18 = [(SearchResultOutlineCellModel *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_searchResult, a3);
    objc_storeStrong((id *)&v19->_currentLocation, a4);
    objc_storeStrong((id *)&v19->_searchCategory, a5);
    v19->_displayDistance = a6;
    v19->_distanceUnit = a7;
    v19->_prefersAddressOverCategory = a8;
    objc_storeStrong((id *)&v19->_placeContextViewModel, a9);
    objc_storeStrong((id *)&v19->_placeContextViewModelDelegate, a10);
  }

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SearchResult *)self->_searchResult hash];
  unint64_t v4 = (unint64_t)[(GEOLocation *)self->_currentLocation hash] ^ v3;
  return v4 ^ (unint64_t)[(GEOSearchCategory *)self->_searchCategory hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (SearchResultOutlineCellModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v17 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = [(SearchResultOutlineCellModel *)v6 searchResult];
    v8 = v7;
    if (v7 == self->_searchResult || -[SearchResult isEqual:](v7, "isEqual:"))
    {
      v9 = [(SearchResultOutlineCellModel *)v6 currentLocation];
      v10 = v9;
      if (v9 == self->_currentLocation || -[GEOLocation isEqual:](v9, "isEqual:"))
      {
        v11 = [(SearchResultOutlineCellModel *)v6 searchCategory];
        v12 = v11;
        if ((v11 == self->_searchCategory || -[GEOSearchCategory isEqual:](v11, "isEqual:"))
          && self->_displayDistance == [(SearchResultOutlineCellModel *)v6 displayDistance]
          && [(SearchResultOutlineCellModel *)v6 distanceUnit] == self->_distanceUnit
          && self->_prefersAddressOverCategory == [(SearchResultOutlineCellModel *)v6 prefersAddressOverCategory])
        {
          v13 = [(SearchResultOutlineCellModel *)v6 placeContextViewModel];
          id v14 = v13;
          if (v13 == self->_placeContextViewModel || -[PlaceContextViewModel isEqual:](v13, "isEqual:"))
          {
            id v15 = [(SearchResultOutlineCellModel *)v6 placeContextViewModelDelegate];
            id v16 = v15;
            if (v15 == self->_placeContextViewModelDelegate) {
              unsigned __int8 v17 = 1;
            }
            else {
              unsigned __int8 v17 = -[PlaceContextViewModelCellDelegate isEqual:](v15, "isEqual:");
            }
          }
          else
          {
            unsigned __int8 v17 = 0;
          }
        }
        else
        {
          unsigned __int8 v17 = 0;
        }
      }
      else
      {
        unsigned __int8 v17 = 0;
      }
    }
    else
    {
      unsigned __int8 v17 = 0;
    }
  }
  else
  {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (UICollectionViewCellRegistration)cellRegistration
{
  return (UICollectionViewCellRegistration *)+[SearchResultOutlineCellRegistration sharedRegistration];
}

- (BOOL)needsReloadFromPreviousViewModel:(id)a3
{
  return ![(SearchResultOutlineCellModel *)self isEqual:a3];
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (BOOL)displayDistance
{
  return self->_displayDistance;
}

- (int64_t)distanceUnit
{
  return self->_distanceUnit;
}

- (BOOL)prefersAddressOverCategory
{
  return self->_prefersAddressOverCategory;
}

- (PlaceContextViewModel)placeContextViewModel
{
  return self->_placeContextViewModel;
}

- (PlaceContextViewModelCellDelegate)placeContextViewModelDelegate
{
  return self->_placeContextViewModelDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeContextViewModelDelegate, 0);
  objc_storeStrong((id *)&self->_placeContextViewModel, 0);
  objc_storeStrong((id *)&self->_searchCategory, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);

  objc_storeStrong((id *)&self->_searchResult, 0);
}

@end