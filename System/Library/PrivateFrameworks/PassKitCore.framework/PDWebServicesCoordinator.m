@interface PDWebServicesCoordinator
+ (void)initialize;
+ (void)initializeConfigurationDefaults;
- (PDDatabaseManager)databaseManager;
- (PDNetworkTaskManager)taskManager;
- (PDWebServicesCoordinator)initWithPushNotificationManager:(id)a3 databaseManager:(id)a4 cardFileManager:(id)a5;
- (double)_updatedFrequencyScoreForScore:(double)a3 lastPushDate:(id)a4 zeroInterval:(double)a5;
- (double)_zeroIntervalForPassTypeID:(id)a3;
- (id)_nextUpdateDateWithLastUpdateDate:(id)a3 rateLimitLevel:(int64_t)a4;
- (id)_userNotificationParametersForPassTypeID:(id)a3;
- (id)pushNotificationTopics;
- (int64_t)_rateLimitLevelForFrequencyScore:(double)a3;
- (void)_aggdLogTaskErrorCode:(int64_t)a3 passTypeID:(id)a4;
- (void)_aggdLogTaskWarningCode:(int64_t)a3 passTypeID:(id)a4;
- (void)_aggdLogWebServiceErrorCode:(int64_t)a3 passTypeID:(id)a4;
- (void)_cancelAllTasksForPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (void)_cancelAutomaticUpdateTasksForPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (void)_cancelWhatChangedTasksForPassTypeIdentifier:(id)a3;
- (void)_getPassTask:(id)a3 gotResult:(id)a4;
- (void)_getSerialNumbersTask:(id)a3 gotResult:(id)a4;
- (void)_invokeAndClearHandlerForTask:(id)a3 withResult:(BOOL)a4;
- (void)_personalizePassTask:(id)a3 gotResult:(id)a4;
- (void)_presentUnregistrationAlertForPassTypeID:(id)a3;
- (void)_recalculatePushTopics;
- (void)_registerWithSerialNumber:(id)a3 authToken:(id)a4 webService:(id)a5;
- (void)_registrationTaskSucceeded:(id)a3;
- (void)_requestPassesTask:(id)a3 gotResult:(id)a4;
- (void)_scheduleUpdateForPassTypeIdentifier:(id)a3 afterDate:(id)a4;
- (void)_unregisterPassesOfType:(id)a3;
- (void)_updatePassTypeIdentifier:(id)a3;
- (void)_whatChangedTaskSucceeded:(id)a3;
- (void)adjustStateForIncomingPushNotification:(id)a3 andComputeNextUpdateDate:(id *)a4;
- (void)applyPushNotificationToken:(id)a3;
- (void)connect;
- (void)dealloc;
- (void)handleDeletion:(id)a3 authToken:(id)a4 webService:(id)a5 pushEnabled:(BOOL)a6;
- (void)handleInsertion:(id)a3 authToken:(id)a4 webService:(id)a5 pushEnabled:(BOOL)a6 source:(int64_t)a7;
- (void)handleModification:(id)a3 webService:(id)a4 pushEnabled:(BOOL)a5 source:(int64_t)a6;
- (void)handlePushDisabled:(id)a3 authToken:(id)a4 webService:(id)a5;
- (void)handlePushEnabled:(id)a3 authToken:(id)a4 webService:(id)a5;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)nukeTasks;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)personalizePassWithUniqueIdentifier:(id)a3 contact:(id)a4 personalizationToken:(id)a5 requiredPersonalizationFields:(unint64_t)a6 personalizationSource:(unint64_t)a7 handler:(id)a8;
- (void)reportAbandonedTask:(id)a3 passTypeID:(id)a4;
- (void)reportError:(id)a3 webService:(id)a4 logToService:(BOOL)a5;
- (void)reportIgnoredIfModifiedSince:(id)a3 forSerialNumber:(id)a4 webService:(id)a5;
- (void)reportMissingLastModifiedForSerialNumber:(id)a3 webService:(id)a4;
- (void)reportMissingTagWithRequestedSerialNumbers:(id)a3 forWebService:(id)a4;
- (void)reportPushRateLimitLevel:(int64_t)a3 forPassTypeID:(id)a4;
- (void)reportPushWithNoSerialNumbersFromTasks:(id)a3;
- (void)reportUnchangedPassForPersonalizationTask:(id)a3;
- (void)reportUnchangedPassForServerRequestedUpdateTask:(id)a3;
- (void)reportUnmodifiedTag:(id)a3 withRequestedSerialNumbers:(id)a4 forWebService:(id)a5;
- (void)reportUpdateRequestForNonPushEnabledSerialNumber:(id)a3 forWebService:(id)a4;
- (void)reportWarnings:(id)a3 webService:(id)a4 logToService:(BOOL)a5;
- (void)requestPassesForIssuerBindingData:(id)a3 handler:(id)a4;
- (void)resetPushFrequencyStateForPassTypeID:(id)a3;
- (void)sendPassLifecycleEventForUniqueIdentifier:(id)a3 state:(unint64_t)a4;
- (void)task:(id)a3 encounteredError:(id)a4;
- (void)task:(id)a3 encounteredWarnings:(id)a4;
- (void)task:(id)a3 gotResult:(id)a4;
- (void)task:(id)a3 willRetryAfterMinimumDelay:(double)a4;
- (void)taskFailed:(id)a3;
- (void)taskSucceeded:(id)a3;
- (void)updatePassWithUniqueIdentifier:(id)a3 handler:(id)a4;
@end

@implementation PDWebServicesCoordinator

+ (void)initialize
{
}

- (PDWebServicesCoordinator)initWithPushNotificationManager:(id)a3 databaseManager:(id)a4 cardFileManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PDWebServicesCoordinator;
  v12 = [(PDWebServicesCoordinator *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_databaseManager, a4);
    objc_storeStrong((id *)&v13->_cardFileManager, a5);
    objc_storeStrong((id *)&v13->_pushNotificationManager, a3);
    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    taskToHandlerMap = v13->_taskToHandlerMap;
    v13->_taskToHandlerMap = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    taskToResultMap = v13->_taskToResultMap;
    v13->_taskToResultMap = v16;

    [(PDDatabaseManager *)v13->_databaseManager setWebServicesDelegate:v13];
  }

  return v13;
}

