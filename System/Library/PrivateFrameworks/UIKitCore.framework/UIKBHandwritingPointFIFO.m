@interface UIKBHandwritingPointFIFO
- (UIKBHandwritingPointFIFO)initWithFIFO:(id)a3;
- (UIKBHandwritingPointFIFO)nextFIFO;
- (void)clear;
- (void)emitPoint:(id *)a3;
- (void)flush;
- (void)setNextFIFO:(id)a3;
@end

@implementation UIKBHandwritingPointFIFO

- (UIKBHandwritingPointFIFO)initWithFIFO:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIKBHandwritingPointFIFO;
  v5 = [(UIKBHandwritingPointFIFO *)&v8 init];
  v6 = v5;
  if (v5) {
    [(UIKBHandwritingPointFIFO *)v5 setNextFIFO:v4];
  }

  return v6;
}

- (void)emitPoint:(id *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  id v9 = [(UIKBHandwritingPointFIFO *)self nextFIFO];
  objc_msgSend(v9, "addPoint:", v8, v7, v6);
}

- (void)flush
{
  id v2 = [(UIKBHandwritingPointFIFO *)self nextFIFO];
  [v2 flush];
}

- (void)clear
{
  id v2 = [(UIKBHandwritingPointFIFO *)self nextFIFO];
  [v2 clear];
}

- (UIKBHandwritingPointFIFO)nextFIFO
{
  return self->_nextFIFO;
}

- (void)setNextFIFO:(id)a3
{
}

- (void).cxx_destruct
{
}

@end