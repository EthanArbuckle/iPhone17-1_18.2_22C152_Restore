@interface UIDatePickerMode
@end

@implementation UIDatePickerMode

double __31___UIDatePickerMode_initialize__block_invoke()
{
  v0 = malloc_type_malloc(0x60uLL, 0x1000040565EDBD2uLL);
  _UIDateComponentsUnitOrder = (uint64_t)v0;
  _OWORD *v0 = xmmword_186B9B6D0;
  v0[1] = xmmword_186B9B6E0;
  v0[2] = xmmword_186B9B6F0;
  v0[3] = xmmword_186B9B700;
  *(void *)&double result = 2048;
  v0[4] = xmmword_186B9B710;
  v0[5] = xmmword_186B9B720;
  return result;
}

uint64_t __38___UIDatePickerMode_Custom_components__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 equivalentUnit];
  uint64_t v7 = [v5 equivalentUnit];
  uint64_t v8 = *(void *)_UIDateComponentsUnitOrder;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (*(void *)_UIDateComponentsUnitOrder == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_2;
  }
  uint64_t v11 = 0;
  do
  {
    if (v10 == 0x7FFFFFFFFFFFFFFFLL && v8 == v6) {
      uint64_t v10 = v11;
    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL && v8 == v7) {
      uint64_t v9 = v11;
    }
    BOOL v14 = v10 == 0x7FFFFFFFFFFFFFFFLL;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      BOOL v14 = 0;
      goto LABEL_21;
    }
    uint64_t v8 = *(void *)(_UIDateComponentsUnitOrder + 8 + 8 * v11++);
  }
  while (v8 != 0x7FFFFFFFFFFFFFFFLL);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_2;
  }
LABEL_21:
  if (v14) {
LABEL_2:
  }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"unable to sort units: (%lu => %lu) and (%lu => %lu)", objc_msgSend(v4, "calendarUnit"), v6, objc_msgSend(v5, "calendarUnit"), v7);
  if (v10 < v9) {
    uint64_t v16 = -1;
  }
  else {
    uint64_t v16 = v10 > v9;
  }

  return v16;
}

@end