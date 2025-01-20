@interface TUINowPlayingBox
- (BOOL)playing;
- (Class)layoutClass;
- (UIColor)color;
- (void)setColor:(id)a3;
- (void)setPlaying:(BOOL)a3;
@end

@implementation TUINowPlayingBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (BOOL)playing
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end