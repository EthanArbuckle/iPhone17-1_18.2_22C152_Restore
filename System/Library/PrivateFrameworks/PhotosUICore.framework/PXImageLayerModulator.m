@interface PXImageLayerModulator
+ (CGImage)_gainMapPlaceholderImage;
- ($644A41260DF4BF4C36F7F207412D02FF)options;
- (BOOL)_needsUpdate;
- (BOOL)animateGainMapAppearance;
- (BOOL)isDisplayingOpaqueContent;
- (BOOL)isDisplayingVideoComplement;
- (BOOL)isEnabled;
- (BOOL)revealsGainMapImage;
- (CAFilter)filter;
- (CALayer)filteredLayer;
- (CALayer)gainMapLayer;
- (CALayer)layer;
- (CGImage)gainMapImage;
- (NSString)layerFilterIntensityKeyPath;
- (PXGainMapAnimationDurationFilter)gainMapAnimationDurationFilter;
- (PXImageLayerModulator)init;
- (PXImageLayerModulator)initWithOptions:(id *)a3;
- (double)intensity;
- (double)intensityAnimationDuration;
- (float)gainMapValue;
- (float)hdrGain;
- (int64_t)filterType;
- (void)_addFilterToLayer:(id)a3;
- (void)_invalidateFilter;
- (void)_invalidateFilterInput;
- (void)_invalidateFilterIntensity;
- (void)_invalidateFilteredLayer;
- (void)_invalidateGainMapAppearance;
- (void)_invalidateGainMapVisibility;
- (void)_removeFilterFromLayer:(id)a3;
- (void)_setNeedsUpdate;
- (void)_updateFilter;
- (void)_updateFilterInput;
- (void)_updateFilterIntensityIfNeeded;
- (void)_updateFilteredLayerIfNeeded;
- (void)_updateGainMapAppearance;
- (void)_updateGainMapVisibility;
- (void)_updateIfNeeded;
- (void)dealloc;
- (void)performChanges:(id)a3;
- (void)prepareForReuse;
- (void)setAnimateGainMapAppearance:(BOOL)a3;
- (void)setDisplayingOpaqueContent:(BOOL)a3;
- (void)setDisplayingVideoComplement:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFilter:(id)a3;
- (void)setFilterType:(int64_t)a3;
- (void)setFilteredLayer:(id)a3;
- (void)setGainMapAnimationDurationFilter:(id)a3;
- (void)setGainMapImage:(CGImage *)a3;
- (void)setGainMapImage:(CGImage *)a3 animated:(BOOL)a4;
- (void)setGainMapLayer:(id)a3;
- (void)setGainMapValue:(float)a3;
- (void)setHdrGain:(float)a3;
- (void)setIntensity:(double)a3;
- (void)setIntensityAnimationDuration:(double)a3;
- (void)setLayer:(id)a3;
- (void)setLayerFilterIntensityKeyPath:(id)a3;
- (void)setRevealsGainMapImage:(BOOL)a3;
@end