- (void)dealloc
{
  [(PDPushNotificationManager *)self->_pushNotificationManager unregisterConsumer:self];
  [(PDDatabaseManager *)self->_databaseManager setWebServicesDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PDWebServicesCoordinator;
  [(PDWebServicesCoordinator *)&v3 dealloc];
}

- (void)connect
{
  [(PDPushNotificationManager *)self->_pushNotificationManager registerConsumer:self];
  if (!self->_taskManager)
  {
    objc_super v3 = [[PDNetworkTaskManager alloc] initWithDelegate:self archiveName:@"WebServiceTasks"];
    taskManager = self->_taskManager;
    self->_taskManager = v3;
  }
  PDDefaultQueue();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  PDScheduledActivityClientRegister();
}

- (void)updatePassWithUniqueIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a4;
  databaseManager = self->_databaseManager;
  id v15 = 0;
  id v16 = 0;
  unsigned int v8 = [(PDDatabaseManager *)databaseManager getWebService:&v16 updateContext:&v15 forPassWithUniqueID:a3];
  id v9 = v16;
  id v10 = v15;
  if (v8)
  {
    id v11 = +[PDGetPassTask taskWithWebService:v9 updateContext:v10 source:1];
    [v11 setUserRequested:1];
    if (v6 && v11)
    {
      taskToHandlerMap = self->_taskToHandlerMap;
      id v13 = [v6 copy];
      v14 = +[NSValue valueWithPointer:v11];
      [(NSMutableDictionary *)taskToHandlerMap setObject:v13 forKey:v14];
    }
    [(PDNetworkTaskManager *)self->_taskManager performTask:v11];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)personalizePassWithUniqueIdentifier:(id)a3 contact:(id)a4 personalizationToken:(id)a5 requiredPersonalizationFields:(unint64_t)a6 personalizationSource:(unint64_t)a7 handler:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  databaseManager = self->_databaseManager;
  id v32 = 0;
  id v33 = 0;
  unsigned int v18 = [(PDDatabaseManager *)databaseManager getWebService:&v33 updateContext:&v32 forPassWithUniqueID:a3];
  id v19 = v33;
  id v20 = v32;
  if (v18)
  {
    v21 = +[PDPersonalizePassTask taskWithWebService:v19 updateContext:v20 contact:v14 personalizationToken:v15 requiredPersonalizationFields:a6 personalizationSource:a7];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1001D016C;
    v27[3] = &unk_10073AB28;
    id v28 = v19;
    id v29 = v20;
    v30 = self;
    id v31 = v16;
    v22 = objc_retainBlock(v27);
    v23 = v22;
    if (v21 && v22)
    {
      taskToHandlerMap = self->_taskToHandlerMap;
      id v24 = [v22 copy];
      v25 = +[NSValue valueWithPointer:v21];
      [(NSMutableDictionary *)taskToHandlerMap setObject:v24 forKey:v25];
    }
    [(PDNetworkTaskManager *)self->_taskManager performTask:v21];
  }
  else
  {
    (*((void (**)(id, void))v16 + 2))(v16, 0);
  }
}

- (void)requestPassesForIssuerBindingData:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v13 = objc_alloc_init(PDWebService);
  unsigned int v8 = [v7 callbackURL];
  [(PDWebService *)v13 setServiceURL:v8];

  id v9 = +[PDRequestPassesTask taskWithWebService:v13 issuerBindingData:v7];

  taskToHandlerMap = self->_taskToHandlerMap;
  id v11 = [v6 copy];

  v12 = +[NSValue valueWithPointer:v9];
  [(NSMutableDictionary *)taskToHandlerMap setObject:v11 forKey:v12];

  [(PDNetworkTaskManager *)self->_taskManager performTask:v9];
}

- (void)sendPassLifecycleEventForUniqueIdentifier:(id)a3 state:(unint64_t)a4
{
  id v6 = a3;
  databaseManager = self->_databaseManager;
  id v14 = 0;
  id v15 = 0;
  unsigned int v8 = [(PDDatabaseManager *)databaseManager getWebService:&v15 updateContext:&v14 forPassWithUniqueID:v6];
  id v9 = v15;
  id v10 = v14;
  id v11 = v10;
  if (v8)
  {
    v12 = [v10 serialNumber];
    id v13 = +[PDReportLifecycleEventTask taskWithWebService:v9 serialNumber:v12 state:a4];

    [(PDNetworkTaskManager *)self->_taskManager performTask:v13];
  }
  else
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Failed to fetch web service for pass with unique id: %@", buf, 0xCu);
    }
  }
}

- (void)nukeTasks
{
  objc_super v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing all web service tasks", v4, 2u);
  }

  [(PDNetworkTaskManager *)self->_taskManager nukeArchive];
}

- (void)handleInsertion:(id)a3 authToken:(id)a4 webService:(id)a5 pushEnabled:(BOOL)a6 source:(int64_t)a7
{
  BOOL v8 = a6;
  id v16 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = [v13 pushToken];

  if (!v14)
  {
    id v15 = [(PDPushNotificationManager *)self->_pushNotificationManager pushToken];
    [v13 setPushToken:v15];

    [v13 generateNewDeviceIdentifier];
    [(PDDatabaseManager *)self->_databaseManager updateWebService:v13];
  }
  if ((unint64_t)(a7 - 3) <= 0xFFFFFFFFFFFFFFFDLL) {
    [(PDDatabaseManager *)self->_databaseManager updateLastModifiedTag:0 forSerialNumber:v16 webService:v13];
  }
  if (v8) {
    [(PDWebServicesCoordinator *)self handlePushEnabled:v16 authToken:v12 webService:v13];
  }
}

- (void)handleDeletion:(id)a3 authToken:(id)a4 webService:(id)a5 pushEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v13 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [v11 passTypeIdentifier];
  [(PDWebServicesCoordinator *)self _cancelAllTasksForPassTypeIdentifier:v12 serialNumber:v13];

  if (v6) {
    [(PDWebServicesCoordinator *)self handlePushDisabled:v13 authToken:v10 webService:v11];
  }
}

- (void)handleModification:(id)a3 webService:(id)a4 pushEnabled:(BOOL)a5 source:(int64_t)a6
{
  BOOL v7 = a5;
  id v13 = a3;
  id v10 = a4;
  if ((unint64_t)(a6 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    [(PDDatabaseManager *)self->_databaseManager updateLastModifiedTag:0 forSerialNumber:v13 webService:v10];
    if (a6 != 3 && a6 != 5 && v7)
    {
      id v11 = [(PDDatabaseManager *)self->_databaseManager passUpdateContextForSerialNumber:v13 webService:v10];
      id v12 = +[PDGetPassTask taskWithWebService:v10 updateContext:v11 source:1];
      [(PDNetworkTaskManager *)self->_taskManager performTask:v12];
    }
  }
}

- (void)handlePushEnabled:(id)a3 authToken:(id)a4 webService:(id)a5
{
  [(PDWebServicesCoordinator *)self _registerWithSerialNumber:a3 authToken:a4 webService:a5];
  [(PDWebServicesCoordinator *)self _recalculatePushTopics];
}

- (void)handlePushDisabled:(id)a3 authToken:(id)a4 webService:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v11 = +[PDRegistrationTask unregisterTaskWithWebService:v8 serialNumber:v9 authToken:a4];
  -[PDNetworkTaskManager performTask:](self->_taskManager, "performTask:");
  [(PDWebServicesCoordinator *)self _recalculatePushTopics];
  id v10 = [v8 passTypeIdentifier];

  [(PDWebServicesCoordinator *)self _cancelAutomaticUpdateTasksForPassTypeIdentifier:v10 serialNumber:v9];
  if (![(NSSet *)self->_pushTopics containsObject:v10]) {
    [(PDWebServicesCoordinator *)self _cancelWhatChangedTasksForPassTypeIdentifier:v10];
  }
}

