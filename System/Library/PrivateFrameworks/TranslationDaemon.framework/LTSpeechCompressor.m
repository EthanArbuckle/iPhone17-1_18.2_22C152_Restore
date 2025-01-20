@interface LTSpeechCompressor
@end

@implementation LTSpeechCompressor

uint64_t __42___LTSpeechCompressor_addAudioSampleData___block_invoke(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v7 = [WeakRetained[3] length] - *((_DWORD *)WeakRetained + 10);
    *(_DWORD *)(a3 + 8) = 1;
    if (*a2 <= v7 >> 1)
    {
      uint64_t v9 = [v6[3] mutableBytes];
      uint64_t v8 = 0;
      v10 = (char *)v6[5];
      *(void *)(a3 + 16) = &v10[v9];
      uint64_t v11 = 2 * *a2;
      *(_DWORD *)(a3 + 12) = v11;
      v6[5] = &v10[v11];
    }
    else
    {
      *a2 = 0;
      *(void *)(a3 + 16) = 0;
      uint64_t v8 = 1836086393;
      *(_DWORD *)(a3 + 12) = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end