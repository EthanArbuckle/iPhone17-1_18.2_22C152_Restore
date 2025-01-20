@interface SBHIconResizingSettings
+ (id)settingsControllerModule;
- (BOOL)resizeHandleFollowsIconCornerRadius;
- (BOOL)resizeHandleUsesTruncatedSectorHitArea;
- (double)resizeHandleCornerRadius;
- (double)resizeHandleHitAreaBottomInset;
- (double)resizeHandleHitAreaLeadingInset;
- (double)resizeHandleHitAreaTopInset;
- (double)resizeHandleHitAreaTrailingInset;
- (double)resizeHandleHorizontalOffset;
- (double)resizeHandleLineLength;
- (double)resizeHandleLineWidth;
- (double)resizeHandleTruncatedSectorHitAreaBottomInset;
- (double)resizeHandleTruncatedSectorHitAreaLeadingInset;
- (double)resizeHandleTruncatedSectorHitAreaTopInset;
- (double)resizeHandleTruncatedSectorHitAreaTrailingInset;
- (double)resizeHandleVerticalOffset;
- (void)setDefaultValues;
- (void)setResizeHandleCornerRadius:(double)a3;
- (void)setResizeHandleFollowsIconCornerRadius:(BOOL)a3;
- (void)setResizeHandleHitAreaBottomInset:(double)a3;
- (void)setResizeHandleHitAreaLeadingInset:(double)a3;
- (void)setResizeHandleHitAreaTopInset:(double)a3;
- (void)setResizeHandleHitAreaTrailingInset:(double)a3;
- (void)setResizeHandleHorizontalOffset:(double)a3;
- (void)setResizeHandleLineLength:(double)a3;
- (void)setResizeHandleLineWidth:(double)a3;
- (void)setResizeHandleTruncatedSectorHitAreaBottomInset:(double)a3;
- (void)setResizeHandleTruncatedSectorHitAreaLeadingInset:(double)a3;
- (void)setResizeHandleTruncatedSectorHitAreaTopInset:(double)a3;
- (void)setResizeHandleTruncatedSectorHitAreaTrailingInset:(double)a3;
- (void)setResizeHandleUsesTruncatedSectorHitArea:(BOOL)a3;
- (void)setResizeHandleVerticalOffset:(double)a3;
@end

@implementation SBHIconResizingSettings

- (void)setDefaultValues
{
  [(SBHIconResizingSettings *)self setResizeHandleFollowsIconCornerRadius:0];
  [(SBHIconResizingSettings *)self setResizeHandleLineWidth:13.0];
  [(SBHIconResizingSettings *)self setResizeHandleLineLength:36.0];
  [(SBHIconResizingSettings *)self setResizeHandleCornerRadius:18.0];
  [(SBHIconResizingSettings *)self setResizeHandleHorizontalOffset:-1.0];
  [(SBHIconResizingSettings *)self setResizeHandleVerticalOffset:-1.0];
  [(SBHIconResizingSettings *)self setResizeHandleUsesTruncatedSectorHitArea:0];
  [(SBHIconResizingSettings *)self setResizeHandleHitAreaTopInset:-15.0];
  [(SBHIconResizingSettings *)self setResizeHandleHitAreaLeadingInset:-15.0];
  [(SBHIconResizingSettings *)self setResizeHandleHitAreaTrailingInset:-15.0];
  [(SBHIconResizingSettings *)self setResizeHandleHitAreaBottomInset:-15.0];
  [(SBHIconResizingSettings *)self setResizeHandleTruncatedSectorHitAreaTopInset:0.0];
  [(SBHIconResizingSettings *)self setResizeHandleTruncatedSectorHitAreaLeadingInset:0.0];
  [(SBHIconResizingSettings *)self setResizeHandleTruncatedSectorHitAreaTrailingInset:-20.0];
  [(SBHIconResizingSettings *)self setResizeHandleTruncatedSectorHitAreaBottomInset:0.0];
}

