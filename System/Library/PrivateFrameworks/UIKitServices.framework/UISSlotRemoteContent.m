@interface UISSlotRemoteContent
+ (BOOL)supportsSecureCoding;
+ (id)newLayerContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemote;
- (BOOL)shouldReplaceExistingContent;
- (CGSize)contentSize;
- (UISSlotRemoteContent)initWithCoder:(id)a3;
- (UISSlotRemoteContent)initWithContentSize:(CGSize)a3 contentScale:(unsigned __int8)a4 localImage:(CGImage *)a5 toLayerContext:(id *)a6;
- (id)image;
- (id)newTouchAuthenticationSpecificationWithAuthenticationMessageContext:(unint64_t)a3 backgroundStatisticsRegion:(id)a4 backgroundStatisticsForeground:(float)a5 backgroundStatisticsPassingContrast:(float)a6 backgroundStatisticsFailingContrast:(float)a7 hitTestInformationMask:(unint64_t)a8 initialSampleEvent:(int64_t)a9 secureName:(unsigned int)a10;
- (unint64_t)hash;
- (unsigned)contentScale;
- (unsigned)slotID;
- (void)deleteFromLayerContext:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)transferFromLayerContext:(id)a3 toLayerContextWithId:(unint64_t)a4;
@end

@implementation UISSlotRemoteContent

- (UISSlotRemoteContent)initWithContentSize:(CGSize)a3 contentScale:(unsigned __int8)a4 localImage:(CGImage *)a5 toLayerContext:(id *)a6
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v21.receiver = self;
  v21.super_class = (Class)UISSlotRemoteContent;
  v12 = [(UISSlotRemoteContent *)&v21 init];
  v13 = v12;
  if (v12)
  {
    v12->_contentScale = a4;
    v12->_contentSize.CGFloat width = width;
    v12->_contentSize.CGFloat height = height;
    id v14 = *a6;
    char v15 = 1;
    v16 = 0;
    while (1)
    {
      char v17 = v15;
      if (!v14) {
        id v14 = +[UISSlotRemoteContent newLayerContext];
      }
      uint64_t v18 = [v14 createSlot];
      v13->_slotID = v18;
      if (v18) {
        break;
      }

      char v15 = 0;
      id v14 = 0;
      if ((v17 & 1) == 0) {
        goto LABEL_9;
      }
    }
    [v14 setObject:a5 forSlot:v18];
    v16 = v14;
LABEL_9:
    objc_storeStrong(a6, v16);
    if (!v13->_slotID)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, v13, @"UISSlotRemoteContent.m", 56, @"Invalid parameter not satisfying: %@", @"_slotID" object file lineNumber description];
    }
  }
  return v13;
}

- (UISSlotRemoteContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UISSlotRemoteContent;
  v5 = [(UISSlotRemoteContent *)&v10 init];
  if (v5)
  {
    v5->_contentScale = [v4 decodeIntForKey:@"scale"];
    [v4 decodeDoubleForKey:@"sizeWidth"];
    CGFloat v7 = v6;
    [v4 decodeDoubleForKey:@"sizeHeight"];
    v5->_contentSize.CGFloat width = v7;
    v5->_contentSize.CGFloat height = v8;
    v5->_slotID = [v4 decodeIntegerForKey:@"slotID"];
  }

  return v5;
}

- (unsigned)contentScale
{
  return self->_contentScale;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)deleteFromLayerContext:(id)a3
{
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t contentScale = self->_contentScale;
  id v5 = a3;
  [v5 encodeInt:contentScale forKey:@"scale"];
  [v5 encodeDouble:@"sizeWidth" forKey:self->_contentSize.width];
  [v5 encodeDouble:@"sizeHeight" forKey:self->_contentSize.height];
  [v5 encodeInteger:self->_slotID forKey:@"slotID"];
}

