@interface PUTilingViewSettings
+ (PUTilingViewSettings)sharedInstance;
+ (id)settingsControllerModule;
- (BOOL)allowPaging;
- (BOOL)allowPreheating;
- (BOOL)allowTileReuse;
- (BOOL)allowsEdgeAntialiasing;
- (BOOL)carryOverVelocities;
- (BOOL)lemonadeUseOvershootingSpringAnimations;
- (BOOL)lemonadeUseSystemSpringAnimations;
- (BOOL)rotateDisappearingTiles;
- (BOOL)showSnapshottableTiles;
- (BOOL)showVisibleRects;
- (BOOL)tintTiles;
- (BOOL)useOvershootingSpringAnimations;
- (BOOL)useSpringAnimations;
- (BOOL)useSystemSpringAnimations;
- (double)animationDragCoefficient;
- (double)defaultAnimationDuration;
- (double)interactiveTransitionBackgroundDimming;
- (double)springAnimationDuration;
- (double)transitionChromeDelay;
- (double)transitionDuration;
- (id)parentSettings;
- (int64_t)transitionProgressBehavior;
- (void)setAllowPaging:(BOOL)a3;
- (void)setAllowPreheating:(BOOL)a3;
- (void)setAllowTileReuse:(BOOL)a3;
- (void)setAllowsEdgeAntialiasing:(BOOL)a3;
- (void)setAnimationDragCoefficient:(double)a3;
- (void)setCarryOverVelocities:(BOOL)a3;
- (void)setDefaultAnimationDuration:(double)a3;
- (void)setDefaultValues;
- (void)setInteractiveTransitionBackgroundDimming:(double)a3;
- (void)setLemonadeUseOvershootingSpringAnimations:(BOOL)a3;
- (void)setLemonadeUseSystemSpringAnimations:(BOOL)a3;
- (void)setRotateDisappearingTiles:(BOOL)a3;
- (void)setShowSnapshottableTiles:(BOOL)a3;
- (void)setShowVisibleRects:(BOOL)a3;
- (void)setSpringAnimationDuration:(double)a3;
- (void)setTintTiles:(BOOL)a3;
- (void)setTransitionChromeDelay:(double)a3;
- (void)setTransitionDuration:(double)a3;
- (void)setTransitionProgressBehavior:(int64_t)a3;
- (void)setUseOvershootingSpringAnimations:(BOOL)a3;
- (void)setUseSpringAnimations:(BOOL)a3;
- (void)setUseSystemSpringAnimations:(BOOL)a3;
@end

@implementation PUTilingViewSettings

- (void)setDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)PUTilingViewSettings;
  [(PTSettings *)&v5 setDefaultValues];
  [(PUTilingViewSettings *)self setLemonadeUseSystemSpringAnimations:0];
  [(PUTilingViewSettings *)self setLemonadeUseOvershootingSpringAnimations:0];
  [(PUTilingViewSettings *)self setAnimationDragCoefficient:1.0];
  [(PUTilingViewSettings *)self setUseSpringAnimations:1];
  [(PUTilingViewSettings *)self setUseSystemSpringAnimations:0];
  [(PUTilingViewSettings *)self setSpringAnimationDuration:0.3];
  [(PUTilingViewSettings *)self setDefaultAnimationDuration:0.5];
  [(PUTilingViewSettings *)self setUseOvershootingSpringAnimations:1];
  [(PUTilingViewSettings *)self setTransitionDuration:0.2];
  if (PLIsCamera()) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  [(PUTilingViewSettings *)self setTransitionProgressBehavior:v3];
  if (PLIsCamera()) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.5;
  }
  [(PUTilingViewSettings *)self setInteractiveTransitionBackgroundDimming:v4];
  [(PUTilingViewSettings *)self setTransitionChromeDelay:0.0];
  [(PUTilingViewSettings *)self setAllowPaging:1];
  [(PUTilingViewSettings *)self setAllowPreheating:1];
  [(PUTilingViewSettings *)self setAllowTileReuse:1];
  [(PUTilingViewSettings *)self setCarryOverVelocities:1];
  [(PUTilingViewSettings *)self setAllowsEdgeAntialiasing:1];
  [(PUTilingViewSettings *)self setTintTiles:0];
  [(PUTilingViewSettings *)self setShowVisibleRects:0];
  [(PUTilingViewSettings *)self setRotateDisappearingTiles:0];
  [(PUTilingViewSettings *)self setShowSnapshottableTiles:0];
}

