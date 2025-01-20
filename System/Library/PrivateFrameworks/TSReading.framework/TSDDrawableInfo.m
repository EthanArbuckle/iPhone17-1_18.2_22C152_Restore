@interface TSDDrawableInfo
+ (BOOL)canPartition;
+ (void)setShouldPartitionByDefault:(BOOL)a3;
- (BOOL)aspectRatioLocked;
- (BOOL)canAnchor;
- (BOOL)canChangeWrapType;
- (BOOL)canSizeBeChangedIncrementally;
- (BOOL)containsProperty:(int)a3;
- (BOOL)isAnchoredToText;
- (BOOL)isAttachedToBodyText;
- (BOOL)isFloatingAboveText;
- (BOOL)isInlineWithText;
- (BOOL)isLockable;
- (BOOL)isLocked;
- (BOOL)isThemeContent;
- (BOOL)isUserModifiable;
- (BOOL)matchesObjectPlaceholderGeometry;
- (BOOL)reverseChunkingIsSupported;
- (BOOL)supportsAttachedComments;
- (BOOL)supportsHyperlinks;
- (CGAffineTransform)computeFullTransform;
- (CGAffineTransform)computeLayoutFullTransform;
- (CGAffineTransform)fullTransformInRoot;
- (CGAffineTransform)transformInRoot;
- (CGPoint)transformableObjectAnchorPoint;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (NSMutableDictionary)accessibilityDescriptions;
- (NSString)accessibilityDescription;
- (NSURL)hyperlinkURL;
- (TSDAnnotationHosting)comment;
- (TSDContainerInfo)parentInfo;
- (TSDDrawableInfo)initWithContext:(id)a3 geometry:(id)a4;
- (TSDExteriorTextWrap)exteriorTextWrap;
- (TSDInfoGeometry)geometry;
- (TSDOwningAttachment)owningAttachment;
- (TSDOwningAttachment)owningAttachmentNoRecurse;
- (double)CGFloatValueForProperty:(int)a3;
- (double)doubleValueForProperty:(int)a3;
- (float)floatValueForProperty:(int)a3;
- (id)animationFilters;
- (id)boxedObjectForProperty:(int)a3;
- (id)containingGroup;
- (id)copyWithContext:(id)a3;
- (id)descriptionForPasteboard;
- (id)endCollectingChanges;
- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4;
- (id)objectForProperty:(int)a3;
- (id)partitioner;
- (id)presetKind;
- (id)searchForAnnotationsWithHitBlock:(id)a3;
- (id)textureDeliveryStylesLocalized:(BOOL)a3 animationFilter:(id)a4;
- (id)transformedGeometryWithTransform:(CGAffineTransform *)a3 inBounds:(CGRect)a4;
- (int)elementKind;
- (int)intValueForProperty:(int)a3;
- (int64_t)mixingTypeWithObject:(id)a3;
- (unint64_t)chunkCountForTextureDeliveryStyle:(unint64_t)a3 animationFilter:(id)a4;
- (unint64_t)chunkCountForTextureDeliveryStyle:(unint64_t)a3 byGlyphStyle:(int)a4 animationFilter:(id)a5;
- (unint64_t)textureDeliveryStyleFromDeliveryString:(id)a3;
- (void)beginCollectingChanges;
- (void)clearBackPointerToParentInfoIfNeeded:(id)a3;
- (void)coalesceChanges:(id)a3;
- (void)dealloc;
- (void)performBlockWithTemporaryLayout:(id)a3;
- (void)setAccessibilityDescription:(id)a3;
- (void)setAccessibilityDescriptions:(id)a3;
- (void)setAspectRatioLocked:(BOOL)a3;
- (void)setComment:(id)a3;
- (void)setExteriorTextWrap:(id)a3;
- (void)setGeometry:(id)a3;
- (void)setHyperlinkURL:(id)a3;
- (void)setInsertionCenterPosition:(CGPoint)a3;
- (void)setLocked:(BOOL)a3;
- (void)setOwningAttachment:(id)a3;
- (void)setParentInfo:(id)a3;
- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)wasRemovedFromDocumentRoot:(id)a3;
- (void)willChangeProperties:(id)a3;
- (void)willChangeProperty:(int)a3;
@end

