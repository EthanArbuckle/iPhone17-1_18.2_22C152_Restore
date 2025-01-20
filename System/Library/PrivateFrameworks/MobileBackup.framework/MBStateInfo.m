@interface MBStateInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isBackground;
- (BOOL)isCloud;
- (MBStateInfo)initWithCoder:(id)a3;
- (MBStateInfo)initWithDictionaryRepresentation:(id)a3;
- (MBStateInfo)initWithState:(int)a3 progress:(float)a4 estimatedTimeRemaining:(unint64_t)a5 error:(id)a6 errors:(id)a7;
- (MBStateInfo)initWithState:(int)a3 progress:(float)a4 estimatedTimeRemaining:(unint64_t)a5 isCloud:(BOOL)a6 isBackground:(BOOL)a7 error:(id)a8 errors:(id)a9 backupAttemptCount:(unint64_t)a10;
- (NSDate)date;
- (NSError)error;
- (NSMutableArray)errors;
- (NSNumber)restoredSnapshotBackupPolicy;
- (float)progress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)state;
- (unint64_t)backupAttemptCount;
- (unint64_t)estimatedTimeRemaining;
- (void)encodeWithCoder:(id)a3;
- (void)setBackupAttemptCount:(unint64_t)a3;
- (void)setDate:(id)a3;
- (void)setError:(id)a3;
- (void)setErrors:(id)a3;
- (void)setEstimatedTimeRemaining:(unint64_t)a3;
- (void)setIsBackground:(BOOL)a3;
- (void)setIsCloud:(BOOL)a3;
- (void)setProgress:(float)a3;
- (void)setRestoredSnapshotBackupPolicy:(id)a3;
- (void)setState:(int)a3;
@end

@implementation MBStateInfo

- (MBStateInfo)initWithState:(int)a3 progress:(float)a4 estimatedTimeRemaining:(unint64_t)a5 error:(id)a6 errors:(id)a7
{
  return -[MBStateInfo initWithState:progress:estimatedTimeRemaining:isCloud:isBackground:error:errors:backupAttemptCount:](self, "initWithState:progress:estimatedTimeRemaining:isCloud:isBackground:error:errors:backupAttemptCount:", *(void *)&a3, a5, 1, 0, a6, a7, 0);
}

- (MBStateInfo)initWithState:(int)a3 progress:(float)a4 estimatedTimeRemaining:(unint64_t)a5 isCloud:(BOOL)a6 isBackground:(BOOL)a7 error:(id)a8 errors:(id)a9 backupAttemptCount:(unint64_t)a10
{
  id v18 = a8;
  id v19 = a9;
  v29.receiver = self;
  v29.super_class = (Class)MBStateInfo;
  v20 = [(MBStateInfo *)&v29 init];
  v21 = v20;
  if (v20)
  {
    v20->_state = a3;
    v20->_progress = a4;
    v20->_estimatedTimeRemaining = a5;
    v20->_isCloud = a6;
    v20->_isBackground = a7;
    objc_storeStrong((id *)&v20->_error, a8);
    uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
    date = v21->_date;
    v21->_date = (NSDate *)v22;

    if (v19)
    {
      uint64_t v24 = [v19 mutableCopy];
      errors = v21->_errors;
      v21->_errors = (NSMutableArray *)v24;
    }
    else
    {
      uint64_t v26 = objc_opt_new();
      v27 = v21->_errors;
      v21->_errors = (NSMutableArray *)v26;

      if (v18) {
        [(NSMutableArray *)v21->_errors addObject:v18];
      }
    }
    v21->_backupAttemptCount = a10;
  }

  return v21;
}

