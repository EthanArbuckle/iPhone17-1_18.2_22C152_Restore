@interface RadioPowerCC
- (RadioPowerCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withMitigationType:(int)a4 withParams:(__CFDictionary *)a5;
- (unint64_t)convertDetailStringToValue:(__CFString *)a3;
- (void)defaultAction;
@end

@implementation RadioPowerCC

- (RadioPowerCC)initWithRunLoopAndParams:(__CFRunLoop *)a3 withMitigationType:(int)a4 withParams:(__CFDictionary *)a5
{
  v13.receiver = self;
  v13.super_class = (Class)RadioPowerCC;
  v6 = -[RadioCC initWithRunLoopAndParams:withMitigationType:withParams:](&v13, "initWithRunLoopAndParams:withMitigationType:withParams:", a3, *(void *)&a4);
  v7 = v6;
  if (a5 && v6)
  {
    Value = CFDictionaryGetValue(a5, @"mitigationDetails");
    if (Value)
    {
      v9 = Value;
      [(ComponentControl *)v7 setMitigationDetails:[(RadioPowerCC *)v7 convertDetailStringToValue:Value]];
      if (byte_1000AA7A0)
      {
        v10 = qword_1000AABC0;
        if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v11 = [(ComponentControl *)v7 mitigationDetails];
          *(_DWORD *)buf = 138412546;
          v15 = v9;
          __int16 v16 = 2048;
          unint64_t v17 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "<Notice> detailString: %@ detailValue: %lld", buf, 0x16u);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR))
    {
      sub_10005A1C4(v7);
    }
  }
  return v7;
}

- (unint64_t)convertDetailStringToValue:(__CFString *)a3
{
  CFIndex Length = CFStringGetLength(a3);
  if (Length == 4)
  {
    CFIndex v5 = 0;
    unint64_t v6 = 0;
    do
    {
      unsigned __int8 CharacterAtIndex = CFStringGetCharacterAtIndex(a3, v5);
      if (v5 == 3) {
        v6 += CharacterAtIndex;
      }
      else {
        unint64_t v6 = (v6 + CharacterAtIndex) << 8;
      }
      ++v5;
    }
    while (v5 != 4);
  }
  else
  {
    uint64_t v8 = Length;
    v9 = qword_1000AABC0;
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005A240((uint64_t)a3, v8, v9);
    }
    return 0;
  }
  return v6;
}

- (void)defaultAction
{
  if ([(ComponentControl *)self isCPMSControlEnabled])
  {
    if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
      sub_10005A2C8(self);
    }
    [(RadioCC *)self setCPMSMitigationState:1];
  }
}

@end