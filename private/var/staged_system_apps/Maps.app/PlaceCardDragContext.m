@interface PlaceCardDragContext
- (MKMapItem)draggedMapItem;
- (MapsAnalyticsHelper)analyticsHelper;
- (id)content;
- (int)analyticsTarget;
- (void)setAnalyticsHelper:(id)a3;
- (void)setAnalyticsTarget:(int)a3;
- (void)setContent:(id)a3;
@end

@implementation PlaceCardDragContext

- (MKMapItem)draggedMapItem
{
  id v2 = self->_content;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    v5 = [v4 mapItem];
  }
  else
  {
    v5 = 0;
  }

  return (MKMapItem *)v5;
}

- (id)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (int)analyticsTarget
{
  return self->_analyticsTarget;
}

- (void)setAnalyticsTarget:(int)a3
{
  self->_analyticsTarget = a3;
}

- (MapsAnalyticsHelper)analyticsHelper
{
  return self->_analyticsHelper;
}

- (void)setAnalyticsHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsHelper, 0);

  objc_storeStrong(&self->_content, 0);
}

@end