- (MBStateInfo)initWithDictionaryRepresentation:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)MBStateInfo;
  v5 = [(MBStateInfo *)&v36 init];
  if (!v5) {
    goto LABEL_26;
  }
  v6 = [v4 objectForKeyedSubscript:@"state"];
  v5->_state = [v6 integerValue];

  v7 = [v4 objectForKeyedSubscript:@"progress"];
  [v7 floatValue];
  v5->_progress = v8;

  v9 = [v4 objectForKeyedSubscript:@"estimatedTimeRemaining"];
  v5->_estimatedTimeRemaining = [v9 integerValue];

  v10 = [v4 objectForKeyedSubscript:@"isCloud"];
  v5->_isCloud = [v10 BOOLValue];

  v11 = [v4 objectForKeyedSubscript:@"isBackground"];
  v5->_isBackground = [v11 BOOLValue];

  v12 = [v4 objectForKeyedSubscript:@"error"];
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = +[MBError errorWithDictionaryRepresentation:v12];
LABEL_7:
      error = v5->_error;
      v5->_error = (NSError *)v13;

      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v12 error:0];
      goto LABEL_7;
    }
  }
LABEL_8:
  uint64_t v15 = objc_opt_new();
  errors = v5->_errors;
  v5->_errors = (NSMutableArray *)v15;

  v17 = [v4 objectForKeyedSubscript:@"errors"];
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = +[MBError errorWithDictionaryRepresentation:](MBError, "errorWithDictionaryRepresentation:", *(void *)(*((void *)&v32 + 1) + 8 * i), (void)v32);
            if (v23) {
              [(NSMutableArray *)v5->_errors addObject:v23];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v20);
      }
    }
  }
  else if (v5->_error)
  {
    -[NSMutableArray addObject:](v5->_errors, "addObject:");
  }
  uint64_t v24 = objc_msgSend(v4, "objectForKeyedSubscript:", @"date", (void)v32);
  v25 = v24;
  if (v24)
  {
    uint64_t v26 = v24;
  }
  else
  {
    uint64_t v26 = [MEMORY[0x1E4F1C9C8] date];
  }
  date = v5->_date;
  v5->_date = v26;

  uint64_t v28 = [v4 objectForKeyedSubscript:@"restoredSnapshotBackupPolicy"];
  restoredSnapshotBackupPolicy = v5->_restoredSnapshotBackupPolicy;
  v5->_restoredSnapshotBackupPolicy = (NSNumber *)v28;

  v30 = [v4 objectForKeyedSubscript:@"backupAttemptCount"];
  v5->_backupAttemptCount = [v30 integerValue];

