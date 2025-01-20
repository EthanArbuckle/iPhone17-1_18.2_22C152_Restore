@interface PUPickerSearchBar
- (CGSize)intrinsicContentSize;
- (PUPickerSearchBar)initWithCoder:(id)a3;
- (PUPickerSearchBar)initWithFrame:(CGRect)a3;
- (PUPickerSearchBar)initWithPhotoLibrary:(id)a3 searchHandler:(id)a4 scopeHandler:(id)a5;
- (void)updateContainerFromPickerConfiguration:(id)a3;
- (void)updateContainerFromSuggestion:(id)a3;
- (void)updateIsEditing:(BOOL)a3;
- (void)updateSearchText:(id)a3;
@end

@implementation PUPickerSearchBar

- (PUPickerSearchBar)initWithPhotoLibrary:(id)a3 searchHandler:(id)a4 scopeHandler:(id)a5
{
  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  return (PUPickerSearchBar *)sub_1AEB18AF8(a3, (uint64_t)sub_1AEB19EC4, v9, (uint64_t)sub_1AEB19ECC, v10);
}

- (void)updateSearchText:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AEB193E0();
}

- (void)updateContainerFromSuggestion:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AEB19478(v4);
}

- (void)updateContainerFromPickerConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AEB19540(v4);
}

- (void)updateIsEditing:(BOOL)a3
{
  v3 = self;
  sub_1AEB19638();
}

- (PUPickerSearchBar)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AEB196B8();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1AEB197AC();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (PUPickerSearchBar)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PUPickerSearchBar_hostingView);
}

@end