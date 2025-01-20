@interface PKCloudStoreContainerChangeEvent
+ (BOOL)supportsSecureCoding;
+ (id)_csvSafeString:(id)a3;
+ (id)_csvSafeStringForEvent:(id)a3;
+ (id)_dateFormatter;
+ (id)csvStringForEvents:(id)a3;
+ (id)intervalBeginEventWithType:(unint64_t)a3 containerIdentifier:(id)a4 stateName:(id)a5 objectNames:(id)a6 error:(id)a7 changeToken:(id)a8 operationGroupName:(id)a9 operationGroupNameSuffix:(id)a10;
+ (id)intervalEndEventWithBeginUniqueIdentifier:(id)a3 error:(id)a4;
+ (id)signpostEventWithType:(unint64_t)a3 containerIdentifier:(id)a4 stateName:(id)a5 objectNames:(id)a6 error:(id)a7 changeToken:(id)a8 operationGroupName:(id)a9 operationGroupNameSuffix:(id)a10;
+ (id)writeCSVFileForEvents:(id)a3 error:(id *)a4;
+ (void)populateEndIntervalEvent:(id)a3 withBeginIntervalEvent:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)objectNames;
- (NSData)changeToken;
- (NSDate)timestamp;
- (NSString)beginIntervalEventIdentifier;
- (NSString)containerIdentifier;
- (NSString)errorDescription;
- (NSString)identifier;
- (NSString)operationGroupName;
- (NSString)operationGroupNameSuffix;
- (NSString)stateName;
- (PKCloudStoreContainerChangeEvent)initWithChangeType:(unint64_t)a3 beginUniqueIdentifier:(id)a4 error:(id)a5;
- (PKCloudStoreContainerChangeEvent)initWithCoder:(id)a3;
- (PKCloudStoreContainerChangeEvent)initWithEventType:(unint64_t)a3 changeType:(unint64_t)a4 containerIdentifier:(id)a5 beginUniqueIdentifier:(id)a6 stateName:(id)a7 objectNames:(id)a8 error:(id)a9 changeToken:(id)a10 operationGroupName:(id)a11 operationGroupNameSuffix:(id)a12;
- (double)timeInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)changeType;
- (unint64_t)eventType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBeginIntervalEventIdentifier:(id)a3;
- (void)setChangeToken:(id)a3;
- (void)setChangeType:(unint64_t)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setErrorDescription:(id)a3;
- (void)setEventType:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setObjectNames:(id)a3;
- (void)setOperationGroupName:(id)a3;
- (void)setOperationGroupNameSuffix:(id)a3;
- (void)setStateName:(id)a3;
- (void)setTimeInterval:(double)a3;
- (void)setTimestamp:(id)a3;
@end

@implementation PKCloudStoreContainerChangeEvent

- (PKCloudStoreContainerChangeEvent)initWithChangeType:(unint64_t)a3 beginUniqueIdentifier:(id)a4 error:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKCloudStoreContainerChangeEvent;
  v11 = [(PKCloudStoreContainerChangeEvent *)&v21 init];
  v12 = v11;
  if (v11)
  {
    v11->_changeType = a3;
    objc_storeStrong((id *)&v11->_beginIntervalEventIdentifier, a4);
    uint64_t v13 = [v10 debugDescription];
    errorDescription = v12->_errorDescription;
    v12->_errorDescription = (NSString *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    timestamp = v12->_timestamp;
    v12->_timestamp = (NSDate *)v15;

    v17 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v18 = [v17 UUIDString];
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v18;
  }
  return v12;
}

- (PKCloudStoreContainerChangeEvent)initWithEventType:(unint64_t)a3 changeType:(unint64_t)a4 containerIdentifier:(id)a5 beginUniqueIdentifier:(id)a6 stateName:(id)a7 objectNames:(id)a8 error:(id)a9 changeToken:(id)a10 operationGroupName:(id)a11 operationGroupNameSuffix:(id)a12
{
  id v27 = a5;
  id v26 = a7;
  id v25 = a8;
  id v24 = a10;
  id v23 = a11;
  id v18 = a12;
  v19 = [(PKCloudStoreContainerChangeEvent *)self initWithChangeType:a4 beginUniqueIdentifier:a6 error:a9];
  v20 = v19;
  if (v19)
  {
    v19->_eventType = a3;
    objc_storeStrong((id *)&v19->_containerIdentifier, a5);
    objc_storeStrong((id *)&v20->_stateName, a7);
    objc_storeStrong((id *)&v20->_objectNames, a8);
    objc_storeStrong((id *)&v20->_changeToken, a10);
    objc_storeStrong((id *)&v20->_operationGroupName, a11);
    objc_storeStrong((id *)&v20->_operationGroupNameSuffix, a12);
  }

  return v20;
}

