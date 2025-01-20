@interface RCDurationFormatter
+ (id)_dateTimeFormatTemplateForStyle:(int64_t)a3;
+ (id)_localizedDateTimeFormatTemplateForStyle:(int64_t)a3;
+ (id)sharedFormatter;
- (RCDurationFormatter)init;
- (RCDurationIntegers)durationIntegersFromDuration:(SEL)a3 byReplacingDigitsWithDigit:(double)a4 style:(int64_t)a5;
- (RCDurationStrings)durationStringsFromDurationIntegers:(SEL)a3 hideComponentOptions:(RCDurationIntegers *)a4 style:(int64_t)a5 shouldPadMinute:(int64_t)a6;
- (id)_onQueueStringFromDuration:(double)a3 byReplacingDigitsWithDigit:(int64_t)a4 hideComponentOptions:(int64_t)a5 style:(int64_t)a6 shouldPadMinute:(BOOL)a7;
- (id)localizedStringFromDurationStrings:(RCDurationStrings *)a3 style:(int64_t)a4;
- (id)stringFromDuration:(double)a3 hideComponentOptions:(int64_t)a4 style:(int64_t)a5 shouldPadMinute:(BOOL)a6;
- (id)stringFromDuration:(double)a3 replacingDigitsWithDigit:(unint64_t)a4 style:(int64_t)a5;
- (void)_onQueueReloadLocalizedFormatStrings;
- (void)_replaceComponentPlaceholderForType:(unint64_t)a3 withString:(id)a4 inLocalizedDataFormatTemplate:(id)a5;
- (void)reloadLocalizedFormatStrings;
@end

@implementation RCDurationFormatter

- (RCDurationFormatter)init
{
  v16.receiver = self;
  v16.super_class = (Class)RCDurationFormatter;
  v2 = [(RCDurationFormatter *)&v16 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v4 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v5 = *MEMORY[0x1E4F1C370];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __27__RCDurationFormatter_init__block_invoke;
    v13 = &unk_1E6496CA8;
    objc_copyWeak(&v14, &location);
    id v6 = (id)[v3 addObserverForName:v5 object:0 queue:v4 usingBlock:&v10];

    dispatch_queue_t v7 = dispatch_queue_create(0, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    [(RCDurationFormatter *)v2 reloadLocalizedFormatStrings];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)reloadLocalizedFormatStrings
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__RCDurationFormatter_reloadLocalizedFormatStrings__block_invoke;
  block[3] = &unk_1E64963A0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_onQueueReloadLocalizedFormatStrings
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  styleToLocalizedDateTimeFormatTemplate = self->_styleToLocalizedDateTimeFormatTemplate;
  self->_styleToLocalizedDateTimeFormatTemplate = v3;

  for (uint64_t i = 0; i != 5; ++i)
  {
    id v6 = [(id)objc_opt_class() _localizedDateTimeFormatTemplateForStyle:i];
    if (v6)
    {
      dispatch_queue_t v7 = self->_styleToLocalizedDateTimeFormatTemplate;
      v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:i];
      [(NSMutableDictionary *)v7 setObject:v6 forKey:v8];
    }
  }
  v9 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
  defaultFormatter = self->_defaultFormatter;
  self->_defaultFormatter = v9;

  [(NSNumberFormatter *)self->_defaultFormatter setNumberStyle:0];
  [(NSNumberFormatter *)self->_defaultFormatter setMinimumIntegerDigits:2];
  [(NSNumberFormatter *)self->_defaultFormatter setPositiveFormat:@"00"];
  uint64_t v11 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
  nonPaddedHourMinuteFormatter = self->_nonPaddedHourMinuteFormatter;
  self->_nonPaddedHourMinuteFormatter = v11;

  [(NSNumberFormatter *)self->_nonPaddedHourMinuteFormatter setNumberStyle:0];
  [(NSNumberFormatter *)self->_nonPaddedHourMinuteFormatter setMinimumIntegerDigits:1];
  v13 = self->_nonPaddedHourMinuteFormatter;
  [(NSNumberFormatter *)v13 setPositiveFormat:@"0"];
}

