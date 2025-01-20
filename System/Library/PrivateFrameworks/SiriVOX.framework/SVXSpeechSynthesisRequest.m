@interface SVXSpeechSynthesisRequest
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)speakableContext;
- (NSString)localizationKey;
- (NSString)speakableText;
- (NSString)streamID;
- (SVXSpeechSynthesisAudio)presynthesizedAudio;
- (SVXSpeechSynthesisRequest)initWithCoder:(id)a3;
- (SVXSpeechSynthesisRequest)initWithPriority:(int64_t)a3 options:(unint64_t)a4 speakableText:(id)a5 speakableContext:(id)a6 localizationKey:(id)a7 presynthesizedAudio:(id)a8 streamID:(id)a9;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)priority;
- (unint64_t)hash;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXSpeechSynthesisRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamID, 0);
  objc_storeStrong((id *)&self->_presynthesizedAudio, 0);
  objc_storeStrong((id *)&self->_localizationKey, 0);
  objc_storeStrong((id *)&self->_speakableContext, 0);

  objc_storeStrong((id *)&self->_speakableText, 0);
}

- (NSString)streamID
{
  return self->_streamID;
}

- (SVXSpeechSynthesisAudio)presynthesizedAudio
{
  return self->_presynthesizedAudio;
}

- (NSString)localizationKey
{
  return self->_localizationKey;
}

- (NSDictionary)speakableContext
{
  return self->_speakableContext;
}

- (NSString)speakableText
{
  return self->_speakableText;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t priority = self->_priority;
  id v8 = a3;
  v6 = [v4 numberWithInteger:priority];
  [v8 encodeObject:v6 forKey:@"SVXSpeechSynthesisRequest::priority"];

  v7 = [NSNumber numberWithUnsignedInteger:self->_options];
  [v8 encodeObject:v7 forKey:@"SVXSpeechSynthesisRequest::options"];

  [v8 encodeObject:self->_speakableText forKey:@"SVXSpeechSynthesisRequest::speakableText"];
  [v8 encodeObject:self->_speakableContext forKey:@"SVXSpeechSynthesisRequest::speakableContext"];
  [v8 encodeObject:self->_localizationKey forKey:@"SVXSpeechSynthesisRequest::localizationKey"];
  [v8 encodeObject:self->_presynthesizedAudio forKey:@"SVXSpeechSynthesisRequest::presynthesizedAudio"];
  [v8 encodeObject:self->_streamID forKey:@"SVXSpeechSynthesisRequest::streamID"];
}

- (SVXSpeechSynthesisRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSpeechSynthesisRequest::priority"];
  uint64_t v6 = [v5 integerValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSpeechSynthesisRequest::options"];
  uint64_t v8 = [v7 unsignedIntegerValue];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSpeechSynthesisRequest::speakableText"];
  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"SVXSpeechSynthesisRequest::speakableContext"];

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSpeechSynthesisRequest::localizationKey"];
  v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSpeechSynthesisRequest::presynthesizedAudio"];
  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSpeechSynthesisRequest::streamID"];

  v18 = [(SVXSpeechSynthesisRequest *)self initWithPriority:v6 options:v8 speakableText:v9 speakableContext:v14 localizationKey:v15 presynthesizedAudio:v16 streamID:v17];
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXSpeechSynthesisRequest *)a3;
  if (self == v4)
  {
    BOOL v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t priority = self->_priority;
      if (priority == [(SVXSpeechSynthesisRequest *)v5 priority]
        && (unint64_t options = self->_options, options == [(SVXSpeechSynthesisRequest *)v5 options]))
      {
        uint64_t v8 = [(SVXSpeechSynthesisRequest *)v5 speakableText];
        speakableText = self->_speakableText;
        if (speakableText == v8 || [(NSString *)speakableText isEqual:v8])
        {
          v10 = [(SVXSpeechSynthesisRequest *)v5 speakableContext];
          speakableContext = self->_speakableContext;
          if (speakableContext == v10 || [(NSDictionary *)speakableContext isEqual:v10])
          {
            uint64_t v12 = [(SVXSpeechSynthesisRequest *)v5 localizationKey];
            localizationKey = self->_localizationKey;
            if (localizationKey == v12 || [(NSString *)localizationKey isEqual:v12])
            {
              v14 = [(SVXSpeechSynthesisRequest *)v5 presynthesizedAudio];
              presynthesizedAudio = self->_presynthesizedAudio;
              if (presynthesizedAudio == v14
                || [(SVXSpeechSynthesisAudio *)presynthesizedAudio isEqual:v14])
              {
                v16 = [(SVXSpeechSynthesisRequest *)v5 streamID];
                streamID = self->_streamID;
                BOOL v18 = streamID == v16 || [(NSString *)streamID isEqual:v16];
              }
              else
              {
                BOOL v18 = 0;
              }
            }
            else
            {
              BOOL v18 = 0;
            }
          }
          else
          {
            BOOL v18 = 0;
          }
        }
        else
        {
          BOOL v18 = 0;
        }
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_priority];
  uint64_t v4 = [v3 hash];
  v5 = [NSNumber numberWithUnsignedInteger:self->_options];
  uint64_t v6 = [v5 hash] ^ v4;
  NSUInteger v7 = [(NSString *)self->_speakableText hash];
  uint64_t v8 = v7 ^ [(NSDictionary *)self->_speakableContext hash];
  NSUInteger v9 = v8 ^ [(NSString *)self->_localizationKey hash];
  unint64_t v10 = v6 ^ v9 ^ [(SVXSpeechSynthesisAudio *)self->_presynthesizedAudio hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_streamID hash];

  return v11;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v13.receiver = self;
  v13.super_class = (Class)SVXSpeechSynthesisRequest;
  v5 = [(SVXSpeechSynthesisRequest *)&v13 description];
  unint64_t priority = self->_priority;
  if (priority > 3) {
    NSUInteger v7 = @"(unknown)";
  }
  else {
    NSUInteger v7 = off_264552D00[priority];
  }
  uint64_t v8 = v7;
  NSUInteger v9 = SVXSpeechSynthesisOptionsGetNames(self->_options);
  unint64_t v10 = [v9 componentsJoinedByString:@"|"];
  v11 = (void *)[v4 initWithFormat:@"%@ {unint64_t priority = %@, options = %@, speakableText = %@, speakableContext = %@, localizationKey = %@, presynthesizedAudio = %@, streamID = %@}", v5, v8, v10, self->_speakableText, self->_speakableContext, self->_localizationKey, self->_presynthesizedAudio, self->_streamID];

  return v11;
}

- (id)description
{
  return [(SVXSpeechSynthesisRequest *)self _descriptionWithIndent:0];
}

- (SVXSpeechSynthesisRequest)initWithPriority:(int64_t)a3 options:(unint64_t)a4 speakableText:(id)a5 speakableContext:(id)a6 localizationKey:(id)a7 presynthesizedAudio:(id)a8 streamID:(id)a9
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v33.receiver = self;
  v33.super_class = (Class)SVXSpeechSynthesisRequest;
  v20 = [(SVXSpeechSynthesisRequest *)&v33 init];
  v21 = v20;
  if (v20)
  {
    v20->_unint64_t priority = a3;
    v20->_unint64_t options = a4;
    uint64_t v22 = [v15 copy];
    speakableText = v21->_speakableText;
    v21->_speakableText = (NSString *)v22;

    uint64_t v24 = [v16 copy];
    speakableContext = v21->_speakableContext;
    v21->_speakableContext = (NSDictionary *)v24;

    uint64_t v26 = [v17 copy];
    localizationKey = v21->_localizationKey;
    v21->_localizationKey = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    presynthesizedAudio = v21->_presynthesizedAudio;
    v21->_presynthesizedAudio = (SVXSpeechSynthesisAudio *)v28;

    uint64_t v30 = [v19 copy];
    streamID = v21->_streamID;
    v21->_streamID = (NSString *)v30;
  }
  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXSpeechSynthesisRequestMutation *))a3;
  if (v4)
  {
    v5 = [[_SVXSpeechSynthesisRequestMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    uint64_t v6 = [(_SVXSpeechSynthesisRequestMutation *)v5 generate];
  }
  else
  {
    uint64_t v6 = (void *)[(SVXSpeechSynthesisRequest *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  v3 = (void (**)(id, _SVXSpeechSynthesisRequestMutation *))a3;
  id v4 = objc_alloc_init(_SVXSpeechSynthesisRequestMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  v5 = [(_SVXSpeechSynthesisRequestMutation *)v4 generate];

  return v5;
}

@end