@interface NCNotificationRequest
+ (NCNotificationRequest)notificationRequestWithActionWithId:(id)a3 runner:(id)a4;
+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3;
+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 lockScreenPriority:(unint64_t)a4;
+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 lockScreenPriority:(unint64_t)a4 lockScreenPersistence:(unint64_t)a5;
+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 requestDestinations:(id)a4;
+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 requestDestinations:(id)a4 alertOptionsSuppression:(unint64_t)a5;
+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 requestDestinations:(id)a4 isCritical:(BOOL)a5;
+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 requestDestinations:(id)a4 lockScreenPersistence:(unint64_t)a5;
+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 requestDestinations:(id)a4 lockScreenPersistence:(unint64_t)a5 alertOptionsSuppression:(unint64_t)a6;
+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 sectionId:(id)a4 threadId:(id)a5;
+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 threadId:(id)a4;
+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 threadId:(id)a4 timestamp:(id)a5;
+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 timestamp:(id)a4;
+ (NCNotificationRequest)notificationRequestWithRequestDestination:(id)a3;
+ (NCNotificationRequest)notificationRequestWithRequestDestinations:(id)a3;
+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3;
+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4;
+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 requestDestination:(id)a5;
+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 subSectionIds:(id)a5 requestDestinations:(id)a6;
+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 subSectionIds:(id)a6 title:(id)a7 message:(id)a8 timestamp:(id)a9 destinations:(id)a10 options:(id)a11;
+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 subSectionIds:(id)a6 title:(id)a7 message:(id)a8 timestamp:(id)a9 destinations:(id)a10 options:(id)a11 alertOptions:(id)a12 uuid:(id)a13;
+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 subSectionIds:(id)a6 title:(id)a7 message:(id)a8 timestamp:(id)a9 destinations:(id)a10 options:(id)a11 uuid:(id)a12;
+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 timestamp:(id)a6;
+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 title:(id)a6 message:(id)a7 timestamp:(id)a8 destination:(id)a9;
+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 title:(id)a6 message:(id)a7 timestamp:(id)a8 destination:(id)a9 uuid:(id)a10;
+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 title:(id)a6 message:(id)a7 timestamp:(id)a8 destinations:(id)a9;
+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 timestamp:(id)a5;
+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 subSectionIds:(id)a4;
+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 threadId:(id)a4;
+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 threadId:(id)a4 notificationId:(id)a5 requestDestination:(id)a6;
+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 threadId:(id)a4 notificationId:(id)a5 requestDestinations:(id)a6;
+ (NCNotificationRequest)notificationRequestWithThreadId:(id)a3;
+ (NCNotificationRequest)notificationRequestWithThreadId:(id)a3 timestamp:(id)a4;
+ (NCNotificationRequest)notificationRequestWithTimestamp:(id)a3;
+ (id)notificationRequest;
- (BOOL)isCollapsedNotification;
- (BOOL)isCollapsibleWithNotificationRequest:(id)a3;
- (BOOL)isCriticalAlert;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighlight;
- (BOOL)isPresentedAsBanner;
- (BOOL)isRemoved;
- (BOOL)isUniqueThreadIdentifier;
- (BOOL)matchesRequest:(id)a3;
- (BOOL)matchesThreadForRequest:(id)a3;
- (DNDClientEventBehavior)eventBehavior;
- (NCNotificationAction)cancelAction;
- (NCNotificationAction)clearAction;
- (NCNotificationAction)closeAction;
- (NCNotificationAction)defaultAction;
- (NCNotificationAction)inlineAction;
- (NCNotificationAction)silenceAction;
- (NCNotificationAlertOptions)alertOptions;
- (NCNotificationContent)content;
- (NCNotificationOptions)options;
- (NCNotificationRequest)initWithNotificationRequest:(id)a3;
- (NCNotificationSound)sound;
- (NSArray)intentIdentifiers;
- (NSArray)peopleIdentifiers;
- (NSDate)timestamp;
- (NSDictionary)context;
- (NSDictionary)sourceInfo;
- (NSDictionary)supplementaryActions;
- (NSSet)requestDestinations;
- (NSSet)settingsSections;
- (NSSet)subSectionIdentifiers;
- (NSString)categoryIdentifier;
- (NSString)debugDescription;
- (NSString)filterCriteria;
- (NSString)highestPrioritySubSectionIdentifier;
- (NSString)notificationIdentifier;
- (NSString)parentSectionIdentifier;
- (NSString)sectionIdentifier;
- (NSString)threadIdentifier;
- (NSString)topLevelSectionIdentifier;
- (NSString)uniqueThreadIdentifier;
- (NSUUID)uuid;
- (UNNotification)userNotification;
- (float)relevanceScore;
- (id)_actionsDescriptionForEnvironment:(id)a3;
- (id)_actionsLoggingDescription;
- (id)_interruptionLevelLoggingDescription;
- (id)_priorityStatusLoggingDescription;
- (id)_summaryStatusLoggingDescription;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)loggingDescription;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)collapsedNotificationsCount;
- (unint64_t)hash;
- (unint64_t)interruptionLevel;
- (unint64_t)priorityStatus;
- (unint64_t)summaryStatus;
- (void)setIsPresentedAsBanner:(BOOL)a3;
- (void)setIsRemoved:(BOOL)a3;
@end

@implementation NCNotificationRequest

