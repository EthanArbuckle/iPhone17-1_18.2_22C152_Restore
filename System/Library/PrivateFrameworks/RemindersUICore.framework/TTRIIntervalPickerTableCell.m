@interface TTRIIntervalPickerTableCell
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
@end

@implementation TTRIIntervalPickerTableCell

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return *(void *)(*(void *)((char *)self + qword_1E9F04FA8) + 16);
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  if ((a4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = *(void *)((char *)self + qword_1E9F04FA0);
    if (*(void *)(v5 + 16) > (unint64_t)a4 && (*(unsigned char *)(v5 + a4 + 32) & 1) != 0) {
      return 5;
    }
  }
  id v7 = a3;
  v8 = self;
  sub_1B96EE394();

  return 200;
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  if (a6 && (self, (uint64_t v11 = swift_dynamicCastObjCClass()) != 0))
  {
    id v12 = (id)v11;
    id v13 = a6;
    id v14 = a3;
    v15 = self;
  }
  else
  {
    id v16 = a6;
    id v17 = a3;
    v18 = self;
    id v12 = sub_1B96EE680(a5);
  }
  sub_1B96EE824(a4, a5);
  v19 = (void *)sub_1B996E9B0();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_setText_, v19);

  return v12;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6 = a3;
  id v7 = self;
  sub_1B96EF444();
}

@end