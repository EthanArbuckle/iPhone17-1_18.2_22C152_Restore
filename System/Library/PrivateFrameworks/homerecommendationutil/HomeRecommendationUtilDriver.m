@interface HomeRecommendationUtilDriver
- (BOOL)allowConvertToShortcut;
- (BOOL)allowDurationEditing;
- (BOOL)autoCommit;
- (BOOL)filtersEmptyActionSets;
- (BOOL)showActionSetsInstructions;
- (BOOL)showConditionTriggers;
- (BOOL)showTriggerDeleteButton;
- (BOOL)showTriggerEnableSwitch;
- (BOOL)showTriggerSummary;
- (HFAccessoryTypeGroup)typeGroup;
- (HFItem)suggestionItem;
- (HMAccessory)accessory;
- (HMHome)home;
- (HMHomeManager)homeManager;
- (HMService)service;
- (HRERecommendationEngine)recommendationEngine;
- (HRETemplate)template;
- (HomeRecommendationUtilDriver)initWithArgs:(id)a3 homeID:(id)a4 templateName:(id)a5 serviceID:(id)a6 accessoryID:(id)a7;
- (NAFuture)homeFuture;
- (NSNumber)extraOptions;
- (NSSet)unsupportedTriggers;
- (NSString)accessoryID;
- (NSString)actionEditorInstructionsDescription;
- (NSString)deleteConfirmationAlertMessage;
- (NSString)deleteConfirmationAlertTitle;
- (NSString)deleteInstructionDescription;
- (NSString)doneButtonTitle;
- (NSString)homeID;
- (NSString)recommendationID;
- (NSString)serviceActionsInstructionDescription;
- (NSString)serviceID;
- (NSString)templateName;
- (NSString)testActionsInstructionDescription;
- (NSString)triggerContextAwareTitle;
- (OS_dispatch_group)dispatchGroup;
- (id)commit:(id)a3;
- (id)loadRecommendations;
- (id)run;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)logError:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setAccessoryID:(id)a3;
- (void)setActionEditorInstructionsDescription:(id)a3;
- (void)setAllowConvertToShortcut:(BOOL)a3;
- (void)setAllowDurationEditing:(BOOL)a3;
- (void)setAutoCommit:(BOOL)a3;
- (void)setDeleteConfirmationAlertMessage:(id)a3;
- (void)setDeleteConfirmationAlertTitle:(id)a3;
- (void)setDeleteInstructionDescription:(id)a3;
- (void)setDispatchGroup:(id)a3;
- (void)setDoneButtonTitle:(id)a3;
- (void)setExtraOptions:(id)a3;
- (void)setFiltersEmptyActionSets:(BOOL)a3;
- (void)setHome:(id)a3;
- (void)setHomeFuture:(id)a3;
- (void)setHomeID:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setRecommendationEngine:(id)a3;
- (void)setRecommendationID:(id)a3;
- (void)setService:(id)a3;
- (void)setServiceActionsInstructionDescription:(id)a3;
- (void)setServiceID:(id)a3;
- (void)setShowActionSetsInstructions:(BOOL)a3;
- (void)setShowConditionTriggers:(BOOL)a3;
- (void)setShowTriggerDeleteButton:(BOOL)a3;
- (void)setShowTriggerEnableSwitch:(BOOL)a3;
- (void)setShowTriggerSummary:(BOOL)a3;
- (void)setTemplate:(id)a3;
- (void)setTemplateName:(id)a3;
- (void)setTestActionsInstructionDescription:(id)a3;
- (void)setTriggerContextAwareTitle:(id)a3;
- (void)setTypeGroup:(id)a3;
- (void)setUnsupportedTriggers:(id)a3;
- (void)start;
@end

@implementation HomeRecommendationUtilDriver

