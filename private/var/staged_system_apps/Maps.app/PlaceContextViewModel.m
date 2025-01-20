@interface PlaceContextViewModel
- (BOOL)isEqual:(id)a3;
- (BOOL)isRTL;
- (BOOL)isTappable;
- (CollectionHandler)userGeneratedCollection;
- (NSArray)placeCollections;
- (NSArray)stringHighlightRanges;
- (NSAttributedString)attributedString;
- (NSAttributedString)highlightedAttributedString;
- (PlaceContextViewModel)initWithChargerNumberString:(id)a3;
- (PlaceContextViewModel)initWithCurrentLocation;
- (PlaceContextViewModel)initWithLibraryContextForPinnedItem;
- (PlaceContextViewModel)initWithLibraryContextForPlaceNote:(id)a3;
- (PlaceContextViewModel)initWithLibraryContextForUserCollectionName:(id)a3;
- (PlaceContextViewModel)initWithMapItem:(id)a3 context:(unint64_t)a4;
- (PlaceContextViewModel)initWithPlaceCollection:(id)a3;
- (PlaceContextViewModel)initWithPlaceCollections:(id)a3;
- (PlaceContextViewModel)initWithRatingsWithMapItem:(id)a3;
- (PlaceContextViewModel)initWithType:(unint64_t)a3 image:(id)a4 attributedString:(id)a5;
- (PlaceContextViewModel)initWithType:(unint64_t)a3 image:(id)a4 string:(id)a5 stringHighlightRanges:(id)a6;
- (PlaceContextViewModel)initWithUGCRatingsWithMapItem:(id)a3;
- (PlaceContextViewModel)initWithUGCUserSubmittedRecommendationWithReviewedPlace:(id)a3;
- (PlaceContextViewModel)initWithUserGeneratedCollection:(id)a3;
- (UIColor)imageTintColor;
- (UIImage)image;
- (double)imageContinuousCornerRadius;
- (id)attributedStringHighlightedWithString:(id)a3 stringHighlightRanges:(id)a4;
- (id)attributedStringWithString:(id)a3 stringHighlightRanges:(id)a4;
- (id)userGeneratedCollectionContainingMapItem:(id)a3;
- (unint64_t)hash;
- (unint64_t)type;
- (void)setAttributedString:(id)a3;
- (void)setHighlightedAttributedString:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageContinuousCornerRadius:(double)a3;
- (void)setImageTintColor:(id)a3;
- (void)setPlaceCollections:(id)a3;
- (void)setStringHighlightRanges:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setUserGeneratedCollection:(id)a3;
@end

@implementation PlaceContextViewModel

- (PlaceContextViewModel)initWithType:(unint64_t)a3 image:(id)a4 string:(id)a5 stringHighlightRanges:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PlaceContextViewModel;
  v14 = [(PlaceContextViewModel *)&v21 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_image, a4);
    uint64_t v16 = [(PlaceContextViewModel *)v15 attributedStringWithString:v12 stringHighlightRanges:v13];
    attributedString = v15->_attributedString;
    v15->_attributedString = (NSAttributedString *)v16;

    uint64_t v18 = [(PlaceContextViewModel *)v15 attributedStringHighlightedWithString:v12 stringHighlightRanges:v13];
    highlightedAttributedString = v15->_highlightedAttributedString;
    v15->_highlightedAttributedString = (NSAttributedString *)v18;
  }
  return v15;
}

- (PlaceContextViewModel)initWithType:(unint64_t)a3 image:(id)a4 attributedString:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PlaceContextViewModel;
  id v11 = [(PlaceContextViewModel *)&v14 init];
  id v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_image, a4);
    objc_storeStrong((id *)&v12->_attributedString, a5);
  }

  return v12;
}

- (id)attributedStringHighlightedWithString:(id)a3 stringHighlightRanges:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v5];
  if ([v6 count])
  {
    id v19 = v5;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_super v14 = +[UIColor whiteColor];
          id v15 = [v13 rangeValue];
          [v7 addAttribute:NSForegroundColorAttributeName value:v14 range:v15];
        }
        id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    id v5 = v19;
  }
  id v17 = [v7 copy];

  return v17;
}

