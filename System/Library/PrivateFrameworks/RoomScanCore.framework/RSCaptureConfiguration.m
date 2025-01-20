@interface RSCaptureConfiguration
- (BOOL)isBayWindowRecessedAreaEnabled;
- (BOOL)isBoundaryRefinementEnabled;
- (BOOL)isDoorReplaceOpeningEnabled;
- (BOOL)isDoorWindowBeautificationEnabled;
- (BOOL)isDriftDetectionEnabled;
- (BOOL)isLiveResultEnabled;
- (BOOL)isMarkerCoachingEnabled;
- (BOOL)isNonUniformHeightEnabled;
- (BOOL)isObjectBeautificationEnabled;
- (BOOL)isOnboardingEnabled;
- (BOOL)isOpendoorReplaceOpeningEnabled;
- (BOOL)isOpeningReplaceOpendoorEnabled;
- (BOOL)isStandardizationEnabled;
- (BOOL)isTextCoachingEnabled;
- (BOOL)isWindowDoorDetectionEnabled;
- (RSCaptureConfiguration)init;
- (RSCaptureConfiguration)initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)maxFramerate;
- (void)setBayWindowRecessedAreaEnabled:(BOOL)a3;
- (void)setBoundaryRefinementEnabled:(BOOL)a3;
- (void)setDoorReplaceOpeningEnabled:(BOOL)a3;
- (void)setDoorWindowBeautificationEnabled:(BOOL)a3;
- (void)setDriftDetectionEnabled:(BOOL)a3;
- (void)setLiveResultEnabled:(BOOL)a3;
- (void)setMarkerCoachingEnabled:(BOOL)a3;
- (void)setMaxFramerate:(unint64_t)a3;
- (void)setNonUniformHeightEnabled:(BOOL)a3;
- (void)setObjectBeautificationEnabled:(BOOL)a3;
- (void)setOnboardingEnabled:(BOOL)a3;
- (void)setOpendoorReplaceOpeningEnabled:(BOOL)a3;
- (void)setOpeningReplaceOpendoorEnabled:(BOOL)a3;
- (void)setStandardizationEnabled:(BOOL)a3;
- (void)setTextCoachingEnabled:(BOOL)a3;
- (void)setWindowDoorDetectionEnabled:(BOOL)a3;
@end

@implementation RSCaptureConfiguration

- (void)setMaxFramerate:(unint64_t)a3
{
  self->_maxFramerate = a3;
}

- (unint64_t)maxFramerate
{
  return self->_maxFramerate;
}

- (void)setBayWindowRecessedAreaEnabled:(BOOL)a3
{
  self->_bayWindowRecessedAreaEnabled = a3;
}

- (BOOL)isBayWindowRecessedAreaEnabled
{
  return self->_bayWindowRecessedAreaEnabled;
}

- (void)setBoundaryRefinementEnabled:(BOOL)a3
{
  self->_boundaryRefinementEnabled = a3;
}

- (BOOL)isBoundaryRefinementEnabled
{
  return self->_boundaryRefinementEnabled;
}

- (void)setDoorReplaceOpeningEnabled:(BOOL)a3
{
  self->_doorReplaceOpeningEnabled = a3;
}

- (BOOL)isDoorReplaceOpeningEnabled
{
  return self->_doorReplaceOpeningEnabled;
}

- (void)setOpendoorReplaceOpeningEnabled:(BOOL)a3
{
  self->_opendoorReplaceOpeningEnabled = a3;
}

- (BOOL)isOpendoorReplaceOpeningEnabled
{
  return self->_opendoorReplaceOpeningEnabled;
}

- (void)setOpeningReplaceOpendoorEnabled:(BOOL)a3
{
  self->_openingReplaceOpendoorEnabled = a3;
}

- (BOOL)isOpeningReplaceOpendoorEnabled
{
  return self->_openingReplaceOpendoorEnabled;
}

