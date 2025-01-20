@interface _UITouchForceMessage
+ (id)observe:(id)a3;
+ (id)reset;
- (BOOL)shouldFilterDueToSystemGestures;
- (CGPoint)centroid;
- (double)maximumPossibleForce;
- (double)timestamp;
- (double)unclampedTouchForce;
- (void)ifObservation:(id)a3 ifReset:(id)a4;
- (void)ifObservationUnclamped:(id)a3 ifReset:(id)a4;
- (void)setCentroid:(CGPoint)a3;
- (void)setMaximumPossibleForce:(double)a3;
- (void)setShouldFilterDueToSystemGestures:(BOOL)a3;
- (void)setTimestamp:(double)a3;
- (void)setUnclampedTouchForce:(double)a3;
@end

@implementation _UITouchForceMessage

+ (id)observe:(id)a3
{
  v3 = (void (**)(id, _UITouchForceMessage *))a3;
  v4 = objc_alloc_init(_UITouchForceMessage);
  v3[2](v3, v4);

  return v4;
}

+ (id)reset
{
  v2 = objc_alloc_init(_UITouchForceMessage);
  v2->_isReset = 1;
  return v2;
}

- (void)ifObservation:(id)a3 ifReset:(id)a4
{
  v11 = (void (**)(id, _UITouchForceObservationMessageReader *))a3;
  id v6 = a4;
  v7 = v6;
  if (v6 && self->_isReset)
  {
    (*((void (**)(id))v6 + 2))(v6);
  }
  else if (v11)
  {
    observeReader = self->_observeReader;
    if (!observeReader)
    {
      v9 = objc_alloc_init(_UITouchForceObservationMessageReader);
      v10 = self->_observeReader;
      self->_observeReader = v9;

      observeReader = self->_observeReader;
    }
    [(_UITouchForceObservationMessageReader *)observeReader setTouchForce:fmin(self->_unclampedTouchForce, self->_maximumPossibleForce)];
    [(_UITouchForceObservationMessageReader *)self->_observeReader setTimestamp:self->_timestamp];
    -[_UITouchForceObservationMessageReader setCentroid:](self->_observeReader, "setCentroid:", self->_centroid.x, self->_centroid.y);
    [(_UITouchForceObservationMessageReader *)self->_observeReader setShouldFilterDueToSystemGestures:self->_shouldFilterDueToSystemGestures];
    v11[2](v11, self->_observeReader);
  }
}

- (void)ifObservationUnclamped:(id)a3 ifReset:(id)a4
{
  v11 = (void (**)(id, _UITouchForceObservationMessageReader *))a3;
  id v6 = a4;
  v7 = v6;
  if (v6 && self->_isReset)
  {
    (*((void (**)(id))v6 + 2))(v6);
  }
  else if (v11)
  {
    observeReader = self->_observeReader;
    if (!observeReader)
    {
      v9 = objc_alloc_init(_UITouchForceObservationMessageReader);
      v10 = self->_observeReader;
      self->_observeReader = v9;

      observeReader = self->_observeReader;
    }
    [(_UITouchForceObservationMessageReader *)observeReader setTouchForce:self->_unclampedTouchForce];
    [(_UITouchForceObservationMessageReader *)self->_observeReader setTimestamp:self->_timestamp];
    -[_UITouchForceObservationMessageReader setCentroid:](self->_observeReader, "setCentroid:", self->_centroid.x, self->_centroid.y);
    [(_UITouchForceObservationMessageReader *)self->_observeReader setShouldFilterDueToSystemGestures:self->_shouldFilterDueToSystemGestures];
    v11[2](v11, self->_observeReader);
  }
}

- (double)unclampedTouchForce
{
  return self->_unclampedTouchForce;
}

- (void)setUnclampedTouchForce:(double)a3
{
  self->_unclampedTouchForce = a3;
}

- (double)maximumPossibleForce
{
  return self->_maximumPossibleForce;
}

- (void)setMaximumPossibleForce:(double)a3
{
  self->_maximumPossibleForce = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (CGPoint)centroid
{
  double x = self->_centroid.x;
  double y = self->_centroid.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCentroid:(CGPoint)a3
{
  self->_centroid = a3;
}

- (BOOL)shouldFilterDueToSystemGestures
{
  return self->_shouldFilterDueToSystemGestures;
}

- (void)setShouldFilterDueToSystemGestures:(BOOL)a3
{
  self->_shouldFilterDueToSystemGestures = a3;
}

- (void).cxx_destruct
{
}

@end