@interface VenueCategoryItem
- (BOOL)isAutoCompleteCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldFrameMapViewport;
- (GEOSearchCategory)searchCategory;
- (GEOVenueIdentifier)venueIdentifier;
- (VenueCategoryItem)initWithSearchCategory:(id)a3 venueIdentifier:(id)a4 displayMode:(int)a5 isAutoCompleteCategory:(BOOL)a6 shouldFrameMapViewport:(BOOL)a7;
- (int)displayMode;
@end

@implementation VenueCategoryItem

- (VenueCategoryItem)initWithSearchCategory:(id)a3 venueIdentifier:(id)a4 displayMode:(int)a5 isAutoCompleteCategory:(BOOL)a6 shouldFrameMapViewport:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VenueCategoryItem;
  v15 = [(VenueCategoryItem *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_searchCategory, a3);
    objc_storeStrong((id *)&v16->_venueIdentifier, a4);
    v16->_displayMode = a5;
    v16->_isAutoCompleteCategory = a6;
    v16->_shouldFrameMapViewport = a7;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VenueCategoryItem *)a3;
  if (v4 == self)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(VenueCategoryItem *)self searchCategory];
      v7 = [(VenueCategoryItem *)v5 searchCategory];
      if ([v6 isEqual:v7])
      {
        v8 = [(VenueCategoryItem *)self venueIdentifier];
        v9 = [(VenueCategoryItem *)v5 venueIdentifier];
        if ([v8 isEqual:v9]
          && (unsigned int v10 = [(VenueCategoryItem *)self displayMode],
              v10 == [(VenueCategoryItem *)v5 displayMode])
          && (unsigned int v11 = [(VenueCategoryItem *)self isAutoCompleteCategory],
              v11 == [(VenueCategoryItem *)v5 isAutoCompleteCategory]))
        {
          unsigned int v14 = [(VenueCategoryItem *)self shouldFrameMapViewport];
          unsigned int v12 = v14 ^ [(VenueCategoryItem *)v5 shouldFrameMapViewport] ^ 1;
        }
        else
        {
          LOBYTE(v12) = 0;
        }
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }

  return v12;
}

- (GEOSearchCategory)searchCategory
{
  return self->_searchCategory;
}

- (GEOVenueIdentifier)venueIdentifier
{
  return self->_venueIdentifier;
}

- (int)displayMode
{
  return self->_displayMode;
}

- (BOOL)isAutoCompleteCategory
{
  return self->_isAutoCompleteCategory;
}

- (BOOL)shouldFrameMapViewport
{
  return self->_shouldFrameMapViewport;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueIdentifier, 0);

  objc_storeStrong((id *)&self->_searchCategory, 0);
}

@end