@interface _UIFocusRegionMapSnapshotRequest
+ (id)requestWithRootView:(id)a3 focusSystem:(id)a4;
- (BOOL)clipToSnapshotRect;
- (BOOL)includeFocusContainerGuides;
- (BOOL)includeFocusGuides;
- (CGRect)focusedRect;
- (CGRect)snapshotRect;
- (CGRect)viewSearchRect;
- (CGRect)visualRepresentationMinimumArea;
- (UIFocusSystem)focusSystem;
- (UIView)focusableRegionAncestorView;
- (UIView)rootView;
- (_UIFocusRegionMapSnapshotRequest)initWithRootView:(id)a3 focusSystem:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)takeSnapshot;
- (unint64_t)focusHeading;
- (void)setClipToSnapshotRect:(BOOL)a3;
- (void)setFocusHeading:(unint64_t)a3;
- (void)setFocusSystem:(id)a3;
- (void)setFocusableRegionAncestorView:(id)a3;
- (void)setFocusedRect:(CGRect)a3;
- (void)setIncludeFocusContainerGuides:(BOOL)a3;
- (void)setIncludeFocusGuides:(BOOL)a3;
- (void)setRootView:(id)a3;
- (void)setSnapshotRect:(CGRect)a3;
- (void)setViewSearchRect:(CGRect)a3;
- (void)setVisualRepresentationMinimumArea:(CGRect)a3;
@end

@implementation _UIFocusRegionMapSnapshotRequest

+ (id)requestWithRootView:(id)a3 focusSystem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithRootView:v7 focusSystem:v6];

  return v8;
}

- (_UIFocusRegionMapSnapshotRequest)initWithRootView:(id)a3 focusSystem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIFocusRegionMapSnapshotRequest;
  v8 = [(_UIFocusRegionMapSnapshotRequest *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_rootView, v6);
    objc_storeStrong((id *)&v9->_focusSystem, a4);
    CGPoint v10 = (CGPoint)*MEMORY[0x1E4F1DB28];
    CGSize v11 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v9->_snapshotRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v9->_snapshotRect.size = v11;
    v9->_viewSearchRect.origin = v10;
    v9->_viewSearchRect.size = v11;
    v9->_focusedRect.origin = v10;
    v9->_focusedRect.size = v11;
    v9->_focusHeading = 0;
    *(_WORD *)&v9->_includeFocusGuides = 257;
    v9->_clipToSnapshotRect = 1;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_UIFocusRegionMapSnapshotRequest allocWithZone:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootView);
  uint64_t v6 = [(_UIFocusRegionMapSnapshotRequest *)v4 initWithRootView:WeakRetained focusSystem:self->_focusSystem];

  id v7 = objc_loadWeakRetained((id *)&self->_rootView);
  objc_storeWeak((id *)(v6 + 16), v7);

  CGSize size = self->_snapshotRect.size;
  *(CGPoint *)(v6 + 48) = self->_snapshotRect.origin;
  *(CGSize *)(v6 + 64) = size;
  CGSize v9 = self->_viewSearchRect.size;
  *(CGPoint *)(v6 + 80) = self->_viewSearchRect.origin;
  *(CGSize *)(v6 + 96) = v9;
  CGSize v10 = self->_focusedRect.size;
  *(CGPoint *)(v6 + 112) = self->_focusedRect.origin;
  *(CGSize *)(v6 + 128) = v10;
  *(void *)(v6 + 32) = self->_focusHeading;
  *(unsigned char *)(v6 + 8) = self->_includeFocusGuides;
  *(unsigned char *)(v6 + 9) = self->_includeFocusContainerGuides;
  *(unsigned char *)(v6 + 10) = self->_clipToSnapshotRect;
  id v11 = objc_loadWeakRetained((id *)&self->_focusableRegionAncestorView);
  objc_storeWeak((id *)(v6 + 40), v11);

  CGSize v12 = self->_visualRepresentationMinimumArea.size;
  *(CGPoint *)(v6 + 144) = self->_visualRepresentationMinimumArea.origin;
  *(CGSize *)(v6 + 160) = v12;
  return (id)v6;
}

