@interface RouteCellularCoverageDebugOverlayRenderer
- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5;
@end

@implementation RouteCellularCoverageDebugOverlayRenderer

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v9 = a3.var0.var1;
  double v10 = a3.var0.var0;
  v12 = [(RouteCellularCoverageDebugOverlayRenderer *)self overlay];
  [v12 route];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100C697E0;
  v14[3] = &unk_10131D2B8;
  v14[4] = self;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  double v16 = v10;
  double v17 = v9;
  double v18 = var0;
  double v19 = var1;
  double v20 = a4;
  v21 = a5;
  id v13 = v15;
  [v13 enumerateCellularCoverageRangesWithBlock:v14];
}

@end