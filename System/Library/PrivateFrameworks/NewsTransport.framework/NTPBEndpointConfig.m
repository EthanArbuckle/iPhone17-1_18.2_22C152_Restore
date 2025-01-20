@interface NTPBEndpointConfig
- (BOOL)hasAnalyticsEndpointUrlsJson;
- (BOOL)hasAnalyticsEnvelopeContentTypePropJson;
- (BOOL)hasClientApiBaseUrl;
- (BOOL)hasEventRelayBaseUrl;
- (BOOL)hasEventRelayBatchBaseUrl;
- (BOOL)hasNewsNotificationsBaseUrl;
- (BOOL)hasRemoteDataSourceBaseUrl;
- (BOOL)hasStaticAssetBaseUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)analyticsEndpointUrlsJson;
- (NSString)analyticsEnvelopeContentTypePropJson;
- (NSString)clientApiBaseUrl;
- (NSString)eventRelayBaseUrl;
- (NSString)eventRelayBatchBaseUrl;
- (NSString)newsNotificationsBaseUrl;
- (NSString)remoteDataSourceBaseUrl;
- (NSString)staticAssetBaseUrl;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)environment;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAnalyticsEndpointUrlsJson:(id)a3;
- (void)setAnalyticsEnvelopeContentTypePropJson:(id)a3;
- (void)setClientApiBaseUrl:(id)a3;
- (void)setEnvironment:(int)a3;
- (void)setEventRelayBaseUrl:(id)a3;
- (void)setEventRelayBatchBaseUrl:(id)a3;
- (void)setNewsNotificationsBaseUrl:(id)a3;
- (void)setRemoteDataSourceBaseUrl:(id)a3;
- (void)setStaticAssetBaseUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBEndpointConfig

- (BOOL)hasClientApiBaseUrl
{
  return self->_clientApiBaseUrl != 0;
}

- (BOOL)hasEventRelayBaseUrl
{
  return self->_eventRelayBaseUrl != 0;
}

- (BOOL)hasEventRelayBatchBaseUrl
{
  return self->_eventRelayBatchBaseUrl != 0;
}

- (BOOL)hasNewsNotificationsBaseUrl
{
  return self->_newsNotificationsBaseUrl != 0;
}

- (BOOL)hasAnalyticsEndpointUrlsJson
{
  return self->_analyticsEndpointUrlsJson != 0;
}

- (BOOL)hasAnalyticsEnvelopeContentTypePropJson
{
  return self->_analyticsEnvelopeContentTypePropJson != 0;
}

- (BOOL)hasStaticAssetBaseUrl
{
  return self->_staticAssetBaseUrl != 0;
}

