@interface TUIKBHandwritingPointFIFO
- (TUIKBHandwritingPointFIFO)initWithFIFO:(id)a3;
- (TUIKBHandwritingPointFIFO)nextFIFO;
- (void)clear;
- (void)emitPoint:(id *)a3;
- (void)flush;
- (void)setNextFIFO:(id)a3;
@end

@implementation TUIKBHandwritingPointFIFO

- (void).cxx_destruct
{
}

- (void)setNextFIFO:(id)a3
{
}

- (TUIKBHandwritingPointFIFO)nextFIFO
{
  return self->_nextFIFO;
}

- (void)clear
{
  id v2 = [(TUIKBHandwritingPointFIFO *)self nextFIFO];
  [v2 clear];
}

- (void)flush
{
  id v2 = [(TUIKBHandwritingPointFIFO *)self nextFIFO];
  [v2 flush];
}

- (void)emitPoint:(id *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  id v9 = [(TUIKBHandwritingPointFIFO *)self nextFIFO];
  objc_msgSend(v9, "addPoint:", v8, v7, v6);
}

- (TUIKBHandwritingPointFIFO)initWithFIFO:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUIKBHandwritingPointFIFO;
  double v5 = [(TUIKBHandwritingPointFIFO *)&v8 init];
  double v6 = v5;
  if (v5) {
    [(TUIKBHandwritingPointFIFO *)v5 setNextFIFO:v4];
  }

  return v6;
}

@end