- (void)applyPushNotificationToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PDDatabaseManager *)self->_databaseManager webServices];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001D09B8;
    v6[3] = &unk_10073DFE0;
    id v7 = v4;
    id v8 = self;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v5 = a3;
  id v7 = 0;
  [(PDWebServicesCoordinator *)self adjustStateForIncomingPushNotification:v5 andComputeNextUpdateDate:&v7];
  id v6 = v7;
  if (v6) {
    [(PDWebServicesCoordinator *)self _scheduleUpdateForPassTypeIdentifier:v5 afterDate:v6];
  }
}

- (id)pushNotificationTopics
{
  pushTopics = self->_pushTopics;
  if (!pushTopics)
  {
    id v4 = [(PDDatabaseManager *)self->_databaseManager pushEnabledPassTypeIDs];
    id v5 = self->_pushTopics;
    self->_pushTopics = v4;

    pushTopics = self->_pushTopics;
  }
  return pushTopics;
}

- (void)task:(id)a3 gotResult:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PDWebServicesCoordinator *)self _getSerialNumbersTask:v7 gotResult:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(PDWebServicesCoordinator *)self _getPassTask:v7 gotResult:v6];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(PDWebServicesCoordinator *)self _personalizePassTask:v7 gotResult:v6];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(PDWebServicesCoordinator *)self _requestPassesTask:v7 gotResult:v6];
        }
      }
    }
  }
}

- (void)task:(id)a3 willRetryAfterMinimumDelay:(double)a4
{
  id v6 = a3;
  if (PKDeveloperLoggingEnabled() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1005169C8((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }
  id v14 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v6;
    __int16 v18 = 2048;
    double v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ will retry after %g seconds", (uint8_t *)&v16, 0x16u);
  }

  objc_opt_class();
  BOOL v15 = (objc_opt_isKindOfClass() & 1) != 0 && [v6 source] == (id)2;
  [(PDWebServicesCoordinator *)self _invokeAndClearHandlerForTask:v6 withResult:v15];
}

- (void)taskSucceeded:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(PDWebServicesCoordinator *)self _registrationTaskSucceeded:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PDWebServicesCoordinator *)self _whatChangedTaskSucceeded:v4];
    }
  }
  [(PDWebServicesCoordinator *)self _invokeAndClearHandlerForTask:v4 withResult:1];
}

- (void)taskFailed:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ failed for good", (uint8_t *)&v7, 0xCu);
  }

  if (objc_opt_respondsToSelector())
  {
    id v6 = [v4 passTypeIdentifier];
    [(PDWebServicesCoordinator *)self reportAbandonedTask:v4 passTypeID:v6];
  }
  [(PDWebServicesCoordinator *)self _invokeAndClearHandlerForTask:v4 withResult:0];
}

- (void)task:(id)a3 encounteredError:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    id v8 = [v6 domain];
    if ([v8 isEqualToString:@"PDTaskErrorDomain"]) {
      BOOL v9 = [v6 code] != (id)2;
    }
    else {
      BOOL v9 = 1;
    }

    uint64_t v10 = [v11 webService];
    [(PDWebServicesCoordinator *)self reportError:v6 webService:v10 logToService:v9 & ~isKindOfClass];
  }
}

- (void)task:(id)a3 encounteredWarnings:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v8 = [v9 webService];
    [(PDWebServicesCoordinator *)self reportWarnings:v6 webService:v8 logToService:(isKindOfClass & 1) == 0];
  }
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v6 = a3;
  if ([v6 hasPrefix:@"UpdatePassTypeIdentifier."])
  {
    id v5 = [v6 substringFromIndex:objc_msgSend(@"UpdatePassTypeIdentifier.", "length")];
    [(PDWebServicesCoordinator *)self _updatePassTypeIdentifier:v5];
  }
}

- (void)_invokeAndClearHandlerForTask:(id)a3 withResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v13 = +[NSValue valueWithPointer:v6];
  int v7 = -[NSMutableDictionary objectForKey:](self->_taskToResultMap, "objectForKey:");
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (v7)
  {
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_12;
    }
    id v9 = [(NSMutableDictionary *)self->_taskToHandlerMap objectForKey:v13];
    if (v9)
    {
      uint64_t v10 = [v7 passesData];
      id v11 = [v7 error];
      ((void (**)(void, void *, void *))v9)[2](v9, v10, v11);

LABEL_8:
    }
  }
  else
  {
    uint64_t v12 = [(NSMutableDictionary *)self->_taskToHandlerMap objectForKey:v13];
    id v9 = (void (**)(void, void, void))v12;
    if ((isKindOfClass & 1) == 0)
    {
      if (v12) {
        (*(void (**)(uint64_t, BOOL))(v12 + 16))(v12, v4);
      }
      goto LABEL_11;
    }
    if (v12)
    {
      uint64_t v10 = +[NSError errorWithDomain:@"PDTaskErrorDomain" code:6 userInfo:0];
      ((void (**)(void, void, void *))v9)[2](v9, 0, v10);
      goto LABEL_8;
    }
  }
LABEL_11:

LABEL_12:
  [(NSMutableDictionary *)self->_taskToResultMap removeObjectForKey:v13];
  [(NSMutableDictionary *)self->_taskToHandlerMap removeObjectForKey:v13];
}

- (void)_recalculatePushTopics
{
  objc_super v3 = [(PDDatabaseManager *)self->_databaseManager pushEnabledPassTypeIDs];
  pushTopics = self->_pushTopics;
  self->_pushTopics = v3;

  pushNotificationManager = self->_pushNotificationManager;
  [(PDPushNotificationManager *)pushNotificationManager recalculatePushTopics];
}

- (void)_registerWithSerialNumber:(id)a3 authToken:(id)a4 webService:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 pushToken];

  if (v11)
  {
    uint64_t v12 = PDDefaultQueue();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001D1568;
    v13[3] = &unk_100730198;
    id v14 = v10;
    id v15 = v8;
    id v16 = v9;
    id v17 = self;
    dispatch_async(v12, v13);
  }
}

- (void)_registrationTaskSucceeded:(id)a3
{
  id v18 = a3;
  id v4 = [v18 requestedStatus];
  databaseManager = self->_databaseManager;
  id v6 = +[NSDate date];
  int v7 = [v18 serialNumber];
  id v8 = [v18 webService];
  [(PDDatabaseManager *)databaseManager updateRegistrationStatus:v4 date:v6 forSerialNumber:v7 webService:v8];

  id v9 = v18;
  if (v4 == (id)1)
  {
    id v10 = [v18 webService];
    id v11 = [v18 serialNumber];
    uint64_t v12 = [(PDDatabaseManager *)self->_databaseManager lastUpdatedTagForWebService:v10];
    id v13 = [(PDDatabaseManager *)self->_databaseManager tagLastUpdateDateForWebService:v10];
    taskManager = self->_taskManager;
    id v15 = +[PDGetSerialNumbersTask taskWithWebService:v10 lastUpdatedTag:v12 tagLastUpdateDate:v13];
    [(PDNetworkTaskManager *)taskManager performTask:v15];

    if (v12)
    {
      id v16 = [(PDDatabaseManager *)self->_databaseManager passUpdateContextForSerialNumber:v11 webService:v10];
      if (v16)
      {
        id v17 = +[PDGetPassTask taskWithWebService:v10 updateContext:v16 source:1];
        [(PDNetworkTaskManager *)self->_taskManager performTask:v17];
      }
    }

    id v9 = v18;
  }
}

