@interface UIDatePickerCompactDateLabel
@end

@implementation UIDatePickerCompactDateLabel

void __47___UIDatePickerCompactDateLabel_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained activateLabel];
}

void __47___UIDatePickerCompactDateLabel_initWithFrame___block_invoke_2(uint64_t a1, void *a2)
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

void __47___UIDatePickerCompactDateLabel_initWithFrame___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHighlightedForTouch:1];
}

void __47___UIDatePickerCompactDateLabel_initWithFrame___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHighlightedForTouch:0];
}

void __46___UIDatePickerCompactDateLabel_activateLabel__block_invoke(uint64_t a1, char a2)
{
  v4 = [*(id *)(*(void *)(a1 + 32) + 440) compactLabelTextColorForEditingState:0];
  v5 = [*(id *)(a1 + 32) textLabel];
  [v5 setTextColor:v4];

  if ((a2 & 1) == 0 && !*(unsigned char *)(a1 + 40))
  {
    v6 = [*(id *)(a1 + 32) delegate];
    [v6 compactDateLabelDidEndEditing:*(void *)(a1 + 32)];
  }
  id v7 = [*(id *)(a1 + 32) backgroundView];
  [v7 setSelected:0];
}

@end