@interface NTKFaceEditView
+ (CGRect)screenBottomAlignedKeylineLabelFrameForText:(id)a3;
- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4;
- (BOOL)_wheelChangedWithEvent:(id)a3;
- (BOOL)disableBreathingAnimationForComplications;
- (BOOL)isTransitioningBetweenEditPages;
- (CGPoint)pageOffsetFromCenter:(int64_t)a3;
- (CGRect)cachedScreenBottomAlignedKeylineLabelFrameForText:(id)a3;
- (CGRect)colorPickerFrame;
- (CGRect)keylineFrameAtSlot:(id)a3;
- (NTKFaceEditView)initWithFace:(id)a3;
- (NTKFaceEditViewDelegate)delegate;
- (NTKFaceViewCustomEditing)editingContentViewController;
- (id)editingColorForColor:(id)a3;
- (int64_t)editMode;
- (void)deactivateWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableBreathingAnimationForComplications:(BOOL)a3;
- (void)setEditMode:(int64_t)a3;
@end

@implementation NTKFaceEditView

- (NTKFaceEditView)initWithFace:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKFaceEditView;
  return -[NTKFaceEditView initWithFrame:](&v4, sel_initWithFrame_, a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (CGPoint)pageOffsetFromCenter:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v4;
  result.x = v3;
  return result;
}

+ (CGRect)screenBottomAlignedKeylineLabelFrameForText:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)cachedScreenBottomAlignedKeylineLabelFrameForText:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)colorPickerFrame
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)deactivateWithCompletion:(id)a3
{
}

- (id)editingColorForColor:(id)a3
{
  id v3 = a3;
  return v3;
}

- (BOOL)isTransitioningBetweenEditPages
{
  return 0;
}

- (BOOL)_wheelChangedWithEvent:(id)a3
{
  return 0;
}

- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4
{
  return 0;
}

- (CGRect)keylineFrameAtSlot:(id)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (NTKFaceViewCustomEditing)editingContentViewController
{
  return self->_editingContentViewController;
}

- (NTKFaceEditViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NTKFaceEditViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)editMode
{
  return self->_editMode;
}

- (void)setEditMode:(int64_t)a3
{
  self->_editMode = a3;
}

- (BOOL)disableBreathingAnimationForComplications
{
  return self->_disableBreathingAnimationForComplications;
}

- (void)setDisableBreathingAnimationForComplications:(BOOL)a3
{
  self->_disableBreathingAnimationForComplications = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editingContentViewController, 0);
}

@end