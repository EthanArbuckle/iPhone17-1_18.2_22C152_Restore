@interface NTKComplicationController
+ (BOOL)_acceptsComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5;
+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4;
+ (BOOL)_isLegacy;
+ (Class)_controllerClassForComplicationType:(unint64_t)a3 family:(int64_t)a4 device:(id)a5 resolvedFamily:(int64_t *)a6;
+ (Class)controllerClassForComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5;
+ (id)DEPRECATEDControllerForComplication:(id)a3 withLegacyDisplay:(id)a4 forDevice:(id)a5;
+ (id)_newOrCachedControllerOfClass:(Class)a3 complication:(id)a4 variant:(id)a5 device:(id)a6;
+ (id)controllerForComplication:(id)a3 variant:(id)a4 device:(id)a5;
- (BOOL)hasTapAction;
- (BOOL)isFaceZooming;
- (BOOL)showsLockedUI;
- (BOOL)wantsLegacyDisplay;
- (CDComplicationDisplay)legacyDisplay;
- (CLKDevice)device;
- (Class)richComplicationDisplayViewClass;
- (NSDate)pauseDate;
- (NTKComplication)complication;
- (NTKComplicationController)initWithComplication:(id)a3 variant:(id)a4 device:(id)a5;
- (id)_initWithComplication:(id)a3 legacyDisplay:(id)a4 forDevice:(id)a5;
- (id)complicationApplicationIdentifier;
- (id)displayPropertiesForDisplayWrapper:(id)a3;
- (id)invalidationHandler;
- (int64_t)animationMode;
- (int64_t)cachingMode;
- (int64_t)complicationFamily;
- (int64_t)effectiveFaceDataMode;
- (int64_t)updatingMode;
- (void)_openApp:(id)a3 withURL:(id)a4 forDisplayWrapper:(id)a5 result:(id)a6;
- (void)_openAppWithURL:(id)a3 forDisplayWrapper:(id)a4;
- (void)_openUserActivity:(id)a3 forApp:(id)a4 forDisplayWrapper:(id)a5 result:(id)a6;
- (void)_updateActive;
- (void)_updateEffectiveAnimationMode;
- (void)_updateEffectiveCachingMode;
- (void)_updateEffectiveFaceDataMode;
- (void)_updateEffectiveUpdatingMode;
- (void)_updateInternalModes:(BOOL)a3;
- (void)activate;
- (void)addDataModeAssertion:(id)a3;
- (void)addDisplayWrapper:(id)a3;
- (void)addDisplayWrapper:(id)a3 withDisplayProperties:(id)a4;
- (void)deactivate;
- (void)dealloc;
- (void)enumerateDisplayWrappersWithBlock:(id)a3;
- (void)removeDataModeAssertion:(id)a3;
- (void)removeDisplayWrapper:(id)a3;
- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4;
- (void)setFaceZooming:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPauseDate:(id)a3;
- (void)setShowsLockedUI:(BOOL)a3;
- (void)setTouchObserver:(id)a3 forDisplayWrapper:(id)a4;
- (void)updateDataModeAssertion:(id)a3;
- (void)updatePropertiesForDisplayWrapper:(id)a3 withBlock:(id)a4;
@end

@implementation NTKComplicationController

+ (id)controllerForComplication:(id)a3 variant:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = [v9 family];
  uint64_t v14 = v15;
  uint64_t v11 = objc_msgSend(a1, "_controllerClassForComplicationType:family:device:resolvedFamily:", objc_msgSend(v8, "complicationType"), v15, v10, &v15);
  if (!v11)
  {
    while (!+[NTKLocalBundleTimelineComplicationController acceptsComplication:v8 family:v14 forDevice:v10])
    {
      if ((NTKFallbackComplicationFamilyForFamily(v14, &v14) & 1) == 0) {
        goto LABEL_6;
      }
    }
    uint64_t v11 = objc_opt_class();
    if (v11) {
      goto LABEL_7;
    }
LABEL_6:
    uint64_t v11 = objc_opt_class();
  }
LABEL_7:
  v12 = (void *)[a1 _newOrCachedControllerOfClass:v11 complication:v8 variant:v9 device:v10];

  return v12;
}

+ (Class)controllerClassForComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  return (Class)[a1 _controllerClassForComplicationType:a3 family:a4 device:a5 resolvedFamily:0];
}