- (void)_whatChangedTaskSucceeded:(id)a3
{
  id v5 = a3;
  if (([v5 gotUpdates] & 1) == 0)
  {
    id v4 = [v5 subtasks];
    [(PDWebServicesCoordinator *)self reportPushWithNoSerialNumbersFromTasks:v4];
  }
}

- (void)_getSerialNumbersTask:(id)a3 gotResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 webService];
  id v9 = [v6 lastUpdatedTag];
  id v10 = [v7 lastUpdatedTag];
  id v11 = [v7 serialNumbers];
  if (PKDeveloperLoggingEnabled() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100516A48();
  }
  uint64_t v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v34 = v10;
    __int16 v35 = 2112;
    v36 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Get serial numbers task completed with update tag %@, serial numbers %@", buf, 0x16u);
  }

  if ([v11 count])
  {
    if (v10)
    {
      if (v9 && [v10 isEqualToString:v9]) {
        [(PDWebServicesCoordinator *)self reportUnmodifiedTag:v9 withRequestedSerialNumbers:v11 forWebService:v8];
      }
      [(PDDatabaseManager *)self->_databaseManager updateLastUpdatedTag:v10 forWebService:v8];
    }
    else
    {
      [(PDWebServicesCoordinator *)self reportMissingTagWithRequestedSerialNumbers:v11 forWebService:v8];
    }
    v22 = v9;
    id v13 = [objc_alloc((Class)NSMutableSet) initWithArray:v11];
    databaseManager = self->_databaseManager;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1001D1B0C;
    v28[3] = &unk_10073E008;
    v28[4] = self;
    id v15 = v13;
    id v29 = v15;
    v23 = v8;
    id v16 = v8;
    id v30 = v16;
    BOOL v31 = v9 != 0;
    [(PDDatabaseManager *)databaseManager enumeratePassUpdateContextsForWebService:v16 withHandler:v28];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v17 = v15;
    id v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        v21 = 0;
        do
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          -[PDWebServicesCoordinator reportUpdateRequestForNonPushEnabledSerialNumber:forWebService:](self, "reportUpdateRequestForNonPushEnabledSerialNumber:forWebService:", *(void *)(*((void *)&v24 + 1) + 8 * (void)v21), v16, v22);
          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v19);
    }

    id v9 = v22;
    id v8 = v23;
  }
  else if (v10)
  {
    [(PDDatabaseManager *)self->_databaseManager updateLastUpdatedTag:v10 forWebService:v8];
  }
}

- (void)_getPassTask:(id)a3 gotResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 pass];
  if (v8)
  {
    id v9 = [v6 context];
    id v10 = [v9 lastModifiedTag];

    id v11 = [v8 manifestHash];
    uint64_t v12 = [v6 context];
    id v13 = [v12 manifestHash];
    unsigned int v14 = [v11 isEqualToData:v13];

    if (v14)
    {
      if ([v6 serverRequested]) {
        [(PDWebServicesCoordinator *)self reportUnchangedPassForServerRequestedUpdateTask:v6];
      }
      if (v10)
      {
        id v15 = [v6 serialNumber];
        id v16 = [v6 webService];
        [(PDWebServicesCoordinator *)self reportIgnoredIfModifiedSince:v10 forSerialNumber:v15 webService:v16];
      }
    }
    id v17 = [v7 lastModified];

    if (!v17)
    {
      id v18 = [v6 serialNumber];
      id v19 = [v6 webService];
      [(PDWebServicesCoordinator *)self reportMissingLastModifiedForSerialNumber:v18 webService:v19];
    }
    databaseManager = self->_databaseManager;
    v21 = [v6 passTypeIdentifier];
    v22 = [v6 serialNumber];
    LODWORD(databaseManager) = [(PDDatabaseManager *)databaseManager passExistsWithPassTypeID:v21 serialNumber:v22];

    if (databaseManager)
    {
      if (v14)
      {
        v23 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          long long v24 = [v6 passTypeIdentifier];
          long long v25 = [v6 serialNumber];
          int v37 = 138412546;
          v38 = v24;
          __int16 v39 = 2112;
          v40 = v25;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Get pass task succeeded (%@/%@) but pass did not change", (uint8_t *)&v37, 0x16u);
        }
        long long v26 = self->_databaseManager;
        long long v27 = [v7 lastModified];
        id v28 = [v6 serialNumber];
        id v29 = [v6 webService];
        [(PDDatabaseManager *)v26 updateLastModifiedTag:v27 forSerialNumber:v28 webService:v29];
      }
      else if (-[PDCardFileManager writeCard:source:error:](self->_cardFileManager, "writeCard:source:error:", v8, [v6 source], 0))
      {
        id v33 = self->_databaseManager;
        v34 = [v7 lastModified];
        __int16 v35 = [v6 serialNumber];
        v36 = [v6 webService];
        [(PDDatabaseManager *)v33 updateLastModifiedTag:v34 forSerialNumber:v35 webService:v36];

        if ([v6 source] == (id)2)
        {
          if (PKValueAddedServicesAutomaticSelectionDefaultForPass()) {
            -[PDDatabaseManager updateSettings:forPass:](self->_databaseManager, "updateSettings:forPass:", (unint64_t)[v8 settings] | 0x10, v8);
          }
        }
      }
    }
    else
    {
      id v30 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v31 = [v6 passTypeIdentifier];
        id v32 = [v6 serialNumber];
        int v37 = 138412546;
        v38 = v31;
        __int16 v39 = 2112;
        v40 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Get pass task succeeded (%@/%@) but pass has been deleted, so ignoring result.", (uint8_t *)&v37, 0x16u);
      }
    }
  }
  else if ([v6 serverRequested])
  {
    [(PDWebServicesCoordinator *)self reportUnchangedPassForServerRequestedUpdateTask:v6];
  }
}

- (void)_personalizePassTask:(id)a3 gotResult:(id)a4
{
  if (a4)
  {
    id v5 = a4;
    id v6 = a3;
    id v9 = [v6 passTypeIdentifier];
    id v7 = [v6 personalizationToken];
    id v8 = [v5 encodedSignature];

    [v6 personalizationSource];
    PKPassPersonalizationReport();
  }
}

- (void)_requestPassesTask:(id)a3 gotResult:(id)a4
{
  if (a4)
  {
    taskToResultMap = self->_taskToResultMap;
    id v6 = a4;
    id v7 = +[NSValue valueWithPointer:a3];
    [(NSMutableDictionary *)taskToResultMap setObject:v6 forKey:v7];
  }
}

- (void)_cancelAllTasksForPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  taskManager = self->_taskManager;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001D2224;
  v11[3] = &unk_100733290;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(PDNetworkTaskManager *)taskManager cancelTasksPassingTest:v11];
}

