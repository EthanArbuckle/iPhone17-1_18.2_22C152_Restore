@interface PVMotionEffectTextComponent
+ (id)motionEffectPropertyKeyToPublishedParameterNameMap;
- (BOOL)hasEmojiRenderingWorkaround;
- (BOOL)isRightToLeftWithCurrentLocale;
- (BOOL)isTextFlipped;
- (BOOL)isTitleCard;
- (BOOL)motionEffect:(id)a3 propertiesDisableCache:(id)a4 time:(id *)a5 forcePosterFrame:(BOOL)a6;
- (BOOL)motionEffect:(id)a3 shouldInvalidateCachedRenderForProperty:(id)a4 oldValue:(id)a5 newValue:(id)a6;
- (BOOL)supportsFlippingText;
- (BOOL)supportsOrientation;
- (PVCGPointQuad)textCornersAtTime:(SEL)a3 index:(id *)a4 forcePosterFrame:(unint64_t)a5 includeDropShadow:(BOOL)a6 scale:(BOOL)a7 viewSize:(CGPoint)a8 viewOrigin:(CGSize)a9;
- (PVMotionEffectTextComponent)initWithMotionEffect:(id)a3;
- (id)attributedStringAtIndex:(unint64_t)a3;
- (id)attributedStringAtIndex_NoLock:(unint64_t)a3 properties:(id)a4;
- (id)defaultAttributedString:(unint64_t)a3;
- (id)defaultAttributedStringAtIndex_NoLock:(unint64_t)a3;
- (id)mainTitle;
- (id)motionEffectPropertyKeysThatInvalidateCachedRender:(id)a3;
- (id)subtitle;
- (id)textEditingBounds:(id *)a3;
- (id)textEditingBoundsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 useParagraphBounds:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7;
- (id)textObjectIDs_NoLock:(const void *)a3;
- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8;
- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7;
- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6;
- (int)orientation;
- (unint64_t)textObjectsCount_NoLock:(const void *)a3;
- (void)_textObjectIDs_NoLock:(const void *)a3;
- (void)beginEditingTextAtIndex:(unsigned int)a3;
- (void)beginTextEditing;
- (void)dealloc;
- (void)disableRenderingTextObjectAtIndex_NoLock:(unsigned int)a3 documentInfo:(const void *)a4;
- (void)effect:(id)a3 updateProperties:(id)a4 allProperties:(id)a5;
- (void)enableRenderingTextObjectAtIndex_NoLock:(unsigned int)a3 documentInfo:(const void *)a4;
- (void)endEditingTextAtIndex:(unsigned int)a3;
- (void)endTextEditing;
- (void)motionEffect:(id)a3 didBecomeReady:(const void *)a4 properties:(id)a5;
- (void)motionEffect:(id)a3 willOpenMedia:(const void *)a4 properties:(id)a5;
- (void)motionEffectDidUnload:(id)a3;
- (void)resetDefaultStrings:(const void *)a3;
- (void)setAttributedString:(id)a3 atIndex:(unint64_t)a4;
- (void)setIsRightToLeft_NoLock:(BOOL)a3 documentInfo:(const void *)a4;
- (void)setMainTitle:(id)a3;
- (void)setString:(id)a3 atIndex:(unint64_t)a4;
- (void)setSubtitle:(id)a3;
- (void)setupTitleParameters:(id)a3 allProperties:(id)a4 documentInfo:(const void *)a5;
- (void)storeDefaultStrings:(const void *)a3;
@end

@implementation PVMotionEffectTextComponent

- (void)dealloc
{
  textObjectIDs = (void **)self->_textObjectIDs;
  if (textObjectIDs)
  {
    v4 = *textObjectIDs;
    if (*textObjectIDs)
    {
      textObjectIDs[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x1BA9BFBA0](textObjectIDs, 0x10C402FEFCB83);
    self->_textObjectIDs = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PVMotionEffectTextComponent;
  [(PVMotionEffectTextComponent *)&v5 dealloc];
}

- (PVMotionEffectTextComponent)initWithMotionEffect:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PVMotionEffectTextComponent;
  v3 = [(PVMotionEffectComponent *)&v7 initWithMotionEffect:a3];
  v4 = v3;
  if (v3)
  {
    v3->_textObjectIDs = 0;
    defaultAttributedStrings = v3->_defaultAttributedStrings;
    v3->_defaultAttributedStrings = 0;
  }
  return v4;
}

- (void)storeDefaultStrings:(const void *)a3
{
  objc_super v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsReady];

  if (!self->_defaultAttributedStrings)
  {
    objc_super v7 = [(PVMotionEffectTextComponent *)self _textObjectIDs_NoLock:a3];
    v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7[1] - *v7];
    v10 = *v7;
    v9 = v7[1];
    if (*v7 != v9)
    {
      do
      {
        unsigned int v11 = *v10;
        v12 = (NSMutableAttributedString *)objc_opt_new();
        if (OZXGetTextAttributedString(*(void **)a3, v11, v12))
        {
          v13 = [(PVMotionEffectComponent *)self motionEffect];
          v14 = [(PVMotionEffectComponent *)self motionEffect];
          v15 = [v14 debugDisplayName];
          NSLog(&cfstr_WarningCouldNo.isa, v13, v15);
        }
        else
        {
          [(NSArray *)v8 addObject:v12];
        }

        ++v10;
      }
      while (v10 != v9);
    }
    defaultAttributedStrings = self->_defaultAttributedStrings;
    self->_defaultAttributedStrings = v8;
  }
}

- (id)attributedStringAtIndex:(unint64_t)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  id v14 = 0;
  objc_super v5 = [(PVMotionEffectComponent *)self motionEffect];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = *(void *)"";
  v8[2] = __55__PVMotionEffectTextComponent_attributedStringAtIndex___block_invoke;
  v8[3] = &unk_1E6168EB0;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  [v5 runEnsuringDocumentReadyAndLockingDocument:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __55__PVMotionEffectTextComponent_attributedStringAtIndex___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) motionEffect];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = *(void *)"";
  v3[2] = __55__PVMotionEffectTextComponent_attributedStringAtIndex___block_invoke_2;
  v3[3] = &unk_1E6168E88;
  long long v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  [v2 runWithInspectableProperties:v3];
}

void __55__PVMotionEffectTextComponent_attributedStringAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "attributedStringAtIndex_NoLock:properties:", *(void *)(a1 + 48));
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)attributedStringAtIndex_NoLock:(unint64_t)a3 properties:(id)a4
{
  id v6 = a4;
  objc_super v7 = [(PVMotionEffectComponent *)self motionEffect];
  [v7 assertDocumentIsLocked];

  v8 = [(PVMotionEffectComponent *)self motionEffect];
  [v8 assertDocumentStatusIsReady];

  id v9 = [(PVMotionEffectTextComponent *)self defaultAttributedStringAtIndex_NoLock:a3];
  v10 = v9;
  if (a3 <= 1)
  {
    uint64_t v11 = kPVTitleEffect_MainTitleStringKey;
    if (a3) {
      uint64_t v11 = kPVTitleEffect_SubTitleStringKey;
    }
    v12 = [v6 objectForKeyedSubscript:*v11];
    v13 = v12;
    v10 = v9;
    if (v12)
    {
      unint64_t v14 = [v12 length];
      if (v14 >= [v9 length]) {
        uint64_t v15 = [v9 length];
      }
      else {
        uint64_t v15 = [v13 length];
      }
      v16 = objc_msgSend(v9, "attributesAtIndex:longestEffectiveRange:inRange:", 0, 0, 0, v15);
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13 attributes:v16];
    }
  }

  return v10;
}

- (id)defaultAttributedString:(unint64_t)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  id v14 = 0;
  uint64_t v5 = [(PVMotionEffectComponent *)self motionEffect];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = *(void *)"";
  v8[2] = __55__PVMotionEffectTextComponent_defaultAttributedString___block_invoke;
  v8[3] = &unk_1E6168ED8;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  [v5 runEnsuringDocumentReadyAndLockingDocument:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __55__PVMotionEffectTextComponent_defaultAttributedString___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "defaultAttributedStringAtIndex_NoLock:", *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)resetDefaultStrings:(const void *)a3
{
  uint64_t v4 = [(PVMotionEffectComponent *)self motionEffect];
  [v4 assertDocumentIsLocked];

  uint64_t v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentStatusIsReady];

  defaultAttributedStrings = self->_defaultAttributedStrings;
  self->_defaultAttributedStrings = 0;
}

- (id)defaultAttributedStringAtIndex_NoLock:(unint64_t)a3
{
  uint64_t v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  id v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsReady];

  if ([(NSArray *)self->_defaultAttributedStrings count] <= a3)
  {
    objc_super v7 = 0;
  }
  else
  {
    objc_super v7 = [(NSArray *)self->_defaultAttributedStrings objectAtIndexedSubscript:a3];
  }

  return v7;
}