@implementation PXImageLayerModulator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gainMapAnimationDurationFilter, 0);
  objc_storeStrong((id *)&self->_gainMapLayer, 0);
  objc_storeStrong((id *)&self->_filteredLayer, 0);
  objc_storeStrong((id *)&self->_layerFilterIntensityKeyPath, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

- (double)intensity
{
  return self->_intensity;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setIntensityAnimationDuration:(double)a3
{
  self->_intensityAnimationDuration = a3;
}

- (double)intensityAnimationDuration
{
  return self->_intensityAnimationDuration;
}

- (void)setGainMapAnimationDurationFilter:(id)a3
{
}

- (PXGainMapAnimationDurationFilter)gainMapAnimationDurationFilter
{
  return self->_gainMapAnimationDurationFilter;
}

- (void)setAnimateGainMapAppearance:(BOOL)a3
{
  self->_animateGainMapAppearance = a3;
}

- (BOOL)animateGainMapAppearance
{
  return self->_animateGainMapAppearance;
}

- (CALayer)gainMapLayer
{
  return self->_gainMapLayer;
}

- (CALayer)filteredLayer
{
  return self->_filteredLayer;
}

- (void)setLayerFilterIntensityKeyPath:(id)a3
{
}

- (NSString)layerFilterIntensityKeyPath
{
  return self->_layerFilterIntensityKeyPath;
}

- (CAFilter)filter
{
  return self->_filter;
}

- (float)hdrGain
{
  return self->_hdrGain;
}

- (int64_t)filterType
{
  return self->_filterType;
}

- ($644A41260DF4BF4C36F7F207412D02FF)options
{
  long long v3 = *(_OWORD *)&self[3].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var4;
  *(_OWORD *)&retstr->var2 = v3;
  *(void *)&retstr->var4 = self[3].var3;
  return self;
}

- (BOOL)revealsGainMapImage
{
  return self->_revealsGainMapImage;
}

- (float)gainMapValue
{
  return self->_gainMapValue;
}

- (CGImage)gainMapImage
{
  return self->_gainMapImage;
}

- (BOOL)isDisplayingOpaqueContent
{
  return self->_displayingOpaqueContent;
}

- (BOOL)isDisplayingVideoComplement
{
  return self->_displayingVideoComplement;
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)_updateGainMapVisibility
{
  if (self->_needsUpdateFlags.gainMapVisibility)
  {
    self->_needsUpdateFlags.gainMapVisibility = 0;
    long long v3 = [(PXImageLayerModulator *)self gainMapImage];
    id v17 = [(PXImageLayerModulator *)self gainMapLayer];
    v4 = [v17 presentationLayer];
    v5 = [v4 contents];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [v17 contents];
    }
    v8 = v7;

    v9 = v3;
    v10 = [(PXImageLayerModulator *)self gainMapAnimationDurationFilter];
    [v10 output];
    double v12 = v11;

    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    if ([(PXImageLayerModulator *)self animateGainMapAppearance] && v12 > 0.0)
    {
      v13 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"contents"];
      [v13 setFromValue:v8];
      [v13 setToValue:v9];
      [v13 setDuration:v12];
      v14 = +[PXImageModulationSettings sharedInstance];
      v15 = [v14 gainMapAnimationTimingFunction];

      v16 = [MEMORY[0x1E4F39C10] functionWithName:v15];
      [v13 setTimingFunction:v16];

      [v17 addAnimation:v13 forKey:@"imageLayerContents"];
    }
    [v17 setContents:v9];
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (void)_invalidateGainMapVisibility
{
  self->_needsUpdateFlags.gainMapVisibility = 1;
  [(PXImageLayerModulator *)self _setNeedsUpdate];
}

- (void)_updateGainMapAppearance
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdateFlags.gainMapAppearance)
  {
    self->_needsUpdateFlags.gainMapAppearance = 0;
    long long v3 = [(PXImageLayerModulator *)self gainMapLayer];
    if (v3)
    {
      v4 = [(PXImageLayerModulator *)self filter];
      if ([(PXImageLayerModulator *)self revealsGainMapImage])
      {
        [v3 setCompositingFilter:*MEMORY[0x1E4F3A060]];
        [v3 setFilters:0];
        v8 = v4;
        uint64_t v9 = 0;
      }
      else
      {
        BOOL v5 = [(PXImageLayerModulator *)self isDisplayingOpaqueContent];
        v6 = (void *)MEMORY[0x1E4F3A2A0];
        if (!v5) {
          v6 = (void *)MEMORY[0x1E4F3A298];
        }
        [v3 setCompositingFilter:*v6];
        v12[0] = v4;
        id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
        [v3 setFilters:v7];

        v8 = v4;
        uint64_t v9 = 1;
      }
      [v8 setEnabled:v9];
      v10 = +[PXImageModulationSettings sharedInstance];
      if ([v10 showGainMapBorder])
      {
        id v11 = [MEMORY[0x1E4FB1618] whiteColor];
        objc_msgSend(v3, "setBorderColor:", objc_msgSend(v11, "CGColor"));

        [v3 setBorderWidth:15.0];
      }
    }
  }
}

- (void)_invalidateGainMapAppearance
{
  self->_needsUpdateFlags.gainMapAppearance = 1;
  [(PXImageLayerModulator *)self _setNeedsUpdate];
}

