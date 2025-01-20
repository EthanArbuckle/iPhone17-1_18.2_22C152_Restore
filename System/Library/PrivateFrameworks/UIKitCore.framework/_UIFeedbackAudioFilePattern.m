@interface _UIFeedbackAudioFilePattern
+ (BOOL)supportsSecureCoding;
+ (id)feedbackPatternFromFile:(id)a3;
+ (id)type;
- (BOOL)canReuseCoreHapticsPlayer;
- (BOOL)disableEventUseVolumeEnvelope;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHighPriority;
- (NSURL)fileURL;
- (_UIFeedbackAudioFilePattern)initWithDictionaryRepresentation:(id)a3;
- (_UIFeedbackAudioFilePattern)initWithFileURL:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)_effectivePlayableFeedbackTypes;
- (void)setCanReuseCoreHapticsPlayer:(BOOL)a3;
- (void)setDisableEventUseVolumeEnvelope:(BOOL)a3;
@end

@implementation _UIFeedbackAudioFilePattern

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return @"wav";
}

+ (id)feedbackPatternFromFile:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithFileURL:v4];

  return v5;
}

- (_UIFeedbackAudioFilePattern)initWithFileURL:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFeedbackAudioFilePattern;
  v6 = [(_UIFeedback *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileURL, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFeedbackAudioFilePattern;
  if ([(_UIFeedback *)&v10 isEqual:v4])
  {
    id v5 = v4;
    if ([(NSURL *)self->_fileURL isEqual:v5[17]]
      && (int canReuseCoreHapticsPlayer = self->_canReuseCoreHapticsPlayer,
          canReuseCoreHapticsPlayer == [v5 canReuseCoreHapticsPlayer]))
    {
      int disableEventUseVolumeEnvelope = self->_disableEventUseVolumeEnvelope;
      BOOL v8 = disableEventUseVolumeEnvelope == [v5 disableEventUseVolumeEnvelope];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (_UIFeedbackAudioFilePattern)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIFeedbackAudioFilePattern;
  id v5 = [(_UIFeedback *)&v14 initWithDictionaryRepresentation:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CB10];
    v7 = [v4 objectForKeyedSubscript:@"fileURL"];
    uint64_t v8 = [v6 URLWithString:v7 encodingInvalidCharacters:0];
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v8;

    objc_super v10 = [v4 objectForKeyedSubscript:@"canReuseCoreHapticsPlayer"];
    v5->_int canReuseCoreHapticsPlayer = [v10 BOOLValue];

    v11 = [v4 objectForKeyedSubscript:@"disableEventUseVolumeEnvelope"];
    v5->_int disableEventUseVolumeEnvelope = [v11 BOOLValue];

    v12 = v5;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  v9.receiver = self;
  v9.super_class = (Class)_UIFeedbackAudioFilePattern;
  v3 = [(_UIFeedback *)&v9 dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(NSURL *)self->_fileURL absoluteString];
  [v4 setObject:v5 forKeyedSubscript:@"fileURL"];

  v6 = [NSNumber numberWithBool:self->_canReuseCoreHapticsPlayer];
  [v4 setObject:v6 forKeyedSubscript:@"canReuseCoreHapticsPlayer"];

  v7 = [NSNumber numberWithBool:self->_disableEventUseVolumeEnvelope];
  [v4 setObject:v7 forKeyedSubscript:@"disableEventUseVolumeEnvelope"];

  return v4;
}

- (unint64_t)_effectivePlayableFeedbackTypes
{
  return 1;
}

- (BOOL)isHighPriority
{
  return self->_highPriority;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (BOOL)canReuseCoreHapticsPlayer
{
  return self->_canReuseCoreHapticsPlayer;
}

- (void)setCanReuseCoreHapticsPlayer:(BOOL)a3
{
  self->_int canReuseCoreHapticsPlayer = a3;
}

- (BOOL)disableEventUseVolumeEnvelope
{
  return self->_disableEventUseVolumeEnvelope;
}

- (void)setDisableEventUseVolumeEnvelope:(BOOL)a3
{
  self->_int disableEventUseVolumeEnvelope = a3;
}

- (void).cxx_destruct
{
}

@end