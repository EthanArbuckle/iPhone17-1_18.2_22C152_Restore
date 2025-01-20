@interface BSUIDownloadPurchaseAttempt
- (BAAppAnalyticsAdditionalData)appAnalyticsAdditionalData;
- (BAUpSellData)upSellData;
- (BLPurchaseResponse)failureResponse;
- (BLPurchaseResponse)purchaseResponse;
- (BOOL)hasRacSupport;
- (BOOL)isAudiobook;
- (BOOL)isSupplementalContent;
- (BUAssertion)sessionAssertion;
- (NSString)buyParams;
- (NSString)storeID;
- (_TtC13BookAnalytics9BATracker)tracker;
- (void)setAppAnalyticsAdditionalData:(id)a3;
- (void)setBuyParams:(id)a3;
- (void)setFailureResponse:(id)a3;
- (void)setHasRacSupport:(BOOL)a3;
- (void)setIsAudiobook:(BOOL)a3;
- (void)setIsSupplementalContent:(BOOL)a3;
- (void)setPurchaseResponse:(id)a3;
- (void)setSessionAssertion:(id)a3;
- (void)setStoreID:(id)a3;
- (void)setTracker:(id)a3;
- (void)setUpSellData:(id)a3;
@end

@implementation BSUIDownloadPurchaseAttempt

- (NSString)storeID
{
  return self->_storeID;
}

- (void)setStoreID:(id)a3
{
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
}

- (_TtC13BookAnalytics9BATracker)tracker
{
  return self->_tracker;
}

- (void)setTracker:(id)a3
{
}

- (BAUpSellData)upSellData
{
  return self->_upSellData;
}

- (void)setUpSellData:(id)a3
{
}

- (BAAppAnalyticsAdditionalData)appAnalyticsAdditionalData
{
  return self->_appAnalyticsAdditionalData;
}

- (void)setAppAnalyticsAdditionalData:(id)a3
{
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (void)setIsAudiobook:(BOOL)a3
{
  self->_isAudiobook = a3;
}

- (BOOL)hasRacSupport
{
  return self->_hasRacSupport;
}

- (void)setHasRacSupport:(BOOL)a3
{
  self->_hasRacSupport = a3;
}

- (BOOL)isSupplementalContent
{
  return self->_isSupplementalContent;
}

- (void)setIsSupplementalContent:(BOOL)a3
{
  self->_isSupplementalContent = a3;
}

- (BLPurchaseResponse)purchaseResponse
{
  return self->_purchaseResponse;
}

- (void)setPurchaseResponse:(id)a3
{
}

- (BLPurchaseResponse)failureResponse
{
  return self->_failureResponse;
}

- (void)setFailureResponse:(id)a3
{
}

- (BUAssertion)sessionAssertion
{
  return self->_sessionAssertion;
}

- (void)setSessionAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionAssertion, 0);
  objc_storeStrong((id *)&self->_failureResponse, 0);
  objc_storeStrong((id *)&self->_purchaseResponse, 0);
  objc_storeStrong((id *)&self->_appAnalyticsAdditionalData, 0);
  objc_storeStrong((id *)&self->_upSellData, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);

  objc_storeStrong((id *)&self->_storeID, 0);
}

@end