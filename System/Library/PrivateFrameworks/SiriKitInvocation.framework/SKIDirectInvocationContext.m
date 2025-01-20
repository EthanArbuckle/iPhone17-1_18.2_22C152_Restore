@interface SKIDirectInvocationContext
+ (id)contextForAnnounceNotifications;
+ (id)contextForCarPlayDirectAction;
- (BOOL)isEyesFree;
- (BOOL)isTextToSpeechEnabled;
- (BOOL)isVoiceTriggerEnabled;
- (NSString)inputOrigin;
- (NSString)interactionType;
- (NSString)responseMode;
- (SKIDirectInvocationContext)init;
- (void)setEyesFree:(BOOL)a3;
- (void)setInputOrigin:(id)a3;
- (void)setInteractionType:(id)a3;
- (void)setResponseMode:(id)a3;
- (void)setTextToSpeechEnabled:(BOOL)a3;
- (void)setVoiceTriggerEnabled:(BOOL)a3;
@end

@implementation SKIDirectInvocationContext

- (SKIDirectInvocationContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)SKIDirectInvocationContext;
  v2 = [(SKIDirectInvocationContext *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SKIDirectInvocationContext *)v2 setVoiceTriggerEnabled:1];
    [(SKIDirectInvocationContext *)v3 setTextToSpeechEnabled:1];
    [(SKIDirectInvocationContext *)v3 setEyesFree:1];
    [(SKIDirectInvocationContext *)v3 setInputOrigin:*MEMORY[0x263F65850]];
    [(SKIDirectInvocationContext *)v3 setInteractionType:*MEMORY[0x263F658C0]];
    [(SKIDirectInvocationContext *)v3 setResponseMode:0];
  }
  return v3;
}

- (BOOL)isVoiceTriggerEnabled
{
  return self->_voiceTriggerEnabled;
}

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
  self->_voiceTriggerEnabled = a3;
}

- (BOOL)isTextToSpeechEnabled
{
  return self->_textToSpeechEnabled;
}

- (void)setTextToSpeechEnabled:(BOOL)a3
{
  self->_textToSpeechEnabled = a3;
}

- (BOOL)isEyesFree
{
  return self->_eyesFree;
}

- (void)setEyesFree:(BOOL)a3
{
  self->_eyesFree = a3;
}

- (NSString)inputOrigin
{
  return self->_inputOrigin;
}

- (void)setInputOrigin:(id)a3
{
}

- (NSString)interactionType
{
  return self->_interactionType;
}

- (void)setInteractionType:(id)a3
{
}

- (NSString)responseMode
{
  return self->_responseMode;
}

- (void)setResponseMode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_interactionType, 0);

  objc_storeStrong((id *)&self->_inputOrigin, 0);
}

+ (id)contextForCarPlayDirectAction
{
  v2 = objc_alloc_init(SKIDirectInvocationContext);
  [(SKIDirectInvocationContext *)v2 setVoiceTriggerEnabled:1];
  [(SKIDirectInvocationContext *)v2 setTextToSpeechEnabled:1];
  [(SKIDirectInvocationContext *)v2 setEyesFree:1];
  [(SKIDirectInvocationContext *)v2 setInputOrigin:*MEMORY[0x263F65858]];
  [(SKIDirectInvocationContext *)v2 setInteractionType:*MEMORY[0x263F658C0]];

  return v2;
}

+ (id)contextForAnnounceNotifications
{
  v2 = objc_alloc_init(SKIDirectInvocationContext);
  [(SKIDirectInvocationContext *)v2 setVoiceTriggerEnabled:1];
  [(SKIDirectInvocationContext *)v2 setTextToSpeechEnabled:1];
  [(SKIDirectInvocationContext *)v2 setEyesFree:1];
  [(SKIDirectInvocationContext *)v2 setInputOrigin:*MEMORY[0x263F65850]];
  [(SKIDirectInvocationContext *)v2 setInteractionType:*MEMORY[0x263F658C0]];
  [(SKIDirectInvocationContext *)v2 setResponseMode:*MEMORY[0x263F65E98]];

  return v2;
}

@end