@interface WFTriggerNotificationDebouncerItem
- (NSSet)triggerEventIDs;
- (WFConfiguredTrigger)configuredTrigger;
- (WFDebouncer)debouncer;
- (WFTriggerNotificationDebouncerItem)initWithConfiguredTrigger:(id)a3 reference:(id)a4 triggerEventIDs:(id)a5 debouncer:(id)a6;
- (WFWorkflowReference)reference;
- (id)description;
- (void)setTriggerEventIDs:(id)a3;
@end

@implementation WFTriggerNotificationDebouncerItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerEventIDs, 0);
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_configuredTrigger, 0);
}

- (void)setTriggerEventIDs:(id)a3
{
}

- (NSSet)triggerEventIDs
{
  return self->_triggerEventIDs;
}

- (WFDebouncer)debouncer
{
  return self->_debouncer;
}

- (WFWorkflowReference)reference
{
  return self->_reference;
}

- (WFConfiguredTrigger)configuredTrigger
{
  return self->_configuredTrigger;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFTriggerNotificationDebouncerItem *)self configuredTrigger];
  v7 = [(WFTriggerNotificationDebouncerItem *)self reference];
  v8 = [(WFTriggerNotificationDebouncerItem *)self triggerEventIDs];
  v9 = [(WFTriggerNotificationDebouncerItem *)self debouncer];
  v10 = [v3 stringWithFormat:@"<%@: %p, configuredTrigger: %@, reference: %@, triggerEventIDs: %@, debouncer: %@>", v5, self, v6, v7, v8, v9];

  return v10;
}

- (WFTriggerNotificationDebouncerItem)initWithConfiguredTrigger:(id)a3 reference:(id)a4 triggerEventIDs:(id)a5 debouncer:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WFTriggerNotificationDebouncerItem;
  v15 = [(WFTriggerNotificationDebouncerItem *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_configuredTrigger, a3);
    objc_storeStrong((id *)&v16->_triggerEventIDs, a5);
    objc_storeStrong((id *)&v16->_reference, a4);
    objc_storeStrong((id *)&v16->_debouncer, a6);
    v17 = v16;
  }

  return v16;
}

@end