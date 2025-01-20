@interface TLAlertSystemSoundPlayTaskDescriptor
- (BOOL)isDeemphasized;
- (NSString)vibrationIdentifier;
- (TLAlert)alert;
- (TLAlertSystemSoundContext)alertSystemSoundContext;
- (TLAlertSystemSoundPlayTaskDescriptor)initWithAlert:(id)a3 sound:(id)a4 vibrationIdentifier:(id)a5 isDeemphasized:(BOOL)a6 alertSystemSoundContext:(id)a7;
- (TLSystemSound)sound;
@end

@implementation TLAlertSystemSoundPlayTaskDescriptor

- (TLAlertSystemSoundPlayTaskDescriptor)initWithAlert:(id)a3 sound:(id)a4 vibrationIdentifier:(id)a5 isDeemphasized:(BOOL)a6 alertSystemSoundContext:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)TLAlertSystemSoundPlayTaskDescriptor;
  v17 = [(TLAlertSystemSoundPlayTaskDescriptor *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_alert, a3);
    objc_storeStrong((id *)&v18->_sound, a4);
    uint64_t v19 = [v15 copy];
    vibrationIdentifier = v18->_vibrationIdentifier;
    v18->_vibrationIdentifier = (NSString *)v19;

    v18->_deemphasized = a6;
    objc_storeStrong((id *)&v18->_alertSystemSoundContext, a7);
  }

  return v18;
}

- (TLAlert)alert
{
  return self->_alert;
}

- (TLSystemSound)sound
{
  return self->_sound;
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (BOOL)isDeemphasized
{
  return self->_deemphasized;
}

- (TLAlertSystemSoundContext)alertSystemSoundContext
{
  return self->_alertSystemSoundContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertSystemSoundContext, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_sound, 0);

  objc_storeStrong((id *)&self->_alert, 0);
}

@end