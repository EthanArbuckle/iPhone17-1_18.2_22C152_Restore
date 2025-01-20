@interface MLPEmbeddingLayer
- (MLPEmbeddingLayer)initWithName:(id)a3 inputLength:(unint64_t)a4 vocabSize:(unint64_t)a5 embeddingDimension:(unint64_t)a6;
- (MLPEmbeddingLayer)initWithName:(id)a3 parameters:(id *)a4;
- (MLPOptimizer)optimizer;
- (MPSMatrix)weightGradients;
- (MPSMatrix)weights;
- (MPSMatrix)weights_mom;
- (MPSMatrix)weights_vel;
- (MPSMatrixCopy)matrixCopy;
- (MPSMatrixCopy)matrixCopyFilter;
- (MPSMatrixNeuron)zeroFilter;
- (MPSMatrixSum)sumFilter;
- (MPSVector)offsetVector;
- (NSArray)mlpOptimizers;
- (const)initialWeights;
- (id).cxx_construct;
- (id)forward:(id)a3 input:(id)a4 labels:(id)a5 runInference:(BOOL)a6;
- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5;
- (id)seqBackward:(id)a3 dataBatch:(id)a4 inputGradient:(id)a5;
- (id)seqForward:(id)a3 input:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6;
- (unint64_t)embeddingDimension;
- (unint64_t)vocabSize;
- (void)createKernel;
- (void)seqBackward:(id)a3 inputGradientMatrix:(id)a4 matrixIter:(unint64_t)a5;
- (void)setEmbeddingDimension:(unint64_t)a3;
- (void)setInitialWeights:(const void *)a3;
- (void)setMatrixCopy:(id)a3;
- (void)setMatrixCopyFilter:(id)a3;
- (void)setOffsetVector:(id)a3;
- (void)setOptimizer:(id)a3;
- (void)setSumFilter:(id)a3;
- (void)setVocabSize:(unint64_t)a3;
- (void)setWeightGradients:(id)a3;
- (void)setWeights:(id)a3;
- (void)setWeights_mom:(id)a3;
- (void)setWeights_vel:(id)a3;
- (void)setZeroFilter:(id)a3;
@end

@implementation MLPEmbeddingLayer

- (MLPEmbeddingLayer)initWithName:(id)a3 parameters:(id *)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MLPEmbeddingLayer;
  v7 = [(MLPLayer *)&v24 initWithLayerType:7 name:v6 parameters:a4];
  v10 = v7;
  if (v7)
  {
    objc_msgSend_setInputLength_(v7, v8, a4->var9[0][0], v9);
    objc_msgSend_setInputChannels_(v10, v11, 1, v12);
    objc_msgSend_setOutputLength_(v10, v13, a4->var9[0][0], v14);
    objc_msgSend_setOutputChannels_(v10, v15, a4->var10[0][0] / a4->var9[0][0], v16);
    objc_msgSend_setVocabSize_(v10, v17, a4->var11[0], v18);
    objc_msgSend_setEmbeddingDimension_(v10, v19, a4->var10[0][0] / a4->var9[0][0], v20);
    objc_msgSend_setInitialWeights_(v10, v21, (uint64_t)a4->var13[0], v22);
  }

  return v10;
}

- (MLPEmbeddingLayer)initWithName:(id)a3 inputLength:(unint64_t)a4 vocabSize:(unint64_t)a5 embeddingDimension:(unint64_t)a6
{
  id v10 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MLPEmbeddingLayer;
  v11 = [(MLPLayer *)&v26 initWithLayerType:7 name:v10 neuronType:0 neuronParams:0];
  uint64_t v14 = v11;
  if (v11)
  {
    objc_msgSend_setInputLength_(v11, v12, a4, v13);
    objc_msgSend_setInputChannels_(v14, v15, 1, v16);
    objc_msgSend_setOutputLength_(v14, v17, a4, v18);
    objc_msgSend_setOutputChannels_(v14, v19, a6, v20);
    objc_msgSend_setVocabSize_(v14, v21, a5, v22);
    objc_msgSend_setEmbeddingDimension_(v14, v23, a6, v24);
  }

  return v14;
}

- (NSArray)mlpOptimizers
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend_optimizer(self, a2, v2, v3);
  v8[0] = v4;
  id v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v5, (uint64_t)v8, 1);

  return (NSArray *)v6;
}

