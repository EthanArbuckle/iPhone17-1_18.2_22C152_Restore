@interface TTRISmartListFilterEditorRelativeRangeTableCell
- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4;
- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
@end

@implementation TTRISmartListFilterEditorRelativeRangeTableCell

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 3;
}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  uint64_t v6 = qword_100797720;
  uint64_t v7 = *(void *)((char *)self + qword_100797720);
  unint64_t v8 = *(void *)(v7 + 16);
  id v9 = a3;
  v10 = self;
  if (v8 <= 2)
  {
    sub_1002DA300();
    uint64_t v7 = *(void *)((char *)self + v6);
  }
  if (a4 < 0)
  {
    __break(1u);
  }
  else if (*(void *)(v7 + 16) > (unint64_t)a4)
  {
    double v12 = *(double *)(v7 + 8 * a4 + 32);

    return v12;
  }
  __break(1u);
  return result;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return sub_1002DCA3C(a4);
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
    id v12 = sub_1002DB1AC(a5);
  }
  sub_1002DB2C0(a4, a5);
  NSString v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v12 setText:v19];

  return v12;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1002DCA80();
}

@end