@implementation TSDDrawableInfo

- (TSDExteriorTextWrap)exteriorTextWrap
{
  return self->mExteriorTextWrap;
}

+ (BOOL)canPartition
{
  return sInfosPartitionByDefault;
}

- (void)setParentInfo:(id)a3
{
  self->mParentInfo = (TSDContainerInfo *)a3;
}

- (void)setOwningAttachment:(id)a3
{
  self->mOwningAttachment = (TSDOwningAttachment *)a3;
}

- (int)elementKind
{
  return 1;
}

- (TSDOwningAttachment)owningAttachment
{
  mOwningAttachment = self->mOwningAttachment;
  [(TSDDrawableInfo *)self parentInfo];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return mOwningAttachment;
  }
  v4 = [(TSDDrawableInfo *)self parentInfo];

  return [(TSDContainerInfo *)v4 owningAttachment];
}

- (TSDContainerInfo)parentInfo
{
  return self->mParentInfo;
}

- (TSDDrawableInfo)initWithContext:(id)a3 geometry:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSDDrawableInfo;
  v5 = [(TSPObject *)&v7 initWithContext:a3];
  if (v5)
  {
    v5->mGeometry = (TSDInfoGeometry *)a4;
    v5->mExteriorTextWrap = [[TSDExteriorTextWrap alloc] initWithIsHTMLWrap:0 type:4 direction:2 fitType:1 margin:12.0 alphaThreshold:0.5];
    v5->mAspectRatioLocked = 0;
  }
  return v5;
}

- (void)dealloc
{
  self->mParentInfoReference = 0;
  self->mParentInfo = 0;

  v3.receiver = self;
  v3.super_class = (Class)TSDDrawableInfo;
  [(TSDDrawableInfo *)&v3 dealloc];
}

- (void)clearBackPointerToParentInfoIfNeeded:(id)a3
{
  if (self->mParentInfo == a3) {
    self->mParentInfo = 0;
  }
}

- (TSDAnnotationHosting)comment
{
  return self->mComment;
}

- (void)setComment:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->mComment = (TSDAnnotationHosting *)a3;
}

- (TSDOwningAttachment)owningAttachmentNoRecurse
{
  return self->mOwningAttachment;
}

- (void)setGeometry:(id)a3
{
  [(TSPObject *)self willModify];
  if (!a3)
  {
    id v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDDrawableInfo setGeometry:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableInfo.m"), 181, @"invalid nil value for '%s'", "newGeometry");
  }
  if (([a3 isEqual:self->mGeometry] & 1) == 0)
  {
    if ([a3 isEqualExceptForPosition:self->mGeometry]) {
      uint64_t v7 = 513;
    }
    else {
      uint64_t v7 = 512;
    }
    [(TSDDrawableInfo *)self willChangeProperty:v7];

    self->mGeometry = (TSDInfoGeometry *)a3;
    [(TSDDrawableInfo *)self setMatchesObjectPlaceholderGeometry:0];
  }
}

- (TSDInfoGeometry)geometry
{
  return self->mGeometry;
}

- (void)setHyperlinkURL:(id)a3
{
  if (([a3 isEqual:self->mHyperlinkURL] & 1) == 0)
  {
    [(TSPObject *)self willModify];
    [(TSDDrawableInfo *)self willChangeProperty:524];

    self->mHyperlinkURL = (NSURL *)a3;
  }
}

- (void)setAccessibilityDescription:(id)a3
{
  if (([a3 isEqualToString:self->mAccessibilityDescription] & 1) == 0)
  {
    [(TSPObject *)self willModify];

    self->mAccessibilityDescription = (NSString *)[a3 copy];
  }
}

- (void)setLocked:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3)
  {
    p_mLocked = &self->mLocked;
    if (!self->mLocked) {
      return;
    }
    goto LABEL_8;
  }
  if (![(TSDDrawableInfo *)self isLockable])
  {
    id v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDDrawableInfo setLocked:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableInfo.m"), 239, @"Invalid attempt to lock an unlockable object.");
  }
  p_mLocked = &self->mLocked;
  if (self->mLocked != v3 && [(TSDDrawableInfo *)self isLockable])
  {
LABEL_8:
    [(TSPObject *)self willModify];
    BOOL *p_mLocked = v3;
  }
}

