@interface SemanticOutputCollection
- (BOOL)add:(id)a3 with:(id)a4;
- (BOOL)isCompatibleWith:(id)a3;
- (BOOL)useDepthFilter;
- (MPSImageSpatioTemporalGuidedFilter)spatioTemporalFilter;
- (NSMutableArray)semanticOutputs;
- (NSMutableDictionary)_destinationTextures;
- (NSMutableDictionary)_sourceTextures;
- (NSNumber)iterations;
- (SemanticOutputCollection)init;
- (id)description;
- (int)allocateResources:(id)a3;
- (void)setIterations:(id)a3;
- (void)setSemanticOutputs:(id)a3;
- (void)setSpatioTemporalFilter:(id)a3;
- (void)setUseDepthFilter:(BOOL)a3;
- (void)set_destinationTextures:(id)a3;
- (void)set_sourceTextures:(id)a3;
@end

@implementation SemanticOutputCollection

- (SemanticOutputCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)SemanticOutputCollection;
  v2 = [(SemanticOutputCollection *)&v6 init];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  objc_msgSend_setSemanticOutputs_(v2, v4, (uint64_t)v3);

  return v2;
}

- (id)description
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v4 = objc_msgSend_semanticOutputs(self, a2, v2);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v41, v45, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    LODWORD(v10) = 0;
    uint64_t v11 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = objc_msgSend_unsignedIntValue(*(void **)(*((void *)&v41 + 1) + 8 * i), v7, v8) | v10;
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v41, v45, 16);
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  v13 = NSString;
  v15 = objc_msgSend_FigMattingOutputToShortString_(FigMatting, v14, v10);
  uint64_t v18 = objc_msgSend_width(self->_spatioTemporalFilterDescriptor, v16, v17);
  uint64_t v21 = objc_msgSend_height(self->_spatioTemporalFilterDescriptor, v19, v20);
  uint64_t v24 = objc_msgSend_kernelSpatialDiameter(self->_spatioTemporalFilterDescriptor, v22, v23);
  objc_msgSend_epsilon(self->_spatioTemporalFilterDescriptor, v25, v26);
  double v28 = v27;
  uint64_t v31 = objc_msgSend_sourceChannels(self->_spatioTemporalFilterDescriptor, v29, v30);
  uint64_t v34 = objc_msgSend_guideChannels(self->_spatioTemporalFilterDescriptor, v32, v33);
  v37 = objc_msgSend_iterations(self, v35, v36);
  v39 = objc_msgSend_stringWithFormat_(v13, v38, @"<[%@], %lux%lu, d: %lu, eps: %f, sc: %lu, gc: %lu, i: %@>", v15, v18, v21, v24, *(void *)&v28, v31, v34, v37);

  return v39;
}

- (BOOL)add:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int isCompatibleWith = objc_msgSend_isCompatibleWith_(self, v8, (uint64_t)v7);
  if (isCompatibleWith)
  {
    objc_msgSend_addObject_(self->_semanticOutputs, v9, (uint64_t)v6);
    if (self->_spatioTemporalFilterDescriptor)
    {
      uint64_t v13 = objc_msgSend_count(self->_semanticOutputs, v11, v12);
      objc_msgSend_setSourceChannels_(self->_spatioTemporalFilterDescriptor, v14, v13);
    }
    else
    {
      v15 = (void *)MEMORY[0x263F132D0];
      uint64_t v16 = objc_msgSend_width(v7, v11, v12);
      uint64_t v19 = objc_msgSend_height(v7, v17, v18);
      uint64_t v22 = objc_msgSend_kernelSpatialDiameter(v7, v20, v21);
      objc_msgSend_epsilon(v7, v23, v24);
      int v26 = v25;
      int v29 = objc_msgSend_useDepthFilter(v7, v27, v28);
      uint64_t v32 = 3;
      if (v29) {
        uint64_t v32 = 4;
      }
      LODWORD(v31) = v26;
      objc_msgSend_filterDescriptorWithWidth_height_arrayLength_kernelSpatialDiameter_kernelTemporalDiameter_epsilon_sourceChannels_guideChannels_preallocateIntermediates_(v15, v30, v16, v19, 1, v22, 1, 1, v31, v32, 1);
      uint64_t v33 = (MPSImageSpatioTemporalGuidedFilterDescriptor *)objc_claimAutoreleasedReturnValue();
      spatioTemporalFilterDescriptor = self->_spatioTemporalFilterDescriptor;
      self->_spatioTemporalFilterDescriptor = v33;

      v35 = NSNumber;
      uint64_t v38 = objc_msgSend_iterations(v7, v36, v37);
      v40 = objc_msgSend_numberWithUnsignedInt_(v35, v39, v38);
      objc_msgSend_setIterations_(self, v41, (uint64_t)v40);

      uint64_t v44 = objc_msgSend_useDepthFilter(v7, v42, v43);
      objc_msgSend_setUseDepthFilter_(self, v45, v44);
    }
  }

  return isCompatibleWith;
}

