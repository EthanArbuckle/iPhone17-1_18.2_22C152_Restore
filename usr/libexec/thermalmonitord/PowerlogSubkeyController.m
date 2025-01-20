@interface PowerlogSubkeyController
- (id)cacheArray;
- (id)initForSubkey:(__CFString *)a3;
- (void)logHIPStatusToPowerlogLite:(id)a3;
- (void)logToPowerlog:(__CFString *)a3;
- (void)logToPowerlogLite;
- (void)printPowerLogDictionary;
- (void)setIntValue:(int)a3 forKey:(__CFString *)a4;
@end

@implementation PowerlogSubkeyController

- (id)cacheArray
{
  id result = (id)qword_1000AA050;
  if (!qword_1000AA050)
  {
    id result = objc_alloc_init((Class)NSMutableArray);
    qword_1000AA050 = (uint64_t)result;
  }
  return result;
}

- (id)initForSubkey:(__CFString *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PowerlogSubkeyController;
  v4 = [(PowerlogSubkeyController *)&v6 init];
  if (v4)
  {
    v4->_state = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v4->_stateLastLogged = 0;
    v4->_subkey = a3;
  }
  return v4;
}

- (void)setIntValue:(int)a3 forKey:(__CFString *)a4
{
  int valuePtr = a3;
  if (a4)
  {
    state = self->_state;
    if (state) {
      sub_100005654(state, a4, kCFNumberIntType, &valuePtr);
    }
  }
}

- (void)logToPowerlog:(__CFString *)a3
{
  if (self->_subkey)
  {
    state = self->_state;
    if (state)
    {
      if (CFDictionaryGetCount(state) >= 1)
      {
        if (self->_stateLastLogged
          && -[__CFDictionary isEqualToDictionary:](self->_state, "isEqualToDictionary:"))
        {
          if (byte_1000AA7A0)
          {
            objc_super v6 = qword_1000AABC0;
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
            {
              subkey = self->_subkey;
              int v12 = 136315394;
              v13 = "-[PowerlogSubkeyController logToPowerlog:]";
              __int16 v14 = 2112;
              v15 = subkey;
              _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "<Notice> %s: no change in subkey %@", (uint8_t *)&v12, 0x16u);
            }
          }
        }
        else if (PLShouldLogRegisteredEvent())
        {
          stateLastLogged = self->_stateLastLogged;
          if (stateLastLogged) {
            CFRelease(stateLastLogged);
          }
          self->_stateLastLogged = CFDictionaryCreateCopy(kCFAllocatorDefault, self->_state);
          if (a3) {
            CFDictionarySetValue(self->_state, @"Time", a3);
          }
          PLLogRegisteredEvent();
          if (byte_1000AA7A0)
          {
            v9 = qword_1000AABC0;
            if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
            {
              v10 = self->_subkey;
              v11 = self->_state;
              int v12 = 136315650;
              v13 = "-[PowerlogSubkeyController logToPowerlog:]";
              __int16 v14 = 2112;
              v15 = v10;
              __int16 v16 = 2112;
              v17 = v11;
              _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> %s: logged subkey %@, dict %@", (uint8_t *)&v12, 0x20u);
            }
          }
          CFDictionaryRemoveValue(self->_state, @"Time");
        }
      }
    }
  }
}

- (void)printPowerLogDictionary
{
  if (byte_1000AA7A0)
  {
    v3 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      state = self->_state;
      int v5 = 138412290;
      objc_super v6 = state;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "<Notice> %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)logToPowerlogLite
{
  if (PLShouldLogRegisteredEvent())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v3 = [(PowerlogSubkeyController *)self cacheArray];
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v7);
          if (v8)
          {
            v15[0] = @"Time";
            v16[0] = [v8 objectAtIndex:0];
            v15[1] = @"thermalLevel";
            v16[1] = [v8 objectAtIndex:1];
            v15[2] = @"pressureLevel";
            v16[2] = [v8 objectAtIndex:2];
            +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
            PLLogRegisteredEvent();
          }
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
      }
      while (v5);
    }
    [self cacheArray].removeAllObjects;
  }
  else if (byte_1000AA7A0)
  {
    v9 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      subkey = self->_subkey;
      *(_DWORD *)buf = 138412290;
      v19 = subkey;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "<Notice> Denied to log to lite mode powerlog %@", buf, 0xCu);
    }
  }
}

- (void)logHIPStatusToPowerlogLite:(id)a3
{
  if (PLShouldLogRegisteredEvent())
  {
    v6[0] = @"Time";
    v7[0] = [a3 objectAtIndex:0];
    v6[1] = @"status";
    v7[1] = [a3 objectAtIndex:1];
    v6[2] = @"client";
    v7[2] = [a3 objectAtIndex:2];
    +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];
    PLLogRegisteredEvent();
  }
  else if (byte_1000AA7A0)
  {
    id v4 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "<Notice> Denied to log to lite mode powerlog", v5, 2u);
    }
  }
}

@end