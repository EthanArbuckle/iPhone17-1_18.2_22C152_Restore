@interface UIPeripheralHostState
+ (id)stateWithGeometry:(UIPeripheralAnimationGeometry *)a3 inPositionIsDestination:(BOOL)a4;
- (BOOL)inPositionIsDestination;
- (NSDictionary)screenGeometry;
- (UIPeripheralAnimationGeometry)geometry;
- (void)dealloc;
- (void)setGeometry:(UIPeripheralAnimationGeometry *)a3;
- (void)setInPositionIsDestination:(BOOL)a3;
- (void)setScreenGeometry:(id)a3;
@end

@implementation UIPeripheralHostState

+ (id)stateWithGeometry:(UIPeripheralAnimationGeometry *)a3 inPositionIsDestination:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = objc_alloc_init(UIPeripheralHostState);
  long long v7 = *(_OWORD *)&a3->transform.c;
  v11[4] = *(_OWORD *)&a3->transform.a;
  v11[5] = v7;
  v11[6] = *(_OWORD *)&a3->transform.tx;
  double targetFrameHeightDelta = a3->targetFrameHeightDelta;
  CGPoint inPosition = a3->inPosition;
  v11[0] = a3->outPosition;
  v11[1] = inPosition;
  CGSize size = a3->bounds.size;
  v11[2] = a3->bounds.origin;
  v11[3] = size;
  [(UIPeripheralHostState *)v6 setGeometry:v11];
  [(UIPeripheralHostState *)v6 setInPositionIsDestination:v4];
  return v6;
}

- (void)dealloc
{
  [(UIPeripheralHostState *)self setScreenGeometry:0];
  v3.receiver = self;
  v3.super_class = (Class)UIPeripheralHostState;
  [(UIPeripheralHostState *)&v3 dealloc];
}

- (UIPeripheralAnimationGeometry)geometry
{
  long long v3 = *(_OWORD *)&self->transform.d;
  *(_OWORD *)&retstr->transform.a = *(_OWORD *)&self->transform.b;
  *(_OWORD *)&retstr->transform.c = v3;
  *(_OWORD *)&retstr->transform.tx = *(_OWORD *)&self->transform.ty;
  retstr->double targetFrameHeightDelta = self[1].outPosition.x;
  CGPoint v4 = *(CGPoint *)&self->inPosition.y;
  retstr->outPosition = *(CGPoint *)&self->outPosition.y;
  retstr->CGPoint inPosition = v4;
  CGSize v5 = *(CGSize *)&self->bounds.size.height;
  retstr->bounds.origin = *(CGPoint *)&self->bounds.origin.y;
  retstr->bounds.CGSize size = v5;
  return self;
}

- (void)setGeometry:(UIPeripheralAnimationGeometry *)a3
{
  CGPoint outPosition = a3->outPosition;
  CGPoint inPosition = a3->inPosition;
  CGPoint origin = a3->bounds.origin;
  self->_geometry.bounds.CGSize size = a3->bounds.size;
  self->_geometry.bounds.CGPoint origin = origin;
  self->_geometry.CGPoint inPosition = inPosition;
  self->_geometry.CGPoint outPosition = outPosition;
  long long v6 = *(_OWORD *)&a3->transform.a;
  long long v7 = *(_OWORD *)&a3->transform.c;
  long long v8 = *(_OWORD *)&a3->transform.tx;
  self->_geometry.double targetFrameHeightDelta = a3->targetFrameHeightDelta;
  *(_OWORD *)&self->_geometry.transform.tx = v8;
  *(_OWORD *)&self->_geometry.transform.c = v7;
  *(_OWORD *)&self->_geometry.transform.a = v6;
}

- (NSDictionary)screenGeometry
{
  return self->_screenGeometry;
}

- (void)setScreenGeometry:(id)a3
{
}

- (BOOL)inPositionIsDestination
{
  return self->_inPositionIsDestination;
}

- (void)setInPositionIsDestination:(BOOL)a3
{
  self->_inPositionIsDestination = a3;
}

- (void).cxx_destruct
{
}

@end