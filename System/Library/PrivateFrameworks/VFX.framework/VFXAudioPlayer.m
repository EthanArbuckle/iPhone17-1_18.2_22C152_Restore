@interface VFXAudioPlayer
+ (id)audioPlayerWithAVAudioNode:(id)a3;
+ (id)audioPlayerWithSource:(id)a3;
- (AVAudioNode)audioNode;
- (AVAudioPlayerNode)audioPlayer;
- (BOOL)completed;
- (BOOL)customAudioNode;
- (VFXAudioPlayer)initWithAVAudioNode:(id)a3;
- (VFXAudioPlayer)initWithSource:(id)a3;
- (VFXAudioSource)audioSource;
- (__CFXNode)nodeRef;
- (__CFXWorld)world;
- (id)audioBufferFormat;
- (id)didFinishPlayback;
- (id)willStartPlayback;
- (void)dealloc;
- (void)play;
- (void)recycle;
- (void)reset;
- (void)setCompleted:(BOOL)a3;
- (void)setDidFinishPlayback:(id)a3;
- (void)setNodeRef:(__CFXNode *)a3;
- (void)setWillStartPlayback:(id)a3;
@end

@implementation VFXAudioPlayer

- (VFXAudioPlayer)initWithSource:(id)a3
{
  v33.receiver = self;
  v33.super_class = (Class)VFXAudioPlayer;
  v4 = [(VFXAudioPlayer *)&v33 init];
  if (v4)
  {
    v5 = (AVAudioPlayerNode *)objc_alloc_init(MEMORY[0x1E4F153D0]);
    v4->_audioNode = &v5->super;
    v4->_audioPlayer = v5;
    v4->_customAudioNode = 0;
    v6 = (VFXAudioSource *)a3;
    v4->_audioSource = v6;
    audioPlayer = v4->_audioPlayer;
    uint64_t v11 = objc_msgSend_renderingAlgorithm(v6, v8, v9, v10);
    objc_msgSend_setRenderingAlgorithm_(audioPlayer, v12, v11, v13);
    objc_msgSend_rate(v4->_audioSource, v14, v15, v16);
    objc_msgSend_setRate_(v4->_audioPlayer, v17, v18, v19);
    objc_msgSend_volume(v4->_audioSource, v20, v21, v22);
    objc_msgSend_setVolume_(v4->_audioPlayer, v23, v24, v25);
    objc_msgSend_reverbBlend(v4->_audioSource, v26, v27, v28);
    objc_msgSend_setReverbBlend_(v4->_audioPlayer, v29, v30, v31);
  }
  return v4;
}

- (VFXAudioPlayer)initWithAVAudioNode:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VFXAudioPlayer;
  v4 = [(VFXAudioPlayer *)&v7 init];
  if (v4)
  {
    v5 = (AVAudioNode *)a3;
    v4->_customAudioNode = 1;
    v4->_audioPlayer = 0;
    v4->_audioSource = 0;
    v4->_audioNode = v5;
  }
  return v4;
}

+ (id)audioPlayerWithAVAudioNode:(id)a3
{
  v4 = [VFXAudioPlayer alloc];
  id result = (id)objc_msgSend_initWithAVAudioNode_(v4, v5, (uint64_t)a3, v6);
  *((unsigned char *)result + 50) = 1;
  return result;
}

- (void)reset
{
  objc_msgSend_setWillStartPlayback_(self, a2, 0, v2);
  objc_msgSend_setDidFinishPlayback_(self, v4, 0, v5);
  self->_nodeRef = 0;
  self->_world = 0;

  self->_audioSource = 0;
}

