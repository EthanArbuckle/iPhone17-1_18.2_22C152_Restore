@interface _UIDatePickerComponent
+ (id)componentsFromDateFormatString:(id)a3 locale:(id)a4 followsSystemHourCycle:(BOOL)a5;
+ (id)componentsFromDateFormatString:(id)a3 locale:(id)a4 followsSystemHourCycle:(BOOL)a5 desiredUnits:(int64_t)a6;
- (NSString)formatString;
- (_NSRange)unitRange;
- (double)width;
- (id)_initWithFormatString:(id)a3 calendarUnit:(unint64_t)a4;
- (id)description;
- (unint64_t)calendarUnit;
- (unint64_t)equivalentUnit;
- (void)setUnitRange:(_NSRange)a3;
- (void)setWidth:(double)a3;
@end

@implementation _UIDatePickerComponent

+ (id)componentsFromDateFormatString:(id)a3 locale:(id)a4 followsSystemHourCycle:(BOOL)a5
{
  return (id)[a1 componentsFromDateFormatString:a3 locale:a4 followsSystemHourCycle:a5 desiredUnits:0x7FFFFFFFFFFFFFFFLL];
}

+ (id)componentsFromDateFormatString:(id)a3 locale:(id)a4 followsSystemHourCycle:(BOOL)a5 desiredUnits:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v13 = [MEMORY[0x1E4F1CA48] array];
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v45[3] = 0;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v35 = __100___UIDatePickerComponent_componentsFromDateFormatString_locale_followsSystemHourCycle_desiredUnits___block_invoke;
  v36 = &unk_1E5300FC8;
  v40 = v45;
  int64_t v41 = a6;
  id v14 = v11;
  id v37 = v14;
  id v33 = v12;
  id v38 = v33;
  BOOL v44 = a5;
  id v32 = v13;
  id v39 = v32;
  SEL v42 = a2;
  id v43 = a1;
  id v15 = v14;
  v16 = v34;
  uint64_t v17 = [v15 length];
  if (!v17) {
    goto LABEL_21;
  }
  v31 = v16;
  uint64_t v18 = 0;
  char v19 = 0;
  unsigned __int16 v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  unint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    int v24 = [v15 characterAtIndex:v18];
    unsigned __int16 v25 = v24;
    if (v24 == 39)
    {
      v19 ^= 1u;
      goto LABEL_18;
    }
    if (v19)
    {
      char v19 = 1;
      goto LABEL_18;
    }
    if (v24 == 46)
    {
      if (v23 <= 0x10 && ((1 << v23) & 0x10110) != 0 || v23 == 0x4000)
      {
LABEL_11:
        char v19 = 0;
        ++v22;
        goto LABEL_18;
      }
    }
    else if ((v24 & 0xFFFE) == 0x28)
    {
      goto LABEL_11;
    }
    uint64_t v26 = _UICalendarUnitForFormatCharacter(v24);
    if (v26 == v23)
    {
      char v19 = 0;
      ++v22;
      unsigned __int16 v20 = v25;
    }
    else
    {
      unint64_t v27 = v26;
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v46 = v23;
        uint64_t v47 = v20;
        uint64_t v48 = v21;
        uint64_t v49 = v22;
        v35((uint64_t)v31, (uint64_t *)&v46);
      }
      char v19 = 0;
      uint64_t v22 = 1;
      uint64_t v21 = v18;
      unsigned __int16 v20 = v25;
      unint64_t v23 = v27;
    }
LABEL_18:
    ++v18;
  }
  while (v17 != v18);
  v16 = v31;
  if (v23 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v46 = v23;
    uint64_t v47 = v20;
    uint64_t v48 = v21;
    uint64_t v49 = v22;
    v35((uint64_t)v31, (uint64_t *)&v46);
  }
LABEL_21:

  v28 = v39;
  id v29 = v32;

  _Block_object_dispose(v45, 8);
  return v29;
}

- (id)_initWithFormatString:(id)a3 calendarUnit:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIDatePickerComponent;
  v8 = [(_UIDatePickerComponent *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_formatString, a3);
    v9->_calendarUnit = a4;
    v9->_equivalentUnit = _UIDateComponentsEquivalentUnit(a4);
    v9->_width = 0.0;
    v10 = v9;
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)_UIDatePickerComponent;
  v4 = [(_UIDatePickerComponent *)&v11 description];
  formatString = self->_formatString;
  int64_t calendarUnit = self->_calendarUnit;
  if (calendarUnit <= 511)
  {
    if (calendarUnit <= 15)
    {
      switch(calendarUnit)
      {
        case 2:
          id v7 = @"Era";
          goto LABEL_40;
        case 4:
          id v7 = @"Year";
          goto LABEL_40;
        case 8:
          id v7 = @"Month";
          goto LABEL_40;
      }
    }
    else if (calendarUnit > 63)
    {
      if (calendarUnit == 64)
      {
        id v7 = @"Minute";
        goto LABEL_40;
      }
      if (calendarUnit == 128)
      {
        id v7 = @"Second";
        goto LABEL_40;
      }
    }
    else
    {
      if (calendarUnit == 16)
      {
        id v7 = @"Day";
        goto LABEL_40;
      }
      if (calendarUnit == 32)
      {
        id v7 = @"Hour";
        goto LABEL_40;
      }
    }
  }
  else if (calendarUnit >= 0x2000)
  {
    if (calendarUnit >= 0x100000)
    {
      if (calendarUnit == 0x100000)
      {
        id v7 = @"Calendar";
        goto LABEL_40;
      }
      if (calendarUnit == 0x200000)
      {
        id v7 = @"TimeZone";
        goto LABEL_40;
      }
    }
    else
    {
      if (calendarUnit == 0x2000)
      {
        id v7 = @"Week of Year";
        goto LABEL_40;
      }
      if (calendarUnit == 0x4000)
      {
        id v7 = @"Year for Week of Year";
        goto LABEL_40;
      }
    }
  }
  else if (calendarUnit > 2047)
  {
    if (calendarUnit == 2048)
    {
      id v7 = @"Quarter";
      goto LABEL_40;
    }
    if (calendarUnit == 4096)
    {
      id v7 = @"Week of Month";
      goto LABEL_40;
    }
  }
  else
  {
    if (calendarUnit == 512)
    {
      id v7 = @"Weekday";
      goto LABEL_40;
    }
    if (calendarUnit == 1024)
    {
      id v7 = @"Weekday°";
      goto LABEL_40;
    }
  }
  if (calendarUnit == 0x10000) {
    id v7 = @"AM/PM";
  }
  else {
    id v7 = &stru_1ED0E84C0;
  }
LABEL_40:
  v8 = v7;
  v9 = [v3 stringWithFormat:@"%@ (%@ => %@)", v4, formatString, v8];

  return v9;
}

- (unint64_t)equivalentUnit
{
  return self->_equivalentUnit;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (unint64_t)calendarUnit
{
  return self->_calendarUnit;
}

- (_NSRange)unitRange
{
  NSUInteger length = self->_unitRange.length;
  NSUInteger location = self->_unitRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setUnitRange:(_NSRange)a3
{
  self->_unitRange = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (void).cxx_destruct
{
}

@end