- (void)_cancelAutomaticUpdateTasksForPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  taskManager = self->_taskManager;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001D2364;
  v11[3] = &unk_100733290;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(PDNetworkTaskManager *)taskManager cancelTasksPassingTest:v11];
}

- (void)_cancelWhatChangedTasksForPassTypeIdentifier:(id)a3
{
  id v4 = a3;
  taskManager = self->_taskManager;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001D246C;
  v7[3] = &unk_10073E030;
  id v8 = v4;
  id v6 = v4;
  [(PDNetworkTaskManager *)taskManager cancelTasksPassingTest:v7];
}

- (void)_scheduleUpdateForPassTypeIdentifier:(id)a3 afterDate:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = +[NSDate date];
  [v7 timeIntervalSinceDate:v8];
  double v10 = v9;

  if (v10 >= 60.0)
  {
    if (v6) {
      CFStringRef v11 = v6;
    }
    else {
      CFStringRef v11 = &stru_10075AAD8;
    }
    id v12 = [@"UpdatePassTypeIdentifier." stringByAppendingString:v11];
    if ((PDScheduledActivityExists() & 1) == 0)
    {
      id v13 = +[PDScheduledActivityCriteria maintenanceActivityCriteriaWithStartDate:v7];
      unsigned int v14 = [v7 dateByAddingTimeInterval:600.0];
      [v13 setEndDate:v14];

      PDScheduledActivityRegister();
      if (PKDeveloperLoggingEnabled()
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100516AB8();
      }
      id v15 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412546;
        id v17 = v6;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rate limiting for %@ is in effect - deferring update until %@", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  else
  {
    [(PDWebServicesCoordinator *)self _updatePassTypeIdentifier:v6];
  }
}

- (void)_updatePassTypeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableSet set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v6 = [(PDDatabaseManager *)self->_databaseManager webServicesForPassTypeID:v4];
  id v7 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        if ([(PDDatabaseManager *)self->_databaseManager hasPushEnabledPassesForWebService:v11])
        {
          [v5 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    databaseManager = self->_databaseManager;
    id v13 = +[NSDate date];
    id v27 = v4;
    [(PDDatabaseManager *)databaseManager updateLastUpdateDate:v13 forPassTypeID:v4];

    unsigned int v14 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v5 count]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v26 = v5;
    id v15 = v5;
    id v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8 * (void)j);
          v21 = -[PDDatabaseManager lastUpdatedTagForWebService:](self->_databaseManager, "lastUpdatedTagForWebService:", v20, v26);
          v22 = [(PDDatabaseManager *)self->_databaseManager tagLastUpdateDateForWebService:v20];
          v23 = +[PDGetSerialNumbersTask taskWithWebService:v20 lastUpdatedTag:v21 tagLastUpdateDate:v22];
          [v14 addObject:v23];
        }
        id v17 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v17);
    }

    taskManager = self->_taskManager;
    id v4 = v27;
    long long v25 = +[PDWhatChangedTask taskWithPassTypeIdentifier:v27 subtasks:v14];
    [(PDNetworkTaskManager *)taskManager performTask:v25];

    id v5 = v26;
  }
}

- (PDDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (PDNetworkTaskManager)taskManager
{
  return self->_taskManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskToResultMap, 0);
  objc_storeStrong((id *)&self->_taskToHandlerMap, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_cardFileManager, 0);
  objc_storeStrong((id *)&self->_pushTopics, 0);
}

+ (void)initializeConfigurationDefaults
{
  v9[0] = @"PDWebServicesStandardZeroInterval";
  v2 = +[NSNumber numberWithDouble:7200.0];
  v10[0] = v2;
  v9[1] = @"PDWebServicesMinimumZeroInterval";
  objc_super v3 = +[NSNumber numberWithDouble:1800.0];
  v10[1] = v3;
  v10[2] = &off_10078B730;
  v9[2] = @"PDWebServicesMildRateLimitThreshold";
  v9[3] = @"PDWebServicesModerateRateLimitThreshold";
  v10[3] = &off_10078B748;
  v10[4] = &off_10078B760;
  v9[4] = @"PDWebServicesSevereRateLimitThreshold";
  v9[5] = @"PDWebServicesPushCutoffThreshold";
  v10[5] = &off_10078B778;
  v9[6] = @"PDWebServicesMildRateLimitInterval";
  id v4 = +[NSNumber numberWithDouble:120.0];
  v10[6] = v4;
  v9[7] = @"PDWebServicesModerateRateLimitInterval";
  id v5 = +[NSNumber numberWithDouble:600.0];
  v10[7] = v5;
  v9[8] = @"PDWebServicesSevereRateLimitInterval";
  id v6 = +[NSNumber numberWithDouble:3600.0];
  v10[8] = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:9];

  id v8 = +[NSUserDefaults standardUserDefaults];
  [v8 registerDefaults:v7];
}

- (void)adjustStateForIncomingPushNotification:(id)a3 andComputeNextUpdateDate:(id *)a4
{
  id v6 = a3;
  double v18 = 0.0;
  id v7 = [(PDWebServicesCoordinator *)self databaseManager];
  id v16 = 0;
  id v17 = 0;
  [v7 getLastPushDate:&v17 lastUpdateDate:&v16 frequencyScore:&v18 forPassTypeID:v6];
  id v8 = v17;
  id v9 = v16;

  double v10 = v18;
  [(PDWebServicesCoordinator *)self _zeroIntervalForPassTypeID:v6];
  [(PDWebServicesCoordinator *)self _updatedFrequencyScoreForScore:v8 lastPushDate:v10 zeroInterval:v11];
  double v18 = v12;
  id v13 = [(PDWebServicesCoordinator *)self databaseManager];
  unsigned int v14 = +[NSDate date];
  [v13 updateLastPushDate:v14 frequencyScore:v6 forPassTypeID:v18];

  int64_t v15 = [(PDWebServicesCoordinator *)self _rateLimitLevelForFrequencyScore:v18];
  [(PDWebServicesCoordinator *)self reportPushRateLimitLevel:v15 forPassTypeID:v6];
  if (v15 == 4) {
    [(PDWebServicesCoordinator *)self _presentUnregistrationAlertForPassTypeID:v6];
  }
  if (a4)
  {
    *a4 = [(PDWebServicesCoordinator *)self _nextUpdateDateWithLastUpdateDate:v9 rateLimitLevel:v15];
  }
}

- (void)resetPushFrequencyStateForPassTypeID:(id)a3
{
  id v4 = a3;
  id v5 = [(PDWebServicesCoordinator *)self databaseManager];
  [v5 updateLastPushDate:0 frequencyScore:v4 forPassTypeID:0.0];
}

