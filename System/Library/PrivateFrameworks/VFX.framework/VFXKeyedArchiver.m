@interface VFXKeyedArchiver
+ (id)archivedDataWithRootObject:(id)a3 options:(id)a4;
- (BOOL)skipMorphTargets;
- (NSDictionary)options;
- (void)dealloc;
- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4;
- (void)setOptions:(id)a3;
- (void)setSkipMorphTargets:(BOOL)a3;
@end

@implementation VFXKeyedArchiver

+ (id)archivedDataWithRootObject:(id)a3 options:(id)a4
{
  id v7 = objc_allocWithZone(MEMORY[0x1E4F1CA58]);
  id v10 = (id)objc_msgSend_initWithLength_(v7, v8, 0, v9);
  v11 = objc_opt_new();
  id v12 = objc_allocWithZone((Class)a1);
  id v15 = (id)objc_msgSend_initForWritingWithMutableData_(v12, v13, (uint64_t)v10, v14);
  objc_msgSend_setOptions_(v15, v16, (uint64_t)a4, v17);
  objc_msgSend_encodeObject_forKey_(v15, v18, (uint64_t)a3, *MEMORY[0x1E4F284E8]);
  objc_msgSend_finishEncoding(v15, v19, v20, v21);
  objc_msgSend_drain(v11, v22, v23, v24);
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXKeyedArchiver;
  [(NSKeyedArchiver *)&v3 dealloc];
}

- (void)encodeValueOfObjCType:(const char *)a3 at:(const void *)a4
{
  if (!strcmp(a3, "{CATransform3D=dddddddddddddddd}"))
  {
    memset(v10, 0, sizeof(v10));
    *(void *)&double v7 = *(_OWORD *)&sub_1B651FEB8(v10, (float64x2_t *)a4);
    objc_msgSend_encodeBytes_length_(self, v8, (uint64_t)v10, 64, v7);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VFXKeyedArchiver;
    [(NSKeyedArchiver *)&v9 encodeValueOfObjCType:a3 at:a4];
  }
}

- (NSDictionary)options
{
  return self->options;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)skipMorphTargets
{
  return self->skipMorphTargets;
}

- (void)setSkipMorphTargets:(BOOL)a3
{
  self->skipMorphTargets = a3;
}

@end