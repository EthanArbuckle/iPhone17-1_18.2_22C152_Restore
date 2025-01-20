@interface RTUserNotification
+ (id)_getUNNotificationActionFromRTUserNotificationAction:(id)a3;
+ (id)destinationToString:(unint64_t)a3;
+ (id)interruptionLevelToString:(unint64_t)a3;
+ (unint64_t)UNNotificationInterruptionLevelFromRTNotificationInterruptionLevel:(unint64_t)a3;
- (BOOL)deleteNotificationWithError:(id *)a3;
- (NSMutableDictionary)actionIdentifierToActionMapper;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)notificationUUIDString;
- (OS_dispatch_queue)queue;
- (RTUserNotification)init;
- (RTUserNotification)initWithBundleIdentifier:(id)a3 notificationUUIDString:(id)a4;
- (UNUserNotificationCenter)notificationCenter;
- (void)postNotificationWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 footer:(id)a6 defaultActionUrl:(id)a7 categoryIdentifier:(id)a8 interruptionLevel:(unint64_t)a9 destination:(unint64_t)a10 actions:(id)a11 suppressDismissActionInCarPlay:(BOOL)a12 preventAutomaticRemoval:(BOOL)a13 expirationDate:(id)a14 userInfo:(id)a15 handler:(id)a16;
- (void)setActionIdentifierToActionMapper:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)setNotificationUUIDString:(id)a3;
- (void)setQueue:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation RTUserNotification

- (RTUserNotification)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithBundleIdentifier_notificationUUIDString_);
}

- (RTUserNotification)initWithBundleIdentifier:(id)a3 notificationUUIDString:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_12:
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v31 = "-[RTUserNotification initWithBundleIdentifier:notificationUUIDString:]";
      __int16 v32 = 1024;
      LODWORD(v33) = 52;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: notificationUUIDString (in %s:%d)", buf, 0x12u);
    }

    if (v8) {
      goto LABEL_4;
    }
LABEL_15:
    v24 = 0;
    goto LABEL_19;
  }
  v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v31 = "-[RTUserNotification initWithBundleIdentifier:notificationUUIDString:]";
    __int16 v32 = 1024;
    LODWORD(v33) = 51;
    _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: bundleIdentifier (in %s:%d)", buf, 0x12u);
  }

  if (!v10) {
    goto LABEL_12;
  }
LABEL_3:
  if (!v8) {
    goto LABEL_15;
  }
LABEL_4:
  v29.receiver = self;
  v29.super_class = (Class)RTUserNotification;
  v11 = [(RTUserNotification *)&v29 init];
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bundleIdentifier, a3);
    objc_storeStrong(p_isa + 3, a4);
    v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v31 = v15;
      __int16 v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, %@, creating notification center", buf, 0x16u);
    }
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:v8];
    id v18 = p_isa[1];
    p_isa[1] = (id)v17;

    [p_isa[1] setDelegate:p_isa];
    [p_isa[1] setWantsNotificationResponsesDelivered];
    v19 = p_isa;
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = (const char *)[v19 UTF8String];
    }
    else
    {
      id v25 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v19];
      v21 = (const char *)[v25 UTF8String];
    }
    dispatch_queue_t v26 = dispatch_queue_create(v21, v20);

    id v27 = v19[5];
    v19[5] = v26;
  }
  self = p_isa;
  v24 = self;
LABEL_19:

  return v24;
}