- (BOOL)isCollapsibleWithNotificationRequest:(id)a3
{
  id v4 = a3;
  v5 = [(NCNotificationRequest *)self sectionIdentifier];
  v6 = [v4 sectionIdentifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (NCNotificationRequest)initWithNotificationRequest:(id)a3
{
  id v4 = a3;
  v5 = [(NCNotificationRequest *)self init];
  if (v5)
  {
    v6 = [v4 sectionIdentifier];
    uint64_t v7 = [v6 copy];
    sectionIdentifier = v5->_sectionIdentifier;
    v5->_sectionIdentifier = (NSString *)v7;

    v9 = [v4 notificationIdentifier];
    uint64_t v10 = [v9 copy];
    notificationIdentifier = v5->_notificationIdentifier;
    v5->_notificationIdentifier = (NSString *)v10;

    v12 = [v4 threadIdentifier];
    uint64_t v13 = [v12 copy];
    threadIdentifier = v5->_threadIdentifier;
    v5->_threadIdentifier = (NSString *)v13;

    v15 = [v4 categoryIdentifier];
    uint64_t v16 = [v15 copy];
    categoryIdentifier = v5->_categoryIdentifier;
    v5->_categoryIdentifier = (NSString *)v16;

    v18 = [v4 subSectionIdentifiers];
    uint64_t v19 = [v18 copy];
    subSectionIdentifiers = v5->_subSectionIdentifiers;
    v5->_subSectionIdentifiers = (NSSet *)v19;

    v21 = [v4 highestPrioritySubSectionIdentifier];
    uint64_t v22 = [v21 copy];
    highestPrioritySubSectionIdentifier = v5->_highestPrioritySubSectionIdentifier;
    v5->_highestPrioritySubSectionIdentifier = (NSString *)v22;

    v24 = [v4 intentIdentifiers];
    uint64_t v25 = [v24 copy];
    intentIdentifiers = v5->_intentIdentifiers;
    v5->_intentIdentifiers = (NSArray *)v25;

    v27 = [v4 peopleIdentifiers];
    uint64_t v28 = [v27 copy];
    peopleIdentifiers = v5->_peopleIdentifiers;
    v5->_peopleIdentifiers = (NSArray *)v28;

    v30 = [v4 parentSectionIdentifier];
    uint64_t v31 = [v30 copy];
    parentSectionIdentifier = v5->_parentSectionIdentifier;
    v5->_parentSectionIdentifier = (NSString *)v31;

    v5->_threadIdentifierUnique = [v4 isUniqueThreadIdentifier];
    v33 = [v4 eventBehavior];
    uint64_t v34 = [v33 copy];
    eventBehavior = v5->_eventBehavior;
    v5->_eventBehavior = (DNDClientEventBehavior *)v34;

    v5->_isHighlight = [v4 isHighlight];
    v36 = [v4 timestamp];
    uint64_t v37 = [v36 copy];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v37;

    v39 = [v4 requestDestinations];
    uint64_t v40 = [v39 copy];
    requestDestinations = v5->_requestDestinations;
    v5->_requestDestinations = (NSSet *)v40;

    v42 = [v4 content];
    uint64_t v43 = [v42 copy];
    content = v5->_content;
    v5->_content = (NCNotificationContent *)v43;

    v45 = [v4 options];
    uint64_t v46 = [v45 copy];
    options = v5->_options;
    v5->_options = (NCNotificationOptions *)v46;

    v48 = [v4 alertOptions];
    uint64_t v49 = [v48 copy];
    alertOptions = v5->_alertOptions;
    v5->_alertOptions = (NCNotificationAlertOptions *)v49;

    v51 = [v4 context];
    uint64_t v52 = [v51 copy];
    context = v5->_context;
    v5->_context = (NSDictionary *)v52;

    v54 = [v4 settingsSections];
    uint64_t v55 = [v54 copy];
    settingsSections = v5->_settingsSections;
    v5->_settingsSections = (NSSet *)v55;

    v57 = [v4 sound];
    uint64_t v58 = [v57 copy];
    sound = v5->_sound;
    v5->_sound = (NCNotificationSound *)v58;

    uint64_t v60 = [v4 cancelAction];
    cancelAction = v5->_cancelAction;
    v5->_cancelAction = (NCNotificationAction *)v60;

    uint64_t v62 = [v4 clearAction];
    clearAction = v5->_clearAction;
    v5->_clearAction = (NCNotificationAction *)v62;

    uint64_t v64 = [v4 closeAction];
    closeAction = v5->_closeAction;
    v5->_closeAction = (NCNotificationAction *)v64;

    uint64_t v66 = [v4 defaultAction];
    defaultAction = v5->_defaultAction;
    v5->_defaultAction = (NCNotificationAction *)v66;

    uint64_t v68 = [v4 silenceAction];
    silenceAction = v5->_silenceAction;
    v5->_silenceAction = (NCNotificationAction *)v68;

    uint64_t v70 = [v4 inlineAction];
    inlineAction = v5->_inlineAction;
    v5->_inlineAction = (NCNotificationAction *)v70;

    v72 = [v4 supplementaryActions];
    uint64_t v73 = [v72 copy];
    supplementaryActions = v5->_supplementaryActions;
    v5->_supplementaryActions = (NSDictionary *)v73;

    uint64_t v75 = [v4 userNotification];
    userNotification = v5->_userNotification;
    v5->_userNotification = (UNNotification *)v75;

    v5->_isCollapsedNotification = [v4 isCollapsedNotification];
    v5->_collapsedNotificationsCount = [v4 collapsedNotificationsCount];
    v77 = [v4 sourceInfo];
    uint64_t v78 = [v77 copy];
    sourceInfo = v5->_sourceInfo;
    v5->_sourceInfo = (NSDictionary *)v78;

    v5->_criticalAlert = [v4 isCriticalAlert];
    v5->_interruptionLevel = [v4 interruptionLevel];
    v5->_priorityStatus = [v4 priorityStatus];
    v5->_summaryStatus = [v4 summaryStatus];
    uint64_t v80 = [v4 uuid];
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v80;

    [v4 relevanceScore];
    v5->_relevanceScore = v82;
    uint64_t v83 = [v4 filterCriteria];
    filterCriteria = v5->_filterCriteria;
    v5->_filterCriteria = (NSString *)v83;

    v5->_isPresentedAsBanner = [v4 isPresentedAsBanner];
    v5->_isRemoved = [v4 isRemoved];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = 0;
LABEL_31:
      char v66 = 0;
      goto LABEL_32;
    }
  }
  id v5 = v4;
  if (!v5) {
    goto LABEL_31;
  }
  v6 = [(NCNotificationRequest *)self sectionIdentifier];
  uint64_t v7 = [v5 sectionIdentifier];
  int v8 = NCIsEqual(v6, v7);

  if (!v8) {
    goto LABEL_31;
  }
  v9 = [(NCNotificationRequest *)self notificationIdentifier];
  uint64_t v10 = [v5 notificationIdentifier];
  int v11 = NCIsEqual(v9, v10);

  if (!v11) {
    goto LABEL_31;
  }
  v12 = [(NCNotificationRequest *)self threadIdentifier];
  uint64_t v13 = [v5 threadIdentifier];
  int v14 = NCIsEqual(v12, v13);

  if (!v14) {
    goto LABEL_31;
  }
  v15 = [(NCNotificationRequest *)self categoryIdentifier];
  uint64_t v16 = [v5 categoryIdentifier];
  int v17 = NCIsEqual(v15, v16);

  if (!v17) {
    goto LABEL_31;
  }
  v18 = [(NCNotificationRequest *)self subSectionIdentifiers];
  uint64_t v19 = [v5 subSectionIdentifiers];
  int v20 = NCIsEqualToSet(v18, v19);

  if (!v20) {
    goto LABEL_31;
  }
  v21 = [(NCNotificationRequest *)self highestPrioritySubSectionIdentifier];
  uint64_t v22 = [v5 highestPrioritySubSectionIdentifier];
  int v23 = NCIsEqual(v21, v22);

  if (!v23) {
    goto LABEL_31;
  }
  v24 = [(NCNotificationRequest *)self intentIdentifiers];
  uint64_t v25 = [v5 intentIdentifiers];
  int v26 = NCIsEqualToArray(v24, v25);

  if (!v26) {
    goto LABEL_31;
  }
  v27 = [(NCNotificationRequest *)self peopleIdentifiers];
  uint64_t v28 = [v5 peopleIdentifiers];
  int v29 = NCIsEqualToArray(v27, v28);

  if (!v29) {
    goto LABEL_31;
  }
  v30 = [(NCNotificationRequest *)self parentSectionIdentifier];
  uint64_t v31 = [v5 parentSectionIdentifier];
  int v32 = NCIsEqual(v30, v31);

  if (!v32) {
    goto LABEL_31;
  }
  int v33 = [(NCNotificationRequest *)self isUniqueThreadIdentifier];
  if (v33 != [v5 isUniqueThreadIdentifier]) {
    goto LABEL_31;
  }
  uint64_t v34 = [(NCNotificationRequest *)self eventBehavior];
  v35 = [v5 eventBehavior];

  if (v34 != v35) {
    goto LABEL_31;
  }
  int v36 = [(NCNotificationRequest *)self isHighlight];
  if (v36 != [v5 isHighlight]) {
    goto LABEL_31;
  }
  uint64_t v37 = [(NCNotificationRequest *)self timestamp];
  v38 = [v5 timestamp];
  int v39 = NCIsEqual(v37, v38);

  if (!v39) {
    goto LABEL_31;
  }
  uint64_t v40 = [(NCNotificationRequest *)self content];
  v41 = [v5 content];
  int v42 = NCIsEqual(v40, v41);

  if (!v42) {
    goto LABEL_31;
  }
  uint64_t v43 = [(NCNotificationRequest *)self context];
  v44 = [v5 context];
  int v45 = NCIsEqual(v43, v44);

  if (!v45) {
    goto LABEL_31;
  }
  uint64_t v46 = [(NCNotificationRequest *)self settingsSections];
  v47 = [v5 settingsSections];
  int v48 = NCIsEqual(v46, v47);

  if (!v48) {
    goto LABEL_31;
  }
  uint64_t v49 = [(NCNotificationRequest *)self sound];
  v50 = [v5 sound];
  int v51 = NCIsEqual(v49, v50);

  if (!v51) {
    goto LABEL_31;
  }
  int v52 = [(NCNotificationRequest *)self isCollapsedNotification];
  if (v52 != [v5 isCollapsedNotification]) {
    goto LABEL_31;
  }
  unint64_t v53 = [(NCNotificationRequest *)self collapsedNotificationsCount];
  if (v53 != [v5 collapsedNotificationsCount]) {
    goto LABEL_31;
  }
  int v54 = [(NCNotificationRequest *)self isCriticalAlert];
  if (v54 != [v5 isCriticalAlert]) {
    goto LABEL_31;
  }
  unint64_t v55 = [(NCNotificationRequest *)self interruptionLevel];
  if (v55 != [v5 interruptionLevel]) {
    goto LABEL_31;
  }
  unint64_t v56 = [(NCNotificationRequest *)self priorityStatus];
  if (v56 != [v5 priorityStatus]) {
    goto LABEL_31;
  }
  unint64_t v57 = [(NCNotificationRequest *)self summaryStatus];
  if (v57 != [v5 summaryStatus]) {
    goto LABEL_31;
  }
  uint64_t v58 = [(NCNotificationRequest *)self uuid];
  v59 = [v5 uuid];
  int v60 = NCIsEqual(v58, v59);

  if (!v60) {
    goto LABEL_31;
  }
  [(NCNotificationRequest *)self relevanceScore];
  float v62 = v61;
  [v5 relevanceScore];
  if (v62 != v63) {
    goto LABEL_31;
  }
  uint64_t v64 = [(NCNotificationRequest *)self filterCriteria];
  v65 = [v5 filterCriteria];
  char v66 = NCIsEqual(v64, v65);

LABEL_32:
  return v66;
}

- (BOOL)matchesRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationRequest *)self notificationIdentifier];
  v6 = [v4 notificationIdentifier];
  if (NCIsEqual(v5, v6))
  {
    uint64_t v7 = [(NCNotificationRequest *)self threadIdentifier];
    int v8 = [v4 threadIdentifier];
    if (NCIsEqual(v7, v8))
    {
      v9 = [(NCNotificationRequest *)self sectionIdentifier];
      uint64_t v10 = [v4 sectionIdentifier];
      char v11 = NCIsEqual(v9, v10);
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)matchesThreadForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(NCNotificationRequest *)self threadIdentifier];
  v6 = [v4 threadIdentifier];
  if (NCIsEqual(v5, v6))
  {
    uint64_t v7 = [(NCNotificationRequest *)self sectionIdentifier];
    int v8 = [v4 sectionIdentifier];
    char v9 = NCIsEqual(v7, v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSString)topLevelSectionIdentifier
{
  v3 = [(NCNotificationRequest *)self parentSectionIdentifier];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(NCNotificationRequest *)self sectionIdentifier];
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)uniqueThreadIdentifier
{
  if ([(NCNotificationRequest *)self isUniqueThreadIdentifier])
  {
    v3 = [(NCNotificationRequest *)self threadIdentifier];
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sectionIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_notificationIdentifier hash] + v3;
  NSUInteger v5 = [(NSString *)self->_threadIdentifier hash];
  NSUInteger v6 = v4 + v5 + [(NSString *)self->_categoryIdentifier hash];
  uint64_t v7 = [(NSSet *)self->_subSectionIdentifiers hash];
  NSUInteger v8 = v7 + [(NSString *)self->_highestPrioritySubSectionIdentifier hash];
  NSUInteger v9 = v6 + v8 + [(NSArray *)self->_intentIdentifiers hash];
  uint64_t v10 = [(NSArray *)self->_peopleIdentifiers hash];
  NSUInteger v11 = v10 + [(NSString *)self->_parentSectionIdentifier hash];
  NSUInteger v12 = v11 + [(NSDate *)self->_timestamp hash];
  NSUInteger v13 = v9 + v12 + [(NCNotificationContent *)self->_content hash];
  uint64_t v14 = [(NSDictionary *)self->_context hash];
  uint64_t v15 = v14 + [(NSSet *)self->_settingsSections hash];
  uint64_t v16 = v13 + v15 + [(NCNotificationSound *)self->_sound hash] + self->_interruptionLevel + self->_priorityStatus;
  unint64_t summaryStatus = self->_summaryStatus;
  unint64_t v18 = summaryStatus + [(NSUUID *)self->_uuid hash];
  *(float *)&double v19 = self->_relevanceScore;
  int v20 = [NSNumber numberWithFloat:v19];
  unint64_t v21 = v18 + [v20 hash];
  NSUInteger v22 = v21 + [(NSString *)self->_filterCriteria hash];
  unint64_t v23 = v16 + v22 + [(DNDClientEventBehavior *)self->_eventBehavior hash] + self->_isHighlight;

  return v23;
}

