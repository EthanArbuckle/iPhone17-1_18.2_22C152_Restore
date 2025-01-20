@interface FlickerResourceArbiterClientDelegate
- (FlickerResourceArbiterClientDelegate)init;
- (H16ISPFlickerDetectorContext)flickerContext;
- (ResourceArbiterClient)arbiterClient;
- (void)cleanup;
- (void)releaseResourceAccess;
- (void)requestResourceAccess;
- (void)resourceAccessResult:(BOOL)a3;
- (void)resourceAccessRevoked;
- (void)setFlickerContext:(H16ISPFlickerDetectorContext *)a3;
@end

@implementation FlickerResourceArbiterClientDelegate

- (FlickerResourceArbiterClientDelegate)init
{
  v5.receiver = self;
  v5.super_class = (Class)FlickerResourceArbiterClientDelegate;
  v2 = [(FlickerResourceArbiterClientDelegate *)&v5 init];
  if (v2)
  {
    v3 = (ResourceArbiterClient *)[objc_alloc((Class)ResourceArbiterClient) initWithID:1];
    v2->_arbiterClient = v3;
    [(ResourceArbiterClient *)v3 setDelegate:v2];
    v2->_flickerContext = 0;
  }
  return v2;
}

- (void)cleanup
{
  self->_flickerContext = 0;
  [(FlickerResourceArbiterClientDelegate *)self releaseResourceAccess];

  os_log_t v3 = (os_log_t)off_1002BBC70;
  if (off_1002BBC70 == &_os_log_default)
  {
    os_log_t v3 = os_log_create("com.apple.isp", "general");
    off_1002BBC70 = v3;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000741EC();
  }
}

- (void)requestResourceAccess
{
  if (self->_arbiterClient) {
    [(ResourceArbiterClient *)self->_arbiterClient asynchRequestResourceAccess:1];
  }
  else {
    [(FlickerResourceArbiterClientDelegate *)self resourceAccessResult:1];
  }
  os_log_t v2 = (os_log_t)off_1002BBC70;
  if (off_1002BBC70 == &_os_log_default)
  {
    os_log_t v2 = os_log_create("com.apple.isp", "general");
    off_1002BBC70 = v2;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100074220();
  }
}

- (void)releaseResourceAccess
{
  [(ResourceArbiterClient *)self->_arbiterClient releaseResourceAccess];
  os_log_t v2 = (os_log_t)off_1002BBC70;
  if (off_1002BBC70 == &_os_log_default)
  {
    os_log_t v2 = os_log_create("com.apple.isp", "general");
    off_1002BBC70 = v2;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100074254();
  }
}

- (void)resourceAccessResult:(BOOL)a3
{
  if (a3)
  {
    v4 = &unk_1002BB000;
    os_log_t v5 = (os_log_t)off_1002BBC70;
    if (off_1002BBC70 == &_os_log_default)
    {
      os_log_t v5 = os_log_create("com.apple.isp", "general");
      off_1002BBC70 = v5;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = 1;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FlickerDetector: ArbiterClient resource access granted=%d\n\n", buf, 8u);
    }
    flickerContext = self->_flickerContext;
    if (flickerContext)
    {
      p_var23 = &flickerContext->var23;
      pthread_mutex_lock(&flickerContext->var23);
      if (flickerContext->var22 || (p_var2 = &flickerContext->var2, flickerContext->var2))
      {
LABEL_9:
        pthread_mutex_unlock(p_var23);
        return;
      }
      *(_OWORD *)&inDesc.componentType = xmmword_1000824A0;
      inDesc.componentFlagsMask = 0;
      Next = AudioComponentFindNext(0, &inDesc);
      if (!Next)
      {
        os_log_t v13 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v13 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v13;
        }
        uint64_t v12 = 3758097136;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100074390();
        }
        goto LABEL_44;
      }
      if (AudioComponentInstanceNew(Next, &flickerContext->var2))
      {
        os_log_t v11 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v11 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v11;
        }
        uint64_t v12 = 3758097084;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100074D24();
        }
        goto LABEL_44;
      }
      bzero(buf, 0x28uLL);
      var0 = flickerContext->var0;
      *(void *)buf = **((void **)flickerContext->var0 + 1);
      if (*(_DWORD *)var0 == 1) {
        int v15 = 1;
      }
      else {
        int v15 = 2;
      }
      unsigned int v118 = v15;
      int v119 = 32;
      int v116 = 1;
      int v117 = 4 * v15;
      int v115 = 4 * v15;
      uint64_t v114 = 0x96C70636DLL;
      if (AudioUnitSetProperty(flickerContext->var2, 8u, 2u, 1u, buf, 0x28u))
      {
        os_log_t v16 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v16 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v16;
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_100074CBC();
        }
