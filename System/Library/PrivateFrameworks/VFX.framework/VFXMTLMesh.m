@interface VFXMTLMesh
- (id)description;
- (void)buildTessellationVertexDescriptorIfNeeded;
- (void)dealloc;
@end

@implementation VFXMTLMesh

- (void)buildTessellationVertexDescriptorIfNeeded
{
  if (!self->_tessellationVertexDescriptor)
  {
    vertexDescriptor = self->_vertexDescriptor;
    if (!vertexDescriptor)
    {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v2, v3, v4, v5, v6, v7, (uint64_t)"_vertexDescriptor");
      vertexDescriptor = self->_vertexDescriptor;
    }
    uint64_t v10 = 0;
    self->_tessellationVertexDescriptor = (MTLVertexDescriptor *)objc_msgSend_copy(vertexDescriptor, a2, v2, v3);
    do
    {
      v14 = objc_msgSend_layouts(self->_tessellationVertexDescriptor, v11, v12, v13);
      v17 = objc_msgSend_objectAtIndexedSubscript_(v14, v15, v10, v16);
      objc_msgSend_setStepFunction_(v17, v18, 4, v19);
      ++v10;
    }
    while (v10 != 31);
    self->_tessellationVertexDescriptorHash = objc_msgSend_hash(self->_tessellationVertexDescriptor, v11, v12, v13);
  }
}

- (id)description
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_stringWithFormat_(MEMORY[0x1E4F28E78], a2, @"<VFXMTLMesh: %p\n", v2, self);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  buffers = self->_buffers;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(buffers, v6, (uint64_t)&v27, (uint64_t)v32, 16);
  if (v7)
  {
    uint64_t v10 = v7;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v12) {
          objc_enumerationMutation(buffers);
        }
        objc_msgSend_appendFormat_(v4, v8, @"\tbuffer[%d] : %@\n", v9, v11 + i, *(void *)(*((void *)&v27 + 1) + 8 * i));
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(buffers, v8, (uint64_t)&v27, (uint64_t)v32, 16);
      uint64_t v11 = (v11 + i);
    }
    while (v10);
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  elements = self->_elements;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(elements, v8, (uint64_t)&v23, (uint64_t)v31, 16);
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = 0;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(elements);
        }
        objc_msgSend_appendFormat_(v4, v16, @"\telement[%d] : %@\n", v17, v19 + j, *(void *)(*((void *)&v23 + 1) + 8 * j));
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(elements, v16, (uint64_t)&v23, (uint64_t)v31, 16);
      uint64_t v19 = (v19 + j);
    }
    while (v18);
  }
  objc_msgSend_appendString_(v4, v16, @">", v17);
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLMesh;
  [(VFXMTLMesh *)&v3 dealloc];
}

@end