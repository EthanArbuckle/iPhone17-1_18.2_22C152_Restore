@interface PUPickerAssetPreparationOptions
- (BOOL)shouldIncludeCaption;
- (BOOL)shouldIncludeLocation;
- (PUPickerAssetPreparationOptions)init;
- (PUPickerAssetPreparationOptions)initWithIncludeLocation:(BOOL)a3 includeCaption:(BOOL)a4 userEncodingPolicy:(int64_t)a5;
- (int64_t)userEncodingPolicy;
@end

@implementation PUPickerAssetPreparationOptions

- (int64_t)userEncodingPolicy
{
  return self->_userEncodingPolicy;
}

- (BOOL)shouldIncludeCaption
{
  return self->_shouldIncludeCaption;
}

- (BOOL)shouldIncludeLocation
{
  return self->_shouldIncludeLocation;
}

- (PUPickerAssetPreparationOptions)initWithIncludeLocation:(BOOL)a3 includeCaption:(BOOL)a4 userEncodingPolicy:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PUPickerAssetPreparationOptions;
  result = [(PUPickerAssetPreparationOptions *)&v9 init];
  if (result)
  {
    result->_shouldIncludeLocation = a3;
    result->_shouldIncludeCaption = a4;
    result->_userEncodingPolicy = a5;
  }
  return result;
}

- (PUPickerAssetPreparationOptions)init
{
  return [(PUPickerAssetPreparationOptions *)self initWithIncludeLocation:1 includeCaption:1 userEncodingPolicy:0];
}

@end