LABEL_43:
        uint64_t v12 = 3758097084;
LABEL_44:
        sub_1000174F0((uint64_t)flickerContext);
        os_log_t v19 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v19 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v19;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_100074324(v12, v19, v20, v21, v22, v23, v24, v25);
        }
        goto LABEL_48;
      }
      if (AudioUnitSetProperty(flickerContext->var2, 0xEu, 0, 0, &flickerContext->var4, 4u))
      {
        os_log_t v17 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v17 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v17;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_100074C54();
        }
        goto LABEL_43;
      }
      UInt32 ioDataSize = 4;
      if (AudioUnitGetProperty(*p_var2, 0xEu, 0, 0, &flickerContext->var4, &ioDataSize))
      {
        os_log_t v18 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v18 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v18;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_100074BEC();
        }
        goto LABEL_43;
      }
      inData[1] = flickerContext;
      switch(*(_DWORD *)flickerContext->var0)
      {
        case 1:
          v27 = sub_100017610;
          break;
        case 2:
          v27 = sub_100017C04;
          break;
        case 6:
          v27 = sub_100018CCC;
          break;
        case 9:
          v27 = sub_1000197B8;
          break;
        case 0xA:
          v27 = sub_10001A1A8;
          break;
        default:
          v27 = sub_10001832C;
          break;
      }
      inData[0] = v27;
      if (AudioUnitSetProperty(*p_var2, 0x7D5u, 0, 0, inData, 0x10u))
      {
        os_log_t v28 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v28 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v28;
        }
        uint64_t v12 = 3758097084;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_100074B84();
        }
        goto LABEL_44;
      }
      OSStatus v29 = AudioUnitInitialize(*p_var2);
      if (v29)
      {
        OSStatus v30 = v29;
        os_log_t v31 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v31 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v31;
        }
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
          sub_100074B1C();
        }
        if (v30 == 1852794999)
        {
          os_log_t v32 = (os_log_t)off_1002BBC70;
          if (off_1002BBC70 == &_os_log_default)
          {
            os_log_t v32 = os_log_create("com.apple.isp", "general");
            off_1002BBC70 = v32;
          }
          uint64_t v12 = 3758097088;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_100074AE8();
          }
        }
        else
        {
          uint64_t v12 = 3758097084;
        }
        goto LABEL_44;
      }
      if (AudioUnitSetProperty(flickerContext->var2, 0x7E6u, 1u, 1u, &flickerContext->var19, 4u))
      {
        os_log_t v33 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v33 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v33;
        }
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_100074A64();
        }
      }
      UInt32 ioDataSize = 40;
      if (AudioUnitGetProperty(flickerContext->var2, 8u, 2u, 1u, &flickerContext->var3, &ioDataSize))
      {
        os_log_t v34 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v34 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v34;
        }
        uint64_t v12 = 3758097084;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_1000749FC();
        }
        goto LABEL_44;
      }
      if (bcmp(&flickerContext->var3, buf, 0x28uLL))
      {
        os_log_t v35 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v35 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v35;
        }
        uint64_t v12 = 3758097084;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_1000749C8();
        }
        goto LABEL_44;
      }
      if ((flickerContext->var3.mFormatFlags & 1) != 0 && flickerContext->var3.mBytesPerFrame != 4 * v118)
      {
        os_log_t v71 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v71 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v71;
        }
        uint64_t v12 = 3758097084;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR)) {
          sub_100074958((uint64_t)&flickerContext->var3.mBytesPerFrame, v71, v72, v73, v74, v75, v76, v77);
        }
        goto LABEL_44;
      }
      v36 = (double *)*((void *)flickerContext->var0 + 1);
      double v37 = *v36;
      double v38 = v36[1];
      double v39 = v36[2];
      v40 = (photometer_flicker_result *)malloc_type_calloc(1uLL, 0x110uLL, 0x1000040368141FCuLL);
      int v41 = (int)(log2((double)(v39* (double)(2 * (flickerContext->var3.mSampleRate * 0.125))/ v37)+ -0.5)+ 1.0);
      flickerContext->var16 = v41;
      p_var16 = &flickerContext->var16;
      flickerContext->var18.var6 = v40;
      unint64_t mBitsPerChannel = flickerContext->var3.mBitsPerChannel;
      size_t mBytesPerFrame = flickerContext->var3.mBytesPerFrame;
      size_t count = (1 << v41);
      unsigned int v45 = (v37 * (double)count / v39 * 0.5);
      v46 = malloc_type_calloc(v45, mBytesPerFrame, 0xDD5A25E2uLL);
      flickerContext->var5.mData = v46;
      if (!v46)
      {
        os_log_t v69 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v69 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v69;
        }
        uint64_t v70 = 3758097085;
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
          sub_100074430();
        }
        goto LABEL_158;
      }
      flickerContext->var5.mDataByteSize = mBytesPerFrame * v45;
      int v47 = 2 * v45;
      v48 = malloc_type_calloc(2 * v45, mBytesPerFrame, 0xF17B5014uLL);
      flickerContext->var6.mData = v48;
      if (!v48)
      {
        os_log_t v78 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v78 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v78;
        }
        uint64_t v70 = 3758097085;
        if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
          sub_100074498();
        }
        goto LABEL_158;
      }
      flickerContext->var6.mDataByteSize = v47 * mBytesPerFrame;
      size_t v49 = mBitsPerChannel >> 3;
      v50 = malloc_type_calloc(count, v49, 0x80B47EEEuLL);
      flickerContext->var10.mData = v50;
      if (!v50)
      {
        os_log_t v79 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v79 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v79;
        }
        uint64_t v70 = 3758097085;
        if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR)) {
          sub_100074500();
        }
        goto LABEL_158;
      }
      v51 = malloc_type_calloc(count, v49, 0x1512EAD1uLL);
      flickerContext->var11.mData = v51;
      if (!v51)
      {
        os_log_t v80 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v80 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v80;
        }
        uint64_t v70 = 3758097085;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR)) {
          sub_100074568();
        }
        goto LABEL_158;
      }
      flickerContext->var10.mDataByteSize = v49 << v41;
      flickerContext->var11.mDataByteSize = v49 << v41;
      v52 = malloc_type_calloc((v38 * (double)v45 / v37), v49, 0xF265BEBFuLL);
      flickerContext->var12.mData = v52;
      if (!v52)
      {
        os_log_t v81 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v81 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v81;
        }
        uint64_t v70 = 3758097085;
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
          sub_1000745D0();
        }
        goto LABEL_158;
      }
      flickerContext->var12.mDataByteSize = v49 * (v38 * (double)v45 / v37);
      if (*(_DWORD *)flickerContext->var0 != 1)
      {
        v53 = malloc_type_calloc(2 * v45, v49, 0xDB7BE8E4uLL);
        flickerContext->var8.mData = v53;
        if (!v53)
        {
          os_log_t v83 = (os_log_t)off_1002BBC70;
          if (off_1002BBC70 == &_os_log_default)
          {
            os_log_t v83 = os_log_create("com.apple.isp", "general");
            off_1002BBC70 = v83;
          }
          uint64_t v70 = 3758097085;
          if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
            sub_100074888();
          }
          goto LABEL_158;
        }
        flickerContext->var8.mDataByteSize = v47 * v49;
        v54 = malloc_type_calloc(2 * v45, v49, 0xA48A8574uLL);
        flickerContext->var9.mData = v54;
        if (!v54)
        {
          os_log_t v92 = (os_log_t)off_1002BBC70;
          if (off_1002BBC70 == &_os_log_default)
          {
            os_log_t v92 = os_log_create("com.apple.isp", "general");
            off_1002BBC70 = v92;
          }
          uint64_t v70 = 3758097085;
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR)) {
            sub_1000748F0();
          }
          goto LABEL_158;
        }
        flickerContext->var9.mDataByteSize = v47 * v49;
      }
      size_t v55 = (count + 2);
      v56 = malloc_type_calloc(v55, v49, 0x9E813901uLL);
      flickerContext->var13.mData = v56;
      if (v56)
      {
        flickerContext->var13.mDataByteSize = v55 * v49;
        v57 = (CPastFlickerHistory *)malloc_type_calloc(1uLL, 0x14CuLL, 0x10000403F9E400DuLL);
        flickerContext->var15 = v57;
        if (v57)
        {
          *((_DWORD *)v57 + 2) = 0;
          *(void *)v57 = 5;
          vDSP_Length v58 = *p_var16;
          if ((int)v58 >= 4 && (FFTSetup fftsetup = vDSP_create_fftsetup(v58, 0), (flickerContext->var17 = fftsetup) != 0))
          {
            if (*(_DWORD *)flickerContext->var0 == 1)
            {
LABEL_162:
              v4 = &unk_1002BB000;
LABEL_48:
              if (*p_var2 && AudioOutputUnitStart(*p_var2))
              {
                os_log_t v26 = (os_log_t)*((void *)v4 + 398);
                if (v26 == (os_log_t)&_os_log_default)
                {
                  os_log_t v26 = os_log_create("com.apple.isp", "general");
                  *((void *)v4 + 398) = v26;
                }
                if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                  sub_1000742BC();
                }
              }
              goto LABEL_9;
            }
            v60 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(1uLL, 0x340uLL, 0x1090040C959C1BCuLL);
            flickerContext->var26 = v60;
            if (v60)
            {
              size_t v61 = ((112 << v41) + 4096);
              flickerContext->var14.mDataByteSize = v61;
              p_mDataByteSize = &flickerContext->var14.mDataByteSize;
              v63 = malloc_type_calloc(1uLL, v61, 0x1A70811BuLL);
              flickerContext->var14.mData = v63;
              if (v63)
              {
                float v64 = -0.389;
                float v65 = -0.3895;
                switch(*(_DWORD *)flickerContext->var0)
                {
                  case 3:
                    break;
                  case 4:
                    float v64 = -19.021;
                    float v65 = -18.175;
                    break;
                  case 5:
                    float v64 = -24.91;
                    float v65 = -25.06;
                    break;
                  case 6:
                  case 9:
                  case 0xA:
                    sub_100037CA4((uint64_t)flickerContext->var32, (uint64_t)flickerContext->var33, (uint64_t)flickerContext->var26 + 716);
                    float v65 = 0.0;
                    if (*(_DWORD *)flickerContext->var0 == 10)
                    {
                      var26 = flickerContext->var26;
                      v67.i32[0] = *((_DWORD *)var26 + 186);
                      if (v67.f32[0] < -7130316.8)
                      {
                        v67.i32[1] = *((_DWORD *)var26 + 187);
                        v67.i64[1] = *((void *)var26 + 94);
                        float32x4_t v68 = (float32x4_t)vdupq_n_s32(0x3F333333u);
                        *(float32x4_t *)((char *)var26 + 744) = vmulq_f32(v67, v68);
                        *(float32x4_t *)((char *)var26 + 760) = vmulq_f32(*(float32x4_t *)((char *)var26 + 760), v68);
                        *((float32x2_t *)var26 + 97) = vmul_f32(*(float32x2_t *)((char *)var26 + 776), *(float32x2_t *)v68.f32);
                        *(float32x2_t *)((char *)var26 + 716) = vdiv_f32(*(float32x2_t *)((char *)var26 + 716), *(float32x2_t *)v68.f32);
                      }
                    }
                    goto LABEL_176;
                  case 7:
                    float v65 = -0.6268;
                    float v64 = -0.6268;
                    break;
                  default:
                    float v65 = 0.0;
LABEL_176:
                    float v64 = 0.0;
                    break;
                }
                sub_1000354B8((uint64_t)flickerContext->var26, (int)v37, (int)(v37 / v39), count, count >> 1, (uint64_t)flickerContext->var14.mData, v65, v64);
                goto LABEL_162;
              }
              os_log_t v108 = (os_log_t)off_1002BBC70;
              if (off_1002BBC70 == &_os_log_default)
              {
                os_log_t v108 = os_log_create("com.apple.isp", "general");
                off_1002BBC70 = v108;
              }
              if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR)) {
                sub_10007480C((uint64_t)p_mDataByteSize, v49, v108);
              }
              uint64_t v70 = 3758097085;
              UInt32 *p_mDataByteSize = 0;
            }
            else
            {
              os_log_t v100 = (os_log_t)off_1002BBC70;
              if (off_1002BBC70 == &_os_log_default)
              {
                os_log_t v100 = os_log_create("com.apple.isp", "general");
                off_1002BBC70 = v100;
              }
              uint64_t v70 = 3758097085;
              if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
                sub_100074798(v100, v101, v102, v103, v104, v105, v106, v107);
              }
            }
          }
          else
          {
            os_log_t v84 = (os_log_t)off_1002BBC70;
            if (off_1002BBC70 == &_os_log_default)
            {
              os_log_t v84 = os_log_create("com.apple.isp", "general");
              off_1002BBC70 = v84;
            }
            uint64_t v70 = 3758097086;
            if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
              sub_100074728((uint64_t)p_var16, v84, v85, v86, v87, v88, v89, v90);
            }
          }
        }
        else
        {
          os_log_t v91 = (os_log_t)off_1002BBC70;
          if (off_1002BBC70 == &_os_log_default)
          {
            os_log_t v91 = os_log_create("com.apple.isp", "general");
            off_1002BBC70 = v91;
          }
          uint64_t v70 = 3758097085;
          if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR)) {
            sub_1000746C0();
          }
        }
      }
      else
      {
        os_log_t v82 = (os_log_t)off_1002BBC70;
        if (off_1002BBC70 == &_os_log_default)
        {
          os_log_t v82 = os_log_create("com.apple.isp", "general");
          off_1002BBC70 = v82;
        }
        uint64_t v70 = 3758097085;
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
          sub_100074638(v55, v49, v82);
        }
      }
