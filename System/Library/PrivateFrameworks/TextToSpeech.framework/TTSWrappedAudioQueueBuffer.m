@interface TTSWrappedAudioQueueBuffer
- (AudioQueueBuffer)aqBuffer;
- (AudioTimeStamp)queuedTimeStamp;
- (id)completionHandler;
- (unint64_t)byteSize;
- (void)setAqBuffer:(AudioQueueBuffer *)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setQueuedTimeStamp:(AudioTimeStamp *)a3;
@end

@implementation TTSWrappedAudioQueueBuffer

- (AudioQueueBuffer)aqBuffer
{
  return self->_aqBuffer;
}

- (void)setAqBuffer:(AudioQueueBuffer *)a3
{
  self->_aqBuffer = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (AudioTimeStamp)queuedTimeStamp
{
  long long v3 = *(_OWORD *)&self->mSMPTETime.mHours;
  *(_OWORD *)&retstr->mSampleTime = *(_OWORD *)&self->mSMPTETime.mSubframes;
  *(_OWORD *)&retstr->mRateScalar = v3;
  long long v4 = *(_OWORD *)&self[1].mRateScalar;
  *(_OWORD *)&retstr->mSMPTETime.mSubframes = *(_OWORD *)&self[1].mSampleTime;
  *(_OWORD *)&retstr->mSMPTETime.mHours = v4;
  return self;
}

- (void)setQueuedTimeStamp:(AudioTimeStamp *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleTime;
  long long v4 = *(_OWORD *)&a3->mRateScalar;
  long long v5 = *(_OWORD *)&a3->mSMPTETime.mHours;
  *(_OWORD *)&self->_queuedTimeStamp.mSMPTETime.mSubframes = *(_OWORD *)&a3->mSMPTETime.mSubframes;
  *(_OWORD *)&self->_queuedTimeStamp.mSMPTETime.mHours = v5;
  *(_OWORD *)&self->_queuedTimeStamp.mSampleTime = v3;
  *(_OWORD *)&self->_queuedTimeStamp.mRateScalar = v4;
}

- (unint64_t)byteSize
{
  return self->_byteSize;
}

- (void).cxx_destruct
{
}

@end