- (HomeRecommendationUtilDriver)initWithArgs:(id)a3 homeID:(id)a4 templateName:(id)a5 serviceID:(id)a6 accessoryID:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v40.receiver = self;
  v40.super_class = (Class)HomeRecommendationUtilDriver;
  v16 = [(HomeRecommendationUtilDriver *)&v40 init];
  if (v16)
  {
    id v39 = v15;
    v17 = +[NSUserDefaults standardUserDefaults];
    uint64_t v18 = [v17 stringForKey:@"home"];
    homeID = v16->_homeID;
    v16->_homeID = (NSString *)v18;

    v20 = +[NSUserDefaults standardUserDefaults];
    uint64_t v21 = [v20 stringForKey:@"template"];
    templateName = v16->_templateName;
    v16->_templateName = (NSString *)v21;

    v23 = +[NSUserDefaults standardUserDefaults];
    v16->_autoCommit = [v23 BOOLForKey:@"auto-commit"];

    v24 = +[NSUserDefaults standardUserDefaults];
    uint64_t v25 = [v24 stringForKey:@"serviceID"];
    serviceID = v16->_serviceID;
    v16->_serviceID = (NSString *)v25;

    v27 = +[NSUserDefaults standardUserDefaults];
    uint64_t v28 = [v27 stringForKey:@"recommendationID"];
    recommendationID = v16->_recommendationID;
    v16->_recommendationID = (NSString *)v28;

    [(HomeRecommendationUtilDriver *)v16 setShowTriggerSummary:1];
    [(HomeRecommendationUtilDriver *)v16 setShowTriggerEnableSwitch:1];
    [(HomeRecommendationUtilDriver *)v16 setShowTriggerDeleteButton:1];
    [(HomeRecommendationUtilDriver *)v16 setShowActionSetsInstructions:1];
    [(HomeRecommendationUtilDriver *)v16 setShowConditionTriggers:1];
    [(HomeRecommendationUtilDriver *)v16 setAllowDurationEditing:1];
    [(HomeRecommendationUtilDriver *)v16 setAllowConvertToShortcut:1];
    [(HomeRecommendationUtilDriver *)v16 setFiltersEmptyActionSets:0];
    [(HomeRecommendationUtilDriver *)v16 setTestActionsInstructionDescription:&stru_100008700];
    [(HomeRecommendationUtilDriver *)v16 setServiceActionsInstructionDescription:&stru_100008700];
    [(HomeRecommendationUtilDriver *)v16 setDeleteInstructionDescription:&stru_100008700];
    [(HomeRecommendationUtilDriver *)v16 setActionEditorInstructionsDescription:&stru_100008700];
    v30 = +[NSSet set];
    [(HomeRecommendationUtilDriver *)v16 setUnsupportedTriggers:v30];

    if (v12) {
      objc_storeStrong((id *)&v16->_homeID, a4);
    }
    if (v13) {
      objc_storeStrong((id *)&v16->_templateName, a5);
    }
    if (v14) {
      objc_storeStrong((id *)&v16->_serviceID, a6);
    }
    objc_storeStrong((id *)&v16->_accessoryID, a7);
    id v31 = [objc_alloc((Class)HMHomeManagerConfiguration) initWithOptions:-1 cachePolicy:0];
    v32 = (HMHomeManager *)[objc_alloc((Class)HMHomeManager) initWithHomeMangerConfiguration:v31];
    homeManager = v16->_homeManager;
    v16->_homeManager = v32;

    [(HMHomeManager *)v16->_homeManager setDelegate:v16];
    dispatch_group_t v34 = dispatch_group_create();
    dispatchGroup = v16->_dispatchGroup;
    v16->_dispatchGroup = (OS_dispatch_group *)v34;

    v36 = [(HomeRecommendationUtilDriver *)v16 homeManager];
    v37 = +[_TtC13HomeDataModel9DataModel shared];
    [v37 setHomeManager:v36];

    id v15 = v39;
  }

  return v16;
}

- (void)start
{
  v3 = [(HomeRecommendationUtilDriver *)self dispatchGroup];
  dispatch_group_enter(v3);

  v4 = [(HomeRecommendationUtilDriver *)self run];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100003740;
  v14[3] = &unk_100008248;
  v14[4] = self;
  id v5 = [v4 addCompletionBlock:v14];

  v6 = [(HomeRecommendationUtilDriver *)self dispatchGroup];
  dispatch_time_t v7 = dispatch_time(0, 10000000);
  intptr_t v8 = dispatch_group_wait(v6, v7);

  if (v8)
  {
    do
    {
      v9 = +[NSRunLoop currentRunLoop];
      v10 = +[NSDate distantPast];
      [v9 runMode:NSDefaultRunLoopMode beforeDate:v10];

      v11 = [(HomeRecommendationUtilDriver *)self dispatchGroup];
      dispatch_time_t v12 = dispatch_time(0, 10000000);
      intptr_t v13 = dispatch_group_wait(v11, v12);
    }
    while (v13);
  }
}

