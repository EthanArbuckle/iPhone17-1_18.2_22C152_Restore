@interface _UIDatePickerMode_Custom
- (_UIDatePickerMode_Custom)initWithFormatString:(id)a3 datePickerView:(id)a4;
- (double)widthForCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5;
- (id)_componentForCalendarUnit:(unint64_t)a3;
- (id)components;
- (id)dateForRow:(int64_t)a3 inCalendarUnit:(unint64_t)a4;
- (id)dateFormatForCalendarUnit:(unint64_t)a3;
- (int64_t)componentForCalendarUnit:(unint64_t)a3;
- (int64_t)displayedCalendarUnits;
- (int64_t)numberOfRowsInComponent:(int64_t)a3;
- (int64_t)titleAlignmentForCalendarUnit:(unint64_t)a3;
- (int64_t)valueForRow:(int64_t)a3 inCalendarUnit:(unint64_t)a4;
- (unint64_t)calendarUnitForComponent:(int64_t)a3;
- (unint64_t)extractableCalendarUnits;
- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3;
- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3;
- (unint64_t)numberOfComponents;
- (void)noteCalendarChanged;
- (void)resetComponentWidths;
@end

@implementation _UIDatePickerMode_Custom

- (_UIDatePickerMode_Custom)initWithFormatString:(id)a3 datePickerView:(id)a4
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIDatePickerMode_Custom;
  v6 = [(_UIDatePickerMode *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    originalFormat = v6->_originalFormat;
    v6->_originalFormat = (NSString *)v7;
  }
  return v6;
}

- (void)noteCalendarChanged
{
  components = self->_components;
  self->_components = 0;

  v4.receiver = self;
  v4.super_class = (Class)_UIDatePickerMode_Custom;
  [(_UIDatePickerMode *)&v4 noteCalendarChanged];
}

- (void)resetComponentWidths
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(_UIDatePickerMode_Custom *)self components];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) setWidth:0.0];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)components
{
  components = self->_components;
  if (!components)
  {
    originalFormat = self->_originalFormat;
    uint64_t v5 = [(_UIDatePickerMode *)self locale];
    uint64_t v6 = +[_UIDatePickerComponent componentsFromDateFormatString:originalFormat locale:v5 followsSystemHourCycle:[(_UIDatePickerMode *)self followsSystemHourCycle]];
    long long v7 = self->_components;
    self->_components = v6;

    long long v8 = [(_UIDatePickerMode *)self calendar];
    if ([(NSArray *)self->_components count])
    {
      uint64_t v9 = 0;
      unint64_t v10 = 0;
      uint64_t v22 = *MEMORY[0x1E4F1C3C8];
      do
      {
        v11 = [(NSArray *)self->_components objectAtIndex:v10];
        uint64_t v12 = [v11 equivalentUnit];
        if ((v12 & v9) != 0)
        {
          v13 = [v11 formatString];
          if (v10)
          {
            uint64_t v14 = 0;
            while (1)
            {
              v15 = [(NSArray *)self->_components objectAtIndex:v14];
              if (v12 == [v15 equivalentUnit]) {
                break;
              }

              if (v10 == ++v14) {
                goto LABEL_9;
              }
            }
            v16 = [v15 formatString];
          }
          else
          {
LABEL_9:
            v16 = 0;
          }
          [MEMORY[0x1E4F1CA00] raise:v22, @"Conflicting date formats: %@ and %@", v16, v13 format];
        }
        v9 |= v12;
        uint64_t v17 = objc_msgSend(v8, "maximumRangeOfUnit:", objc_msgSend(v11, "calendarUnit"));
        objc_msgSend(v11, "setUnitRange:", v17, v18);

        ++v10;
      }
      while (v10 < [(NSArray *)self->_components count]);
    }
    v19 = [(NSArray *)self->_components sortedArrayUsingComparator:&__block_literal_global_431];
    sortedComponents = self->_sortedComponents;
    self->_sortedComponents = v19;

    components = self->_components;
  }
  return components;
}

- (unint64_t)calendarUnitForComponent:(int64_t)a3
{
  uint64_t v4 = [(_UIDatePickerMode_Custom *)self components];
  uint64_t v5 = [v4 objectAtIndex:a3];
  unint64_t v6 = [v5 calendarUnit];

  return v6;
}

- (int64_t)componentForCalendarUnit:(unint64_t)a3
{
  uint64_t v4 = [(_UIDatePickerMode_Custom *)self components];
  uint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = v5;
    int64_t v7 = 0;
    while (1)
    {
      long long v8 = [v4 objectAtIndex:v7];
      uint64_t v9 = [v8 calendarUnit];

      if (v9 == a3) {
        break;
      }
      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)_componentForCalendarUnit:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(_UIDatePickerMode_Custom *)self components];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "calendarUnit", (void)v12) == a3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (unint64_t)extractableCalendarUnits
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(_UIDatePickerMode_Custom *)self components];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) calendarUnit];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return (v5 >> 1) & 2 | v5;
}

