@interface REMTemplateStorage
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
- (NSData)resolutionTokenMapData;
- (NSDate)mostRecentPublicLinkUpdateRequestDate;
- (NSSet)sectionIDsToUndelete;
- (NSString)badgeEmblem;
- (NSString)name;
- (NSString)sortingStyle;
- (REMAccountCapabilities)accountCapabilities;
- (REMColor)color;
- (REMManualOrdering)unsavedManualOrdering;
- (REMMemberships)unsavedMembershipsOfRemindersInSections;
- (REMObjectID)accountID;
- (REMObjectID)objectID;
- (REMObjectID)parentAccountID;
- (REMResolutionTokenMap)resolutionTokenMap;
- (REMTemplateConfiguration)configuration;
- (REMTemplatePublicLink)publicLink;
- (REMTemplateStorage)initWithCoder:(id)a3;
- (REMTemplateStorage)initWithObjectID:(id)a3 accountID:(id)a4 name:(id)a5;
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
- (void)setBadgeEmblem:(id)a3;
- (void)setColor:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3;
- (void)setIsPersisted:(BOOL)a3;
- (void)setMinimumSupportedVersion:(int64_t)a3;
- (void)setMostRecentPublicLinkUpdateRequestDate:(id)a3;
- (void)setName:(id)a3;
- (void)setObjectID:(id)a3;
- (void)setParentAccountID:(id)a3;
- (void)setPublicLink:(id)a3;
- (void)setResolutionTokenMap:(id)a3;
- (void)setResolutionTokenMapData:(id)a3;
- (void)setSectionIDsToUndelete:(id)a3;
- (void)setShouldUpdateSectionsOrdering:(BOOL)a3;
- (void)setShowingLargeAttachments:(BOOL)a3;
- (void)setSortingStyle:(id)a3;
- (void)setStoreGenerationIfNeeded:(unint64_t)a3;
- (void)setUnsavedManualOrdering:(id)a3;
- (void)setUnsavedMembershipsOfRemindersInSections:(id)a3;
- (void)setUnsavedSectionIDsOrdering:(id)a3;
@end

@implementation REMTemplateStorage

- (REMTemplateStorage)initWithObjectID:(id)a3 accountID:(id)a4 name:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v32.receiver = self;
  v32.super_class = (Class)REMTemplateStorage;
  v12 = [(REMTemplateStorage *)&v32 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_objectID, a3);
    objc_storeStrong((id *)&v13->_accountID, a4);
    parentAccountID = v13->_parentAccountID;
    v13->_parentAccountID = 0;

    v15 = [[REMAccountCapabilities alloc] initWithAccountType:2];
    accountCapabilities = v13->_accountCapabilities;
    v13->_accountCapabilities = v15;

    configuration = v13->_configuration;
    v13->_configuration = 0;

    objc_storeStrong((id *)&v13->_name, a5);
    color = v13->_color;
    v13->_color = 0;

    badgeEmblem = v13->_badgeEmblem;
    v13->_badgeEmblem = 0;

    v13->_showingLargeAttachments = 0;
    unsavedManualOrdering = v13->_unsavedManualOrdering;
    v13->_unsavedManualOrdering = 0;

    v13->_shouldUpdateSectionsOrdering = 0;
    unsavedSectionIDsOrdering = v13->_unsavedSectionIDsOrdering;
    v13->_unsavedSectionIDsOrdering = 0;

    unsavedMembershipsOfRemindersInSections = v13->_unsavedMembershipsOfRemindersInSections;
    v13->_unsavedMembershipsOfRemindersInSections = 0;

    uint64_t v23 = [MEMORY[0x1E4F1CAD0] set];
    sectionIDsToUndelete = v13->_sectionIDsToUndelete;
    v13->_sectionIDsToUndelete = (NSSet *)v23;

    mostRecentPublicLinkUpdateRequestDate = v13->_mostRecentPublicLinkUpdateRequestDate;
    v13->_mostRecentPublicLinkUpdateRequestDate = 0;

    publicLink = v13->_publicLink;
    v13->_publicLink = 0;

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

