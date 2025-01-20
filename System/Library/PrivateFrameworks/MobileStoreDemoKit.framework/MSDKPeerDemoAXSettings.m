@interface MSDKPeerDemoAXSettings
+ (BOOL)supportsSecureCoding;
- (MSDKPeerDemoAXSettings)init;
- (MSDKPeerDemoAXSettings)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)assistiveTouch;
- (unint64_t)audioDescriptions;
- (unint64_t)closedCaptions;
- (unint64_t)dwellControl;
- (unint64_t)gazeAccessibility;
- (unint64_t)pointerControl;
- (unint64_t)pointerControlHandChirality;
- (unint64_t)staticFoveation;
- (unint64_t)voiceOver;
- (unint64_t)voiceOverTutorial;
- (void)encodeWithCoder:(id)a3;
- (void)setAssistiveTouch:(unint64_t)a3;
- (void)setAudioDescriptions:(unint64_t)a3;
- (void)setClosedCaptions:(unint64_t)a3;
- (void)setDwellControl:(unint64_t)a3;
- (void)setGazeAccessibility:(unint64_t)a3;
- (void)setPointerControl:(unint64_t)a3;
- (void)setPointerControlHandChirality:(unint64_t)a3;
- (void)setStaticFoveation:(unint64_t)a3;
- (void)setVoiceOver:(unint64_t)a3;
- (void)setVoiceOverTutorial:(unint64_t)a3;
@end

@implementation MSDKPeerDemoAXSettings

- (MSDKPeerDemoAXSettings)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDKPeerDemoAXSettings;
  v2 = [(MSDKPeerDemoAXSettings *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MSDKPeerDemoAXSettings *)v2 setPointerControl:0];
    [(MSDKPeerDemoAXSettings *)v3 setGazeAccessibility:0];
    [(MSDKPeerDemoAXSettings *)v3 setStaticFoveation:0];
    [(MSDKPeerDemoAXSettings *)v3 setPointerControlHandChirality:0];
    [(MSDKPeerDemoAXSettings *)v3 setDwellControl:0];
    [(MSDKPeerDemoAXSettings *)v3 setVoiceOver:0];
    [(MSDKPeerDemoAXSettings *)v3 setClosedCaptions:0];
    [(MSDKPeerDemoAXSettings *)v3 setAssistiveTouch:0];
    [(MSDKPeerDemoAXSettings *)v3 setAudioDescriptions:0];
    [(MSDKPeerDemoAXSettings *)v3 setVoiceOverTutorial:0];
  }
  return v3;
}

