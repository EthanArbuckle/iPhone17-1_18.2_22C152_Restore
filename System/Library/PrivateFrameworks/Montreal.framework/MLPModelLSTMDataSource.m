@interface MLPModelLSTMDataSource
- (BOOL)load;
- (MLPModelLSTMDataSource)initWithColumns:(unint64_t)a3 rows:(unint64_t)a4 lstmInputSize:(unint64_t)a5 lstmOutputSize:(unint64_t)a6 weightID:(unint64_t)a7 neuronType:(int)a8 neuronA:(float)a9 neuronB:(float)a10 initialWeights_0:(float *)a11 initialWeights_1:(float *)a12 bias_0:(float *)a13 bias_1:(float *)a14 weightAttributes:(unint64_t)a15 deviceHandler:(id)a16;
- (float)biasTerms;
- (id).cxx_construct;
- (id)descriptor;
- (id)label;
- (unint64_t)bias_size;
- (unint64_t)columns;
- (unint64_t)lstmInputSize;
- (unint64_t)lstmOutputSize;
- (unint64_t)rows;
- (unint64_t)weightID;
- (unint64_t)weight_size;
- (unsigned)dataType;
- (void)initializeWeightsAndBiases:(id)a3;
- (void)loadWithInitialWeights_0:(float *)a3 initialWeights_1:(float *)a4 bias_0:(float *)a5 bias_1:(float *)a6 weightAttributes:(unint64_t)a7;
- (void)purge;
- (void)setColumns:(unint64_t)a3;
- (void)setLstmInputSize:(unint64_t)a3;
- (void)setLstmOutputSize:(unint64_t)a3;
- (void)setRows:(unint64_t)a3;
- (void)setWeightID:(unint64_t)a3;
- (void)weights;
@end

@implementation MLPModelLSTMDataSource

- (MLPModelLSTMDataSource)initWithColumns:(unint64_t)a3 rows:(unint64_t)a4 lstmInputSize:(unint64_t)a5 lstmOutputSize:(unint64_t)a6 weightID:(unint64_t)a7 neuronType:(int)a8 neuronA:(float)a9 neuronB:(float)a10 initialWeights_0:(float *)a11 initialWeights_1:(float *)a12 bias_0:(float *)a13 bias_1:(float *)a14 weightAttributes:(unint64_t)a15 deviceHandler:(id)a16
{
  uint64_t v18 = *(void *)&a8;
  id v25 = a16;
  v51.receiver = self;
  v51.super_class = (Class)MLPModelLSTMDataSource;
  v26 = [(MLPModelLSTMDataSource *)&v51 init];
  v28 = v26;
  if (!v26) {
    goto LABEL_16;
  }
  v26->_weightID = a7;
  v26->_columns = a3;
  v26->_rows = a4;
  v26->_lstmInputSize = a5;
  v26->_lstmOutputSize = a6;
  uint64_t v29 = objc_msgSend_cnnConvolutionDescriptorWithKernelWidth_kernelHeight_inputFeatureChannels_outputFeatureChannels_(MEMORY[0x1E4F353F0], v27, 1, 1, a3, a4);
  desc = v28->_desc;
  v28->_desc = (MPSCNNConvolutionDescriptor *)v29;

  *(float *)&double v31 = a9;
  *(float *)&double v32 = a10;
  objc_msgSend_setNeuronType_parameterA_parameterB_(v28->_desc, v33, v18, v34, v31, v32);
  objc_msgSend_setStrideInPixelsX_(v28->_desc, v35, 1, v36);
  objc_msgSend_setStrideInPixelsY_(v28->_desc, v37, 1, v38);
  unint64_t v40 = a4 * a3;
  if (a4 * a3)
  {
    if (v40 >> 62) {
      sub_19E13D694();
    }
    size_t v41 = 4 * v40;
    v42 = operator new(4 * v40);
    unint64_t v40 = (unint64_t)v42 + 4 * v40;
    bzero(v42, v41);
    p_weight = &v28->_weight;
    begin = v28->_weight.__begin_;
    if (begin) {
      goto LABEL_5;
    }
  }
  else
  {
    v42 = 0;
    p_weight = &v28->_weight;
    begin = v28->_weight.__begin_;
    if (begin)
    {
LABEL_5:
      v28->_weight.__end_ = begin;
      operator delete(begin);
      p_weight->__begin_ = 0;
      p_weight->__end_ = 0;
      p_weight->__end_cap_.__value_ = 0;
    }
  }
  v28->_weight.__begin_ = (float *)v42;
  v28->_weight.__end_ = (float *)v40;
  v28->_weight.__end_cap_.__value_ = (float *)v40;
  if (a4)
  {
    if (a4 >> 62) {
      sub_19E13D694();
    }
    v45 = (char *)operator new(4 * a4);
    v46 = (float *)&v45[4 * a4];
    bzero(v45, 4 * a4);
    v47 = a11;
    p_bias = &v28->_bias;
    v48 = v28->_bias.__begin_;
    if (!v48) {
      goto LABEL_10;
    }
  }
  else
  {
    v46 = 0;
    v45 = 0;
    v47 = a11;
    p_bias = &v28->_bias;
    v48 = v28->_bias.__begin_;
    if (!v48) {
      goto LABEL_10;
    }
  }
  v28->_bias.__end_ = v48;
  operator delete(v48);
  p_bias->__begin_ = 0;
  p_bias->__end_ = 0;
  p_bias->__end_cap_.__value_ = 0;
LABEL_10:
  v28->_bias.__begin_ = (float *)v45;
  v28->_bias.__end_ = v46;
  v28->_bias.__end_cap_.__value_ = v46;
  if (v47 || a12 || a13 || a14) {
    objc_msgSend_loadWithInitialWeights_0_initialWeights_1_bias_0_bias_1_weightAttributes_(v28, v39, (uint64_t)v47, (uint64_t)a12, a13, a14, a15);
  }
  else {
    objc_msgSend_initializeWeightsAndBiases_(v28, v39, (uint64_t)v25, 0);
  }
LABEL_16:

  return v28;
}

