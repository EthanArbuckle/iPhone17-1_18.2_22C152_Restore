@interface RCSelectionTouchTrackingInfo
- (UITouch)touch;
- (double)trackingOffset;
- (id)description;
- (int64_t)selectionAffinity;
- (int64_t)selectionBarType;
- (void)setSelectionAffinity:(int64_t)a3;
- (void)setSelectionBarType:(int64_t)a3;
- (void)setTouch:(id)a3;
- (void)setTrackingOffset:(double)a3;
- (void)updateTrackingInfo;
@end

@implementation RCSelectionTouchTrackingInfo

- (void)setTouch:(id)a3
{
  id obj = a3;
  [obj locationInView:0];
  self->_lastLocation = v4;
  objc_storeWeak((id *)&self->_touch, obj);
}

- (void)updateTrackingInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touch);
  [WeakRetained locationInView:0];
  double v5 = v4;

  double lastLocation = self->_lastLocation;
  if (v5 != lastLocation)
  {
    int64_t v7 = -1;
    if (v5 > lastLocation) {
      int64_t v7 = 1;
    }
    self->_selectionAffinity = v7;
  }
  self->_double lastLocation = v5;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)RCSelectionTouchTrackingInfo;
  v3 = [(RCSelectionTouchTrackingInfo *)&v9 description];
  if (self->_selectionBarType) {
    CFStringRef v4 = @"MAX";
  }
  else {
    CFStringRef v4 = @"min";
  }
  double v5 = +[NSNumber numberWithDouble:self->_trackingOffset];
  v6 = +[NSNumber numberWithInteger:self->_selectionAffinity];
  int64_t v7 = +[NSString stringWithFormat:@"%@ location=%@, offset=%@, affinity=%@", v3, v4, v5, v6];

  return v7;
}

- (UITouch)touch
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_touch);

  return (UITouch *)WeakRetained;
}

- (double)trackingOffset
{
  return self->_trackingOffset;
}

- (void)setTrackingOffset:(double)a3
{
  self->_trackingOffset = a3;
}

- (int64_t)selectionBarType
{
  return self->_selectionBarType;
}

- (void)setSelectionBarType:(int64_t)a3
{
  self->_selectionBarType = a3;
}

- (int64_t)selectionAffinity
{
  return self->_selectionAffinity;
}

- (void)setSelectionAffinity:(int64_t)a3
{
  self->_selectionAffinity = a3;
}

- (void).cxx_destruct
{
}

@end