- (void)setString:(id)a3 atIndex:(unint64_t)a4
{
  id v9 = a3;
  if (a4 >= 2) {
    NSLog(&cfstr_ErrorOnlyMaint.isa);
  }
  if (!a4)
  {
    id v6 = kPVTitleEffect_MainTitleStringKey;
    goto LABEL_7;
  }
  if (a4 == 1)
  {
    id v6 = kPVTitleEffect_SubTitleStringKey;
LABEL_7:
    objc_super v7 = *v6;
    goto LABEL_9;
  }
  objc_super v7 = 0;
LABEL_9:
  v8 = [(PVMotionEffectComponent *)self motionEffect];
  [v8 setString:v9 forKey:v7];
}

- (void)setAttributedString:(id)a3 atIndex:(unint64_t)a4
{
  id v5 = [a3 string];
  -[PVMotionEffectTextComponent setString:atIndex:](self, "setString:atIndex:");
}

- (id)mainTitle
{
  uint64_t v2 = [(PVMotionEffectTextComponent *)self attributedStringAtIndex:0];
  uint64_t v3 = [v2 string];

  return v3;
}

- (void)setMainTitle:(id)a3
{
}

- (id)subtitle
{
  uint64_t v2 = [(PVMotionEffectTextComponent *)self attributedStringAtIndex:1];
  uint64_t v3 = [v2 string];

  return v3;
}

- (void)setSubtitle:(id)a3
{
}

- (id)textEditingBoundsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 useParagraphBounds:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7
{
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__1;
  v26 = __Block_byref_object_dispose__1;
  id v27 = 0;
  v13 = [(PVMotionEffectComponent *)self motionEffect];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = *(void *)"";
  v16[2] = __122__PVMotionEffectTextComponent_textEditingBoundsAtTime_forcePosterFrame_useParagraphBounds_includeDropShadow_includeMasks___block_invoke;
  v16[3] = &unk_1E6168F00;
  BOOL v18 = a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a3;
  BOOL v19 = a6;
  BOOL v20 = a7;
  BOOL v21 = a5;
  v16[4] = self;
  v16[5] = &v22;
  [v13 runEnsuringDocumentReadyAndLockingDocument:v16];

  id v14 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v14;
}

void __122__PVMotionEffectTextComponent_textEditingBoundsAtTime_forcePosterFrame_useParagraphBounds_includeDropShadow_includeMasks___block_invoke(uint64_t a1, uint64_t *a2)
{
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) motionEffect];
    id v6 = [v5 timelineComponent];
    uint64_t v4 = [v6 isForceRenderAtPosterFrameEnabled];
  }
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  objc_super v7 = [*(id *)(a1 + 32) motionEffect];
  v8 = [v7 timelineComponent];
  id v9 = v8;
  long long v29 = *(_OWORD *)(a1 + 48);
  uint64_t v30 = *(void *)(a1 + 64);
  if (v8)
  {
    objc_msgSend(v8, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v29, v4, a2);
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
  }

  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "_textObjectIDs_NoLock:", a2);
  uint64_t v11 = *(unsigned int **)v10;
  v12 = *(unsigned int **)(v10 + 8);
  if (*(unsigned int **)v10 != v12)
  {
    __asm { FMOV            V0.2D, #-1.0 }
    long long v25 = _Q0;
    do
    {
      char v18 = 2 * *(unsigned char *)(a1 + 73);
      if (*(unsigned char *)(a1 + 74)) {
        v18 |= 4u;
      }
      char v19 = v18 | *(unsigned char *)(a1 + 75);
      double v26 = 0.0;
      double v27 = 0.0;
      long long v28 = v25;
      OZXGetObjectBounds(*a2, (uint64_t)&v31, *v11, v19, (uint64_t)&v26);
      BOOL v20 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (!v20)
      {
        uint64_t v21 = objc_opt_new();
        uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
        v23 = *(void **)(v22 + 40);
        *(void *)(v22 + 40) = v21;

        BOOL v20 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      }
      uint64_t v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v26, v27, v28, v25);
      [v20 addObject:v24];

      ++v11;
    }
    while (v11 != v12);
  }
}

- (id)textEditingBounds:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  uint64_t v3 = [(PVMotionEffectTextComponent *)self textEditingBoundsAtTime:&v5 forcePosterFrame:0 useParagraphBounds:1 includeDropShadow:0 includeMasks:1];

  return v3;
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  id v6 = -[PVMotionEffectTextComponent textTransformsAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:](self, "textTransformsAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:", &v8, a4, 1, *(void *)&a6, a5.width, a5.height);

  return v6;
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  objc_super v7 = -[PVMotionEffectTextComponent textTransformsAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:](self, "textTransformsAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:", &v9, a4, a5, 1, *(void *)&a7, a6.width, a6.height);

  return v7;
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  v16 = [(PVMotionEffectComponent *)self motionEffect];
  [v16 outputSize];
  uint64_t v18 = v17;
  uint64_t v20 = v19;

  uint64_t v21 = [(PVMotionEffectComponent *)self motionEffect];
  LODWORD(v16) = [v21 origin];

  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1;
  v36 = __Block_byref_object_dispose__1;
  id v37 = 0;
  uint64_t v22 = [(PVMotionEffectComponent *)self motionEffect];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = *(void *)"";
  v25[2] = __142__PVMotionEffectTextComponent_textTransformsAtTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke;
  v25[3] = &unk_1E6168F50;
  BOOL v29 = a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v26 = *a3;
  v25[4] = self;
  v25[5] = &v32;
  BOOL v30 = a5;
  BOOL v31 = a6;
  v25[6] = v18;
  v25[7] = v20;
  int v27 = (int)v16;
  int v28 = a8;
  *(CGFloat *)&v25[8] = width;
  *(CGFloat *)&v25[9] = height;
  [v22 runEnsuringDocumentReadyAndLockingDocument:v25];

  id v23 = (id)v33[5];
  _Block_object_dispose(&v32, 8);

  return v23;
}

void __142__PVMotionEffectTextComponent_textTransformsAtTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 112))
  {
    uint64_t v4 = 1;
  }
  else
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [*(id *)(a1 + 32) motionEffect];
    id v6 = [v5 timelineComponent];
    uint64_t v4 = [v6 isForceRenderAtPosterFrameEnabled];
  }
  long long v26 = 0uLL;
  uint64_t v27 = 0;
  objc_super v7 = [*(id *)(a1 + 32) motionEffect];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [v7 timelineComponent];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = v8;
  long long v24 = *(_OWORD *)(a1 + 80);
  uint64_t v25 = *(void *)(a1 + 96);
  if (v8)
  {
    objc_msgSend(v8, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v24, v4, a2);
  }
  else
  {
    long long v26 = 0uLL;
    uint64_t v27 = 0;
  }

  uint64_t v10 = [*(id *)(a1 + 32) motionEffect];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = *(void *)"";
  long long v11 = *(_OWORD *)(a1 + 48);
  long long v13 = *(_OWORD *)(a1 + 32);
  long long v19 = *(_OWORD *)(a1 + 80);
  v12[2] = &__142__PVMotionEffectTextComponent_textTransformsAtTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke_2;
  v12[3] = &unk_1E6168F28;
  uint64_t v14 = a2;
  uint64_t v18 = v27;
  uint64_t v20 = *(void *)(a1 + 96);
  char v22 = *(unsigned char *)(a1 + 113);
  char v23 = *(unsigned char *)(a1 + 114);
  long long v15 = v11;
  uint64_t v21 = *(void *)(a1 + 104);
  long long v16 = *(_OWORD *)(a1 + 64);
  long long v17 = v26;
  [v10 runWithInspectableProperties:v12];
}