- (void)createKernel
{
  v5 = objc_msgSend_network(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_deviceHandler(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_device(v9, v10, v11, v12);

  id v14 = objc_alloc(MEMORY[0x1E4F35648]);
  v17 = objc_msgSend_initWithDevice_(v14, v15, (uint64_t)v13, v16);
  objc_msgSend_setForwardKernel_(self, v18, (uint64_t)v17, v19);

  v23 = objc_msgSend_network(self, v20, v21, v22);
  v27 = objc_msgSend_deviceHandler(v23, v24, v25, v26);
  uint64_t v31 = objc_msgSend_vocabSize(self, v28, v29, v30);
  uint64_t v35 = objc_msgSend_embeddingDimension(self, v32, v33, v34);
  uint64_t v39 = objc_msgSend_initialWeights(self, v36, v37, v38);
  LODWORD(v40) = 1017370378;
  v42 = objc_msgSend_weightMatrixWithRows_columns_stdDev_initialValues_columnMajor_(v27, v41, v31, v35, v39, 0, v40);
  objc_msgSend_setWeights_(self, v43, (uint64_t)v42, v44);

  v48 = objc_msgSend_network(self, v45, v46, v47);
  v52 = objc_msgSend_deviceHandler(v48, v49, v50, v51);
  uint64_t v56 = objc_msgSend_vocabSize(self, v53, v54, v55);
  uint64_t v60 = objc_msgSend_embeddingDimension(self, v57, v58, v59);
  v62 = objc_msgSend_weightMatrixWithRows_columns_stdDev_initialValues_columnMajor_(v52, v61, v56, v60, 0, 0, 0.0);
  objc_msgSend_setWeightGradients_(self, v63, (uint64_t)v62, v64);

  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = sub_19E268C64;
  v112[3] = &unk_1E599D1D0;
  v112[4] = self;
  v65 = (void *)MEMORY[0x19F3BC450](v112);
  v69 = objc_msgSend_network(self, v66, v67, v68);
  v71 = objc_msgSend_optimizerWithNetwork_momentum_velocity_(MLPOptimizer, v70, (uint64_t)v69, (uint64_t)v65, v65);
  objc_msgSend_setOptimizer_(self, v72, (uint64_t)v71, v73);

  id v74 = objc_alloc(MEMORY[0x1E4F35668]);
  v77 = objc_msgSend_initWithDevice_(v74, v75, (uint64_t)v13, v76);
  objc_msgSend_setZeroFilter_(self, v78, (uint64_t)v77, v79);

  v83 = objc_msgSend_zeroFilter(self, v80, v81, v82);
  objc_msgSend_setNeuronType_parameterA_parameterB_parameterC_(v83, v84, 2, v85, 0.0, 0.0, 0.0);

  id v86 = objc_alloc(MEMORY[0x1E4F35620]);
  v90 = objc_msgSend_weights(self, v87, v88, v89);
  uint64_t v94 = objc_msgSend_columns(v90, v91, v92, v93);
  v96 = objc_msgSend_initWithDevice_copyRows_copyColumns_sourcesAreTransposed_destinationsAreTransposed_(v86, v95, (uint64_t)v13, 1, v94, 0, 0);
  objc_msgSend_setMatrixCopyFilter_(self, v97, (uint64_t)v96, v98);

  id v99 = objc_alloc(MEMORY[0x1E4F35688]);
  v103 = objc_msgSend_weights(self, v100, v101, v102);
  uint64_t v107 = objc_msgSend_columns(v103, v104, v105, v106);
  v109 = objc_msgSend_initWithDevice_count_rows_columns_transpose_(v99, v108, (uint64_t)v13, 2, 1, v107, 0);
  objc_msgSend_setSumFilter_(self, v110, (uint64_t)v109, v111);
}

- (id)forward:(id)a3 input:(id)a4 labels:(id)a5 runInference:(BOOL)a6
{
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v146 = a3;
  id v139 = a4;
  id v138 = a5;
  uint64_t v12 = objc_msgSend_network(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_deviceHandler(v12, v13, v14, v15);
  v143 = objc_msgSend_device(v16, v17, v18, v19);

  v23 = objc_msgSend_matrixCopy(self, v20, v21, v22);

  if (!v23)
  {
    id v27 = objc_alloc(MEMORY[0x1E4F35620]);
    uint64_t v31 = objc_msgSend_embeddingDimension(self, v28, v29, v30);
    uint64_t v33 = objc_msgSend_initWithDevice_copyRows_copyColumns_sourcesAreTransposed_destinationsAreTransposed_(v27, v32, (uint64_t)v143, 1, v31, 0, 1);
    objc_msgSend_setMatrixCopy_(self, v34, (uint64_t)v33, v35);
  }
  v36 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v37 = objc_msgSend_count(v139, v24, v25, v26);
  objc_msgSend_arrayWithCapacity_(v36, v38, v37, v39);
  id v142 = (id)objc_claimAutoreleasedReturnValue();
  long long v150 = 0u;
  long long v151 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  id obj = v139;
  uint64_t v144 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v148, (uint64_t)v152, 16);
  if (v144)
  {
    uint64_t v141 = *(void *)v149;
    do
    {
      for (uint64_t i = 0; i != v144; ++i)
      {
        if (*(void *)v149 != v141) {
          objc_enumerationMutation(obj);
        }
        uint64_t v44 = *(void **)(*((void *)&v148 + 1) + 8 * i);
        uint64_t v45 = objc_msgSend_width(v44, v41, v42, v43);
        uint64_t v49 = objc_msgSend_height(v44, v46, v47, v48);
        uint64_t v53 = objc_msgSend_featureChannels(v44, v50, v51, v52);
        id v54 = objc_alloc(MEMORY[0x1E4F35628]);
        unint64_t v55 = v49 * v45 * v53;
        uint64_t v60 = objc_msgSend_initWithDevice_count_(v54, v56, (uint64_t)v143, v55);
        if (v55)
        {
          if (v55 >> 62) {
            sub_19E13D694();
          }
          v61 = (char *)operator new(4 * v55);
          v62 = &v61[4 * v55];
          bzero(v61, 4 * v45 * v49 * v53);
        }
        else
        {
          v62 = 0;
          v61 = 0;
        }
        v63 = objc_msgSend_network(self, v57, v58, v59);
        uint64_t v67 = objc_msgSend_deviceHandler(v63, v64, v65, v66);
        uint64_t v71 = objc_msgSend_dataLayout(v67, v68, v69, v70);
        objc_msgSend_readBytes_dataLayout_imageIndex_(v44, v72, (uint64_t)v61, v71, 0);

        uint64_t v76 = objc_msgSend_network(self, v73, v74, v75);
        v80 = objc_msgSend_deviceHandler(v76, v77, v78, v79);
        uint64_t v84 = objc_msgSend_embeddingDimension(self, v81, v82, v83);
        id v86 = objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v80, v85, v84, v55, v146);

        if (v62 != v61)
        {
          unint64_t v90 = 0;
          do
          {
            float v91 = *(float *)&v61[4 * v90];
            uint64_t v92 = objc_msgSend_weights(self, v87, v88, v89);
            objc_msgSend_setCopyOperationAtIndex_sourceMatrix_destinationMatrix_offsets_(v60, v93, v90, (uint64_t)v92, v86, (int)(v91 + 0.5), v90);

            ++v90;
          }
          while (v90 < (v62 - v61) >> 2);
        }
        uint64_t v94 = objc_msgSend_matrixCopy(self, v87, v88, v89);
        objc_msgSend_encodeToCommandBuffer_copyDescriptor_(v94, v95, (uint64_t)v146, (uint64_t)v60);

        v96 = (void *)MEMORY[0x1E4F35640];
        uint64_t v100 = objc_msgSend_embeddingDimension(self, v97, v98, v99);
        uint64_t v104 = objc_msgSend_embeddingDimension(self, v101, v102, v103);
        v145 = objc_msgSend_matrixDescriptorWithRows_columns_rowBytes_dataType_(v96, v105, 1, v100 * v55, 4 * v55 * v104, 268435488);
        id v106 = objc_alloc(MEMORY[0x1E4F35618]);
        v110 = objc_msgSend_data(v86, v107, v108, v109);
        v112 = objc_msgSend_initWithBuffer_descriptor_(v106, v111, (uint64_t)v110, (uint64_t)v145);

        v116 = objc_msgSend_network(self, v113, v114, v115);
        v120 = objc_msgSend_deviceHandler(v116, v117, v118, v119);
        v124 = objc_msgSend_network(self, v121, v122, v123);
        v128 = objc_msgSend_m2iKernel(v124, v125, v126, v127);
        uint64_t v132 = objc_msgSend_embeddingDimension(self, v129, v130, v131);
        v134 = objc_msgSend_imageFromMatrix_m2iKernel_cmdBuf_width_height_featureChannels_(v120, v133, (uint64_t)v112, (uint64_t)v128, v146, v55, 1, v132);

        objc_msgSend_addObject_(v142, v135, (uint64_t)v134, v136);
        if (v61) {
          operator delete(v61);
        }
      }
      uint64_t v144 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v41, (uint64_t)&v148, (uint64_t)v152, 16);
    }
    while (v144);
  }

  return v142;
}

