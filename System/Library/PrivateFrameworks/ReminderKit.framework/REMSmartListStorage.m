@interface REMSmartListStorage
+ (BOOL)supportsSecureCoding;
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPersisted;
- (BOOL)isUnsupported;
- (BOOL)shouldUpdateSectionsOrdering;
- (BOOL)showingLargeAttachments;
- (NSArray)unsavedSectionIDsOrdering;
- (NSData)filterData;
- (NSData)resolutionTokenMapData;
- (NSDate)pinnedDate;
- (NSSet)sectionIDsToUndelete;
- (NSString)badgeEmblem;
- (NSString)name;
- (NSString)smartListType;
- (NSString)sortingStyle;
- (NSUUID)mostRecentTargetTemplateIdentifier;
- (REMAccountCapabilities)accountCapabilities;
- (REMColor)color;
- (REMManualOrdering)manualOrdering;
- (REMMemberships)unsavedMembershipsOfRemindersInSections;
- (REMObjectID)accountID;
- (REMObjectID)objectID;
- (REMObjectID)parentAccountID;
- (REMObjectID)parentListID;
- (REMResolutionTokenMap)resolutionTokenMap;
- (REMSmartListStorage)initWithCoder:(id)a3;
- (REMSmartListStorage)initWithObjectID:(id)a3 accountID:(id)a4 smartListType:(id)a5;
- (id)cdKeyToStorageKeyMap;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)optionalObjectID;
- (int64_t)effectiveMinimumSupportedVersion;
- (int64_t)minimumSupportedVersion;
- (unint64_t)hash;
- (unint64_t)storeGeneration;
- (void)encodeWithCoder:(id)a3;
- (void)resolutionTokenMap;
- (void)setAccountCapabilities:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setBadgeEmblem:(id)a3;
- (void)setColor:(id)a3;
- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3;
- (void)setFilterData:(id)a3;
- (void)setIsPersisted:(BOOL)a3;
- (void)setManualOrdering:(id)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)setMostRecentTargetTemplateIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setObjectID:(id)a3;
- (void)setParentAccountID:(id)a3;
- (void)setParentListID:(id)a3;
- (void)setPinnedDate:(id)a3;
- (void)setResolutionTokenMap:(id)a3;
- (void)setResolutionTokenMapData:(id)a3;
- (void)setSectionIDsToUndelete:(id)a3;
- (void)setShouldUpdateSectionsOrdering:(BOOL)a3;
- (void)setShowingLargeAttachments:(BOOL)a3;
- (void)setSmartListType:(id)a3;
- (void)setSortingStyle:(id)a3;
- (void)setStoreGenerationIfNeeded:(unint64_t)a3;
- (void)setUnsavedMembershipsOfRemindersInSections:(id)a3;
- (void)setUnsavedSectionIDsOrdering:(id)a3;
@end

@implementation REMSmartListStorage

- (REMSmartListStorage)initWithObjectID:(id)a3 accountID:(id)a4 smartListType:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)REMSmartListStorage;
  v12 = [(REMSmartListStorage *)&v32 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_objectID, a3);
    objc_storeStrong((id *)&v13->_accountID, a4);
    objc_storeStrong((id *)&v13->_smartListType, a5);
    v14 = [[REMAccountCapabilities alloc] initWithAccountType:2];
    accountCapabilities = v13->_accountCapabilities;
    v13->_accountCapabilities = v14;

    manualOrdering = v13->_manualOrdering;
    v13->_manualOrdering = 0;

    v13->_showingLargeAttachments = 0;
    name = v13->_name;
    v13->_name = 0;

    color = v13->_color;
    v13->_color = 0;

    badgeEmblem = v13->_badgeEmblem;
    v13->_badgeEmblem = 0;

    pinnedDate = v13->_pinnedDate;
    v13->_pinnedDate = 0;

    mostRecentTargetTemplateIdentifier = v13->_mostRecentTargetTemplateIdentifier;
    v13->_mostRecentTargetTemplateIdentifier = 0;

    filterData = v13->_filterData;
    v13->_filterData = 0;

    v13->_shouldUpdateSectionsOrdering = 0;
    unsavedSectionIDsOrdering = v13->_unsavedSectionIDsOrdering;
    v13->_unsavedSectionIDsOrdering = 0;

    unsavedMembershipsOfRemindersInSections = v13->_unsavedMembershipsOfRemindersInSections;
    v13->_unsavedMembershipsOfRemindersInSections = 0;

    uint64_t v25 = [MEMORY[0x1E4F1CAD0] set];
    sectionIDsToUndelete = v13->_sectionIDsToUndelete;
    v13->_sectionIDsToUndelete = (NSSet *)v25;

    v13->_isPersisted = 0;
    v27 = objc_alloc_init(REMResolutionTokenMap);
    resolutionTokenMap = v13->_resolutionTokenMap;
    v13->_resolutionTokenMap = v27;

    uint64_t v29 = [MEMORY[0x1E4F1C9B8] data];
    resolutionTokenMapData = v13->_resolutionTokenMapData;
    v13->_resolutionTokenMapData = (NSData *)v29;

    v13->_storeGeneration = 0;
    v13->_copyGeneration = 0;
  }

  return v13;
}

