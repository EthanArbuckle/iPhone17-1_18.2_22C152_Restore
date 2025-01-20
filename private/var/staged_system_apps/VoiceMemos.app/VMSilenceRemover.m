@interface VMSilenceRemover
- (BOOL)enabled;
- (VMAudioProvider)inputProvider;
- (VMSilenceRemover)initWithSampleRate:(double)a3 channelCount:(int)a4 error:(id *)a5;
- (double)sampleRate;
- (float)_getInput:(int *)a3;
- (float)cutPadding;
- (float)fadeDuration;
- (float)saved;
- (float)silenceThreshold;
- (float)singleReadLimitInSeconds;
- (id).cxx_construct;
- (int)fillNextBuffer:(AudioBufferList *)a3 frameCount:(int)a4;
- (int)readFromInternalBuffer:(AudioBufferList *)a3 frameCount:(int)a4 offset:(int)a5;
- (unint64_t)samplesRemoved;
- (unsigned)channelCount;
- (void)_advanceToOverThresholdState;
- (void)_discardSilenceFrames;
- (void)_makeCutAndStartFlush;
- (void)consumeInput:(int)a3;
- (void)dealloc;
- (void)flush;
- (void)reset;
- (void)resetCounter;
- (void)setCutPadding:(float)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFadeDuration:(float)a3;
- (void)setInputProvider:(id)a3;
- (void)setSilenceThreshold:(float)a3;
- (void)setSingleReadLimitInSeconds:(float)a3;
- (void)updateContiguousThreshold;
@end

@implementation VMSilenceRemover

- (void)setSilenceThreshold:(float)a3
{
  self->_silenceThreshold = a3;
  [(VMSilenceRemover *)self resetCounter];
}

- (void)setCutPadding:(float)a3
{
  [(VMSilenceRemover *)self flush];
  self->_cutPadding = a3;
  self->_cutPaddingInSamples = (int)(self->_sampleRate * a3);
  [(VMSilenceRemover *)self updateContiguousThreshold];

  [(VMSilenceRemover *)self resetCounter];
}

- (void)setFadeDuration:(float)a3
{
  [(VMSilenceRemover *)self flush];
  self->_fadeDuration = a3;
  self->_crossfadeDurationInSamples = (int)(self->_sampleRate * a3);
  [(VMSilenceRemover *)self updateContiguousThreshold];

  [(VMSilenceRemover *)self resetCounter];
}

- (void)setSingleReadLimitInSeconds:(float)a3
{
  self->_singleReadLimitInSeconds = a3;
  self->_singleReadLimitInSamples = (int)(self->_sampleRate * a3);
}

- (void)updateContiguousThreshold
{
  self->_contiguousSilenceThresholdInSamples = 2 * (self->_cutPaddingInSamples + self->_crossfadeDurationInSamples);
}

- (void)reset
{
  int v3 = atomic_load((unsigned int *)&self->_inputBuffer.mFill);
  sub_10004A1D0((uint64_t)&self->_inputBuffer, v3);
  int v4 = atomic_load((unsigned int *)&self->_inputBuffer.mFill);
  sub_10004A1D0((uint64_t)&self->_processingBuffer, v4);

  [(VMSilenceRemover *)self resetCounter];
}

- (void)resetCounter
{
  self->counter = 0;
  self->removedCounter = 0;
}

