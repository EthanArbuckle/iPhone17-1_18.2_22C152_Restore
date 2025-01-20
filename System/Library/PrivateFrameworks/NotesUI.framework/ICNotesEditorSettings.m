@interface ICNotesEditorSettings
+ (id)settingsControllerModule;
- (BOOL)isRubberBandingEnabled;
- (BOOL)pageShadowEnabled;
- (BOOL)stickyHeaderWhenZoomed;
- (BOOL)zoomOutOnScroll;
- (double)attachmentViewSnapToContentHeightThreshold;
- (double)maxShadowOpacity;
- (double)rubberBandCatchUpAnimationDuration;
- (double)rubberBandDragDistance;
- (double)rubberBandRange;
- (double)shadowLength;
- (double)snapToPDFDistanceForEndDragging;
- (double)snapToPDFWhileDraggingDistance;
- (double)snapToPDFWhileDraggingVelocityLimit;
- (void)setAttachmentViewSnapToContentHeightThreshold:(double)a3;
- (void)setDefaultValues;
- (void)setMaxShadowOpacity:(double)a3;
- (void)setPageShadowEnabled:(BOOL)a3;
- (void)setRubberBandCatchUpAnimationDuration:(double)a3;
- (void)setRubberBandDragDistance:(double)a3;
- (void)setRubberBandRange:(double)a3;
- (void)setRubberBandingEnabled:(BOOL)a3;
- (void)setShadowLength:(double)a3;
- (void)setSnapToPDFDistanceForEndDragging:(double)a3;
- (void)setSnapToPDFWhileDraggingDistance:(double)a3;
- (void)setSnapToPDFWhileDraggingVelocityLimit:(double)a3;
- (void)setStickyHeaderWhenZoomed:(BOOL)a3;
- (void)setZoomOutOnScroll:(BOOL)a3;
@end

@implementation ICNotesEditorSettings

- (BOOL)isRubberBandingEnabled
{
  return self->_rubberBandingEnabled;
}

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)ICNotesEditorSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(ICNotesEditorSettings *)self setSnapToPDFWhileDraggingDistance:5.0];
  [(ICNotesEditorSettings *)self setSnapToPDFWhileDraggingVelocityLimit:100.0];
  [(ICNotesEditorSettings *)self setSnapToPDFDistanceForEndDragging:30.0];
  [(ICNotesEditorSettings *)self setAttachmentViewSnapToContentHeightThreshold:0.05];
  [(ICNotesEditorSettings *)self setRubberBandingEnabled:0];
  [(ICNotesEditorSettings *)self setRubberBandRange:66.0];
  [(ICNotesEditorSettings *)self setRubberBandDragDistance:200.0];
  [(ICNotesEditorSettings *)self setRubberBandCatchUpAnimationDuration:0.15];
  [(ICNotesEditorSettings *)self setZoomOutOnScroll:0];
  [(ICNotesEditorSettings *)self setStickyHeaderWhenZoomed:1];
  [(ICNotesEditorSettings *)self setPageShadowEnabled:0];
  [(ICNotesEditorSettings *)self setMaxShadowOpacity:0.105];
  [(ICNotesEditorSettings *)self setShadowLength:4.0];
}

- (void)setZoomOutOnScroll:(BOOL)a3
{
  self->_zoomOutOnScroll = a3;
}

- (void)setStickyHeaderWhenZoomed:(BOOL)a3
{
  self->_stickyHeaderWhenZoomed = a3;
}

- (void)setSnapToPDFWhileDraggingVelocityLimit:(double)a3
{
  self->_snapToPDFWhileDraggingVelocityLimit = a3;
}

- (void)setSnapToPDFWhileDraggingDistance:(double)a3
{
  self->_snapToPDFWhileDraggingDistance = a3;
}

- (void)setSnapToPDFDistanceForEndDragging:(double)a3
{
  self->_snapToPDFDistanceForEndDragging = a3;
}

- (void)setShadowLength:(double)a3
{
  self->_shadowLength = a3;
}

- (void)setRubberBandingEnabled:(BOOL)a3
{
  self->_rubberBandingEnabled = a3;
}

- (void)setRubberBandRange:(double)a3
{
  self->_rubberBandRange = a3;
}

- (void)setRubberBandDragDistance:(double)a3
{
  self->_rubberBandDragDistance = a3;
}

- (void)setRubberBandCatchUpAnimationDuration:(double)a3
{
  self->_rubberBandCatchUpAnimationDuration = a3;
}

- (void)setPageShadowEnabled:(BOOL)a3
{
  self->_pageShadowEnabled = a3;
}

- (void)setMaxShadowOpacity:(double)a3
{
  self->_maxShadowOpacity = a3;
}

- (void)setAttachmentViewSnapToContentHeightThreshold:(double)a3
{
  self->_attachmentViewSnapToContentHeightThreshold = a3;
}

