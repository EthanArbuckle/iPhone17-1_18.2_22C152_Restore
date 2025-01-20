@interface PPTopicTransform
- (BOOL)containsMappedTopic:(id)a3;
- (PPTopicTransform)initWithPath:(id)a3 mappingId:(id)a4;
- (float)threshold;
- (id)QIDWeightsWithMappedTopicIdentifier:(id)a3;
- (id)payloadForTopic:(unsigned int)a3;
- (unint64_t)outputTopicCount;
- (void)_applyScaling:(unsigned int)__N vectorLength:(int)a4 scalingType:(float)a5 scalingFactor:;
- (void)_enumerateSparseColumnAtIndex:(void *)a3 block:;
- (void)addBias:(float *)a3;
- (void)addWeightedTopicScoreToBuffer:(float *)a3 countNonZeroComponentsInBuffer:(unsigned __int16 *)a4 qid:(unsigned int)a5 score:(float)a6;
- (void)addWeightedTopicScoreToBuffer:(float *)a3 qid:(unsigned int)a4 score:(float)a5;
- (void)applyFeatureNormalization:(float *)a3 vectorLength:(int)a4;
- (void)applyFeatureScaling:(float *)a3 vectorLength:(int)a4;
- (void)applyFeatureSmoothing:(float *)a3 vectorLength:(int)a4;
- (void)applyOutputActivation:(float *)a3;
- (void)applyOutputAttenuation:(float *)a3 nonzeroCounts:(unsigned __int16 *)a4;
- (void)applyOutputScaling:(float *)a3 vectorLength:(int)a4;
@end

@implementation PPTopicTransform

- (void).cxx_destruct
{
}

- (float)threshold
{
  return self->_threshold;
}

- (void)applyOutputAttenuation:(float *)a3 nonzeroCounts:(unsigned __int16 *)a4
{
  if (self->_attenuationFactor != 0.0 && [(PPTopicTransform *)self outputTopicCount])
  {
    uint64_t v7 = 0;
    unsigned int v8 = 1;
    do
    {
      v9 = (void *)MEMORY[0x1CB79D060]();
      if (a4[v7])
      {
        long double v10 = pow((double)a4[v7], 1.0 / self->_attenuationFactor);
        *(float *)&long double v10 = v10 / (v10 + 1.0) * a3[v7];
        a3[v7] = *(float *)&v10;
      }
      uint64_t v7 = v8;
    }
    while ([(PPTopicTransform *)self outputTopicCount] > v8++);
  }
}

- (void)applyOutputActivation:(float *)a3
{
  v3 = a3;
  switch(self->_activationType)
  {
    case 1u:
      uint64_t topicCount = self->_header.topicCount;
      if (topicCount)
      {
        do
        {
          float v6 = expf(-*v3);
          float v7 = 1.0 / (v6 + 1.0) + -0.5 + 1.0 / (v6 + 1.0) + -0.5;
          *v3++ = v7;
          --topicCount;
        }
        while (topicCount);
      }
      return;
    case 2u:
      uint64_t v8 = self->_header.topicCount;
      if (v8)
      {
        do
        {
          float v9 = 1.0 / (expf(-*v3) + 1.0);
          *v3++ = v9;
          --v8;
        }
        while (v8);
      }
      return;
    case 3u:
      int v19 = self->_header.topicCount;
      vvexpf(a3, a3, &v19);
      goto LABEL_9;
    case 4u:
LABEL_9:
      uint64_t v10 = self->_header.topicCount;
      if (!v10) {
        goto LABEL_18;
      }
      v11 = v3;
      uint64_t v12 = v10;
      do
      {
        float v13 = expf(-*v11);
        *v11++ = expf(-v13);
        --v12;
      }
      while (v12);
LABEL_14:
      uint64_t v14 = v10;
      v15 = v3;
      do
      {
        float v16 = expf(-*v15);
        *v15++ = 1.0 - expf(-v16);
        --v14;
      }
      while (v14);
LABEL_18:
      int __N = v10;
      vvexpf(v3, v3, &__N);
      float v17 = cblas_sasum(__N, v3, 1);
      cblas_sscal(__N, 1.0 / v17, v3, 1);
      return;
    case 5u:
      LODWORD(v10) = self->_header.topicCount;
      if (v10) {
        goto LABEL_14;
      }
      goto LABEL_18;
    case 6u:
      LODWORD(v10) = self->_header.topicCount;
      goto LABEL_18;
    default:
      return;
  }
}

