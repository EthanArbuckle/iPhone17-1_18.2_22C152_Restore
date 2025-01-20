@interface SSRSpeakerProfileEmbedding
+ (BOOL)supportsSecureCoding;
- (NSData)embeddings;
- (NSString)siriSharedUserId;
- (SSRSpeakerProfileEmbedding)initWithCoder:(id)a3;
- (SSRSpeakerProfileEmbedding)initWithSiriSharedUserId:(id)a3 embeddings:(id)a4 numEmbedding:(unsigned int)a5 dimension:(unsigned int)a6 speakerRecognizerType:(unint64_t)a7;
- (unint64_t)speakerRecognizerType;
- (unsigned)dimension;
- (unsigned)numEmbedding;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SSRSpeakerProfileEmbedding

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddings, 0);

  objc_storeStrong((id *)&self->_siriSharedUserId, 0);
}

- (unint64_t)speakerRecognizerType
{
  return self->_speakerRecognizerType;
}

- (unsigned)dimension
{
  return self->_dimension;
}

- (unsigned)numEmbedding
{
  return self->_numEmbedding;
}

- (NSData)embeddings
{
  return self->_embeddings;
}

- (NSString)siriSharedUserId
{
  return self->_siriSharedUserId;
}

- (SSRSpeakerProfileEmbedding)initWithCoder:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x263F37FA8];
  v6 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315138;
    v24 = "-[SSRSpeakerProfileEmbedding initWithCoder:]";
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s init with coder:", (uint8_t *)&v23, 0xCu);
  }
  if ([v4 containsValueForKey:@"siriSharedUserId"])
  {
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"siriSharedUserId"];
    v8 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315394;
      v24 = "-[SSRSpeakerProfileEmbedding initWithCoder:]";
      __int16 v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s sharedUserId = %@", (uint8_t *)&v23, 0x16u);
    }
  }
  else
  {
    v7 = 0;
  }
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numEmbeddings"];
  uint64_t v10 = [v9 unsignedIntValue];

  v11 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315394;
    v24 = "-[SSRSpeakerProfileEmbedding initWithCoder:]";
    __int16 v25 = 1024;
    LODWORD(v26) = v10;
    _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Num Embeddings = %d", (uint8_t *)&v23, 0x12u);
  }
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dimension"];
  uint64_t v13 = [v12 unsignedIntValue];

  v14 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315394;
    v24 = "-[SSRSpeakerProfileEmbedding initWithCoder:]";
    __int16 v25 = 1024;
    LODWORD(v26) = v13;
    _os_log_impl(&dword_21C8A5000, v14, OS_LOG_TYPE_DEFAULT, "%s dimensions = %d", (uint8_t *)&v23, 0x12u);
  }
  if ([v4 containsValueForKey:@"embeddings"])
  {
    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"embeddings"];
  }
  else
  {
    v15 = 0;
  }
  v16 = *v5;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = v16;
    int v18 = [v15 length];
    int v23 = 136315394;
    v24 = "-[SSRSpeakerProfileEmbedding initWithCoder:]";
    __int16 v25 = 1024;
    LODWORD(v26) = v18;
    _os_log_impl(&dword_21C8A5000, v17, OS_LOG_TYPE_DEFAULT, "%s Embeddings = %d", (uint8_t *)&v23, 0x12u);
  }
  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recognitionType"];
  uint64_t v20 = [v19 unsignedIntValue];

  v21 = [(SSRSpeakerProfileEmbedding *)self initWithSiriSharedUserId:v7 embeddings:v15 numEmbedding:v10 dimension:v13 speakerRecognizerType:v20];
  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x263F37FA8];
  v6 = *MEMORY[0x263F37FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F37FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    v17 = "-[SSRSpeakerProfileEmbedding encodeWithCoder:]";
    _os_log_impl(&dword_21C8A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Encode with coder:", (uint8_t *)&v16, 0xCu);
  }
  siriSharedUserId = self->_siriSharedUserId;
  if (siriSharedUserId)
  {
    v8 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315394;
      v17 = "-[SSRSpeakerProfileEmbedding encodeWithCoder:]";
      __int16 v18 = 2112;
      v19 = siriSharedUserId;
      _os_log_impl(&dword_21C8A5000, v8, OS_LOG_TYPE_DEFAULT, "%s SharedUserId = %@", (uint8_t *)&v16, 0x16u);
      siriSharedUserId = self->_siriSharedUserId;
    }
    [v4 encodeObject:siriSharedUserId forKey:@"siriSharedUserId"];
  }
  embeddings = self->_embeddings;
  if (embeddings)
  {
    os_log_t v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      int v12 = [(NSData *)embeddings length];
      int v16 = 136315394;
      v17 = "-[SSRSpeakerProfileEmbedding encodeWithCoder:]";
      __int16 v18 = 1024;
      LODWORD(v19) = v12;
      _os_log_impl(&dword_21C8A5000, v11, OS_LOG_TYPE_DEFAULT, "%s Embeddings = %d", (uint8_t *)&v16, 0x12u);

      embeddings = self->_embeddings;
    }
    [v4 encodeObject:embeddings forKey:@"embeddings"];
  }
  uint64_t v13 = [NSNumber numberWithUnsignedInt:self->_numEmbedding];
  [v4 encodeObject:v13 forKey:@"numEmbeddings"];

  v14 = [NSNumber numberWithUnsignedInt:self->_dimension];
  [v4 encodeObject:v14 forKey:@"dimension"];

  v15 = [NSNumber numberWithUnsignedInteger:self->_speakerRecognizerType];
  [v4 encodeObject:v15 forKey:@"recognitionType"];
}

- (SSRSpeakerProfileEmbedding)initWithSiriSharedUserId:(id)a3 embeddings:(id)a4 numEmbedding:(unsigned int)a5 dimension:(unsigned int)a6 speakerRecognizerType:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SSRSpeakerProfileEmbedding;
  v15 = [(SSRSpeakerProfileEmbedding *)&v18 init];
  int v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_siriSharedUserId, a3);
    objc_storeStrong((id *)&v16->_embeddings, a4);
    v16->_numEmbedding = a5;
    v16->_dimension = a6;
    v16->_speakerRecognizerType = a7;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end