- (void)postNotificationWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 footer:(id)a6 defaultActionUrl:(id)a7 categoryIdentifier:(id)a8 interruptionLevel:(unint64_t)a9 destination:(unint64_t)a10 actions:(id)a11 suppressDismissActionInCarPlay:(BOOL)a12 preventAutomaticRemoval:(BOOL)a13 expirationDate:(id)a14 userInfo:(id)a15 handler:(id)a16
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v23 = a4;
  id v24 = a5;
  id v25 = a6;
  id v74 = a7;
  id v73 = a8;
  id v26 = a11;
  id v27 = a14;
  id v28 = a15;
  id v65 = a16;
  objc_super v29 = objc_opt_new();
  v30 = v29;
  if (v22) {
    [v29 setTitle:v22];
  }
  if (v23) {
    [v30 setSubtitle:v23];
  }
  if (v24) {
    [v30 setBody:v24];
  }
  if (v25) {
    [v30 setFooter:v25];
  }
  v69 = v25;
  if (v73) {
    [v30 setCategoryIdentifier:];
  }
  v70 = v24;
  if (v28) {
    [v30 setUserInfo:v28];
  }
  v67 = v28;
  if (v74)
  {
    v31 = [MEMORY[0x1E4F1CB10] URLWithString:v74];
    [v30 setDefaultActionURL:v31];

    __int16 v32 = [v30 userInfo];
    v33 = v32;
    if (!v32) {
      __int16 v32 = (void *)MEMORY[0x1E4F1CC08];
    }
    uint64_t v34 = (void *)[v32 mutableCopy];

    [v34 setObject:v74 forKeyedSubscript:@"defaultActionURLString"];
    v35 = (void *)[v34 copy];
    [v30 setUserInfo:v35];
  }
  v71 = v23;
  v72 = v22;
  v36 = [(RTUserNotification *)self bundleIdentifier];
  [v30 setDefaultActionBundleIdentifier:v36];

  [v30 setInterruptionLevel:[objc_opt_class() UNNotificationInterruptionLevelFromRTNotificationInterruptionLevel:a9]];
  v37 = [MEMORY[0x1E4F44640] defaultSound];
  [v30 setSound:v37];

  if (v27) {
    [v30 setExpirationDate:v27];
  }
  v64 = v30;
  id v68 = v27;
  v38 = objc_opt_new();
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = v26;
  uint64_t v39 = [obj countByEnumeratingWithState:&v85 objects:v99 count:16];
  if (v39)
  {
    uint64_t v40 = v39;
    uint64_t v41 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v86 != v41) {
          objc_enumerationMutation(obj);
        }
        v43 = *(void **)(*((void *)&v85 + 1) + 8 * i);
        v44 = (void *)MEMORY[0x1E016D870]();
        v45 = [(id)objc_opt_class() _getUNNotificationActionFromRTUserNotificationAction:v43];
        v46 = [(RTUserNotification *)self actionIdentifierToActionMapper];
        v47 = [v43 actionIdentifier];
        [v46 setObject:v43 forKeyedSubscript:v47];

        [v38 addObject:v45];
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v85 objects:v99 count:16];
    }
    while (v40);
  }

  if (a13) {
    uint64_t v48 = 131073;
  }
  else {
    uint64_t v48 = 1;
  }
  unint64_t v49 = a10;
  if ((a10 & 8) != 0)
  {
    if (a12) {
      uint64_t v48 = 1101004806;
    }
    else {
      uint64_t v48 = 27262982;
    }
    v52 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    SEL v51 = a2;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      v53 = (objc_class *)objc_opt_class();
      v54 = NSStringFromClass(v53);
      v55 = NSStringFromSelector(a2);
      v56 = [(id)objc_opt_class() destinationToString:8];
      uint64_t v57 = [obj count];
      *(_DWORD *)buf = 138413314;
      v58 = @"NO";
      v90 = v54;
      __int16 v91 = 2112;
      if (a12) {
        v58 = @"YES";
      }
      v92 = v55;
      __int16 v93 = 2112;
      v94 = v56;
      __int16 v95 = 2048;
      uint64_t v96 = v57;
      __int16 v97 = 2112;
      v98 = v58;
      _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_INFO, "%@, %@, one of the destinations, %@, actions count, %lu, suppressDismissAction, %@", buf, 0x34u);

      unint64_t v49 = a10;
    }

    v50 = v68;
  }
  else
  {
    v50 = v68;
    SEL v51 = a2;
  }
  v59 = [(RTUserNotification *)self notificationCenter];
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __230__RTUserNotification_postNotificationWithTitle_subtitle_body_footer_defaultActionUrl_categoryIdentifier_interruptionLevel_destination_actions_suppressDismissActionInCarPlay_preventAutomaticRemoval_expirationDate_userInfo_handler___block_invoke;
  v76[3] = &unk_1E6B95B60;
  id v77 = v73;
  id v78 = v38;
  v79 = self;
  id v80 = v64;
  SEL v83 = v51;
  unint64_t v84 = v49;
  id v81 = v65;
  uint64_t v82 = v48;
  id v60 = v65;
  id v61 = v64;
  id v62 = v38;
  id v63 = v73;
  [v59 getNotificationCategoriesWithCompletionHandler:v76];
}

