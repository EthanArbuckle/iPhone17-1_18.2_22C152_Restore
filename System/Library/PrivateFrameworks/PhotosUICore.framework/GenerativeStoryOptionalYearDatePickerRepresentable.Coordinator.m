@interface GenerativeStoryOptionalYearDatePickerRepresentable.Coordinator
- (_TtCV12PhotosUICore50GenerativeStoryOptionalYearDatePickerRepresentable11Coordinator)init;
- (void)dateChanged:(id)a3;
@end

@implementation GenerativeStoryOptionalYearDatePickerRepresentable.Coordinator

- (void)dateChanged:(id)a3
{
  uint64_t v5 = sub_1AB23075C();
  MEMORY[0x1F4188790](v5 - 8, v6);
  id v7 = a3;
  v8 = self;
  id v9 = objc_msgSend(v7, sel_date);
  sub_1AB23071C();

  sub_1AA846128();
  sub_1AB239C2C();
}

- (_TtCV12PhotosUICore50GenerativeStoryOptionalYearDatePickerRepresentable11Coordinator)init
{
  result = (_TtCV12PhotosUICore50GenerativeStoryOptionalYearDatePickerRepresentable11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end