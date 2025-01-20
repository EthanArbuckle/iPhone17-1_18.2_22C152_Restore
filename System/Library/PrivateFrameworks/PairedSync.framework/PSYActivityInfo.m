@interface PSYActivityInfo
+ (BOOL)supportsSecureCoding;
+ (id)activityWithPlist:(id)a3;
+ (unint64_t)buddyStageValueForString:(id)a3;
- (NSArray)dependentBuddyStages;
- (NSArray)dependentServices;
- (NSArray)sessionTypes;
- (NSNumber)timeoutSeconds;
- (NSString)backboardPrelaunchBundleIdentifier;
- (NSString)label;
- (NSString)machServiceName;
- (NSString)priority;
- (PSYActivityInfo)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setBackboardPrelaunchBundleIdentifier:(id)a3;
- (void)setDependentBuddyStages:(id)a3;
- (void)setDependentServices:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMachServiceName:(id)a3;
- (void)setPriority:(id)a3;
- (void)setSessionTypes:(id)a3;
- (void)setTimeoutSeconds:(id)a3;
@end

@implementation PSYActivityInfo

+ (id)activityWithPlist:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKey:@"Label"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [v4 objectForKey:@"MachServiceName"];
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v7 = [v4 objectForKey:@"SessionTypes"];
      unint64_t v8 = 0x263EFF000uLL;
      v38 = (void *)v7;
      v39 = v6;
      if (v7)
      {
        v9 = (void *)v7;
        v41 = [MEMORY[0x263EFF980] array];
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        obuint64_t j = v9;
        uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v47;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v47 != v12) {
                objc_enumerationMutation(obj);
              }
              v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_24;
              }
              id v15 = v14;
              v16 = &unk_26C7FC6B0;
              if (([v15 isEqualToString:@"Initial"] & 1) == 0)
              {
                v16 = &unk_26C7FC6B0;
                if (([v15 isEqualToString:@"FullSync"] & 1) == 0)
                {
                  v16 = &unk_26C7FC6C8;
                  if (([v15 isEqualToString:@"Reunion"] & 1) == 0)
                  {
                    if ([v15 isEqualToString:@"Migration"]) {
                      v16 = &unk_26C7FC6E0;
                    }
                    else {
                      v16 = 0;
                    }
                  }
                }
              }

              if (!v16)
              {
LABEL_24:
                id v17 = 0;
                v6 = v39;
                goto LABEL_43;
              }
              [v41 addObject:v16];
            }
            uint64_t v11 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
            unint64_t v8 = 0x263EFF000;
            if (v11) {
              continue;
            }
            break;
          }
        }

        v6 = v39;
      }
      else
      {
        v41 = 0;
      }
      obuint64_t j = [v4 objectForKey:@"BackboardPrelaunchBundleIdentifier"];
      v18 = [v4 objectForKey:@"DependentServices"];
      v19 = [v4 objectForKey:@"DependentBuddyStages"];
      v20 = (void *)MEMORY[0x263EFFA08];
      v51[0] = @"InstallAllAvailableAppsSelection";
      v51[1] = @"Activation";
      v51[2] = @"AppleID";
      v51[3] = @"ApplePay";
      v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:4];
      v22 = [v20 setWithArray:v21];

      v23 = v19;
      id v24 = objc_alloc_init(*(Class *)(v8 + 2432));
      if ([v19 count])
      {
        v35 = v18;
        v36 = v5;
        id v37 = v4;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        v34 = v19;
        id v25 = v19;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v50 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v43;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v43 != v28) {
                objc_enumerationMutation(v25);
              }
              uint64_t v30 = *(void *)(*((void *)&v42 + 1) + 8 * j);
              if (objc_msgSend(v22, "containsObject:", v30, v34, v35, v36, v37, v38))
              {
                v31 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "buddyStageValueForString:", v30));
                [v24 addObject:v31];
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v50 count:16];
          }
          while (v27);
        }

        v5 = v36;
        id v4 = v37;
        v6 = v39;
        v23 = v34;
        v18 = v35;
      }
      id v17 = objc_alloc_init((Class)a1);
      [v17 setLabel:v5];
      [v17 setMachServiceName:v6];
      [v17 setBackboardPrelaunchBundleIdentifier:obj];
      [v17 setSessionTypes:v41];
      [v17 setDependentServices:v18];
      if ([v24 count]) {
        [v17 setDependentBuddyStages:v24];
      }
      v32 = objc_msgSend(v4, "objectForKey:", @"Timeout", v34, v35, v36, v37);
      if (v32)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v17 setTimeoutSeconds:v32];
        }
      }

