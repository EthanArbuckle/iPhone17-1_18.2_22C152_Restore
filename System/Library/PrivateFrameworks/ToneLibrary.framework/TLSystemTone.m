@interface TLSystemTone
- (BOOL)requiresLongFormPlayback;
- (NSURL)soundFileURL;
- (TLSystemSound)actualSound;
- (TLSystemSound)previewSound;
- (TLSystemTone)initWithSoundFileURL:(id)a3 actualSoundID:(unsigned int)a4 previewSoundID:(unsigned int)a5 requiresLongFormPlayback:(BOOL)a6;
@end

@implementation TLSystemTone

- (TLSystemTone)initWithSoundFileURL:(id)a3 actualSoundID:(unsigned int)a4 previewSoundID:(unsigned int)a5 requiresLongFormPlayback:(BOOL)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TLSystemTone;
  v11 = [(TLSystemTone *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    soundFileURL = v11->_soundFileURL;
    v11->_soundFileURL = (NSURL *)v12;

    v11->_actualSoundID = a4;
    v11->_previewSoundID = a5;
    v11->_requiresLongFormPlayback = a6;
  }

  return v11;
}

- (TLSystemSound)actualSound
{
  actualSound = self->_actualSound;
  if (!actualSound)
  {
    v4 = [[TLSystemSound alloc] initWithSoundFileURL:self->_soundFileURL soundID:self->_actualSoundID requiresLongFormPlayback:self->_requiresLongFormPlayback];
    v5 = self->_actualSound;
    self->_actualSound = v4;

    actualSound = self->_actualSound;
  }

  return actualSound;
}

- (TLSystemSound)previewSound
{
  previewSound = self->_previewSound;
  if (!previewSound)
  {
    v4 = [[TLSystemSound alloc] initWithSoundFileURL:self->_soundFileURL soundID:self->_previewSoundID requiresLongFormPlayback:self->_requiresLongFormPlayback];
    v5 = self->_previewSound;
    self->_previewSound = v4;

    previewSound = self->_previewSound;
  }

  return previewSound;
}

- (NSURL)soundFileURL
{
  return self->_soundFileURL;
}

- (BOOL)requiresLongFormPlayback
{
  return self->_requiresLongFormPlayback;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundFileURL, 0);
  objc_storeStrong((id *)&self->_previewSound, 0);

  objc_storeStrong((id *)&self->_actualSound, 0);
}

@end