- (void)_updateFilterIntensityIfNeeded
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self->_needsUpdateFlags.filterIntensity)
  {
    self->_needsUpdateFlags.filterIntensity = 0;
    if ([(PXImageLayerModulator *)self filterType] == 3) {
      [(PXImageLayerModulator *)self gainMapLayer];
    }
    else {
    long long v3 = [(PXImageLayerModulator *)self filteredLayer];
    }
    uint64_t v4 = [(PXImageLayerModulator *)self layerFilterIntensityKeyPath];
    BOOL v5 = (void *)v4;
    if (!v3 || !v4)
    {
LABEL_30:

      return;
    }
    double v6 = 0.0;
    if (![(PXImageLayerModulator *)self isEnabled])
    {
LABEL_17:
      if ([(PXImageLayerModulator *)self filterType] == 2) {
        PXFloatByLinearlyInterpolatingFloats();
      }
      id v11 = [NSNumber numberWithDouble:v6];
      [(PXImageLayerModulator *)self intensityAnimationDuration];
      double v13 = v12;
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      if (v13 > 0.0)
      {
        v14 = [v3 presentationLayer];
        v15 = [v14 filters];
        if (v15)
        {
          v16 = [v3 presentationLayer];
          id v17 = [v16 valueForKeyPath:v5];
        }
        else
        {
          id v17 = [v3 valueForKeyPath:v5];
        }

        if (v17 && ([v17 isEqualToNumber:v11] & 1) == 0)
        {
          v18 = [MEMORY[0x1E4F39B48] animationWithKeyPath:v5];
          [v18 setFromValue:v17];
          [v18 setToValue:v11];
          [v18 setDuration:v13];
          [v3 addAnimation:v18 forKey:@"imageLayerModulatorIntensity"];
        }
      }
      [v3 setValue:v11 forKeyPath:v5];
      v19 = PLUIGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218754;
        v22 = self;
        __int16 v23 = 2112;
        v24 = v3;
        __int16 v25 = 2112;
        v26 = v11;
        __int16 v27 = 2112;
        v28 = v5;
        _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEBUG, "[ImageLayerModulator %p] layer:%@ setValue:%@ forKeyPath:%@", buf, 0x2Au);
      }

      [MEMORY[0x1E4F39CF8] commit];
      goto LABEL_30;
    }
    id v7 = +[PXImageModulationSettings sharedInstance];
    [(PXImageLayerModulator *)self options];
    if ((unint64_t)(v20 - 1) >= 4)
    {
      if (v20) {
        goto LABEL_13;
      }
      [v7 SDRModulationIntensity];
    }
    else
    {
      [v7 HDRModulationIntensity];
    }
    double v6 = v8;
LABEL_13:
    if ([(PXImageLayerModulator *)self isDisplayingVideoComplement])
    {
      [v7 videoComplementModulationIntensity];
      if (v6 >= v9) {
        double v6 = v9;
      }
    }
    [(PXImageLayerModulator *)self intensity];
    double v6 = v6 * v10;

    goto LABEL_17;
  }
}

- (void)_invalidateFilterIntensity
{
  self->_needsUpdateFlags.filterIntensity = 1;
  [(PXImageLayerModulator *)self _setNeedsUpdate];
}

- (void)_updateFilteredLayerIfNeeded
{
  if (self->_needsUpdateFlags.filteredLayer)
  {
    self->_needsUpdateFlags.filteredLayer = 0;
    if ([(PXImageLayerModulator *)self isEnabled])
    {
      id v3 = [(PXImageLayerModulator *)self layer];
      [(PXImageLayerModulator *)self setFilteredLayer:v3];
    }
    else
    {
      [(PXImageLayerModulator *)self setFilteredLayer:0];
    }
  }
}

- (void)_invalidateFilteredLayer
{
  self->_needsUpdateFlags.filteredLayer = 1;
  [(PXImageLayerModulator *)self _setNeedsUpdate];
}

