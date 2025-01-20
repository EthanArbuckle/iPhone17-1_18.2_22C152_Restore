@interface MOContext
+ (BOOL)supportsSecureCoding;
+ (id)fromBiome:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MOContext)initWithCoder:(id)a3;
- (MOContext)initWithContextIdentifier:(id)a3 contextCreationTimestamp:(id)a4;
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

+ (id)fromBiome:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MOContext alloc];
  v5 = [v3 contextIdentifier];
  v6 = [v3 contextCreationTimestamp];
  v7 = [(MOContext *)v4 initWithContextIdentifier:v5 contextCreationTimestamp:v6];

  v8 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v9 = objc_msgSend(v3, "contextStrings", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = +[MOContextString fromBiome:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [(MOContext *)v7 setContextStrings:v8];
  -[MOContext setAssociatedPatternType:](v7, "setAssociatedPatternType:", [v3 associatedPatternType]);

  return v7;
}

- (MOContext)initWithContextIdentifier:(id)a3 contextCreationTimestamp:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOContext;
  v9 = [(MOContext *)&v12 init];
  uint64_t v10 = v9;
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
    id v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"contextStrings"];
    contextStrings = v7->_contextStrings;
    v7->_contextStrings = (NSArray *)v11;

    v7->_associatedPatternType = [v4 decodeIntegerForKey:@"associatedPatternType"];
    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"associatedLocations"];
    associatedLocations = v7->_associatedLocations;
    v7->_associatedLocations = (NSArray *)v16;

    long long v18 = (void *)MEMORY[0x263EFFA08];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"associatedContacts"];
    associatedContacts = v7->_associatedContacts;
    v7->_associatedContacts = (NSArray *)v21;

    v23 = (void *)MEMORY[0x263EFFA08];
    uint64_t v24 = objc_opt_class();
    v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"associatedActivities"];
    associatedActivities = v7->_associatedActivities;
    v7->_associatedActivities = (NSArray *)v26;

    v28 = (void *)MEMORY[0x263EFFA08];
    uint64_t v29 = objc_opt_class();
    v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    uint64_t v31 = [v4 decodeObjectOfClasses:v30 forKey:@"associatedPhotos"];
    associatedPhotos = v7->_associatedPhotos;
    v7->_associatedPhotos = (NSArray *)v31;

    v33 = (void *)MEMORY[0x263EFFA08];
    uint64_t v34 = objc_opt_class();
    v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"associatedTime"];
    associatedTime = v7->_associatedTime;
    v7->_associatedTime = (NSArray *)v36;

    v38 = (void *)MEMORY[0x263EFFA08];
    uint64_t v39 = objc_opt_class();
    v40 = objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
    uint64_t v41 = [v4 decodeObjectOfClasses:v40 forKey:@"associatedMusic"];
    associatedMusic = v7->_associatedMusic;
    v7->_associatedMusic = (NSArray *)v41;

    uint64_t v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedRequestID"];
    associatedRequestID = v7->_associatedRequestID;
    v7->_associatedRequestID = (NSString *)v43;

    uint64_t v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedBundleID"];
    associatedBundleID = v7->_associatedBundleID;
    v7->_associatedBundleID = (NSString *)v45;

    uint64_t v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"associatedSuggestionID"];
    associatedSuggestionID = v7->_associatedSuggestionID;
    v7->_associatedSuggestionID = (NSString *)v47;

    v7->_actionType = [v4 decodeIntegerForKey:@"actionType"];
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  char v5 = [v4 isMemberOfClass:objc_opt_class()];
  contextIdentifier = self->_contextIdentifier;
  id v7 = [v4 contextIdentifier];
  LOBYTE(contextIdentifier) = [(NSUUID *)contextIdentifier isEqual:v7];

  contextCreationTimestamp = self->_contextCreationTimestamp;
  uint64_t v9 = [v4 contextCreationTimestamp];

  LOBYTE(contextCreationTimestamp) = [(NSDate *)contextCreationTimestamp isEqual:v9];
  return v5 & contextIdentifier & contextCreationTimestamp;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(MOContext *)self contextIdentifier];
  char v5 = [(MOContext *)self contextCreationTimestamp];
  v6 = [(MOContext *)self associatedRequestID];
  id v7 = [(MOContext *)self associatedBundleID];
  id v8 = [(MOContext *)self associatedSuggestionID];
  uint64_t v9 = [(MOContext *)self contextStrings];
  uint64_t v10 = [v3 stringWithFormat:@"contextIdentifier, %@, contextCreationTimestamp, %@, associated request ID, %@, associated bundle ID, %@, associated suggestion ID, %@, contextStrings, %@, actionType, %lu ", v4, v5, v6, v7, v8, v9, -[MOContext actionType](self, "actionType")];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MOContext alloc];
  char v5 = [(MOContext *)self contextIdentifier];
  v6 = [(MOContext *)self contextCreationTimestamp];
  id v7 = [(MOContext *)v4 initWithContextIdentifier:v5 contextCreationTimestamp:v6];

  id v8 = [(MOContext *)self contextStrings];
  [(MOContext *)v7 setContextStrings:v8];

  [(MOContext *)v7 setAssociatedPatternType:[(MOContext *)self associatedPatternType]];
  uint64_t v9 = [(MOContext *)self associatedLocations];
  [(MOContext *)v7 setAssociatedLocations:v9];

  uint64_t v10 = [(MOContext *)self associatedContacts];
  [(MOContext *)v7 setAssociatedContacts:v10];

  uint64_t v11 = [(MOContext *)self associatedActivities];
  [(MOContext *)v7 setAssociatedActivities:v11];

  objc_super v12 = [(MOContext *)self associatedPhotos];
  [(MOContext *)v7 setAssociatedPhotos:v12];

  v13 = [(MOContext *)self associatedTime];
  [(MOContext *)v7 setAssociatedTime:v13];

  uint64_t v14 = [(MOContext *)self associatedMusic];
  [(MOContext *)v7 setAssociatedMusic:v14];

  v15 = [(MOContext *)self associatedRequestID];
  [(MOContext *)v7 setAssociatedRequestID:v15];

  uint64_t v16 = [(MOContext *)self associatedBundleID];
  [(MOContext *)v7 setAssociatedBundleID:v16];

  long long v17 = [(MOContext *)self associatedSuggestionID];
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

@end