- (id)optionalObjectID
{
  return self->_objectID;
}

- (REMSmartListStorage)initWithCoder:(id)a3
{
  id v4 = a3;
  v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
  uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
  v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentAccountID"];
  id v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentListID"];
  v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"smartListType"];
  id obj = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manualOrdering"];
  char v28 = [v4 decodeBoolForKey:@"showingLargeAttachments"];
  id v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  id v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
  id v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"badgeEmblem"];
  id v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"filterData"];
  char v27 = [v4 decodeBoolForKey:@"isPersisted"];
  v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sortingStyle"];
  id v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pinnedDate"];
  id v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mostRecentTargetTemplateIdentifier"];
  char v5 = [v4 decodeBoolForKey:@"shouldUpdateSectionsOrdering"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"unsavedSectionIDsOrdering"];

  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unsavedMembershipsOfRemindersInSections"];
  id v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"sectionIDsToUndelete"];

  v15 = 0;
  if (v30)
  {
    v16 = (void *)v29;
    if (v29 && v41)
    {
      v17 = -[REMSmartListStorage initWithObjectID:accountID:smartListType:](self, "initWithObjectID:accountID:smartListType:", v30, v29);
      v18 = v17;
      if (v17)
      {
        objc_storeStrong((id *)&v17->_manualOrdering, obj);
        v18->_isPersisted = v27;
        v18->_showingLargeAttachments = v28;
        objc_storeStrong((id *)&v18->_name, v37);
        objc_storeStrong((id *)&v18->_color, v36);
        objc_storeStrong((id *)&v18->_badgeEmblem, v35);
        objc_storeStrong((id *)&v18->_filterData, v34);
        objc_storeStrong((id *)&v18->_parentAccountID, v40);
        objc_storeStrong((id *)&v18->_parentListID, v39);
        objc_storeStrong((id *)&v18->_pinnedDate, v32);
        objc_storeStrong((id *)&v18->_mostRecentTargetTemplateIdentifier, v31);
        v18->_shouldUpdateSectionsOrdering = v5;
        objc_storeStrong((id *)&v18->_unsavedSectionIDsOrdering, v9);
        objc_storeStrong((id *)&v18->_unsavedMembershipsOfRemindersInSections, v10);
        uint64_t v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
        sectionIDsToUndelete = v18->_sectionIDsToUndelete;
        v18->_sectionIDsToUndelete = (NSSet *)v19;

        [(REMSmartListStorage *)v18 setSortingStyle:v33];
        v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolutionTokenMapData"];
        v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolutionTokenMap"];
        if (v22)
        {
          objc_storeStrong((id *)&v18->_resolutionTokenMap, v22);
          resolutionTokenMapData = v18->_resolutionTokenMapData;
          v18->_resolutionTokenMapData = 0;
        }
        else
        {
          resolutionTokenMap = v18->_resolutionTokenMap;
          v18->_resolutionTokenMap = 0;

          uint64_t v25 = v21;
          resolutionTokenMapData = v18->_resolutionTokenMapData;
          v18->_resolutionTokenMapData = v25;
        }

        -[REMSmartListStorage setMinimumSupportedVersion:](v18, "setMinimumSupportedVersion:", [v4 decodeIntegerForKey:@"minimumSupportedVersion"]);
        -[REMSmartListStorage setEffectiveMinimumSupportedVersion:](v18, "setEffectiveMinimumSupportedVersion:", [v4 decodeIntegerForKey:@"effectiveMinimumSupportedVersion"]);

        v16 = (void *)v29;
      }
      self = v18;
      v15 = self;
    }
  }
  else
  {
    v16 = (void *)v29;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v23 = a3;
  id v4 = [(REMSmartListStorage *)self objectID];
  [v23 encodeObject:v4 forKey:@"objectID"];

  char v5 = [(REMSmartListStorage *)self accountID];
  [v23 encodeObject:v5 forKey:@"accountID"];

  v6 = [(REMSmartListStorage *)self parentAccountID];
  [v23 encodeObject:v6 forKey:@"parentAccountID"];

  uint64_t v7 = [(REMSmartListStorage *)self parentListID];
  [v23 encodeObject:v7 forKey:@"parentListID"];

  v8 = [(REMSmartListStorage *)self smartListType];
  [v23 encodeObject:v8 forKey:@"smartListType"];

  id v9 = [(REMSmartListStorage *)self manualOrdering];
  [v23 encodeObject:v9 forKey:@"manualOrdering"];

  objc_msgSend(v23, "encodeBool:forKey:", -[REMSmartListStorage showingLargeAttachments](self, "showingLargeAttachments"), @"showingLargeAttachments");
  id v10 = [(REMSmartListStorage *)self name];
  [v23 encodeObject:v10 forKey:@"name"];

  id v11 = [(REMSmartListStorage *)self color];
  [v23 encodeObject:v11 forKey:@"color"];

  uint64_t v12 = [(REMSmartListStorage *)self badgeEmblem];
  [v23 encodeObject:v12 forKey:@"badgeEmblem"];

  v13 = [(REMSmartListStorage *)self filterData];
  [v23 encodeObject:v13 forKey:@"filterData"];

  objc_msgSend(v23, "encodeBool:forKey:", -[REMSmartListStorage isPersisted](self, "isPersisted"), @"isPersisted");
  v14 = [(REMSmartListStorage *)self sortingStyle];
  [v23 encodeObject:v14 forKey:@"sortingStyle"];

  v15 = [(REMSmartListStorage *)self pinnedDate];
  [v23 encodeObject:v15 forKey:@"pinnedDate"];

  v16 = [(REMSmartListStorage *)self mostRecentTargetTemplateIdentifier];
  [v23 encodeObject:v16 forKey:@"mostRecentTargetTemplateIdentifier"];

  objc_msgSend(v23, "encodeBool:forKey:", -[REMSmartListStorage shouldUpdateSectionsOrdering](self, "shouldUpdateSectionsOrdering"), @"shouldUpdateSectionsOrdering");
  v17 = [(REMSmartListStorage *)self unsavedSectionIDsOrdering];
  [v23 encodeObject:v17 forKey:@"unsavedSectionIDsOrdering"];

  v18 = [(REMSmartListStorage *)self unsavedMembershipsOfRemindersInSections];
  [v23 encodeObject:v18 forKey:@"unsavedMembershipsOfRemindersInSections"];

  uint64_t v19 = [(REMSmartListStorage *)self sectionIDsToUndelete];
  v20 = [v19 allObjects];
  [v23 encodeObject:v20 forKey:@"sectionIDsToUndelete"];

  resolutionTokenMap = self->_resolutionTokenMap;
  if (resolutionTokenMap)
  {
    [v23 encodeObject:resolutionTokenMap forKey:@"resolutionTokenMap"];
    [v23 encodeObject:0 forKey:@"resolutionTokenMapData"];
  }
  else
  {
    [v23 encodeObject:0 forKey:@"resolutionTokenMap"];
    v22 = [(REMSmartListStorage *)self resolutionTokenMapData];
    [v23 encodeObject:v22 forKey:@"resolutionTokenMapData"];
  }
  objc_msgSend(v23, "encodeInteger:forKey:", -[REMSmartListStorage minimumSupportedVersion](self, "minimumSupportedVersion"), @"minimumSupportedVersion");
  objc_msgSend(v23, "encodeInteger:forKey:", -[REMSmartListStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"), @"effectiveMinimumSupportedVersion");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v4 = (REMSmartListStorage *)a3;
  char v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [(REMSmartListStorage *)self objectID];
      uint64_t v8 = [(REMSmartListStorage *)v6 objectID];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        id v9 = (void *)v8;
        id v10 = [(REMSmartListStorage *)self objectID];
        id v11 = [(REMSmartListStorage *)v6 objectID];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_86;
        }
      }
      v14 = [(REMSmartListStorage *)self accountID];
      uint64_t v15 = [(REMSmartListStorage *)v6 accountID];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        v16 = (void *)v15;
        v17 = [(REMSmartListStorage *)self accountID];
        v18 = [(REMSmartListStorage *)v6 accountID];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_86;
        }
      }
      v20 = [(REMSmartListStorage *)self parentAccountID];
      uint64_t v21 = [(REMSmartListStorage *)v6 parentAccountID];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        id v23 = [(REMSmartListStorage *)self parentAccountID];
        v24 = [(REMSmartListStorage *)v6 parentAccountID];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_86;
        }
      }
      v26 = [(REMSmartListStorage *)self parentListID];
      uint64_t v27 = [(REMSmartListStorage *)v6 parentListID];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        char v28 = (void *)v27;
        uint64_t v29 = [(REMSmartListStorage *)self parentListID];
        v30 = [(REMSmartListStorage *)v6 parentListID];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_86;
        }
      }
      id v32 = [(REMSmartListStorage *)self smartListType];
      uint64_t v33 = [(REMSmartListStorage *)v6 smartListType];
      if (v32 == (void *)v33)
      {
      }
      else
      {
        id v34 = (void *)v33;
        id v35 = [(REMSmartListStorage *)self smartListType];
        id v36 = [(REMSmartListStorage *)v6 smartListType];
        int v37 = [v35 isEqual:v36];

        if (!v37) {
          goto LABEL_86;
        }
      }
      v38 = [(REMSmartListStorage *)self manualOrdering];
      uint64_t v39 = [(REMSmartListStorage *)v6 manualOrdering];
      if (v38 == (void *)v39)
      {
      }
      else
      {
        v40 = (void *)v39;
        v41 = [(REMSmartListStorage *)self manualOrdering];
        v42 = [(REMSmartListStorage *)v6 manualOrdering];
        int v43 = [v41 isEqual:v42];

        if (!v43) {
          goto LABEL_86;
        }
      }
      BOOL v44 = [(REMSmartListStorage *)self showingLargeAttachments];
      if (v44 == [(REMSmartListStorage *)v6 showingLargeAttachments])
      {
        v45 = [(REMSmartListStorage *)self name];
        uint64_t v46 = [(REMSmartListStorage *)v6 name];
        if (v45 == (void *)v46)
        {
        }
        else
        {
          v47 = (void *)v46;
          v48 = [(REMSmartListStorage *)self name];
          v49 = [(REMSmartListStorage *)v6 name];
          int v50 = [v48 isEqual:v49];

          if (!v50) {
            goto LABEL_86;
          }
        }
        v51 = [(REMSmartListStorage *)self color];
        uint64_t v52 = [(REMSmartListStorage *)v6 color];
        if (v51 == (void *)v52)
        {
        }
        else
        {
          v53 = (void *)v52;
          v54 = [(REMSmartListStorage *)self color];
          v55 = [(REMSmartListStorage *)v6 color];
          int v56 = [v54 isEqual:v55];

          if (!v56) {
            goto LABEL_86;
          }
        }
        v57 = [(REMSmartListStorage *)self badgeEmblem];
        uint64_t v58 = [(REMSmartListStorage *)v6 badgeEmblem];
        if (v57 == (void *)v58)
        {
        }
        else
        {
          v59 = (void *)v58;
          v60 = [(REMSmartListStorage *)self badgeEmblem];
          v61 = [(REMSmartListStorage *)v6 badgeEmblem];
          int v62 = [v60 isEqual:v61];

          if (!v62) {
            goto LABEL_86;
          }
        }
        v63 = [(REMSmartListStorage *)self filterData];
        uint64_t v64 = [(REMSmartListStorage *)v6 filterData];
        if (v63 == (void *)v64)
        {
        }
        else
        {
          v65 = (void *)v64;
          v66 = [(REMSmartListStorage *)self filterData];
          v67 = [(REMSmartListStorage *)v6 filterData];
          int v68 = [v66 isEqual:v67];

          if (!v68) {
            goto LABEL_86;
          }
        }
        BOOL v69 = [(REMSmartListStorage *)self isPersisted];
        if (v69 == [(REMSmartListStorage *)v6 isPersisted])
        {
          v70 = [(REMSmartListStorage *)self sortingStyle];
          uint64_t v71 = [(REMSmartListStorage *)v6 sortingStyle];
          if (v70 == (void *)v71)
          {
          }
          else
          {
            v72 = (void *)v71;
            v73 = [(REMSmartListStorage *)self sortingStyle];
            v74 = [(REMSmartListStorage *)v6 sortingStyle];
            int v75 = [v73 isEqual:v74];

            if (!v75) {
              goto LABEL_86;
            }
          }
          v76 = [(REMSmartListStorage *)self pinnedDate];
          uint64_t v77 = [(REMSmartListStorage *)v6 pinnedDate];
          if (v76 == (void *)v77)
          {
          }
          else
          {
            v78 = (void *)v77;
            v79 = [(REMSmartListStorage *)self pinnedDate];
            v80 = [(REMSmartListStorage *)v6 pinnedDate];
            int v81 = [v79 isEqual:v80];

            if (!v81) {
              goto LABEL_86;
            }
          }
          v82 = [(REMSmartListStorage *)self mostRecentTargetTemplateIdentifier];
          uint64_t v83 = [(REMSmartListStorage *)v6 mostRecentTargetTemplateIdentifier];
          if (v82 == (void *)v83)
          {
          }
          else
          {
            v84 = (void *)v83;
            v85 = [(REMSmartListStorage *)self mostRecentTargetTemplateIdentifier];
            v86 = [(REMSmartListStorage *)v6 mostRecentTargetTemplateIdentifier];
            int v87 = [v85 isEqual:v86];

            if (!v87) {
              goto LABEL_86;
            }
          }
          BOOL v88 = [(REMSmartListStorage *)self shouldUpdateSectionsOrdering];
          if (v88 == [(REMSmartListStorage *)v6 shouldUpdateSectionsOrdering])
          {
            v89 = [(REMSmartListStorage *)self unsavedSectionIDsOrdering];
            uint64_t v90 = [(REMSmartListStorage *)v6 unsavedSectionIDsOrdering];
            if (v89 == (void *)v90)
            {
            }
            else
            {
              v91 = (void *)v90;
              v92 = [(REMSmartListStorage *)self unsavedSectionIDsOrdering];
              v93 = [(REMSmartListStorage *)v6 unsavedSectionIDsOrdering];
              int v94 = [v92 isEqual:v93];

              if (!v94) {
                goto LABEL_86;
              }
            }
            v95 = [(REMSmartListStorage *)self unsavedMembershipsOfRemindersInSections];
            uint64_t v96 = [(REMSmartListStorage *)v6 unsavedMembershipsOfRemindersInSections];
            if (v95 == (void *)v96)
            {
            }
            else
            {
              v97 = (void *)v96;
              v98 = [(REMSmartListStorage *)self unsavedMembershipsOfRemindersInSections];
              v99 = [(REMSmartListStorage *)v6 unsavedMembershipsOfRemindersInSections];
              int v100 = [v98 isEqual:v99];

              if (!v100) {
                goto LABEL_86;
              }
            }
            v101 = [(REMSmartListStorage *)self sectionIDsToUndelete];
            uint64_t v102 = [(REMSmartListStorage *)v6 sectionIDsToUndelete];
            if (v101 == (void *)v102)
            {
            }
            else
            {
              v103 = (void *)v102;
              v104 = [(REMSmartListStorage *)self sectionIDsToUndelete];
              v105 = [(REMSmartListStorage *)v6 sectionIDsToUndelete];
              int v106 = [v104 isEqual:v105];

              if (!v106) {
                goto LABEL_86;
              }
            }
            v107 = [(REMSmartListStorage *)self accountCapabilities];
            uint64_t v108 = [(REMSmartListStorage *)v6 accountCapabilities];
            if (v107 == (void *)v108)
            {
            }
            else
            {
              v109 = (void *)v108;
              v110 = [(REMSmartListStorage *)self accountCapabilities];
              v111 = [(REMSmartListStorage *)v6 accountCapabilities];
              int v112 = [v110 isEqual:v111];

              if (!v112) {
                goto LABEL_86;
              }
            }
            if (!self->_resolutionTokenMap || v6->_resolutionTokenMap)
            {
              v113 = +[REMLogStore read];
              if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
              {
                v123 = (objc_class *)objc_opt_class();
                v124 = NSStringFromClass(v123);
                resolutionTokenMap = self->_resolutionTokenMap;
                v126 = v6->_resolutionTokenMap;
                int v127 = 138543874;
                v128 = v124;
                __int16 v129 = 2112;
                v130 = resolutionTokenMap;
                __int16 v131 = 2112;
                v132 = v126;
                _os_log_error_impl(&dword_1B9AA2000, v113, OS_LOG_TYPE_ERROR, "You are about to trigger decoding the resolution token map from JSON data. This is probably not what you want for performance to trigger it from -isEqual:, unless you are running Tests then it's fine {class: %{public}@, self-map: %@, other-map: %@}", (uint8_t *)&v127, 0x20u);
              }
            }
            v114 = [(REMSmartListStorage *)self resolutionTokenMap];
            uint64_t v115 = [(REMSmartListStorage *)v6 resolutionTokenMap];
            if (v114 == (void *)v115)
            {
            }
            else
            {
              v116 = (void *)v115;
              v117 = [(REMSmartListStorage *)self resolutionTokenMap];
              v118 = [(REMSmartListStorage *)v6 resolutionTokenMap];
              int v119 = [v117 isEqual:v118];

              if (!v119) {
                goto LABEL_86;
              }
            }
            int64_t v120 = [(REMSmartListStorage *)self minimumSupportedVersion];
            if (v120 == [(REMSmartListStorage *)v6 minimumSupportedVersion])
            {
              int64_t v121 = [(REMSmartListStorage *)self effectiveMinimumSupportedVersion];
              BOOL v13 = v121 == [(REMSmartListStorage *)v6 effectiveMinimumSupportedVersion];
LABEL_87:

              goto LABEL_88;
            }
          }
        }
      }
    }