- (void)reportPushRateLimitLevel:(int64_t)a3 forPassTypeID:(id)a4
{
  id v5 = a4;
  switch(a3)
  {
    case 1:
      if (PKDeveloperLoggingEnabled()
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1005172C8();
      }
      id v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Too many pushes too fast for %@ -- mild rate limiting will apply.", buf, 0xCu);
      }

      uint64_t v19 = PKAggDKeyWebServicesPassType;
      id v20 = v5;
      id v7 = &v20;
      id v8 = &v19;
      goto LABEL_26;
    case 2:
      if (PKDeveloperLoggingEnabled()
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100517338();
      }
      id v9 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Too many pushes too fast for %@ -- moderate rate limiting will apply.", buf, 0xCu);
      }

      uint64_t v17 = PKAggDKeyWebServicesPassType;
      id v18 = v5;
      id v7 = &v18;
      id v8 = &v17;
      goto LABEL_26;
    case 3:
      if (PKDeveloperLoggingEnabled()
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1005173A8();
      }
      double v10 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Too many pushes too fast for %@ -- severe rate limiting will apply.", buf, 0xCu);
      }

      uint64_t v15 = PKAggDKeyWebServicesPassType;
      id v16 = v5;
      id v7 = &v16;
      id v8 = &v15;
      goto LABEL_26;
    case 4:
      if (PKDeveloperLoggingEnabled()
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100517418();
      }
      double v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Too many pushes too fast for %@ -- topic will be unregistered.", buf, 0xCu);
      }

      uint64_t v13 = PKAggDKeyWebServicesPassType;
      id v14 = v5;
      id v7 = &v14;
      id v8 = &v13;
LABEL_26:
      double v12 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v8, 1, v13, v14, v15, v16, v17, v18, v19, v20);
      PKAnalyticsSendEvent();

      break;
    default:
      break;
  }
}

- (void)reportUpdateRequestForNonPushEnabledSerialNumber:(id)a3 forWebService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v25 = 0;
  id v8 = [(PDWebServicesCoordinator *)self databaseManager];
  id v24 = 0;
  unsigned int v9 = [v8 getRegistrationStatus:&v25 date:&v24 forSerialNumber:v6 webService:v7];
  id v10 = v24;

  if (!v9)
  {
    uint64_t v19 = [(PDWebServicesCoordinator *)self databaseManager];
    id v20 = [v19 lastDeletionDateForWebService:v7];

    v21 = +[NSDate date];
    [v21 timeIntervalSinceDate:v20];
    double v18 = v22;

LABEL_6:
    if (v18 > 3600.0) {
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  if (!v25)
  {
LABEL_7:
    v23 = PDWebServiceError(4, v7, @"Update requested for unregistered serial number %@", v11, v12, v13, v14, v15, (uint64_t)v6);
    [(PDWebServicesCoordinator *)self reportError:v23 webService:v7 logToService:1];

    goto LABEL_8;
  }
  if (v25 == 2)
  {
    id v16 = +[NSDate date];
    [v16 timeIntervalSinceDate:v10];
    double v18 = v17;

    goto LABEL_6;
  }
LABEL_8:
}

- (void)reportMissingTagWithRequestedSerialNumbers:(id)a3 forWebService:(id)a4
{
  id v6 = a4;
  id v7 = [a3 count];
  uint64_t v13 = PDWebServiceError(5, v6, @"Response to 'What changed?' request included %lu serial numbers but omitted a lastUpdated tag.", v8, v9, v10, v11, v12, (uint64_t)v7);
  v17[0] = PKAggDKeyWebServicesPassType;
  uint64_t v14 = [v6 passTypeIdentifier];
  v17[1] = @"count";
  v18[0] = v14;
  uint64_t v15 = +[NSNumber numberWithUnsignedInteger:v7];
  v18[1] = v15;
  id v16 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  PKAnalyticsSendEvent();

  [(PDWebServicesCoordinator *)self reportError:v13 webService:v6 logToService:1];
}

- (void)reportUnmodifiedTag:(id)a3 withRequestedSerialNumbers:(id)a4 forWebService:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 count];
  id v16 = PDWebServiceError(6, v8, @"Response to 'What changed?' request included %lu serial numbers but the lastUpdated tag (%@) remained the same.", v11, v12, v13, v14, v15, (uint64_t)v10);

  v20[0] = PKAggDKeyWebServicesPassType;
  double v17 = [v8 passTypeIdentifier];
  v20[1] = @"count";
  v21[0] = v17;
  double v18 = +[NSNumber numberWithUnsignedInteger:v10];
  v21[1] = v18;
  uint64_t v19 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
  PKAnalyticsSendEvent();

  [(PDWebServicesCoordinator *)self reportError:v16 webService:v8 logToService:1];
}

- (void)reportPushWithNoSerialNumbersFromTasks:(id)a3
{
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v35;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v35 != v6) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v34 + 1) + 8 * v7);
      uint64_t v9 = [v8 tagLastUpdateDate];
      if (!v9) {
        break;
      }
      id v10 = (void *)v9;
      uint64_t v11 = [v8 creationDate];
      [v11 timeIntervalSinceDate:v10];
      double v13 = v12;

      if (v13 < 300.0) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v14 = obj;
    id v15 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v31;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v20 = [v19 webService];
          v21 = [v19 lastUpdatedTag];
          long long v28 = [v20 deviceIdentifier];
          id v27 = PDWebServiceError(3, v20, @"Device received spurious push. Request for passesUpdatedSince '%@' returned no serial numbers. (Device = %@)", v22, v23, v24, v25, v26, (uint64_t)v21);

          [(PDWebServicesCoordinator *)self reportError:v27 webService:v20 logToService:1];
        }
        id v16 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v16);
    }
  }
}

- (void)reportUnchangedPassForServerRequestedUpdateTask:(id)a3
{
  id v21 = a3;
  id v4 = [v21 context];
  if ([v4 lastModifiedSource] == (id)1)
  {
  }
  else
  {
    id v5 = [v21 context];
    id v6 = [v5 lastModifiedSource];

    uint64_t v7 = v21;
    if (v6 != (id)2) {
      goto LABEL_6;
    }
  }
  id v8 = [v21 creationDate];
  uint64_t v9 = [v21 context];
  id v10 = [v9 lastModifiedDate];
  [v8 timeIntervalSinceDate:v10];
  double v12 = v11;

  uint64_t v7 = v21;
  if (v12 >= 300.0)
  {
    double v13 = [v21 webService];
    id v14 = [v21 serialNumber];
    id v20 = PDWebServiceError(0, v13, @"Server requested update to serial number '%@', but the pass was unchanged.", v15, v16, v17, v18, v19, (uint64_t)v14);

    [(PDWebServicesCoordinator *)self reportError:v20 webService:v13 logToService:1];
    uint64_t v7 = v21;
  }
LABEL_6:
}

- (void)reportIgnoredIfModifiedSince:(id)a3 forSerialNumber:(id)a4 webService:(id)a5
{
  id v7 = a5;
  PDWebServiceError(2, v7, @"Server ignored the 'if-modified-since' header (%@) and returned the full unchanged pass data for serial number '%@'.", v8, v9, v10, v11, v12, (uint64_t)a3);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [(PDWebServicesCoordinator *)self reportError:v13 webService:v7 logToService:1];
}

- (void)reportMissingLastModifiedForSerialNumber:(id)a3 webService:(id)a4
{
  id v6 = a4;
  PDWebServiceError(1, v6, @"Server returned the pass data for serial number '%@' but did not provide a 'last-modified' header.", v7, v8, v9, v10, v11, (uint64_t)a3);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [(PDWebServicesCoordinator *)self reportError:v12 webService:v6 logToService:1];
}

