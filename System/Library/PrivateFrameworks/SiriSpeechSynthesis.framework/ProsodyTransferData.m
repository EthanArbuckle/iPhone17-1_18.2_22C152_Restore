@interface ProsodyTransferData
- (AudioStreamBasicDescription)asbd;
- (NSData)waveData;
- (NSString)userVoiceProfileUrl;
- (ProsodyTransferData)init;
- (UserVoiceProfile)userVoiceProfile;
- (void)setAsbd:(AudioStreamBasicDescription *)a3;
- (void)setUserVoiceProfile:(id)a3;
- (void)setUserVoiceProfileUrl:(id)a3;
- (void)setWaveData:(id)a3;
@end

@implementation ProsodyTransferData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userVoiceProfileUrl, 0);
  objc_storeStrong((id *)&self->_userVoiceProfile, 0);
  objc_storeStrong((id *)&self->_waveData, 0);
}

- (void)setUserVoiceProfileUrl:(id)a3
{
}

- (NSString)userVoiceProfileUrl
{
  return self->_userVoiceProfileUrl;
}

- (void)setUserVoiceProfile:(id)a3
{
}

- (UserVoiceProfile)userVoiceProfile
{
  return self->_userVoiceProfile;
}

- (void)setWaveData:(id)a3
{
}

- (NSData)waveData
{
  return self->_waveData;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  long long v3 = *(_OWORD *)&a3->mSampleRate;
  long long v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(void *)&self->_asbd.mBitsPerChannel = *(void *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_asbd.mSampleRate = v3;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
}

- (AudioStreamBasicDescription)asbd
{
  long long v3 = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self->mBitsPerChannel;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(void *)&retstr->mBitsPerChannel = *(void *)&self[1].mBytesPerFrame;
  return self;
}

- (ProsodyTransferData)init
{
  v3.receiver = self;
  v3.super_class = (Class)ProsodyTransferData;
  result = [(ProsodyTransferData *)&v3 init];
  if (result) {
    result->_asbd.mSampleRate = 16000.0;
  }
  return result;
}

@end