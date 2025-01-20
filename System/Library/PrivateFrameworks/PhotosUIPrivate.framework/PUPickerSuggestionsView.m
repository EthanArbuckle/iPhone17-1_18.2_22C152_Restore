@interface PUPickerSuggestionsView
- (CGSize)intrinsicContentSize;
- (PHPhotoLibrary)photoLibrary;
- (PUPickerSuggestionsView)initWithCoder:(id)a3;
- (PUPickerSuggestionsView)initWithFrame:(CGRect)a3;
- (PUPickerSuggestionsView)initWithIsProcessing:(BOOL)a3 isDeviceAspectRatioContentMode:(BOOL)a4 contentHasSpecialFilter:(BOOL)a5;
- (PUPickerSuggestionsViewDelegate)delegate;
- (_PHPickerSuggestionGroup)suggestionGroup;
- (void)clearFilterableSuggestion;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setPhotoLibrary:(id)a3;
- (void)setSuggestionGroup:(id)a3;
@end

@implementation PUPickerSuggestionsView

- (PUPickerSuggestionsViewDelegate)delegate
{
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AEA89680();
}

- (PHPhotoLibrary)photoLibrary
{
  v2 = sub_1AEA896FC();
  return (PHPhotoLibrary *)v2;
}

- (void)setPhotoLibrary:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AEA89788((uint64_t)a3);
}

- (_PHPickerSuggestionGroup)suggestionGroup
{
  v2 = sub_1AEA897C8();
  return (_PHPickerSuggestionGroup *)v2;
}

- (void)setSuggestionGroup:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AEA89854(a3);
}

- (void)clearFilterableSuggestion
{
  v2 = self;
  sub_1AEA898AC();
}

- (PUPickerSuggestionsView)initWithIsProcessing:(BOOL)a3 isDeviceAspectRatioContentMode:(BOOL)a4 contentHasSpecialFilter:(BOOL)a5
{
  sub_1AEA89A54();
  return result;
}

- (PUPickerSuggestionsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AEA89EFC();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1AEA8A21C();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutMarginsDidChange
{
  v2 = self;
  sub_1AEA8A248();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AEA8A36C();
}

- (PUPickerSuggestionsView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_1AEA2489C((uint64_t)self + OBJC_IVAR___PUPickerSuggestionsView_delegate);

  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___PUPickerSuggestionsView_reloadQueue);
}

@end