+ (id)_localizedDateTimeFormatTemplateForStyle:(int64_t)a3
{
  id v5 = objc_alloc(MEMORY[0x1E4F1CA20]);
  id v6 = [MEMORY[0x1E4F1CA20] currentLocale];
  dispatch_queue_t v7 = [v6 localeIdentifier];
  v8 = (void *)[v5 initWithLocaleIdentifier:v7];

  v9 = [a1 _dateTimeFormatTemplateForStyle:a3];
  DateFormatFromTemplate = (__CFString *)CFDateFormatterCreateDateFormatFromTemplate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v9, 0, (CFLocaleRef)v8);
  uint64_t v11 = [v8 localeIdentifier];
  if ([v11 hasPrefix:@"ee_"]
    && [(__CFString *)DateFormatFromTemplate hasPrefix:@"'aɖabaƒoƒo' "])
  {
    uint64_t v12 = -[__CFString substringFromIndex:](DateFormatFromTemplate, "substringFromIndex:", [@"'aɖabaƒoƒo' " length]);

    DateFormatFromTemplate = (__CFString *)v12;
  }

  return DateFormatFromTemplate;
}

+ (id)_dateTimeFormatTemplateForStyle:(int64_t)a3
{
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __55__RCDurationFormatter__dateTimeFormatTemplateForStyle___block_invoke;
  uint64_t v11 = &__block_descriptor_48_e5_v8__0l;
  SEL v12 = a2;
  id v13 = a1;
  if (_dateTimeFormatTemplateForStyle__onceToken != -1) {
    dispatch_once(&_dateTimeFormatTemplateForStyle__onceToken, &v8);
  }
  v4 = (void *)_dateTimeFormatTemplateForStyle__styleToDateTimeFormat;
  id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", a3, v8, v9, v10, v11, v12, v13);
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (id)stringFromDuration:(double)a3 hideComponentOptions:(int64_t)a4 style:(int64_t)a5 shouldPadMinute:(BOOL)a6
{
  uint64_t v11 = 0;
  SEL v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  id v16 = 0;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__RCDurationFormatter_stringFromDuration_hideComponentOptions_style_shouldPadMinute___block_invoke;
  v9[3] = &unk_1E6496CF8;
  v9[4] = self;
  v9[5] = &v11;
  *(double *)&v9[6] = a3;
  v9[7] = a4;
  v9[8] = a5;
  BOOL v10 = a6;
  dispatch_sync(queue, v9);
  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

+ (id)sharedFormatter
{
  if (sharedFormatter_onceToken != -1) {
    dispatch_once(&sharedFormatter_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)sharedFormatter_sharedInstance;
  return v2;
}

uint64_t __85__RCDurationFormatter_stringFromDuration_hideComponentOptions_style_shouldPadMinute___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _onQueueStringFromDuration:-1 byReplacingDigitsWithDigit:*(void *)(a1 + 56) hideComponentOptions:*(void *)(a1 + 64) style:*(unsigned __int8 *)(a1 + 72) shouldPadMinute:*(double *)(a1 + 48)];
  return MEMORY[0x1F41817F8]();
}

- (id)_onQueueStringFromDuration:(double)a3 byReplacingDigitsWithDigit:(int64_t)a4 hideComponentOptions:(int64_t)a5 style:(int64_t)a6 shouldPadMinute:(BOOL)a7
{
  BOOL v7 = a7;
  long long v16 = 0u;
  long long v17 = 0u;
  [(RCDurationFormatter *)self durationIntegersFromDuration:a4 byReplacingDigitsWithDigit:a6 style:a3];
  memset(v15, 0, sizeof(v15));
  v14[0] = v16;
  v14[1] = v17;
  [(RCDurationFormatter *)self durationStringsFromDurationIntegers:v14 hideComponentOptions:a5 style:a6 shouldPadMinute:v7];
  __copy_constructor_8_8_s0_s8_s16_s24(v13, (id *)v15);
  if (self)
  {
    uint64_t v11 = [(RCDurationFormatter *)self localizedStringFromDurationStrings:v13 style:a6];
  }
  else
  {
    __destructor_8_s0_s8_s16_s24((uint64_t)v13);
    uint64_t v11 = 0;
  }
  __destructor_8_s0_s8_s16_s24((uint64_t)v15);
  return v11;
}

- (id)localizedStringFromDurationStrings:(RCDurationStrings *)a3 style:(int64_t)a4
{
  styleToLocalizedDateTimeFormatTemplate = self->_styleToLocalizedDateTimeFormatTemplate;
  BOOL v7 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
  uint64_t v8 = [(NSMutableDictionary *)styleToLocalizedDateTimeFormatTemplate objectForKeyedSubscript:v7];

  uint64_t v9 = (void *)[v8 mutableCopy];
  [(RCDurationFormatter *)self _replaceComponentPlaceholderForType:0 withString:a3->var0 inLocalizedDataFormatTemplate:v9];
  [(RCDurationFormatter *)self _replaceComponentPlaceholderForType:1 withString:a3->var1 inLocalizedDataFormatTemplate:v9];
  [(RCDurationFormatter *)self _replaceComponentPlaceholderForType:2 withString:a3->var2 inLocalizedDataFormatTemplate:v9];
  [(RCDurationFormatter *)self _replaceComponentPlaceholderForType:3 withString:a3->var3 inLocalizedDataFormatTemplate:v9];
  BOOL v10 = (void *)[v9 copy];

  __destructor_8_s0_s8_s16_s24((uint64_t)a3);
  return v10;
}

- (void)_replaceComponentPlaceholderForType:(unint64_t)a3 withString:(id)a4 inLocalizedDataFormatTemplate:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (v7)
  {
    if (a3 - 1 > 2) {
      uint64_t v9 = &unk_1F1F0DAB0;
    }
    else {
      uint64_t v9 = (void *)qword_1E6496D80[a3 - 1];
    }
    [v9 sortedArrayUsingComparator:&__block_literal_global_23];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v8, "containsString:", v15, (void)v16))
          {
            objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", v15, v7, 0, 0, objc_msgSend(v8, "length"));
            goto LABEL_15;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
}