+ (id)signpostEventWithType:(unint64_t)a3 containerIdentifier:(id)a4 stateName:(id)a5 objectNames:(id)a6 error:(id)a7 changeToken:(id)a8 operationGroupName:(id)a9 operationGroupNameSuffix:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = [[PKCloudStoreContainerChangeEvent alloc] initWithEventType:a3 changeType:1 containerIdentifier:v22 beginUniqueIdentifier:0 stateName:v21 objectNames:v20 error:v19 changeToken:v18 operationGroupName:v17 operationGroupNameSuffix:v16];

  return v23;
}

+ (id)intervalBeginEventWithType:(unint64_t)a3 containerIdentifier:(id)a4 stateName:(id)a5 objectNames:(id)a6 error:(id)a7 changeToken:(id)a8 operationGroupName:(id)a9 operationGroupNameSuffix:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = [[PKCloudStoreContainerChangeEvent alloc] initWithEventType:a3 changeType:2 containerIdentifier:v22 beginUniqueIdentifier:0 stateName:v21 objectNames:v20 error:v19 changeToken:v18 operationGroupName:v17 operationGroupNameSuffix:v16];

  return v23;
}

+ (id)intervalEndEventWithBeginUniqueIdentifier:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[PKCloudStoreContainerChangeEvent alloc] initWithChangeType:2 beginUniqueIdentifier:v6 error:v5];

  return v7;
}

- (id)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v3 setObject:self->_identifier forKeyedSubscript:@"identifier"];
  unint64_t changeType = self->_changeType;
  id v5 = @"unknown";
  if (changeType == 1) {
    id v5 = @"signpost";
  }
  if (changeType == 2) {
    id v6 = @"interval";
  }
  else {
    id v6 = v5;
  }
  [v3 setObject:v6 forKeyedSubscript:@"changeType"];
  v7 = PKCloudStoreContainerChangeEventTypeToString(self->_eventType);
  [v3 setObject:v7 forKeyedSubscript:@"eventType"];

  v8 = [(NSDate *)self->_timestamp description];
  [v3 setObject:v8 forKeyedSubscript:@"timestamp"];

  if ([(NSString *)self->_containerIdentifier length]) {
    [v3 setObject:self->_containerIdentifier forKeyedSubscript:@"containerIdentifier"];
  }
  if ([(NSString *)self->_beginIntervalEventIdentifier length]) {
    [v3 setObject:self->_beginIntervalEventIdentifier forKeyedSubscript:@"beginIntervalEventIdentifier"];
  }
  if ([@"operationGroupName" length]) {
    [v3 setObject:self->_operationGroupName forKeyedSubscript:@"operationGroupName"];
  }
  if ([(NSString *)self->_operationGroupNameSuffix length]) {
    [v3 setObject:self->_operationGroupNameSuffix forKeyedSubscript:@"operationGroupNameSuffix"];
  }
  if ([(NSString *)self->_stateName length]) {
    [v3 setObject:self->_stateName forKeyedSubscript:@"stateName"];
  }
  if ([(NSString *)self->_errorDescription length]) {
    [v3 setObject:self->_errorDescription forKeyedSubscript:@"errorDescription"];
  }
  if ([(NSData *)self->_changeToken length])
  {
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSData hash](self->_changeToken, "hash"));
    [v3 setObject:v9 forKeyedSubscript:@"changeToken"];
  }
  if ([(NSArray *)self->_objectNames count]) {
    [v3 setObject:self->_objectNames forKeyedSubscript:@"objectNames"];
  }
  if (self->_timeInterval != 0.0)
  {
    id v10 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v3 setObject:v10 forKeyedSubscript:@"timeInterval"];
  }
  v11 = (void *)[v3 copy];

  return v11;
}