- (void)applyFeatureNormalization:(float *)a3 vectorLength:(int)a4
{
  int featureNormalizationType = self->_featureNormalizationType;
  switch(featureNormalizationType)
  {
    case 3:
      float v7 = fabsf(a3[cblas_icamax(a4, a3, 1)]);
      break;
    case 2:
      float v7 = cblas_snrm2(a4, a3, 1);
      break;
    case 1:
      float v7 = cblas_sasum(a4, a3, 1);
      break;
    default:
      return;
  }
  float v8 = 1.0 / v7;
  cblas_sscal(a4, v8, a3, 1);
}

- (void)applyOutputScaling:(float *)a3 vectorLength:(int)a4
{
}

- (void)_applyScaling:(unsigned int)__N vectorLength:(int)a4 scalingType:(float)a5 scalingFactor:
{
  int v11 = __N;
  if (a1)
  {
    float v7 = a2;
    switch(a4)
    {
      case 1:
        if (a5 != 1.0)
        {
          cblas_sscal(__N, a5, a2, 1);
        }
        break;
      case 2:
        vvlogf(a2, a2, &v11);
        uint64_t v8 = v11;
        if (v11)
        {
          do
          {
            *float v7 = *v7 + 1.0;
            ++v7;
            --v8;
          }
          while (v8);
        }
        break;
      case 3:
        vvlog1pf(a2, a2, &v11);
        break;
      case 4:
        int v9 = cblas_icamax(__N, a2, 1);
        cblas_sscal(__N, (float)(1.0 - a5) / fabsf(v7[v9]), v7, 1);
        if (__N)
        {
          uint64_t v10 = __N;
          do
          {
            *float v7 = *v7 + a5;
            ++v7;
            --v10;
          }
          while (v10);
        }
        break;
      default:
        return;
    }
  }
}

- (void)applyFeatureScaling:(float *)a3 vectorLength:(int)a4
{
}

- (void)applyFeatureSmoothing:(float *)a3 vectorLength:(int)a4
{
  if (self->_featureSmoothingType == 1 && self->_featureSmoothingFactor != 0.0 && a4 != 0)
  {
    uint64_t v5 = a4;
    do
    {
      *a3 = self->_featureSmoothingFactor + *a3;
      ++a3;
      --v5;
    }
    while (v5);
  }
}

- (void)addBias:(float *)a3
{
  uint64_t topicCount = self->_header.topicCount;
  if (topicCount)
  {
    bias = self->_bias;
    do
    {
      float v5 = *bias++;
      *a3 = v5 + *a3;
      ++a3;
      --topicCount;
    }
    while (topicCount);
  }
}

- (id)QIDWeightsWithMappedTopicIdentifier:(id)a3
{
  *(void *)&v35[5] = *MEMORY[0x1E4F143B8];
  v4 = (NSString *)a3;
  int v5 = indexForPayload(v4, (const unsigned __int8 *)self->_payloads, self->_header.topicCount, self->_header.payloadLen);
  if (v5 == -1)
  {
    v24 = pp_topics_log_handle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v35 = v4;
      _os_log_error_impl(&dword_1CA9A8000, v24, OS_LOG_TYPE_ERROR, "Mapped topic ID (%@) not found in this mapping.", buf, 0xCu);
    }
    v25 = 0;
  }
  else
  {
    float v6 = objc_opt_new();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v30 = __56__PPTopicTransform_QIDWeightsWithMappedTopicIdentifier___block_invoke;
    v31 = &unk_1E65D6988;
    v32 = self;
    id v7 = v6;
    id v33 = v7;
    uint64_t v8 = v29;
    unsigned int nonzeroCount = self->_header.nonzeroCount;
    if (nonzeroCount && (unsigned int v10 = self->_header.topicCount) != 0)
    {
      uint64_t v11 = 0;
      unsigned int v12 = self->_matrixIndices[nonzeroCount - 1] / v10;
      do
      {
        unint64_t v13 = self->_header.nonzeroCount;
        if (v13)
        {
          unsigned int v14 = v5 + self->_header.topicCount * v11;
          matrixIndices = self->_matrixIndices;
          float v16 = &matrixIndices[v13];
          float v17 = (char *)matrixIndices;
          do
          {
            unint64_t v18 = v13 >> 1;
            int v19 = &v17[4 * (v13 >> 1)];
            unsigned int v21 = *(_DWORD *)v19;
            v20 = v19 + 4;
            v13 += ~(v13 >> 1);
            if (v21 >= v14) {
              unint64_t v13 = v18;
            }
            else {
              float v17 = v20;
            }
          }
          while (v13);
          if (v17 != (char *)v16 && *(_DWORD *)v17 == v14) {
            ((void (*)(void *, uint64_t, float))v30)(v8, v11, *(float *)((char *)self->_matrixElts + v17 - (char *)matrixIndices));
          }
        }
        uint64_t v11 = (v11 + 1);
      }
      while (v11 <= v12);
    }
    else
    {
      v22 = pp_topics_log_handle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        unsigned int topicCount = self->_header.topicCount;
        unsigned int v27 = self->_header.nonzeroCount;
        *(_DWORD *)buf = 67109376;
        v35[0] = v27;
        LOWORD(v35[1]) = 1024;
        *(_DWORD *)((char *)&v35[1] + 2) = topicCount;
        _os_log_error_impl(&dword_1CA9A8000, v22, OS_LOG_TYPE_ERROR, "Sparse matrix shape error: %u nonzero elements for %u topics.", buf, 0xEu);
      }
    }
    v23 = v33;
    v24 = v7;

    v25 = v24;
  }

  return v25;
}