- (void)_updateFilter
{
  if (!self->_needsUpdateFlags.filter) {
    return;
  }
  self->_needsUpdateFlags.filter = 0;
  int64_t v3 = [(PXImageLayerModulator *)self filterType];
  switch(v3)
  {
    case 3:
      id v12 = objc_alloc(MEMORY[0x1E4F39BC0]);
      id v24 = (id)[v12 initWithType:*MEMORY[0x1E4F3A0B8]];
      BOOL v5 = (__CFString *)(id)*MEMORY[0x1E4F3A1F0];
      double v6 = +[PXImageModulationSettings sharedInstance];
      uint64_t v13 = [v6 EDRHeadroomUsageScheme];
      if (v13 != 1)
      {
        double v8 = 0.0;
        if (!v13)
        {
          v14 = (void *)MEMORY[0x1E4F8CC38];
          [(PXImageLayerModulator *)self hdrGain];
          double v16 = v15;
          [(PXImageLayerModulator *)self gainMapValue];
          [v14 gainMapHeadroomForHDRGain:v16 gainMapValue:v17];
          double v10 = log2(v18);
          goto LABEL_13;
        }
LABEL_16:
        v21 = objc_msgSend(NSNumber, "numberWithDouble:", (double)pow(2.0, v8));
        [v24 setValue:v21 forKey:*MEMORY[0x1E4F3A100]];

        break;
      }
LABEL_15:
      [v6 deviceMaximumEDRHeadroomStops];
      double v8 = v20;
      goto LABEL_16;
    case 2:
      id v11 = objc_alloc(MEMORY[0x1E4F39BC0]);
      id v24 = (id)[v11 initWithType:*MEMORY[0x1E4F3A040]];
      [v24 setValue:&unk_1F02DBB58 forKey:@"inputAmount"];
      BOOL v5 = @"inputBias";
      break;
    case 1:
      id v4 = objc_alloc(MEMORY[0x1E4F39BC0]);
      id v24 = (id)[v4 initWithType:*MEMORY[0x1E4F3A288]];
      BOOL v5 = (__CFString *)(id)*MEMORY[0x1E4F3A1F0];
      double v6 = +[PXImageModulationSettings sharedInstance];
      uint64_t v7 = [v6 EDRHeadroomUsageScheme];
      if (v7 != 1)
      {
        double v8 = 0.0;
        if (!v7)
        {
          [(PXImageLayerModulator *)self hdrGain];
          double v10 = v9;
LABEL_13:
          [v6 deviceMaximumEDRHeadroomStops];
          double v8 = fmin(v10, v19);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
      goto LABEL_15;
    default:
      BOOL v5 = 0;
      id v24 = 0;
      break;
  }
  v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"PXImageLayerModulatorFilter-%p", self);
  [v24 setName:v22];
  [v24 setEnabled:1];
  [(PXImageLayerModulator *)self setFilter:v24];
  if (v5)
  {
    __int16 v23 = (void *)[[NSString alloc] initWithFormat:@"filters.%@.%@", v22, v5];
    [(PXImageLayerModulator *)self setLayerFilterIntensityKeyPath:v23];
  }
  else
  {
    [(PXImageLayerModulator *)self setLayerFilterIntensityKeyPath:0];
  }
}

- (void)_invalidateFilter
{
  self->_needsUpdateFlags.filter = 1;
  [(PXImageLayerModulator *)self _setNeedsUpdate];
}

- (void)_updateFilterInput
{
  if (self->_needsUpdateFlags.filterInput)
  {
    self->_needsUpdateFlags.filterInput = 0;
    [(PXImageLayerModulator *)self options];
    [(PXImageLayerModulator *)self setFilterType:0];
    LODWORD(v3) = 0;
    [(PXImageLayerModulator *)self setHdrGain:v3];
  }
}

- (void)_invalidateFilterInput
{
  self->_needsUpdateFlags.filterInput = 1;
  [(PXImageLayerModulator *)self _setNeedsUpdate];
}

- (void)_updateIfNeeded
{
  if ([(PXImageLayerModulator *)self _needsUpdate])
  {
    BOOL isPerformingUpdates = self->_isPerformingUpdates;
    self->_BOOL isPerformingUpdates = 1;
    [(PXImageLayerModulator *)self _updateFilterInput];
    [(PXImageLayerModulator *)self _updateFilter];
    [(PXImageLayerModulator *)self _updateFilteredLayerIfNeeded];
    [(PXImageLayerModulator *)self _updateGainMapAppearance];
    [(PXImageLayerModulator *)self _updateGainMapVisibility];
    [(PXImageLayerModulator *)self _updateFilterIntensityIfNeeded];
    [(PXImageLayerModulator *)self setIntensityAnimationDuration:0.0];
    [(PXImageLayerModulator *)self setAnimateGainMapAppearance:0];
    self->_BOOL isPerformingUpdates = isPerformingUpdates;
  }
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingChanges && !self->_isPerformingUpdates)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PXImageLayerModulator.m", 347, @"neither insider -performChanges: block, nor performing updates" object file lineNumber description];
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.filterInput
      || self->_needsUpdateFlags.filter
      || self->_needsUpdateFlags.filteredLayer
      || self->_needsUpdateFlags.displayingVideoComplement
      || self->_needsUpdateFlags.filterIntensity
      || self->_needsUpdateFlags.gainMapAppearance
      || self->_needsUpdateFlags.gainMapVisibility;
}

