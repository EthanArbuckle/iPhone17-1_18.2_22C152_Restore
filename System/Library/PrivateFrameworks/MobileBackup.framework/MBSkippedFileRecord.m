@interface MBSkippedFileRecord
- (MBSkippedFileRecord)initWithDictionaryRepresentation:(id)a3;
- (NSDate)dateSkipped;
- (NSString)absolutePath;
- (NSString)domain;
- (NSString)relativePath;
- (id)description;
- (id)dictionaryRepresentation;
- (int)err;
- (int)syscallErrno;
- (unint64_t)syscallType;
- (void)setAbsolutePath:(id)a3;
- (void)setDateSkipped:(id)a3;
- (void)setDomain:(id)a3;
- (void)setRelativePath:(id)a3;
- (void)setSyscallErrno:(int)a3;
- (void)setSyscallType:(unint64_t)a3;
@end

@implementation MBSkippedFileRecord

- (MBSkippedFileRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MBSkippedFileRecord;
  v5 = [(MBSkippedFileRecord *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"absolutePath"];
    absolutePath = v5->_absolutePath;
    v5->_absolutePath = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"domain"];
    domain = v5->_domain;
    v5->_domain = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"relativePath"];
    relativePath = v5->_relativePath;
    v5->_relativePath = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"dateSkipped"];
    dateSkipped = v5->_dateSkipped;
    v5->_dateSkipped = (NSDate *)v12;

    v14 = [v4 objectForKeyedSubscript:@"syscallType"];
    v5->_syscallType = (unint64_t)[v14 unsignedIntegerValue];

    v15 = [v4 objectForKeyedSubscript:@"syscallErrno"];
    v5->_syscallErrno = [v15 intValue];
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v11[0] = @"absolutePath";
  v3 = [(MBSkippedFileRecord *)self absolutePath];
  v12[0] = v3;
  v11[1] = @"domain";
  id v4 = [(MBSkippedFileRecord *)self domain];
  v12[1] = v4;
  v11[2] = @"relativePath";
  v5 = [(MBSkippedFileRecord *)self relativePath];
  v12[2] = v5;
  v11[3] = @"dateSkipped";
  uint64_t v6 = [(MBSkippedFileRecord *)self dateSkipped];
  v12[3] = v6;
  v11[4] = @"syscallType";
  v7 = +[NSNumber numberWithUnsignedInteger:[(MBSkippedFileRecord *)self syscallType]];
  v12[4] = v7;
  v11[5] = @"syscallErrno";
  uint64_t v8 = +[NSNumber numberWithInt:[(MBSkippedFileRecord *)self syscallErrno]];
  v12[5] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];

  return v9;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  Name = class_getName(v3);
  v5 = [(MBSkippedFileRecord *)self absolutePath];
  uint64_t v6 = [(MBSkippedFileRecord *)self domain];
  v7 = [(MBSkippedFileRecord *)self relativePath];
  unint64_t v8 = [(MBSkippedFileRecord *)self syscallType];
  uint64_t v9 = [(MBSkippedFileRecord *)self syscallErrno];
  uint64_t v10 = [(MBSkippedFileRecord *)self dateSkipped];
  v11 = +[NSString stringWithFormat:@"<%s: %p abs=%@, domain=%@ rel=%@ syscall=%lu errno=%d date=%@>", Name, self, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (NSString)absolutePath
{
  return self->_absolutePath;
}

- (void)setAbsolutePath:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
}

- (NSDate)dateSkipped
{
  return self->_dateSkipped;
}

- (void)setDateSkipped:(id)a3
{
}

- (unint64_t)syscallType
{
  return self->_syscallType;
}

- (void)setSyscallType:(unint64_t)a3
{
  self->_syscallType = a3;
}

- (int)err
{
  return self->_err;
}

- (int)syscallErrno
{
  return self->_syscallErrno;
}

- (void)setSyscallErrno:(int)a3
{
  self->_syscallErrno = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateSkipped, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_absolutePath, 0);
}

@end