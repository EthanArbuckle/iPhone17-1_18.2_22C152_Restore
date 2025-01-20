@interface PXDisplayAssetVideoContentDeliveryStrategy
+ (id)defaultStreamingMediumQualityStrategy;
- ($28FEB1B56BB3ED5175BFC6DE64DE503F)segmentTimeRange;
- (BOOL)isAudioAllowed;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isStreamingAllowed;
- (CGSize)targetSize;
- (NSString)identifier;
- (PXDisplayAssetVideoContentDeliveryStrategy)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)quality;
- (void)setIsAudioAllowed:(BOOL)a3;
- (void)setIsNetworkAccessAllowed:(BOOL)a3;
- (void)setIsStreamingAllowed:(BOOL)a3;
- (void)setQuality:(int64_t)a3;
- (void)setSegmentTimeRange:(id *)a3;
- (void)setTargetSize:(CGSize)a3;
@end

@implementation PXDisplayAssetVideoContentDeliveryStrategy

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIsAudioAllowed:(BOOL)a3
{
  self->_isAudioAllowed = a3;
}

- (BOOL)isAudioAllowed
{
  return self->_isAudioAllowed;
}

- (void)setIsNetworkAccessAllowed:(BOOL)a3
{
  self->_isNetworkAccessAllowed = a3;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_isNetworkAccessAllowed;
}

- (void)setIsStreamingAllowed:(BOOL)a3
{
  self->_isStreamingAllowed = a3;
}

- (BOOL)isStreamingAllowed
{
  return self->_isStreamingAllowed;
}

- (void)setSegmentTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_segmentTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_segmentTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_segmentTimeRange.start.value = v3;
}

- ($28FEB1B56BB3ED5175BFC6DE64DE503F)segmentTimeRange
{
  long long v3 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var0;
  return self;
}

- (void)setQuality:(int64_t)a3
{
  self->_quality = a3;
}

- (int64_t)quality
{
  return self->_quality;
}

- (id)description
{
  v19.receiver = self;
  v19.super_class = (Class)PXDisplayAssetVideoContentDeliveryStrategy;
  long long v3 = [(PXDisplayAssetVideoContentDeliveryStrategy *)&v19 description];
  unint64_t v4 = [(PXDisplayAssetVideoContentDeliveryStrategy *)self quality];
  if (v4 >= 6)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    v17 = [NSString stringWithUTF8String:"NSString *PXVideoContentDeliveryQualityDescription(PXVideoContentDeliveryQuality)"];
    [v16 handleFailureInFunction:v17 file:@"PXDisplayAssetVideoContentProvider.m" lineNumber:688 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  v5 = off_1E5DADF30[v4];
  [(PXDisplayAssetVideoContentDeliveryStrategy *)self segmentTimeRange];
  v6 = PXCMTimeRangeDescription((uint64_t)v18);
  if ([(PXDisplayAssetVideoContentDeliveryStrategy *)self isStreamingAllowed]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = v7;
  if ([(PXDisplayAssetVideoContentDeliveryStrategy *)self isNetworkAccessAllowed]) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  v10 = v9;
  if ([(PXDisplayAssetVideoContentDeliveryStrategy *)self isAudioAllowed]) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v12 = v11;
  [(PXDisplayAssetVideoContentDeliveryStrategy *)self targetSize];
  v13 = NSStringFromSize(v21);
  v14 = [v3 stringByAppendingFormat:@"quality: %@, segment:%@, streaming:%@, network:%@, audio:%@, targetSize:%@", v5, v6, v8, v10, v12, v13];

  return v14;
}

- (NSString)identifier
{
  [(PXDisplayAssetVideoContentDeliveryStrategy *)self segmentTimeRange];
  if ((v11 & 1) == 0
    || ([(PXDisplayAssetVideoContentDeliveryStrategy *)self segmentTimeRange], (v10 & 1) == 0)
    || ([(PXDisplayAssetVideoContentDeliveryStrategy *)self segmentTimeRange], v9)
    || ([(PXDisplayAssetVideoContentDeliveryStrategy *)self segmentTimeRange], v8 < 0))
  {
    long long v3 = @"All";
  }
  else
  {
    id v5 = [NSString alloc];
    [(PXDisplayAssetVideoContentDeliveryStrategy *)self segmentTimeRange];
    v6 = PXCMTimeRangeDescription((uint64_t)v7);
    long long v3 = (__CFString *)[v5 initWithFormat:@"%@", v6];
  }
  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(PXDisplayAssetVideoContentDeliveryStrategy *)self segmentTimeRange];
  v6[0] = v6[3];
  v6[1] = v6[4];
  v6[2] = v6[5];
  [v4 setSegmentTimeRange:v6];
  objc_msgSend(v4, "setIsStreamingAllowed:", -[PXDisplayAssetVideoContentDeliveryStrategy isStreamingAllowed](self, "isStreamingAllowed"));
  objc_msgSend(v4, "setIsNetworkAccessAllowed:", -[PXDisplayAssetVideoContentDeliveryStrategy isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  objc_msgSend(v4, "setQuality:", -[PXDisplayAssetVideoContentDeliveryStrategy quality](self, "quality"));
  objc_msgSend(v4, "setIsAudioAllowed:", -[PXDisplayAssetVideoContentDeliveryStrategy isAudioAllowed](self, "isAudioAllowed"));
  [(PXDisplayAssetVideoContentDeliveryStrategy *)self targetSize];
  objc_msgSend(v4, "setTargetSize:");
  return v4;
}

- (PXDisplayAssetVideoContentDeliveryStrategy)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXDisplayAssetVideoContentDeliveryStrategy;
  CGSize result = [(PXDisplayAssetVideoContentDeliveryStrategy *)&v5 init];
  if (result)
  {
    uint64_t v3 = MEMORY[0x1E4F1FA20];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *(_OWORD *)&result->_segmentTimeRange.start.value = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)&result->_segmentTimeRange.start.epoch = v4;
    *(_OWORD *)&result->_segmentTimeRange.duration.timescale = *(_OWORD *)(v3 + 32);
    *(_WORD *)&result->_isNetworkAccessAllowed = 257;
  }
  return result;
}

+ (id)defaultStreamingMediumQualityStrategy
{
  v2 = objc_alloc_init(PXDisplayAssetVideoContentDeliveryStrategy);
  [(PXDisplayAssetVideoContentDeliveryStrategy *)v2 setIsStreamingAllowed:1];
  [(PXDisplayAssetVideoContentDeliveryStrategy *)v2 setQuality:3];
  return v2;
}

@end