@interface StockChartData
- ($87A9BE3275E22128A73FF46D0B92144E)allocateStockValuesWithCount:(unsigned int)a3;
- ($87A9BE3275E22128A73FF46D0B92144E)maxValue;
- ($87A9BE3275E22128A73FF46D0B92144E)minValue;
- ($87A9BE3275E22128A73FF46D0B92144E)stockValues;
- (BOOL)hasVolume;
- (BOOL)isUnavailable;
- (NSArray)interestingIndexes;
- (NSDate)marketCloseDate;
- (NSDate)marketOpenDate;
- (NSDictionary)dataSeriesDict;
- (NSTimeZone)marketTimeZone;
- (Stock)stock;
- (StockChartData)initWithStock:(id)a3 interval:(int64_t)a4;
- (double)expirationTime;
- (float)previousClosePrice;
- (id)description;
- (id)imageSetForDisplayMode:(id)a3;
- (id)xAxisLabelInfoArrayForMode:(id)a3;
- (id)yAxisLabelInfoArrayForMode:(id)a3;
- (int)yAxisFractionDigits;
- (int64_t)chartInterval;
- (int64_t)labelPlacementForDisplayMode:(id)a3;
- (unsigned)stockValueCount;
- (void)clearAllImageSets;
- (void)dealloc;
- (void)setChartInterval:(int64_t)a3;
- (void)setDataSeriesDict:(id)a3;
- (void)setExpirationTime:(double)a3;
- (void)setHasVolume:(BOOL)a3;
- (void)setImageSet:(id)a3 forDisplayMode:(id)a4;
- (void)setInterestingIndexes:(id)a3;
- (void)setIsUnavailable:(BOOL)a3;
- (void)setLabelPlacement:(int64_t)a3 forDisplayMode:(id)a4;
- (void)setMarketCloseDate:(id)a3;
- (void)setMarketOpenDate:(id)a3;
- (void)setMarketTimeZone:(id)a3;
- (void)setMaxValue:(id *)a3;
- (void)setMinValue:(id *)a3;
- (void)setPreviousClosePrice:(float)a3;
- (void)setStock:(id)a3;
- (void)setXAxisLabelInfoArray:(id)a3 forDisplayMode:(id)a4;
- (void)setYAxisFractionDigits:(int)a3;
- (void)setYAxisLabelInfoArray:(id)a3 forDisplayMode:(id)a4;
@end

@implementation StockChartData

- (StockChartData)initWithStock:(id)a3 interval:(int64_t)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)StockChartData;
  v7 = [(StockChartData *)&v18 init];
  v8 = v7;
  if (v7)
  {
    [(StockChartData *)v7 setStock:v6];
    v8->_chartInterval = a4;
    uint64_t v9 = objc_opt_new();
    imageSetCache = v8->_imageSetCache;
    v8->_imageSetCache = (NSMutableDictionary *)v9;

    uint64_t v11 = objc_opt_new();
    yAxisLabelInfoCache = v8->_yAxisLabelInfoCache;
    v8->_yAxisLabelInfoCache = (NSMutableDictionary *)v11;

    uint64_t v13 = objc_opt_new();
    xAxisLabelInfoCache = v8->_xAxisLabelInfoCache;
    v8->_xAxisLabelInfoCache = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    labelPlacementCache = v8->_labelPlacementCache;
    v8->_labelPlacementCache = (NSMutableDictionary *)v15;
  }
  return v8;
}

- ($87A9BE3275E22128A73FF46D0B92144E)allocateStockValuesWithCount:(unsigned int)a3
{
  result = ($87A9BE3275E22128A73FF46D0B92144E *)malloc_type_calloc(0x18uLL, a3, 0x613E0D22uLL);
  self->_stockValues = result;
  self->_stockValueCount = a3;
  return result;
}

- (id)imageSetForDisplayMode:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_imageSetCache objectForKey:a3];
}

- (void)setImageSet:(id)a3 forDisplayMode:(id)a4
{
}

- (void)clearAllImageSets
{
}

- (id)yAxisLabelInfoArrayForMode:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_yAxisLabelInfoCache objectForKey:a3];
}

