@interface VSSpeechEngineVoiceResource
- (id).cxx_construct;
- (shared_ptr<SiriTTS::VoiceResource>)resource;
- (void)setResource:(shared_ptr<SiriTTS::VoiceResource>)a3;
@end

@implementation VSSpeechEngineVoiceResource

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_resource.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)setResource:(shared_ptr<SiriTTS::VoiceResource>)a3
{
}

- (shared_ptr<SiriTTS::VoiceResource>)resource
{
  objc_copyCppObjectAtomic(v2, &self->_resource, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

@end