- (void)setAspectRatioLocked:(BOOL)a3
{
  if (self->mAspectRatioLocked != a3)
  {
    [(TSDDrawableInfo *)self willChangeProperty:525];
    [(TSPObject *)self willModify];
    self->mAspectRatioLocked = a3;
  }
}

- (BOOL)canSizeBeChangedIncrementally
{
  return 1;
}

- (void)performBlockWithTemporaryLayout:(id)a3
{
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObject:self];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__TSDDrawableInfo_performBlockWithTemporaryLayout___block_invoke;
  v6[3] = &unk_2646B1540;
  v6[4] = self;
  v6[5] = a3;
  +[TSDLayoutController temporaryLayoutControllerForInfos:v5 useInBlock:v6];
}

uint64_t __51__TSDDrawableInfo_performBlockWithTemporaryLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [a2 layoutForInfo:*(void *)(a1 + 32)];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (CGAffineTransform)computeLayoutFullTransform
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x5010000000;
  v12 = &unk_22389B221;
  long long v4 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v13 = *MEMORY[0x263F000D0];
  long long v14 = v4;
  long long v15 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__TSDDrawableInfo_computeLayoutFullTransform__block_invoke;
  v8[3] = &unk_2646B1568;
  v8[4] = &v9;
  [(TSDDrawableInfo *)self performBlockWithTemporaryLayout:v8];
  uint64_t v5 = v10;
  long long v6 = *((_OWORD *)v10 + 3);
  *(_OWORD *)&retstr->a = *((_OWORD *)v10 + 2);
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *((_OWORD *)v5 + 4);
  _Block_object_dispose(&v9, 8);
  return result;
}

__n128 __45__TSDDrawableInfo_computeLayoutFullTransform__block_invoke(uint64_t a1, void *a2)
{
  long long v4 = (void *)[a2 geometry];
  if (v4)
  {
    [v4 transform];
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
  }
  uint64_t v5 = *(_OWORD **)(*(void *)(a1 + 32) + 8);
  long long v7 = v26;
  long long v6 = v27;
  v5[2] = v25;
  v5[3] = v7;
  v5[4] = v6;
  [a2 boundsForStandardKnobs];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  v12 = *(_OWORD **)(*(void *)(a1 + 32) + 8);
  CGAffineTransformMakeTranslation(&t1, v13, v14);
  long long v15 = v12[3];
  *(_OWORD *)&v22.a = v12[2];
  *(_OWORD *)&v22.c = v15;
  *(_OWORD *)&v22.tx = v12[4];
  CGAffineTransformConcat(&v24, &t1, &v22);
  long long v17 = *(_OWORD *)&v24.c;
  long long v16 = *(_OWORD *)&v24.tx;
  v12[2] = *(_OWORD *)&v24.a;
  v12[3] = v17;
  v12[4] = v16;
  v18 = *(_OWORD **)(*(void *)(a1 + 32) + 8);
  long long v19 = v18[3];
  *(_OWORD *)&v22.a = v18[2];
  *(_OWORD *)&v22.c = v19;
  *(_OWORD *)&v22.tx = v18[4];
  CGAffineTransformScale(&v24, &v22, v9, v11);
  long long v21 = *(_OWORD *)&v24.c;
  __n128 result = *(__n128 *)&v24.tx;
  v18[2] = *(_OWORD *)&v24.a;
  v18[3] = v21;
  v18[4] = result;
  return result;
}

- (CGAffineTransform)computeFullTransform
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  __n128 result = (CGAffineTransform *)[(TSDInfoGeometry *)[(TSDDrawableInfo *)self geometry] widthValid];
  if (!result
    || (__n128 result = (CGAffineTransform *)[(TSDInfoGeometry *)[(TSDDrawableInfo *)self geometry] heightValid], (result & 1) == 0))
  {
    if (self)
    {
      __n128 result = [(TSDDrawableInfo *)self computeLayoutFullTransform];
      goto LABEL_8;
    }
LABEL_7:
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
    goto LABEL_8;
  }
  __n128 result = [(TSDDrawableInfo *)self geometry];
  if (!result) {
    goto LABEL_7;
  }
  __n128 result = (CGAffineTransform *)[(CGAffineTransform *)result fullTransform];
