@interface NCMutableNotificationRequest
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAlertOptions:(id)a3;
- (void)setCancelAction:(id)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setClearAction:(id)a3;
- (void)setCloseAction:(id)a3;
- (void)setCollapsedNotificationsCount:(unint64_t)a3;
- (void)setContent:(id)a3;
- (void)setContext:(id)a3;
- (void)setCriticalAlert:(BOOL)a3;
- (void)setDefaultAction:(id)a3;
- (void)setEventBehavior:(id)a3;
- (void)setFilterCriteria:(id)a3;
- (void)setHighestPrioritySubSectionIdentifier:(id)a3;
- (void)setInlineAction:(id)a3;
- (void)setIntentIdentifiers:(id)a3;
- (void)setInterruptionLevel:(unint64_t)a3;
- (void)setIsCollapsedNotification:(BOOL)a3;
- (void)setIsHighlight:(BOOL)a3;
- (void)setIsPresentedAsBanner:(BOOL)a3;
- (void)setIsRemoved:(BOOL)a3;
- (void)setNotificationIdentifier:(id)a3;
- (void)setOptions:(id)a3;
- (void)setParentSectionIdentifier:(id)a3;
- (void)setPeopleIdentifiers:(id)a3;
- (void)setPriorityStatus:(unint64_t)a3;
- (void)setRelevanceScore:(float)a3;
- (void)setRequestDestinations:(id)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setSettingsSections:(id)a3;
- (void)setSilenceAction:(id)a3;
- (void)setSound:(id)a3;
- (void)setSourceInfo:(id)a3;
- (void)setSubSectionIdentifiers:(id)a3;
- (void)setSummaryStatus:(unint64_t)a3;
- (void)setSupplementaryActions:(id)a3;
- (void)setThreadIdentifier:(id)a3;
- (void)setThreadIdentifierUnique:(BOOL)a3;
- (void)setTimestamp:(id)a3;
- (void)setUserNotification:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation NCMutableNotificationRequest

- (void)setSectionIdentifier:(id)a3
{
  self->super._sectionIdentifier = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setNotificationIdentifier:(id)a3
{
  self->super._notificationIdentifier = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setThreadIdentifier:(id)a3
{
  self->super._threadIdentifier = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setCategoryIdentifier:(id)a3
{
  self->super._categoryIdentifier = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setSubSectionIdentifiers:(id)a3
{
  self->super._subSectionIdentifiers = (NSSet *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setHighestPrioritySubSectionIdentifier:(id)a3
{
  self->super._highestPrioritySubSectionIdentifier = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setIntentIdentifiers:(id)a3
{
  self->super._intentIdentifiers = (NSArray *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setPeopleIdentifiers:(id)a3
{
  self->super._peopleIdentifiers = (NSArray *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setParentSectionIdentifier:(id)a3
{
  self->super._parentSectionIdentifier = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setThreadIdentifierUnique:(BOOL)a3
{
  self->super._threadIdentifierUnique = a3;
}

- (void)setEventBehavior:(id)a3
{
  self->super._eventBehavior = (DNDClientEventBehavior *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setIsHighlight:(BOOL)a3
{
  self->super._isHighlight = a3;
}

- (void)setTimestamp:(id)a3
{
}

- (void)setRequestDestinations:(id)a3
{
  self->super._requestDestinations = (NSSet *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setContent:(id)a3
{
}

- (void)setOptions:(id)a3
{
}

- (void)setAlertOptions:(id)a3
{
  self->super._alertOptions = (NCNotificationAlertOptions *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setContext:(id)a3
{
  self->super._context = (NSDictionary *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setSettingsSections:(id)a3
{
  self->super._settingsSections = (NSSet *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setSound:(id)a3
{
}

- (void)setCancelAction:(id)a3
{
}

- (void)setClearAction:(id)a3
{
}

- (void)setCloseAction:(id)a3
{
}

- (void)setDefaultAction:(id)a3
{
}

- (void)setSilenceAction:(id)a3
{
}

- (void)setInlineAction:(id)a3
{
}

- (void)setSupplementaryActions:(id)a3
{
  self->super._supplementaryActions = (NSDictionary *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setUserNotification:(id)a3
{
}

- (void)setIsCollapsedNotification:(BOOL)a3
{
  self->super._isCollapsedNotification = a3;
}

- (void)setCollapsedNotificationsCount:(unint64_t)a3
{
  self->super._collapsedNotificationsCount = a3;
}

- (void)setSourceInfo:(id)a3
{
  self->super._sourceInfo = (NSDictionary *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setCriticalAlert:(BOOL)a3
{
  self->super._criticalAlert = a3;
}

- (void)setInterruptionLevel:(unint64_t)a3
{
  self->super._interruptionLevel = a3;
}

- (void)setPriorityStatus:(unint64_t)a3
{
  self->super._priorityStatus = a3;
}

- (void)setSummaryStatus:(unint64_t)a3
{
  self->super._summaryStatus = a3;
}

- (void)setUuid:(id)a3
{
}

- (void)setRelevanceScore:(float)a3
{
  self->super._relevanceScore = a3;
}

- (void)setFilterCriteria:(id)a3
{
  self->super._filterCriteria = (NSString *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setIsPresentedAsBanner:(BOOL)a3
{
  self->super._isPresentedAsBanner = a3;
}

- (void)setIsRemoved:(BOOL)a3
{
  self->super._isRemoved = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [NCNotificationRequest alloc];

  return [(NCNotificationRequest *)v4 initWithNotificationRequest:self];
}

@end