+ (id)csvStringForEvents:(id)a3
{
  v25[13] = *MEMORY[0x1E4F143B8];
  v25[0] = @"identifier";
  v25[1] = @"changeType";
  v25[2] = @"eventType";
  v25[3] = @"containerIdentifier";
  v25[4] = @"beginIntervalEventIdentifier";
  v25[5] = @"operationGroupName";
  v25[6] = @"operationGroupNameSuffix";
  v25[7] = @"timestamp";
  v25[8] = @"errorDescription";
  v25[9] = @"changeToken";
  v25[10] = @"stateName";
  v25[11] = @"objectNames";
  v25[12] = @"timeInterval";
  id v3 = (void *)MEMORY[0x1E4F1C978];
  id v4 = a3;
  id v5 = [v3 arrayWithObjects:v25 count:13];
  id v6 = [v5 componentsJoinedByString:@","];
  v7 = (void *)[v6 mutableCopy];

  [v7 appendString:@"\n"];
  v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"timestamp" ascending:1];
  id v24 = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  id v10 = [v4 sortedArrayUsingDescriptors:v9];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = +[PKCloudStoreContainerChangeEvent _csvSafeStringForEvent:](PKCloudStoreContainerChangeEvent, "_csvSafeStringForEvent:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        [v7 appendString:v16];

        [v7 appendString:@"\n"];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  id v17 = (void *)[v7 copy];
  return v17;
}

+ (id)writeCSVFileForEvents:(id)a3 error:(id *)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = NSTemporaryDirectory();
  v8 = [v7 stringByAppendingPathComponent:@"cloudStoreContainerChangeHistory"];

  id v9 = NSString;
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  [v10 timeIntervalSince1970];
  uint64_t v12 = objc_msgSend(v9, "stringWithFormat:", @"changeHistory-%ld.csv", (uint64_t)v11);

  uint64_t v13 = [v8 stringByAppendingPathComponent:v12];
  if (([v6 fileExistsAtPath:v8] & 1) != 0
    || (id v27 = 0,
        [v6 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v27],
        (id v14 = v27) == 0))
  {
    id v17 = +[PKCloudStoreContainerChangeEvent csvStringForEvents:v5];
    id v18 = [v17 dataUsingEncoding:4];

    if ([v6 createFileAtPath:v13 contents:v18 attributes:0])
    {
      id v16 = v13;
      id v15 = 0;
    }
    else
    {
      id v26 = v5;
      long long v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28568];
      v29[0] = @"Error";
      uint64_t v21 = *MEMORY[0x1E4F285A0];
      v28[0] = v20;
      v28[1] = v21;
      [NSString stringWithFormat:@"Error creating %@", v12];
      id v23 = v22 = a4;
      v29[1] = v23;
      id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
      id v15 = [v19 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v24];

      if (v22)
      {
        id v15 = v15;
        id v16 = 0;
        *long long v22 = v15;
      }
      else
      {
        id v16 = 0;
      }
      id v5 = v26;
    }
  }
  else
  {
    id v15 = v14;
    if (a4)
    {
      id v15 = v14;
      id v16 = 0;
      *a4 = v15;
    }
    else
    {
      id v16 = 0;
    }
  }

  return v16;
}