LABEL_8:
  long long v6 = v8;
  *(_OWORD *)&retstr->a = v7;
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = v9;
  return result;
}

- (CGAffineTransform)fullTransformInRoot
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  uint64_t v5 = [(TSDDrawableInfo *)self geometry];
  if (v5)
  {
    [(TSDInfoGeometry *)v5 fullTransform];
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  objc_opt_class();
  [(TSDDrawableInfo *)self parentInfo];
  __n128 result = (CGAffineTransform *)TSUDynamicCast();
  if (result)
  {
    [(CGAffineTransform *)result transformInRoot];
    long long v7 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v9.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v9.c = v7;
    *(_OWORD *)&v9.tx = *(_OWORD *)&retstr->tx;
    __n128 result = CGAffineTransformConcat(&v11, &v9, &t2);
    long long v8 = *(_OWORD *)&v11.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v11.a;
    *(_OWORD *)&retstr->c = v8;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v11.tx;
  }
  return result;
}

- (CGAffineTransform)transformInRoot
{
  uint64_t v4 = MEMORY[0x263F000D0];
  long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v4 + 32);
  if (self)
  {
    long long v6 = self;
    do
    {
      long long v7 = (void *)[(CGAffineTransform *)v6 geometry];
      if (v7) {
        [v7 transform];
      }
      else {
        memset(&t2, 0, sizeof(t2));
      }
      long long v8 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v9.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v9.c = v8;
      *(_OWORD *)&v9.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransformConcat(retstr, &v9, &t2);
      objc_opt_class();
      [(CGAffineTransform *)v6 parentInfo];
      self = (CGAffineTransform *)TSUDynamicCast();
      long long v6 = self;
    }
    while (self);
  }
  return self;
}

- (BOOL)isFloatingAboveText
{
  return [(TSDDrawableInfo *)self owningAttachmentNoRecurse] == 0;
}

- (BOOL)isAnchoredToText
{
  uint64_t v2 = [(TSDDrawableInfo *)self owningAttachmentNoRecurse];

  return [(TSDOwningAttachment *)v2 isAnchored];
}

- (BOOL)isInlineWithText
{
  if ([(TSDDrawableInfo *)self isFloatingAboveText]) {
    return 0;
  }
  else {
    return ![(TSDDrawableInfo *)self isAnchoredToText];
  }
}

- (BOOL)isAttachedToBodyText
{
  uint64_t v2 = [(TSDDrawableInfo *)self owningAttachmentNoRecurse];

  return [(TSDOwningAttachment *)v2 isAttachedToBodyText];
}

- (void)setExteriorTextWrap:(id)a3
{
  [(TSPObject *)self willModify];
  if (!a3)
  {
    long long v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDDrawableInfo setExteriorTextWrap:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableInfo.m"), 340, @"invalid nil value for '%s'", "exteriorTextWrap");
  }
  if (([a3 isEqual:self->mExteriorTextWrap] & 1) == 0)
  {
    [(TSDDrawableInfo *)self willChangeProperty:521];

    self->mExteriorTextWrap = (TSDExteriorTextWrap *)[a3 copy];
  }
}