+ (id)settingsControllerModule
{
  v52[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F94160];
  id v17 = (id)MEMORY[0x1E4F94160];
  v48 = [MEMORY[0x1E4F94148] rowWithTitle:@"Snap While Dragging Distance" valueKeyPath:@"snapToPDFWhileDraggingDistance"];
  v47 = [v48 between:0.0 and:500.0];
  v46 = [v47 precision:2];
  v51[0] = v46;
  v45 = [MEMORY[0x1E4F94148] rowWithTitle:@"Snap While Dragging Velocity Limit" valueKeyPath:@"snapToPDFWhileDraggingVelocityLimit"];
  v44 = [v45 between:0.0 and:2000.0];
  v43 = [v44 precision:2];
  v51[1] = v43;
  v42 = [MEMORY[0x1E4F94148] rowWithTitle:@"Snap to PDF Distance - End Dragging" valueKeyPath:@"snapToPDFDistanceForEndDragging"];
  v41 = [v42 between:0.0 and:500.0];
  v40 = [v41 precision:2];
  v51[2] = v40;
  v39 = [MEMORY[0x1E4F94148] rowWithTitle:@"Snap to Text View Height Threshold" valueKeyPath:@"attachmentViewSnapToContentHeightThreshold"];
  v38 = [v39 between:0.0 and:1.0];
  v37 = [v38 precision:2];
  v51[3] = v37;
  v36 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Rubber Banding Enabled" valueKeyPath:@"rubberBandingEnabled"];
  v51[4] = v36;
  v35 = [MEMORY[0x1E4F94148] rowWithTitle:@"Rubber Band Range" valueKeyPath:@"rubberBandRange"];
  v34 = [v35 between:0.0 and:1000.0];
  v33 = [v34 precision:2];
  v51[5] = v33;
  v32 = [MEMORY[0x1E4F94148] rowWithTitle:@"Break Rubber Band Drag Distance" valueKeyPath:@"rubberBandDragDistance"];
  v31 = [v32 between:0.0 and:1000.0];
  v30 = [v31 precision:2];
  v51[6] = v30;
  v29 = [MEMORY[0x1E4F94148] rowWithTitle:@"Rubber Band Catch Up Animation Duration" valueKeyPath:@"rubberBandCatchUpAnimationDuration"];
  v28 = [v29 between:0.0 and:5.0];
  v27 = [v28 precision:3];
  v51[7] = v27;
  v26 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Zoom Out on Scroll" valueKeyPath:@"zoomOutOnScroll"];
  v51[8] = v26;
  v25 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Sticky Header When Zoomed" valueKeyPath:@"stickyHeaderWhenZoomed"];
  v51[9] = v25;
  v24 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Page Shadows Enabled" valueKeyPath:@"pageShadowEnabled"];
  v51[10] = v24;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:11];
  v22 = [v2 sectionWithRows:v23 title:@"PDF Attachment Metrics"];
  v52[0] = v22;
  objc_super v3 = (void *)MEMORY[0x1E4F94160];
  v21 = [MEMORY[0x1E4F94148] rowWithTitle:@"Maximum Shadow Opacity" valueKeyPath:@"maxShadowOpacity"];
  v20 = [v21 between:0.0 and:1.0];
  v19 = [v20 precision:3];
  v50[0] = v19;
  v4 = [MEMORY[0x1E4F94148] rowWithTitle:@"Shadow Length" valueKeyPath:@"shadowLength"];
  v5 = [v4 between:0.0 and:50.0];
  v6 = [v5 precision:1];
  v50[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  v8 = [v3 sectionWithRows:v7 title:@"PDF Header Metrics"];
  v52[1] = v8;
  v9 = (void *)MEMORY[0x1E4F94160];
  v10 = (void *)MEMORY[0x1E4F940F8];
  v11 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v12 = [v10 rowWithTitle:@"Restore Defaults" action:v11];
  v49 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  v14 = [v9 sectionWithRows:v13];
  v52[2] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:3];
  id v18 = [v17 moduleWithTitle:0 contents:v15];

  return v18;
}

- (double)snapToPDFWhileDraggingDistance
{
  return self->_snapToPDFWhileDraggingDistance;
}

- (double)snapToPDFWhileDraggingVelocityLimit
{
  return self->_snapToPDFWhileDraggingVelocityLimit;
}

- (double)snapToPDFDistanceForEndDragging
{
  return self->_snapToPDFDistanceForEndDragging;
}

- (double)attachmentViewSnapToContentHeightThreshold
{
  return self->_attachmentViewSnapToContentHeightThreshold;
}

- (double)rubberBandRange
{
  return self->_rubberBandRange;
}

- (double)rubberBandDragDistance
{
  return self->_rubberBandDragDistance;
}

- (double)rubberBandCatchUpAnimationDuration
{
  return self->_rubberBandCatchUpAnimationDuration;
}

- (BOOL)zoomOutOnScroll
{
  return self->_zoomOutOnScroll;
}

- (BOOL)stickyHeaderWhenZoomed
{
  return self->_stickyHeaderWhenZoomed;
}

- (BOOL)pageShadowEnabled
{
  return self->_pageShadowEnabled;
}

- (double)maxShadowOpacity
{
  return self->_maxShadowOpacity;
}

- (double)shadowLength
{
  return self->_shadowLength;
}

@end