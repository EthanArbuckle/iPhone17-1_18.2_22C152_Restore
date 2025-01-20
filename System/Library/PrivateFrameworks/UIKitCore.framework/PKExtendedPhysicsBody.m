@interface PKExtendedPhysicsBody
+ (id)bodyWithBodies:(id)a3;
+ (id)bodyWithCircleOfRadius:(double)a3;
+ (id)bodyWithEdgeChainFromPath:(CGPath *)a3;
+ (id)bodyWithEdgeFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4;
+ (id)bodyWithEdgeLoopFromPath:(CGPath *)a3;
+ (id)bodyWithEllipseInRect:(CGRect)a3;
+ (id)bodyWithPolygonFromPath:(CGPath *)a3;
+ (id)bodyWithRectangleOfSize:(CGSize)a3;
+ (id)bodyWithRectangleOfSize:(CGSize)a3 center:(CGPoint)a4;
- (BOOL)dissociate;
- (PKExtendedPhysicsBody)init;
- (PKExtendedPhysicsBody)initWithRectangleOfSize:(CGSize)a3;
- (double)normalizedDensity;
- (id)description;
- (void)associate;
- (void)setNormalizedDensity:(double)a3;
@end

@implementation PKExtendedPhysicsBody

+ (id)bodyWithEllipseInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v7 = CGRectGetWidth(a3) * -0.5;
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGFloat v8 = CGRectGetHeight(v14) * -0.5;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  CGFloat v9 = CGRectGetWidth(v15);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  v17.size.CGFloat height = CGRectGetHeight(v16);
  v17.origin.CGFloat x = v7;
  v17.origin.CGFloat y = v8;
  v17.size.CGFloat width = v9;
  v10 = CGPathCreateWithEllipseInRect(v17, 0);
  v11 = [[PKExtendedPhysicsBody alloc] initWithPolygonFromPath:v10];
  CGPathRelease(v10);
  return v11;
}

+ (id)bodyWithCircleOfRadius:(double)a3
{
  v3 = [[PKExtendedPhysicsBody alloc] initWithCircleOfRadius:a3];
  return v3;
}

+ (id)bodyWithRectangleOfSize:(CGSize)a3
{
  v3 = -[PKExtendedPhysicsBody initWithRectangleOfSize:]([PKExtendedPhysicsBody alloc], "initWithRectangleOfSize:", a3.width, a3.height);
  return v3;
}

+ (id)bodyWithRectangleOfSize:(CGSize)a3 center:(CGPoint)a4
{
  v4 = -[PKExtendedPhysicsBody initWithRectangleOfSize:center:]([PKExtendedPhysicsBody alloc], "initWithRectangleOfSize:center:", a3.width, a3.height, a4.x, a4.y);
  return v4;
}

+ (id)bodyWithEdgeFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  v4 = -[PKExtendedPhysicsBody initWithEdgeFromPoint:toPoint:]([PKExtendedPhysicsBody alloc], "initWithEdgeFromPoint:toPoint:", a3.x, a3.y, a4.x, a4.y);
  return v4;
}

+ (id)bodyWithPolygonFromPath:(CGPath *)a3
{
  v3 = [[PKExtendedPhysicsBody alloc] initWithPolygonFromPath:a3];
  return v3;
}

+ (id)bodyWithEdgeChainFromPath:(CGPath *)a3
{
  v3 = [[PKExtendedPhysicsBody alloc] initWithEdgeChainFromPath:a3];
  return v3;
}

+ (id)bodyWithEdgeLoopFromPath:(CGPath *)a3
{
  v3 = [[PKExtendedPhysicsBody alloc] initWithEdgeLoopFromPath:a3];
  return v3;
}

+ (id)bodyWithBodies:(id)a3
{
  id v3 = a3;
  v4 = [[PKExtendedPhysicsBody alloc] initWithBodies:v3];

  return v4;
}

