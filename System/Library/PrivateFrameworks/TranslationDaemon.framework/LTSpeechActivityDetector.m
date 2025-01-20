@interface LTSpeechActivityDetector
@end

@implementation LTSpeechActivityDetector

void __48___LTSpeechActivityDetector_addSpeechAudioData___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) length] >> 1;
  id v3 = objc_alloc(MEMORY[0x263EF93B0]);
  v4 = [*(id *)(a1 + 40) nativeAudioFormat];
  id v5 = (id)[v3 initWithPCMFormat:v4 frameCapacity:v2];

  [v5 setFrameLength:v2];
  memcpy(*(void **)[v5 int16ChannelData], (const void *)objc_msgSend(*(id *)(a1 + 32), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"));
  [*(id *)(*(void *)(a1 + 40) + 16) analyzeAudioBuffer:v5 atAudioFramePosition:*(void *)(*(void *)(a1 + 40) + 24)];
  *(void *)(*(void *)(a1 + 40) + 24) += v2;
}

@end