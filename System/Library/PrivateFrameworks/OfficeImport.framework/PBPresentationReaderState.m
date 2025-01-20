@interface PBPresentationReaderState
- (BOOL)hasCharacterPropertyBulletIndex;
- (BOOL)hasCurrentSourceMasterStyleInfoVector;
- (BOOL)hasSlideNumberPlaceholder;
- (BOOL)isCancelled;
- (ESDContainer)sourceSlideListHolder;
- (PBPresentationReaderState)initWithReader:(void *)a3 tgtPresentation:(id)a4;
- (PBReaderMasterStyleInfo)currentSourceMasterStyleInfoOfType:(int)a3;
- (PBReaderMasterStyleInfo)docSourceMasterStyleInfoOfType:(int)a3;
- (TCCancelDelegate)cancelDelegate;
- (id)currentBulletStyle;
- (id)currentMacCharStyle;
- (id)documentRoot;
- (id)fontEntityAtIndex:(unint64_t)a3;
- (id)hyperlinkInfoWithId:(unsigned int)a3 createIfAbsent:(BOOL)a4;
- (id)masterStyles:(id)a3;
- (id)officeArtState;
- (id)slideIndexesRef;
- (id)slideState;
- (id)sourceTextBoxContainerHolderForTargetShape:(id)a3;
- (id)tgtPresentation;
- (id)tgtSlide;
- (unint64_t)fontEntityCount;
- (unint64_t)getSlideIndexAt:(unint64_t)a3;
- (unint64_t)numberOfSlideIndexes;
- (unsigned)bulletIndex;
- (void)addFontEntity:(id)a3 charSet:(int)a4 type:(int)a5 family:(int)a6;
- (void)addSlideIndex:(unint64_t)a3;
- (void)currentSlideTextBlockRecordIndexRangeVector;
- (void)dealloc;
- (void)reader;
- (void)resetSlideState;
- (void)setBulletIndex:(unsigned int)a3;
- (void)setCancelDelegate:(id)a3;
- (void)setCurrentBulletStyle:(id)a3 macCharStyle:(id)a4;
- (void)setCurrentSourceMasterStyleInfoVector:(void *)a3;
- (void)setCurrentTextType:(int)a3 placeholderIndex:(unsigned int)a4;
- (void)setDocumentRoot:(id)a3;
- (void)setHasCharacterPropertyBulletIndex:(BOOL)a3;
- (void)setHasSlideNumberPlaceholder:(BOOL)a3;
- (void)setMasterStyles:(id)a3 slideMaster:(id)a4;
- (void)setPlaceholderBulletStyles:(id)a3;
- (void)setPlaceholderMacCharStyles:(id)a3;
- (void)setSourceSlideId:(unsigned int)a3;
- (void)setSourceSlideListHolder:(id)a3;
- (void)setSourceTextBoxContainerHolder:(id)a3 forTargetShape:(id)a4;
- (void)setTgtSlide:(id)a3;
@end

@implementation PBPresentationReaderState