- (void)reportUnchangedPassForPersonalizationTask:(id)a3
{
  id v4 = a3;
  id v12 = [v4 webService];
  id v5 = [v4 serialNumber];

  uint64_t v11 = PDWebServiceError(0, v12, @"Personalization request was issued for serial number '%@', but the pass was unchanged.", v6, v7, v8, v9, v10, (uint64_t)v5);

  [(PDWebServicesCoordinator *)self reportError:v11 webService:v12 logToService:1];
}

- (void)reportAbandonedTask:(id)a3 passTypeID:(id)a4
{
  id v5 = a3;
  unint64_t v6 = (unint64_t)a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = (id *)&PKAggDKeyWebServicesTaskTypeUpdate;
LABEL_6:
    unint64_t v8 = (unint64_t)*v7;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v7 = (id *)&PKAggDKeyWebServicesTaskTypeWhatChanged;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v5 requestedStatus];
    uint64_t v7 = (id *)&PKAggDKeyWebServicesTaskTypeRegister;
    if (v11 != (id)1) {
      uint64_t v7 = (id *)&PKAggDKeyWebServicesTaskTypeUnregister;
    }
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = (id *)&PKAggDKeyWebServicesTaskTypeLog;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = (id *)&PKAggDKeyWebServicesTaskTypePersonalize;
    goto LABEL_6;
  }
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = (id)objc_opt_class();
    __int16 v16 = 2112;
    unint64_t v17 = v6;
    id v13 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unexpected abandonded task of class: %@ for passTypeID: %@", (uint8_t *)&v14, 0x16u);
  }
  unint64_t v8 = 0;
LABEL_7:
  if (v6 | v8)
  {
    id v9 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
    uint64_t v10 = v9;
    if (v8) {
      [v9 setObject:v8 forKeyedSubscript:PKAggDKeyWebServicesTaskType];
    }
    if (v6) {
      [v10 setObject:v6 forKeyedSubscript:PKAggDKeyWebServicesPassType];
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  PKAnalyticsSendEvent();
}

- (void)reportError:(id)a3 webService:(id)a4 logToService:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (PKDeveloperLoggingEnabled() && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100517488();
  }
  uint64_t v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = PDErrorDescription();
    int v21 = 138412290;
    uint64_t v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v21, 0xCu);
  }
  id v12 = [v8 domain];
  unsigned int v13 = [v12 isEqualToString:@"PDTaskErrorDomain"];

  if (v13)
  {
    id v14 = [v8 code];
    id v15 = [v9 passTypeIdentifier];
    [(PDWebServicesCoordinator *)self _aggdLogTaskErrorCode:v14 passTypeID:v15];
  }
  else
  {
    __int16 v16 = [v8 domain];
    unsigned int v17 = [v16 isEqualToString:@"PDWebServiceErrorDomain"];

    if (!v17) {
      goto LABEL_11;
    }
    id v18 = [v8 code];
    id v15 = [v9 passTypeIdentifier];
    [(PDWebServicesCoordinator *)self _aggdLogWebServiceErrorCode:v18 passTypeID:v15];
  }

LABEL_11:
  if (v5)
  {
    uint64_t v19 = +[PDLogTask taskWithWebService:v9 error:v8];
    id v20 = [(PDWebServicesCoordinator *)self taskManager];
    [v20 performTask:v19];
  }
}

- (void)reportWarnings:(id)a3 webService:(id)a4 logToService:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_100347470;
  id v15 = &unk_1007473E0;
  __int16 v16 = self;
  id v9 = a4;
  id v17 = v9;
  [v8 enumerateObjectsUsingBlock:&v12];
  if (v5)
  {
    uint64_t v10 = +[PDLogTask taskWithWebService:warnings:](PDLogTask, "taskWithWebService:warnings:", v9, v8, v12, v13, v14, v15, v16);
    id v11 = [(PDWebServicesCoordinator *)self taskManager];
    [v11 performTask:v10];
  }
}

- (void)_aggdLogTaskWarningCode:(int64_t)a3 passTypeID:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    unint64_t v6 = 0;
  }
  else
  {
    id v7 = PKAggDKeyWebServicesErrorWarningInvalidPass;
    unint64_t v6 = v7;
    if (v5 && v7)
    {
      uint64_t v9 = PKAggDKeyWebServicesPassType;
      id v10 = v5;
      id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      PKAnalyticsSendEvent();
    }
  }
}

- (void)_aggdLogTaskErrorCode:(int64_t)a3 passTypeID:(id)a4
{
  id v5 = a4;
  if ((unint64_t)a3 > 5)
  {
    id v7 = 0;
  }
  else
  {
    id v6 = *(id *)*(&off_10074A0B8 + a3);
    id v7 = v6;
    if (v5 && v6)
    {
      uint64_t v9 = PKAggDKeyWebServicesPassType;
      id v10 = v5;
      id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      PKAnalyticsSendEvent();
    }
  }
}

- (void)_aggdLogWebServiceErrorCode:(int64_t)a3 passTypeID:(id)a4
{
  id v5 = a4;
  if ((unint64_t)a3 > 6)
  {
    id v7 = 0;
  }
  else
  {
    id v6 = *(id *)*(&off_10074A0E8 + a3);
    id v7 = v6;
    if (v5 && v6)
    {
      uint64_t v9 = PKAggDKeyWebServicesPassType;
      id v10 = v5;
      id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
      PKAnalyticsSendEvent();
    }
  }
}

- (void)_presentUnregistrationAlertForPassTypeID:(id)a3
{
  id v4 = a3;
  if (qword_100808E68 != -1) {
    dispatch_once(&qword_100808E68, &stru_100749FE8);
  }
  if (([(id)qword_100808E60 containsObject:v4] & 1) == 0)
  {
    id v5 = [(PDWebServicesCoordinator *)self _userNotificationParametersForPassTypeID:v4];
    if (v5)
    {
      [(id)qword_100808E60 addObject:v4];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1003479DC;
      v7[3] = &unk_10074A010;
      id v8 = (id)PDOSTransactionCreate("CFUserNotification");
      uint64_t v9 = self;
      id v10 = v4;
      id v6 = v8;
      +[PKUserNotificationAgent presentNotificationWithParameters:v5 responseHandler:v7];
    }
    else
    {
      [(PDWebServicesCoordinator *)self _unregisterPassesOfType:v4];
    }
  }
}

