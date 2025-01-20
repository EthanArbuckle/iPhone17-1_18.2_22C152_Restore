@interface TSDMutableManipulatedStroke
- (id)copyWithZone:(_NSZone *)a3;
- (void)setWidth:(double)a3;
@end

@implementation TSDMutableManipulatedStroke

- (void)setWidth:(double)a3
{
  -[TSDStroke setI_width:](self, "setI_width:");

  [(TSDStroke *)self setI_actualWidth:a3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [TSDManipulatedStroke alloc];
  v5 = [(TSDSmartStroke *)self strokeName];
  v6 = [(TSDMutableManipulatedStroke *)self color];
  [(TSDMutableManipulatedStroke *)self width];
  double v8 = v7;
  uint64_t v9 = [(TSDMutableManipulatedStroke *)self cap];
  uint64_t v10 = [(TSDMutableManipulatedStroke *)self join];
  v11 = [(TSDMutableManipulatedStroke *)self pattern];
  [(TSDMutableManipulatedStroke *)self miterLimit];

  return [(TSDManipulatedStroke *)v4 initWithName:v5 color:v6 width:v9 cap:v10 join:v11 pattern:v8 miterLimit:v12];
}

@end