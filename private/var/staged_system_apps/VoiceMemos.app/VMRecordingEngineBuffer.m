@interface VMRecordingEngineBuffer
+ (id)bufferWithAudioBuffer:(id)a3 audioTime:(id)a4;
- (AVAudioPCMBuffer)audioBuffer;
- (AVAudioTime)audioTime;
- (VMRecordingEngineBuffer)initWithAudioBuffer:(id)a3 audioTime:(id)a4;
- (void)setAudioBuffer:(id)a3;
- (void)setAudioTime:(id)a3;
@end

@implementation VMRecordingEngineBuffer

- (VMRecordingEngineBuffer)initWithAudioBuffer:(id)a3 audioTime:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VMRecordingEngineBuffer;
  v8 = [(VMRecordingEngineBuffer *)&v14 init];
  if (v8)
  {
    v9 = (AVAudioPCMBuffer *)[v6 copy];
    audioBuffer = v8->_audioBuffer;
    v8->_audioBuffer = v9;

    uint64_t v11 = [v7 rc_copyFromTimeStamp];
    audioTime = v8->_audioTime;
    v8->_audioTime = (AVAudioTime *)v11;
  }
  return v8;
}

+ (id)bufferWithAudioBuffer:(id)a3 audioTime:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithAudioBuffer:v7 audioTime:v6];

  return v8;
}

- (AVAudioPCMBuffer)audioBuffer
{
  return self->_audioBuffer;
}

- (void)setAudioBuffer:(id)a3
{
}

- (AVAudioTime)audioTime
{
  return self->_audioTime;
}

- (void)setAudioTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioTime, 0);

  objc_storeStrong((id *)&self->_audioBuffer, 0);
}

@end