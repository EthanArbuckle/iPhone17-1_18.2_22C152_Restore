@interface VTAudioCircularBuffer
- (OS_dispatch_queue)queue;
- (VTAudioCircularBuffer)initWithNumChannels:(unint64_t)a3 recordingDuration:(unint64_t)a4 samplingRate:(unint64_t)a5;
- (id).cxx_construct;
- (id)copyBufferWithNumSamplesCopiedIn:(unint64_t *)a3;
- (id)copySamplesFrom:(unint64_t)a3 to:(unint64_t)a4 withNumSamplesCopiedIn:(unint64_t *)a5;
- (unint64_t)bufferLength;
- (unint64_t)sampleCount;
- (void)addSamples:(void *)a3 numSamples:(unint64_t)a4;
- (void)reset;
- (void)saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5;
- (void)setBufferLength:(unint64_t)a3;
- (void)setQueue:(id)a3;
@end

@implementation VTAudioCircularBuffer

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  value = self->_vtAudioCircularBufferImpl.__ptr_.__value_;
  self->_vtAudioCircularBufferImpl.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = (void *)value[7];
    if (v4)
    {
      value[8] = v4;
      operator delete(v4);
    }
    uint64_t v5 = value[6];
    value[6] = 0;
    if (v5) {
      MEMORY[0x21D46B220](v5, 0x1000C80BDFB0063);
    }
    JUMPOUT(0x21D46B240);
  }
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBufferLength:(unint64_t)a3
{
  self->_bufferLength = a3;
}

- (unint64_t)bufferLength
{
  return self->_bufferLength;
}

- (void)saveRecordingBufferFrom:(unint64_t)a3 to:(unint64_t)a4 toURL:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a5;
  v9 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349570;
    unint64_t v24 = a3;
    __int16 v25 = 2050;
    unint64_t v26 = a4;
    __int16 v27 = 2114;
    id v28 = v8;
    _os_log_impl(&dword_21844F000, v9, OS_LOG_TYPE_DEFAULT, "saveRecordingBufferFrom: %{public}lu to: %{public}lu toURL: %{public}@", buf, 0x20u);
  }
  double v20 = (double)*((unint64_t *)self->_vtAudioCircularBufferImpl.__ptr_.__value_ + 2);
  long long v21 = xmmword_21852DDF0;
  long long v22 = xmmword_21852DE00;
  double v17 = v20;
  long long v18 = xmmword_21852DDF0;
  long long v19 = xmmword_21852DE00;
  v10 = [[AudioFileWriter alloc] initWithURL:v8 inputFormat:&v20 outputFormat:&v17];
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__VTAudioCircularBuffer_saveRecordingBufferFrom_to_toURL___block_invoke;
  v13[3] = &unk_264325298;
  unint64_t v15 = a3;
  unint64_t v16 = a4;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  dispatch_sync(queue, v13);
}

