@interface SBPIPEdgeResizeSettings
+ (id)settingsControllerModule;
- (BOOL)blurNoteWhileResizing;
- (BOOL)disableCornerResizeForButtons;
- (SBPIPEdgeResizeAnchorPointSettings)anchorPointSettings;
- (double)hysteresis;
- (double)liveResizePointerInteractionRegionCornerLength;
- (double)liveResizePointerInteractionRegionInnerLength;
- (double)liveResizePointerInteractionRegionOuterLength;
- (void)setAnchorPointSettings:(id)a3;
- (void)setBlurNoteWhileResizing:(BOOL)a3;
- (void)setDefaultValues;
- (void)setDisableCornerResizeForButtons:(BOOL)a3;
- (void)setHysteresis:(double)a3;
- (void)setLiveResizePointerInteractionRegionCornerLength:(double)a3;
- (void)setLiveResizePointerInteractionRegionInnerLength:(double)a3;
- (void)setLiveResizePointerInteractionRegionOuterLength:(double)a3;
@end

@implementation SBPIPEdgeResizeSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)SBPIPEdgeResizeSettings;
  [(PTSettings *)&v3 setDefaultValues];
  self->_disableCornerResizeForButtons = 0;
  self->_blurNoteWhileResizing = 0;
  self->_liveResizePointerInteractionRegionOuterLength = 10.0;
  self->_liveResizePointerInteractionRegionInnerLength = 10.0;
  self->_liveResizePointerInteractionRegionCornerLength = 25.0;
  self->_hysteresis = 0.0;
}

+ (id)settingsControllerModule
{
  v35[7] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94138];
  objc_super v3 = NSStringFromSelector(sel_anchorPointSettings);
  v32 = [v2 rowWithTitle:@"Anchor point settings" childSettingsKeyPath:v3];

  v31 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Disable Corner Resize For Buttons" valueKeyPath:@"disableCornerResizeForButtons"];
  v4 = [MEMORY[0x1E4F941E8] rowWithTitle:@"Blur Notes PIP while resizing" valueKeyPath:@"blurNoteWhileResizing"];
  v5 = (void *)MEMORY[0x1E4F94140];
  v6 = NSStringFromSelector(sel_hysteresis);
  v7 = [v5 rowWithTitle:@"Hysteresis" valueKeyPath:v6];
  v8 = [v7 precision:0];
  v30 = [v8 between:1.0 and:1500.0];

  v9 = (void *)MEMORY[0x1E4F94140];
  v10 = NSStringFromSelector(sel_liveResizePointerInteractionRegionOuterLength);
  v11 = [v9 rowWithTitle:@"Live Resize Pointer Interaction Region Outer Length" valueKeyPath:v10];
  v12 = [v11 precision:0];
  v33 = [v12 between:1.0 and:1500.0];

  v13 = (void *)MEMORY[0x1E4F94140];
  v14 = NSStringFromSelector(sel_liveResizePointerInteractionRegionInnerLength);
  v15 = [v13 rowWithTitle:@"Live Resize Pointer Interaction Region Inner Length" valueKeyPath:v14];
  v16 = [v15 precision:0];
  v29 = [v16 between:1.0 and:1500.0];

  v17 = (void *)MEMORY[0x1E4F94140];
  v18 = NSStringFromSelector(sel_liveResizePointerInteractionRegionCornerLength);
  v19 = [v17 rowWithTitle:@"Live Resize Pointer Interaction Region Corner Length" valueKeyPath:v18];
  v20 = [v19 precision:0];
  v21 = [v20 between:1.0 and:1500.0];

  v22 = (void *)MEMORY[0x1E4F94168];
  v35[0] = v32;
  v35[1] = v31;
  v35[2] = v4;
  v35[3] = v30;
  v35[4] = v33;
  v35[5] = v29;
  v35[6] = v21;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:7];
  v24 = [v22 sectionWithRows:v23 title:@"Edge Resize"];

  v25 = (void *)MEMORY[0x1E4F94168];
  v34 = v24;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  v27 = [v25 moduleWithTitle:@"PIP Edge Resize" contents:v26];

  return v27;
}

- (SBPIPEdgeResizeAnchorPointSettings)anchorPointSettings
{
  return self->_anchorPointSettings;
}

- (void)setAnchorPointSettings:(id)a3
{
}

- (BOOL)disableCornerResizeForButtons
{
  return self->_disableCornerResizeForButtons;
}

- (void)setDisableCornerResizeForButtons:(BOOL)a3
{
  self->_disableCornerResizeForButtons = a3;
}

- (BOOL)blurNoteWhileResizing
{
  return self->_blurNoteWhileResizing;
}

- (void)setBlurNoteWhileResizing:(BOOL)a3
{
  self->_blurNoteWhileResizing = a3;
}

- (double)liveResizePointerInteractionRegionOuterLength
{
  return self->_liveResizePointerInteractionRegionOuterLength;
}

- (void)setLiveResizePointerInteractionRegionOuterLength:(double)a3
{
  self->_liveResizePointerInteractionRegionOuterLength = a3;
}

- (double)liveResizePointerInteractionRegionInnerLength
{
  return self->_liveResizePointerInteractionRegionInnerLength;
}

- (void)setLiveResizePointerInteractionRegionInnerLength:(double)a3
{
  self->_liveResizePointerInteractionRegionInnerLength = a3;
}

- (double)liveResizePointerInteractionRegionCornerLength
{
  return self->_liveResizePointerInteractionRegionCornerLength;
}

- (void)setLiveResizePointerInteractionRegionCornerLength:(double)a3
{
  self->_liveResizePointerInteractionRegionCornerLength = a3;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

- (void).cxx_destruct
{
}

@end