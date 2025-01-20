@interface SUCorePersistedActivity
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)activityName;
- (SUCoreActivityOptions)activityOptions;
- (SUCorePersistedActivity)initWithCoder:(id)a3;
- (id)description;
- (id)init:(id)a3 options:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityName:(id)a3;
- (void)setActivityOptions:(id)a3;
@end

@implementation SUCorePersistedActivity

- (id)init:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUCorePersistedActivity;
  v9 = [(SUCorePersistedActivity *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityName, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SUCorePersistedActivity *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = (void *)MEMORY[0x263F77D78];
      v6 = [(SUCorePersistedActivity *)v4 activityName];
      char v7 = [v5 stringIsEqual:v6 to:self->_activityName];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (SUCorePersistedActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUCorePersistedActivity;
  v5 = [(SUCorePersistedActivity *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityName"];
    activityName = v5->_activityName;
    v5->_activityName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityOptions"];
    activityOptions = v5->_activityOptions;
    v5->_activityOptions = (SUCoreActivityOptions *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  activityName = self->_activityName;
  id v5 = a3;
  [v5 encodeObject:activityName forKey:@"activityName"];
  [v5 encodeObject:self->_activityOptions forKey:@"activityOptions"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Name: %@ Options: {%@}", self->_activityName, self->_activityOptions];
}

- (NSString)activityName
{
  return self->_activityName;
}

- (void)setActivityName:(id)a3
{
}

- (SUCoreActivityOptions)activityOptions
{
  return self->_activityOptions;
}

- (void)setActivityOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityOptions, 0);

  objc_storeStrong((id *)&self->_activityName, 0);
}

@end