LABEL_86:
    BOOL v13 = 0;
    goto LABEL_87;
  }
  BOOL v13 = 1;
LABEL_88:

  return v13;
}

- (unint64_t)hash
{
  v2 = [(REMSmartListStorage *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  char v5 = [(REMSmartListStorage *)self objectID];
  v6 = [(REMSmartListStorage *)self smartListType];
  uint64_t v7 = [(REMSmartListStorage *)self sortingStyle];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p objectID: %@, smartListType: %@, sortingStyle: %@>", v4, self, v5, v6, v7];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [REMSmartListStorage alloc];
  char v5 = [(REMSmartListStorage *)self objectID];
  v6 = [(REMSmartListStorage *)self accountID];
  uint64_t v7 = [(REMSmartListStorage *)self smartListType];
  uint64_t v8 = [(REMSmartListStorage *)v4 initWithObjectID:v5 accountID:v6 smartListType:v7];

  id v9 = [(REMSmartListStorage *)self parentAccountID];
  [(REMSmartListStorage *)v8 setParentAccountID:v9];

  id v10 = [(REMSmartListStorage *)self parentListID];
  [(REMSmartListStorage *)v8 setParentListID:v10];

  id v11 = [(REMSmartListStorage *)self manualOrdering];
  int v12 = (void *)[v11 copy];
  [(REMSmartListStorage *)v8 setManualOrdering:v12];

  [(REMSmartListStorage *)v8 setIsPersisted:[(REMSmartListStorage *)self isPersisted]];
  [(REMSmartListStorage *)v8 setShowingLargeAttachments:[(REMSmartListStorage *)self showingLargeAttachments]];
  BOOL v13 = [(REMSmartListStorage *)self name];
  [(REMSmartListStorage *)v8 setName:v13];

  v14 = [(REMSmartListStorage *)self color];
  [(REMSmartListStorage *)v8 setColor:v14];

  uint64_t v15 = [(REMSmartListStorage *)self badgeEmblem];
  [(REMSmartListStorage *)v8 setBadgeEmblem:v15];

  v16 = [(REMSmartListStorage *)self filterData];
  [(REMSmartListStorage *)v8 setFilterData:v16];

  v17 = [(REMSmartListStorage *)self sortingStyle];
  [(REMSmartListStorage *)v8 setSortingStyle:v17];

  v18 = [(REMSmartListStorage *)self pinnedDate];
  [(REMSmartListStorage *)v8 setPinnedDate:v18];

  int v19 = [(REMSmartListStorage *)self mostRecentTargetTemplateIdentifier];
  [(REMSmartListStorage *)v8 setMostRecentTargetTemplateIdentifier:v19];

  [(REMSmartListStorage *)v8 setShouldUpdateSectionsOrdering:[(REMSmartListStorage *)self shouldUpdateSectionsOrdering]];
  v20 = [(REMSmartListStorage *)self unsavedSectionIDsOrdering];
  uint64_t v21 = (void *)[v20 copy];
  [(REMSmartListStorage *)v8 setUnsavedSectionIDsOrdering:v21];

  v22 = [(REMSmartListStorage *)self unsavedMembershipsOfRemindersInSections];
  id v23 = (void *)[v22 copy];
  [(REMSmartListStorage *)v8 setUnsavedMembershipsOfRemindersInSections:v23];

  v24 = [(REMSmartListStorage *)self sectionIDsToUndelete];
  int v25 = (void *)[v24 copy];
  [(REMSmartListStorage *)v8 setSectionIDsToUndelete:v25];

  uint64_t v26 = [(REMResolutionTokenMap *)self->_resolutionTokenMap copy];
  resolutionTokenMap = v8->_resolutionTokenMap;
  v8->_resolutionTokenMap = (REMResolutionTokenMap *)v26;

  char v28 = [(REMSmartListStorage *)self resolutionTokenMapData];
  [(REMSmartListStorage *)v8 setResolutionTokenMapData:v28];

  [(REMSmartListStorage *)v8 setMinimumSupportedVersion:[(REMSmartListStorage *)self minimumSupportedVersion]];
  [(REMSmartListStorage *)v8 setEffectiveMinimumSupportedVersion:[(REMSmartListStorage *)self effectiveMinimumSupportedVersion]];
  v8->_storeGeneration = self->_storeGeneration;
  v8->_copyGeneration = self->_copyGeneration + 1;
  return v8;
}

+ (id)newObjectID
{
  unint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v4 = [a1 objectIDWithUUID:v3];

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  char v5 = [a1 cdEntityName];
  v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDSmartList";
}

- (BOOL)isUnsupported
{
  uint64_t v2 = [(REMSmartListStorage *)self effectiveMinimumSupportedVersion];

  return rem_isUnsupportedVersionByRuntime(v2);
}

- (id)cdKeyToStorageKeyMap
{
  if (cdKeyToStorageKeyMap_onceToken_0 != -1) {
    dispatch_once(&cdKeyToStorageKeyMap_onceToken_0, &__block_literal_global_34);
  }
  uint64_t v2 = (void *)cdKeyToStorageKeyMap_mapping_0;

  return v2;
}

- (REMResolutionTokenMap)resolutionTokenMap
{
  p_resolutionTokenMap = &self->_resolutionTokenMap;
  id v4 = self->_resolutionTokenMap;
  if (v4)
  {
    char v5 = v4;
  }
  else
  {
    v6 = [(REMSmartListStorage *)self resolutionTokenMapData];
    if (!v6)
    {
      uint64_t v7 = +[REMLogStore read];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(REMSmartListStorage *)(uint64_t)self resolutionTokenMap];
      }
    }
    uint64_t v8 = [(REMSmartListStorage *)self cdKeyToStorageKeyMap];
    id v9 = +[REMResolutionTokenMap resolutionTokenMapWithJSONData:v6 keyMap:v8];

    objc_storeStrong((id *)p_resolutionTokenMap, v9);
    char v5 = v9;
  }

  return v5;
}

