@interface PSYOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)dryRun;
- (BOOL)shouldResetDeviceSyncState;
- (BOOL)shouldResumePendingJobs;
- (NSArray)jobs;
- (NSArray)testInputs;
- (NSURL)activityInfoDirectory;
- (PSYOptions)init;
- (PSYOptions)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)syncSessionType;
- (unint64_t)terminationJobCount;
- (void)encodeWithCoder:(id)a3;
- (void)setActivityInfoDirectory:(id)a3;
- (void)setDryRun:(BOOL)a3;
- (void)setJobs:(id)a3;
- (void)setResetDeviceSyncState:(BOOL)a3;
- (void)setResumePendingJobs:(BOOL)a3;
- (void)setSyncSessionType:(unint64_t)a3;
- (void)setTerminationJobCount:(unint64_t)a3;
- (void)setTestInputs:(id)a3;
@end

@implementation PSYOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PSYOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PSYOptions;
  result = [(PSYOptions *)&v3 init];
  if (result)
  {
    result->_resumePendingJobs = 1;
    result->_terminationJobCount = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (PSYOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PSYOptions;
  v5 = [(PSYOptions *)&v17 init];
  if (v5)
  {
    v5->_resumePendingJobs = [v4 decodeBoolForKey:@"PSOptionsResumePendingJobsKey"];
    v5->_dryRun = [v4 decodeBoolForKey:@"PSOptionsDryRunKey"];
    v5->_terminationJobCount = [v4 decodeIntegerForKey:@"PSOptionsTerminationJobCount"];
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"PSOptionsTestInputsKey"];
    testInputs = v5->_testInputs;
    v5->_testInputs = (NSArray *)v9;

    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"PSOptionsJobsKey"];
    jobs = v5->_jobs;
    v5->_jobs = (NSArray *)v14;

    v5->_resetDeviceSyncState = [v4 decodeBoolForKey:@"PSOptionsResetDeviceSyncStateKey"];
    v5->_syncSessionType = [v4 decodeIntegerForKey:@"syncSessionType"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[PSYOptions shouldResumePendingJobs](self, "shouldResumePendingJobs"), @"PSOptionsResumePendingJobsKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[PSYOptions dryRun](self, "dryRun"), @"PSOptionsDryRunKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[PSYOptions terminationJobCount](self, "terminationJobCount"), @"PSOptionsTerminationJobCount");
  [v4 encodeObject:self->_testInputs forKey:@"PSOptionsTestInputsKey"];
  [v4 encodeObject:self->_jobs forKey:@"PSOptionsJobsKey"];
  [v4 encodeBool:self->_resetDeviceSyncState forKey:@"PSOptionsResetDeviceSyncStateKey"];
  [v4 encodeInteger:self->_syncSessionType forKey:@"syncSessionType"];
}

- (id)description
{
  objc_super v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[PSYOptions dryRun](self, "dryRun"));
  uint64_t v7 = [(PSYOptions *)self jobs];
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[PSYOptions shouldResetDeviceSyncState](self, "shouldResetDeviceSyncState"));
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p; dryRun=%@; jobs=%@; resetDeviceSyncState=%@>",
    v5,
    self,
    v6,
    v7,
  uint64_t v9 = v8);

  return v9;
}

- (BOOL)shouldResumePendingJobs
{
  return self->_resumePendingJobs;
}

- (void)setResumePendingJobs:(BOOL)a3
{
  self->_resumePendingJobs = a3;
}

- (NSURL)activityInfoDirectory
{
  return self->_activityInfoDirectory;
}

- (void)setActivityInfoDirectory:(id)a3
{
}

- (BOOL)shouldResetDeviceSyncState
{
  return self->_resetDeviceSyncState;
}

- (void)setResetDeviceSyncState:(BOOL)a3
{
  self->_resetDeviceSyncState = a3;
}

- (BOOL)dryRun
{
  return self->_dryRun;
}

- (void)setDryRun:(BOOL)a3
{
  self->_dryRun = a3;
}

- (unint64_t)terminationJobCount
{
  return self->_terminationJobCount;
}

- (void)setTerminationJobCount:(unint64_t)a3
{
  self->_terminationJobCount = a3;
}

- (NSArray)testInputs
{
  return self->_testInputs;
}

- (void)setTestInputs:(id)a3
{
}

- (NSArray)jobs
{
  return self->_jobs;
}

- (void)setJobs:(id)a3
{
}

- (unint64_t)syncSessionType
{
  return self->_syncSessionType;
}

- (void)setSyncSessionType:(unint64_t)a3
{
  self->_syncSessionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jobs, 0);
  objc_storeStrong((id *)&self->_testInputs, 0);

  objc_storeStrong((id *)&self->_activityInfoDirectory, 0);
}

@end