+ (id)settingsControllerModule
{
  v45[11] = *MEMORY[0x1E4F143B8];
  v42 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Follow Icon Corner Radius" valueKeyPath:@"resizeHandleFollowsIconCornerRadius"];
  v45[0] = v42;
  v41 = [MEMORY[0x1E4F94148] rowWithTitle:@"Line Width" valueKeyPath:@"resizeHandleLineWidth"];
  v40 = [v41 between:0.0 and:30.0];
  v39 = [v40 precision:2];
  v45[1] = v39;
  v38 = [MEMORY[0x1E4F94148] rowWithTitle:@"Line Length" valueKeyPath:@"resizeHandleLineLength"];
  v37 = [v38 between:0.0 and:200.0];
  v36 = [v37 precision:2];
  v45[2] = v36;
  v35 = [MEMORY[0x1E4F94148] rowWithTitle:@"Custom Corner Radius" valueKeyPath:@"resizeHandleCornerRadius"];
  v34 = [v35 between:0.0 and:200.0];
  v33 = [v34 precision:2];
  v45[3] = v33;
  v32 = [MEMORY[0x1E4F94148] rowWithTitle:@"Horizontal Offset" valueKeyPath:@"resizeHandleHorizontalOffset"];
  v31 = [v32 between:0.0 and:50.0];
  v30 = [v31 precision:2];
  v45[4] = v30;
  v29 = [MEMORY[0x1E4F94148] rowWithTitle:@"Vertical Offset" valueKeyPath:@"resizeHandleVerticalOffset"];
  v28 = [v29 between:0.0 and:50.0];
  v27 = [v28 precision:2];
  v45[5] = v27;
  v26 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Arc Hit Area" valueKeyPath:@"resizeHandleUsesTruncatedSectorHitArea"];
  v45[6] = v26;
  v25 = [MEMORY[0x1E4F94148] rowWithTitle:@"Arc Hit Area Top End Cap Inset" valueKeyPath:@"resizeHandleTruncatedSectorHitAreaTopInset"];
  v24 = [v25 between:-50.0 and:50.0];
  v2 = [v24 precision:2];
  v45[7] = v2;
  v3 = [MEMORY[0x1E4F94148] rowWithTitle:@"Arc Hit Area Leading Edge Inset" valueKeyPath:@"resizeHandleTruncatedSectorHitAreaLeadingInset"];
  v4 = [v3 between:-50.0 and:50.0];
  v5 = [v4 precision:2];
  v45[8] = v5;
  v6 = [MEMORY[0x1E4F94148] rowWithTitle:@"Arc Hit Area Trailing Edge Inset" valueKeyPath:@"resizeHandleTruncatedSectorHitAreaTrailingInset"];
  v7 = [v6 between:-50.0 and:50.0];
  v8 = [v7 precision:2];
  v45[9] = v8;
  v9 = [MEMORY[0x1E4F94148] rowWithTitle:@"Arc Hit Area Bottom End Cap Inset" valueKeyPath:@"resizeHandleTruncatedSectorHitAreaBottomInset"];
  v10 = [v9 between:-50.0 and:50.0];
  v11 = [v10 precision:2];
  v45[10] = v11;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:11];

  v12 = [MEMORY[0x1E4F94160] sectionWithRows:v23];
  v13 = (void *)MEMORY[0x1E4F940F8];
  v14 = [MEMORY[0x1E4F94170] action];
  v15 = [v13 rowWithTitle:@"Restore Defaults" action:v14];

  v16 = (void *)MEMORY[0x1E4F94160];
  v44 = v15;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  v18 = [v16 sectionWithRows:v17];

  v19 = (void *)MEMORY[0x1E4F94160];
  v43[0] = v12;
  v43[1] = v18;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  v21 = [v19 moduleWithTitle:@"Icon Resizing" contents:v20];

  return v21;
}

- (BOOL)resizeHandleFollowsIconCornerRadius
{
  return self->_resizeHandleFollowsIconCornerRadius;
}

