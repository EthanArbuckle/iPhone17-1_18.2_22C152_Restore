@interface CHChannelEnum
+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3;
+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5;
- (BOOL)stringValuesRemapped;
- (id)enabledStateForStrings;
- (id)intValuesForStrings;
- (id)stringAtIndex:(unint64_t)a3;
- (id)stringValue;
- (id)stringValueAtTime:(id *)a3;
- (id)strings;
- (int)defaultIntValue;
- (int)intValue;
- (int)intValueAtTime:(id *)a3;
- (int)intValueForIndex:(int)a3;
- (unint64_t)stringCount;
- (void)ozChannel;
- (void)setCurveIntValue:(int)a3 atTime:(id *)a4 options:(unsigned int)a5;
- (void)setCurveStringValue:(id)a3 atTime:(id *)a4 options:(unsigned int)a5;
- (void)setDefaultIntValue:(int)a3;
- (void)setEnabledStateForStrings:(id)a3;
- (void)setIntValue:(int)a3;
- (void)setIntValuesForStrings:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setStrings:(id)a3;
- (void)setStringsFromChannel:(id)a3;
- (void)setStringsWithArray:(id)a3;
@end

@implementation CHChannelEnum

+ (BOOL)_isOZChannelClassOK:(OZChannelBase *)a3
{
  return a3
}

+ (OZChannelBase)_newOZChannelWithName:(id)a3 channelID:(unsigned int)a4 flags:(unsigned int)a5
{
}

- (void)ozChannel
{
  result = self->super.super._pOZChannel;
  if (result) {
  return result;
  }
}

- (int)intValueAtTime:(id *)a3
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v5 = 0;
  (*((void (**)(CMTime *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v5->var0 + 42))(&v7, v5, a3);
  return OZChannel::getValueAsInt(v5, &v7, 0.0);
}

- (int)intValue
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {
  return (int)OZChannel::getInitialValue(pOZChannel);
  }
}

- (int)intValueForIndex:(int)a3
{
  if (*((void *)v4 + 22) == *((void *)v4 + 21)) {
    return a3;
  }

  return OZChannelEnum::getTag(v4, a3);
}

- (id)stringValueAtTime:(id *)a3
{
  id v5 = [(CHChannelEnum *)self intValuesForStrings];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
  uint64_t v6 = [(CHChannelEnum *)self intValueAtTime:&v10];
  CMTime v7 = (void *)[objc_alloc(NSNumber) initWithInt:v6];
  v8 = (void *)[v5 allKeysForObject:v7];

  return (id)[v8 lastObject];
}

- (id)stringValue
{
  id v3 = [(CHChannelEnum *)self intValuesForStrings];
  uint64_t v4 = [(CHChannelEnum *)self intValue];
  id v5 = (void *)[objc_alloc(NSNumber) initWithInt:v4];
  uint64_t v6 = (void *)[v3 allKeysForObject:v5];

  return (id)[v6 lastObject];
}

- (void)setCurveIntValue:(int)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  char v5 = a5;
  Instance = (OZCoreGlobals *)OZCoreGlobals::getInstance((OZCoreGlobals *)self);
  char v10 = *((unsigned char *)Instance + 8);
  *(unsigned char *)(OZCoreGlobals::getInstance(Instance) + 8) = v5 & 1;
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    v12 = 0;
  if ((~a4->var2 & 0x11) != 0)
  {
    (*((void (**)(void *__return_ptr, OZChannel *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))v12->var0 + 42))(v15, v12, a4);
    v14.n128_f64[0] = (double)a3;
    v13 = (OZCoreGlobals *)(*((uint64_t (**)(OZChannel *, void *, void, __n128))v12->var0 + 89))(v12, v15, 0, v14);
  }
  else
  {
    v13 = (OZCoreGlobals *)OZChannel::setInitialValue(v12, (double)a3, 0);
  }
  *(unsigned char *)(OZCoreGlobals::getInstance(v13) + 8) = v10;
}

- (void)setIntValue:(int)a3
{
  long long v3 = *MEMORY[0x1E4F1F9F0];
  uint64_t v4 = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
  [(CHChannelEnum *)self setCurveIntValue:*(void *)&a3 atTime:&v3 options:0];
}

- (void)setCurveStringValue:(id)a3 atTime:(id *)a4 options:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  v8 = objc_msgSend(-[CHChannelEnum intValuesForStrings](self, "intValuesForStrings"), "objectForKey:", a3);
  if (v8)
  {
    uint64_t v9 = [v8 intValue];
    long long v10 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    [(CHChannelEnum *)self setCurveIntValue:v9 atTime:&v10 options:v5];
  }
}

- (void)setStringValue:(id)a3
{
  long long v3 = *MEMORY[0x1E4F1F9F0];
  uint64_t v4 = *(void *)(MEMORY[0x1E4F1F9F0] + 16);
  [(CHChannelEnum *)self setCurveStringValue:a3 atTime:&v3 options:0];
}

- (int)defaultIntValue
{
  pOZChannel = (OZChannel *)self->super.super._pOZChannel;
  if (pOZChannel) {
  return (int)OZChannel::getDefaultValue(pOZChannel);
  }
}