- (unint64_t)hash
{
  v2 = [(REMTemplateStorage *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMTemplateStorage *)self objectID];
  v6 = [v3 stringWithFormat:@"<%@: %p objectID: %@", v4, self, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  if (a3 != self)
  {
    id v4 = a3;
    uint64_t v5 = objc_opt_class();
    v6 = REMDynamicCast(v5, (uint64_t)v4);

    v7 = [(REMTemplateStorage *)self objectID];
    uint64_t v8 = [v6 objectID];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      id v9 = (void *)v8;
      id v10 = [(REMTemplateStorage *)self objectID];
      id v11 = [v6 objectID];
      int v12 = [v10 isEqual:v11];

      if (!v12) {
        goto LABEL_77;
      }
    }
    v14 = [(REMTemplateStorage *)self accountID];
    uint64_t v15 = [v6 accountID];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      v16 = (void *)v15;
      v17 = [(REMTemplateStorage *)self accountID];
      v18 = [v6 accountID];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_77;
      }
    }
    v20 = [(REMTemplateStorage *)self parentAccountID];
    uint64_t v21 = [v6 parentAccountID];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      v22 = (void *)v21;
      uint64_t v23 = [(REMTemplateStorage *)self parentAccountID];
      v24 = [v6 parentAccountID];
      int v25 = [v23 isEqual:v24];

      if (!v25) {
        goto LABEL_77;
      }
    }
    v26 = [(REMTemplateStorage *)self configuration];
    uint64_t v27 = [v6 configuration];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      uint64_t v29 = [(REMTemplateStorage *)self configuration];
      v30 = [v6 configuration];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_77;
      }
    }
    objc_super v32 = [(REMTemplateStorage *)self name];
    uint64_t v33 = [v6 name];
    if (v32 == (void *)v33)
    {
    }
    else
    {
      v34 = (void *)v33;
      v35 = [(REMTemplateStorage *)self name];
      v36 = [v6 name];
      int v37 = [v35 isEqual:v36];

      if (!v37) {
        goto LABEL_77;
      }
    }
    v38 = [(REMTemplateStorage *)self color];
    uint64_t v39 = [v6 color];
    if (v38 == (void *)v39)
    {
    }
    else
    {
      v40 = (void *)v39;
      v41 = [(REMTemplateStorage *)self color];
      v42 = [v6 color];
      int v43 = [v41 isEqual:v42];

      if (!v43) {
        goto LABEL_77;
      }
    }
    v44 = [(REMTemplateStorage *)self badgeEmblem];
    uint64_t v45 = [v6 badgeEmblem];
    if (v44 == (void *)v45)
    {
    }
    else
    {
      v46 = (void *)v45;
      v47 = [(REMTemplateStorage *)self badgeEmblem];
      v48 = [v6 badgeEmblem];
      int v49 = [v47 isEqual:v48];

      if (!v49) {
        goto LABEL_77;
      }
    }
    int v50 = [(REMTemplateStorage *)self showingLargeAttachments];
    if (v50 == [v6 showingLargeAttachments])
    {
      v51 = [(REMTemplateStorage *)self sortingStyle];
      uint64_t v52 = [v6 sortingStyle];
      if (v51 == (void *)v52)
      {
      }
      else
      {
        v53 = (void *)v52;
        v54 = [(REMTemplateStorage *)self sortingStyle];
        v55 = [v6 sortingStyle];
        int v56 = [v54 isEqual:v55];

        if (!v56) {
          goto LABEL_77;
        }
      }
      v57 = [(REMTemplateStorage *)self unsavedManualOrdering];
      uint64_t v58 = [v6 unsavedManualOrdering];
      if (v57 == (void *)v58)
      {
      }
      else
      {
        v59 = (void *)v58;
        v60 = [(REMTemplateStorage *)self unsavedManualOrdering];
        v61 = [v6 unsavedManualOrdering];
        int v62 = [v60 isEqual:v61];

        if (!v62) {
          goto LABEL_77;
        }
      }
      int v63 = [(REMTemplateStorage *)self shouldUpdateSectionsOrdering];
      if (v63 == [v6 shouldUpdateSectionsOrdering])
      {
        v64 = [(REMTemplateStorage *)self unsavedSectionIDsOrdering];
        uint64_t v65 = [v6 unsavedSectionIDsOrdering];
        if (v64 == (void *)v65)
        {
        }
        else
        {
          v66 = (void *)v65;
          v67 = [(REMTemplateStorage *)self unsavedSectionIDsOrdering];
          v68 = [v6 unsavedSectionIDsOrdering];
          int v69 = [v67 isEqual:v68];

          if (!v69) {
            goto LABEL_77;
          }
        }
        v70 = [(REMTemplateStorage *)self unsavedMembershipsOfRemindersInSections];
        uint64_t v71 = [v6 unsavedMembershipsOfRemindersInSections];
        if (v70 == (void *)v71)
        {
        }
        else
        {
          v72 = (void *)v71;
          v73 = [(REMTemplateStorage *)self unsavedMembershipsOfRemindersInSections];
          v74 = [v6 unsavedMembershipsOfRemindersInSections];
          int v75 = [v73 isEqual:v74];

          if (!v75) {
            goto LABEL_77;
          }
        }
        v76 = [(REMTemplateStorage *)self sectionIDsToUndelete];
        uint64_t v77 = [v6 sectionIDsToUndelete];
        if (v76 == (void *)v77)
        {
        }
        else
        {
          v78 = (void *)v77;
          v79 = [(REMTemplateStorage *)self sectionIDsToUndelete];
          v80 = [v6 sectionIDsToUndelete];
          int v81 = [v79 isEqual:v80];

          if (!v81) {
            goto LABEL_77;
          }
        }
        v82 = [(REMTemplateStorage *)self mostRecentPublicLinkUpdateRequestDate];
        uint64_t v83 = [v6 mostRecentPublicLinkUpdateRequestDate];
        if (v82 == (void *)v83)
        {
        }
        else
        {
          v84 = (void *)v83;
          v85 = [(REMTemplateStorage *)self mostRecentPublicLinkUpdateRequestDate];
          v86 = [v6 mostRecentPublicLinkUpdateRequestDate];
          int v87 = [v85 isEqual:v86];

          if (!v87) {
            goto LABEL_77;
          }
        }
        v88 = [(REMTemplateStorage *)self publicLink];
        uint64_t v89 = [v6 publicLink];
        if (v88 == (void *)v89)
        {
        }
        else
        {
          v90 = (void *)v89;
          v91 = [(REMTemplateStorage *)self publicLink];
          v92 = [v6 publicLink];
          int v93 = [v91 isEqual:v92];

          if (!v93) {
            goto LABEL_77;
          }
        }
        int v94 = [(REMTemplateStorage *)self isPersisted];
        if (v94 == [v6 isPersisted])
        {
          v95 = [(REMTemplateStorage *)self accountCapabilities];
          uint64_t v96 = [v6 accountCapabilities];
          if (v95 == (void *)v96)
          {
          }
          else
          {
            v97 = (void *)v96;
            v98 = [(REMTemplateStorage *)self accountCapabilities];
            v99 = [v6 accountCapabilities];
            int v100 = [v98 isEqual:v99];

            if (!v100) {
              goto LABEL_77;
            }
          }
          if (!self->_resolutionTokenMap || v6[21])
          {
            v101 = +[REMLogStore read];
            if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
            {
              v111 = (objc_class *)objc_opt_class();
              v112 = NSStringFromClass(v111);
              resolutionTokenMap = self->_resolutionTokenMap;
              uint64_t v114 = v6[21];
              int v115 = 138543874;
              v116 = v112;
              __int16 v117 = 2112;
              v118 = resolutionTokenMap;
              __int16 v119 = 2112;
              uint64_t v120 = v114;
              _os_log_error_impl(&dword_1B9AA2000, v101, OS_LOG_TYPE_ERROR, "You are about to trigger decoding the resolution token map from JSON data. This is probably not what you want for performance to trigger it from -isEqual:, unless you are running Tests then it's fine {class: %{public}@, self-map: %@, other-map: %@}", (uint8_t *)&v115, 0x20u);
            }
          }
          v102 = [(REMTemplateStorage *)self resolutionTokenMap];
          uint64_t v103 = [v6 resolutionTokenMap];
          if (v102 == (void *)v103)
          {
          }
          else
          {
            v104 = (void *)v103;
            v105 = [(REMTemplateStorage *)self resolutionTokenMap];
            v106 = [v6 resolutionTokenMap];
            int v107 = [v105 isEqual:v106];

            if (!v107) {
              goto LABEL_77;
            }
          }
          int64_t v108 = [(REMTemplateStorage *)self minimumSupportedVersion];
          if (v108 == [v6 minimumSupportedVersion])
          {
            int64_t v109 = [(REMTemplateStorage *)self effectiveMinimumSupportedVersion];
            BOOL v13 = v109 == [v6 effectiveMinimumSupportedVersion];
LABEL_78:

            return v13;
          }
        }
      }
    }