- (PBPresentationReaderState)initWithReader:(void *)a3 tgtPresentation:(id)a4
{
  id v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)PBPresentationReaderState;
  v8 = [(PBPresentationReaderState *)&v27 init];
  v9 = v8;
  if (v8)
  {
    v8->mPptBinaryReader = a3;
    objc_storeStrong((id *)&v8->mTgtPresentation, a4);
    v10 = operator new(0x18uLL);
    v10[1] = 0;
    v10[2] = 0;
    void *v10 = 0;
    v9->mCurrentSlideTextBlockRecordIndexRangeVector = v10;
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mSlideIndexes = v9->mSlideIndexes;
    v9->mSlideIndexes = v11;

    v13 = [[PBOfficeArtReaderState alloc] initWithPresentationState:v9];
    mOfficeArtState = v9->mOfficeArtState;
    v9->mOfficeArtState = v13;

    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mFontEntities = v9->mFontEntities;
    v9->mFontEntities = v15;

    v17 = objc_alloc_init(OITSUNoCopyDictionary);
    mSlideMasterToMasterStyles = v9->mSlideMasterToMasterStyles;
    v9->mSlideMasterToMasterStyles = v17;

    v9->mHyperlinkMap = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x263EFFF90]);
    v19 = objc_alloc_init(PBSlideState);
    mSlideState = v9->mSlideState;
    v9->mSlideState = v19;

    v21 = operator new(0x18uLL);
    void *v21 = 0;
    v21[1] = 0;
    v21[2] = 0;
    v9->mSrcDocMasterStyleInfoVector = v21;
    std::vector<PBReaderMasterStyleInfo,ChAllocator<PBReaderMasterStyleInfo>>::resize((uint64_t)v21, 9u);
    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mTargetShapeToSourceTextBoxContainerHolderMap = v9->mTargetShapeToSourceTextBoxContainerHolderMap;
    v9->mTargetShapeToSourceTextBoxContainerHolderMap = v22;

    v24 = +[ESDObjectFactory threadLocalFactory];
    v25 = (PptEshObjectFactory *)operator new(0x10uLL);
    PptEshObjectFactory::PptEshObjectFactory(v25);
    [v24 setEshFactory:v25];
  }
  return v9;
}

- (void)setCancelDelegate:(id)a3
{
}

- (void)reader
{
  return self->mPptBinaryReader;
}

- (void)setDocumentRoot:(id)a3
{
}

- (void)addFontEntity:(id)a3 charSet:(int)a4 type:(int)a5 family:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v11 = a3;
  v10 = [[PBFontEntity alloc] initWithName:v11 charSet:v8 type:v7 family:v6];
  [(NSMutableArray *)self->mFontEntities addObject:v10];
}

- (PBReaderMasterStyleInfo)docSourceMasterStyleInfoOfType:(int)a3
{
  return (PBReaderMasterStyleInfo *)(*(void *)self->mSrcDocMasterStyleInfoVector + 16 * a3);
}

- (id)tgtPresentation
{
  return self->mTgtPresentation;
}

- (id)currentMacCharStyle
{
  return self->mCurrentMacCharStyle;
}

- (BOOL)hasCharacterPropertyBulletIndex
{
  return self->mHasCharacterPropertyBulletIndex;
}

- (void)setBulletIndex:(unsigned int)a3
{
  self->mBulletIndex = a3;
  self->mHasCharacterPropertyBulletIndex = 1;
}

- (id)fontEntityAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->mFontEntities count] <= a3)
  {
    uint64_t v6 = (void *)-[PBPresentationReaderState fontEntityAtIndex:]::defaultFontEntity;
    if (!-[PBPresentationReaderState fontEntityAtIndex:]::defaultFontEntity)
    {
      uint64_t v7 = [[PBFontEntity alloc] initWithName:@"Arial" charSet:0 type:0 family:0];
      uint64_t v8 = (void *)-[PBPresentationReaderState fontEntityAtIndex:]::defaultFontEntity;
      -[PBPresentationReaderState fontEntityAtIndex:]::defaultFontEntity = (uint64_t)v7;

      uint64_t v6 = (void *)-[PBPresentationReaderState fontEntityAtIndex:]::defaultFontEntity;
    }
    id v5 = v6;
  }
  else
  {
    id v5 = [(NSMutableArray *)self->mFontEntities objectAtIndex:a3];
  }
  return v5;
}

- (id)documentRoot
{
  return self->mDocumentRoot;
}

- (id)officeArtState
{
  return self->mOfficeArtState;
}

- (BOOL)isCancelled
{
  return [(TCCancelDelegate *)self->mCancel isCancelled];
}

- (void)setCurrentSourceMasterStyleInfoVector:(void *)a3
{
  self->mSrcCurrentMasterStyleInfoVector = a3;
}

- (PBReaderMasterStyleInfo)currentSourceMasterStyleInfoOfType:(int)a3
{
  mSrcCurrentMasterStyleInfoVector = self->mSrcCurrentMasterStyleInfoVector;
  if (!mSrcCurrentMasterStyleInfoVector) {
    mSrcCurrentMasterStyleInfoVector = self->mSrcDocMasterStyleInfoVector;
  }
  return (PBReaderMasterStyleInfo *)(*mSrcCurrentMasterStyleInfoVector + 16 * a3);
}

