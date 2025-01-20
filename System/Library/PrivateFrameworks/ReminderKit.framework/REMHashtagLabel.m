@interface REMHashtagLabel
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToHashtagLabel:(id)a3;
- (NSDate)firstOccurrenceCreationDate;
- (NSDate)recencyDate;
- (NSString)canonicalName;
- (NSString)name;
- (NSUUID)uuidForChangeTracking;
- (REMHashtagLabel)initWithCoder:(id)a3;
- (REMHashtagLabel)initWithName:(id)a3;
- (REMHashtagLabel)initWithName:(id)a3 canonicalName:(id)a4 firstOccurrenceCreationDate:(id)a5 recencyDate:(id)a6 uuidForChangeTracking:(id)a7;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMHashtagLabel

- (REMHashtagLabel)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMHashtagLabel;
  v6 = [(REMHashtagLabel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (REMHashtagLabel)initWithName:(id)a3 canonicalName:(id)a4 firstOccurrenceCreationDate:(id)a5 recencyDate:(id)a6 uuidForChangeTracking:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)REMHashtagLabel;
  v17 = [(REMHashtagLabel *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_name, a3);
    objc_storeStrong((id *)&v18->_canonicalName, a4);
    objc_storeStrong((id *)&v18->_firstOccurrenceCreationDate, a5);
    objc_storeStrong((id *)&v18->_recencyDate, a6);
    objc_storeStrong((id *)&v18->_uuidForChangeTracking, a7);
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMHashtagLabel)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)REMHashtagLabel;
  id v5 = [(REMHashtagLabel *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"canonicalName"];
    canonicalName = v5->_canonicalName;
    v5->_canonicalName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstOccurrenceCreationDate"];
    firstOccurrenceCreationDate = v5->_firstOccurrenceCreationDate;
    v5->_firstOccurrenceCreationDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recencyDate"];
    recencyDate = v5->_recencyDate;
    v5->_recencyDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uuidForChangeTracking"];
    uuidForChangeTracking = v5->_uuidForChangeTracking;
    v5->_uuidForChangeTracking = (NSUUID *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(REMHashtagLabel *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  uint64_t v6 = [(REMHashtagLabel *)self canonicalName];
  [v4 encodeObject:v6 forKey:@"canonicalName"];

  v7 = [(REMHashtagLabel *)self firstOccurrenceCreationDate];
  [v4 encodeObject:v7 forKey:@"firstOccurrenceCreationDate"];

  uint64_t v8 = [(REMHashtagLabel *)self recencyDate];
  [v4 encodeObject:v8 forKey:@"recencyDate"];

  id v9 = [(REMHashtagLabel *)self uuidForChangeTracking];
  [v4 encodeObject:v9 forKey:@"uuidForChangeTracking"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = REMDynamicCast(v5, (uint64_t)v4);

  if (v6) {
    BOOL v7 = [(REMHashtagLabel *)self isEqualToHashtagLabel:v6];
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToHashtagLabel:(id)a3
{
  id v4 = (REMHashtagLabel *)a3;
  uint64_t v5 = v4;
  if (v4 != self)
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v7 = [(REMHashtagLabel *)self name];
      uint64_t v8 = [(REMHashtagLabel *)v6 name];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        id v9 = (void *)v8;
        uint64_t v10 = [(REMHashtagLabel *)self name];
        v11 = [(REMHashtagLabel *)v6 name];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_18;
        }
      }
      uint64_t v14 = [(REMHashtagLabel *)self canonicalName];
      uint64_t v15 = [(REMHashtagLabel *)v6 canonicalName];
      if (v14 == (void *)v15)
      {
      }
      else
      {
        id v16 = (void *)v15;
        objc_super v17 = [(REMHashtagLabel *)self canonicalName];
        v18 = [(REMHashtagLabel *)v6 canonicalName];
        int v19 = [v17 isEqual:v18];

        if (!v19) {
          goto LABEL_18;
        }
      }
      id v20 = [(REMHashtagLabel *)self firstOccurrenceCreationDate];
      uint64_t v21 = [(REMHashtagLabel *)v6 firstOccurrenceCreationDate];
      if (v20 == (void *)v21)
      {
      }
      else
      {
        v22 = (void *)v21;
        v23 = [(REMHashtagLabel *)self firstOccurrenceCreationDate];
        v24 = [(REMHashtagLabel *)v6 firstOccurrenceCreationDate];
        int v25 = [v23 isEqual:v24];

        if (!v25) {
          goto LABEL_18;
        }
      }
      v26 = [(REMHashtagLabel *)self recencyDate];
      uint64_t v27 = [(REMHashtagLabel *)v6 recencyDate];
      if (v26 == (void *)v27)
      {
      }
      else
      {
        v28 = (void *)v27;
        v29 = [(REMHashtagLabel *)self recencyDate];
        v30 = [(REMHashtagLabel *)v6 recencyDate];
        int v31 = [v29 isEqual:v30];

        if (!v31) {
          goto LABEL_18;
        }
      }
      v33 = [(REMHashtagLabel *)self uuidForChangeTracking];
      uint64_t v34 = [(REMHashtagLabel *)v6 uuidForChangeTracking];
      if (v33 == (void *)v34)
      {
        char v13 = 1;
        v35 = v33;
      }
      else
      {
        v35 = (void *)v34;
        v36 = [(REMHashtagLabel *)self uuidForChangeTracking];
        v37 = [(REMHashtagLabel *)v6 uuidForChangeTracking];
        char v13 = [v36 isEqual:v37];
      }
      goto LABEL_19;
    }
LABEL_18:
    char v13 = 0;
LABEL_19:

    goto LABEL_20;
  }
  char v13 = 1;
LABEL_20:

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(REMHashtagLabel *)self name];
  uint64_t v6 = [(REMHashtagLabel *)self canonicalName];
  BOOL v7 = [(REMHashtagLabel *)self firstOccurrenceCreationDate];
  uint64_t v8 = [(REMHashtagLabel *)self recencyDate];
  id v9 = [(REMHashtagLabel *)self uuidForChangeTracking];
  uint64_t v10 = [v3 stringWithFormat:@"<%@: %p name: %@, canonicalName: %@, firstOccurrenceCreationDate: %@, recencyDate: %@, uuidForChangeTracking: %@>", v4, self, v5, v6, v7, v8, v9];

  return v10;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)canonicalName
{
  return self->_canonicalName;
}

- (NSDate)firstOccurrenceCreationDate
{
  return self->_firstOccurrenceCreationDate;
}

- (NSDate)recencyDate
{
  return self->_recencyDate;
}

- (NSUUID)uuidForChangeTracking
{
  return self->_uuidForChangeTracking;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidForChangeTracking, 0);
  objc_storeStrong((id *)&self->_recencyDate, 0);
  objc_storeStrong((id *)&self->_firstOccurrenceCreationDate, 0);
  objc_storeStrong((id *)&self->_canonicalName, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end