@interface MFPhonePath
- (BOOL)isOpen;
- (CGPoint)currentPoint;
- (MFPhonePath)init;
- (MFPhonePath)initWithPath:(id)a3 state:(int)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)getBezierPath;
- (int)abort;
- (int)begin;
- (int)closeFigure;
- (int)end;
- (int)fill:(id)a3;
- (int)flatten;
- (int)state;
- (int)stroke:(id)a3;
- (int)widen:(id)a3;
- (void)appendBezierPath:(id)a3 dc:(id)a4;
@end

@implementation MFPhonePath

- (MFPhonePath)init
{
  v6.receiver = self;
  v6.super_class = (Class)MFPhonePath;
  v2 = [(MFPhonePath *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[OITSUBezierPath bezierPath];
    m_path = v2->m_path;
    v2->m_path = (OITSUBezierPath *)v3;

    v2->m_state = 0;
  }
  return v2;
}

- (BOOL)isOpen
{
  return self->m_state == 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = -[OITSUBezierPath copyWithZone:](self->m_path, "copyWithZone:");
  objc_super v6 = [+[MFPhonePath allocWithZone:a3] initWithPath:v5 state:self->m_state];

  return v6;
}

- (MFPhonePath)initWithPath:(id)a3 state:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFPhonePath;
  v8 = [(MFPhonePath *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->m_path, a3);
    v9->m_state = a4;
  }

  return v9;
}

- (int)begin
{
  self->m_state = 1;
  return 0;
}

- (void)appendBezierPath:(id)a3 dc:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MFPhonePath *)self isOpen])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    v8 = [v7 getCurrentTransform];
    v9 = v8;
    if (v8)
    {
      [v8 getTransformMatrix];
    }
    else
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v12 = 0u;
    }

    v10 = (void *)[v6 copy];
    v11[0] = v12;
    v11[1] = v13;
    v11[2] = v14;
    [v10 transformUsingAffineTransform:v11];
    [(OITSUBezierPath *)self->m_path attachBezierPath:v10];
  }
}

- (int)closeFigure
{
  if ([(MFPhonePath *)self isOpen]) {
    [(OITSUBezierPath *)self->m_path closePath];
  }
  return 0;
}

- (CGPoint)currentPoint
{
  if ([(OITSUBezierPath *)self->m_path isEmpty])
  {
    double v3 = *MEMORY[0x263F00148];
    double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  else
  {
    [(OITSUBezierPath *)self->m_path currentPoint];
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (int)end
{
  if ([(MFPhonePath *)self isOpen]) {
    self->m_state = 2;
  }
  return 0;
}

- (int)fill:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->m_state == 2)
  {
    memset(&v14, 0, sizeof(v14));
    id v6 = [v4 getCurrentTransform];
    id v7 = v6;
    if (v6) {
      [v6 getTransformMatrix];
    }
    else {
      memset(&v13, 0, sizeof(v13));
    }
    CGAffineTransformInvert(&v14, &v13);

    v9 = (void *)[(OITSUBezierPath *)self->m_path copy];
    CGAffineTransform v12 = v14;
    [v9 transformUsingAffineTransform:&v12];
    v10 = [v5 getBrush];
    objc_msgSend(v10, "fillPath:in_path:", v5, v9);

    int v8 = 0;
  }
  else
  {
    int v8 = -7;
  }

  return v8;
}

- (id)getBezierPath
{
  return self->m_path;
}

- (int)stroke:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->m_state == 2)
  {
    memset(&v14, 0, sizeof(v14));
    id v6 = [v4 getCurrentTransform];
    id v7 = v6;
    if (v6) {
      [v6 getTransformMatrix];
    }
    else {
      memset(&v13, 0, sizeof(v13));
    }
    CGAffineTransformInvert(&v14, &v13);

    v9 = (void *)[(OITSUBezierPath *)self->m_path copy];
    CGAffineTransform v12 = v14;
    [v9 transformUsingAffineTransform:&v12];
    v10 = [v5 getPen];
    objc_msgSend(v10, "strokePath:in_path:", v5, v9);

    int v8 = 0;
  }
  else
  {
    int v8 = -7;
  }

  return v8;
}

- (int)state
{
  return self->m_state;
}

- (int)abort
{
  self->m_state = 0;
  return 0;
}

- (int)flatten
{
  if ([(MFPhonePath *)self isOpen]) {
    [(OITSUBezierPath *)self->m_path setFlatness:3.40282347e38];
  }
  return 0;
}

- (int)widen:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end