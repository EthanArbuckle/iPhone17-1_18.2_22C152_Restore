@interface REMAlarmContactTrigger
+ (BOOL)supportsSecureCoding;
+ (id)cdEntityName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTemporal;
- (REMAlarmContactTrigger)initWithCoder:(id)a3;
- (REMAlarmContactTrigger)initWithContactRepresentation:(id)a3;
- (REMAlarmContactTrigger)initWithObjectID:(id)a3 contactRepresentation:(id)a4;
- (REMContactRepresentation)contactRepresentation;
- (id)_deepCopy;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMAlarmContactTrigger

+ (id)cdEntityName
{
  return @"REMCAlarmContactTrigger";
}

- (REMAlarmContactTrigger)initWithObjectID:(id)a3 contactRepresentation:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)REMAlarmContactTrigger;
  v8 = [(REMAlarmTrigger *)&v11 initWithObjectID:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_contactRepresentation, a4);
  }

  return v9;
}

- (REMAlarmContactTrigger)initWithContactRepresentation:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAlarmContactTrigger;
  v6 = [(REMAlarmTrigger *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_contactRepresentation, a3);
  }

  return v7;
}

- (REMAlarmContactTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMAlarmContactTrigger;
  id v5 = [(REMAlarmTrigger *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactRepresentation"];
    contactRepresentation = v5->_contactRepresentation;
    v5->_contactRepresentation = (REMContactRepresentation *)v6;
  }
  return v5;
}

- (id)_deepCopy
{
  v3 = [REMAlarmContactTrigger alloc];
  id v4 = [(REMAlarmContactTrigger *)self contactRepresentation];
  id v5 = [(REMAlarmContactTrigger *)v3 initWithContactRepresentation:v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMAlarmContactTrigger *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(REMAlarmContactTrigger *)v6 contactRepresentation];
      uint64_t v8 = [(REMAlarmContactTrigger *)self contactRepresentation];
      if (v7 == (void *)v8)
      {
        char v12 = 1;
        objc_super v9 = v7;
      }
      else
      {
        objc_super v9 = (void *)v8;
        v10 = [(REMAlarmContactTrigger *)v6 contactRepresentation];
        objc_super v11 = [(REMAlarmContactTrigger *)self contactRepresentation];
        char v12 = [v10 isEqual:v11];
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (BOOL)isTemporal
{
  return 0;
}

- (unint64_t)hash
{
  v2 = [(REMAlarmContactTrigger *)self contactRepresentation];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)REMAlarmContactTrigger;
  id v4 = [(REMAlarmContactTrigger *)&v8 description];
  id v5 = [(REMAlarmContactTrigger *)self contactRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ {contact: %@}", v4, v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)REMAlarmContactTrigger;
  id v4 = a3;
  [(REMAlarmTrigger *)&v6 encodeWithCoder:v4];
  id v5 = [(REMAlarmContactTrigger *)self contactRepresentation];
  [v4 encodeObject:v5 forKey:@"contactRepresentation"];
}

- (REMContactRepresentation)contactRepresentation
{
  return self->_contactRepresentation;
}

- (void).cxx_destruct
{
}

@end