@interface REMSiriSearchLimitedDataViewInvocation_fetchReminders
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)dueAfter;
- (NSDate)dueBefore;
- (NSNumber)completed;
- (NSNumber)hasLocation;
- (NSString)location;
- (NSString)title;
- (REMSiriSearchLimitedDataViewInvocation_fetchReminders)initWithCoder:(id)a3;
- (REMSiriSearchLimitedDataViewInvocation_fetchReminders)initWithTitle:(id)a3 dueAfter:(id)a4 dueBefore:(id)a5 isCompleted:(id)a6 hasLocation:(id)a7 location:(id)a8;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMSiriSearchLimitedDataViewInvocation_fetchReminders

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMSiriSearchLimitedDataViewInvocation_fetchReminders)initWithTitle:(id)a3 dueAfter:(id)a4 dueBefore:(id)a5 isCompleted:(id)a6 hasLocation:(id)a7 location:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)REMSiriSearchLimitedDataViewInvocation_fetchReminders;
  v20 = [(REMStoreInvocationValueStorage *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    title = v20->_title;
    v20->_title = (NSString *)v21;

    uint64_t v23 = [v16 copy];
    dueBefore = v20->_dueBefore;
    v20->_dueBefore = (NSDate *)v23;

    uint64_t v25 = [v15 copy];
    dueAfter = v20->_dueAfter;
    v20->_dueAfter = (NSDate *)v25;

    uint64_t v27 = [v17 copy];
    completed = v20->_completed;
    v20->_completed = (NSNumber *)v27;

    uint64_t v29 = [v18 copy];
    hasLocation = v20->_hasLocation;
    v20->_hasLocation = (NSNumber *)v29;

    uint64_t v31 = [v19 copy];
    location = v20->_location;
    v20->_location = (NSString *)v31;
  }
  return v20;
}

- (REMSiriSearchLimitedDataViewInvocation_fetchReminders)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueBefore"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dueAfter"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"completed"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasLocation"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];

  v11 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self initWithTitle:v5 dueAfter:v7 dueBefore:v6 isCompleted:v8 hasLocation:v9 location:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  v6 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self dueBefore];
  [v4 encodeObject:v6 forKey:@"dueBefore"];

  v7 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self dueAfter];
  [v4 encodeObject:v7 forKey:@"dueAfter"];

  v8 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self completed];
  [v4 encodeObject:v8 forKey:@"completed"];

  v9 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self hasLocation];
  [v4 encodeObject:v9 forKey:@"hasLocation"];

  id v10 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self location];
  [v4 encodeObject:v10 forKey:@"location"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_20;
  }
  v5 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self title];
  uint64_t v6 = [v4 title];
  if (v5 == (void *)v6)
  {
  }
  else
  {
    v7 = (void *)v6;
    v8 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self title];
    v9 = [v4 title];
    int v10 = [v8 isEqual:v9];

    if (!v10) {
      goto LABEL_20;
    }
  }
  v11 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self dueBefore];
  uint64_t v12 = [v4 dueBefore];
  if (v11 == (void *)v12)
  {
  }
  else
  {
    v13 = (void *)v12;
    id v14 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self dueBefore];
    id v15 = [v4 dueBefore];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_20;
    }
  }
  id v17 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self dueAfter];
  uint64_t v18 = [v4 dueAfter];
  if (v17 == (void *)v18)
  {
  }
  else
  {
    id v19 = (void *)v18;
    v20 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self dueAfter];
    uint64_t v21 = [v4 dueAfter];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_20;
    }
  }
  uint64_t v23 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self completed];
  uint64_t v24 = [v4 completed];
  if (v23 == (void *)v24)
  {
  }
  else
  {
    uint64_t v25 = (void *)v24;
    v26 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self completed];
    uint64_t v27 = [v4 completed];
    int v28 = [v26 isEqual:v27];

    if (!v28) {
      goto LABEL_20;
    }
  }
  uint64_t v29 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self hasLocation];
  uint64_t v30 = [v4 hasLocation];
  if (v29 == (void *)v30)
  {
  }
  else
  {
    uint64_t v31 = (void *)v30;
    v32 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self hasLocation];
    v33 = [v4 hasLocation];
    int v34 = [v32 isEqual:v33];

    if (!v34)
    {
LABEL_20:
      char v35 = 0;
      goto LABEL_21;
    }
  }
  v37 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self location];
  uint64_t v38 = [v4 location];
  if (v37 == (void *)v38)
  {
    char v35 = 1;
    v39 = v37;
  }
  else
  {
    v39 = (void *)v38;
    v40 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self location];
    v41 = [v4 location];
    char v35 = [v40 isEqual:v41];
  }
LABEL_21:

  return v35;
}

- (unint64_t)hash
{
  v3 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self title];
  uint64_t v4 = [v3 hash];
  v5 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self dueBefore];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self dueAfter];
  uint64_t v8 = [v7 hash];
  v9 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self completed];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self hasLocation];
  uint64_t v12 = [v11 hash];
  v13 = [(REMSiriSearchLimitedDataViewInvocation_fetchReminders *)self location];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)dueAfter
{
  return self->_dueAfter;
}

- (NSDate)dueBefore
{
  return self->_dueBefore;
}

- (NSNumber)completed
{
  return self->_completed;
}

- (NSNumber)hasLocation
{
  return self->_hasLocation;
}

- (NSString)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_hasLocation, 0);
  objc_storeStrong((id *)&self->_completed, 0);
  objc_storeStrong((id *)&self->_dueBefore, 0);
  objc_storeStrong((id *)&self->_dueAfter, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end