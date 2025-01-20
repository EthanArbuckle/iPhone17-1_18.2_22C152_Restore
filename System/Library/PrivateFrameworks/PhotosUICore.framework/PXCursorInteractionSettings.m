@interface PXCursorInteractionSettings
+ (PXCursorInteractionSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)enableCardLift;
- (BOOL)enableCardShadows;
- (BOOL)enableCuratedLibraryEffects;
- (BOOL)enableDaysEffect;
- (BOOL)enableDetailsEffect;
- (BOOL)enableGridLift;
- (BOOL)enableGridShadows;
- (double)allPhotosAspectFillPadding;
- (double)allPhotosAspectFitPadding;
- (double)animationDuration;
- (double)dampingRatio;
- (double)daysPadding;
- (double)monthsPadding;
- (double)paddingForZoomLevel:(int64_t)a3;
- (double)yearsPadding;
- (id)parentSettings;
- (int64_t)aspectFillAnimationStyle;
- (int64_t)aspectFitAnimationStyle;
- (int64_t)cardInteractionOptions;
- (int64_t)gridInteractionOptions;
- (int64_t)interactionOptionsForZoomLevel:(int64_t)a3 isAllPhotosAspectFit:(BOOL)a4;
- (void)setAllPhotosAspectFillPadding:(double)a3;
- (void)setAllPhotosAspectFitPadding:(double)a3;
- (void)setAnimationDuration:(double)a3;
- (void)setAspectFillAnimationStyle:(int64_t)a3;
- (void)setAspectFitAnimationStyle:(int64_t)a3;
- (void)setDampingRatio:(double)a3;
- (void)setDaysPadding:(double)a3;
- (void)setDefaultValues;
- (void)setEnableCardLift:(BOOL)a3;
- (void)setEnableCardShadows:(BOOL)a3;
- (void)setEnableCuratedLibraryEffects:(BOOL)a3;
- (void)setEnableDaysEffect:(BOOL)a3;
- (void)setEnableDetailsEffect:(BOOL)a3;
- (void)setEnableGridLift:(BOOL)a3;
- (void)setEnableGridShadows:(BOOL)a3;
- (void)setMonthsPadding:(double)a3;
- (void)setYearsPadding:(double)a3;
@end

@implementation PXCursorInteractionSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PXCursorInteractionSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PXCursorInteractionSettings *)self setDampingRatio:0.7];
  [(PXCursorInteractionSettings *)self setYearsPadding:8.0];
  [(PXCursorInteractionSettings *)self setMonthsPadding:8.0];
  [(PXCursorInteractionSettings *)self setDaysPadding:0.0];
  [(PXCursorInteractionSettings *)self setAllPhotosAspectFitPadding:8.0];
  [(PXCursorInteractionSettings *)self setAllPhotosAspectFillPadding:0.0];
  [(PXCursorInteractionSettings *)self setAspectFitAnimationStyle:1];
  [(PXCursorInteractionSettings *)self setAspectFillAnimationStyle:0];
  [(PXCursorInteractionSettings *)self setEnableGridShadows:0];
  [(PXCursorInteractionSettings *)self setEnableGridLift:1];
  [(PXCursorInteractionSettings *)self setEnableCardShadows:0];
  [(PXCursorInteractionSettings *)self setEnableCardLift:1];
  [(PXCursorInteractionSettings *)self setEnableCuratedLibraryEffects:0];
  [(PXCursorInteractionSettings *)self setEnableDetailsEffect:0];
  [(PXCursorInteractionSettings *)self setEnableDaysEffect:0];
}

- (void)setYearsPadding:(double)a3
{
  self->_yearsPadding = a3;
}

- (void)setMonthsPadding:(double)a3
{
  self->_monthsPadding = a3;
}

- (void)setEnableGridShadows:(BOOL)a3
{
  self->_enableGridShadows = a3;
}

- (void)setEnableGridLift:(BOOL)a3
{
  self->_enableGridLift = a3;
}

- (void)setEnableDetailsEffect:(BOOL)a3
{
  self->_enableDetailsEffect = a3;
}

- (void)setEnableDaysEffect:(BOOL)a3
{
  self->_enableDaysEffect = a3;
}

- (void)setEnableCuratedLibraryEffects:(BOOL)a3
{
  self->_enableCuratedLibraryEffects = a3;
}

- (void)setEnableCardShadows:(BOOL)a3
{
  self->_enableCardShadows = a3;
}

- (void)setEnableCardLift:(BOOL)a3
{
  self->_enableCardLift = a3;
}

- (void)setDaysPadding:(double)a3
{
  self->_daysPadding = a3;
}

