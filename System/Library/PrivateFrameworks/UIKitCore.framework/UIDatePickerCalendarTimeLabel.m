@interface UIDatePickerCalendarTimeLabel
@end

@implementation UIDatePickerCalendarTimeLabel

void __68___UIDatePickerCalendarTimeLabel_initWithTimeFormat_minuteInterval___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained stateMachineUpdateFromState:a2 toState:a3];
}

void __59___UIDatePickerCalendarTimeLabel_attributedTextWithRanges___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  v15[1] = *MEMORY[0x1E4F143B8];
  BOOL v7 = a4 != 0;
  if (a2 && a4)
  {
    uint64_t v8 = a2 - 1;
    do
    {
      [*(id *)(a1 + 32) rangeOfComposedCharacterSequenceAtIndex:a3 - 1 + v4];
      v4 -= v9;
      BOOL v7 = v4 != 0;
      BOOL v10 = v8-- != 0;
    }
    while (v10 && v4);
  }
  if (v7)
  {
    v11 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)off_1E52D2048;
    v12 = +[UIColor clearColor];
    v15[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    objc_msgSend(v11, "setAttributes:range:", v13, a3, v4);
  }
}

void __59___UIDatePickerCalendarTimeLabel_attributedTextWithRanges___block_invoke_2(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)a1[4];
  uint64_t v14 = *(void *)off_1E52D2048;
  uint64_t v28 = *(void *)off_1E52D2048;
  v29[0] = v9;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
  objc_msgSend(v13, "setAttributes:range:", v15, a1[5], a1[6]);

  if (v10)
  {
    v16 = (void *)a1[4];
    uint64_t v26 = v14;
    id v27 = v10;
    v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    objc_msgSend(v16, "setAttributes:range:", v17, a1[7], a1[8]);
  }
  if (v11)
  {
    v18 = (void *)a1[4];
    uint64_t v24 = v14;
    id v25 = v11;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    objc_msgSend(v18, "setAttributes:range:", v19, a1[9], a1[10]);
  }
  if (v12 && a1[12])
  {
    v20 = (void *)a1[4];
    uint64_t v22 = v14;
    id v23 = v12;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    objc_msgSend(v20, "setAttributes:range:", v21, a1[11], a1[12]);
  }
}

@end