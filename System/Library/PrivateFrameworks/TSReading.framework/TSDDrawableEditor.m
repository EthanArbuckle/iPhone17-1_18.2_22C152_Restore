@interface TSDDrawableEditor
+ (BOOL)shouldSuppressMultiselection;
+ (id)keyPathsForValuesAffectingFirstInfo;
+ (id)keyPathsForValuesAffectingInfo;
+ (id)keyPathsForValuesAffectingLayouts;
- (BOOL)canAddOrShowComment;
- (NSSet)infos;
- (NSSet)layouts;
- (NSSet)selectedObjectsSupportingConnectionLineAttributes;
- (NSSet)selectedObjectsSupportingEndpoints;
- (NSSet)selectedObjectsSupportingFill;
- (NSSet)selectedObjectsSupportingOpacity;
- (NSSet)selectedObjectsSupportingReflection;
- (NSSet)selectedObjectsSupportingResize;
- (NSSet)selectedObjectsSupportingShadow;
- (NSSet)selectedObjectsSupportingShrinkTextToFit;
- (NSSet)selectedObjectsSupportingSmartShapeAttributes;
- (NSSet)selectedObjectsSupportingStroke;
- (NSSet)selectedObjectsSupportingTextInset;
- (TSDDrawableEditor)initWithInteractiveCanvasController:(id)a3;
- (TSDDrawableInfo)firstInfo;
- (TSDDrawableInfo)info;
- (TSDInteractiveCanvasController)interactiveCanvasController;
- (double)pictureFrameAssetScaleForNormalizedWidth:(double)a3;
- (double)strokeWidthForNormalizedWidth:(double)a3;
- (id)documentRoot;
- (id)imageForPreset:(id)a3 size:(CGSize)a4;
- (id)infosOfClass:(Class)a3;
- (id)selectedLayoutsSupportingFlipping;
- (id)selectedLayoutsSupportingInspectorPositioning;
- (id)selectedLayoutsSupportingRotation;
- (id)stroke;
- (id)strokeColor;
- (id)strokeColorPickerTitle;
- (id)strokeSwatches;
- (id)stylePresetKindForInspector;
- (id)topLevelInspectorAutosaveName;
- (id)viewControllerForMoreStyleOptions;
- (int)canPerformAction:(SEL)a3;
- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4;
- (void)beginChangingStrokeWidth:(id)a3;
- (void)dealloc;
- (void)didChangeStrokeWidth:(id)a3;
- (void)endChangingStrokeWidth:(id)a3;
- (void)setInfos:(id)a3;
@end

@implementation TSDDrawableEditor

- (TSDDrawableEditor)initWithInteractiveCanvasController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDDrawableEditor;
  result = [(TSDDrawableEditor *)&v5 init];
  if (result) {
    result->mICC = (TSDInteractiveCanvasController *)a3;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDDrawableEditor;
  [(TSDDrawableEditor *)&v3 dealloc];
}

+ (id)keyPathsForValuesAffectingInfo
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"infos"];
}

- (TSDDrawableInfo)info
{
  if ([(NSSet *)self->mInfos count] >= 2)
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDDrawableEditor info]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableEditor.m"), 87, @"You need to change your code to expect an array of infos from the TSDDrawableEditor so that multiple selection is supported.");
  }
  mInfos = self->mInfos;

  return (TSDDrawableInfo *)[(NSSet *)mInfos anyObject];
}

- (id)infosOfClass:(Class)a3
{
  mInfos = self->mInfos;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__TSDDrawableEditor_infosOfClass___block_invoke;
  v5[3] = &unk_2646B13C8;
  v5[4] = a3;
  return [(NSSet *)mInfos objectsPassingTest:v5];
}

uint64_t __34__TSDDrawableEditor_infosOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

+ (id)keyPathsForValuesAffectingFirstInfo
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"infos"];
}

+ (BOOL)shouldSuppressMultiselection
{
  return 0;
}

- (TSDDrawableInfo)firstInfo
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_opt_class();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mInfos = self->mInfos;
  uint64_t v4 = [(NSSet *)mInfos countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)v11;
