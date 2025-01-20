@interface WFWeatherStoreServiceConfiguration
+ (id)defaultConfiguration;
+ (id)defaultConfigurationWithSourceBundleIdentifier:(id)a3;
+ (id)generateUserAgent;
- (BOOL)isServiceAvailableSync;
- (BOOL)isValid;
- (Class)cacheClass;
- (NSString)apiVersion;
- (NSURL)cacheURL;
- (NSURL)serviceConnectivityEvaluationURL;
- (NSURLSession)session;
- (NWPathEvaluator)serviceConnectivityEvaluator;
- (WFSettingsManager)settingsManager;
- (WFWeatherStoreServiceConfiguration)init;
- (id)apiConfiguration;
- (id)apiConfigurationForAPIVersion:(id)a3;
- (id)aqiScaleRequestForScaleNamed:(id)a3 language:(id)a4 error:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)forecastRequestForTypes:(unint64_t)a3 location:(id)a4 date:(id)a5 apiVersion:(id)a6 error:(id *)a7;
- (id)forecastRequestForTypes:(unint64_t)a3 location:(id)a4 date:(id)a5 error:(id *)a6;
- (id)forecastRequestForTypes:(unint64_t)a3 location:(id)a4 units:(int)a5 date:(id)a6 apiVersion:(id)a7 error:(id *)a8;
- (id)forecastRequestForTypes:(unint64_t)a3 location:(id)a4 units:(int)a5 date:(id)a6 apiVersion:(id)a7 error:(id *)a8 requestOptions:(id)a9;
- (id)parseAQIScaleNamed:(id)a3 data:(id)a4 apiVersion:(id)a5 error:(id *)a6;
- (id)parseForecast:(unint64_t)a3 data:(id)a4 location:(id)a5 units:(int)a6 locale:(id)a7 date:(id)a8 apiVersion:(id)a9 error:(id *)a10;
- (id)parseForecast:(unint64_t)a3 data:(id)a4 location:(id)a5 units:(int)a6 locale:(id)a7 date:(id)a8 error:(id *)a9;
- (os_unfair_lock_s)serviceConnectivityEvaluationURLLock;
- (os_unfair_lock_s)serviceConnectivityEvaluatorLock;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)invalidate;
- (void)setCacheClass:(Class)a3;
- (void)setCacheURL:(id)a3;
- (void)setServiceConnectivityEvaluationURL:(id)a3;
- (void)setServiceConnectivityEvaluationURLLock:(os_unfair_lock_s)a3;
- (void)setServiceConnectivityEvaluatorLock:(os_unfair_lock_s)a3;
- (void)setSession:(id)a3;
- (void)setSettingsManager:(id)a3;
@end

@implementation WFWeatherStoreServiceConfiguration

+ (id)defaultConfigurationWithSourceBundleIdentifier:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  v4 = objc_opt_new();
  v5 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  [v5 setHTTPShouldUsePipelining:1];
  [v5 setTimeoutIntervalForRequest:30.0];
  v12 = @"User-Agent";
  v6 = +[WFWeatherStoreServiceConfiguration generateUserAgent];
  v13[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v5 setHTTPAdditionalHeaders:v7];

  if (v3) {
    objc_msgSend(v5, "set_sourceApplicationBundleIdentifier:", v3);
  }
  v8 = [MEMORY[0x263F08BF8] sessionWithConfiguration:v5 delegate:v4 delegateQueue:0];
  [v4 setSession:v8];

  v9 = objc_msgSend(NSURL, "wf_inMemoryAddress");
  [v4 setCacheURL:v9];

  v10 = +[WFSettingsManager sharedInstance];
  [v4 setSettingsManager:v10];

  return v4;
}

+ (id)defaultConfiguration
{
  v2 = objc_opt_class();
  return (id)[v2 defaultConfigurationWithSourceBundleIdentifier:0];
}

- (WFWeatherStoreServiceConfiguration)init
{
  v4.receiver = self;
  v4.super_class = (Class)WFWeatherStoreServiceConfiguration;
  v2 = [(WFWeatherStoreServiceConfiguration *)&v4 init];
  if (v2)
  {
    [(WFWeatherStoreServiceConfiguration *)v2 setCacheClass:objc_opt_class()];
    [(WFWeatherStoreServiceConfiguration *)v2 setServiceConnectivityEvaluationURLLock:0];
    [(WFWeatherStoreServiceConfiguration *)v2 setServiceConnectivityEvaluatorLock:0];
  }
  return v2;
}

- (void)invalidate
{
  id v2 = [(WFWeatherStoreServiceConfiguration *)self session];
  [v2 invalidateAndCancel];
}