- (PVCGPointQuad)textCornersAtTime:(SEL)a3 index:(id *)a4 forcePosterFrame:(unint64_t)a5 includeDropShadow:(BOOL)a6 scale:(BOOL)a7 viewSize:(CGPoint)a8 viewOrigin:(CGSize)a9
{
  CGFloat height = a9.height;
  CGFloat width = a9.width;
  CGFloat y = a8.y;
  CGFloat x = a8.x;
  BOOL v15 = a7;
  BOOL v16 = a6;
  uint64_t v21 = [(PVMotionEffectComponent *)self motionEffect];
  [v21 outputSize];
  uint64_t v23 = v22;
  uint64_t v25 = v24;

  long long v26 = [(PVMotionEffectComponent *)self motionEffect];
  int v27 = [v26 origin];

  $3CC8671D27C23BF42ADDB32F2B5E48AE v55 = *a4;
  int v28 = [(PVMotionEffectTextComponent *)self textEditingBoundsAtTime:&v55 forcePosterFrame:v16 useParagraphBounds:1 includeDropShadow:v15 includeMasks:0];
  BOOL v29 = [v28 objectAtIndexedSubscript:a5];
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x7012000000;
  v51 = __Block_byref_object_copy__84;
  v52 = __Block_byref_object_dispose__85;
  v53 = &unk_1B876C866;
  memset(v54, 0, sizeof(v54));
  [v29 CGRectValue];
  PVCGPointQuad_from_CGRect(v56, v54);
  CGPoint v30 = (CGPoint)*((_OWORD *)v49 + 4);
  v46.a = (CGPoint)*((_OWORD *)v49 + 3);
  v46.b = v30;
  CGPoint v31 = (CGPoint)*((_OWORD *)v49 + 6);
  v46.c = (CGPoint)*((_OWORD *)v49 + 5);
  v46.d = v31;
  v31.CGFloat x = x;
  v30.CGFloat x = y;
  PVCGPointQuad_scale(&v46, *(CGPoint *)((char *)&v30 - 8), v47);
  uint64_t v32 = v49;
  long long v33 = v47[1];
  long long v35 = v47[2];
  long long v34 = v47[3];
  *((_OWORD *)v49 + 3) = v47[0];
  *((_OWORD *)v32 + 4) = v33;
  *((_OWORD *)v32 + 5) = v35;
  *((_OWORD *)v32 + 6) = v34;
  v36 = [(PVMotionEffectComponent *)self motionEffect];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = *(void *)"";
  v41[2] = __116__PVMotionEffectTextComponent_textCornersAtTime_index_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke;
  v41[3] = &unk_1E6168FA0;
  BOOL v45 = v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v42 = *a4;
  v41[4] = self;
  v41[5] = &v48;
  v41[6] = a5;
  v41[7] = v23;
  v41[8] = v25;
  *(CGFloat *)&v41[9] = width;
  *(CGFloat *)&v41[10] = height;
  int v43 = v27;
  int v44 = a10;
  [v36 runEnsuringDocumentReadyAndLockingDocument:v41];

  id v37 = (CGPoint *)v49;
  CGPoint v38 = (CGPoint)*((_OWORD *)v49 + 4);
  retstr->a = (CGPoint)*((_OWORD *)v49 + 3);
  retstr->b = v38;
  CGPoint v39 = v37[6];
  retstr->c = v37[5];
  retstr->d = v39;
  _Block_object_dispose(&v48, 8);

  return result;
}

double __116__PVMotionEffectTextComponent_textCornersAtTime_index_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "_textObjectIDs_NoLock:", a2);
  unint64_t v5 = *(void *)(a1 + 48);
  if (v5 >= (uint64_t)(v4[1] - *v4) >> 2) {
    std::vector<unsigned int>::__throw_out_of_range[abi:ne180100]();
  }
  int v6 = *(_DWORD *)(*v4 + 4 * v5);
  if (*(unsigned char *)(a1 + 120))
  {
    uint64_t v7 = 1;
  }
  else
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [*(id *)(a1 + 32) motionEffect];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = [v8 timelineComponent];
    uint64_t v7 = [v9 isForceRenderAtPosterFrameEnabled];
  }
  long long v34 = 0uLL;
  uint64_t v35 = 0;
  uint64_t v10 = [*(id *)(a1 + 32) motionEffect];
  long long v11 = [v10 timelineComponent];
  v12 = v11;
  long long v32 = *(_OWORD *)(a1 + 88);
  uint64_t v33 = *(void *)(a1 + 104);
  if (v11)
  {
    objc_msgSend(v11, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v32, v7, a2);
  }
  else
  {
    long long v34 = 0uLL;
    uint64_t v35 = 0;
  }

  long long v13 = [*(id *)(a1 + 32) motionEffect];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = *(void *)"";
  v24[2] = __116__PVMotionEffectTextComponent_textCornersAtTime_index_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke_2;
  v24[3] = &unk_1E6168F78;
  long long v25 = *(_OWORD *)(a1 + 32);
  int v27 = v6;
  long long v28 = v34;
  uint64_t v29 = v35;
  long long v30 = *(_OWORD *)(a1 + 88);
  uint64_t v31 = *(void *)(a1 + 104);
  uint64_t v26 = a2;
  [v13 runWithInspectableProperties:v24];

  uint64_t v14 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  __n128 v15 = v14[4];
  v22[0] = v14[3];
  v22[1] = v15;
  __n128 v16 = v14[6];
  v22[2] = v14[5];
  v22[3] = v16;
  pv_transform_PVCGPointQuad_between_coordinate_systems(v22, *(_DWORD *)(a1 + 112), *(_DWORD *)(a1 + 116), v23, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  long long v17 = *(_OWORD **)(*(void *)(a1 + 40) + 8);
  double result = *(double *)v23;
  long long v19 = v23[1];
  long long v21 = v23[2];
  long long v20 = v23[3];
  v17[3] = v23[0];
  v17[4] = v19;
  v17[5] = v21;
  v17[6] = v20;
  return result;
}

void __116__PVMotionEffectTextComponent_textCornersAtTime_index_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) motionEffect];
  unint64_t v5 = [v4 transformComponent];
  int v6 = v5;
  uint64_t v7 = *(_OWORD **)(*(void *)(a1 + 40) + 8);
  long long v8 = v7[4];
  v18[0] = v7[3];
  v18[1] = v8;
  long long v9 = v7[6];
  v18[2] = v7[5];
  v18[3] = v9;
  uint64_t v10 = *(unsigned int *)(a1 + 56);
  long long v16 = *(_OWORD *)(a1 + 60);
  uint64_t v17 = *(void *)(a1 + 76);
  uint64_t v15 = *(void *)(a1 + 100);
  long long v14 = *(_OWORD *)(a1 + 84);
  if (v5)
  {
    objc_msgSend(v5, "transformObjectCornersToImage_NoLock:objectID:timelineTime:componentTime:flatten:documentInfo:properties:", v18, v10, &v16, &v14, 0, *(void *)(a1 + 48), v3);
    uint64_t v7 = *(_OWORD **)(*(void *)(a1 + 40) + 8);
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
  }
  long long v11 = v20;
  long long v13 = v21;
  long long v12 = v22;
  v7[3] = v19;
  v7[4] = v11;
  v7[5] = v13;
  v7[6] = v12;
}

- (unint64_t)textObjectsCount_NoLock:(const void *)a3
{
  id v3 = [(PVMotionEffectTextComponent *)self _textObjectIDs_NoLock:a3];
  return (uint64_t)(v3[1] - *v3) >> 2;
}

