@interface MapsMapDisplayDebugController
+ (id)navigationDestinationTitle;
+ (void)completelyFlushTiles;
+ (void)resetSSAOValues;
- ($6EFE6C6748B912A6EAC8A8E593ED1344)mapDisplayStyleInAllLayers;
- (BOOL)shouldCaptureFrameToFile;
- (MapsMapDisplayDebugController)init;
- (id)addAllMapsSwitchRowToSection:(id)a3 title:(id)a4 forVectorKitDebugKey:(id)a5;
- (id)addAllMapsSwitchRowToSection:(id)a3 title:(id)a4 key:(id)a5;
- (id)addAllMapsSwitchRowToSection:(id)a3 title:(id)a4 selector:(SEL)a5 key:(id)a6;
- (id)valueForKeyInAllMapLayers:(id)a3;
- (void)_activateMapInspector:(id)a3;
- (void)_setAllMapLayersNeedLayout;
- (void)dealloc;
- (void)disableMapDisplayStyleOverrideForAllLayers;
- (void)enableMapDisplayStyleOverrideForAllLayers:(id)a3;
- (void)prepareContent;
- (void)runNextTourIndex:(unint64_t)a3 withTours:(id)a4;
- (void)setMapDisplayStyleForAllLayers:(id)a3;
- (void)setShouldCaptureFrameToFile:(BOOL)a3;
- (void)setValue:(id)a3 forKeyInAllMapLayers:(id)a4;
@end

@implementation MapsMapDisplayDebugController

+ (id)navigationDestinationTitle
{
  return @"Map Display";
}

- (MapsMapDisplayDebugController)init
{
  v7.receiver = self;
  v7.super_class = (Class)MapsMapDisplayDebugController;
  v2 = [(MapsDebugValuesViewController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(MapsMapDisplayDebugController *)v2 setTitle:@"Map Display"];
    v3->_shouldCaptureFrameToFile = 0;
    uint64_t v4 = +[NSMutableArray array];
    mapsFeatureListeners = v3->_mapsFeatureListeners;
    v3->_mapsFeatureListeners = (NSMutableArray *)v4;
  }
  return v3;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_mapsFeatureListeners;
  uint64_t v4 = (char *)[(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      objc_super v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        MapsFeature_RemoveBlockListener();
        ++v7;
      }
      while (v5 != v7);
      v5 = (char *)[(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)MapsMapDisplayDebugController;
  [(MapsDebugValuesViewController *)&v8 dealloc];
}

- (id)valueForKeyInAllMapLayers:(id)a3
{
  id v4 = a3;
  v5 = [(MapsDebugValuesViewController *)self delegate];
  uint64_t v6 = [v5 allVisibleMapViewsForDebugController:self];

  if ([v6 count])
  {
    objc_super v7 = [v6 objectAtIndexedSubscript:0];
    objc_super v8 = [v7 _mapLayer];
    long long v9 = [v8 valueForKey:v4];
  }
  else
  {
    long long v9 = 0;
  }

  return v9;
}

- (void)setValue:(id)a3 forKeyInAllMapLayers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v8 = [(MapsDebugValuesViewController *)self delegate];
  long long v9 = [v8 allVisibleMapViewsForDebugController:self];

  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v15 = [v14 _mapLayer];
        [v15 setValue:v6 forKey:v7];

        v16 = [v14 _mapLayer];
        [v16 setNeedsLayout];
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
}

- ($6EFE6C6748B912A6EAC8A8E593ED1344)mapDisplayStyleInAllLayers
{
  v3 = [(MapsDebugValuesViewController *)self delegate];
  id v4 = [v3 allVisibleMapViewsForDebugController:self];

  if ([v4 count])
  {
    v5 = [v4 objectAtIndexedSubscript:0];
    id v6 = [v5 _mapLayer];
    unint64_t v7 = (unint64_t)[v6 mapDisplayStyle];
    unsigned __int8 v8 = v7;
    unint64_t v9 = v7 >> 8;
    v10.i64[0] = 0xFFFFFFFFFFFFLL;
    v10.i64[1] = 0xFFFFFFFFFFFFLL;
    uint64x2_t v11 = (uint64x2_t)vandq_s8((int8x16_t)vdupq_n_s64(v7), v10);
    int8x16_t v24 = (int8x16_t)vshlq_u64(v11, (uint64x2_t)xmmword_100F72660);
    int8x16_t v23 = (int8x16_t)vshlq_u64(v11, (uint64x2_t)xmmword_100F72670);

    v12.i64[0] = 255;
    v12.i64[1] = 255;
    int8x16_t v13 = vandq_s8(v23, v12);
    uint64_t v14 = v13.i64[1];
    uint64_t v15 = v13.i64[0];
    int8x16_t v16 = vandq_s8(v24, v12);
    uint64_t v17 = v16.i64[1];
    uint64_t v18 = v16.i64[0];
  }
  else
  {
    unsigned __int8 v8 = 0;
    LOBYTE(v9) = 0;
    uint64_t v18 = 0;
    uint64_t v17 = 0;
    uint64_t v15 = 0;
    uint64_t v14 = 0;
  }

  v19.i64[0] = v18;
  v19.i64[1] = v17;
  v20.i64[0] = v15;
  v20.i64[1] = v14;
  int8x16_t v21 = vorrq_s8((int8x16_t)vshlq_u64(v19, (uint64x2_t)xmmword_100F72680), (int8x16_t)vshlq_u64(v20, (uint64x2_t)xmmword_100F72690));
  return ($6EFE6C6748B912A6EAC8A8E593ED1344)(*(void *)&vorr_s8(*(int8x8_t *)v21.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v21, v21, 8uLL)) | ((unint64_t)v9 << 8) | v8);
}

