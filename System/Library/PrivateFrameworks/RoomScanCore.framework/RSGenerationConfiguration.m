@interface RSGenerationConfiguration
- (BOOL)isChairBeautificationEnabled;
- (BOOL)isCurveEnabled;
- (BOOL)isNonUniformHeightEnabled;
- (BOOL)isObjectBeautificationEnabled;
- (BOOL)isOpendoorReplaceOpeningEnabled;
- (BOOL)isOpeningReplaceOpendoorEnabled;
- (BOOL)isRoomTypeEnabled;
- (BOOL)isStandardizationEnabled;
- (BOOL)isWallOpeningMergeEnabled;
- (BOOL)isWindowDoorDetectionEnabled;
- (RSGenerationConfiguration)init;
- (RSGenerationConfiguration)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (void)setChairBeautificationEnabled:(BOOL)a3;
- (void)setCurveEnabled:(BOOL)a3;
- (void)setNonUniformHeightEnabled:(BOOL)a3;
- (void)setObjectBeautificationEnabled:(BOOL)a3;
- (void)setOpendoorReplaceOpeningEnabled:(BOOL)a3;
- (void)setOpeningReplaceOpendoorEnabled:(BOOL)a3;
- (void)setRoomTypeEnabled:(BOOL)a3;
- (void)setStandardizationEnabled:(BOOL)a3;
- (void)setWallOpeningMergeEnabled:(BOOL)a3;
- (void)setWindowDoorDetectionEnabled:(BOOL)a3;
@end

@implementation RSGenerationConfiguration

- (void)setCurveEnabled:(BOOL)a3
{
  self->_curveEnabled = a3;
}

- (BOOL)isCurveEnabled
{
  return self->_curveEnabled;
}

- (void)setRoomTypeEnabled:(BOOL)a3
{
  self->_roomTypeEnabled = a3;
}

- (BOOL)isRoomTypeEnabled
{
  return self->_roomTypeEnabled;
}

- (void)setOpendoorReplaceOpeningEnabled:(BOOL)a3
{
  self->_opendoorReplaceOpeningEnabled = a3;
}

- (BOOL)isOpendoorReplaceOpeningEnabled
{
  return self->_opendoorReplaceOpeningEnabled;
}

- (void)setNonUniformHeightEnabled:(BOOL)a3
{
  self->_nonUniformHeightEnabled = a3;
}

- (BOOL)isNonUniformHeightEnabled
{
  return self->_nonUniformHeightEnabled;
}

- (void)setOpeningReplaceOpendoorEnabled:(BOOL)a3
{
  self->_openingReplaceOpendoorEnabled = a3;
}

- (BOOL)isOpeningReplaceOpendoorEnabled
{
  return self->_openingReplaceOpendoorEnabled;
}

- (void)setWallOpeningMergeEnabled:(BOOL)a3
{
  self->_wallOpeningMergeEnabled = a3;
}

- (BOOL)isWallOpeningMergeEnabled
{
  return self->_wallOpeningMergeEnabled;
}

- (void)setStandardizationEnabled:(BOOL)a3
{
  self->_standardizationEnabled = a3;
}

- (BOOL)isStandardizationEnabled
{
  return self->_standardizationEnabled;
}

- (void)setChairBeautificationEnabled:(BOOL)a3
{
  self->_chairBeautificationEnabled = a3;
}

- (BOOL)isChairBeautificationEnabled
{
  return self->_chairBeautificationEnabled;
}

- (void)setObjectBeautificationEnabled:(BOOL)a3
{
  self->_objectBeautificationEnabled = a3;
}

- (BOOL)isObjectBeautificationEnabled
{
  return self->_objectBeautificationEnabled;
}

- (void)setWindowDoorDetectionEnabled:(BOOL)a3
{
  self->_windowDoorDetectionEnabled = a3;
}