- (void)setMasterStyles:(id)a3 slideMaster:(id)a4
{
}

- (void)setTgtSlide:(id)a3
{
}

- (void)setCurrentBulletStyle:(id)a3 macCharStyle:(id)a4
{
  uint64_t v6 = (ESDObject *)a3;
  uint64_t v7 = (ESDObject *)a4;
  mCurrentBulletStyle = self->mCurrentBulletStyle;
  self->mCurrentBulletStyle = v6;
  v10 = v6;

  mCurrentMacCharStyle = self->mCurrentMacCharStyle;
  self->mCurrentMacCharStyle = v7;
}

- (BOOL)hasCurrentSourceMasterStyleInfoVector
{
  return self->mSrcCurrentMasterStyleInfoVector != 0;
}

- (id)currentBulletStyle
{
  return self->mCurrentBulletStyle;
}

- (void)setHasCharacterPropertyBulletIndex:(BOOL)a3
{
  self->mHasCharacterPropertyBulletIndex = a3;
}

- (id)tgtSlide
{
  return self->mTgtSlide;
}

- (void)setSourceTextBoxContainerHolder:(id)a3 forTargetShape:(id)a4
{
  id v9 = a4;
  mTargetShapeToSourceTextBoxContainerHolderMap = self->mTargetShapeToSourceTextBoxContainerHolderMap;
  uint64_t v7 = [MEMORY[0x263F08D40] valueWithNonretainedObject:a3];
  uint64_t v8 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v9];
  [(NSMutableDictionary *)mTargetShapeToSourceTextBoxContainerHolderMap setObject:v7 forKey:v8];
}

- (unint64_t)numberOfSlideIndexes
{
  return [(NSMutableArray *)self->mSlideIndexes count];
}

- (id)masterStyles:(id)a3
{
  v3 = [(OITSUNoCopyDictionary *)self->mSlideMasterToMasterStyles objectForKey:a3];
  return v3;
}

- (id)sourceTextBoxContainerHolderForTargetShape:(id)a3
{
  mTargetShapeToSourceTextBoxContainerHolderMap = self->mTargetShapeToSourceTextBoxContainerHolderMap;
  v4 = [MEMORY[0x263F08D40] valueWithNonretainedObject:a3];
  id v5 = [(NSMutableDictionary *)mTargetShapeToSourceTextBoxContainerHolderMap objectForKey:v4];
  uint64_t v6 = [v5 nonretainedObjectValue];

  return v6;
}

- (void)setSourceSlideListHolder:(id)a3
{
}

- (void)setSourceSlideId:(unsigned int)a3
{
  self->mSrcSlideId = a3;
}