+ (void)populateEndIntervalEvent:(id)a3 withBeginIntervalEvent:(id)a4
{
  id v5 = a4;
  id v16 = a3;
  objc_msgSend(v16, "setChangeType:", objc_msgSend(v5, "changeType"));
  objc_msgSend(v16, "setEventType:", objc_msgSend(v5, "eventType"));
  id v6 = [v5 containerIdentifier];
  [v16 setContainerIdentifier:v6];

  v7 = [v5 operationGroupName];
  [v16 setOperationGroupName:v7];

  v8 = [v5 operationGroupNameSuffix];
  [v16 setOperationGroupNameSuffix:v8];

  id v9 = [v5 stateName];
  [v16 setStateName:v9];

  id v10 = [v5 changeToken];
  [v16 setChangeToken:v10];

  double v11 = [v5 objectNames];
  [v16 setObjectNames:v11];

  uint64_t v12 = [v16 timestamp];
  uint64_t v13 = [v5 timestamp];

  [v12 timeIntervalSinceDate:v13];
  double v15 = v14;

  [v16 setTimeInterval:v15];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreContainerChangeEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKCloudStoreContainerChangeEvent;
  id v5 = [(PKCloudStoreContainerChangeEvent *)&v30 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_unint64_t changeType = [v4 decodeIntegerForKey:@"changeType"];
    v5->_eventType = [v4 decodeIntegerForKey:@"eventType"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerIdentifier"];
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"beginIntervalEventIdentifier"];
    beginIntervalEventIdentifier = v5->_beginIntervalEventIdentifier;
    v5->_beginIntervalEventIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operationGroupName"];
    operationGroupName = v5->_operationGroupName;
    v5->_operationGroupName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operationGroupNameSuffix"];
    operationGroupNameSuffix = v5->_operationGroupNameSuffix;
    v5->_operationGroupNameSuffix = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stateName"];
    stateName = v5->_stateName;
    v5->_stateName = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"changeToken"];
    changeToken = v5->_changeToken;
    v5->_changeToken = (NSData *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"errorDescription"];
    errorDescription = v5->_errorDescription;
    v5->_errorDescription = (NSString *)v22;

    id v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    id v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"objectNames"];
    objectNames = v5->_objectNames;
    v5->_objectNames = (NSArray *)v27;

    v5->_timeInterval = (double)[v4 decodeIntegerForKey:@"timeInterval"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeInteger:self->_changeType forKey:@"changeType"];
  [v5 encodeInteger:self->_eventType forKey:@"eventType"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeObject:self->_containerIdentifier forKey:@"containerIdentifier"];
  [v5 encodeObject:self->_beginIntervalEventIdentifier forKey:@"beginIntervalEventIdentifier"];
  [v5 encodeObject:self->_operationGroupName forKey:@"operationGroupName"];
  [v5 encodeObject:self->_operationGroupNameSuffix forKey:@"operationGroupNameSuffix"];
  [v5 encodeObject:self->_stateName forKey:@"stateName"];
  [v5 encodeObject:self->_changeToken forKey:@"changeToken"];
  [v5 encodeObject:self->_errorDescription forKey:@"errorDescription"];
  [v5 encodeObject:self->_objectNames forKey:@"objectNames"];
  [v5 encodeInteger:(uint64_t)self->_timeInterval forKey:@"timeInterval"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKCloudStoreContainerChangeEvent allocWithZone:](PKCloudStoreContainerChangeEvent, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_unint64_t changeType = self->_changeType;
  v5->_eventType = self->_eventType;
  uint64_t v8 = [(NSDate *)self->_timestamp copyWithZone:a3];
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSDate *)v8;

  uint64_t v10 = [(NSString *)self->_containerIdentifier copyWithZone:a3];
  containerIdentifier = v5->_containerIdentifier;
  v5->_containerIdentifier = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_beginIntervalEventIdentifier copyWithZone:a3];
  beginIntervalEventIdentifier = v5->_beginIntervalEventIdentifier;
  v5->_beginIntervalEventIdentifier = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_operationGroupName copyWithZone:a3];
  operationGroupName = v5->_operationGroupName;
  v5->_operationGroupName = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_operationGroupNameSuffix copyWithZone:a3];
  operationGroupNameSuffix = v5->_operationGroupNameSuffix;
  v5->_operationGroupNameSuffix = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_stateName copyWithZone:a3];
  stateName = v5->_stateName;
  v5->_stateName = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_errorDescription copyWithZone:a3];
  errorDescription = v5->_errorDescription;
  v5->_errorDescription = (NSString *)v20;

  uint64_t v22 = [(NSData *)self->_changeToken copyWithZone:a3];
  changeToken = v5->_changeToken;
  v5->_changeToken = (NSData *)v22;

  uint64_t v24 = [(NSArray *)self->_objectNames copyWithZone:a3];
  objectNames = v5->_objectNames;
  v5->_objectNames = (NSArray *)v24;

  v5->_timeInterval = self->_timeInterval;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  uint64_t v6 = v5;
  id v7 = v6;
  if (!v6) {
    goto LABEL_54;
  }
  uint64_t v8 = (void *)v6[1];
  id v9 = self->_identifier;
  uint64_t v10 = v8;
  if (v9 == v10)
  {
  }
  else
  {
    double v11 = v10;
    if (!v9 || !v10) {
      goto LABEL_53;
    }
    BOOL v12 = [(NSString *)v9 isEqualToString:v10];

    if (!v12) {
      goto LABEL_54;
    }
  }
  if (self->_eventType != *((void *)v7 + 3) || self->_changeType != *((void *)v7 + 2)) {
    goto LABEL_54;
  }
  timestamp = self->_timestamp;
  uint64_t v14 = (NSDate *)*((void *)v7 + 4);
  if (timestamp && v14)
  {
    if ((-[NSDate isEqual:](timestamp, "isEqual:") & 1) == 0) {
      goto LABEL_54;
    }
  }
  else if (timestamp != v14)
  {
    goto LABEL_54;
  }
  double v15 = (void *)*((void *)v7 + 5);
  id v9 = self->_containerIdentifier;
  uint64_t v16 = v15;
  if (v9 == v16)
  {
  }
  else
  {
    double v11 = v16;
    if (!v9 || !v16) {
      goto LABEL_53;
    }
    BOOL v17 = [(NSString *)v9 isEqualToString:v16];

    if (!v17) {
      goto LABEL_54;
    }
  }
  uint64_t v18 = (void *)*((void *)v7 + 6);
  id v9 = self->_beginIntervalEventIdentifier;
  long long v19 = v18;
  if (v9 == v19)
  {
  }
  else
  {
    double v11 = v19;
    if (!v9 || !v19) {
      goto LABEL_53;
    }
    BOOL v20 = [(NSString *)v9 isEqualToString:v19];

    if (!v20) {
      goto LABEL_54;
    }
  }
  uint64_t v21 = (void *)*((void *)v7 + 7);
  id v9 = self->_operationGroupName;
  uint64_t v22 = v21;
  if (v9 == v22)
  {
  }
  else
  {
    double v11 = v22;
    if (!v9 || !v22) {
      goto LABEL_53;
    }
    BOOL v23 = [(NSString *)v9 isEqualToString:v22];

    if (!v23) {
      goto LABEL_54;
    }
  }
  uint64_t v24 = (void *)*((void *)v7 + 8);
  id v9 = self->_operationGroupNameSuffix;
  uint64_t v25 = v24;
  if (v9 == v25)
  {
  }
  else
  {
    double v11 = v25;
    if (!v9 || !v25) {
      goto LABEL_53;
    }
    BOOL v26 = [(NSString *)v9 isEqualToString:v25];

    if (!v26) {
      goto LABEL_54;
    }
  }
  uint64_t v27 = (void *)*((void *)v7 + 11);
  id v9 = self->_stateName;
  v28 = v27;
  if (v9 == v28)
  {
  }
  else
  {
    double v11 = v28;
    if (!v9 || !v28) {
      goto LABEL_53;
    }
    BOOL v29 = [(NSString *)v9 isEqualToString:v28];

    if (!v29) {
      goto LABEL_54;
    }
  }
  objc_super v30 = (void *)*((void *)v7 + 9);
  id v9 = self->_errorDescription;
  v31 = v30;
  if (v9 != v31)
  {
    double v11 = v31;
    if (v9 && v31)
    {
      BOOL v32 = [(NSString *)v9 isEqualToString:v31];

      if (!v32) {
        goto LABEL_54;
      }
      goto LABEL_57;
    }
LABEL_53:

    goto LABEL_54;
  }