- (void)setNonUniformHeightEnabled:(BOOL)a3
{
  self->_nonUniformHeightEnabled = a3;
}

- (BOOL)isNonUniformHeightEnabled
{
  return self->_nonUniformHeightEnabled;
}

- (void)setDriftDetectionEnabled:(BOOL)a3
{
  self->_driftDetectionEnabled = a3;
}

- (BOOL)isDriftDetectionEnabled
{
  return self->_driftDetectionEnabled;
}

- (void)setDoorWindowBeautificationEnabled:(BOOL)a3
{
  self->_doorWindowBeautificationEnabled = a3;
}

- (BOOL)isDoorWindowBeautificationEnabled
{
  return self->_doorWindowBeautificationEnabled;
}

- (void)setMarkerCoachingEnabled:(BOOL)a3
{
  self->_markerCoachingEnabled = a3;
}

- (BOOL)isMarkerCoachingEnabled
{
  return self->_markerCoachingEnabled;
}

- (void)setStandardizationEnabled:(BOOL)a3
{
  self->_standardizationEnabled = a3;
}

- (BOOL)isStandardizationEnabled
{
  return self->_standardizationEnabled;
}

- (void)setObjectBeautificationEnabled:(BOOL)a3
{
  self->_objectBeautificationEnabled = a3;
}

- (BOOL)isObjectBeautificationEnabled
{
  return self->_objectBeautificationEnabled;
}

- (void)setOnboardingEnabled:(BOOL)a3
{
  self->_onboardingEnabled = a3;
}

- (BOOL)isOnboardingEnabled
{
  return self->_onboardingEnabled;
}

- (void)setTextCoachingEnabled:(BOOL)a3
{
  self->_textCoachingEnabled = a3;
}

- (BOOL)isTextCoachingEnabled
{
  return self->_textCoachingEnabled;
}

- (void)setLiveResultEnabled:(BOOL)a3
{
  self->_liveResultEnabled = a3;
}

- (BOOL)isLiveResultEnabled
{
  return self->_liveResultEnabled;
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
  v6 = objc_msgSend_numberWithBool_(NSNumber, v5, self->_liveResultEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v7, (uint64_t)v6, @"liveResultEnabled");

  v9 = objc_msgSend_numberWithBool_(NSNumber, v8, self->_textCoachingEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v10, (uint64_t)v9, @"textCoachingEnabled");

  v12 = objc_msgSend_numberWithBool_(NSNumber, v11, self->_onboardingEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v13, (uint64_t)v12, @"onboardingEnabled");

  v15 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v14, self->_coachingMaxFrameRate);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v16, (uint64_t)v15, @"coachingMaxFrameRate");

  v18 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v17, self->_maxFramerate);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v19, (uint64_t)v18, @"maxFramerate");

  v21 = objc_msgSend_numberWithBool_(NSNumber, v20, self->_mirrorDetectionEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v22, (uint64_t)v21, @"mirrorDetectionEnabled");

  v24 = objc_msgSend_numberWithBool_(NSNumber, v23, self->_objectBeautificationEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v25, (uint64_t)v24, @"objectBeautificationEnabled");

  v27 = objc_msgSend_numberWithBool_(NSNumber, v26, self->_standardizationEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v28, (uint64_t)v27, @"standardizationEnabled");

  v30 = objc_msgSend_numberWithBool_(NSNumber, v29, self->_markerCoachingEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v31, (uint64_t)v30, @"markerCoachingEnabled");

  v33 = objc_msgSend_numberWithBool_(NSNumber, v32, self->_doorWindowBeautificationEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v34, (uint64_t)v33, @"doorWindowBeautificationEnabled");

  v36 = objc_msgSend_numberWithBool_(NSNumber, v35, self->_curvedWallEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v37, (uint64_t)v36, @"curvedWallEnabled");

  v39 = objc_msgSend_numberWithBool_(NSNumber, v38, self->_driftDetectionEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v40, (uint64_t)v39, @"driftDetectionEnabled");

  v42 = objc_msgSend_numberWithBool_(NSNumber, v41, self->_nonUniformHeightEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v43, (uint64_t)v42, @"nonUniformHeightEnabled");

  v45 = objc_msgSend_numberWithBool_(NSNumber, v44, self->_openingReplaceOpendoorEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v46, (uint64_t)v45, @"openingReplaceOpendoorEnabled");

  v48 = objc_msgSend_numberWithBool_(NSNumber, v47, self->_opendoorReplaceOpeningEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v49, (uint64_t)v48, @"opendoorReplaceOpeningEnabled");

  v51 = objc_msgSend_numberWithBool_(NSNumber, v50, self->_doorReplaceOpeningEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v52, (uint64_t)v51, @"doorReplaceOpeningEnabled");

  v54 = objc_msgSend_numberWithBool_(NSNumber, v53, self->_boundaryRefinementEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v55, (uint64_t)v54, @"boundaryRefinementEnabled");

  v57 = objc_msgSend_numberWithBool_(NSNumber, v56, self->_bayWindowRecessedAreaEnabled);
  objc_msgSend_setObject_forKeyedSubscript_(v4, v58, (uint64_t)v57, @"bayWindowRecessedAreaEnabled");

  return v4;
}