- (id)textObjectIDs_NoLock:(const void *)a3
{
  id v3 = [(PVMotionEffectTextComponent *)self _textObjectIDs_NoLock:a3];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(uint64_t)(v4[1] - *v4) >> 2];
    uint64_t v6 = v4[1] - *v4;
    if (v6)
    {
      unint64_t v7 = 0;
      unint64_t v8 = v6 >> 2;
      if (v8 <= 1) {
        uint64_t v9 = 1;
      }
      else {
        uint64_t v9 = v8;
      }
      do
      {
        if (v7 >= (uint64_t)(v4[1] - *v4) >> 2) {
          std::vector<unsigned int>::__throw_out_of_range[abi:ne180100]();
        }
        uint64_t v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*v4 + 4 * v7)];
        [v5 addObject:v10];

        ++v7;
      }
      while (v9 != v7);
    }
  }
  else
  {
    unint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (void)_textObjectIDs_NoLock:(const void *)a3
{
  id v3 = [(PVMotionEffectComponent *)self motionEffect];
  [v3 assertDocumentIsLocked];

  uint64_t v4 = [(PVMotionEffectComponent *)self motionEffect];
  [v4 assertDocumentStatusIsLoadedOrReady];

  double result = self->_textObjectIDs;
  if (!result) {
    operator new();
  }
  return result;
}

- (void)beginTextEditing
{
}

- (void)beginEditingTextAtIndex:(unsigned int)a3
{
  unint64_t v5 = [(PVMotionEffectComponent *)self motionEffect];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __55__PVMotionEffectTextComponent_beginEditingTextAtIndex___block_invoke;
  v6[3] = &unk_1E6168FC8;
  v6[4] = self;
  unsigned int v7 = a3;
  [v5 runEnsuringDocumentReadyAndLockingDocument:v6];
}

void __55__PVMotionEffectTextComponent_beginEditingTextAtIndex___block_invoke(uint64_t a1, void **a2)
{
  objc_msgSend(*(id *)(a1 + 32), "disableRenderingTextObjectAtIndex_NoLock:documentInfo:", *(unsigned int *)(a1 + 40), a2);
  v3.var0 = 0;
  PCString::set(&v3, @"IsEditingText");
  OZXSetPublishedCheckBox(*a2, &v3, 1u);
  PCString::~PCString(&v3);
}

- (void)endTextEditing
{
}

- (void)endEditingTextAtIndex:(unsigned int)a3
{
  unint64_t v5 = [(PVMotionEffectComponent *)self motionEffect];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __53__PVMotionEffectTextComponent_endEditingTextAtIndex___block_invoke;
  v6[3] = &unk_1E6168FC8;
  v6[4] = self;
  unsigned int v7 = a3;
  [v5 runEnsuringDocumentReadyAndLockingDocument:v6];
}

void __53__PVMotionEffectTextComponent_endEditingTextAtIndex___block_invoke(uint64_t a1, void **a2)
{
  objc_msgSend(*(id *)(a1 + 32), "enableRenderingTextObjectAtIndex_NoLock:documentInfo:", *(unsigned int *)(a1 + 40), a2);
  v4.var0 = 0;
  PCString::set(&v4, @"IsEditingText");
  OZXSetPublishedCheckBox(*a2, &v4, 0);
  [*(id *)(a1 + 32) resetDefaultStrings:a2];
  [*(id *)(a1 + 32) storeDefaultStrings:a2];
  PCString::~PCString(&v4);
}

- (void)enableRenderingTextObjectAtIndex_NoLock:(unsigned int)a3 documentInfo:(const void *)a4
{
  id v9 = [(PVMotionEffectComponent *)self motionEffect];
  [v9 assertDocumentIsLocked];

  id v10 = [(PVMotionEffectComponent *)self motionEffect];
  [v10 assertDocumentStatusIsLoadedOrReady];

  unsigned int v7 = [(PVMotionEffectTextComponent *)self _textObjectIDs_NoLock:a4];
  unint64_t v8 = v7;
  if (a3 < (unint64_t)((uint64_t)(v7[1] - *v7) >> 2)) {
    OZXDisableRenderingObject(*(uint64_t **)a4, *(_DWORD *)(*v7 + 4 * a3), 0);
  }
  if ([(PVMotionEffectTextComponent *)self hasEmojiRenderingWorkaround]
    && v8[1] - *v8 == 8)
  {
    OZXDisableRenderingObject(*(uint64_t **)a4, *(_DWORD *)(*v8 + 4), 0);
  }
  id v11 = [(PVMotionEffectComponent *)self motionEffect];
  [v11 setInspectableProperty:0 forKey:@"kPVTextRenderingDisabled"];

  id v12 = [(PVMotionEffectComponent *)self motionEffect];
  objc_msgSend(v12, "didSetCacheInvalidatingParameter_NoLock:forKey:", MEMORY[0x1E4F1CC28], @"kPVTextRenderingDisabled");
}

- (void)disableRenderingTextObjectAtIndex_NoLock:(unsigned int)a3 documentInfo:(const void *)a4
{
  id v9 = [(PVMotionEffectComponent *)self motionEffect];
  [v9 assertDocumentIsLocked];

  id v10 = [(PVMotionEffectComponent *)self motionEffect];
  [v10 assertDocumentStatusIsLoadedOrReady];

  unsigned int v7 = [(PVMotionEffectTextComponent *)self _textObjectIDs_NoLock:a4];
  unint64_t v8 = v7;
  if (a3 < (unint64_t)((uint64_t)(v7[1] - *v7) >> 2)) {
    OZXDisableRenderingObject(*(uint64_t **)a4, *(_DWORD *)(*v7 + 4 * a3), 1);
  }
  if ([(PVMotionEffectTextComponent *)self hasEmojiRenderingWorkaround]
    && v8[1] - *v8 == 8)
  {
    OZXDisableRenderingObject(*(uint64_t **)a4, *(_DWORD *)(*v8 + 4), 1);
  }
  id v11 = [(PVMotionEffectComponent *)self motionEffect];
  [v11 setInspectableProperty:MEMORY[0x1E4F1CC38] forKey:@"kPVTextRenderingDisabled"];

  id v12 = [(PVMotionEffectComponent *)self motionEffect];
  objc_msgSend(v12, "didSetCacheInvalidatingParameter_NoLock:forKey:", MEMORY[0x1E4F1CC38], @"kPVTextRenderingDisabled");
}

- (void)setupTitleParameters:(id)a3 allProperties:(id)a4 documentInfo:(const void *)a5
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v138 = a4;
  id v9 = [(PVMotionEffectComponent *)self motionEffect];
  [v9 assertDocumentIsLocked];

  id v10 = [(PVMotionEffectComponent *)self motionEffect];
  [v10 assertDocumentStatusIsLoadedOrReady];

  id v11 = +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap];
  long long v145 = 0u;
  long long v146 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  v149[0] = @"BackgroundColor";
  v149[1] = @"PrimaryColor";
  v149[2] = @"SecondaryColor";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v149 count:3];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v143 objects:v150 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v144;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v144 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v143 + 1) + 8 * i);
        uint64_t v17 = [v8 objectForKeyedSubscript:v16];
        BOOL v18 = v17 == 0;

        if (!v18)
        {
          long long v19 = [v11 objectForKeyedSubscript:v16];
          v142.var0 = 0;
          PCString::set(&v142, v19);

          long long v20 = [v8 objectForKeyedSubscript:v16];
          v140.var0 = 0;
          v141.var0 = 0;
          double v139 = 0.0;
          [v20 getRed:&v141 green:&v140 blue:&v139 alpha:0];
          OZXSetPublishedRGBColor(*(void **)a5, &v142, *(double *)&v141.var0, *(double *)&v140.var0, v139);

          PCString::~PCString(&v142);
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v143 objects:v150 count:16];
    }
    while (v13);
  }

  long long v21 = [v8 objectForKeyedSubscript:@"TitleStyle"];
  BOOL v22 = v21 == 0;

  if (!v22)
  {
    v142.var0 = 0;
    PCString::set(&v142, @"TitleStyle");
    uint64_t v23 = *(void **)a5;
    uint64_t v24 = [v8 objectForKeyedSubscript:@"TitleStyle"];
    OZXSetPublishedPopup(v23, &v142, [v24 intValue]);

    PCString::~PCString(&v142);
  }
  long long v25 = [v8 objectForKeyedSubscript:@"kPVFlipTextKey"];
  BOOL v26 = v25 == 0;

  if (!v26)
  {
    int v27 = [v8 objectForKeyedSubscript:@"kPVFlipTextKey"];
    unsigned int v28 = [v27 BOOLValue];

    uint64_t v29 = [v11 objectForKeyedSubscript:@"kPVFlipTextKey"];
    v142.var0 = 0;
    PCString::set(&v142, v29);

    OZXSetPublishedCheckBox(*(void **)a5, &v142, v28);
    long long v30 = [(PVMotionEffectComponent *)self motionEffect];
    uint64_t v31 = [v8 objectForKeyedSubscript:@"kPVFlipTextKey"];
    int v32 = objc_msgSend(v30, "didSetCacheInvalidatingParameter_NoLock:forKey:", v31, @"kPVFlipTextKey");

    if (v32)
    {
      uint64_t v33 = +[PVHostApplicationDelegateHandler sharedInstance];
      int v34 = [v33 wantsSameAlignmentForAllLinesOfText];

      if (v34)
      {
        uint64_t v35 = [MEMORY[0x1E4F1C9E8] objectForKey:@"TitleString" inDictionary:v8 orInDefaultDictionary:v138];
        if (v35)
        {
          v36 = [(PVMotionEffectComponent *)self motionEffect];
          v147 = @"TitleString";
          v148 = v35;
          id v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
          [v36 setupPublishedParameters:v37];
        }
      }
    }
    PCString::~PCString(&v142);
  }
  CGPoint v38 = [v8 objectForKeyedSubscript:@"kPVOrientationKey"];
  BOOL v39 = v38 == 0;

  if (!v39)
  {
    v40 = [v8 objectForKeyedSubscript:@"kPVOrientationKey"];
    unsigned int v41 = [v40 intValue];

    $3CC8671D27C23BF42ADDB32F2B5E48AE v42 = [v11 objectForKeyedSubscript:@"kPVOrientationKey"];
    v142.var0 = 0;
    PCString::set(&v142, v42);

    OZXSetPublishedPopup(*(void **)a5, &v142, v41);
    PCString::~PCString(&v142);
  }
  int v43 = [v8 objectForKeyedSubscript:@"MainTitleFontName"];
  BOOL v44 = v43 == 0;

  if (!v44)
  {
    BOOL v45 = [v8 objectForKeyedSubscript:@"MainTitleFontName"];
    PVCGPointQuad v46 = [v11 objectForKeyedSubscript:@"TitleString"];
    v142.var0 = 0;
    PCString::set(&v142, v46);

    OZXSetPublishedTextFont(*(void **)a5, &v142, v45);
    if ([(PVMotionEffectTextComponent *)self hasEmojiRenderingWorkaround])
    {
      PCString::PCString(&v141, "MainTitleCopy");
      OZXSetPublishedTextFont(*(void **)a5, &v141, v45);
      PCString::~PCString(&v141);
    }
    PCString::~PCString(&v142);
  }
  v47 = [v8 objectForKeyedSubscript:@"SubTitleFontName"];
  BOOL v48 = v47 == 0;

  if (!v48)
  {
    v49 = [v8 objectForKeyedSubscript:@"SubTitleFontName"];
    uint64_t v50 = [v11 objectForKeyedSubscript:@"SubtitleString"];
    v142.var0 = 0;
    PCString::set(&v142, v50);

    OZXSetPublishedTextFont(*(void **)a5, &v142, v49);
    PCString::~PCString(&v142);
  }
  v51 = [v8 objectForKeyedSubscript:@"SecondaryTitleFontName"];
  BOOL v52 = v51 == 0;

  if (!v52)
  {
    v53 = [v8 objectForKeyedSubscript:@"SecondaryTitleFontName"];
    v54 = [v11 objectForKeyedSubscript:@"SecondaryString"];
    v142.var0 = 0;
    PCString::set(&v142, v54);

    OZXSetPublishedTextFont(*(void **)a5, &v142, v53);
    PCString::~PCString(&v142);
  }
  $3CC8671D27C23BF42ADDB32F2B5E48AE v55 = [v8 objectForKeyedSubscript:@"MainTitleFontScale"];
  BOOL v56 = v55 == 0;

  if (!v56)
  {
    v57 = [v8 objectForKeyedSubscript:@"MainTitleFontScale"];
    [v57 floatValue];
    float v59 = v58;

    v60 = [v11 objectForKeyedSubscript:@"TitleString"];
    v142.var0 = 0;
    PCString::set(&v142, v60);

    OZXSetPublishedTextScale(*(void **)a5, &v142, v59);
    PCString::~PCString(&v142);
  }
  v61 = [v8 objectForKeyedSubscript:@"SubTitleFontScale"];
  BOOL v62 = v61 == 0;

  if (!v62)
  {
    v63 = [v8 objectForKeyedSubscript:@"SubTitleFontScale"];
    [v63 floatValue];
    float v65 = v64;

    v66 = [v11 objectForKeyedSubscript:@"SubtitleString"];
    v142.var0 = 0;
    PCString::set(&v142, v66);

    OZXSetPublishedTextScale(*(void **)a5, &v142, v65);
    PCString::~PCString(&v142);
  }
  v67 = [v8 objectForKeyedSubscript:@"SecondaryTitleFontScale"];
  BOOL v68 = v67 == 0;

  if (!v68)
  {
    v69 = [v8 objectForKeyedSubscript:@"SecondaryTitleFontScale"];
    [v69 floatValue];
    float v71 = v70;

    v72 = [v11 objectForKeyedSubscript:@"SecondaryString"];
    v142.var0 = 0;
    PCString::set(&v142, v72);

    OZXSetPublishedTextScale(*(void **)a5, &v142, v71);
    PCString::~PCString(&v142);
  }
  v73 = [v8 objectForKeyedSubscript:@"MainTitleFontSize"];
  BOOL v74 = v73 == 0;

  if (!v74)
  {
    v75 = [v8 objectForKeyedSubscript:@"MainTitleFontSize"];
    [v75 floatValue];
    float v77 = v76;

    v78 = [v11 objectForKeyedSubscript:@"TitleString"];
    v142.var0 = 0;
    PCString::set(&v142, v78);

    OZXSetPublishedTextSize(*(void **)a5, &v142, v77);
    PCString::~PCString(&v142);
  }
  v79 = [v8 objectForKeyedSubscript:@"SubTitleFontSize"];
  BOOL v80 = v79 == 0;

  if (!v80)
  {
    v81 = [v8 objectForKeyedSubscript:@"SubTitleFontSize"];
    [v81 floatValue];
    float v83 = v82;

    v84 = [v11 objectForKeyedSubscript:@"SubtitleString"];
    v142.var0 = 0;
    PCString::set(&v142, v84);

    OZXSetPublishedTextSize(*(void **)a5, &v142, v83);
    PCString::~PCString(&v142);
  }
  v85 = [v8 objectForKeyedSubscript:@"SecondaryTitleFontSize"];
  BOOL v86 = v85 == 0;

  if (!v86)
  {
    v87 = [v8 objectForKeyedSubscript:@"SecondaryTitleFontSize"];
    [v87 floatValue];
    float v89 = v88;

    v90 = [v11 objectForKeyedSubscript:@"SecondaryString"];
    v142.var0 = 0;
    PCString::set(&v142, v90);

    OZXSetPublishedTextSize(*(void **)a5, &v142, v89);
    PCString::~PCString(&v142);
  }
  v91 = [v8 objectForKeyedSubscript:@"kPVTextOneLineScaleThreshold_MainTitle"];
  BOOL v92 = v91 == 0;

  if (!v92)
  {
    v93 = [v11 objectForKeyedSubscript:@"TitleString"];
    v142.var0 = 0;
    PCString::set(&v142, v93);

    v94 = [v8 objectForKeyedSubscript:@"kPVTextOneLineScaleThreshold_MainTitle"];
    [v94 doubleValue];
    double v96 = v95;

    OZXSetTextOneLineScaleThreshold(*(void **)a5, &v142, v96);
    PCString::~PCString(&v142);
  }
  v97 = [v8 objectForKeyedSubscript:@"kPVEnableTextDynamicLineSpacing_MainTitle"];
  BOOL v98 = v97 == 0;

  if (!v98)
  {
    v99 = [v11 objectForKeyedSubscript:@"TitleString"];
    v142.var0 = 0;
    PCString::set(&v142, v99);

    v100 = [v8 objectForKeyedSubscript:@"kPVEnableTextDynamicLineSpacing_MainTitle"];
    uint64_t v101 = [v100 BOOLValue];

    OZXEnableTextDynamicLineSpacing(*(void **)a5, &v142, v101);
    if ([(PVMotionEffectTextComponent *)self hasEmojiRenderingWorkaround])
    {
      PCString::PCString(&v141, "MainTitleCopy");
      OZXEnableTextDynamicLineSpacing(*(void **)a5, &v141, v101);
      PCString::~PCString(&v141);
    }
    PCString::~PCString(&v142);
  }
  v102 = [v8 objectForKeyedSubscript:@"TitleLocale"];
  BOOL v103 = v102 == 0;

  if (!v103)
  {
    v104 = [v8 objectForKeyedSubscript:@"TitleLocale"];
    v105 = [v11 objectForKeyedSubscript:@"TitleString"];
    v142.var0 = 0;
    PCString::set(&v142, v105);

    OZXSetPublishedTextLocale(*(void **)a5, &v142, v104);
    v106 = [v11 objectForKeyedSubscript:@"SubtitleString"];
    v141.var0 = 0;
    PCString::set(&v141, v106);

    OZXSetPublishedTextLocale(*(void **)a5, &v141, v104);
    v107 = [v11 objectForKeyedSubscript:@"SecondaryString"];
    v140.var0 = 0;
    PCString::set(&v140, v107);

    OZXSetPublishedTextLocale(*(void **)a5, &v140, v104);
    -[PVMotionEffectTextComponent setIsRightToLeft_NoLock:documentInfo:](self, "setIsRightToLeft_NoLock:documentInfo:", [MEMORY[0x1E4F1CA20] characterDirectionForLanguage:v104] == 2, a5);
    PCString::~PCString(&v140);
    PCString::~PCString(&v141);
    PCString::~PCString(&v142);
  }
  v108 = [v8 objectForKeyedSubscript:@"ImageSequencePathKey"];
  BOOL v109 = v108 == 0;

  if (!v109)
  {
    v110 = [v8 objectForKeyedSubscript:@"ImageSequencePathKey"];
    v142.var0 = 0;
    PCString::set(&v142, v110);
    OZXSetImageSequencePath(*(void *)a5, &v142);
    PCString::~PCString(&v142);
  }
  v111 = [v8 objectForKeyedSubscript:@"StickerPathKey"];
  BOOL v112 = v111 == 0;

  if (!v112)
  {
    v142.var0 = 0;
    PCString::set(&v142, @"AnimatedLayerOpacity");
    v113 = [v8 objectForKeyedSubscript:@"StickerPathKey"];
    v141.var0 = 0;
    PCString::set(&v141, v113);
    if (!OZXSetStickerPathWithPublishedParam(*(void **)a5, &v142, &v141))
    {
      v114 = [(PVMotionEffectComponent *)self motionEffect];
      v115 = [v114 timelineComponent];
      objc_msgSend(v115, "setNeedsToUpdateSceneDuration_NoLock");
    }
    PCString::~PCString(&v141);

    PCString::~PCString(&v142);
  }
  v116 = [v8 objectForKeyedSubscript:@"DisableAnimatedLayer"];
  BOOL v117 = v116 == 0;

  if (!v117)
  {
    v142.var0 = 0;
    PCString::set(&v142, @"AnimatedLayerOpacity");
    v118 = [v8 objectForKeyedSubscript:@"DisableAnimatedLayer"];
    uint64_t v119 = [v118 BOOLValue];

    v120 = [(PVMotionEffectComponent *)self motionEffect];
    [v120 disableElementWithPublishedParam:&v142 disable:v119];

    PCString::~PCString(&v142);
  }
  v121 = [v8 objectForKeyedSubscript:@"DisablePosterLayer"];
  BOOL v122 = v121 == 0;

  if (!v122)
  {
    v142.var0 = 0;
    PCString::set(&v142, @"PosterImageOpacity");
    v123 = [v8 objectForKeyedSubscript:@"DisablePosterLayer"];
    uint64_t v124 = [v123 BOOLValue];

    v125 = [(PVMotionEffectComponent *)self motionEffect];
    [v125 disableElementWithPublishedParam:&v142 disable:v124];

    PCString::~PCString(&v142);
  }
  v126 = [v8 objectForKeyedSubscript:@"TitleString"];
  BOOL v127 = v126 == 0;

  if (!v127)
  {
    v128 = [v8 objectForKeyedSubscript:@"TitleString"];
    v129 = [(PVMotionEffectComponent *)self motionEffect];
    objc_msgSend(v129, "didSetCacheInvalidatingParameter_NoLock:forKey:", v128, @"TitleString");

    -[PVMotionEffectTextComponent setIsRightToLeft_NoLock:documentInfo:](self, "setIsRightToLeft_NoLock:documentInfo:", objc_msgSend(v128, "pv_isRightToLeft"), a5);
  }
  v130 = [v8 objectForKeyedSubscript:@"kPVTextRenderingDisabled"];
  BOOL v131 = v130 == 0;

  if (!v131)
  {
    v132 = [(PVMotionEffectComponent *)self motionEffect];
    v133 = [v8 objectForKeyedSubscript:@"kPVTextRenderingDisabled"];
    objc_msgSend(v132, "didSetCacheInvalidatingParameter_NoLock:forKey:", v133, @"kPVTextRenderingDisabled");
  }
  v134 = [v8 objectForKeyedSubscript:@"UseMinimumLineSpacing"];
  BOOL v135 = v134 == 0;

  if (!v135)
  {
    v136 = [v8 objectForKeyedSubscript:@"UseMinimumLineSpacing"];
    unsigned int v137 = [v136 BOOLValue];

    v142.var0 = 0;
    PCString::set(&v142, @"UseMinimumLineSpacing");
    OZXSetPublishedCheckBox(*(void **)a5, &v142, v137);
    PCString::~PCString(&v142);
  }
}

