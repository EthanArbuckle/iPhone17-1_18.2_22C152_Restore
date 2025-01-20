@interface REMManualOrdering
+ (BOOL)supportsSecureCoding;
+ (id)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)topLevelElementIDs;
- (NSDate)modifiedDate;
- (NSDictionary)secondaryLevelElementIDsByTopLevelElementID;
- (NSString)listID;
- (REMManualOrdering)initWithCoder:(id)a3;
- (REMManualOrdering)initWithObjectID:(id)a3 listType:(signed __int16)a4 listID:(id)a5 modifiedDate:(id)a6;
- (REMManualOrdering)initWithObjectID:(id)a3 listType:(signed __int16)a4 listID:(id)a5 topLevelElementIDs:(id)a6 secondaryLevelElementIDsByTopLevelElementID:(id)a7 uncommitedElementsAccountID:(id)a8 modifiedDate:(id)a9;
- (REMObjectID)objectID;
- (REMObjectID)uncommitedElementsAccountID;
- (id)copyWithZone:(_NSZone *)a3;
- (signed)listType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMManualOrdering

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [a1 cdEntityName];
  v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (id)cdEntityName
{
  return @"REMCDManualSortHint_v1";
}

- (REMManualOrdering)initWithObjectID:(id)a3 listType:(signed __int16)a4 listID:(id)a5 topLevelElementIDs:(id)a6 secondaryLevelElementIDsByTopLevelElementID:(id)a7 uncommitedElementsAccountID:(id)a8 modifiedDate:(id)a9
{
  id v24 = a3;
  id v23 = a5;
  id v22 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)REMManualOrdering;
  v18 = [(REMManualOrdering *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_objectID, a3);
    v19->_listType = a4;
    objc_storeStrong((id *)&v19->_listID, a5);
    objc_storeStrong((id *)&v19->_topLevelElementIDs, a6);
    objc_storeStrong((id *)&v19->_secondaryLevelElementIDsByTopLevelElementID, a7);
    objc_storeStrong((id *)&v19->_uncommitedElementsAccountID, a8);
    objc_storeStrong((id *)&v19->_modifiedDate, a9);
  }

  return v19;
}

- (REMManualOrdering)initWithObjectID:(id)a3 listType:(signed __int16)a4 listID:(id)a5 modifiedDate:(id)a6
{
  return [(REMManualOrdering *)self initWithObjectID:a3 listType:a4 listID:a5 topLevelElementIDs:MEMORY[0x1E4F1CBF0] secondaryLevelElementIDsByTopLevelElementID:MEMORY[0x1E4F1CC08] uncommitedElementsAccountID:0 modifiedDate:a6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(REMManualOrdering *)self objectID];
  uint64_t v5 = [(REMManualOrdering *)self listType];
  v6 = [(REMManualOrdering *)self listID];
  id v7 = objc_alloc(MEMORY[0x1E4F1C978]);
  v8 = [(REMManualOrdering *)self topLevelElementIDs];
  v9 = (void *)[v7 initWithArray:v8 copyItems:1];

  id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v11 = [(REMManualOrdering *)self secondaryLevelElementIDsByTopLevelElementID];
  v12 = (void *)[v10 initWithDictionary:v11 copyItems:1];

  v13 = [(REMManualOrdering *)self uncommitedElementsAccountID];
  v14 = [(REMManualOrdering *)self modifiedDate];
  id v15 = [[REMManualOrdering alloc] initWithObjectID:v4 listType:v5 listID:v6 topLevelElementIDs:v9 secondaryLevelElementIDsByTopLevelElementID:v12 uncommitedElementsAccountID:v13 modifiedDate:v14];

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(REMManualOrdering *)self objectID];
  [v4 encodeObject:v5 forKey:@"objectID"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMManualOrdering listType](self, "listType"), @"listType");
  v6 = [(REMManualOrdering *)self listID];
  [v4 encodeObject:v6 forKey:@"listID"];

  id v7 = [(REMManualOrdering *)self topLevelElementIDs];
  [v4 encodeObject:v7 forKey:@"topLevelElementIDs"];

  v8 = [(REMManualOrdering *)self secondaryLevelElementIDsByTopLevelElementID];
  [v4 encodeObject:v8 forKey:@"secondaryLevelElementIDsByTopLevelElementID"];

  v9 = [(REMManualOrdering *)self uncommitedElementsAccountID];
  [v4 encodeObject:v9 forKey:@"uncommitedElementsAccountID"];

  id v10 = [(REMManualOrdering *)self modifiedDate];
  [v4 encodeObject:v10 forKey:@"modifiedDate"];
}

