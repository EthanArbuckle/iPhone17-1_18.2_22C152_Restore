@interface PluginPolicy
+ (BOOL)supportsSecureCoding;
- (BOOL)doesPolicyContainGroup:(id)a3;
- (BOOL)isValid;
- (NSMutableArray)groups;
- (NSMutableArray)matchingFilters;
- (NSString)pluginName;
- (PluginPolicy)initWithCoder:(id)a3;
- (PluginPolicy)initWithPolicyDictionary:(id)a3 pluginName:(id)a4;
- (double)remoteFirmwareCheckInterval;
- (id)getMatchingFilterWithName:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)parsePolicyDict:(id)a3;
- (void)setGroups:(id)a3;
- (void)setIsValid:(BOOL)a3;
- (void)setMatchingFilters:(id)a3;
- (void)setPluginName:(id)a3;
- (void)setRemoteFirmwareCheckInterval:(double)a3;
@end

@implementation PluginPolicy

- (PluginPolicy)initWithPolicyDictionary:(id)a3 pluginName:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PluginPolicy;
  v6 = [(PluginPolicy *)&v13 init];
  v6->isValid = 0;
  v6->remoteFirmwareCheckInterval = -1.0;
  v6->matchingFilters = 0;
  v6->pluginName = 0;
  if (a3 && a4)
  {
    v6->pluginName = (NSString *)a4;
    if (![a4 isEqualToString:@"com.apple.MobileAccessoryUpdater.EAUpdaterService"]) {
      goto LABEL_19;
    }
    v7 = (const void *)MGCopyAnswer();
    if (![(id)(id)CFMakeCollectable(v7) BOOLValue]) {
      goto LABEL_19;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = a4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Use Alternate Accessory List for %@", buf, 0xCu);
    }
    v8 = +[NSURL fileURLWithPath:@"/AppleInternal/usr/local/misc/SupportedAccessories-iAUP.plist"];
    if (!v8) {
      goto LABEL_19;
    }
    v9 = v8;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = a4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Loaded Alternate Accessory List for %@", buf, 0xCu);
    }
    v10 = +[NSDictionary dictionaryWithContentsOfURL:v9];
    if (!v10)
    {
LABEL_19:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = a4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Loaded Native Accessory List for %@", buf, 0xCu);
      }
      v10 = (NSDictionary *)a3;
    }
    [(PluginPolicy *)v6 parsePolicyDict:v10];
  }
  else
  {
    FudLog();
    v11 = v6;
    return 0;
  }
  return v6;
}