LABEL_3:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v11 != v6) {
      objc_enumerationMutation(mInfos);
    }
    v8 = *(TSDDrawableInfo **)(*((void *)&v10 + 1) + 8 * v7);
    if (objc_opt_isKindOfClass()) {
      return v8;
    }
    if (v5 == ++v7)
    {
      uint64_t v5 = [(NSSet *)mInfos countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

+ (id)keyPathsForValuesAffectingLayouts
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"infos"];
}

- (NSSet)layouts
{
  objc_super v3 = [(TSDInteractiveCanvasController *)[(TSDDrawableEditor *)self interactiveCanvasController] layoutController];
  uint64_t v4 = [(TSDDrawableEditor *)self infos];

  return (NSSet *)[(TSDLayoutController *)v3 layoutsForInfos:v4];
}

- (int)canPerformAction:(SEL)a3
{
  return 0;
}

- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (sel_addOrShowComment_ == a3)
  {
    if ([(TSDDrawableEditor *)self canAddOrShowComment]) {
      return 1;
    }
    else {
      return -1;
    }
  }
  else if (sel_flipHorizontally_ == a3 || sel_flipVertically_ == a3)
  {
    if ([(NSSet *)[(TSDDrawableEditor *)self infos] count]
      && (long long v15 = 0u,
          long long v16 = 0u,
          long long v13 = 0u,
          long long v14 = 0u,
          uint64_t v6 = [(TSDDrawableEditor *)self layouts],
          (uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16]) != 0))
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v11 canFlip]
            && !objc_msgSend((id)objc_msgSend(v11, "info"), "isLocked"))
          {
            return 1;
          }
        }
        uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        int result = -1;
        if (v8) {
          continue;
        }
        break;
      }
    }
    else
    {
      return -1;
    }
  }
  else
  {
    return 0;
  }
  return result;
}

- (id)documentRoot
{
  v2 = [(TSDDrawableEditor *)self interactiveCanvasController];

  return [(TSDInteractiveCanvasController *)v2 documentRoot];
}

- (NSSet)selectedObjectsSupportingStroke
{
  return 0;
}

- (NSSet)selectedObjectsSupportingShadow
{
  return 0;
}

- (NSSet)selectedObjectsSupportingReflection
{
  return 0;
}

- (NSSet)selectedObjectsSupportingOpacity
{
  return 0;
}

- (NSSet)selectedObjectsSupportingFill
{
  return 0;
}

- (NSSet)selectedObjectsSupportingEndpoints
{
  return 0;
}

- (NSSet)selectedObjectsSupportingResize
{
  v2 = [(TSDDrawableEditor *)self layouts];

  return [(NSSet *)v2 objectsPassingTest:&__block_literal_global_33];
}

uint64_t __52__TSDDrawableEditor_selectedObjectsSupportingResize__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsResize];
}

- (NSSet)selectedObjectsSupportingTextInset
{
  v2 = [(TSDDrawableEditor *)self infos];

  return [(NSSet *)v2 objectsPassingTest:&__block_literal_global_19];
}

void *__55__TSDDrawableEditor_selectedObjectsSupportingTextInset__block_invoke()
{
  objc_opt_class();
  int result = (void *)TSUDynamicCast();
  if (result)
  {
    return (void *)[result supportsTextInset];
  }
  return result;
}

- (NSSet)selectedObjectsSupportingShrinkTextToFit
{
  v2 = [(TSDDrawableEditor *)self infos];

  return [(NSSet *)v2 objectsPassingTest:&__block_literal_global_22];
}

void *__61__TSDDrawableEditor_selectedObjectsSupportingShrinkTextToFit__block_invoke()
{
  objc_opt_class();
  int result = (void *)TSUDynamicCast();
  if (result)
  {
    return (void *)[result supportsShrinkTextToFit];
  }
  return result;
}

- (NSSet)selectedObjectsSupportingConnectionLineAttributes
{
  return 0;
}

- (NSSet)selectedObjectsSupportingSmartShapeAttributes
{
  return 0;
}

- (id)topLevelInspectorAutosaveName
{
  return @"TSDDrawableInspectorLastSelectedPane";
}