- (void)setMapDisplayStyleForAllLayers:(id)a3
{
  uint64_t v3 = *(void *)&a3.var0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(MapsDebugValuesViewController *)self delegate];
  id v6 = [v5 allVisibleMapViewsForDebugController:self];

  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    uint64_t v10 = v3 & 0xFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        int8x16_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int8x16_t v13 = [v12 _mapLayer];
        [v13 setMapDisplayStyle:v10];

        uint64_t v14 = [v12 _mapLayer];
        [v14 setNeedsLayout];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)enableMapDisplayStyleOverrideForAllLayers:(id)a3
{
  uint64_t v3 = *(void *)&a3.var0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(MapsDebugValuesViewController *)self delegate];
  id v6 = [v5 allVisibleMapViewsForDebugController:self];

  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    uint64_t v10 = v3 & 0xFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        int8x16_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int8x16_t v13 = [v12 _mapLayer];
        [v13 enableMapDisplayStyleDebugOverride:v10];

        uint64_t v14 = [v12 _mapLayer];
        [v14 setNeedsLayout];
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (void)disableMapDisplayStyleOverrideForAllLayers
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [(MapsDebugValuesViewController *)self delegate];
  id v4 = [v3 allVisibleMapViewsForDebugController:self];

  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [v9 _mapLayer];
        [v10 disableMapDisplayStyleDebugOverride];

        uint64x2_t v11 = [v9 _mapLayer];
        [v11 setNeedsLayout];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (id)addAllMapsSwitchRowToSection:(id)a3 title:(id)a4 key:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10085A814;
  v18[3] = &unk_1012FAD80;
  objc_copyWeak(&v20, &location);
  id v11 = v10;
  id v19 = v11;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10085A86C;
  v15[3] = &unk_1012E5D30;
  objc_copyWeak(&v17, &location);
  id v12 = v11;
  id v16 = v12;
  long long v13 = [v8 addSwitchRowWithTitle:v9 get:v18 set:v15];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v13;
}