- (int64_t)displayedCalendarUnits
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(_UIDatePickerMode_Custom *)self components];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= [*(id *)(*((void *)&v9 + 1) + 8 * i) calendarUnit];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (unint64_t)numberOfComponents
{
  v2 = [(_UIDatePickerMode_Custom *)self components];
  unint64_t v3 = [v2 count];

  return v3;
}

- (int64_t)numberOfRowsInComponent:(int64_t)a3
{
  uint64_t v4 = [(_UIDatePickerMode_Custom *)self components];
  int64_t v5 = [v4 objectAtIndex:a3];

  if ([v5 calendarUnit] == 0x10000) {
    int64_t v6 = 2;
  }
  else {
    int64_t v6 = 10000;
  }

  return v6;
}

- (id)dateFormatForCalendarUnit:(unint64_t)a3
{
  unint64_t v3 = [(_UIDatePickerMode_Custom *)self _componentForCalendarUnit:a3];
  uint64_t v4 = [v3 formatString];

  return v4;
}

- (int64_t)titleAlignmentForCalendarUnit:(unint64_t)a3
{
  return 1;
}

- (double)widthForCalendarUnit:(unint64_t)a3 font:(id)a4 maxWidth:(double)a5
{
  unint64_t v6 = a3;
  v52[1] = *MEMORY[0x1E4F143B8];
  long long v8 = [(_UIDatePickerMode_Custom *)self components];
  long long v9 = [v8 lastObject];
  [v9 width];
  double v11 = v10;

  if (v11 == 0.0)
  {
    unint64_t v43 = v6;
    unint64_t v44 = [(_UIDatePickerMode_Custom *)self numberOfComponents];
    if (v44)
    {
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)off_1E52D2040;
      double v14 = 0.0;
      do
      {
        long long v15 = [(_UIDatePickerMode_Custom *)self components];
        v16 = [v15 objectAtIndex:v12];

        v45 = v16;
        uint64_t v17 = [v16 unitRange];
        uint64_t v19 = v17 + v18;
        if ((uint64_t)(v17 + v18) >= 9000) {
          uint64_t v19 = 9000;
        }
        if (v18 >= 0xC) {
          uint64_t v20 = 12;
        }
        else {
          uint64_t v20 = v18;
        }
        double v21 = 0.0;
        if (v20)
        {
          uint64_t v22 = 0;
          uint64_t v23 = (uint64_t)(double)(v19 / v20);
          do
          {
            v24 = [(_UIDatePickerMode *)self titleForRow:v22 inComponent:v12];
            uint64_t v51 = v13;
            v25 = [(_UIDatePickerMode *)self font];
            v52[0] = v25;
            v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
            [v24 sizeWithAttributes:v26];
            double v28 = v27;

            if (v21 < v28) {
              double v21 = v28;
            }

            v22 += v23;
            --v20;
          }
          while (v20);
        }
        [v45 setWidth:v21];
        double v14 = v14 + v21;

        ++v12;
      }
      while (v12 != v44);
    }
    else
    {
      double v14 = 0.0;
    }
    unint64_t v6 = v43;
    if (v14 > a5)
    {
      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      v29 = [(_UIDatePickerMode_Custom *)self components];
      uint64_t v30 = [v29 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v47;
        double v33 = a5 / v14;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v47 != v32) {
              objc_enumerationMutation(v29);
            }
            v35 = *(void **)(*((void *)&v46 + 1) + 8 * i);
            [v35 width];
            [v35 setWidth:floor(v33 * v36)];
          }
          uint64_t v31 = [v29 countByEnumeratingWithState:&v46 objects:v50 count:16];
        }
        while (v31);
      }
    }
  }
  int64_t v37 = [(_UIDatePickerMode_Custom *)self componentForCalendarUnit:v6];
  v38 = [(_UIDatePickerMode_Custom *)self components];
  v39 = [v38 objectAtIndex:v37];

  [v39 width];
  double v41 = v40;

  return v41;
}

- (id)dateForRow:(int64_t)a3 inCalendarUnit:(unint64_t)a4
{
  uint64_t v7 = [(_UIDatePickerMode_Custom *)self _componentForCalendarUnit:a4];
  if ([v7 equivalentUnit] == 4)
  {
    long long v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIDatePickerMode_Custom;
    long long v8 = [(_UIDatePickerMode *)&v10 dateForRow:a3 inCalendarUnit:a4];
  }

  return v8;
}

- (int64_t)valueForRow:(int64_t)a3 inCalendarUnit:(unint64_t)a4
{
  if (a4 != 0x10000)
  {
    int64_t v5 = [(_UIDatePickerMode_Custom *)self _componentForCalendarUnit:a4];
    unint64_t v6 = v5;
    if (v5 && [v5 equivalentUnit] != 4)
    {
      uint64_t v7 = [v6 unitRange];
      a3 = a3 % v8 + v7;
    }
    else
    {
      a3 = 0;
    }
  }
  return a3;
}

- (unint64_t)nextUnitLargerThanUnit:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)nextUnitSmallerThanUnit:(unint64_t)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedComponents, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_originalFormat, 0);
}

@end