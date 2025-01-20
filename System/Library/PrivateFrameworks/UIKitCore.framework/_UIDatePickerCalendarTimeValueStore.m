@interface _UIDatePickerCalendarTimeValueStore
- (BOOL)isPM;
- (BOOL)roundToMinuteInterval;
- (_UIDatePickerCalendarTimeFormat)timeFormat;
- (_UIDatePickerCalendarTimeValueStore)initWithTimeFormat:(id)a3;
- (_UIDatePickerCalendarTimeValueStore)initWithTimeFormat:(id)a3 minuteInterval:(int64_t)a4 decrementBehaviour:(int64_t)a5;
- (int64_t)decrementBehaviour;
- (int64_t)minuteInterval;
- (unint64_t)__integerInBufferWithRange:(_NSRange)a3;
- (unint64_t)digitsInScope:(int64_t)a3;
- (unint64_t)hourValue;
- (unint64_t)inputBuffer;
- (unint64_t)minuteValue;
- (void)__setIntegerInBuffer:(unint64_t)a3 range:(_NSRange)a4;
- (void)_removeLastDigitInRange:(_NSRange)a3;
- (void)_setDigits:(unint64_t)a3 count:(unint64_t)a4 inRange:(_NSRange)a5 append:(BOOL)a6;
- (void)_verifyInputWithScope:(int64_t)a3;
- (void)dealloc;
- (void)decrementDigitForScope:(int64_t)a3;
- (void)incrementDigitForScope:(int64_t)a3;
- (void)removeLastDigitInScope:(int64_t)a3;
- (void)setDecrementBehaviour:(int64_t)a3;
- (void)setDigits:(unint64_t)a3 count:(unint64_t)a4 inScope:(int64_t)a5 append:(BOOL)a6;
- (void)setHourValue:(unint64_t)a3;
- (void)setIsPM:(BOOL)a3;
- (void)setMinuteInterval:(int64_t)a3;
- (void)setMinuteValue:(unint64_t)a3;
@end

@implementation _UIDatePickerCalendarTimeValueStore

- (_UIDatePickerCalendarTimeValueStore)initWithTimeFormat:(id)a3
{
  return [(_UIDatePickerCalendarTimeValueStore *)self initWithTimeFormat:a3 minuteInterval:1 decrementBehaviour:0];
}

- (_UIDatePickerCalendarTimeValueStore)initWithTimeFormat:(id)a3 minuteInterval:(int64_t)a4 decrementBehaviour:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIDatePickerCalendarTimeValueStore;
  v10 = [(_UIDatePickerCalendarTimeValueStore *)&v13 init];
  if (v10)
  {
    v10->_inputBuffer = (unint64_t *)malloc_type_calloc(8uLL, 4uLL, 0x164AA4E6uLL);
    objc_storeStrong((id *)&v10->_timeFormat, a3);
    if (a4 <= 1) {
      int64_t v11 = 1;
    }
    else {
      int64_t v11 = a4;
    }
    v10->_minuteInterval = v11;
    v10->_decrementBehaviour = a5;
  }

  return v10;
}

- (void)dealloc
{
  free(self->_inputBuffer);
  self->_inputBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIDatePickerCalendarTimeValueStore;
  [(_UIDatePickerCalendarTimeValueStore *)&v3 dealloc];
}

- (void)setMinuteInterval:(int64_t)a3
{
  if (a3 <= 1) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = a3;
  }
  self->_minuteInterval = v3;
}

- (void)_verifyInputWithScope:(int64_t)a3
{
  unint64_t v5 = [(_UIDatePickerCalendarTimeValueStore *)self hourValue];
  unint64_t v6 = [(_UIDatePickerCalendarTimeValueStore *)self minuteValue];
  v7 = [(_UIDatePickerCalendarTimeValueStore *)self timeFormat];
  uint64_t v8 = [v7 clockLayout];

  if (!v8 && v5 > 0x18
    || ([(_UIDatePickerCalendarTimeValueStore *)self timeFormat],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 clockLayout],
        v9,
        v10)
    && v5 >= 0xD)
  {
    *[(_UIDatePickerCalendarTimeValueStore *)self inputBuffer] = 0;
  }
  if (v6 >= 0x3C && (a3 == 3 || v6 % 0xA >= 6)) {
    [(_UIDatePickerCalendarTimeValueStore *)self inputBuffer][16] = 0;
  }
}

- (void)__setIntegerInBuffer:(unint64_t)a3 range:(_NSRange)a4
{
  NSUInteger v4 = a4.location + a4.length;
  if (a4.location + a4.length > a4.location)
  {
    NSUInteger location = a4.location;
    do
    {
      unint64_t v7 = a3 / 0xA;
      *([(_UIDatePickerCalendarTimeValueStore *)self inputBuffer] + 8 * v4 - 8) = a3 % 0xA;
      a3 = v7;
      --v4;
    }
    while (v4 > location);
  }
}