void __230__RTUserNotification_postNotificationWithTitle_subtitle_body_footer_defaultActionUrl_categoryIdentifier_interruptionLevel_destination_actions_suppressDismissActionInCarPlay_preventAutomaticRemoval_expirationDate_userInfo_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [MEMORY[0x1E4F44600] categoryWithIdentifier:*(void *)(a1 + 32) actions:*(void *)(a1 + 40) intentIdentifiers:MEMORY[0x1E4F1CBF0] options:*(void *)(a1 + 72)];
  v5 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
  if (v3)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __230__RTUserNotification_postNotificationWithTitle_subtitle_body_footer_defaultActionUrl_categoryIdentifier_interruptionLevel_destination_actions_suppressDismissActionInCarPlay_preventAutomaticRemoval_expirationDate_userInfo_handler___block_invoke_2;
    v21[3] = &unk_1E6B95B38;
    id v22 = *(id *)(a1 + 32);
    v6 = [v3 objectsPassingTest:v21];
  }
  else
  {
    v6 = 0;
  }
  v7 = [v5 setByAddingObjectsFromSet:v6];
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    id v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v20 = NSStringFromSelector(*(SEL *)(a1 + 80));
    *(_DWORD *)buf = 138413314;
    id v24 = v19;
    __int16 v25 = 2112;
    id v26 = v20;
    __int16 v27 = 2112;
    id v28 = v5;
    __int16 v29 = 2112;
    v30 = v6;
    __int16 v31 = 2112;
    __int16 v32 = v7;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "%@, %@, updating notification categories, newCategories, %@, existingCategories, %@, supersetCategories, %@", buf, 0x34u);
  }
  id v9 = [*(id *)(a1 + 48) notificationCenter];
  [v9 setNotificationCategories:v7];

  v10 = (void *)MEMORY[0x1E4F44628];
  v11 = [*(id *)(a1 + 48) notificationUUIDString];
  v12 = [v10 requestWithIdentifier:v11 content:*(void *)(a1 + 56) trigger:0 destinations:*(void *)(a1 + 88)];

  v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = NSStringFromSelector(*(SEL *)(a1 + 80));
    *(_DWORD *)buf = 138412802;
    id v24 = v15;
    __int16 v25 = 2112;
    id v26 = v16;
    __int16 v27 = 2112;
    id v28 = v12;
    _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "%@, %@, posting notification request, %@", buf, 0x20u);
  }
  uint64_t v17 = [*(id *)(a1 + 48) notificationCenter];
  [v17 addNotificationRequest:v12 withCompletionHandler:*(void *)(a1 + 64)];
}

uint64_t __230__RTUserNotification_postNotificationWithTitle_subtitle_body_footer_defaultActionUrl_categoryIdentifier_interruptionLevel_destination_actions_suppressDismissActionInCarPlay_preventAutomaticRemoval_expirationDate_userInfo_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

- (BOOL)deleteNotificationWithError:(id *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    id v9 = [(RTUserNotification *)self notificationUUIDString];
    *(_DWORD *)buf = 138412802;
    v16 = v7;
    __int16 v17 = 2112;
    id v18 = v8;
    __int16 v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%@, %@, removing notification immediately for notificationUUID, %@", buf, 0x20u);
  }
  v10 = [(RTUserNotification *)self notificationCenter];
  v11 = [(RTUserNotification *)self notificationUUIDString];
  v14 = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  [v10 removeDeliveredNotificationsWithIdentifiers:v12];

  return 1;
}

+ (id)interruptionLevelToString:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"Default";
  }
  else {
    return off_1E6B95B80[a3 - 1];
  }
}

+ (id)destinationToString:(unint64_t)a3
{
  if (a3 - 1 > 7) {
    return @"None";
  }
  else {
    return off_1E6B95BA0[a3 - 1];
  }
}

+ (unint64_t)UNNotificationInterruptionLevelFromRTNotificationInterruptionLevel:(unint64_t)a3
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return qword_1DA0FF878[a3];
  }
}