- (BOOL)isCompatibleWith:(id)a3
{
  id v6 = a3;
  spatioTemporalFilterDescriptor = self->_spatioTemporalFilterDescriptor;
  if (spatioTemporalFilterDescriptor)
  {
    uint64_t v8 = objc_msgSend_width(spatioTemporalFilterDescriptor, v4, v5);
    if (v8 != objc_msgSend_width(v6, v9, v10)) {
      goto LABEL_10;
    }
    uint64_t v13 = objc_msgSend_height(self->_spatioTemporalFilterDescriptor, v11, v12);
    if (v13 != objc_msgSend_height(v6, v14, v15)) {
      goto LABEL_10;
    }
    uint64_t v18 = objc_msgSend_kernelSpatialDiameter(self->_spatioTemporalFilterDescriptor, v16, v17);
    if (v18 != objc_msgSend_kernelSpatialDiameter(v6, v19, v20)) {
      goto LABEL_10;
    }
    objc_msgSend_epsilon(self->_spatioTemporalFilterDescriptor, v21, v22);
    float v24 = v23;
    objc_msgSend_epsilon(v6, v25, v26);
    if (vabds_f32(v24, v29) >= 1.0e-10) {
      goto LABEL_10;
    }
    uint64_t v30 = objc_msgSend_guideChannels(self->_spatioTemporalFilterDescriptor, v27, v28);
    int v33 = objc_msgSend_useDepthFilter(v6, v31, v32);
    uint64_t v36 = 3;
    if (v33) {
      uint64_t v36 = 4;
    }
    if (v30 == v36)
    {
      uint64_t v37 = objc_msgSend_iterations(self, v34, v35);
      uint64_t v38 = NSNumber;
      uint64_t v41 = objc_msgSend_iterations(v6, v39, v40);
      uint64_t v43 = objc_msgSend_numberWithUnsignedInt_(v38, v42, v41);
      char isEqualToNumber = objc_msgSend_isEqualToNumber_(v37, v44, (uint64_t)v43);
    }
    else
    {
LABEL_10:
      char isEqualToNumber = 0;
    }
  }
  else
  {
    char isEqualToNumber = 1;
  }

  return isEqualToNumber;
}

- (int)allocateResources:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F132C8];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v9 = objc_msgSend_device(v5, v7, v8);

  uint64_t v11 = objc_msgSend_initWithDevice_filterDescriptor_(v6, v10, (uint64_t)v9, self->_spatioTemporalFilterDescriptor);
  objc_msgSend_setSpatioTemporalFilter_(self, v12, (uint64_t)v11);

  if (self->_spatioTemporalFilter)
  {
    uint64_t v15 = objc_msgSend_spatioTemporalFilter(self, v13, v14);
    uint64_t v18 = objc_msgSend_options(v15, v16, v17);
    objc_msgSend_setOptions_(v15, v19, v18 | 1);

    return 0;
  }
  else
  {
    FigDebugAssert3();
    return -12786;
  }
}

- (MPSImageSpatioTemporalGuidedFilter)spatioTemporalFilter
{
  return self->_spatioTemporalFilter;
}

- (void)setSpatioTemporalFilter:(id)a3
{
}

- (NSMutableArray)semanticOutputs
{
  return self->_semanticOutputs;
}

- (void)setSemanticOutputs:(id)a3
{
}

- (NSNumber)iterations
{
  return self->_iterations;
}

- (void)setIterations:(id)a3
{
}

- (NSMutableDictionary)_sourceTextures
{
  return self->__sourceTextures;
}

- (void)set_sourceTextures:(id)a3
{
}

- (NSMutableDictionary)_destinationTextures
{
  return self->__destinationTextures;
}

- (void)set_destinationTextures:(id)a3
{
}

- (BOOL)useDepthFilter
{
  return self->_useDepthFilter;
}

- (void)setUseDepthFilter:(BOOL)a3
{
  self->_useDepthFilter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__destinationTextures, 0);
  objc_storeStrong((id *)&self->__sourceTextures, 0);
  objc_storeStrong((id *)&self->_iterations, 0);
  objc_storeStrong((id *)&self->_semanticOutputs, 0);
  objc_storeStrong((id *)&self->_spatioTemporalFilter, 0);

  objc_storeStrong((id *)&self->_spatioTemporalFilterDescriptor, 0);
}

@end