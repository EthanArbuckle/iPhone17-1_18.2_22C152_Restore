@interface TPSMiniTipMetadata
+ (BOOL)supportsSecureCoding;
- (NSDictionary)userInfo;
- (NSError)error;
- (NSString)identifier;
- (TPSDocument)content;
- (TPSMiniTipMetadata)initWithCoder:(id)a3;
- (TPSMiniTipMetadata)initWithContent:(id)a3;
- (TPSMonitoringEvents)monitoringEvents;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)customizationID;
- (void)encodeWithCoder:(id)a3;
- (void)setContent:(id)a3;
- (void)setCustomizationID:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setMonitoringEvents:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation TPSMiniTipMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSMiniTipMetadata)initWithContent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSMiniTipMetadata;
  v6 = [(TPSMiniTipMetadata *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_content, a3);
    v7->_customizationID = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  objc_msgSend(v4, "setCustomizationID:", -[TPSMiniTipMetadata customizationID](self, "customizationID"));
  id v5 = [(TPSMiniTipMetadata *)self error];
  [v4 setError:v5];

  v6 = [(TPSMiniTipMetadata *)self userInfo];
  [v4 setUserInfo:v6];

  v7 = [(TPSMiniTipMetadata *)self content];
  [v4 setContent:v7];

  v8 = [(TPSMiniTipMetadata *)self monitoringEvents];
  [v4 setMonitoringEvents:v8];

  return v4;
}

- (TPSMiniTipMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TPSMiniTipMetadata;
  id v5 = [(TPSMiniTipMetadata *)&v16 init];
  if (v5)
  {
    v5->_customizationID = [v4 decodeIntegerForKey:@"customizationID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v6;

    v8 = +[TPSTipStatus _userInfoClasses];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"userInfo"];
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
    content = v5->_content;
    v5->_content = (TPSDocument *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"monitoringEvents"];
    monitoringEvents = v5->_monitoringEvents;
    v5->_monitoringEvents = (TPSMonitoringEvents *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSMiniTipMetadata customizationID](self, "customizationID"), @"customizationID");
  id v5 = [(TPSMiniTipMetadata *)self error];
  [v4 encodeObject:v5 forKey:@"error"];

  uint64_t v6 = [(TPSMiniTipMetadata *)self userInfo];
  [v4 encodeObject:v6 forKey:@"userInfo"];

  v7 = [(TPSMiniTipMetadata *)self content];
  [v4 encodeObject:v7 forKey:@"content"];

  id v8 = [(TPSMiniTipMetadata *)self monitoringEvents];
  [v4 encodeObject:v8 forKey:@"monitoringEvents"];
}

- (NSString)identifier
{
  v2 = [(TPSMiniTipMetadata *)self content];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)TPSMiniTipMetadata;
  id v4 = [(TPSMiniTipMetadata *)&v9 description];
  id v5 = (void *)[v3 initWithString:v4];

  uint64_t v6 = [(TPSMiniTipMetadata *)self content];
  v7 = [v6 identifier];
  [v5 appendFormat:@" %@ = %@\n", @"content", v7];

  return v5;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v15.receiver = self;
  v15.super_class = (Class)TPSMiniTipMetadata;
  id v4 = [(TPSMiniTipMetadata *)&v15 debugDescription];
  id v5 = (void *)[v3 initWithString:v4];

  uint64_t v6 = [(TPSMiniTipMetadata *)self error];

  if (v6)
  {
    v7 = [(TPSMiniTipMetadata *)self error];
    [v5 appendFormat:@"  %@ = %@\n", @"error", v7];
  }
  id v8 = [(TPSMiniTipMetadata *)self userInfo];

  if (v8)
  {
    objc_super v9 = [(TPSMiniTipMetadata *)self userInfo];
    [v5 appendFormat:@"  %@ = %@\n", @"userInfo", v9];
  }
  v10 = [(TPSMiniTipMetadata *)self content];

  if (v10)
  {
    uint64_t v11 = [(TPSMiniTipMetadata *)self content];
    [v5 appendFormat:@"\n  %@ = %@\n", @"content", v11];
  }
  v12 = [(TPSMiniTipMetadata *)self monitoringEvents];

  if (v12)
  {
    uint64_t v13 = [(TPSMiniTipMetadata *)self monitoringEvents];
    [v5 appendFormat:@"\n  %@ = %@\n", @"monitoringEvents", v13];
  }
  return v5;
}

- (int64_t)customizationID
{
  return self->_customizationID;
}

- (void)setCustomizationID:(int64_t)a3
{
  self->_customizationID = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (TPSDocument)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
}

- (TPSMonitoringEvents)monitoringEvents
{
  return self->_monitoringEvents;
}

- (void)setMonitoringEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoringEvents, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end