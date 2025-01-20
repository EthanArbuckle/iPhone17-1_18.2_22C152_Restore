@interface _PKContinuousPickerView
- (void)pickerTableView:(id)a3 didChangeSelectionBarRowFrom:(int64_t)a4 to:(int64_t)a5;
@end

@implementation _PKContinuousPickerView

- (void)pickerTableView:(id)a3 didChangeSelectionBarRowFrom:(int64_t)a4 to:(int64_t)a5
{
  if ([(_PKContinuousPickerView *)self numberOfComponents] >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = [(_PKContinuousPickerView *)self selectedRowInComponent:v6];
      v8 = [(_PKContinuousPickerView *)self delegate];
      [v8 pickerView:self didSelectRow:v7 inComponent:v6];

      ++v6;
    }
    while (v6 < [(_PKContinuousPickerView *)self numberOfComponents]);
  }
}

@end