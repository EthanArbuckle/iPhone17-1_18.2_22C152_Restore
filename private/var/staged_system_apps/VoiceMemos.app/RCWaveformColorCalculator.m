@interface RCWaveformColorCalculator
- (RCWaveformColorCalculator)initWithDataProvider:(id)a3;
- (id)_color:(id)a3 adjustedForDisplayMode:(int64_t)a4 traitCollection:(id)a5;
- (id)_dynamicLiveWaveformColorForDisplayMode:(int64_t)a3 traitCollection:(id)a4;
- (id)resolvedColorWithLiveWaveform:(BOOL)a3 selected:(BOOL)a4 muted:(BOOL)a5 trimMode:(BOOL)a6;
- (void)_resolveAndCacheColorsWithTraitCollection:(id)a3;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation RCWaveformColorCalculator

- (RCWaveformColorCalculator)initWithDataProvider:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RCWaveformColorCalculator;
  v5 = [(RCWaveformColorCalculator *)&v16 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    resolvedColors = v5->_resolvedColors;
    v5->_resolvedColors = (NSMutableArray *)v6;

    id v8 = objc_storeWeak((id *)&v5->_dataProvider, v4);
    v9 = [v4 traitChangeObservable];
    v10 = self;
    v17 = v10;
    v11 = +[NSArray arrayWithObjects:&v17 count:1];
    id v12 = [v9 registerForTraitChanges:v11 withTarget:v5 action:"_traitCollectionDidChange:previousTraitCollection:"];

    v13 = [v4 traitEnvironment];
    v14 = [v13 traitCollection];
    [(RCWaveformColorCalculator *)v5 _resolveAndCacheColorsWithTraitCollection:v14];
  }
  return v5;
}

- (id)resolvedColorWithLiveWaveform:(BOOL)a3 selected:(BOOL)a4 muted:(BOOL)a5 trimMode:(BOOL)a6
{
  if (a3)
  {
    v7 = self->_resolvedLiveWaveformColor;
  }
  else
  {
    uint64_t v8 = 2;
    if (!a5) {
      uint64_t v8 = 0;
    }
    uint64_t v9 = v8 | a4;
    uint64_t v10 = 4;
    if (!a6) {
      uint64_t v10 = 0;
    }
    uint64_t v11 = v9 | v10;
    if ((v9 | (unint64_t)v10) >= (unint64_t)[(NSMutableArray *)self->_resolvedColors count])
    {
      id v12 = OSLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10016B4BC(v12);
      }

      v7 = +[UIColor systemFillColor];
    }
    else
    {
      v7 = [(NSMutableArray *)self->_resolvedColors objectAtIndexedSubscript:v11];
    }
  }

  return v7;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = [a3 traitCollection];
  -[RCWaveformColorCalculator _resolveAndCacheColorsWithTraitCollection:](self, "_resolveAndCacheColorsWithTraitCollection:");
}

- (void)_resolveAndCacheColorsWithTraitCollection:(id)a3
{
  id v15 = a3;
  id v4 = +[RCRecorderStyleProvider sharedStyleProvider];
  [(NSMutableArray *)self->_resolvedColors removeAllObjects];
  for (unint64_t i = 0; i != 8; ++i)
  {
    uint64_t v6 = [v4 waveformColorForSelected:i & 1 muted:(i >> 1) & 1 trimMode:(i >> 2) & 1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataProvider);
    uint64_t v8 = -[RCWaveformColorCalculator _color:adjustedForDisplayMode:traitCollection:](self, "_color:adjustedForDisplayMode:traitCollection:", v6, [WeakRetained waveformDisplayMode], v15);

    resolvedColors = self->_resolvedColors;
    uint64_t v10 = [v8 resolvedColorWithTraitCollection:v15];
    [(NSMutableArray *)resolvedColors addObject:v10];
  }
  id v11 = objc_loadWeakRetained((id *)&self->_dataProvider);
  id v12 = -[RCWaveformColorCalculator _dynamicLiveWaveformColorForDisplayMode:traitCollection:](self, "_dynamicLiveWaveformColorForDisplayMode:traitCollection:", [v11 waveformDisplayMode], v15);

  v13 = [v12 resolvedColorWithTraitCollection:v15];
  resolvedLiveWaveformColor = self->_resolvedLiveWaveformColor;
  self->_resolvedLiveWaveformColor = v13;
}

- (id)_color:(id)a3 adjustedForDisplayMode:(int64_t)a4 traitCollection:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = v7;
  uint64_t v10 = v9;
  if (!a4)
  {
    if ([v8 isUserInterfaceStyleDark]) {
      +[UIColor blackColor];
    }
    else {
    id v11 = +[UIColor whiteColor];
    }
    if (v9)
    {
      id v12 = [v9 colorWithAlphaComponent:0.8];

      uint64_t v10 = +[UIColor color:v11 byAddingColor:v12];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }

  return v10;
}

- (id)_dynamicLiveWaveformColorForDisplayMode:(int64_t)a3 traitCollection:(id)a4
{
  id v6 = a4;
  id v7 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v8 = [v7 waveformRecordingColor];
  id v9 = [(RCWaveformColorCalculator *)self _color:v8 adjustedForDisplayMode:a3 traitCollection:v6];

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolvedLiveWaveformColor, 0);
  objc_storeStrong((id *)&self->_resolvedColors, 0);

  objc_destroyWeak((id *)&self->_dataProvider);
}

@end