- (void)setDefaultIntValue:(int)a3
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v5 = 0;
  OZChannel::setDefaultValue(v5, (double)a3);
  int v6 = (*((uint64_t (**)(OZChannel *))v5->var0 + 64))(v5);
  var0 = v5->var0;
  if (v6)
  {
    if (((unsigned int (*)(OZChannel *))var0[104])(v5)) {
      return;
    }
  }
  else if (((uint64_t (*)(OZChannel *, uint64_t))var0[62])(v5, 1))
  {
    return;
  }
  v8 = (void (*)(OZChannel *, void))*((void *)v5->var0 + 36);

  v8(v5, 0);
}

- (unint64_t)stringCount
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  return OZChannelEnum::getNumberOfStrings((OZChannelEnum *)pOZChannel);
  }
}

- (id)stringAtIndex:(unint64_t)a3
{
  unsigned int v3 = a3;
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  String = (PCString *)OZChannelEnum::getString((OZChannelEnum *)pOZChannel, v3);
  }

  return PCString::ns_str(String);
}

- (id)strings
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    unsigned int v3 = 0;
  unsigned int NumberOfStrings = OZChannelEnum::getNumberOfStrings(v3);
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:NumberOfStrings];
  if (NumberOfStrings)
  {
    for (unsigned int i = 0; i != NumberOfStrings; ++i)
    {
      String = (PCString *)OZChannelEnum::getString(v3, i);
      [v5 addObject:PCString::ns_str(String)];
    }
  }

  return v5;
}

- (void)setStringsWithArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v5 = 0;
  PCSharedCount::PCSharedCount(&v15);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        CFStringRef v9 = *(const __CFString **)(*((void *)&v11 + 1) + 8 * v8);
        if (!PCString::empty((PCString *)&v15)) {
          PCString::append((PCString *)&v15, ";");
        }
        v10.var0 = 0;
        PCString::set(&v10, v9);
        PCString::append((PCString *)&v15, &v10);
        PCString::~PCString(&v10);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }
  (*(void (**)(void *, PCSharedCount *, uint64_t))(*(void *)v5 + 848))(v5, &v15, 1);
  PCString::~PCString((PCString *)&v15);
}

- (void)setStrings:(id)a3
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v5 = 0;
  v6.var0 = 0;
  PCString::set(&v6, (CFStringRef)a3);
  (*(void (**)(void *, PCString *, uint64_t))(*(void *)v5 + 848))(v5, &v6, 1);
  PCString::~PCString(&v6);
}

- (void)setStringsFromChannel:(id)a3
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v5 = 0;
  uint64_t v6 = [a3 ozChannel];
  uint64_t v7 = *(void (**)(void *, uint64_t))(*(void *)v5 + 856);

  v7(v5, v6);
}

- (BOOL)stringValuesRemapped
{
  return v2[22] != v2[21];
}

- (id)intValuesForStrings
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v4 = 0;
  unint64_t v5 = [(CHChannelEnum *)self stringCount];
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v5];
  if (v5)
  {
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v10 = *((void *)v4 + 21);
    uint64_t v9 = *((void *)v4 + 22);
    do
    {
      id v11 = [(CHChannelEnum *)self stringAtIndex:v7];
      uint64_t Tag = v8;
      if (v9 != v10) {
        uint64_t Tag = OZChannelEnum::getTag(v4, v8);
      }
      long long v13 = (void *)[objc_alloc(NSNumber) initWithInt:Tag];
      [v6 setObject:v13 forKey:v11];

      unint64_t v7 = (v8 + 1);
      uint64_t v8 = v7;
    }
    while (v5 > v7);
  }
  return v6;
}

- (void)setIntValuesForStrings:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v6 = 0;
  unint64_t v7 = [(CHChannelEnum *)self stringCount];
  uint64_t v8 = (char *)v10 - ((4 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
      *(_DWORD *)&v8[4 * i] = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", -[CHChannelEnum stringAtIndex:](self, "stringAtIndex:", i)), "intValue");
  }
  OZChannelEnum::setTags(v6, v8, v7);
}

- (id)enabledStateForStrings
{
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v4 = 0;
  unint64_t v5 = [(CHChannelEnum *)self stringCount];
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v5];
  if (v5)
  {
    unint64_t v7 = 0;
    uint64_t v8 = *((void *)v4 + 25);
    unsigned int v9 = 1;
    do
    {
      id v10 = [(CHChannelEnum *)self stringAtIndex:v7];
      if (v8) {
        uint64_t EnabledState = OZChannelEnum::getEnabledState(v4, v7);
      }
      else {
        uint64_t EnabledState = 1;
      }
      long long v12 = (void *)[objc_alloc(NSNumber) initWithBool:EnabledState];
      [v6 setObject:v12 forKey:v10];

      unint64_t v7 = v9;
    }
    while (v5 > v9++);
  }
  return v6;
}

- (void)setEnabledStateForStrings:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  pOZChannel = self->super.super._pOZChannel;
  if (pOZChannel) {
  else
  }
    uint64_t v6 = 0;
  unint64_t v7 = [(CHChannelEnum *)self stringCount];
  uint64_t v8 = (BOOL *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
      v8[i] = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", -[CHChannelEnum stringAtIndex:](self, "stringAtIndex:", i)), "BOOLValue");
  }
  OZChannelEnum::setEnabledStates(v6, v8, v7);
}

@end