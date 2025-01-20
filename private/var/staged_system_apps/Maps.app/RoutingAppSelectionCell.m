@interface RoutingAppSelectionCell
+ (id)_labelForRoutingMode:(id)a3;
+ (id)_labelForRoutingModeKeys:(id)a3 intendedTransportType:(int64_t)a4;
+ (id)_preferredModesForTransportType:(int64_t)a3;
+ (id)sharedLockupViewGroup;
- (ASCLockupView)lockupView;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (GEOAppleMediaServicesResult)appStoreApp;
- (LSApplicationProxy)appProxy;
- (RoutingAppSelectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (RoutingAppSelectionCellDelegate)delegate;
- (id)_artworkWithUIImage:(id)a3;
- (id)_dummyArtwork;
- (id)_dummyLockup;
- (id)_lockupByAddingRoutingModes:(id)a3;
- (id)_lockupWithAppProxy:(id)a3 appIcon:(id)a4;
- (id)_lockupWithAppStoreApp:(id)a3;
- (void)_route;
- (void)_updateContent;
- (void)lockupViewDidFinishRequest:(id)a3;
- (void)prepareForReuse;
- (void)setAppProxy:(id)a3;
- (void)setAppStoreApp:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIntendedTransportType:(int64_t)a3;
- (void)setLockupView:(id)a3;
@end

@implementation RoutingAppSelectionCell

+ (id)sharedLockupViewGroup
{
  if (qword_10160FD18 != -1) {
    dispatch_once(&qword_10160FD18, &stru_1012FEE20);
  }
  v2 = (void *)qword_10160FD10;

  return v2;
}

- (RoutingAppSelectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)RoutingAppSelectionCell;
  v4 = [(MapsThemeTableViewCell *)&v17 initWithStyle:0 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(RoutingAppSelectionCell *)v4 setBackgroundView:0];
    v6 = +[UIColor clearColor];
    [(RoutingAppSelectionCell *)v5 setBackgroundColor:v6];

    id v7 = objc_alloc((Class)ASCLockupView);
    v8 = [(RoutingAppSelectionCell *)v5 contentView];
    [v8 bounds];
    id v9 = [v7 initWithFrame:];

    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v9 setDelegate:v5];
    v10 = [(id)objc_opt_class() sharedLockupViewGroup];
    [v9 setGroup:v10];

    v11 = [(RoutingAppSelectionCell *)v5 contentView];
    [v11 addSubview:v9];

    [(RoutingAppSelectionCell *)v5 setLockupView:v9];
    v12 = [(RoutingAppSelectionCell *)v5 contentView];
    LODWORD(v13) = 1148846080;
    v14 = [v9 _maps_constraintsEqualToEdgesOfView:v12 insets:10.0, 16.0, 10.0, 16.0 priority:v13];
    v15 = [v14 allConstraints];
    +[NSLayoutConstraint activateConstraints:v15];
  }
  return v5;
}

- (void)prepareForReuse
{
  appStoreApp = self->_appStoreApp;
  self->_appStoreApp = 0;

  appProxy = self->_appProxy;
  self->_appProxy = 0;

  request = self->_request;
  self->_request = 0;

  lockup = self->_lockup;
  self->_lockup = 0;

  [(ASCLockupView *)self->_lockupView setRequest:0];
  id v7 = [(RoutingAppSelectionCell *)self _dummyLockup];
  [(ASCLockupView *)self->_lockupView setLockup:v7];

  [(ASCLockupView *)self->_lockupView setAutomaticallyPresentsProductDetails:0];
  v8.receiver = self;
  v8.super_class = (Class)RoutingAppSelectionCell;
  [(RoutingAppSelectionCell *)&v8 prepareForReuse];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width = a3.width;
  v6 = [(RoutingAppSelectionCell *)self lockupView];
  [v6 sizeThatFits:width, 1.79769313e308];
  double v8 = v7;

  double v9 = v8 + 20.0;
  double v10 = width;
  result.height = v9;
  result.double width = v10;
  return result;
}

- (void)setAppStoreApp:(id)a3
{
  id v5 = a3;
  appStoreApp = self->_appStoreApp;
  unint64_t v10 = (unint64_t)v5;
  id v7 = appStoreApp;
  double v8 = (void *)v10;
  if (v10 | (unint64_t)v7)
  {
    unsigned __int8 v9 = [(id)v10 isEqual:v7];

    double v8 = (void *)v10;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_appStoreApp, a3);
      [(RoutingAppSelectionCell *)self _updateContent];
      double v8 = (void *)v10;
    }
  }
}

