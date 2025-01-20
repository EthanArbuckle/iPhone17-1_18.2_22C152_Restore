@interface NEKReminderChangeTrackingState
- (NEKReminderChangeTrackingState)init;
- (NEKReminderChangeTrackingState)initWithChangeTracking:(id)a3 lastChangeToken:(id)a4;
- (REMChangeToken)lastChangeToken;
- (REMChangeTracking)changeTracking;
- (id)description;
- (void)setChangeTracking:(id)a3;
- (void)setLastChangeToken:(id)a3;
@end

@implementation NEKReminderChangeTrackingState

- (NEKReminderChangeTrackingState)init
{
  return 0;
}

- (NEKReminderChangeTrackingState)initWithChangeTracking:(id)a3 lastChangeToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NEKReminderChangeTrackingState;
  v8 = [(NEKReminderChangeTrackingState *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(NEKReminderChangeTrackingState *)v8 setChangeTracking:v6];
    [(NEKReminderChangeTrackingState *)v9 setLastChangeToken:v7];
  }

  return v9;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(NEKReminderChangeTrackingState *)self changeTracking];
  v5 = [(NEKReminderChangeTrackingState *)self lastChangeToken];
  id v6 = +[NSString stringWithFormat:@"<%@: %p: %@, %@>", v3, self, v4, v5];

  return v6;
}

- (REMChangeTracking)changeTracking
{
  return self->_changeTracking;
}

- (void)setChangeTracking:(id)a3
{
}

- (REMChangeToken)lastChangeToken
{
  return self->_lastChangeToken;
}

- (void)setLastChangeToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastChangeToken, 0);

  objc_storeStrong((id *)&self->_changeTracking, 0);
}

@end