- (id)seqForward:(id)a3 input:(id)a4 dataBatch:(id)a5 runInference:(BOOL)a6
{
  id v156 = a3;
  id v9 = a4;
  id v151 = a5;
  uint64_t v13 = objc_msgSend_network(self, v10, v11, v12);
  id v152 = v9;
  v17 = objc_msgSend_deviceHandler(v13, v14, v15, v16);
  v154 = objc_msgSend_device(v17, v18, v19, v20);

  uint64_t v24 = objc_msgSend_matrixCopy(self, v21, v22, v23);

  if (!v24)
  {
    id v28 = objc_alloc(MEMORY[0x1E4F35620]);
    uint64_t v32 = objc_msgSend_embeddingDimension(self, v29, v30, v31);
    uint64_t v34 = objc_msgSend_initWithDevice_copyRows_copyColumns_sourcesAreTransposed_destinationsAreTransposed_(v28, v33, (uint64_t)v154, 1, v32, 0, 0);
    objc_msgSend_setMatrixCopy_(self, v35, (uint64_t)v34, v36);
  }
  uint64_t v37 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v38 = objc_msgSend_count(v9, v25, v26, v27);
  objc_msgSend_arrayWithCapacity_(v37, v39, v38, v40);
  id v153 = (id)objc_claimAutoreleasedReturnValue();
  p_wordIDRepetitions = &self->wordIDRepetitions;
  begin = (char *)self->wordIDRepetitions.__begin_;
  end = (char *)self->wordIDRepetitions.__end_;
  if (end != begin)
  {
    do
    {
      uint64_t v47 = end - 24;
      sub_19E26B0E8((uint64_t)(end - 24), *((void **)end - 2));
      end = v47;
    }
    while (v47 != begin);
  }
  self->wordIDRepetitions.__end_ = begin;
  unint64_t v48 = objc_msgSend_count(v9, v41, v42, v43);
  uint64_t v51 = (char *)self->wordIDRepetitions.__end_;
  unint64_t v52 = 0xAAAAAAAAAAAAAAABLL * ((v51 - (char *)p_wordIDRepetitions->__begin_) >> 3);
  uint64_t v53 = (const char *)(v48 - v52);
  if (v48 <= v52)
  {
    if (v48 < v52)
    {
      id v54 = (char *)p_wordIDRepetitions->__begin_ + 24 * v48;
      if (v51 != v54)
      {
        do
        {
          unint64_t v55 = v51 - 24;
          sub_19E26B0E8((uint64_t)(v51 - 24), *((void **)v51 - 2));
          uint64_t v51 = v55;
        }
        while (v55 != v54);
      }
      self->wordIDRepetitions.__end_ = v54;
    }
  }
  else
  {
    sub_19E26B14C(&self->wordIDRepetitions.__begin_, (unint64_t)v53);
  }
  unint64_t v56 = 0;
  v158 = &self->wordIDRepetitions;
  while (v56 < objc_msgSend_count(v9, v53, v49, v50))
  {
    uint64_t v59 = objc_msgSend_objectAtIndexedSubscript_(v9, v57, v56, v58);
    uint64_t v63 = objc_msgSend_rows(v59, v60, v61, v62);
    id v64 = objc_alloc(MEMORY[0x1E4F35628]);
    uint64_t v66 = objc_msgSend_initWithDevice_count_(v64, v65, (uint64_t)v154, v63);
    objc_msgSend_data(v59, v67, v68, v69);
    id v70 = objc_claimAutoreleasedReturnValue();
    uint64_t v74 = (const void *)objc_msgSend_contents(v70, v71, v72, v73);

    uint64_t v78 = objc_msgSend_rows(v59, v75, v76, v77);
    uint64_t v82 = v78;
    v161 = 0;
    v162 = 0;
    v155 = v59;
    if (v78)
    {
      if (v78 < 0) {
        sub_19E13D694();
      }
      uint64_t v83 = (char *)operator new(4 * v78);
      uint64_t v84 = &v83[4 * v82];
      v161 = v83;
      memcpy(v83, v74, 4 * v82);
      v162 = v84;
    }
    else
    {
      uint64_t v83 = 0;
      uint64_t v84 = 0;
    }
    uint64_t v85 = objc_msgSend_network(self, v79, v80, v81);
    uint64_t v89 = objc_msgSend_deviceHandler(v85, v86, v87, v88);
    uint64_t v93 = objc_msgSend_embeddingDimension(self, v90, v91, v92);
    v160 = objc_msgSend_tempMatrixWithRows_columns_cmdBuf_(v89, v94, v63, v93, v156);

    if (v84 != v83)
    {
      unint64_t v98 = 0;
      unint64_t v159 = v56;
      v157 = v66;
      do
      {
        uint64_t v99 = (int)(*(float *)&v83[4 * v98] + 0.5);
        uint64_t v100 = (uint64_t)p_wordIDRepetitions->__begin_ + 24 * v56;
        uint64_t v102 = (uint64_t **)(v100 + 8);
        uint64_t v101 = *(uint64_t **)(v100 + 8);
        uint64_t v103 = (uint64_t **)(v100 + 8);
        uint64_t v104 = (uint64_t **)(v100 + 8);
        if (v101)
        {
          while (1)
          {
            while (1)
            {
              uint64_t v104 = (uint64_t **)v101;
              unsigned int v105 = *((_DWORD *)v101 + 8);
              if (v105 <= v99) {
                break;
              }
              uint64_t v101 = *v104;
              uint64_t v103 = v104;
              if (!*v104) {
                goto LABEL_27;
              }
            }
            if (v105 >= v99) {
              break;
            }
            uint64_t v101 = v104[1];
            if (!v101)
            {
              uint64_t v103 = v104 + 1;
              goto LABEL_27;
            }
          }
          uint64_t v107 = v104;
          uint64_t v123 = (char *)v104[6];
          unint64_t v122 = (unint64_t)v104[7];
          if ((unint64_t)v123 >= v122)
          {
LABEL_47:
            v124 = self;
            v125 = (char *)v107[5];
            uint64_t v126 = (v123 - v125) >> 2;
            unint64_t v127 = v126 + 1;
            if ((unint64_t)(v126 + 1) >> 62) {
              sub_19E13D694();
            }
            uint64_t v128 = v122 - (void)v125;
            if (v128 >> 1 > v127) {
              unint64_t v127 = v128 >> 1;
            }
            if ((unint64_t)v128 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v129 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v129 = v127;
            }
            if (v129)
            {
              if (v129 >> 62) {
                sub_19E13C418();
              }
              uint64_t v130 = operator new(4 * v129);
              uint64_t v131 = &v130[4 * v126];
              *uint64_t v131 = v98;
              uint64_t v132 = (uint64_t)(v131 + 1);
              if (v123 == v125) {
                goto LABEL_64;
              }
LABEL_58:
              unint64_t v133 = v123 - 4 - v125;
              if (v133 < 0x2C) {
                goto LABEL_92;
              }
              if ((unint64_t)(v125 - v130) < 0x20) {
                goto LABEL_92;
              }
              uint64_t v134 = (v133 >> 2) + 1;
              uint64_t v135 = 4 * (v134 & 0x7FFFFFFFFFFFFFF8);
              uint64_t v136 = &v123[-v135];
              uint64_t v131 = (_DWORD *)((char *)v131 - v135);
              v137 = &v130[4 * v126 - 16];
              id v138 = v123 - 16;
              uint64_t v139 = v134 & 0x7FFFFFFFFFFFFFF8;
              do
              {
                long long v140 = *(_OWORD *)v138;
                *(v137 - 1) = *((_OWORD *)v138 - 1);
                _OWORD *v137 = v140;
                v137 -= 2;
                v138 -= 32;
                v139 -= 8;
              }
              while (v139);
              uint64_t v123 = v136;
              if (v134 != (v134 & 0x7FFFFFFFFFFFFFF8))
              {
LABEL_92:
                do
                {
                  int v141 = *((_DWORD *)v123 - 1);
                  v123 -= 4;
                  *--uint64_t v131 = v141;
                }
                while (v123 != v125);
              }
            }
            else
            {
              uint64_t v130 = 0;
              uint64_t v131 = (_DWORD *)(4 * v126);
              *(_DWORD *)(4 * v126) = v98;
              uint64_t v132 = 4 * v126 + 4;
              if (v123 != v125) {
                goto LABEL_58;
              }
            }
LABEL_64:
            v107[5] = (uint64_t *)v131;
            v107[6] = (uint64_t *)v132;
            v107[7] = (uint64_t *)&v130[4 * v129];
            if (v125) {
              operator delete(v125);
            }
            self = v124;
            uint64_t v66 = v157;
            goto LABEL_74;
          }
        }
        else
        {
LABEL_27:
          id v106 = operator new(0x40uLL);
          uint64_t v107 = (uint64_t **)v106;
          *((_DWORD *)v106 + 8) = v99;
          v106[6] = 0;
          v106[7] = 0;
          v106[5] = 0;
          *id v106 = 0;
          v106[1] = 0;
          v106[2] = v104;
          void *v103 = v106;
          uint64_t v108 = **(void **)v100;
          uint64_t v109 = v106;
          if (v108)
          {
            *(void *)uint64_t v100 = v108;
            uint64_t v109 = *v103;
          }
          v110 = *v102;
          BOOL v111 = v109 == *v102;
          *((unsigned char *)v109 + 24) = v111;
          if (!v111)
          {
            do
            {
              uint64_t v112 = v109[2];
              if (*(unsigned char *)(v112 + 24)) {
                break;
              }
              v113 = *(uint64_t **)(v112 + 16);
              uint64_t v114 = *v113;
              if (*v113 == v112)
              {
                uint64_t v117 = v113[1];
                if (!v117 || (v118 = *(unsigned __int8 *)(v117 + 24), uint64_t v115 = (unsigned char *)(v117 + 24), v118))
                {
                  if (*(uint64_t **)v112 == v109)
                  {
                    *(unsigned char *)(v112 + 24) = 1;
                    *((unsigned char *)v113 + 24) = 0;
                    uint64_t v121 = *(void *)(v112 + 8);
                    uint64_t *v113 = v121;
                    if (v121) {
                      goto LABEL_44;
                    }
                  }
                  else
                  {
                    uint64_t v119 = *(uint64_t **)(v112 + 8);
                    uint64_t v120 = *v119;
                    *(void *)(v112 + 8) = *v119;
                    if (v120)
                    {
                      *(void *)(v120 + 16) = v112;
                      v113 = *(uint64_t **)(v112 + 16);
                    }
                    v119[2] = (uint64_t)v113;
                    *(void *)(*(void *)(v112 + 16) + 8 * (**(void **)(v112 + 16) != v112)) = v119;
                    *uint64_t v119 = v112;
                    *(void *)(v112 + 16) = v119;
                    v113 = (uint64_t *)v119[2];
                    uint64_t v112 = *v113;
                    *((unsigned char *)v119 + 24) = 1;
                    *((unsigned char *)v113 + 24) = 0;
                    uint64_t v121 = *(void *)(v112 + 8);
                    uint64_t *v113 = v121;
                    if (v121) {
LABEL_44:
                    }
                      *(void *)(v121 + 16) = v113;
                  }
                  *(void *)(v112 + 16) = v113[2];
                  *(void *)(v113[2] + 8 * (*(void *)v113[2] != (void)v113)) = v112;
                  *(void *)(v112 + 8) = v113;
LABEL_71:
                  v113[2] = v112;
                  break;
                }
              }
              else if (!v114 || (v116 = *(unsigned __int8 *)(v114 + 24), uint64_t v115 = (unsigned char *)(v114 + 24), v116))
              {
                if (*(uint64_t **)v112 == v109)
                {
                  uint64_t v145 = v109[1];
                  *(void *)uint64_t v112 = v145;
                  if (v145)
                  {
                    *(void *)(v145 + 16) = v112;
                    v113 = *(uint64_t **)(v112 + 16);
                  }
                  v109[2] = (uint64_t)v113;
                  *(void *)(*(void *)(v112 + 16) + 8 * (**(void **)(v112 + 16) != v112)) = v109;
                  v109[1] = v112;
                  *(void *)(v112 + 16) = v109;
                  v113 = (uint64_t *)v109[2];
                  *((unsigned char *)v109 + 24) = 1;
                  *((unsigned char *)v113 + 24) = 0;
                  uint64_t v112 = v113[1];
                  id v142 = *(uint64_t **)v112;
                  v113[1] = *(void *)v112;
                  if (v142) {
LABEL_69:
                  }
                    v142[2] = (uint64_t)v113;
                }
                else
                {
                  *(unsigned char *)(v112 + 24) = 1;
                  *((unsigned char *)v113 + 24) = 0;
                  uint64_t v112 = v113[1];
                  id v142 = *(uint64_t **)v112;
                  v113[1] = *(void *)v112;
                  if (v142) {
                    goto LABEL_69;
                  }
                }
                *(void *)(v112 + 16) = v113[2];
                *(void *)(v113[2] + 8 * (*(void *)v113[2] != (void)v113)) = v112;
                *(void *)uint64_t v112 = v113;
                goto LABEL_71;
              }
              *(unsigned char *)(v112 + 24) = 1;
              uint64_t v109 = v113;
              *((unsigned char *)v113 + 24) = v113 == v110;
              *uint64_t v115 = 1;
            }
            while (v113 != v110);
          }
          ++*(void *)(v100 + 16);
          uint64_t v123 = (char *)v106[6];
          unint64_t v122 = v106[7];
          if ((unint64_t)v123 >= v122) {
            goto LABEL_47;
          }
        }
        *(_DWORD *)uint64_t v123 = v98;
        uint64_t v132 = (uint64_t)(v123 + 4);
LABEL_74:
        unint64_t v56 = v159;
        v107[6] = (uint64_t *)v132;
        v143 = objc_msgSend_weights(self, v95, v96, v97);
        objc_msgSend_setCopyOperationAtIndex_sourceMatrix_destinationMatrix_offsets_(v66, v144, v98, (uint64_t)v143, v160, v99, v98);

        ++v98;
        uint64_t v83 = v161;
        p_wordIDRepetitions = v158;
      }
      while (v98 < (v162 - v161) >> 2);
    }
    id v146 = objc_msgSend_matrixCopy(self, v95, v96, v97);
    objc_msgSend_encodeToCommandBuffer_copyDescriptor_(v146, v147, (uint64_t)v156, (uint64_t)v66);

    objc_msgSend_addObject_(v153, v148, (uint64_t)v160, v149);
    if (v83) {
      operator delete(v83);
    }

    ++v56;
    id v9 = v152;
  }

  return v153;
}