- (void)_unregisterPassesOfType:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(PDWebServicesCoordinator *)self databaseManager];
  id v6 = [v5 passesWithPassTypeID:v4];

  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        unint64_t v12 = (unint64_t)[v11 settings];
        if ((v12 & 2) != 0)
        {
          unint64_t v13 = v12 & 0xFFFFFFFFFFFFFFFDLL;
          id v14 = [(PDWebServicesCoordinator *)self databaseManager];
          [v14 updateSettings:v13 forPass:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (id)_userNotificationParametersForPassTypeID:(id)a3
{
  id v4 = a3;
  id v5 = +[NSCountedSet set];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = sub_100020B9C;
  v49 = sub_1000210C0;
  id v50 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = sub_100020B9C;
  v43 = sub_1000210C0;
  id v44 = 0;
  uint64_t v35 = 0;
  long long v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x2020000000;
  uint64_t v30 = 0;
  id v6 = [(PDWebServicesCoordinator *)self databaseManager];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  void v20[2] = sub_100347F8C;
  v20[3] = &unk_10074A038;
  id v7 = v5;
  id v21 = v7;
  uint64_t v22 = &v27;
  uint64_t v23 = &v35;
  uint64_t v24 = &v45;
  uint64_t v25 = &v31;
  uint64_t v26 = &v39;
  [v6 enumerateOrganizationNamesForPassTypeID:v4 withHandler:v20];

  unint64_t v8 = v28[3];
  uint64_t v9 = v36[3];
  uint64_t v10 = v32[3];
  id v11 = PKLocalizedString(@"WALLET");
  unint64_t v12 = PKLocalizedString(@"OK_BUTTON_TITLE");
  unint64_t v13 = PKLocalizedString(@"REENABLE_BUTTON_TITLE");
  if (v46[5])
  {
    uint64_t v14 = v40[5];
    if (v14)
    {
      if (v8 <= v10 + v9) {
        long long v15 = @"CUTOFF_MESSAGE_TWO_ORGANIZATIONS";
      }
      else {
        long long v15 = @"CUTOFF_MESSAGE_MORE_ORGANIZATIONS";
      }
      uint64_t v16 = PKLocalizedString(&v15->isa, @"%@%@", v46[5], v14);
    }
    else
    {
      uint64_t v16 = PKLocalizedString(@"CUTOFF_MESSAGE_ONE_ORGANIZATION", @"%@", v46[5]);
    }
    long long v17 = v16;
    v51[0] = kCFUserNotificationDefaultButtonTitleKey;
    v51[1] = kCFUserNotificationAlternateButtonTitleKey;
    v52[0] = v12;
    v52[1] = v13;
    v51[2] = kCFUserNotificationAlertMessageKey;
    v51[3] = kCFUserNotificationAlertHeaderKey;
    v52[2] = v16;
    v52[3] = v11;
    v51[4] = PKUserNotificationDontDismissOnUnlock;
    v52[4] = &__kCFBooleanTrue;
    long long v18 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:5];
  }
  else
  {
    long long v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100517510();
    }
    long long v18 = 0;
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v18;
}

- (double)_zeroIntervalForPassTypeID:(id)a3
{
  uint64_t v4 = qword_100808E80;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&qword_100808E80, &stru_10074A058);
  }
  id v6 = [(PDWebServicesCoordinator *)self databaseManager];
  id v7 = [v6 numberOfPassesOfType:v5];

  double result = *(double *)&qword_100808E78;
  if ((unint64_t)v7 <= 1) {
    unint64_t v9 = 1;
  }
  else {
    unint64_t v9 = (unint64_t)v7;
  }
  if (*(double *)&qword_100808E78 <= *(double *)&qword_100808E70 / (double)v9) {
    return *(double *)&qword_100808E70 / (double)v9;
  }
  return result;
}

- (double)_updatedFrequencyScoreForScore:(double)a3 lastPushDate:(id)a4 zeroInterval:(double)a5
{
  if (a4)
  {
    id v7 = a4;
    unint64_t v8 = +[NSDate date];
    [v8 timeIntervalSinceDate:v7];
    double v10 = v9;

    double v11 = (a5 - v10) / a5;
    double v12 = pow(v11, 3.0);
    if (v11 > 0.0) {
      double v11 = v12;
    }
    if (v11 + a3 >= 0.0) {
      a3 = v11 + a3;
    }
    else {
      a3 = 0.0;
    }
    unint64_t v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134218752;
      double v16 = v10 / 60.0;
      __int16 v17 = 2048;
      double v18 = a5 / 60.0;
      __int16 v19 = 2048;
      double v20 = v11;
      __int16 v21 = 2048;
      double v22 = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Push interval %g min; zero interval = %g min; score delta = %g; new score = %g",
        (uint8_t *)&v15,
        0x2Au);
    }
  }
  return a3;
}

- (int64_t)_rateLimitLevelForFrequencyScore:(double)a3
{
  if (qword_100808EA8 != -1) {
    dispatch_once(&qword_100808EA8, &stru_10074A078);
  }
  CFPreferencesSynchronize(@"com.apple.passd", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  if (PKDisableRateLimiting()) {
    return 0;
  }
  uint64_t v5 = qword_100808EA0;
  if (*(double *)&qword_100808EA0 < a3)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218240;
      double v12 = a3;
      __int16 v13 = 2048;
      uint64_t v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Frequency score %g exceeds cutoff threshold %g", (uint8_t *)&v11, 0x16u);
    }
    int64_t v4 = 4;
LABEL_20:

    return v4;
  }
  uint64_t v7 = qword_100808E98;
  if (*(double *)&qword_100808E98 < a3)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218240;
      double v12 = a3;
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Frequency score %g exceeds severe rate limit threshold %g", (uint8_t *)&v11, 0x16u);
    }
    int64_t v4 = 3;
    goto LABEL_20;
  }
  uint64_t v8 = qword_100808E90;
  if (*(double *)&qword_100808E90 < a3)
  {
    int64_t v4 = 2;
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218240;
      double v12 = a3;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Frequency score %g exceeds moderate rate limit threshold %g", (uint8_t *)&v11, 0x16u);
      int64_t v4 = 2;
    }
    goto LABEL_20;
  }
  uint64_t v9 = qword_100808E88;
  if (*(double *)&qword_100808E88 < a3)
  {
    id v6 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218240;
      double v12 = a3;
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Frequency score %g exceeds mild rate limit threshold %g", (uint8_t *)&v11, 0x16u);
    }
    int64_t v4 = 1;
    goto LABEL_20;
  }
  return 0;
}

- (id)_nextUpdateDateWithLastUpdateDate:(id)a3 rateLimitLevel:(int64_t)a4
{
  id v5 = a3;
  id v6 = v5;
  if (qword_100808EC8 == -1)
  {
    if (v5)
    {
LABEL_3:
      switch(a4)
      {
        case 0:
          id v7 = v6;
          goto LABEL_12;
        case 1:
          uint64_t v9 = qword_100808EB0;
          goto LABEL_9;
        case 2:
          uint64_t v9 = qword_100808EB8;
          goto LABEL_9;
        case 3:
          uint64_t v9 = qword_100808EC0;
LABEL_9:
          id v7 = [v6 dateByAddingTimeInterval:*(double *)&v9];
          goto LABEL_12;
        default:
          uint64_t v8 = 0;
          goto LABEL_13;
      }
    }
  }
  else
  {
    dispatch_once(&qword_100808EC8, &stru_10074A098);
    if (v6) {
      goto LABEL_3;
    }
  }
  id v7 = +[NSDate date];
LABEL_12:
  uint64_t v8 = v7;
LABEL_13:

  return v8;
}

@end