- (id)run
{
  v3 = objc_opt_new();
  [(HomeRecommendationUtilDriver *)self setHomeFuture:v3];

  v4 = [(HomeRecommendationUtilDriver *)self homeManager];
  id v5 = [v4 homes];
  id v6 = [v5 count];

  if (v6)
  {
    dispatch_time_t v7 = [(HomeRecommendationUtilDriver *)self homeManager];
    [(HomeRecommendationUtilDriver *)self homeManagerDidUpdateHomes:v7];
  }
  intptr_t v8 = [(HomeRecommendationUtilDriver *)self homeFuture];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100003954;
  v15[3] = &unk_100008300;
  v15[4] = self;
  v9 = [v8 flatMap:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100003DB0;
  v14[3] = &unk_100008350;
  v14[4] = self;
  v10 = [v9 flatMap:v14];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100003FC8;
  v13[3] = &unk_100008248;
  v13[4] = self;
  v11 = [v10 addCompletionBlock:v13];

  return v11;
}

- (id)loadRecommendations
{
  v3 = [(HomeRecommendationUtilDriver *)self extraOptions];

  if (v3)
  {
    v4 = [(HomeRecommendationUtilDriver *)self extraOptions];
    uint64_t v5 = (uint64_t)[v4 unsignedIntegerValue];
  }
  else
  {
    uint64_t v5 = 39;
  }
  id v6 = objc_alloc_init((Class)HRERecommendationEngine);
  [(HomeRecommendationUtilDriver *)self setRecommendationEngine:v6];

  dispatch_time_t v7 = [(HomeRecommendationUtilDriver *)self service];

  if (v7)
  {
    intptr_t v8 = [(HomeRecommendationUtilDriver *)self service];
    id v9 = objc_alloc_init((Class)HFNullValueSource);
    dispatch_time_t v7 = +[HFServiceItem serviceItemForService:v8 valueSource:v9];
  }
  id v10 = v7;
  v11 = [(HomeRecommendationUtilDriver *)self accessory];

  id v12 = v10;
  if (v11)
  {
    id v13 = objc_alloc((Class)HFAccessoryItem);
    id v14 = [(HomeRecommendationUtilDriver *)self accessory];
    id v15 = objc_opt_new();
    id v12 = [v13 initWithAccessory:v14 valueSource:v15];
  }
  v16 = [(HomeRecommendationUtilDriver *)self template];

  if (v16)
  {
    id v17 = objc_alloc((Class)HRETemplateRecommendationGenerator);
    uint64_t v18 = [(HomeRecommendationUtilDriver *)self template];
    v27 = v18;
    v19 = +[NSArray arrayWithObjects:&v27 count:1];
    id v20 = [v17 initWithTemplates:v19];

    uint64_t v21 = [(HomeRecommendationUtilDriver *)self home];
    v22 = +[NSArray na_arrayWithSafeObject:v10];
    v23 = [(HomeRecommendationUtilDriver *)self typeGroup];
    v24 = [v20 recommendationsForHome:v21 withServiceLikeItems:v22 accessoryTypeGroup:v23 options:v5];
    uint64_t v25 = [v24 flatMap:&stru_100008390];
  }
  else
  {
    id v20 = [(HomeRecommendationUtilDriver *)self recommendationEngine];
    uint64_t v21 = +[NSArray na_arrayWithSafeObject:v12];
    v22 = [(HomeRecommendationUtilDriver *)self typeGroup];
    v23 = [(HomeRecommendationUtilDriver *)self home];
    uint64_t v25 = [v20 generateRecommendationsForServiceLikeItems:v21 accessoryTypeGroup:v22 inHome:v23 options:v5];
  }

  return v25;
}

- (id)commit:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  objc_opt_class();
  id v7 = v4;
  if (objc_opt_isKindOfClass()) {
    intptr_t v8 = v7;
  }
  else {
    intptr_t v8 = 0;
  }
  id v9 = v8;

  if (v6)
  {
    uint64_t v10 = [v6 selectedTriggerBuilder];
LABEL_11:
    v11 = (void *)v10;
    goto LABEL_12;
  }
  if (v9)
  {
    uint64_t v10 = [v9 selectedActionSetBuilder];
    goto LABEL_11;
  }
  v11 = 0;
LABEL_12:
  id v12 = [v11 commitItem];
  id v13 = [v12 recover:&stru_1000083D0];

  return v13;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  [a3 setDelegate:0];
  id v4 = [(HomeRecommendationUtilDriver *)self homeID];

  if (v4)
  {
    uint64_t v5 = [(HomeRecommendationUtilDriver *)self homeManager];
    id v6 = [v5 homes];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000048B4;
    v21[3] = &unk_1000083F8;
    v21[4] = self;
    id v7 = objc_msgSend(v6, "na_firstObjectPassingTest:", v21);
    [(HomeRecommendationUtilDriver *)self setHome:v7];

    intptr_t v8 = [(HomeRecommendationUtilDriver *)self home];

    if (!v8)
    {
      id v9 = [(HomeRecommendationUtilDriver *)self homeManager];
      uint64_t v10 = [v9 homes];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100004928;
      v20[3] = &unk_1000083F8;
      v20[4] = self;
      v11 = objc_msgSend(v10, "na_firstObjectPassingTest:", v20);
      [(HomeRecommendationUtilDriver *)self setHome:v11];
    }
  }
  id v12 = [(HomeRecommendationUtilDriver *)self home];

  if (v12)
  {
    id v13 = [(HomeRecommendationUtilDriver *)self home];
    id v14 = +[_TtC13HomeDataModel9DataModel shared];
    [v14 setCurrentHome:v13];

    NSLog(@"Waiting 10 seconds for DataModel snapshots to settle");
    id v15 = +[NAScheduler mainThreadScheduler];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000498C;
    v19[3] = &unk_100008420;
    v19[4] = self;
    id v16 = [v15 afterDelay:v19 performBlock:10.0];
  }
  else
  {
    id v17 = [(HomeRecommendationUtilDriver *)self homeFuture];
    uint64_t v18 = +[NSError errorWithDomain:@"HomeRecommendationUtilDriver" code:0 userInfo:0];
    [v17 finishWithError:v18];
  }
}

