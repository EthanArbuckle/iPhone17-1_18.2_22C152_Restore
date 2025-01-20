@interface TTSSiriVoiceResource
- (NSData)resourceData;
- (NSString)resourceName;
- (NSString)resourceString;
- (TTSRuleset)ruleSet;
- (id).cxx_construct;
- (shared_ptr<SiriTTS::VoiceResource>)siriVoiceResource;
- (unint64_t)type;
- (void)setResourceData:(id)a3;
- (void)setResourceName:(id)a3;
- (void)setResourceString:(id)a3;
- (void)setRuleSet:(id)a3;
- (void)setSiriVoiceResource:(shared_ptr<SiriTTS::VoiceResource>)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation TTSSiriVoiceResource

- (NSString)resourceName
{
  return self->_resourceName;
}

- (void)setResourceName:(id)a3
{
}

- (NSString)resourceString
{
  return self->_resourceString;
}

- (void)setResourceString:(id)a3
{
}

- (NSData)resourceData
{
  return self->_resourceData;
}

- (void)setResourceData:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (shared_ptr<SiriTTS::VoiceResource>)siriVoiceResource
{
  cntrl = self->_siriVoiceResource.__cntrl_;
  *v2 = self->_siriVoiceResource.__ptr_;
  v2[1] = (VoiceResource *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (VoiceResource *)self;
  return result;
}

- (void)setSiriVoiceResource:(shared_ptr<SiriTTS::VoiceResource>)a3
{
  v4 = *(VoiceResource **)a3.__ptr_;
  uint64_t v3 = *((void *)a3.__ptr_ + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_siriVoiceResource.__cntrl_;
  self->_siriVoiceResource.__ptr_ = v4;
  self->_siriVoiceResource.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (TTSRuleset)ruleSet
{
  return self->_ruleSet;
}

- (void)setRuleSet:(id)a3
{
}

- (void).cxx_destruct
{
  cntrl = self->_siriVoiceResource.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_ruleSet, 0);
  objc_storeStrong((id *)&self->_resourceData, 0);
  objc_storeStrong((id *)&self->_resourceString, 0);
  objc_storeStrong((id *)&self->_resourceName, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end