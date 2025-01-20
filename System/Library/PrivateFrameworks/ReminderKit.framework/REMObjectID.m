@interface REMObjectID
+ (BOOL)supportsSecureCoding;
+ (REMObjectID)objectIDWithURL:(id)a3;
+ (REMObjectID)objectIDWithUUID:(id)a3 entityName:(id)a4;
+ (void)initialize;
+ (void)rem_registerClassAtCRCoderIfNeeded;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)entityName;
- (NSString)stringRepresentation;
- (NSURL)urlRepresentation;
- (NSUUID)uuid;
- (REMObjectID)initWithCRCoder:(id)a3;
- (REMObjectID)initWithCoder:(id)a3;
- (REMObjectID)initWithUUID:(id)a3 entityName:(id)a4;
- (id)deltaSince:(id)a3 in:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCRCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWith:(id)a3;
- (void)setDocument:(id)a3;
@end

@implementation REMObjectID

- (NSString)description
{
  v2 = [(REMObjectID *)self stringRepresentation];
  v3 = NSString;
  v4 = objc_msgSend(v2, "rem_humanReadableIdentifier");
  v5 = [v3 stringWithFormat:@"%@~%@", v4, v2];

  return (NSString *)v5;
}

- (NSString)stringRepresentation
{
  v2 = NSString;
  v3 = [(REMObjectID *)self urlRepresentation];
  v4 = [v3 absoluteString];
  v5 = [v2 stringWithFormat:@"<%@>", v4];

  return (NSString *)v5;
}

- (NSURL)urlRepresentation
{
  v3 = NSString;
  v4 = [(REMObjectID *)self entityName];
  v5 = [(REMObjectID *)self uuid];
  v6 = [v3 stringWithFormat:@"%@://%@/%@", @"x-apple-reminderkit", v4, v5];

  v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];

  return (NSURL *)v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMObjectID *)self entityName];
  [v4 encodeObject:v5 forKey:@"entityName"];

  id v6 = [(REMObjectID *)self uuid];
  [v4 encodeObject:v6 forKey:@"uuid"];
}

- (NSString)entityName
{
  return self->_entityName;
}

- (unint64_t)hash
{
  v2 = [(REMObjectID *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMObjectID *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else if (v4 {
         && ((Class = object_getClass(self), Class == object_getClass(v5))
  }
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    v7 = v5;
    v8 = [(REMObjectID *)self uuid];
    v9 = [(REMObjectID *)v7 uuid];
    if (v8 == v9)
    {
      char v12 = 1;
    }
    else
    {
      v10 = [(REMObjectID *)self uuid];
      v11 = [(REMObjectID *)v7 uuid];
      char v12 = [v10 isEqual:v11];
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

+ (REMObjectID)objectIDWithURL:(id)a3
{
  id v4 = a3;
  v5 = [v4 scheme];
  id v6 = [v4 host];
  v7 = [v4 lastPathComponent];
  v8 = [v4 pathComponents];
  uint64_t v9 = [v8 count];

  v10 = 0;
  if (v9 == 2 && v7) {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
  }
  if ([v5 isEqualToString:@"x-apple-reminderkit"]
    && [v6 length]
    && v10)
  {
    v11 = (void *)[objc_alloc((Class)a1) initWithUUID:v10 entityName:v6];
  }
  else
  {
    char v12 = +[REMLogStore utility];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      +[REMObjectID objectIDWithURL:]((uint64_t)v4, v12);
    }

    v11 = 0;
  }

  return (REMObjectID *)v11;
}

- (REMObjectID)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityName"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];

  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = [(REMObjectID *)self initWithUUID:v6 entityName:v5];
    v8 = self;
  }

  return v8;
}

+ (REMObjectID)objectIDWithUUID:(id)a3 entityName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithUUID:v7 entityName:v6];

  return (REMObjectID *)v8;
}

- (REMObjectID)initWithUUID:(id)a3 entityName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    uint64_t v9 = +[REMLogStore utility];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[REMObjectID initWithUUID:entityName:](v6, (uint64_t)v8, v9);
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)REMObjectID;
  v10 = [(REMObjectID *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v6 copy];
    uuid = v10->_uuid;
    v10->_uuid = (NSUUID *)v11;

    uint64_t v13 = [v8 copy];
    entityName = v10->_entityName;
    v10->_entityName = (NSString *)v13;
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityName, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(a1, "rem_registerClassAtCRCoderIfNeeded");
  }
}

+ (void)rem_registerClassAtCRCoderIfNeeded
{
  if (CR_REMObjectID_registerClass_onceToken != -1) {
    dispatch_once(&CR_REMObjectID_registerClass_onceToken, &__block_literal_global_27);
  }
}

- (void)mergeWith:(id)a3
{
  id v5 = a3;
  if (!-[REMObjectID isEqual:](self, "isEqual:"))
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Cannot merge REMObjectID with different value." userInfo:0];
    objc_exception_throw(v4);
  }
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  return 0;
}

- (void)setDocument:(id)a3
{
  if (CR_REMObjectID_registerClass_onceToken != -1) {
    dispatch_once(&CR_REMObjectID_registerClass_onceToken, &__block_literal_global_27);
  }
}

- (REMObjectID)initWithCRCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeStringForKey:@"entityName"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithCRCoder:v4];

  if (v6) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = [(REMObjectID *)self initWithUUID:v6 entityName:v5];
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCRCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMObjectID *)self entityName];
  [v4 encodeString:v5 forKey:@"entityName"];

  id v6 = [(REMObjectID *)self uuid];
  [v6 encodeWithCRCoder:v4];
}

- (NSString)debugDescription
{
  unint64_t v3 = [(REMObjectID *)self stringRepresentation];
  id v4 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)REMObjectID;
  id v5 = [(REMObjectID *)&v9 description];
  id v6 = objc_msgSend(v3, "rem_humanReadableIdentifier");
  BOOL v7 = [v4 stringWithFormat:@"<%@>%@~%@", v5, v6, v3];

  return (NSString *)v7;
}

+ (void)objectIDWithURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B9AA2000, a2, OS_LOG_TYPE_DEBUG, "Failed to create REMObjectID {url: %@}", (uint8_t *)&v2, 0xCu);
}

- (void)initWithUUID:(NSObject *)a3 entityName:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [a1 UUIDString];
  int v6 = 138412546;
  BOOL v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_fault_impl(&dword_1B9AA2000, a3, OS_LOG_TYPE_FAULT, "REMObjectID: nil value passed to non-nil parameter. Something must have gone wrong. {uuid: %@, entityName: %@}", (uint8_t *)&v6, 0x16u);
}

@end