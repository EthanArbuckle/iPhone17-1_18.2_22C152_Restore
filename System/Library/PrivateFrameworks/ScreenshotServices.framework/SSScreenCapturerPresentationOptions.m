@interface SSScreenCapturerPresentationOptions
- (id)description;
- (unint64_t)presentationMode;
- (void)setPresentationMode:(unint64_t)a3;
@end

@implementation SSScreenCapturerPresentationOptions

- (id)description
{
  v3 = [MEMORY[0x263F089D8] string];
  v7.receiver = self;
  v7.super_class = (Class)SSScreenCapturerPresentationOptions;
  v4 = [(SSScreenCapturerPresentationOptions *)&v7 description];
  [v3 appendString:v4];

  [v3 appendString:@" presentationMode: "];
  if ([(SSScreenCapturerPresentationOptions *)self presentationMode])
  {
    if ([(SSScreenCapturerPresentationOptions *)self presentationMode] == 2) {
      v5 = @"InteractiveGestureFullscreen";
    }
    else {
      v5 = @"Fullscreen";
    }
  }
  else
  {
    v5 = @"PictureInPicture";
  }
  [v3 appendString:v5];
  return v3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

@end