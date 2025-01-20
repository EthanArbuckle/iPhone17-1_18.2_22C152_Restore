@interface _UIKeyboardFeedbackDescriptor
+ (id)descriptorWithIntensity:(float)a3 sharpness:(float)a4 audio:(id)a5 volume:(float)a6;
- (NSString)audioFile;
- (float)audioVolume;
- (float)hapticIntensity;
- (float)hapticSharpness;
- (void)setAudioFile:(id)a3;
- (void)setAudioVolume:(float)a3;
- (void)setHapticIntensity:(float)a3;
- (void)setHapticSharpness:(float)a3;
@end

@implementation _UIKeyboardFeedbackDescriptor

+ (id)descriptorWithIntensity:(float)a3 sharpness:(float)a4 audio:(id)a5 volume:(float)a6
{
  id v9 = a5;
  v10 = objc_alloc_init(_UIKeyboardFeedbackDescriptor);
  *(float *)&double v11 = a3;
  [(_UIKeyboardFeedbackDescriptor *)v10 setHapticIntensity:v11];
  *(float *)&double v12 = a4;
  [(_UIKeyboardFeedbackDescriptor *)v10 setHapticSharpness:v12];
  [(_UIKeyboardFeedbackDescriptor *)v10 setAudioFile:v9];

  *(float *)&double v13 = a6;
  [(_UIKeyboardFeedbackDescriptor *)v10 setAudioVolume:v13];
  return v10;
}

- (float)hapticIntensity
{
  return self->_hapticIntensity;
}

- (void)setHapticIntensity:(float)a3
{
  self->_hapticIntensity = a3;
}

- (float)hapticSharpness
{
  return self->_hapticSharpness;
}

- (void)setHapticSharpness:(float)a3
{
  self->_hapticSharpness = a3;
}

- (NSString)audioFile
{
  return self->_audioFile;
}

- (void)setAudioFile:(id)a3
{
}

- (float)audioVolume
{
  return self->_audioVolume;
}

- (void)setAudioVolume:(float)a3
{
  self->_audioVolume = a3;
}

- (void).cxx_destruct
{
}

@end