- (void)setYAxisLabelInfoArray:(id)a3 forDisplayMode:(id)a4
{
}

- (id)xAxisLabelInfoArrayForMode:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_xAxisLabelInfoCache objectForKey:a3];
}

- (void)setXAxisLabelInfoArray:(id)a3 forDisplayMode:(id)a4
{
}

- (int64_t)labelPlacementForDisplayMode:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_labelPlacementCache objectForKey:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setLabelPlacement:(int64_t)a3 forDisplayMode:(id)a4
{
  labelPlacementCache = self->_labelPlacementCache;
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [(NSMutableDictionary *)labelPlacementCache setObject:v8 forKey:v7];
}

- (id)description
{
  v3 = NSString;
  int64_t v4 = [(StockChartData *)self stock];
  v5 = [v4 symbol];
  id v6 = +[ChartUpdater _rangeStringForInterval:self->_chartInterval];
  id v7 = [v3 stringWithFormat:@"<StockChartData: %p, symbol = %@, interval = %@", self, v5, v6];

  return v7;
}

- (void)dealloc
{
  free(self->_stockValues);
  v3.receiver = self;
  v3.super_class = (Class)StockChartData;
  [(StockChartData *)&v3 dealloc];
}

- (Stock)stock
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stock);

  return (Stock *)WeakRetained;
}

- (void)setStock:(id)a3
{
}

- (int64_t)chartInterval
{
  return self->_chartInterval;
}

- (void)setChartInterval:(int64_t)a3
{
  self->_chartInterval = a3;
}

- ($87A9BE3275E22128A73FF46D0B92144E)stockValues
{
  return self->_stockValues;
}

- (unsigned)stockValueCount
{
  return self->_stockValueCount;
}

- (NSArray)interestingIndexes
{
  return self->_interestingIndexes;
}

- (void)setInterestingIndexes:(id)a3
{
}

- (NSDate)marketOpenDate
{
  return self->_marketOpenDate;
}

- (void)setMarketOpenDate:(id)a3
{
}

- (NSDate)marketCloseDate
{
  return self->_marketCloseDate;
}

- (void)setMarketCloseDate:(id)a3
{
}

- (NSTimeZone)marketTimeZone
{
  return self->_marketTimeZone;
}

- (void)setMarketTimeZone:(id)a3
{
}

- ($87A9BE3275E22128A73FF46D0B92144E)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(id *)a3
{
  self->_minValue = a3;
}

- ($87A9BE3275E22128A73FF46D0B92144E)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(id *)a3
{
  self->_maxValue = a3;
}

- (float)previousClosePrice
{
  return self->_previousClosePrice;
}

- (void)setPreviousClosePrice:(float)a3
{
  self->_previousClosePrice = a3;
}

- (double)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(double)a3
{
  self->_expirationTime = a3;
}

- (BOOL)isUnavailable
{
  return self->_isUnavailable;
}

- (void)setIsUnavailable:(BOOL)a3
{
  self->_isUnavailable = a3;
}

- (BOOL)hasVolume
{
  return self->_hasVolume;
}

- (void)setHasVolume:(BOOL)a3
{
  self->_hasVolume = a3;
}

- (int)yAxisFractionDigits
{
  return self->_yAxisFractionDigits;
}

- (void)setYAxisFractionDigits:(int)a3
{
  self->_yAxisFractionDigits = a3;
}

- (NSDictionary)dataSeriesDict
{
  return self->_dataSeriesDict;
}

- (void)setDataSeriesDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSeriesDict, 0);
  objc_storeStrong((id *)&self->_marketTimeZone, 0);
  objc_storeStrong((id *)&self->_marketCloseDate, 0);
  objc_storeStrong((id *)&self->_marketOpenDate, 0);
  objc_storeStrong((id *)&self->_interestingIndexes, 0);
  objc_destroyWeak((id *)&self->_stock);
  objc_storeStrong((id *)&self->_labelPlacementCache, 0);
  objc_storeStrong((id *)&self->_xAxisLabelInfoCache, 0);
  objc_storeStrong((id *)&self->_yAxisLabelInfoCache, 0);

  objc_storeStrong((id *)&self->_imageSetCache, 0);
}

@end