void __56__PPTopicTransform_QIDWeightsWithMappedTopicIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(_DWORD *)(v4 + 16) > a2) {
    uint64_t v2 = *(unsigned int *)(*(void *)(v4 + 40) + 4 * a2);
  }
  objc_msgSend(NSNumber, "numberWithFloat:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  int v5 = *(void **)(a1 + 40);
  float v6 = [NSNumber numberWithUnsignedInt:v2];
  [v5 setObject:v7 forKeyedSubscript:v6];
}

- (void)addWeightedTopicScoreToBuffer:(float *)a3 qid:(unsigned int)a4 score:(float)a5
{
  uint64_t qidCount = self->_header.qidCount;
  if (!qidCount) {
    goto LABEL_10;
  }
  qids = self->_qids;
  unint64_t v7 = self->_header.qidCount;
  uint64_t v8 = qids;
  do
  {
    unint64_t v9 = v7 >> 1;
    unsigned int v10 = (unsigned int *)&v8[v7 >> 1];
    unsigned int v12 = *v10;
    uint64_t v11 = v10 + 1;
    v7 += ~(v7 >> 1);
    if (v12 >= a4) {
      unint64_t v7 = v9;
    }
    else {
      uint64_t v8 = v11;
    }
  }
  while (v7);
  if (v8 != &qids[qidCount] && *v8 == a4)
  {
    *(void *)&a4 = (unint64_t)((char *)v8 - (char *)qids) >> 2;
LABEL_10:
    if (a4 != -1)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __60__PPTopicTransform_addWeightedTopicScoreToBuffer_qid_score___block_invoke;
      v13[3] = &__block_descriptor_44_e11_v16__0I8f12l;
      v13[4] = a3;
      float v14 = a5;
      -[PPTopicTransform _enumerateSparseColumnAtIndex:block:]((uint64_t)self, a4, v13);
    }
  }
}

float __60__PPTopicTransform_addWeightedTopicScoreToBuffer_qid_score___block_invoke(uint64_t a1, unsigned int a2, float a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  float result = *(float *)(v3 + 4 * a2) + (float)(*(float *)(a1 + 40) * a3);
  *(float *)(v3 + 4 * a2) = result;
  return result;
}

- (void)_enumerateSparseColumnAtIndex:(void *)a3 block:
{
  unsigned int v21 = a3;
  if (a1)
  {
    unint64_t v5 = *(unsigned int *)(a1 + 24);
    if (v5)
    {
      int v6 = *(_DWORD *)(a1 + 20);
      unsigned int v7 = v6 * a2;
      unsigned int v8 = v7 + v6;
      unint64_t v9 = *(char **)(a1 + 48);
      unint64_t v10 = (unint64_t)&v9[4 * v5];
      uint64_t v11 = v9;
      do
      {
        unint64_t v12 = v5 >> 1;
        unint64_t v13 = (unsigned int *)&v11[4 * (v5 >> 1)];
        unsigned int v15 = *v13;
        float v14 = (char *)(v13 + 1);
        v5 += ~(v5 >> 1);
        if (v15 >= v7) {
          unint64_t v5 = v12;
        }
        else {
          uint64_t v11 = v14;
        }
      }
      while (v5);
      if ((unint64_t)v11 < v10)
      {
        uint64_t v16 = 0;
        float v17 = (char *)(*(void *)(a1 + 56) + v11 - v9);
        unsigned int v18 = 1;
        int v19 = v11;
        do
        {
          unsigned int v20 = *(_DWORD *)v19;
          if (v20 >= v8) {
            break;
          }
          v21[2](v21, v20 - v7, *(float *)&v17[4 * v16]);
          uint64_t v16 = v18;
          int v19 = &v11[4 * v18++];
        }
        while ((unint64_t)v19 < v10);
      }
    }
  }
}