+ (id)audioPlayerWithSource:(id)a3
{
  if (qword_1E9DDB2B8 && objc_msgSend_count((void *)qword_1E9DDB2B8, a2, (uint64_t)a3, v3))
  {
    v8 = (void **)objc_msgSend_anyObject((void *)qword_1E9DDB2B8, v5, v6, v7);
    uint64_t v9 = v8;
    objc_msgSend_removeObject_((void *)qword_1E9DDB2B8, v10, (uint64_t)v8, v11);
    id v12 = a3;
    v8[3] = v12;
    uint64_t v13 = v8[2];
    uint64_t v17 = objc_msgSend_renderingAlgorithm(v12, v14, v15, v16);
    objc_msgSend_setRenderingAlgorithm_(v13, v18, v17, v19);
    objc_msgSend_rate(v8[3], v20, v21, v22);
    objc_msgSend_setRate_(v8[2], v23, v24, v25);
    objc_msgSend_volume(v8[3], v26, v27, v28);
    objc_msgSend_setVolume_(v8[2], v29, v30, v31);
    objc_msgSend_reverbBlend(v8[3], v32, v33, v34);
    objc_msgSend_setReverbBlend_(v8[2], v35, v36, v37);
    return v8;
  }
  else
  {
    v39 = [VFXAudioPlayer alloc];
    id result = (id)objc_msgSend_initWithSource_(v39, v40, (uint64_t)a3, v41);
    *((unsigned char *)result + 50) = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXAudioPlayer;
  [(VFXAudioPlayer *)&v3 dealloc];
}

- (void)setNodeRef:(__CFXNode *)a3
{
  self->_nodeRef = a3;
  if (a3) {
    self->_world = (__CFXWorld *)sub_1B63F4F54(a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  }
}

- (__CFXNode)nodeRef
{
  return self->_nodeRef;
}

- (void)play
{
  audioSource = self->_audioSource;
  if (!audioSource || self->_customAudioNode) {
    return;
  }
  audioPlayer = self->_audioPlayer;
  uint64_t v7 = objc_msgSend_audioBuffer(audioSource, a2, v2, v3);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1B653F524;
  block[3] = &unk_1E61422C0;
  block[4] = self;
  objc_msgSend_setCompleted_(self, v8, 0, v9);
  int shouldStream = objc_msgSend_shouldStream(self->_audioSource, v10, v11, v12);
  nodeRef = self->_nodeRef;
  if (nodeRef) {
    CFRetain(self->_nodeRef);
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1B653F57C;
  v28[3] = &unk_1E6143FE8;
  v28[6] = block;
  v28[7] = nodeRef;
  v28[4] = self;
  v28[5] = audioPlayer;
  if (v7)
  {
    unsigned int v18 = objc_msgSend_loops(self->_audioSource, v13, v14, v15);
    objc_msgSend_scheduleBuffer_atTime_options_completionHandler_(audioPlayer, v19, v7, 0, v18, v28);
LABEL_9:
    char v22 = 1;
    goto LABEL_11;
  }
  if (shouldStream)
  {
    uint64_t v20 = objc_msgSend_audioFile(self->_audioSource, v13, v14, v15);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1B653F6A8;
    v27[3] = &unk_1E6144010;
    v27[4] = self;
    v27[5] = audioPlayer;
    v27[6] = v28;
    v27[7] = nodeRef;
    objc_msgSend_scheduleFile_atTime_completionHandler_(audioPlayer, v21, v20, 0, v27);
    goto LABEL_9;
  }
  char v22 = 0;
LABEL_11:
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1B653F82C;
  v26[3] = &unk_1E61422C0;
  v26[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v26);
  if ((v22 & 1) == 0)
  {
    v23 = self->_nodeRef;
    if (v23) {
      CFRelease(v23);
    }
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_msgSend_setCompleted_(self, v24, 1, v25);
  }
}

- (void)recycle
{
  objc_sync_enter(self);
  objc_msgSend_reset(self, v3, v4, v5);
  uint64_t v9 = (void *)qword_1E9DDB2B8;
  if (!qword_1E9DDB2B8)
  {
    qword_1E9DDB2B8 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v6, v7, v8);
    id v10 = (id)qword_1E9DDB2B8;
    uint64_t v9 = (void *)qword_1E9DDB2B8;
  }
  objc_msgSend_addObject_(v9, v6, (uint64_t)self, v8);

  objc_sync_exit(self);
}

- (id)audioBufferFormat
{
  return (id)objc_msgSend_audioBufferFormat(self->_audioSource, a2, v2, v3);
}

- (id)willStartPlayback
{
  return self->willStartPlayback;
}

- (void)setWillStartPlayback:(id)a3
{
}

- (id)didFinishPlayback
{
  return self->didFinishPlayback;
}

- (void)setDidFinishPlayback:(id)a3
{
}

- (AVAudioNode)audioNode
{
  return self->_audioNode;
}

- (AVAudioPlayerNode)audioPlayer
{
  return self->_audioPlayer;
}

- (VFXAudioSource)audioSource
{
  return self->_audioSource;
}

- (__CFXWorld)world
{
  return self->_world;
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)customAudioNode
{
  return self->_customAudioNode;
}

@end