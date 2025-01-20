@interface SearchResultCell
+ (id)cellWithSearchResult:(id)a3 order:(int64_t)a4 mapType:(unint64_t)a5;
- (BOOL)hasSnapshot;
- (CGPoint)transformedPoint:(CGAffineTransform *)a3;
- (CGRect)frame;
- (SearchResult)searchResult;
- (SearchResultCell)initWithSearchResult:(id)a3 order:(int64_t)a4 mapType:(unint64_t)a5;
- (UIImage)snapshotImage;
- (double)_textLayoutHeight;
- (double)y;
- (id)snapshotBlock;
- (int64_t)order;
- (int64_t)page;
- (unint64_t)mapType;
- (void)_drawPinInRect:(CGRect)a3 zoomLevel:(double)a4;
- (void)dealloc;
- (void)drawInRect:(CGRect)a3;
- (void)releaseSnapshotCreator;
- (void)setFrame:(CGRect)a3;
- (void)setMapType:(unint64_t)a3;
- (void)setOrder:(int64_t)a3;
- (void)setPage:(int64_t)a3;
- (void)setSearchResult:(id)a3;
- (void)setY:(double)a3;
@end

@implementation SearchResultCell

+ (id)cellWithSearchResult:(id)a3 order:(int64_t)a4 mapType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [objc_alloc((Class)a1) initWithSearchResult:v8 order:a4 mapType:a5];

  return v9;
}

- (SearchResultCell)initWithSearchResult:(id)a3 order:(int64_t)a4 mapType:(unint64_t)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SearchResultCell;
  id v9 = [(SearchResultCell *)&v16 init];
  v10 = v9;
  if (v9)
  {
    [(SearchResultCell *)v9 setSearchResult:v8];
    v10->_order = a4;
    v11 = (UIColor *)[objc_alloc((Class)UIColor) initWithRed:0.254901961 green:0.435294118 blue:0.658823529 alpha:1.0];
    blueTextColor = v10->_blueTextColor;
    v10->_blueTextColor = v11;

    v13 = (UIColor *)[objc_alloc((Class)UIColor) initWithRed:0.396078431 green:0.62745098 blue:0.992156863 alpha:1.0];
    calloutTextColor = v10->_calloutTextColor;
    v10->_calloutTextColor = v13;

    v10->_mapType = a5;
  }

  return v10;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void)setY:(double)a3
{
  self->_frame.origin.y = a3;
}

- (double)y
{
  return self->_frame.origin.y;
}

- (void)_drawPinInRect:(CGRect)a3 zoomLevel:(double)a4
{
  CGFloat width = a3.size.width;
  CGFloat height = a3.size.height;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  searchResult = self->_searchResult;
  MKZoomScaleForZoomLevelF();
  -[SearchResult _offsetCoordinate:](searchResult, "_offsetCoordinate:");
  MKTilePointForCoordinate();
  double v8 = v7;
  double v10 = v9;
  v11 = [(SearchResultCell *)self snapshotImage];
  [v11 size];
  double v13 = v12;
  double v15 = v14;

  double v33 = v10 - v15 * 0.25;
  [(SearchResult *)self->_searchResult coordinate];
  MKMapPoint v16 = MKMapPointForCoordinate(v39);
  MKZoomScaleForZoomLevelF();
  CGFloat v18 = v17;
  long long v31 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v32 = *(_OWORD *)&CGAffineTransformIdentity.a;
  tCGFloat x = CGAffineTransformIdentity.tx;
  CGFloat ty = CGAffineTransformIdentity.ty;
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  CGFloat v21 = CGRectGetMinX(v40) - (v8 - v13 * 0.25);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v41);
  *(_OWORD *)&v37.a = v32;
  *(_OWORD *)&v37.c = v31;
  v37.tCGFloat x = tx;
  v37.CGFloat ty = ty;
  CGAffineTransformTranslate(&v38, &v37, v21, MinY - v33);
  CGAffineTransform v37 = v38;
  CGAffineTransformScale(&v38, &v37, v18, v18);
  CGFloat v23 = v38.tx + v16.y * v38.c + v38.a * v16.x;
  CGFloat v24 = v38.ty + v16.y * v38.d + v38.b * v16.x;
  +[PDFUtilities renderDocumentForType:inRect:](PDFUtilities, "renderDocumentForType:inRect:", 6, v23 + -21.2500006, v24 + -55.0, 42.5000012, 50.0);
  [(UIColor *)self->_calloutTextColor set];
  v25 = +[NSNumber numberWithInteger:self->_order];
  v26 = +[NSNumberFormatter localizedStringFromNumber:v25 numberStyle:0];

  v27 = +[UIFont boldSystemFontOfSize:12.0];
  [v26 _maps_sizeWithFont:v27];
  double v29 = v28;

  v30 = +[UIFont boldSystemFontOfSize:12.0];
  [v26 _maps_drawAtPoint:v30 withFont:v23 + v29 * -0.5, v24 + -44.0];
}

