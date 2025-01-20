@interface VFXMTLRenderPipeline
- (BOOL)matchesRenderPassDescriptor:(id)a3;
- (MTLFunction)fragmentFunction;
- (MTLFunction)vertexFunction;
- (MTLRenderPipelineState)state;
- (MTLVertexDescriptor)vertexDescriptor;
- (NSArray)frameBufferBindings;
- (NSArray)lightBufferBindings;
- (NSArray)nodeBufferBindings;
- (NSArray)passBufferBindings;
- (NSArray)shadableBufferBindings;
- (VFXMTLRenderPipeline)init;
- (id)description;
- (unsigned)vertexBuffersUsageMask;
- (void)_computeUsageForBindings:(id)a3 function:(id)a4;
- (void)dealloc;
- (void)setFragmentFunction:(id)a3;
- (void)setFrameBufferBindings:(id)a3;
- (void)setLightBufferBindings:(id)a3;
- (void)setNodeBufferBindings:(id)a3;
- (void)setPassBufferBindings:(id)a3;
- (void)setShadableBufferBindings:(id)a3;
- (void)setState:(id)a3;
- (void)setVertexDescriptor:(id)a3;
- (void)setVertexFunction:(id)a3;
@end

@implementation VFXMTLRenderPipeline

- (VFXMTLRenderPipeline)init
{
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLRenderPipeline;
  result = [(VFXMTLRenderPipeline *)&v3 init];
  if (result) {
    result->_worldBuffer = ($E8FEF9D34A3DFDCB69CDC2374B44012F)-1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLRenderPipeline;
  [(VFXMTLRenderPipeline *)&v3 dealloc];
}

- (id)description
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_string(MEMORY[0x1E4F28E78], a2, v2, v3);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  objc_msgSend_appendFormat_(v5, v8, @"<%@: %p>", v9, v7, self);
  objc_msgSend_appendFormat_(v5, v10, @"<state: %@>", v11, self->_state);
  if (self->_frameBufferBindings)
  {
    objc_msgSend_appendString_(v5, v12, @"\n\tFrameBuffer bindings:\n", v13);
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    frameBufferBindings = self->_frameBufferBindings;
    uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(frameBufferBindings, v15, (uint64_t)&v98, (uint64_t)v106, 16);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v99;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v99 != v18) {
            objc_enumerationMutation(frameBufferBindings);
          }
          v20 = *(void **)(*((void *)&v98 + 1) + 8 * i);
          objc_msgSend_appendString_(v5, v12, @"\t\t", v13);
          uint64_t v24 = objc_msgSend_name(v20, v21, v22, v23);
          objc_msgSend_appendString_(v5, v25, v24, v26);
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(frameBufferBindings, v12, (uint64_t)&v98, (uint64_t)v106, 16);
      }
      while (v17);
    }
  }
  if (self->_nodeBufferBindings)
  {
    objc_msgSend_appendString_(v5, v12, @"\n\tNode bindings:\n", v13);
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    nodeBufferBindings = self->_nodeBufferBindings;
    uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(nodeBufferBindings, v28, (uint64_t)&v94, (uint64_t)v105, 16);
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v95;
      do
      {
        for (uint64_t j = 0; j != v30; ++j)
        {
          if (*(void *)v95 != v31) {
            objc_enumerationMutation(nodeBufferBindings);
          }
          v33 = *(void **)(*((void *)&v94 + 1) + 8 * j);
          objc_msgSend_appendString_(v5, v12, @"\t\t", v13);
          uint64_t v37 = objc_msgSend_name(v33, v34, v35, v36);
          objc_msgSend_appendString_(v5, v38, v37, v39);
        }
        uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(nodeBufferBindings, v12, (uint64_t)&v94, (uint64_t)v105, 16);
      }
      while (v30);
    }
  }
  if (self->_passBufferBindings)
  {
    objc_msgSend_appendString_(v5, v12, @"\n\tPass bindings:\n", v13);
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    passBufferBindings = self->_passBufferBindings;
    uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(passBufferBindings, v41, (uint64_t)&v90, (uint64_t)v104, 16);
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v91;
      do
      {
        for (uint64_t k = 0; k != v43; ++k)
        {
          if (*(void *)v91 != v44) {
            objc_enumerationMutation(passBufferBindings);
          }
          v46 = *(void **)(*((void *)&v90 + 1) + 8 * k);
          objc_msgSend_appendString_(v5, v12, @"\t\t", v13);
          uint64_t v50 = objc_msgSend_name(v46, v47, v48, v49);
          objc_msgSend_appendString_(v5, v51, v50, v52);
        }
        uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(passBufferBindings, v12, (uint64_t)&v90, (uint64_t)v104, 16);
      }
      while (v43);
    }
  }
  if (self->_shadableBufferBindings)
  {
    objc_msgSend_appendString_(v5, v12, @"\n\tShadable bindings:\n", v13);
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    shadableBufferBindings = self->_shadableBufferBindings;
    uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(shadableBufferBindings, v54, (uint64_t)&v86, (uint64_t)v103, 16);
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v87;
      do
      {
        for (uint64_t m = 0; m != v56; ++m)
        {
          if (*(void *)v87 != v57) {
            objc_enumerationMutation(shadableBufferBindings);
          }
          v59 = *(void **)(*((void *)&v86 + 1) + 8 * m);
          objc_msgSend_appendString_(v5, v12, @"\t\t", v13);
          uint64_t v63 = objc_msgSend_name(v59, v60, v61, v62);
          objc_msgSend_appendString_(v5, v64, v63, v65);
        }
        uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(shadableBufferBindings, v12, (uint64_t)&v86, (uint64_t)v103, 16);
      }
      while (v56);
    }
  }
  if (self->_lightBufferBindings)
  {
    objc_msgSend_appendString_(v5, v12, @"\n\tLight bindings:\n", v13);
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    lightBufferBindings = self->_lightBufferBindings;
    uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(lightBufferBindings, v67, (uint64_t)&v82, (uint64_t)v102, 16);
    if (v68)
    {
      uint64_t v71 = v68;
      uint64_t v72 = *(void *)v83;
      do
      {
        for (uint64_t n = 0; n != v71; ++n)
        {
          if (*(void *)v83 != v72) {
            objc_enumerationMutation(lightBufferBindings);
          }
          v74 = *(void **)(*((void *)&v82 + 1) + 8 * n);
          objc_msgSend_appendString_(v5, v69, @"\t\t", v70);
          uint64_t v78 = objc_msgSend_name(v74, v75, v76, v77);
          objc_msgSend_appendString_(v5, v79, v78, v80);
        }
        uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(lightBufferBindings, v69, (uint64_t)&v82, (uint64_t)v102, 16);
      }
      while (v71);
    }
  }
  return v5;
}

