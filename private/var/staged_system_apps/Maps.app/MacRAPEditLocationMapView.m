@interface MacRAPEditLocationMapView
- (MacRAPEditLocationMapView)initWithMapRect:(id)a3 viewMode:(int64_t)a4 markerViewAttributes:(id)a5;
- (UIButton)mapModeButton;
- (id)mapActionForViewMode:(int64_t)a3;
- (void)setMapModeButton:(id)a3;
- (void)setupDescriptionViewAndAdditionalConstraints;
- (void)setupMenuActions;
@end

@implementation MacRAPEditLocationMapView

- (MacRAPEditLocationMapView)initWithMapRect:(id)a3 viewMode:(int64_t)a4 markerViewAttributes:(id)a5
{
  v49.receiver = self;
  v49.super_class = (Class)MacRAPEditLocationMapView;
  v5 = -[RAPEditLocationMapView initWithMapRect:viewMode:markerViewAttributes:](&v49, "initWithMapRect:viewMode:markerViewAttributes:", a4, a5, a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
  v6 = v5;
  if (v5)
  {
    v7 = [(RAPEditLocationMapView *)v5 floatingControlsView];
    [v7 setHidden:1];

    v8 = [(RAPEditLocationMapView *)v6 descriptionView];
    v9 = [v8 layer];
    [v9 setCornerRadius:20.0];

    v10 = [(RAPEditLocationMapView *)v6 descriptionView];
    v11 = [v10 layer];
    [v11 setMasksToBounds:1];

    v12 = +[MapsThemeButton buttonWithType:0];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = +[UIFont systemFontOfSize:20.0];
    v14 = +[UIImageSymbolConfiguration configurationWithFont:v13 scale:2];
    v15 = +[UIImage systemImageNamed:@"map.fill" withConfiguration:v14];
    [v12 setImage:v15 forState:0];

    v16 = +[UIColor systemGrayColor];
    [v12 setTintColor:v16];

    [v12 setShowsMenuAsPrimaryAction:1];
    [(MacRAPEditLocationMapView *)v6 setMapModeButton:v12];
    id v17 = [[CardView alloc] initAllowingBlurredForButton:1];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v17 setLayoutStyle:6];
    v18 = [v17 contentView];
    [v18 addSubview:v12];

    v19 = [(RAPEditLocationMapView *)v6 mapView];
    [v19 addSubview:v17];

    v48 = [v12 topAnchor];
    v47 = [v17 topAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v50[0] = v46;
    v44 = [v12 bottomAnchor];
    v43 = [v17 bottomAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v50[1] = v42;
    v45 = v12;
    v41 = [v12 leadingAnchor];
    v40 = [v17 leadingAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v50[2] = v39;
    v38 = [v12 trailingAnchor];
    v37 = [v17 trailingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v50[3] = v36;
    v34 = [v17 bottomAnchor];
    v35 = [(RAPEditLocationMapView *)v6 mapView];
    v33 = [v35 bottomAnchor];
    v32 = [v34 constraintEqualToAnchor:v33 constant:-15.0];
    v50[4] = v32;
    v31 = [v17 widthAnchor];
    v30 = [v31 constraintEqualToConstant:30.0];
    v50[5] = v30;
    v20 = [v17 widthAnchor];
    v21 = [v17 heightAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v50[6] = v22;
    v23 = [v17 trailingAnchor];
    v24 = [(RAPEditLocationMapView *)v6 mapView];
    v25 = [v24 trailingAnchor];
    [v23 constraintEqualToAnchor:v25 constant:-15.0];
    v27 = v26 = v6;
    v50[7] = v27;
    v28 = +[NSArray arrayWithObjects:v50 count:8];
    +[NSLayoutConstraint activateConstraints:v28];

    v6 = v26;
    [(MacRAPEditLocationMapView *)v26 setupMenuActions];
  }
  return v6;
}

- (id)mapActionForViewMode:(int64_t)a3
{
  v3 = 0;
  switch(a3)
  {
    case 0:
      v6 = +[NSBundle mainBundle];
      v7 = v6;
      CFStringRef v8 = @"Map [Standard Mode Title]";
      goto LABEL_6;
    case 2:
      v6 = +[NSBundle mainBundle];
      v7 = v6;
      CFStringRef v8 = @"Satellite";
      goto LABEL_6;
    case 3:
      v6 = +[NSBundle mainBundle];
      v7 = v6;
      CFStringRef v8 = @"View Mode Transit";
      goto LABEL_6;
    case 7:
      v6 = +[NSBundle mainBundle];
      v7 = v6;
      CFStringRef v8 = @"Driving";
LABEL_6:
      v9 = [v6 localizedStringForKey:v8 value:@"localized string not found" table:0];

      if (v9)
      {
        objc_initWeak(&location, self);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_1007FF188;
        v11[3] = &unk_1012F16D0;
        objc_copyWeak(v12, &location);
        v12[1] = (id)a3;
        v3 = +[UIAction actionWithTitle:v9 image:0 identifier:0 handler:v11];
        [v3 setState:[self viewMode] == a3];
        objc_destroyWeak(v12);
        objc_destroyWeak(&location);
      }
      else
      {
        v3 = 0;
      }
      break;
    default:
      break;
  }

  return v3;
}

- (void)setupMenuActions
{
  v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [&off_1013ADFF8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(&off_1013ADFF8);
        }
        CFStringRef v8 = -[MacRAPEditLocationMapView mapActionForViewMode:](self, "mapActionForViewMode:", [*(id *)(*((void *)&v12 + 1) + 8 * (void)v7) unsignedIntValue]);
        [v3 addObject:v8];

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [&off_1013ADFF8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  id v9 = [v3 copy];
  v10 = +[UIMenu menuWithTitle:&stru_101324E70 children:v9];
  v11 = [(MacRAPEditLocationMapView *)self mapModeButton];
  [v11 setMenu:v10];
}

- (void)setupDescriptionViewAndAdditionalConstraints
{
  v18 = [(RAPEditLocationMapView *)self descriptionView];
  v16 = [v18 leadingAnchor];
  id v17 = [(RAPEditLocationMapView *)self mapView];
  long long v15 = [v17 leadingAnchor];
  long long v14 = [v16 constraintEqualToAnchor:v15 constant:30.0];
  v19[0] = v14;
  long long v13 = [(RAPEditLocationMapView *)self descriptionView];
  v3 = [v13 trailingAnchor];
  id v4 = [(RAPEditLocationMapView *)self mapView];
  id v5 = [v4 trailingAnchor];
  uint64_t v6 = [v3 constraintLessThanOrEqualToAnchor:v5 constant:-30.0];
  v19[1] = v6;
  v7 = [(RAPEditLocationMapView *)self descriptionView];
  CFStringRef v8 = [v7 bottomAnchor];
  id v9 = [(RAPEditLocationMapView *)self mapView];
  v10 = [v9 bottomAnchor];
  v11 = [v8 constraintEqualToAnchor:v10 constant:-15.0];
  v19[2] = v11;
  long long v12 = +[NSArray arrayWithObjects:v19 count:3];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (UIButton)mapModeButton
{
  return self->_mapModeButton;
}

- (void)setMapModeButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end