- (id)description
{
  v7 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  objc_super v5 = [v7 stringWithFormat:@"<%@[%p]: PointerControl=%lu GazeAccessibility=%lu StaticFoveation=%lu HandChirality=%lu DwellControll=%lu VoiceOver=%lu ClosedCaptions=%lu AssistiveTouch=%lu AudioDescriptions=%lu VoiceOverTutorial=%lu>", v4, self, -[MSDKPeerDemoAXSettings pointerControl](self, "pointerControl"), -[MSDKPeerDemoAXSettings gazeAccessibility](self, "gazeAccessibility"), -[MSDKPeerDemoAXSettings staticFoveation](self, "staticFoveation"), -[MSDKPeerDemoAXSettings pointerControlHandChirality](self, "pointerControlHandChirality"), -[MSDKPeerDemoAXSettings dwellControl](self, "dwellControl"), -[MSDKPeerDemoAXSettings voiceOver](self, "voiceOver"), -[MSDKPeerDemoAXSettings closedCaptions](self, "closedCaptions"), -[MSDKPeerDemoAXSettings assistiveTouch](self, "assistiveTouch"), -[MSDKPeerDemoAXSettings audioDescriptions](self, "audioDescriptions"), -[MSDKPeerDemoAXSettings voiceOverTutorial](self, "voiceOverTutorial")];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoAXSettings)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MSDKPeerDemoAXSettings;
  objc_super v5 = [(MSDKPeerDemoAXSettings *)&v17 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pointerControl"];
    -[MSDKPeerDemoAXSettings setPointerControl:](v5, "setPointerControl:", [v6 unsignedIntegerValue]);

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gazeAccessibility"];
    -[MSDKPeerDemoAXSettings setGazeAccessibility:](v5, "setGazeAccessibility:", [v7 unsignedIntegerValue]);

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"staticFoveation"];
    -[MSDKPeerDemoAXSettings setStaticFoveation:](v5, "setStaticFoveation:", [v8 unsignedIntegerValue]);

    if ([v4 containsValueForKey:@"pointerControlHandChirality"])
    {
      v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pointerControlHandChirality"];
      -[MSDKPeerDemoAXSettings setPointerControlHandChirality:](v5, "setPointerControlHandChirality:", [v9 unsignedIntegerValue]);
    }
    if ([v4 containsValueForKey:@"dwellControl"])
    {
      v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dwellControl"];
      -[MSDKPeerDemoAXSettings setDwellControl:](v5, "setDwellControl:", [v10 unsignedIntegerValue]);
    }
    if ([v4 containsValueForKey:@"voiceOver"])
    {
      v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"voiceOver"];
      -[MSDKPeerDemoAXSettings setVoiceOver:](v5, "setVoiceOver:", [v11 unsignedIntegerValue]);
    }
    if ([v4 containsValueForKey:@"closedCaptions"])
    {
      v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"closedCaptions"];
      -[MSDKPeerDemoAXSettings setClosedCaptions:](v5, "setClosedCaptions:", [v12 unsignedIntegerValue]);
    }
    if ([v4 containsValueForKey:@"assistiveTouch"])
    {
      v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assistiveTouch"];
      -[MSDKPeerDemoAXSettings setAssistiveTouch:](v5, "setAssistiveTouch:", [v13 unsignedIntegerValue]);
    }
    if ([v4 containsValueForKey:@"audioDescriptions"])
    {
      v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"audioDescriptions"];
      -[MSDKPeerDemoAXSettings setAudioDescriptions:](v5, "setAudioDescriptions:", [v14 unsignedIntegerValue]);
    }
    if ([v4 containsValueForKey:@"voiceOverTutorial"])
    {
      v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"voiceOverTutorial"];
      -[MSDKPeerDemoAXSettings setVoiceOverTutorial:](v5, "setVoiceOverTutorial:", [v15 unsignedIntegerValue]);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings pointerControl](self, "pointerControl"));
  [v5 encodeObject:v6 forKey:@"pointerControl"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings gazeAccessibility](self, "gazeAccessibility"));
  [v5 encodeObject:v7 forKey:@"gazeAccessibility"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings staticFoveation](self, "staticFoveation"));
  [v5 encodeObject:v8 forKey:@"staticFoveation"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings pointerControlHandChirality](self, "pointerControlHandChirality"));
  [v5 encodeObject:v9 forKey:@"pointerControlHandChirality"];

  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings dwellControl](self, "dwellControl"));
  [v5 encodeObject:v10 forKey:@"dwellControl"];

  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings voiceOver](self, "voiceOver"));
  [v5 encodeObject:v11 forKey:@"voiceOver"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings closedCaptions](self, "closedCaptions"));
  [v5 encodeObject:v12 forKey:@"closedCaptions"];

  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings assistiveTouch](self, "assistiveTouch"));
  [v5 encodeObject:v13 forKey:@"assistiveTouch"];

  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings audioDescriptions](self, "audioDescriptions"));
  [v5 encodeObject:v14 forKey:@"audioDescriptions"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MSDKPeerDemoAXSettings voiceOverTutorial](self, "voiceOverTutorial"));
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v15 forKey:@"voiceOverTutorial"];
}

- (unint64_t)pointerControl
{
  return self->_pointerControl;
}

- (void)setPointerControl:(unint64_t)a3
{
  self->_pointerControl = a3;
}

- (unint64_t)gazeAccessibility
{
  return self->_gazeAccessibility;
}

- (void)setGazeAccessibility:(unint64_t)a3
{
  self->_gazeAccessibility = a3;
}

- (unint64_t)staticFoveation
{
  return self->_staticFoveation;
}

- (void)setStaticFoveation:(unint64_t)a3
{
  self->_staticFoveation = a3;
}

- (unint64_t)pointerControlHandChirality
{
  return self->_pointerControlHandChirality;
}

- (void)setPointerControlHandChirality:(unint64_t)a3
{
  self->_pointerControlHandChirality = a3;
}

- (unint64_t)dwellControl
{
  return self->_dwellControl;
}

- (void)setDwellControl:(unint64_t)a3
{
  self->_dwellControl = a3;
}

- (unint64_t)voiceOver
{
  return self->_voiceOver;
}

- (void)setVoiceOver:(unint64_t)a3
{
  self->_voiceOver = a3;
}

- (unint64_t)closedCaptions
{
  return self->_closedCaptions;
}

- (void)setClosedCaptions:(unint64_t)a3
{
  self->_closedCaptions = a3;
}

- (unint64_t)assistiveTouch
{
  return self->_assistiveTouch;
}

- (void)setAssistiveTouch:(unint64_t)a3
{
  self->_assistiveTouch = a3;
}

- (unint64_t)audioDescriptions
{
  return self->_audioDescriptions;
}

- (void)setAudioDescriptions:(unint64_t)a3
{
  self->_audioDescriptions = a3;
}

- (unint64_t)voiceOverTutorial
{
  return self->_voiceOverTutorial;
}

- (void)setVoiceOverTutorial:(unint64_t)a3
{
  self->_voiceOverTutorial = a3;
}

@end