- (NSString)debugDescription
{
  return (NSString *)[(NCNotificationRequest *)self descriptionWithMultilinePrefix:0];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  NSUInteger v4 = [NCMutableNotificationRequest alloc];

  return [(NCNotificationRequest *)v4 initWithNotificationRequest:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  NSUInteger v3 = [(NCNotificationRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  NSUInteger v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  NSUInteger v4 = (void *)MEMORY[0x263F29C40];
  id v5 = a3;
  NSUInteger v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__NCNotificationRequest_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_264559E60;
  id v7 = v6;
  id v11 = v7;
  NSUInteger v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

id __63__NCNotificationRequest_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  NSUInteger v3 = [*(id *)(a1 + 40) sectionIdentifier];
  id v4 = (id)[v2 appendObject:v3 withName:@"sectionId"];

  id v5 = *(void **)(a1 + 32);
  NSUInteger v6 = [*(id *)(a1 + 40) threadIdentifier];
  id v7 = (id)[v5 appendObject:v6 withName:@"threadId"];

  id v8 = *(void **)(a1 + 32);
  NSUInteger v9 = [*(id *)(a1 + 40) notificationIdentifier];
  id v10 = (id)[v8 appendObject:v9 withName:@"notificationId"];

  id v11 = *(void **)(a1 + 32);
  NSUInteger v12 = [*(id *)(a1 + 40) categoryIdentifier];
  id v13 = (id)[v11 appendObject:v12 withName:@"categoryId"];

  uint64_t v14 = *(void **)(a1 + 32);
  uint64_t v15 = [*(id *)(a1 + 40) subSectionIdentifiers];
  uint64_t v16 = [v15 allObjects];
  [v14 appendArraySection:v16 withName:@"subSectionIds" skipIfEmpty:1];

  int v17 = *(void **)(a1 + 32);
  unint64_t v18 = [*(id *)(a1 + 40) highestPrioritySubSectionIdentifier];
  id v19 = (id)[v17 appendObject:v18 withName:@"highestPrioritySubSectionId"];

  int v20 = *(void **)(a1 + 32);
  unint64_t v21 = [*(id *)(a1 + 40) intentIdentifiers];
  [v20 appendArraySection:v21 withName:@"intentIds" skipIfEmpty:1];

  NSUInteger v22 = *(void **)(a1 + 32);
  unint64_t v23 = [*(id *)(a1 + 40) peopleIdentifiers];
  [v22 appendArraySection:v23 withName:@"peopleIds" skipIfEmpty:1];

  v24 = *(void **)(a1 + 32);
  uint64_t v25 = [*(id *)(a1 + 40) parentSectionIdentifier];
  id v26 = (id)[v24 appendObject:v25 withName:@"parentSectionId" skipIfNil:1];

  id v27 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isUniqueThreadIdentifier"), @"isUniqueThreadIdentifier");
  uint64_t v28 = *(void **)(a1 + 32);
  int v29 = [*(id *)(a1 + 40) eventBehavior];
  id v30 = (id)[v28 appendObject:v29 withName:@"eventBehavior" skipIfNil:1];

  id v31 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isHighlight"), @"isHighlight");
  int v32 = *(void **)(a1 + 32);
  int v33 = [*(id *)(a1 + 40) timestamp];
  uint64_t v34 = [v33 description];
  id v35 = (id)[v32 appendObject:v34 withName:@"timestamp"];

  int v36 = *(void **)(a1 + 32);
  uint64_t v37 = [*(id *)(a1 + 40) requestDestinations];
  v38 = [v37 allObjects];
  [v36 appendArraySection:v38 withName:@"requestDestinations" skipIfEmpty:0];

  int v39 = *(void **)(a1 + 32);
  uint64_t v40 = [*(id *)(a1 + 40) content];
  id v41 = (id)[v39 appendObject:v40 withName:@"content"];

  int v42 = *(void **)(a1 + 32);
  uint64_t v43 = [*(id *)(a1 + 40) options];
  id v44 = (id)[v42 appendObject:v43 withName:@"options"];

  int v45 = *(void **)(a1 + 32);
  uint64_t v46 = [*(id *)(a1 + 40) alertOptions];
  id v47 = (id)[v45 appendObject:v46 withName:@"alertOptions"];

  int v48 = *(void **)(a1 + 32);
  uint64_t v49 = [*(id *)(a1 + 40) sound];
  id v50 = (id)[v48 appendObject:v49 withName:@"sound"];

  id v51 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isCollapsedNotification"), @"isCollapsedNotification");
  id v52 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "collapsedNotificationsCount"), @"collapsedNotificationsCount");
  unint64_t v53 = *(void **)(a1 + 32);
  int v54 = [*(id *)(a1 + 40) cancelAction];
  id v55 = (id)[v53 appendObject:v54 withName:@"cancelAction"];

  unint64_t v56 = *(void **)(a1 + 32);
  unint64_t v57 = [*(id *)(a1 + 40) clearAction];
  id v58 = (id)[v56 appendObject:v57 withName:@"clearAction"];

  v59 = *(void **)(a1 + 32);
  int v60 = [*(id *)(a1 + 40) closeAction];
  id v61 = (id)[v59 appendObject:v60 withName:@"closeAction"];

  float v62 = *(void **)(a1 + 32);
  float v63 = [*(id *)(a1 + 40) defaultAction];
  id v64 = (id)[v62 appendObject:v63 withName:@"defaultAction"];

  v65 = *(void **)(a1 + 32);
  char v66 = [*(id *)(a1 + 40) silenceAction];
  id v67 = (id)[v65 appendObject:v66 withName:@"silenceAction"];

  uint64_t v68 = *(void **)(a1 + 32);
  v69 = [*(id *)(a1 + 40) inlineAction];
  id v70 = (id)[v68 appendObject:v69 withName:@"inlineAction"];

  v71 = *(void **)(a1 + 32);
  v72 = [*(id *)(a1 + 40) supplementaryActions];
  [v71 appendDictionarySection:v72 withName:@"supplementaryActions" skipIfEmpty:0];

  id v73 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isCriticalAlert"), @"isCriticalAlert");
  id v74 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "interruptionLevel"), @"interruptionLevel");
  id v75 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "priorityStatus"), @"priorityStatus");
  id v76 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "summaryStatus"), @"summaryStatus");
  v77 = *(void **)(a1 + 32);
  uint64_t v78 = [*(id *)(a1 + 40) uuid];
  id v79 = (id)[v77 appendObject:v78 withName:@"uuid"];

  uint64_t v80 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) relevanceScore];
  id v82 = (id)[v80 appendFloat:@"relevanceScore" withName:v81];
  uint64_t v83 = *(void **)(a1 + 32);
  v84 = [*(id *)(a1 + 40) filterCriteria];
  id v85 = (id)[v83 appendObject:v84 withName:@"filterCriteria"];

  id v86 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isPresentedAsBanner"), @"isPresentedAsBanner");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isRemoved"), @"isRemoved");
}

