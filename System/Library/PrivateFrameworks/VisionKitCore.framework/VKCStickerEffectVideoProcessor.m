@interface VKCStickerEffectVideoProcessor
+ (int)_transcodeSequenceData:(id)a3 effect:(id)a4 maxDimension:(unint64_t)a5 outputData:(id *)a6 progressHandler:(id)a7;
+ (void)applyEffect:(id)a3 toImageSequence:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6;
@end

@implementation VKCStickerEffectVideoProcessor

+ (void)applyEffect:(id)a3 toImageSequence:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, id, void))a6;
  id v14 = 0;
  [a1 _transcodeSequenceData:v11 effect:v10 maxDimension:50000 outputData:&v14 progressHandler:v12];
  v13[2](v13, v14, 0);
}

+ (int)_transcodeSequenceData:(id)a3 effect:(id)a4 maxDimension:(unint64_t)a5 outputData:(id *)a6 progressHandler:(id)a7
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a7;
  v29 = 0;
  int Container = CMPhotoDecompressionSessionCreate();
  if (Container)
  {
    fprintf((FILE *)*MEMORY[0x1E4F143C8], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 82, Container);
  }
  else
  {
    v28 = 0;
    int Container = CMPhotoDecompressionSessionCreateContainer();
    if (Container)
    {
      fprintf((FILE *)*MEMORY[0x1E4F143C8], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 89, Container);
    }
    else
    {
      v27 = 0;
      int Container = CMPhotoDecompressionContainerCreateSequenceContainer();
      if (Container)
      {
        fprintf((FILE *)*MEMORY[0x1E4F143C8], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 95, Container);
      }
      else
      {
        v26 = 0;
        int Container = CMPhotoCompressionSessionCreate();
        if (Container)
        {
          fprintf((FILE *)*MEMORY[0x1E4F143C8], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 102, Container);
        }
        else
        {
          uint64_t v14 = *MEMORY[0x1E4F56048];
          v30[0] = *MEMORY[0x1E4F56058];
          v30[1] = v14;
          v31[0] = &unk_1F357D9B0;
          v31[1] = &unk_1F357D9C8;
          v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
          int Container = CMPhotoCompressionSessionOpenEmptyContainer();
          if (Container)
          {
            fprintf((FILE *)*MEMORY[0x1E4F143C8], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 109, Container);
          }
          else
          {
            uint64_t v25 = 0;
            int Container = CMPhotoCompressionSessionStartImageSequence();
            if (Container)
            {
              fprintf((FILE *)*MEMORY[0x1E4F143C8], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 112, Container);
            }
            else
            {
              uint64_t v24 = 0;
              int Container = CMPhotoDecompressionContainerGetImageCountWithOptions();
              if (Container)
              {
                fprintf((FILE *)*MEMORY[0x1E4F143C8], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 115, Container);
              }
              else
              {
                CFDictionaryRef theDict = 0;
                int Container = CMPhotoDecompressionContainerCreateDictionaryDescription();
                if (Container)
                {
                  fprintf((FILE *)*MEMORY[0x1E4F143C8], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 118, Container);
                }
                else
                {
                  v19 = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E4F56258]);
                  if (v19)
                  {
                    int Container = CMPhotoCompressionSessionEndImageSequence();
                    if (Container)
                    {
                      fprintf((FILE *)*MEMORY[0x1E4F143C8], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 204, Container);
                    }
                    else
                    {
                      CFTypeRef cf = 0;
                      int Container = CMPhotoCompressionSessionCloseContainerAndCopyBacking();
                      if (Container)
                      {
                        fprintf((FILE *)*MEMORY[0x1E4F143C8], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 209, Container);
                      }
                      else
                      {
                        if (v12 && v24 >= 1)
                        {
                          v20[0] = MEMORY[0x1E4F143A8];
                          v20[1] = 3221225472;
                          v20[2] = __104__VKCStickerEffectVideoProcessor__transcodeSequenceData_effect_maxDimension_outputData_progressHandler___block_invoke_2;
                          v20[3] = &unk_1E6BF0ED0;
                          id v21 = v12;
                          vk_dispatchMainAfterDelay(v20, 0.0);
                        }
                        v17 = (void *)cf;
                        if (cf) {
                          v17 = (void *)CFRetain(cf);
                        }
                        id v18 = *a6;
                        *a6 = v17;
                      }
                      CF<__CFData const*>::~CF(&cf);
                    }
                  }
                  else
                  {
                    int Container = -18;
                    fprintf((FILE *)*MEMORY[0x1E4F143C8], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 121, -18);
                  }
                }
                CF<__CFDictionary const*>::~CF((const void **)&theDict);
              }
            }
          }
        }
        CF<CMPhotoCompressionSession *>::~CF(&v26);
      }
      CF<CMPhotoDecompressionContainer *>::~CF(&v27);
    }
    CF<CMPhotoDecompressionContainer *>::~CF(&v28);
  }
  CF<CMPhotoDecompressionSession *>::~CF(&v29);

  return Container;
}

void __104__VKCStickerEffectVideoProcessor__transcodeSequenceData_effect_maxDimension_outputData_progressHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __104__VKCStickerEffectVideoProcessor__transcodeSequenceData_effect_maxDimension_outputData_progressHandler___block_invoke_51(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(double))(result + 16))((double)(uint64_t)a1[5] / (double)(a1[6] - 1));
  }
  return result;
}

uint64_t __104__VKCStickerEffectVideoProcessor__transcodeSequenceData_effect_maxDimension_outputData_progressHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(double))(result + 16))(1.0);
  }
  return result;
}

@end