- (double)_textLayoutHeight
{
  CGFloat v3 = CGRectGetMinX(self->_frame) + 135.0;
  double v4 = CGRectGetMaxX(self->_frame) - v3;
  double Height = CGRectGetHeight(self->_frame);
  v6 = [(SearchResult *)self->_searchResult mapItem];
  double v7 = [v6 name];
  double v8 = +[UIFont systemFontOfSize:13.5];
  [v7 _maps_sizeWithFont:v8 constrainedToSize:v4 Height];
  double v10 = v9;

  double v11 = v10 + 0.0;
  double v12 = [v6 _addressFormattedAsMultilineAddress];
  double v13 = +[UIFont systemFontOfSize:13.5];
  [v12 _maps_sizeWithFont:v13 constrainedToSize:v4 Height];
  double v15 = v14;

  double v16 = v11 + v15;
  double v17 = [v6 phoneNumber];
  if ([v17 length])
  {
    CGFloat v18 = +[UIFont systemFontOfSize:13.5];
    [v17 _maps_sizeWithFont:v18 constrainedToSize:v4 Height];
    double v20 = v19;

    double v16 = v16 + v20;
  }

  return v16;
}

- (void)drawInRect:(CGRect)a3
{
  double v4 = [(SearchResultCell *)self snapshotImage];

  if (v4)
  {
    CGFloat v5 = CGRectGetMinX(self->_frame) + 35.0;
    v6 = [(SearchResultCell *)self snapshotImage];
    [v6 size];
    double v8 = v7;
    double v10 = v9;

    double MinY = CGRectGetMinY(self->_frame);
    double v12 = v8 * 0.5;
    double v13 = v10 * 0.5;
    double v14 = [(SearchResultCell *)self snapshotImage];
    [v14 drawInRect:v5 MinY:v12 v13];

    -[SearchResultCell _drawPinInRect:zoomLevel:](self, "_drawPinInRect:zoomLevel:", v5, MinY, v12, v13, 16.0);
    double v15 = +[UIColor lightGrayColor];
    [v15 set];

    double v16 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v5, MinY, v12, v13);
    [v16 stroke];
  }
  double v17 = CGRectGetMinX(self->_frame) + 135.0;
  double v18 = CGRectGetMaxX(self->_frame) - v17;
  double Height = CGRectGetHeight(self->_frame);
  id v48 = +[UIFont systemFontOfSize:13.5];
  CGFloat v20 = CGRectGetHeight(self->_frame) + 5.0;
  [(SearchResultCell *)self _textLayoutHeight];
  if (v21 > v20)
  {
    uint64_t v22 = +[UIFont systemFontOfSize:11.0];

    id v48 = (id)v22;
  }
  [(UIColor *)self->_blueTextColor set];
  double v23 = CGRectGetMinY(self->_frame);
  [v48 ascender];
  double v25 = v24;
  [v48 capHeight];
  double v27 = v23 - (v25 - v26);
  double v28 = [(SearchResult *)self->_searchResult mapItem];
  double v29 = [v28 name];
  [v29 _maps_sizeWithFont:v48 constrainedToSize:v18 Height];
  double v31 = v30;
  double v33 = v32;

  v34 = [v28 name];
  [v34 _maps_drawInRect:v48 withFont:v17, v27, v31, v33];

  v35 = +[UIColor colorWithWhite:0.289999992 alpha:1.0];
  [v35 set];

  double v36 = v27 + v33;
  CGAffineTransform v37 = [v28 _addressFormattedAsMultilineAddress];
  [v37 _maps_sizeWithFont:v48 constrainedToSize:v18 Height];
  double v39 = v38;
  double v41 = v40;

  v42 = [v28 _addressFormattedAsMultilineAddress];
  [v42 _maps_drawInRect:v48 withFont:v17, v36, v39, v41];

  v43 = [v28 phoneNumber];
  if ([v43 length])
  {
    v44 = +[CNPhoneNumber phoneNumberWithStringValue:v43];
    v45 = [v44 stringValue];

    if ([v45 length])
    {
      [v45 _maps_sizeWithFont:v48 constrainedToSize:v18 Height];
      [v45 _maps_drawInRect:v48 withFont:v17, v36 + v41, v46, v47];
    }
  }
  else
  {
    v45 = v43;
  }
}

- (id)snapshotBlock
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10053D5AC;
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
  [(SearchResultCell *)self releaseSnapshotCreator];
  v3.receiver = self;
  v3.super_class = (Class)SearchResultCell;
  [(SearchResultCell *)&v3 dealloc];
}

- (CGPoint)transformedPoint:(CGAffineTransform *)a3
{
  double v4 = [(SearchResultCell *)self searchResult];
  [v4 coordinate];
  MKMapPoint v5 = MKMapPointForCoordinate(v8);

  float64x2_t v6 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v5.y), *(float64x2_t *)&a3->a, v5.x));
  double v7 = v6.f64[1];
  result.CGFloat x = v6.f64[0];
  result.CGFloat y = v7;
  return result;
}

- (SearchResult)searchResult
{
  return self->_searchResult;
}

- (void)setSearchResult:(id)a3
{
}

- (CGRect)frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)page
{
  return self->_page;
}

- (void)setPage:(int64_t)a3
{
  self->_page = a3;
}

- (int64_t)order
{
  return self->_order;
}

- (void)setOrder:(int64_t)a3
{
  self->_order = a3;
}

- (BOOL)hasSnapshot
{
  return self->_hasSnapshot;
}

- (unint64_t)mapType
{
  return self->_mapType;
}

- (void)setMapType:(unint64_t)a3
{
  self->_mapType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutTextColor, 0);
  objc_storeStrong((id *)&self->_blueTextColor, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);

  objc_storeStrong((id *)&self->_searchResult, 0);
}

@end