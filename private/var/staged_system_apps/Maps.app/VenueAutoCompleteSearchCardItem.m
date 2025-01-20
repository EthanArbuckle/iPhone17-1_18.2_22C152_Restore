@interface VenueAutoCompleteSearchCardItem
- (BOOL)isVenueItem;
- (GEOSearchCategory)venueSearchCategory;
- (GEOVenueIdentifier)venueIdentifier;
- (VenueAutoCompleteSearchCardItem)initWithVenueIdentifier:(id)a3 searchCategory:(id)a4;
- (unint64_t)venueID;
@end

@implementation VenueAutoCompleteSearchCardItem

- (VenueAutoCompleteSearchCardItem)initWithVenueIdentifier:(id)a3 searchCategory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VenueAutoCompleteSearchCardItem;
  v9 = [(VenueAutoCompleteSearchCardItem *)&v11 init];
  if (v9)
  {
    v9->_venueID = (unint64_t)[v7 venueID];
    objc_storeStrong((id *)&v9->_venueIdentifier, a3);
    objc_storeStrong((id *)&v9->_venueSearchCategory, a4);
  }

  return v9;
}

- (BOOL)isVenueItem
{
  return [(VenueAutoCompleteSearchCardItem *)self venueID] != 0;
}

- (unint64_t)venueID
{
  return self->_venueID;
}

- (GEOVenueIdentifier)venueIdentifier
{
  return self->_venueIdentifier;
}

- (GEOSearchCategory)venueSearchCategory
{
  return self->_venueSearchCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueSearchCategory, 0);

  objc_storeStrong((id *)&self->_venueIdentifier, 0);
}

@end