- (id)seqBackward:(id)a3 dataBatch:(id)a4 inputGradient:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v13 = a5;
  for (unint64_t i = 0; i < objc_msgSend_count(v13, v10, v11, v12); ++i)
  {
    v17 = objc_msgSend_objectAtIndexedSubscript_(v13, v15, i, v16);
    objc_msgSend_seqBackward_inputGradientMatrix_matrixIter_(self, v18, (uint64_t)v8, (uint64_t)v17, i);
  }
  return 0;
}

- (void)seqBackward:(id)a3 inputGradientMatrix:(id)a4 matrixIter:(unint64_t)a5
{
  v188[2] = *MEMORY[0x1E4F143B8];
  id v181 = a3;
  id v8 = a4;
  id v9 = self;
  id v182 = v8;
  begin = (char *)self->wordIDRepetitions.__begin_;
  uint64_t v14 = objc_msgSend_network(v9, v11, v12, v13);
  uint64_t v18 = objc_msgSend_deviceHandler(v14, v15, v16, v17);
  v178 = objc_msgSend_device(v18, v19, v20, v21);

  uint64_t v25 = objc_msgSend_zeroFilter(v9, v22, v23, v24);
  uint64_t v29 = objc_msgSend_weights(v9, v26, v27, v28);
  uint64_t v33 = objc_msgSend_weightGradients(v9, v30, v31, v32);
  objc_msgSend_encodeToCommandBuffer_inputMatrix_biasVector_resultMatrix_(v25, v34, (uint64_t)v181, (uint64_t)v29, 0, v33);
  uint64_t v35 = &begin[24 * a5];

  v184 = v35;
  v41 = *(void **)v35;
  uint64_t v40 = v35 + 8;
  uint64_t v39 = v41;
  if (v41 != v40)
  {
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    do
    {
      if (v39[6] - v39[5] == 4) {
        ++v42;
      }
      else {
        ++v43;
      }
      uint64_t v44 = (void *)v39[1];
      if (v44)
      {
        do
        {
          uint64_t v45 = v44;
          uint64_t v44 = (void *)*v44;
        }
        while (v44);
      }
      else
      {
        do
        {
          uint64_t v45 = (void *)v39[2];
          BOOL v114 = *v45 == (void)v39;
          uint64_t v39 = v45;
        }
        while (!v114);
      }
      uint64_t v39 = v45;
    }
    while (v45 != v40);
    v186 = v9;
    if (v42)
    {
      id v46 = objc_alloc(MEMORY[0x1E4F35628]);
      uint64_t v51 = objc_msgSend_initWithDevice_count_(v46, v47, (uint64_t)v178, v42);
      unint64_t v52 = *(void **)v184;
      if (*(void **)v184 != v40)
      {
        uint64_t v53 = 0;
        do
        {
          uint64_t v54 = v52[6];
          if (v54 - v52[5] == 4)
          {
            uint64_t v55 = *((unsigned int *)v52 + 8);
            uint64_t v56 = *(unsigned int *)(v54 - 4);
            objc_msgSend_incrementReadCount(v182, v48, v49, v50);
            id v57 = v182;
            uint64_t v61 = objc_msgSend_weightGradients(v186, v58, v59, v60);
            objc_msgSend_setCopyOperationAtIndex_sourceMatrix_destinationMatrix_offsets_(v51, v62, v53++, (uint64_t)v57, v61, v56, v55);
          }
          uint64_t v63 = (void *)v52[1];
          if (v63)
          {
            do
            {
              id v64 = v63;
              uint64_t v63 = (void *)*v63;
            }
            while (v63);
          }
          else
          {
            do
            {
              id v64 = (void *)v52[2];
              BOOL v114 = *v64 == (void)v52;
              unint64_t v52 = v64;
            }
            while (!v114);
          }
          unint64_t v52 = v64;
        }
        while (v64 != v40);
      }
      id v9 = v186;
      uint64_t v65 = objc_msgSend_matrixCopyFilter(v186, v48, v49, v50);
      objc_msgSend_encodeToCommandBuffer_copyDescriptor_(v65, v66, (uint64_t)v181, (uint64_t)v51);
    }
    if (v43)
    {
      uint64_t v67 = (void *)MEMORY[0x1E4F35998];
      uint64_t v68 = objc_msgSend_rows(v182, v36, v37, v38);
      v177 = objc_msgSend_vectorDescriptorWithLength_dataType_(v67, v69, 4 * v68, 32);
      id v70 = objc_alloc(MEMORY[0x1E4F35990]);
      uint64_t v72 = objc_msgSend_initWithDevice_descriptor_(v70, v71, (uint64_t)v178, (uint64_t)v177);
      objc_msgSend_setOffsetVector_(v9, v73, (uint64_t)v72, v74);

      uint64_t v78 = objc_msgSend_offsetVector(v9, v75, v76, v77);
      objc_msgSend_data(v78, v79, v80, v81);
      id v82 = objc_claimAutoreleasedReturnValue();
      id v86 = (char *)objc_msgSend_contents(v82, v83, v84, v85);

      unint64_t v90 = objc_msgSend_offsetVector(v9, v87, v88, v89);
      uint64_t v94 = objc_msgSend_data(v90, v91, v92, v93);
      size_t v98 = objc_msgSend_length(v94, v95, v96, v97);
      bzero(v86, v98);

      id v99 = objc_alloc(MEMORY[0x1E4F35688]);
      uint64_t v103 = objc_msgSend_columns(v182, v100, v101, v102);
      unsigned int v105 = objc_msgSend_initWithDevice_count_rows_columns_transpose_(v99, v104, (uint64_t)v178, 2, 1, v103, 0);
      objc_msgSend_setSumFilter_(v9, v106, (uint64_t)v105, v107);

      BOOL v111 = *(void **)v184;
      if (*(void **)v184 != v40)
      {
        uint64_t v185 = 0;
        v180 = v40;
        v179 = v86 + 8;
        do
        {
          v113 = (char *)v111[5];
          uint64_t v112 = (char *)v111[6];
          v183 = v112;
          BOOL v114 = (unint64_t)(v112 - v113) < 5 || v113 == v112;
          if (!v114)
          {
            uint64_t v115 = 2 * v185;
            int v116 = &v179[16 * v185];
            do
            {
              *((_DWORD *)v116 - 2) = *(_DWORD *)v113;
              *(_DWORD *)int v116 = *((_DWORD *)v111 + 8);
              uint64_t v117 = *((unsigned int *)v111 + 8);
              int v118 = objc_msgSend_network(v186, v108, v109, v110);
              unint64_t v122 = objc_msgSend_deviceHandler(v118, v119, v120, v121);
              uint64_t v126 = objc_msgSend_offsetVector(v186, v123, v124, v125);
              uint64_t v130 = objc_msgSend_data(v126, v127, v128, v129);
              objc_msgSend_sendDataToGPU_(v122, v131, (uint64_t)v130, v132);

              uint64_t v136 = objc_msgSend_sumFilter(v186, v133, v134, v135);
              v187[0] = v117;
              v187[1] = 0;
              v187[2] = 0;
              objc_msgSend_setResultMatrixOrigin_(v136, v137, (uint64_t)v187, v138);

              id v142 = objc_msgSend_sumFilter(v186, v139, v140, v141);
              objc_msgSend_incrementReadCount(v182, v143, v144, v145);
              id v146 = v182;
              v188[0] = v146;
              long long v150 = objc_msgSend_weightGradients(v186, v147, v148, v149);
              v188[1] = v150;
              id v152 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v151, (uint64_t)v188, 2);
              id v156 = objc_msgSend_weightGradients(v186, v153, v154, v155);
              v160 = objc_msgSend_offsetVector(v186, v157, v158, v159);
              objc_msgSend_encodeToCommandBuffer_sourceMatrices_resultMatrix_scaleVector_offsetVector_biasVector_startIndex_(v142, v161, (uint64_t)v181, (uint64_t)v152, v156, 0, v160, 0, v115);

              ++v185;
              v113 += 4;
              v116 += 16;
              v115 += 2;
            }
            while (v113 != v183);
          }
          v162 = (void *)v111[1];
          if (v162)
          {
            do
            {
              v163 = v162;
              v162 = (void *)*v162;
            }
            while (v162);
          }
          else
          {
            do
            {
              v163 = (void *)v111[2];
              BOOL v114 = *v163 == (void)v111;
              BOOL v111 = v163;
            }
            while (!v114);
          }
          BOOL v111 = v163;
        }
        while (v163 != v180);
      }

      id v9 = v186;
    }
  }
  v164 = objc_msgSend_optimizer(v9, v36, v37, v38);
  v168 = objc_msgSend_weightGradients(v9, v165, v166, v167);
  v172 = objc_msgSend_weights(v9, v169, v170, v171);
  objc_msgSend_encodeToCommandBuffer_inputGradientMatrix_inputValuesMatrix_(v164, v173, (uint64_t)v181, (uint64_t)v168, v172);

  objc_msgSend_resetReadCount(v182, v174, v175, v176);
}

