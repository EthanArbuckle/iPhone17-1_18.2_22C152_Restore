@interface PUPickerSuggestionResultFetcher
- (PUPickerSuggestion)currentSuggestion;
- (PUPickerSuggestionResultFetcher)init;
- (PUPickerSuggestionResultFetcher)initWithPhotoLibrary:(id)a3 isProcessing:(BOOL)a4 isDeviceAspectRatioContentMode:(BOOL)a5 contentHasSpecialFilter:(BOOL)a6 updateHandler:(id)a7;
- (void)photoLibraryDidChange:(id)a3;
- (void)setCurrentSuggestion:(id)a3;
@end

@implementation PUPickerSuggestionResultFetcher

- (PUPickerSuggestion)currentSuggestion
{
  v2 = self;
  v3 = (void *)sub_1AEAE716C();

  return (PUPickerSuggestion *)v3;
}

- (void)setCurrentSuggestion:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1AEAE7320((uint64_t)a3);
}

- (PUPickerSuggestionResultFetcher)initWithPhotoLibrary:(id)a3 isProcessing:(BOOL)a4 isDeviceAspectRatioContentMode:(BOOL)a5 contentHasSpecialFilter:(BOOL)a6 updateHandler:(id)a7
{
  v11 = _Block_copy(a7);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  PickerSuggestionResultFetcher.init(photoLibrary:isProcessing:isDeviceAspectRatioContentMode:contentHasSpecialFilter:updateHandler:)(a3, a4, a5, a6, (uint64_t)sub_1AEAE995C, v12);
  return result;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AEAE8C74(v4);
}

- (PUPickerSuggestionResultFetcher)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end