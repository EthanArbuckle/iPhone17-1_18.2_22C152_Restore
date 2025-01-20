@interface SHSheetDraggingEvent
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)eventForDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5;
+ (id)eventForDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6;
+ (id)eventForDraggingDidEnd;
- (BOOL)dismissible;
- (BOOL)shouldAnimate;
- (CGPoint)interruptedOffset;
- (CGPoint)translation;
- (CGPoint)velocity;
- (SHSheetDraggingEvent)initWithBSXPCCoder:(id)a3;
- (double)rubberBandCoefficient;
- (int64_t)type;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setDismissible:(BOOL)a3;
- (void)setInterruptedOffset:(CGPoint)a3;
- (void)setRubberBandCoefficient:(double)a3;
- (void)setShouldAnimate:(BOOL)a3;
- (void)setTranslation:(CGPoint)a3;
- (void)setType:(int64_t)a3;
- (void)setVelocity:(CGPoint)a3;
@end

@implementation SHSheetDraggingEvent

+ (id)eventForDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  BOOL v7 = a4;
  v9 = objc_alloc_init(SHSheetDraggingEvent);
  [(SHSheetDraggingEvent *)v9 setType:0];
  [(SHSheetDraggingEvent *)v9 setRubberBandCoefficient:a3];
  [(SHSheetDraggingEvent *)v9 setDismissible:v7];
  -[SHSheetDraggingEvent setInterruptedOffset:](v9, "setInterruptedOffset:", x, y);
  return v9;
}

+ (id)eventForDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  v12 = objc_alloc_init(SHSheetDraggingEvent);
  [(SHSheetDraggingEvent *)v12 setType:1];
  -[SHSheetDraggingEvent setTranslation:](v12, "setTranslation:", v11, v10);
  -[SHSheetDraggingEvent setVelocity:](v12, "setVelocity:", x, y);
  [(SHSheetDraggingEvent *)v12 setShouldAnimate:v7];
  [(SHSheetDraggingEvent *)v12 setDismissible:v6];
  return v12;
}

+ (id)eventForDraggingDidEnd
{
  v2 = objc_alloc_init(SHSheetDraggingEvent);
  [(SHSheetDraggingEvent *)v2 setType:2];
  return v2;
}

- (SHSheetDraggingEvent)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SHSheetDraggingEvent;
  v5 = [(SHSheetDraggingEvent *)&v7 init];
  if (v5)
  {
    -[SHSheetDraggingEvent setType:](v5, "setType:", [v4 decodeInt64ForKey:@"type"]);
    [v4 decodeDoubleForKey:@"rubberBandCoefficient"];
    -[SHSheetDraggingEvent setRubberBandCoefficient:](v5, "setRubberBandCoefficient:");
    [v4 decodeCGPointForKey:@"interruptedOffset"];
    -[SHSheetDraggingEvent setInterruptedOffset:](v5, "setInterruptedOffset:");
    [v4 decodeCGPointForKey:@"translation"];
    -[SHSheetDraggingEvent setTranslation:](v5, "setTranslation:");
    [v4 decodeCGPointForKey:@"velocity"];
    -[SHSheetDraggingEvent setVelocity:](v5, "setVelocity:");
    -[SHSheetDraggingEvent setDismissible:](v5, "setDismissible:", [v4 decodeBoolForKey:@"dismissible"]);
    -[SHSheetDraggingEvent setShouldAnimate:](v5, "setShouldAnimate:", [v4 decodeBoolForKey:@"shouldAnimate"]);
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", -[SHSheetDraggingEvent type](self, "type"), @"type");
  [(SHSheetDraggingEvent *)self rubberBandCoefficient];
  objc_msgSend(v4, "encodeDouble:forKey:", @"rubberBandCoefficient");
  [(SHSheetDraggingEvent *)self interruptedOffset];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"interruptedOffset");
  [(SHSheetDraggingEvent *)self translation];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"translation");
  [(SHSheetDraggingEvent *)self velocity];
  objc_msgSend(v4, "encodeCGPoint:forKey:", @"velocity");
  objc_msgSend(v4, "encodeBool:forKey:", -[SHSheetDraggingEvent dismissible](self, "dismissible"), @"dismissible");
  objc_msgSend(v4, "encodeBool:forKey:", -[SHSheetDraggingEvent shouldAnimate](self, "shouldAnimate"), @"shouldAnimate");
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (double)rubberBandCoefficient
{
  return self->_rubberBandCoefficient;
}

- (void)setRubberBandCoefficient:(double)a3
{
  self->_rubberBandCoefficient = a3;
}

- (CGPoint)interruptedOffset
{
  double x = self->_interruptedOffset.x;
  double y = self->_interruptedOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInterruptedOffset:(CGPoint)a3
{
  self->_interruptedOffset = a3;
}

- (CGPoint)translation
{
  double x = self->_translation.x;
  double y = self->_translation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTranslation:(CGPoint)a3
{
  self->_translation = a3;
}

- (CGPoint)velocity
{
  double x = self->_velocity.x;
  double y = self->_velocity.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setVelocity:(CGPoint)a3
{
  self->_velocitdouble y = a3;
}

- (BOOL)dismissible
{
  return self->_dismissible;
}

- (void)setDismissible:(BOOL)a3
{
  self->_dismissible = a3;
}

- (BOOL)shouldAnimate
{
  return self->_shouldAnimate;
}

- (void)setShouldAnimate:(BOOL)a3
{
  self->_shouldAnimate = a3;
}

@end