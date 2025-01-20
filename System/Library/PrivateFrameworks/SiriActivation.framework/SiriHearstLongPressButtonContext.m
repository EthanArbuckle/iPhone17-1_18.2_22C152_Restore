@interface SiriHearstLongPressButtonContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isTemporaryDevice;
- (SiriHearstLongPressButtonContext)initWithCoder:(id)a3;
- (SiriHearstLongPressButtonContext)initWithSpeechRequestOptions:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SiriHearstLongPressButtonContext

- (SiriHearstLongPressButtonContext)initWithSpeechRequestOptions:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SiriHearstLongPressButtonContext;
  v5 = [(SiriContext *)&v12 initWithSpeechRequestOptions:v4];
  v6 = v5;
  if (v5)
  {
    v5->_isTemporaryDevice = 0;
    v7 = [v4 activationDeviceIdentifier];
    if (v7)
    {
      v8 = [MEMORY[0x1E4F50B70] sharedInstance];
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
      v10 = [v8 deviceFromIdentifier:v9];

      if (v10)
      {
        [v10 device];
        BTDeviceIsTemporaryPaired();
        v6->_isTemporaryDevice = 0;
      }
    }
  }

  return v6;
}

- (BOOL)isTemporaryDevice
{
  return self->_isTemporaryDevice;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SiriContext *)self contextOverride];
  v5 = NSStringFromBOOL();
  v6 = [(SiriContext *)self speechRequestOptions];
  v7 = [v3 stringWithFormat:@"<SiriHearstLongPressButtonContext contextOverride:%@ isTemporaryDevice:%@ speechRequestOptions:%@>", v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriHearstLongPressButtonContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SiriHearstLongPressButtonContext;
  v5 = [(SiriLongPressButtonContext *)&v7 initWithCoder:v4];
  if (v5) {
    v5->_isTemporaryDevice = [v4 decodeBoolForKey:@"isTemporaryDevice"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SiriHearstLongPressButtonContext;
  id v4 = a3;
  [(SiriLongPressButtonContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_isTemporaryDevice, @"isTemporaryDevice", v5.receiver, v5.super_class);
}

@end