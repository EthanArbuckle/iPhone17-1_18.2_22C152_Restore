@interface REMReminderPredicateDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)andPredicateDescriptorWithDescriptors:(id)a3;
+ (id)orPredicateDescriptorWithDescriptors:(id)a3;
+ (id)predicateDescriptorForRemindersWithCompleted:(BOOL)a3;
+ (id)predicateDescriptorForRemindersWithDisplayDateBetween:(id)a3 and:(id)a4;
+ (id)predicateDescriptorForRemindersWithDisplayDateOnOrAfter:(id)a3;
+ (id)predicateDescriptorForRemindersWithDisplayDateOnOrBefore:(id)a3;
+ (id)predicateDescriptorForRemindersWithDueDateBetween:(id)a3 and:(id)a4;
+ (id)predicateDescriptorForRemindersWithDueDateOnOrAfter:(id)a3;
+ (id)predicateDescriptorForRemindersWithDueDateOnOrBefore:(id)a3;
+ (id)predicateDescriptorForRemindersWithListID:(id)a3;
+ (id)predicateDescriptorForRemindersWithObjectIDs:(id)a3;
+ (id)predicateDescriptorForRemindersWithParentReminderID:(id)a3;
+ (id)predicateDescriptorForRemindersWithTitleBeginsWith:(id)a3;
+ (id)predicateDescriptorForRemindersWithTitleContains:(id)a3;
+ (id)predicateDescriptorForRemindersWithTitleEndsWith:(id)a3;
+ (id)predicateDescriptorForRemindersWithTitleEquals:(id)a3;
- (BOOL)completed;
- (BOOL)isEqual:(id)a3;
- (NSArray)descriptors;
- (NSArray)objectIDs;
- (NSDate)endingDueDate;
- (NSDate)startingDueDate;
- (NSString)text;
- (REMObjectID)listID;
- (REMObjectID)parentReminderID;
- (REMReminderPredicateDescriptor)initWithCoder:(id)a3;
- (REMReminderPredicateDescriptor)initWithReminderPredicateDescriptor:(id)a3;
- (REMReminderPredicateDescriptor)initWithType:(int64_t)a3;
- (id)description;
- (int64_t)textMatching;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setCompleted:(BOOL)a3;
- (void)setDescriptors:(id)a3;
- (void)setEndingDueDate:(id)a3;
- (void)setListID:(id)a3;
- (void)setObjectIDs:(id)a3;
- (void)setParentReminderID:(id)a3;
- (void)setStartingDueDate:(id)a3;
- (void)setText:(id)a3;
- (void)setTextMatching:(int64_t)a3;
@end

@implementation REMReminderPredicateDescriptor

+ (id)andPredicateDescriptorWithDescriptors:(id)a3
{
  id v3 = a3;
  v4 = [[REMReminderPredicateDescriptor alloc] initWithType:8];
  [(REMReminderPredicateDescriptor *)v4 setDescriptors:v3];

  return v4;
}

+ (id)orPredicateDescriptorWithDescriptors:(id)a3
{
  id v3 = a3;
  v4 = [[REMReminderPredicateDescriptor alloc] initWithType:9];
  [(REMReminderPredicateDescriptor *)v4 setDescriptors:v3];

  return v4;
}

+ (id)predicateDescriptorForRemindersWithListID:(id)a3
{
  id v3 = a3;
  v4 = [[REMReminderPredicateDescriptor alloc] initWithType:0];
  [(REMReminderPredicateDescriptor *)v4 setListID:v3];

  return v4;
}

+ (id)predicateDescriptorForRemindersWithParentReminderID:(id)a3
{
  id v3 = a3;
  v4 = [[REMReminderPredicateDescriptor alloc] initWithType:1];
  [(REMReminderPredicateDescriptor *)v4 setParentReminderID:v3];

  return v4;
}

+ (id)predicateDescriptorForRemindersWithObjectIDs:(id)a3
{
  id v3 = a3;
  v4 = [[REMReminderPredicateDescriptor alloc] initWithType:2];
  [(REMReminderPredicateDescriptor *)v4 setObjectIDs:v3];

  return v4;
}

+ (id)predicateDescriptorForRemindersWithDueDateOnOrBefore:(id)a3
{
  id v3 = a3;
  v4 = [[REMReminderPredicateDescriptor alloc] initWithType:3];
  [(REMReminderPredicateDescriptor *)v4 setStartingDueDate:v3];

  return v4;
}

