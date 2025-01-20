@interface ChromeNavigationDisplayConfiguration
+ (BOOL)_cameraStyleRequiresCameraMotion:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (MapsSuggestionsRouteGeniusEntry)routeGeniusEntry;
- (NSNumber)cameraPaused;
- (NSNumber)showsRoadLabel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)cameraStyle;
- (void)mergeWithConfiguration:(id)a3;
- (void)setCameraPaused:(id)a3;
- (void)setCameraStyle:(int64_t)a3;
- (void)setRouteGeniusEntry:(id)a3;
- (void)setShowsRoadLabel:(id)a3;
@end

@implementation ChromeNavigationDisplayConfiguration

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    id v6 = [v5 cameraStyle];
    if (v6 == (id)[(ChromeNavigationDisplayConfiguration *)self cameraStyle])
    {
      v7 = [v5 cameraPaused];
      v8 = [(ChromeNavigationDisplayConfiguration *)self cameraPaused];
      unint64_t v9 = v7;
      unint64_t v10 = v8;
      if (v9 | v10
        && (unsigned int v11 = [(id)v9 isEqual:v10], (id)v10, (id)v9, !v11))
      {
        unsigned __int8 v19 = 0;
      }
      else
      {
        v12 = [v5 routeGeniusEntry];
        v13 = [(ChromeNavigationDisplayConfiguration *)self routeGeniusEntry];
        unint64_t v14 = v12;
        unint64_t v15 = v13;
        if (v14 | v15
          && (unsigned int v16 = [(id)v14 isEqual:v15],
              (id)v15,
              (id)v14,
              !v16))
        {
          unsigned __int8 v19 = 0;
        }
        else
        {
          uint64_t v17 = [v5 showsRoadLabel];
          uint64_t v18 = [(ChromeNavigationDisplayConfiguration *)self showsRoadLabel];
          if (v17 | v18) {
            unsigned __int8 v19 = [(id)v17 isEqual:v18];
          }
          else {
            unsigned __int8 v19 = 1;
          }
        }
      }
    }
    else
    {
      unsigned __int8 v19 = 0;
    }
  }
  else
  {
    unsigned __int8 v19 = 0;
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_new();
  [v4 setCameraStyle:[self cameraStyle]];
  id v5 = [(ChromeNavigationDisplayConfiguration *)self cameraPaused];
  [v4 setCameraPaused:v5];

  id v6 = [(ChromeNavigationDisplayConfiguration *)self routeGeniusEntry];
  [v4 setRouteGeniusEntry:v6];

  v7 = [(ChromeNavigationDisplayConfiguration *)self showsRoadLabel];
  [v4 setShowsRoadLabel:v7];

  return v4;
}

- (void)mergeWithConfiguration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    if ([v4 cameraStyle]) {
      -[ChromeNavigationDisplayConfiguration setCameraStyle:](self, "setCameraStyle:", [v11 cameraStyle]);
    }
    id v5 = [v11 cameraPaused];
    if (v5)
    {
      [(ChromeNavigationDisplayConfiguration *)self setCameraPaused:v5];
    }
    else
    {
      id v6 = [(ChromeNavigationDisplayConfiguration *)self cameraPaused];
      [(ChromeNavigationDisplayConfiguration *)self setCameraPaused:v6];
    }
    v7 = [v11 routeGeniusEntry];
    if (v7)
    {
      [(ChromeNavigationDisplayConfiguration *)self setRouteGeniusEntry:v7];
    }
    else
    {
      v8 = [(ChromeNavigationDisplayConfiguration *)self routeGeniusEntry];
      [(ChromeNavigationDisplayConfiguration *)self setRouteGeniusEntry:v8];
    }
    unint64_t v9 = [v11 showsRoadLabel];
    if (v9)
    {
      [(ChromeNavigationDisplayConfiguration *)self setShowsRoadLabel:v9];
    }
    else
    {
      unint64_t v10 = [(ChromeNavigationDisplayConfiguration *)self showsRoadLabel];
      [(ChromeNavigationDisplayConfiguration *)self setShowsRoadLabel:v10];
    }
    id v4 = v11;
  }
}

- (id)description
{
  v2 = self;
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    if (objc_opt_respondsToSelector())
    {
      id v5 = [(ChromeNavigationDisplayConfiguration *)v2 performSelector:"accessibilityIdentifier"];
      id v6 = v5;
      if (v5 && ![v5 isEqualToString:v4])
      {
        v7 = +[NSString stringWithFormat:@"%@<%p, %@>", v4, v2, v6];

        goto LABEL_7;
      }
    }
    v7 = +[NSString stringWithFormat:@"%@<%p>", v4, v2];
LABEL_7:

    goto LABEL_9;
  }
  v7 = @"<nil>";
LABEL_9:

  unint64_t v8 = [(ChromeNavigationDisplayConfiguration *)v2 cameraStyle];
  if (v8 > 4) {
    CFStringRef v9 = @".Unknown";
  }
  else {
    CFStringRef v9 = *(&off_101320B00 + v8);
  }
  CFStringRef v26 = v9;
  unint64_t v10 = [(ChromeNavigationDisplayConfiguration *)v2 cameraPaused];
  id v11 = v10;
  if (v10)
  {
    if ([v10 BOOLValue]) {
      v12 = @"YES";
    }
    else {
      v12 = @"NO";
    }
    v13 = v12;
  }
  else
  {
    v13 = @"<nil>";
  }
  id v14 = [(ChromeNavigationDisplayConfiguration *)v2 routeGeniusEntry];
  if (v14)
  {
    unint64_t v15 = (objc_class *)objc_opt_class();
    unsigned int v16 = NSStringFromClass(v15);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v17 = [v14 performSelector:"accessibilityIdentifier"];
      uint64_t v18 = v17;
      if (v17 && ![v17 isEqualToString:v16])
      {
        unsigned __int8 v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

        goto LABEL_24;
      }
    }
    unsigned __int8 v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_24:

    goto LABEL_26;
  }
  unsigned __int8 v19 = @"<nil>";
LABEL_26:

  v20 = [(ChromeNavigationDisplayConfiguration *)v2 showsRoadLabel];
  v21 = v20;
  if (v20)
  {
    if ([v20 BOOLValue]) {
      v22 = @"YES";
    }
    else {
      v22 = @"NO";
    }
    v23 = v22;
  }
  else
  {
    v23 = @"<nil>";
  }
  v24 = +[NSString stringWithFormat:@"%@ (cameraStyle:%@, cameraPaused:%@, routeGeniusEntry:%@, showsRoadLabel:%@)", v7, v26, v13, v19, v23];

  return v24;
}

+ (BOOL)_cameraStyleRequiresCameraMotion:(int64_t)a3
{
  return a3 != 0;
}

- (int64_t)cameraStyle
{
  return self->_cameraStyle;
}

- (void)setCameraStyle:(int64_t)a3
{
  self->_cameraStyle = a3;
}

- (NSNumber)cameraPaused
{
  return self->_cameraPaused;
}

- (void)setCameraPaused:(id)a3
{
}

- (MapsSuggestionsRouteGeniusEntry)routeGeniusEntry
{
  return self->_routeGeniusEntry;
}

- (void)setRouteGeniusEntry:(id)a3
{
}

- (NSNumber)showsRoadLabel
{
  return self->_showsRoadLabel;
}

- (void)setShowsRoadLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showsRoadLabel, 0);
  objc_storeStrong((id *)&self->_routeGeniusEntry, 0);

  objc_storeStrong((id *)&self->_cameraPaused, 0);
}

@end