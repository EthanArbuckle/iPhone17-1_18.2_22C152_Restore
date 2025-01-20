@interface MNAudioSystemEvent
- (BOOL)hasSoundEffect;
- (BOOL)isEqualToEvent:(id)a3;
- (BOOL)isPrivate;
- (MNAudioSystemEvent)initWithUtterance:(id)a3 andShortPrompt:(unint64_t)a4 andVoiceGuidanceLevel:(unint64_t)a5 andCompletion:(id)a6;
- (NSString)utterance;
- (id)description;
- (id)handler;
- (unint64_t)guidanceLevel;
- (unint64_t)shortPrompt;
@end

@implementation MNAudioSystemEvent

- (MNAudioSystemEvent)initWithUtterance:(id)a3 andShortPrompt:(unint64_t)a4 andVoiceGuidanceLevel:(unint64_t)a5 andCompletion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if ([v10 length] | a4
    && (v18.receiver = self,
        v18.super_class = (Class)MNAudioSystemEvent,
        (self = [(MNAudioSystemEvent *)&v18 init]) != 0))
  {
    self->_isPrivate = objc_msgSend(v10, "_navigation_isPrivate");
    objc_msgSend(v10, "_navigation_stringByStrippingPrivateTag");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    utterance = self->_utterance;
    self->_utterance = v12;

    self->_shortPrompt = a4;
    self->_guidanceLevel = a5;
    v14 = (void *)[v11 copy];
    id handler = self->_handler;
    self->_id handler = v14;

    self = self;
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)hasSoundEffect
{
  return (self->_shortPrompt & 0x30) != 0;
}

- (BOOL)isEqualToEvent:(id)a3
{
  id v4 = a3;
  if (!v4 || ![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  v5 = [(MNAudioSystemEvent *)self utterance];
  uint64_t v6 = [v5 length];

  v7 = [v4 utterance];
  v8 = v7;
  if (!v6)
  {
    if ([v7 length])
    {
    }
    else
    {
      uint64_t v11 = [v4 shortPrompt];
      unint64_t v12 = [(MNAudioSystemEvent *)self shortPrompt];

      if (v11 == v12) {
        goto LABEL_9;
      }
    }
LABEL_10:
    BOOL v13 = 0;
    goto LABEL_11;
  }
  v9 = [(MNAudioSystemEvent *)self utterance];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_9:
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v14.receiver = self;
  v14.super_class = (Class)MNAudioSystemEvent;
  id v4 = [(MNAudioSystemEvent *)&v14 description];
  v5 = [v3 stringWithString:v4];

  uint64_t v6 = [(MNAudioSystemEvent *)self utterance];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    v8 = [(MNAudioSystemEvent *)self utterance];
    [v5 appendFormat:@" utterance: '%@'", v8];
  }
  if ([(MNAudioSystemEvent *)self shortPrompt])
  {
    v9 = MNInstructionsShortPromptTypeToString([(MNAudioSystemEvent *)self shortPrompt]);
    [v5 appendFormat:@" instructions: %@", v9];
  }
  char v10 = [(MNAudioSystemEvent *)self handler];
  uint64_t v11 = @"with completion handler";
  if (!v10) {
    uint64_t v11 = @"with no completion handler";
  }
  [v5 appendFormat:@" %@", v11];

  unint64_t v12 = (void *)[v5 copy];
  return v12;
}

- (NSString)utterance
{
  return self->_utterance;
}

- (unint64_t)shortPrompt
{
  return self->_shortPrompt;
}

- (unint64_t)guidanceLevel
{
  return self->_guidanceLevel;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
}

@end