@interface RouteAdvisoryViewModel
+ (id)viewModelForAdvisory:(id)a3;
+ (id)viewModelWithText:(id)a3 artwork:(id)a4 handler:(id)a5;
+ (id)viewModelWithText:(id)a3 buttonRange:(_NSRange)a4 image:(id)a5 handler:(id)a6;
+ (id)viewModelsForAdvisories:(id)a3;
- (GEOComposedRouteAdvisory)advisory;
- (GEOTransitArtworkDataSource)artwork;
- (NSAttributedString)text;
- (RouteAdvisoryViewModel)initWithAdvisory:(id)a3;
- (RouteAdvisoryViewModel)initWithText:(id)a3 artwork:(id)a4 handler:(id)a5;
- (RouteAdvisoryViewModel)initWithText:(id)a3 buttonRange:(_NSRange)a4 image:(id)a5 handler:(id)a6;
- (UIImage)image;
- (_NSRange)buttonRange;
- (id)handler;
@end

@implementation RouteAdvisoryViewModel

+ (id)viewModelForAdvisory:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithAdvisory:v4];

  return v5;
}

+ (id)viewModelsForAdvisories:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100BC7DC4;
  v5[3] = &unk_10131A9E8;
  v5[4] = a1;
  v3 = sub_100099700(a3, v5);

  return v3;
}

+ (id)viewModelWithText:(id)a3 artwork:(id)a4 handler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithText:v10 artwork:v9 handler:v8];

  return v11;
}

+ (id)viewModelWithText:(id)a3 buttonRange:(_NSRange)a4 image:(id)a5 handler:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [objc_alloc((Class)a1) initWithText:v13 buttonRange:location length:v12 image:v11 handler:v11];

  return v14;
}

- (RouteAdvisoryViewModel)initWithAdvisory:(id)a3
{
  id v5 = a3;
  v6 = [v5 titleString];
  v7 = [v6 defaultOptions];

  [v7 setCreateAttributedString:1];
  id v8 = +[RouteAdvisoryView _stringAttributes];
  [v7 setStringAttributes:v8];

  id v9 = [v5 titleString];
  id v10 = [v9 stringResultWithOptions:v7];
  id v11 = [v10 attributedString];

  id v12 = [v5 artwork];
  id v13 = [(RouteAdvisoryViewModel *)self initWithText:v11 artwork:v12 handler:0];

  if (v13) {
    objc_storeStrong((id *)&v13->_advisory, a3);
  }

  return v13;
}

- (RouteAdvisoryViewModel)initWithText:(id)a3 artwork:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RouteAdvisoryViewModel;
  id v11 = [(RouteAdvisoryViewModel *)&v17 init];
  if (v11)
  {
    id v12 = (NSAttributedString *)[v8 copy];
    text = v11->_text;
    v11->_text = v12;

    objc_storeStrong((id *)&v11->_artwork, a4);
    id v14 = [v10 copy];
    id handler = v11->_handler;
    v11->_id handler = v14;
  }
  return v11;
}

- (RouteAdvisoryViewModel)initWithText:(id)a3 buttonRange:(_NSRange)a4 image:(id)a5 handler:(id)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)RouteAdvisoryViewModel;
  id v14 = [(RouteAdvisoryViewModel *)&v20 init];
  if (v14)
  {
    v15 = (NSAttributedString *)[v11 copy];
    text = v14->_text;
    v14->_text = v15;

    objc_storeStrong((id *)&v14->_image, a5);
    v14->_buttonRange.NSUInteger location = location;
    v14->_buttonRange.NSUInteger length = length;
    id v17 = [v13 copy];
    id handler = v14->_handler;
    v14->_id handler = v17;
  }
  return v14;
}

- (NSAttributedString)text
{
  return self->_text;
}

- (GEOTransitArtworkDataSource)artwork
{
  return self->_artwork;
}

- (UIImage)image
{
  return self->_image;
}

- (_NSRange)buttonRange
{
  NSUInteger length = self->_buttonRange.length;
  NSUInteger location = self->_buttonRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (id)handler
{
  return self->_handler;
}

- (GEOComposedRouteAdvisory)advisory
{
  return self->_advisory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advisory, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_artwork, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end