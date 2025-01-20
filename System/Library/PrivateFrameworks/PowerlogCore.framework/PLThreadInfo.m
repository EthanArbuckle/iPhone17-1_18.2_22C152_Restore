@interface PLThreadInfo
- (BOOL)isEqualToThreadInfo:(id)a3;
- (BOOL)isNamed;
- (NSString)threadName;
- (PLThreadInfo)initWithThread:(unint64_t)a3 inProcess:(int)a4;
- (double)systemTime;
- (double)userTime;
- (id)description;
- (id)diffSinceBaseline:(id)a3;
- (unint64_t)threadID;
- (void)setIsNamed:(BOOL)a3;
- (void)setSystemTime:(double)a3;
- (void)setThreadID:(unint64_t)a3;
- (void)setThreadName:(id)a3;
- (void)setUserTime:(double)a3;
@end

@implementation PLThreadInfo

- (PLThreadInfo)initWithThread:(unint64_t)a3 inProcess:(int)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  memset(v8, 0, 512);
  if (proc_pidinfo(a4, 10, a3, v8, 1288) <= 0 && (*__error() == 3 || *__error() == 22))
  {
    v6 = 0;
  }
  else
  {
    v6 = objc_alloc_init(PLThreadInfo);
    [(PLThreadInfo *)v6 setUserTime:(double)*(unint64_t *)&v8[0] / 1000000000.0];
    [(PLThreadInfo *)v6 setSystemTime:(double)*((unint64_t *)&v8[0] + 1) / 1000000000.0];
    [(PLThreadInfo *)v6 setThreadID:a3];
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PLThreadInfo *)self threadName];
  unint64_t v5 = [(PLThreadInfo *)self threadID];
  [(PLThreadInfo *)self userTime];
  uint64_t v7 = v6;
  [(PLThreadInfo *)self systemTime];
  uint64_t v9 = [v3 stringWithFormat:@"%@ (0x%llx) %.2fs user %.2fs system", v4, v5, v7, v8];

  return v9;
}

- (id)diffSinceBaseline:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    unint64_t v5 = objc_alloc_init(PLThreadInfo);
    uint64_t v6 = [(PLThreadInfo *)self threadName];
    [(PLThreadInfo *)v5 setThreadName:v6];

    [(PLThreadInfo *)v5 setThreadID:[(PLThreadInfo *)self threadID]];
    [(PLThreadInfo *)self systemTime];
    double v8 = v7;
    [v4 systemTime];
    [(PLThreadInfo *)v5 setSystemTime:v8 - v9];
    [(PLThreadInfo *)self userTime];
    double v11 = v10;
    [v4 userTime];
    double v13 = v12;

    [(PLThreadInfo *)v5 setUserTime:v11 - v13];
  }
  else
  {
    unint64_t v5 = self;
  }
  return v5;
}

- (BOOL)isEqualToThreadInfo:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_4;
  }
  unint64_t v5 = [(PLThreadInfo *)self threadName];
  uint64_t v6 = [v4 threadName];
  int v7 = [v5 isEqualToString:v6];

  if (!v7) {
    goto LABEL_4;
  }
  [(PLThreadInfo *)self userTime];
  double v9 = v8;
  [v4 userTime];
  if (v9 == v10)
  {
    [(PLThreadInfo *)self systemTime];
    double v14 = v13;
    [v4 systemTime];
    BOOL v11 = v14 == v15;
  }
  else
  {
LABEL_4:
    BOOL v11 = 0;
  }

  return v11;
}

- (double)systemTime
{
  return self->_systemTime;
}

- (void)setSystemTime:(double)a3
{
  self->_systemTime = a3;
}

- (double)userTime
{
  return self->_userTime;
}

- (void)setUserTime:(double)a3
{
  self->_userTime = a3;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(unint64_t)a3
{
  self->_threadID = a3;
}

- (NSString)threadName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setThreadName:(id)a3
{
}

- (BOOL)isNamed
{
  return self->_isNamed;
}

- (void)setIsNamed:(BOOL)a3
{
  self->_isNamed = a3;
}

- (void).cxx_destruct
{
}

@end