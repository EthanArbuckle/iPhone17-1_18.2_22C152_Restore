@interface TSDMutableStroke
+ (id)emptyStroke;
+ (id)stroke;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDontClearBackground:(BOOL)a3;
- (void)setWidth:(double)a3;
@end

@implementation TSDMutableStroke

- (void)setWidth:(double)a3
{
  -[TSDStroke setI_width:](self, "setI_width:");

  [(TSDStroke *)self setI_actualWidth:a3];
}

+ (id)stroke
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___TSDMutableStroke;
  id v2 = objc_msgSendSuper2(&v4, sel_i_newStroke);

  return v2;
}

+ (id)emptyStroke
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___TSDMutableStroke;
  id v2 = objc_msgSendSuper2(&v4, sel_i_newEmptyStroke);

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [TSDStroke alloc];
  v5 = [(TSDMutableStroke *)self color];
  [(TSDMutableStroke *)self width];
  double v7 = v6;
  uint64_t v8 = [(TSDMutableStroke *)self cap];
  uint64_t v9 = [(TSDMutableStroke *)self join];
  v10 = [(TSDMutableStroke *)self pattern];
  [(TSDMutableStroke *)self miterLimit];
  v12 = [(TSDStroke *)v4 initWithColor:v5 width:v8 cap:v9 join:v10 pattern:v7 miterLimit:v11];

  [(TSDMutableStroke *)self actualWidth];
  -[TSDStroke setI_actualWidth:](v12, "setI_actualWidth:");
  return v12;
}

- (void)setDontClearBackground:(BOOL)a3
{
  if (a3)
  {
    value = objc_alloc_init(TSTStrokeAssociatedObject);
    [(TSTStrokeAssociatedObject *)value setDontClearBackground:1];
    objc_setAssociatedObject(self, "TSTStrokeAssociatedObject", value, (void *)1);
  }
  else
  {
    objc_setAssociatedObject(self, "TSTStrokeAssociatedObject", 0, (void *)1);
  }
}

@end