- (BOOL)hasEmojiRenderingWorkaround
{
  hasEmojiRenderingWorkaround = self->_hasEmojiRenderingWorkaround;
  if (!hasEmojiRenderingWorkaround)
  {
    PCString v4 = [(PVMotionEffectComponent *)self motionEffect];
    unint64_t v5 = [v4 contentRegistryPropertyForKey:@"requireEmojiRenderingWorkaround"];

    if (v5)
    {
      uint64_t v6 = v5;
      unsigned int v7 = self->_hasEmojiRenderingWorkaround;
      self->_hasEmojiRenderingWorkaround = v6;
    }
    else
    {
      id v8 = [(PVMotionEffectComponent *)self motionEffect];
      unsigned int v7 = [v8 effectID];

      if (([v7 isEqualToString:@"4812B57C-ACB7-477C-BE5F-A8AB078788C6"] & 1) != 0
        || ([v7 isEqualToString:@"A1B49D52-F66A-4864-B3DC-D516010655DF"] & 1) != 0
        || ([v7 isEqualToString:@"279AFED2-5BC5-4038-B194-CCC10C505B14"] & 1) != 0
        || ([v7 isEqualToString:@"459DF362-0E9D-49D1-BE0A-3ADE6FB7A8FD"] & 1) != 0)
      {
        uint64_t v9 = 1;
      }
      else
      {
        uint64_t v9 = [v7 isEqualToString:@"504EC51C-D61E-40D8-B622-DBDFD8F3B553"];
      }
      id v10 = [NSNumber numberWithBool:v9];
      id v11 = self->_hasEmojiRenderingWorkaround;
      self->_hasEmojiRenderingWorkaround = v10;
    }
    hasEmojiRenderingWorkaround = self->_hasEmojiRenderingWorkaround;
  }

  return [(NSNumber *)hasEmojiRenderingWorkaround BOOLValue];
}

