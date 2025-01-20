@interface NCNotificationSystemSettings
+ (id)stringForNotificationListDisplayStyleSetting:(int64_t)a3;
- (BOOL)areHighlightsEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isScheduledDeliveryEnabled;
- (BOOL)isScheduledDeliveryUninitialized;
- (BOOL)shouldScheduledDeliveryShowNextSummary;
- (NCNotificationSystemSettings)initWithNotificationSystemSettings:(id)a3;
- (NSArray)scheduledDeliveryTimes;
- (NSString)debugDescription;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)listDisplayStyleSetting;
- (unint64_t)hash;
@end

@implementation NCNotificationSystemSettings

- (NCNotificationSystemSettings)initWithNotificationSystemSettings:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationSystemSettings;
  v5 = [(NCNotificationSystemSettings *)&v10 init];
  if (v5)
  {
    v5->_scheduledDeliveryEnabled = [v4 isScheduledDeliveryEnabled];
    v5->_scheduledDeliveryUninitialized = [v4 isScheduledDeliveryUninitialized];
    v5->_scheduledDeliveryShowNextSummary = [v4 shouldScheduledDeliveryShowNextSummary];
    v6 = [v4 scheduledDeliveryTimes];
    uint64_t v7 = [v6 copy];
    scheduledDeliveryTimes = v5->_scheduledDeliveryTimes;
    v5->_scheduledDeliveryTimes = (NSArray *)v7;

    v5->_listDisplayStyleSetting = [v4 listDisplayStyleSetting];
    v5->_highlightsEnabled = [v4 areHighlightsEnabled];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_11;
  }
  int v7 = [(NCNotificationSystemSettings *)self isScheduledDeliveryEnabled];
  if (v7 != [v6 isScheduledDeliveryEnabled]) {
    goto LABEL_11;
  }
  int v8 = [(NCNotificationSystemSettings *)self isScheduledDeliveryUninitialized];
  if (v8 != [v6 isScheduledDeliveryUninitialized]) {
    goto LABEL_11;
  }
  int v9 = [(NCNotificationSystemSettings *)self shouldScheduledDeliveryShowNextSummary];
  if (v9 != [v6 shouldScheduledDeliveryShowNextSummary]) {
    goto LABEL_11;
  }
  objc_super v10 = [(NCNotificationSystemSettings *)self scheduledDeliveryTimes];
  v11 = [v6 scheduledDeliveryTimes];
  int v12 = [v10 isEqualToArray:v11];

  if (!v12) {
    goto LABEL_11;
  }
  int64_t v13 = [(NCNotificationSystemSettings *)self listDisplayStyleSetting];
  if (v13 == [v6 listDisplayStyleSetting])
  {
    BOOL v14 = [(NCNotificationSystemSettings *)self areHighlightsEnabled];
    int v15 = v14 ^ [v6 areHighlightsEnabled] ^ 1;
  }
  else
  {
LABEL_11:
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_scheduledDeliveryUninitialized
     + (unint64_t)self->_scheduledDeliveryEnabled
     + self->_scheduledDeliveryShowNextSummary;
  return [(NSArray *)self->_scheduledDeliveryTimes hash]
       + self->_listDisplayStyleSetting
       + v2
       + self->_highlightsEnabled;
}

- (NSString)debugDescription
{
  return (NSString *)[(NCNotificationSystemSettings *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [NCNotificationMutableSystemSettings alloc];

  return [(NCNotificationSystemSettings *)v4 initWithNotificationSystemSettings:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(NCNotificationSystemSettings *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = (void *)MEMORY[0x263F29C40];
  id v5 = a3;
  id v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__NCNotificationSystemSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_264559E60;
  id v7 = v6;
  id v11 = v7;
  int v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

id __70__NCNotificationSystemSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isScheduledDeliveryEnabled"), @"scheduledDeliveryEnabled");
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isScheduledDeliveryUninitialized"), @"scheduledDeliveryUninitialized");
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "shouldScheduledDeliveryShowNextSummary"), @"scheduledDeliveryShowNextSummary");
  id v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) scheduledDeliveryTimes];
  id v7 = (id)[v5 appendObject:v6 withName:@"scheduledDeliveryTimes" skipIfNil:1];

  id v8 = *(void **)(a1 + 32);
  int v9 = +[NCNotificationSystemSettings stringForNotificationListDisplayStyleSetting:*(void *)(*(void *)(a1 + 40) + 24)];
  [v8 appendString:v9 withName:@"listDisplayStyle"];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "areHighlightsEnabled"), @"highlightsEnabled");
}

- (id)succinctDescription
{
  id v2 = [(NCNotificationSystemSettings *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[NCNotificationSystemSettings isScheduledDeliveryEnabled](self, "isScheduledDeliveryEnabled"), @"scheduledDeliveryEnabled");
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[NCNotificationSystemSettings isScheduledDeliveryUninitialized](self, "isScheduledDeliveryUninitialized"), @"scheduledDeliveryUninitialized");
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[NCNotificationSystemSettings shouldScheduledDeliveryShowNextSummary](self, "shouldScheduledDeliveryShowNextSummary"), @"scheduledDeliveryShowNextSummary");
  id v7 = [(NCNotificationSystemSettings *)self scheduledDeliveryTimes];
  id v8 = (id)[v3 appendObject:v7 withName:@"scheduledDeliveryTimes" skipIfNil:1];

  int v9 = +[NCNotificationSystemSettings stringForNotificationListDisplayStyleSetting:self->_listDisplayStyleSetting];
  [v3 appendString:v9 withName:@"listDisplayStyle"];

  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[NCNotificationSystemSettings areHighlightsEnabled](self, "areHighlightsEnabled"), @"highlightsEnabled");

  return v3;
}

+ (id)stringForNotificationListDisplayStyleSetting:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return @"<unknown>";
  }
  else {
    return off_264559E80[a3];
  }
}

- (BOOL)isScheduledDeliveryEnabled
{
  return self->_scheduledDeliveryEnabled;
}

- (BOOL)isScheduledDeliveryUninitialized
{
  return self->_scheduledDeliveryUninitialized;
}

- (BOOL)shouldScheduledDeliveryShowNextSummary
{
  return self->_scheduledDeliveryShowNextSummary;
}

- (NSArray)scheduledDeliveryTimes
{
  return self->_scheduledDeliveryTimes;
}

- (int64_t)listDisplayStyleSetting
{
  return self->_listDisplayStyleSetting;
}

- (BOOL)areHighlightsEnabled
{
  return self->_highlightsEnabled;
}

- (void).cxx_destruct
{
}

@end