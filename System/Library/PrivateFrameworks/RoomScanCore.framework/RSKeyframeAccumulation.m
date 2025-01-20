@interface RSKeyframeAccumulation
- (RSKeyframeAccumulation)init;
@end

@implementation RSKeyframeAccumulation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyframeOrderDict, 0);
  objc_storeStrong((id *)&self->_diffKeyframes, 0);
  objc_storeStrong((id *)&self->_newKeyframes, 0);
  objc_storeStrong((id *)&self->_metas, 0);
  objc_storeStrong((id *)&self->_accMeta, 0);

  objc_storeStrong((id *)&self->_worldpc, 0);
}

- (RSKeyframeAccumulation)init
{
  v24.receiver = self;
  v24.super_class = (Class)RSKeyframeAccumulation;
  v2 = [(RSKeyframeAccumulation *)&v24 init];
  if (v2)
  {
    v3 = objc_alloc_init(RSPointCloud);
    worldpc = v2->_worldpc;
    v2->_worldpc = v3;

    v5 = objc_alloc_init(RSTemporalMeta);
    accMeta = v2->_accMeta;
    v2->_accMeta = v5;

    uint64_t v9 = objc_msgSend_array(MEMORY[0x263EFF980], v7, v8);
    newKeyframes = v2->_newKeyframes;
    v2->_newKeyframes = (NSMutableArray *)v9;

    uint64_t v13 = objc_msgSend_array(MEMORY[0x263EFF980], v11, v12);
    diffKeyframes = v2->_diffKeyframes;
    v2->_diffKeyframes = (NSMutableArray *)v13;

    uint64_t v17 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v15, v16);
    metas = v2->_metas;
    v2->_metas = (NSMutableDictionary *)v17;

    uint64_t v21 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v19, v20);
    keyframeOrderDict = v2->_keyframeOrderDict;
    v2->_keyframeOrderDict = (NSMutableDictionary *)v21;

    v2->_skipCnt = 0;
  }
  return v2;
}

@end