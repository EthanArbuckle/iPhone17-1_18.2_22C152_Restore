@interface MapPageRenderer
- ($C79183323B9A0D5602617FF3BE5395AC)visibleMapRect;
- (BOOL)hasSnapshot;
- (MKMapView)mapView;
- (MapPageRenderer)init;
- (NSString)subTitle;
- (NSString)title;
- (UIColor)blueTextColor;
- (UIColor)calloutTextColor;
- (UIImage)snapshotImage;
- (id)snapshotBlock;
- (int64_t)numberOfPages;
- (void)dealloc;
- (void)drawOverview;
- (void)drawTopContentInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4;
- (void)releaseSnapshotCreator;
- (void)setBlueTextColor:(id)a3;
- (void)setCalloutTextColor:(id)a3;
- (void)setMapView:(id)a3;
- (void)setSubTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MapPageRenderer

- (MapPageRenderer)init
{
  v6.receiver = self;
  v6.super_class = (Class)MapPageRenderer;
  v2 = [(MapPageRenderer *)&v6 init];
  if (v2)
  {
    v3 = +[UIColor colorWithRed:0.329411765 green:0.517647059 blue:0.709803922 alpha:1.0];
    [(MapPageRenderer *)v2 setBlueTextColor:v3];

    v4 = +[UIColor colorWithRed:0.396078431 green:0.62745098 blue:0.992156863 alpha:1.0];
    [(MapPageRenderer *)v2 setCalloutTextColor:v4];
  }
  return v2;
}

- (int64_t)numberOfPages
{
  return 1;
}

- ($C79183323B9A0D5602617FF3BE5395AC)visibleMapRect
{
  [(MKMapView *)self->_mapView visibleMapRect];
  result.var1.var1 = v5;
  result.var1.var0 = v4;
  result.var0.var1 = v3;
  result.var0.var0 = v2;
  return result;
}

- (void)drawTopContentInRect:(CGRect)a3 forPageAtIndex:(int64_t)a4
{
  int v4 = a4;
  [(MapPageRenderer *)self paperRect];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  +[PDFUtilities renderDocumentForType:inRect:](PDFUtilities, "renderDocumentForType:inRect:", self->_topContentIconType, 63.0, 36.0, 27.0, 27.0);
  [(UIColor *)self->_blueTextColor set];
  v14 = +[UIFont boldSystemFontOfSize:15.0];
  [v14 ascender];
  double v16 = v15;
  [v14 capHeight];
  double v18 = v17 - v16 + 36.0 + 2.0;
  title = self->_title;
  v20 = +[UIFont boldSystemFontOfSize:15.0];
  -[NSString _maps_drawAtPoint:withFont:](title, "_maps_drawAtPoint:withFont:", v20, 99.0, v18);

  id v47 = +[UIFont systemFontOfSize:11.0];

  [v47 pointSize];
  double v22 = 63.0 - v21 + -1.0;
  if (self->_subTitle)
  {
    v23 = +[UIColor colorWithWhite:0.270000011 alpha:1.0];
    [v23 set];

    subTitle = self->_subTitle;
    v25 = +[UIFont systemFontOfSize:11.0];
    -[NSString _maps_drawAtPoint:withFont:](subTitle, "_maps_drawAtPoint:withFont:", v25, 99.0, v22);
  }
  v26 = +[UIColor colorWithWhite:0.670000017 alpha:1.0];
  [v26 set];

  v27 = +[NSBundle mainBundle];
  v28 = [v27 localizedStringForKey:@"Page %1$d of %2$d" value:@"localized string not found" table:0];
  v29 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v28, (v4 + 1), [(MapPageRenderer *)self numberOfPages]);

  v30 = +[UIFont systemFontOfSize:11.0];
  [v29 _maps_sizeWithFont:v30];
  double v32 = v31;

  v49.origin.x = v7;
  v49.origin.y = v9;
  v49.size.width = v11;
  v49.size.height = v13;
  CGFloat v33 = CGRectGetMaxX(v49) + -63.0 - v32;
  v34 = +[UIFont systemFontOfSize:11.0];
  [v29 _maps_drawAtPoint:v34 withFont:v33];

  v35 = +[UIColor colorWithWhite:0.75 alpha:1.0];
  [v35 set];

  v36 = +[UIDevice currentDevice];
  v37 = [v36 model];

  if (([v37 isEqualToString:@"iPhone"] & 1) != 0
    || [v37 isEqualToString:@"iPhone Simulator"])
  {
    v38 = +[NSBundle mainBundle];
    v39 = v38;
    CFStringRef v40 = @"Printed from my iPhone";
LABEL_9:
    v41 = [v38 localizedStringForKey:v40 value:@"localized string not found" table:0];

    goto LABEL_10;
  }
  if (([v37 isEqualToString:@"iPad"] & 1) != 0
    || [v37 isEqualToString:@"iPad Simulator"])
  {
    v38 = +[NSBundle mainBundle];
    v39 = v38;
    CFStringRef v40 = @"Printed from my iPad";
    goto LABEL_9;
  }
  if ([v37 isEqualToString:@"iPod touch"])
  {
    v38 = +[NSBundle mainBundle];
    v39 = v38;
    CFStringRef v40 = @"Printed from my iPod touch";
    goto LABEL_9;
  }
  v41 = &stru_101324E70;