- (BOOL)isUserModifiable
{
  return 1;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isThemeContent
{
  uint64_t v2 = [(TSDDrawableInfo *)self parentInfo];

  return [(TSDContainerInfo *)v2 isThemeContent];
}

- (id)partitioner
{
  if (![(id)objc_opt_class() canPartition]) {
    return 0;
  }
  mDefaultPartitioner = self->mDefaultPartitioner;
  if (!mDefaultPartitioner)
  {
    mDefaultPartitioner = [[TSDDefaultPartitioner alloc] initWithInfo:self];
    self->mDefaultPartitioner = mDefaultPartitioner;
  }
  uint64_t v4 = mDefaultPartitioner;

  return v4;
}

+ (void)setShouldPartitionByDefault:(BOOL)a3
{
  sInfosPartitionByDefault = a3;
}

- (BOOL)supportsHyperlinks
{
  return 1;
}

- (id)presetKind
{
  return (id)String;
}

- (BOOL)isLockable
{
  BOOL v3 = [(TSDDrawableInfo *)self isFloatingAboveText];
  if (v3) {
    LOBYTE(v3) = [(TSDDrawableInfo *)self containingGroup] == 0;
  }
  return v3;
}

- (id)copyWithContext:(id)a3
{
  uint64_t v4 = [objc_alloc((Class)objc_opt_class()) initWithContext:a3];
  if (v4)
  {
    *(void *)(v4 + 48) = [(TSDInfoGeometry *)self->mGeometry copy];
    *(void *)(v4 + 88) = [(TSDExteriorTextWrap *)self->mExteriorTextWrap copy];
    *(unsigned char *)(v4 + 72) = self->mLocked;
    *(unsigned char *)(v4 + 73) = self->mAspectRatioLocked;
    *(void *)(v4 + 128) = [(NSString *)self->mAccessibilityDescription copy];
    *(void *)(v4 + 136) = [(NSMutableDictionary *)self->mAccessibilityDescriptions mutableCopy];
    *(void *)(v4 + 112) = [(NSURL *)self->mHyperlinkURL copy];
  }
  return (id)v4;
}

- (BOOL)canAnchor
{
  return 1;
}

- (BOOL)supportsAttachedComments
{
  return 1;
}

- (id)searchForAnnotationsWithHitBlock:(id)a3
{
  if ([(TSDDrawableInfo *)self comment])
  {
    long long v5 = +[TSDCanvasSearchReference searchReferenceWithDrawableInfo:self];
    [(TSDCanvasSearchReference *)v5 setAnnotation:[(TSDDrawableInfo *)self comment]];
    (*((void (**)(id, TSDCanvasSearchReference *))a3 + 2))(a3, v5);
  }
  return 0;
}

- (void)beginCollectingChanges
{
  if (!self->mChanges
    || (BOOL v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v4 = [NSString stringWithUTF8String:"-[TSDDrawableInfo beginCollectingChanges]"],
        objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableInfo.m"), 489, @"don't try to beginCollectingChanges when we are already collecting"), !self->mChanges))
  {
    self->mChanges = objc_alloc_init(TSSPropertySetChangeDetails);
  }
}

- (void)willChangeProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  [(TSPObject *)self willModify];
  mChanges = self->mChanges;

  [(TSSPropertySetChangeDetails *)mChanges addChangedProperty:v3];
}

- (void)willChangeProperties:(id)a3
{
  [(TSPObject *)self willModify];
  mChanges = self->mChanges;

  [(TSSPropertySetChangeDetails *)mChanges addChangedProperties:a3];
}

- (id)endCollectingChanges
{
  mChanges = self->mChanges;
  if (!mChanges)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSDDrawableInfo endCollectingChanges]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableInfo.m"), 515, @"don't try to endCollectingChanges without calling -beginCollectingChanges first");
    mChanges = self->mChanges;
  }
  self->mChanges = 0;

  return mChanges;
}

- (void)coalesceChanges:(id)a3
{
  unint64_t v4 = [a3 count];
  if (v4 >= 2)
  {
    unint64_t v5 = v4;
    id v6 = objc_alloc_init(MEMORY[0x263F7C860]);
    unint64_t v7 = v5 - 1;
    do
    {
      long long v8 = (void *)[a3 objectAtIndex:v7];
      CGAffineTransform v9 = objc_msgSend(v6, "objectForKey:", objc_msgSend(v8, "kind"));
      objc_opt_class();
      [v8 details];
      double v10 = (void *)TSUDynamicCast();
      if (v10)
      {
        if (v9)
        {
          objc_msgSend(v9, "addChangedProperties:", objc_msgSend(v10, "changedProperties"));
          [a3 removeObjectAtIndex:v7];
        }
        else
        {
          objc_msgSend(v6, "setObject:forKey:", v10, objc_msgSend(v8, "kind"));
        }
      }
      --v7;
    }
    while (v7 != -1);
  }
}