- (BOOL)supportsFlippingText
{
  uint64_t v2 = [(PVMotionEffectComponent *)self motionEffect];
  char v3 = [v2 supportsParam:@"FlipText"];

  return v3;
}

- (BOOL)supportsOrientation
{
  uint64_t v2 = [(PVMotionEffectComponent *)self motionEffect];
  char v3 = [v2 supportsParam:@"Orientation"];

  return v3;
}

- (BOOL)isTextFlipped
{
  uint64_t v6 = 0;
  unsigned int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  char v3 = [(PVMotionEffectComponent *)self motionEffect];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __44__PVMotionEffectTextComponent_isTextFlipped__block_invoke;
  v5[3] = &unk_1E6169018;
  v5[4] = self;
  v5[5] = &v6;
  [v3 runEnsuringDocumentReadyAndLockingDocument:v5];

  LOBYTE(v3) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v3;
}

void __44__PVMotionEffectTextComponent_isTextFlipped__block_invoke(uint64_t a1, uint64_t a2)
{
  PCString v4 = [*(id *)(a1 + 32) motionEffect];
  unint64_t v5 = objc_msgSend(v4, "publishedParams_NoLock:", a2);

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __44__PVMotionEffectTextComponent_isTextFlipped__block_invoke_2;
  v6[3] = &unk_1E6168FF0;
  v6[4] = *(void *)(a1 + 40);
  [v5 enumerateObjectsUsingBlock:v6];
}

void __44__PVMotionEffectTextComponent_isTextFlipped__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v6 = [v9 objectForKeyedSubscript:@"PVEffectParam_NameKey"];
  int v7 = [@"FlipText" isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = [v9 objectForKeyedSubscript:@"PVEffectParam_ValueKey"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v8 BOOLValue];
    *a4 = 1;
  }
}