uint64_t __100__RCDurationFormatter__replaceComponentPlaceholderForType_withString_inLocalizedDataFormatTemplate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 length];
  if (v6 <= [v5 length])
  {
    unint64_t v8 = [v4 length];
    uint64_t v7 = v8 < [v5 length];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (RCDurationStrings)durationStringsFromDurationIntegers:(SEL)a3 hideComponentOptions:(RCDurationIntegers *)a4 style:(int64_t)a5 shouldPadMinute:(int64_t)a6
{
  char v8 = a5;
  p_defaultFormatter = (id *)&self->_defaultFormatter;
  defaultFormatter = self->_defaultFormatter;
  id v14 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4->var3];
  uint64_t v15 = [(NSNumberFormatter *)defaultFormatter stringFromNumber:v14];

  if (v8)
  {
    uint64_t v16 = _hiddenComponentStringWithString(v15);

    uint64_t v15 = (void *)v16;
  }
  id v17 = *p_defaultFormatter;
  long long v18 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4->var2];
  long long v19 = [v17 stringFromNumber:v18];

  if ((v8 & 2) != 0)
  {
    uint64_t v20 = _hiddenComponentStringWithString(v19);

    long long v19 = (void *)v20;
  }
  if (!a7 && (!a4->var0 || a4->var1 >= 0xA)) {
    p_defaultFormatter = (id *)&self->_nonPaddedHourMinuteFormatter;
  }
  id v21 = *p_defaultFormatter;
  v22 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4->var1];
  v23 = [v21 stringFromNumber:v22];

  if ((v8 & 4) != 0)
  {
    uint64_t v24 = _hiddenComponentStringWithString(v23);

    v23 = (void *)v24;
  }
  if ((unint64_t)a6 > 1) {
    nonPaddedHourMinuteFormatter = 0;
  }
  else {
    nonPaddedHourMinuteFormatter = self->_nonPaddedHourMinuteFormatter;
  }
  v26 = nonPaddedHourMinuteFormatter;
  v27 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4->var0];
  v28 = [(NSNumberFormatter *)v26 stringFromNumber:v27];

  if ((v8 & 8) != 0)
  {
    uint64_t v29 = _hiddenComponentStringWithString(v28);

    v28 = (void *)v29;
  }
  retstr->var0 = v28;
  retstr->var1 = v23;
  retstr->var2 = v19;
  retstr->var3 = v15;
  id v30 = v15;
  id v34 = v19;
  id v31 = v23;

  return result;
}