LABEL_158:
      os_log_t v93 = (os_log_t)off_1002BBC70;
      if (off_1002BBC70 == &_os_log_default)
      {
        os_log_t v93 = os_log_create("com.apple.isp", "general");
        off_1002BBC70 = v93;
      }
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR)) {
        sub_1000743C4(v70, v93, v94, v95, v96, v97, v98, v99);
      }
      goto LABEL_162;
    }
    os_log_t v9 = (os_log_t)off_1002BBC70;
    if (off_1002BBC70 == &_os_log_default)
    {
      os_log_t v9 = os_log_create("com.apple.isp", "general");
      off_1002BBC70 = v9;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100074288();
    }
  }
}

- (void)resourceAccessRevoked
{
  os_log_t v3 = (os_log_t)off_1002BBC70;
  if (off_1002BBC70 == &_os_log_default)
  {
    os_log_t v3 = os_log_create("com.apple.isp", "general");
    off_1002BBC70 = v3;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FlickerDetector: ArbiterClient resource access revoked \n\n", v4, 2u);
  }
  sub_100016E24((uint64_t)self->_flickerContext);
  [(FlickerResourceArbiterClientDelegate *)self releaseResourceAccess];
}

- (ResourceArbiterClient)arbiterClient
{
  return self->_arbiterClient;
}

- (H16ISPFlickerDetectorContext)flickerContext
{
  return self->_flickerContext;
}

- (void)setFlickerContext:(H16ISPFlickerDetectorContext *)a3
{
  self->_flickerContext = a3;
}

@end