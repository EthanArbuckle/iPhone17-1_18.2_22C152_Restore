@interface SBSwitcherAnimationAttributes
- (SBFFluidBehaviorSettings)clippingSettings;
- (SBFFluidBehaviorSettings)cornerRadiusSettings;
- (SBFFluidBehaviorSettings)dropletPositionXSettings;
- (SBFFluidBehaviorSettings)dropletPositionYSettings;
- (SBFFluidBehaviorSettings)layoutSettings;
- (SBFFluidBehaviorSettings)meshSettings;
- (SBFFluidBehaviorSettings)opacitySettings;
- (SBFFluidBehaviorSettings)positionSettings;
- (SBFFluidBehaviorSettings)scaleSettings;
- (id)_copyWithClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)clippingUpdateMode;
- (int64_t)cornerRadiusUpdateMode;
- (int64_t)layoutUpdateMode;
- (int64_t)meshUpdateMode;
- (int64_t)opacityUpdateMode;
- (int64_t)positionUpdateMode;
- (int64_t)scaleUpdateMode;
- (int64_t)titleAndIconOpacityUpdateMode;
- (int64_t)updateMode;
- (void)setClippingSettings:(id)a3;
- (void)setClippingUpdateMode:(int64_t)a3;
- (void)setCornerRadiusSettings:(id)a3;
- (void)setCornerRadiusUpdateMode:(int64_t)a3;
- (void)setDropletPositionXSettings:(id)a3;
- (void)setDropletPositionYSettings:(id)a3;
- (void)setLayoutSettings:(id)a3;
- (void)setLayoutUpdateMode:(int64_t)a3;
- (void)setMeshSettings:(id)a3;
- (void)setMeshUpdateMode:(int64_t)a3;
- (void)setOpacitySettings:(id)a3;
- (void)setOpacityUpdateMode:(int64_t)a3;
- (void)setPositionSettings:(id)a3;
- (void)setPositionUpdateMode:(int64_t)a3;
- (void)setScaleSettings:(id)a3;
- (void)setScaleUpdateMode:(int64_t)a3;
- (void)setTitleAndIconOpacityUpdateMode:(int64_t)a3;
- (void)setUpdateMode:(int64_t)a3;
@end

@implementation SBSwitcherAnimationAttributes

- (int64_t)opacityUpdateMode
{
  return self->_opacityUpdateMode;
}

- (SBFFluidBehaviorSettings)opacitySettings
{
  return self->_opacitySettings;
}

- (int64_t)titleAndIconOpacityUpdateMode
{
  return self->_titleAndIconOpacityUpdateMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropletPositionYSettings, 0);
  objc_storeStrong((id *)&self->_dropletPositionXSettings, 0);
  objc_storeStrong((id *)&self->_meshSettings, 0);
  objc_storeStrong((id *)&self->_clippingSettings, 0);
  objc_storeStrong((id *)&self->_cornerRadiusSettings, 0);
  objc_storeStrong((id *)&self->_opacitySettings, 0);
  objc_storeStrong((id *)&self->_scaleSettings, 0);
  objc_storeStrong((id *)&self->_positionSettings, 0);
  objc_storeStrong((id *)&self->_layoutSettings, 0);
}

- (int64_t)layoutUpdateMode
{
  return self->_layoutUpdateMode;
}

- (int64_t)clippingUpdateMode
{
  return self->_clippingUpdateMode;
}

- (SBFFluidBehaviorSettings)clippingSettings
{
  return self->_clippingSettings;
}