- (void)logError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v9 = v4;
    uint64_t v5 = [v4 domain];
    unsigned int v6 = [v5 isEqualToString:@"HomeRecommendationUtilDriver"];

    if (v6)
    {
      switch((unint64_t)[v9 code])
      {
        case 0uLL:
          NSLog(@"Home not found");
          break;
        case 1uLL:
          NSLog(@"Template not found");
          break;
        case 2uLL:
          id v7 = [(HomeRecommendationUtilDriver *)self serviceID];
          NSLog(@"Service uuid '%@' not found", v7);
          goto LABEL_10;
        case 4uLL:
          id v7 = [v9 userInfo];
          intptr_t v8 = [v7 objectForKey:@"error"];
          NSLog(@"Failed to commit recommendation with error: %@", v8);

LABEL_10:
          break;
        default:
          goto LABEL_5;
      }
    }
    else
    {
LABEL_5:
      NSLog(@"Unknown error: %@", v9);
    }
    id v4 = v9;
  }
}

- (HFItem)suggestionItem
{
  return self->suggestionItem;
}

- (BOOL)autoCommit
{
  return self->_autoCommit;
}

- (void)setAutoCommit:(BOOL)a3
{
  self->_autoCommit = a3;
}

- (NSString)recommendationID
{
  return self->_recommendationID;
}

- (void)setRecommendationID:(id)a3
{
}

- (NSNumber)extraOptions
{
  return self->_extraOptions;
}

- (void)setExtraOptions:(id)a3
{
}

- (HFAccessoryTypeGroup)typeGroup
{
  return self->_typeGroup;
}

- (void)setTypeGroup:(id)a3
{
}

- (NSString)homeID
{
  return self->_homeID;
}

- (void)setHomeID:(id)a3
{
}

- (NSString)templateName
{
  return self->_templateName;
}

- (void)setTemplateName:(id)a3
{
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
}

- (NSString)accessoryID
{
  return self->_accessoryID;
}