- (unint64_t)__integerInBufferWithRange:(_NSRange)a3
{
  if (a3.location >= a3.location + a3.length) {
    return 0;
  }
  NSUInteger length = a3.length;
  unint64_t v5 = 0;
  NSUInteger v6 = 8 * a3.location;
  do
  {
    unint64_t v5 = [(_UIDatePickerCalendarTimeValueStore *)self inputBuffer][v6] + 10 * v5;
    v6 += 8;
    --length;
  }
  while (length);
  return v5;
}

- (void)_setDigits:(unint64_t)a3 count:(unint64_t)a4 inRange:(_NSRange)a5 append:(BOOL)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  unint64_t v8 = a3;
  if (a6)
  {
    unint64_t v10 = a4;
    if (a4)
    {
      unint64_t v11 = -[_UIDatePickerCalendarTimeValueStore __integerInBufferWithRange:](self, "__integerInBufferWithRange:", a5.location, a5.length);
    }
    else
    {
      unint64_t v12 = a3;
      do
      {
        ++v10;
        BOOL v13 = v12 > 9;
        v12 /= 0xAuLL;
      }
      while (v13);
      unint64_t v11 = -[_UIDatePickerCalendarTimeValueStore __integerInBufferWithRange:](self, "__integerInBufferWithRange:", a5.location, a5.length);
      if (!v10) {
        goto LABEL_8;
      }
    }
    do
    {
      v11 *= 10;
      --v10;
    }
    while (v10);
LABEL_8:
    v8 += v11;
  }
  -[_UIDatePickerCalendarTimeValueStore __setIntegerInBuffer:range:](self, "__setIntegerInBuffer:range:", v8, location, length);
}

- (void)_removeLastDigitInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v6 = -[_UIDatePickerCalendarTimeValueStore __integerInBufferWithRange:](self, "__integerInBufferWithRange:") / 0xA;
  -[_UIDatePickerCalendarTimeValueStore __setIntegerInBuffer:range:](self, "__setIntegerInBuffer:range:", v6, location, length);
}

- (void)setDigits:(unint64_t)a3 count:(unint64_t)a4 inScope:(int64_t)a5 append:(BOOL)a6
{
  BOOL v6 = a6;
  int64_t v9 = a5 - 2;
  if ((unint64_t)(a5 - 2) > 2)
  {
    uint64_t v10 = 0;
    uint64_t v11 = 4;
  }
  else
  {
    uint64_t v10 = qword_186B9E500[v9];
    uint64_t v11 = qword_186B9E518[v9];
  }
  -[_UIDatePickerCalendarTimeValueStore _setDigits:count:inRange:append:](self, "_setDigits:count:inRange:append:", a3, a4, v10, v11, v6);
  [(_UIDatePickerCalendarTimeValueStore *)self _verifyInputWithScope:a5];
}

- (unint64_t)digitsInScope:(int64_t)a3
{
  int64_t v3 = a3 - 2;
  if ((unint64_t)(a3 - 2) > 2)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 4;
  }
  else
  {
    uint64_t v4 = qword_186B9E500[v3];
    uint64_t v5 = qword_186B9E518[v3];
  }
  return -[_UIDatePickerCalendarTimeValueStore __integerInBufferWithRange:](self, "__integerInBufferWithRange:", v4, v5);
}

- (void)removeLastDigitInScope:(int64_t)a3
{
  int64_t v3 = a3 - 2;
  if ((unint64_t)(a3 - 2) > 2)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 4;
  }
  else
  {
    uint64_t v4 = qword_186B9E500[v3];
    uint64_t v5 = qword_186B9E518[v3];
  }
  -[_UIDatePickerCalendarTimeValueStore _removeLastDigitInRange:](self, "_removeLastDigitInRange:", v4, v5);
}

- (unint64_t)hourValue
{
  return -[_UIDatePickerCalendarTimeValueStore __integerInBufferWithRange:](self, "__integerInBufferWithRange:", 0, 2);
}

- (void)setHourValue:(unint64_t)a3
{
}

- (unint64_t)minuteValue
{
  return -[_UIDatePickerCalendarTimeValueStore __integerInBufferWithRange:](self, "__integerInBufferWithRange:", 2, 2);
}

- (void)setMinuteValue:(unint64_t)a3
{
}