+ (id)predicateDescriptorForRemindersWithDueDateOnOrAfter:(id)a3
{
  id v3 = a3;
  v4 = [[REMReminderPredicateDescriptor alloc] initWithType:4];
  [(REMReminderPredicateDescriptor *)v4 setEndingDueDate:v3];

  return v4;
}

+ (id)predicateDescriptorForRemindersWithDueDateBetween:(id)a3 and:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[REMReminderPredicateDescriptor alloc] initWithType:5];
  [(REMReminderPredicateDescriptor *)v7 setStartingDueDate:v6];

  [(REMReminderPredicateDescriptor *)v7 setEndingDueDate:v5];

  return v7;
}

+ (id)predicateDescriptorForRemindersWithDisplayDateOnOrBefore:(id)a3
{
  id v3 = a3;
  v4 = [[REMReminderPredicateDescriptor alloc] initWithType:10];
  [(REMReminderPredicateDescriptor *)v4 setStartingDueDate:v3];

  return v4;
}

+ (id)predicateDescriptorForRemindersWithDisplayDateOnOrAfter:(id)a3
{
  id v3 = a3;
  v4 = [[REMReminderPredicateDescriptor alloc] initWithType:11];
  [(REMReminderPredicateDescriptor *)v4 setEndingDueDate:v3];

  return v4;
}

+ (id)predicateDescriptorForRemindersWithDisplayDateBetween:(id)a3 and:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[REMReminderPredicateDescriptor alloc] initWithType:12];
  [(REMReminderPredicateDescriptor *)v7 setStartingDueDate:v6];

  [(REMReminderPredicateDescriptor *)v7 setEndingDueDate:v5];

  return v7;
}

+ (id)predicateDescriptorForRemindersWithCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [[REMReminderPredicateDescriptor alloc] initWithType:6];
  [(REMReminderPredicateDescriptor *)v4 setCompleted:v3];

  return v4;
}

+ (id)predicateDescriptorForRemindersWithTitleEquals:(id)a3
{
  id v3 = a3;
  v4 = [[REMReminderPredicateDescriptor alloc] initWithType:7];
  [(REMReminderPredicateDescriptor *)v4 setText:v3];

  [(REMReminderPredicateDescriptor *)v4 setTextMatching:0];

  return v4;
}

+ (id)predicateDescriptorForRemindersWithTitleContains:(id)a3
{
  id v3 = a3;
  v4 = [[REMReminderPredicateDescriptor alloc] initWithType:7];
  [(REMReminderPredicateDescriptor *)v4 setText:v3];

  [(REMReminderPredicateDescriptor *)v4 setTextMatching:1];

  return v4;
}

+ (id)predicateDescriptorForRemindersWithTitleBeginsWith:(id)a3
{
  id v3 = a3;
  v4 = [[REMReminderPredicateDescriptor alloc] initWithType:7];
  [(REMReminderPredicateDescriptor *)v4 setText:v3];

  [(REMReminderPredicateDescriptor *)v4 setTextMatching:2];

  return v4;
}

+ (id)predicateDescriptorForRemindersWithTitleEndsWith:(id)a3
{
  id v3 = a3;
  v4 = [[REMReminderPredicateDescriptor alloc] initWithType:7];
  [(REMReminderPredicateDescriptor *)v4 setText:v3];

  [(REMReminderPredicateDescriptor *)v4 setTextMatching:3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReminderPredicateDescriptor)initWithType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)REMReminderPredicateDescriptor;
  result = [(REMReminderPredicateDescriptor *)&v5 init];
  if (result) {
    result->_type = a3;
  }
  return result;
}