- (id)succinctDescription
{
  v2 = [(NCNotificationRequest *)self succinctDescriptionBuilder];
  NSUInteger v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  NSUInteger v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(NCNotificationRequest *)self timestamp];
  id v5 = [v4 description];
  id v6 = (id)[v3 appendObject:v5 withName:@"timestamp"];

  id v7 = [(NCNotificationRequest *)self sectionIdentifier];
  id v8 = (id)[v3 appendObject:v7 withName:@"sectionId"];

  NSUInteger v9 = [(NCNotificationRequest *)self threadIdentifier];
  id v10 = (id)[v3 appendObject:v9 withName:@"threadId" skipIfNil:1];

  id v11 = [(NCNotificationRequest *)self notificationIdentifier];
  id v12 = (id)[v3 appendObject:v11 withName:@"notificationId"];

  id v13 = [(NCNotificationRequest *)self categoryIdentifier];
  id v14 = (id)[v3 appendObject:v13 withName:@"categoryId"];

  uint64_t v15 = [(NCNotificationRequest *)self uuid];
  id v16 = (id)[v3 appendObject:v15 withName:@"uuid"];

  return v3;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSString)notificationIdentifier
{
  return self->_notificationIdentifier;
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSSet)subSectionIdentifiers
{
  return self->_subSectionIdentifiers;
}