LABEL_57:
  changeToken = self->_changeToken;
  v36 = (NSData *)*((void *)v7 + 10);
  if (changeToken && v36)
  {
    if ((-[NSData isEqual:](changeToken, "isEqual:") & 1) == 0) {
      goto LABEL_54;
    }
  }
  else if (changeToken != v36)
  {
    goto LABEL_54;
  }
  objectNames = self->_objectNames;
  v38 = (NSArray *)*((void *)v7 + 12);
  if (objectNames && v38)
  {
    if (-[NSArray isEqual:](objectNames, "isEqual:")) {
      goto LABEL_67;
    }
  }
  else if (objectNames == v38)
  {
LABEL_67:
    BOOL v33 = self->_timeInterval == *((double *)v7 + 13);
    goto LABEL_55;
  }
LABEL_54:
  BOOL v33 = 0;
LABEL_55:

  return v33;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_timestamp];
  [v3 safelyAddObject:self->_containerIdentifier];
  [v3 safelyAddObject:self->_beginIntervalEventIdentifier];
  [v3 safelyAddObject:self->_operationGroupName];
  [v3 safelyAddObject:self->_operationGroupNameSuffix];
  [v3 safelyAddObject:self->_stateName];
  [v3 safelyAddObject:self->_errorDescription];
  [v3 safelyAddObject:self->_changeToken];
  [v3 safelyAddObject:self->_objectNames];
  uint64_t v4 = PKCombinedHash(17, v3);
  unint64_t v5 = self->_eventType - v4 + 32 * v4;
  unint64_t v6 = self->_changeType - v5 + 32 * v5;
  unint64_t v7 = (unint64_t)self->_timeInterval - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"identifier: '%@'; ", self->_identifier];
  uint64_t v4 = PKCloudStoreContainerChangeEventTypeToString(self->_eventType);
  [v3 appendFormat:@"eventType: '%@'; ", v4];

  unint64_t changeType = self->_changeType;
  unint64_t v6 = @"unknown";
  if (changeType == 1) {
    unint64_t v6 = @"signpost";
  }
  if (changeType == 2) {
    unint64_t v7 = @"interval";
  }
  else {
    unint64_t v7 = v6;
  }
  [v3 appendFormat:@"changeType: '%@'; ", v7];
  [v3 appendFormat:@"timestamp: '%@'; ", self->_timestamp];
  [v3 appendFormat:@"containerIdentifier: '%@'; ", self->_containerIdentifier];
  if ([(NSString *)self->_beginIntervalEventIdentifier length]) {
    objc_msgSend(v3, "appendFormat:", @"beginIntervalEventIdentifier: '%@'; ",
  }
      self->_beginIntervalEventIdentifier);
  if ([(NSString *)self->_operationGroupNameSuffix length]) {
    [v3 appendFormat:@"operationGroupNameSuffix: '%@'; ", self->_operationGroupNameSuffix];
  }
  if ([(NSString *)self->_operationGroupName length]) {
    [v3 appendFormat:@"operationGroupName: '%@'; ", self->_operationGroupName];
  }
  if ([(NSString *)self->_stateName length]) {
    [v3 appendFormat:@"stateName: '%@'; ", self->_stateName];
  }
  if ([(NSString *)self->_errorDescription length]) {
    [v3 appendFormat:@"errorDescription: '%@'; ", self->_errorDescription];
  }
  if ([(NSData *)self->_changeToken length]) {
    objc_msgSend(v3, "appendFormat:", @"changeToken: %ld hash'; ", -[NSData hash](self->_changeToken, "hash"));
  }
  if ([(NSArray *)self->_objectNames count]) {
    [v3 appendFormat:@"objectNames: '%@'; ", self->_objectNames];
  }
  double timeInterval = self->_timeInterval;
  if (timeInterval != 0.0) {
    objc_msgSend(v3, "appendFormat:", @"timeInterval: %ld seconds; ", (uint64_t)timeInterval);
  }
  [v3 appendFormat:@">"];
  return v3;
}