- (NSString)apiVersion
{
  id v2 = [(WFWeatherStoreServiceConfiguration *)self settingsManager];
  id v3 = [v2 APIVersion];
  objc_super v4 = v3;
  if (!v3) {
    id v3 = @"wds_v1";
  }
  v5 = v3;

  return v5;
}

- (id)apiConfiguration
{
  id v3 = [(WFWeatherStoreServiceConfiguration *)self apiVersion];
  objc_super v4 = [(WFWeatherStoreServiceConfiguration *)self apiConfigurationForAPIVersion:v3];

  return v4;
}

- (id)apiConfigurationForAPIVersion:(id)a3
{
  objc_super v4 = +[WFAPIConfigurationFactory configurationForAPIVersion:a3];
  if (v4)
  {
    v5 = [(WFWeatherStoreServiceConfiguration *)self serviceConnectivityEvaluationURL];
    v6 = [v4 hostUrl];
    char v7 = [v5 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      v8 = [v4 hostUrl];
      [(WFWeatherStoreServiceConfiguration *)self setServiceConnectivityEvaluationURL:v8];
    }
  }
  return v4;
}

- (BOOL)isValid
{
  id v3 = [(WFWeatherStoreServiceConfiguration *)self apiConfiguration];
  if ([v3 isValid] && -[WFWeatherStoreServiceConfiguration cacheClass](self, "cacheClass"))
  {
    objc_super v4 = [(WFWeatherStoreServiceConfiguration *)self session];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)forecastRequestForTypes:(unint64_t)a3 location:(id)a4 date:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  v12 = [(WFWeatherStoreServiceConfiguration *)self apiVersion];
  v13 = [(WFWeatherStoreServiceConfiguration *)self forecastRequestForTypes:a3 location:v11 date:v10 apiVersion:v12 error:a6];

  return v13;
}

- (id)forecastRequestForTypes:(unint64_t)a3 location:(id)a4 date:(id)a5 apiVersion:(id)a6 error:(id *)a7
{
  return [(WFWeatherStoreServiceConfiguration *)self forecastRequestForTypes:a3 location:a4 units:0 date:a5 apiVersion:a6 error:a7];
}

- (id)forecastRequestForTypes:(unint64_t)a3 location:(id)a4 units:(int)a5 date:(id)a6 apiVersion:(id)a7 error:(id *)a8
{
  return [(WFWeatherStoreServiceConfiguration *)self forecastRequestForTypes:a3 location:a4 units:*(void *)&a5 date:a6 apiVersion:a7 error:a8 requestOptions:0];
}

- (id)forecastRequestForTypes:(unint64_t)a3 location:(id)a4 units:(int)a5 date:(id)a6 apiVersion:(id)a7 error:(id *)a8 requestOptions:(id)a9
{
  uint64_t v12 = *(void *)&a5;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  uint64_t v19 = WFForecastTypesUnknownTypes(a3);
  if (v19)
  {
    if (a8)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x263F087E8], "wf_errorWithCode:", 5);
      v20 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    uint64_t v30 = v19;
    v31 = WFLogForCategory(0);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherStoreServiceConfiguration forecastRequestForTypes:location:units:date:apiVersion:error:requestOptions:](a3, v30, v31);
    }
  }
  else
  {
    v21 = [v15 geoLocation];

    if (v21)
    {
      v22 = [WFRequestFormattingRules alloc];
      [(WFWeatherStoreServiceConfiguration *)self settingsManager];
      id v34 = v15;
      id v23 = v18;
      id v24 = v17;
      v26 = id v25 = v16;
      v27 = [v26 settings];
      v28 = [(WFRequestFormattingRules *)v22 initWithSettings:v27];

      id v16 = v25;
      id v17 = v24;
      id v18 = v23;
      id v15 = v34;
      v29 = [(WFWeatherStoreServiceConfiguration *)self apiConfigurationForAPIVersion:v17];
      v20 = [v29 forecastRequestForTypes:a3 location:v34 units:v12 date:v16 error:a8 rules:v28 options:v18];

      goto LABEL_10;
    }
    v33 = WFLogForCategory(2uLL);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[WFWeatherStoreServiceConfiguration forecastRequestForTypes:location:units:date:apiVersion:error:requestOptions:]((uint64_t)v15, v33);
    }

    if (a8) {
      goto LABEL_3;
    }
  }
  v20 = 0;
LABEL_10:

  return v20;
}

- (id)parseForecast:(unint64_t)a3 data:(id)a4 location:(id)a5 units:(int)a6 locale:(id)a7 date:(id)a8 error:(id *)a9
{
  uint64_t v10 = *(void *)&a6;
  id v15 = a8;
  id v16 = a7;
  id v17 = a5;
  id v18 = a4;
  uint64_t v19 = [(WFWeatherStoreServiceConfiguration *)self apiVersion];
  v20 = [(WFWeatherStoreServiceConfiguration *)self parseForecast:a3 data:v18 location:v17 units:v10 locale:v16 date:v15 apiVersion:v19 error:a9];

  return v20;
}

