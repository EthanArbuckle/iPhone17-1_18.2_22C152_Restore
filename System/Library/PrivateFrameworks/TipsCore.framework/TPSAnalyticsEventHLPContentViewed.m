@interface TPSAnalyticsEventHLPContentViewed
+ (BOOL)supportsSecureCoding;
+ (id)eventWithTopicID:(id)a3 topicTitle:(id)a4 source:(id)a5 interfaceStyle:(id)a6 fromTopicID:(id)a7 externalURLString:(id)a8;
- (NSString)externalURLString;
- (NSString)fromTopicID;
- (NSString)interfaceStyle;
- (NSString)source;
- (NSString)topicID;
- (NSString)topicTitle;
- (TPSAnalyticsEventHLPContentViewed)initWithCoder:(id)a3;
- (id)_initWithTopicID:(id)a3 topicTitle:(id)a4 source:(id)a5 interfaceStyle:(id)a6 fromTopicID:(id)a7 externalURLString:(id)a8;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TPSAnalyticsEventHLPContentViewed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventHLPContentViewed)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TPSAnalyticsEventHLPContentViewed;
  v5 = [(TPSAnalyticsEvent *)&v19 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topic_ID"];
    topicID = v5->_topicID;
    v5->_topicID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"topic_title"];
    topicTitle = v5->_topicTitle;
    v5->_topicTitle = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"view_src"];
    source = v5->_source;
    v5->_source = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mode"];
    interfaceStyle = v5->_interfaceStyle;
    v5->_interfaceStyle = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"from_topic_ID"];
    fromTopicID = v5->_fromTopicID;
    v5->_fromTopicID = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"external_link"];
    externalURLString = v5->_externalURLString;
    v5->_externalURLString = (NSString *)v16;
  }
  return v5;
}

- (id)_initWithTopicID:(id)a3 topicTitle:(id)a4 source:(id)a5 interfaceStyle:(id)a6 fromTopicID:(id)a7 externalURLString:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v28.receiver = self;
  v28.super_class = (Class)TPSAnalyticsEventHLPContentViewed;
  v17 = [(TPSAnalyticsEvent *)&v28 initWithDate:0];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_topicID, a3);
    objc_storeStrong((id *)&v18->_topicTitle, a4);
    objc_storeStrong((id *)&v18->_source, a5);
    objc_storeStrong((id *)&v18->_interfaceStyle, a6);
    objc_super v19 = [(TPSAnalyticsEventHLPContentViewed *)v18 fromTopicID];
    char v20 = [v19 isEqualToString:&stru_1EED877F8];

    if ((v20 & 1) == 0)
    {
      uint64_t v21 = [(TPSAnalyticsEventHLPContentViewed *)v18 fromTopicID];
      fromTopicID = v18->_fromTopicID;
      v18->_fromTopicID = (NSString *)v21;
    }
    v23 = [(TPSAnalyticsEventHLPContentViewed *)v18 externalURLString];
    char v24 = [v23 isEqualToString:&stru_1EED877F8];

    if ((v24 & 1) == 0)
    {
      uint64_t v25 = [(TPSAnalyticsEventHLPContentViewed *)v18 externalURLString];
      externalURLString = v18->_externalURLString;
      v18->_externalURLString = (NSString *)v25;
    }
  }

  return v18;
}

+ (id)eventWithTopicID:(id)a3 topicTitle:(id)a4 source:(id)a5 interfaceStyle:(id)a6 fromTopicID:(id)a7 externalURLString:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  char v20 = (void *)[objc_alloc((Class)a1) _initWithTopicID:v19 topicTitle:v18 source:v17 interfaceStyle:v16 fromTopicID:v15 externalURLString:v14];

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventHLPContentViewed;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_topicID, @"topic_ID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_topicTitle forKey:@"topic_title"];
  [v4 encodeObject:self->_source forKey:@"view_src"];
  [v4 encodeObject:self->_interfaceStyle forKey:@"mode"];
  [v4 encodeObject:self->_fromTopicID forKey:@"from_topic_ID"];
  [v4 encodeObject:self->_externalURLString forKey:@"external_link"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"HLPContentViewed"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(TPSAnalyticsEventHLPContentViewed *)self topicID];
  [v3 setObject:v4 forKeyedSubscript:@"topic_ID"];

  objc_super v5 = [(TPSAnalyticsEventHLPContentViewed *)self topicTitle];
  [v3 setObject:v5 forKeyedSubscript:@"topic_title"];

  uint64_t v6 = [(TPSAnalyticsEventHLPContentViewed *)self source];
  [v3 setObject:v6 forKeyedSubscript:@"view_src"];

  v7 = [(TPSAnalyticsEventHLPContentViewed *)self interfaceStyle];
  [v3 setObject:v7 forKeyedSubscript:@"mode"];

  uint64_t v8 = [(TPSAnalyticsEventHLPContentViewed *)self fromTopicID];
  [v3 setObject:v8 forKeyedSubscript:@"from_topic_ID"];

  v9 = [(TPSAnalyticsEventHLPContentViewed *)self externalURLString];
  [v3 setObject:v9 forKeyedSubscript:@"external_link"];

  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v10 forKeyedSubscript:@"u65_flag"];

  return v3;
}

- (NSString)topicID
{
  return self->_topicID;
}

- (NSString)topicTitle
{
  return self->_topicTitle;
}

- (NSString)source
{
  return self->_source;
}

- (NSString)interfaceStyle
{
  return self->_interfaceStyle;
}

- (NSString)externalURLString
{
  return self->_externalURLString;
}

- (NSString)fromTopicID
{
  return self->_fromTopicID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromTopicID, 0);
  objc_storeStrong((id *)&self->_externalURLString, 0);
  objc_storeStrong((id *)&self->_interfaceStyle, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_topicTitle, 0);
  objc_storeStrong((id *)&self->_topicID, 0);
}

@end