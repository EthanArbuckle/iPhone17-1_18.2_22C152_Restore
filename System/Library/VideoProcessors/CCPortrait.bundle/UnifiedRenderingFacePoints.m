@interface UnifiedRenderingFacePoints
+ (id)validKeys;
- (CGPoint)centerPos;
- (CGPoint)chinCenterPos;
- (CGPoint)leftEyeCenterPos;
- (CGPoint)rightEyeCenterPos;
- (UnifiedRenderingFacePoints)init;
- (UnifiedRenderingFacePoints)initWithCenterPos:(CGPoint)a3 leftEyeCenterPos:(CGPoint)a4 rightEyeCenterPos:(CGPoint)a5 chinCenterPos:(CGPoint)a6;
- (UnifiedRenderingFacePoints)initWithDictionary:(id)a3;
- (id)debugDescription;
- (void)setCenterPos:(CGPoint)a3;
- (void)setChinCenterPos:(CGPoint)a3;
- (void)setLeftEyeCenterPos:(CGPoint)a3;
- (void)setRightEyeCenterPos:(CGPoint)a3;
@end

@implementation UnifiedRenderingFacePoints

- (UnifiedRenderingFacePoints)init
{
  v4.receiver = self;
  v4.super_class = (Class)UnifiedRenderingFacePoints;
  result = [(UnifiedRenderingFacePoints *)&v4 init];
  if (result)
  {
    CGPoint v3 = (CGPoint)*MEMORY[0x263F00148];
    result->_centerPos = (CGPoint)*MEMORY[0x263F00148];
    result->_leftEyeCenterPos = v3;
    result->_rightEyeCenterPos = v3;
    result->_chinCenterPos = v3;
  }
  return result;
}

- (UnifiedRenderingFacePoints)initWithCenterPos:(CGPoint)a3 leftEyeCenterPos:(CGPoint)a4 rightEyeCenterPos:(CGPoint)a5 chinCenterPos:(CGPoint)a6
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  CGFloat v8 = a5.y;
  CGFloat v9 = a5.x;
  CGFloat v10 = a4.y;
  CGFloat v11 = a4.x;
  CGFloat v12 = a3.y;
  CGFloat v13 = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)UnifiedRenderingFacePoints;
  result = [(UnifiedRenderingFacePoints *)&v15 init];
  if (result)
  {
    result->_centerPos.CGFloat x = v13;
    result->_centerPos.CGFloat y = v12;
    result->_leftEyeCenterPos.CGFloat x = v11;
    result->_leftEyeCenterPos.CGFloat y = v10;
    result->_rightEyeCenterPos.CGFloat x = v9;
    result->_rightEyeCenterPos.CGFloat y = v8;
    result->_chinCenterPos.CGFloat x = x;
    result->_chinCenterPos.CGFloat y = y;
  }
  return result;
}

- (id)debugDescription
{
  CGPoint v3 = NSString;
  objc_super v4 = objc_opt_class();
  v7 = objc_msgSend_description(v4, v5, v6);
  CGFloat v9 = objc_msgSend_stringWithFormat_(v3, v8, @"<%@: %p center:%.4f,%.4f leftEye:%.4f,%.4f rightEye:%.4f,%.4f chin:%.4f,%.4f>", v7, self, *(void *)&self->_centerPos.x, *(void *)&self->_centerPos.y, *(void *)&self->_leftEyeCenterPos.x, *(void *)&self->_leftEyeCenterPos.y, *(void *)&self->_rightEyeCenterPos.x, *(void *)&self->_rightEyeCenterPos.y, *(void *)&self->_chinCenterPos.x, *(void *)&self->_chinCenterPos.y);

  return v9;
}

+ (id)validKeys
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x263EFFA08], a2, @"centerPos", @"leftEyeCenterPos", @"rightEyeCenterPos", @"chinCenterPos", 0);
}