LABEL_10:
  v42 = +[UIFont systemFontOfSize:8.0];
  [(__CFString *)v41 _maps_sizeWithFont:v42];
  double v44 = v43;

  v50.origin.x = v7;
  v50.origin.y = v9;
  v50.size.width = v11;
  v50.size.height = v13;
  CGFloat v45 = CGRectGetMaxX(v50) + -63.0 - v44;
  v46 = +[UIFont systemFontOfSize:8.0];
  -[__CFString _maps_drawAtPoint:withFont:](v41, "_maps_drawAtPoint:withFont:", v46, v45, v22 + 3.0);
}

- (void)drawOverview
{
  [(MapPageRenderer *)self overviewRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  CGFloat v11 = [(MapPageRenderer *)self snapshotImage];

  if (v11)
  {
    double v12 = [(MapPageRenderer *)self snapshotImage];
    [v12 drawInRect:v4, v6, v8, v10];
  }
  CGFloat v13 = +[GEOResourceManifestManager modernManager];
  v14 = [v13 activeTileGroup];
  id v15 = [v14 attributionsCount];

  if (v15)
  {
    double v16 = +[GEOResourceManifestManager modernManager];
    double v17 = [v16 activeTileGroup];
    double v18 = [v17 attributionAtIndex:0];
  }
  else
  {
    double v18 = 0;
  }
  v19 = [v18 badge];
  id v20 = [v19 length];

  if (v20)
  {
    double v21 = +[GEOResourceManager sharedManager];
    double v22 = [v18 badge];
    v23 = [v21 dataForResourceWithName:v22 fallbackBundle:0];

    id v27 = [objc_alloc((Class)UIImage) _initWithData:v23 scale:2.0];
  }
  else
  {
    id v27 = 0;
  }
  [v27 size];
  double v25 = v24;
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  CGFloat v26 = CGRectGetMinX(v29) + 4.0;
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  [v27 drawAtPoint:v26, CGRectGetMaxY(v30) - v25 + -1.0];
}

- (id)snapshotBlock
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1005B1E14;
  v5[3] = &unk_1012E6690;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  id v3 = [v5 copy];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (UIImage)snapshotImage
{
  return [(MKMapSnapshot *)self->_snapshot image];
}

- (void)releaseSnapshotCreator
{
  snapshotter = self->_snapshotter;
  self->_snapshotter = 0;
}

- (void)dealloc
{
  [(MapPageRenderer *)self releaseSnapshotCreator];
  v3.receiver = self;
  v3.super_class = (Class)MapPageRenderer;
  [(MapPageRenderer *)&v3 dealloc];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (void)setSubTitle:(id)a3
{
}

- (UIColor)blueTextColor
{
  return self->_blueTextColor;
}

- (void)setBlueTextColor:(id)a3
{
}

- (UIColor)calloutTextColor
{
  return self->_calloutTextColor;
}

- (void)setCalloutTextColor:(id)a3
{
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
}

- (BOOL)hasSnapshot
{
  return self->_hasSnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotter, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_calloutTextColor, 0);
  objc_storeStrong((id *)&self->_blueTextColor, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end