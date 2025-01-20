@interface SVXSpeechSynthesizerAudioData
- (SVXSpeechSynthesizerAudioData)initWithAudioChunkData:(id)a3 audioChunkIndex:(unint64_t)a4;
- (SiriTTSAudioData)audioChunkData;
- (unint64_t)audioChunkIndex;
@end

@implementation SVXSpeechSynthesizerAudioData

- (void).cxx_destruct
{
}

- (unint64_t)audioChunkIndex
{
  return self->_audioChunkIndex;
}

- (SiriTTSAudioData)audioChunkData
{
  return self->_audioChunkData;
}

- (SVXSpeechSynthesizerAudioData)initWithAudioChunkData:(id)a3 audioChunkIndex:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SVXSpeechSynthesizerAudioData;
  v8 = [(SVXSpeechSynthesizerAudioData *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_audioChunkData, a3);
    v9->_audioChunkIndex = a4;
  }

  return v9;
}

@end