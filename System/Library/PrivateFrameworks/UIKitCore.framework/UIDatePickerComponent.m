@interface UIDatePickerComponent
@end

@implementation UIDatePickerComponent

void __100___UIDatePickerComponent_componentsFromDateFormatString_locale_followsSystemHourCycle_desiredUnits___block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (!_UICalendarUnitIsSupported(*a2)) {
    return;
  }
  if ((*(void *)(a1 + 64) & v4) == 0) {
    return;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void *)(v5 + 24);
  if ((v6 & v4) != 0) {
    return;
  }
  *(void *)(v5 + 24) = v6 | v4;
  id v7 = (id)a2[2];
  uint64_t v8 = a2[3];
  v9 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v7, v8);
  v10 = _UIDatePickerDateFormatFromTemplate(v9, *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 88));
  v11 = v10;
  uint64_t v12 = *a2;
  int v13 = *((unsigned __int16 *)a2 + 4);
  if (*a2 == 8)
  {
    int v14 = 76;
    goto LABEL_11;
  }
  if (v12 == 512)
  {
    int v14 = 99;
LABEL_11:
    if (v13 != v14)
    {
      if (v12 == 8)
      {
        v29 = v9;
        uint64_t v30 = v8;
        id v31 = v7;
        int v15 = 76;
      }
      else
      {
        v29 = v9;
        uint64_t v30 = v8;
        id v31 = v7;
        if (v12 == 512) {
          int v15 = 99;
        }
        else {
          int v15 = 113;
        }
      }
      id v16 = v10;
      size_t v17 = [v16 length];
      v18 = malloc_type_calloc(v17, 2uLL, 0x1000040BDFB0063uLL);
      if (v17)
      {
        uint64_t v19 = 0;
        char v20 = 0;
        do
        {
          int v21 = [v16 characterAtIndex:v19];
          if (v20 & 1 | (v21 != v15)) {
            __int16 v22 = v21;
          }
          else {
            __int16 v22 = v13;
          }
          if (v21 == 39)
          {
            v20 ^= 1u;
            __int16 v22 = 39;
          }
          v18[v19++] = v22;
        }
        while (v17 != v19);
      }
      v11 = [NSString stringWithCharacters:v18 length:v17];
      free(v18);

      uint64_t v8 = v30;
      id v7 = v31;
      v9 = v29;
    }
    goto LABEL_26;
  }
  if (v12 == 2048)
  {
    int v14 = 113;
    goto LABEL_11;
  }
LABEL_26:
  unint64_t v23 = [v11 length];
  if (v23 >= [v9 length]
    && [*(id *)(a1 + 32) rangeOfString:v11] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v24 = v11;

    v9 = v24;
  }
  _UIDateFormatStripOtherFormatCharacters(v9, *((unsigned __int16 *)a2 + 4));
  id v32 = (id)objc_claimAutoreleasedReturnValue();

  if ([v32 length])
  {
    id v25 = [[_UIDatePickerComponent alloc] _initWithFormatString:v32 calendarUnit:*a2];
    [*(id *)(a1 + 48) addObject:v25];
  }
  else
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v26 = *(void *)(a1 + 72);
    uint64_t v27 = *(void *)(a1 + 80);
    v28 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v7, v8);
    [v25 handleFailureInMethod:v26, v27, @"_UIDatePickerComponent.m", 207, @"Unable to handle '%@' from '%@'", v28, *(void *)(a1 + 32) object file lineNumber description];
  }
}

@end