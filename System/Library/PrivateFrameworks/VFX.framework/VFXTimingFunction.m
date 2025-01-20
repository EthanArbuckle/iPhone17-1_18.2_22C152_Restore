@interface VFXTimingFunction
+ (BOOL)supportsSecureCoding;
+ (id)functionWithCAMediaTimingFunction:(id)a3;
+ (id)functionWithMass:(float)a3 stiffness:(float)a4 damping:(float)a5 initialVelocity:(float)a6;
- (VFXTimingFunction)initWithCoder:(id)a3;
- (VFXTimingFunction)initWithTimingFunctionRef:(__CFXTimingFunction *)a3;
- (__CFXTimingFunction)cfxTimingFunction;
- (float)evalAtTime:(double)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VFXTimingFunction

- (VFXTimingFunction)initWithTimingFunctionRef:(__CFXTimingFunction *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VFXTimingFunction;
  v4 = [(VFXTimingFunction *)&v7 init];
  if (v4)
  {
    if (a3) {
      v5 = (__CFXTimingFunction *)CFRetain(a3);
    }
    else {
      v5 = 0;
    }
    v4->_timingFunction = v5;
  }
  return v4;
}

- (void)dealloc
{
  timingFunction = self->_timingFunction;
  if (timingFunction)
  {
    CFRelease(timingFunction);
    self->_timingFunction = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VFXTimingFunction;
  [(VFXTimingFunction *)&v4 dealloc];
}

- (float)evalAtTime:(double)a3
{
  v9.n128_u32[0] = 1.0;
  sub_1B64332B0((uint64_t)self->_timingFunction, *(__n128 *)&a3, v9, (uint64_t)a2, v3, v4, v5, v6, v7, v8);
  return v10;
}

+ (id)functionWithCAMediaTimingFunction:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = sub_1B64BA090(a3, a2);
  if (!v3) {
    return 0;
  }
  uint64_t v4 = (uint64_t)v3;
  uint64_t v5 = [VFXTimingFunction alloc];
  uint64_t v8 = objc_msgSend_initWithTimingFunctionRef_(v5, v6, v4, v7);

  return v8;
}

+ (id)functionWithMass:(float)a3 stiffness:(float)a4 damping:(float)a5 initialVelocity:(float)a6
{
  id result = (id)sub_1B6433074(a3, a4, a5, a6);
  if (result)
  {
    id v7 = result;
    uint64_t v8 = [VFXTimingFunction alloc];
    v11 = objc_msgSend_initWithTimingFunctionRef_(v8, v9, (uint64_t)v7, v10);
    return v11;
  }
  return result;
}

- (__CFXTimingFunction)cfxTimingFunction
{
  return self->_timingFunction;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v10 = (_DWORD *)sub_1B6433204((uint64_t)self->_timingFunction, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  BOOL v18 = sub_1B6433250((uint64_t)self->_timingFunction, v11, v12, v13, v14, v15, v16, v17);
  LODWORD(v19) = *v10;
  objc_msgSend_encodeFloat_forKey_(a3, v20, @"c0", v21, v19);
  LODWORD(v22) = v10[1];
  objc_msgSend_encodeFloat_forKey_(a3, v23, @"c1", v24, v22);
  LODWORD(v25) = v10[2];
  objc_msgSend_encodeFloat_forKey_(a3, v26, @"c2", v27, v25);
  LODWORD(v28) = v10[3];
  objc_msgSend_encodeFloat_forKey_(a3, v29, @"c3", v30, v28);

  objc_msgSend_encodeBool_forKey_(a3, v31, v18, @"linear");
}

- (VFXTimingFunction)initWithCoder:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)VFXTimingFunction;
  uint64_t v6 = [(VFXTimingFunction *)&v26 init];
  if (v6)
  {
    if (objc_msgSend_containsValueForKey_(a3, v4, @"linear", v5)
      && !objc_msgSend_decodeBoolForKey_(a3, v7, @"linear", v8))
    {
      objc_msgSend_decodeFloatForKey_(a3, v9, @"c0", v10);
      float v13 = v12;
      objc_msgSend_decodeFloatForKey_(a3, v14, @"c1", v15);
      float v17 = v16;
      objc_msgSend_decodeFloatForKey_(a3, v18, @"c2", v19);
      float v21 = v20;
      objc_msgSend_decodeFloatForKey_(a3, v22, @"c3", v23);
      uint64_t v11 = sub_1B6433180(v13, v17, v21, v24);
    }
    else
    {
      sub_1B6432F74(@"linear");
    }
    v6->_timingFunction = (__CFXTimingFunction *)v11;
  }
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end