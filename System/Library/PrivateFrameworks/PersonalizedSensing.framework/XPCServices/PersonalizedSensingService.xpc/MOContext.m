@interface MOContext
+ (BOOL)supportsSecureCoding;
+ (unint64_t)getMetadataBitmapWithContext:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MOContext)initWithCoder:(id)a3;
- (MOContext)initWithContextIdentifier:(id)a3 contextCreationTimestamp:(id)a4;
- (MOContext)initWithContextMO:(id)a3;
- (NSArray)associatedActivities;
- (NSArray)associatedContacts;
- (NSArray)associatedLocations;
- (NSArray)associatedMusic;
- (NSArray)associatedPhotos;
- (NSArray)associatedTime;
- (NSArray)contextStrings;
- (NSDate)contextCreationTimestamp;
- (NSString)associatedBundleID;
- (NSString)associatedRequestID;
- (NSString)associatedSuggestionID;
- (NSUUID)bundleContentIdentifier;
- (NSUUID)contextIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)actionType;
- (unint64_t)associatedPatternType;
- (void)encodeWithCoder:(id)a3;
- (void)setActionType:(unint64_t)a3;
- (void)setAssociatedActivities:(id)a3;
- (void)setAssociatedBundleID:(id)a3;
- (void)setAssociatedContacts:(id)a3;
- (void)setAssociatedLocations:(id)a3;
- (void)setAssociatedMusic:(id)a3;
- (void)setAssociatedPatternType:(unint64_t)a3;
- (void)setAssociatedPhotos:(id)a3;
- (void)setAssociatedRequestID:(id)a3;
- (void)setAssociatedSuggestionID:(id)a3;
- (void)setAssociatedTime:(id)a3;
- (void)setBundleContentIdentifier:(id)a3;
- (void)setContextStrings:(id)a3;
@end

@implementation MOContext

- (MOContext)initWithContextIdentifier:(id)a3 contextCreationTimestamp:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOContext;
  v9 = [(MOContext *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contextIdentifier, a3);
    objc_storeStrong((id *)&v10->_contextCreationTimestamp, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  contextIdentifier = self->_contextIdentifier;
  id v5 = a3;
  [v5 encodeObject:contextIdentifier forKey:@"contextIndentifier"];
  [v5 encodeObject:self->_contextCreationTimestamp forKey:@"contextCreationTimestamp"];
  [v5 encodeObject:self->_contextStrings forKey:@"contextStrings"];
  [v5 encodeObject:self->_associatedLocations forKey:@"associatedLocations"];
  [v5 encodeObject:self->_associatedContacts forKey:@"associatedContacts"];
  [v5 encodeObject:self->_associatedActivities forKey:@"associatedActivities"];
  [v5 encodeObject:self->_associatedPhotos forKey:@"associatedPhotos"];
  [v5 encodeObject:self->_associatedTime forKey:@"associatedTime"];
  [v5 encodeObject:self->_associatedMusic forKey:@"associatedMusic"];
  [v5 encodeInteger:self->_associatedPatternType forKey:@"associatedPatternType"];
  [v5 encodeObject:self->_associatedRequestID forKey:@"associatedRequestID"];
  [v5 encodeObject:self->_associatedBundleID forKey:@"associatedBundleID"];
  [v5 encodeObject:self->_associatedSuggestionID forKey:@"associatedSuggestionID"];
  [v5 encodeInteger:self->_actionType forKey:@"actionType"];
}

- (MOContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextIndentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contextCreationTimestamp"];
  id v7 = [(MOContext *)self initWithContextIdentifier:v5 contextCreationTimestamp:v6];
  if (v7)
  {
    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"contextStrings"];
    contextStrings = v7->_contextStrings;
    v7->_contextStrings = (NSArray *)v10;

    v7->_associatedPatternType = (unint64_t)[v4 decodeIntegerForKey:@"associatedPatternType"];
    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"associatedLocations"];
    associatedLocations = v7->_associatedLocations;
    v7->_associatedLocations = (NSArray *)v14;

    uint64_t v16 = objc_opt_class();
    v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"associatedContacts"];
    associatedContacts = v7->_associatedContacts;
    v7->_associatedContacts = (NSArray *)v18;

    uint64_t v20 = objc_opt_class();
    v21 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v20, objc_opt_class(), 0);
    uint64_t v22 = [v4 decodeObjectOfClasses:v21 forKey:@"associatedActivities"];
    associatedActivities = v7->_associatedActivities;
    v7->_associatedActivities = (NSArray *)v22;

    uint64_t v24 = objc_opt_class();
    v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"associatedPhotos"];
    associatedPhotos = v7->_associatedPhotos;
    v7->_associatedPhotos = (NSArray *)v26;

    uint64_t v28 = objc_opt_class();
    v29 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v28, objc_opt_class(), 0);
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"associatedTime"];
    associatedTime = v7->_associatedTime;
    v7->_associatedTime = (NSArray *)v30;

    uint64_t v32 = objc_opt_class();
    v33 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v32, objc_opt_class(), 0);
    uint64_t v34 = [v4 decodeObjectOfClasses:v33 forKey:@"associatedMusic"];
    associatedMusic = v7->_associatedMusic;
    v7->_associatedMusic = (NSArray *)v34;

    uint64_t v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedRequestID"];
    associatedRequestID = v7->_associatedRequestID;
    v7->_associatedRequestID = (NSString *)v36;

    uint64_t v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedBundleID"];
    associatedBundleID = v7->_associatedBundleID;
    v7->_associatedBundleID = (NSString *)v38;

    uint64_t v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedSuggestionID"];
    associatedSuggestionID = v7->_associatedSuggestionID;
    v7->_associatedSuggestionID = (NSString *)v40;

    v7->_actionType = (unint64_t)[v4 decodeIntegerForKey:@"actionType"];
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 isMemberOfClass:objc_opt_class()];
  contextIdentifier = self->_contextIdentifier;
  id v7 = [v4 contextIdentifier];
  LOBYTE(contextIdentifier) = [(NSUUID *)contextIdentifier isEqual:v7];

  contextCreationTimestamp = self->_contextCreationTimestamp;
  v9 = [v4 contextCreationTimestamp];

  LOBYTE(contextCreationTimestamp) = [(NSDate *)contextCreationTimestamp isEqual:v9];
  return v5 & contextIdentifier & contextCreationTimestamp;
}

