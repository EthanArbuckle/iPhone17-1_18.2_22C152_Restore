@interface FMDAccessoryLocationStoreRecord
+ (BOOL)supportsSecureCoding;
- (FMDAccessoryLocationStoreRecord)initWithCoder:(id)a3;
- (FMDAccessoryLocationStoreRecord)initWithRecordName:(id)a3 contextUUID:(id)a4 creationDate:(id)a5 protection:(unint64_t)a6;
- (NSDate)creationDate;
- (NSString)recordName;
- (NSUUID)contextUUID;
- (id)description;
- (unint64_t)protection;
- (void)encodeWithCoder:(id)a3;
- (void)setContextUUID:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setProtection:(unint64_t)a3;
- (void)setRecordName:(id)a3;
@end

@implementation FMDAccessoryLocationStoreRecord

- (FMDAccessoryLocationStoreRecord)initWithRecordName:(id)a3 contextUUID:(id)a4 creationDate:(id)a5 protection:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)FMDAccessoryLocationStoreRecord;
  v13 = [(FMDAccessoryLocationStoreRecord *)&v16 init];
  v14 = v13;
  if (v13)
  {
    [(FMDAccessoryLocationStoreRecord *)v13 setRecordName:v10];
    [(FMDAccessoryLocationStoreRecord *)v14 setContextUUID:v11];
    [(FMDAccessoryLocationStoreRecord *)v14 setCreationDate:v12];
    [(FMDAccessoryLocationStoreRecord *)v14 setProtection:a6];
  }

  return v14;
}

- (FMDAccessoryLocationStoreRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FMDAccessoryLocationStoreRecord;
  v5 = [(FMDAccessoryLocationStoreRecord *)&v19 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector("recordName");
    v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [(FMDAccessoryLocationStoreRecord *)v5 setRecordName:v8];

    uint64_t v9 = objc_opt_class();
    id v10 = NSStringFromSelector("contextUUID");
    id v11 = [v4 decodeObjectOfClass:v9 forKey:v10];
    [(FMDAccessoryLocationStoreRecord *)v5 setContextUUID:v11];

    uint64_t v12 = objc_opt_class();
    v13 = NSStringFromSelector("creationDate");
    v14 = [v4 decodeObjectOfClass:v12 forKey:v13];
    [(FMDAccessoryLocationStoreRecord *)v5 setCreationDate:v14];

    uint64_t v15 = objc_opt_class();
    objc_super v16 = NSStringFromSelector("protection");
    v17 = [v4 decodeObjectOfClass:v15 forKey:v16];
    -[FMDAccessoryLocationStoreRecord setProtection:](v5, "setProtection:", [v17 unsignedIntegerValue]);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FMDAccessoryLocationStoreRecord *)self recordName];
  uint64_t v6 = NSStringFromSelector("recordName");
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(FMDAccessoryLocationStoreRecord *)self contextUUID];
  v8 = NSStringFromSelector("contextUUID");
  [v4 encodeObject:v7 forKey:v8];

  uint64_t v9 = [(FMDAccessoryLocationStoreRecord *)self creationDate];
  id v10 = NSStringFromSelector("creationDate");
  [v4 encodeObject:v9 forKey:v10];

  id v12 = +[NSNumber numberWithUnsignedInteger:[(FMDAccessoryLocationStoreRecord *)self protection]];
  id v11 = NSStringFromSelector("protection");
  [v4 encodeObject:v12 forKey:v11];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = [(FMDAccessoryLocationStoreRecord *)self recordName];
  id v4 = [(FMDAccessoryLocationStoreRecord *)self creationDate];
  v5 = +[NSString stringWithFormat:@"name %@ - creationDate %@ - protection %li", v3, v4, [(FMDAccessoryLocationStoreRecord *)self protection]];

  return v5;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (unint64_t)protection
{
  return self->_protection;
}

- (void)setProtection:(unint64_t)a3
{
  self->_protection = a3;
}

- (NSUUID)contextUUID
{
  return self->_contextUUID;
}

- (void)setContextUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextUUID, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);

  objc_storeStrong((id *)&self->_recordName, 0);
}

@end