+ (Class)_controllerClassForComplicationType:(unint64_t)a3 family:(int64_t)a4 device:(id)a5 resolvedFamily:(int64_t *)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v31 = a4;
  id v8 = a5;
  long long v9 = 0uLL;
  do
  {
    if (a6) {
      *a6 = v31;
    }
    long long v29 = v9;
    long long v30 = v9;
    long long v27 = v9;
    long long v28 = v9;
    if (_NonLegacyControllerClasses_onceToken != -1) {
      dispatch_once(&_NonLegacyControllerClasses_onceToken, &__block_literal_global_160_0);
    }
    id v10 = (id)_NonLegacyControllerClasses___classes;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
LABEL_8:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
        if ([v15 _acceptsComplicationType:a3 family:v31 forDevice:v8]) {
          goto LABEL_26;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v33 count:16];
          if (v12) {
            goto LABEL_8;
          }
          break;
        }
      }
    }

    char v16 = NTKFallbackComplicationFamilyForFamily(v31, &v31);
    long long v9 = 0uLL;
  }
  while ((v16 & 1) != 0);
  if (NTKIsRichComplicationFamily(v31))
  {
    id v17 = 0;
    goto LABEL_28;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  _LegacyControllerClasses();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v10 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (!v18)
  {
LABEL_25:
    id v17 = 0;
    goto LABEL_27;
  }
  uint64_t v19 = v18;
  uint64_t v20 = *(void *)v24;
LABEL_19:
  uint64_t v21 = 0;
  while (1)
  {
    if (*(void *)v24 != v20) {
      objc_enumerationMutation(v10);
    }
    uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * v21);
    if (objc_msgSend(v15, "_acceptsComplicationType:forDevice:", a3, v8, (void)v23)) {
      break;
    }
    if (v19 == ++v21)
    {
      uint64_t v19 = [v10 countByEnumeratingWithState:&v23 objects:v32 count:16];
      if (v19) {
        goto LABEL_19;
      }
      goto LABEL_25;
    }
  }
LABEL_26:
  id v17 = v15;
LABEL_27:

LABEL_28:
  return (Class)v17;
}

+ (id)_newOrCachedControllerOfClass:(Class)a3 complication:(id)a4 variant:(id)a5 device:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __87__NTKComplicationController__newOrCachedControllerOfClass_complication_variant_device___block_invoke;
  v22 = &unk_1E62C8DD0;
  Class v26 = a3;
  id v12 = v9;
  id v23 = v12;
  id v13 = v10;
  id v24 = v13;
  id v14 = v11;
  id v25 = v14;
  uint64_t v15 = (void (**)(void))_Block_copy(&v19);
  if ([(objc_class *)a3 _isLegacy])
  {
    char v16 = v15[2](v15);
  }
  else
  {
    id v17 = +[NTKComplicationControllerCache sharedCache];
    char v16 = [v17 controllerForComplication:v12 variant:v13 device:v14 create:v15];
  }
  return v16;
}

id __87__NTKComplicationController__newOrCachedControllerOfClass_complication_variant_device___block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc(*(Class *)(a1 + 56)) initWithComplication:*(void *)(a1 + 32) variant:*(void *)(a1 + 40) device:*(void *)(a1 + 48)];
  return v1;
}

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return 0;
}

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  return 0;
}

+ (BOOL)_isLegacy
{
  return 1;
}

- (BOOL)wantsLegacyDisplay
{
  v2 = objc_opt_class();
  return [v2 _isLegacy];
}

- (Class)richComplicationDisplayViewClass
{
  return 0;
}

+ (id)DEPRECATEDControllerForComplication:(id)a3 withLegacyDisplay:(id)a4 forDevice:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v7 complicationType];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = _LegacyControllerClasses();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v20 != v14) {
        objc_enumerationMutation(v11);
      }
      char v16 = *(void **)(*((void *)&v19 + 1) + 8 * v15);
      if (objc_msgSend(v16, "_acceptsComplicationType:forDevice:", v10, v9, (void)v19)) {
        break;
      }
      if (v13 == ++v15)
      {
        uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    if (v16) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  char v16 = objc_opt_class();
LABEL_12:
  id v17 = (void *)[objc_alloc((Class)v16) _initWithComplication:v7 legacyDisplay:v8 forDevice:v9];

  return v17;
}