- (void)setAppProxy:(id)a3
{
  id v5 = a3;
  appProxy = self->_appProxy;
  unint64_t v10 = (unint64_t)v5;
  id v7 = appProxy;
  double v8 = (void *)v10;
  if (v10 | (unint64_t)v7)
  {
    unsigned __int8 v9 = [(id)v10 isEqual:v7];

    double v8 = (void *)v10;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_appProxy, a3);
      [(RoutingAppSelectionCell *)self _updateContent];
      double v8 = (void *)v10;
    }
  }
}

- (void)setIntendedTransportType:(int64_t)a3
{
  if (self->_intendedTransportType != a3)
  {
    self->_intendedTransportType = a3;
    [(RoutingAppSelectionCell *)self _updateContent];
  }
}

- (void)_route
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained routingAppSelectionCellRoutePressed:self];
}

- (void)_updateContent
{
  if (self->_lockup)
  {
    lockupView = self->_lockupView;
    -[ASCLockupView setLockup:](lockupView, "setLockup:");
  }
  else
  {
    v4 = [(RoutingAppSelectionCell *)self appProxy];

    if (v4)
    {
      id v5 = [(RoutingAppSelectionCell *)self appProxy];
      v6 = [(RoutingAppSelectionCell *)self _lockupWithAppProxy:v5 appIcon:0];
      lockup = self->_lockup;
      self->_lockup = v6;

      [(ASCLockupView *)self->_lockupView setLockup:self->_lockup];
      [(ASCLockupView *)self->_lockupView setAutomaticallyPresentsProductDetails:0];
      double v8 = [(RoutingAppSelectionCell *)self appProxy];
      unsigned __int8 v9 = [v8 bundleIdentifier];

      unint64_t v10 = +[MapsUIImageCache sharedCache];
      v11 = [(RoutingAppSelectionCell *)self appProxy];
      v12 = [v11 bundleIdentifier];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1008A09C0;
      v23[3] = &unk_1012F4C10;
      id v24 = v9;
      v25 = self;
      id v13 = v9;
      [v10 getImageForAppIcon:v12 format:2 completion:v23];
    }
    else
    {
      v14 = [(RoutingAppSelectionCell *)self appStoreApp];

      if (v14)
      {
        v15 = [(RoutingAppSelectionCell *)self appStoreApp];
        v16 = [(RoutingAppSelectionCell *)self _lockupWithAppStoreApp:v15];
        objc_super v17 = self->_lockup;
        self->_lockup = v16;

        if (!self->_request)
        {
          id v18 = objc_alloc((Class)ASCLockupRequest);
          v19 = [(ASCLockup *)self->_lockup id];
          v20 = (ASCLockupRequest *)[v18 initWithID:v19 kind:ASCLockupKindApp context:ASCLockupContextStandard];
          request = self->_request;
          self->_request = v20;

          [(ASCLockupView *)self->_lockupView setRequest:self->_request];
        }
        [(ASCLockupView *)self->_lockupView setLockup:self->_lockup];
        v22 = self->_lockupView;
        [(ASCLockupView *)v22 setAutomaticallyPresentsProductDetails:1];
      }
    }
  }
}

- (id)_lockupWithAppProxy:(id)a3 appIcon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 bundleIdentifier];
  id v23 = [objc_alloc((Class)ASCAdamID) initWithStringValue:v8];
  unsigned __int8 v9 = [v6 directionsModes];
  unint64_t v10 = [(id)objc_opt_class() _labelForRoutingModeKeys:v9 intendedTransportType:self->_intendedTransportType];
  v11 = [v10 string];

  objc_initWeak(&location, self);
  v12 = +[NSBundle mainBundle];
  id v13 = [v12 localizedStringForKey:@"Open [Routing App, Cell]", @"localized string not found", 0 value table];
  v14 = +[ASCOfferMetadata textMetadataWithTitle:v13 subtitle:0];
  v22 = (void *)v8;

  id v15 = objc_alloc((Class)ASCLocalOffer);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1008A0D50;
  v24[3] = &unk_1012E6708;
  objc_copyWeak(&v25, &location);
  id v16 = [v15 initWithMetadata:v14 action:v24];
  id v17 = objc_alloc((Class)ASCLockup);
  if (v7) {
    [(RoutingAppSelectionCell *)self _artworkWithUIImage:v7];
  }
  else {
  id v18 = [(RoutingAppSelectionCell *)self _dummyArtwork];
  }
  v19 = [v6 localizedName];
  id v20 = [v17 initWithID:v23 kind:ASCLockupKindApp metrics:0 icon:v18 heading:0 title:v19 subtitle:v11 ageRating:0 offer:v16];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v20;
}