uint64_t __58__VTAudioCircularBuffer_saveRecordingBufferFrom_to_toURL___block_invoke(uint64_t a1)
{
  v82[19] = *MEMORY[0x263EF8340];
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  v71[0] = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = MEMORY[0x263F8C328] + 64;
  uint64_t v63 = MEMORY[0x263F8C328] + 64;
  v4 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  v62[0] = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)((char *)v62 + *(void *)(v62[0] - 24)) = v5;
  v62[1] = 0;
  v6 = (std::ios_base *)((char *)v62 + *(void *)(v62[0] - 24));
  std::ios_base::init(v6, v64);
  uint64_t v7 = MEMORY[0x263F8C328] + 24;
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  uint64_t v8 = v4[5];
  uint64_t v63 = v4[4];
  *(void *)((char *)&v64[-1] + *(void *)(v63 - 24)) = v8;
  v62[0] = v4[1];
  *(void *)((char *)v62 + *(void *)(v62[0] - 24)) = v4[6];
  v71[0] = v2;
  v62[0] = v7;
  uint64_t v63 = v3;
  std::streambuf::basic_streambuf();
  uint64_t v59 = MEMORY[0x263F8C318] + 16;
  v64[0] = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)v68 = 0u;
  long long v69 = 0u;
  int v70 = 24;
  v9 = *(unint64_t **)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = MEMORY[0x263F8C340] + 64;
  v82[0] = MEMORY[0x263F8C340] + 64;
  uint64_t v11 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  *(void *)buf = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)&buf[*(void *)(*(void *)buf - 24)] = v11;
  v12 = (std::ios_base *)&buf[*(void *)(*(void *)buf - 24)];
  std::ios_base::init(v12, &buf[8]);
  uint64_t v13 = MEMORY[0x263F8C340] + 24;
  v12[1].__vftable = 0;
  v12[1].__fmtflags_ = -1;
  *(void *)buf = v13;
  v82[0] = v10;
  std::streambuf::basic_streambuf();
  uint64_t v61 = a1;
  uint64_t v60 = MEMORY[0x263F8C318] + 16;
  *(void *)&buf[8] = MEMORY[0x263F8C318] + 16;
  long long __p = 0u;
  long long v80 = 0u;
  int v81 = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"{\n  mNumChannels: ", 18);
  v14 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)"\n  mRecordingDurationInSecs: ", 29);
  unint64_t v15 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"\n  mSampleRate: ", 16);
  unint64_t v16 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)"\n  mBytesPerSample: ", 20);
  double v17 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)"\n  mBufferLengthInSamples: ", 27);
  long long v18 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)"\n  mNextWritePos: ", 18);
  long long v19 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)"\n  mSamplesCount: ", 18);
  double v20 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)"\n  mMemoryPool(", 15);
  long long v21 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)"): [", 4);
  if (*v9)
  {
    unint64_t v22 = 0;
    do
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"\n    chan-", 10);
      v23 = (void *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)": ", 2);
      unint64_t v24 = (void *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)": sz=", 5);
      __int16 v25 = (void *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)": mem-sz: ", 10);
      std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"\n", 1);
      ++v22;
    }
    while (v22 < *v9);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(buf, (uint64_t)"\n ]\n}\n", 6);
  unint64_t v26 = (void *)MEMORY[0x263F8C2B8];
  __int16 v27 = (void *)MEMORY[0x263F8C2C8];
  if ((v81 & 0x10) != 0)
  {
    unint64_t v30 = *((void *)&v80 + 1);
    if (*((void *)&v80 + 1) < v78)
    {
      *((void *)&v80 + 1) = v78;
      unint64_t v30 = v78;
    }
    v31 = (const void **)&v77;
  }
  else
  {
    if ((v81 & 8) == 0)
    {
      size_t v28 = 0;
      HIBYTE(v74) = 0;
      p_dst = (void **)&__dst;
      goto LABEL_19;
    }
    v31 = (const void **)v76;
    unint64_t v30 = v76[2];
  }
  v32 = *v31;
  size_t v28 = v30 - (void)*v31;
  if (v28 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v28 >= 0x17)
  {
    uint64_t v33 = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v28 | 7) != 0x17) {
      uint64_t v33 = v28 | 7;
    }
    uint64_t v34 = v33 + 1;
    p_dst = (void **)operator new(v33 + 1);
    size_t v73 = v28;
    int64_t v74 = v34 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_18;
  }
  HIBYTE(v74) = v30 - *(unsigned char *)v31;
  p_dst = (void **)&__dst;
  if (v28) {
LABEL_18:
  }
    memmove(p_dst, v32, v28);
