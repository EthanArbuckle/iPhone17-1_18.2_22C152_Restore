@interface FPProcessGroupMinimal
- (BOOL)isEqual:(id)a3;
- (FPProcessGroupMinimal)init;
- (NSMutableSet)processes;
- (id)description;
- (id)initUniqueProcessGroup;
- (unint64_t)hash;
- (void)addProcess:(id)a3;
- (void)setProcesses:(id)a3;
@end

@implementation FPProcessGroupMinimal

- (FPProcessGroupMinimal)init
{
  return (FPProcessGroupMinimal *)sub_1000184E4(self, 19);
}

- (id)initUniqueProcessGroup
{
  v3 = +[NSUUID UUID];
  v4 = sub_1000184E4(self, (uint64_t)[v3 hash]);

  return v4;
}

- (void)addProcess:(id)a3
{
  id v5 = a3;
  if ((-[NSMutableSet containsObject:](self->_processes, "containsObject:") & 1) == 0)
  {
    unint64_t v4 = 37 * self->_hashValue;
    self->_hashValue = v4 ^ (int)[v5 pid];
    [(NSMutableSet *)self->_processes addObject:v5];
  }
}

- (unint64_t)hash
{
  return self->_hashValue;
}

- (BOOL)isEqual:(id)a3
{
  if (self->_hashValue != *((void *)a3 + 2)) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(FPProcessGroupMinimal *)self processes];
  v6 = [v4 processes];

  LOBYTE(v4) = [v5 isEqualToSet:v6];
  return (char)v4;
}

- (id)description
{
  v2 = [(FPProcessGroupMinimal *)self processes];
  v3 = [v2 description];
  id v4 = +[NSString stringWithFormat:@"FPProcessGroup%@", v3];

  return v4;
}

- (NSMutableSet)processes
{
  return self->_processes;
}

- (void)setProcesses:(id)a3
{
}

- (void).cxx_destruct
{
}

@end