@interface SVXAudioFileDecoder
- (double)audioPlaybackDuration:(id)a3;
@end

@implementation SVXAudioFileDecoder

- (double)audioPlaybackDuration:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  AudioFileID outAudioFile = 0;
  double v3 = 0.0;
  if (!AudioFileOpenWithCallbacks(a3, (AudioFile_ReadProc)_audioFileReadData, 0, (AudioFile_GetSizeProc)_audioFileGetDataSize, 0, 0, &outAudioFile))
  {
    double outPropertyData = 0.0;
    UInt32 ioDataSize = 8;
    if (AudioFileGetProperty(outAudioFile, 0x65647572u, &ioDataSize, &outPropertyData)) {
      double v3 = 0.0;
    }
    else {
      double v3 = outPropertyData;
    }
  }
  if (outAudioFile) {
    AudioFileClose(outAudioFile);
  }
  return v3;
}

@end