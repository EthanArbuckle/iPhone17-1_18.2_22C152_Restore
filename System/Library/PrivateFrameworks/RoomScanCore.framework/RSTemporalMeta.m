@interface RSTemporalMeta
- (BOOL)isEqual:(id)a3;
- (RSTemporalMeta)init;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation RSTemporalMeta

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingInterval, 0);
  objc_storeStrong((id *)&self->_incrementalIds, 0);
  begin = self->_incrementalPoses.__begin_;
  if (begin)
  {
    self->_incrementalPoses.__end_ = begin;
    operator delete(begin);
  }
  v4 = *(void **)self->_anon_38;
  if (v4)
  {
    *(void *)&self->_anon_38[8] = v4;
    operator delete(v4);
  }
  v5 = *(void **)self->_anon_20;
  if (v5)
  {
    *(void *)&self->_anon_20[8] = v5;
    operator delete(v5);
  }
  v6 = *(void **)self->_anon_8;
  if (v6)
  {
    *(void *)&self->_anon_8[8] = v6;
    operator delete(v6);
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v72 = *MEMORY[0x263EF8340];
  v4 = (RSTemporalMeta *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v31 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        v9 = v6;
        if (self)
        {
          if (self->_isUpdate == v6->_isUpdate)
          {
            uint64_t v10 = objc_msgSend_count(self->_incrementalIds, v7, v8);
            if (v10 == objc_msgSend_count(v9->_incrementalIds, v11, v12))
            {
              unint64_t v15 = 0;
              uint64_t v16 = 16;
              while (objc_msgSend_count(self->_incrementalIds, v13, v14) > v15)
              {
                v19 = objc_msgSend_objectAtIndexedSubscript_(self->_incrementalIds, v17, v15);
                v20 = v9->_incrementalIds;
                v22 = objc_msgSend_objectAtIndexedSubscript_(v20, v21, v15);
                char isEqualToString = objc_msgSend_isEqualToString_(v19, v23, (uint64_t)v22);

                if (isEqualToString)
                {
                  begin = self->_incrementalPoses.__begin_;
                  v26 = v9->_incrementalPoses.__begin_;
                  if (vmaxvq_f32(vabdq_f32(*((float32x4_t *)begin + 4 * v15), *((float32x4_t *)v26 + 4 * v15))) <= 0.000001)
                  {
                    unint64_t v27 = 0;
                    uint64_t v28 = (uint64_t)v26 + v16;
                    v29 = (char *)begin + v16;
                    while (v27 != 3)
                    {
                      float v30 = vmaxvq_f32(vabdq_f32(*(float32x4_t *)&v29[16 * v27], *(float32x4_t *)(v28 + 16 * v27)));
                      ++v27;
                      if (v30 > 0.000001)
                      {
                        --v27;
                        break;
                      }
                    }
                    ++v15;
                    v16 += 64;
                    if (v27 > 2) {
                      continue;
                    }
                  }
                }
                goto LABEL_42;
              }
              v32 = *(float32x2_t **)self->_anon_38;
              v33 = *(float32x2_t **)&self->_anon_38[8];
              unint64_t v34 = ((char *)v33 - (char *)v32) >> 4;
              v35 = *(float32x2_t **)v9->_anon_38;
              if (v34 == (uint64_t)(*(void *)&v9->_anon_38[8] - (void)v35) >> 4)
              {
                if (v33 == v32)
                {
LABEL_25:
                  v37 = *(float32x4_t **)self->_anon_20;
                  v38 = *(float32x4_t **)&self->_anon_20[8];
                  unint64_t v39 = v38 - v37;
                  v40 = *(float32x4_t **)v9->_anon_20;
                  if (v39 == (uint64_t)(*(void *)&v9->_anon_20[8] - (void)v40) >> 4)
                  {
                    if (v38 == v37)
                    {
LABEL_31:
                      uint64_t v42 = objc_msgSend_count(self->_mappingInterval, v17, v18);
                      if (v42 == objc_msgSend_count(v9->_mappingInterval, v43, v44))
                      {
                        long long v69 = 0u;
                        long long v70 = 0u;
                        long long v67 = 0u;
                        long long v68 = 0u;
                        v47 = objc_msgSend_allKeys(self->_mappingInterval, v45, v46);
                        uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v67, v71, 16);
                        if (v49)
                        {
                          uint64_t v50 = *(void *)v68;
                          id obj = v47;
                          while (2)
                          {
                            for (uint64_t i = 0; i != v49; ++i)
                            {
                              if (*(void *)v68 != v50) {
                                objc_enumerationMutation(obj);
                              }
                              uint64_t v52 = *(void *)(*((void *)&v67 + 1) + 8 * i);
                              v53 = v9->_mappingInterval;
                              v55 = objc_msgSend_objectForKeyedSubscript_(v53, v54, v52);
                              BOOL v56 = v55 == 0;

                              if (v56) {
                                goto LABEL_45;
                              }
                              v58 = objc_msgSend_objectForKeyedSubscript_(self->_mappingInterval, v57, v52);
                              v59 = v9->_mappingInterval;
                              v61 = objc_msgSend_objectForKeyedSubscript_(v59, v60, v52);
                              char isEqual = objc_msgSend_isEqual_(v58, v62, (uint64_t)v61);

                              if ((isEqual & 1) == 0)
                              {
LABEL_45:
                                BOOL v31 = 0;
                                v47 = obj;
                                goto LABEL_47;
                              }
                            }
                            v47 = obj;
                            uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v64, (uint64_t)&v67, v71, 16);
                            BOOL v31 = 1;
                            if (v49) {
                              continue;
                            }
                            break;
                          }
                        }
                        else
                        {
                          BOOL v31 = 1;
                        }
LABEL_47:

                        goto LABEL_43;
                      }
                    }
                    else
                    {
                      if (v39 <= 1) {
                        unint64_t v39 = 1;
                      }
                      while (1)
                      {
                        float32x4_t v41 = vabdq_f32(*v37, *v40);
                        if (fmaxf(fmaxf(v41.f32[0], v41.f32[2]), v41.f32[1]) > 0.0001) {
                          break;
                        }
                        ++v40;
                        ++v37;
                        if (!--v39) {
                          goto LABEL_31;
                        }
                      }
                    }
                  }
                }
                else
                {
                  if (v34 <= 1) {
                    unint64_t v34 = 1;
                  }
                  while (1)
                  {
                    float32x2_t v36 = vabd_f32(*v32, *v35);
                    if (fmaxf(v36.f32[0], v36.f32[1]) > 0.000001) {
                      break;
                    }
                    v35 += 2;
                    v32 += 2;
                    if (!--v34) {
                      goto LABEL_25;
                    }
                  }
                }
              }
            }
          }
        }