- (NTKComplicationController)initWithComplication:(id)a3 variant:(id)a4 device:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)NTKComplicationController;
  uint64_t v12 = [(NTKComplicationController *)&v23 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_complication, a3);
    v13->_complicationFamily = [v10 family];
    uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    displayWrappers = v13->_displayWrappers;
    v13->_displayWrappers = v14;

    uint64_t v16 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    displayWrappersToDisplayProperties = v13->_displayWrappersToDisplayProperties;
    v13->_displayWrappersToDisplayProperties = (NSMapTable *)v16;

    uint64_t v18 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    displayWrappersToTouchObservers = v13->_displayWrappersToTouchObservers;
    v13->_displayWrappersToTouchObservers = (NSMapTable *)v18;

    objc_storeStrong((id *)&v13->_device, a5);
    uint64_t v20 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    assertions = v13->_assertions;
    v13->_assertions = (NSHashTable *)v20;

    [(NTKComplicationController *)v13 _updateInternalModes:1];
  }

  return v13;
}

- (id)_initWithComplication:(id)a3 legacyDisplay:(id)a4 forDevice:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = *MEMORY[0x1E4F1DB30];
  double v11 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  double v12 = *MEMORY[0x1E4FB2848];
  double v13 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v14 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v15 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  id v16 = a3;
  id v17 = +[NTKComplicationMetrics metricsWithSize:safeAreaInsets:cornerRadius:opaque:](NTKComplicationMetrics, "metricsWithSize:safeAreaInsets:cornerRadius:opaque:", 0, v10, v11, v12, v13, v14, v15, 0.0);
  uint64_t v18 = +[NTKComplicationVariant variantWithFamily:-1 metrics:v17];
  long long v19 = [(NTKComplicationController *)self initWithComplication:v16 variant:v18 device:v9];

  if (v19)
  {
    objc_storeStrong((id *)&v19->_device, a5);
    objc_storeWeak((id *)&v19->_legacyDisplayDEPRECATED, v8);
    [(NTKComplicationController *)v19 _configureForLegacyDisplay:v8];
  }

  return v19;
}

- (void)_updateEffectiveCachingMode
{
  int64_t v2 = 2;
  switch(self->_effectiveFaceDataMode)
  {
    case 0:
      int64_t v2 = 0;
      goto LABEL_5;
    case 1:
      goto LABEL_5;
    case 2:
    case 3:
      int64_t v2 = 2 * self->_hasGoneLive;
      goto LABEL_5;
    case 4:
    case 5:
      int64_t v2 = 1;
LABEL_5:
      self->_cachingMode = v2;
      break;
    default:
      return;
  }
}

- (void)_updateEffectiveUpdatingMode
{
  unint64_t effectiveFaceDataMode = self->_effectiveFaceDataMode;
  if (effectiveFaceDataMode <= 5) {
    self->_updatingMode = qword_1BC8A2220[effectiveFaceDataMode];
  }
}

- (void)_updateEffectiveAnimationMode
{
  unint64_t effectiveFaceDataMode = self->_effectiveFaceDataMode;
  if (effectiveFaceDataMode <= 5)
  {
    if (((1 << effectiveFaceDataMode) & 0x39) != 0)
    {
      int64_t v3 = 0;
    }
    else
    {
      int64_t v3 = 1;
      if (self->_faceZooming) {
        int64_t v3 = 2;
      }
    }
    self->_animationMode = v3;
  }
}

- (void)_updateEffectiveFaceDataMode
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int64_t v3 = NSAllMapTableKeys(self->_displayWrappersToDisplayProperties);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = [(NTKComplicationController *)self displayPropertiesForDisplayWrapper:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        uint64_t v6 = _MaxFaceDataMode(v6, [v9 faceDataMode]);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v10 = self->_assertions;
  uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v6 = _MaxFaceDataMode(v6, objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * j), "dataMode", (void)v15));
      }
      uint64_t v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  self->_unint64_t effectiveFaceDataMode = v6;
}