- (void)initializeWeightsAndBiases:(id)a3
{
  v37 = a3;
  int v8 = 0;
  unint64_t v9 = 0;
  uint64_t v39 = 0x3CA3D70A00000000;
  char v41 = 0;
  int8x8_t v10 = (int8x8_t)vdup_n_s32(0x9D2C5680);
  int8x8_t v11 = (int8x8_t)vdup_n_s32(0xEFC60000);
  __asm { FMOV            V12.2S, #-1.0 }
  while (objc_msgSend_columns(self, v5, v6, v7) > v9)
  {
    for (unint64_t i = 0; objc_msgSend_rows(self, v17, v18, v19) > i; ++i)
    {
      if (v8)
      {
        int v8 = 0;
        char v41 = 0;
        float v35 = v3;
      }
      else
      {
        v21 = v37 + 1;
        unint64_t v22 = v37[313];
        int v23 = *((_DWORD *)v37 + v22 + 2);
        do
        {
          unint64_t v24 = (v22 + 1) % 0x270;
          uint64_t v25 = 4 * v24;
          unsigned int v26 = *((_DWORD *)v21 + (v22 + 397) % 0x270) ^ ((*((_DWORD *)v21 + v24) & 0x7FFFFFFE | v23 & 0x80000000) >> 1) ^ ((int)(*((_DWORD *)v21 + v24) << 31) >> 31) & 0x9908B0DF;
          *((_DWORD *)v21 + v22) = v26;
          if (v24 < 0x26F) {
            unint64_t v22 = v24 + 1;
          }
          else {
            unint64_t v22 = v24 - 623;
          }
          if (v24 >= 0xE3) {
            uint64_t v27 = -227;
          }
          else {
            uint64_t v27 = 397;
          }
          int v23 = *((_DWORD *)v21 + v22);
          unsigned int v28 = *((_DWORD *)v21 + v27 + v24) ^ ((v23 & 0x7FFFFFFE | *((_DWORD *)v21 + v24) & 0x80000000) >> 1) ^ (v23 << 31 >> 31) & 0x9908B0DF;
          *(_DWORD *)((char *)v21 + v25) = v28;
          int32x2_t v29 = (int32x2_t)veor_s8((int8x8_t)vshr_n_u32((uint32x2_t)__PAIR64__(v26, v28), 0xBuLL), (int8x8_t)__PAIR64__(v26, v28));
          int32x2_t v30 = (int32x2_t)veor_s8(vand_s8((int8x8_t)vshl_n_s32(v29, 7uLL), v10), (int8x8_t)v29);
          int8x8_t v31 = veor_s8(vand_s8((int8x8_t)vshl_n_s32(v30, 0xFuLL), v11), (int8x8_t)v30);
          float32x2_t v32 = vmla_f32(_D12, vcvt_f32_u32((uint32x2_t)veor_s8((int8x8_t)vshr_n_u32((uint32x2_t)v31, 0x12uLL), v31)), (float32x2_t)0x3000000030000000);
          float v33 = vaddv_f32(vmul_f32(v32, v32));
        }
        while (v33 > 1.0 || v33 == 0.0);
        v37[313] = v22;
        float32x2_t v38 = v32;
        float v34 = sqrtf((float)(logf(v33) * -2.0) / v33);
        float v3 = v34 * v38.f32[0];
        float v40 = v34 * v38.f32[0];
        int v8 = 1;
        char v41 = 1;
        float v35 = vmuls_lane_f32(v34, v38, 1);
      }
      self->_weight.__begin_[i + objc_msgSend_rows(self, v5, v6, v7) * v9] = v35 * 0.02;
    }
    ++v9;
  }
  for (unint64_t j = 0; objc_msgSend_rows(self, v17, v18, v19) > j; ++j)
    self->_bias.__begin_[j] = sub_19E238C94((uint64_t)&v39, (uint64_t)(v37 + 1), (float *)&v39);
}

- (unsigned)dataType
{
  return 268435488;
}

- (id)descriptor
{
  return self->_desc;
}

- (void)weights
{
  return self->_weight.__begin_;
}

- (float)biasTerms
{
  if (self->_bias.__end_ == self->_bias.__begin_) {
    return 0;
  }
  else {
    return self->_bias.__begin_;
  }
}

- (unint64_t)weight_size
{
  return self->_weight.__end_ - self->_weight.__begin_;
}

- (unint64_t)bias_size
{
  return self->_bias.__end_ - self->_bias.__begin_;
}

- (BOOL)load
{
  return 1;
}

- (void)purge
{
  self->_weight.__end_ = self->_weight.__begin_;
  self->_bias.__end_ = self->_bias.__begin_;
}

- (id)label
{
  return @"MPSCNNWeight";
}

- (void)loadWithInitialWeights_0:(float *)a3 initialWeights_1:(float *)a4 bias_0:(float *)a5 bias_1:(float *)a6 weightAttributes:(unint64_t)a7
{
  char v7 = a7;
  int8x8_t v11 = a3;
  unint64_t v16 = a7 & 0x10;
  switch(objc_msgSend_weightID(self, a2, (uint64_t)a3, (uint64_t)a4))
  {
    case 3:
      if ((v7 & 0x20) != 0)
      {
        objc_msgSend_lstmOutputSize(self, v13, v14, v15);
        objc_msgSend_lstmInputSize(self, v229, v230, v231);
        objc_msgSend_lstmOutputSize(self, v232, v233, v234);
        uint64_t v238 = objc_msgSend_lstmInputSize(self, v235, v236, v237);
        uint64_t v242 = objc_msgSend_lstmOutputSize(self, v239, v240, v241);
        if (objc_msgSend_rows(self, v243, v244, v245))
        {
          unint64_t v246 = 0;
          uint64_t v247 = 4 * (v242 + v238);
          do
          {
            if (objc_msgSend_columns(self, v29, v30, v31))
            {
              unint64_t v251 = 0;
              do
              {
                float v252 = v11[v251];
                self->_weight.__begin_[v251 + v246 * objc_msgSend_columns(self, v248, v249, v250)] = v252;
                ++v251;
              }
              while (objc_msgSend_columns(self, v253, v254, v255) > v251);
            }
            ++v246;
            int8x8_t v11 = (float *)((char *)v11 + v247);
          }
          while (objc_msgSend_rows(self, v248, v249, v250) > v246);
        }
      }
      else
      {
        objc_msgSend_lstmInputSize(self, v13, v14, v15);
        objc_msgSend_lstmOutputSize(self, v17, v18, v19);
        objc_msgSend_lstmOutputSize(self, v20, v21, v22);
        objc_msgSend_lstmOutputSize(self, v23, v24, v25);
        if (objc_msgSend_rows(self, v26, v27, v28))
        {
          unint64_t v32 = 0;
          uint64_t v33 = 0;
          do
          {
            if (objc_msgSend_columns(self, v29, v30, v31))
            {
              unint64_t v37 = 0;
              do
              {
                float v38 = v11[v33 + v37];
                self->_weight.__begin_[v37 + v32 * objc_msgSend_columns(self, v34, v35, v36)] = v38;
                ++v37;
              }
              while (objc_msgSend_columns(self, v39, v40, v41) > v37);
              v33 += v37;
            }
            ++v32;
          }
          while (objc_msgSend_rows(self, v34, v35, v36) > v32);
        }
      }
      if (objc_msgSend_rows(self, v29, v30, v31))
      {
        unint64_t v259 = 0;
        do
        {
          objc_msgSend_lstmOutputSize(self, v256, v257, v258);
          self->_bias.__begin_[v259] = a5[v259];
          if ((v7 & 0x80) == 0)
          {
            objc_msgSend_lstmOutputSize(self, v260, v261, v262);
            self->_bias.__begin_[v259] = self->_bias.__begin_[v259] + a6[v259];
          }
          ++v259;
        }
        while (objc_msgSend_rows(self, v260, v261, v262) > v259);
      }
      break;
    case 4:
      if ((v7 & 0x20) != 0)
      {
        objc_msgSend_lstmOutputSize(self, v13, v14, v15);
        objc_msgSend_lstmInputSize(self, v452, v453, v454);
        objc_msgSend_lstmOutputSize(self, v455, v456, v457);
        uint64_t v461 = objc_msgSend_lstmInputSize(self, v458, v459, v460);
        uint64_t v465 = objc_msgSend_lstmInputSize(self, v462, v463, v464);
        uint64_t v469 = objc_msgSend_lstmOutputSize(self, v466, v467, v468);
        if (objc_msgSend_rows(self, v470, v471, v472))
        {
          unint64_t v476 = 0;
          v477 = &v11[v461];
          uint64_t v478 = 4 * (v469 + v465);
          do
          {
            if (objc_msgSend_columns(self, v473, v474, v475))
            {
              unint64_t v482 = 0;
              do
              {
                float v483 = v477[v482];
                self->_weight.__begin_[v482 + v476 * objc_msgSend_columns(self, v479, v480, v481)] = v483;
                ++v482;
              }
              while (objc_msgSend_columns(self, v484, v485, v486) > v482);
            }
            ++v476;
            v477 = (float *)((char *)v477 + v478);
          }
          while (objc_msgSend_rows(self, v479, v480, v481) > v476);
        }
      }
      else
      {
        objc_msgSend_lstmInputSize(self, v13, v14, v15);
        objc_msgSend_lstmOutputSize(self, v177, v178, v179);
        objc_msgSend_lstmOutputSize(self, v180, v181, v182);
        objc_msgSend_lstmOutputSize(self, v183, v184, v185);
        if (objc_msgSend_rows(self, v186, v187, v188))
        {
          unint64_t v192 = 0;
          uint64_t v193 = 0;
          do
          {
            if (objc_msgSend_columns(self, v189, v190, v191))
            {
              unint64_t v197 = 0;
              do
              {
                float v198 = a4[v193 + v197];
                self->_weight.__begin_[v197 + v192 * objc_msgSend_columns(self, v194, v195, v196)] = v198;
                ++v197;
              }
              while (objc_msgSend_columns(self, v199, v200, v201) > v197);
              v193 += v197;
            }
            ++v192;
          }
          while (objc_msgSend_rows(self, v194, v195, v196) > v192);
        }
      }
      break;
    case 7:
      if ((v7 & 0x20) != 0)
      {
        uint64_t v263 = objc_msgSend_lstmOutputSize(self, v13, v14, v15);
        uint64_t v267 = objc_msgSend_lstmInputSize(self, v264, v265, v266);
        uint64_t v271 = objc_msgSend_lstmOutputSize(self, v268, v269, v270);
        uint64_t v275 = objc_msgSend_lstmInputSize(self, v272, v273, v274);
        uint64_t v279 = objc_msgSend_lstmOutputSize(self, v276, v277, v278);
        if (objc_msgSend_rows(self, v280, v281, v282))
        {
          uint64_t v283 = v263;
          unint64_t v284 = 0;
          v285 = &v11[(v283 << ((v7 & 0x10) >> 4)) * (v271 + v267)];
          do
          {
            if (objc_msgSend_columns(self, v56, v57, v58))
            {
              unint64_t v289 = 0;
              do
              {
                float v290 = v285[v289];
                self->_weight.__begin_[v289 + v284 * objc_msgSend_columns(self, v286, v287, v288)] = v290;
                ++v289;
              }
              while (objc_msgSend_columns(self, v291, v292, v293) > v289);
            }
            ++v284;
            v285 += v279 + v275;
          }
          while (objc_msgSend_rows(self, v286, v287, v288) > v284);
        }
      }
      else
      {
        uint64_t v42 = objc_msgSend_lstmInputSize(self, v13, v14, v15);
        uint64_t v46 = objc_msgSend_lstmOutputSize(self, v43, v44, v45);
        objc_msgSend_lstmOutputSize(self, v47, v48, v49);
        objc_msgSend_lstmOutputSize(self, v50, v51, v52);
        if (objc_msgSend_rows(self, v53, v54, v55))
        {
          unint64_t v59 = 0;
          uint64_t v60 = (v42 << ((v7 & 0x10) >> 4)) * v46;
          do
          {
            if (objc_msgSend_columns(self, v56, v57, v58))
            {
              unint64_t v64 = 0;
              do
              {
                float v65 = v11[v60 + v64];
                self->_weight.__begin_[v64 + v59 * objc_msgSend_columns(self, v61, v62, v63)] = v65;
                ++v64;
              }
              while (objc_msgSend_columns(self, v66, v67, v68) > v64);
              v60 += v64;
            }
            ++v59;
          }
          while (objc_msgSend_rows(self, v61, v62, v63) > v59);
        }
      }
      if (objc_msgSend_rows(self, v56, v57, v58))
      {
        unint64_t v297 = 0;
        unint64_t v298 = (unint64_t)(v7 & 0x10) >> 4;
        do
        {
          self->_bias.__begin_[v297] = a5[v297 + (objc_msgSend_lstmOutputSize(self, v294, v295, v296) << v298)];
          if ((v7 & 0x80) == 0) {
            self->_bias.__begin_[v297] = self->_bias.__begin_[v297]
          }
                                       + a6[v297 + (objc_msgSend_lstmOutputSize(self, v299, v300, v301) << v298)];
          ++v297;
        }
        while (objc_msgSend_rows(self, v299, v300, v301) > v297);
      }
      break;
    case 8:
      if ((v7 & 0x20) != 0)
      {
        uint64_t v302 = objc_msgSend_lstmOutputSize(self, v13, v14, v15);
        uint64_t v306 = objc_msgSend_lstmInputSize(self, v303, v304, v305);
        uint64_t v310 = objc_msgSend_lstmOutputSize(self, v307, v308, v309);
        uint64_t v314 = objc_msgSend_lstmInputSize(self, v311, v312, v313);
        uint64_t v318 = objc_msgSend_lstmInputSize(self, v315, v316, v317);
        uint64_t v322 = objc_msgSend_lstmOutputSize(self, v319, v320, v321);
        if (objc_msgSend_rows(self, v323, v324, v325))
        {
          unint64_t v329 = 0;
          v330 = &v11[(v302 << (v16 >> 4)) * (v310 + v306) + v314];
          do
          {
            if (objc_msgSend_columns(self, v326, v327, v328))
            {
              unint64_t v334 = 0;
              do
              {
                float v335 = v330[v334];
                self->_weight.__begin_[v334 + v329 * objc_msgSend_columns(self, v331, v332, v333)] = v335;
                ++v334;
              }
              while (objc_msgSend_columns(self, v336, v337, v338) > v334);
            }
            ++v329;
            v330 += v322 + v318;
          }
          while (objc_msgSend_rows(self, v331, v332, v333) > v329);
        }
      }
      else
      {
        objc_msgSend_lstmInputSize(self, v13, v14, v15);
        objc_msgSend_lstmOutputSize(self, v69, v70, v71);
        uint64_t v75 = objc_msgSend_lstmOutputSize(self, v72, v73, v74);
        uint64_t v79 = objc_msgSend_lstmOutputSize(self, v76, v77, v78);
        if (objc_msgSend_rows(self, v80, v81, v82))
        {
          unint64_t v86 = 0;
          uint64_t v87 = (v75 << (v16 >> 4)) * v79;
          do
          {
            if (objc_msgSend_columns(self, v83, v84, v85))
            {
              unint64_t v91 = 0;
              do
              {
                float v92 = a4[v87 + v91];
                self->_weight.__begin_[v91 + v86 * objc_msgSend_columns(self, v88, v89, v90)] = v92;
                ++v91;
              }
              while (objc_msgSend_columns(self, v93, v94, v95) > v91);
              v87 += v91;
            }
            ++v86;
          }
          while (objc_msgSend_rows(self, v88, v89, v90) > v86);
        }
      }
      break;
    case 11:
      if ((v7 & 0x20) != 0)
      {
        uint64_t v339 = objc_msgSend_lstmOutputSize(self, v13, v14, v15);
        uint64_t v343 = objc_msgSend_lstmInputSize(self, v340, v341, v342);
        uint64_t v347 = objc_msgSend_lstmOutputSize(self, v344, v345, v346);
        uint64_t v351 = objc_msgSend_lstmInputSize(self, v348, v349, v350);
        uint64_t v355 = objc_msgSend_lstmOutputSize(self, v352, v353, v354);
        if (objc_msgSend_rows(self, v356, v357, v358))
        {
          uint64_t v359 = v339;
          unint64_t v360 = 0;
          v361 = &v11[(v359 << (((v7 & 0x10) >> 4) ^ 1u)) * (v347 + v343)];
          do
          {
            if (objc_msgSend_columns(self, v110, v111, v112))
            {
              unint64_t v365 = 0;
              do
              {
                float v366 = v361[v365];
                self->_weight.__begin_[v365 + v360 * objc_msgSend_columns(self, v362, v363, v364)] = v366;
                ++v365;
              }
              while (objc_msgSend_columns(self, v367, v368, v369) > v365);
            }
            ++v360;
            v361 += v355 + v351;
          }
          while (objc_msgSend_rows(self, v362, v363, v364) > v360);
        }
      }
      else
      {
        uint64_t v96 = objc_msgSend_lstmInputSize(self, v13, v14, v15);
        uint64_t v100 = objc_msgSend_lstmOutputSize(self, v97, v98, v99);
        objc_msgSend_lstmOutputSize(self, v101, v102, v103);
        objc_msgSend_lstmOutputSize(self, v104, v105, v106);
        if (objc_msgSend_rows(self, v107, v108, v109))
        {
          unint64_t v113 = 0;
          uint64_t v114 = (v96 << (((v7 & 0x10) >> 4) ^ 1u)) * v100;
          do
          {
            if (objc_msgSend_columns(self, v110, v111, v112))
            {
              unint64_t v118 = 0;
              do
              {
                float v119 = v11[v114 + v118];
                self->_weight.__begin_[v118 + v113 * objc_msgSend_columns(self, v115, v116, v117)] = v119;
                ++v118;
              }
              while (objc_msgSend_columns(self, v120, v121, v122) > v118);
              v114 += v118;
            }
            ++v113;
          }
          while (objc_msgSend_rows(self, v115, v116, v117) > v113);
        }
      }
      if (objc_msgSend_rows(self, v110, v111, v112))
      {
        unint64_t v373 = 0;
        unint64_t v374 = ((unint64_t)(v7 & 0x10) >> 4) ^ 1;
        do
        {
          self->_bias.__begin_[v373] = a5[v373 + (objc_msgSend_lstmOutputSize(self, v370, v371, v372) << v374)];
          if ((v7 & 0x80) == 0) {
            self->_bias.__begin_[v373] = self->_bias.__begin_[v373]
          }
                                       + a6[v373 + (objc_msgSend_lstmOutputSize(self, v375, v376, v377) << v374)];
          ++v373;
        }
        while (objc_msgSend_rows(self, v375, v376, v377) > v373);
      }
      break;
    case 12:
      if ((v7 & 0x20) != 0)
      {
        uint64_t v378 = objc_msgSend_lstmOutputSize(self, v13, v14, v15);
        uint64_t v382 = objc_msgSend_lstmInputSize(self, v379, v380, v381);
        uint64_t v386 = objc_msgSend_lstmOutputSize(self, v383, v384, v385);
        uint64_t v390 = objc_msgSend_lstmInputSize(self, v387, v388, v389);
        uint64_t v394 = objc_msgSend_lstmInputSize(self, v391, v392, v393);
        uint64_t v398 = objc_msgSend_lstmOutputSize(self, v395, v396, v397);
        if (objc_msgSend_rows(self, v399, v400, v401))
        {
          unint64_t v405 = 0;
          v406 = &v11[(v378 << ((v16 >> 4) ^ 1u)) * (v386 + v382) + v390];
          do
          {
            if (objc_msgSend_columns(self, v402, v403, v404))
            {
              unint64_t v410 = 0;
              do
              {
                float v411 = v406[v410];
                self->_weight.__begin_[v410 + v405 * objc_msgSend_columns(self, v407, v408, v409)] = v411;
                ++v410;
              }
              while (objc_msgSend_columns(self, v412, v413, v414) > v410);
            }
            ++v405;
            v406 += v398 + v394;
          }
          while (objc_msgSend_rows(self, v407, v408, v409) > v405);
        }
      }
      else
      {
        objc_msgSend_lstmInputSize(self, v13, v14, v15);
        objc_msgSend_lstmOutputSize(self, v123, v124, v125);
        uint64_t v129 = objc_msgSend_lstmOutputSize(self, v126, v127, v128);
        uint64_t v133 = objc_msgSend_lstmOutputSize(self, v130, v131, v132);
        if (objc_msgSend_rows(self, v134, v135, v136))
        {
          unint64_t v140 = 0;
          uint64_t v141 = (v129 << ((v16 >> 4) ^ 1u)) * v133;
          do
          {
            if (objc_msgSend_columns(self, v137, v138, v139))
            {
              unint64_t v145 = 0;
              do
              {
                float v146 = a4[v141 + v145];
                self->_weight.__begin_[v145 + v140 * objc_msgSend_columns(self, v142, v143, v144)] = v146;
                ++v145;
              }
              while (objc_msgSend_columns(self, v147, v148, v149) > v145);
              v141 += v145;
            }
            ++v140;
          }
          while (objc_msgSend_rows(self, v142, v143, v144) > v140);
        }
      }
      break;
    case 15:
      if ((v7 & 0x20) != 0)
      {
        uint64_t v487 = objc_msgSend_lstmOutputSize(self, v13, v14, v15);
        uint64_t v491 = objc_msgSend_lstmInputSize(self, v488, v489, v490);
        uint64_t v495 = objc_msgSend_lstmOutputSize(self, v492, v493, v494);
        uint64_t v499 = objc_msgSend_lstmInputSize(self, v496, v497, v498);
        uint64_t v503 = objc_msgSend_lstmOutputSize(self, v500, v501, v502);
        if (objc_msgSend_rows(self, v504, v505, v506))
        {
          uint64_t v507 = v487;
          unint64_t v508 = 0;
          v509 = &v11[3 * v507 * (v495 + v491)];
          do
          {
            if (objc_msgSend_columns(self, v216, v217, v218))
            {
              unint64_t v513 = 0;
              do
              {
                float v514 = v509[v513];
                self->_weight.__begin_[v513 + v508 * objc_msgSend_columns(self, v510, v511, v512)] = v514;
                ++v513;
              }
              while (objc_msgSend_columns(self, v515, v516, v517) > v513);
            }
            ++v508;
            v509 += v503 + v499;
          }
          while (objc_msgSend_rows(self, v510, v511, v512) > v508);
        }
      }
      else
      {
        uint64_t v202 = objc_msgSend_lstmInputSize(self, v13, v14, v15);
        uint64_t v206 = objc_msgSend_lstmOutputSize(self, v203, v204, v205);
        objc_msgSend_lstmOutputSize(self, v207, v208, v209);
        objc_msgSend_lstmOutputSize(self, v210, v211, v212);
        if (objc_msgSend_rows(self, v213, v214, v215))
        {
          unint64_t v219 = 0;
          uint64_t v220 = 3 * v202 * v206;
          do
          {
            if (objc_msgSend_columns(self, v216, v217, v218))
            {
              unint64_t v224 = 0;
              do
              {
                float v225 = v11[v220 + v224];
                self->_weight.__begin_[v224 + v219 * objc_msgSend_columns(self, v221, v222, v223)] = v225;
                ++v224;
              }
              while (objc_msgSend_columns(self, v226, v227, v228) > v224);
              v220 += v224;
            }
            ++v219;
          }
          while (objc_msgSend_rows(self, v221, v222, v223) > v219);
        }
      }
      if (objc_msgSend_rows(self, v216, v217, v218))
      {
        unint64_t v521 = 0;
        do
        {
          self->_bias.__begin_[v521] = a5[3 * objc_msgSend_lstmOutputSize(self, v518, v519, v520) + v521];
          if ((v7 & 0x80) == 0) {
            self->_bias.__begin_[v521] = self->_bias.__begin_[v521]
          }
                                       + a6[3 * objc_msgSend_lstmOutputSize(self, v522, v523, v524) + v521];
          ++v521;
        }
        while (objc_msgSend_rows(self, v522, v523, v524) > v521);
      }
      break;
    case 16:
      if ((v7 & 0x20) != 0)
      {
        uint64_t v415 = objc_msgSend_lstmOutputSize(self, v13, v14, v15);
        uint64_t v419 = objc_msgSend_lstmInputSize(self, v416, v417, v418);
        uint64_t v423 = objc_msgSend_lstmOutputSize(self, v420, v421, v422);
        uint64_t v427 = objc_msgSend_lstmInputSize(self, v424, v425, v426);
        uint64_t v431 = objc_msgSend_lstmInputSize(self, v428, v429, v430);
        uint64_t v435 = objc_msgSend_lstmOutputSize(self, v432, v433, v434);
        if (objc_msgSend_rows(self, v436, v437, v438))
        {
          unint64_t v442 = 0;
          v443 = &v11[3 * v415 * (v423 + v419) + v427];
          do
          {
            if (objc_msgSend_columns(self, v439, v440, v441))
            {
              unint64_t v447 = 0;
              do
              {
                float v448 = v443[v447];
                self->_weight.__begin_[v447 + v442 * objc_msgSend_columns(self, v444, v445, v446)] = v448;
                ++v447;
              }
              while (objc_msgSend_columns(self, v449, v450, v451) > v447);
            }
            ++v442;
            v443 += v435 + v431;
          }
          while (objc_msgSend_rows(self, v444, v445, v446) > v442);
        }
      }
      else
      {
        objc_msgSend_lstmInputSize(self, v13, v14, v15);
        objc_msgSend_lstmOutputSize(self, v150, v151, v152);
        uint64_t v156 = objc_msgSend_lstmOutputSize(self, v153, v154, v155);
        uint64_t v160 = objc_msgSend_lstmOutputSize(self, v157, v158, v159);
        if (objc_msgSend_rows(self, v161, v162, v163))
        {
          unint64_t v167 = 0;
          uint64_t v168 = 3 * v156 * v160;
          do
          {
            if (objc_msgSend_columns(self, v164, v165, v166))
            {
              unint64_t v172 = 0;
              do
              {
                float v173 = a4[v168 + v172];
                self->_weight.__begin_[v172 + v167 * objc_msgSend_columns(self, v169, v170, v171)] = v173;
                ++v172;
              }
              while (objc_msgSend_columns(self, v174, v175, v176) > v172);
              v168 += v172;
            }
            ++v167;
          }
          while (objc_msgSend_rows(self, v169, v170, v171) > v167);
        }
      }
      break;
    default:
      v525 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v526 = *MEMORY[0x1E4F1C3B8];
      v527 = NSString;
      uint64_t v528 = objc_msgSend_weightID(self, v13, v14, v15);
      v531 = objc_msgSend_stringWithFormat_(v527, v529, @"Unknown weight ID %tu", v530, v528);
      objc_msgSend_exceptionWithName_reason_userInfo_(v525, v532, v526, (uint64_t)v531, 0);
      id v533 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v533);
  }
}

- (unint64_t)weightID
{
  return self->_weightID;
}

- (void)setWeightID:(unint64_t)a3
{
  self->_weightID = a3;
}

- (unint64_t)columns
{
  return self->_columns;
}

- (void)setColumns:(unint64_t)a3
{
  self->_columns = a3;
}

- (unint64_t)rows
{
  return self->_rows;
}

- (void)setRows:(unint64_t)a3
{
  self->_rows = a3;
}

- (unint64_t)lstmInputSize
{
  return self->_lstmInputSize;
}

- (void)setLstmInputSize:(unint64_t)a3
{
  self->_lstmInputSize = a3;
}

- (unint64_t)lstmOutputSize
{
  return self->_lstmOutputSize;
}

- (void)setLstmOutputSize:(unint64_t)a3
{
  self->_lstmOutputSize = a3;
}

- (void).cxx_destruct
{
  begin = self->_bias.__begin_;
  if (begin)
  {
    self->_bias.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_weight.__begin_;
  if (v4)
  {
    self->_weight.__end_ = v4;
    operator delete(v4);
  }

  objc_storeStrong((id *)&self->_desc, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end