- (void)setDampingRatio:(double)a3
{
  self->_dampingRatio = a3;
}

- (void)setAspectFitAnimationStyle:(int64_t)a3
{
  self->_aspectFitAnimationStyle = a3;
}

- (void)setAspectFillAnimationStyle:(int64_t)a3
{
  self->_aspectFillAnimationStyle = a3;
}

- (void)setAllPhotosAspectFitPadding:(double)a3
{
  self->_allPhotosAspectFitPadding = a3;
}

- (void)setAllPhotosAspectFillPadding:(double)a3
{
  self->_allPhotosAspectFillPadding = a3;
}

+ (PXCursorInteractionSettings)sharedInstance
{
  if (sharedInstance_onceToken_226064 != -1) {
    dispatch_once(&sharedInstance_onceToken_226064, &__block_literal_global_226065);
  }
  v2 = (void *)sharedInstance_sharedInstance_226066;
  return (PXCursorInteractionSettings *)v2;
}

- (BOOL)enableCuratedLibraryEffects
{
  return self->_enableCuratedLibraryEffects;
}

void __45__PXCursorInteractionSettings_sharedInstance__block_invoke()
{
  id v2 = +[PXRootSettings sharedInstance];
  uint64_t v0 = [v2 cursorInteractionSettings];
  v1 = (void *)sharedInstance_sharedInstance_226066;
  sharedInstance_sharedInstance_226066 = v0;
}

+ (id)settingsControllerModule
{
  v66[5] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F94160];
  id v32 = (id)MEMORY[0x1E4F94160];
  objc_super v3 = (void *)MEMORY[0x1E4F941D8];
  v61 = NSStringFromSelector(sel_animationDuration);
  v60 = [v3 rowWithTitle:@"Animation Duration" valueKeyPath:v61];
  v59 = [v60 minValue:0.05 maxValue:1.0];
  v58 = objc_msgSend(v59, "px_increment:", 0.01);
  v65[0] = v58;
  v4 = (void *)MEMORY[0x1E4F941D8];
  v57 = NSStringFromSelector(sel_dampingRatio);
  v56 = [v4 rowWithTitle:@"Damping Ratio" valueKeyPath:v57];
  v55 = [v56 minValue:0.01 maxValue:2.0];
  v54 = objc_msgSend(v55, "px_increment:", 0.01);
  v65[1] = v54;
  v5 = (void *)MEMORY[0x1E4F941D8];
  v53 = NSStringFromSelector(sel_yearsPadding);
  v52 = [v5 rowWithTitle:@"Years Padding" valueKeyPath:v53];
  v51 = [v52 minValue:0.0 maxValue:20.0];
  v50 = objc_msgSend(v51, "px_increment:", 2.0);
  v65[2] = v50;
  v6 = (void *)MEMORY[0x1E4F941D8];
  v49 = NSStringFromSelector(sel_monthsPadding);
  v48 = [v6 rowWithTitle:@"Months Padding" valueKeyPath:v49];
  v47 = [v48 minValue:0.0 maxValue:20.0];
  v46 = objc_msgSend(v47, "px_increment:", 2.0);
  v65[3] = v46;
  v7 = (void *)MEMORY[0x1E4F941D8];
  v45 = NSStringFromSelector(sel_allPhotosAspectFitPadding);
  v44 = [v7 rowWithTitle:@"All Photos Aspect Fit Padding" valueKeyPath:v45];
  v43 = [v44 minValue:0.0 maxValue:20.0];
  v42 = objc_msgSend(v43, "px_increment:", 2.0);
  v65[4] = v42;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:5];
  v40 = [v2 sectionWithRows:v41 title:@"Curated Library"];
  v66[0] = v40;
  v8 = (void *)MEMORY[0x1E4F94160];
  v9 = (void *)MEMORY[0x1E4F941F0];
  v39 = NSStringFromSelector(sel_enableGridShadows);
  v38 = [v9 rowWithTitle:@"Enable Shadows" valueKeyPath:v39];
  v64[0] = v38;
  v10 = (void *)MEMORY[0x1E4F941F0];
  v37 = NSStringFromSelector(sel_enableGridLift);
  v36 = [v10 rowWithTitle:@"Enable Lift" valueKeyPath:v37];
  v64[1] = v36;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
  v34 = [v8 sectionWithRows:v35 title:@"Padded Grids"];
  v66[1] = v34;
  v11 = (void *)MEMORY[0x1E4F94160];
  v12 = (void *)MEMORY[0x1E4F941F0];
  v31 = NSStringFromSelector(sel_enableCardShadows);
  v30 = [v12 rowWithTitle:@"Enable Shadows" valueKeyPath:v31];
  v63[0] = v30;
  v13 = (void *)MEMORY[0x1E4F941F0];
  v29 = NSStringFromSelector(sel_enableCardLift);
  v28 = [v13 rowWithTitle:@"Enable Lift" valueKeyPath:v29];
  v63[1] = v28;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
  v15 = [v11 sectionWithRows:v14 title:@"Cards"];
  v66[2] = v15;
  v16 = (void *)MEMORY[0x1E4F94160];
  v17 = (void *)MEMORY[0x1E4F941F0];
  v18 = NSStringFromSelector(sel_enableCuratedLibraryEffects);
  v19 = [v17 rowWithTitle:@"Enable Curated Library" valueKeyPath:v18];
  v62[0] = v19;
  v20 = (void *)MEMORY[0x1E4F941F0];
  v21 = NSStringFromSelector(sel_enableDetailsEffect);
  v22 = [v20 rowWithTitle:@"Enable Details View" valueKeyPath:v21];
  v62[1] = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
  v24 = [v16 sectionWithRows:v23 title:@"Enablement"];
  v66[3] = v24;
  v25 = objc_msgSend(MEMORY[0x1E4F94160], "px_restoreDefaultsSection");
  v66[4] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:5];
  id v33 = [v32 moduleWithTitle:@"Cursor Interaction" contents:v26];

  return v33;
}