- (void)_updateInternalModes:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unint64_t effectiveFaceDataMode = self->_effectiveFaceDataMode;
  [(NTKComplicationController *)self _updateEffectiveFaceDataMode];
  unint64_t v6 = self->_effectiveFaceDataMode;
  BOOL v7 = effectiveFaceDataMode == v6 && !v3;
  unint64_t v8 = effectiveFaceDataMode;
  if (!v7)
  {
    if (v6 <= 5 && ((0x33u >> v6) & 1) != 0) {
      self->_hasGoneLive = 0x1010100uLL >> (8 * v6);
    }
    int64_t cachingMode = self->_cachingMode;
    int64_t updatingMode = self->_updatingMode;
    int64_t animationMode = self->_animationMode;
    [(NTKComplicationController *)self _updateEffectiveCachingMode];
    [(NTKComplicationController *)self _updateEffectiveUpdatingMode];
    [(NTKComplicationController *)self _updateEffectiveAnimationMode];
    if (updatingMode != self->_updatingMode) {
      [(NTKComplicationController *)self _applyUpdatingMode];
    }
    if (cachingMode != self->_cachingMode) {
      [(NTKComplicationController *)self _applyCachingMode];
    }
    if (animationMode != self->_animationMode) {
      [(NTKComplicationController *)self _applyAnimationMode];
    }
    unint64_t v8 = self->_effectiveFaceDataMode;
  }
  if (effectiveFaceDataMode != v8 || v3)
  {
    uint64_t v13 = (v8 > 5) | (6u >> v8) & 1;
    if (((effectiveFaceDataMode > 5) | (6u >> effectiveFaceDataMode) & 1) != v13 || v3)
    {
      long long v15 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        long long v16 = [(NTKComplicationController *)self complication];
        int64_t v17 = self->_effectiveFaceDataMode;
        int v18 = 138413058;
        long long v19 = v16;
        __int16 v20 = 2048;
        unint64_t v21 = effectiveFaceDataMode;
        __int16 v22 = 2048;
        int64_t v23 = v17;
        __int16 v24 = 1024;
        int v25 = v13;
        _os_log_impl(&dword_1BC5A9000, v15, OS_LOG_TYPE_DEFAULT, "updateIsComplicationActive: complication: %@ from %ld to %ld. isActive: %d", (uint8_t *)&v18, 0x26u);
      }
      [(NTKComplicationController *)self _updateIsComplicationActive:v13];
    }
  }
}

- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v6)
  {
    displayWrappersToDisplayProperties = self->_displayWrappersToDisplayProperties;
    unint64_t v8 = (void *)[v9 copy];
    [(NSMapTable *)displayWrappersToDisplayProperties setObject:v8 forKey:v6];

    objc_msgSend(v6, "setTapEnabled:", objc_msgSend(v9, "tapEnabled"));
    objc_msgSend(v6, "setTapAnimationEnabled:", objc_msgSend(v9, "defaultTapAnimationEnabled"));
    objc_msgSend(v6, "setPaused:", objc_msgSend(v9, "faceDataMode") != 1);
    [v6 setTapInternalInputEnabled:1];
    [(NTKComplicationController *)self _updateInternalModes:0];
  }
}

- (id)displayPropertiesForDisplayWrapper:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = [(NSMapTable *)self->_displayWrappersToDisplayProperties objectForKey:v4];

  return v5;
}

- (void)updatePropertiesForDisplayWrapper:(id)a3 withBlock:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = a3;
  unint64_t v8 = [(NTKComplicationController *)self displayPropertiesForDisplayWrapper:v7];
  if (!v8) {
    unint64_t v8 = objc_opt_new();
  }
  id v11 = v8;
  id v9 = (void *)[v8 mutableCopy];
  v6[2](v6, v9);

  double v10 = (void *)[v9 copy];
  [(NTKComplicationController *)self setDisplayProperties:v10 forDisplayWrapper:v7];
}

- (void)setFaceZooming:(BOOL)a3
{
  if (self->_faceZooming != a3)
  {
    self->_faceZooming = a3;
    [(NTKComplicationController *)self _updateInternalModes:1];
  }
}

- (void)deactivate
{
  if (self->_active)
  {
    self->_hasGoneLive = 0;
    [(NTKComplicationController *)self _deactivate];
    self->_active = 0;
  }
}

- (void)activate
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BC5A9000, a2, OS_LOG_TYPE_DEBUG, "Activating controller %@", (uint8_t *)&v2, 0xCu);
}

