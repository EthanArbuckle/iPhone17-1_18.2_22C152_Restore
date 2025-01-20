@interface SVXStoreDemo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)languageCode;
- (SVXStoreDemo)initWithCoder:(id)a3;
- (SVXStoreDemo)initWithTranscriptID:(int64_t)a3 languageCode:(id)a4 gender:(int64_t)a5 outputVolume:(float)a6;
- (float)outputVolume;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (int64_t)gender;
- (int64_t)transcriptID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXStoreDemo

- (void).cxx_destruct
{
}

- (float)outputVolume
{
  return self->_outputVolume;
}

- (int64_t)gender
{
  return self->_gender;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (int64_t)transcriptID
{
  return self->_transcriptID;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t transcriptID = self->_transcriptID;
  id v6 = a3;
  v7 = [v4 numberWithInteger:transcriptID];
  [v6 encodeObject:v7 forKey:@"SVXStoreDemo::transcriptID"];

  [v6 encodeObject:self->_languageCode forKey:@"SVXStoreDemo::languageCode"];
  v8 = [NSNumber numberWithInteger:self->_gender];
  [v6 encodeObject:v8 forKey:@"SVXStoreDemo::gender"];

  *(float *)&double v9 = self->_outputVolume;
  id v10 = [NSNumber numberWithFloat:v9];
  [v6 encodeObject:v10 forKey:@"SVXStoreDemo::outputVolume"];
}

- (SVXStoreDemo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXStoreDemo::transcriptID"];
  uint64_t v6 = [v5 integerValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXStoreDemo::languageCode"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXStoreDemo::gender"];
  uint64_t v9 = [v8 integerValue];

  id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXStoreDemo::outputVolume"];

  [v10 floatValue];
  int v12 = v11;

  LODWORD(v13) = v12;
  v14 = [(SVXStoreDemo *)self initWithTranscriptID:v6 languageCode:v7 gender:v9 outputVolume:v13];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXStoreDemo *)a3;
  if (self == v4)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t transcriptID = self->_transcriptID;
      if (transcriptID == [(SVXStoreDemo *)v5 transcriptID]
        && (int64_t gender = self->_gender, gender == [(SVXStoreDemo *)v5 gender])
        && (float outputVolume = self->_outputVolume, [(SVXStoreDemo *)v5 outputVolume], outputVolume == v9))
      {
        int v12 = [(SVXStoreDemo *)v5 languageCode];
        languageCode = self->_languageCode;
        BOOL v10 = languageCode == v12 || [(NSString *)languageCode isEqual:v12];
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithInteger:self->_transcriptID];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_languageCode hash] ^ v4;
  uint64_t v6 = [NSNumber numberWithInteger:self->_gender];
  uint64_t v7 = [v6 hash];
  *(float *)&double v8 = self->_outputVolume;
  float v9 = [NSNumber numberWithFloat:v8];
  unint64_t v10 = v5 ^ v7 ^ [v9 hash];

  return v10;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v15.receiver = self;
  v15.super_class = (Class)SVXStoreDemo;
  NSUInteger v5 = [(SVXStoreDemo *)&v15 description];
  unint64_t transcriptID = self->_transcriptID;
  if (transcriptID > 0x15) {
    uint64_t v7 = @"(unknown)";
  }
  else {
    uint64_t v7 = off_2645520E8[transcriptID];
  }
  double v8 = v7;
  languageCode = self->_languageCode;
  unint64_t gender = self->_gender;
  if (gender > 3) {
    int v11 = @"(unknown)";
  }
  else {
    int v11 = off_264552568[gender];
  }
  int v12 = v11;
  v13 = (void *)[v4 initWithFormat:@"%@ {unint64_t transcriptID = %@, languageCode = %@, gender = %@, outputVolume = %f}", v5, v8, languageCode, v12, self->_outputVolume];

  return v13;
}

- (id)description
{
  return [(SVXStoreDemo *)self _descriptionWithIndent:0];
}

- (SVXStoreDemo)initWithTranscriptID:(int64_t)a3 languageCode:(id)a4 gender:(int64_t)a5 outputVolume:(float)a6
{
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SVXStoreDemo;
  int v11 = [(SVXStoreDemo *)&v16 init];
  int v12 = v11;
  if (v11)
  {
    v11->_unint64_t transcriptID = a3;
    uint64_t v13 = [v10 copy];
    languageCode = v12->_languageCode;
    v12->_languageCode = (NSString *)v13;

    v12->_unint64_t gender = a5;
    v12->_float outputVolume = a6;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXStoreDemoMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_SVXStoreDemoMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    uint64_t v6 = [(_SVXStoreDemoMutation *)v5 generate];
  }
  else
  {
    uint64_t v6 = (void *)[(SVXStoreDemo *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  v3 = (void (**)(id, _SVXStoreDemoMutation *))a3;
  id v4 = objc_alloc_init(_SVXStoreDemoMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  NSUInteger v5 = [(_SVXStoreDemoMutation *)v4 generate];

  return v5;
}

@end