- (void)performChanges:(id)a3
{
  BOOL isPerformingChanges = self->_isPerformingChanges;
  self->_BOOL isPerformingChanges = 1;
  (*((void (**)(id, PXImageLayerModulator *))a3 + 2))(a3, self);
  self->_BOOL isPerformingChanges = isPerformingChanges;
  if (!isPerformingChanges)
  {
    [(PXImageLayerModulator *)self _updateIfNeeded];
  }
}

- (void)prepareForReuse
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    BOOL v5 = NSStringFromSelector(a2);
    int v6 = 134218242;
    uint64_t v7 = self;
    __int16 v8 = 2112;
    float v9 = v5;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "[ImageLayerModulator %p] %@", (uint8_t *)&v6, 0x16u);
  }
  [(PXImageLayerModulator *)self setLayer:0];
  [(PXImageLayerModulator *)self setEnabled:0];
  [(PXImageLayerModulator *)self setIntensity:0.0];
  [(PXImageLayerModulator *)self setDisplayingVideoComplement:0];
  [(PXImageLayerModulator *)self setGainMapImage:0];
  [(PXImageLayerModulator *)self setGainMapValue:0.0];
}

- (void)setRevealsGainMapImage:(BOOL)a3
{
  if (self->_revealsGainMapImage != a3)
  {
    self->_revealsGainMapImage = a3;
    [(PXImageLayerModulator *)self _invalidateGainMapAppearance];
  }
}

- (void)setGainMapLayer:(id)a3
{
  BOOL v5 = (CALayer *)a3;
  if (self->_gainMapLayer != v5)
  {
    int v6 = v5;
    objc_storeStrong((id *)&self->_gainMapLayer, a3);
    [(PXImageLayerModulator *)self _invalidateGainMapVisibility];
    BOOL v5 = v6;
  }
}

- (void)setGainMapImage:(CGImage *)a3
{
}

- (void)setGainMapImage:(CGImage *)a3 animated:(BOOL)a4
{
  gainMapImage = self->_gainMapImage;
  if (gainMapImage != a3)
  {
    CGImageRelease(gainMapImage);
    self->_gainMapImage = a3;
    CGImageRetain(a3);
    [(PXImageLayerModulator *)self setAnimateGainMapAppearance:1];
    uint64_t v7 = [(PXImageLayerModulator *)self gainMapAnimationDurationFilter];
    [v7 setGainMapImageAvailable:a3 != 0];

    [(PXImageLayerModulator *)self _invalidateFilterInput];
    [(PXImageLayerModulator *)self _invalidateGainMapVisibility];
  }
}

- (void)setDisplayingOpaqueContent:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_displayingOpaqueContent != a3)
  {
    BOOL v3 = a3;
    self->_displayingOpaqueContent = a3;
    BOOL v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 134218240;
      uint64_t v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "[ImageLayerModulator %p] setDisplayingOpaqueContent:%d", (uint8_t *)&v6, 0x12u);
    }

    [(PXImageLayerModulator *)self _invalidateGainMapAppearance];
  }
}

- (void)setDisplayingVideoComplement:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_displayingVideoComplement != a3)
  {
    BOOL v3 = a3;
    self->_displayingVideoComplement = a3;
    BOOL v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 134218240;
      uint64_t v7 = self;
      __int16 v8 = 1024;
      BOOL v9 = v3;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEBUG, "[ImageLayerModulator %p] setDisplayingVideoComplement:%d", (uint8_t *)&v6, 0x12u);
    }

    [(PXImageLayerModulator *)self _invalidateFilterIntensity];
  }
}

