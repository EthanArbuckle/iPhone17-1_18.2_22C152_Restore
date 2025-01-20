@interface MattingV2TuningParameters
- (MattingV2TuningParameters)initWithDefaults;
- (MattingV2TuningParameters)initWithTuningDictionary:(id)a3;
- (NSString)portType;
- (id)getSemanticConfigurationsFor:(id)a3 mattingConfiguration:(id *)a4;
- (id)parseSemanticConfiguration:(id)a3 semanticKey:(id)a4 mattingConfiguration:(id *)a5;
- (void)setPortType:(id)a3;
@end

@implementation MattingV2TuningParameters

- (id)parseSemanticConfiguration:(id)a3 semanticKey:(id)a4 mattingConfiguration:(id *)a5
{
  id v6 = a3;
  v8 = objc_msgSend_objectForKeyedSubscript_(v6, v7, (uint64_t)a4);
  v10 = objc_msgSend_objectForKeyedSubscript_(v6, v9, @"Default");

  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  v13 = v11;
  if (v8) {
    objc_msgSend_addObject_(v11, v12, (uint64_t)v8);
  }
  if (v10) {
    objc_msgSend_addObject_(v13, v12, (uint64_t)v10);
  }
  uint64_t v14 = objc_msgSend_objectForKeyedSubscript_(v8, v12, @"trimap");
  uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v10, v15, @"trimap");
  id v17 = objc_alloc_init(MEMORY[0x263EFF980]);
  v19 = v17;
  if (v14) {
    objc_msgSend_addObject_(v17, v18, v14);
  }
  v60 = (void *)v14;
  if (v16) {
    objc_msgSend_addObject_(v19, v18, v16);
  }
  v59 = (void *)v16;
  int v58 = sub_262F4EE3C(v13, @"radius", 1);
  unsigned int v20 = sub_262F4EE3C(v13, @"subsampling", 1);
  float v21 = sub_262F4EECC(v13, @"epsilon", 0.0001);
  unsigned int v57 = sub_262F4EE3C(v13, @"iterations", 1);
  v22 = NSNumber;
  id v23 = v13;
  v25 = objc_msgSend_numberWithBool_(v22, v24, 0);
  v26 = sub_262F4F45C(v23, @"useDepthFilter", v25);

  unsigned int v56 = objc_msgSend_BOOLValue(v26, v27, v28);
  int v29 = sub_262F4EE3C(v23, @"resolutionMode", 1);
  int v30 = sub_262F4EE3C(v19, @"type", 0);
  if (v30)
  {
    float v31 = sub_262F4EECC(v19, @"fgThresholdValue", 0.9);
    float v32 = sub_262F4EECC(v19, @"bgThresholdValue", 0.1);
    uint64_t v33 = sub_262F4EE3C(v19, @"erosionKernelSize", 0);
  }
  else
  {
    uint64_t v33 = 0;
    float v32 = 0.1;
    float v31 = 0.9;
  }
  v34 = objc_alloc_init(MattingV2SemanticConfig);
  v36 = v34;
  if (v29 == 2)
  {
    unsigned int var4 = a5->var4;
    if (a5->var5 * var4 >= a5->var3 * a5->var2)
    {
      unsigned int var5 = a5->var5;
    }
    else
    {
      unsigned int var4 = a5->var2;
      unsigned int var5 = a5->var3;
    }
  }
  else if (v29 == 1)
  {
    unsigned int var4 = a5->var4;
    unsigned int var5 = a5->var5;
  }
  else if (v29)
  {
    unsigned int var5 = 384;
    unsigned int var4 = 512;
  }
  else
  {
    unsigned int var4 = a5->var2;
    unsigned int var5 = a5->var3;
  }
  objc_msgSend_setWidth_(v34, v35, var4 / v20);
  objc_msgSend_setHeight_(v36, v39, var5 / v20);
  objc_msgSend_setKernelSpatialDiameter_(v36, v40, (2 * v58) | 1u);
  *(float *)&double v41 = v21;
  objc_msgSend_setEpsilon_(v36, v42, v43, v41);
  objc_msgSend_setIterations_(v36, v44, v57);
  objc_msgSend_setUseDepthFilter_(v36, v45, v56);
  objc_msgSend_setConstraintsEnabled_(v36, v46, v30 != 0);
  *(float *)&double v47 = v31;
  objc_msgSend_setFgThresholdValue_(v36, v48, v49, v47);
  *(float *)&double v50 = v32;
  objc_msgSend_setBgThresholdValue_(v36, v51, v52, v50);
  objc_msgSend_setErosionKernelSize_(v36, v53, v33);

  return v36;
}