- (id)parseForecast:(unint64_t)a3 data:(id)a4 location:(id)a5 units:(int)a6 locale:(id)a7 date:(id)a8 apiVersion:(id)a9 error:(id *)a10
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a5;
  id v19 = a4;
  v20 = [WFResponseParsingRules alloc];
  v21 = [(WFWeatherStoreServiceConfiguration *)self settingsManager];
  v22 = [v21 settings];
  id v23 = [(WFResponseParsingRules *)v20 initWithSettings:v22];

  id v24 = [(WFWeatherStoreServiceConfiguration *)self apiConfigurationForAPIVersion:v15];

  id v25 = [v24 parseForecast:a3 data:v19 location:v18 units:a6 locale:v17 date:v16 error:a10 rules:v23];

  return v25;
}

- (id)aqiScaleRequestForScaleNamed:(id)a3 language:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [(WFWeatherStoreServiceConfiguration *)self apiVersion];
  uint64_t v10 = [(WFWeatherStoreServiceConfiguration *)self apiConfigurationForAPIVersion:v9];

  id v11 = [v10 aqiRequestForScaleNamed:v8 language:v7];

  return v11;
}

- (id)parseAQIScaleNamed:(id)a3 data:(id)a4 apiVersion:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a3;
  id v11 = [(WFWeatherStoreServiceConfiguration *)self apiVersion];
  uint64_t v12 = [(WFWeatherStoreServiceConfiguration *)self apiConfigurationForAPIVersion:v11];

  v13 = [v12 parseAQIScaleNamed:v10 data:v9 error:a6];

  return v13;
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v6 = a5;
  id v7 = a4;
  id v8 = [v6 transactionMetrics];
  id v9 = [v8 firstObject];

  id v10 = NSString;
  id v11 = [v7 response];
  uint64_t v12 = [v11 URL];
  v13 = [v12 host];
  v14 = [v7 response];

  id v15 = [v14 URL];
  id v16 = [v15 path];
  id v17 = [v10 stringWithFormat:@"%@%@", v13, v16];

  id v18 = [v6 taskInterval];

  id v19 = [v9 requestEndDate];
  v20 = [v9 requestStartDate];
  [v19 timeIntervalSinceDate:v20];
  uint64_t v22 = v21;

  id v23 = [v9 responseEndDate];
  id v24 = [v9 responseStartDate];
  [v23 timeIntervalSinceDate:v24];
  uint64_t v26 = v25;

  v27 = [v9 secureConnectionEndDate];
  v28 = [v9 secureConnectionStartDate];
  [v27 timeIntervalSinceDate:v28];
  uint64_t v30 = v29;

  v31 = [v9 domainLookupEndDate];
  v32 = [v9 domainLookupStartDate];
  [v31 timeIntervalSinceDate:v32];
  uint64_t v34 = v33;

  v35 = WFLogForCategory(8uLL);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138479107;
    v43 = v17;
    __int16 v44 = 2114;
    v45 = v18;
    __int16 v46 = 2048;
    uint64_t v47 = v22;
    __int16 v48 = 2048;
    uint64_t v49 = v26;
    __int16 v50 = 2048;
    uint64_t v51 = v30;
    __int16 v52 = 2048;
    uint64_t v53 = v34;
    _os_log_impl(&dword_21C988000, v35, OS_LOG_TYPE_INFO, "Data fetched from: %{private}@, total time: %{public}@, request time: %f, response time: %f, TLS time:  %f, DNS time: %f", buf, 0x3Eu);
  }

  v36 = [v9 response];

  if (v36)
  {
    v37 = [WFNetworkEvent alloc];
    v38 = [(WFWeatherStoreServiceConfiguration *)self apiVersion];
    v39 = [(WFNetworkEvent *)v37 initWithEventType:WFNetworkEventTypeFromAPIVersion(v38) metrics:v9];

    v40 = +[WFNetworkBehaviorMonitor sharedInstance];
    [v40 logNetworkEvent:v39];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  objc_super v4 = objc_opt_new();
  BOOL v5 = [(WFWeatherStoreServiceConfiguration *)self settingsManager];
  [v4 setSettingsManager:v5];

  id v6 = [(WFWeatherStoreServiceConfiguration *)self session];
  [v4 setSession:v6];

  id v7 = [(WFWeatherStoreServiceConfiguration *)self cacheURL];
  [v4 setCacheURL:v7];

  uint64_t v8 = [(WFWeatherStoreServiceConfiguration *)self serviceConnectivityEvaluationURL];
  id v9 = (void *)v4[3];
  v4[3] = v8;

  return v4;
}