- (id)attributedStringWithString:(id)a3 stringHighlightRanges:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v5];
  if ([v6 count])
  {
    id v19 = v5;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_super v14 = +[UIColor systemBlueColor];
          id v15 = [v13 rangeValue];
          [v7 addAttribute:NSForegroundColorAttributeName value:v14 range:v15, v16];
        }
        id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    id v5 = v19;
  }
  id v17 = [v7 copy];

  return v17;
}

- (PlaceContextViewModel)initWithLibraryContextForPlaceNote:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [objc_alloc((Class)NSAttributedString) initWithString:v4];
    id v6 = [(PlaceContextViewModel *)self initWithType:9 image:0 attributedString:v5];

    self = v6;
    id v7 = self;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (PlaceContextViewModel)initWithLibraryContextForUserCollectionName:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = +[UIImage systemImageNamed:@"checkmark"];
    id v6 = objc_alloc((Class)NSAttributedString);
    NSAttributedStringKey v15 = NSForegroundColorAttributeName;
    id v7 = +[UIColor systemBlueColor];
    uint64_t v16 = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v9 = [v6 initWithString:v4 attributes:v8];

    id v10 = [(PlaceContextViewModel *)self initWithType:10 image:v5 attributedString:v9];
    if (v10)
    {
      uint64_t v11 = +[UIColor secondaryLabelColor];
      imageTintColor = v10->_imageTintColor;
      v10->_imageTintColor = (UIColor *)v11;
    }
    self = v10;

    id v13 = self;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (PlaceContextViewModel)initWithLibraryContextForPinnedItem
{
  v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"[Library] Pinned" value:@"localized string not found" table:0];

  id v5 = +[UIImage systemImageNamed:@"pin.fill"];
  id v6 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringKey v14 = NSForegroundColorAttributeName;
  id v7 = +[UIColor secondaryLabelColor];
  NSAttributedStringKey v15 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  id v9 = [v6 initWithString:v4 attributes:v8];

  id v10 = [(PlaceContextViewModel *)self initWithType:11 image:v5 attributedString:v9];
  if (v10)
  {
    uint64_t v11 = +[UIColor secondaryLabelColor];
    imageTintColor = v10->_imageTintColor;
    v10->_imageTintColor = (UIColor *)v11;

    objc_storeStrong((id *)&v10->_highlightedAttributedString, v9);
  }

  return v10;
}

- (PlaceContextViewModel)initWithPlaceCollection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 publisherAttribution];
  id v6 = [v5 iconIdentifier];

  id v7 = +[UIScreen mainScreen];
  [v7 scale];
  id v8 = +[MKIconManager imageForIconID:contentScale:sizeGroup:nightMode:](MKIconManager, "imageForIconID:contentScale:sizeGroup:nightMode:", v6, 1, 0);

  id v9 = [v4 publisherAttribution];
  id v10 = [v9 displayName];

  uint64_t v11 = [v4 collectionTitle];
  id v12 = +[NSMutableArray array];
  if ([v10 length]) {
    [v12 addObject:v10];
  }
  if ([v11 length]) {
    [v12 addObject:v11];
  }
  if ([(PlaceContextViewModel *)self isRTL])
  {
    id v13 = [v12 reverseObjectEnumerator];
    NSAttributedStringKey v14 = [v13 allObjects];
    id v15 = [v14 mutableCopy];

    id v12 = v15;
  }
  uint64_t v16 = [v12 componentsJoinedByString:@": "];
  id v17 = [v16 rangeOfString:v11];
  if (v17 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v19 = 0;
  }
  else
  {
    long long v20 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v17, v18);
    v26 = v20;
    id v19 = +[NSArray arrayWithObjects:&v26 count:1];
  }
  long long v21 = [(PlaceContextViewModel *)self initWithType:1 image:v8 string:v16 stringHighlightRanges:v19];
  if (v21)
  {
    id v25 = v4;
    uint64_t v22 = +[NSArray arrayWithObjects:&v25 count:1];
    placeCollections = v21->_placeCollections;
    v21->_placeCollections = (NSArray *)v22;

    v21->_imageContinuousCornerRadius = 3.0;
  }

  return v21;
}