- (BOOL)roundToMinuteInterval
{
  uint64_t v3 = [(_UIDatePickerCalendarTimeValueStore *)self minuteValue];
  double v4 = (double)[(_UIDatePickerCalendarTimeValueStore *)self minuteInterval];
  double v5 = floor((double)v3 / v4) * v4;
  uint64_t v6 = (uint64_t)v5;
  if (v3 != (uint64_t)v5) {
    [(_UIDatePickerCalendarTimeValueStore *)self setMinuteValue:(uint64_t)v5];
  }
  return v3 != v6;
}

- (void)incrementDigitForScope:(int64_t)a3
{
  switch(a3)
  {
    case 4:
      uint64_t v8 = [(_UIDatePickerCalendarTimeValueStore *)self isPM] ^ 1;
      [(_UIDatePickerCalendarTimeValueStore *)self setIsPM:v8];
      break;
    case 3:
      unint64_t v9 = [(_UIDatePickerCalendarTimeValueStore *)self minuteValue];
      int64_t minuteInterval = self->_minuteInterval;
      uint64_t v11 = 59;
      if ((uint64_t)(minuteInterval + v9) < 0 == __OFADD__(minuteInterval, v9)) {
        uint64_t v11 = minuteInterval + v9;
      }
      if ((uint64_t)(minuteInterval + v9) <= 59) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = 0;
      }
      uint64_t v13 = (uint64_t)(floor((double)v12 / (double)minuteInterval) * (double)minuteInterval);
      [(_UIDatePickerCalendarTimeValueStore *)self setMinuteValue:v13];
      break;
    case 2:
      int64_t v4 = [(_UIDatePickerCalendarTimeValueStore *)self hourValue];
      id v14 = [(_UIDatePickerCalendarTimeValueStore *)self timeFormat];
      uint64_t v5 = [v14 clock];
      if (v4 >= qword_186B9E550[v5]) {
        uint64_t v6 = v4 + 1;
      }
      else {
        uint64_t v6 = qword_186B9E5B0[v5];
      }
      if (v4 <= qword_186B9E530[v5]) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = qword_186B9E5D0[v5];
      }
      [(_UIDatePickerCalendarTimeValueStore *)self setHourValue:(uint64_t)(double)v7];

      break;
  }
}

- (void)decrementDigitForScope:(int64_t)a3
{
  switch(a3)
  {
    case 4:
      uint64_t v8 = [(_UIDatePickerCalendarTimeValueStore *)self isPM] ^ 1;
      [(_UIDatePickerCalendarTimeValueStore *)self setIsPM:v8];
      break;
    case 3:
      uint64_t v9 = [(_UIDatePickerCalendarTimeValueStore *)self minuteValue];
      int64_t minuteInterval = self->_minuteInterval;
      if (v9 % minuteInterval) {
        BOOL v11 = self->_decrementBehaviour == 0;
      }
      else {
        BOOL v11 = 0;
      }
      if (v11) {
        int64_t v12 = 0;
      }
      else {
        int64_t v12 = self->_minuteInterval;
      }
      BOOL v13 = __OFSUB__(v9, v12);
      uint64_t v14 = v9 - v12;
      uint64_t v15 = 59;
      if (v14 < 0 == v13) {
        uint64_t v15 = v14;
      }
      if (v14 <= 59) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
      uint64_t v17 = (uint64_t)(floor((double)v16 / (double)minuteInterval) * (double)minuteInterval);
      [(_UIDatePickerCalendarTimeValueStore *)self setMinuteValue:v17];
      break;
    case 2:
      int64_t v4 = [(_UIDatePickerCalendarTimeValueStore *)self hourValue];
      id v18 = [(_UIDatePickerCalendarTimeValueStore *)self timeFormat];
      uint64_t v5 = [v18 clock];
      if (v4 >= qword_186B9E590[v5]) {
        uint64_t v6 = v4 - 1;
      }
      else {
        uint64_t v6 = qword_186B9E5B0[v5];
      }
      if (v4 <= qword_186B9E570[v5]) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = qword_186B9E5D0[v5];
      }
      [(_UIDatePickerCalendarTimeValueStore *)self setHourValue:(uint64_t)(double)v7];

      break;
  }
}

- (BOOL)isPM
{
  return self->_isPM;
}

- (void)setIsPM:(BOOL)a3
{
  self->_isPM = a3;
}

- (int64_t)minuteInterval
{
  return self->_minuteInterval;
}

- (int64_t)decrementBehaviour
{
  return self->_decrementBehaviour;
}

- (void)setDecrementBehaviour:(int64_t)a3
{
  self->_decrementBehaviour = a3;
}

- (unint64_t)inputBuffer
{
  return self->_inputBuffer;
}

- (_UIDatePickerCalendarTimeFormat)timeFormat
{
  return self->_timeFormat;
}

- (void).cxx_destruct
{
}

@end