- (id)_lockupWithAppStoreApp:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 integerValue]);

  id v7 = [objc_alloc((Class)ASCAdamID) initWithNumberValue:v6];
  uint64_t v8 = [v4 transitModes];
  unsigned __int8 v9 = [(id)objc_opt_class() _labelForRoutingModeKeys:v8 intendedTransportType:self->_intendedTransportType];
  id v10 = objc_alloc((Class)ASCLockup);
  uint64_t v11 = ASCLockupKindApp;
  v12 = [(RoutingAppSelectionCell *)self _dummyArtwork];
  id v13 = [v4 displayName];

  v14 = [v9 string];
  id v15 = [v10 initWithID:v7 kind:v11 metrics:0 icon:v12 heading:0 title:v13 subtitle:v14 ageRating:0 offer:0];

  return v15;
}

- (id)_lockupByAddingRoutingModes:(id)a3
{
  id v4 = a3;
  id v5 = [(RoutingAppSelectionCell *)self appStoreApp];
  v19 = [v5 transitModes];

  id v18 = [(id)objc_opt_class() _labelForRoutingModeKeys:v19 intendedTransportType:self->_intendedTransportType];
  id v17 = objc_alloc((Class)ASCLockup);
  id v6 = [v4 id];
  id v7 = [v4 kind];
  uint64_t v8 = [v4 metrics];
  unsigned __int8 v9 = [v4 icon];
  id v10 = [v4 heading];
  uint64_t v11 = [v4 title];
  v12 = [v18 string];
  id v13 = [v4 ageRating];
  v14 = [v4 offer];

  id v15 = [v17 initWithID:v6 kind:v7 metrics:v8 icon:v9 heading:v10 title:v11 subtitle:v12 ageRating:v13 offer:v14];

  return v15;
}

- (id)_dummyLockup
{
  id v3 = objc_alloc((Class)ASCLockup);
  id v4 = [objc_alloc((Class)ASCAdamID) initWithInt64:0];
  uint64_t v5 = ASCLockupKindApp;
  id v6 = [(RoutingAppSelectionCell *)self _dummyArtwork];
  id v7 = [v3 initWithID:v4 kind:v5 metrics:0 icon:v6 heading:0 title:0 subtitle:0 ageRating:0 offer:0];

  return v7;
}

- (id)_dummyArtwork
{
  id v2 = objc_alloc((Class)ASCArtwork);
  id v3 = [v2 initWithURLTemplate:&stru_101324E70 width:ASCArtworkDecorationRoundedRect height:ASCArtworkCropBoundingBox decoration:ASCArtworkFormatPNG preferredCrop:0.0 preferredFormat:0.0];

  return v3;
}

- (id)_artworkWithUIImage:(id)a3
{
  id v3 = UIImagePNGRepresentation((UIImage *)a3);
  id v4 = [v3 base64EncodedStringWithOptions:0];

  uint64_t v5 = +[NSString stringWithFormat:@"data:image/png;base64,%@", v4];
  id v6 = objc_alloc((Class)ASCArtwork);
  id v7 = [v6 initWithURLTemplate:v5 width:ASCArtworkDecorationRoundedRect height:ASCArtworkCropBoundingBox decoration:ASCArtworkFormatPNG preferredCrop:0.0 preferredFormat:0.0];

  return v7;
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4 = a3;
  request = self->_request;
  id v11 = v4;
  id v6 = [v4 request];

  if (request == v6)
  {
    id v7 = [v11 lockup];
    uint64_t v8 = [(RoutingAppSelectionCell *)self _lockupByAddingRoutingModes:v7];
    [v11 setLockup:v8];

    unsigned __int8 v9 = [v11 lockup];
    lockup = self->_lockup;
    self->_lockup = v9;
  }
}

