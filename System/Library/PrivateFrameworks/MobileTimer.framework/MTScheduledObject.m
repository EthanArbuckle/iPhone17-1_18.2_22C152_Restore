@interface MTScheduledObject
+ (id)scheduledObjectForScheduleable:(id)a3 trigger:(id)a4;
+ (unint64_t)scheduledTypeForTriggerType:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToScheduledObject:(id)a3;
- (BOOL)isVisible;
- (MTScheduleable)scheduleable;
- (MTScheduledObject)initWithScheduleable:(id)a3 trigger:(id)a4;
- (MTTrigger)trigger;
- (NSString)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)setScheduleable:(id)a3;
- (void)setTrigger:(id)a3;
@end

@implementation MTScheduledObject

+ (id)scheduledObjectForScheduleable:(id)a3 trigger:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithScheduleable:v7 trigger:v6];

  return v8;
}

- (MTScheduledObject)initWithScheduleable:(id)a3 trigger:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MTScheduledObject;
  v8 = [(MTScheduledObject *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    scheduleable = v8->_scheduleable;
    v8->_scheduleable = (MTScheduleable *)v9;

    uint64_t v11 = [v7 copy];
    trigger = v8->_trigger;
    v8->_trigger = (MTTrigger *)v11;
  }
  return v8;
}

- (unint64_t)type
{
  v3 = objc_opt_class();
  v4 = [(MTScheduledObject *)self trigger];
  unint64_t v5 = objc_msgSend(v3, "scheduledTypeForTriggerType:", objc_msgSend(v4, "triggerType"));

  return v5;
}

- (BOOL)isVisible
{
  return [(MTScheduledObject *)self type] != 2;
}

+ (unint64_t)scheduledTypeForTriggerType:(unint64_t)a3
{
  if (a3 - 2 > 6) {
    return 0;
  }
  else {
    return qword_19CD53C48[a3 - 2];
  }
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(MTScheduledObject *)self scheduleable];
  id v6 = [(MTScheduledObject *)self trigger];
  id v7 = [v3 stringWithFormat:@"<%@:%p %@, Trigger: %@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (unint64_t)hash
{
  v3 = [(MTScheduledObject *)self scheduleable];
  uint64_t v4 = [v3 hash];
  unint64_t v5 = [(MTScheduledObject *)self trigger];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7) {
    BOOL v8 = [(MTScheduledObject *)self isEqualToScheduledObject:v7];
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualToScheduledObject:(id)a3
{
  id v6 = a3;
  id v7 = [v6 scheduleable];
  BOOL v8 = [(MTScheduledObject *)self scheduleable];
  if (v7 != v8)
  {
    v3 = [v6 scheduleable];
    id v4 = [(MTScheduledObject *)self scheduleable];
    if (![v3 isEqual:v4])
    {
      char v9 = 0;
LABEL_8:

      goto LABEL_9;
    }
  }
  v10 = [v6 trigger];
  uint64_t v11 = [(MTScheduledObject *)self trigger];
  if (v10 == v11)
  {
    char v9 = 1;
  }
  else
  {
    v12 = [v6 trigger];
    v13 = [(MTScheduledObject *)self trigger];
    char v9 = [v12 isEqual:v13];
  }
  if (v7 != v8) {
    goto LABEL_8;
  }
LABEL_9:

  return v9;
}

- (MTScheduleable)scheduleable
{
  return self->_scheduleable;
}

- (void)setScheduleable:(id)a3
{
}

- (MTTrigger)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_scheduleable, 0);
}

@end