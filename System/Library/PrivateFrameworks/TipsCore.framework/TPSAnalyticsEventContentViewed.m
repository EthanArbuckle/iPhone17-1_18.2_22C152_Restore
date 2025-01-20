@interface TPSAnalyticsEventContentViewed
+ (BOOL)supportsSecureCoding;
+ (BOOL)updateSessionViewNumber;
+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 viewMethod:(id)a7 viewMode:(id)a8;
+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 widgetType:(id)a7;
+ (void)incrementSessionViewNumberForKey:(id)a3;
+ (void)resetSessionViewNumber;
+ (void)setAppReferrer:(id)a3;
- (BOOL)isWidget;
- (NSNumber)sessionViewNumber;
- (NSString)clientConditionID;
- (NSString)collectionID;
- (NSString)contentID;
- (NSString)correlationID;
- (NSString)viewMethod;
- (NSString)viewMode;
- (NSString)widgetType;
- (TPSAnalyticsEventContentViewed)initWithCoder:(id)a3;
- (id)_initWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 viewMethod:(id)a7 viewMode:(id)a8;
- (id)_initWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 widgetType:(id)a7;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)log;
- (void)setClientConditionID:(id)a3;
- (void)setCollectionID:(id)a3;
- (void)setContentID:(id)a3;
- (void)setCorrelationID:(id)a3;
- (void)setViewMethod:(id)a3;
- (void)setViewMode:(id)a3;
- (void)setWidgetType:(id)a3;
@end

@implementation TPSAnalyticsEventContentViewed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)resetSessionViewNumber
{
  +[TPSAnalyticsPersistenceController persistObject:&unk_1EED9AFF0 forKey:@"new_content_viewed"];
  +[TPSAnalyticsPersistenceController persistObject:&unk_1EED9AFF0 forKey:@"collection_viewed"];
}

+ (BOOL)updateSessionViewNumber
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3 - *(double *)&_lastContentViewedRef;
  if (v3 - *(double *)&_lastContentViewedRef > 300.0) {
    [a1 resetSessionViewNumber];
  }
  return v4 > 300.0;
}

- (TPSAnalyticsEventContentViewed)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TPSAnalyticsEventContentViewed;
  v5 = [(TPSAnalyticsEvent *)&v21 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"collection_ID"];
    collectionID = v5->_collectionID;
    v5->_collectionID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_correlation_ID"];
    correlationID = v5->_correlationID;
    v5->_correlationID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"client_condition"];
    clientConditionID = v5->_clientConditionID;
    v5->_clientConditionID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"view_src"];
    viewMethod = v5->_viewMethod;
    v5->_viewMethod = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mode"];
    viewMode = v5->_viewMode;
    v5->_viewMode = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"referrer"];
    v19 = (void *)_appReferrer;
    _appReferrer = v18;
  }
  return v5;
}

- (id)_initWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 viewMethod:(id)a7 viewMode:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)TPSAnalyticsEventContentViewed;
  uint64_t v18 = [(TPSAnalyticsEvent *)&v24 initWithDate:0];
  p_isa = (id *)&v18->super.super.isa;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_contentID, a3);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 6, a5);
    objc_storeStrong(p_isa + 7, a6);
    objc_storeStrong(p_isa + 8, a7);
    objc_storeStrong(p_isa + 9, a8);
  }

  return p_isa;
}

- (id)_initWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 widgetType:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TPSAnalyticsEventContentViewed;
  id v17 = [(TPSAnalyticsEvent *)&v21 initWithDate:0];
  p_isa = (id *)&v17->super.super.isa;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contentID, a3);
    objc_storeStrong(p_isa + 6, a5);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 7, a6);
    objc_storeStrong(p_isa + 10, a7);
  }

  return p_isa;
}

+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 widgetType:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = (void *)[objc_alloc((Class)a1) _initWithContentID:v16 collectionID:v15 correlationID:v14 clientConditionID:v13 widgetType:v12];

  return v17;
}

