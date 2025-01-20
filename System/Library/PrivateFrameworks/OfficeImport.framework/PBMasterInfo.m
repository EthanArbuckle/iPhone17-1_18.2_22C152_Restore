@interface PBMasterInfo
- (BOOL)useXmlBlobs;
- (PBMasterInfo)init;
- (id)allTargetLayoutTypes;
- (id)slideLayoutForSlideHolder:(id)a3;
- (id)slideLayoutForXmlLayoutId:(unsigned __int16)a3;
- (id)slideMaster;
- (id)uniqueXmlSlideLayout;
- (unsigned)mainPbRef;
- (unsigned)titlePbRef;
- (unsigned)xmlMainMasterId;
- (void)cacheSlideLayouts;
- (void)cacheTargetLayoutType:(int)a3;
- (void)dealloc;
- (void)setMainPbRef:(unsigned int)a3;
- (void)setSlideLayout:(id)a3 forXmlLayoutId:(unsigned __int16)a4;
- (void)setSlideMaster:(id)a3;
- (void)setTitlePbRef:(unsigned int)a3;
- (void)setUseXmlBlobs:(BOOL)a3;
- (void)setXmlMainMasterId:(unsigned int)a3;
- (void)sourceTextStyling;
@end

@implementation PBMasterInfo

- (PBMasterInfo)init
{
  v9.receiver = self;
  v9.super_class = (Class)PBMasterInfo;
  v2 = [(PBMasterInfo *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mTgtSlideLayoutArray = v2->mTgtSlideLayoutArray;
    v2->mTgtSlideLayoutArray = v3;

    v5 = operator new(0x18uLL);
    void *v5 = 0;
    v5[1] = 0;
    v5[2] = 0;
    v2->mSrcTextStyling = v5;
    std::vector<PBReaderMasterStyleInfo,ChAllocator<PBReaderMasterStyleInfo>>::resize((uint64_t)v5, 9u);
    uint64_t v6 = objc_opt_new();
    mXmlLayoutMap = v2->mXmlLayoutMap;
    v2->mXmlLayoutMap = (NSMutableDictionary *)v6;
  }
  return v2;
}

- (void)setSlideMaster:(id)a3
{
}

- (void)setMainPbRef:(unsigned int)a3
{
  self->mMainPbRef = a3;
}

- (void)sourceTextStyling
{
  return self->mSrcTextStyling;
}

- (void)cacheTargetLayoutType:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  if (-[NSMutableArray indexOfObject:](self->mTgtSlideLayoutArray, "indexOfObject:") == 0x7FFFFFFFFFFFFFFFLL) {
    [(NSMutableArray *)self->mTgtSlideLayoutArray addObject:v4];
  }
}

- (id)slideMaster
{
  return self->mSlideMaster;
}

- (id)allTargetLayoutTypes
{
  return self->mTgtSlideLayoutArray;
}

- (void)cacheSlideLayouts
{
  layoutMapForSlideMaster(self->mSlideMaster);
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  mLayoutMap = self->mLayoutMap;
  self->mLayoutMap = v3;
}

- (id)slideLayoutForSlideHolder:(id)a3
{
  id v4 = (ESDContainer *)a3;
  if (![(PBMasterInfo *)self useXmlBlobs]) {
    goto LABEL_8;
  }
  v5 = [(ESDContainer *)v4 firstChildOfType:1058];
  Atom = ESDAtomAccess<PptRoundTripContentMasterIdAtom>::extractAtom(v5, 0);

  if (!Atom
    || (int v7 = Atom[12], v7 != [(PBMasterInfo *)self xmlMainMasterId])
    || ([(PBMasterInfo *)self slideLayoutForXmlLayoutId:*((unsigned __int16 *)Atom + 26)],
        (v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_super v9 = [(ESDContainer *)v4 firstChildOfType:1053];
    v10 = ESDAtomAccess<PptRoundTripCompositeMasterIdAtom>::extractAtom(v9, 0);

    if (!v10
      || (int v11 = v10[12], v11 != [(PBMasterInfo *)self xmlMainMasterId])
      || ([(PBMasterInfo *)self uniqueXmlSlideLayout],
          (v8 = objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_8:
      uint64_t v12 = pdSlideLayoutTypeForPptSlideHolder(v4);
      mLayoutMap = self->mLayoutMap;
      v14 = [NSNumber numberWithUnsignedInt:v12];
      v8 = [(NSDictionary *)mLayoutMap objectForKeyedSubscript:v14];
    }
  }

  return v8;
}

- (void)dealloc
{
  mSrcTextStyling = (void **)self->mSrcTextStyling;
  if (mSrcTextStyling)
  {
    id v4 = *mSrcTextStyling;
    if (*mSrcTextStyling)
    {
      mSrcTextStyling[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x23EC997B0](mSrcTextStyling, 0x20C40960023A9);
  }
  self->mSrcTextStyling = 0;
  v5.receiver = self;
  v5.super_class = (Class)PBMasterInfo;
  [(PBMasterInfo *)&v5 dealloc];
}

- (void)setTitlePbRef:(unsigned int)a3
{
  self->mTitlePbRef = a3;
}

- (unsigned)mainPbRef
{
  return self->mMainPbRef;
}

- (unsigned)titlePbRef
{
  return self->mTitlePbRef;
}

- (void)setSlideLayout:(id)a3 forXmlLayoutId:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v8 = a3;
  mXmlLayoutMap = self->mXmlLayoutMap;
  int v7 = [NSNumber numberWithUnsignedShort:v4];
  [(NSMutableDictionary *)mXmlLayoutMap setObject:v8 forKeyedSubscript:v7];
}

- (id)slideLayoutForXmlLayoutId:(unsigned __int16)a3
{
  mXmlLayoutMap = self->mXmlLayoutMap;
  uint64_t v4 = [NSNumber numberWithUnsignedShort:a3];
  objc_super v5 = [(NSMutableDictionary *)mXmlLayoutMap objectForKeyedSubscript:v4];

  return v5;
}

- (id)uniqueXmlSlideLayout
{
  v3 = [(NSMutableDictionary *)self->mXmlLayoutMap allKeys];
  mXmlLayoutMap = self->mXmlLayoutMap;
  objc_super v5 = [v3 firstObject];
  uint64_t v6 = [(NSMutableDictionary *)mXmlLayoutMap objectForKeyedSubscript:v5];

  return v6;
}

- (unsigned)xmlMainMasterId
{
  return self->mXmlMainMasterId;
}

- (void)setXmlMainMasterId:(unsigned int)a3
{
  self->mXmlMainMasterId = a3;
}

- (BOOL)useXmlBlobs
{
  return self->mUseXmlBlobs;
}

- (void)setUseXmlBlobs:(BOOL)a3
{
  self->mUseXmlBlobs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mXmlLayoutMap, 0);
  objc_storeStrong((id *)&self->mLayoutMap, 0);
  objc_storeStrong((id *)&self->mTgtSlideLayoutArray, 0);
  objc_storeStrong((id *)&self->mSlideMaster, 0);
}

@end