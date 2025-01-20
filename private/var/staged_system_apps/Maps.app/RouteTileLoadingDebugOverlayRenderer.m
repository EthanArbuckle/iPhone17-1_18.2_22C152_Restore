@interface RouteTileLoadingDebugOverlayRenderer
- (RouteTileLoadingDebugOverlayRenderer)initWithOverlay:(id)a3;
- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5;
@end

@implementation RouteTileLoadingDebugOverlayRenderer

- (RouteTileLoadingDebugOverlayRenderer)initWithOverlay:(id)a3
{
  v36.receiver = self;
  v36.super_class = (Class)RouteTileLoadingDebugOverlayRenderer;
  v3 = [(RouteTileLoadingDebugOverlayRenderer *)&v36 initWithOverlay:a3];
  if (v3)
  {
    uint64_t v4 = +[NSMutableDictionary dictionary];
    tileTypeToZoomLevels = v3->_tileTypeToZoomLevels;
    v3->_tileTypeToZoomLevels = (NSMutableDictionary *)v4;

    v6 = +[GEOResourceManifestManager modernManager];
    v7 = [v6 activeTileGroup];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v26 = v7;
    id obj = [v7 tileSets];
    id v29 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v29)
    {
      uint64_t v28 = *(void *)v33;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v33 != v28) {
            objc_enumerationMutation(obj);
          }
          uint64_t v30 = v8;
          v9 = *(void **)(*((void *)&v32 + 1) + 8 * v8);
          v10 = v3->_tileTypeToZoomLevels;
          v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 style]);
          v12 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v11];

          if (!v12)
          {
            v13 = +[NSMutableArray array];
            v14 = v3->_tileTypeToZoomLevels;
            v15 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 style]);
            [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];
          }
          v31 = (char *)[v9 availableTiles];
          if ([v9 availableTilesCount])
          {
            unint64_t v16 = 0;
            do
            {
              v17 = &v31[24 * v16];
              uint64_t v18 = *((unsigned int *)v17 + 5);
              unsigned int v19 = *((_DWORD *)v17 + 2);
              while (v18 <= v19)
              {
                v20 = v3->_tileTypeToZoomLevels;
                v21 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 style]);
                v22 = [(NSMutableDictionary *)v20 objectForKeyedSubscript:v21];
                v23 = +[NSNumber numberWithUnsignedInt:v18];
                [v22 addObject:v23];

                uint64_t v18 = (v18 + 1);
              }
              ++v16;
            }
            while (v16 < (unint64_t)[v9 availableTilesCount]);
          }
          uint64_t v8 = v30 + 1;
        }
        while ((id)(v30 + 1) != v29);
        id v29 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v29);
    }

    v24 = v3;
  }

  return v3;
}

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  double var1 = a3.var1.var1;
  double var0 = a3.var1.var0;
  double v9 = a3.var0.var1;
  double v10 = a3.var0.var0;
  int v12 = (int)log2(MKMapSizeWorld.width * 0.001953125);
  unsigned int v13 = vcvtmd_s64_f64(log2(a4) + 0.5);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100C69464;
  v33[3] = &unk_10131D290;
  v33[4] = self;
  v33[5] = (v12 + v13) & ~((int)(v12 + v13) >> 31);
  *(double *)&v33[6] = v10;
  *(double *)&v33[7] = v9;
  *(double *)&v33[8] = var0;
  *(double *)&v33[9] = var1;
  v33[10] = a5;
  v14 = objc_retainBlock(v33);
  CGContextSaveGState(a5);
  CGContextSetLineWidth(a5, 2.0 / a4);
  CGContextSetRGBFillColor(a5, 0.0, 0.0, 1.0, 0.2);
  CGContextSetRGBStrokeColor(a5, 0.0, 0.0, 0.5, 0.4);
  uint64_t v15 = [(RouteTileLoadingDebugOverlayRenderer *)self overlay];
  unint64_t v16 = v14;
  if (v15)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v15 + 32));
    long long v37 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v34 = 0u;
    id v17 = *(id *)(v15 + 16);
    id v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v35;
      do
      {
        v20 = 0;
        do
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v17);
          }
          ((void (*)(void *, void))v16[2])(v16, *(void *)(*((void *)&v34 + 1) + 8 * (void)v20));
          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v18);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(v15 + 32));
  }

  CGContextSetRGBFillColor(a5, 0.0, 1.0, 0.0, 0.2);
  CGContextSetRGBStrokeColor(a5, 0.0, 0.5, 0.0, 0.4);
  uint64_t v21 = [(RouteTileLoadingDebugOverlayRenderer *)self overlay];
  v22 = v16;
  if (v21)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v21 + 32));
    long long v37 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v34 = 0u;
    id v23 = *(id *)(v21 + 8);
    id v24 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v35;
      do
      {
        v26 = 0;
        do
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v23);
          }
          v22[2](v22, *(void *)(*((void *)&v34 + 1) + 8 * (void)v26));
          v26 = (char *)v26 + 1;
        }
        while (v24 != v26);
        id v24 = [v23 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v24);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(v21 + 32));
  }

  CGContextSetRGBFillColor(a5, 1.0, 0.0, 0.0, 0.2);
  CGContextSetRGBStrokeColor(a5, 0.5, 0.0, 0.0, 0.4);
  uint64_t v27 = [(RouteTileLoadingDebugOverlayRenderer *)self overlay];
  uint64_t v28 = v22;
  if (v27)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v27 + 32));
    long long v37 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v34 = 0u;
    id v29 = *(id *)(v27 + 24);
    id v30 = [v29 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v35;
      do
      {
        long long v32 = 0;
        do
        {
          if (*(void *)v35 != v31) {
            objc_enumerationMutation(v29);
          }
          v28[2](v28, *(void *)(*((void *)&v34 + 1) + 8 * (void)v32));
          long long v32 = (char *)v32 + 1;
        }
        while (v30 != v32);
        id v30 = [v29 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v30);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(v27 + 32));
  }

  CGContextRestoreGState(a5);
}

- (void).cxx_destruct
{
}

@end