- (id)description
{
  v3 = [(MOContext *)self contextIdentifier];
  id v4 = [(MOContext *)self contextCreationTimestamp];
  unsigned __int8 v5 = [(MOContext *)self associatedRequestID];
  v6 = [(MOContext *)self associatedBundleID];
  id v7 = [(MOContext *)self associatedSuggestionID];
  uint64_t v8 = [(MOContext *)self contextStrings];
  v9 = +[NSString stringWithFormat:@"contextIdentifier, %@, contextCreationTimestamp, %@, associated request ID, %@, associated bundle ID, %@, associated suggestion ID, %@, contextStrings, %@, actionType, %lu ", v3, v4, v5, v6, v7, v8, [(MOContext *)self actionType]];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MOContext alloc];
  unsigned __int8 v5 = [(MOContext *)self contextIdentifier];
  v6 = [(MOContext *)self contextCreationTimestamp];
  id v7 = [(MOContext *)v4 initWithContextIdentifier:v5 contextCreationTimestamp:v6];

  uint64_t v8 = [(MOContext *)self contextStrings];
  [(MOContext *)v7 setContextStrings:v8];

  [(MOContext *)v7 setAssociatedPatternType:[(MOContext *)self associatedPatternType]];
  v9 = [(MOContext *)self associatedLocations];
  [(MOContext *)v7 setAssociatedLocations:v9];

  uint64_t v10 = [(MOContext *)self associatedContacts];
  [(MOContext *)v7 setAssociatedContacts:v10];

  v11 = [(MOContext *)self associatedActivities];
  [(MOContext *)v7 setAssociatedActivities:v11];

  uint64_t v12 = [(MOContext *)self associatedPhotos];
  [(MOContext *)v7 setAssociatedPhotos:v12];

  v13 = [(MOContext *)self associatedTime];
  [(MOContext *)v7 setAssociatedTime:v13];

  uint64_t v14 = [(MOContext *)self associatedMusic];
  [(MOContext *)v7 setAssociatedMusic:v14];

  v15 = [(MOContext *)self associatedRequestID];
  [(MOContext *)v7 setAssociatedRequestID:v15];

  uint64_t v16 = [(MOContext *)self associatedBundleID];
  [(MOContext *)v7 setAssociatedBundleID:v16];

  v17 = [(MOContext *)self associatedSuggestionID];
  [(MOContext *)v7 setAssociatedSuggestionID:v17];

  [(MOContext *)v7 setActionType:[(MOContext *)self actionType]];
  return v7;
}