- (id)selectedLayoutsSupportingRotation
{
  v2 = [(TSDDrawableEditor *)self layouts];

  return [(NSSet *)v2 objectsPassingTest:&__block_literal_global_28];
}

uint64_t __54__TSDDrawableEditor_selectedLayoutsSupportingRotation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsRotation];
}

- (id)selectedLayoutsSupportingFlipping
{
  v2 = [(TSDDrawableEditor *)self layouts];

  return [(NSSet *)v2 objectsPassingTest:&__block_literal_global_30];
}

uint64_t __54__TSDDrawableEditor_selectedLayoutsSupportingFlipping__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsFlipping];
}

- (id)selectedLayoutsSupportingInspectorPositioning
{
  v2 = [(TSDDrawableEditor *)self layouts];

  return [(NSSet *)v2 objectsPassingTest:&__block_literal_global_32];
}

uint64_t __66__TSDDrawableEditor_selectedLayoutsSupportingInspectorPositioning__block_invoke(uint64_t a1, void *a2)
{
  return [a2 supportsInspectorPositioning];
}

- (id)stroke
{
  return 0;
}

- (id)strokeColor
{
  return 0;
}

- (void)beginChangingStrokeWidth:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(TSDInteractiveCanvasController *)self->mICC beginDynamicOperation];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  mInfos = self->mInfos;
  uint64_t v5 = [(NSSet *)mInfos countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(mInfos);
        }
        objc_msgSend(-[TSDInteractiveCanvasController layoutForInfo:](self->mICC, "layoutForInfo:", *(void *)(*((void *)&v9 + 1) + 8 * i)), "dynamicStrokeWidthChangeDidBegin");
      }
      uint64_t v6 = [(NSSet *)mInfos countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)didChangeStrokeWidth:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  [a3 floatValue];
  [(TSDDrawableEditor *)self strokeWidthForNormalizedWidth:v5];
  double v7 = v6;
  [a3 floatValue];
  [(TSDDrawableEditor *)self pictureFrameAssetScaleForNormalizedWidth:v8];
  double v10 = v9;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  mInfos = self->mInfos;
  uint64_t v12 = [(NSSet *)mInfos countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    float v15 = v10;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(mInfos);
        }
        v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v18 = (void *)[v17 performSelector:sel_stroke];
          id v19 = [(TSDInteractiveCanvasController *)self->mICC layoutForInfo:v17];
          int v20 = [v18 isFrame];
          double v21 = v7;
          if (v20)
          {
            objc_msgSend(v18, "minimumAssetScale", v7);
            *(float *)&double v22 = v22;
            double v21 = fmaxf(v15, *(float *)&v22);
          }
          [v19 dynamicStrokeWidthUpdateToValue:v21];
        }
      }
      uint64_t v13 = [(NSSet *)mInfos countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }
}

- (void)endChangingStrokeWidth:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mInfos = self->mInfos;
  uint64_t v5 = [(NSSet *)mInfos countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(mInfos);
        }
        objc_msgSend(-[TSDInteractiveCanvasController layoutForInfo:](self->mICC, "layoutForInfo:", *(void *)(*((void *)&v9 + 1) + 8 * i)), "dynamicStrokeWidthChangeDidEnd");
      }
      uint64_t v6 = [(NSSet *)mInfos countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  [(TSDInteractiveCanvasController *)self->mICC endDynamicOperation];
}

- (id)strokeSwatches
{
  return 0;
}

- (id)strokeColorPickerTitle
{
  return 0;
}

- (double)strokeWidthForNormalizedWidth:(double)a3
{
  TSUClamp();
  return result;
}

- (double)pictureFrameAssetScaleForNormalizedWidth:(double)a3
{
  return a3 / 100.0;
}

- (BOOL)canAddOrShowComment
{
  return 0;
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->mICC;
}

- (NSSet)infos
{
  return self->mInfos;
}

- (void)setInfos:(id)a3
{
}

- (id)stylePresetKindForInspector
{
  return (id)String;
}

- (id)viewControllerForMoreStyleOptions
{
  return 0;
}

- (id)imageForPreset:(id)a3 size:(CGSize)a4
{
  return 0;
}

@end