- (BOOL)isWindowDoorDetectionEnabled
{
  return self->_windowDoorDetectionEnabled;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2);
  v6 = objc_msgSend_numberWithBool_(NSNumber, v5, self->_windowDoorDetectionEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v7, (uint64_t)v6, @"doorWindowDetectionEnabled");

  v9 = objc_msgSend_numberWithBool_(NSNumber, v8, self->_objectBeautificationEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v10, (uint64_t)v9, @"objectBeautificationEnabled");

  v12 = objc_msgSend_numberWithBool_(NSNumber, v11, self->_chairBeautificationEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, (uint64_t)v12, @"chairBeautificationEnabled");

  v15 = objc_msgSend_numberWithBool_(NSNumber, v14, self->_standardizationEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v16, (uint64_t)v15, @"standardizationEnabled");

  v18 = objc_msgSend_numberWithBool_(NSNumber, v17, self->_wallOpeningMergeEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v19, (uint64_t)v18, @"wallOpeningMergeEnabled");

  v21 = objc_msgSend_numberWithBool_(NSNumber, v20, self->_openingReplaceOpendoorEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v22, (uint64_t)v21, @"openingReplaceOpendoorEnabled");

  v24 = objc_msgSend_numberWithBool_(NSNumber, v23, self->_nonUniformHeightEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v25, (uint64_t)v24, @"nonUniformHeightEnabled");

  v27 = objc_msgSend_numberWithBool_(NSNumber, v26, self->_opendoorReplaceOpeningEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v28, (uint64_t)v27, @"opendoorReplaceOpeningEnabled");

  v30 = objc_msgSend_numberWithBool_(NSNumber, v29, self->_roomTypeEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v31, (uint64_t)v30, @"roomTypeEnabled");

  v33 = objc_msgSend_numberWithBool_(NSNumber, v32, self->_curveEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v34, (uint64_t)v33, @"curveEnabled");

  return v4;
}

- (RSGenerationConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)RSGenerationConfiguration;
  v6 = [(RSGenerationConfiguration *)&v47 init];
  if (v6)
  {
    v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"doorWindowDetectionEnabled");
    v6->_windowDoorDetectionEnabled = objc_msgSend_BOOLValue(v7, v8, v9);

    v11 = objc_msgSend_objectForKeyedSubscript_(v4, v10, @"objectBeautificationEnabled");
    v6->_objectBeautificationEnabled = objc_msgSend_BOOLValue(v11, v12, v13);

    v15 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"chairBeautificationEnabled");
    v6->_chairBeautificationEnabled = objc_msgSend_BOOLValue(v15, v16, v17);

    v19 = objc_msgSend_objectForKeyedSubscript_(v4, v18, @"standardizationEnabled");
    v6->_standardizationEnabled = objc_msgSend_BOOLValue(v19, v20, v21);

    v23 = objc_msgSend_objectForKeyedSubscript_(v4, v22, @"wallOpeningMergeEnabled");
    v6->_wallOpeningMergeEnabled = objc_msgSend_BOOLValue(v23, v24, v25);

    v27 = objc_msgSend_objectForKeyedSubscript_(v4, v26, @"openingReplaceOpendoorEnabled");
    v6->_openingReplaceOpendoorEnabled = objc_msgSend_BOOLValue(v27, v28, v29);

    v31 = objc_msgSend_objectForKeyedSubscript_(v4, v30, @"nonUniformHeightEnabled");
    v6->_nonUniformHeightEnabled = objc_msgSend_BOOLValue(v31, v32, v33);

    v35 = objc_msgSend_objectForKeyedSubscript_(v4, v34, @"opendoorReplaceOpeningEnabled");
    v6->_opendoorReplaceOpeningEnabled = objc_msgSend_BOOLValue(v35, v36, v37);

    v39 = objc_msgSend_objectForKeyedSubscript_(v4, v38, @"roomTypeEnabled");
    v6->_roomTypeEnabled = objc_msgSend_BOOLValue(v39, v40, v41);

    v43 = objc_msgSend_objectForKeyedSubscript_(v4, v42, @"curveEnabled");
    v6->_curveEnabled = objc_msgSend_BOOLValue(v43, v44, v45);
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id result = (id)objc_msgSend_init(v7, v8, v9);
  *((unsigned char *)result + 8) = self->_windowDoorDetectionEnabled;
  *((unsigned char *)result + 9) = self->_objectBeautificationEnabled;
  *((unsigned char *)result + 10) = self->_chairBeautificationEnabled;
  *((unsigned char *)result + 11) = self->_standardizationEnabled;
  *((unsigned char *)result + 12) = self->_wallOpeningMergeEnabled;
  *((unsigned char *)result + 13) = self->_openingReplaceOpendoorEnabled;
  *((unsigned char *)result + 14) = self->_nonUniformHeightEnabled;
  *((unsigned char *)result + 15) = self->_opendoorReplaceOpeningEnabled;
  *((unsigned char *)result + 16) = self->_roomTypeEnabled;
  *((unsigned char *)result + 17) = self->_curveEnabled;
  return result;
}

- (RSGenerationConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)RSGenerationConfiguration;
  id result = [(RSGenerationConfiguration *)&v3 init];
  if (result)
  {
    *(_DWORD *)&result->_windowDoorDetectionEnabled = 16843009;
    *(_WORD *)&result->_wallOpeningMergeEnabled = 1;
    *(_DWORD *)&result->_nonUniformHeightEnabled = 16843009;
  }
  return result;
}

@end