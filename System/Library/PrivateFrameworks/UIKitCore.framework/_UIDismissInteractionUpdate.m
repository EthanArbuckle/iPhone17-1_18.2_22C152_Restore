@interface _UIDismissInteractionUpdate
+ (BOOL)supportsSecureCoding;
- (BOOL)isTracking;
- (BOOL)wantsHeightClamping;
- (CGAffineTransform)transform;
- (CGAffineTransform)translation;
- (CGPoint)originalTrackingViewPosition;
- (_UIDismissInteractionUpdate)initWithCoder:(id)a3;
- (double)dampingRatio;
- (double)progressToMinScale;
- (double)response;
- (double)scale;
- (void)encodeWithCoder:(id)a3;
- (void)setDampingRatio:(double)a3;
- (void)setIsTracking:(BOOL)a3;
- (void)setOriginalTrackingViewPosition:(CGPoint)a3;
- (void)setProgressToMinScale:(double)a3;
- (void)setResponse:(double)a3;
- (void)setScale:(double)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setTranslation:(CGAffineTransform *)a3;
- (void)setWantsHeightClamping:(BOOL)a3;
@end

@implementation _UIDismissInteractionUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(_UIDismissInteractionUpdate *)self originalTrackingViewPosition];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"originalTrackingViewPosition");
  [(_UIDismissInteractionUpdate *)self translation];
  [v4 encodeCGAffineTransform:v6 forKey:@"translation"];
  [(_UIDismissInteractionUpdate *)self transform];
  [v4 encodeCGAffineTransform:&v5 forKey:@"transform"];
  [(_UIDismissInteractionUpdate *)self scale];
  objc_msgSend(v4, "encodeDouble:forKey:", @"scale");
  [(_UIDismissInteractionUpdate *)self progressToMinScale];
  objc_msgSend(v4, "encodeDouble:forKey:", @"progressToMinScale");
  [(_UIDismissInteractionUpdate *)self dampingRatio];
  objc_msgSend(v4, "encodeDouble:forKey:", @"dampingRatio");
  [(_UIDismissInteractionUpdate *)self response];
  objc_msgSend(v4, "encodeDouble:forKey:", @"response");
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIDismissInteractionUpdate isTracking](self, "isTracking"), @"isTracking");
  objc_msgSend(v4, "encodeBool:forKey:", -[_UIDismissInteractionUpdate wantsHeightClamping](self, "wantsHeightClamping"), @"wantsHeightClamping");
}

- (_UIDismissInteractionUpdate)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_UIDismissInteractionUpdate;
  uint64_t v5 = [(_UIDismissInteractionUpdate *)&v17 init];
  if (v5)
  {
    [v4 decodeCGPointForKey:@"originalTrackingViewPosition"];
    -[_UIDismissInteractionUpdate setOriginalTrackingViewPosition:](v5, "setOriginalTrackingViewPosition:");
    if (v4)
    {
      [v4 decodeCGAffineTransformForKey:@"translation"];
      long long v11 = v14;
      long long v12 = v15;
      long long v13 = v16;
      [(_UIDismissInteractionUpdate *)v5 setTranslation:&v11];
      [v4 decodeCGAffineTransformForKey:@"transform"];
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      [(_UIDismissInteractionUpdate *)v5 setTranslation:&v11];
      long long v9 = 0u;
      long long v10 = 0u;
      long long v8 = 0u;
    }
    v7[0] = v8;
    v7[1] = v9;
    v7[2] = v10;
    [(_UIDismissInteractionUpdate *)v5 setTransform:v7];
    [v4 decodeDoubleForKey:@"scale"];
    -[_UIDismissInteractionUpdate setScale:](v5, "setScale:");
    [v4 decodeDoubleForKey:@"progressToMinScale"];
    -[_UIDismissInteractionUpdate setProgressToMinScale:](v5, "setProgressToMinScale:");
    [v4 decodeDoubleForKey:@"dampingRatio"];
    -[_UIDismissInteractionUpdate setDampingRatio:](v5, "setDampingRatio:");
    [v4 decodeDoubleForKey:@"response"];
    -[_UIDismissInteractionUpdate setResponse:](v5, "setResponse:");
    -[_UIDismissInteractionUpdate setIsTracking:](v5, "setIsTracking:", [v4 decodeBoolForKey:@"isTracking"]);
    -[_UIDismissInteractionUpdate setWantsHeightClamping:](v5, "setWantsHeightClamping:", [v4 decodeBoolForKey:@"wantsHeightClamping"]);
  }

  return v5;
}

- (CGPoint)originalTrackingViewPosition
{
  double x = self->_originalTrackingViewPosition.x;
  double y = self->_originalTrackingViewPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginalTrackingViewPosition:(CGPoint)a3
{
  self->_originalTrackingViewPosition = a3;
}

- (CGAffineTransform)translation
{
  long long v3 = *(_OWORD *)&self[1].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[2].a;
  return self;
}

- (void)setTranslation:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_translation.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_translation.tdouble x = v4;
  *(_OWORD *)&self->_translation.a = v3;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[2].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[3].a;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tdouble x = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)progressToMinScale
{
  return self->_progressToMinScale;
}

- (void)setProgressToMinScale:(double)a3
{
  self->_progressToMinScale = a3;
}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (void)setDampingRatio:(double)a3
{
  self->_dampingRatio = a3;
}

- (double)response
{
  return self->_response;
}

- (void)setResponse:(double)a3
{
  self->_response = a3;
}

- (BOOL)isTracking
{
  return self->_isTracking;
}

- (void)setIsTracking:(BOOL)a3
{
  self->_isTracking = a3;
}

- (BOOL)wantsHeightClamping
{
  return self->_wantsHeightClamping;
}

- (void)setWantsHeightClamping:(BOOL)a3
{
  self->_wantsHeightClamping = a3;
}

@end