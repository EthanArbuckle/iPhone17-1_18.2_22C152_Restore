@interface CRLSixChannelTilingLayer
+ (Class)crl_renderableClass;
- (CRLSixChannelTilingLayer)init;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)p_createSublayerWithCompositingFilter:(id)a3;
- (id)p_internalSublayers;
- (void)crl_tilingSafeSetSublayers:(id)a3;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)layoutSublayers;
- (void)setContentsScale:(double)a3;
- (void)setDrawsAsynchronously:(BOOL)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setShouldRasterize:(BOOL)a3;
@end

@implementation CRLSixChannelTilingLayer

- (CRLSixChannelTilingLayer)init
{
  v10.receiver = self;
  v10.super_class = (Class)CRLSixChannelTilingLayer;
  v2 = [(CRLSixChannelTilingLayer *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(CRLSixChannelTilingLayer *)v2 setAllowsGroupOpacity:0];
    [(CRLSixChannelTilingLayer *)v3 setAllowsGroupBlending:0];
    uint64_t v4 = [(CRLSixChannelTilingLayer *)v3 p_createSublayerWithCompositingFilter:kCAFilterMultiplyBlendMode];
    multiplyLayer = v3->_multiplyLayer;
    v3->_multiplyLayer = (CRLTilingLayer *)v4;

    uint64_t v6 = [(CRLSixChannelTilingLayer *)v3 p_createSublayerWithCompositingFilter:kCAFilterLinearDodgeBlendMode];
    addLayer = v3->_addLayer;
    v3->_addLayer = (CRLTilingLayer *)v6;

    v8 = [(CRLSixChannelTilingLayer *)v3 p_internalSublayers];
    [(CRLSixChannelTilingLayer *)v3 setSublayers:v8];
  }
  return v3;
}

- (id)p_createSublayerWithCompositingFilter:(id)a3
{
  id v4 = a3;
  v5 = +[CRLTilingLayer layer];
  [v5 setDelegate:self];
  [v5 setAllowsGroupOpacity:0];
  [v5 setAllowsGroupBlending:0];
  uint64_t v6 = +[CAFilter filterWithType:v4];

  [v5 setCompositingFilter:v6];

  return v5;
}

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class();
}

- (id)p_internalSublayers
{
  addLayer = self->_addLayer;
  v5[0] = self->_multiplyLayer;
  v5[1] = addLayer;
  v3 = +[NSArray arrayWithObjects:v5 count:2];

  return v3;
}

- (void)setDrawsAsynchronously:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CRLSixChannelTilingLayer;
  -[CRLSixChannelTilingLayer setDrawsAsynchronously:](&v5, "setDrawsAsynchronously:");
  [(CRLTilingLayer *)self->_multiplyLayer setDrawsAsynchronously:v3];
  [(CRLTilingLayer *)self->_addLayer setDrawsAsynchronously:v3];
}

- (void)setShouldRasterize:(BOOL)a3
{
  BOOL v3 = a3;
  -[CRLTilingLayer setShouldRasterize:](self->_multiplyLayer, "setShouldRasterize:");
  addLayer = self->_addLayer;

  [(CRLTilingLayer *)addLayer setShouldRasterize:v3];
}

- (void)setContentsScale:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLSixChannelTilingLayer;
  -[CRLSixChannelTilingLayer setContentsScale:](&v5, "setContentsScale:");
  [(CRLTilingLayer *)self->_multiplyLayer setContentsScale:a3];
  [(CRLTilingLayer *)self->_addLayer setContentsScale:a3];
}

- (void)crl_tilingSafeSetSublayers:(id)a3
{
  unint64_t v4 = (unint64_t)a3;
  objc_super v5 = (void *)v4;
  if (v4 | (unint64_t)self->_customSublayers)
  {
    v12 = (void *)v4;
    unsigned __int8 v6 = [v4 isEqual:];
    objc_super v5 = v12;
    if ((v6 & 1) == 0)
    {
      v7 = (NSArray *)[v12 copy];
      customSublayers = self->_customSublayers;
      self->_customSublayers = v7;

      v9 = [(CRLSixChannelTilingLayer *)self p_internalSublayers];
      objc_super v10 = v9;
      if (v12)
      {
        v11 = [v9 arrayByAddingObjectsFromArray:];
        [(CRLSixChannelTilingLayer *)self setSublayers:v11];
      }
      else
      {
        [(CRLSixChannelTilingLayer *)self setSublayers:v9];
      }

      objc_super v5 = v12;
    }
  }
}

- (void)layoutSublayers
{
  v3.receiver = self;
  v3.super_class = (Class)CRLSixChannelTilingLayer;
  [(CRLSixChannelTilingLayer *)&v3 layoutSublayers];
  [(CRLSixChannelTilingLayer *)self bounds];
  -[CRLTilingLayer setFrame:](self->_multiplyLayer, "setFrame:");
  [(CRLTilingLayer *)self->_multiplyLayer setNeedsLayout];
  [(CRLSixChannelTilingLayer *)self bounds];
  -[CRLTilingLayer setFrame:](self->_addLayer, "setFrame:");
  [(CRLTilingLayer *)self->_addLayer setNeedsLayout];
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)CRLSixChannelTilingLayer;
  -[CRLSixChannelTilingLayer setNeedsDisplayInRect:](&v8, "setNeedsDisplayInRect:");
  -[CRLSixChannelTilingLayer convertRect:toLayer:](self, "convertRect:toLayer:", self->_multiplyLayer, x, y, width, height);
  -[CRLTilingLayer setNeedsDisplayInRect:](self->_multiplyLayer, "setNeedsDisplayInRect:");
  -[CRLSixChannelTilingLayer convertRect:toLayer:](self, "convertRect:toLayer:", self->_addLayer, x, y, width, height);
  -[CRLTilingLayer setNeedsDisplayInRect:](self->_addLayer, "setNeedsDisplayInRect:");
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  unsigned __int8 v6 = (CRLTilingLayer *)a3;
  v7 = v6;
  if (self->_multiplyLayer == v6)
  {
    sub_1004571F0((uint64_t)a4, 1);
LABEL_14:
    [(CRLSixChannelTilingLayer *)self drawInContext:a4];
    goto LABEL_15;
  }
  if (self->_addLayer == v6)
  {
    sub_100457324((uint64_t)a4, 1);
    goto LABEL_14;
  }
  int v8 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D97A0);
  }
  v9 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_10107DEA0((uint64_t)v7, v8, v9);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D97C0);
  }
  objc_super v10 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
    sub_101066770(v10, v8);
  }
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLSixChannelTilingLayer drawLayer:inContext:]");
  v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLSixChannelTilingLayer.m"];
  +[CRLAssertionHandler handleFailureInFunction:v11, v12, 223, 0, "Unexpected delegate call for layer %@", v7 file lineNumber isFatal description];

LABEL_15:
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSublayers, 0);
  objc_storeStrong((id *)&self->_addLayer, 0);

  objc_storeStrong((id *)&self->_multiplyLayer, 0);
}

@end