- (Class)editorClass
{
  return (Class)objc_opt_class();
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  if ([(TSDDrawableInfo *)self comment])
  {
    unint64_t v5 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"kTSDAnnotationInvalidatedNotification" object:a3];
  }
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  if ([(TSDDrawableInfo *)self comment])
  {
    unint64_t v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v4 postNotificationName:@"kTSDAnnotationInvalidatedNotification" object:a3];
  }
}

- (BOOL)canChangeWrapType
{
  return 1;
}

- (id)animationFilters
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", kTSDAnimationFilterStandard, kTSDAnimationFilterNotMovie, 0);
}

- (unint64_t)chunkCountForTextureDeliveryStyle:(unint64_t)a3 animationFilter:(id)a4
{
  return [(TSDDrawableInfo *)self chunkCountForTextureDeliveryStyle:a3 byGlyphStyle:0 animationFilter:a4];
}

- (unint64_t)chunkCountForTextureDeliveryStyle:(unint64_t)a3 byGlyphStyle:(int)a4 animationFilter:(id)a5
{
  return 1;
}

- (unint64_t)textureDeliveryStyleFromDeliveryString:(id)a3
{
  if (textureDeliveryStyleFromDeliveryString__onceToken != -1) {
    dispatch_once(&textureDeliveryStyleFromDeliveryString__onceToken, &__block_literal_global_23);
  }
  unint64_t result = [(id)textureDeliveryStyleFromDeliveryString__sDeliveryStyleMap objectForKeyedSubscript:a3];
  if (result)
  {
    return [(id)result unsignedIntegerValue];
  }
  return result;
}

void *__58__TSDDrawableInfo_textureDeliveryStyleFromDeliveryString___block_invoke()
{
  textureDeliveryStyleFromDeliveryString__sDeliveryStyleMap = (uint64_t)&unk_26D73A830;
  return &unk_26D73A830;
}

- (id)textureDeliveryStylesLocalized:(BOOL)a3 animationFilter:(id)a4
{
  unint64_t v4 = (void *)MEMORY[0x263EFF8C0];
  if (a3) {
    unint64_t v5 = (__CFString *)[(id)TSDBundle() localizedStringForKey:@"All at Once" value:&stru_26D688A48 table:@"TSDrawables"];
  }
  else {
    unint64_t v5 = @"All at Once";
  }

  return (id)[v4 arrayWithObject:v5];
}

- (BOOL)reverseChunkingIsSupported
{
  return 1;
}

- (id)descriptionForPasteboard
{
  v5[3] = *MEMORY[0x263EF8340];
  v4[0] = @"anchoredToText";
  v5[0] = objc_msgSend(NSNumber, "numberWithBool:", -[TSDDrawableInfo isAnchoredToText](self, "isAnchoredToText"));
  v4[1] = @"floatingAboveText";
  v5[1] = objc_msgSend(NSNumber, "numberWithBool:", -[TSDDrawableInfo isFloatingAboveText](self, "isFloatingAboveText"));
  v4[2] = @"inlineWithText";
  v5[2] = objc_msgSend(NSNumber, "numberWithBool:", -[TSDDrawableInfo isInlineWithText](self, "isInlineWithText"));
  return (id)[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (id)containingGroup
{
  objc_opt_class();
  [(TSDDrawableInfo *)self parentInfo];
  uint64_t v3 = (void *)TSUDynamicCast();
  objc_opt_class();
  id result = (id)TSUDynamicCast();
  if (v3) {
    BOOL v5 = result == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    return (id)[v3 containingGroup];
  }
  return result;
}

- (int64_t)mixingTypeWithObject:(id)a3
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"-[TSDDrawableInfo mixingTypeWithObject:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableInfo.m"), 717, @"TSDDrawableInfo does not implement TSDMixing!");
  return 1;
}

- (id)mixedObjectWithFraction:(double)a3 ofObject:(id)a4
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a4, a3);
  uint64_t v5 = [NSString stringWithUTF8String:"-[TSDDrawableInfo mixedObjectWithFraction:ofObject:]"];
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDDrawableInfo.m"), 724, @"TSDDrawableInfo does not implement TSDMixing!");
  return 0;
}