- (BOOL)matchesRenderPassDescriptor:(id)a3
{
  uint64_t v6 = 0;
  p_renderPassDesc = &self->_renderPassDesc;
  while (1)
  {
    v8 = objc_msgSend_colorAttachments(a3, a2, (uint64_t)a3, v3);
    uint64_t v11 = objc_msgSend_objectAtIndexedSubscript_(v8, v9, v6, v10);
    v15 = objc_msgSend_texture(v11, v12, v13, v14);
    unint64_t v16 = p_renderPassDesc->colorFormat[v6];
    if (v16 != objc_msgSend_pixelFormat(v15, v17, v18, v19)) {
      break;
    }
    if (v15)
    {
      uint64_t sampleCount = self->_renderPassDesc.sampleCount;
      if (objc_msgSend_sampleCount(v15, a2, (uint64_t)a3, v3) != sampleCount) {
        break;
      }
    }
    if (++v6 == 8)
    {
      v21 = objc_msgSend_depthAttachment(a3, a2, (uint64_t)a3, v3);
      v25 = objc_msgSend_texture(v21, v22, v23, v24);
      unint64_t depthFormat = self->_renderPassDesc.depthFormat;
      if (depthFormat == objc_msgSend_pixelFormat(v25, v27, v28, v29))
      {
        if (!v25 || (uint64_t v33 = self->_renderPassDesc.sampleCount, objc_msgSend_sampleCount(v25, v30, v31, v32) == v33))
        {
          v34 = objc_msgSend_stencilAttachment(a3, v30, v31, v32);
          v38 = objc_msgSend_texture(v34, v35, v36, v37);
          unint64_t stencilFormat = self->_renderPassDesc.stencilFormat;
          if (stencilFormat == objc_msgSend_pixelFormat(v38, v40, v41, v42))
          {
            if (!v38) {
              return 1;
            }
            uint64_t v46 = self->_renderPassDesc.sampleCount;
            if (objc_msgSend_sampleCount(v38, v43, v44, v45) == v46) {
              return 1;
            }
          }
        }
      }
      return 0;
    }
  }
  return 0;
}