LABEL_77:
    BOOL v13 = 0;
    goto LABEL_78;
  }
  return 1;
}

+ (id)newObjectID
{
  unint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [a1 objectIDWithUUID:v3];

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 cdEntityName];
  v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDTemplate";
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [REMTemplateStorage alloc];
  uint64_t v5 = [(REMTemplateStorage *)self objectID];
  v6 = [(REMTemplateStorage *)self accountID];
  v7 = [(REMTemplateStorage *)self name];
  uint64_t v8 = [(REMTemplateStorage *)v4 initWithObjectID:v5 accountID:v6 name:v7];

  id v9 = [(REMTemplateStorage *)self parentAccountID];
  [(REMTemplateStorage *)v8 setParentAccountID:v9];

  id v10 = [(REMTemplateStorage *)self configuration];
  id v11 = (void *)[v10 copy];
  [(REMTemplateStorage *)v8 setConfiguration:v11];

  int v12 = [(REMTemplateStorage *)self color];
  [(REMTemplateStorage *)v8 setColor:v12];

  BOOL v13 = [(REMTemplateStorage *)self badgeEmblem];
  [(REMTemplateStorage *)v8 setBadgeEmblem:v13];

  [(REMTemplateStorage *)v8 setShowingLargeAttachments:[(REMTemplateStorage *)self showingLargeAttachments]];
  v14 = [(REMTemplateStorage *)self sortingStyle];
  [(REMTemplateStorage *)v8 setSortingStyle:v14];

  uint64_t v15 = [(REMTemplateStorage *)self unsavedManualOrdering];
  v16 = (void *)[v15 copy];
  [(REMTemplateStorage *)v8 setUnsavedManualOrdering:v16];

  [(REMTemplateStorage *)v8 setShouldUpdateSectionsOrdering:[(REMTemplateStorage *)self shouldUpdateSectionsOrdering]];
  v17 = [(REMTemplateStorage *)self unsavedSectionIDsOrdering];
  v18 = (void *)[v17 copy];
  [(REMTemplateStorage *)v8 setUnsavedSectionIDsOrdering:v18];

  int v19 = [(REMTemplateStorage *)self unsavedMembershipsOfRemindersInSections];
  v20 = (void *)[v19 copy];
  [(REMTemplateStorage *)v8 setUnsavedMembershipsOfRemindersInSections:v20];

  uint64_t v21 = [(REMTemplateStorage *)self sectionIDsToUndelete];
  v22 = (void *)[v21 copy];
  [(REMTemplateStorage *)v8 setSectionIDsToUndelete:v22];

  uint64_t v23 = [(REMTemplateStorage *)self mostRecentPublicLinkUpdateRequestDate];
  [(REMTemplateStorage *)v8 setMostRecentPublicLinkUpdateRequestDate:v23];

  v24 = [(REMTemplateStorage *)self publicLink];
  int v25 = (void *)[v24 copy];
  [(REMTemplateStorage *)v8 setPublicLink:v25];

  [(REMTemplateStorage *)v8 setIsPersisted:[(REMTemplateStorage *)self isPersisted]];
  uint64_t v26 = [(REMResolutionTokenMap *)self->_resolutionTokenMap copy];
  resolutionTokenMap = v8->_resolutionTokenMap;
  v8->_resolutionTokenMap = (REMResolutionTokenMap *)v26;

  v28 = [(REMTemplateStorage *)self resolutionTokenMapData];
  [(REMTemplateStorage *)v8 setResolutionTokenMapData:v28];

  [(REMTemplateStorage *)v8 setMinimumSupportedVersion:[(REMTemplateStorage *)self minimumSupportedVersion]];
  [(REMTemplateStorage *)v8 setEffectiveMinimumSupportedVersion:[(REMTemplateStorage *)self effectiveMinimumSupportedVersion]];
  v8->_storeGeneration = self->_storeGeneration;
  v8->_copyGeneration = self->_copyGeneration + 1;
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  id v4 = [(REMTemplateStorage *)self objectID];
  [v21 encodeObject:v4 forKey:@"objectID"];

  uint64_t v5 = [(REMTemplateStorage *)self accountID];
  [v21 encodeObject:v5 forKey:@"accountID"];

  v6 = [(REMTemplateStorage *)self parentAccountID];
  [v21 encodeObject:v6 forKey:@"parentAccountID"];

  v7 = [(REMTemplateStorage *)self configuration];
  [v21 encodeObject:v7 forKey:@"configuration"];

  uint64_t v8 = [(REMTemplateStorage *)self name];
  [v21 encodeObject:v8 forKey:@"name"];

  id v9 = [(REMTemplateStorage *)self color];
  [v21 encodeObject:v9 forKey:@"color"];

  id v10 = [(REMTemplateStorage *)self badgeEmblem];
  [v21 encodeObject:v10 forKey:@"badgeEmblem"];

  objc_msgSend(v21, "encodeBool:forKey:", -[REMTemplateStorage showingLargeAttachments](self, "showingLargeAttachments"), @"showingLargeAttachments");
  id v11 = [(REMTemplateStorage *)self sortingStyle];
  [v21 encodeObject:v11 forKey:@"sortingStyle"];

  int v12 = [(REMTemplateStorage *)self unsavedManualOrdering];
  [v21 encodeObject:v12 forKey:@"unsavedManualOrdering"];

  objc_msgSend(v21, "encodeBool:forKey:", -[REMTemplateStorage shouldUpdateSectionsOrdering](self, "shouldUpdateSectionsOrdering"), @"shouldUpdateSectionsOrdering");
  BOOL v13 = [(REMTemplateStorage *)self unsavedSectionIDsOrdering];
  [v21 encodeObject:v13 forKey:@"unsavedSectionIDsOrdering"];

  v14 = [(REMTemplateStorage *)self unsavedMembershipsOfRemindersInSections];
  [v21 encodeObject:v14 forKey:@"unsavedMembershipsOfRemindersInSections"];

  uint64_t v15 = [(REMTemplateStorage *)self sectionIDsToUndelete];
  v16 = [v15 allObjects];
  [v21 encodeObject:v16 forKey:@"sectionIDsToUndelete"];

  v17 = [(REMTemplateStorage *)self mostRecentPublicLinkUpdateRequestDate];
  [v21 encodeObject:v17 forKey:@"mostRecentPublicLinkUpdateRequestDate"];

  v18 = [(REMTemplateStorage *)self publicLink];
  [v21 encodeObject:v18 forKey:@"publicLink"];

  objc_msgSend(v21, "encodeBool:forKey:", -[REMTemplateStorage isPersisted](self, "isPersisted"), @"isPersisted");
  resolutionTokenMap = self->_resolutionTokenMap;
  if (resolutionTokenMap)
  {
    [v21 encodeObject:resolutionTokenMap forKey:@"resolutionTokenMap"];
    [v21 encodeObject:0 forKey:@"resolutionTokenMapData"];
  }
  else
  {
    [v21 encodeObject:0 forKey:@"resolutionTokenMap"];
    v20 = [(REMTemplateStorage *)self resolutionTokenMapData];
    [v21 encodeObject:v20 forKey:@"resolutionTokenMapData"];
  }
  objc_msgSend(v21, "encodeInteger:forKey:", -[REMTemplateStorage minimumSupportedVersion](self, "minimumSupportedVersion"), @"minimumSupportedVersion");
  objc_msgSend(v21, "encodeInteger:forKey:", -[REMTemplateStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"), @"effectiveMinimumSupportedVersion");
}

- (REMTemplateStorage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountID"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  uint64_t v8 = (void *)v7;
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0)
  {
    id v11 = 0;
  }
  else
  {
    int v12 = [(REMTemplateStorage *)self initWithObjectID:v5 accountID:v6 name:v7];
    BOOL v13 = v12;
    if (v12)
    {
      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentAccountID"];
      parentAccountID = v13->_parentAccountID;
      v13->_parentAccountID = (REMObjectID *)v14;

      uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
      configuration = v13->_configuration;
      v13->_configuration = (REMTemplateConfiguration *)v16;

      uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"color"];
      color = v13->_color;
      v13->_color = (REMColor *)v18;

      uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"badgeEmblem"];
      badgeEmblem = v13->_badgeEmblem;
      v13->_badgeEmblem = (NSString *)v20;

      v13->_showingLargeAttachments = [v4 decodeBoolForKey:@"showingLargeAttachments"];
      uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unsavedManualOrdering"];
      unsavedManualOrdering = v13->_unsavedManualOrdering;
      v13->_unsavedManualOrdering = (REMManualOrdering *)v22;

      v13->_shouldUpdateSectionsOrdering = [v4 decodeBoolForKey:@"shouldUpdateSectionsOrdering"];
      v24 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
      uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"unsavedSectionIDsOrdering"];
      unsavedSectionIDsOrdering = v13->_unsavedSectionIDsOrdering;
      v13->_unsavedSectionIDsOrdering = (NSArray *)v27;

      uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unsavedMembershipsOfRemindersInSections"];
      unsavedMembershipsOfRemindersInSections = v13->_unsavedMembershipsOfRemindersInSections;
      v13->_unsavedMembershipsOfRemindersInSections = (REMMemberships *)v29;

      int v31 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v32 = objc_opt_class();
      uint64_t v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
      v34 = [v4 decodeObjectOfClasses:v33 forKey:@"sectionIDsToUndelete"];

      uint64_t v35 = [MEMORY[0x1E4F1CAD0] setWithArray:v34];
      sectionIDsToUndelete = v13->_sectionIDsToUndelete;
      v13->_sectionIDsToUndelete = (NSSet *)v35;

      uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mostRecentPublicLinkUpdateRequestDate"];
      mostRecentPublicLinkUpdateRequestDate = v13->_mostRecentPublicLinkUpdateRequestDate;
      v13->_mostRecentPublicLinkUpdateRequestDate = (NSDate *)v37;

      uint64_t v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"publicLink"];
      publicLink = v13->_publicLink;
      v13->_publicLink = (REMTemplatePublicLink *)v39;

      v13->_isPersisted = [v4 decodeBoolForKey:@"isPersisted"];
      v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sortingStyle"];
      [(REMTemplateStorage *)v13 setSortingStyle:v41];

      v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolutionTokenMapData"];
      int v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resolutionTokenMap"];
      if (v43)
      {
        objc_storeStrong((id *)&v13->_resolutionTokenMap, v43);
        resolutionTokenMapData = v13->_resolutionTokenMapData;
        v13->_resolutionTokenMapData = 0;
      }
      else
      {
        resolutionTokenMap = v13->_resolutionTokenMap;
        v13->_resolutionTokenMap = 0;

        v46 = v42;
        resolutionTokenMapData = v13->_resolutionTokenMapData;
        v13->_resolutionTokenMapData = v46;
      }

      -[REMTemplateStorage setMinimumSupportedVersion:](v13, "setMinimumSupportedVersion:", [v4 decodeIntegerForKey:@"minimumSupportedVersion"]);
      -[REMTemplateStorage setEffectiveMinimumSupportedVersion:](v13, "setEffectiveMinimumSupportedVersion:", [v4 decodeIntegerForKey:@"effectiveMinimumSupportedVersion"]);
    }
    self = v13;
    id v11 = self;
  }

  return v11;
}