- (PlaceContextViewModel)initWithPlaceCollections:(id)a3
{
  id v4 = a3;
  id v5 = +[UIImage systemImageNamed:@"star.fill"];
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"Featured in %lu Guides" value:@"localized string not found" table:0];
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, [v4 count]);

  id v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"%lu Guides" value:@"localized string not found" table:0];
  uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, [v4 count]);

  id v13 = [v8 rangeOfString:v11];
  NSAttributedStringKey v14 = 0;
  if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v15 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v13, v12);
    uint64_t v22 = v15;
    NSAttributedStringKey v14 = +[NSArray arrayWithObjects:&v22 count:1];
  }
  uint64_t v16 = [(PlaceContextViewModel *)self initWithType:2 image:v5 string:v8 stringHighlightRanges:v14];
  if (v16)
  {
    id v17 = (NSArray *)[v4 copy];
    placeCollections = v16->_placeCollections;
    v16->_placeCollections = v17;

    uint64_t v19 = +[UIColor secondaryLabelColor];
    imageTintColor = v16->_imageTintColor;
    v16->_imageTintColor = (UIColor *)v19;
  }
  return v16;
}

- (PlaceContextViewModel)initWithCurrentLocation
{
  v3 = +[MKLocationManager sharedLocationManager];
  unsigned __int8 v4 = [v3 isAuthorizedForPreciseLocation];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = +[UIImageSymbolConfiguration configurationWithScale:1];
    id v7 = +[UIImage systemImageNamed:@"location.fill" withConfiguration:v6];

    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@" Requires precise location" value:@"localized string not found" table:0];

    id v10 = [(PlaceContextViewModel *)self initWithType:4 image:v7 string:v9 stringHighlightRanges:0];
    if (v10)
    {
      uint64_t v11 = +[UIColor secondaryLabelColor];
      imageTintColor = v10->_imageTintColor;
      v10->_imageTintColor = (UIColor *)v11;
    }
    self = v10;

    id v5 = self;
  }

  return v5;
}

- (PlaceContextViewModel)initWithRatingsWithMapItem:(id)a3
{
  id v4 = a3;
  id v5 = +[UIColor secondaryLabelColor];
  id v6 = +[UIFont system15];
  id v7 = +[MKInfoCardThemeManager currentTheme];
  id v8 = +[MKRatingStringBuilder ratingAndReviewSummaryAttributedStringForMapItem:v4 textColor:v5 font:v6 theme:v7];

  id v9 = [(PlaceContextViewModel *)self initWithType:5 image:0 attributedString:v8];
  return v9;
}

- (PlaceContextViewModel)initWithUserGeneratedCollection:(id)a3
{
  id v5 = a3;
  id v6 = [v5 title];
  id v7 = [v6 length];

  if (v7)
  {
    id v8 = +[UIImage systemImageNamed:@"checkmark"];
    id v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"In your Guide %@" value:@"localized string not found" table:0];
    uint64_t v11 = [v5 title];
    uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11);

    id v13 = [v5 title];
    id v14 = [v12 rangeOfString:v13];
    uint64_t v16 = v15;

    id v17 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v14, v16);
    id v25 = v17;
    uint64_t v18 = +[NSArray arrayWithObjects:&v25 count:1];

    uint64_t v19 = [(PlaceContextViewModel *)self initWithType:3 image:v8 string:v12 stringHighlightRanges:v18];
    long long v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_userGeneratedCollection, a3);
      uint64_t v21 = +[UIColor secondaryLabelColor];
      imageTintColor = v20->_imageTintColor;
      v20->_imageTintColor = (UIColor *)v21;
    }
    self = v20;

    long long v23 = self;
  }
  else
  {
    long long v23 = 0;
  }

  return v23;
}

- (PlaceContextViewModel)initWithChargerNumberString:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)NSAttributedString);
  v12[0] = NSForegroundColorAttributeName;
  id v6 = +[UIColor secondaryLabelColor];
  v13[0] = v6;
  v12[1] = NSFontAttributeName;
  id v7 = +[UIFont system15];
  v13[1] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v9 = [v5 initWithString:v4 attributes:v8];

  id v10 = [(PlaceContextViewModel *)self initWithType:6 image:0 attributedString:v9];
  return v10;
}

