@interface MapsSuggestionsDGVLinkOverlay
- (MapsSuggestionsDGVLinkOverlay)initWithFromAnnotation:(id)a3 toAnnotation:(id)a4 index:(unint64_t)a5;
- (unint64_t)index;
- (void)setIndex:(unint64_t)a3;
@end

@implementation MapsSuggestionsDGVLinkOverlay

- (MapsSuggestionsDGVLinkOverlay)initWithFromAnnotation:(id)a3 toAnnotation:(id)a4 index:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MapsSuggestionsDGVLinkOverlay;
  v10 = [(MapsSuggestionsDGVLinkOverlay *)&v20 init];
  if (v10)
  {
    v11 = v10;
    [v8 coordinate];
    CLLocationDegrees v13 = v12;
    [v8 coordinate];
    v21[0] = CLLocationCoordinate2DMake(v13, v14);
    [v9 coordinate];
    CLLocationDegrees v16 = v15;
    [v9 coordinate];
    v21[1] = CLLocationCoordinate2DMake(v16, v17);
    [(MapsSuggestionsDGVLinkOverlay *)v11 setIndex:a5];
    v18 = +[MapsSuggestionsDGVLinkOverlay polylineWithCoordinates:v21 count:2];
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

@end