- (PKExtendedPhysicsBody)init
{
  v5.receiver = self;
  v5.super_class = (Class)PKExtendedPhysicsBody;
  v2 = [(PKExtendedPhysicsBody *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    [(PKExtendedPhysicsBody *)v2 setNormalizedDensity:1.0];
    [(PKExtendedPhysicsBody *)v3 set_allowSleep:1];
  }
  return v3;
}

- (void)setNormalizedDensity:(double)a3
{
  double areaFactor = self->_areaFactor;
  if (areaFactor == 0.0) {
    double areaFactor = 1.0;
  }
  [(PKExtendedPhysicsBody *)self setDensity:areaFactor * a3];
}

- (double)normalizedDensity
{
  double areaFactor = self->_areaFactor;
  [(PKExtendedPhysicsBody *)self density];
  if (areaFactor != 0.0) {
    return result / self->_areaFactor;
  }
  return result;
}

- (PKExtendedPhysicsBody)initWithRectangleOfSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  PKGet_INV_PTM_RATIO();
  double v7 = 0.02 / v6;
  double v8 = v7 + 1.0;
  double v9 = width - v7;
  double v10 = width * 0.5;
  if (width - v7 >= width * 0.5) {
    double v10 = width - v7;
  }
  if (width <= v8) {
    double v9 = v10;
  }
  double v11 = height - v7;
  double v12 = height * 0.5;
  if (v11 >= height * 0.5) {
    double v12 = v11;
  }
  if (height <= v8) {
    double v11 = v12;
  }
  self->_double areaFactor = width * height / (v9 * v11);
  v14.receiver = self;
  v14.super_class = (Class)PKExtendedPhysicsBody;
  return -[PKExtendedPhysicsBody initWithRectangleOfSize:](&v14, sel_initWithRectangleOfSize_);
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  [(PKExtendedPhysicsBody *)self position];
  uint64_t v5 = v4;
  [(PKExtendedPhysicsBody *)self position];
  objc_msgSend(v3, "appendFormat:", @" PO:(%f,%f)", v5, v6);
  [(PKExtendedPhysicsBody *)self rotation];
  objc_msgSend(v3, "appendFormat:", @" AN:(%f)", v7);
  [(PKExtendedPhysicsBody *)self velocity];
  uint64_t v9 = v8;
  [(PKExtendedPhysicsBody *)self velocity];
  objc_msgSend(v3, "appendFormat:", @" VE:(%f,%f)", v9, v10);
  [(PKExtendedPhysicsBody *)self angularVelocity];
  objc_msgSend(v3, "appendFormat:", @" AV:(%f)", v11);
  objc_msgSend(v3, "appendFormat:", @" dy:(%d)", -[PKExtendedPhysicsBody isDynamic](self, "isDynamic"));
  objc_msgSend(v3, "appendFormat:", @" cc:(%d)", -[PKExtendedPhysicsBody usesPreciseCollisionDetection](self, "usesPreciseCollisionDetection"));
  objc_msgSend(v3, "appendFormat:", @" ar:(%d)", -[PKExtendedPhysicsBody allowsRotation](self, "allowsRotation"));
  objc_msgSend(v3, "appendFormat:", @" rs:(%d)", -[PKExtendedPhysicsBody isResting](self, "isResting"));
  [(PKExtendedPhysicsBody *)self friction];
  objc_msgSend(v3, "appendFormat:", @" fr:(%f)", v12);
  [(PKExtendedPhysicsBody *)self restitution];
  objc_msgSend(v3, "appendFormat:", @" re:(%f)", v13);
  [(PKExtendedPhysicsBody *)self density];
  objc_msgSend(v3, "appendFormat:", @" de:(%f)", v14);
  objc_msgSend(v3, "appendFormat:", @" gr:(%d)", -[PKExtendedPhysicsBody affectedByGravity](self, "affectedByGravity"));
  CGRect v15 = NSString;
  v19.receiver = self;
  v19.super_class = (Class)PKExtendedPhysicsBody;
  CGRect v16 = [(PKExtendedPhysicsBody *)&v19 description];
  CGRect v17 = [v15 stringWithFormat:@"%@ %p %@", v16, self, v3];

  return v17;
}

- (void)associate
{
}

- (BOOL)dissociate
{
  int64_t v2 = self->_associations - 1;
  self->_associations = v2;
  return v2 == 0;
}

@end