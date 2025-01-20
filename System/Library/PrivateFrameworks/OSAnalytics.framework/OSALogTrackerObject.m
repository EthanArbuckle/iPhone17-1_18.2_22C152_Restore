@interface OSALogTrackerObject
+ (id)sharedTrackers;
+ (id)tracker;
- (NSDate)oldestDate;
- (NSMutableDictionary)signatures;
- (NSString)oldestLogPath;
- (OSALogTrackerObject)init;
- (id)description;
- (unint64_t)count;
- (void)setCount:(unint64_t)a3;
- (void)setOldestDate:(id)a3;
- (void)setOldestLogPath:(id)a3;
@end

@implementation OSALogTrackerObject

- (NSDate)oldestDate
{
  return self->_oldestDate;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)count
{
  return self->_count;
}

+ (id)sharedTrackers
{
  if (sharedTrackers_onceToken != -1) {
    dispatch_once(&sharedTrackers_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedTrackers_sharedLogTrackers;
  return v2;
}

uint64_t __37__OSALogTrackerObject_sharedTrackers__block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1);
  v1 = (void *)sAccountingSemaphore;
  sAccountingSemaphore = (uint64_t)v0;

  sharedTrackers_sharedLogTrackers = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  return MEMORY[0x1F41817F8]();
}

- (OSALogTrackerObject)init
{
  v10.receiver = self;
  v10.super_class = (Class)OSALogTrackerObject;
  v2 = [(OSALogTrackerObject *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_count = 1;
    uint64_t v4 = objc_opt_new();
    signatures = v3->_signatures;
    v3->_signatures = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    oldestDate = v3->_oldestDate;
    v3->_oldestDate = (NSDate *)v6;

    oldestLogPath = v3->_oldestLogPath;
    v3->_oldestLogPath = 0;
  }
  return v3;
}

+ (id)tracker
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lu", self->_count);
}

- (NSString)oldestLogPath
{
  return self->_oldestLogPath;
}

- (void)setOldestLogPath:(id)a3
{
}

- (void)setOldestDate:(id)a3
{
}

- (NSMutableDictionary)signatures
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_storeStrong((id *)&self->_oldestDate, 0);
  objc_storeStrong((id *)&self->_oldestLogPath, 0);
}

@end