LABEL_43:
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

+ (unint64_t)buddyStageValueForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"InstallAllAvailableAppsSelection"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"Activation"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"AppleID"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"ApplePay"])
  {
    unint64_t v4 = 4;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PSYActivityInfo *)self label];
  [v4 encodeObject:v5 forKey:@"Label"];

  v6 = [(PSYActivityInfo *)self machServiceName];
  [v4 encodeObject:v6 forKey:@"MachServiceName"];

  uint64_t v7 = [(PSYActivityInfo *)self priority];
  [v4 encodeObject:v7 forKey:@"Priority"];

  unint64_t v8 = [(PSYActivityInfo *)self backboardPrelaunchBundleIdentifier];
  [v4 encodeObject:v8 forKey:@"BackboardPrelaunchBundleIdentifier"];

  v9 = [(PSYActivityInfo *)self timeoutSeconds];
  [v4 encodeObject:v9 forKey:@"Timeout"];

  uint64_t v10 = [(PSYActivityInfo *)self sessionTypes];
  [v4 encodeObject:v10 forKey:@"SessionTypes"];

  uint64_t v11 = [(PSYActivityInfo *)self dependentServices];
  [v4 encodeObject:v11 forKey:@"DependentServices"];

  id v12 = [(PSYActivityInfo *)self dependentBuddyStages];
  [v4 encodeObject:v12 forKey:@"DependentBuddyStages"];
}

- (PSYActivityInfo)initWithCoder:(id)a3
{
  v35[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PSYActivityInfo;
  v5 = [(PSYActivityInfo *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Label"];
    label = v5->_label;
    v5->_label = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MachServiceName"];
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Priority"];
    priority = v5->_priority;
    v5->_priority = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BackboardPrelaunchBundleIdentifier"];
    backboardPrelaunchBundleIdentifier = v5->_backboardPrelaunchBundleIdentifier;
    v5->_backboardPrelaunchBundleIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Timeout"];
    timeoutSeconds = v5->_timeoutSeconds;
    v5->_timeoutSeconds = (NSNumber *)v14;

    v16 = (void *)MEMORY[0x263EFFA08];
    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    id v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
    v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"SessionTypes"];
    sessionTypes = v5->_sessionTypes;
    v5->_sessionTypes = (NSArray *)v19;

    v21 = (void *)MEMORY[0x263EFFA08];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
    v23 = [v21 setWithArray:v22];
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"DependentServices"];
    dependentServices = v5->_dependentServices;
    v5->_dependentServices = (NSArray *)v24;

    uint64_t v26 = (void *)MEMORY[0x263EFFA08];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];
    uint64_t v28 = [v26 setWithArray:v27];
    uint64_t v29 = [v4 decodeObjectOfClasses:v28 forKey:@"DependentBuddyStages"];
    dependentBuddyStages = v5->_dependentBuddyStages;
    v5->_dependentBuddyStages = (NSArray *)v29;
  }
  return v5;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(PSYActivityInfo *)self label];
  uint64_t v7 = [(PSYActivityInfo *)self machServiceName];
  uint64_t v8 = [v3 stringWithFormat:@"<%@ %p label=%@; machServiceName=%@>", v5, self, v6, v7];;

  return v8;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
}

- (NSString)priority
{
  return self->_priority;
}

- (void)setPriority:(id)a3
{
}

- (NSNumber)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(id)a3
{
}

- (NSArray)sessionTypes
{
  return self->_sessionTypes;
}

- (void)setSessionTypes:(id)a3
{
}

- (NSArray)dependentServices
{
  return self->_dependentServices;
}

- (void)setDependentServices:(id)a3
{
}

- (NSArray)dependentBuddyStages
{
  return self->_dependentBuddyStages;
}

- (void)setDependentBuddyStages:(id)a3
{
}

- (NSString)backboardPrelaunchBundleIdentifier
{
  return self->_backboardPrelaunchBundleIdentifier;
}

- (void)setBackboardPrelaunchBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backboardPrelaunchBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_dependentBuddyStages, 0);
  objc_storeStrong((id *)&self->_dependentServices, 0);
  objc_storeStrong((id *)&self->_sessionTypes, 0);
  objc_storeStrong((id *)&self->_timeoutSeconds, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end