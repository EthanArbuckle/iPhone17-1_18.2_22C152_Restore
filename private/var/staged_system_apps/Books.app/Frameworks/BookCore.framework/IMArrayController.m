@interface IMArrayController
- (NSArray)arrangedObjects;
- (void)setArrangedObjects:(id)a3;
@end

@implementation IMArrayController

- (void)setArrangedObjects:(id)a3
{
  id v8 = a3;
  id v5 = [(IMArrayController *)self arrangedObjects];
  if (v5 == v8)
  {
  }
  else
  {
    v6 = [(IMArrayController *)self arrangedObjects];
    unsigned __int8 v7 = [v8 isEqualToArray:v6];

    if ((v7 & 1) == 0)
    {
      [(IMArrayController *)self willChangeValueForKey:@"arrangedObjects"];
      objc_storeStrong((id *)&self->_arrangedObjects, a3);
      [(IMArrayController *)self didChangeValueForKey:@"arrangedObjects"];
    }
  }
}

- (NSArray)arrangedObjects
{
  return self->_arrangedObjects;
}

- (void).cxx_destruct
{
}

@end