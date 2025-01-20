@interface TSDMutableBrushStroke
- (id)copyWithZone:(_NSZone *)a3;
- (void)setWidth:(double)a3;
@end

@implementation TSDMutableBrushStroke

- (void)setWidth:(double)a3
{
  -[TSDStroke setI_width:](self, "setI_width:");

  [(TSDStroke *)self setI_actualWidth:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [TSDBrushStroke alloc];
  v5 = [(TSDSmartStroke *)self strokeName];
  v6 = [(TSDMutableBrushStroke *)self color];
  [(TSDMutableBrushStroke *)self width];
  double v8 = v7;
  uint64_t v9 = [(TSDMutableBrushStroke *)self cap];
  uint64_t v10 = [(TSDMutableBrushStroke *)self join];
  v11 = [(TSDMutableBrushStroke *)self pattern];
  [(TSDMutableBrushStroke *)self miterLimit];
  v13 = [(TSDBrushStroke *)v4 initWithName:v5 color:v6 width:v9 cap:v10 join:v11 pattern:v8 miterLimit:v12];

  return v13;
}

@end