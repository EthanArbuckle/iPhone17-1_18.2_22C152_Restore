@interface MTTaskGroup
+ (id)taskGroupWithTasks:(id)a3 completionBlock:(id)a4;
- (NSArray)tasks;
- (id)completionBlock;
- (id)description;
- (void)setCompletionBlock:(id)a3;
- (void)setTasks:(id)a3;
@end

@implementation MTTaskGroup

+ (id)taskGroupWithTasks:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setTasks:v6];

  [v7 setCompletionBlock:v5];
  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(MTTaskGroup *)self tasks];
  id v6 = [v3 stringWithFormat:@"<%@:%p tasks: %@>", v4, self, v5];

  return v6;
}

- (NSArray)tasks
{
  return self->_tasks;
}

- (void)setTasks:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
}

@end