- (id)generateNode:(id)a3 model:(id)a4 weightIter:(unint64_t *)a5
{
  v163[1] = *MEMORY[0x1E4F143B8];
  id v152 = a3;
  id v153 = a4;
  bzero(v155, 0x2C0uLL);
  v155[4] = 0;
  v155[5] = 0;
  v155[0] = 23;
  uint64_t v11 = objc_msgSend_weights(self, v8, v9, v10);
  uint64_t v15 = objc_msgSend_rows((void *)v11, v12, v13, v14);
  uint64_t v19 = objc_msgSend_weights(self, v16, v17, v18);
  uint64_t v23 = objc_msgSend_columns(v19, v20, v21, v22);
  sub_19E3107A4(v23 * v15);
  uint64_t v25 = v24;

  int v156 = objc_msgSend_inputLength(self, v26, v27, v28);
  LODWORD(v11) = objc_msgSend_outputLength(self, v29, v30, v31);
  int v157 = objc_msgSend_embeddingDimension(self, v32, v33, v34) * v11;
  uint64_t v38 = objc_msgSend_weights(self, v35, v36, v37);
  uint64_t v42 = objc_msgSend_rows(v38, v39, v40, v41);

  id v46 = objc_msgSend_weights(self, v43, v44, v45);
  uint64_t v50 = objc_msgSend_columns(v46, v47, v48, v49);

  uint64_t v54 = objc_msgSend_weights(self, v51, v52, v53);
  uint64_t v58 = objc_msgSend_rowBytes(v54, v55, v56, v57);

  uint64_t v62 = objc_msgSend_network(self, v59, v60, v61);
  uint64_t v66 = objc_msgSend_deviceHandler(v62, v63, v64, v65);
  long long v150 = objc_msgSend_device(v66, v67, v68, v69);

  uint64_t v73 = objc_msgSend_network(self, v70, v71, v72);
  uint64_t v77 = objc_msgSend_deviceHandler(v73, v74, v75, v76);
  uint64_t v149 = a5;
  uint64_t v81 = objc_msgSend_commandQueue(v77, v78, v79, v80);

  id v151 = v81;
  uint64_t v85 = objc_msgSend_commandBuffer(v81, v82, v83, v84);
  uint64_t v89 = objc_msgSend_network(self, v86, v87, v88);
  uint64_t v93 = objc_msgSend_deviceHandler(v89, v90, v91, v92);
  uint64_t v97 = objc_msgSend_weights(self, v94, v95, v96);
  uint64_t v101 = objc_msgSend_data(v97, v98, v99, v100);
  objc_msgSend_importDataFromGPU_cmdBuf_(v93, v102, (uint64_t)v101, (uint64_t)v85);

  v154[0] = MEMORY[0x1E4F143A8];
  v154[1] = 3221225472;
  v154[2] = sub_19E26AB5C;
  v154[3] = &unk_1E599D1F8;
  v154[4] = self;
  v154[5] = v42;
  v154[6] = v50;
  v154[7] = v25;
  v154[8] = v58;
  objc_msgSend_addCompletedHandler_(v85, v103, (uint64_t)v154, v104);
  objc_msgSend_commit(v85, v105, v106, v107);
  objc_msgSend_waitUntilCompleted(v85, v108, v109, v110);
  uint64_t v159 = v25;
  int v158 = objc_msgSend_vocabSize(self, v111, v112, v113);
  v162[0] = &unk_1EF0B3448;
  v162[1] = &unk_1EF0B3448;
  BOOL v114 = NSNumber;
  uint64_t v118 = objc_msgSend_inputLength(self, v115, v116, v117);
  uint64_t v121 = objc_msgSend_numberWithUnsignedInteger_(v114, v119, v118, v120);
  v162[2] = v121;
  uint64_t v123 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v122, (uint64_t)v162, 3);
  v163[0] = v123;
  uint64_t v125 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v124, (uint64_t)v163, 1);

  v160[0] = &unk_1EF0B3448;
  uint64_t v126 = NSNumber;
  uint64_t v130 = objc_msgSend_outputLength(self, v127, v128, v129);
  unint64_t v133 = objc_msgSend_numberWithUnsignedInteger_(v126, v131, v130, v132);
  v160[1] = v133;
  uint64_t v134 = NSNumber;
  uint64_t v138 = objc_msgSend_embeddingDimension(self, v135, v136, v137);
  uint64_t v141 = objc_msgSend_numberWithUnsignedInteger_(v134, v139, v138, v140);
  v160[2] = v141;
  v143 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v142, (uint64_t)v160, 3);
  v161 = v143;
  uint64_t v145 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v144, (uint64_t)&v161, 1);

  v147 = objc_msgSend_generateNode_model_weightIter_params_inputChunks_outputChunks_(self, v146, (uint64_t)v152, (uint64_t)v153, v149, v155, v125, v145);

  return v147;
}