- (unint64_t)storeGeneration
{
  return self->_storeGeneration;
}

- (void)setStoreGenerationIfNeeded:(unint64_t)a3
{
  if (!self->_storeGeneration) {
    self->_storeGeneration = a3;
  }
}

- (NSString)sortingStyle
{
  return self->sortingStyle;
}

- (void)setSortingStyle:(id)a3
{
}

- (NSDate)pinnedDate
{
  return self->_pinnedDate;
}

- (void)setPinnedDate:(id)a3
{
}

- (int64_t)minimumSupportedVersion
{
  return self->minimumSupportedVersion;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  self->minimumSupportedVersion = a3;
}

- (int64_t)effectiveMinimumSupportedVersion
{
  return self->effectiveMinimumSupportedVersion;
}

- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3
{
  self->effectiveMinimumSupportedVersion = a3;
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
}

- (NSString)smartListType
{
  return self->_smartListType;
}

- (void)setSmartListType:(id)a3
{
}

- (REMAccountCapabilities)accountCapabilities
{
  return self->_accountCapabilities;
}

- (void)setAccountCapabilities:(id)a3
{
}

- (REMManualOrdering)manualOrdering
{
  return self->_manualOrdering;
}

- (void)setManualOrdering:(id)a3
{
}

- (NSUUID)mostRecentTargetTemplateIdentifier
{
  return self->_mostRecentTargetTemplateIdentifier;
}