+ (id)_labelForRoutingMode:(id)a3
{
  uint64_t v3 = qword_10160FD20;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10160FD20, &stru_1012FEE40);
  }
  uint64_t v5 = [(id)qword_10160FD28 objectForKeyedSubscript:v4];

  return v5;
}

+ (id)_labelForRoutingModeKeys:(id)a3 intendedTransportType:(int64_t)a4
{
  id v6 = a3;
  id v43 = a1;
  id v7 = [a1 _preferredModesForTransportType:a4];
  if ([v6 count] && objc_msgSend(v7, "count"))
  {
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_1008A2334;
    v48[3] = &unk_1012FEE68;
    id v49 = v7;
    id v50 = v6;
    id v6 = [v6 sortedArrayUsingComparator:v48];
  }
  id v8 = [v6 count];
  if (v8 == (id)1)
  {
    id v13 = objc_alloc((Class)NSAttributedString);
    id v11 = [v6 objectAtIndexedSubscript:0];
    v14 = [v43 _labelForRoutingMode:v11];
    id v12 = [v13 initWithString:v14];
  }
  else
  {
    unint64_t v9 = (unint64_t)v8;
    if (v8)
    {
      if ((unint64_t)v8 >= 3) {
        uint64_t v15 = 3;
      }
      else {
        uint64_t v15 = (uint64_t)v8;
      }
      id v16 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v15];
      for (uint64_t i = 0; i != v15; ++i)
      {
        id v18 = [v6 objectAtIndexedSubscript:i];
        v19 = [a1 _labelForRoutingMode:v18];
        if (v19) {
          [v16 addObject:v19];
        }
        else {
          NSLog(@"Warning: %@ is an unrecognized routing mode key.", v18);
        }
      }
      id v20 = +[NSBundle mainBundle];
      v21 = [v20 localizedStringForKey:@"RoutingModeCommaJoin" value:@"localized string not found" table:0];
      id v42 = v16;
      v22 = [v16 componentsJoinedByString:v21];

      if (v9 > 3)
      {
        id v23 = +[NSBundle mainBundle];
        id v24 = [v23 localizedStringForKey:@"RoutingContinuationEllipsis" value:@"localized string not found" table:0];
        uint64_t v25 = [v22 stringByAppendingString:v24];

        v22 = (void *)v25;
      }
      if ([v7 count])
      {
        id v41 = v6;
        v26 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
        v27 = [v26 fontDescriptor];

        v40 = v27;
        v28 = [v27 fontDescriptorWithSymbolicTraits:2];
        v29 = +[UIFont fontWithDescriptor:v28 size:0.0];

        id v30 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v22];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v31 = v7;
        id v32 = [v31 countByEnumeratingWithState:&v44 objects:v51 count:16];
        if (v32)
        {
          id v33 = v32;
          uint64_t v34 = *(void *)v45;
          do
          {
            for (j = 0; j != v33; j = (char *)j + 1)
            {
              if (*(void *)v45 != v34) {
                objc_enumerationMutation(v31);
              }
              v36 = [a1 _labelForRoutingMode:*(void *)(*((void *)&v44 + 1) + 8 * (void)j)];
              id v37 = [v22 rangeOfString:v36];
              if (v37 != (id)0x7FFFFFFFFFFFFFFFLL) {
                [v30 addAttribute:NSFontAttributeName value:v29 range:v37, v38];
              }
            }
            id v33 = [v31 countByEnumeratingWithState:&v44 objects:v51 count:16];
          }
          while (v33);
        }

        id v12 = [v30 copy];
        id v6 = v41;
      }
      else
      {
        id v12 = [objc_alloc((Class)NSAttributedString) initWithString:v22];
      }

      id v11 = v42;
    }
    else
    {
      id v10 = objc_alloc((Class)NSAttributedString);
      id v11 = [a1 _labelForRoutingMode:@"other"];
      id v12 = [v10 initWithString:v11];
    }
  }

  return v12;
}

+ (id)_preferredModesForTransportType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4) {
    return &__NSArray0__struct;
  }
  else {
    return off_1012FEE88[a3 - 1];
  }
}

- (RoutingAppSelectionCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RoutingAppSelectionCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (LSApplicationProxy)appProxy
{
  return self->_appProxy;
}

- (GEOAppleMediaServicesResult)appStoreApp
{
  return self->_appStoreApp;
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_appStoreApp, 0);
  objc_storeStrong((id *)&self->_appProxy, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_lockup, 0);
}

@end