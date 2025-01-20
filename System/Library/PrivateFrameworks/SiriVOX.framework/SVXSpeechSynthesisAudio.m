@interface SVXSpeechSynthesisAudio
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)data;
- (SVXAudioStreamBasicDescription)decoderASBD;
- (SVXAudioStreamBasicDescription)playerASBD;
- (SVXSpeechSynthesisAudio)initWithCoder:(id)a3;
- (SVXSpeechSynthesisAudio)initWithData:(id)a3 decoderASBD:(id)a4 playerASBD:(id)a5;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXSpeechSynthesisAudio

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerASBD, 0);
  objc_storeStrong((id *)&self->_decoderASBD, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

- (SVXAudioStreamBasicDescription)playerASBD
{
  return self->_playerASBD;
}

- (SVXAudioStreamBasicDescription)decoderASBD
{
  return self->_decoderASBD;
}

- (NSData)data
{
  return self->_data;
}

- (void)encodeWithCoder:(id)a3
{
  data = self->_data;
  id v5 = a3;
  [v5 encodeObject:data forKey:@"SVXSpeechSynthesisAudio::data"];
  [v5 encodeObject:self->_decoderASBD forKey:@"SVXSpeechSynthesisAudio::decoderASBD"];
  [v5 encodeObject:self->_playerASBD forKey:@"SVXSpeechSynthesisAudio::playerASBD"];
}

- (SVXSpeechSynthesisAudio)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSpeechSynthesisAudio::data"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSpeechSynthesisAudio::decoderASBD"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXSpeechSynthesisAudio::playerASBD"];

  v8 = [(SVXSpeechSynthesisAudio *)self initWithData:v5 decoderASBD:v6 playerASBD:v7];
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXSpeechSynthesisAudio *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(SVXSpeechSynthesisAudio *)v5 data];
      data = self->_data;
      if (data == v6 || [(NSData *)data isEqual:v6])
      {
        v8 = [(SVXSpeechSynthesisAudio *)v5 decoderASBD];
        decoderASBD = self->_decoderASBD;
        if (decoderASBD == v8 || [(SVXAudioStreamBasicDescription *)decoderASBD isEqual:v8])
        {
          v10 = [(SVXSpeechSynthesisAudio *)v5 playerASBD];
          playerASBD = self->_playerASBD;
          BOOL v12 = playerASBD == v10 || [(SVXAudioStreamBasicDescription *)playerASBD isEqual:v10];
        }
        else
        {
          BOOL v12 = 0;
        }
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_data hash];
  unint64_t v4 = [(SVXAudioStreamBasicDescription *)self->_decoderASBD hash] ^ v3;
  return v4 ^ [(SVXAudioStreamBasicDescription *)self->_playerASBD hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SVXSpeechSynthesisAudio;
  id v5 = [(SVXSpeechSynthesisAudio *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {data = (%llu bytes), decoderASBD = %@, playerASBD = %@}", v5, -[NSData length](self->_data, "length"), self->_decoderASBD, self->_playerASBD];

  return v6;
}

- (id)description
{
  return [(SVXSpeechSynthesisAudio *)self _descriptionWithIndent:0];
}

- (SVXSpeechSynthesisAudio)initWithData:(id)a3 decoderASBD:(id)a4 playerASBD:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SVXSpeechSynthesisAudio;
  v11 = [(SVXSpeechSynthesisAudio *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    data = v11->_data;
    v11->_data = (NSData *)v12;

    uint64_t v14 = [v9 copy];
    decoderASBD = v11->_decoderASBD;
    v11->_decoderASBD = (SVXAudioStreamBasicDescription *)v14;

    uint64_t v16 = [v10 copy];
    playerASBD = v11->_playerASBD;
    v11->_playerASBD = (SVXAudioStreamBasicDescription *)v16;
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXSpeechSynthesisAudioMutation *))a3;
  if (v4)
  {
    id v5 = [[_SVXSpeechSynthesisAudioMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    v6 = [(_SVXSpeechSynthesisAudioMutation *)v5 generate];
  }
  else
  {
    v6 = (void *)[(SVXSpeechSynthesisAudio *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  uint64_t v3 = (void (**)(id, _SVXSpeechSynthesisAudioMutation *))a3;
  id v4 = objc_alloc_init(_SVXSpeechSynthesisAudioMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  id v5 = [(_SVXSpeechSynthesisAudioMutation *)v4 generate];

  return v5;
}

@end