- (id)takeSnapshot
{
  id v3 = [[_UIFocusRegionMapSnapshot alloc] _initWithRequest:self];
  v4 = [(_UIFocusRegionMapSnapshotRequest *)self focusSystem];
  [(_UIFocusRegionMapSnapshotRequest *)self viewSearchRect];
  BOOL IsEmpty = CGRectIsEmpty(v12);
  uint64_t v6 = [(_UIFocusRegionMapSnapshotRequest *)self rootView];
  id v7 = [v6 superview];

  if (v7)
  {
    while (objc_msgSend(v7, "_legacy_isEligibleForFocusInteraction")
         && (_UIFocusItemCanBecomeFocused(v7, v4) & 1) == 0)
    {
      uint64_t v8 = [v7 superview];

      id v7 = (void *)v8;
      if (!v8) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    id v7 = [(_UIFocusRegionMapSnapshotRequest *)self rootView];
    BOOL v9 = _AXSFullKeyboardAccessEnabled() == 0;
    _UISnapshotVisitFocusRegion(v3, self, v7, 0, v9, IsEmpty);
  }

  [v3 _commit];
  return v3;
}

- (UIView)rootView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootView);
  return (UIView *)WeakRetained;
}

- (void)setRootView:(id)a3
{
}

- (UIFocusSystem)focusSystem
{
  return self->_focusSystem;
}

- (void)setFocusSystem:(id)a3
{
}

- (CGRect)snapshotRect
{
  double x = self->_snapshotRect.origin.x;
  double y = self->_snapshotRect.origin.y;
  double width = self->_snapshotRect.size.width;
  double height = self->_snapshotRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSnapshotRect:(CGRect)a3
{
  self->_snapshotRect = a3;
}

- (CGRect)viewSearchRect
{
  double x = self->_viewSearchRect.origin.x;
  double y = self->_viewSearchRect.origin.y;
  double width = self->_viewSearchRect.size.width;
  double height = self->_viewSearchRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setViewSearchRect:(CGRect)a3
{
  self->_viewSearchRect = a3;
}

- (CGRect)focusedRect
{
  double x = self->_focusedRect.origin.x;
  double y = self->_focusedRect.origin.y;
  double width = self->_focusedRect.size.width;
  double height = self->_focusedRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFocusedRect:(CGRect)a3
{
  self->_focusedRect = a3;
}

- (unint64_t)focusHeading
{
  return self->_focusHeading;
}

- (void)setFocusHeading:(unint64_t)a3
{
  self->_focusHeading = a3;
}

- (BOOL)includeFocusGuides
{
  return self->_includeFocusGuides;
}

- (void)setIncludeFocusGuides:(BOOL)a3
{
  self->_includeFocusGuides = a3;
}

- (BOOL)includeFocusContainerGuides
{
  return self->_includeFocusContainerGuides;
}

- (void)setIncludeFocusContainerGuides:(BOOL)a3
{
  self->_includeFocusContainerGuides = a3;
}

- (BOOL)clipToSnapshotRect
{
  return self->_clipToSnapshotRect;
}

- (void)setClipToSnapshotRect:(BOOL)a3
{
  self->_clipToSnapshotRect = a3;
}

- (UIView)focusableRegionAncestorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusableRegionAncestorView);
  return (UIView *)WeakRetained;
}

- (void)setFocusableRegionAncestorView:(id)a3
{
}

- (CGRect)visualRepresentationMinimumArea
{
  double x = self->_visualRepresentationMinimumArea.origin.x;
  double y = self->_visualRepresentationMinimumArea.origin.y;
  double width = self->_visualRepresentationMinimumArea.size.width;
  double height = self->_visualRepresentationMinimumArea.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVisualRepresentationMinimumArea:(CGRect)a3
{
  self->_visualRepresentationMinimumArea = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusableRegionAncestorView);
  objc_storeStrong((id *)&self->_focusSystem, 0);
  objc_destroyWeak((id *)&self->_rootView);
}

@end