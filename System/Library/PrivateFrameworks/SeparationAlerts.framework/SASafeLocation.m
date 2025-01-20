@interface SASafeLocation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReallyEqual:(id)a3;
- (NSDate)date;
- (NSString)description;
- (NSString)name;
- (NSUUID)identifier;
- (SASafeLocation)initWithCoder:(id)a3;
- (SASafeLocation)initWithLocationUUID:(id)a3 latitude:(double)a4 longitude:(double)a5 radius:(double)a6 referenceFrame:(unint64_t)a7 name:(id)a8 date:(id)a9;
- (double)latitude;
- (double)longitude;
- (double)radius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionDictionary;
- (id)getDate;
- (unint64_t)hash;
- (unint64_t)referenceFrame;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5;
@end

@implementation SASafeLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASafeLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"SASafeLocationIdentifier"];
  [v4 decodeDoubleForKey:@"SASafeLocationLatitude"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"SASafeLocationLongitude"];
  double v9 = v8;
  [v4 decodeDoubleForKey:@"SASafeLocationRadius"];
  double v11 = v10;
  uint64_t v12 = [v4 decodeIntegerForKey:@"SASafeLocationReferenceFrame"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASafeLocationNameString"];
  v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASafeLocationDate"];

  v15 = [(SASafeLocation *)self initWithLocationUUID:v5 latitude:v12 longitude:v13 radius:v14 referenceFrame:v7 name:v9 date:v11];
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SASafeLocation *)self identifier];
  [v4 encodeObject:v5 forKey:@"SASafeLocationIdentifier"];

  [(SASafeLocation *)self latitude];
  objc_msgSend(v4, "encodeDouble:forKey:", @"SASafeLocationLatitude");
  [(SASafeLocation *)self longitude];
  objc_msgSend(v4, "encodeDouble:forKey:", @"SASafeLocationLongitude");
  [(SASafeLocation *)self radius];
  objc_msgSend(v4, "encodeDouble:forKey:", @"SASafeLocationRadius");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SASafeLocation referenceFrame](self, "referenceFrame"), @"SASafeLocationReferenceFrame");
  double v6 = [(SASafeLocation *)self name];
  [v4 encodeObject:v6 forKey:@"SASafeLocationNameString"];

  id v7 = [(SASafeLocation *)self date];
  [v4 encodeObject:v7 forKey:@"SASafeLocationDate"];
}

- (void)encodeWithOSLogCoder:(id)a3 options:(unint64_t)a4 maxLength:(unint64_t)a5
{
  id v8 = a3;
  double v6 = (void *)MEMORY[0x1D25F7C90]();
  id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  objc_msgSend(v8, "appendBytes:length:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[SASafeLocation allocWithZone:a3];
  v5 = [(SASafeLocation *)self identifier];
  [(SASafeLocation *)self latitude];
  double v7 = v6;
  [(SASafeLocation *)self longitude];
  double v9 = v8;
  [(SASafeLocation *)self radius];
  double v11 = v10;
  unint64_t v12 = [(SASafeLocation *)self referenceFrame];
  v13 = [(SASafeLocation *)self name];
  v14 = [(SASafeLocation *)self date];
  v15 = [(SASafeLocation *)v4 initWithLocationUUID:v5 latitude:v12 longitude:v13 radius:v14 referenceFrame:v7 name:v9 date:v11];

  return v15;
}

- (SASafeLocation)initWithLocationUUID:(id)a3 latitude:(double)a4 longitude:(double)a5 radius:(double)a6 referenceFrame:(unint64_t)a7 name:(id)a8 date:(id)a9
{
  id v16 = a3;
  id v17 = a8;
  id v18 = a9;
  v28.receiver = self;
  v28.super_class = (Class)SASafeLocation;
  v19 = [(SASafeLocation *)&v28 init];
  if (!v19) {
    goto LABEL_5;
  }
  v20 = 0;
  if (v16 && v18)
  {
    uint64_t v21 = [v16 copy];
    identifier = v19->_identifier;
    v19->_identifier = (NSUUID *)v21;

    v19->_latitude = a4;
    v19->_longitude = a5;
    v19->_radius = a6;
    v19->_referenceFrame = a7;
    uint64_t v23 = [v17 copy];
    name = v19->_name;
    v19->_name = (NSString *)v23;

    uint64_t v25 = [v18 copy];
    date = v19->_date;
    v19->_date = (NSDate *)v25;

LABEL_5:
    v20 = v19;
  }

  return v20;
}

- (BOOL)isReallyEqual:(id)a3
{
  double v6 = (SASafeLocation *)a3;
  if (self == v6)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v7 = v6;
      double v8 = [(SASafeLocation *)self identifier];
      double v9 = [(SASafeLocation *)v7 identifier];
      if (v8 == v9
        || ([(SASafeLocation *)self identifier],
            v3 = objc_claimAutoreleasedReturnValue(),
            [(SASafeLocation *)v7 identifier],
            id v4 = objc_claimAutoreleasedReturnValue(),
            [v3 isEqual:v4]))
      {
        [(SASafeLocation *)self latitude];
        double v13 = v12;
        [(SASafeLocation *)v7 latitude];
        if (v13 == v14
          && ([(SASafeLocation *)self longitude],
              double v16 = v15,
              [(SASafeLocation *)v7 longitude],
              v16 == v17)
          && ([(SASafeLocation *)self radius], double v19 = v18, [(SASafeLocation *)v7 radius], v19 == v20))
        {
          unint64_t v21 = [(SASafeLocation *)self referenceFrame];
          BOOL v10 = v21 == [(SASafeLocation *)v7 referenceFrame];
          BOOL v11 = v10;
        }
        else
        {
          BOOL v10 = 0;
          BOOL v11 = 0;
        }
        if (v8 == v9) {
          goto LABEL_15;
        }
      }
      else
      {
        BOOL v10 = 0;
      }

      BOOL v11 = v10;
LABEL_15:

      goto LABEL_16;
    }
    BOOL v11 = 0;
  }