- (PlaceContextViewModel)initWithUGCUserSubmittedRecommendationWithReviewedPlace:(id)a3
{
  id v4 = [a3 recommendState];
  if (v4 == (id)1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2 * (v4 == (id)2);
  }
  id v6 = +[UIFont system15];
  id v7 = +[MKFirstPartyRatingStringBuilder userRecommendationStringWithFont:v6 ratingState:v5 numberOfPhotosAdded:0];

  id v8 = [(PlaceContextViewModel *)self initWithType:7 image:0 attributedString:v7];
  return v8;
}

- (PlaceContextViewModel)initWithUGCRatingsWithMapItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[UIColor secondaryLabelColor];
  id v6 = +[UIFont system15];
  id v7 = +[MKInfoCardThemeManager currentTheme];
  id v8 = +[MKFirstPartyRatingStringBuilder userRecommendedRatingSummaryAttributedStringForMapItem:v4 textColor:v5 font:v6 theme:v7];

  id v9 = [(PlaceContextViewModel *)self initWithType:8 image:0 attributedString:v8];
  return v9;
}

- (PlaceContextViewModel)initWithMapItem:(id)a3 context:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    if (+[MKPOIEnrichmentAvailibility shouldShowAppleRatingsForMapItem:v6])
    {
      uint64_t v11 = +[UGCReviewedPlaceManager locallyCachedReviewedPlaceForMUID:](UGCReviewedPlaceManager, "locallyCachedReviewedPlaceForMUID:", [v6 _muid]);
      id v9 = v11;
      if (v11 && [v11 recommendState]) {
        goto LABEL_7;
      }

      if ([v6 _hasChargerNumberString])
      {
LABEL_25:
        id v9 = [v6 _chargerNumberString];
        id v10 = [(PlaceContextViewModel *)self initWithChargerNumberString:v9];
        goto LABEL_26;
      }
      uint64_t v12 = [(PlaceContextViewModel *)self initWithUGCRatingsWithMapItem:v6];
    }
    else
    {
      if ([v6 _hasChargerNumberString]) {
        goto LABEL_25;
      }
      if (![v6 _hasMUID]
        || ([v6 _isMapItemTypeAddress] & 1) != 0
        || ([v6 _isMapItemTypeSettlement] & 1) != 0)
      {
        goto LABEL_45;
      }
      uint64_t v12 = [(PlaceContextViewModel *)self initWithRatingsWithMapItem:v6];
    }
    self = v12;
    uint64_t v18 = self;
    goto LABEL_46;
  }
  if (a4 == 1)
  {
    id v9 = [(PlaceContextViewModel *)self userGeneratedCollectionContainingMapItem:v6];
    if (v9)
    {
LABEL_13:
      id v10 = [(PlaceContextViewModel *)self initWithUserGeneratedCollection:v9];
      goto LABEL_26;
    }
    id v13 = [v6 _placeCollections];
    id v14 = [v13 count];

    uint64_t v15 = [v6 _placeCollections];
    uint64_t v16 = v15;
    if (v14 == (id)1)
    {
      id v17 = [v15 firstObject];
      self = [(PlaceContextViewModel *)self initWithPlaceCollection:v17];

LABEL_39:
      goto LABEL_27;
    }
    id v20 = [v15 count];

    if ((unint64_t)v20 >= 2) {
      goto LABEL_37;
    }
    goto LABEL_45;
  }
  if (a4) {
    goto LABEL_45;
  }
  unsigned int v7 = +[MKPOIEnrichmentAvailibility shouldShowAppleRatingsForMapItem:v6];
  if (!v7)
  {
LABEL_22:
    id v9 = [(PlaceContextViewModel *)self userGeneratedCollectionContainingMapItem:v6];
    if (v9) {
      goto LABEL_13;
    }
    if ([v6 _hasChargerNumberString])
    {
      uint64_t v16 = [v6 _chargerNumberString];
      uint64_t v19 = [(PlaceContextViewModel *)self initWithChargerNumberString:v16];
LABEL_38:
      self = v19;
      goto LABEL_39;
    }
    uint64_t v21 = [v6 _placeCollections];
    id v22 = [v21 count];

    long long v23 = [v6 _placeCollections];
    v24 = v23;
    if (v22 == (id)1)
    {
      id v25 = [v23 firstObject];
      self = [(PlaceContextViewModel *)self initWithPlaceCollection:v25];

      goto LABEL_27;
    }
    id v26 = [v23 count];

    if ((unint64_t)v26 >= 2)
    {
LABEL_37:
      uint64_t v16 = [v6 _placeCollections];
      uint64_t v19 = [(PlaceContextViewModel *)self initWithPlaceCollections:v16];
      goto LABEL_38;
    }
    if (v7)
    {
      id v10 = [(PlaceContextViewModel *)self initWithUGCRatingsWithMapItem:v6];
      goto LABEL_26;
    }
    if ([v6 _hasMUID]
      && ([v6 _isMapItemTypeAddress] & 1) == 0
      && ([v6 _isMapItemTypeSettlement] & 1) == 0)
    {
      id v10 = [(PlaceContextViewModel *)self initWithRatingsWithMapItem:v6];
      goto LABEL_26;
    }
LABEL_45:
    uint64_t v18 = 0;
    goto LABEL_46;
  }
  id v8 = +[UGCReviewedPlaceManager locallyCachedReviewedPlaceForMUID:](UGCReviewedPlaceManager, "locallyCachedReviewedPlaceForMUID:", [v6 _muid]);
  id v9 = v8;
  if (!v8 || ![v8 recommendState])
  {

    goto LABEL_22;
  }