LABEL_26:
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBStateInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MBStateInfo;
  v5 = [(MBStateInfo *)&v23 init];
  if (v5)
  {
    v5->_state = [v4 decodeIntegerForKey:@"state"];
    [v4 decodeFloatForKey:@"progress"];
    v5->_progress = v6;
    v5->_estimatedTimeRemaining = [v4 decodeIntegerForKey:@"estimatedTimeRemaining"];
    v5->_isCloud = [v4 decodeBoolForKey:@"isCloud"];
    v5->_isBackground = [v4 decodeBoolForKey:@"isBackground"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    error = v5->_error;
    v5->_error = (NSError *)v7;

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"errors"];
    errors = v5->_errors;
    v5->_errors = (NSMutableArray *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v5->_date;
    v5->_date = (NSDate *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"restoredSnapshotBackupPolicy"];
    restoredSnapshotBackupPolicy = v5->_restoredSnapshotBackupPolicy;
    v5->_restoredSnapshotBackupPolicy = (NSNumber *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t state = self->_state;
  id v6 = a3;
  [v6 encodeInteger:state forKey:@"state"];
  *(float *)&double v5 = self->_progress;
  [v6 encodeFloat:@"progress" forKey:v5];
  [v6 encodeInteger:self->_estimatedTimeRemaining forKey:@"estimatedTimeRemaining"];
  [v6 encodeBool:self->_isCloud forKey:@"isCloud"];
  [v6 encodeBool:self->_isBackground forKey:@"isBackground"];
  [v6 encodeObject:self->_error forKey:@"error"];
  [v6 encodeObject:self->_errors forKey:@"errors"];
  [v6 encodeObject:self->_date forKey:@"date"];
  [v6 encodeObject:self->_restoredSnapshotBackupPolicy forKey:@"restoredSnapshotBackupPolicy"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MBStateInfo alloc];
  *(float *)&double v5 = self->_progress;
  id v6 = [(MBStateInfo *)v4 initWithState:self->_state progress:self->_estimatedTimeRemaining estimatedTimeRemaining:self->_isCloud isCloud:self->_isBackground isBackground:self->_error error:self->_errors errors:v5 backupAttemptCount:self->_backupAttemptCount];
  objc_storeStrong(v6 + 6, self->_date);
  return v6;
}

- (void)setError:(id)a3
{
  id v4 = (NSError *)a3;
  if (self->_error != v4)
  {
    float v8 = v4;
    BOOL v5 = +[MBError isError:v4 withCode:0];
    id v6 = 0;
    if (!v5) {
      id v6 = v8;
    }
    error = self->_error;
    self->_error = v6;

    if (v8)
    {
      [(NSMutableArray *)self->_errors addObject:v8];
      if ((unint64_t)[(NSMutableArray *)self->_errors count] >= 0xB) {
        [(NSMutableArray *)self->_errors removeObjectAtIndex:0];
      }
    }
  }
  MEMORY[0x1F41817F8]();
}

- (id)dictionaryRepresentation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithInteger:self->_state];
  [v3 setValue:v4 forKey:@"state"];

  *(float *)&double v5 = self->_progress;
  id v6 = [NSNumber numberWithFloat:v5];
  [v3 setValue:v6 forKey:@"progress"];

  uint64_t v7 = [NSNumber numberWithInteger:self->_estimatedTimeRemaining];
  [v3 setValue:v7 forKey:@"estimatedTimeRemaining"];

  float v8 = [NSNumber numberWithBool:self->_isCloud];
  [v3 setValue:v8 forKey:@"isCloud"];

  v9 = [NSNumber numberWithBool:self->_isBackground];
  [v3 setValue:v9 forKey:@"isBackground"];

  if (self->_error)
  {
    uint64_t v10 = +[MBError dictionaryRepresentationForError:](MBError, "dictionaryRepresentationForError:");
    [v3 setValue:v10 forKey:@"error"];
  }
  if (self->_errors)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = self->_errors;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = +[MBError dictionaryRepresentationForError:](MBError, "dictionaryRepresentationForError:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    [v3 setValue:v11 forKey:@"errors"];
  }
  objc_msgSend(v3, "setValue:forKey:", self->_date, @"date", (void)v21);
  restoredSnapshotBackupPolicy = self->_restoredSnapshotBackupPolicy;
  if (restoredSnapshotBackupPolicy) {
    [v3 setValue:restoredSnapshotBackupPolicy forKey:@"restoredSnapshotBackupPolicy"];
  }
  uint64_t v19 = [NSNumber numberWithUnsignedInteger:self->_backupAttemptCount];
  [v3 setValue:v19 forKey:@"backupAttemptCount"];

  return v3;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", @"<%s: %p; state=%d, progress=%.3f, timeRemaining=%lu, isCloud=%d, isBackground=%d, date=\"%@\", error=\"%@\">",
               class_getName(v4),
               self,
               self->_state,
               self->_progress,
               self->_estimatedTimeRemaining,
               self->_isCloud,
               self->_isBackground,
               self->_date,
               self->_error);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_uint64_t state = a3;
}

- (BOOL)isCloud
{
  return self->_isCloud;
}

- (void)setIsCloud:(BOOL)a3
{
  self->_isCloud = a3;
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (unint64_t)estimatedTimeRemaining
{
  return self->_estimatedTimeRemaining;
}

- (void)setEstimatedTimeRemaining:(unint64_t)a3
{
  self->_estimatedTimeRemaining = a3;
}

- (NSError)error
{
  return self->_error;
}

- (NSMutableArray)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)backupAttemptCount
{
  return self->_backupAttemptCount;
}

- (void)setBackupAttemptCount:(unint64_t)a3
{
  self->_backupAttemptCount = a3;
}

- (BOOL)isBackground
{
  return self->_isBackground;
}

- (void)setIsBackground:(BOOL)a3
{
  self->_isBackground = a3;
}

- (NSNumber)restoredSnapshotBackupPolicy
{
  return self->_restoredSnapshotBackupPolicy;
}

- (void)setRestoredSnapshotBackupPolicy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoredSnapshotBackupPolicy, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end