- (VMSilenceRemover)initWithSampleRate:(double)a3 channelCount:(int)a4 error:(id *)a5
{
  v12.receiver = self;
  v12.super_class = (Class)VMSilenceRemover;
  v7 = [(VMSilenceRemover *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_sampleRate = a3;
    v7->_channelCount = a4;
    v7->_fadeDuration = 0.0025;
    *(void *)&v7->_cutPadding = 0x3C03126F3D4CCCCDLL;
    *(int32x2_t *)&v7->_crossfadeDurationInSamples = vmovn_s64(vcvtq_s64_f64(vmulq_n_f64((float64x2_t)xmmword_1001F0390, a3)));
    v7->_maxSilenceFramesToRender = (int)(a3 * 0.699999988);
    v7->_silenceRemovalRatio = 0.7;
    [(VMSilenceRemover *)v7 updateContiguousThreshold];
    if (sub_10005C1EC((uint64_t)&v8->_processingBuffer, (int)(v8->_sampleRate * 40.0), v8->_channelCount, a5)
      && sub_10005C1EC((uint64_t)&v8->_inputBuffer, 0x8000, v8->_channelCount, a5))
    {
      v8->_preCutBuffer = (float **)sub_100069460(v8->_channelCount, (int)v8->_sampleRate, 4);
      operator new();
    }
    v9 = 0;
  }
  else
  {
    v9 = (VMSilenceRemover *)0;
  }

  return v9;
}

- (void)dealloc
{
  sub_100049BC0((uint64_t)&self->_processingBuffer);
  sub_100049BC0((uint64_t)&self->_inputBuffer);
  free(self->_preCutBuffer);
  rmsBuffer = (void **)self->_rmsBuffer;
  if (rmsBuffer)
  {
    int v4 = *rmsBuffer;
    if (*rmsBuffer)
    {
      rmsBuffer[1] = v4;
      operator delete(v4);
    }
    operator delete();
  }
  v5.receiver = self;
  v5.super_class = (Class)VMSilenceRemover;
  [(VMSilenceRemover *)&v5 dealloc];
}

- (int)fillNextBuffer:(AudioBufferList *)a3 frameCount:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v7 = [(VMSilenceRemover *)self inputProvider];
  v8 = v7;
  if (!v7) {
    goto LABEL_77;
  }
  if (!self->_enabled)
  {
    int v62 = atomic_load((unsigned int *)&self->_processingBuffer.mFill);
    if (v62 < 1)
    {
      LODWORD(v10) = [v7 fillNextBuffer:a3 frameCount:v4];
    }
    else
    {
      if (self->_state == 1) {
        [(VMSilenceRemover *)self _makeCutAndStartFlush];
      }
      LODWORD(v10) = [(VMSilenceRemover *)self readFromInternalBuffer:a3 frameCount:v4 offset:0];
      if ((int)v4 - (int)v10 >= 1)
      {
        mReadBufferlist = self->_inputBuffer.mReadBufferlist;
        mReadPointers = self->_inputBuffer.mReadPointers;
        uint64_t mNumberBuffers = self->_inputBuffer.mNumberBuffers;
        mReadBufferlist->uint64_t mNumberBuffers = mNumberBuffers;
        if (mNumberBuffers)
        {
          p_mData = &mReadBufferlist->mBuffers[0].mData;
          do
          {
            *(p_mData - 1) = (void *)1;
            v67 = *mReadPointers++;
            *p_mData = v67;
            p_mData += 2;
            --mNumberBuffers;
          }
          while (mNumberBuffers);
        }
        if (self->_channelCount)
        {
          unint64_t v68 = 0;
          v69 = &a3->mBuffers[0].mData;
          v70 = &mReadBufferlist->mBuffers[0].mData;
          do
          {
            v71 = (char *)*v69;
            v69 += 2;
            *v70 = &v71[4 * (int)v10];
            *((_DWORD *)v70 - 1) = 4 * (v4 - v10);
            ++v68;
            v70 += 2;
          }
          while (v68 < self->_channelCount);
        }
        LODWORD(v10) = [v8 fillNextBuffer:v10] + v10;
      }
    }
    goto LABEL_78;
  }
  if ((int)v4 < 1)
  {
LABEL_77:
    LODWORD(v10) = 0;
    goto LABEL_78;
  }
  int v9 = 0;
  uint64_t v10 = 0;
  p_processingBuffer = &self->_processingBuffer;
  while (1)
  {
    if (self->_state == 2)
    {
      LODWORD(v10) = [(VMSilenceRemover *)self readFromInternalBuffer:a3 frameCount:(v4 - v10) offset:v10]+ v10;
      goto LABEL_7;
    }
    int v74 = 0;
    v11 = [(VMSilenceRemover *)self _getInput:&v74];
    int v12 = v74;
    v9 += v74;
    int v13 = atomic_load((unsigned int *)&self->_processingBuffer.mFill);
    if (v12) {
      break;
    }
    if (!v13) {
      goto LABEL_78;
    }
    int state = self->_state;
    if (state == 1)
    {
      [(VMSilenceRemover *)self _makeCutAndStartFlush];
    }
    else if (!state)
    {
      self->_int state = 2;
    }
LABEL_7:
    if ((int)v10 >= (int)v4) {
      goto LABEL_78;
    }
  }
  v14 = v11;
  if (v13 < 1)
  {
    if (v74 >= (int)v4 - (int)v10) {
      unint64_t v36 = (v4 - v10);
    }
    else {
      unint64_t v36 = v74;
    }
    if ((int)v36 < 1)
    {
      uint64_t v15 = 0;
    }
    else
    {
      unint64_t v37 = 0;
      do
      {
        signed int channelCount = self->_channelCount;
        float v39 = 0.0;
        float v40 = 0.0;
        if (channelCount >= 1)
        {
          v41 = v14;
          uint64_t v42 = self->_channelCount;
          do
          {
            uint64_t v43 = (uint64_t)*v41++;
            float v40 = v40 + *(float *)(v43 + 4 * v37);
            --v42;
          }
          while (v42);
        }
        sub_100049F24((uint64_t *)self->_rmsBuffer, (float)(v40 / (float)channelCount) * (float)(v40 / (float)channelCount));
        rmsBuffer = (double *)self->_rmsBuffer;
        float v45 = rmsBuffer[5];
        if (v45 > 0.0) {
          float v39 = sqrtf(v45 / (float)*((int *)rmsBuffer + 7));
        }
        float silenceThreshold = self->_silenceThreshold;
        if (v39 < silenceThreshold)
        {
          uint64_t v53 = self->_channelCount;
          if (v53)
          {
            mWritePointers = self->_processingBuffer.mWritePointers;
            v55 = v14;
            do
            {
              uint64_t v56 = (uint64_t)*v55++;
              int v57 = *(_DWORD *)(v56 + 4 * v37);
              v58 = *mWritePointers++;
              _DWORD *v58 = v57;
              --v53;
            }
            while (v53);
          }
          sub_100049E5C((uint64_t)p_processingBuffer, 1u);
          self->_int state = 0;
        }
        else
        {
          uint64_t v47 = self->_channelCount;
          if (v47)
          {
            v48 = &a3->mBuffers[0].mData;
            v49 = v14;
            do
            {
              uint64_t v50 = (uint64_t)*v49++;
              int v51 = *(_DWORD *)(v50 + 4 * v37);
              v52 = *v48;
              v48 += 2;
              v52[(int)v10] = v51;
              --v47;
            }
            while (v47);
          }
          uint64_t v10 = (v10 + 1);
        }
        ++v37;
      }
      while (v39 >= silenceThreshold && v37 < v36);
      uint64_t v15 = v37;
    }
    goto LABEL_74;
  }
  if (v74 < 1)
  {
    uint64_t v15 = 0;
    int v60 = 0;
    goto LABEL_66;
  }
  int v72 = v9;
  uint64_t v15 = 0;
  v16 = self->_processingBuffer.mWritePointers;
  while (2)
  {
    int v17 = v15;
    uint64_t v18 = self->_channelCount;
    uint64_t v19 = v18;
    v20 = v14;
    v21 = v16;
    if (!v18)
    {
      v25 = (uint64_t *)self->_rmsBuffer;
LABEL_20:
      float v26 = 0.0;
      goto LABEL_21;
    }
    do
    {
      uint64_t v22 = (uint64_t)*v20++;
      int v23 = *(_DWORD *)(v22 + 4 * v15);
      uint64_t v24 = (uint64_t)*v21++;
      *(_DWORD *)(v24 + 4 * v15) = v23;
      --v19;
    }
    while (v19);
    v25 = (uint64_t *)self->_rmsBuffer;
    if ((int)v18 < 1) {
      goto LABEL_20;
    }
    float v26 = 0.0;
    v27 = v14;
    uint64_t v28 = v18;
    do
    {
      uint64_t v29 = (uint64_t)*v27++;
      float v26 = v26 + *(float *)(v29 + 4 * v15);
      --v28;
    }
    while (v28);
LABEL_21:
    sub_100049F24(v25, (float)(v26 / (float)(int)v18) * (float)(v26 / (float)(int)v18));
    v30 = (double *)self->_rmsBuffer;
    float v31 = v30[5];
    float v32 = 0.0;
    if (v31 > 0.0) {
      float v32 = sqrtf(v31 / (float)*((int *)v30 + 7));
    }
    ++v15;
    float v33 = self->_silenceThreshold;
    int v34 = self->_state;
    if (v34 != 1)
    {
      if (!v34)
      {
        if (v32 >= v33)
        {
          int v60 = 3;
          goto LABEL_65;
        }
        if (v13 + v17 >= self->_contiguousSilenceThresholdInSamples)
        {
          int v60 = 1;
          goto LABEL_65;
        }
      }
      goto LABEL_29;
    }
    if (v32 < v33)
    {
LABEL_29:
      if (v15 >= v74)
      {
        int v60 = 0;
        goto LABEL_65;
      }
      continue;
    }
    break;
  }
  int v60 = 2;
LABEL_65:
  int v9 = v72;
LABEL_66:
  sub_100049E5C((uint64_t)p_processingBuffer, v15);
  if (self->_state == 1) {
    [(VMSilenceRemover *)self _discardSilenceFrames];
  }
  switch(v60)
  {
    case 3:
      self->_int state = 2;
      break;
    case 2:
      [(VMSilenceRemover *)self _makeCutAndStartFlush];
      break;
    case 1:
      [(VMSilenceRemover *)self _advanceToOverThresholdState];
      break;
  }
LABEL_74:
  [(VMSilenceRemover *)self consumeInput:v15];
  if (v9 <= self->_singleReadLimitInSamples || self->_state != 1) {
    goto LABEL_7;
  }
LABEL_78:

  return v10;
}

