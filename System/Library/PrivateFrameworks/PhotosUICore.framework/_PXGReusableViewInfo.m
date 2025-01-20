@interface _PXGReusableViewInfo
- (CALayer)layer;
- (CGPoint)anchorPoint;
- (NSArray)hostedViewInfos;
- (PXGInternalReusableView)view;
- (_PXGReusableViewInfo)hostingViewInfo;
- (_PXGReusableViewInfo)initWithReusableView:(id)a3;
- (double)rotation;
- (double)scale;
- (id)description;
- (void)addHostedViewInfo:(id)a3;
- (void)removeFromSuperViewInfo;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setHostingViewInfo:(id)a3;
- (void)setLayer:(id)a3;
- (void)setRotation:(double)a3;
- (void)setScale:(double)a3;
- (void)setView:(id)a3;
@end

@implementation _PXGReusableViewInfo

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostingViewInfo);
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_layer, 0);
  objc_storeStrong((id *)&self->_hostedViewInfos, 0);
}

- (void)setHostingViewInfo:(id)a3
{
}

- (_PXGReusableViewInfo)hostingViewInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingViewInfo);
  return (_PXGReusableViewInfo *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (PXGInternalReusableView)view
{
  return self->_view;
}

- (void)setLayer:(id)a3
{
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (CGPoint)anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
}

- (double)rotation
{
  return self->_rotation;
}

- (NSArray)hostedViewInfos
{
  v2 = (void *)[(NSMutableArray *)self->_hostedViewInfos copy];
  return (NSArray *)v2;
}

- (void)removeFromSuperViewInfo
{
  v4 = [(_PXGReusableViewInfo *)self hostingViewInfo];
  if (v4)
  {
    v3 = [(_PXGReusableViewInfo *)self view];
    objc_msgSend(v3, "pxg_removeFromSuperview");

    [v4[1] removeObject:self];
    [(_PXGReusableViewInfo *)self setHostingViewInfo:0];
  }
}

- (void)addHostedViewInfo:(id)a3
{
  id v4 = a3;
  hostedViewInfos = self->_hostedViewInfos;
  id v8 = v4;
  if (!hostedViewInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_hostedViewInfos;
    self->_hostedViewInfos = v6;

    id v4 = v8;
    hostedViewInfos = self->_hostedViewInfos;
  }
  [(NSMutableArray *)hostedViewInfos addObject:v4];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_PXGReusableViewInfo *)self view];
  v7 = [v3 stringWithFormat:@"<%@:%p view = %@>", v5, self, v6];;

  return v7;
}

- (_PXGReusableViewInfo)initWithReusableView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXGReusableViewInfo;
  v6 = [(_PXGReusableViewInfo *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_view, a3);
    *(_OWORD *)&v7->_rotation = xmmword_1AB2F7740;
  }

  return v7;
}

@end