- (NSString)highestPrioritySubSectionIdentifier
{
  return self->_highestPrioritySubSectionIdentifier;
}

- (NSArray)intentIdentifiers
{
  return self->_intentIdentifiers;
}

- (NSArray)peopleIdentifiers
{
  return self->_peopleIdentifiers;
}

- (NSString)parentSectionIdentifier
{
  return self->_parentSectionIdentifier;
}

- (BOOL)isUniqueThreadIdentifier
{
  return self->_threadIdentifierUnique;
}

- (DNDClientEventBehavior)eventBehavior
{
  return self->_eventBehavior;
}

- (BOOL)isHighlight
{
  return self->_isHighlight;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSSet)requestDestinations
{
  return self->_requestDestinations;
}

- (NCNotificationContent)content
{
  return self->_content;
}

- (NCNotificationOptions)options
{
  return self->_options;
}

- (NCNotificationAlertOptions)alertOptions
{
  return self->_alertOptions;
}

- (NSDictionary)context
{
  return self->_context;
}

- (NSSet)settingsSections
{
  return self->_settingsSections;
}

- (NCNotificationSound)sound
{
  return self->_sound;
}

- (NCNotificationAction)cancelAction
{
  return self->_cancelAction;
}

- (NCNotificationAction)clearAction
{
  return self->_clearAction;
}

- (NCNotificationAction)closeAction
{
  return self->_closeAction;
}

- (NCNotificationAction)defaultAction
{
  return self->_defaultAction;
}

- (NCNotificationAction)silenceAction
{
  return self->_silenceAction;
}

- (NCNotificationAction)inlineAction
{
  return self->_inlineAction;
}

- (NSDictionary)supplementaryActions
{
  return self->_supplementaryActions;
}

- (UNNotification)userNotification
{
  return self->_userNotification;
}

- (BOOL)isCollapsedNotification
{
  return self->_isCollapsedNotification;
}

- (unint64_t)collapsedNotificationsCount
{
  return self->_collapsedNotificationsCount;
}

- (NSDictionary)sourceInfo
{
  return self->_sourceInfo;
}

- (BOOL)isCriticalAlert
{
  return self->_criticalAlert;
}

- (unint64_t)interruptionLevel
{
  return self->_interruptionLevel;
}

- (unint64_t)priorityStatus
{
  return self->_priorityStatus;
}