- (NSUUID)contextIdentifier
{
  return self->_contextIdentifier;
}

- (NSArray)contextStrings
{
  return self->_contextStrings;
}

- (void)setContextStrings:(id)a3
{
}

- (NSDate)contextCreationTimestamp
{
  return self->_contextCreationTimestamp;
}

- (unint64_t)associatedPatternType
{
  return self->_associatedPatternType;
}

- (void)setAssociatedPatternType:(unint64_t)a3
{
  self->_associatedPatternType = a3;
}

- (NSArray)associatedLocations
{
  return self->_associatedLocations;
}

- (void)setAssociatedLocations:(id)a3
{
}

- (NSArray)associatedContacts
{
  return self->_associatedContacts;
}

- (void)setAssociatedContacts:(id)a3
{
}

- (NSArray)associatedActivities
{
  return self->_associatedActivities;
}

- (void)setAssociatedActivities:(id)a3
{
}

- (NSArray)associatedPhotos
{
  return self->_associatedPhotos;
}

- (void)setAssociatedPhotos:(id)a3
{
}

- (NSArray)associatedTime
{
  return self->_associatedTime;
}

- (void)setAssociatedTime:(id)a3
{
}

- (NSArray)associatedMusic
{
  return self->_associatedMusic;
}

- (void)setAssociatedMusic:(id)a3
{
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(unint64_t)a3
{
  self->_actionType = a3;
}

- (NSString)associatedRequestID
{
  return self->_associatedRequestID;
}

- (void)setAssociatedRequestID:(id)a3
{
}

- (NSString)associatedBundleID
{
  return self->_associatedBundleID;
}

- (void)setAssociatedBundleID:(id)a3
{
}

- (NSString)associatedSuggestionID
{
  return self->_associatedSuggestionID;
}

- (void)setAssociatedSuggestionID:(id)a3
{
}

- (NSUUID)bundleContentIdentifier
{
  return self->_bundleContentIdentifier;
}

- (void)setBundleContentIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleContentIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedSuggestionID, 0);
  objc_storeStrong((id *)&self->_associatedBundleID, 0);
  objc_storeStrong((id *)&self->_associatedRequestID, 0);
  objc_storeStrong((id *)&self->_associatedMusic, 0);
  objc_storeStrong((id *)&self->_associatedTime, 0);
  objc_storeStrong((id *)&self->_associatedPhotos, 0);
  objc_storeStrong((id *)&self->_associatedActivities, 0);
  objc_storeStrong((id *)&self->_associatedContacts, 0);
  objc_storeStrong((id *)&self->_associatedLocations, 0);
  objc_storeStrong((id *)&self->_contextCreationTimestamp, 0);
  objc_storeStrong((id *)&self->_contextStrings, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
}

