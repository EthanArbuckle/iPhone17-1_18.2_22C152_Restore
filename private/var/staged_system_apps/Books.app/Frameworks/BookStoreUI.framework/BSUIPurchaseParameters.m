@interface BSUIPurchaseParameters
- (BOOL)hasRacSupport;
- (BOOL)isAudiobook;
- (BSUIPurchaseParameters)initWithBuyParams:(id)a3 isAudiobook:(BOOL)a4 hasRacSupport:(BOOL)a5 supportsUnifiedProductPage:(id)a6 editionKind:(id)a7 tracker:(id)a8;
- (NSNumber)supportsUnifiedProductPage;
- (NSString)buyParams;
- (NSString)editionKind;
- (NSString)pageContext;
- (NSString)pageId;
- (NSString)pageType;
- (_TtC13BookAnalytics9BATracker)tracker;
- (void)setBuyParams:(id)a3;
- (void)setEditionKind:(id)a3;
- (void)setHasRacSupport:(BOOL)a3;
- (void)setIsAudiobook:(BOOL)a3;
- (void)setPageContext:(id)a3;
- (void)setPageId:(id)a3;
- (void)setPageType:(id)a3;
- (void)setSupportsUnifiedProductPage:(id)a3;
- (void)setTracker:(id)a3;
@end

@implementation BSUIPurchaseParameters

- (BSUIPurchaseParameters)initWithBuyParams:(id)a3 isAudiobook:(BOOL)a4 hasRacSupport:(BOOL)a5 supportsUnifiedProductPage:(id)a6 editionKind:(id)a7 tracker:(id)a8
{
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)BSUIPurchaseParameters;
  v18 = [(BSUIPurchaseParameters *)&v21 init];
  v19 = v18;
  if (v18)
  {
    [(BSUIPurchaseParameters *)v18 setBuyParams:v14];
    [(BSUIPurchaseParameters *)v19 setIsAudiobook:v12];
    [(BSUIPurchaseParameters *)v19 setHasRacSupport:v11];
    [(BSUIPurchaseParameters *)v19 setTracker:v17];
    [(BSUIPurchaseParameters *)v19 setSupportsUnifiedProductPage:v15];
    [(BSUIPurchaseParameters *)v19 setEditionKind:v16];
  }

  return v19;
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
}

- (NSString)editionKind
{
  return self->_editionKind;
}

- (void)setEditionKind:(id)a3
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

- (_TtC13BookAnalytics9BATracker)tracker
{
  return self->_tracker;
}

- (void)setTracker:(id)a3
{
}

- (NSString)pageId
{
  return self->_pageId;
}

- (void)setPageId:(id)a3
{
}

- (NSString)pageType
{
  return self->_pageType;
}

- (void)setPageType:(id)a3
{
}

- (NSString)pageContext
{
  return self->_pageContext;
}

- (void)setPageContext:(id)a3
{
}

- (NSNumber)supportsUnifiedProductPage
{
  return self->_supportsUnifiedProductPage;
}

- (void)setSupportsUnifiedProductPage:(id)a3
{
  self->_supportsUnifiedProductPage = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageContext, 0);
  objc_storeStrong((id *)&self->_pageType, 0);
  objc_storeStrong((id *)&self->_pageId, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_editionKind, 0);

  objc_storeStrong((id *)&self->_buyParams, 0);
}

@end