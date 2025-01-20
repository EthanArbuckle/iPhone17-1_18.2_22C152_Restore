@interface MRLogBuffer
+ (id)bufferWithCapacity:(int64_t)a3 category:(id)a4 loggingPrefix:(id)a5;
- (MRLogBuffer)initWithCapacity:(int64_t)a3 category:(id)a4 prefix:(id)a5;
- (NSArray)history;
- (NSDateFormatter)dateFormatter;
- (NSString)prefix;
- (OS_os_log)category;
- (id)description;
- (int64_t)capacity;
- (os_unfair_lock_s)lock;
- (void)log:(id)a3;
- (void)log:(id)a3 withType:(unsigned __int8)a4 capture:(BOOL)a5;
- (void)logDebug:(id)a3;
- (void)logDebugWithoutCapture:(id)a3;
- (void)logError:(id)a3;
- (void)logErrorWithInterpolatedString:(id)a3;
- (void)logErrorWithoutCapture:(id)a3;
- (void)logFault:(id)a3;
- (void)logFaultWithoutCapture:(id)a3;
- (void)logInfo:(id)a3;
- (void)logInfoWithoutCapture:(id)a3;
- (void)logInterpolatedString:(id)a3;
- (void)logWithoutCapture:(id)a3;
- (void)setDateFormatter:(id)a3;
- (void)setHistory:(id)a3;
@end

@implementation MRLogBuffer

+ (id)bufferWithCapacity:(int64_t)a3 category:(id)a4 loggingPrefix:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [[MRLogBuffer alloc] initWithCapacity:a3 category:v8 prefix:v7];

  return v9;
}

- (MRLogBuffer)initWithCapacity:(int64_t)a3 category:(id)a4 prefix:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MRLogBuffer;
  v11 = [(MRLogBuffer *)&v21 init];
  v12 = v11;
  if (v11)
  {
    v11->_lock._os_unfair_lock_opaque = 0;
    v11->_capacity = a3;
    objc_storeStrong((id *)&v11->_category, a4);
    uint64_t v13 = [v10 copy];
    prefix = v12->_prefix;
    v12->_prefix = (NSString *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
    history = v12->_history;
    v12->_history = (NSArray *)v15;

    v17 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v12->_dateFormatter;
    v12->_dateFormatter = v17;

    v19 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
    [(NSDateFormatter *)v12->_dateFormatter setLocale:v19];

    [(NSDateFormatter *)v12->_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
  }

  return v12;
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_history;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v3, "appendString:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v3 appendString:@"\n"];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  id v10 = (void *)[v3 copy];

  return v10;
}

- (NSArray)history
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)[(NSArray *)self->_history copy];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (void)log:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(MRLogBuffer *)self log:v6 withType:0 capture:1];
}

- (void)logInterpolatedString:(id)a3
{
}

- (void)logErrorWithInterpolatedString:(id)a3
{
}

- (void)logInfo:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(MRLogBuffer *)self log:v6 withType:1 capture:1];
}

- (void)logDebug:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(MRLogBuffer *)self log:v6 withType:2 capture:1];
}

- (void)logError:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(MRLogBuffer *)self log:v6 withType:16 capture:1];
}

- (void)logFault:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(MRLogBuffer *)self log:v6 withType:17 capture:1];
}

- (void)logWithoutCapture:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(MRLogBuffer *)self log:v6 withType:0 capture:0];
}

- (void)logInfoWithoutCapture:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(MRLogBuffer *)self log:v6 withType:1 capture:0];
}

- (void)logDebugWithoutCapture:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(MRLogBuffer *)self log:v6 withType:2 capture:0];
}

- (void)logErrorWithoutCapture:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(MRLogBuffer *)self log:v6 withType:16 capture:0];
}

- (void)logFaultWithoutCapture:(id)a3
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  uint64_t v6 = (void *)[[v4 alloc] initWithFormat:v5 arguments:&v7];

  [(MRLogBuffer *)self log:v6 withType:17 capture:0];
}

- (void)log:(id)a3 withType:(unsigned __int8)a4 capture:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(MRLogBuffer *)self prefix];
  uint64_t v10 = [v9 length];

  v11 = [(MRLogBuffer *)self category];
  BOOL v12 = os_log_type_enabled(v11, (os_log_type_t)a4);
  if (v10)
  {
    if (v12)
    {
      long long v13 = [(MRLogBuffer *)self prefix];
      *(_DWORD *)buf = 138412546;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl(&dword_194F3C000, v11, (os_log_type_t)a4, "%@ %@", buf, 0x16u);
    }
  }
  else if (v12)
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v8;
    _os_log_impl(&dword_194F3C000, v11, (os_log_type_t)a4, "%@", buf, 0xCu);
  }

  if (v5 && [(MRLogBuffer *)self capacity] >= 1)
  {
    os_unfair_lock_lock(&self->_lock);
    long long v14 = self->_history;
    long long v15 = NSString;
    dateFormatter = self->_dateFormatter;
    uint64_t v17 = [MEMORY[0x1E4F1C9C8] now];
    v18 = [(NSDateFormatter *)dateFormatter stringFromDate:v17];
    v19 = [v15 stringWithFormat:@"%@ %@", v18, v8];
    [(NSArray *)v14 addObject:v19];

    unint64_t v20 = [(NSArray *)v14 count];
    if (v20 > [(MRLogBuffer *)self capacity]) {
      [(NSArray *)v14 removeObjectAtIndex:0];
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)setHistory:(id)a3
{
}

- (int64_t)capacity
{
  return self->_capacity;
}

- (OS_os_log)category
{
  return self->_category;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_history, 0);
}

@end