- (void)dealloc
{
  [(NTKComplicationController *)self deactivate];
  v3.receiver = self;
  v3.super_class = (Class)NTKComplicationController;
  [(NTKComplicationController *)&v3 dealloc];
}

- (void)addDisplayWrapper:(id)a3 withDisplayProperties:(id)a4
{
  displayWrappersToDisplayProperties = self->_displayWrappersToDisplayProperties;
  id v7 = a4;
  id v9 = a3;
  unint64_t v8 = (void *)[v7 copy];
  [(NSMapTable *)displayWrappersToDisplayProperties setObject:v8 forKey:v9];

  [(NTKComplicationController *)self addDisplayWrapper:v9];
  [(NTKComplicationController *)self setDisplayProperties:v7 forDisplayWrapper:v9];
}

- (void)addDisplayWrapper:(id)a3
{
  id v4 = a3;
  if (![(NSMutableArray *)self->_displayWrappers count]) {
    [(NTKComplicationController *)self activate];
  }
  [(NSMutableArray *)self->_displayWrappers addObject:v4];
  if ([(NSMutableArray *)self->_displayWrappers count] == 1)
  {
    uint64_t v5 = [(NTKComplicationController *)self legacyDisplay];
    [(NTKComplicationController *)self _configureForLegacyDisplay:v5];
  }
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__NTKComplicationController_addDisplayWrapper___block_invoke;
  v11[3] = &unk_1E62C8DF8;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  [v4 setTouchDownHandler:v11];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__NTKComplicationController_addDisplayWrapper___block_invoke_2;
  v8[3] = &unk_1E62C8DF8;
  objc_copyWeak(&v9, &location);
  objc_copyWeak(&v10, &from);
  [v4 setTouchUpInsideHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__NTKComplicationController_addDisplayWrapper___block_invoke_3;
  v6[3] = &unk_1E62C8E20;
  objc_copyWeak(&v7, &location);
  [v4 setRenderStatsHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __47__NTKComplicationController_addDisplayWrapper___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (id *)(a1 + 32);
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didTouchDownInView:v4];

  id v6 = [WeakRetained[5] objectForKey:v5];
  [v6 complicationController:WeakRetained touchedDownForDisplayWrapper:v5];
  if ([v5 tapAnimationEnabled] && (objc_msgSend(v5, "tapInternalInputEnabled") & 1) == 0) {
    [v5 setHighlighted:1];
  }
}

void __47__NTKComplicationController_addDisplayWrapper___block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v3 = (id *)(a1 + 32);
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didTouchUpInsideView:v4];

  [WeakRetained performTapActionForDisplayWrapper:v5];
  id v6 = [WeakRetained[5] objectForKey:v5];
  [v6 complicationController:WeakRetained touchedUpForDisplayWrapper:v5];
  if ([v5 tapAnimationEnabled] && (objc_msgSend(v5, "tapInternalInputEnabled") & 1) == 0) {
    [v5 setHighlighted:0];
  }
}

void __47__NTKComplicationController_addDisplayWrapper___block_invoke_3(uint64_t a1, void *a2, double a3, double a4)
{
  id v6 = (id *)(a1 + 32);
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _handleRenderStatsForDisplayWrapper:v7 withTime:a3 cost:a4];
}

- (void)removeDisplayWrapper:(id)a3
{
  displayWrappers = self->_displayWrappers;
  id v5 = a3;
  [(NSMutableArray *)displayWrappers removeObjectIdenticalTo:v5];
  [(NSMapTable *)self->_displayWrappersToDisplayProperties removeObjectForKey:v5];
  [(NSMapTable *)self->_displayWrappersToTouchObservers removeObjectForKey:v5];
  [v5 setTouchUpInsideHandler:0];

  [(NTKComplicationController *)self _updateInternalModes:0];
  if (![(NSMutableArray *)self->_displayWrappers count]) {
    [(NTKComplicationController *)self _updateActive];
  }
  if ([(NSMutableArray *)self->_displayWrappers count] == 1)
  {
    id v6 = [(NTKComplicationController *)self legacyDisplay];
    [(NTKComplicationController *)self _configureForLegacyDisplay:v6];
  }
}

