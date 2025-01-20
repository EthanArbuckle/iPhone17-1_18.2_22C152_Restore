@interface UIDatePickerCompactTimeLabel
@end

@implementation UIDatePickerCompactTimeLabel

void __67___UIDatePickerCompactTimeLabel_initWithTimeFormat_minuteInterval___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 traitCollection];
  +[UIDatePicker _styleForIdiom:](UIDatePicker, "_styleForIdiom:", [v3 userInterfaceIdiom]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  v4 = [v2 configuration];
  v5 = objc_msgSend(v7, "compactLabelBackgroundColorForEnabledState:", objc_msgSend(v2, "isEnabled"));
  v6 = [v4 background];
  [v6 setBackgroundColor:v5];

  [v2 setConfiguration:v4];
}

uint64_t __58___UIDatePickerCompactTimeLabel__updateTimeFormatIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTimeFormat:*(void *)(a1 + 40)];
}

void __58___UIDatePickerCompactTimeLabel__updateTimeFormatIfNeeded__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 544) &= ~2u;
  [*(id *)(a1 + 32) pushCurrentStateIntoUI];
  id v2 = [*(id *)(a1 + 32) pointerInteraction];
  [v2 invalidate];
}

void __71___UIDatePickerCompactTimeLabel__updateInputFieldLayoutForCurrentState__block_invoke(uint64_t a1)
{
  CGRect v8 = CGRectInset(*(CGRect *)(a1 + 40), -1.0, -1.0);
  double x = v8.origin.x;
  double y = v8.origin.y;
  double width = v8.size.width;
  double height = v8.size.height;
  id v6 = [*(id *)(a1 + 32) inputBackgroundView];
  objc_msgSend(v6, "setFrame:", x, y, width, height);
}

double __61___UIDatePickerCompactTimeLabel__updateLayoutRectsForRanges___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFFFFFFFFFFLL) {
    return *MEMORY[0x1E4F1DB28];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 656), "boundingRectForCharacterRange:", a2, a3);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = *(void **)(a1 + 32);
  v14 = [v13 label];
  objc_msgSend(v13, "convertRect:fromView:", v14, v6, v8, v10, v12);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [*(id *)(a1 + 32) traitCollection];
  [v23 displayScale];
  double v3 = UIRectIntegralWithScale(v16, v18, v20, v22, v24);

  return v3;
}

void __61___UIDatePickerCompactTimeLabel__updateLayoutRectsForRanges___block_invoke_2(uint64_t a1)
{
  id v2 = *(double **)(a1 + 32);
  double v3 = v2[69];
  double v4 = v2[70];
  double v5 = v2[71];
  double v6 = v2[72];
  double v7 = [v2 hourLabel];
  objc_msgSend(v7, "setFrame:", v3, v4, v5, v6);

  double v8 = *(double **)(a1 + 32);
  double v9 = v8[73];
  double v10 = v8[74];
  double v11 = v8[75];
  double v12 = v8[76];
  v13 = [v8 minuteLabel];
  objc_msgSend(v13, "setFrame:", v9, v10, v11, v12);

  v14 = *(double **)(a1 + 32);
  double v15 = v14[77];
  double v16 = v14[78];
  double v17 = v14[79];
  double v18 = v14[80];
  id v19 = [v14 timeOfDayLabel];
  objc_msgSend(v19, "setFrame:", v15, v16, v17, v18);
}

void __75___UIDatePickerCompactTimeLabel__activateCompactLabelForGestureRecognizer___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isFirstResponder]) {
    [*(id *)(a1 + 32) resignFirstResponder];
  }
  id v2 = [*(id *)(a1 + 32) backgroundView];
  [v2 setSelected:0];
}

uint64_t __46___UIDatePickerCompactTimeLabel_activateLabel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endEditingWheels];
}

void __46___UIDatePickerCompactTimeLabel_activateLabel__block_invoke_2(uint64_t a1, void *a2)
{
  double v3 = [a2 sender];
  id v4 = [v3 date];

  [*(id *)(a1 + 32) _reloadWithDate:v4 notify:1];
  [*(id *)(a1 + 32) wheelChanged];
}

void __46___UIDatePickerCompactTimeLabel_activateLabel__block_invoke_3(uint64_t a1, char a2)
{
  [*(id *)(a1 + 32) endEditingWheels];
  if ((a2 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) selectionDelegate];
    [v4 compactTimeLabelDidEndEditing:*(void *)(a1 + 32)];
  }
  id v5 = [*(id *)(a1 + 32) backgroundView];
  [v5 setSelected:0];
}

@end