- (REMReminderPredicateDescriptor)initWithReminderPredicateDescriptor:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)REMReminderPredicateDescriptor;
  objc_super v5 = [(REMReminderPredicateDescriptor *)&v21 init];
  if (v5)
  {
    v5->_type = [v4 type];
    uint64_t v6 = [v4 objectIDs];
    objectIDs = v5->_objectIDs;
    v5->_objectIDs = (NSArray *)v6;

    uint64_t v8 = [v4 listID];
    listID = v5->_listID;
    v5->_listID = (REMObjectID *)v8;

    uint64_t v10 = [v4 parentReminderID];
    parentReminderID = v5->_parentReminderID;
    v5->_parentReminderID = (REMObjectID *)v10;

    uint64_t v12 = [v4 startingDueDate];
    startingDueDate = v5->_startingDueDate;
    v5->_startingDueDate = (NSDate *)v12;

    uint64_t v14 = [v4 endingDueDate];
    endingDueDate = v5->_endingDueDate;
    v5->_endingDueDate = (NSDate *)v14;

    v5->_completed = [v4 completed];
    uint64_t v16 = [v4 descriptors];
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSArray *)v16;

    uint64_t v18 = [v4 text];
    text = v5->_text;
    v5->_text = (NSString *)v18;

    v5->_textMatching = [v4 textMatching];
  }

  return v5;
}

