@interface TLDeemphasizableAlertSystemSoundBeginPlayingContext
- (NSString)toneIdentifierForDeemphasizingAlert;
- (NSString)vibrationIdentifier;
- (NSString)vibrationIdentifierForDeemphasizingAlert;
- (TLAlert)alert;
- (TLAlertSystemSoundContext)alertSystemSoundContext;
- (TLDeemphasizableAlertSystemSoundBeginPlayingContext)initWithAlert:(id)a3 alertSystemSoundContext:(id)a4 toneIdentifierForDeemphasizingAlert:(id)a5 vibrationIdentifierForDeemphasizingAlert:(id)a6;
- (TLSystemSound)sound;
- (void)setSound:(id)a3;
- (void)setVibrationIdentifier:(id)a3;
@end

@implementation TLDeemphasizableAlertSystemSoundBeginPlayingContext

- (TLDeemphasizableAlertSystemSoundBeginPlayingContext)initWithAlert:(id)a3 alertSystemSoundContext:(id)a4 toneIdentifierForDeemphasizingAlert:(id)a5 vibrationIdentifierForDeemphasizingAlert:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)TLDeemphasizableAlertSystemSoundBeginPlayingContext;
  v15 = [(TLDeemphasizableAlertSystemSoundBeginPlayingContext *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_alert, a3);
    objc_storeStrong((id *)&v16->_alertSystemSoundContext, a4);
    uint64_t v17 = [v13 copy];
    toneIdentifierForDeemphasizingAlert = v16->_toneIdentifierForDeemphasizingAlert;
    v16->_toneIdentifierForDeemphasizingAlert = (NSString *)v17;

    uint64_t v19 = [v14 copy];
    vibrationIdentifierForDeemphasizingAlert = v16->_vibrationIdentifierForDeemphasizingAlert;
    v16->_vibrationIdentifierForDeemphasizingAlert = (NSString *)v19;
  }
  return v16;
}

- (TLAlert)alert
{
  return self->_alert;
}

- (TLAlertSystemSoundContext)alertSystemSoundContext
{
  return self->_alertSystemSoundContext;
}

- (NSString)toneIdentifierForDeemphasizingAlert
{
  return self->_toneIdentifierForDeemphasizingAlert;
}

- (NSString)vibrationIdentifierForDeemphasizingAlert
{
  return self->_vibrationIdentifierForDeemphasizingAlert;
}

- (TLSystemSound)sound
{
  return self->_sound;
}

- (void)setSound:(id)a3
{
}

- (NSString)vibrationIdentifier
{
  return self->_vibrationIdentifier;
}

- (void)setVibrationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrationIdentifier, 0);
  objc_storeStrong((id *)&self->_sound, 0);
  objc_storeStrong((id *)&self->_vibrationIdentifierForDeemphasizingAlert, 0);
  objc_storeStrong((id *)&self->_toneIdentifierForDeemphasizingAlert, 0);
  objc_storeStrong((id *)&self->_alertSystemSoundContext, 0);

  objc_storeStrong((id *)&self->_alert, 0);
}

@end