- (id)_copyWithClass:(Class)a3
{
  id v4 = objc_alloc_init(a3);
  [v4 setUpdateMode:self->_updateMode];
  [v4 setLayoutUpdateMode:self->_layoutUpdateMode];
  [v4 setPositionUpdateMode:self->_positionUpdateMode];
  [v4 setScaleUpdateMode:self->_scaleUpdateMode];
  [v4 setOpacityUpdateMode:self->_opacityUpdateMode];
  [v4 setCornerRadiusUpdateMode:self->_cornerRadiusUpdateMode];
  [v4 setClippingUpdateMode:self->_clippingUpdateMode];
  [v4 setTitleAndIconOpacityUpdateMode:self->_titleAndIconOpacityUpdateMode];
  [v4 setMeshUpdateMode:self->_meshUpdateMode];
  [v4 setLayoutSettings:self->_layoutSettings];
  [v4 setPositionSettings:self->_positionSettings];
  [v4 setScaleSettings:self->_scaleSettings];
  [v4 setOpacitySettings:self->_opacitySettings];
  [v4 setCornerRadiusSettings:self->_cornerRadiusSettings];
  [v4 setClippingSettings:self->_clippingSettings];
  [v4 setMeshSettings:self->_meshSettings];
  [v4 setDropletPositionXSettings:self->_dropletPositionXSettings];
  [v4 setDropletPositionYSettings:self->_dropletPositionYSettings];
  return v4;
}

- (void)setUpdateMode:(int64_t)a3
{
  self->_updateMode = a3;
}

- (void)setLayoutSettings:(id)a3
{
}

- (void)setOpacitySettings:(id)a3
{
}

- (void)setScaleUpdateMode:(int64_t)a3
{
  self->_scaleUpdateMode = a3;
}

- (void)setPositionUpdateMode:(int64_t)a3
{
  self->_positionUpdateMode = a3;
}

- (void)setOpacityUpdateMode:(int64_t)a3
{
  self->_opacityUpdateMode = a3;
}

- (void)setLayoutUpdateMode:(int64_t)a3
{
  self->_layoutUpdateMode = a3;
}

- (void)setCornerRadiusUpdateMode:(int64_t)a3
{
  self->_cornerRadiusUpdateMode = a3;
}

- (void)setClippingUpdateMode:(int64_t)a3
{
  self->_clippingUpdateMode = a3;
}

- (void)setTitleAndIconOpacityUpdateMode:(int64_t)a3
{
  self->_titleAndIconOpacityUpdateMode = a3;
}

- (void)setScaleSettings:(id)a3
{
}

- (void)setPositionSettings:(id)a3
{
}

- (void)setMeshUpdateMode:(int64_t)a3
{
  self->_meshUpdateMode = a3;
}

- (void)setMeshSettings:(id)a3
{
}

- (void)setDropletPositionYSettings:(id)a3
{
}

- (void)setDropletPositionXSettings:(id)a3
{
}

- (void)setCornerRadiusSettings:(id)a3
{
}

- (void)setClippingSettings:(id)a3
{
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBSwitcherAnimationAttributes *)self _copyWithClass:v4];
}

- (int64_t)updateMode
{
  return self->_updateMode;
}

- (SBFFluidBehaviorSettings)layoutSettings
{
  return self->_layoutSettings;
}

- (int64_t)positionUpdateMode
{
  return self->_positionUpdateMode;
}

- (SBFFluidBehaviorSettings)positionSettings
{
  return self->_positionSettings;
}

- (int64_t)scaleUpdateMode
{
  return self->_scaleUpdateMode;
}

- (SBFFluidBehaviorSettings)scaleSettings
{
  return self->_scaleSettings;
}

- (int64_t)meshUpdateMode
{
  return self->_meshUpdateMode;
}

- (int64_t)cornerRadiusUpdateMode
{
  return self->_cornerRadiusUpdateMode;
}

- (SBFFluidBehaviorSettings)cornerRadiusSettings
{
  return self->_cornerRadiusSettings;
}

- (SBFFluidBehaviorSettings)meshSettings
{
  return self->_meshSettings;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_class();
  return [(SBSwitcherAnimationAttributes *)self _copyWithClass:v4];
}

- (SBFFluidBehaviorSettings)dropletPositionXSettings
{
  return self->_dropletPositionXSettings;
}

- (SBFFluidBehaviorSettings)dropletPositionYSettings
{
  return self->_dropletPositionYSettings;
}

@end