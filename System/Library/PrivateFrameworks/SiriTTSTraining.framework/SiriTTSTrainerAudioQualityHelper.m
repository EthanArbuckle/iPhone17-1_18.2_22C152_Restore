@interface SiriTTSTrainerAudioQualityHelper
+ (id)assessAudioQualityWithBuffers:(id)a3;
+ (id)assessAudioQualityWithPath:(id)a3;
+ (id)assessAudioQualityWithRate:(double)a3 samples:(const float *)a4 count:(unsigned int)a5;
@end

@implementation SiriTTSTrainerAudioQualityHelper

+ (id)assessAudioQualityWithRate:(double)a3 samples:(const float *)a4 count:(unsigned int)a5
{
  LODWORD(v11) = 1061997773;
  BYTE4(v11) = 1;
  v10[0] = a3;
  v10[1] = -1.50323917e10;
  __p[6] = *(void **)&a3;
  __p[8] = v11;
  __p[7] = (void *)vdup_n_s32(0x7FC00000u);
  uint64_t v6 = a5;
  v7 = operator new(0x10uLL);
  __p[1] = v7 + 2;
  __p[2] = v7 + 2;
  void *v7 = v6;
  v7[1] = a4;
  __p[0] = v7;
  assess_audio_quality((uint64_t *)__p, v10);
}

+ (id)assessAudioQualityWithBuffers:(id)a3
{
  __p = 0;
  v34 = 0;
  v35 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v4)
  {
    v5 = 0;
    uint64_t v6 = *(void *)v30;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v9 = [v8 format];
        [v9 sampleRate];
        double v11 = v10;

        unsigned int v12 = [v8 frameCapacity];
        v13 = [v8 floatChannelData];
        v14 = v13;
        uint64_t v15 = v12;
        if (v5 >= v35)
        {
          v16 = (char *)__p;
          uint64_t v17 = (v5 - (unsigned char *)__p) >> 4;
          unint64_t v18 = v17 + 1;
          if ((unint64_t)(v17 + 1) >> 60) {
            std::vector<float>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v19 = v35 - (unsigned char *)__p;
          if ((v35 - (unsigned char *)__p) >> 3 > v18) {
            unint64_t v18 = v19 >> 3;
          }
          if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v20 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v20 = v18;
          }
          if (v20)
          {
            if (v20 >> 60) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            v21 = (char *)operator new(16 * v20);
          }
          else
          {
            v21 = 0;
          }
          v22 = &v21[16 * v17];
          *(void *)v22 = v15;
          *((void *)v22 + 1) = *v14;
          if (v5 == v16)
          {
            v24 = v5;
            v23 = &v21[16 * v17];
          }
          else
          {
            v23 = &v21[16 * v17];
            do
            {
              *((_OWORD *)v23 - 1) = *((_OWORD *)v5 - 1);
              v23 -= 16;
              v5 -= 16;
            }
            while (v5 != v16);
            v24 = __p;
          }
          v5 = v22 + 16;
          __p = v23;
          v34 = v22 + 16;
          v35 = &v21[16 * v20];
          if (v24) {
            operator delete(v24);
          }
        }
        else
        {
          *(void *)v5 = v12;
          *((void *)v5 + 1) = *v13;
          v5 += 16;
        }
        v34 = v5;
      }
      id v4 = [v3 countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v4);
  }
  else
  {
    double v11 = 24000.0;
  }

  int v27 = 1061997773;
  char v28 = 1;
  v26[0] = v11;
  v26[1] = -1.50323917e10;
  assess_audio_quality((uint64_t *)&__p, v26);
}

+ (id)assessAudioQualityWithPath:(id)a3
{
  *(void *)&long long v14 = 0x40D7700000000000;
  *((void *)&v14 + 1) = 0xC20C0000C1E00000;
  LODWORD(v15) = 1061997773;
  BYTE4(v15) = 1;
  *(void *)&long long v12 = 0x40D7700000000000;
  uint64_t v13 = v15;
  *((int32x2_t *)&v12 + 1) = vdup_n_s32(0x7FC00000u);
  id v3 = a3;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v3 UTF8String]);
  assess_audio_quality((char *)__p, &v14, v11);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  id v4 = v3;
  std::string::basic_string[abi:ne180100]<0>(v7, (char *)[v4 UTF8String]);
  assess_audio_quality((char *)v7, &v12, (uint64_t *)__p);
  if (v8 < 0) {
    operator delete(v7[0]);
  }
  v5 = [SiriTTSTrainerAudioQualityAssessment alloc];
  -[SiriTTSTrainerAudioQualityAssessment initWithMetrics:unnormalized:]((uint64_t *)v5, v11, __p);
  std::__tree<std::__value_type<float,kaldi::MelBanks *>,std::__map_value_compare<float,std::__value_type<float,kaldi::MelBanks *>,std::less<float>,true>,std::allocator<std::__value_type<float,kaldi::MelBanks *>>>::destroy((uint64_t)__p, (void *)__p[1]);
  std::__tree<std::__value_type<float,kaldi::MelBanks *>,std::__map_value_compare<float,std::__value_type<float,kaldi::MelBanks *>,std::less<float>,true>,std::allocator<std::__value_type<float,kaldi::MelBanks *>>>::destroy((uint64_t)v11, (void *)v11[1]);

  return v5;
}

@end