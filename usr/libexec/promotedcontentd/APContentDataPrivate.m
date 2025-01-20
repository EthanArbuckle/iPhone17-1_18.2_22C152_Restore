@interface APContentDataPrivate
+ (BOOL)supportsSecureCoding;
- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedCreativeSize;
- (APContentDataPrivate)init;
- (APContentDataPrivate)initWithAdData:(id)a3 forPlacementType:(int64_t)a4;
- (APContentDataPrivate)initWithCoder:(id)a3;
- (APContentDataPrivateDelegate)delegate;
- (BOOL)impressionIsAvailable;
- (BOOL)isCarouselAd;
- (BOOL)isClientRenderedAd;
- (BOOL)isInterstitialAd;
- (BOOL)isNativeAd;
- (BOOL)isOutstreamVideo;
- (BOOL)isPrerollVideo;
- (BOOL)isSponsorshipAd;
- (BOOL)isVideo;
- (NSData)impressionIdentifier;
- (NSString)adResponseIdentifier;
- (NSString)batchResponseID;
- (NSString)statusConditionExpression;
- (double)responseTime;
- (int)consumed50PercentImpressions;
- (int)consumedImpressions;
- (int)impression50PercentCount;
- (int)impressionCount;
- (int)impressionsRemaining;
- (int)sequenceNumber;
- (void)encodeWithCoder:(id)a3;
- (void)save;
- (void)setAdResponseIdentifier:(id)a3;
- (void)setBatchResponseID:(id)a3;
- (void)setConsumed50PercentImpressions:(int)a3;
- (void)setConsumedImpressions:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setImpression50PercentCount:(int)a3;
- (void)setImpressionCount:(int)a3;
- (void)setImpressionIdentifier:(id)a3;
- (void)setIsCarouselAd:(BOOL)a3;
- (void)setIsInterstitialAd:(BOOL)a3;
- (void)setIsNativeAd:(BOOL)a3;
- (void)setIsOutstreamVideo:(BOOL)a3;
- (void)setIsPrerollVideo:(BOOL)a3;
- (void)setResponseTime:(double)a3;
- (void)setSelectedCreativeSize:(id)a3;
- (void)setSequenceNumber:(int)a3;
- (void)setStatusConditionExpression:(id)a3;
@end

