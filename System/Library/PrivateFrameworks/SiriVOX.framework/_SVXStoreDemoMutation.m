@interface _SVXStoreDemoMutation
- (_SVXStoreDemoMutation)init;
- (_SVXStoreDemoMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setGender:(int64_t)a3;
- (void)setLanguageCode:(id)a3;
- (void)setOutputVolume:(float)a3;
- (void)setTranscriptID:(int64_t)a3;
@end

@implementation _SVXStoreDemoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);

  objc_storeStrong((id *)&self->_baseModel, 0);
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v5 = [SVXStoreDemo alloc];
    *(float *)&double v6 = self->_outputVolume;
    uint64_t v4 = [(SVXStoreDemo *)v5 initWithTranscriptID:self->_transcriptID languageCode:self->_languageCode gender:self->_gender outputVolume:v6];
    goto LABEL_5;
  }
  if ((*(unsigned char *)&self->_mutationFlags & 1) == 0)
  {
    uint64_t v4 = [(SVXStoreDemo *)baseModel copy];
LABEL_5:
    v7 = (SVXStoreDemo *)v4;
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_mutationFlags & 2) != 0)
  {
    int64_t transcriptID = self->_transcriptID;
    if ((*(unsigned char *)&self->_mutationFlags & 4) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    int64_t transcriptID = [(SVXStoreDemo *)baseModel transcriptID];
    if ((*(unsigned char *)&self->_mutationFlags & 4) != 0)
    {
LABEL_8:
      v9 = self->_languageCode;
      goto LABEL_11;
    }
  }
  v9 = [(SVXStoreDemo *)self->_baseModel languageCode];
LABEL_11:
  v10 = v9;
  if ((*(unsigned char *)&self->_mutationFlags & 8) != 0)
  {
    int64_t gender = self->_gender;
    if ((*(unsigned char *)&self->_mutationFlags & 0x10) != 0) {
      goto LABEL_13;
    }
LABEL_15:
    [(SVXStoreDemo *)self->_baseModel outputVolume];
    float outputVolume = v13;
    goto LABEL_16;
  }
  int64_t gender = [(SVXStoreDemo *)self->_baseModel gender];
  if ((*(unsigned char *)&self->_mutationFlags & 0x10) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  float outputVolume = self->_outputVolume;
LABEL_16:
  v14 = [SVXStoreDemo alloc];
  *(float *)&double v15 = outputVolume;
  v7 = [(SVXStoreDemo *)v14 initWithTranscriptID:transcriptID languageCode:v10 gender:gender outputVolume:v15];

LABEL_17:

  return v7;
}

- (void)setOutputVolume:(float)a3
{
  self->_float outputVolume = a3;
  *(unsigned char *)&self->_mutationFlags |= 0x11u;
}

- (void)setGender:(int64_t)a3
{
  self->_int64_t gender = a3;
  *(unsigned char *)&self->_mutationFlags |= 9u;
}

- (void)setLanguageCode:(id)a3
{
  *(unsigned char *)&self->_mutationFlags |= 5u;
}

- (void)setTranscriptID:(int64_t)a3
{
  self->_int64_t transcriptID = a3;
  *(unsigned char *)&self->_mutationFlags |= 3u;
}

- (_SVXStoreDemoMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXStoreDemoMutation;
  double v6 = [(_SVXStoreDemoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXStoreDemoMutation)init
{
  return [(_SVXStoreDemoMutation *)self initWithBaseModel:0];
}

@end