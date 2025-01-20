@interface _DASTaskDependencyGraphNode
- (BOOL)isEqual:(id)a3;
- (NSString)taskIdentifier;
- (_DASTaskDependencyGraphNode)initWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation _DASTaskDependencyGraphNode

- (_DASTaskDependencyGraphNode)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DASTaskDependencyGraphNode;
  v6 = [(_DASTaskDependencyGraphNode *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_taskIdentifier, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_DASTaskDependencyGraphNode *)a3;
  if (self == v4)
  {
    unsigned __int8 v7 = 1;
  }
  else if ([(_DASTaskDependencyGraphNode *)v4 isMemberOfClass:objc_opt_class()])
  {
    taskIdentifier = self->_taskIdentifier;
    v6 = [(_DASTaskDependencyGraphNode *)v4 taskIdentifier];
    unsigned __int8 v7 = [(NSString *)taskIdentifier isEqualToString:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSString *)self->_taskIdentifier hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  taskIdentifier = self->_taskIdentifier;

  return [v4 initWithIdentifier:taskIdentifier];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  taskIdentifier = self->_taskIdentifier;

  return [v4 initWithIdentifier:taskIdentifier];
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void).cxx_destruct
{
}

@end