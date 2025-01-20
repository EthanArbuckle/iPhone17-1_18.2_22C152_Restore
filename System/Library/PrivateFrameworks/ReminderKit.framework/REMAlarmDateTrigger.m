@interface REMAlarmDateTrigger
+ (BOOL)supportsSecureCoding;
+ (id)cdEntityName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporal;
- (NSDateComponents)dateComponents;
- (REMAlarmDateTrigger)initWithCoder:(id)a3;
- (REMAlarmDateTrigger)initWithDateComponents:(id)a3;
- (REMAlarmDateTrigger)initWithObjectID:(id)a3 dateComponents:(id)a4;
- (id)_deepCopy;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDateComponents:(id)a3;
@end

@implementation REMAlarmDateTrigger

+ (id)cdEntityName
{
  return @"REMCDAlarmDateTrigger";
}

- (REMAlarmDateTrigger)initWithDateComponents:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMAlarmDateTrigger;
  v5 = [(REMAlarmTrigger *)&v8 init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "rem_gregorianEquivalent");
    [(REMAlarmDateTrigger *)v5 setDateComponents:v6];
  }
  return v5;
}

- (REMAlarmDateTrigger)initWithObjectID:(id)a3 dateComponents:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)REMAlarmDateTrigger;
  v7 = [(REMAlarmTrigger *)&v10 initWithObjectID:a3];
  objc_super v8 = v7;
  if (v7) {
    [(REMAlarmDateTrigger *)v7 setDateComponents:v6];
  }

  return v8;
}

- (id)_deepCopy
{
  v3 = [REMAlarmDateTrigger alloc];
  id v4 = [(REMAlarmDateTrigger *)self dateComponents];
  v5 = [(REMAlarmDateTrigger *)v3 initWithDateComponents:v4];

  return v5;
}

- (BOOL)isTemporal
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
    id v6 = [(REMAlarmDateTrigger *)self dateComponents];
    v7 = [v5 dateComponents];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = [(REMAlarmDateTrigger *)self dateComponents];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)REMAlarmDateTrigger;
  id v4 = [(REMAlarmDateTrigger *)&v8 description];
  id v5 = [(REMAlarmDateTrigger *)self dateComponents];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMAlarmDateTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMAlarmDateTrigger;
  id v5 = [(REMAlarmTrigger *)&v8 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateComponents"];
    [(REMAlarmDateTrigger *)v5 setDateComponents:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REMAlarmDateTrigger;
  id v4 = a3;
  [(REMAlarmTrigger *)&v6 encodeWithCoder:v4];
  id v5 = [(REMAlarmDateTrigger *)self dateComponents];
  [v4 encodeObject:v5 forKey:@"dateComponents"];
}

- (NSDateComponents)dateComponents
{
  return self->_dateComponents;
}

- (void)setDateComponents:(id)a3
{
}

- (void).cxx_destruct
{
}

@end