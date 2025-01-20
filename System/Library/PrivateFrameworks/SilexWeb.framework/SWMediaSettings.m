@interface SWMediaSettings
- (BOOL)fullScreenEnabled;
- (SWMediaSettings)initWithMediaTypesRequiringUserActionForPlayback:(unint64_t)a3 fullScreenEnabled:(BOOL)a4;
- (unint64_t)mediaTypesRequiringUserActionForPlayback;
@end

@implementation SWMediaSettings

- (SWMediaSettings)initWithMediaTypesRequiringUserActionForPlayback:(unint64_t)a3 fullScreenEnabled:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SWMediaSettings;
  result = [(SWMediaSettings *)&v7 init];
  if (result)
  {
    result->_mediaTypesRequiringUserActionForPlayback = a3;
    result->_fullScreenEnabled = a4;
  }
  return result;
}

- (unint64_t)mediaTypesRequiringUserActionForPlayback
{
  return self->_mediaTypesRequiringUserActionForPlayback;
}

- (BOOL)fullScreenEnabled
{
  return self->_fullScreenEnabled;
}

@end