- (int)readFromInternalBuffer:(AudioBufferList *)a3 frameCount:(int)a4 offset:(int)a5
{
  p_processingBuffer = &self->_processingBuffer;
  int v7 = atomic_load((unsigned int *)&self->_processingBuffer.mFill);
  BOOL v8 = v7 > a4;
  if (v7 >= a4) {
    int v9 = a4;
  }
  else {
    int v9 = v7;
  }
  sub_10005D41C((uint64_t)p_processingBuffer, (uint64_t)a3, v9, a5);
  self->_int state = 2 * v8;
  return v9;
}

- (void)_advanceToOverThresholdState
{
  self->_int state = 1;
  self->_currentSilenceRemovedCounter = 0;
}

- (void)_discardSilenceFrames
{
  uint64_t v2 = self->_crossfadeDurationInSamples + (uint64_t)self->_cutPaddingInSamples;
  unint64_t v3 = self->_currentSilenceRemovedCounter + v2;
  signed int v4 = atomic_load((unsigned int *)&self->_processingBuffer.mFill);
  int maxSilenceFramesToRender = self->_maxSilenceFramesToRender;
  float v6 = (float)(1.0 - self->_silenceRemovalRatio) * (float)(v3 + v4);
  if (v6 > (float)maxSilenceFramesToRender) {
    float v6 = (float)maxSilenceFramesToRender;
  }
  if ((int)v2 <= (int)v6 - self->_cutPaddingInSamples) {
    LODWORD(v2) = (int)v6 - self->_cutPaddingInSamples;
  }
  unsigned int v7 = atomic_load((unsigned int *)&self->_processingBuffer.mFill);
  unint64_t v8 = v7 - v2;
  if ((int)v8 >= 1)
  {
    sub_10004A1D0((uint64_t)&self->_processingBuffer, v7 - v2);
    *(int64x2_t *)&self->removedCounter = vaddq_s64(*(int64x2_t *)&self->removedCounter, vdupq_n_s64(v8));
  }
}

