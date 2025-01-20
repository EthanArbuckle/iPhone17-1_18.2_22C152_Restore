@interface PDScheduledActivityRegistration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScheduledActivityRegistration:(id)a3;
- (NSObject)activityContext;
- (PDScheduledActivityCriteria)activityCriteria;
- (PDScheduledActivityRegistration)initWithActivityCriteria:(id)a3 activityContext:(id)a4;
- (PDScheduledActivityRegistration)initWithCoder:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PDScheduledActivityRegistration

- (PDScheduledActivityRegistration)initWithActivityCriteria:(id)a3 activityContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PDScheduledActivityRegistration;
  v9 = [(PDScheduledActivityRegistration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityCriteria, a3);
    if (v8)
    {
      if (NSClassFromString(&cfstr_Pdusernotifica.isa) && (objc_opt_isKindOfClass() & 1) != 0) {
        objc_storeStrong((id *)&v10->_activityContext, a4);
      }
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_activityCriteria];
  [v3 safelyAddObject:self->_activityContext];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PDScheduledActivityRegistration *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PDScheduledActivityRegistration *)self isEqualToScheduledActivityRegistration:v5];

  return v6;
}

- (BOOL)isEqualToScheduledActivityRegistration:(id)a3
{
  unint64_t v4 = a3;
  activityCriteria = self->_activityCriteria;
  BOOL v6 = (PDScheduledActivityCriteria *)v4[1];
  if (activityCriteria) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if (-[PDScheduledActivityCriteria isEqual:](activityCriteria, "isEqual:")) {
      goto LABEL_9;
    }
LABEL_7:
    char v8 = 0;
    goto LABEL_13;
  }
  if (activityCriteria != v6) {
    goto LABEL_7;
  }
LABEL_9:
  activityContext = self->_activityContext;
  v10 = v4[2];
  if (activityContext && v10) {
    char v8 = -[NSObject isEqual:](activityContext, "isEqual:");
  }
  else {
    char v8 = activityContext == v10;
  }
LABEL_13:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PDScheduledActivityRegistration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PDScheduledActivityRegistration;
  v5 = [(PDScheduledActivityRegistration *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityCritera"];
    activityCriteria = v5->_activityCriteria;
    v5->_activityCriteria = (PDScheduledActivityCriteria *)v6;

    char v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"activityContextData"];
    if (v8)
    {
      Class v9 = NSClassFromString(&cfstr_Pdusernotifica.isa);
      if (v9)
      {
        uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:v9 fromData:v8 error:0];
        activityContext = v5->_activityContext;
        v5->_activityContext = v10;
      }
      else
      {
        activityContext = v5->_activityContext;
        v5->_activityContext = 0;
      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_activityCriteria forKey:@"activityCritera"];
  activityContext = self->_activityContext;
  if (activityContext)
  {
    v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:activityContext requiringSecureCoding:1 error:0];
    [v6 encodeObject:v5 forKey:@"activityContextData"];
  }
}

- (PDScheduledActivityCriteria)activityCriteria
{
  return self->_activityCriteria;
}

- (NSObject)activityContext
{
  return self->_activityContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityContext, 0);
  objc_storeStrong((id *)&self->_activityCriteria, 0);
}

@end