@interface PLPidAndProcessName
- (NSNumber)pid;
- (NSString)processName;
- (id)description;
- (void)setPid:(id)a3;
- (void)setProcessName:(id)a3;
@end

@implementation PLPidAndProcessName

- (id)description
{
  v3 = NSString;
  v4 = [(PLPidAndProcessName *)self pid];
  v5 = [(PLPidAndProcessName *)self processName];
  v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return v6;
}

- (NSNumber)pid
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPid:(id)a3
{
}

- (NSString)processName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setProcessName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_pid, 0);
}

@end