+ (id)_csvSafeStringForEvent:(id)a3
{
  v52[13] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 objectNames];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = (void *)MEMORY[0x1E4F28D90];
    uint64_t v8 = [v4 objectNames];
    id v9 = [v7 dataWithJSONObject:v8 options:1 error:0];

    uint64_t v10 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
  }
  double v11 = [v4 objectNames];
  BOOL v12 = [v11 description];

  uint64_t v13 = [v4 changeToken];
  uint64_t v14 = [v13 hash];

  v50 = [v4 identifier];
  v49 = objc_msgSend(a1, "_csvSafeString:");
  v52[0] = v49;
  uint64_t v15 = [v4 changeType];
  uint64_t v16 = @"unknown";
  if (v15 == 1) {
    uint64_t v16 = @"signpost";
  }
  if (v15 == 2) {
    uint64_t v16 = @"interval";
  }
  v48 = v16;
  v52[1] = v48;
  v47 = PKCloudStoreContainerChangeEventTypeToString([v4 eventType]);
  v52[2] = v47;
  v46 = [v4 containerIdentifier];
  v45 = objc_msgSend(a1, "_csvSafeString:");
  v52[3] = v45;
  v44 = [v4 beginIntervalEventIdentifier];
  v42 = objc_msgSend(a1, "_csvSafeString:");
  v52[4] = v42;
  v41 = [v4 operationGroupName];
  v40 = objc_msgSend(a1, "_csvSafeString:");
  v52[5] = v40;
  v39 = [v4 operationGroupNameSuffix];
  v38 = objc_msgSend(a1, "_csvSafeString:");
  v52[6] = v38;
  BOOL v17 = [a1 _dateFormatter];
  v36 = [v4 timestamp];
  v37 = v17;
  v35 = [v17 stringFromDate:v36];
  v34 = objc_msgSend(a1, "_csvSafeString:");
  v52[7] = v34;
  BOOL v33 = [v4 errorDescription];
  uint64_t v18 = objc_msgSend(a1, "_csvSafeString:");
  v52[8] = v18;
  long long v19 = (void *)0x1E4F28000;
  if (v14 < 1)
  {
    BOOL v20 = &stru_1EE0F5368;
  }
  else
  {
    BOOL v32 = [NSNumber numberWithInteger:v14];
    v31 = [v32 description];
    objc_msgSend(a1, "_csvSafeString:");
    BOOL v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v43 = v14;
  v52[9] = v20;
  uint64_t v21 = [v4 stateName];
  uint64_t v22 = [a1 _csvSafeString:v21];
  v52[10] = v22;
  v51 = v12;
  BOOL v23 = [a1 _csvSafeString:v12];
  v52[11] = v23;
  [v4 timeInterval];
  double v25 = v24;
  if (v24 <= 0.0)
  {
    uint64_t v27 = &stru_1EE0F5368;
  }
  else
  {
    BOOL v26 = NSNumber;
    [v4 timeInterval];
    long long v19 = objc_msgSend(v26, "numberWithDouble:");
    BOOL v12 = [v19 description];
    uint64_t v27 = [a1 _csvSafeString:v12];
  }
  v52[12] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:13];
  if (v25 > 0.0)
  {
  }
  if (v43 >= 1)
  {
  }
  BOOL v29 = [v28 componentsJoinedByString:@","];

  return v29;
}