- (id)addAllMapsSwitchRowToSection:(id)a3 title:(id)a4 selector:(SEL)a5 key:(id)a6
{
  var1 = a6.var0.var1;
  uint64_t v7 = *(void **)&a6.var0.var0;
  id v11 = a3;
  id v12 = a4;
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10085AA48;
  v17[3] = &unk_1012F8FB8;
  v17[4] = v7;
  v17[5] = var1;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10085AA54;
  v15[3] = &unk_1012FADA8;
  objc_copyWeak(v16, &location);
  v16[1] = v7;
  v16[2] = var1;
  v16[3] = (id)a5;
  long long v13 = [v11 addSwitchRowWithTitle:v12 get:v17 set:v15];
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  return v13;
}

- (id)addAllMapsSwitchRowToSection:(id)a3 title:(id)a4 forVectorKitDebugKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10085AC80;
  v17[3] = &unk_1012E7F80;
  id v18 = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10085ACE0;
  v14[3] = &unk_1012FADD0;
  id v11 = v18;
  id v15 = v11;
  objc_copyWeak(&v16, &location);
  id v12 = [v8 addSwitchRowWithTitle:v9 get:v17 set:v14];
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);

  return v12;
}

- (void)_setAllMapLayersNeedLayout
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [(MapsDebugValuesViewController *)self delegate];
  id v4 = [v3 allVisibleMapViewsForDebugController:self];

  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v8) _mapLayer];
        [v9 setNeedsLayout];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_activateMapInspector:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10085AFC4;
  v6[3] = &unk_1012E5D30;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  id v5 = [v4 addSwitchRowWithTitle:@"Activate Map Inspector" get:&stru_1012FADF0 set:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)prepareContent
{
  objc_initWeak(&location, self);
  uint64_t v3 = +[VKDebugSettings sharedSettings];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10085B1B0;
  v6[3] = &unk_1012EE3E8;
  objc_copyWeak(&v8, &location);
  id v4 = v3;
  id v7 = v4;
  id v5 = [(MapsDebugValuesViewController *)self addSectionWithTitle:@"Map Display" content:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)runNextTourIndex:(unint64_t)a3 withTours:(id)a4
{
  id v6 = a4;
  id v7 = [(MapsDebugValuesViewController *)self delegate];
  id v8 = [v7 allVisibleMapViewsForDebugController:self];
  id v9 = [v8 firstObject];

  long long v10 = [v6 objectAtIndexedSubscript:a3];
  id v11 = [v10 unsignedLongLongValue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1008789A4;
  v13[3] = &unk_1012FE440;
  id v15 = self;
  unint64_t v16 = a3;
  id v14 = v6;
  id v12 = v6;
  [v9 _startFlyoverTourAnimation:v11 duration:v13 completion:180.0];
}

+ (void)completelyFlushTiles
{
  id v2 = +[GEOTileLoader modernLoader];
  [v2 shrinkDiskCacheToSize:0 callbackQ:&_dispatch_main_q finished:&stru_1012FE480];
}

+ (void)resetSSAOValues
{
  id v2 = +[VKDebugSettings sharedSettings];
  LODWORD(v3) = 1.0;
  [v2 setSsaoMaxIntensity:v3];

  id v4 = +[VKDebugSettings sharedSettings];
  LODWORD(v5) = 1025758986;
  [v4 setSsaoMaxDistance:v5];

  id v6 = +[VKDebugSettings sharedSettings];
  LODWORD(v7) = 1109393408;
  [v6 setSsaoFalloffScale:v7];

  id v8 = +[VKDebugSettings sharedSettings];
  [v8 setSsaoOverrideOn:0];

  id v9 = +[VKDebugSettings sharedSettings];
  LODWORD(v10) = 0.5;
  [v9 setSsaoOverrideIntensity:v10];

  id v11 = +[VKDebugSettings sharedSettings];
  LODWORD(v12) = 0.5;
  [v11 setSsaoOverrideRadius:v12];

  GEOConfigSetBOOL();
}

- (BOOL)shouldCaptureFrameToFile
{
  return self->_shouldCaptureFrameToFile;
}

- (void)setShouldCaptureFrameToFile:(BOOL)a3
{
  self->_shouldCaptureFrameToFile = a3;
}

- (void).cxx_destruct
{
}

@end