- (id)transformedGeometryWithTransform:(CGAffineTransform *)a3 inBounds:(CGRect)a4
{
  double v6 = TSDCenterOfRect(a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v28 = v6 / a3->a;
  unint64_t v7 = (void *)[(TSDInfoGeometry *)[(TSDDrawableInfo *)self geometry] mutableCopy];
  float a = a3->a;
  float d = a3->d;
  double v10 = fminf(a, d);
  [v7 size];
  objc_msgSend(v7, "setSize:", TSDMultiplySizeScalar(v11, v12, v10));
  [(TSDDrawableInfo *)self transformableObjectAnchorPoint];
  double v14 = v13;
  double v16 = v15;
  [v7 position];
  double v18 = TSDSubtractPoints(v14, v16, v17);
  double v20 = v19;
  double v21 = TSDSubtractPoints(v14, v16, v28);
  double v23 = TSDAddPoints(v21 * v10, v22 * v10, v6);
  double v25 = v24;
  double v26 = TSDMultiplyPointScalar(v18, v20, v10);
  objc_msgSend(v7, "setPosition:", TSDSubtractPoints(v23, v25, v26));

  return v7;
}

- (CGPoint)transformableObjectAnchorPoint
{
  uint64_t v2 = [(TSDDrawableInfo *)self geometry];

  [(TSDInfoGeometry *)v2 center];
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)matchesObjectPlaceholderGeometry
{
  return 0;
}

- (NSURL)hyperlinkURL
{
  return self->mHyperlinkURL;
}

- (BOOL)isLocked
{
  return self->mLocked;
}

- (BOOL)aspectRatioLocked
{
  return self->mAspectRatioLocked;
}

- (NSString)accessibilityDescription
{
  return self->mAccessibilityDescription;
}

- (NSMutableDictionary)accessibilityDescriptions
{
  return self->mAccessibilityDescriptions;
}

- (void)setAccessibilityDescriptions:(id)a3
{
}

- (void)setInsertionCenterPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = (id)[(TSDInfoGeometry *)[(TSDDrawableInfo *)self geometry] mutableCopy];
  objc_msgSend(v6, "setCenter:", x, y);
  [(TSDDrawableInfo *)self setGeometry:v6];
}

- (BOOL)containsProperty:(int)a3
{
  return a3 == 512 || a3 == 524;
}

- (id)boxedObjectForProperty:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  switch(String(a3))
  {
    case 0u:
      id result = [(TSDDrawableInfo *)self objectForProperty:v3];
      break;
    case 1u:
      uint64_t v10 = [(TSDDrawableInfo *)self intValueForProperty:v3];
      if (v10 == 0x80000000) {
        goto LABEL_14;
      }
      uint64_t v11 = v10;
      double v12 = NSNumber;
      id result = (id)[v12 numberWithInt:v11];
      break;
    case 2u:
      [(TSDDrawableInfo *)self floatValueForProperty:v3];
      if (v6 == INFINITY) {
        goto LABEL_14;
      }
      unint64_t v7 = NSNumber;
      id result = (id)objc_msgSend(v7, "numberWithFloat:");
      break;
    case 3u:
      [(TSDDrawableInfo *)self doubleValueForProperty:v3];
      if (v8 == INFINITY) {
        goto LABEL_14;
      }
      CGAffineTransform v9 = NSNumber;
      id result = (id)objc_msgSend(v9, "numberWithDouble:");
      break;
    default:
LABEL_14:
      id result = 0;
      break;
  }
  return result;
}

- (id)objectForProperty:(int)a3
{
  if (a3 == 524) {
    return [(TSDDrawableInfo *)self hyperlinkURL];
  }
  if (a3 == 512) {
    return [(TSDDrawableInfo *)self geometry];
  }
  return 0;
}

- (int)intValueForProperty:(int)a3
{
  return 0x80000000;
}

- (float)floatValueForProperty:(int)a3
{
  return INFINITY;
}

- (double)doubleValueForProperty:(int)a3
{
  return INFINITY;
}

- (double)CGFloatValueForProperty:(int)a3
{
  return INFINITY;
}

@end