- (REMManualOrdering)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];
  signed __int16 v22 = [v4 decodeIntegerForKey:@"listType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"listID"];
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"topLevelElementIDs"];
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
  id v15 = [v4 decodeObjectOfClasses:v14 forKey:@"secondaryLevelElementIDsByTopLevelElementID"];
  id v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uncommitedElementsAccountID"];
  id v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modifiedDate"];

  v18 = 0;
  if (v5 && v6 && v10 && v15 && v17)
  {
    v23.receiver = self;
    v23.super_class = (Class)REMManualOrdering;
    v19 = [(REMManualOrdering *)&v23 init];
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_objectID, v5);
      v20->_listType = v22;
      objc_storeStrong((id *)&v20->_listID, v6);
      objc_storeStrong((id *)&v20->_topLevelElementIDs, v10);
      objc_storeStrong((id *)&v20->_secondaryLevelElementIDsByTopLevelElementID, v15);
      objc_storeStrong((id *)&v20->_uncommitedElementsAccountID, v16);
      objc_storeStrong((id *)&v20->_modifiedDate, v17);
    }
    self = v20;
    v18 = self;
  }

  return v18;
}

+ (id)newObjectID
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [a1 objectIDWithUUID:v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_21;
  }
  uint64_t v5 = [(REMManualOrdering *)self objectID];
  uint64_t v6 = [v4 objectID];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    id v7 = (void *)v6;
    uint64_t v8 = [(REMManualOrdering *)self objectID];
    v9 = [v4 objectID];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_21;
    }
  }
  int v11 = [(REMManualOrdering *)self listType];
  if (v11 != [v4 listType])
  {
LABEL_21:
    char v36 = 0;
    goto LABEL_22;
  }
  uint64_t v12 = [(REMManualOrdering *)self listID];
  uint64_t v13 = [v4 listID];
  if (v12 == (void *)v13)
  {
  }
  else
  {
    v14 = (void *)v13;
    id v15 = [(REMManualOrdering *)self listID];
    id v16 = [v4 listID];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_21;
    }
  }
  v18 = [(REMManualOrdering *)self topLevelElementIDs];
  uint64_t v19 = [v4 topLevelElementIDs];
  if (v18 == (void *)v19)
  {
  }
  else
  {
    v20 = (void *)v19;
    v21 = [(REMManualOrdering *)self topLevelElementIDs];
    signed __int16 v22 = [v4 topLevelElementIDs];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_21;
    }
  }
  id v24 = [(REMManualOrdering *)self secondaryLevelElementIDsByTopLevelElementID];
  uint64_t v25 = [v4 secondaryLevelElementIDsByTopLevelElementID];
  if (v24 == (void *)v25)
  {
  }
  else
  {
    v26 = (void *)v25;
    v27 = [(REMManualOrdering *)self secondaryLevelElementIDsByTopLevelElementID];
    v28 = [v4 secondaryLevelElementIDsByTopLevelElementID];
    int v29 = [v27 isEqual:v28];

    if (!v29) {
      goto LABEL_21;
    }
  }
  v30 = [(REMManualOrdering *)self uncommitedElementsAccountID];
  uint64_t v31 = [v4 uncommitedElementsAccountID];
  if (v30 == (void *)v31)
  {
  }
  else
  {
    v32 = (void *)v31;
    v33 = [(REMManualOrdering *)self uncommitedElementsAccountID];
    v34 = [v4 uncommitedElementsAccountID];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_21;
    }
  }
  v38 = [(REMManualOrdering *)self modifiedDate];
  uint64_t v39 = [v4 modifiedDate];
  if (v38 == (void *)v39)
  {
    char v36 = 1;
    v40 = v38;
  }
  else
  {
    v40 = (void *)v39;
    v41 = [(REMManualOrdering *)self modifiedDate];
    v42 = [v4 modifiedDate];
    char v36 = [v41 isEqual:v42];
  }
LABEL_22:

  return v36;
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (signed)listType
{
  return self->_listType;
}

- (NSString)listID
{
  return self->_listID;
}

- (NSArray)topLevelElementIDs
{
  return self->_topLevelElementIDs;
}

- (NSDictionary)secondaryLevelElementIDsByTopLevelElementID
{
  return self->_secondaryLevelElementIDsByTopLevelElementID;
}

- (REMObjectID)uncommitedElementsAccountID
{
  return self->_uncommitedElementsAccountID;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_uncommitedElementsAccountID, 0);
  objc_storeStrong((id *)&self->_secondaryLevelElementIDsByTopLevelElementID, 0);
  objc_storeStrong((id *)&self->_topLevelElementIDs, 0);
  objc_storeStrong((id *)&self->_listID, 0);

  objc_storeStrong((id *)&self->_objectID, 0);
}

@end