- (RSCaptureConfiguration)initWithDictionary:(id)a3
{
  id v4 = a3;
  v83.receiver = self;
  v83.super_class = (Class)RSCaptureConfiguration;
  v6 = [(RSCaptureConfiguration *)&v83 init];
  if (v6)
  {
    v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, @"liveResultEnabled");
    v6->_liveResultEnabled = objc_msgSend_BOOLValue(v7, v8, v9);

    v11 = objc_msgSend_objectForKeyedSubscript_(v4, v10, @"textCoachingEnabled");
    v6->_textCoachingEnabled = objc_msgSend_BOOLValue(v11, v12, v13);

    v15 = objc_msgSend_objectForKeyedSubscript_(v4, v14, @"onboardingEnabled");
    v6->_onboardingEnabled = objc_msgSend_BOOLValue(v15, v16, v17);

    v19 = objc_msgSend_objectForKeyedSubscript_(v4, v18, @"coachingMaxFrameRate");
    v6->_coachingMaxFrameRate = (int)objc_msgSend_intValue(v19, v20, v21);

    v23 = objc_msgSend_objectForKeyedSubscript_(v4, v22, @"maxFramerate");
    v6->_maxFramerate = (int)objc_msgSend_intValue(v23, v24, v25);

    v27 = objc_msgSend_objectForKeyedSubscript_(v4, v26, @"mirrorDetectionEnabled");
    v6->_mirrorDetectionEnabled = objc_msgSend_BOOLValue(v27, v28, v29);

    v31 = objc_msgSend_objectForKeyedSubscript_(v4, v30, @"objectBeautificationEnabled");
    v6->_objectBeautificationEnabled = objc_msgSend_BOOLValue(v31, v32, v33);

    v35 = objc_msgSend_objectForKeyedSubscript_(v4, v34, @"standardizationEnabled");
    v6->_standardizationEnabled = objc_msgSend_BOOLValue(v35, v36, v37);

    v39 = objc_msgSend_objectForKeyedSubscript_(v4, v38, @"markerCoachingEnabled");
    v6->_markerCoachingEnabled = objc_msgSend_BOOLValue(v39, v40, v41);

    v43 = objc_msgSend_objectForKeyedSubscript_(v4, v42, @"doorWindowBeautificationEnabled");
    v6->_doorWindowBeautificationEnabled = objc_msgSend_BOOLValue(v43, v44, v45);

    v47 = objc_msgSend_objectForKeyedSubscript_(v4, v46, @"curvedWallEnabled");
    v6->_curvedWallEnabled = objc_msgSend_BOOLValue(v47, v48, v49);

    v51 = objc_msgSend_objectForKeyedSubscript_(v4, v50, @"driftDetectionEnabled");
    v6->_driftDetectionEnabled = objc_msgSend_BOOLValue(v51, v52, v53);

    v55 = objc_msgSend_objectForKeyedSubscript_(v4, v54, @"nonUniformHeightEnabled");
    v6->_nonUniformHeightEnabled = objc_msgSend_BOOLValue(v55, v56, v57);

    v59 = objc_msgSend_objectForKeyedSubscript_(v4, v58, @"openingReplaceOpendoorEnabled");
    v6->_openingReplaceOpendoorEnabled = objc_msgSend_BOOLValue(v59, v60, v61);

    v63 = objc_msgSend_objectForKeyedSubscript_(v4, v62, @"opendoorReplaceOpeningEnabled");
    v6->_opendoorReplaceOpeningEnabled = objc_msgSend_BOOLValue(v63, v64, v65);

    v67 = objc_msgSend_objectForKeyedSubscript_(v4, v66, @"doorReplaceOpeningEnabled");
    v6->_doorReplaceOpeningEnabled = objc_msgSend_BOOLValue(v67, v68, v69);

    v71 = objc_msgSend_objectForKeyedSubscript_(v4, v70, @"boundaryRefinementEnabled");
    v6->_boundaryRefinementEnabled = objc_msgSend_BOOLValue(v71, v72, v73);

    v75 = objc_msgSend_objectForKeyedSubscript_(v4, v74, @"bayWindowRecessedAreaEnabled");
    v6->_bayWindowRecessedAreaEnabled = objc_msgSend_BOOLValue(v75, v76, v77);

    v79 = objc_msgSend_objectForKeyedSubscript_(v4, v78, @"uniformHeightPolygonEnabled");
    v6->_uniformHeightPolygonEnabled = objc_msgSend_BOOLValue(v79, v80, v81);
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id result = (id)objc_msgSend_init(v7, v8, v9);
  *((unsigned char *)result + 9) = self->_liveResultEnabled;
  *((unsigned char *)result + 8) = self->_windowDoorDetectionEnabled;
  *((void *)result + 4) = self->_maxFramerate;
  *((unsigned char *)result + 10) = self->_textCoachingEnabled;
  *((unsigned char *)result + 11) = self->_onboardingEnabled;
  *((unsigned char *)result + 23) = self->_mirrorDetectionEnabled;
  *((unsigned char *)result + 12) = self->_objectBeautificationEnabled;
  *((unsigned char *)result + 13) = self->_standardizationEnabled;
  *((unsigned char *)result + 14) = self->_markerCoachingEnabled;
  *((unsigned char *)result + 15) = self->_doorWindowBeautificationEnabled;
  *((unsigned char *)result + 24) = self->_curvedWallEnabled;
  *((unsigned char *)result + 16) = self->_driftDetectionEnabled;
  *((unsigned char *)result + 17) = self->_nonUniformHeightEnabled;
  *((unsigned char *)result + 18) = self->_openingReplaceOpendoorEnabled;
  *((unsigned char *)result + 19) = self->_opendoorReplaceOpeningEnabled;
  *((unsigned char *)result + 20) = self->_doorReplaceOpeningEnabled;
  *((unsigned char *)result + 21) = self->_boundaryRefinementEnabled;
  *((unsigned char *)result + 22) = self->_bayWindowRecessedAreaEnabled;
  *((unsigned char *)result + 25) = self->_uniformHeightPolygonEnabled;
  return result;
}

- (RSCaptureConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)RSCaptureConfiguration;
  id result = [(RSCaptureConfiguration *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_maxFramerate = xmmword_25B5F1550;
    *(_WORD *)&result->_curvedWallEnabled = 0;
    *(void *)&result->_windowDoorDetectionEnabled = 16843009;
    *(void *)&result->_driftDetectionEnabled = 0x10100010101;
  }
  return result;
}

@end