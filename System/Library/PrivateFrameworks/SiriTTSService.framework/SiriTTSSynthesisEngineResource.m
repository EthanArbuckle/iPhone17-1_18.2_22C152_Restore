@interface SiriTTSSynthesisEngineResource
- (NSString)mimeType;
- (NSString)path;
- (id).cxx_construct;
- (shared_ptr<SiriTTS::VoiceResource>)handle;
- (void)setHandle:(shared_ptr<SiriTTS::VoiceResource>)a3;
- (void)setMimeType:(id)a3;
- (void)setPath:(id)a3;
@end

@implementation SiriTTSSynthesisEngineResource

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_handle.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)setHandle:(shared_ptr<SiriTTS::VoiceResource>)a3
{
}

- (shared_ptr<SiriTTS::VoiceResource>)handle
{
  objc_copyCppObjectAtomic(v2, &self->_handle, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  result.__cntrl_ = v4;
  result.__ptr_ = v3;
  return result;
}

- (void)setMimeType:(id)a3
{
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setPath:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

@end