- (void)addWeightedTopicScoreToBuffer:(float *)a3 countNonZeroComponentsInBuffer:(unsigned __int16 *)a4 qid:(unsigned int)a5 score:(float)a6
{
  uint64_t qidCount = self->_header.qidCount;
  if (!qidCount) {
    goto LABEL_10;
  }
  qids = self->_qids;
  unint64_t v8 = self->_header.qidCount;
  unint64_t v9 = qids;
  do
  {
    unint64_t v10 = v8 >> 1;
    uint64_t v11 = (unsigned int *)&v9[v8 >> 1];
    unsigned int v13 = *v11;
    unint64_t v12 = v11 + 1;
    v8 += ~(v8 >> 1);
    if (v13 >= a5) {
      unint64_t v8 = v10;
    }
    else {
      unint64_t v9 = v12;
    }
  }
  while (v8);
  if (v9 != &qids[qidCount] && *v9 == a5)
  {
    *(void *)&a5 = (unint64_t)((char *)v9 - (char *)qids) >> 2;
LABEL_10:
    if (a5 != -1)
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __91__PPTopicTransform_addWeightedTopicScoreToBuffer_countNonZeroComponentsInBuffer_qid_score___block_invoke;
      v14[3] = &__block_descriptor_52_e11_v16__0I8f12l;
      v14[4] = a4;
      v14[5] = a3;
      float v15 = a6;
      -[PPTopicTransform _enumerateSparseColumnAtIndex:block:]((uint64_t)self, a5, v14);
    }
  }
}

float __91__PPTopicTransform_addWeightedTopicScoreToBuffer_countNonZeroComponentsInBuffer_qid_score___block_invoke(uint64_t a1, unsigned int a2, float a3)
{
  uint64_t v3 = *(void *)(a1 + 40);
  ++*(_WORD *)(*(void *)(a1 + 32) + 2 * a2);
  float result = *(float *)(v3 + 4 * a2) + (float)(*(float *)(a1 + 48) * a3);
  *(float *)(v3 + 4 * a2) = result;
  return result;
}

- (id)payloadForTopic:(unsigned int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_header.topicCount <= a3)
  {
    unint64_t v8 = pp_topics_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v10 = self->_header.topicCount - 1;
      v11[0] = 67109376;
      v11[1] = a3;
      __int16 v12 = 1024;
      unsigned int v13 = v10;
      _os_log_error_impl(&dword_1CA9A8000, v8, OS_LOG_TYPE_ERROR, "Topic index %u too big (max: %u)", (uint8_t *)v11, 0xEu);
    }

    unsigned int v7 = 0;
  }
  else
  {
    unint64_t v5 = (void *)[[NSString alloc] initWithBytes:&self->_payloads[self->_header.payloadLen * a3] length:self->_header.payloadLen encoding:1];
    int v6 = (void *)MEMORY[0x1CB79D060]();
    unsigned int v7 = _PASTrimTrailingWhitespace();
  }
  return v7;
}

- (BOOL)containsMappedTopic:(id)a3
{
  return indexForPayload((NSString *)a3, (const unsigned __int8 *)self->_payloads, self->_header.topicCount, self->_header.payloadLen) != -1;
}

- (unint64_t)outputTopicCount
{
  return self->_header.topicCount;
}