+ (id)_getUNNotificationActionFromRTUserNotificationAction:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 url];

  v5 = (void *)MEMORY[0x1E4F445D8];
  v6 = [v3 actionIdentifier];
  v7 = [v3 title];
  if (v4)
  {
    id v8 = [v3 url];
    id v9 = (void *)MEMORY[0x1E4F445E8];
    v10 = [v3 iconWithSystemImageName];

    v11 = [v9 iconWithSystemImageName:v10];
    v12 = [v5 actionWithIdentifier:v6 title:v7 url:v8 options:0 icon:v11];
  }
  else
  {
    v13 = (void *)MEMORY[0x1E4F445E8];
    id v8 = [v3 iconWithSystemImageName];

    v10 = [v13 iconWithSystemImageName:v8];
    v12 = [v5 actionWithIdentifier:v6 title:v7 options:0 icon:v10];
  }

  return v12;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"bundle identifier, %@", self->_bundleIdentifier];
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = NSStringFromSelector(a2);
    int v10 = 138412546;
    v11 = v8;
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, %@, call before presenting notification", (uint8_t *)&v10, 0x16u);
  }
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(void))a5;
  __int16 v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (objc_class *)objc_opt_class();
    uint64_t v14 = NSStringFromClass(v13);
    NSStringFromSelector(a2);
    v15 = id v48 = v9;
    [v10 notification];
    v46 = v11;
    v16 = v47 = a2;
    [v16 request];
    v18 = __int16 v17 = self;
    __int16 v19 = [v18 content];
    v20 = [v19 title];
    uint64_t v21 = [v10 actionIdentifier];
    *(_DWORD *)buf = 138413058;
    v50 = v14;
    __int16 v51 = 2112;
    v52 = v15;
    __int16 v53 = 2112;
    v54 = v20;
    __int16 v55 = 2112;
    v56 = v21;
    _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%@, %@, response from notification with title, %@, actionIdentifier, %@", buf, 0x2Au);

    self = v17;
    v11 = v46;
    a2 = v47;

    id v9 = v48;
  }

  id v22 = [(RTUserNotification *)self actionIdentifierToActionMapper];
  id v23 = [v10 actionIdentifier];
  id v24 = [v22 objectForKeyedSubscript:v23];

  if (v24)
  {
    __int16 v25 = [(RTUserNotification *)self actionIdentifierToActionMapper];
    id v26 = [v10 actionIdentifier];
    __int16 v27 = [v25 objectForKeyedSubscript:v26];
    id v28 = [v27 handler];

    __int16 v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
    if (v28)
    {
      if (v30)
      {
        __int16 v31 = (objc_class *)objc_opt_class();
        __int16 v32 = NSStringFromClass(v31);
        uint64_t v33 = NSStringFromSelector(a2);
        uint64_t v34 = [v10 actionIdentifier];
        *(_DWORD *)buf = 138412802;
        v50 = v32;
        __int16 v51 = 2112;
        v52 = v33;
        __int16 v53 = 2112;
        v54 = v34;
        _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, "%@, %@, executing handler for actionIdentifier, %@", buf, 0x20u);
      }
      v35 = [(RTUserNotification *)self actionIdentifierToActionMapper];
      v36 = [v10 actionIdentifier];
      v37 = [v35 objectForKeyedSubscript:v36];
      v38 = [v37 handler];
      ((void (**)(void, id, id, void))v38)[2](v38, v9, v10, 0);

      __int16 v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        uint64_t v39 = (objc_class *)objc_opt_class();
        uint64_t v40 = NSStringFromClass(v39);
        uint64_t v41 = NSStringFromSelector(a2);
        v42 = [v10 actionIdentifier];
        *(_DWORD *)buf = 138412802;
        v50 = v40;
        __int16 v51 = 2112;
        v52 = v41;
        __int16 v53 = 2112;
        v54 = v42;
        v43 = "%@, %@, completed handler execution for actionIdentifier, %@";
LABEL_13:
        _os_log_impl(&dword_1D9BFA000, v29, OS_LOG_TYPE_INFO, v43, buf, 0x20u);
      }
    }
    else if (v30)
    {
      v45 = (objc_class *)objc_opt_class();
      uint64_t v40 = NSStringFromClass(v45);
      uint64_t v41 = NSStringFromSelector(a2);
      v42 = [v10 actionIdentifier];
      *(_DWORD *)buf = 138412802;
      v50 = v40;
      __int16 v51 = 2112;
      v52 = v41;
      __int16 v53 = 2112;
      v54 = v42;
      v43 = "%@, %@, missing handler for actionIdentifier, %@";
      goto LABEL_13;
    }
  }
  else
  {
    __int16 v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v44 = (objc_class *)objc_opt_class();
      uint64_t v40 = NSStringFromClass(v44);
      uint64_t v41 = NSStringFromSelector(a2);
      v42 = [v10 actionIdentifier];
      *(_DWORD *)buf = 138412802;
      v50 = v40;
      __int16 v51 = 2112;
      v52 = v41;
      __int16 v53 = 2112;
      v54 = v42;
      v43 = "%@, %@, mapper doesn't have an entry for the actionIdentifier, %@";
      goto LABEL_13;
    }
  }

  v11[2](v11);
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)notificationUUIDString
{
  return self->_notificationUUIDString;
}

- (void)setNotificationUUIDString:(id)a3
{
}

- (NSMutableDictionary)actionIdentifierToActionMapper
{
  return self->_actionIdentifierToActionMapper;
}

- (void)setActionIdentifierToActionMapper:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_actionIdentifierToActionMapper, 0);
  objc_storeStrong((id *)&self->_notificationUUIDString, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end