- (void)enumerateDisplayWrappersWithBlock:(id)a3
{
  id v4 = a3;
  displayWrappers = self->_displayWrappers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__NTKComplicationController_enumerateDisplayWrappersWithBlock___block_invoke;
  v7[3] = &unk_1E62C8E48;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)displayWrappers enumerateObjectsUsingBlock:v7];
}

uint64_t __63__NTKComplicationController_enumerateDisplayWrappersWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CDComplicationDisplay)legacyDisplay
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_legacyDisplayDEPRECATED);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
  }
  else
  {
    id v6 = [(NSMutableArray *)self->_displayWrappers firstObject];
    id v5 = [v6 display];
  }
  return (CDComplicationDisplay *)v5;
}

- (BOOL)hasTapAction
{
  return 0;
}

- (void)_openAppWithURL:(id)a3 forDisplayWrapper:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NTKComplicationController *)self complicationApplicationIdentifier];
  [(NTKComplicationController *)self _openApp:v8 withURL:v7 forDisplayWrapper:v6 result:0];
}

- (void)_openApp:(id)a3 withURL:(id)a4 forDisplayWrapper:(id)a5 result:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  double v14 = [(NTKComplicationController *)self displayPropertiesForDisplayWrapper:v11];
  id v15 = [v14 launchLocation];

  [v11 willPerformAppLaunchForComplication:self];
  NTKLaunchApp(v12);
}

- (void)_openUserActivity:(id)a3 forApp:(id)a4 forDisplayWrapper:(id)a5 result:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(NTKComplicationController *)self displayPropertiesForDisplayWrapper:a5];
  id v14 = [v13 launchLocation];

  NTKOpenUserActivity(v12, v11, v14, v10);
}

- (id)complicationApplicationIdentifier
{
  return 0;
}

- (void)_updateActive
{
  BOOL active = self->_active;
  uint64_t v4 = [(NSMutableArray *)self->_displayWrappers count];
  if (active)
  {
    if (!v4 && ![(NSHashTable *)self->_assertions count])
    {
      [(NTKComplicationController *)self deactivate];
    }
  }
  else if (v4 || [(NSHashTable *)self->_assertions count])
  {
    [(NTKComplicationController *)self activate];
  }
}

- (void)addDataModeAssertion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(NSHashTable *)self->_assertions addObject:v4];

  [(NTKComplicationController *)self _updateActive];
  [(NTKComplicationController *)self _updateInternalModes:0];
}

- (void)updateDataModeAssertion:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(NTKComplicationController *)self _updateInternalModes:0];
}

- (void)removeDataModeAssertion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(NSHashTable *)self->_assertions removeObject:v4];

  [(NTKComplicationController *)self _updateActive];
  [(NTKComplicationController *)self _updateInternalModes:0];
}

- (void)setTouchObserver:(id)a3 forDisplayWrapper:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(NSMutableArray *)self->_displayWrappers containsObject:v6]) {
    [(NSMapTable *)self->_displayWrappersToTouchObservers setObject:v7 forKey:v6];
  }
}

- (NTKComplication)complication
{
  return self->_complication;
}

- (int64_t)complicationFamily
{
  return self->_complicationFamily;
}

- (CLKDevice)device
{
  return self->_device;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (NSDate)pauseDate
{
  return self->_pauseDate;
}

- (void)setPauseDate:(id)a3
{
}

- (BOOL)showsLockedUI
{
  return self->_showsLockedUI;
}

- (void)setShowsLockedUI:(BOOL)a3
{
  self->_showsLockedUI = a3;
}

- (BOOL)isFaceZooming
{
  return self->_faceZooming;
}

- (int64_t)cachingMode
{
  return self->_cachingMode;
}

- (int64_t)updatingMode
{
  return self->_updatingMode;
}

- (int64_t)animationMode
{
  return self->_animationMode;
}

- (int64_t)effectiveFaceDataMode
{
  return self->_effectiveFaceDataMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pauseDate, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_complication, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
  objc_storeStrong((id *)&self->_displayWrappersToTouchObservers, 0);
  objc_storeStrong((id *)&self->_displayWrappersToDisplayProperties, 0);
  objc_storeStrong((id *)&self->_displayWrappers, 0);
  objc_destroyWeak((id *)&self->_legacyDisplayDEPRECATED);
}

@end