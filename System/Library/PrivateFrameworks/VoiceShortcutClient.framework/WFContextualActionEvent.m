@interface WFContextualActionEvent
- (NSArray)contentTypes;
- (NSString)containerName;
- (WFContextualAction)action;
- (WFContextualActionEvent)initWithAction:(id)a3 contentTypes:(id)a4 containerName:(id)a5 surface:(unint64_t)a6;
- (unint64_t)surface;
@end

@implementation WFContextualActionEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_contentTypes, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

- (unint64_t)surface
{
  return self->_surface;
}

- (NSString)containerName
{
  return self->_containerName;
}

- (NSArray)contentTypes
{
  return self->_contentTypes;
}

- (WFContextualAction)action
{
  return self->_action;
}

- (WFContextualActionEvent)initWithAction:(id)a3 contentTypes:(id)a4 containerName:(id)a5 surface:(unint64_t)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (!v12)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFContextualActionEvent.m", 16, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)WFContextualActionEvent;
  v15 = [(WFContextualActionEvent *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_action, a3);
    objc_storeStrong((id *)&v16->_contentTypes, a4);
    objc_storeStrong((id *)&v16->_containerName, a5);
    v16->_surface = a6;
    v17 = v16;
  }

  return v16;
}

@end