- (void)parsePolicyDict:(id)a3
{
  if (a3)
  {
    if (![a3 objectForKey:@"MobileAccessoryUpdaterProperties"]) {
      goto LABEL_74;
    }
    id v5 = [a3 objectForKey:@"MobileAccessoryUpdaterProperties"];
    self->isValid = 0;
    id v6 = [v5 objectForKey:@"RemoteFirmwareCheckInterval"];
    if (!v6) {
      goto LABEL_74;
    }
    v7 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_74;
    }
    [v7 doubleValue];
    self->remoteFirmwareCheckInterval = v8;
    id v9 = [v5 objectForKey:@"Groups"];
    if (!v9
      || (id v10 = v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (self->groups = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithArray:v10], (id v11 = objc_msgSend(v5, "objectForKey:", @"MatchingDevices")) == 0)|| (v12 = v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
LABEL_74:
      FudLog();
      return;
    }
    objc_super v13 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:2];
    self->matchingFilters = v13;
    if (v13)
    {
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id obj = v12;
      id v14 = [v12 countByEnumeratingWithState:&v61 objects:v65 count:16];
      if (!v14)
      {
LABEL_70:
        self->isValid = 1;
        return;
      }
      id v15 = v14;
      uint64_t v16 = *(void *)v62;
LABEL_12:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v62 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v61 + 1) + 8 * v17);
        if (!v18) {
          goto LABEL_74;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_74;
        }
        v19 = objc_alloc_init(MatchingFilter);
        id v20 = [v18 objectForKey:@"DeviceClass"];
        if (!v20) {
          goto LABEL_77;
        }
        id v21 = v20;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_77;
        }
        [(MatchingFilter *)v19 setFilterName:v21];
        id v22 = [v18 objectForKey:@"DeviceClassName"];
        if (!v22) {
          goto LABEL_77;
        }
        id v23 = v22;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_77;
        }
        [(MatchingFilter *)v19 setFilterReadableName:v23];
        id v24 = [v18 objectForKey:@"MatchingType"];
        if (!v24) {
          goto LABEL_77;
        }
        id v25 = v24;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_77;
        }
        [(MatchingFilter *)v19 setFilterType:v25];
        id v26 = [v18 objectForKey:@"NeedsBootstrapping"];
        if (!v26) {
          goto LABEL_77;
        }
        v27 = v26;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_77;
        }
        -[MatchingFilter setNeedsBootstrapping:](v19, "setNeedsBootstrapping:", [v27 BOOLValue]);
        id v28 = [v18 objectForKey:@"NeedsQueryDevices"];
        if (v28)
        {
          v29 = v28;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_77;
          }
          -[MatchingFilter setNeedsQueryDevices:](v19, "setNeedsQueryDevices:", [v29 BOOLValue]);
        }
        id v30 = [v18 objectForKey:@"NeedsPeriodicFirmwareCheck"];
        if (v30)
        {
          v31 = v30;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_77;
          }
          -[MatchingFilter setNeedsPeriodicFirmwareCheck:](v19, "setNeedsPeriodicFirmwareCheck:", [v31 BOOLValue]);
          v53 = v19;
          FudLog();
        }
        else
        {
          [(MatchingFilter *)v19 setNeedsPeriodicFirmwareCheck:0];
        }
        id v32 = objc_msgSend(v18, "objectForKey:", @"NeedsDeviceIdleCheck", v53);
        if (v32)
        {
          v33 = v32;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_77;
          }
          -[MatchingFilter setNeedsDeviceIdleCheck:](v19, "setNeedsDeviceIdleCheck:", [v33 BOOLValue]);
          v54 = v19;
          FudLog();
        }
        else
        {
          [(MatchingFilter *)v19 setNeedsDeviceIdleCheck:0];
        }
        id v34 = objc_msgSend(v18, "objectForKey:", @"NoPowerAssertion", v54);
        if (v34)
        {
          v35 = v34;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_77;
          }
          -[MatchingFilter setNoPowerAssertion:](v19, "setNoPowerAssertion:", [v35 BOOLValue]);
          v55 = v19;
          FudLog();
        }
        else
        {
          [(MatchingFilter *)v19 setNoPowerAssertion:0];
        }
        id v36 = objc_msgSend(v18, "objectForKey:", @"NeedsMayRebootCheck", v55);
        if (v36)
        {
          v37 = v36;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_77;
          }
          -[MatchingFilter setNeedsMayRebootCheck:](v19, "setNeedsMayRebootCheck:", [v37 BOOLValue]);
          v56 = v19;
          FudLog();
        }
        else
        {
          [(MatchingFilter *)v19 setNeedsMayRebootCheck:0];
        }
        id v38 = objc_msgSend(v18, "objectForKey:", @"NeedsInstallerCheck", v56);
        if (v38)
        {
          v39 = v38;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_77;
          }
          -[MatchingFilter setNeedsInstallerCheck:](v19, "setNeedsInstallerCheck:", [v39 BOOLValue]);
          v57 = v19;
          FudLog();
        }
        else
        {
          [(MatchingFilter *)v19 setNeedsInstallerCheck:0];
        }
        id v40 = objc_msgSend(v18, "objectForKey:", @"NeedsMultiUpdateCheck", v57);
        if (v40)
        {
          v41 = v40;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_77;
          }
          -[MatchingFilter setNeedsMultiUpdateCheck:](v19, "setNeedsMultiUpdateCheck:", [v41 BOOLValue]);
          v58 = v19;
          FudLog();
        }
        else
        {
          [(MatchingFilter *)v19 setNeedsMultiUpdateCheck:0];
        }
        id v42 = objc_msgSend(v18, "objectForKey:", @"EAOverHID", v58);
        if (v42)
        {
          v43 = v42;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_77;
          }
          -[MatchingFilter setEaOverHIDAccessory:](v19, "setEaOverHIDAccessory:", [v43 BOOLValue]);
          v59 = v19;
          FudLog();
        }
        else
        {
          [(MatchingFilter *)v19 setEaOverHIDAccessory:0];
        }
        id v44 = objc_msgSend(v18, "objectForKey:", @"MatchingDictionary", v59);
        if (!v44 || (id v45 = v44, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
LABEL_77:
          FudLog();
          if (v19) {

          }
          return;
        }
        [(MatchingFilter *)v19 setFilter:v45];
        v46 = (NSString *)[v18 objectForKey:@"ExclusionGroup"];
        if (!v46) {
          v46 = [(MatchingFilter *)v19 filterName];
        }
        [(MatchingFilter *)v19 setExclusionGroup:v46];
        id v47 = [v18 objectForKey:@"SilentUpdateNoUI"];
        if (v47)
        {
          v48 = v47;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_77;
          }
          id v49 = [v48 BOOLValue];
        }
        else
        {
          id v49 = 0;
        }
        [(MatchingFilter *)v19 setSilentUpdateNoUI:v49];
        id v50 = [v18 objectForKey:@"StopOnBootstrapFailure"];
        if (v50)
        {
          v51 = v50;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_77;
          }
          id v52 = [v51 BOOLValue];
        }
        else
        {
          id v52 = 0;
        }
        [(MatchingFilter *)v19 setStopOnBootstrapFailure:v52];
        [(NSMutableArray *)self->matchingFilters addObject:v19];

        if (v15 == (id)++v17)
        {
          id v15 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
          if (v15) {
            goto LABEL_12;
          }
          goto LABEL_70;
        }
      }
    }
  }
  FudLog();
}