- (void)_makeCutAndStartFlush
{
  mReadPointers = (uint64_t *)self->_processingBuffer.mReadPointers;
  sub_10009DA8C((uint64_t *)self->_preCutBuffer, 0, mReadPointers, 0, self->_channelCount, self->_cutPaddingInSamples);
  uint64_t channelCount = self->_channelCount;
  if (channelCount)
  {
    uint64_t v5 = 0;
    preCutBuffer = self->_preCutBuffer;
    uint64_t crossfadeDurationInSamples = self->_crossfadeDurationInSamples;
    uint64_t cutPaddingInSamples = self->_cutPaddingInSamples;
    do
    {
      if ((int)crossfadeDurationInSamples >= 1)
      {
        uint64_t v9 = 0;
        uint64_t v10 = mReadPointers[v5] + 4 * cutPaddingInSamples;
        uint64_t v11 = (uint64_t)&preCutBuffer[v5][cutPaddingInSamples];
        do
        {
          *(float *)(v10 + 4 * v9) = (float)(*(float *)(v10 + 4 * v9)
                                           * (float)((float)(int)v9 / (float)(int)crossfadeDurationInSamples))
                                   + (float)(*(float *)(v11 + 4 * v9)
                                           * (float)(1.0
                                                   - (float)((float)(int)v9 / (float)(int)crossfadeDurationInSamples)));
          ++v9;
        }
        while (crossfadeDurationInSamples != v9);
      }
      ++v5;
    }
    while (v5 != channelCount);
  }
  self->_int state = 2;
}