- (void)setResizeHandleFollowsIconCornerRadius:(BOOL)a3
{
  self->_resizeHandleFollowsIconCornerRadius = a3;
}

- (double)resizeHandleLineWidth
{
  return self->_resizeHandleLineWidth;
}

- (void)setResizeHandleLineWidth:(double)a3
{
  self->_resizeHandleLineWidth = a3;
}

- (double)resizeHandleLineLength
{
  return self->_resizeHandleLineLength;
}

- (void)setResizeHandleLineLength:(double)a3
{
  self->_resizeHandleLineLength = a3;
}

- (double)resizeHandleCornerRadius
{
  return self->_resizeHandleCornerRadius;
}

- (void)setResizeHandleCornerRadius:(double)a3
{
  self->_resizeHandleCornerRadius = a3;
}

- (double)resizeHandleHorizontalOffset
{
  return self->_resizeHandleHorizontalOffset;
}

- (void)setResizeHandleHorizontalOffset:(double)a3
{
  self->_resizeHandleHorizontalOffset = a3;
}

- (double)resizeHandleVerticalOffset
{
  return self->_resizeHandleVerticalOffset;
}

- (void)setResizeHandleVerticalOffset:(double)a3
{
  self->_resizeHandleVerticalOffset = a3;
}

- (BOOL)resizeHandleUsesTruncatedSectorHitArea
{
  return self->_resizeHandleUsesTruncatedSectorHitArea;
}

- (void)setResizeHandleUsesTruncatedSectorHitArea:(BOOL)a3
{
  self->_resizeHandleUsesTruncatedSectorHitArea = a3;
}

- (double)resizeHandleHitAreaTopInset
{
  return self->_resizeHandleHitAreaTopInset;
}

- (void)setResizeHandleHitAreaTopInset:(double)a3
{
  self->_resizeHandleHitAreaTopInset = a3;
}

- (double)resizeHandleHitAreaLeadingInset
{
  return self->_resizeHandleHitAreaLeadingInset;
}

- (void)setResizeHandleHitAreaLeadingInset:(double)a3
{
  self->_resizeHandleHitAreaLeadingInset = a3;
}

- (double)resizeHandleHitAreaTrailingInset
{
  return self->_resizeHandleHitAreaTrailingInset;
}

- (void)setResizeHandleHitAreaTrailingInset:(double)a3
{
  self->_resizeHandleHitAreaTrailingInset = a3;
}

- (double)resizeHandleHitAreaBottomInset
{
  return self->_resizeHandleHitAreaBottomInset;
}

- (void)setResizeHandleHitAreaBottomInset:(double)a3
{
  self->_resizeHandleHitAreaBottomInset = a3;
}

- (double)resizeHandleTruncatedSectorHitAreaTopInset
{
  return self->_resizeHandleTruncatedSectorHitAreaTopInset;
}

- (void)setResizeHandleTruncatedSectorHitAreaTopInset:(double)a3
{
  self->_resizeHandleTruncatedSectorHitAreaTopInset = a3;
}

- (double)resizeHandleTruncatedSectorHitAreaLeadingInset
{
  return self->_resizeHandleTruncatedSectorHitAreaLeadingInset;
}

- (void)setResizeHandleTruncatedSectorHitAreaLeadingInset:(double)a3
{
  self->_resizeHandleTruncatedSectorHitAreaLeadingInset = a3;
}

- (double)resizeHandleTruncatedSectorHitAreaTrailingInset
{
  return self->_resizeHandleTruncatedSectorHitAreaTrailingInset;
}

- (void)setResizeHandleTruncatedSectorHitAreaTrailingInset:(double)a3
{
  self->_resizeHandleTruncatedSectorHitAreaTrailingInset = a3;
}

- (double)resizeHandleTruncatedSectorHitAreaBottomInset
{
  return self->_resizeHandleTruncatedSectorHitAreaBottomInset;
}

- (void)setResizeHandleTruncatedSectorHitAreaBottomInset:(double)a3
{
  self->_resizeHandleTruncatedSectorHitAreaBottomInset = a3;
}

@end