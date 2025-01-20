@interface ResourceUsageAndRenderStage
- (OptionSet<WebGPU::BindGroupEntryUsage>)entryUsage;
- (ResourceUsageAndRenderStage)initWithUsage:(unint64_t)a3 renderStages:(unint64_t)a4 entryUsage:(OptionSet<WebGPU:(unsigned int)a6 :()variant<WTF:(WTF:(WTF::RefPtr<const WebGPU::ExternalTexture>>)a7 :RefPtr<const)WebGPU::TextureView> :RefPtr<WebGPU::Buffer> BindGroupEntryUsage>)a5 binding:resource:;
- (id).cxx_construct;
- (unint64_t)renderStages;
- (unint64_t)usage;
- (unsigned)binding;
- (variant<WTF::RefPtr<WebGPU::Buffer>,)resource;
- (void)setBinding:(unsigned int)a3;
- (void)setEntryUsage:(OptionSet<WebGPU::BindGroupEntryUsage>)a3;
- (void)setRenderStages:(unint64_t)a3;
- (void)setResource:()variant<WTF:(WTF:(WTF::RefPtr<const WebGPU::ExternalTexture>>)a3 :RefPtr<const)WebGPU::TextureView> :RefPtr<WebGPU::Buffer>;
- (void)setUsage:(unint64_t)a3;
@end

@implementation ResourceUsageAndRenderStage

- (ResourceUsageAndRenderStage)initWithUsage:(unint64_t)a3 renderStages:(unint64_t)a4 entryUsage:(OptionSet<WebGPU:(unsigned int)a6 :()variant<WTF:(WTF:(WTF::RefPtr<const WebGPU::ExternalTexture>>)a7 :RefPtr<const)WebGPU::TextureView> :RefPtr<WebGPU::Buffer> BindGroupEntryUsage>)a5 binding:resource:
{
  m_ptr = a7.__impl_.__data.__head.__value.m_ptr;
  v18.receiver = self;
  v18.super_class = (Class)ResourceUsageAndRenderStage;
  v12 = [(ResourceUsageAndRenderStage *)&v18 init];
  v13 = v12;
  if (v12)
  {
    v12->_usage = a3;
    v12->_renderStages = a4;
    v12->_entryUsage = a5;
    v12->_binding = a6;
    uint64_t index = v12->_resource.__impl_.__index;
    uint64_t v15 = *((unsigned int *)m_ptr + 2);
    if (index == -1)
    {
      if (v15 == -1) {
        goto LABEL_7;
      }
    }
    else if (v15 == -1)
    {
      ((void (*)(variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> **, variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> *))off_1ECABB288[index])(&p_resource, &v12->_resource);
      v13->_resource.__impl_.__uint64_t index = -1;
LABEL_7:
      v16 = v13;
      goto LABEL_8;
    }
    p_resource = &v12->_resource;
    ((void (*)(variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> **))off_1ECABB2A0[v15])(&p_resource);
    goto LABEL_7;
  }
LABEL_8:

  return v13;
}

- (unint64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(unint64_t)a3
{
  self->_usage = a3;
}

- (unint64_t)renderStages
{
  return self->_renderStages;
}

- (void)setRenderStages:(unint64_t)a3
{
  self->_renderStages = a3;
}

- (OptionSet<WebGPU::BindGroupEntryUsage>)entryUsage
{
  return self->_entryUsage;
}

- (void)setEntryUsage:(OptionSet<WebGPU::BindGroupEntryUsage>)a3
{
  self->_entryUsage = a3;
}

- (unsigned)binding
{
  return self->_binding;
}

- (void)setBinding:(unsigned int)a3
{
  self->_binding = a3;
}

- (variant<WTF::RefPtr<WebGPU::Buffer>,)resource
{
  uint64_t v3 = v2;
  *(unsigned char *)uint64_t v2 = 0;
  *(_DWORD *)(v2 + 8) = -1;
  uint64_t index = self->_resource.__impl_.__index;
  if (index != -1)
  {
    self = (ResourceUsageAndRenderStage *)((uint64_t (*)(unsigned char *, uint64_t, variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> *))off_1ECABB2B8[index])(v5, v2, &self->_resource);
    *(_DWORD *)(v3 + 8) = index;
  }
  *(void *)&result.__impl_.__uint64_t index = a2;
  result.__impl_.__data.__head.__value.m_ptr = (Buffer *)self;
  return result;
}

- (void)setResource:()variant<WTF:(WTF:(WTF::RefPtr<const WebGPU::ExternalTexture>>)a3 :RefPtr<const)WebGPU::TextureView> :RefPtr<WebGPU::Buffer>
{
  uint64_t index = self->_resource.__impl_.__index;
  uint64_t v4 = *((unsigned int *)a3.__impl_.__data.__head.__value.m_ptr + 2);
  if (index != -1)
  {
    if (v4 == -1)
    {
      ((void (*)(char *, variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> *))off_1ECABB288[index])(&v7, &self->_resource);
      self->_resource.__impl_.__uint64_t index = -1;
      return;
    }
LABEL_6:
    p_resource = &self->_resource;
    ((void (*)(variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> **))off_1ECABB2A0[v4])(&p_resource);
    return;
  }
  if (v4 != -1) {
    goto LABEL_6;
  }
}

- (void).cxx_destruct
{
  uint64_t index = self->_resource.__impl_.__index;
  if (index != -1) {
    ((void (*)(char *, variant<WTF::RefPtr<WebGPU::Buffer>, WTF::RefPtr<const WebGPU::TextureView>, WTF::RefPtr<const WebGPU::ExternalTexture>> *))off_1ECABB288[index])(&v4, &self->_resource);
  }
  self->_resource.__impl_.__uint64_t index = -1;
}

- (id).cxx_construct
{
  *((_DWORD *)self + 2) = 0;
  *((void *)self + 4) = 0;
  *((_DWORD *)self + 10) = 0;
  return self;
}

@end