- (BOOL)isUnsupported
{
  uint64_t v2 = [(REMTemplateStorage *)self effectiveMinimumSupportedVersion];

  return rem_isUnsupportedVersionByRuntime(v2);
}

- (id)cdKeyToStorageKeyMap
{
  if (cdKeyToStorageKeyMap_onceToken_2 != -1) {
    dispatch_once(&cdKeyToStorageKeyMap_onceToken_2, &__block_literal_global_40);
  }
  uint64_t v2 = (void *)cdKeyToStorageKeyMap_mapping_2;

  return v2;
}

- (REMResolutionTokenMap)resolutionTokenMap
{
  p_resolutionTokenMap = &self->_resolutionTokenMap;
  id v4 = self->_resolutionTokenMap;
  if (v4)
  {
    uint64_t v5 = v4;
  }
  else
  {
    v6 = [(REMTemplateStorage *)self resolutionTokenMapData];
    if (!v6)
    {
      uint64_t v7 = +[REMLogStore read];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        [(REMTemplateStorage *)(uint64_t)self resolutionTokenMap];
      }
    }
    uint64_t v8 = [(REMTemplateStorage *)self cdKeyToStorageKeyMap];
    BOOL v9 = +[REMResolutionTokenMap resolutionTokenMapWithJSONData:v6 keyMap:v8];

    objc_storeStrong((id *)p_resolutionTokenMap, v9);
    uint64_t v5 = v9;
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

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (REMObjectID)parentAccountID
{
  return self->_parentAccountID;
}

- (void)setParentAccountID:(id)a3
{
}

- (REMAccountCapabilities)accountCapabilities
{
  return self->_accountCapabilities;
}

- (void)setAccountCapabilities:(id)a3
{
}

- (REMTemplateConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
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

- (BOOL)showingLargeAttachments
{
  return self->_showingLargeAttachments;
}

- (void)setShowingLargeAttachments:(BOOL)a3
{
  self->_showingLargeAttachments = a3;
}

- (NSString)sortingStyle
{
  return self->_sortingStyle;
}

- (void)setSortingStyle:(id)a3
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

- (REMManualOrdering)unsavedManualOrdering
{
  return self->_unsavedManualOrdering;
}

- (void)setUnsavedManualOrdering:(id)a3
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

- (NSDate)mostRecentPublicLinkUpdateRequestDate
{
  return self->_mostRecentPublicLinkUpdateRequestDate;
}

- (void)setMostRecentPublicLinkUpdateRequestDate:(id)a3
{
}

- (REMTemplatePublicLink)publicLink
{
  return self->_publicLink;
}

- (void)setPublicLink:(id)a3
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
  objc_storeStrong((id *)&self->_publicLink, 0);
  objc_storeStrong((id *)&self->_mostRecentPublicLinkUpdateRequestDate, 0);
  objc_storeStrong((id *)&self->_sectionIDsToUndelete, 0);
  objc_storeStrong((id *)&self->_unsavedMembershipsOfRemindersInSections, 0);
  objc_storeStrong((id *)&self->_unsavedManualOrdering, 0);
  objc_storeStrong((id *)&self->_unsavedSectionIDsOrdering, 0);
  objc_storeStrong((id *)&self->_sortingStyle, 0);
  objc_storeStrong((id *)&self->_badgeEmblem, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_accountCapabilities, 0);
  objc_storeStrong((id *)&self->_parentAccountID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);

  objc_storeStrong((id *)&self->_objectID, 0);
}

- (void)resolutionTokenMap
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_ERROR, "Nil resolutionTokenMapData when reading resolutionTokenMap from template storage. Initialize an empty map {template: %@}", (uint8_t *)&v2, 0xCu);
}

@end