- (void)setIntensity:(double)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_intensity != a3)
  {
    self->_double intensity = a3;
    id v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      double intensity = self->_intensity;
      int v6 = 134218240;
      uint64_t v7 = self;
      __int16 v8 = 2048;
      double v9 = intensity;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "[ImageLayerModulator %p] setIntensity:%f", (uint8_t *)&v6, 0x16u);
    }

    [(PXImageLayerModulator *)self _invalidateFilterIntensity];
  }
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    int v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = NSStringFromSelector(a2);
      int v8 = 134218498;
      double v9 = self;
      __int16 v10 = 2112;
      id v11 = v7;
      __int16 v12 = 1024;
      BOOL v13 = v3;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEBUG, "[ImageLayerModulator %p] %@ %i", (uint8_t *)&v8, 0x1Cu);
    }
    [(PXImageLayerModulator *)self _invalidateFilteredLayer];
    [(PXImageLayerModulator *)self _invalidateFilterIntensity];
  }
}

- (void)_removeFilterFromLayer:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(PXImageLayerModulator *)self filter];
  uint64_t v7 = (void *)v6;
  if (v5 && v6)
  {
    int64_t v8 = [(PXImageLayerModulator *)self filterType];
    if ((unint64_t)(v8 - 1) >= 2)
    {
      if (v8 == 3)
      {
        float v15 = [(PXImageLayerModulator *)self gainMapLayer];
        [v15 removeFromSuperlayer];

        [(PXImageLayerModulator *)self setGainMapLayer:0];
      }
    }
    else
    {
      double v9 = [v5 filters];
      __int16 v10 = (void *)[v9 mutableCopy];

      id v11 = [v7 name];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      long double v18 = __48__PXImageLayerModulator__removeFilterFromLayer___block_invoke;
      double v19 = &unk_1E5DC4128;
      SEL v23 = a2;
      double v20 = self;
      id v21 = v7;
      id v22 = v11;
      id v12 = v11;
      uint64_t v13 = [v10 indexOfObjectPassingTest:&v16];
      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v10, "removeObjectAtIndex:", v13, v16, v17, v18, v19, v20, v21, v22, v23);
        if ([v10 count]) {
          uint64_t v14 = v10;
        }
        else {
          uint64_t v14 = 0;
        }
        [v5 setFilters:v14];
      }
    }
  }
}

uint64_t __48__PXImageLayerModulator__removeFilterFromLayer___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 48)];

  return v4;
}

- (void)_addFilterToLayer:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PXImageLayerModulator *)self filter];
  uint64_t v6 = (void *)v5;
  if (v4 && v5)
  {
    int64_t v7 = [(PXImageLayerModulator *)self filterType];
    if ((unint64_t)(v7 - 1) < 2)
    {
      int64_t v8 = [v4 filters];
      id v9 = v8;
      if (v8)
      {
        uint64_t v10 = [v8 arrayByAddingObject:v6];
      }
      else
      {
        v21[0] = v6;
        uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      }
      uint64_t v17 = (void *)v10;
      [v4 setFilters:v10];

      goto LABEL_10;
    }
    if (v7 == 3)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
      [v9 setCompositingFilter:*MEMORY[0x1E4F3A2A0]];
      id v11 = [(PXImageLayerModulator *)self filter];
      double v20 = v11;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
      [v9 setFilters:v12];

      long double v18 = @"onOrderIn";
      uint64_t v13 = objc_opt_new();
      double v19 = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      [v9 setActions:v14];

      float v15 = [(PXImageLayerModulator *)self filteredLayer];
      [v15 addSublayer:v9];

      [(PXImageLayerModulator *)self setGainMapLayer:v9];
      uint64_t v16 = objc_alloc_init(PXGainMapAnimationDurationFilter);
      [(PXImageLayerModulator *)self setGainMapAnimationDurationFilter:v16];

LABEL_10:
    }
  }
}