- (UnifiedRenderingFacePoints)initWithDictionary:(id)a3
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)UnifiedRenderingFacePoints;
  v5 = [(UnifiedRenderingFacePoints *)&v57 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    CGFloat v9 = objc_msgSend_validKeys(v6, v7, v8);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    CGFloat v12 = objc_msgSend_allKeys(v4, v10, v11);
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v53, v64, 16);
    if (v14)
    {
      uint64_t v16 = v14;
      uint64_t v17 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v54 != v17) {
            objc_enumerationMutation(v12);
          }
          uint64_t v19 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          if ((objc_msgSend_containsObject_(v9, v15, v19) & 1) == 0)
          {
            v20 = uni_logger_api();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v21 = objc_opt_class();
              *(_DWORD *)buf = 136446722;
              v59 = "-[UnifiedRenderingFacePoints initWithDictionary:]";
              __int16 v60 = 2112;
              v61 = v21;
              __int16 v62 = 2112;
              uint64_t v63 = v19;
              id v22 = v21;
              _os_log_error_impl(&dword_262E0F000, v20, OS_LOG_TYPE_ERROR, "%{public}s Invalid key for %@: %@; results will be unpredictable",
                buf,
                0x20u);
            }
          }
        }
        uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v53, v64, 16);
      }
      while (v16);
    }

    v24 = objc_msgSend_objectForKeyedSubscript_(v4, v23, @"centerPos");

    if (v24)
    {
      v26 = objc_msgSend_objectForKeyedSubscript_(v4, v25, @"centerPos");
      objc_msgSend_CGPointValue(v26, v27, v28);
      v5->_centerPos.CGFloat x = v29;
      v5->_centerPos.CGFloat y = v30;
    }
    v31 = objc_msgSend_objectForKeyedSubscript_(v4, v25, @"leftEyeCenterPos");

    if (v31)
    {
      v33 = objc_msgSend_objectForKeyedSubscript_(v4, v32, @"leftEyeCenterPos");
      objc_msgSend_CGPointValue(v33, v34, v35);
      v5->_leftEyeCenterPos.CGFloat x = v36;
      v5->_leftEyeCenterPos.CGFloat y = v37;
    }
    v38 = objc_msgSend_objectForKeyedSubscript_(v4, v32, @"rightEyeCenterPos");

    if (v38)
    {
      v40 = objc_msgSend_objectForKeyedSubscript_(v4, v39, @"rightEyeCenterPos");
      objc_msgSend_CGPointValue(v40, v41, v42);
      v5->_rightEyeCenterPos.CGFloat x = v43;
      v5->_rightEyeCenterPos.CGFloat y = v44;
    }
    v45 = objc_msgSend_objectForKeyedSubscript_(v4, v39, @"chinCenterPos");

    if (v45)
    {
      v47 = objc_msgSend_objectForKeyedSubscript_(v4, v46, @"chinCenterPos");
      objc_msgSend_CGPointValue(v47, v48, v49);
      v5->_chinCenterPos.CGFloat x = v50;
      v5->_chinCenterPos.CGFloat y = v51;
    }
  }

  return v5;
}

- (CGPoint)centerPos
{
  double x = self->_centerPos.x;
  double y = self->_centerPos.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenterPos:(CGPoint)a3
{
  self->_centerPos = a3;
}

- (CGPoint)leftEyeCenterPos
{
  double x = self->_leftEyeCenterPos.x;
  double y = self->_leftEyeCenterPos.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLeftEyeCenterPos:(CGPoint)a3
{
  self->_leftEyeCenterPos = a3;
}

- (CGPoint)rightEyeCenterPos
{
  double x = self->_rightEyeCenterPos.x;
  double y = self->_rightEyeCenterPos.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setRightEyeCenterPos:(CGPoint)a3
{
  self->_rightEyeCenterPos = a3;
}

- (CGPoint)chinCenterPos
{
  double x = self->_chinCenterPos.x;
  double y = self->_chinCenterPos.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setChinCenterPos:(CGPoint)a3
{
  self->_chinCenterPos = a3;
}

@end