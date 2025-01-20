@interface UIAccessibilityHUDPositionManager
+ (id)sharedInstance;
- (UIAccessibilityHUDPositionManager)init;
- (void)adjustViewPropertiesForHUD:(id)a3 withReferenceView:(id)a4;
- (void)adjustViewPropertiesForHUD:(id)a3 withReferenceView:(id)a4 keyboardFrame:(CGRect)a5;
- (void)beginManagingPositionOfHUD:(id)a3 withReferenceView:(id)a4;
- (void)dealloc;
- (void)keyboardFrameDidChange:(id)a3;
- (void)stopManagingPositionOfHUD:(id)a3;
- (void)updateFramesForManagedHUDsUsingKeyboardFrame:(CGRect)a3;
@end

@implementation UIAccessibilityHUDPositionManager

+ (id)sharedInstance
{
  if (_MergedGlobals_925 != -1) {
    dispatch_once(&_MergedGlobals_925, &__block_literal_global_3);
  }
  v2 = (void *)qword_1EB25ED30;
  return v2;
}

void __51__UIAccessibilityHUDPositionManager_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)qword_1EB25ED30;
  qword_1EB25ED30 = v0;
}

- (UIAccessibilityHUDPositionManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)UIAccessibilityHUDPositionManager;
  v2 = [(UIAccessibilityHUDPositionManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    managedHUDs = v2->_managedHUDs;
    v2->_managedHUDs = (NSMapTable *)v3;

    v5 = +[UIPeripheralHost allVisiblePeripheralFrames];
    v2->_keyboardAvoidanceArea.origin.x = unionRectValues(v5);
    v2->_keyboardAvoidanceArea.origin.y = v6;
    v2->_keyboardAvoidanceArea.size.width = v7;
    v2->_keyboardAvoidanceArea.size.height = v8;

    if (dyld_program_sdk_at_least())
    {
      v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 addObserver:v2 selector:sel_keyboardFrameDidChange_ name:@"UIKeyboardDidChangeFrameNotification" object:0];
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIKeyboardDidChangeFrameNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)UIAccessibilityHUDPositionManager;
  [(UIAccessibilityHUDPositionManager *)&v4 dealloc];
}

- (void)updateFramesForManagedHUDsUsingKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  CGFloat v8 = self->_managedHUDs;
  uint64_t v9 = [(NSMapTable *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v14 = -[NSMapTable objectForKey:](self->_managedHUDs, "objectForKey:", v13, (void)v15);
        -[UIAccessibilityHUDPositionManager adjustViewPropertiesForHUD:withReferenceView:keyboardFrame:](self, "adjustViewPropertiesForHUD:withReferenceView:keyboardFrame:", v13, v14, x, y, width, height);
      }
      uint64_t v10 = [(NSMapTable *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)keyboardFrameDidChange:(id)a3
{
  objc_super v4 = +[UIPeripheralHost allVisiblePeripheralFrames];
  self->_keyboardAvoidanceArea.origin.double x = unionRectValues(v4);
  self->_keyboardAvoidanceArea.origin.double y = v5;
  self->_keyboardAvoidanceArea.size.double width = v6;
  self->_keyboardAvoidanceArea.size.double height = v7;

  if ([(NSMapTable *)self->_managedHUDs count])
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__UIAccessibilityHUDPositionManager_keyboardFrameDidChange___block_invoke;
    v8[3] = &unk_1E52D9F70;
    v8[4] = self;
    +[UIView animateWithDuration:0 delay:v8 options:0 animations:0.25 completion:0.0];
  }
}

uint64_t __60__UIAccessibilityHUDPositionManager_keyboardFrameDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFramesForManagedHUDsUsingKeyboardFrame:", *(double *)(*(void *)(a1 + 32) + 16), *(double *)(*(void *)(a1 + 32) + 24), *(double *)(*(void *)(a1 + 32) + 32), *(double *)(*(void *)(a1 + 32) + 40));
}

- (void)adjustViewPropertiesForHUD:(id)a3 withReferenceView:(id)a4 keyboardFrame:(CGRect)a5
{
  double width = a5.size.width;
  double height = a5.size.height;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 window];
  [v10 bounds];
  CGFloat v11 = v82.origin.x;
  CGFloat v12 = v82.origin.y;
  CGFloat v13 = v82.size.width;
  CGFloat v14 = v82.size.height;
  if (CGRectGetWidth(v82) <= 320.0
    || (v83.origin.double x = v11,
        v83.origin.double y = v12,
        v83.size.double width = v13,
        v83.size.double height = v14,
        CGRectGetHeight(v83) <= 320.0))
  {
    CGFloat v15 = 24.0;
  }
  else
  {
    CGFloat v15 = 48.0;
  }
  long long v16 = [v9 window];
  [v9 bounds];
  objc_msgSend(v9, "convertRect:toView:", 0);
  objc_msgSend(v16, "convertRect:toWindow:", v10);
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  [v10 bounds];
  v96.origin.double x = v25;
  v96.origin.double y = v26;
  v96.size.double width = v27;
  v96.size.double height = v28;
  v84.origin.double x = v18;
  v84.origin.double y = v20;
  v84.size.double width = v22;
  v84.size.double height = v24;
  CGRect v85 = CGRectIntersection(v84, v96);
  CGRect v86 = CGRectInset(v85, v15, v15);
  CGFloat v29 = v86.origin.x;
  CGFloat v30 = v86.origin.y;
  CGFloat v31 = v86.size.width;
  CGFloat v32 = v86.size.height;
  uint64_t v33 = MEMORY[0x1E4F1DB28];
  CGFloat v34 = *MEMORY[0x1E4F1DB28];
  CGFloat v35 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  v36 = [v9 window];

  objc_opt_class();
  double v75 = v35;
  double v76 = v34;
  if (objc_opt_isKindOfClass()) {
    goto LABEL_8;
  }
  v37 = [v8 traitCollection];
  if ([v37 userInterfaceIdiom] == 1)
  {

LABEL_8:
LABEL_9:
    objc_msgSend(v10, "convertRect:fromWindow:", 0, x, y, width, height);
    CGFloat v34 = v38;
    CGFloat v35 = v39;
    CGFloat v72 = v41;
    CGFloat v74 = v40;
    goto LABEL_10;
  }
  v69 = [v8 window];
  char v70 = [v69 _isHostedInAnotherProcess];

  if (v70) {
    goto LABEL_9;
  }
  CGFloat v72 = *(double *)(v33 + 24);
  CGFloat v74 = *(double *)(v33 + 16);
