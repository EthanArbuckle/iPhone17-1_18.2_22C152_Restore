@interface DistanceCircleAnnotationView
- (double)distanceRadius;
- (void)_updateFromMap;
- (void)setDistanceRadius:(double)a3;
@end

@implementation DistanceCircleAnnotationView

- (void)setDistanceRadius:(double)a3
{
  self->_distanceRadius = a3;
  -[DistanceCircleAnnotationView _pointsForDistance:](self, "_pointsForDistance:");

  -[CircleAnnotationView setRadius:](self, "setRadius:");
}

- (void)_updateFromMap
{
  [(DistanceCircleAnnotationView *)self _pointsForDistance:self->_distanceRadius];
  -[CircleAnnotationView setRadius:](self, "setRadius:");
  v3.receiver = self;
  v3.super_class = (Class)DistanceCircleAnnotationView;
  [(DistanceCircleAnnotationView *)&v3 _updateFromMap];
}

- (double)distanceRadius
{
  return self->_distanceRadius;
}

@end