- (void)setMostRecentTargetTemplateIdentifier:(id)a3
{
}

- (BOOL)shouldUpdateSectionsOrdering
{
  return self->_shouldUpdateSectionsOrdering;
}

- (void)setShouldUpdateSectionsOrdering:(BOOL)a3
{
  self->_shouldUpdateSectionsOrdering = a3;
}

- (NSArray)unsavedSectionIDsOrdering
{
  return self->_unsavedSectionIDsOrdering;
}

- (void)setUnsavedSectionIDsOrdering:(id)a3
{
}

- (REMMemberships)unsavedMembershipsOfRemindersInSections
{
  return self->_unsavedMembershipsOfRemindersInSections;
}

- (void)setUnsavedMembershipsOfRemindersInSections:(id)a3
{
}

- (NSSet)sectionIDsToUndelete
{
  return self->_sectionIDsToUndelete;
}

- (void)setSectionIDsToUndelete:(id)a3
{
}

- (BOOL)showingLargeAttachments
{
  return self->_showingLargeAttachments;
}

- (void)setShowingLargeAttachments:(BOOL)a3
{
  self->_showingLargeAttachments = a3;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (REMObjectID)parentAccountID
{
  return self->_parentAccountID;
}

- (void)setParentAccountID:(id)a3
{
}

- (REMObjectID)parentListID
{
  return self->_parentListID;
}

- (void)setParentListID:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (REMColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (NSString)badgeEmblem
{
  return self->_badgeEmblem;
}

- (void)setBadgeEmblem:(id)a3
{
}

- (NSData)filterData
{
  return self->_filterData;
}

- (void)setFilterData:(id)a3
{
}

- (BOOL)isPersisted
{
  return self->_isPersisted;
}

- (void)setIsPersisted:(BOOL)a3
{
  self->_isPersisted = a3;
}

- (void)setResolutionTokenMap:(id)a3
{
}

- (NSData)resolutionTokenMapData
{
  return self->_resolutionTokenMapData;
}

- (void)setResolutionTokenMapData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionTokenMapData, 0);
  objc_storeStrong((id *)&self->_resolutionTokenMap, 0);
  objc_storeStrong((id *)&self->_filterData, 0);
  objc_storeStrong((id *)&self->_badgeEmblem, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_parentListID, 0);
  objc_storeStrong((id *)&self->_parentAccountID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_sectionIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_unsavedMembershipsOfRemindersInSections, 0);
  objc_storeStrong((id *)&self->_unsavedSectionIDsOrdering, 0);
  objc_storeStrong((id *)&self->_mostRecentTargetTemplateIdentifier, 0);
  objc_storeStrong((id *)&self->_manualOrdering, 0);
  objc_storeStrong((id *)&self->_accountCapabilities, 0);
  objc_storeStrong((id *)&self->_smartListType, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_pinnedDate, 0);

  objc_storeStrong((id *)&self->sortingStyle, 0);
}

- (void)resolutionTokenMap
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "Nil resolutionTokenMapData when reading resolutionTokenMap from smartlist storage. Initialize an empty map {smartlist: %@}", (uint8_t *)&v2, 0xCu);
}

@end