- (BOOL)isTitleCard
{
  isTitleCard = self->_isTitleCard;
  if (!isTitleCard)
  {
    PCString v4 = [(PVMotionEffectComponent *)self motionEffect];
    unint64_t v5 = [v4 contentRegistryPropertyForKey:@"effectType"];

    if (v5)
    {
      objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isEqualToString:", @"TitleCard"));
      uint64_t v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      int v7 = self->_isTitleCard;
      self->_isTitleCard = v6;
    }
    else
    {
      uint64_t v8 = [(PVMotionEffectComponent *)self motionEffect];
      int v7 = [v8 effectID];

      if (([v7 isEqualToString:@"7246D03C-508A-4B71-AE0F-5526207AF4A4"] & 1) != 0
        || ([v7 isEqualToString:@"271A5AB5-DC8D-4362-A0B3-0BD771DFDF81"] & 1) != 0
        || ([v7 isEqualToString:@"B4508C18-9B92-45C4-AC68-23C4B473648C"] & 1) != 0
        || ([v7 isEqualToString:@"99A5B4EB-6200-4785-9020-151A86F044F9"] & 1) != 0
        || ([v7 isEqualToString:@"254E82A1-5A1E-4DE3-AF74-5AD853EF8FE1"] & 1) != 0
        || ([v7 isEqualToString:@"DE85B884-F04F-4474-952C-50F14AACABB4"] & 1) != 0
        || ([v7 isEqualToString:@"C2924EA0-DDAB-470F-B5A9-5E8A5BD58C3E"] & 1) != 0
        || ([v7 isEqualToString:@"3DBFF351-E2F1-4E8F-88D1-8A412C3351A6"] & 1) != 0
        || ([v7 isEqualToString:@"4812B57C-ACB7-477C-BE5F-A8AB078788C6"] & 1) != 0
        || ([v7 isEqualToString:@"1392D357-224C-4D93-A0CE-9DAAF74CF2B0"] & 1) != 0
        || ([v7 isEqualToString:@"EA557219-697D-4079-8F57-FBC08826275F"] & 1) != 0
        || ([v7 isEqualToString:@"A1B49D52-F66A-4864-B3DC-D516010655DF"] & 1) != 0
        || ([v7 isEqualToString:@"E3E384F3-992E-4F31-BA6E-77DA8AFA9F7A"] & 1) != 0
        || ([v7 isEqualToString:@"EAD64524-5447-4179-A9C5-6D4C43197DD1"] & 1) != 0
        || ([v7 isEqualToString:@"709F905F-478C-4C74-8563-40BC1F1E4CA4"] & 1) != 0
        || ([v7 isEqualToString:@"EBDD7776-9473-4AC0-A8DD-6D85EA813A47"] & 1) != 0
        || ([v7 isEqualToString:@"4F246C30-ECDF-41B0-BC48-52B2FD46CDFE"] & 1) != 0
        || ([v7 isEqualToString:@"9BC549DA-AF63-4462-B607-721FA91BC04B"] & 1) != 0
        || ([v7 isEqualToString:@"7DACC129-7A01-4850-A0D6-384529E49E62"] & 1) != 0
        || ([v7 isEqualToString:@"2D2CA707-0CA2-45FA-82F5-33BE55AA45E3"] & 1) != 0
        || ([v7 isEqualToString:@"1058897B-324A-491F-B712-36418CC48435"] & 1) != 0
        || ([v7 isEqualToString:@"50B6BB27-38F9-48B7-AE5C-CFE23C1C2FC3"] & 1) != 0
        || ([v7 isEqualToString:@"F00F45D2-4750-4E32-8086-EE791D0EBA02"] & 1) != 0
        || ([v7 isEqualToString:@"49993B68-E73C-4BC7-B5E2-C98BC6DDFFD0"] & 1) != 0
        || ([v7 isEqualToString:@"44D6408C-1870-4E24-BC39-A2A22138E84C"] & 1) != 0
        || ([v7 isEqualToString:@"1BE94FDB-1DA1-4CDD-B936-891D15D82AA2"] & 1) != 0
        || ([v7 isEqualToString:@"9455BB82-099D-471A-8DB0-EC7716C4635D"] & 1) != 0
        || ([v7 isEqualToString:@"3F8EFC0A-43D8-43F9-AECE-5B501705DCBC"] & 1) != 0
        || ([v7 isEqualToString:@"ECE34BCE-E3CD-4AFB-B1A2-88D110B26355"] & 1) != 0
        || ([v7 isEqualToString:@"1A1FE60F-F11A-45E6-86F9-0FB7E019EA2F"] & 1) != 0
        || ([v7 isEqualToString:@"EA8EEFBD-9927-4408-ADBF-9AAF5BC4C5DD"] & 1) != 0
        || ([v7 isEqualToString:@"6D70E926-E76E-4D79-9BAB-0E9993A0CB00"] & 1) != 0
        || ([v7 isEqualToString:@"F233206A-EACA-49EF-82E2-EC00B5BA47C7"] & 1) != 0
        || ([v7 isEqualToString:@"3BD15E1F-1038-4574-8364-969806396CA7"] & 1) != 0
        || ([v7 isEqualToString:@"B42641D8-196D-4C9F-952E-30572B1D39C7"] & 1) != 0
        || ([v7 isEqualToString:@"B5CD8914-97CB-4C88-BAFE-E25495D956B9"] & 1) != 0
        || ([v7 isEqualToString:@"AA515142-046C-4184-9FA2-02692A0621A5"] & 1) != 0
        || ([v7 isEqualToString:@"3FAC5760-CD6E-4342-8892-75CBA062A1E7"] & 1) != 0
        || ([v7 isEqualToString:@"DFE54E4F-314B-4BD0-9FB0-2D5CE51CB393"] & 1) != 0
        || ([v7 isEqualToString:@"55DA00BC-CF8F-4502-B002-FF0DAA3706A8"] & 1) != 0
        || ([v7 isEqualToString:@"E94F8545-F15D-49A1-82CC-E723C33E2DA9"] & 1) != 0
        || ([v7 isEqualToString:@"26BA43BE-C91B-4788-A117-7825B65AF384"] & 1) != 0
        || ([v7 isEqualToString:@"9E9F5A0E-4121-4314-8CCC-7A7AF3F53CC1"] & 1) != 0
        || ([v7 isEqualToString:@"0164A73D-B58B-432F-8C92-BFE5BAD0F68F"] & 1) != 0
        || ([v7 isEqualToString:@"56CD5EB8-CA98-4577-B335-7808A8EC95E0"] & 1) != 0
        || ([v7 isEqualToString:@"83DA2F6E-6F9C-4B03-A72A-8EA2A8C00B7D"] & 1) != 0
        || ([v7 isEqualToString:@"641AED77-1D8F-4F3D-B7D2-062DE10FF322"] & 1) != 0
        || ([v7 isEqualToString:@"04E9BBDA-A24F-40B3-AD78-DB2EF3EF51C9"] & 1) != 0
        || ([v7 isEqualToString:@"7C3A7585-981D-4156-8D6C-0D15E81ECBDA"] & 1) != 0
        || ([v7 isEqualToString:@"02C3D18A-FB4F-4FC4-A9EB-AB550BB20695"] & 1) != 0
        || ([v7 isEqualToString:@"1CFC5B4B-A907-4C4C-8982-87EE7C3C0C99"] & 1) != 0
        || ([v7 isEqualToString:@"87560453-78EA-4306-911B-9C16A5874240"] & 1) != 0
        || ([v7 isEqualToString:@"5D25D471-2949-4E48-A878-58598969A059"] & 1) != 0
        || ([v7 isEqualToString:@"0BAD4C9D-E175-4387-812E-746F63C1EE82"] & 1) != 0
        || ([v7 isEqualToString:@"D03483F6-3B8D-406E-916E-DC0508EF2CF4"] & 1) != 0
        || ([v7 isEqualToString:@"40C0065E-E0B8-4AE3-A34D-2D0146D63A0C"] & 1) != 0
        || ([v7 isEqualToString:@"8B16DA42-A6C8-4010-9994-749CA429CD2D"] & 1) != 0
        || ([v7 isEqualToString:@"BDB422F3-8488-4D47-BBF7-2FF167B3DD9C"] & 1) != 0
        || ([v7 isEqualToString:@"4305C5A2-F115-40A1-A8AB-E497BA1DEE39"] & 1) != 0
        || ([v7 isEqualToString:@"C218EAE5-39AE-4D86-A3AF-B5FCB873E0A0"] & 1) != 0
        || ([v7 isEqualToString:@"CF85F12C-A9C7-4185-9A81-6560C3EA4EB2"] & 1) != 0
        || ([v7 isEqualToString:@"279AFED2-5BC5-4038-B194-CCC10C505B14"] & 1) != 0
        || ([v7 isEqualToString:@"E744F8F4-38A4-4D93-834B-10D46D8D7AE7"] & 1) != 0
        || ([v7 isEqualToString:@"13E0CC97-2290-4865-849A-E3A37164105B"] & 1) != 0
        || ([v7 isEqualToString:@"459DF362-0E9D-49D1-BE0A-3ADE6FB7A8FD"] & 1) != 0
        || ([v7 isEqualToString:@"906A2568-96A4-43B1-AD4E-BBBD383D4646"] & 1) != 0
        || ([v7 isEqualToString:@"CE6C6C3F-AE69-4516-B2C3-1F4191B27318"] & 1) != 0
        || ([v7 isEqualToString:@"20ACE5A4-BE22-4541-BCD9-FC6A8D1E266D"] & 1) != 0
        || ([v7 isEqualToString:@"32FBEABC-4881-4154-B9A7-79FD6ECE5ECD"] & 1) != 0
        || ([v7 isEqualToString:@"A5A681D7-8C51-402C-9A15-4B996AE38E45"] & 1) != 0
        || ([v7 isEqualToString:@"82EDB011-4CAF-4A22-B24B-D99814B0D059"] & 1) != 0
        || ([v7 isEqualToString:@"01A2D980-5125-43CB-826E-A45E1CDF83C5"] & 1) != 0
        || ([v7 isEqualToString:@"287BC0EB-7624-40DB-87C0-9891C8A752A2"] & 1) != 0
        || ([v7 isEqualToString:@"8440623A-D290-4762-9893-EB73D0CAE529"] & 1) != 0
        || ([v7 isEqualToString:@"75D7C5F6-2AE1-408F-827D-B3A9A87CDB98"] & 1) != 0
        || ([v7 isEqualToString:@"86133246-DF67-47C1-A0B0-055E581B662D"] & 1) != 0
        || ([v7 isEqualToString:@"6ED63A65-3A1C-44EE-ABC2-D8B4ED9B86D1"] & 1) != 0
        || ([v7 isEqualToString:@"A63DE1CB-B1D9-436F-B416-7AB9E2D2AB30"] & 1) != 0
        || ([v7 isEqualToString:@"1A58D239-4B27-40F9-9950-91EC95D51FE5"] & 1) != 0
        || ([v7 isEqualToString:@"7124BE8D-8171-4151-B481-BDE7EB5F300F"] & 1) != 0
        || ([v7 isEqualToString:@"70514DD2-9BE8-4393-944B-789C75C90D05"] & 1) != 0
        || ([v7 isEqualToString:@"082A9F1A-894D-43E2-9A0B-A7FACFC7E244"] & 1) != 0
        || ([v7 isEqualToString:@"E633E06F-3407-4995-B4EF-2C5A98CA87AC"] & 1) != 0
        || ([v7 isEqualToString:@"1AC46DD5-7F6E-4289-9AC7-0E2D542B118D"] & 1) != 0
        || ([v7 isEqualToString:@"D2381DA0-0FFA-4058-9160-386F6C03A7AE"] & 1) != 0
        || ([v7 isEqualToString:@"ECB457A2-D69C-4208-AA7E-C6413F9637C6"] & 1) != 0)
      {
        uint64_t v9 = 1;
      }
      else
      {
        uint64_t v9 = [v7 isEqualToString:@"EDFCC454-8DB8-4DBC-A6C9-0667BD020A7F"];
      }
      id v10 = [NSNumber numberWithBool:v9];
      id v11 = self->_isTitleCard;
      self->_isTitleCard = v10;
    }
    isTitleCard = self->_isTitleCard;
  }

  return [(NSNumber *)isTitleCard BOOLValue];
}

