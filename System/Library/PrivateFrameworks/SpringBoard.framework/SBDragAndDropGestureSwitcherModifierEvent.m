@interface SBDragAndDropGestureSwitcherModifierEvent
- (BOOL)hasPlatterized;
- (BOOL)hasPreviewLifted;
- (BOOL)isSwitcherDrag;
- (BOOL)isWindowDrag;
- (CGRect)platterViewFrame;
- (NSString)draggedSceneIdentifier;
- (SBSwitcherDropRegionContext)switcherDropRegionContext;
- (double)platterScale;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)draggedSceneLayoutRole;
- (int64_t)dropAction;
- (int64_t)type;
- (void)setDraggedSceneIdentifier:(id)a3;
- (void)setDraggedSceneLayoutRole:(int64_t)a3;
- (void)setDropAction:(int64_t)a3;
- (void)setPlatterScale:(double)a3;
- (void)setPlatterViewFrame:(CGRect)a3;
- (void)setPlatterized:(BOOL)a3;
- (void)setPreviewHasLifted:(BOOL)a3;
- (void)setSwitcherDrag:(BOOL)a3;
- (void)setSwitcherDropRegionContext:(id)a3;
- (void)setWindowDrag:(BOOL)a3;
@end

@implementation SBDragAndDropGestureSwitcherModifierEvent

- (int64_t)type
{
  return 4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBDragAndDropGestureSwitcherModifierEvent;
  v4 = [(SBGestureSwitcherModifierEvent *)&v9 copyWithZone:a3];
  *((void *)v4 + 20) = self->_dropAction;
  uint64_t v5 = [(NSString *)self->_draggedSceneIdentifier copy];
  v6 = (void *)*((void *)v4 + 21);
  *((void *)v4 + 21) = v5;

  CGSize size = self->_platterViewFrame.size;
  *(CGPoint *)(v4 + 200) = self->_platterViewFrame.origin;
  *(CGSize *)(v4 + 216) = size;
  *((void *)v4 + 23) = *(void *)&self->_platterScale;
  return v4;
}

- (int64_t)dropAction
{
  return self->_dropAction;
}

- (void)setDropAction:(int64_t)a3
{
  self->_dropAction = a3;
}

- (NSString)draggedSceneIdentifier
{
  return self->_draggedSceneIdentifier;
}

- (void)setDraggedSceneIdentifier:(id)a3
{
}

- (int64_t)draggedSceneLayoutRole
{
  return self->_draggedSceneLayoutRole;
}

- (void)setDraggedSceneLayoutRole:(int64_t)a3
{
  self->_draggedSceneLayoutRole = a3;
}

- (CGRect)platterViewFrame
{
  double x = self->_platterViewFrame.origin.x;
  double y = self->_platterViewFrame.origin.y;
  double width = self->_platterViewFrame.size.width;
  double height = self->_platterViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPlatterViewFrame:(CGRect)a3
{
  self->_platterViewFrame = a3;
}

- (double)platterScale
{
  return self->_platterScale;
}

- (void)setPlatterScale:(double)a3
{
  self->_platterScale = a3;
}

- (BOOL)hasPreviewLifted
{
  return self->_previewHasLifted;
}

- (void)setPreviewHasLifted:(BOOL)a3
{
  self->_previewHasLifted = a3;
}

- (BOOL)hasPlatterized
{
  return self->_platterized;
}

- (void)setPlatterized:(BOOL)a3
{
  self->_platterized = a3;
}

- (BOOL)isWindowDrag
{
  return self->_windowDrag;
}

- (void)setWindowDrag:(BOOL)a3
{
  self->_windowDrag = a3;
}

- (BOOL)isSwitcherDrag
{
  return self->_switcherDrag;
}

- (void)setSwitcherDrag:(BOOL)a3
{
  self->_switcherDrag = a3;
}

- (SBSwitcherDropRegionContext)switcherDropRegionContext
{
  return self->_switcherDropRegionContext;
}

- (void)setSwitcherDropRegionContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switcherDropRegionContext, 0);
  objc_storeStrong((id *)&self->_draggedSceneIdentifier, 0);
}

@end