LABEL_7:
  id v10 = [(PlaceContextViewModel *)self initWithUGCUserSubmittedRecommendationWithReviewedPlace:v9];
LABEL_26:
  self = v10;
LABEL_27:

  uint64_t v18 = self;
LABEL_46:

  return v18;
}

- (BOOL)isTappable
{
  return self->_type - 1 < 3;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(UIImage *)self->_image hash];
  return (unint64_t)[(NSAttributedString *)self->_attributedString hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PlaceContextViewModel *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      if ([(PlaceContextViewModel *)v5 type] == self->_type)
      {
        id v6 = [(PlaceContextViewModel *)v5 image];
        unsigned int v7 = v6;
        if (v6 == self->_image || -[UIImage isEqual:](v6, "isEqual:"))
        {
          id v8 = [(PlaceContextViewModel *)v5 attributedString];
          id v9 = v8;
          if (v8 == self->_attributedString) {
            unsigned __int8 v10 = 1;
          }
          else {
            unsigned __int8 v10 = -[NSAttributedString isEqual:](v8, "isEqual:");
          }
        }
        else
        {
          unsigned __int8 v10 = 0;
        }
      }
      else
      {
        unsigned __int8 v10 = 0;
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (BOOL)isRTL
{
  v2 = +[UIApplication sharedApplication];
  BOOL v3 = [v2 userInterfaceLayoutDirection] == (id)1;

  return v3;
}

- (id)userGeneratedCollectionContainingMapItem:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  unsigned __int8 v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_100103FB8;
  id v13 = sub_100104868;
  id v14 = 0;
  id v4 = +[CollectionManager sharedManager];
  uint64_t v5 = [v4 collectionsContainingMapItem:v3];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1007E8B94;
  v8[3] = &unk_1012F9560;
  v8[4] = &v9;
  [v5 enumerateObjectsUsingBlock:v8];
  id v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (void)setImageTintColor:(id)a3
{
}

- (double)imageContinuousCornerRadius
{
  return self->_imageContinuousCornerRadius;
}

- (void)setImageContinuousCornerRadius:(double)a3
{
  self->_imageContinuousCornerRadius = a3;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
}

- (NSAttributedString)highlightedAttributedString
{
  return self->_highlightedAttributedString;
}

- (void)setHighlightedAttributedString:(id)a3
{
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void)setPlaceCollections:(id)a3
{
}

- (CollectionHandler)userGeneratedCollection
{
  return self->_userGeneratedCollection;
}

- (void)setUserGeneratedCollection:(id)a3
{
}

- (NSArray)stringHighlightRanges
{
  return self->_stringHighlightRanges;
}

- (void)setStringHighlightRanges:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringHighlightRanges, 0);
  objc_storeStrong((id *)&self->_userGeneratedCollection, 0);
  objc_storeStrong((id *)&self->_placeCollections, 0);
  objc_storeStrong((id *)&self->_highlightedAttributedString, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end