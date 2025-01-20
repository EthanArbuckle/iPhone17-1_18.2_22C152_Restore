@interface SXAdComponentInserter
- (BOOL)validateMarker:(id)a3 DOMObjectProvider:(id)a4 layoutProvider:(id)a5;
- (SXAdComponentInserter)initWithConditionEngine:(id)a3 advertisingSettingsFactory:(id)a4;
- (SXAdvertisingSettingsFactory)advertisingSettingsFactory;
- (SXComponentInsertionConditionEngine)conditionEngine;
- (double)lastInsertedYOffset;
- (id)cacheValidatorForCache:(id)a3 DOMObjectProvider:(id)a4;
- (id)componentInsertForMarker:(id)a3 DOMObjectProvider:(id)a4 layoutProvider:(id)a5;
- (id)conditionsForDOMObjectProvider:(id)a3;
- (int64_t)insertedCount;
- (unint64_t)adTypeFromBannerType:(unint64_t)a3;
- (unint64_t)componentTraits;
- (void)componentInsertionCompleted;
- (void)setInsertedCount:(int64_t)a3;
- (void)setLastInsertedYOffset:(double)a3;
@end

@implementation SXAdComponentInserter

- (SXAdComponentInserter)initWithConditionEngine:(id)a3 advertisingSettingsFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXAdComponentInserter;
  v9 = [(SXAdComponentInserter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conditionEngine, a3);
    objc_storeStrong((id *)&v10->_advertisingSettingsFactory, a4);
  }

  return v10;
}

- (unint64_t)componentTraits
{
  return 16;
}

- (id)conditionsForDOMObjectProvider:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF980];
  id v5 = a3;
  v6 = [v4 array];
  id v7 = [(SXAdComponentInserter *)self advertisingSettingsFactory];
  id v8 = [v7 createAdvertisingSettingsWithDOMObjectProvider:v5];

  uint64_t v9 = [v8 distanceFromMedia];
  if (v10)
  {
    v11 = -[SXTraitDistanceComponentInsertionCondition initWithTrait:otherTrait:distance:]([SXTraitDistanceComponentInsertionCondition alloc], "initWithTrait:otherTrait:distance:", 42, 16, v9, v10);
    [v6 addObject:v11];
  }
  objc_super v12 = -[SXTraitDistanceComponentInsertionCondition initWithTrait:otherTrait:distance:]([SXTraitDistanceComponentInsertionCondition alloc], "initWithTrait:otherTrait:distance:", 16, 16, 0x4059000000000000, 2);
  [v6 addObject:v12];
  v13 = objc_alloc_init(SXParentContentDisplayCondition);
  [v6 addObject:v13];

  return v6;
}

- (BOOL)validateMarker:(id)a3 DOMObjectProvider:(id)a4 layoutProvider:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(SXAdComponentInserter *)self advertisingSettingsFactory];
  objc_super v12 = [v11 createAdvertisingSettingsWithDOMObjectProvider:v9];

  if (!v12
    || ![v12 frequency]
    || [v12 frequency] == 1 && -[SXAdComponentInserter insertedCount](self, "insertedCount") > 0)
  {
    goto LABEL_17;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v13 = objc_msgSend(v8, "path", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        if (![*(id *)(*((void *)&v29 + 1) + 8 * i) allowAutoplacedAds])
        {

          goto LABEL_17;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  if ([(SXAdComponentInserter *)self insertedCount] < 1) {
    goto LABEL_15;
  }
  [v10 documentSize];
  double v19 = v18;
  [(SXAdComponentInserter *)self lastInsertedYOffset];
  double v21 = v19 - v20;
  [v10 viewportSize];
  double v23 = v21 / (v21 / v22 * ((double)(unint64_t)[v12 frequency] / 10.0));
  [v8 approximateLocation];
  double v25 = v24;
  [(SXAdComponentInserter *)self lastInsertedYOffset];
  if (v25 >= v26 + v23) {
LABEL_15:
  }
    BOOL v27 = 1;
  else {
LABEL_17:
  }
    BOOL v27 = 0;

  return v27;
}

- (id)componentInsertForMarker:(id)a3 DOMObjectProvider:(id)a4 layoutProvider:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [(SXAdComponentInserter *)self advertisingSettingsFactory];
  objc_super v12 = [v11 createAdvertisingSettingsWithDOMObjectProvider:v10];

  v13 = -[SXInsertedAdComponent initWithAdType:]([SXInsertedAdComponent alloc], "initWithAdType:", -[SXAdComponentInserter adTypeFromBannerType:](self, "adTypeFromBannerType:", [v12 bannerType]));
  uint64_t v14 = [SXInsertComponentLayout alloc];
  uint64_t v15 = [v9 columnLayout];
  uint64_t v16 = [v15 documentLayout];
  v17 = -[SXInsertComponentLayout initWithColumnRange:](v14, "initWithColumnRange:", 0, [v16 columns]);

  [(SXInsertComponentLayout *)v17 setIgnoreDocumentMargin:3];
  double v18 = [v12 layout];
  double v19 = [v18 margin];

  if (!v19)
  {
    double v19 = [v9 suggestedMarginForMarker:v8];
  }
  [(SXInsertComponentLayout *)v17 setMargin:v19];
  [v8 approximateLocation];
  [(SXAdComponentInserter *)self setLastInsertedYOffset:v20];
  [(SXAdComponentInserter *)self setInsertedCount:[(SXAdComponentInserter *)self insertedCount] + 1];
  double v21 = [[SXComponentInsert alloc] initWithComponent:v13 componentLayout:v17];

  return v21;
}

- (id)cacheValidatorForCache:(id)a3 DOMObjectProvider:(id)a4
{
  id v5 = a4;
  v6 = [(SXAdComponentInserter *)self advertisingSettingsFactory];
  id v7 = [v6 createAdvertisingSettingsWithDOMObjectProvider:v5];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__SXAdComponentInserter_cacheValidatorForCache_DOMObjectProvider___block_invoke;
  v11[3] = &unk_264652488;
  v11[4] = self;
  id v12 = v7;
  id v8 = v7;
  id v9 = +[SXBlockComponentInsertionCacheValidator validatorWithBlock:v11];

  return v9;
}

uint64_t __66__SXAdComponentInserter_cacheValidatorForCache_DOMObjectProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  v6 = [v4 advertisingSettingsFactory];
  id v7 = [v6 createAdvertisingSettingsWithDOMObjectProvider:v5];

  uint64_t v8 = [*(id *)(a1 + 40) isEqual:v7];
  return v8;
}

- (void)componentInsertionCompleted
{
  [(SXAdComponentInserter *)self setLastInsertedYOffset:0.0];
  [(SXAdComponentInserter *)self setInsertedCount:0];
}

- (unint64_t)adTypeFromBannerType:(unint64_t)a3
{
  if (a3 - 2 >= 3) {
    return 1;
  }
  else {
    return a3 + 2;
  }
}

- (SXComponentInsertionConditionEngine)conditionEngine
{
  return self->_conditionEngine;
}

- (SXAdvertisingSettingsFactory)advertisingSettingsFactory
{
  return self->_advertisingSettingsFactory;
}

- (int64_t)insertedCount
{
  return self->_insertedCount;
}

- (void)setInsertedCount:(int64_t)a3
{
  self->_insertedCount = a3;
}

- (double)lastInsertedYOffset
{
  return self->_lastInsertedYOffset;
}

- (void)setLastInsertedYOffset:(double)a3
{
  self->_lastInsertedYOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisingSettingsFactory, 0);
  objc_storeStrong((id *)&self->_conditionEngine, 0);
}

@end