- (void)flush
{
  if (self->_state == 1) {
    [(VMSilenceRemover *)self _makeCutAndStartFlush];
  }
  self->_int state = 2;
}

- (void)consumeInput:(int)a3
{
}

- (float)_getInput:(int *)a3
{
  uint64_t v5 = [(VMSilenceRemover *)self inputProvider];
  float v6 = v5;
  if (v5)
  {
    int v7 = atomic_load((unsigned int *)&self->_inputBuffer.mFill);
    if (v7 <= 2047)
    {
      mWriteBufferlist = self->_inputBuffer.mWriteBufferlist;
      mWritePointers = self->_inputBuffer.mWritePointers;
      uint64_t mNumberBuffers = self->_inputBuffer.mNumberBuffers;
      mWriteBufferlist->uint64_t mNumberBuffers = mNumberBuffers;
      if (mNumberBuffers)
      {
        p_mData = &mWriteBufferlist->mBuffers[0].mData;
        do
        {
          *(p_mData - 1) = (void *)0x400000000001;
          int v12 = *mWritePointers++;
          *p_mData = v12;
          p_mData += 2;
          --mNumberBuffers;
        }
        while (mNumberBuffers);
      }
      signed int v13 = [v5 fillNextBuffer:frameCount:];
      self->counter += v13;
      sub_100049E5C((uint64_t)&self->_inputBuffer, v13);
    }
    int v14 = atomic_load((unsigned int *)&self->_inputBuffer.mFill);
    *a3 = v14;
    mReadPointers = self->_inputBuffer.mReadPointers;
  }
  else
  {
    mReadPointers = 0;
  }

  return mReadPointers;
}

- (unint64_t)samplesRemoved
{
  return self->removedCounter;
}

- (float)saved
{
  if ((float)((float)self->removedCounter / (float)self->counter) == INFINITY) {
    return 0.0;
  }
  else {
    return (float)self->removedCounter / (float)self->counter;
  }
}

- (float)cutPadding
{
  return self->_cutPadding;
}

- (float)silenceThreshold
{
  return self->_silenceThreshold;
}

- (float)fadeDuration
{
  return self->_fadeDuration;
}

- (float)singleReadLimitInSeconds
{
  return self->_singleReadLimitInSeconds;
}

- (VMAudioProvider)inputProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputProvider);

  return (VMAudioProvider *)WeakRetained;
}

- (void)setInputProvider:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (unsigned)channelCount
{
  return self->_channelCount;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_DWORD *)self + 12) = 0;
  *((_DWORD *)self + 28) = 0;
  return self;
}

@end