- (NSURL)serviceConnectivityEvaluationURL
{
  p_serviceConnectivityEvaluationURLLock = &self->_serviceConnectivityEvaluationURLLock;
  os_unfair_lock_lock_with_options();
  objc_super v4 = (void *)[(NSURL *)self->_serviceConnectivityEvaluationURL copy];
  os_unfair_lock_unlock(p_serviceConnectivityEvaluationURLLock);
  return (NSURL *)v4;
}

- (void)setServiceConnectivityEvaluationURL:(id)a3
{
  p_serviceConnectivityEvaluationURLLock = &self->_serviceConnectivityEvaluationURLLock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  id v6 = (NSURL *)[v5 copy];

  serviceConnectivityEvaluationURL = self->_serviceConnectivityEvaluationURL;
  self->_serviceConnectivityEvaluationURL = v6;

  os_unfair_lock_unlock(p_serviceConnectivityEvaluationURLLock);
}

+ (id)generateUserAgent
{
  id v2 = [MEMORY[0x263F08AB0] processInfo];
  id v3 = [v2 processName];
  CFDictionaryRef v4 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  id v5 = objc_msgSend(NSString, "stringWithString:", CFDictionaryGetValue(v4, (const void *)*MEMORY[0x263EFFAB0]));
  CFRelease(v4);
  id v6 = NSString;
  id v7 = [NSNumber numberWithDouble:531.0];
  uint64_t v8 = [v6 stringWithFormat:@"%@_WeatherFoundation[%@]_%@", v3, v7, v5];
  id v9 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v10 = [v8 stringByTrimmingCharactersInSet:v9];

  return v10;
}

- (BOOL)isServiceAvailableSync
{
  p_serviceConnectivityEvaluatorLock = &self->_serviceConnectivityEvaluatorLock;
  os_unfair_lock_lock_with_options();
  serviceConnectivityEvaluator = self->_serviceConnectivityEvaluator;
  if (serviceConnectivityEvaluator) {
    goto LABEL_3;
  }
  id v5 = (void *)MEMORY[0x263F14420];
  id v6 = [(WFWeatherStoreServiceConfiguration *)self serviceConnectivityEvaluationURL];
  objc_msgSend(v5, "wf_pathEvaluatorForURL:", v6);
  id v7 = (NWPathEvaluator *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = self->_serviceConnectivityEvaluator;
  self->_serviceConnectivityEvaluator = v7;

  serviceConnectivityEvaluator = self->_serviceConnectivityEvaluator;
  if (serviceConnectivityEvaluator)
  {
LABEL_3:
    id v9 = [(NWPathEvaluator *)serviceConnectivityEvaluator path];
    uint64_t v10 = [v9 status];

    BOOL v11 = (v10 & 0xFFFFFFFFFFFFFFFDLL) == 1;
  }
  else
  {
    BOOL v11 = 0;
  }
  os_unfair_lock_unlock(p_serviceConnectivityEvaluatorLock);
  return v11;
}

- (NWPathEvaluator)serviceConnectivityEvaluator
{
  return self->_serviceConnectivityEvaluator;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void)setCacheURL:(id)a3
{
}

- (os_unfair_lock_s)serviceConnectivityEvaluationURLLock
{
  return self->_serviceConnectivityEvaluationURLLock;
}

- (void)setServiceConnectivityEvaluationURLLock:(os_unfair_lock_s)a3
{
  self->_serviceConnectivityEvaluationURLLock = a3;
}

- (os_unfair_lock_s)serviceConnectivityEvaluatorLock
{
  return self->_serviceConnectivityEvaluatorLock;
}

- (void)setServiceConnectivityEvaluatorLock:(os_unfair_lock_s)a3
{
  self->_serviceConnectivityEvaluatorLock = a3;
}

- (Class)cacheClass
{
  return self->_cacheClass;
}

- (void)setCacheClass:(Class)a3
{
}

- (WFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_cacheClass, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceConnectivityEvaluationURL, 0);
  objc_storeStrong((id *)&self->_serviceConnectivityEvaluator, 0);
}

- (void)forecastRequestForTypes:(uint64_t)a1 location:(NSObject *)a2 units:date:apiVersion:error:requestOptions:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C988000, a2, OS_LOG_TYPE_ERROR, "Cannot format a forecast request without a geolocation: %@", (uint8_t *)&v2, 0xCu);
}

- (void)forecastRequestForTypes:(os_log_t)log location:units:date:apiVersion:error:requestOptions:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21C988000, log, OS_LOG_TYPE_ERROR, "Asked for forecast request for %lu, but it contains unknown types %lu.", (uint8_t *)&v3, 0x16u);
}

@end