- (unint64_t)vocabSize
{
  return self->_vocabSize;
}

- (void)setVocabSize:(unint64_t)a3
{
  self->_vocabSize = a3;
}

- (unint64_t)embeddingDimension
{
  return self->_embeddingDimension;
}

- (void)setEmbeddingDimension:(unint64_t)a3
{
  self->_embeddingDimension = a3;
}

- (MPSMatrixCopy)matrixCopy
{
  return (MPSMatrixCopy *)objc_getProperty(self, a2, 200, 1);
}

- (void)setMatrixCopy:(id)a3
{
}

- (const)initialWeights
{
  return self->_initialWeights;
}

- (void)setInitialWeights:(const void *)a3
{
  self->_initialWeights = a3;
}

- (MPSMatrix)weights
{
  return (MPSMatrix *)objc_getProperty(self, a2, 216, 1);
}

- (void)setWeights:(id)a3
{
}

- (MPSMatrix)weightGradients
{
  return (MPSMatrix *)objc_getProperty(self, a2, 224, 1);
}

- (void)setWeightGradients:(id)a3
{
}

- (MLPOptimizer)optimizer
{
  return (MLPOptimizer *)objc_getProperty(self, a2, 232, 1);
}

- (void)setOptimizer:(id)a3
{
}

- (MPSMatrix)weights_mom
{
  return (MPSMatrix *)objc_getProperty(self, a2, 240, 1);
}