- (id)getMatchingFilterWithName:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  matchingFilters = self->matchingFilters;
  id v5 = [(NSMutableArray *)matchingFilters countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(matchingFilters);
    }
    id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(objc_msgSend(v9, "filterName"), "isEqualToString:", a3)) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSMutableArray *)matchingFilters countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)doesPolicyContainGroup:(id)a3
{
  groups = self->groups;
  if (groups)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = [(NSMutableArray *)groups countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(groups);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isEqualToString:a3])
          {
            LOBYTE(v5) = 1;
            return (char)v5;
          }
        }
        id v6 = [(NSMutableArray *)groups countByEnumeratingWithState:&v10 objects:v14 count:16];
        LOBYTE(v5) = 0;
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    FudLog();
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  pluginName = self->pluginName;
  if (pluginName) {

  }
  groups = self->groups;
  if (groups) {

  }
  matchingFilters = self->matchingFilters;
  if (matchingFilters) {

  }
  v6.receiver = self;
  v6.super_class = (Class)PluginPolicy;
  [(PluginPolicy *)&v6 dealloc];
}

- (PluginPolicy)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PluginPolicy;
  v4 = [(PluginPolicy *)&v8 init];
  if (v4)
  {
    v4->pluginName = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"pluginName"];
    v4->isValid = [a3 decodeBoolForKey:@"isValid"];
    [a3 decodeDoubleForKey:@"remoteFirmwareCheckInterval"];
    v4->remoteFirmwareCheckInterval = v5;
    uint64_t v6 = objc_opt_class();
    v4->matchingFilters = (NSMutableArray *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0), @"matchingFilters");
    v9[0] = objc_opt_class();
    v9[1] = objc_opt_class();
    v4->groups = (NSMutableArray *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[NSSet setWithArray:](NSSet, "setWithArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2)), @"groups");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->pluginName forKey:@"pluginName"];
  [a3 encodeBool:self->isValid forKey:@"isValid"];
  [a3 encodeDouble:@"remoteFirmwareCheckInterval" forKey:self->remoteFirmwareCheckInterval];
  [a3 encodeObject:self->matchingFilters forKey:@"matchingFilters"];
  groups = self->groups;
  [a3 encodeObject:groups forKey:@"groups"];
}

- (NSString)pluginName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPluginName:(id)a3
{
}

- (BOOL)isValid
{
  return self->isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->isValid = a3;
}

- (double)remoteFirmwareCheckInterval
{
  return self->remoteFirmwareCheckInterval;
}

- (void)setRemoteFirmwareCheckInterval:(double)a3
{
  self->remoteFirmwareCheckInterval = a3;
}

- (NSMutableArray)matchingFilters
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMatchingFilters:(id)a3
{
}

- (NSMutableArray)groups
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setGroups:(id)a3
{
}

@end