- (unint64_t)summaryStatus
{
  return self->_summaryStatus;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (float)relevanceScore
{
  return self->_relevanceScore;
}

- (NSString)filterCriteria
{
  return self->_filterCriteria;
}

- (BOOL)isPresentedAsBanner
{
  return self->_isPresentedAsBanner;
}

- (void)setIsPresentedAsBanner:(BOOL)a3
{
  self->_isPresentedAsBanner = a3;
}

- (BOOL)isRemoved
{
  return self->_isRemoved;
}

- (void)setIsRemoved:(BOOL)a3
{
  self->_isRemoved = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterCriteria, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sourceInfo, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
  objc_storeStrong((id *)&self->_supplementaryActions, 0);
  objc_storeStrong((id *)&self->_inlineAction, 0);
  objc_storeStrong((id *)&self->_silenceAction, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_closeAction, 0);
  objc_storeStrong((id *)&self->_clearAction, 0);
  objc_storeStrong((id *)&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_settingsSections, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_alertOptions, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_requestDestinations, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_eventBehavior, 0);
  objc_storeStrong((id *)&self->_parentSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_peopleIdentifiers, 0);
  objc_storeStrong((id *)&self->_intentIdentifiers, 0);
  objc_storeStrong((id *)&self->_highestPrioritySubSectionIdentifier, 0);
  objc_storeStrong((id *)&self->_subSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationIdentifier, 0);

  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 title:(id)a6 message:(id)a7 timestamp:(id)a8 destination:(id)a9
{
  uint64_t v15 = (void *)MEMORY[0x263EFFA08];
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  NSUInteger v22 = [v15 setWithObject:a9];
  unint64_t v23 = [a1 notificationRequestWithSectionId:v21 notificationId:v20 threadId:v19 title:v18 message:v17 timestamp:v16 destinations:v22];

  return (NCNotificationRequest *)v23;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 title:(id)a6 message:(id)a7 timestamp:(id)a8 destination:(id)a9 uuid:(id)a10
{
  id v16 = (void *)MEMORY[0x263EFFA08];
  id v28 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = [v16 set];
  uint64_t v25 = [MEMORY[0x263EFFA08] setWithObject:v17];

  id v26 = objc_opt_new();
  id v30 = [a1 notificationRequestWithSectionId:v23 notificationId:v22 threadId:v21 subSectionIds:v24 title:v20 message:v19 timestamp:v18 destinations:v25 options:v26 uuid:v28];

  return (NCNotificationRequest *)v30;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 title:(id)a6 message:(id)a7 timestamp:(id)a8 destinations:(id)a9
{
  id v16 = (void *)MEMORY[0x263EFFA08];
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  v24 = [v16 set];
  uint64_t v25 = objc_opt_new();
  id v26 = [a1 notificationRequestWithSectionId:v23 notificationId:v22 threadId:v21 subSectionIds:v24 title:v20 message:v19 timestamp:v18 destinations:v17 options:v25];

  return (NCNotificationRequest *)v26;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 subSectionIds:(id)a6 title:(id)a7 message:(id)a8 timestamp:(id)a9 destinations:(id)a10 options:(id)a11
{
  id v26 = (void *)MEMORY[0x263EFFA08];
  id v16 = a11;
  id v17 = a10;
  id v27 = a9;
  id v28 = a8;
  id v18 = a7;
  id v19 = a5;
  id v20 = a4;
  id v25 = a3;
  id v21 = [v26 set];
  id v22 = objc_opt_new();
  id v23 = objc_alloc_init(MEMORY[0x263F08C38]);
  id v30 = [a1 notificationRequestWithSectionId:v25 notificationId:v20 threadId:v19 subSectionIds:v21 title:v18 message:v28 timestamp:v27 destinations:v17 options:v16 alertOptions:v22 uuid:v23];

  return (NCNotificationRequest *)v30;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 subSectionIds:(id)a6 title:(id)a7 message:(id)a8 timestamp:(id)a9 destinations:(id)a10 options:(id)a11 uuid:(id)a12
{
  id v27 = (void *)MEMORY[0x263EFFA08];
  id v17 = a12;
  id v18 = a10;
  id v28 = a9;
  id v29 = a8;
  id v19 = a7;
  id v20 = a5;
  id v21 = a4;
  id v26 = a3;
  id v22 = [v27 set];
  id v23 = objc_opt_new();
  v24 = objc_opt_new();
  id v31 = [a1 notificationRequestWithSectionId:v26 notificationId:v21 threadId:v20 subSectionIds:v22 title:v19 message:v29 timestamp:v28 destinations:v18 options:v23 alertOptions:v24 uuid:v17];

  return (NCNotificationRequest *)v31;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 subSectionIds:(id)a6 title:(id)a7 message:(id)a8 timestamp:(id)a9 destinations:(id)a10 options:(id)a11 alertOptions:(id)a12 uuid:(id)a13
{
  id v34 = a13;
  id v33 = a12;
  id v32 = a11;
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  id v26 = objc_opt_new();
  [v26 setSectionIdentifier:v25];

  [v26 setNotificationIdentifier:v24];
  [v26 setThreadIdentifier:v23];

  [v26 setSubSectionIdentifiers:v22];
  [v26 setTimestamp:v19];
  [v26 setRequestDestinations:v18];

  id v27 = objc_opt_new();
  [v27 setTitle:v21];

  id v28 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v20];
  [v27 setAttributedMessage:v28];
  [v27 setDate:v19];

  [v26 setContent:v27];
  [v26 setOptions:v32];

  [v26 setAlertOptions:v33];
  [v26 setUuid:v34];

  id v29 = (void *)[v26 copy];

  return (NCNotificationRequest *)v29;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 threadId:(id)a5 timestamp:(id)a6
{
  return (NCNotificationRequest *)[a1 notificationRequestWithSectionId:a3 notificationId:a4 threadId:a5 title:@"title" message:@"message" timestamp:a6 destination:NCNotificationRequestTestingDestination];
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 threadId:(id)a4 notificationId:(id)a5 requestDestination:(id)a6
{
  id v10 = (void *)MEMORY[0x263EFF910];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v10 date];
  id v16 = [MEMORY[0x263EFFA08] setWithObject:v11];

  id v17 = [a1 notificationRequestWithSectionId:v14 notificationId:v12 threadId:v13 title:@"title" message:@"message" timestamp:v15 destinations:v16];

  return (NCNotificationRequest *)v17;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 threadId:(id)a4 notificationId:(id)a5 requestDestinations:(id)a6
{
  id v10 = (void *)MEMORY[0x263EFF910];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v10 date];
  id v16 = [a1 notificationRequestWithSectionId:v14 notificationId:v12 threadId:v13 title:@"title" message:@"message" timestamp:v15 destinations:v11];

  return (NCNotificationRequest *)v16;
}

+ (NCNotificationRequest)notificationRequestWithRequestDestination:(id)a3
{
  return (NCNotificationRequest *)[a1 notificationRequestWithSectionId:@"sectionId" notificationId:@"notificationId" requestDestination:a3];
}

+ (NCNotificationRequest)notificationRequestWithRequestDestinations:(id)a3
{
  return (NCNotificationRequest *)[a1 notificationRequestWithSectionId:@"sectionId" threadId:@"threadId" notificationId:@"notificationId" requestDestinations:a3];
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 requestDestination:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFFA08];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 setWithObject:a5];
  id v12 = [a1 notificationRequestWithSectionId:v10 threadId:@"threadId" notificationId:v9 requestDestinations:v11];

  return (NCNotificationRequest *)v12;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 timestamp:(id)a5
{
  return (NCNotificationRequest *)[a1 notificationRequestWithSectionId:a3 notificationId:a4 threadId:@"threadId" timestamp:a5];
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 date];
  id v10 = [a1 notificationRequestWithSectionId:v8 notificationId:v7 threadId:@"threadId" timestamp:v9];

  return (NCNotificationRequest *)v10;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 threadId:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 date];
  id v10 = [a1 notificationRequestWithSectionId:v8 notificationId:@"notificationId" threadId:v7 timestamp:v9];

  return (NCNotificationRequest *)v10;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3
{
  return (NCNotificationRequest *)[a1 notificationRequestWithSectionId:a3 notificationId:@"notificationId"];
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 timestamp:(id)a4
{
  return (NCNotificationRequest *)[a1 notificationRequestWithSectionId:@"sectionId" notificationId:a3 timestamp:a4];
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [v4 date];
  id v7 = [a1 notificationRequestWithSectionId:@"sectionId" notificationId:v5 timestamp:v6];

  return (NCNotificationRequest *)v7;
}

+ (NCNotificationRequest)notificationRequestWithThreadId:(id)a3 timestamp:(id)a4
{
  return (NCNotificationRequest *)[a1 notificationRequestWithSectionId:@"sectionId" notificationId:@"notificationId" threadId:a3 timestamp:a4];
}

+ (NCNotificationRequest)notificationRequestWithThreadId:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  id v6 = [v4 date];
  id v7 = [a1 notificationRequestWithThreadId:v5 timestamp:v6];

  return (NCNotificationRequest *)v7;
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 threadId:(id)a4 timestamp:(id)a5
{
  return (NCNotificationRequest *)[a1 notificationRequestWithSectionId:@"sectionId" notificationId:a3 threadId:a4 timestamp:a5];
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 sectionId:(id)a4 threadId:(id)a5
{
  id v8 = (void *)MEMORY[0x263EFF910];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 date];
  id v13 = [a1 notificationRequestWithSectionId:v10 notificationId:v11 threadId:v9 timestamp:v12];

  return (NCNotificationRequest *)v13;
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 threadId:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 date];
  id v10 = [a1 notificationRequestWithNotificationId:v8 threadId:v7 timestamp:v9];

  return (NCNotificationRequest *)v10;
}

+ (NCNotificationRequest)notificationRequestWithTimestamp:(id)a3
{
  return (NCNotificationRequest *)[a1 notificationRequestWithNotificationId:@"notificationId" timestamp:a3];
}

+ (id)notificationRequest
{
  NSUInteger v3 = [MEMORY[0x263EFF910] date];
  id v4 = [a1 notificationRequestWithTimestamp:v3];

  return v4;
}

+ (NCNotificationRequest)notificationRequestWithActionWithId:(id)a3 runner:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 notificationRequestWithNotificationId:@"action-notification"];
  id v9 = (void *)[v8 mutableCopy];

  id v10 = objc_alloc_init(NCMutableNotificationAction);
  [(NCMutableNotificationAction *)v10 setIdentifier:v7];

  [(NCMutableNotificationAction *)v10 setActionRunner:v6];
  [v9 setDefaultAction:v10];

  return (NCNotificationRequest *)v9;
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 lockScreenPriority:(unint64_t)a4
{
  return (NCNotificationRequest *)[a1 notificationRequestWithNotificationId:a3 lockScreenPriority:a4 lockScreenPersistence:0];
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 lockScreenPriority:(unint64_t)a4 lockScreenPersistence:(unint64_t)a5
{
  id v8 = a3;
  id v9 = objc_opt_new();
  [v9 setLockScreenPriority:a4];
  [v9 setLockScreenPersistence:a5];
  id v10 = [MEMORY[0x263EFFA08] set];
  id v11 = [MEMORY[0x263EFF910] date];
  id v12 = [MEMORY[0x263EFFA08] set];
  id v13 = [a1 notificationRequestWithSectionId:@"sectionId" notificationId:v8 threadId:@"threadId" subSectionIds:v10 title:@"title" message:@"message" timestamp:v11 destinations:v12 options:v9];

  return (NCNotificationRequest *)v13;
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 requestDestinations:(id)a4
{
  return (NCNotificationRequest *)[a1 notificationRequestWithNotificationId:a3 requestDestinations:a4 isCritical:0];
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 requestDestinations:(id)a4 isCritical:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_opt_new();
  [v10 setPreemptsPresentedNotification:v5];
  [v10 setRevealsAdditionalContentOnPresentation:v5];
  id v11 = [MEMORY[0x263EFFA08] set];
  id v12 = [MEMORY[0x263EFF910] date];
  id v13 = [a1 notificationRequestWithSectionId:@"sectionId" notificationId:v9 threadId:@"threadId" subSectionIds:v11 title:@"title" message:@"message" timestamp:v12 destinations:v8 options:v10];

  return (NCNotificationRequest *)v13;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 subSectionIds:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFFA08];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 set];
  id v10 = [a1 notificationRequestWithSectionId:v8 notificationId:@"notificationId" subSectionIds:v7 requestDestinations:v9];

  return (NCNotificationRequest *)v10;
}

+ (NCNotificationRequest)notificationRequestWithSectionId:(id)a3 notificationId:(id)a4 subSectionIds:(id)a5 requestDestinations:(id)a6
{
  id v10 = (void *)MEMORY[0x263EFF910];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v10 date];
  id v16 = objc_opt_new();
  id v17 = [a1 notificationRequestWithSectionId:v14 notificationId:v13 threadId:@"threadId" subSectionIds:v12 title:@"title" message:@"message" timestamp:v15 destinations:v11 options:v16];

  return (NCNotificationRequest *)v17;
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 requestDestinations:(id)a4 lockScreenPersistence:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_opt_new();
  [v10 setLockScreenPersistence:a5];
  id v11 = [MEMORY[0x263EFFA08] set];
  id v12 = [MEMORY[0x263EFF910] date];
  id v13 = [a1 notificationRequestWithSectionId:@"sectionId" notificationId:v9 threadId:@"threadId" subSectionIds:v11 title:@"title" message:@"message" timestamp:v12 destinations:v8 options:v10];

  return (NCNotificationRequest *)v13;
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 requestDestinations:(id)a4 alertOptionsSuppression:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(NCMutableNotificationAlertOptions);
  [(NCMutableNotificationAlertOptions *)v10 setSuppression:a5];
  id v11 = [MEMORY[0x263EFFA08] set];
  id v12 = [MEMORY[0x263EFF910] date];
  id v13 = objc_opt_new();
  id v14 = objc_alloc_init(MEMORY[0x263F08C38]);
  uint64_t v15 = [a1 notificationRequestWithSectionId:@"sectionId" notificationId:v9 threadId:@"threadId" subSectionIds:v11 title:@"title" message:@"message" timestamp:v12 destinations:v8 options:v13 alertOptions:v10 uuid:v14];

  return (NCNotificationRequest *)v15;
}

+ (NCNotificationRequest)notificationRequestWithNotificationId:(id)a3 requestDestinations:(id)a4 lockScreenPersistence:(unint64_t)a5 alertOptionsSuppression:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_opt_new();
  [v12 setLockScreenPersistence:a5];
  id v13 = objc_alloc_init(NCMutableNotificationAlertOptions);
  [(NCMutableNotificationAlertOptions *)v13 setSuppression:a6];
  id v14 = [MEMORY[0x263EFFA08] set];
  uint64_t v15 = [MEMORY[0x263EFF910] date];
  id v16 = objc_alloc_init(MEMORY[0x263F08C38]);
  id v17 = [a1 notificationRequestWithSectionId:@"sectionId" notificationId:v11 threadId:@"threadId" subSectionIds:v14 title:@"title" message:@"message" timestamp:v15 destinations:v10 options:v12 alertOptions:v13 uuid:v16];

  return (NCNotificationRequest *)v17;
}

- (id)loggingDescription
{
  id v16 = (id)NSString;
  id v19 = [(NCNotificationRequest *)self notificationIdentifier];
  id v20 = objc_msgSend(v19, "un_logDigest");
  NSUInteger v3 = [(NCNotificationRequest *)self sectionIdentifier];
  id v18 = [(NCNotificationRequest *)self threadIdentifier];
  id v4 = objc_msgSend(v18, "un_logDigest");
  BOOL v5 = [(NCNotificationRequest *)self categoryIdentifier];
  id v6 = [(NCNotificationRequest *)self timestamp];
  id v7 = [(NCNotificationRequest *)self _interruptionLevelLoggingDescription];
  id v8 = [(NCNotificationRequest *)self _priorityStatusLoggingDescription];
  id v9 = [(NCNotificationRequest *)self _summaryStatusLoggingDescription];
  [(NCNotificationRequest *)self relevanceScore];
  double v11 = v10;
  id v12 = [(NCNotificationRequest *)self filterCriteria];
  id v13 = [(NCNotificationRequest *)self _actionsLoggingDescription];
  id v14 = [(NCNotificationRequest *)self requestDestinations];
  objc_msgSend(v16, "stringWithFormat:", @"id: %@; section: %@; thread: %@; category: %@; timestamp: %@; interruption-level: %@; priorityStatus: %@; summaryStatus: %@; relevance-score: %.2f; filter-criteria: %@; actions: [ %@ ]; destinations: [ %@ ]",
    v20,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    *(void *)&v11,
    v12,
    v13,
    v14);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_interruptionLevelLoggingDescription
{
  unint64_t v2 = [(NCNotificationRequest *)self interruptionLevel];
  if (v2 - 1 > 2) {
    return @"passive";
  }
  else {
    return off_26455A128[v2 - 1];
  }
}

- (id)_priorityStatusLoggingDescription
{
  unint64_t v2 = [(NCNotificationRequest *)self priorityStatus];
  if (v2 - 1 > 4) {
    return @"unknown";
  }
  else {
    return off_26455A140[v2 - 1];
  }
}

- (id)_summaryStatusLoggingDescription
{
  unint64_t v2 = [(NCNotificationRequest *)self summaryStatus];
  if (v2 - 1 > 3) {
    return @"unknown";
  }
  else {
    return off_26455A168[v2 - 1];
  }
}

- (id)_actionsLoggingDescription
{
  NSUInteger v3 = objc_opt_new();
  id v4 = [(NCNotificationRequest *)self _actionsDescriptionForEnvironment:@"NCNotificationActionEnvironmentMinimal"];
  [v3 appendFormat:@"minimal: %@", v4];

  BOOL v5 = [(NCNotificationRequest *)self _actionsDescriptionForEnvironment:@"NCNotificationActionEnvironmentDefault"];
  [v3 appendFormat:@", default: %@", v5];

  id v6 = (void *)[v3 copy];

  return v6;
}

- (id)_actionsDescriptionForEnvironment:(id)a3
{
  NSUInteger v3 = [(NCNotificationRequest *)self supplementaryActions];
  id v4 = [v3 objectForKey:@"NCNotificationActionEnvironmentMinimal"];
  BOOL v5 = (void *)[v4 copy];

  id v6 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"behavior == %d", 1);
  id v7 = [v5 filteredArrayUsingPredicate:v6];

  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d (%d text)", objc_msgSend(v5, "count"), objc_msgSend(v7, "count"));

  return v8;
}

@end