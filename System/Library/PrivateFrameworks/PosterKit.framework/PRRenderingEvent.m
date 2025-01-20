@interface PRRenderingEvent
- (CGPoint)location;
- (NSString)type;
- (PRRenderingEvent)initWithAction:(id)a3;
- (PRRenderingEvent)initWithType:(id)a3;
- (PRRenderingEvent)initWithType:(id)a3 location:(CGPoint)a4;
- (id)newAction;
- (void)setLocation:(CGPoint)a3;
- (void)setType:(id)a3;
@end

@implementation PRRenderingEvent

- (PRRenderingEvent)initWithType:(id)a3
{
  return -[PRRenderingEvent initWithType:location:](self, "initWithType:location:", a3, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (PRRenderingEvent)initWithType:(id)a3 location:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PRRenderingEvent;
  v9 = [(PRRenderingEvent *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    v10->_location.CGFloat x = x;
    v10->_location.CGFloat y = y;
  }

  return v10;
}

- (PRRenderingEvent)initWithAction:(id)a3
{
  id v4 = a3;
  v5 = [v4 eventType];
  [v4 location];
  double v7 = v6;
  double v9 = v8;

  v10 = -[PRRenderingEvent initWithType:location:](self, "initWithType:location:", v5, v7, v9);
  return v10;
}

- (id)newAction
{
  v3 = [PRRenderingEventAction alloc];
  type = self->_type;
  double x = self->_location.x;
  double y = self->_location.y;
  return -[PRRenderingEventAction initWithType:location:](v3, "initWithType:location:", type, x, y);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (void).cxx_destruct
{
}

@end