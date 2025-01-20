@interface SRCompactViewControllerMutableContentTesterState
- (BOOL)compactViewHasContent;
- (BOOL)contextMenuIsPresented;
- (BOOL)deviceIsPad;
- (BOOL)editableUtteranceViewHasContent;
- (BOOL)keyboardHasContent;
- (BOOL)multiLevelViewHasContent;
- (BOOL)navigationBarHasContent;
- (BOOL)navigationStackIsPopping;
- (BOOL)siriViewControllerIsEditing;
- (SRCompactViewControllerMutableContentTesterState)init;
- (int64_t)navigationStackSize;
- (void)setCompactViewHasContent:(BOOL)a3;
- (void)setContextMenuIsPresented:(BOOL)a3;
- (void)setDeviceIsPad:(BOOL)a3;
- (void)setEditableUtteranceViewHasContent:(BOOL)a3;
- (void)setKeyboardHasContent:(BOOL)a3;
- (void)setMultiLevelViewHasContent:(BOOL)a3;
- (void)setNavigationBarHasContent:(BOOL)a3;
- (void)setNavigationStackIsPopping:(BOOL)a3;
- (void)setNavigationStackSize:(int64_t)a3;
- (void)setSiriViewControllerIsEditing:(BOOL)a3;
@end

@implementation SRCompactViewControllerMutableContentTesterState

- (SRCompactViewControllerMutableContentTesterState)init
{
  LODWORD(v3) = 0;
  return -[SRCompactViewControllerContentTesterState initWithDeviceIsPad:navigationStackIsPopping:navigationStackSize:navigationBarHasContent:multiLevelViewHasContent:editableUtteranceViewHasContent:compactViewHasContent:siriViewControllerIsEditing:keyboardHasContent:contextMenuIsPresented:](self, "initWithDeviceIsPad:navigationStackIsPopping:navigationStackSize:navigationBarHasContent:multiLevelViewHasContent:editableUtteranceViewHasContent:compactViewHasContent:siriViewControllerIsEditing:keyboardHasContent:contextMenuIsPresented:", 0, 0, 0, 0, 0, 0, v3);
}

- (BOOL)deviceIsPad
{
  return self->deviceIsPad;
}

- (void)setDeviceIsPad:(BOOL)a3
{
  self->deviceIsPad = a3;
}

- (BOOL)navigationStackIsPopping
{
  return self->navigationStackIsPopping;
}

- (void)setNavigationStackIsPopping:(BOOL)a3
{
  self->navigationStackIsPopping = a3;
}

- (int64_t)navigationStackSize
{
  return self->navigationStackSize;
}

- (void)setNavigationStackSize:(int64_t)a3
{
  self->navigationStackSize = a3;
}

- (BOOL)navigationBarHasContent
{
  return self->navigationBarHasContent;
}

- (void)setNavigationBarHasContent:(BOOL)a3
{
  self->navigationBarHasContent = a3;
}

- (BOOL)multiLevelViewHasContent
{
  return self->multiLevelViewHasContent;
}

- (void)setMultiLevelViewHasContent:(BOOL)a3
{
  self->multiLevelViewHasContent = a3;
}

- (BOOL)editableUtteranceViewHasContent
{
  return self->editableUtteranceViewHasContent;
}

- (void)setEditableUtteranceViewHasContent:(BOOL)a3
{
  self->editableUtteranceViewHasContent = a3;
}

- (BOOL)compactViewHasContent
{
  return self->compactViewHasContent;
}

- (void)setCompactViewHasContent:(BOOL)a3
{
  self->compactViewHasContent = a3;
}

- (BOOL)siriViewControllerIsEditing
{
  return self->siriViewControllerIsEditing;
}

- (void)setSiriViewControllerIsEditing:(BOOL)a3
{
  self->siriViewControllerIsEditing = a3;
}

- (BOOL)keyboardHasContent
{
  return self->keyboardHasContent;
}

- (void)setKeyboardHasContent:(BOOL)a3
{
  self->keyboardHasContent = a3;
}

- (BOOL)contextMenuIsPresented
{
  return self->contextMenuIsPresented;
}

- (void)setContextMenuIsPresented:(BOOL)a3
{
  self->contextMenuIsPresented = a3;
}

@end