- (RCDurationIntegers)durationIntegersFromDuration:(SEL)a3 byReplacingDigitsWithDigit:(double)a4 style:(int64_t)a5
{
  unint64_t v7 = (unint64_t)a4;
  unint64_t v8 = (unint64_t)(a4 * 100.0) % 0x64;
  unint64_t v9 = (unint64_t)a4 / 0x3C;
  if (a6 != 4) {
    unint64_t v7 = 0;
  }
  if ((unint64_t)(a6 - 2) < 2) {
    unint64_t v7 = (unint64_t)a4 % 0x3C;
  }
  else {
    unint64_t v9 = 0;
  }
  if ((unint64_t)a6 >= 2) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = (unint64_t)a4 / 0xE10;
  }
  if ((unint64_t)a6 >= 2) {
    int64_t v11 = v9;
  }
  else {
    int64_t v11 = (unint64_t)a4 / 0x3C
  }
        - 60 * ((unint64_t)(((unint64_t)a4 / 0x3C * (unsigned __int128)0x888888888888889uLL) >> 64) >> 1);
  if ((unint64_t)a6 >= 2) {
    unint64_t v12 = v7;
  }
  else {
    unint64_t v12 = (unint64_t)a4 % 0x3C;
  }
  if ((a5 & 0x8000000000000000) == 0)
  {
    unint64_t v14 = [@"0" length];
    unint64_t v15 = RCNumberOfDigitsInInteger(v10);
    if (v14 <= v15) {
      unint64_t v16 = v15;
    }
    else {
      unint64_t v16 = v14;
    }
    unint64_t v10 = a5;
    unint64_t v17 = v16 - 1;
    if (v17)
    {
      uint64_t v18 = 10;
      unint64_t v10 = a5;
      do
      {
        v10 += v18 * a5;
        v18 *= 10;
        --v17;
      }
      while (v17);
    }
    unint64_t v19 = RCNumberOfDigitsInInteger(v11);
    uint64_t v20 = 2;
    if (v19 > 2) {
      uint64_t v20 = v19;
    }
    uint64_t v21 = v20 - 1;
    uint64_t v22 = 10;
    int64_t v11 = a5;
    do
    {
      v11 += v22 * a5;
      v22 *= 10;
      --v21;
    }
    while (v21);
    unint64_t v23 = RCNumberOfDigitsInInteger(v12);
    uint64_t v24 = 2;
    if (v23 > 2) {
      uint64_t v24 = v23;
    }
    uint64_t v25 = v24 - 1;
    uint64_t v26 = 10;
    unint64_t v12 = a5;
    do
    {
      v12 += v26 * a5;
      v26 *= 10;
      --v25;
    }
    while (v25);
    self = (RCDurationIntegers *)RCNumberOfDigitsInInteger(v8);
    uint64_t v27 = 2;
    if ((unint64_t)self > 2) {
      uint64_t v27 = (uint64_t)self;
    }
    uint64_t v28 = v27 - 1;
    uint64_t v29 = 10;
    unint64_t v8 = a5;
    do
    {
      v8 += v29 * a5;
      v29 *= 10;
      --v28;
    }
    while (v28);
  }
  retstr->var0 = v10;
  retstr->var1 = v11;
  retstr->var2 = v12;
  retstr->var3 = v8;
  return self;
}

uint64_t __51__RCDurationFormatter_reloadLocalizedFormatStrings__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onQueueReloadLocalizedFormatStrings];
}

uint64_t __38__RCDurationFormatter_sharedFormatter__block_invoke()
{
  sharedFormatter_sharedInstance = objc_alloc_init(RCDurationFormatter);
  return MEMORY[0x1F41817F8]();
}

void __55__RCDurationFormatter__dateTimeFormatTemplateForStyle___block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1F0D848;
  v2[1] = &unk_1F1F0D860;
  v3[0] = @"HHmmssSS";
  v3[1] = @"HHmmss";
  v2[2] = &unk_1F1F0D878;
  v2[3] = &unk_1F1F0D890;
  v3[2] = @"mmssSS";
  v3[3] = @"mmss";
  v2[4] = &unk_1F1F0D8A8;
  v3[4] = @"sSS";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:5];
  v1 = (void *)_dateTimeFormatTemplateForStyle__styleToDateTimeFormat;
  _dateTimeFormatTemplateForStyle__styleToDateTimeFormat = v0;
}

void __27__RCDurationFormatter_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadLocalizedFormatStrings];
}

- (id)stringFromDuration:(double)a3 replacingDigitsWithDigit:(unint64_t)a4 style:(int64_t)a5
{
  if (a4 >= 0xA)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"RCDurationFormatter.m", 79, @"Invalid replacement digit, must be a single digit" object file lineNumber description];
  }
  uint64_t v15 = 0;
  unint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__3;
  unint64_t v19 = __Block_byref_object_dispose__3;
  id v20 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__RCDurationFormatter_stringFromDuration_replacingDigitsWithDigit_style___block_invoke;
  block[3] = &unk_1E6496CD0;
  block[4] = self;
  void block[5] = &v15;
  *(double *)&block[6] = a3;
  block[7] = a4;
  block[8] = a5;
  dispatch_sync(queue, block);
  id v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v10;
}

uint64_t __73__RCDurationFormatter_stringFromDuration_replacingDigitsWithDigit_style___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _onQueueStringFromDuration:*(void *)(a1 + 56) byReplacingDigitsWithDigit:0 hideComponentOptions:*(void *)(a1 + 64) style:1 shouldPadMinute:*(double *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x1F41817F8](v2, v4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonPaddedHourMinuteFormatter, 0);
  objc_storeStrong((id *)&self->_defaultFormatter, 0);
  objc_storeStrong((id *)&self->_styleToLocalizedDateTimeFormatTemplate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end