LABEL_42:
        BOOL v31 = 0;
LABEL_43:

        goto LABEL_44;
      }
    }
    BOOL v31 = 0;
  }
LABEL_44:

  return v31;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (RSTemporalMeta *)objc_opt_new();
  v4->_isUpdate = self->_isUpdate;
  uint64_t v7 = objc_msgSend_copy(self->_incrementalIds, v5, v6);
  incrementalIds = v4->_incrementalIds;
  v4->_incrementalIds = (NSMutableArray *)v7;

  uint64_t v11 = objc_msgSend_copy(self->_mappingInterval, v9, v10);
  mappingInterval = v4->_mappingInterval;
  v4->_mappingInterval = (NSMutableDictionary *)v11;

  if (v4 != self)
  {
    begin = v4->_incrementalPoses.__begin_;
    uint64_t v14 = self->_incrementalPoses.__begin_;
    end = self->_incrementalPoses.__end_;
    size_t v16 = end - v14;
    unint64_t v17 = (end - v14) >> 6;
    uint64_t value = (uint64_t)v4->_incrementalPoses.__end_cap_.__value_;
    if (v17 <= (value - (uint64_t)begin) >> 6)
    {
      v22 = v4->_incrementalPoses.__end_;
      unint64_t v23 = (v22 - begin) >> 6;
      if (v23 < v17)
      {
        v24 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v14 + 64 * v23);
        if (v22 != begin)
        {
          memmove(v4->_incrementalPoses.__begin_, self->_incrementalPoses.__begin_, v22 - begin);
          begin = v4->_incrementalPoses.__end_;
        }
        size_t v16 = end - v24;
        if (end == v24) {
          goto LABEL_21;
        }
        v25 = begin;
        v26 = v24;
        goto LABEL_20;
      }
    }
    else
    {
      if (begin)
      {
        v4->_incrementalPoses.__end_ = begin;
        operator delete(begin);
        uint64_t value = 0;
        v4->_incrementalPoses.__begin_ = 0;
        v4->_incrementalPoses.__end_ = 0;
        v4->_incrementalPoses.__end_cap_.__value_ = 0;
      }
      if ((v16 & 0x8000000000000000) != 0) {
        goto LABEL_23;
      }
      uint64_t v19 = value >> 5;
      if (value >> 5 <= v17) {
        uint64_t v19 = (end - v14) >> 6;
      }
      unint64_t v20 = (unint64_t)value >= 0x7FFFFFFFFFFFFFC0 ? 0x3FFFFFFFFFFFFFFLL : v19;
      if (v20 >> 58) {
LABEL_23:
      }
        sub_25B3FBC4C();
      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)sub_25B4AF474(v20);
      v4->_incrementalPoses.__begin_ = begin;
      v4->_incrementalPoses.__end_ = begin;
      v4->_incrementalPoses.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 64 * v21);
    }
    if (end == v14)
    {
LABEL_21:
      v4->_incrementalPoses.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v16);
      sub_25B4D3D18((char *)v4->_anon_8, *(char **)self->_anon_8, *(void *)&self->_anon_8[8], (uint64_t)(*(void *)&self->_anon_8[8] - *(void *)self->_anon_8) >> 4);
      sub_25B4D3D18((char *)v4->_anon_20, *(char **)self->_anon_20, *(void *)&self->_anon_20[8], (uint64_t)(*(void *)&self->_anon_20[8] - *(void *)self->_anon_20) >> 4);
      sub_25B4D3D18((char *)v4->_anon_38, *(char **)self->_anon_38, *(void *)&self->_anon_38[8], (uint64_t)(*(void *)&self->_anon_38[8] - *(void *)self->_anon_38) >> 4);
      return v4;
    }
    v25 = begin;
    v26 = v14;
LABEL_20:
    memmove(v25, v26, v16);
    goto LABEL_21;
  }
  return v4;
}

- (RSTemporalMeta)init
{
  v13.receiver = self;
  v13.super_class = (Class)RSTemporalMeta;
  v2 = [(RSTemporalMeta *)&v13 init];
  v5 = v2;
  if (v2)
  {
    v2->_isUpdate = 0;
    uint64_t v6 = objc_msgSend_array(MEMORY[0x263EFF980], v3, v4);
    incrementalIds = v5->_incrementalIds;
    v5->_incrementalIds = (NSMutableArray *)v6;

    uint64_t v10 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v8, v9);
    mappingInterval = v5->_mappingInterval;
    v5->_mappingInterval = (NSMutableDictionary *)v10;
  }
  return v5;
}

@end