+ (id)eventWithContentID:(id)a3 collectionID:(id)a4 correlationID:(id)a5 clientConditionID:(id)a6 viewMethod:(id)a7 viewMode:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = (void *)[objc_alloc((Class)a1) _initWithContentID:v19 collectionID:v18 correlationID:v17 clientConditionID:v16 viewMethod:v15 viewMode:v14];

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventContentViewed;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_contentID, @"tip_ID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_collectionID forKey:@"collection_ID"];
  [v4 encodeObject:self->_correlationID forKey:@"tip_correlation_ID"];
  [v4 encodeObject:self->_clientConditionID forKey:@"client_condition"];
  [v4 encodeObject:self->_viewMethod forKey:@"view_src"];
  [v4 encodeObject:self->_viewMode forKey:@"mode"];
  [v4 encodeObject:_appReferrer forKey:@"referrer"];
}

- (BOOL)isWidget
{
  return [(NSString *)self->_viewMode isEqualToString:@"widget"];
}

- (id)eventName
{
  BOOL v2 = [(TPSAnalyticsEventContentViewed *)self isWidget];
  double v3 = @"content_viewed";
  if (v2) {
    double v3 = @"content_viewed_in_widget";
  }
  id v4 = [NSString stringWithFormat:@"%@.%@", @"com.apple.tips", v3];
  return v4;
}

- (void)log
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  _lastContentViewedRef = v3;
  v4.receiver = self;
  v4.super_class = (Class)TPSAnalyticsEventContentViewed;
  [(TPSAnalyticsEvent *)&v4 log];
}

+ (void)incrementSessionViewNumberForKey:(id)a3
{
  id v3 = a3;
  id v5 = +[TPSAnalyticsPersistenceController persistedObjectForKey:v3];
  objc_super v4 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v5, "intValue") + 1);
  +[TPSAnalyticsPersistenceController persistObject:v4 forKey:v3];
}

- (NSNumber)sessionViewNumber
{
  return (NSNumber *)+[TPSAnalyticsPersistenceController persistedObjectForKey:@"new_content_viewed"];
}

- (id)mutableAnalyticsEventRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_contentID forKeyedSubscript:@"tip_ID"];
  [v3 setObject:self->_collectionID forKeyedSubscript:@"collection_ID"];
  [v3 setObject:self->_correlationID forKeyedSubscript:@"tip_correlation_ID"];
  [v3 setObject:self->_clientConditionID forKeyedSubscript:@"client_condition"];
  objc_super v4 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v4 forKeyedSubscript:@"u65_flag"];

  if ([(TPSAnalyticsEventContentViewed *)self isWidget])
  {
    id v5 = @"widget_type";
    uint64_t v6 = &OBJC_IVAR___TPSAnalyticsEventContentViewed__widgetType;
  }
  else
  {
    [v3 setObject:self->_viewMethod forKeyedSubscript:@"view_src"];
    id v5 = @"mode";
    uint64_t v6 = &OBJC_IVAR___TPSAnalyticsEventContentViewed__viewMode;
  }
  [v3 setObject:*(Class *)((char *)&self->super.super.isa + *v6) forKeyedSubscript:v5];
  if (_appReferrer) {
    [v3 setObject:_appReferrer forKeyedSubscript:@"referrer"];
  }
  return v3;
}

+ (void)setAppReferrer:(id)a3
{
}

- (NSString)contentID
{
  return self->_contentID;
}

- (void)setContentID:(id)a3
{
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
}

- (NSString)correlationID
{
  return self->_correlationID;
}

- (void)setCorrelationID:(id)a3
{
}

- (NSString)clientConditionID
{
  return self->_clientConditionID;
}

- (void)setClientConditionID:(id)a3
{
}

- (NSString)viewMethod
{
  return self->_viewMethod;
}

- (void)setViewMethod:(id)a3
{
}

- (NSString)viewMode
{
  return self->_viewMode;
}

- (void)setViewMode:(id)a3
{
}

- (NSString)widgetType
{
  return self->_widgetType;
}

- (void)setWidgetType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetType, 0);
  objc_storeStrong((id *)&self->_viewMode, 0);
  objc_storeStrong((id *)&self->_viewMethod, 0);
  objc_storeStrong((id *)&self->_clientConditionID, 0);
  objc_storeStrong((id *)&self->_correlationID, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
}

@end