- (void)setFilteredLayer:(id)a3
{
  id v4 = (CALayer *)a3;
  filteredLayer = self->_filteredLayer;
  if (filteredLayer != v4)
  {
    id v9 = v4;
    uint64_t v6 = v4;
    int64_t v7 = self->_filteredLayer;
    self->_filteredLayer = v6;
    int64_t v8 = filteredLayer;

    [(PXImageLayerModulator *)self _removeFilterFromLayer:v8];
    [(PXImageLayerModulator *)self _addFilterToLayer:v6];

    [(PXImageLayerModulator *)self _invalidateFilterIntensity];
    [(PXImageLayerModulator *)self _invalidateGainMapAppearance];
    id v4 = v9;
  }
}

- (void)setGainMapValue:(float)a3
{
}

- (void)setHdrGain:(float)a3
{
}

- (void)setFilterType:(int64_t)a3
{
  if (self->_filterType != a3)
  {
    uint64_t v5 = [(PXImageLayerModulator *)self filteredLayer];
    [(PXImageLayerModulator *)self _removeFilterFromLayer:v5];

    self->_filterType = a3;
    [(PXImageLayerModulator *)self _invalidateFilter];
  }
}

- (void)setFilter:(id)a3
{
  id v9 = (CAFilter *)a3;
  uint64_t v5 = self->_filter;
  if (v5 == v9)
  {
  }
  else
  {
    char v6 = [(CAFilter *)v9 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      int64_t v7 = [(PXImageLayerModulator *)self filteredLayer];
      [(PXImageLayerModulator *)self _removeFilterFromLayer:v7];

      objc_storeStrong((id *)&self->_filter, a3);
      int64_t v8 = [(PXImageLayerModulator *)self filteredLayer];
      [(PXImageLayerModulator *)self _addFilterToLayer:v8];

      [(PXImageLayerModulator *)self _invalidateFilterIntensity];
      [(PXImageLayerModulator *)self _invalidateGainMapAppearance];
    }
  }
}

- (void)setLayer:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v6 = (CALayer *)a3;
  if (self->_layer != v6)
  {
    objc_storeStrong((id *)&self->_layer, a3);
    int64_t v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int64_t v8 = NSStringFromSelector(a2);
      int v9 = 134218498;
      uint64_t v10 = self;
      __int16 v11 = 2112;
      id v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEBUG, "[ImageLayerModulator %p] %@ %@", (uint8_t *)&v9, 0x20u);
    }
    [(PXImageLayerModulator *)self _invalidateFilteredLayer];
  }
}

- (void)dealloc
{
  CGImageRelease(self->_gainMapImage);
  v3.receiver = self;
  v3.super_class = (Class)PXImageLayerModulator;
  [(PXImageLayerModulator *)&v3 dealloc];
}

- (PXImageLayerModulator)initWithOptions:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PXImageLayerModulator;
  id v4 = [(PXImageLayerModulator *)&v10 init];
  uint64_t v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->var0;
    long long v7 = *(_OWORD *)&a3->var2;
    *(void *)&v4->_options.fallbackHdrGain = *(void *)&a3->var4;
    *(_OWORD *)&v4->_options.contentFormat = v6;
    *(_OWORD *)&v4->_options.hdrGain = v7;
    v4->_displayingOpaqueContent = 1;
    if (a3->var0 == 2)
    {
      int64_t v8 = (CGImage *)[(id)objc_opt_class() _gainMapPlaceholderImage];
      v5->_gainMapImage = CGImageRetain(v8);
    }
    v5->_needsUpdateFlags.filterInput = 1;
    v5->_needsUpdateFlags.filterIntensity = 1;
  }
  return v5;
}

- (PXImageLayerModulator)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXImageLayerModulator.m", 67, @"%s is not available as initializer", "-[PXImageLayerModulator init]");

  abort();
}

+ (CGImage)_gainMapPlaceholderImage
{
  if (_gainMapPlaceholderImage_onceToken != -1) {
    dispatch_once(&_gainMapPlaceholderImage_onceToken, &__block_literal_global_200008);
  }
  return (CGImage *)_gainMapPlaceholderImage_placeholderImage;
}

CGImageRef __49__PXImageLayerModulator__gainMapPlaceholderImage__block_invoke()
{
  CGImageRef result = PXImageCreateBlackPlaceholderImageWithSize();
  _gainMapPlaceholderImage_placeholderImage = (uint64_t)result;
  return result;
}

@end