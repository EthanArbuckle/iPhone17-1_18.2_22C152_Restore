@interface REMAlarmTrigger
+ (BOOL)supportsSecureCoding;
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (BOOL)isTemporal;
- (REMAlarmTrigger)init;
- (REMAlarmTrigger)initWithAlarmTrigger:(id)a3 objectID:(id)a4;
- (REMAlarmTrigger)initWithCoder:(id)a3;
- (REMAlarmTrigger)initWithObjectID:(id)a3;
- (REMObjectID)objectID;
- (id)_deepCopy;
- (void)encodeWithCoder:(id)a3;
- (void)setObjectID:(id)a3;
@end

@implementation REMAlarmTrigger

- (REMAlarmTrigger)initWithObjectID:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)REMAlarmTrigger;
  v6 = [(REMAlarmTrigger *)&v10 init];
  if (!v6) {
    goto LABEL_5;
  }
  v7 = objc_opt_class();
  if (![v7 isEqual:objc_opt_class()])
  {
    objc_storeStrong((id *)&v6->_objectID, a3);
LABEL_5:
    v8 = v6;
    goto LABEL_6;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Attempting to instantiate an abstract class. Please use a subclass of REMAlarmTrigger."];
  v8 = 0;
LABEL_6:

  return v8;
}

- (REMAlarmTrigger)initWithAlarmTrigger:(id)a3 objectID:(id)a4
{
  v6 = (REMObjectID *)a4;
  v7 = [a3 _deepCopy];

  objectID = v7->_objectID;
  v7->_objectID = v6;

  return v7;
}

- (REMAlarmTrigger)init
{
  v3 = (void *)[(id)objc_opt_class() newObjectID];
  v4 = [(REMAlarmTrigger *)self initWithObjectID:v3];

  return v4;
}

- (REMAlarmTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"objectID"];

  v6 = [(REMAlarmTrigger *)self initWithObjectID:v5];
  return v6;
}

- (BOOL)isTemporal
{
  return 0;
}

- (id)_deepCopy
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Abstract method called -[%@ %@]", v5, v6 format];

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMAlarmTrigger *)self objectID];
  [v4 encodeObject:v5 forKey:@"objectID"];
}

+ (id)newObjectID
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [a1 objectIDWithUUID:v3];

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [a1 cdEntityName];
  v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

+ (NSString)cdEntityName
{
  return (NSString *)@"REMCDAlarmTrigger";
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end