- (MOContext)initWithContextMO:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  if (v4)
  {
    v6 = [v4 contextIdentifier];
    id v7 = [v5 contextCreationTimestamp];
    self = [(MOContext *)self initWithContextIdentifier:v6 contextCreationTimestamp:v7];

    -[MOContext setAssociatedPatternType:](self, "setAssociatedPatternType:", [v5 associatedPatternType]);
    -[MOContext setActionType:](self, "setActionType:", [v5 actionType]);
    uint64_t v8 = [v5 associatedRequestID];
    [(MOContext *)self setAssociatedRequestID:v8];

    v9 = [v5 associatedBundleID];
    [(MOContext *)self setAssociatedBundleID:v9];

    uint64_t v10 = [v5 associatedSuggestionID];
    [(MOContext *)self setAssociatedSuggestionID:v10];

    v11 = [v5 bundleContentIdentifier];
    [(MOContext *)self setBundleContentIdentifier:v11];

    NSSelectorFromString(@"contextStrings");
    if (objc_opt_respondsToSelector())
    {
      uint64_t v12 = objc_opt_new();
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      v13 = [v5 contextStrings];
      id v14 = [v13 countByEnumeratingWithState:&v66 objects:v76 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v67;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v67 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = [[MOContextString alloc] initWithContextStringMO:*(void *)(*((void *)&v66 + 1) + 8 * i)];
            [v12 addObject:v18];
          }
          id v15 = [v13 countByEnumeratingWithState:&v66 objects:v76 count:16];
        }
        while (v15);
      }

      [(MOContext *)self setContextStrings:v12];
    }
    v19 = _mo_log_facility_get_os_log(&MOLogFacilityContextStore);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v75 = self;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "fetch context, %@", buf, 0xCu);
    }

    NSSelectorFromString(@"associatedLocations");
    if (objc_opt_respondsToSelector())
    {
      uint64_t v20 = objc_opt_new();
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      v21 = [v5 associatedLocations];
      id v22 = [v21 countByEnumeratingWithState:&v62 objects:v73 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v63;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(void *)v63 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = [[MOContextLocationMetaData alloc] initWithLocationMetaDataMO:*(void *)(*((void *)&v62 + 1) + 8 * (void)j)];
            [v20 addObject:v26];
          }
          id v23 = [v21 countByEnumeratingWithState:&v62 objects:v73 count:16];
        }
        while (v23);
      }

      [(MOContext *)self setAssociatedLocations:v20];
    }
    NSSelectorFromString(@"associatedContacts");
    if (objc_opt_respondsToSelector())
    {
      v27 = objc_opt_new();
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      uint64_t v28 = [v5 associatedContacts];
      id v29 = [v28 countByEnumeratingWithState:&v58 objects:v72 count:16];
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = *(void *)v59;
        do
        {
          for (k = 0; k != v30; k = (char *)k + 1)
          {
            if (*(void *)v59 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = [[MOContextContactMetaData alloc] initWithContactMetaDataMO:*(void *)(*((void *)&v58 + 1) + 8 * (void)k)];
            [v27 addObject:v33];
          }
          id v30 = [v28 countByEnumeratingWithState:&v58 objects:v72 count:16];
        }
        while (v30);
      }

      [(MOContext *)self setAssociatedContacts:v27];
    }
    NSSelectorFromString(@"associatedTime");
    if (objc_opt_respondsToSelector())
    {
      uint64_t v34 = objc_opt_new();
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      v35 = [v5 associatedTime];
      id v36 = [v35 countByEnumeratingWithState:&v54 objects:v71 count:16];
      if (v36)
      {
        id v37 = v36;
        uint64_t v38 = *(void *)v55;
        do
        {
          for (m = 0; m != v37; m = (char *)m + 1)
          {
            if (*(void *)v55 != v38) {
              objc_enumerationMutation(v35);
            }
            uint64_t v40 = [[MOContextTimeMetaData alloc] initWithTimeMetaDataMO:*(void *)(*((void *)&v54 + 1) + 8 * (void)m)];
            [v34 addObject:v40];
          }
          id v37 = [v35 countByEnumeratingWithState:&v54 objects:v71 count:16];
        }
        while (v37);
      }

      [(MOContext *)self setAssociatedTime:v34];
    }
    NSSelectorFromString(@"associatedMusic");
    if (objc_opt_respondsToSelector())
    {
      v41 = objc_opt_new();
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      v42 = objc_msgSend(v5, "associatedMusic", 0);
      id v43 = [v42 countByEnumeratingWithState:&v50 objects:v70 count:16];
      if (v43)
      {
        id v44 = v43;
        uint64_t v45 = *(void *)v51;
        do
        {
          for (n = 0; n != v44; n = (char *)n + 1)
          {
            if (*(void *)v51 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = [[MOContextMusicMetaData alloc] initWithMusicMetaDataMO:*(void *)(*((void *)&v50 + 1) + 8 * (void)n)];
            [v41 addObject:v47];
          }
          id v44 = [v42 countByEnumeratingWithState:&v50 objects:v70 count:16];
        }
        while (v44);
      }

      [(MOContext *)self setAssociatedMusic:v41];
    }
    v48 = self;
  }
  else
  {
    v48 = 0;
  }

  return v48;
}

+ (unint64_t)getMetadataBitmapWithContext:(id)a3
{
  id v3 = a3;
  id v4 = [v3 associatedLocations];
  BOOL v5 = [v4 count] != 0;

  v6 = [v3 associatedPhotos];
  BOOL v7 = [v6 count] != 0;

  uint64_t v8 = v7 || 2 * v5;
  v9 = [v3 associatedActivities];
  id v10 = [v9 count];

  if (v10) {
    unint64_t v11 = v8 | 8;
  }
  else {
    unint64_t v11 = v8;
  }
  uint64_t v12 = [v3 associatedContacts];

  id v13 = [v12 count];
  if (v13) {
    return v11 | 4;
  }
  else {
    return v11;
  }
}

@end