- (void)setUseSystemSpringAnimations:(BOOL)a3
{
  self->_useSystemSpringAnimations = a3;
}

- (void)setUseSpringAnimations:(BOOL)a3
{
  self->_useSpringAnimations = a3;
}

- (void)setUseOvershootingSpringAnimations:(BOOL)a3
{
  self->_useOvershootingSpringAnimations = a3;
}

- (void)setTransitionProgressBehavior:(int64_t)a3
{
  self->_transitionProgressBehavior = a3;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (void)setTransitionChromeDelay:(double)a3
{
  self->_transitionChromeDelay = a3;
}

- (void)setTintTiles:(BOOL)a3
{
  self->_tintTiles = a3;
}

- (void)setSpringAnimationDuration:(double)a3
{
  self->_springAnimationDuration = a3;
}

- (void)setShowVisibleRects:(BOOL)a3
{
  self->_showVisibleRects = a3;
}

- (void)setShowSnapshottableTiles:(BOOL)a3
{
  self->_showSnapshottableTiles = a3;
}

- (void)setRotateDisappearingTiles:(BOOL)a3
{
  self->_rotateDisappearingTiles = a3;
}

- (void)setLemonadeUseSystemSpringAnimations:(BOOL)a3
{
  self->_lemonadeUseSystemSpringAnimations = a3;
}

- (void)setLemonadeUseOvershootingSpringAnimations:(BOOL)a3
{
  self->_lemonadeUseOvershootingSpringAnimations = a3;
}

- (void)setInteractiveTransitionBackgroundDimming:(double)a3
{
  self->_interactiveTransitionBackgroundDimming = a3;
}

- (void)setDefaultAnimationDuration:(double)a3
{
  self->_defaultAnimationDuration = a3;
}

- (void)setCarryOverVelocities:(BOOL)a3
{
  self->_carryOverVelocities = a3;
}

- (void)setAnimationDragCoefficient:(double)a3
{
  self->_animationDragCoefficient = a3;
}

- (void)setAllowsEdgeAntialiasing:(BOOL)a3
{
  self->_allowsEdgeAntialiasing = a3;
}

- (void)setAllowTileReuse:(BOOL)a3
{
  self->_allowTileReuse = a3;
}

- (void)setAllowPreheating:(BOOL)a3
{
  self->_allowPreheating = a3;
}

- (void)setAllowPaging:(BOOL)a3
{
  self->_allowPaging = a3;
}

- (BOOL)showSnapshottableTiles
{
  return self->_showSnapshottableTiles;
}

- (BOOL)rotateDisappearingTiles
{
  return self->_rotateDisappearingTiles;
}

- (BOOL)showVisibleRects
{
  return self->_showVisibleRects;
}

- (BOOL)tintTiles
{
  return self->_tintTiles;
}

- (BOOL)carryOverVelocities
{
  return self->_carryOverVelocities;
}

- (BOOL)allowsEdgeAntialiasing
{
  return self->_allowsEdgeAntialiasing;
}

- (BOOL)allowTileReuse
{
  return self->_allowTileReuse;
}

- (BOOL)allowPreheating
{
  return self->_allowPreheating;
}

- (BOOL)allowPaging
{
  return self->_allowPaging;
}

- (double)transitionChromeDelay
{
  return self->_transitionChromeDelay;
}

- (double)interactiveTransitionBackgroundDimming
{
  return self->_interactiveTransitionBackgroundDimming;
}

- (int64_t)transitionProgressBehavior
{
  return self->_transitionProgressBehavior;
}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (BOOL)useOvershootingSpringAnimations
{
  return self->_useOvershootingSpringAnimations;
}

- (double)defaultAnimationDuration
{
  return self->_defaultAnimationDuration;
}

- (double)springAnimationDuration
{
  return self->_springAnimationDuration;
}

- (BOOL)useSystemSpringAnimations
{
  return self->_useSystemSpringAnimations;
}

- (BOOL)useSpringAnimations
{
  return self->_useSpringAnimations;
}

- (double)animationDragCoefficient
{
  return self->_animationDragCoefficient;
}

- (BOOL)lemonadeUseOvershootingSpringAnimations
{
  return self->_lemonadeUseOvershootingSpringAnimations;
}

- (BOOL)lemonadeUseSystemSpringAnimations
{
  return self->_lemonadeUseSystemSpringAnimations;
}

- (id)parentSettings
{
  return +[PURootSettings sharedInstance];
}

+ (id)settingsControllerModule
{
  v108[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  uint64_t v3 = (void *)MEMORY[0x1E4F941F0];
  double v4 = NSStringFromSelector(sel_lemonadeUseSystemSpringAnimations);
  objc_super v5 = [v3 rowWithTitle:@"System Spring Animations" valueKeyPath:v4];
  v6 = [v5 conditionFormat:@"useSpringAnimations == 1"];
  v108[0] = v6;
  v7 = (void *)MEMORY[0x1E4F941F0];
  v8 = NSStringFromSelector(sel_lemonadeUseOvershootingSpringAnimations);
  v9 = [v7 rowWithTitle:@"Overshoot When Zooming In" valueKeyPath:v8];
  v108[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:2];
  v101 = [v2 sectionWithRows:v10 title:@"Lemonade Overrides"];

  v99 = (void *)MEMORY[0x1E4F94160];
  v11 = (void *)MEMORY[0x1E4F94108];
  v96 = NSStringFromSelector(sel_animationDragCoefficient);
  v92 = [v11 rowWithTitle:@"Slow Animations" valueKeyPath:v96];
  v89 = [v92 possibleValues:&unk_1F078B798 titles:&unk_1F078B7B0];
  v107[0] = v89;
  v12 = (void *)MEMORY[0x1E4F941F0];
  v87 = NSStringFromSelector(sel_useSpringAnimations);
  v85 = [v12 rowWithTitle:@"Spring Animations" valueKeyPath:v87];
  v107[1] = v85;
  v13 = (void *)MEMORY[0x1E4F941F0];
  v83 = NSStringFromSelector(sel_useSystemSpringAnimations);
  v82 = [v13 rowWithTitle:@"System Spring Animations" valueKeyPath:v83];
  v81 = [v82 conditionFormat:@"useSpringAnimations == 1"];
  v107[2] = v81;
  v14 = (void *)MEMORY[0x1E4F941D8];
  v15 = NSStringFromSelector(sel_springAnimationDuration);
  v16 = [v14 rowWithTitle:@"Spring Animation Duration" valueKeyPath:v15];
  v17 = [v16 conditionFormat:@"useSpringAnimations == 1 && useSystemSpringAnimations == 0"];
  v107[3] = v17;
  v18 = (void *)MEMORY[0x1E4F941D8];
  v19 = NSStringFromSelector(sel_defaultAnimationDuration);
  v20 = [v18 rowWithTitle:@"Default Animation Duration" valueKeyPath:v19];
  v21 = [v20 minValue:0.0 maxValue:1.0];
  v22 = [v21 conditionFormat:@"useSpringAnimations == 0"];
  v107[4] = v22;
  v23 = (void *)MEMORY[0x1E4F941F0];
  v24 = NSStringFromSelector(sel_useOvershootingSpringAnimations);
  v25 = [v23 rowWithTitle:@"Overshoot When Zooming In" valueKeyPath:v24];
  v107[5] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:6];
  v100 = [v99 sectionWithRows:v26 title:@"Animations"];

  v97 = (void *)MEMORY[0x1E4F94160];
  v27 = (void *)MEMORY[0x1E4F941D8];
  v93 = NSStringFromSelector(sel_transitionDuration);
  v90 = [v27 rowWithTitle:@"Duration" valueKeyPath:v93];
  v88 = [v90 minValue:0.0 maxValue:0.5];
  v106[0] = v88;
  v28 = (void *)MEMORY[0x1E4F94108];
  v86 = NSStringFromSelector(sel_transitionProgressBehavior);
  v84 = [v28 rowWithTitle:@"Progress Behavior" valueKeyPath:v86];
  v29 = [v84 possibleValues:&unk_1F078B7C8 titles:&unk_1F078B7E0];
  v106[1] = v29;
  v30 = (void *)MEMORY[0x1E4F941D8];
  v31 = NSStringFromSelector(sel_interactiveTransitionBackgroundDimming);
  v32 = [v30 rowWithTitle:@"Interactive Background Dimming" valueKeyPath:v31];
  v33 = [v32 minValue:0.0 maxValue:1.0];
  v34 = objc_msgSend(v33, "pu_increment:", 0.100000001);
  v106[2] = v34;
  v35 = (void *)MEMORY[0x1E4F941D8];
  v36 = NSStringFromSelector(sel_transitionChromeDelay);
  v37 = [v35 rowWithTitle:@"Chrome Delay" valueKeyPath:v36];
  v38 = [v37 minValue:0.0 maxValue:0.899999976];
  v39 = objc_msgSend(v38, "pu_increment:", 0.100000001);
  v106[3] = v39;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:4];
  v98 = [v97 sectionWithRows:v40 title:@"Transitions"];

  v94 = (void *)MEMORY[0x1E4F94160];
  v41 = (void *)MEMORY[0x1E4F941F0];
  v91 = NSStringFromSelector(sel_allowPaging);
  v42 = [v41 rowWithTitle:@"Paging" valueKeyPath:v91];
  v105[0] = v42;
  v43 = (void *)MEMORY[0x1E4F941F0];
  v44 = NSStringFromSelector(sel_allowPreheating);
  v45 = [v43 rowWithTitle:@"Preheating" valueKeyPath:v44];
  v105[1] = v45;
  v46 = (void *)MEMORY[0x1E4F941F0];
  v47 = NSStringFromSelector(sel_allowTileReuse);
  v48 = [v46 rowWithTitle:@"Tile Reuse" valueKeyPath:v47];
  v105[2] = v48;
  v49 = (void *)MEMORY[0x1E4F941F0];
  v50 = NSStringFromSelector(sel_allowsEdgeAntialiasing);
  v51 = [v49 rowWithTitle:@"Edge Antialiasing" valueKeyPath:v50];
  v105[3] = v51;
  v52 = (void *)MEMORY[0x1E4F941F0];
  v53 = NSStringFromSelector(sel_carryOverVelocities);
  v54 = [v52 rowWithTitle:@"Carry Over Velocities" valueKeyPath:v53];
  v105[4] = v54;
  v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:5];
  v95 = [v94 sectionWithRows:v55 title:@"Features"];

  v56 = (void *)MEMORY[0x1E4F94160];
  v57 = (void *)MEMORY[0x1E4F941F0];
  v58 = NSStringFromSelector(sel_tintTiles);
  v59 = [v57 rowWithTitle:@"Tint Tiles" valueKeyPath:v58];
  v104[0] = v59;
  v60 = (void *)MEMORY[0x1E4F941F0];
  v61 = NSStringFromSelector(sel_showVisibleRects);
  v62 = [v60 rowWithTitle:@"Visible Rects" valueKeyPath:v61];
  v104[1] = v62;
  v63 = (void *)MEMORY[0x1E4F941F0];
  v64 = NSStringFromSelector(sel_rotateDisappearingTiles);
  v65 = [v63 rowWithTitle:@"Rotate Disappearing Tiles" valueKeyPath:v64];
  v104[2] = v65;
  v66 = (void *)MEMORY[0x1E4F941F0];
  v67 = NSStringFromSelector(sel_showSnapshottableTiles);
  v68 = [v66 rowWithTitle:@"Show Snapshottable Tiles" valueKeyPath:v67];
  v104[3] = v68;
  v69 = [MEMORY[0x1E4F1C978] arrayWithObjects:v104 count:4];
  v70 = [v56 sectionWithRows:v69 title:@"Debugging"];

  v71 = (void *)MEMORY[0x1E4F94160];
  v72 = (void *)MEMORY[0x1E4F940F8];
  v73 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v74 = [v72 rowWithTitle:@"Restore Defaults" action:v73];
  v103 = v74;
  v75 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
  v76 = [v71 sectionWithRows:v75];

  v77 = (void *)MEMORY[0x1E4F94160];
  v102[0] = v101;
  v102[1] = v100;
  v102[2] = v98;
  v102[3] = v95;
  v102[4] = v70;
  v102[5] = v76;
  v78 = [MEMORY[0x1E4F1C978] arrayWithObjects:v102 count:6];
  v79 = [v77 moduleWithTitle:@"Tiling View" contents:v78];

  return v79;
}

+ (PUTilingViewSettings)sharedInstance
{
  if (sharedInstance_onceToken_94320 != -1) {
    dispatch_once(&sharedInstance_onceToken_94320, &__block_literal_global_94321);
  }
  v2 = (void *)sharedInstance_sharedInstance_94322;
  return (PUTilingViewSettings *)v2;
}

void __38__PUTilingViewSettings_sharedInstance__block_invoke()
{
  id v2 = +[PURootSettings sharedInstance];
  uint64_t v0 = [v2 tilingViewSettings];
  v1 = (void *)sharedInstance_sharedInstance_94322;
  sharedInstance_sharedInstance_94322 = v0;
}

@end