- (unint64_t)hash
{
  return (unint64_t)self->_contentSize.width ^ self->_contentScale ^ (unint64_t)self->_contentSize.height ^ self->_slotID;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (double *)a3;
  objc_opt_class();
  BOOL v6 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_contentScale == *((unsigned __int8 *)v4 + 8)
    && (self->_contentSize.width == v4[2] ? (BOOL v5 = self->_contentSize.height == v4[3]) : (BOOL v5 = 0), v5)
    && self->_slotID == *((_DWORD *)v4 + 8);

  return v6;
}

- (id)image
{
  return (id)[MEMORY[0x1E4F39B58] objectForSlot:self->_slotID];
}

- (BOOL)isRemote
{
  return 1;
}

+ (id)newLayerContext
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F39E68];
  v7[0] = *MEMORY[0x1E4F39E80];
  v7[1] = v2;
  v8[0] = MEMORY[0x1E4F1CC38];
  v8[1] = MEMORY[0x1E4F1CC28];
  v3 = (void *)MEMORY[0x1E4F39B58];
  v7[2] = *MEMORY[0x1E4F39E50];
  v8[2] = MEMORY[0x1E4F1CC38];
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];
  BOOL v5 = [v3 remoteContextWithOptions:v4];

  [v5 setCommitPriority:1000];
  return v5;
}

- (id)newTouchAuthenticationSpecificationWithAuthenticationMessageContext:(unint64_t)a3 backgroundStatisticsRegion:(id)a4 backgroundStatisticsForeground:(float)a5 backgroundStatisticsPassingContrast:(float)a6 backgroundStatisticsFailingContrast:(float)a7 hitTestInformationMask:(unint64_t)a8 initialSampleEvent:(int64_t)a9 secureName:(unsigned int)a10
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __275__UISSlotRemoteContent_newTouchAuthenticationSpecificationWithAuthenticationMessageContext_backgroundStatisticsRegion_backgroundStatisticsForeground_backgroundStatisticsPassingContrast_backgroundStatisticsFailingContrast_hitTestInformationMask_initialSampleEvent_secureName___block_invoke;
  v11[3] = &unk_1E57356B8;
  v11[4] = self;
  v11[5] = a3;
  $BEA516A46C1BA1F84587E5D243A711F7 v16 = a4;
  float v12 = a5;
  float v13 = a6;
  float v14 = a7;
  v11[6] = a8;
  v11[7] = a9;
  unsigned int v15 = a10;
  [MEMORY[0x1E4F4F3D0] buildSpecification:v11];
  return (id)objc_claimAutoreleasedReturnValue();
}

void __275__UISSlotRemoteContent_newTouchAuthenticationSpecificationWithAuthenticationMessageContext_backgroundStatisticsRegion_backgroundStatisticsForeground_backgroundStatisticsPassingContrast_backgroundStatisticsFailingContrast_hitTestInformationMask_initialSampleEvent_secureName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(a1 + 32) + 32);
  id v7 = a2;
  [v7 setSlotID:v3];
  [v7 setAuthenticationMessageContext:*(void *)(a1 + 40)];
  [v7 setBackgroundStatisticsRegion:*(void *)(a1 + 80)];
  LODWORD(v4) = *(_DWORD *)(a1 + 64);
  [v7 setBackgroundStatisticsForeground:v4];
  LODWORD(v5) = *(_DWORD *)(a1 + 68);
  [v7 setBackgroundStatisticsPassingContrast:v5];
  LODWORD(v6) = *(_DWORD *)(a1 + 72);
  [v7 setBackgroundStatisticsFailingContrast:v6];
  [v7 setHitTestInformationMask:*(void *)(a1 + 48)];
  [v7 setInitialSampleEvent:*(void *)(a1 + 56)];
  [v7 setSecureName:*(unsigned int *)(a1 + 76)];
}

- (BOOL)shouldReplaceExistingContent
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)transferFromLayerContext:(id)a3 toLayerContextWithId:(unint64_t)a4
{
}

- (unsigned)slotID
{
  return self->_slotID;
}

@end