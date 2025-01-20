@interface TPSAnalyticsEventLinkAction
+ (BOOL)supportsSecureCoding;
+ (id)eventWithTipID:(id)a3 actionName:(id)a4 actionDirection:(id)a5;
- (NSString)actionDirection;
- (NSString)actionName;
- (NSString)tipID;
- (TPSAnalyticsEventLinkAction)initWithCoder:(id)a3;
- (id)_initWithTipID:(id)a3 actionName:(id)a4 actionDirection:(id)a5;
- (id)eventName;
- (id)mutableAnalyticsEventRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setActionDirection:(id)a3;
- (void)setActionName:(id)a3;
- (void)setTipID:(id)a3;
@end

@implementation TPSAnalyticsEventLinkAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSAnalyticsEventLinkAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSAnalyticsEventLinkAction;
  v5 = [(TPSAnalyticsEvent *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tip_ID"];
    tipID = v5->_tipID;
    v5->_tipID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"link_action_name"];
    actionName = v5->_actionName;
    v5->_actionName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"link_action_direction"];
    actionDirection = v5->_actionDirection;
    v5->_actionDirection = (NSString *)v10;
  }
  return v5;
}

- (id)_initWithTipID:(id)a3 actionName:(id)a4 actionDirection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TPSAnalyticsEventLinkAction;
  v12 = [(TPSAnalyticsEvent *)&v15 initWithDate:0];
  p_isa = (id *)&v12->super.super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tipID, a3);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 6, a5);
  }

  return p_isa;
}

+ (id)eventWithTipID:(id)a3 actionName:(id)a4 actionDirection:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) _initWithTipID:v10 actionName:v9 actionDirection:v8];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TPSAnalyticsEventLinkAction;
  id v4 = a3;
  [(TPSAnalyticsEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tipID, @"tip_ID", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_actionName forKey:@"link_action_name"];
  [v4 encodeObject:self->_actionDirection forKey:@"link_action_direction"];
}

- (id)eventName
{
  return (id)[NSString stringWithFormat:@"%@.%@", @"com.apple.tips", @"link_action"];
}

- (id)mutableAnalyticsEventRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_tipID forKeyedSubscript:@"tip_ID"];
  [v3 setObject:self->_actionName forKeyedSubscript:@"link_action_name"];
  [v3 setObject:self->_actionDirection forKeyedSubscript:@"link_action_direction"];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", +[TPSCommonDefines isSeniorUser](TPSCommonDefines, "isSeniorUser"));
  [v3 setObject:v4 forKeyedSubscript:@"u65_flag"];

  return v3;
}

- (NSString)tipID
{
  return self->_tipID;
}

- (void)setTipID:(id)a3
{
}

- (NSString)actionName
{
  return self->_actionName;
}

- (void)setActionName:(id)a3
{
}

- (NSString)actionDirection
{
  return self->_actionDirection;
}

- (void)setActionDirection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionDirection, 0);
  objc_storeStrong((id *)&self->_actionName, 0);
  objc_storeStrong((id *)&self->_tipID, 0);
}

@end