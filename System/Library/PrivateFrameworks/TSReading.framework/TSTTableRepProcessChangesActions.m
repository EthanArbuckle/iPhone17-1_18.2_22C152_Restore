@interface TSTTableRepProcessChangesActions
- ($CA3468F20078D5D2DB35E78E73CA60DA)dirtyCellRange;
- ($CA3468F20078D5D2DB35E78E73CA60DA)dirtyStrokeRange;
- (BOOL)hideChromeContextMenuButton;
- (BOOL)hideStepperHUD;
- (BOOL)invalidateAllChrome;
- (BOOL)invalidateColumnChrome;
- (BOOL)invalidateKnobs;
- (BOOL)invalidateRowChrome;
- (BOOL)invalidateSelection;
- (BOOL)invalidateTableName;
- (BOOL)setNeedsDisplay;
- (BOOL)syncReferenceHighlightState;
- (BOOL)updateEditorRemainders;
- (void)setDirtyCellRange:(id)a3;
- (void)setDirtyStrokeRange:(id)a3;
- (void)setHideChromeContextMenuButton:(BOOL)a3;
- (void)setHideStepperHUD:(BOOL)a3;
- (void)setInvalidateAllChrome:(BOOL)a3;
- (void)setInvalidateColumnChrome:(BOOL)a3;
- (void)setInvalidateKnobs:(BOOL)a3;
- (void)setInvalidateRowChrome:(BOOL)a3;
- (void)setInvalidateSelection:(BOOL)a3;
- (void)setInvalidateTableName:(BOOL)a3;
- (void)setSetNeedsDisplay:(BOOL)a3;
- (void)setSyncReferenceHighlightState:(BOOL)a3;
- (void)setUpdateEditorRemainders:(BOOL)a3;
@end

@implementation TSTTableRepProcessChangesActions

- (void)setDirtyCellRange:(id)a3
{
  self->dirtyCellRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)TSTCellRangeUnionCellRange(*(void *)&self->dirtyCellRange, *(void *)&a3);
}

- (void)setDirtyStrokeRange:(id)a3
{
  self->dirtyStrokeRange = ($6C2899CC353BE70625C5C4ACBB5C74E2)TSTCellRangeUnionCellRange(*(void *)&self->dirtyStrokeRange, *(void *)&a3);
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)dirtyCellRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->dirtyCellRange;
}

- ($CA3468F20078D5D2DB35E78E73CA60DA)dirtyStrokeRange
{
  return ($CA3468F20078D5D2DB35E78E73CA60DA)self->dirtyStrokeRange;
}

- (BOOL)invalidateAllChrome
{
  return self->_invalidateAllChrome;
}

- (void)setInvalidateAllChrome:(BOOL)a3
{
  self->_invalidateAllChrome = a3;
}

- (BOOL)invalidateColumnChrome
{
  return self->_invalidateColumnChrome;
}

- (void)setInvalidateColumnChrome:(BOOL)a3
{
  self->_invalidateColumnChrome = a3;
}

- (BOOL)invalidateRowChrome
{
  return self->_invalidateRowChrome;
}

- (void)setInvalidateRowChrome:(BOOL)a3
{
  self->_invalidateRowChrome = a3;
}

- (BOOL)hideChromeContextMenuButton
{
  return self->_hideChromeContextMenuButton;
}

- (void)setHideChromeContextMenuButton:(BOOL)a3
{
  self->_hideChromeContextMenuButton = a3;
}

- (BOOL)invalidateKnobs
{
  return self->_invalidateKnobs;
}

- (void)setInvalidateKnobs:(BOOL)a3
{
  self->_invalidateKnobs = a3;
}

- (BOOL)invalidateSelection
{
  return self->_invalidateSelection;
}

- (void)setInvalidateSelection:(BOOL)a3
{
  self->_invalidateSelection = a3;
}

- (BOOL)invalidateTableName
{
  return self->_invalidateTableName;
}

- (void)setInvalidateTableName:(BOOL)a3
{
  self->_invalidateTableName = a3;
}

- (BOOL)updateEditorRemainders
{
  return self->_updateEditorRemainders;
}

- (void)setUpdateEditorRemainders:(BOOL)a3
{
  self->_updateEditorRemainders = a3;
}

- (BOOL)syncReferenceHighlightState
{
  return self->_syncReferenceHighlightState;
}

- (void)setSyncReferenceHighlightState:(BOOL)a3
{
  self->_syncReferenceHighlightState = a3;
}

- (BOOL)setNeedsDisplay
{
  return self->_setNeedsDisplay;
}

- (void)setSetNeedsDisplay:(BOOL)a3
{
  self->_setNeedsDisplay = a3;
}

- (BOOL)hideStepperHUD
{
  return self->_hideStepperHUD;
}

- (void)setHideStepperHUD:(BOOL)a3
{
  self->_hideStepperHUD = a3;
}

@end