- (int)orientation
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  char v3 = [(PVMotionEffectComponent *)self motionEffect];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __42__PVMotionEffectTextComponent_orientation__block_invoke;
  v5[3] = &unk_1E6169018;
  v5[4] = self;
  v5[5] = &v6;
  [v3 runEnsuringDocumentReadyAndLockingDocument:v5];

  LODWORD(v3) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v3;
}

void __42__PVMotionEffectTextComponent_orientation__block_invoke(uint64_t a1, uint64_t a2)
{
  PCString v4 = [*(id *)(a1 + 32) motionEffect];
  unint64_t v5 = objc_msgSend(v4, "publishedParams_NoLock:", a2);

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __42__PVMotionEffectTextComponent_orientation__block_invoke_2;
  v6[3] = &unk_1E6168FF0;
  v6[4] = *(void *)(a1 + 40);
  [v5 enumerateObjectsUsingBlock:v6];
}

void __42__PVMotionEffectTextComponent_orientation__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  uint64_t v6 = [v9 objectForKeyedSubscript:@"PVEffectParam_NameKey"];
  int v7 = [@"Orientation" isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = [v9 objectForKeyedSubscript:@"PVEffectParam_ValueKey"];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v8 intValue];
    *a4 = 1;
  }
}

- (BOOL)isRightToLeftWithCurrentLocale
{
  uint64_t v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  char v3 = [v2 localeIdentifier];
  BOOL v4 = [MEMORY[0x1E4F1CA20] characterDirectionForLanguage:v3] == 2;

  return v4;
}

- (void)setIsRightToLeft_NoLock:(BOOL)a3 documentInfo:(const void *)a4
{
  unsigned int v5 = a3;
  v6.var0 = 0;
  PCString::set(&v6, @"IsRightToLeft");
  OZXSetPublishedCheckBox(*(void **)a4, &v6, v5);
  PCString::~PCString(&v6);
}

- (void)effect:(id)a3 updateProperties:(id)a4 allProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PVMotionEffectTextComponent;
  [(PVMotionEffectComponent *)&v17 effect:v8 updateProperties:v9 allProperties:v10];
  id v11 = [(PVMotionEffectComponent *)self motionEffect];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = *(void *)"";
  v14[2] = __69__PVMotionEffectTextComponent_effect_updateProperties_allProperties___block_invoke;
  v14[3] = &unk_1E6169040;
  v14[4] = self;
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  objc_msgSend(v11, "runWithDocument_NoLock:", v14);
}

uint64_t __69__PVMotionEffectTextComponent_effect_updateProperties_allProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setupTitleParameters:*(void *)(a1 + 40) allProperties:*(void *)(a1 + 48) documentInfo:a2];
}

- (void)motionEffect:(id)a3 willOpenMedia:(const void *)a4 properties:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffectTextComponent;
  [(PVMotionEffectComponent *)&v10 motionEffect:v8 willOpenMedia:a4 properties:v9];
  [(PVMotionEffectTextComponent *)self setupTitleParameters:v9 allProperties:v9 documentInfo:a4];
}

- (void)motionEffect:(id)a3 didBecomeReady:(const void *)a4 properties:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffectTextComponent;
  [(PVMotionEffectComponent *)&v10 motionEffect:v8 didBecomeReady:a4 properties:v9];
  [(PVMotionEffectTextComponent *)self storeDefaultStrings:a4];
  [(PVMotionEffectTextComponent *)self setIsRightToLeft_NoLock:[(PVMotionEffectTextComponent *)self isRightToLeftWithCurrentLocale] documentInfo:a4];
}

- (void)motionEffectDidUnload:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PVMotionEffectTextComponent;
  [(PVMotionEffectComponent *)&v7 motionEffectDidUnload:a3];
  textObjectIDs = (void **)self->_textObjectIDs;
  if (textObjectIDs)
  {
    unsigned int v5 = *textObjectIDs;
    if (*textObjectIDs)
    {
      textObjectIDs[1] = v5;
      operator delete(v5);
    }
    MEMORY[0x1BA9BFBA0](textObjectIDs, 0x10C402FEFCB83);
    self->_textObjectIDs = 0;
  }
  defaultAttributedStrings = self->_defaultAttributedStrings;
  self->_defaultAttributedStrings = 0;
}

+ (id)motionEffectPropertyKeyToPublishedParameterNameMap
{
  v9[13] = *MEMORY[0x1E4F143B8];
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PVMotionEffectTextComponent;
  uint64_t v2 = objc_msgSendSuper2(&v7, sel_motionEffectPropertyKeyToPublishedParameterNameMap);
  char v3 = (void *)[v2 mutableCopy];

  v8[0] = @"TitleString";
  v8[1] = @"SubtitleString";
  v9[0] = @"MainTitle";
  v9[1] = @"Subtitle";
  v8[2] = @"SecondaryString";
  v8[3] = @"MainTitleFontName";
  v9[2] = @"SecondaryTitle";
  v9[3] = @"MainFont";
  v8[4] = @"SubTitleFontName";
  v8[5] = @"SecondaryTitleFontName";
  v9[4] = @"SubtitleFont";
  v9[5] = @"SecondaryFont";
  v8[6] = @"BackgroundColor";
  void v8[7] = @"PrimaryColor";
  v9[6] = @"BackgroundColor";
  v9[7] = @"PrimaryColor";
  v8[8] = @"SecondaryColor";
  v8[9] = @"TitleStyle";
  v9[8] = @"SecondaryColor";
  v9[9] = @"TitleStyle";
  v8[10] = @"ForceDisableBackgroundShape";
  v8[11] = @"kPVFlipTextKey";
  v9[10] = @"DisableBackgroundShape";
  v9[11] = @"FlipText";
  v8[12] = @"kPVOrientationKey";
  v9[12] = @"Orientation";
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:13];
  if ([v3 count])
  {
    [v3 addEntriesFromDictionary:v4];
    id v5 = v3;

    BOOL v4 = v5;
  }

  return v4;
}

- (BOOL)motionEffect:(id)a3 propertiesDisableCache:(id)a4 time:(id *)a5 forcePosterFrame:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a5;
  v14.receiver = self;
  v14.super_class = (Class)PVMotionEffectTextComponent;
  if ([(PVMotionEffectComponent *)&v14 motionEffect:a3 propertiesDisableCache:v10 time:&v15 forcePosterFrame:v6])
  {
    char v11 = 1;
  }
  else
  {
    id v12 = [v10 objectForKeyedSubscript:@"kPVTextRenderingDisabled"];
    char v11 = [v12 BOOLValue];
  }
  return v11;
}

- (id)motionEffectPropertyKeysThatInvalidateCachedRender:(id)a3
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffectTextComponent;
  char v3 = [(PVMotionEffectComponent *)&v10 motionEffectPropertyKeysThatInvalidateCachedRender:a3];
  BOOL v4 = (void *)MEMORY[0x1E4F1CA80];
  v11[0] = @"TitleString";
  v11[1] = @"kPVFlipTextKey";
  v11[2] = @"kPVTextRenderingDisabled";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  BOOL v6 = [v4 setWithArray:v5];

  objc_super v7 = [v3 anyObject];
  LOBYTE(v5) = v7 == 0;

  if ((v5 & 1) == 0)
  {
    id v8 = [v3 allObjects];
    [v6 addObjectsFromArray:v8];
  }

  return v6;
}

- (BOOL)motionEffect:(id)a3 shouldInvalidateCachedRenderForProperty:(id)a4 oldValue:(id)a5 newValue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PVMotionEffectTextComponent;
  if ([(PVMotionEffectComponent *)&v17 motionEffect:v10 shouldInvalidateCachedRenderForProperty:v11 oldValue:v12 newValue:v13])
  {
    char v14 = 1;
  }
  else
  {
    if ([v11 isEqualToString:@"TitleString"])
    {
      char v15 = [v12 isEqualToString:v13];
    }
    else
    {
      if (![v11 isEqualToString:@"kPVTextRenderingDisabled"]
        && ![v11 isEqualToString:@"kPVFlipTextKey"])
      {
        char v14 = 0;
        goto LABEL_9;
      }
      char v15 = PVNumbersAreEqualAsBooleans(v12, v13);
    }
    char v14 = v15 ^ 1;
  }
LABEL_9:

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isTitleCard, 0);
  objc_storeStrong((id *)&self->_hasEmojiRenderingWorkaround, 0);

  objc_storeStrong((id *)&self->_defaultAttributedStrings, 0);
}

@end