- (MattingV2TuningParameters)initWithDefaults
{
  v5.receiver = self;
  v5.super_class = (Class)MattingV2TuningParameters;
  v2 = [(MattingV2TuningParameters *)&v5 init];
  v3 = v2;
  if (v2) {
    objc_storeStrong((id *)&v2->_portType, (id)*MEMORY[0x263F2C240]);
  }
  return v3;
}

- (MattingV2TuningParameters)initWithTuningDictionary:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)MattingV2TuningParameters;
  objc_super v5 = [(MattingV2TuningParameters *)&v34 init];
  v8 = v5;
  if (v4 && v5)
  {
    v9 = objc_msgSend_allKeys(v4, v6, v7);
    uint64_t v12 = objc_msgSend_firstObject(v9, v10, v11);
    portType = v8->_portType;
    v8->_portType = (NSString *)v12;

    uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v4, v14, (uint64_t)v8->_portType);
    tuningDictionaryForPortType = v8->_tuningDictionaryForPortType;
    v8->_tuningDictionaryForPortType = (NSDictionary *)v15;

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v19 = objc_msgSend_allKeys(v4, v17, v18, 0);
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v30, v35, 16);
    if (v21)
    {
      uint64_t v23 = v21;
      uint64_t v24 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v19);
          }
          v26 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if ((objc_msgSend_isEqualToString_(v26, v22, (uint64_t)v8->_portType) & 1) == 0)
          {
            v27 = objc_msgSend_objectForKeyedSubscript_(v4, v22, (uint64_t)v26);
            objc_msgSend_isEqualToDictionary_(v27, v28, (uint64_t)v8->_tuningDictionaryForPortType);
          }
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v30, v35, 16);
      }
      while (v23);
    }
  }
  return v8;
}

- (id)getSemanticConfigurationsFor:(id)a3 mattingConfiguration:(id *)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (a4->var7 == 1) {
    objc_msgSend_objectForKeyedSubscript_(self->_tuningDictionaryForPortType, v7, @"Fast");
  }
  else {
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(self->_tuningDictionaryForPortType, v7, @"Fine");
  }
  if (!v11)
  {
    tuningDictionaryForPortType = self->_tuningDictionaryForPortType;
    v13 = objc_msgSend_allKeys(tuningDictionaryForPortType, v9, v10);
    uint64_t v16 = objc_msgSend_firstObject(v13, v14, v15);
    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(tuningDictionaryForPortType, v17, (uint64_t)v16);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v6;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v39, v43, 16);
  if (v19)
  {
    uint64_t v21 = v19;
    uint64_t v22 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        char isEqualToNumber = objc_msgSend_isEqualToNumber_(v24, v20, (uint64_t)&unk_270E336A8);
        v26 = @"RefinedDisparity";
        if (isEqualToNumber) {
          goto LABEL_18;
        }
        char v27 = objc_msgSend_isEqualToNumber_(v24, v20, (uint64_t)&unk_270E336C0, @"RefinedDisparity");
        v26 = @"Matte";
        if (v27) {
          goto LABEL_18;
        }
        char v28 = objc_msgSend_isEqualToNumber_(v24, v20, (uint64_t)&unk_270E336D8, @"Matte");
        v26 = @"Hair";
        if (v28) {
          goto LABEL_18;
        }
        char v29 = objc_msgSend_isEqualToNumber_(v24, v20, (uint64_t)&unk_270E336F0, @"Hair");
        v26 = @"Skin";
        if ((v29 & 1) == 0)
        {
          char v30 = objc_msgSend_isEqualToNumber_(v24, v20, (uint64_t)&unk_270E33708, @"Skin");
          v26 = @"Teeth";
          if ((v30 & 1) == 0)
          {
            char v31 = objc_msgSend_isEqualToNumber_(v24, v20, (uint64_t)&unk_270E33720, @"Teeth");
            v26 = @"Glasses";
            if ((v31 & 1) == 0)
            {
              int v32 = objc_msgSend_isEqualToNumber_(v24, v20, (uint64_t)&unk_270E33738, @"Glasses");
              v26 = @"Sky";
              if (!v32) {
                continue;
              }
            }
          }
        }
LABEL_18:
        long long v33 = *(_OWORD *)&a4->var4;
        v38[0] = *(_OWORD *)&a4->var0;
        v38[1] = v33;
        objc_super v34 = objc_msgSend_parseSemanticConfiguration_semanticKey_mattingConfiguration_(self, v20, (uint64_t)v11, v26, v38);
        objc_msgSend_setObject_forKeyedSubscript_(v8, v35, (uint64_t)v34, v24);
      }
      uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v39, v43, 16);
    }
    while (v21);
  }

  return v8;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portType, 0);

  objc_storeStrong((id *)&self->_tuningDictionaryForPortType, 0);
}

@end