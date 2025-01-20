@interface TMTimeZoneManager
- (BOOL)isSourceAvailable:(id)a3;
- (TMTimeZone)currentTimeZone;
- (TMTimeZoneManager)initWithRules:(id)a3;
- (TMTimeZoneManager)initWithRules:(id)a3 delegate:(id)a4;
- (TMTimeZoneManagerDelegate)delegate;
- (id)description;
- (void)dealloc;
- (void)reset:(id)a3;
- (void)sendStateAnalytics;
- (void)setCurrentTimeZone:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSourceAvailable:(id)a3;
- (void)setSourceTimeZone:(id)a3;
- (void)setSourceUnavailable:(id)a3;
@end

@implementation TMTimeZoneManager

- (void)setSourceTimeZone:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"TMTimeZoneManager.m", 67, @"Invalid parameter not satisfying: %@", @"tz" object file lineNumber description];
  }
  v5 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  v6 = (id *)[a3 source];
  v7 = qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [a3 olsonName];
    *(_DWORD *)buf = 138412546;
    v11 = (TMTimeZoneManager *)v6;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "TZ,setSourceTimeZone,src,%@,tz,%@", buf, 0x16u);
  }
  if (![(TMTimeZoneManager *)self isSourceAvailable:v6])
  {
    v9 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001B2BC((uint64_t)v6, v9);
    }
    [(NSMutableSet *)self->availableSources addObject:v6];
  }
  [(NSMutableDictionary *)self->inputs setObject:a3 forKeyedSubscript:v6];
  sub_10000EE60((id *)&self->super.isa, v6);
}

- (void)reset:(id)a3
{
  v5 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
  }
  v6 = qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TZ,reset,reason,%@", (uint8_t *)&v7, 0xCu);
  }
  [(TMTimeZoneManager *)self setCurrentTimeZone:0];
  [(NSMutableDictionary *)self->inputs removeAllObjects];
  [(TMTimeZoneManagerDelegate *)self->_delegate timeZoneManager:self didReset:a3];
}

- (void)dealloc
{
  [(TMTimeZoneManager *)self setCurrentTimeZone:0];
  v3.receiver = self;
  v3.super_class = (Class)TMTimeZoneManager;
  [(TMTimeZoneManager *)&v3 dealloc];
}

- (TMTimeZoneManager)initWithRules:(id)a3
{
  return [(TMTimeZoneManager *)self initWithRules:a3 delegate:0];
}

- (TMTimeZoneManager)initWithRules:(id)a3 delegate:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)TMTimeZoneManager;
  v6 = [(TMTimeZoneManager *)&v12 init];
  int v7 = v6;
  if (v6)
  {
    v6->_delegate = (TMTimeZoneManagerDelegate *)a4;
    id v8 = [[objc_msgSend(a3, "allKeys") sortedArrayUsingFunction:sub_10000F5D8 context:a3];
    v7->rules = (NSOrderedSet *)[objc_alloc((Class)NSOrderedSet) initWithArray:v8];
    id v9 = [v8 count];
    v7->availableSources = (NSMutableSet *)[objc_alloc((Class)NSMutableSet) initWithCapacity:v9];
    v7->inputs = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithCapacity:v9];
    v10 = qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "TZ,init,rules,%lu", buf, 0xCu);
    }
    [(TMTimeZoneManager *)v7 reset:@"init"];
  }
  return v7;
}

- (void)setSourceAvailable:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"TMTimeZoneManager.m", 138, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];
  }
  v5 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  v6 = qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TZ,setSourceAvailable,src,%@", buf, 0xCu);
  }
  if (([(NSMutableSet *)self->availableSources containsObject:a3] & 1) == 0)
  {
    [(NSMutableSet *)self->availableSources addObject:a3];
    [(NSMutableDictionary *)self->inputs setObject:0 forKeyedSubscript:a3];
    if ([(id)sub_10000F0EC((uint64_t)self) isEqualToString:a3]) {
      sub_10000ED50((id *)&self->super.isa, (id *)a3);
    }
  }
}

- (void)setSourceUnavailable:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"TMTimeZoneManager.m", 154, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];
  }
  v5 = qword_1000338F8;
  if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  v6 = qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TZ,setSourceUnavailable,src,%@", buf, 0xCu);
  }
  if ([(NSMutableSet *)self->availableSources containsObject:a3])
  {
    unsigned int v7 = [a3 isEqualToString:sub_10000F0EC((uint64_t)self)];
    [(NSMutableSet *)self->availableSources removeObject:a3];
    if (v7)
    {
      id v8 = (id *)sub_10000F0EC((uint64_t)self);
      if (v8) {
        sub_10000ED50((id *)&self->super.isa, v8);
      }
    }
  }
}

- (BOOL)isSourceAvailable:(id)a3
{
  if (!a3) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"TMTimeZoneManager.m", 175, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];
  }
  unsigned int v5 = [(NSMutableSet *)self->availableSources containsObject:a3];
  v6 = qword_100033900;
  if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v9 = a3;
    __int16 v10 = 1024;
    unsigned int v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TZ,isSourceAvailable,src,%@,result,%d", buf, 0x12u);
  }
  return v5;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class();
  id v5 = [v3 initWithFormat:@"<%@: %p {\n", NSStringFromClass(v4), self];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  rules = self->rules;
  id v7 = [(NSOrderedSet *)rules countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(rules);
        }
        unsigned int v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = [[-[NSMutableDictionary objectForKeyedSubscript:](self->inputs, "objectForKeyedSubscript:", v11) olsonName];
        id v13 = [(NSMutableSet *)self->availableSources containsObject:v11];
        id v14 = [v11 UTF8String];
        if (v12) {
          v15 = (const char *)[v12 UTF8String];
        }
        else {
          v15 = "--";
        }
        [v5 appendFormat:@"%18s %d %s,\n", v14, v13, v15];
      }
      id v8 = [(NSOrderedSet *)rules countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  [v5 appendFormat:@"} = %@>", -[TMTimeZoneManager currentTimeZone](self, "currentTimeZone")];
  return v5;
}

- (void)sendStateAnalytics
{
  id v3 = +[NSMutableDictionary dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obj = self->rules;
  id v4 = [(NSOrderedSet *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [[-[NSMutableDictionary objectForKeyedSubscript:](self->inputs, "objectForKeyedSubscript:", v8) olsonName];
        id v10 = [v8 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
        if (v9) {
          unsigned int v11 = (const char *)[v9 UTF8String];
        }
        else {
          unsigned int v11 = "--";
        }
        [v3 setValue:[NSString stringWithUTF8String:v11] forKey:v10];
      }
      id v5 = [(NSOrderedSet *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  id v12 = [[(TMTimeZoneManager *)self currentTimeZone] olsonName];
  if (v12) {
    CFStringRef v13 = (const __CFString *)v12;
  }
  else {
    CFStringRef v13 = @"--";
  }
  [v3 setValue:v13 forKey:@"TMComputed"];
  AnalyticsSendEventLazy();
}

- (TMTimeZone)currentTimeZone
{
  return (TMTimeZone *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentTimeZone:(id)a3
{
}

- (TMTimeZoneManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TMTimeZoneManagerDelegate *)a3;
}

@end