@interface UIPointFIFO
- (UIPointFIFO)initWithFIFO:(id)a3;
- (UIPointFIFO)nextFIFO;
- (void)clear;
- (void)dealloc;
- (void)emitPoint:(UIPointFIFO *)self;
- (void)flush;
- (void)setNextFIFO:(id)a3;
@end

@implementation UIPointFIFO

- (UIPointFIFO)initWithFIFO:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIPointFIFO;
  v4 = [(UIPointFIFO *)&v6 init];
  if (v4) {
    v4->_nextFIFO = (UIPointFIFO *)a3;
  }
  return v4;
}

- (void)dealloc
{
  self->_nextFIFO = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIPointFIFO;
  [(UIPointFIFO *)&v3 dealloc];
}

- (void)emitPoint:(UIPointFIFO *)self
{
  double v4 = v2;
  objc_super v3 = [(UIPointFIFO *)self nextFIFO];

  [(UIPointFIFO *)v3 addPoint:v4];
}

- (void)flush
{
}

- (void)clear
{
}

- (UIPointFIFO)nextFIFO
{
  return self->_nextFIFO;
}

- (void)setNextFIFO:(id)a3
{
}

@end