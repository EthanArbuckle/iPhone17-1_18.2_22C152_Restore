@interface CACGestureLivePreviewHandwritingPointFIFO
- (CACGestureLivePreviewHandwritingPointFIFO)initWithFIFO:(id)a3;
- (CACGestureLivePreviewHandwritingPointFIFO)nextFIFO;
- (void)clear;
- (void)emitPoint:(id *)a3;
- (void)flush;
- (void)setNextFIFO:(id)a3;
@end

@implementation CACGestureLivePreviewHandwritingPointFIFO

- (CACGestureLivePreviewHandwritingPointFIFO)initWithFIFO:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CACGestureLivePreviewHandwritingPointFIFO;
  v5 = [(CACGestureLivePreviewHandwritingPointFIFO *)&v8 init];
  v6 = v5;
  if (v5) {
    [(CACGestureLivePreviewHandwritingPointFIFO *)v5 setNextFIFO:v4];
  }

  return v6;
}

- (void)emitPoint:(id *)a3
{
  double v6 = v5;
  double v7 = v4;
  double v8 = v3;
  id v9 = [(CACGestureLivePreviewHandwritingPointFIFO *)self nextFIFO];
  objc_msgSend(v9, "addPoint:", v8, v7, v6);
}

- (void)flush
{
  id v2 = [(CACGestureLivePreviewHandwritingPointFIFO *)self nextFIFO];
  [v2 flush];
}

- (void)clear
{
  id v2 = [(CACGestureLivePreviewHandwritingPointFIFO *)self nextFIFO];
  [v2 clear];
}

- (CACGestureLivePreviewHandwritingPointFIFO)nextFIFO
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