- (REMReminderPredicateDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)REMReminderPredicateDescriptor;
  objc_super v5 = [(REMReminderPredicateDescriptor *)&v31 init];
  if (v5)
  {
    unint64_t v6 = [v4 decodeIntegerForKey:@"type"];
    if (v6 >= 0xD)
    {
      v7 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        -[REMReminderPredicateDescriptor initWithCoder:](v6, v7);
      }

      unint64_t v6 = 0;
    }
    v5->_type = v6;
    uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"objectIDs"];
    objectIDs = v5->_objectIDs;
    v5->_objectIDs = (NSArray *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"listID"];
    listID = v5->_listID;
    v5->_listID = (REMObjectID *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parentReminderID"];
    parentReminderID = v5->_parentReminderID;
    v5->_parentReminderID = (REMObjectID *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startingDueDate"];
    startingDueDate = v5->_startingDueDate;
    v5->_startingDueDate = (NSDate *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endingDueDate"];
    endingDueDate = v5->_endingDueDate;
    v5->_endingDueDate = (NSDate *)v19;

    v5->_completed = [v4 decodeBoolForKey:@"completed"];
    objc_super v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"descriptors"];
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSArray *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"text"];
    text = v5->_text;
    v5->_text = (NSString *)v26;

    unint64_t v28 = [v4 decodeIntegerForKey:@"textMatching"];
    if (v28 >= 4)
    {
      v29 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        -[REMReminderPredicateDescriptor initWithCoder:](v28, v29);
      }

      unint64_t v28 = 0;
    }
    v5->_textMatching = v28;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  objc_msgSend(v11, "encodeInteger:forKey:", -[REMReminderPredicateDescriptor type](self, "type"), @"type");
  id v4 = [(REMReminderPredicateDescriptor *)self objectIDs];
  [v11 encodeObject:v4 forKey:@"objectIDs"];

  objc_super v5 = [(REMReminderPredicateDescriptor *)self listID];
  [v11 encodeObject:v5 forKey:@"listID"];

  unint64_t v6 = [(REMReminderPredicateDescriptor *)self parentReminderID];
  [v11 encodeObject:v6 forKey:@"parentReminderID"];

  v7 = [(REMReminderPredicateDescriptor *)self startingDueDate];
  [v11 encodeObject:v7 forKey:@"startingDueDate"];

  uint64_t v8 = [(REMReminderPredicateDescriptor *)self endingDueDate];
  [v11 encodeObject:v8 forKey:@"endingDueDate"];

  objc_msgSend(v11, "encodeBool:forKey:", -[REMReminderPredicateDescriptor completed](self, "completed"), @"completed");
  uint64_t v9 = [(REMReminderPredicateDescriptor *)self descriptors];
  [v11 encodeObject:v9 forKey:@"descriptors"];

  uint64_t v10 = [(REMReminderPredicateDescriptor *)self text];
  [v11 encodeObject:v10 forKey:@"text"];

  objc_msgSend(v11, "encodeInteger:forKey:", -[REMReminderPredicateDescriptor textMatching](self, "textMatching"), @"textMatching");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMReminderPredicateDescriptor *)a3;
  objc_super v5 = v4;
  if (self != v4)
  {
    unint64_t v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_33;
    }
    int64_t v7 = [(REMReminderPredicateDescriptor *)self type];
    if (v7 != [(REMReminderPredicateDescriptor *)v6 type]) {
      goto LABEL_33;
    }
    uint64_t v8 = [(REMReminderPredicateDescriptor *)self objectIDs];
    uint64_t v9 = [(REMReminderPredicateDescriptor *)v6 objectIDs];
    if (v8 == (void *)v9)
    {
    }
    else
    {
      uint64_t v10 = (void *)v9;
      id v11 = [(REMReminderPredicateDescriptor *)self objectIDs];
      uint64_t v12 = [(REMReminderPredicateDescriptor *)v6 objectIDs];
      int v13 = [v11 isEqual:v12];

      if (!v13) {
        goto LABEL_33;
      }
    }
    uint64_t v15 = [(REMReminderPredicateDescriptor *)self listID];
    uint64_t v16 = [(REMReminderPredicateDescriptor *)v6 listID];
    if (v15 == (void *)v16)
    {
    }
    else
    {
      uint64_t v17 = (void *)v16;
      uint64_t v18 = [(REMReminderPredicateDescriptor *)self listID];
      uint64_t v19 = [(REMReminderPredicateDescriptor *)v6 listID];
      int v20 = [v18 isEqual:v19];

      if (!v20) {
        goto LABEL_33;
      }
    }
    objc_super v21 = [(REMReminderPredicateDescriptor *)self parentReminderID];
    uint64_t v22 = [(REMReminderPredicateDescriptor *)v6 parentReminderID];
    if (v21 == (void *)v22)
    {
    }
    else
    {
      v23 = (void *)v22;
      uint64_t v24 = [(REMReminderPredicateDescriptor *)self parentReminderID];
      v25 = [(REMReminderPredicateDescriptor *)v6 parentReminderID];
      int v26 = [v24 isEqual:v25];

      if (!v26) {
        goto LABEL_33;
      }
    }
    v27 = [(REMReminderPredicateDescriptor *)self startingDueDate];
    uint64_t v28 = [(REMReminderPredicateDescriptor *)v6 startingDueDate];
    if (v27 == (void *)v28)
    {
    }
    else
    {
      v29 = (void *)v28;
      v30 = [(REMReminderPredicateDescriptor *)self startingDueDate];
      objc_super v31 = [(REMReminderPredicateDescriptor *)v6 startingDueDate];
      int v32 = [v30 isEqual:v31];

      if (!v32) {
        goto LABEL_33;
      }
    }
    v33 = [(REMReminderPredicateDescriptor *)self endingDueDate];
    uint64_t v34 = [(REMReminderPredicateDescriptor *)v6 endingDueDate];
    if (v33 == (void *)v34)
    {
    }
    else
    {
      v35 = (void *)v34;
      v36 = [(REMReminderPredicateDescriptor *)self endingDueDate];
      v37 = [(REMReminderPredicateDescriptor *)v6 endingDueDate];
      int v38 = [v36 isEqual:v37];

      if (!v38) {
        goto LABEL_33;
      }
    }
    BOOL v39 = [(REMReminderPredicateDescriptor *)self completed];
    if (v39 == [(REMReminderPredicateDescriptor *)v6 completed])
    {
      v40 = [(REMReminderPredicateDescriptor *)self descriptors];
      uint64_t v41 = [(REMReminderPredicateDescriptor *)v6 descriptors];
      if (v40 == (void *)v41)
      {
      }
      else
      {
        v42 = (void *)v41;
        v43 = [(REMReminderPredicateDescriptor *)self descriptors];
        v44 = [(REMReminderPredicateDescriptor *)v6 descriptors];
        int v45 = [v43 isEqual:v44];

        if (!v45) {
          goto LABEL_33;
        }
      }
      int64_t v46 = [(REMReminderPredicateDescriptor *)self textMatching];
      if (v46 == [(REMReminderPredicateDescriptor *)v6 textMatching])
      {
        v47 = [(REMReminderPredicateDescriptor *)self text];
        uint64_t v48 = [(REMReminderPredicateDescriptor *)v6 text];
        if (v47 == (void *)v48)
        {
          char v14 = 1;
          v49 = v47;
        }
        else
        {
          v49 = (void *)v48;
          v50 = [(REMReminderPredicateDescriptor *)self text];
          v51 = [(REMReminderPredicateDescriptor *)v6 text];
          char v14 = [v50 isEqual:v51];
        }
        goto LABEL_34;
      }
    }
LABEL_33:
    char v14 = 0;
LABEL_34:

    goto LABEL_35;
  }
  char v14 = 1;