- (void)_computeUsageForBindings:(id)a3 function:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_functionType(a4, a2, (uint64_t)a3, (uint64_t)a4);
  int v21 = sub_1B64D86C8(v6, v7, v8, v9, v10, v11, v12, v13);
  if (v21 >= 2) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Bad stage", v15, v16, v17, v18, v19, v20, (uint64_t)"stage < kCFXFXProgramStageCount");
  }
  buffersUsageMasuint64_t k = self->_buffersUsageMask;
  self->_buffersUsageMask[v21] = 0;
  texturesUsageMasuint64_t k = self->_texturesUsageMask;
  self->_texturesUsageMask[v21] = 0;
  samplersUsageMasuint64_t k = self->_samplersUsageMask;
  self->_samplersUsageMask[v21] = 0;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v14, (uint64_t)&v40, (uint64_t)v44, 16);
  if (v25)
  {
    uint64_t v29 = v25;
    uint64_t v30 = v21;
    uint64_t v31 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(a3);
        }
        uint64_t v33 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v34 = objc_msgSend_type(v33, v26, v27, v28);
        switch(v34)
        {
          case 0:
            buffersUsageMask[v30] |= 1 << objc_msgSend_index(v33, v26, v27, v28);
            break;
          case 1:
            continue;
          case 2:
            texturesUsageMask[v30] |= 1 << objc_msgSend_index(v33, v26, v27, v28);
            break;
          case 3:
            samplersUsageMask[v30] |= 1 << objc_msgSend_index(v33, v26, v27, v28);
            break;
          default:
            if ((unint64_t)(v34 - 16) >= 2) {
              sub_1B63F2F54(16, @"Error: arg type not supported", v27, v28, v35, v36, v37, v38, v39);
            }
            break;
        }
      }
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v26, (uint64_t)&v40, (uint64_t)v44, 16);
    }
    while (v29);
  }
}

- (unsigned)vertexBuffersUsageMask
{
  return self->_buffersUsageMask[0];
}

- (MTLRenderPipelineState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (MTLVertexDescriptor)vertexDescriptor
{
  return self->_vertexDescriptor;
}

- (void)setVertexDescriptor:(id)a3
{
}

- (MTLFunction)vertexFunction
{
  return self->_vertexFunction;
}

- (void)setVertexFunction:(id)a3
{
}

- (MTLFunction)fragmentFunction
{
  return self->_fragmentFunction;
}

- (void)setFragmentFunction:(id)a3
{
}

- (NSArray)frameBufferBindings
{
  return self->_frameBufferBindings;
}

- (void)setFrameBufferBindings:(id)a3
{
}

- (NSArray)nodeBufferBindings
{
  return self->_nodeBufferBindings;
}

- (void)setNodeBufferBindings:(id)a3
{
}

- (NSArray)lightBufferBindings
{
  return self->_lightBufferBindings;
}

- (void)setLightBufferBindings:(id)a3
{
}

- (NSArray)passBufferBindings
{
  return self->_passBufferBindings;
}

- (void)setPassBufferBindings:(id)a3
{
}

- (NSArray)shadableBufferBindings
{
  return self->_shadableBufferBindings;
}

- (void)setShadableBufferBindings:(id)a3
{
}

@end