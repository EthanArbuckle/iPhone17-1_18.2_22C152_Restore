@interface UIBoxcarFilterPointFIFO
- (UIBoxcarFilterPointFIFO)initWithFIFO:(id)a3 width:(unint64_t)a4;
- (UIBoxcarFilterPointFIFO)initWithFIFO:(id)a3 width:(unint64_t)a4 spacing:(float)a5;
- (_UIPointVector)prevPoints;
- (float)spacing;
- (unint64_t)width;
- (void)addPoint:(UIBoxcarFilterPointFIFO *)self;
- (void)clear;
- (void)dealloc;
- (void)emitAveragedPoint;
- (void)flush;
- (void)setPrevPoints:(id)a3;
- (void)setSpacing:(float)a3;
- (void)setWidth:(unint64_t)a3;
@end

@implementation UIBoxcarFilterPointFIFO

- (UIBoxcarFilterPointFIFO)initWithFIFO:(id)a3 width:(unint64_t)a4 spacing:(float)a5
{
  v10.receiver = self;
  v10.super_class = (Class)UIBoxcarFilterPointFIFO;
  v7 = [(UIPointFIFO *)&v10 initWithFIFO:a3];
  v8 = v7;
  if (v7)
  {
    if (a4 <= 1) {
      -[UIBoxcarFilterPointFIFO initWithFIFO:width:spacing:]();
    }
    v7->_width = a4;
    v7->_spacing = a5;
    v7->_prevPoints = objc_alloc_init(_UIPointVector);
  }
  return v8;
}

- (UIBoxcarFilterPointFIFO)initWithFIFO:(id)a3 width:(unint64_t)a4
{
  return [(UIBoxcarFilterPointFIFO *)self initWithFIFO:a3 width:a4 spacing:0.0];
}

- (void)emitAveragedPoint
{
  if ([(_UIPointVector *)[(UIBoxcarFilterPointFIFO *)self prevPoints] count])
  {
    unint64_t v3 = 0;
    float32x4_t v6 = 0u;
    do
    {
      [(_UIPointVector *)[(UIBoxcarFilterPointFIFO *)self prevPoints] vectorAtIndex:v3];
      float32x4_t v6 = vaddq_f32(v7, v4);
      ++v3;
    }
    while (v3 < [(_UIPointVector *)[(UIBoxcarFilterPointFIFO *)self prevPoints] count]);
  }
  else
  {
    v5.i32[1] = 0;
    float32x4_t v6 = 0u;
  }
  *(float *)v5.i32 = (float)self->_width;
  [(_UIPointVector *)[(UIBoxcarFilterPointFIFO *)self prevPoints] removeVectorAtIndex:0];

  [(UIPointFIFO *)self emitPoint:v8];
}

- (void)addPoint:(UIBoxcarFilterPointFIFO *)self
{
  float32x4_t v9 = v2;
  unint64_t v4 = [(_UIPointVector *)[(UIBoxcarFilterPointFIFO *)self prevPoints] count];
  int32x2_t v5 = [(UIBoxcarFilterPointFIFO *)self prevPoints];
  if (v4)
  {
    [(_UIPointVector *)v5 lastVector];
    float32x4_t v7 = vsubq_f32(v6, v9);
    int8x16_t v8 = (int8x16_t)vmulq_f32(v7, v7);
    if (sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v8.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)))) >= self->_spacing) {
      [(_UIPointVector *)[(UIBoxcarFilterPointFIFO *)self prevPoints] addVector:*(double *)v9.i64];
    }
    if ([(_UIPointVector *)[(UIBoxcarFilterPointFIFO *)self prevPoints] count] == self->_width)
    {
      [(UIBoxcarFilterPointFIFO *)self emitAveragedPoint];
    }
  }
  else
  {
    [(_UIPointVector *)v5 addVector:*(double *)v9.i64];
    [(UIPointFIFO *)self emitPoint:*(double *)v9.i64];
  }
}

- (void)flush
{
  if ([(_UIPointVector *)[(UIBoxcarFilterPointFIFO *)self prevPoints] count] == self->_width) {
    [(UIBoxcarFilterPointFIFO *)self emitAveragedPoint];
  }
  if ([(_UIPointVector *)[(UIBoxcarFilterPointFIFO *)self prevPoints] count])
  {
    [(_UIPointVector *)[(UIBoxcarFilterPointFIFO *)self prevPoints] lastVector];
    -[UIPointFIFO emitPoint:](self, "emitPoint:");
  }
  [(_UIPointVector *)[(UIBoxcarFilterPointFIFO *)self prevPoints] clear];
  v3.receiver = self;
  v3.super_class = (Class)UIBoxcarFilterPointFIFO;
  [(UIPointFIFO *)&v3 flush];
}

- (void)clear
{
  [(_UIPointVector *)[(UIBoxcarFilterPointFIFO *)self prevPoints] clear];
  v3.receiver = self;
  v3.super_class = (Class)UIBoxcarFilterPointFIFO;
  [(UIPointFIFO *)&v3 clear];
}

- (void)dealloc
{
  self->_prevPoints = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIBoxcarFilterPointFIFO;
  [(UIPointFIFO *)&v3 dealloc];
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (float)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(float)a3
{
  self->_spacing = a3;
}

- (_UIPointVector)prevPoints
{
  return self->_prevPoints;
}

- (void)setPrevPoints:(id)a3
{
}

- (void)initWithFIFO:width:spacing:.cold.1()
{
}

@end