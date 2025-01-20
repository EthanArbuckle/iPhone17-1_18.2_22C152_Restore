@interface VFXIESProfile
+ (BOOL)supportsSecureCoding;
+ (VFXIESProfile)profileWithURL:(id)a3;
- (NSString)identifier;
- (NSString)name;
- (VFXIESProfile)initWithCoder:(id)a3;
- (const)_infoHangle;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
@end

@implementation VFXIESProfile

- (void)dealloc
{
  objc_msgSend_setName_(self, a2, 0, v2);

  sub_1B65143C8((void **)&self->_iesInfo);
  v4.receiver = self;
  v4.super_class = (Class)VFXIESProfile;
  [(VFXIESProfile *)&v4 dealloc];
}

+ (VFXIESProfile)profileWithURL:(id)a3
{
  objc_super v4 = objc_alloc_init((Class)objc_opt_class());
  if (sub_1B6513A2C(a3, (uint64_t)(v4 + 1), v5, v6))
  {
    v14 = objc_msgSend_UUID(MEMORY[0x1E4F29128], v7, v8, v9);
    v4[14] = (id)objc_msgSend_UUIDString(v14, v15, v16, v17);
    return (VFXIESProfile *)v4;
  }
  else
  {
    sub_1B63F2F54(16, @"Error: failed to load ies from %@", v8, v9, v10, v11, v12, v13, (uint64_t)a3);

    return 0;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t anglesHCount = self->_iesInfo.anglesHCount;
  if ((int)anglesHCount >= 1)
  {
    size_t v6 = 4 * anglesHCount;
    v7 = malloc_type_malloc(4 * anglesHCount, 0x9A184B11uLL);
    v4[10] = v7;
    memcpy(v7, self->_iesInfo.anglesH, v6);
  }
  uint64_t anglesVCount = self->_iesInfo.anglesVCount;
  if ((int)anglesVCount >= 1)
  {
    size_t v9 = 4 * anglesVCount;
    uint64_t v10 = malloc_type_malloc(4 * anglesVCount, 0x518CF102uLL);
    v4[11] = v10;
    memcpy(v10, self->_iesInfo.anglesV, v9);
  }
  uint64_t candalaValuesCount = self->_iesInfo.candalaValuesCount;
  if ((int)candalaValuesCount >= 1)
  {
    size_t v12 = 4 * candalaValuesCount;
    uint64_t v13 = malloc_type_malloc(4 * candalaValuesCount, 0xDF688693uLL);
    v4[12] = v13;
    memcpy(v13, self->_iesInfo.candalaValues, v12);
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t anglesHCount = self->_iesInfo.anglesHCount;
  uint64_t anglesVCount = self->_iesInfo.anglesVCount;
  size_t v7 = 4 * self->_iesInfo.candalaValuesCount;
  uint64_t v8 = malloc_type_malloc(4 * anglesHCount + 4 * anglesVCount + v7 + 72, 0xB74C91B2uLL);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)&self->_iesInfo.totalLights;
  long long v9 = *(_OWORD *)&self->_iesInfo.anglesHCount;
  long long v10 = *(_OWORD *)&self->_iesInfo.length;
  long long v11 = *(_OWORD *)&self->_iesInfo.maxHAngle;
  v8[8] = *(void *)&self->_iesInfo.inputWatts;
  *((_OWORD *)v8 + 2) = v9;
  *((_OWORD *)v8 + 3) = v10;
  *((_OWORD *)v8 + 1) = v11;
  memcpy(v8 + 9, self->_iesInfo.anglesH, 4 * anglesHCount);
  memcpy((char *)v8 + 4 * anglesHCount + 72, self->_iesInfo.anglesV, 4 * anglesVCount);
  memcpy((char *)v8 + 4 * anglesHCount + 4 * anglesVCount + 72, self->_iesInfo.candalaValues, v7);
  uint64_t v13 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E4F1C9B8], v12, (uint64_t)v8, 4 * anglesHCount + 4 * anglesVCount + v7 + 72, 1);
  objc_msgSend_encodeObject_forKey_(a3, v14, v13, @"iesData");
  objc_msgSend_encodeObject_forKey_(a3, v15, (uint64_t)self->_name, @"name");
  identifier = self->_identifier;

  objc_msgSend_encodeObject_forKey_(a3, v16, (uint64_t)identifier, @"identifier");
}

- (VFXIESProfile)initWithCoder:(id)a3
{
  v48.receiver = self;
  v48.super_class = (Class)VFXIESProfile;
  objc_super v4 = [(VFXIESProfile *)&v48 init];
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v7 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, @"name");
    objc_msgSend_setName_(v4, v8, v7, v9);
    uint64_t v10 = objc_opt_class();
    *((void *)v4 + 14) = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v11, v10, @"name");
    uint64_t v12 = objc_opt_class();
    v14 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v13, v12, @"iesData");
    uint64_t v18 = objc_msgSend_bytes(v14, v15, v16, v17);
    if ((unint64_t)objc_msgSend_length(v14, v19, v20, v21) >= 0x48)
    {
      long long v29 = *(_OWORD *)(v18 + 48);
      uint64_t v30 = *(void *)(v18 + 64);
      long long v31 = *(_OWORD *)(v18 + 16);
      *(_OWORD *)(v4 + 40) = *(_OWORD *)(v18 + 32);
      *(_OWORD *)(v4 + 8) = *(_OWORD *)v18;
      *((void *)v4 + 9) = v30;
      *(_OWORD *)(v4 + 56) = v29;
      *(_OWORD *)(v4 + 24) = v31;
      uint64_t v32 = *((int *)v4 + 11);
      size_t v33 = 4 * *((int *)v4 + 10);
      uint64_t v34 = *((int *)v4 + 12);
      if (v33 + 4 * v32 + 4 * v34 + 72 == objc_msgSend_length(v14, v22, v23, v24))
      {
        size_t v41 = 4 * v34;
        v42 = (char *)(v18 + 72);
        v43 = malloc_type_malloc(v33, 0x258C5631uLL);
        *((void *)v4 + 10) = v43;
        memcpy(v43, v42, v33);
        v44 = &v42[v33];
        v45 = malloc_type_malloc(4 * v32, 0xE71EC9E4uLL);
        *((void *)v4 + 11) = v45;
        memcpy(v45, v44, 4 * v32);
        v46 = malloc_type_malloc(v41, 0x904F2763uLL);
        *((void *)v4 + 12) = v46;
        memcpy(v46, &v44[4 * v32], v41);
      }
      else
      {
        sub_1B63F2F54(16, @"Error: ies corrupted data", v35, v36, v37, v38, v39, v40, (uint64_t)v48.receiver);
      }
    }
    else
    {
      sub_1B63F2F54(16, @"Error: invalid IES data", v23, v24, v25, v26, v27, v28, (uint64_t)v48.receiver);
      return 0;
    }
  }
  return (VFXIESProfile *)v4;
}

- (const)_infoHangle
{
  return &self->_iesInfo;
}

- (NSString)identifier
{
  return self->_identifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

@end