- (void)setWeights_mom:(id)a3
{
}

- (MPSMatrix)weights_vel
{
  return (MPSMatrix *)objc_getProperty(self, a2, 248, 1);
}

- (void)setWeights_vel:(id)a3
{
}

- (MPSMatrixNeuron)zeroFilter
{
  return (MPSMatrixNeuron *)objc_getProperty(self, a2, 256, 1);
}

- (void)setZeroFilter:(id)a3
{
}

- (MPSMatrixSum)sumFilter
{
  return (MPSMatrixSum *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSumFilter:(id)a3
{
}

- (MPSMatrixCopy)matrixCopyFilter
{
  return (MPSMatrixCopy *)objc_getProperty(self, a2, 272, 1);
}

- (void)setMatrixCopyFilter:(id)a3
{
}

- (MPSVector)offsetVector
{
  return (MPSVector *)objc_getProperty(self, a2, 280, 1);
}

- (void)setOffsetVector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsetVector, 0);
  objc_storeStrong((id *)&self->_matrixCopyFilter, 0);
  objc_storeStrong((id *)&self->_sumFilter, 0);
  objc_storeStrong((id *)&self->_zeroFilter, 0);
  objc_storeStrong((id *)&self->_weights_vel, 0);
  objc_storeStrong((id *)&self->_weights_mom, 0);
  objc_storeStrong((id *)&self->_optimizer, 0);
  objc_storeStrong((id *)&self->_weightGradients, 0);
  objc_storeStrong((id *)&self->_weights, 0);
  objc_storeStrong((id *)&self->_matrixCopy, 0);
  begin = self->weightsInitial.__begin_;
  if (begin)
  {
    self->weightsInitial.__end_ = begin;
    operator delete(begin);
  }
  p_wordIDRepetitions = &self->wordIDRepetitions;
  v5 = (char *)self->wordIDRepetitions.__begin_;
  if (v5)
  {
    end = (char *)self->wordIDRepetitions.__end_;
    uint64_t v7 = self->wordIDRepetitions.__begin_;
    if (end != v5)
    {
      do
      {
        id v8 = end - 24;
        sub_19E26B0E8((uint64_t)(end - 24), *((void **)end - 2));
        end = v8;
      }
      while (v8 != v5);
      uint64_t v7 = p_wordIDRepetitions->__begin_;
    }
    p_wordIDRepetitions->__end_ = v5;
    operator delete(v7);
  }
}

- (id).cxx_construct
{
  *((void *)self + 18) = 0;
  *((void *)self + 19) = 0;
  *((void *)self + 17) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 22) = 0;
  *((void *)self + 20) = 0;
  return self;
}

@end