LABEL_19:
  *((unsigned char *)p_dst + v28) = 0;
  if (v74 >= 0) {
    v35 = (void **)&__dst;
  }
  else {
    v35 = __dst;
  }
  if (v74 >= 0) {
    uint64_t v36 = HIBYTE(v74);
  }
  else {
    uint64_t v36 = v73;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v63, (uint64_t)v35, v36);
  if (SHIBYTE(v74) < 0) {
    operator delete(__dst);
  }
  *(void *)buf = *v27;
  *(void *)&buf[*(void *)(*(void *)buf - 24)] = v27[3];
  *(void *)&buf[8] = v60;
  if (SBYTE7(v80) < 0) {
    operator delete((void *)__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x21D46B200](v82);
  v37 = NSString;
  if ((v70 & 0x10) != 0)
  {
    unint64_t v40 = *((void *)&v69 + 1);
    if (*((void *)&v69 + 1) < v67)
    {
      *((void *)&v69 + 1) = v67;
      unint64_t v40 = v67;
    }
    v41 = (const void **)&v66;
  }
  else
  {
    if ((v70 & 8) == 0)
    {
      size_t v38 = 0;
      buf[23] = 0;
      v39 = buf;
      goto LABEL_44;
    }
    v41 = (const void **)v65;
    unint64_t v40 = v65[2];
  }
  v42 = *v41;
  size_t v38 = v40 - (void)*v41;
  if (v38 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (v38 >= 0x17)
  {
    uint64_t v43 = (v38 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v38 | 7) != 0x17) {
      uint64_t v43 = v38 | 7;
    }
    uint64_t v44 = v43 + 1;
    v39 = operator new(v43 + 1);
    *(void *)&buf[8] = v38;
    *(void *)&buf[16] = v44 | 0x8000000000000000;
    *(void *)buf = v39;
    goto LABEL_43;
  }
  buf[23] = v40 - *(unsigned char *)v41;
  v39 = buf;
  if (v38) {
LABEL_43:
  }
    memmove(v39, v42, v38);
LABEL_44:
  v39[v38] = 0;
  if (buf[23] >= 0) {
    v45 = buf;
  }
  else {
    v45 = *(unsigned char **)buf;
  }
  v46 = objc_msgSend(v37, "stringWithCString:encoding:", v45, 4, v64);
  if ((buf[23] & 0x80000000) != 0) {
    operator delete(*(void **)buf);
  }
  v47 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v46;
    _os_log_impl(&dword_21844F000, v47, OS_LOG_TYPE_DEFAULT, "csrb: %{public}@", buf, 0xCu);
  }
  voicetrigger::VTAudioCircularBufferImpl<unsigned short>::copySamples(&__dst, *(void *)(*(void *)(v61 + 32) + 8), *(void *)(v61 + 48), *(void *)(v61 + 56));
  v48 = __dst;
  v49 = VTLogContextFacilityVoiceTrigger;
  if (__dst)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v50 = *(void *)(*(void *)(v61 + 32) + 8);
      uint64_t v51 = *(void *)(v50 + 40);
      uint64_t v54 = v50 + 16;
      uint64_t v52 = *(void *)(v50 + 16);
      uint64_t v53 = *(void *)(v54 + 8);
      *(_DWORD *)buf = 134349568;
      *(void *)&uint8_t buf[4] = v53;
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = v51;
      *(_WORD *)&buf[22] = 2050;
      v76[0] = v52;
      _os_log_impl(&dword_21844F000, v49, OS_LOG_TYPE_DEFAULT, "mBufferLen:  %{public}lu, samplesCount=%{public}lu, sampleRate=%{public}lu", buf, 0x20u);
    }
    [*(id *)(v61 + 40) addSamples:v48 len:*(void *)(v61 + 56) - *(void *)(v61 + 48)];
    [*(id *)(v61 + 40) close];
    MEMORY[0x21D46B220](v48, 0x1000C80BDFB0063);
  }
  else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    uint64_t v57 = *(void *)(v61 + 48);
    uint64_t v58 = *(void *)(v61 + 56);
    *(_DWORD *)buf = 134349312;
    *(void *)&uint8_t buf[4] = v57;
    *(_WORD *)&buf[12] = 2050;
    *(void *)&buf[14] = v58;
    _os_log_error_impl(&dword_21844F000, v49, OS_LOG_TYPE_ERROR, "Invalid request: (%{public}lu, %{public}lu): noting to write to file", buf, 0x16u);
  }

  v62[0] = *v26;
  uint64_t v55 = v26[9];
  *(void *)((char *)v62 + *(void *)(v62[0] - 24)) = v26[8];
  uint64_t v63 = v55;
  v64[0] = v59;
  if (SBYTE7(v69) < 0) {
    operator delete(v68[0]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x21D46B200](v71);
}

- (unint64_t)sampleCount
{
  return *((void *)self->_vtAudioCircularBufferImpl.__ptr_.__value_ + 5);
}

- (void)reset
{
  uint64_t v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_21844F000, v3, OS_LOG_TYPE_DEFAULT, "VTAudioCircularBuffer.reset", v5, 2u);
  }
  value = self->_vtAudioCircularBufferImpl.__ptr_.__value_;
  value[4] = 0;
  value[5] = 0;
}

- (id)copyBufferWithNumSamplesCopiedIn:(unint64_t *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  value = self->_vtAudioCircularBufferImpl.__ptr_.__value_;
  unint64_t v6 = value[5];
  unint64_t v7 = value[3];
  BOOL v8 = v6 >= v7;
  uint64_t v9 = v6 - v7;
  if (v8) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = *a3;
    int v14 = 134349568;
    uint64_t v15 = v10;
    __int16 v16 = 2050;
    unint64_t v17 = v6;
    __int16 v18 = 2050;
    unint64_t v19 = v12;
    _os_log_impl(&dword_21844F000, v11, OS_LOG_TYPE_DEFAULT, "copyBuffer: oldestSample: %{public}lu latestSample: %{public}lu, numSamplesCopied: %{public}lu", (uint8_t *)&v14, 0x20u);
  }
  return [(VTAudioCircularBuffer *)self copySamplesFrom:v10 to:v6 withNumSamplesCopiedIn:a3];
}