- (ESDContainer)sourceSlideListHolder
{
  return (ESDContainer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentTextType:(int)a3 placeholderIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v8 = [(PBOutlineBulletDictionary *)self->mPlaceholderBulletStyles objectForSlideId:self->mSrcSlideId textType:*(void *)&a3 placeholderIndex:*(void *)&a4];
  uint64_t v7 = [(PBOutlineBulletDictionary *)self->mPlaceholderMacCharStyles objectForSlideId:self->mSrcSlideId textType:v5 placeholderIndex:v4];
  [(PBPresentationReaderState *)self setCurrentBulletStyle:v8 macCharStyle:v7];
}

- (BOOL)hasSlideNumberPlaceholder
{
  return self->mHasSlideNumberPlaceholder;
}

- (void)setHasSlideNumberPlaceholder:(BOOL)a3
{
  self->mHasSlideNumberPlaceholder = a3;
}

- (void)dealloc
{
  mCurrentSlideTextBlockRecordIndexRangeVector = (void **)self->mCurrentSlideTextBlockRecordIndexRangeVector;
  if (mCurrentSlideTextBlockRecordIndexRangeVector)
  {
    uint64_t v4 = *mCurrentSlideTextBlockRecordIndexRangeVector;
    if (*mCurrentSlideTextBlockRecordIndexRangeVector)
    {
      mCurrentSlideTextBlockRecordIndexRangeVector[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x23EC997B0](mCurrentSlideTextBlockRecordIndexRangeVector, 0x20C40960023A9);
  }
  self->mCurrentSlideTextBlockRecordIndexRangeVector = 0;
  CFRelease(self->mHyperlinkMap);
  mSrcDocMasterStyleInfoVector = (void **)self->mSrcDocMasterStyleInfoVector;
  if (mSrcDocMasterStyleInfoVector)
  {
    uint64_t v6 = *mSrcDocMasterStyleInfoVector;
    if (*mSrcDocMasterStyleInfoVector)
    {
      mSrcDocMasterStyleInfoVector[1] = v6;
      operator delete(v6);
    }
    MEMORY[0x23EC997B0](mSrcDocMasterStyleInfoVector, 0x20C40960023A9);
  }
  self->mSrcDocMasterStyleInfoVector = 0;
  v7.receiver = self;
  v7.super_class = (Class)PBPresentationReaderState;
  [(PBPresentationReaderState *)&v7 dealloc];
}

- (id)hyperlinkInfoWithId:(unsigned int)a3 createIfAbsent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = (const void *)a3;
  CFDictionaryGetValue(self->mHyperlinkMap, (const void *)a3);
  objc_super v7 = (PBReaderHyperlinkInfo *)objc_claimAutoreleasedReturnValue();
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    objc_super v7 = objc_alloc_init(PBReaderHyperlinkInfo);
    CFDictionarySetValue(self->mHyperlinkMap, v6, v7);
  }
  return v7;
}

- (void)setPlaceholderBulletStyles:(id)a3
{
}

- (TCCancelDelegate)cancelDelegate
{
  return self->mCancel;
}

- (void)setPlaceholderMacCharStyles:(id)a3
{
}

- (void)addSlideIndex:(unint64_t)a3
{
  mSlideIndexes = self->mSlideIndexes;
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  -[NSMutableArray addObject:](mSlideIndexes, "addObject:");
}

- (unint64_t)getSlideIndexAt:(unint64_t)a3
{
  v3 = [(NSMutableArray *)self->mSlideIndexes objectAtIndex:a3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (id)slideIndexesRef
{
  return self->mSlideIndexes;
}

- (unint64_t)fontEntityCount
{
  return [(NSMutableArray *)self->mFontEntities count];
}

- (unsigned)bulletIndex
{
  return self->mBulletIndex;
}

- (id)slideState
{
  return self->mSlideState;
}

- (void)resetSlideState
{
}

- (void)currentSlideTextBlockRecordIndexRangeVector
{
  return self->mCurrentSlideTextBlockRecordIndexRangeVector;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTargetShapeToSourceTextBoxContainerHolderMap, 0);
  objc_storeStrong((id *)&self->mCancel, 0);
  objc_storeStrong((id *)&self->mSlideState, 0);
  objc_storeStrong((id *)&self->mCurrentMacCharStyle, 0);
  objc_storeStrong((id *)&self->mCurrentBulletStyle, 0);
  objc_storeStrong((id *)&self->mPlaceholderMacCharStyles, 0);
  objc_storeStrong((id *)&self->mPlaceholderBulletStyles, 0);
  objc_storeStrong((id *)&self->mTgtSlide, 0);
  objc_storeStrong((id *)&self->mFontEntities, 0);
  objc_storeStrong((id *)&self->mOfficeArtState, 0);
  objc_storeStrong((id *)&self->mSlideMasterToMasterStyles, 0);
  objc_storeStrong((id *)&self->mSlideIndexes, 0);
  objc_storeStrong((id *)&self->mSrcSlideListHolder, 0);
  objc_storeStrong((id *)&self->mDocumentRoot, 0);
  objc_storeStrong((id *)&self->mTgtPresentation, 0);
}

@end