- (PPTopicTransform)initWithPath:(id)a3 mappingId:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v62.receiver = self;
  v62.super_class = (Class)PPTopicTransform;
  unint64_t v8 = [(PPTopicTransform *)&v62 init];
  if (!v8)
  {
LABEL_52:
    v31 = v8;
    goto LABEL_53;
  }
  id v61 = 0;
  uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v6 options:1 error:&v61];
  id v10 = v61;
  data = v8->_data;
  v8->_data = (NSData *)v9;

  __int16 v12 = v8->_data;
  if (!v12)
  {
    unsigned int v13 = pp_topics_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v64 = v6;
      __int16 v65 = 2112;
      id v66 = v10;
      uint64_t v14 = "Could not load topic transform %@: %@";
      float v15 = v13;
      uint32_t v16 = 22;
LABEL_16:
      _os_log_error_impl(&dword_1CA9A8000, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if ([(NSData *)v12 length] <= 0xF)
  {
    unsigned int v13 = pp_topics_log_handle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v64 = v6;
      uint64_t v14 = "Topic transform truncated: %@";
LABEL_15:
      float v15 = v13;
      uint32_t v16 = 12;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  v8->_header = *(header_s *)[(NSData *)v8->_data bytes];
  unsigned int qidCount = v8->_header.qidCount;
  unsigned int topicCount = v8->_header.topicCount;
  unsigned int nonzeroCount = v8->_header.nonzeroCount;
  unsigned int payloadLen = v8->_header.payloadLen;
  if ([(NSData *)v8->_data length] == 4 * topicCount
                                              + (unint64_t)(4 * qidCount)
                                              + 8 * nonzeroCount
                                              + payloadLen * topicCount
                                              + 16)
  {
    uint64_t v21 = [(NSData *)v8->_data bytes];
    uint64_t v22 = v8->_header.qidCount;
    uint64_t v23 = v21 + 16 + 4 * v8->_header.topicCount;
    v8->_bias = (const float *)(v21 + 16);
    v8->_qids = (const unsigned int *)v23;
    uint64_t v24 = v23 + 4 * v22;
    uint64_t v25 = v8->_header.nonzeroCount;
    v26 = (const float *)(v24 + 4 * v25);
    v8->_matrixIndices = (const unsigned int *)v24;
    v8->_matrixElts = v26;
    v8->_payloads = (const char *)&v26[v25];
    if (v7)
    {
      unsigned int v27 = +[PPConfiguration sharedInstance];
      id v28 = [v27 hyperparametersForMappingId:v7];
      v29 = [v28 objectForKeyedSubscript:@"FeatureSmoothingType"];
      if (v29 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        unsigned __int8 v30 = [v29 intValue];
      }
      else {
        unsigned __int8 v30 = 0;
      }

      v8->_featureSmoothingType = v30;
      v32 = [v28 objectForKeyedSubscript:@"FeatureScalingType"];
      if (v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        unsigned __int8 v33 = [v32 intValue];
      }
      else {
        unsigned __int8 v33 = 0;
      }

      v8->_featureScalingType = v33;
      v34 = [v28 objectForKeyedSubscript:@"FeatureNormalizationType"];
      if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        unsigned __int8 v35 = [v34 intValue];
      }
      else {
        unsigned __int8 v35 = 0;
      }

      v8->_int featureNormalizationType = v35;
      v36 = [v28 objectForKeyedSubscript:@"OutputScalingType"];
      if (v36 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        unsigned __int8 v37 = [v36 intValue];
      }
      else {
        unsigned __int8 v37 = 0;
      }

      v8->_outputScalingType = v37;
      v38 = [v28 objectForKeyedSubscript:@"ActivationType"];
      if (v38 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
        unsigned __int8 v39 = [v38 intValue];
      }
      else {
        unsigned __int8 v39 = 0;
      }

      v8->_activationType = v39;
      v40 = [v28 objectForKeyedSubscript:@"FeatureSmoothingFactor"];
      double v41 = 0.0;
      if (v40)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v40 doubleValue];
          double v41 = v42;
        }
      }

      float v43 = v41;
      v8->_featureSmoothingFactor = v43;
      v44 = [v28 objectForKeyedSubscript:@"FeatureScalingFactor"];
      double v45 = 1.0;
      if (v44)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v44 doubleValue];
          double v45 = v46;
        }
      }

      float v47 = v45;
      v8->_featureScalingFactor = v47;
      v48 = [v28 objectForKeyedSubscript:@"OutputScalingFactor"];
      double v49 = 1.0;
      if (v48)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v48 doubleValue];
          double v49 = v50;
        }
      }

      float v51 = v49;
      v8->_outputScalingFactor = v51;
      v52 = [v28 objectForKeyedSubscript:@"ScoreAttenuationFactor"];
      double v53 = 0.0;
      if (v52)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v52 doubleValue];
          double v53 = v54;
        }
      }

      float v55 = v53;
      v8->_attenuationFactor = v55;
      v56 = [v28 objectForKeyedSubscript:@"ScoreThreshold"];
      double v57 = 0.0;
      if (v56)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v56 doubleValue];
          double v57 = v58;
        }
      }

      float v59 = v57;
      v8->_threshold = v59;
    }
    goto LABEL_52;
  }
  unsigned int v13 = pp_topics_log_handle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v64 = v6;
    uint64_t v14 = "Topic transform truncated: %@";
    goto LABEL_15;
  }
LABEL_17:

  v31 = 0;
LABEL_53:

  return v31;
}

@end