LABEL_35:

  return v14;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(REMReminderPredicateDescriptor *)self objectIDs];

  if (v4)
  {
    objc_super v5 = NSString;
    unint64_t v6 = [(REMReminderPredicateDescriptor *)self objectIDs];
    int64_t v7 = [v5 stringWithFormat:@"objectIDs: %@", v6];
    [v3 addObject:v7];
  }
  uint64_t v8 = [(REMReminderPredicateDescriptor *)self listID];

  if (v8)
  {
    uint64_t v9 = NSString;
    uint64_t v10 = [(REMReminderPredicateDescriptor *)self listID];
    id v11 = [v9 stringWithFormat:@"listID: %@", v10];
    [v3 addObject:v11];
  }
  uint64_t v12 = [(REMReminderPredicateDescriptor *)self parentReminderID];

  if (v12)
  {
    int v13 = NSString;
    char v14 = [(REMReminderPredicateDescriptor *)self parentReminderID];
    uint64_t v15 = [v13 stringWithFormat:@"parentReminderID: %@", v14];
    [v3 addObject:v15];
  }
  uint64_t v16 = [(REMReminderPredicateDescriptor *)self startingDueDate];

  if (v16)
  {
    uint64_t v17 = NSString;
    uint64_t v18 = [(REMReminderPredicateDescriptor *)self startingDueDate];
    uint64_t v19 = [v17 stringWithFormat:@"startingDueDate: %@", v18];
    [v3 addObject:v19];
  }
  int v20 = [(REMReminderPredicateDescriptor *)self endingDueDate];

  if (v20)
  {
    objc_super v21 = NSString;
    uint64_t v22 = [(REMReminderPredicateDescriptor *)self endingDueDate];
    v23 = [v21 stringWithFormat:@"endingDueDate: %@", v22];
    [v3 addObject:v23];
  }
  if ([(REMReminderPredicateDescriptor *)self type] == 6)
  {
    uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"completed: %d", -[REMReminderPredicateDescriptor completed](self, "completed"));
    [v3 addObject:v24];
  }
  v25 = [(REMReminderPredicateDescriptor *)self descriptors];

  if (v25)
  {
    int v26 = NSString;
    v27 = [(REMReminderPredicateDescriptor *)self descriptors];
    uint64_t v28 = [v26 stringWithFormat:@"descriptors: %@", v27];
    [v3 addObject:v28];
  }
  v29 = [(REMReminderPredicateDescriptor *)self text];

  if (v29)
  {
    v30 = NSString;
    int64_t v31 = [(REMReminderPredicateDescriptor *)self textMatching];
    int v32 = [(REMReminderPredicateDescriptor *)self text];
    v33 = [v30 stringWithFormat:@"textMatching: %ld text: %@", v31, v32];
    [v3 addObject:v33];
  }
  uint64_t v34 = [v3 componentsJoinedByString:@" "];
  v35 = [NSString stringWithFormat:@"<%@: %p type: %ld %@>", objc_opt_class(), self, -[REMReminderPredicateDescriptor type](self, "type"), v34];

  return v35;
}

- (int64_t)type
{
  return self->_type;
}

- (REMObjectID)listID
{
  return self->_listID;
}

- (void)setListID:(id)a3
{
}

- (REMObjectID)parentReminderID
{
  return self->_parentReminderID;
}

- (void)setParentReminderID:(id)a3
{
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (void)setObjectIDs:(id)a3
{
}

- (NSDate)startingDueDate
{
  return self->_startingDueDate;
}

- (void)setStartingDueDate:(id)a3
{
}

- (NSDate)endingDueDate
{
  return self->_endingDueDate;
}

- (void)setEndingDueDate:(id)a3
{
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void)setDescriptors:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (int64_t)textMatching
{
  return self->_textMatching;
}

- (void)setTextMatching:(int64_t)a3
{
  self->_textMatching = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_endingDueDate, 0);
  objc_storeStrong((id *)&self->_startingDueDate, 0);
  objc_storeStrong((id *)&self->_objectIDs, 0);
  objc_storeStrong((id *)&self->_parentReminderID, 0);

  objc_storeStrong((id *)&self->_listID, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMReminderPredicateDescriptorTextMatching %ld", (uint8_t *)&v2, 0xCu);
}

- (void)initWithCoder:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_FAULT, "Unknown REMReminderPredicateDescriptorType %ld", (uint8_t *)&v2, 0xCu);
}

@end