LABEL_16:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SASafeLocation *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      double v6 = [(SASafeLocation *)self identifier];
      double v7 = [(SASafeLocation *)v5 identifier];

      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(SASafeLocation *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)descriptionDictionary
{
  v22[8] = *MEMORY[0x1E4F143B8];
  v21[0] = @"EventType";
  id v4 = (objc_class *)objc_opt_class();
  double v20 = NSStringFromClass(v4);
  v22[0] = v20;
  v21[1] = @"SASafeLocationIdentifier";
  double v19 = [(SASafeLocation *)self identifier];
  double v18 = [v19 description];
  v22[1] = v18;
  v21[2] = @"SASafeLocationLatitude";
  v5 = (void *)MEMORY[0x1E4F28ED0];
  [(SASafeLocation *)self latitude];
  double v6 = objc_msgSend(v5, "numberWithDouble:");
  v22[2] = v6;
  v21[3] = @"SASafeLocationLongitude";
  double v7 = (void *)MEMORY[0x1E4F28ED0];
  [(SASafeLocation *)self longitude];
  char v8 = objc_msgSend(v7, "numberWithDouble:");
  v22[3] = v8;
  v21[4] = @"SASafeLocationRadius";
  double v9 = (void *)MEMORY[0x1E4F28ED0];
  [(SASafeLocation *)self radius];
  BOOL v10 = objc_msgSend(v9, "numberWithDouble:");
  v22[4] = v10;
  v21[5] = @"SASafeLocationReferenceFrame";
  BOOL v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SASafeLocation referenceFrame](self, "referenceFrame"));
  v22[5] = v11;
  v21[6] = @"SASafeLocationNameString";
  double v12 = [(SASafeLocation *)self name];
  if (v12)
  {
    v2 = [(SASafeLocation *)self name];
    double v13 = [v2 description];
  }
  else
  {
    double v13 = &stru_1F27F45F0;
  }
  v22[6] = v13;
  v21[7] = @"SASafeLocationDate";
  double v14 = [(SASafeLocation *)self date];
  double v15 = [v14 getDateString];
  v22[7] = v15;
  double v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:8];

  if (v12)
  {
  }
  return v16;
}

- (NSString)description
{
  unint64_t v3 = [(SASafeLocation *)self descriptionDictionary];
  id v10 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v3 error:&v10];
  id v5 = v10;
  if (v5)
  {
    double v6 = (void *)TASALog;
    if (os_log_type_enabled((os_log_t)TASALog, OS_LOG_TYPE_ERROR)) {
      [(SAConnectionEvent *)v6 description];
    }
    id v7 = [NSString string];
  }
  else
  {
    id v7 = v4;
  }
  char v8 = v7;

  return (NSString *)v8;
}

- (id)getDate
{
  return self->_date;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (double)radius
{
  return self->_radius;
}

- (unint64_t)referenceFrame
{
  return self->_referenceFrame;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end