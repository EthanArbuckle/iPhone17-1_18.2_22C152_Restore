@interface RSAsset
+ (BOOL)supportsSecureCoding;
- (NSArray)mirrorPoints;
- (RSAsset)init;
- (RSAsset)initWithCoder:(id)a3;
- (RSFloorPlan)floorPlan;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RSAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawFloorPlan, 0);
  objc_storeStrong((id *)&self->_mirrorPoints, 0);

  objc_storeStrong((id *)&self->_floorPlan, 0);
}

- (NSArray)mirrorPoints
{
  return self->_mirrorPoints;
}

- (RSFloorPlan)floorPlan
{
  return self->_floorPlan;
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend_array(MEMORY[0x263EFF980], a2, v2);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v5 = self->_mirrorPoints;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v26, v32, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v5);
        }
        v12 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v26 + 1) + 8 * i), v7, v8, (void)v26);
        objc_msgSend_addObject_(v4, v13, (uint64_t)v12);
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v26, v32, 16);
    }
    while (v9);
  }

  v30[0] = @"floorPlan";
  floorPlan = self->_floorPlan;
  if (floorPlan)
  {
    v17 = objc_msgSend_dictionaryRepresentation(self->_floorPlan, v14, v15);
  }
  else
  {
    v17 = (void *)MEMORY[0x263EFFA78];
  }
  v31[0] = v17;
  v30[1] = @"rawFloorPlan";
  rawFloorPlan = self->_rawFloorPlan;
  if (rawFloorPlan)
  {
    v19 = objc_msgSend_dictionaryRepresentation(self->_rawFloorPlan, v14, v15);
  }
  else
  {
    v19 = (void *)MEMORY[0x263EFFA78];
  }
  v31[1] = v19;
  v30[2] = @"version";
  v20 = objc_msgSend_numberWithInteger_(NSNumber, v14, self->_version, (void)v26);
  v31[2] = v20;
  v30[3] = @"isCaptured";
  v22 = objc_msgSend_numberWithBool_(NSNumber, v21, self->_isCaptured);
  v30[4] = @"mirrorPoints";
  v31[3] = v22;
  v31[4] = v4;
  v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v31, v30, 5);

  if (rawFloorPlan) {
  if (floorPlan)
  }

  return v24;
}

- (RSAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)RSAsset;
  v5 = [(RSAsset *)&v25 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"floorPlan");
    floorPlan = v5->_floorPlan;
    v5->_floorPlan = (RSFloorPlan *)v8;

    uint64_t v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    v14 = objc_msgSend_setWithObjects_(v10, v13, v11, v12, 0);
    uint64_t v16 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v14, @"mirrorPoints");
    mirrorPoints = v5->_mirrorPoints;
    v5->_mirrorPoints = (NSArray *)v16;

    v5->_version = objc_msgSend_decodeIntegerForKey_(v4, v18, @"version");
    v5->_isCaptured = objc_msgSend_decodeBoolForKey_(v4, v19, @"isCaptured");
    uint64_t v20 = objc_opt_class();
    uint64_t v22 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v21, v20, @"rawFloorPlan");
    rawFloorPlan = v5->_rawFloorPlan;
    v5->_rawFloorPlan = (RSFloorPlan *)v22;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v4, (uint64_t)self->_floorPlan, @"floorPlan");
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)self->_mirrorPoints, @"mirrorPoints");
  objc_msgSend_encodeInteger_forKey_(v9, v6, self->_version, @"version");
  objc_msgSend_encodeBool_forKey_(v9, v7, self->_isCaptured, @"isCaptured");
  objc_msgSend_encodeObject_forKey_(v9, v8, (uint64_t)self->_rawFloorPlan, @"rawFloorPlan");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(RSAsset);
  uint64_t v7 = objc_msgSend_copy(self->_floorPlan, v5, v6);
  floorPlan = v4->_floorPlan;
  v4->_floorPlan = (RSFloorPlan *)v7;

  uint64_t v11 = objc_msgSend_copy(self->_mirrorPoints, v9, v10);
  mirrorPoints = v4->_mirrorPoints;
  v4->_mirrorPoints = (NSArray *)v11;

  v4->_isCaptured = self->_isCaptured;
  v4->_version = self->_version;
  uint64_t v15 = objc_msgSend_copy(self->_rawFloorPlan, v13, v14);
  rawFloorPlan = v4->_rawFloorPlan;
  v4->_rawFloorPlan = (RSFloorPlan *)v15;

  return v4;
}

- (RSAsset)init
{
  v12.receiver = self;
  v12.super_class = (Class)RSAsset;
  uint64_t v2 = [(RSAsset *)&v12 init];
  if (v2)
  {
    v3 = objc_alloc_init(RSFloorPlan);
    floorPlan = v2->_floorPlan;
    v2->_floorPlan = v3;

    uint64_t v7 = objc_msgSend_array(MEMORY[0x263EFF8C0], v5, v6);
    mirrorPoints = v2->_mirrorPoints;
    v2->_mirrorPoints = (NSArray *)v7;

    v2->_isCaptured = 0;
    v2->_version = 2;
    id v9 = objc_alloc_init(RSFloorPlan);
    rawFloorPlan = v2->_rawFloorPlan;
    v2->_rawFloorPlan = v9;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end