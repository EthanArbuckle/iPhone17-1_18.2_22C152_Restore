@interface MFPhoneRegion
- (MFPhoneRegion)initWithPath:(id)a3 in_bounds:(CGRect)a4;
- (MFPhoneRegion)initWithRects:(id)a3 in_bounds:(CGRect)a4 in_dc:(id)a5;
- (id)pathForClippingWithDeviceContext:(id)a3;
- (int)fill:(id)a3 in_brush:(id)a4;
- (int)frame:(id)a3 in_brush:(id)a4;
- (int)invert:(id)a3;
@end

@implementation MFPhoneRegion

- (MFPhoneRegion)initWithRects:(id)a3 in_bounds:(CGRect)a4 in_dc:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a3;
  id v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)MFPhoneRegion;
  v13 = [(MFPhoneRegion *)&v31 init];
  v14 = v13;
  if (v13)
  {
    v13->m_bounds.origin.CGFloat x = x;
    v13->m_bounds.origin.CGFloat y = y;
    v13->m_bounds.size.CGFloat width = width;
    v13->m_bounds.size.CGFloat height = height;
    v15 = objc_alloc_init(OITSUBezierPath);
    m_path = v14->m_path;
    v14->m_path = v15;

    v17 = [v12 getCurrentTransform];
    v18 = v17;
    if (v17)
    {
      [v17 getTransformMatrix];
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v25 = 0u;
    }
    long long v28 = v25;
    long long v29 = v26;
    long long v30 = v27;

    [v11 objectEnumerator];
    v20 = v19 = 0;
    while (1)
    {
      v21 = [v20 nextObject];

      v22 = v14->m_path;
      if (!v21) {
        break;
      }
      [v21 CGRectValue];
      v19 = v21;
      -[OITSUBezierPath appendBezierPathWithRect:](v22, "appendBezierPathWithRect:");
    }
    v24[0] = v28;
    v24[1] = v29;
    v24[2] = v30;
    [(OITSUBezierPath *)v22 transformUsingAffineTransform:v24];
  }
  return v14;
}

- (MFPhoneRegion)initWithPath:(id)a3 in_bounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MFPhoneRegion;
  v10 = [(MFPhoneRegion *)&v15 init];
  if (v10)
  {
    id v11 = [v9 getBezierPath];
    uint64_t v12 = [v11 copy];
    m_path = v10->m_path;
    v10->m_path = (OITSUBezierPath *)v12;

    v10->m_bounds.origin.CGFloat x = x;
    v10->m_bounds.origin.CGFloat y = y;
    v10->m_bounds.size.CGFloat width = width;
    v10->m_bounds.size.CGFloat height = height;
  }

  return v10;
}

- (id)pathForClippingWithDeviceContext:(id)a3
{
  id v4 = a3;
  m_path = self->m_path;
  if (m_path && ![(OITSUBezierPath *)m_path isEmpty])
  {
    v6 = (void *)[(OITSUBezierPath *)self->m_path copy];
    objc_msgSend(v6, "setWindingRule:", objc_msgSend(v4, "getPolyFillMode") != 2);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int)fill:(id)a3 in_brush:(id)a4
{
  return 0;
}

- (int)frame:(id)a3 in_brush:(id)a4
{
  return 0;
}

- (int)invert:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end