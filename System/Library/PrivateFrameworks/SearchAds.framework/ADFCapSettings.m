@interface ADFCapSettings
- (ADFCapSettings)initWithType:(int64_t)a3 location:(double)a4 clickExpiration:(double)a5 fCapExpiration:(double)a6 maxFCapElements:(unint64_t)a7 maxClickCapElements:(unint64_t)a8;
- (double)clickExpirationThresholdInSeconds;
- (double)frequencyCapExpirationInSeconds;
- (double)reverseGeolocationRefreshThresholdInMeters;
- (id)_capTypeToString:(int64_t)a3;
- (int64_t)pageType;
- (unint64_t)maxClickCapElements;
- (unint64_t)maxFrequencyCapElements;
- (void)overrideClickExpiration:(double)a3;
- (void)overrideFrequencyCapExpiration:(double)a3;
- (void)overrideMaxClickElements:(unint64_t)a3;
- (void)overrideMaxFrequencyCapElements:(unint64_t)a3;
- (void)overrideRevGeoThreshold:(double)a3;
- (void)setClickExpirationThresholdInSeconds:(double)a3;
- (void)setFrequencyCapExpirationInSeconds:(double)a3;
- (void)setMaxClickCapElements:(unint64_t)a3;
- (void)setMaxFrequencyCapElements:(unint64_t)a3;
- (void)setPageType:(int64_t)a3;
- (void)setReverseGeolocationRefreshThresholdInMeters:(double)a3;
@end

@implementation ADFCapSettings

- (ADFCapSettings)initWithType:(int64_t)a3 location:(double)a4 clickExpiration:(double)a5 fCapExpiration:(double)a6 maxFCapElements:(unint64_t)a7 maxClickCapElements:(unint64_t)a8
{
  v15.receiver = self;
  v15.super_class = (Class)ADFCapSettings;
  result = [(ADFCapSettings *)&v15 init];
  if (result)
  {
    result->_pageType = a3;
    result->_reverseGeolocationRefreshThresholdInMeters = a4;
    result->_clickExpirationThresholdInSeconds = a5;
    result->_frequencyCapExpirationInSeconds = a6;
    result->_maxFrequencyCapElements = a7;
    result->_maxClickCapElements = a8;
  }
  return result;
}

- (void)setReverseGeolocationRefreshThresholdInMeters:(double)a3
{
  self->_reverseGeolocationRefreshThresholdInMeters = a3;
}

- (void)setMaxFrequencyCapElements:(unint64_t)a3
{
  self->_maxFrequencyCapElements = a3;
}

- (void)setMaxClickCapElements:(unint64_t)a3
{
  self->_maxClickCapElements = a3;
}

- (void)setFrequencyCapExpirationInSeconds:(double)a3
{
  self->_frequencyCapExpirationInSeconds = a3;
}

- (void)setClickExpirationThresholdInSeconds:(double)a3
{
  self->_clickExpirationThresholdInSeconds = a3;
}

- (void)overrideFrequencyCapExpiration:(double)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_msgSend_pageType(self, v6, v7, v8, v9);
    v14 = objc_msgSend__capTypeToString_(self, v11, v10, v12, v13);
    int v19 = 138412546;
    v20 = v14;
    __int16 v21 = 2048;
    double v22 = a3;
    _os_log_impl(&dword_236756000, v5, OS_LOG_TYPE_DEFAULT, "%@ Frequency Cap Expiration Overridden: %f seconds.", (uint8_t *)&v19, 0x16u);
  }
  objc_msgSend_setFrequencyCapExpirationInSeconds_(self, v15, v16, v17, v18, a3);
}

- (void)overrideMaxFrequencyCapElements:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_msgSend_pageType(self, v6, v7, v8, v9);
    v14 = objc_msgSend__capTypeToString_(self, v11, v10, v12, v13);
    int v18 = 138412546;
    int v19 = v14;
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    _os_log_impl(&dword_236756000, v5, OS_LOG_TYPE_DEFAULT, "%@ Max Frequency Cap Elements Overridden: %lu elements.", (uint8_t *)&v18, 0x16u);
  }
  objc_msgSend_setMaxFrequencyCapElements_(self, v15, a3, v16, v17);
}

- (void)overrideClickExpiration:(double)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_msgSend_pageType(self, v6, v7, v8, v9);
    v14 = objc_msgSend__capTypeToString_(self, v11, v10, v12, v13);
    int v19 = 138412546;
    __int16 v20 = v14;
    __int16 v21 = 2048;
    double v22 = a3;
    _os_log_impl(&dword_236756000, v5, OS_LOG_TYPE_DEFAULT, "%@ Toro Click Expiration Overridden: %f seconds.", (uint8_t *)&v19, 0x16u);
  }
  objc_msgSend_setClickExpirationThresholdInSeconds_(self, v15, v16, v17, v18, a3);
}

- (void)overrideMaxClickElements:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_msgSend_pageType(self, v6, v7, v8, v9);
    v14 = objc_msgSend__capTypeToString_(self, v11, v10, v12, v13);
    int v18 = 138412546;
    int v19 = v14;
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    _os_log_impl(&dword_236756000, v5, OS_LOG_TYPE_DEFAULT, "%@ Max Toro Click Elements Overridden: %lu elements.", (uint8_t *)&v18, 0x16u);
  }
  objc_msgSend_setMaxClickCapElements_(self, v15, a3, v16, v17);
}

- (void)overrideRevGeoThreshold:(double)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v5 = APLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = objc_msgSend_pageType(self, v6, v7, v8, v9);
    v14 = objc_msgSend__capTypeToString_(self, v11, v10, v12, v13);
    int v19 = 138412546;
    __int16 v20 = v14;
    __int16 v21 = 2048;
    double v22 = a3;
    _os_log_impl(&dword_236756000, v5, OS_LOG_TYPE_DEFAULT, "%@ Reverse Geolocation Update Threshold Overridden: %f meters.", (uint8_t *)&v19, 0x16u);
  }
  objc_msgSend_setReverseGeolocationRefreshThresholdInMeters_(self, v15, v16, v17, v18, a3);
}

- (id)_capTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"Unknown";
  }
  else {
    return off_264CADB18[a3];
  }
}

- (int64_t)pageType
{
  return self->_pageType;
}

- (void)setPageType:(int64_t)a3
{
  self->_pageType = a3;
}

- (double)reverseGeolocationRefreshThresholdInMeters
{
  return self->_reverseGeolocationRefreshThresholdInMeters;
}

- (double)clickExpirationThresholdInSeconds
{
  return self->_clickExpirationThresholdInSeconds;
}

- (double)frequencyCapExpirationInSeconds
{
  return self->_frequencyCapExpirationInSeconds;
}

- (unint64_t)maxFrequencyCapElements
{
  return self->_maxFrequencyCapElements;
}

- (unint64_t)maxClickCapElements
{
  return self->_maxClickCapElements;
}

@end