@implementation APContentDataPrivate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APContentDataPrivate)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)APContentDataPrivate;
  v5 = [(APContentDataPrivate *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"adResponseIdentifier"];
    adResponseIdentifier = v5->_adResponseIdentifier;
    v5->_adResponseIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"batchResponseID"];
    batchResponseID = v5->_batchResponseID;
    v5->_batchResponseID = (NSString *)v8;

    v5->_impressionCount = [v4 decodeInt32ForKey:@"impressionCount"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"impressionIdentifier"];
    impressionIdentifier = v5->_impressionIdentifier;
    v5->_impressionIdentifier = (NSData *)v10;

    v5->_selectedCreativeSize.width = (double)(int)[v4 decodeInt32ForKey:@"kSelectedCreativeSizeWidth"];
    v5->_selectedCreativeSize.height = (double)(int)[v4 decodeInt32ForKey:@"kSelectedCreativeSizeHeight"];
    v5->_sequenceNumber = [v4 decodeInt32ForKey:@"sequenceNumber"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"statusConditionExpression"];
    statusConditionExpression = v5->_statusConditionExpression;
    v5->_statusConditionExpression = (NSString *)v12;

    v5->_consumedImpressions = [v4 decodeInt32ForKey:@"consumedImpressions"];
    v5->_isCarouselAd = [v4 decodeBoolForKey:@"isCarouselAd"];
    v5->_isOutstreamVideo = [v4 decodeBoolForKey:@"isOutstreamVideo"];
    v5->_isPrerollVideo = [v4 decodeBoolForKey:@"isPrerollVideo"];
    v5->_isNativeAd = [v4 decodeBoolForKey:@"isNativeAd"];
    v5->_isSponsorshipAd = [v4 decodeBoolForKey:@"isSponsorshipAd"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  id v4 = [(APContentDataPrivate *)self adResponseIdentifier];
  [v10 encodeObject:v4 forKey:@"adResponseIdentifier"];

  v5 = [(APContentDataPrivate *)self batchResponseID];
  [v10 encodeObject:v5 forKey:@"batchResponseID"];

  [v10 encodeInt32:-[APContentDataPrivate impressionCount](self, "impressionCount") forKey:@"impressionCount"];
  uint64_t v6 = [(APContentDataPrivate *)self impressionIdentifier];
  [v10 encodeObject:v6 forKey:@"impressionIdentifier"];

  [(APContentDataPrivate *)self selectedCreativeSize];
  [v10 encodeInt32:(int)v7 forKey:@"kSelectedCreativeSizeWidth"];
  [(APContentDataPrivate *)self selectedCreativeSize];
  [v10 encodeInt32:(int)v8 forKey:@"kSelectedCreativeSizeHeight"];
  [v10 encodeInt32:-[APContentDataPrivate sequenceNumber](self, "sequenceNumber") forKey:@"sequenceNumber"];
  v9 = [(APContentDataPrivate *)self statusConditionExpression];
  [v10 encodeObject:v9 forKey:@"statusConditionExpression"];

  [v10 encodeInt32:-[APContentDataPrivate consumedImpressions](self, "consumedImpressions") forKey:@"consumedImpressions"];
  [v10 encodeBool:-[APContentDataPrivate isOutstreamVideo](self, "isOutstreamVideo") forKey:@"isOutstreamVideo"];
  [v10 encodeBool:-[APContentDataPrivate isPrerollVideo](self, "isPrerollVideo") forKey:@"isPrerollVideo"];
  [v10 encodeBool:-[APContentDataPrivate isNativeAd](self, "isNativeAd") forKey:@"isNativeAd"];
  [v10 encodeBool:-[APContentDataPrivate isCarouselAd](self, "isCarouselAd") forKey:@"isCarouselAd"];
  [v10 encodeBool:-[APContentDataPrivate isSponsorshipAd](self, "isSponsorshipAd") forKey:@"isSponsorshipAd"];
}

- (APContentDataPrivate)init
{
  v6.receiver = self;
  v6.super_class = (Class)APContentDataPrivate;
  v2 = [(APContentDataPrivate *)&v6 init];
  v3 = v2;
  if (v2)
  {
    adResponseIdentifier = v2->_adResponseIdentifier;
    v2->_adResponseIdentifier = (NSString *)@"-2|-2";
  }
  return v3;
}

- (APContentDataPrivate)initWithAdData:(id)a3 forPlacementType:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(APContentDataPrivate *)self init];
  if (v7)
  {
    if ([v6 hasAdDataResponseIdentifier])
    {
      uint64_t v8 = [v6 adDataResponseIdentifier];
      adResponseIdentifier = v7->_adResponseIdentifier;
      v7->_adResponseIdentifier = (NSString *)v8;
    }
    if ([v6 hasExpressionToEvaluate])
    {
      uint64_t v10 = [v6 expressionToEvaluate];
      statusConditionExpression = v7->_statusConditionExpression;
      v7->_statusConditionExpression = (NSString *)v10;
    }
    if ([v6 hasImpressionIdentifierData])
    {
      uint64_t v12 = [v6 impressionIdentifierData];
      impressionIdentifier = v7->_impressionIdentifier;
      v7->_impressionIdentifier = (NSData *)v12;
    }
    v7->_impressionCount = [v6 impressionCount];
    if ([v6 hasAdTagContentString])
    {
      v14 = [v6 adTagContentString];
      BOOL v15 = [v14 length] == 0;
    }
    else
    {
      BOOL v15 = 1;
    }
    if ([v6 hasMediaFiles])
    {
      v16 = [v6 mediaFiles];
      id v17 = [v16 mediaAssetsCount];

      BOOL v18 = !v17 || v15;
      if (!a4 && !v18)
      {
        uint64_t v19 = 8;
LABEL_29:
        *((unsigned char *)&v7->super.isa + v19) = 1;
        goto LABEL_30;
      }
    }
    switch(a4)
    {
      case 1:
        uint64_t v19 = 13;
        goto LABEL_29;
      case 3:
        uint64_t v19 = 10;
        goto LABEL_29;
      case 4:
        uint64_t v19 = 9;
        goto LABEL_29;
    }
    if (a4)
    {
      if (a4 == 7)
      {
        uint64_t v19 = 12;
        goto LABEL_29;
      }
    }
    else if ([v6 adLayoutDatasCount])
    {
      uint64_t v19 = 11;
      goto LABEL_29;
    }
  }