+ (id)_csvSafeString:(id)a3
{
  id v3 = (__CFString *)a3;
  if ([(__CFString *)v3 length])
  {
    id v4 = [(__CFString *)v3 stringByReplacingOccurrencesOfString:@"\" withString:@"'""];

    if (([v4 containsString:@"\n"] & 1) != 0
      || [v4 containsString:@","])
    {
      uint64_t v5 = [NSString stringWithFormat:@"\"%@\"", v4];

      id v4 = (void *)v5;
    }
    uint64_t v6 = v4;
    id v3 = v6;
  }
  else
  {
    uint64_t v6 = &stru_1EE0F5368;
  }

  return v6;
}

+ (id)_dateFormatter
{
  if (qword_1EB403448 != -1) {
    dispatch_once(&qword_1EB403448, &__block_literal_global_190);
  }
  v2 = (void *)_MergedGlobals_274;
  return v2;
}

uint64_t __50__PKCloudStoreContainerChangeEvent__dateFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_274;
  _MergedGlobals_274 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_274;
  return [v2 setLocalizedDateFormatFromTemplate:@"MM/dd/yyyy HH:mm:ss.SSS z"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(unint64_t)a3
{
  self->_unint64_t changeType = a3;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (NSString)beginIntervalEventIdentifier
{
  return self->_beginIntervalEventIdentifier;
}

- (void)setBeginIntervalEventIdentifier:(id)a3
{
}

- (NSString)operationGroupName
{
  return self->_operationGroupName;
}

- (void)setOperationGroupName:(id)a3
{
}

- (NSString)operationGroupNameSuffix
{
  return self->_operationGroupNameSuffix;
}

- (void)setOperationGroupNameSuffix:(id)a3
{
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (NSData)changeToken
{
  return self->_changeToken;
}

- (void)setChangeToken:(id)a3
{
}

- (NSString)stateName
{
  return self->_stateName;
}

- (void)setStateName:(id)a3
{
}

- (NSArray)objectNames
{
  return self->_objectNames;
}

- (void)setObjectNames:(id)a3
{
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_double timeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectNames, 0);
  objc_storeStrong((id *)&self->_stateName, 0);
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_operationGroupNameSuffix, 0);
  objc_storeStrong((id *)&self->_operationGroupName, 0);
  objc_storeStrong((id *)&self->_beginIntervalEventIdentifier, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end