LABEL_10:
  CGSize v42 = *(CGSize *)(v33 + 16);
  slice.origin = *(CGPoint *)v33;
  slice.size = v42;
  remainder.origin = slice.origin;
  remainder.size = v42;
  v79.origin = slice.origin;
  v79.size = v42;
  CGFloat v43 = v29;
  v42.double width = v30;
  CGFloat v44 = v31;
  CGFloat v45 = v32;
  CGFloat v46 = v32;
  CGFloat v47 = v31;
  CGFloat v48 = v30;
  CGFloat v49 = v29;
  double MaxY = CGRectGetMaxY(*(CGRect *)((char *)&v42 - 8));
  v87.origin.double x = v34;
  v87.origin.double y = v35;
  v87.size.double width = v74;
  v87.size.double height = v72;
  CGFloat v51 = fmax(MaxY - CGRectGetMinY(v87), 0.0);
  v88.origin.double x = v49;
  v88.origin.double y = v48;
  v88.size.double width = v47;
  v88.size.double height = v46;
  CGRectDivide(v88, &slice, &remainder, v51, CGRectMaxYEdge);
  v89.origin.double x = v34;
  v89.origin.double y = v35;
  v89.size.double width = v74;
  v89.size.double height = v72;
  double v52 = CGRectGetMaxY(v89);
  v90.origin.double x = v49;
  v90.origin.double y = v48;
  v90.size.double width = v47;
  v90.size.double height = v46;
  CGFloat v53 = fmax(v52 - CGRectGetMinY(v90), 0.0);
  v91.origin.double x = v49;
  v91.origin.double y = v48;
  v91.size.double width = v47;
  v91.size.double height = v46;
  CGRectDivide(v91, &slice, &v79, v53, CGRectMinYEdge);
  if (remainder.size.height <= v79.size.height) {
    double v54 = v79.size.height;
  }
  else {
    double v54 = remainder.size.height;
  }
  if (remainder.size.height <= v79.size.height) {
    p_CGRect remainder = &v79;
  }
  else {
    p_CGRect remainder = &remainder;
  }
  CGFloat v57 = p_remainder->origin.y;
  double v56 = p_remainder->size.width;
  CGFloat v58 = p_remainder->origin.x;
  objc_msgSend(v8, "sizeThatFits:", v56, v54);
  double v60 = v59;
  double v62 = v61;
  v92.origin.double x = v58;
  v92.origin.double y = v57;
  v92.size.double width = v56;
  v92.size.double height = v54;
  double v63 = CGRectGetWidth(v92) / v60;
  v93.origin.double x = v58;
  v93.origin.double y = v57;
  v93.size.double width = v56;
  v93.size.double height = v54;
  double v64 = CGRectGetHeight(v93) / v62;
  if (v63 < v64) {
    double v64 = v63;
  }
  if (v64 > 1.0) {
    double v64 = 1.0;
  }
  CGFloat v65 = fmax(v64, 0.5);
  v94.origin.double x = v58;
  v94.origin.double y = v57;
  v94.size.double width = v56;
  v94.size.double height = v54;
  CGRectGetMidX(v94);
  UIRoundToViewScale(v8);
  double v67 = v60 * 0.5 + v66;
  v95.origin.double x = v58;
  v95.origin.double y = v57;
  v95.size.double width = v56;
  v95.size.double height = v54;
  CGRectGetMidY(v95);
  UIRoundToViewScale(v8);
  objc_msgSend(v8, "setCenter:", v67, v62 * 0.5 + v68);
  objc_msgSend(v8, "setBounds:", v76, v75, v60, v62);
  CGAffineTransformMakeScale(&v78, v65, v65);
  CGAffineTransform v77 = v78;
  [v8 setTransform:&v77];
}

- (void)adjustViewPropertiesForHUD:(id)a3 withReferenceView:(id)a4
{
}

- (void)beginManagingPositionOfHUD:(id)a3 withReferenceView:(id)a4
{
}

- (void)stopManagingPositionOfHUD:(id)a3
{
}

- (void).cxx_destruct
{
}

@end