- (BOOL)hasRemoteDataSourceBaseUrl
{
  return self->_remoteDataSourceBaseUrl != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBEndpointConfig;
  v4 = [(NTPBEndpointConfig *)&v8 description];
  v5 = [(NTPBEndpointConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithInt:self->_environment];
  [v3 setObject:v4 forKey:@"environment"];

  clientApiBaseUrl = self->_clientApiBaseUrl;
  if (clientApiBaseUrl) {
    [v3 setObject:clientApiBaseUrl forKey:@"client_api_base_url"];
  }
  eventRelayBaseUrl = self->_eventRelayBaseUrl;
  if (eventRelayBaseUrl) {
    [v3 setObject:eventRelayBaseUrl forKey:@"event_relay_base_url"];
  }
  eventRelayBatchBaseUrl = self->_eventRelayBatchBaseUrl;
  if (eventRelayBatchBaseUrl) {
    [v3 setObject:eventRelayBatchBaseUrl forKey:@"event_relay_batch_base_url"];
  }
  newsNotificationsBaseUrl = self->_newsNotificationsBaseUrl;
  if (newsNotificationsBaseUrl) {
    [v3 setObject:newsNotificationsBaseUrl forKey:@"news_notifications_base_url"];
  }
  analyticsEndpointUrlsJson = self->_analyticsEndpointUrlsJson;
  if (analyticsEndpointUrlsJson) {
    [v3 setObject:analyticsEndpointUrlsJson forKey:@"analytics_endpoint_urls_json"];
  }
  analyticsEnvelopeContentTypePropJson = self->_analyticsEnvelopeContentTypePropJson;
  if (analyticsEnvelopeContentTypePropJson) {
    [v3 setObject:analyticsEnvelopeContentTypePropJson forKey:@"analytics_envelope_content_type_prop_json"];
  }
  staticAssetBaseUrl = self->_staticAssetBaseUrl;
  if (staticAssetBaseUrl) {
    [v3 setObject:staticAssetBaseUrl forKey:@"static_asset_base_url"];
  }
  remoteDataSourceBaseUrl = self->_remoteDataSourceBaseUrl;
  if (remoteDataSourceBaseUrl) {
    [v3 setObject:remoteDataSourceBaseUrl forKey:@"remote_data_source_base_url"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBEndpointConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_clientApiBaseUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_eventRelayBaseUrl) {
    PBDataWriterWriteStringField();
  }
  v4 = v5;
  if (self->_eventRelayBatchBaseUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_newsNotificationsBaseUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_analyticsEndpointUrlsJson)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_analyticsEnvelopeContentTypePropJson)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_staticAssetBaseUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_remoteDataSourceBaseUrl)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 32) = self->_environment;
  uint64_t v6 = [(NSString *)self->_clientApiBaseUrl copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_eventRelayBaseUrl copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_eventRelayBatchBaseUrl copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_newsNotificationsBaseUrl copyWithZone:a3];
  v13 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v12;

  uint64_t v14 = [(NSString *)self->_analyticsEndpointUrlsJson copyWithZone:a3];
  v15 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v14;

  uint64_t v16 = [(NSString *)self->_analyticsEnvelopeContentTypePropJson copyWithZone:a3];
  v17 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v16;

  uint64_t v18 = [(NSString *)self->_staticAssetBaseUrl copyWithZone:a3];
  v19 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v18;

  uint64_t v20 = [(NSString *)self->_remoteDataSourceBaseUrl copyWithZone:a3];
  v21 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v20;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_environment == *((_DWORD *)v4 + 8)
    && ((clientApiBaseUrl = self->_clientApiBaseUrl, !((unint64_t)clientApiBaseUrl | v4[3]))
     || -[NSString isEqual:](clientApiBaseUrl, "isEqual:"))
    && ((eventRelayBaseUrl = self->_eventRelayBaseUrl, !((unint64_t)eventRelayBaseUrl | v4[5]))
     || -[NSString isEqual:](eventRelayBaseUrl, "isEqual:"))
    && ((eventRelayBatchBaseUrl = self->_eventRelayBatchBaseUrl, !((unint64_t)eventRelayBatchBaseUrl | v4[6]))
     || -[NSString isEqual:](eventRelayBatchBaseUrl, "isEqual:"))
    && ((newsNotificationsBaseUrl = self->_newsNotificationsBaseUrl,
         !((unint64_t)newsNotificationsBaseUrl | v4[7]))
     || -[NSString isEqual:](newsNotificationsBaseUrl, "isEqual:"))
    && ((analyticsEndpointUrlsJson = self->_analyticsEndpointUrlsJson,
         !((unint64_t)analyticsEndpointUrlsJson | v4[1]))
     || -[NSString isEqual:](analyticsEndpointUrlsJson, "isEqual:"))
    && ((analyticsEnvelopeContentTypePropJson = self->_analyticsEnvelopeContentTypePropJson,
         !((unint64_t)analyticsEnvelopeContentTypePropJson | v4[2]))
     || -[NSString isEqual:](analyticsEnvelopeContentTypePropJson, "isEqual:"))
    && ((staticAssetBaseUrl = self->_staticAssetBaseUrl, !((unint64_t)staticAssetBaseUrl | v4[9]))
     || -[NSString isEqual:](staticAssetBaseUrl, "isEqual:")))
  {
    remoteDataSourceBaseUrl = self->_remoteDataSourceBaseUrl;
    if ((unint64_t)remoteDataSourceBaseUrl | v4[8]) {
      char v13 = -[NSString isEqual:](remoteDataSourceBaseUrl, "isEqual:");
    }
    else {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_environment;
  NSUInteger v4 = [(NSString *)self->_clientApiBaseUrl hash];
  NSUInteger v5 = v4 ^ [(NSString *)self->_eventRelayBaseUrl hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_eventRelayBatchBaseUrl hash];
  NSUInteger v7 = v6 ^ [(NSString *)self->_newsNotificationsBaseUrl hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_analyticsEndpointUrlsJson hash] ^ v3;
  NSUInteger v9 = [(NSString *)self->_analyticsEnvelopeContentTypePropJson hash];
  NSUInteger v10 = v9 ^ [(NSString *)self->_staticAssetBaseUrl hash];
  return v8 ^ v10 ^ [(NSString *)self->_remoteDataSourceBaseUrl hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  self->_environment = v4[8];
  NSUInteger v5 = v4;
  if (*((void *)v4 + 3)) {
    -[NTPBEndpointConfig setClientApiBaseUrl:](self, "setClientApiBaseUrl:");
  }
  if (v5[5]) {
    -[NTPBEndpointConfig setEventRelayBaseUrl:](self, "setEventRelayBaseUrl:");
  }
  if (v5[6]) {
    -[NTPBEndpointConfig setEventRelayBatchBaseUrl:](self, "setEventRelayBatchBaseUrl:");
  }
  if (v5[7]) {
    -[NTPBEndpointConfig setNewsNotificationsBaseUrl:](self, "setNewsNotificationsBaseUrl:");
  }
  if (v5[1]) {
    -[NTPBEndpointConfig setAnalyticsEndpointUrlsJson:](self, "setAnalyticsEndpointUrlsJson:");
  }
  if (v5[2]) {
    -[NTPBEndpointConfig setAnalyticsEnvelopeContentTypePropJson:](self, "setAnalyticsEnvelopeContentTypePropJson:");
  }
  if (v5[9]) {
    -[NTPBEndpointConfig setStaticAssetBaseUrl:](self, "setStaticAssetBaseUrl:");
  }
  if (v5[8]) {
    -[NTPBEndpointConfig setRemoteDataSourceBaseUrl:](self, "setRemoteDataSourceBaseUrl:");
  }
}

- (int)environment
{
  return self->_environment;
}

- (void)setEnvironment:(int)a3
{
  self->_environment = a3;
}

- (NSString)clientApiBaseUrl
{
  return self->_clientApiBaseUrl;
}

- (void)setClientApiBaseUrl:(id)a3
{
}

- (NSString)eventRelayBaseUrl
{
  return self->_eventRelayBaseUrl;
}

- (void)setEventRelayBaseUrl:(id)a3
{
}

- (NSString)eventRelayBatchBaseUrl
{
  return self->_eventRelayBatchBaseUrl;
}

- (void)setEventRelayBatchBaseUrl:(id)a3
{
}

- (NSString)newsNotificationsBaseUrl
{
  return self->_newsNotificationsBaseUrl;
}

- (void)setNewsNotificationsBaseUrl:(id)a3
{
}

- (NSString)analyticsEndpointUrlsJson
{
  return self->_analyticsEndpointUrlsJson;
}

- (void)setAnalyticsEndpointUrlsJson:(id)a3
{
}

- (NSString)analyticsEnvelopeContentTypePropJson
{
  return self->_analyticsEnvelopeContentTypePropJson;
}

- (void)setAnalyticsEnvelopeContentTypePropJson:(id)a3
{
}

- (NSString)staticAssetBaseUrl
{
  return self->_staticAssetBaseUrl;
}

- (void)setStaticAssetBaseUrl:(id)a3
{
}

- (NSString)remoteDataSourceBaseUrl
{
  return self->_remoteDataSourceBaseUrl;
}

- (void)setRemoteDataSourceBaseUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticAssetBaseUrl, 0);
  objc_storeStrong((id *)&self->_remoteDataSourceBaseUrl, 0);
  objc_storeStrong((id *)&self->_newsNotificationsBaseUrl, 0);
  objc_storeStrong((id *)&self->_eventRelayBatchBaseUrl, 0);
  objc_storeStrong((id *)&self->_eventRelayBaseUrl, 0);
  objc_storeStrong((id *)&self->_clientApiBaseUrl, 0);
  objc_storeStrong((id *)&self->_analyticsEnvelopeContentTypePropJson, 0);

  objc_storeStrong((id *)&self->_analyticsEndpointUrlsJson, 0);
}

@end