- (void)setAccessoryID:(id)a3
{
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (HMService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (HRETemplate)template
{
  return self->_template;
}

- (void)setTemplate:(id)a3
{
}

- (NAFuture)homeFuture
{
  return self->_homeFuture;
}

- (void)setHomeFuture:(id)a3
{
}

- (HRERecommendationEngine)recommendationEngine
{
  return self->_recommendationEngine;
}

- (void)setRecommendationEngine:(id)a3
{
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void)setDispatchGroup:(id)a3
{
}

- (BOOL)showTriggerSummary
{
  return self->_showTriggerSummary;
}

- (void)setShowTriggerSummary:(BOOL)a3
{
  self->_showTriggerSummary = a3;
}

- (BOOL)showTriggerEnableSwitch
{
  return self->_showTriggerEnableSwitch;
}

- (void)setShowTriggerEnableSwitch:(BOOL)a3
{
  self->_showTriggerEnableSwitch = a3;
}

- (BOOL)showTriggerDeleteButton
{
  return self->_showTriggerDeleteButton;
}

- (void)setShowTriggerDeleteButton:(BOOL)a3
{
  self->_showTriggerDeleteButton = a3;
}

- (BOOL)showActionSetsInstructions
{
  return self->_showActionSetsInstructions;
}

- (void)setShowActionSetsInstructions:(BOOL)a3
{
  self->_showActionSetsInstructions = a3;
}

- (BOOL)showConditionTriggers
{
  return self->_showConditionTriggers;
}

- (void)setShowConditionTriggers:(BOOL)a3
{
  self->_showConditionTriggers = a3;
}

- (BOOL)allowDurationEditing
{
  return self->_allowDurationEditing;
}

- (void)setAllowDurationEditing:(BOOL)a3
{
  self->_allowDurationEditing = a3;
}

- (BOOL)allowConvertToShortcut
{
  return self->_allowConvertToShortcut;
}

- (void)setAllowConvertToShortcut:(BOOL)a3
{
  self->_allowConvertToShortcut = a3;
}

- (BOOL)filtersEmptyActionSets
{
  return self->_filtersEmptyActionSets;
}

- (void)setFiltersEmptyActionSets:(BOOL)a3
{
  self->_filtersEmptyActionSets = a3;
}

- (NSString)testActionsInstructionDescription
{
  return self->_testActionsInstructionDescription;
}

- (void)setTestActionsInstructionDescription:(id)a3
{
}

- (NSString)serviceActionsInstructionDescription
{
  return self->_serviceActionsInstructionDescription;
}

- (void)setServiceActionsInstructionDescription:(id)a3
{
}

- (NSString)deleteInstructionDescription
{
  return self->_deleteInstructionDescription;
}

- (void)setDeleteInstructionDescription:(id)a3
{
}

- (NSString)actionEditorInstructionsDescription
{
  return self->_actionEditorInstructionsDescription;
}

- (void)setActionEditorInstructionsDescription:(id)a3
{
}

- (NSString)triggerContextAwareTitle
{
  return self->_triggerContextAwareTitle;
}

- (void)setTriggerContextAwareTitle:(id)a3
{
}

- (NSSet)unsupportedTriggers
{
  return self->_unsupportedTriggers;
}

- (void)setUnsupportedTriggers:(id)a3
{
}

- (NSString)deleteConfirmationAlertTitle
{
  return self->_deleteConfirmationAlertTitle;
}

- (void)setDeleteConfirmationAlertTitle:(id)a3
{
}

- (NSString)deleteConfirmationAlertMessage
{
  return self->_deleteConfirmationAlertMessage;
}

- (void)setDeleteConfirmationAlertMessage:(id)a3
{
}

- (NSString)doneButtonTitle
{
  return self->_doneButtonTitle;
}

- (void)setDoneButtonTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButtonTitle, 0);
  objc_storeStrong((id *)&self->_deleteConfirmationAlertMessage, 0);
  objc_storeStrong((id *)&self->_deleteConfirmationAlertTitle, 0);
  objc_storeStrong((id *)&self->_unsupportedTriggers, 0);
  objc_storeStrong((id *)&self->_triggerContextAwareTitle, 0);
  objc_storeStrong((id *)&self->_actionEditorInstructionsDescription, 0);
  objc_storeStrong((id *)&self->_deleteInstructionDescription, 0);
  objc_storeStrong((id *)&self->_serviceActionsInstructionDescription, 0);
  objc_storeStrong((id *)&self->_testActionsInstructionDescription, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_recommendationEngine, 0);
  objc_storeStrong((id *)&self->_homeFuture, 0);
  objc_storeStrong((id *)&self->_template, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_templateName, 0);
  objc_storeStrong((id *)&self->_homeID, 0);
  objc_storeStrong((id *)&self->_typeGroup, 0);
  objc_storeStrong((id *)&self->_extraOptions, 0);
  objc_storeStrong((id *)&self->_recommendationID, 0);

  objc_storeStrong((id *)&self->suggestionItem, 0);
}

@end