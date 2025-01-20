@interface TRITrackingId
+ (BOOL)supportsSecureCoding;
+ (id)trackingIdWithProjectId:(int)a3 paths:(id)a4;
+ (id)trackingIdWithProjectId:(int)a3 paths:(id)a4 treatments:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSArray)treatments;
- (NSDate)time;
- (NSUUID)uuid;
- (TRISubject)subject;
- (TRITrackingId)initWithCoder:(id)a3;
- (TRITrackingId)initWithUUID:(id)a3 time:(id)a4 treatments:(id)a5 subject:(id)a6;
- (TRITrackingId)initWithUUID:(id)a3 time:(id)a4 treatments:(id)a5 subjectProvider:(id)a6 projectId:(int)a7;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TRITrackingId

+ (id)trackingIdWithProjectId:(int)a3 paths:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = +[TRILogTreatmentReader readerWithProjectId:v4 paths:v6];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 treatments];
  }
  else
  {
    v9 = 0;
  }
  v10 = [a1 trackingIdWithProjectId:v4 paths:v6 treatments:v9];

  return v10;
}

+ (id)trackingIdWithProjectId:(int)a3 paths:(id)a4 treatments:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v7 = a5;
  id v8 = a4;
  v9 = [TRITrackingId alloc];
  v10 = [MEMORY[0x1E4F29128] UUID];
  v11 = [MEMORY[0x1E4F1C9C8] date];
  v12 = +[TRISubjectProvider defaultProviderWithPaths:v8];

  v13 = [(TRITrackingId *)v9 initWithUUID:v10 time:v11 treatments:v7 subjectProvider:v12 projectId:v6];
  return v13;
}

- (TRITrackingId)initWithUUID:(id)a3 time:(id)a4 treatments:(id)a5 subjectProvider:(id)a6 projectId:(int)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v21.receiver = self;
  v21.super_class = (Class)TRITrackingId;
  v17 = [(TRITrackingId *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_uuid, a3);
    objc_storeStrong((id *)&v18->_time, a4);
    objc_storeStrong((id *)&v18->_treatments, a5);
    objc_storeStrong((id *)&v18->_subjectProvider, a6);
    v18->_projectId = a7;
    id v19 = [(TRISubjectProvider *)v18->_subjectProvider subject];
  }

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatments, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_subjectProvider, 0);
  objc_storeStrong((id *)&self->_subject, 0);
}

- (TRITrackingId)initWithUUID:(id)a3 time:(id)a4 treatments:(id)a5 subject:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TRITrackingId;
  id v15 = [(TRITrackingId *)&v18 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_uuid, a3);
    objc_storeStrong((id *)&v16->_time, a4);
    objc_storeStrong((id *)&v16->_treatments, a5);
    objc_storeStrong((id *)&v16->_subject, a6);
  }

  return v16;
}

- (TRISubject)subject
{
  subject = self->_subject;
  if (subject)
  {
    v3 = subject;
  }
  else
  {
    v3 = [(TRISubjectProvider *)self->_subjectProvider subjectWithProjectId:self->_projectId];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(TRITrackingId *)self uuid];
    id v7 = [v5 uuid];
    if (![v6 isEqual:v7])
    {
      char v19 = 0;
LABEL_23:

      goto LABEL_24;
    }
    id v8 = [(TRITrackingId *)self time];
    [v8 timeIntervalSince1970];
    double v10 = v9;
    id v11 = [v5 time];
    [v11 timeIntervalSince1970];
    if (vabdd_f64(v10, v12) >= 0.001)
    {
      char v19 = 0;
LABEL_22:

      goto LABEL_23;
    }
    id v13 = [(TRITrackingId *)self subject];
    id v14 = [v5 subject];
    if (![v13 isEqual:v14])
    {
      char v19 = 0;
LABEL_21:

      goto LABEL_22;
    }
    id v15 = [(TRITrackingId *)self treatments];
    if (!v15)
    {
      v24 = [v5 treatments];
      if (!v24)
      {
        v24 = 0;
        char v19 = 1;
        goto LABEL_19;
      }
    }
    v25 = v15;
    uint64_t v16 = [(TRITrackingId *)self treatments];
    if (v16)
    {
      v17 = (void *)v16;
      uint64_t v18 = [v5 treatments];
      if (v18)
      {
        v23 = (void *)v18;
        v22 = [(TRITrackingId *)self treatments];
        objc_super v21 = [v5 treatments];
        char v19 = [v22 isEqualToArray:v21];

        goto LABEL_16;
      }
    }
    char v19 = 0;
LABEL_16:
    id v15 = v25;
    if (v25)
    {
LABEL_20:

      goto LABEL_21;
    }
LABEL_19:

    goto LABEL_20;
  }
  char v19 = 0;
LABEL_24:

  return v19;
}

- (unint64_t)hash
{
  v2 = [(TRITrackingId *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(TRITrackingId *)self uuid];
  [v12 encodeObject:v4 forKey:@"uuid"];

  id v5 = [(TRITrackingId *)self time];
  [v12 encodeObject:v5 forKey:@"time"];

  uint64_t v6 = [(TRITrackingId *)self subject];
  [v12 encodeObject:v6 forKey:@"subject"];

  id v7 = NSNumber;
  id v8 = [(TRITrackingId *)self treatments];
  double v9 = [v7 numberWithInt:v8 != 0];
  [v12 encodeObject:v9 forKey:@"hasTreatments"];

  double v10 = [(TRITrackingId *)self treatments];

  if (v10)
  {
    id v11 = [(TRITrackingId *)self treatments];
    [v12 encodeObject:v11 forKey:@"treatments"];
  }
}

- (TRITrackingId)initWithCoder:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuid"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"time"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subject"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasTreatments"];
  double v9 = v8;
  if (v8)
  {
    if ([v8 BOOLValue])
    {
      double v10 = (void *)MEMORY[0x1E4F1CAD0];
      v18[0] = objc_opt_class();
      v18[1] = objc_opt_class();
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
      id v12 = [v10 setWithArray:v11];
      id v13 = [v4 decodeObjectOfClasses:v12 forKey:@"treatments"];

      if (!v5) {
        goto LABEL_11;
      }
    }
    else
    {
      id v13 = 0;
      if (!v5) {
        goto LABEL_11;
      }
    }
    if (v6 && v7 && (![v9 BOOLValue] || v13))
    {
      id v15 = [[TRITrackingId alloc] initWithUUID:v5 time:v6 treatments:v13 subject:v7];
      goto LABEL_14;
    }
  }
  else
  {
    id v13 = 0;
  }
LABEL_11:
  id v14 = TRILogCategory_ClientFramework();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v17 = 0;
    _os_log_error_impl(&dword_19D909000, v14, OS_LOG_TYPE_ERROR, "failed to decode tracking id, some fields were nil", v17, 2u);
  }

  id v15 = 0;
LABEL_14:

  return v15;
}

- (id)description
{
  v2 = NSString;
  unint64_t v3 = [(TRITrackingId *)self uuid];
  id v4 = [v2 stringWithFormat:@"Trial tracking id %@", v3];

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSDate)time
{
  return self->_time;
}

- (NSArray)treatments
{
  return self->_treatments;
}

@end