- (BOOL)enableDaysEffect
{
  return self->_enableDaysEffect;
}

- (BOOL)enableDetailsEffect
{
  return self->_enableDetailsEffect;
}

- (BOOL)enableCardLift
{
  return self->_enableCardLift;
}

- (BOOL)enableCardShadows
{
  return self->_enableCardShadows;
}

- (BOOL)enableGridLift
{
  return self->_enableGridLift;
}

- (BOOL)enableGridShadows
{
  return self->_enableGridShadows;
}

- (int64_t)aspectFillAnimationStyle
{
  return self->_aspectFillAnimationStyle;
}

- (int64_t)aspectFitAnimationStyle
{
  return self->_aspectFitAnimationStyle;
}

- (double)allPhotosAspectFillPadding
{
  return self->_allPhotosAspectFillPadding;
}

- (double)allPhotosAspectFitPadding
{
  return self->_allPhotosAspectFitPadding;
}

- (double)daysPadding
{
  return self->_daysPadding;
}

- (double)monthsPadding
{
  return self->_monthsPadding;
}

- (double)yearsPadding
{
  return self->_yearsPadding;
}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (double)paddingForZoomLevel:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      double result = 0.0;
      break;
    case 1:
      [(PXCursorInteractionSettings *)self yearsPadding];
      break;
    case 2:
      [(PXCursorInteractionSettings *)self monthsPadding];
      break;
    case 3:
      [(PXCursorInteractionSettings *)self daysPadding];
      break;
    case 4:
      [(PXCursorInteractionSettings *)self allPhotosAspectFitPadding];
      break;
    default:
      uint64_t v13 = v4;
      uint64_t v14 = v3;
      v12 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v6, v5, v13, v14, v7, v8);
      [v12 handleFailureInMethod:a2 object:self file:@"PXCursorInteractionSettings.m" lineNumber:90 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  return result;
}

- (int64_t)interactionOptionsForZoomLevel:(int64_t)a3 isAllPhotosAspectFit:(BOOL)a4
{
  switch(a3)
  {
    case 0:
    case 3:
      return 0;
    case 1:
    case 2:
      return [(PXCursorInteractionSettings *)self cardInteractionOptions];
    case 4:
      if (!a4) {
        return 0;
      }
      return [(PXCursorInteractionSettings *)self gridInteractionOptions];
    default:
      uint64_t v14 = v5;
      uint64_t v15 = v4;
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", v7, v6, v14, v15, v8, v9);
      [v13 handleFailureInMethod:a2 object:self file:@"PXCursorInteractionSettings.m" lineNumber:74 description:@"Code which should be unreachable has been reached"];

      abort();
  }
}

- (int64_t)cardInteractionOptions
{
  int64_t v3 = [(PXCursorInteractionSettings *)self enableCardShadows];
  if ([(PXCursorInteractionSettings *)self enableCardLift]) {
    return v3 | 2;
  }
  else {
    return v3;
  }
}

- (int64_t)gridInteractionOptions
{
  int64_t v3 = [(PXCursorInteractionSettings *)self enableGridShadows];
  if ([(PXCursorInteractionSettings *)self enableGridLift]) {
    return v3 | 2;
  }
  else {
    return v3;
  }
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance];
}

@end