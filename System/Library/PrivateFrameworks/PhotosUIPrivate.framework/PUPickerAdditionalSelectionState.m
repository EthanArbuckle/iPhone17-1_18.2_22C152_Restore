@interface PUPickerAdditionalSelectionState
- (BOOL)shouldIncludeCaption;
- (BOOL)shouldIncludeLocation;
- (NSNumber)downscalingTargetDimension;
- (PUPickerAdditionalSelectionState)init;
- (PUPickerAdditionalSelectionState)initWithConfiguration:(id)a3;
- (PXObservable)observable;
- (PXPhotosFileProviderRegisterConfiguration)registerConfiguration;
- (int64_t)userEncodingPolicy;
- (void)setDownscalingTargetDimension:(id)a3;
- (void)setShouldIncludeCaption:(BOOL)a3;
- (void)setShouldIncludeLocation:(BOOL)a3;
- (void)setUserEncodingPolicy:(int64_t)a3;
@end

@implementation PUPickerAdditionalSelectionState

- (PXObservable)observable
{
  id v2 = sub_1AEB2A478();
  return (PXObservable *)v2;
}

- (PXPhotosFileProviderRegisterConfiguration)registerConfiguration
{
  id v2 = sub_1AEB2A4B8();
  return (PXPhotosFileProviderRegisterConfiguration *)v2;
}

- (PUPickerAdditionalSelectionState)initWithConfiguration:(id)a3
{
  return (PUPickerAdditionalSelectionState *)sub_1AEB2A4C4(a3);
}

- (int64_t)userEncodingPolicy
{
  id v2 = self;
  int64_t v3 = sub_1AEB2AA48();

  return v3;
}

- (void)setUserEncodingPolicy:(int64_t)a3
{
  v4 = self;
  sub_1AEB2AAC8(a3);
}

- (BOOL)shouldIncludeLocation
{
  id v2 = self;
  char v3 = sub_1AEB2ADF4();

  return v3 & 1;
}

- (void)setShouldIncludeLocation:(BOOL)a3
{
  char v3 = self;
  sub_1AEB2AE78();
}

- (BOOL)shouldIncludeCaption
{
  id v2 = self;
  char v3 = sub_1AEB2B2DC();

  return v3 & 1;
}

- (void)setShouldIncludeCaption:(BOOL)a3
{
  char v3 = self;
  sub_1AEB2B360();
}

- (NSNumber)downscalingTargetDimension
{
  id v2 = self;
  char v3 = (void *)sub_1AEB2B488();

  return (NSNumber *)v3;
}

- (void)setDownscalingTargetDimension:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AEB2B510(a3);
}

- (PUPickerAdditionalSelectionState)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end