LABEL_30:

  return v7;
}

- (int)impressionsRemaining
{
  unsigned int v3 = [(APContentDataPrivate *)self impressionCount];
  return v3 - [(APContentDataPrivate *)self consumedImpressions];
}

- (BOOL)impressionIsAvailable
{
  if ([(APContentDataPrivate *)self impressionsRemaining] <= 0) {
    return [(APContentDataPrivate *)self impressionCount] >> 31;
  }
  else {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)isClientRenderedAd
{
  if ([(APContentDataPrivate *)self isNativeAd]) {
    return 1;
  }

  return [(APContentDataPrivate *)self isPrerollVideo];
}

- (BOOL)isVideo
{
  if ([(APContentDataPrivate *)self isOutstreamVideo]) {
    return 1;
  }

  return [(APContentDataPrivate *)self isPrerollVideo];
}

- (void)save
{
  id v2 = [(APContentDataPrivate *)self delegate];
  [v2 privateDataDidChange];
}

- (NSString)adResponseIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAdResponseIdentifier:(id)a3
{
}

- (NSString)batchResponseID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBatchResponseID:(id)a3
{
}

- (int)impressionCount
{
  return self->_impressionCount;
}

- (void)setImpressionCount:(int)a3
{
  self->_impressionCount = a3;
}

- (NSData)impressionIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setImpressionIdentifier:(id)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedCreativeSize
{
  objc_copyStruct(v4, &self->_selectedCreativeSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setSelectedCreativeSize:(id)a3
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v3 = a3;
  objc_copyStruct(&self->_selectedCreativeSize, &v3, 16, 1, 0);
}

- (int)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int)a3
{
  self->_sequenceNumber = a3;
}

- (NSString)statusConditionExpression
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStatusConditionExpression:(id)a3
{
}

- (int)consumedImpressions
{
  return self->_consumedImpressions;
}

- (void)setConsumedImpressions:(int)a3
{
  self->_consumedImpressions = a3;
}

- (BOOL)isOutstreamVideo
{
  return self->_isOutstreamVideo;
}

- (void)setIsOutstreamVideo:(BOOL)a3
{
  self->_isOutstreamVideo = a3;
}

- (BOOL)isNativeAd
{
  return self->_isNativeAd;
}

- (void)setIsNativeAd:(BOOL)a3
{
  self->_isNativeAd = a3;
}

- (BOOL)isPrerollVideo
{
  return self->_isPrerollVideo;
}

- (void)setIsPrerollVideo:(BOOL)a3
{
  self->_isPrerollVideo = a3;
}

- (BOOL)isCarouselAd
{
  return self->_isCarouselAd;
}

- (void)setIsCarouselAd:(BOOL)a3
{
  self->_isCarouselAd = a3;
}

- (BOOL)isSponsorshipAd
{
  return self->_isSponsorshipAd;
}

- (APContentDataPrivateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (APContentDataPrivateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int)consumed50PercentImpressions
{
  return self->_consumed50PercentImpressions;
}

- (void)setConsumed50PercentImpressions:(int)a3
{
  self->_consumed50PercentImpressions = a3;
}

- (int)impression50PercentCount
{
  return self->_impression50PercentCount;
}

- (void)setImpression50PercentCount:(int)a3
{
  self->_impression50PercentCount = a3;
}

- (BOOL)isInterstitialAd
{
  return self->_isInterstitialAd;
}

- (void)setIsInterstitialAd:(BOOL)a3
{
  self->_isInterstitialAd = a3;
}

- (double)responseTime
{
  return self->_responseTime;
}

- (void)setResponseTime:(double)a3
{
  self->_responseTime = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_statusConditionExpression, 0);
  objc_storeStrong((id *)&self->_impressionIdentifier, 0);
  objc_storeStrong((id *)&self->_batchResponseID, 0);

  objc_storeStrong((id *)&self->_adResponseIdentifier, 0);
}

@end