- (id)copySamplesFrom:(unint64_t)a3 to:(unint64_t)a4 withNumSamplesCopiedIn:(unint64_t *)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  unint64_t v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__VTAudioCircularBuffer_copySamplesFrom_to_withNumSamplesCopiedIn___block_invoke;
  block[3] = &unk_264325270;
  block[6] = a3;
  block[7] = a4;
  block[4] = self;
  block[5] = &v9;
  block[8] = a5;
  dispatch_sync(queue, block);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __67__VTAudioCircularBuffer_copySamplesFrom_to_withNumSamplesCopiedIn___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  voicetrigger::VTAudioCircularBufferImpl<unsigned short>::copySamples(&v13, *(void *)(*(void *)(a1 + 32) + 8), *(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v2 = v13;
  if (v13)
  {
    uint64_t v3 = *(void *)(a1 + 56) - *(void *)(a1 + 48);
    uint64_t v4 = [MEMORY[0x263EFF8F8] dataWithBytes:v13 length:2 * **(void **)(*(void *)(a1 + 32) + 8) * v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    **(void **)(a1 + 64) = v3;
    unint64_t v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134349568;
      uint64_t v15 = v8;
      __int16 v16 = 2050;
      uint64_t v17 = v9;
      __int16 v18 = 2050;
      uint64_t v19 = v3;
      _os_log_impl(&dword_21844F000, v7, OS_LOG_TYPE_DEFAULT, "copyFrom: %{public}lu to: %{public}lu, retSampleCount: %{public}lu", buf, 0x20u);
    }
    MEMORY[0x21D46B220](v2, 0x1000C80BDFB0063);
  }
  else
  {
    uint64_t v10 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      uint64_t v12 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134349312;
      uint64_t v15 = v11;
      __int16 v16 = 2050;
      uint64_t v17 = v12;
      _os_log_error_impl(&dword_21844F000, v10, OS_LOG_TYPE_ERROR, "Could not copyFrom:%{public}lu to: %{public}lu", buf, 0x16u);
    }
    **(void **)(a1 + 64) = 0;
  }
}

- (void)addSamples:(void *)a3 numSamples:(unint64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__VTAudioCircularBuffer_addSamples_numSamples___block_invoke;
  block[3] = &unk_264325248;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(queue, block);
}

void *__47__VTAudioCircularBuffer_addSamples_numSamples___block_invoke(void *result)
{
  v1 = *(unint64_t **)(result[4] + 8);
  unint64_t v2 = result[6];
  unint64_t v3 = v1[3];
  if (*v1)
  {
    uint64_t v4 = (char *)result[5];
    unint64_t v18 = v2 - v3;
    unint64_t v20 = result[6];
    uint64_t __n = 2 * v2;
    if (v2 >= v3)
    {
      unint64_t v12 = 0;
      uint64_t v13 = &v4[2 * v2];
      id v14 = (char *)result[5];
      do
      {
        unint64_t v16 = v1[4];
        uint64_t v17 = *(char **)(v1[7] + 8 * v12);
        if (v3 - v16 < v2)
        {
          unint64_t v10 = (v16 + v18) % v3;
          uint64_t v19 = (uint64_t)&v4[2 * v12 * v2 + 2 * v18];
          memcpy(&v17[2 * v10], &v13[-2 * v3], 2 * (v3 - v10));
          result = memcpy(v17, (const void *)(v19 + 2 * (v3 - v10)), 2 * v10);
          unint64_t v2 = v20;
          uint64_t v15 = __n;
        }
        else
        {
          result = memcpy(&v17[2 * v16], v14, __n);
          unint64_t v2 = v20;
          uint64_t v15 = __n;
          unint64_t v10 = v16 + v20;
        }
        ++v12;
        v13 += v15;
        v14 += v15;
      }
      while (v12 < *v1);
    }
    else
    {
      unint64_t v5 = 0;
      do
      {
        unint64_t v7 = v1[4];
        uint64_t v8 = *(char **)(v1[7] + 8 * v5);
        uint64_t v9 = &v8[2 * v7];
        unint64_t v10 = v2 - (v3 - v7);
        if (v2 > v3 - v7)
        {
          memcpy(v9, v4, 2 * (v3 - v7));
          result = memcpy(v8, &v4[2 * v3 - 2 * v7], 2 * v10);
          unint64_t v2 = v20;
          uint64_t v6 = __n;
        }
        else
        {
          result = memcpy(v9, v4, __n);
          unint64_t v2 = v20;
          uint64_t v6 = __n;
          unint64_t v10 = v7 + v20;
        }
        ++v5;
        v4 += v6;
      }
      while (v5 < *v1);
    }
  }
  else
  {
    unint64_t v10 = v1[4];
  }
  unint64_t v11 = v1[5] + v2;
  v1[4] = v10 % v3;
  v1[5] = v11;
  return result;
}

- (VTAudioCircularBuffer)initWithNumChannels:(unint64_t)a3 recordingDuration:(unint64_t)a4 samplingRate:(unint64_t)a5
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v6.receiver = self;
  v6.super_class = (Class)VTAudioCircularBuffer;
  if ([(VTAudioCircularBuffer *)&v6 init]) {
    operator new();
  }
  return 0;
}

@end