@interface FCCKZoneSchema
+ (id)defaultZoneWithStaticRecordNames:(int)a3 shouldUseSecureContainer:;
+ (id)zoneWithName:(char)a3 options:(void *)a4 staticRecordNames:;
+ (id)zoneWithName:(uint64_t)a1;
- (BOOL)isEqual:(id)a3;
- (FCCKZoneSchema)init;
- (id)initWithZoneName:(char)a3 options:(void *)a4 staticRecordNames:;
- (unint64_t)hash;
@end

@implementation FCCKZoneSchema

+ (id)zoneWithName:(char)a3 options:(void *)a4 staticRecordNames:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a4;
  self;
  if ([v6 isEqualToString:*MEMORY[0x1E4F19D88]]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)[[NSString alloc] initWithFormat:@"use defaultZoneWithRecords: for the default zone"];
    int v11 = 136315906;
    v12 = "+[FCCKZoneSchema zoneWithName:options:staticRecordNames:]";
    __int16 v13 = 2080;
    v14 = "FCCKZoneSchema.m";
    __int16 v15 = 1024;
    int v16 = 27;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v11, 0x26u);
  }
  v8 = -[FCCKZoneSchema initWithZoneName:options:staticRecordNames:]((id *)[FCCKZoneSchema alloc], v6, a3, v7);

  return v8;
}

- (id)initWithZoneName:(char)a3 options:(void *)a4 staticRecordNames:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a4;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)FCCKZoneSchema;
    a1 = (id *)objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      if ((a3 & 6) == 4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v16 = (void *)[[NSString alloc] initWithFormat:@"zone-wide PCS is required for the secure container"];
        *(_DWORD *)buf = 136315906;
        uint64_t v19 = "-[FCCKZoneSchema initWithZoneName:options:staticRecordNames:]";
        __int16 v20 = 2080;
        v21 = "FCCKZoneSchema.m";
        __int16 v22 = 1024;
        int v23 = 53;
        __int16 v24 = 2114;
        v25 = v16;
        _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
      }
      objc_storeStrong(a1 + 2, a2);
      id v10 = objc_alloc(MEMORY[0x1E4F1A320]);
      uint64_t v11 = [v10 initWithZoneName:v8 ownerName:*MEMORY[0x1E4F19C08]];
      id v12 = a1[3];
      a1[3] = (id)v11;

      uint64_t v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
      id v14 = a1[4];
      a1[4] = (id)v13;

      *((unsigned char *)a1 + 8) = a3 & 1;
      *((unsigned char *)a1 + 9) = (a3 & 2) != 0;
      *((unsigned char *)a1 + 10) = (a3 & 4) != 0;
    }
  }

  return a1;
}

+ (id)zoneWithName:(uint64_t)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  if ([v2 isEqualToString:*MEMORY[0x1E4F19D88]]
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)[[NSString alloc] initWithFormat:@"use defaultZoneWithRecords: for the default zone"];
    int v6 = 136315906;
    id v7 = "+[FCCKZoneSchema zoneWithName:]";
    __int16 v8 = 2080;
    id v9 = "FCCKZoneSchema.m";
    __int16 v10 = 1024;
    int v11 = 16;
    __int16 v12 = 2114;
    uint64_t v13 = v5;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v6, 0x26u);
  }
  v3 = -[FCCKZoneSchema initWithZoneName:options:staticRecordNames:]((id *)[FCCKZoneSchema alloc], v2, 0, 0);

  return v3;
}

+ (id)defaultZoneWithStaticRecordNames:(int)a3 shouldUseSecureContainer:
{
  id v4 = a2;
  self;
  v5 = [FCCKZoneSchema alloc];
  if (a3) {
    char v6 = 6;
  }
  else {
    char v6 = 0;
  }
  id v7 = -[FCCKZoneSchema initWithZoneName:options:staticRecordNames:]((id *)&v5->super.isa, (void *)*MEMORY[0x1E4F19D88], v6, v4);

  return v7;
}

- (FCCKZoneSchema)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    __int16 v8 = "-[FCCKZoneSchema init]";
    __int16 v9 = 2080;
    __int16 v10 = "FCCKZoneSchema.m";
    __int16 v11 = 1024;
    int v12 = 44;
    __int16 v13 = 2114;
    uint64_t v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCCKZoneSchema init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  if (!v6)
  {
    char v12 = 0;
    goto LABEL_16;
  }
  id v7 = v6;
  __int16 v8 = v7;
  if (self) {
    zoneName = self->_zoneName;
  }
  else {
    zoneName = 0;
  }
  uint64_t v10 = *((void *)v7 + 2);
  __int16 v11 = zoneName;
  if (![(NSString *)v11 isEqualToString:v10]) {
    goto LABEL_13;
  }
  if (self)
  {
    if (self->_shouldEncryptRecordNames != (v8[8] != 0) || self->_shouldUseZoneWidePCS != (v8[9] != 0)) {
      goto LABEL_13;
    }
    char shouldUseSecureContainer = self->_shouldUseSecureContainer;
LABEL_18:
    char v12 = shouldUseSecureContainer ^ (v8[10] == 0);
    goto LABEL_14;
  }
  char shouldUseSecureContainer = v8[8];
  if (!shouldUseSecureContainer)
  {
    char v12 = 0;
    if (v8[9]) {
      goto LABEL_14;
    }
    goto LABEL_18;
  }
LABEL_13:
  char v12 = 0;
LABEL_14:

LABEL_16:
  return v12;
}

- (unint64_t)hash
{
  id v2 = self;
  if (self) {
    self = (FCCKZoneSchema *)self->_zoneName;
  }
  unint64_t v3 = [(FCCKZoneSchema *)self hash];
  if (v2) {
    BOOL shouldEncryptRecordNames = v2->_shouldEncryptRecordNames;
  }
  else {
    BOOL shouldEncryptRecordNames = 0;
  }
  v5 = [NSNumber numberWithBool:shouldEncryptRecordNames];
  uint64_t v6 = [v5 hash];
  if (v2) {
    BOOL shouldUseZoneWidePCS = v2->_shouldUseZoneWidePCS;
  }
  else {
    BOOL shouldUseZoneWidePCS = 0;
  }
  __int16 v8 = [NSNumber numberWithBool:shouldUseZoneWidePCS];
  uint64_t v9 = [v8 hash];
  if (v2) {
    BOOL shouldUseSecureContainer = v2->_shouldUseSecureContainer;
  }
  else {
    BOOL shouldUseSecureContainer = 0;
  }
  __int16 v11 = [NSNumber numberWithBool:shouldUseSecureContainer];
  unint64_t v12 = v6 ^ v3 ^ v9 ^ [v11 hash];

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticRecordNames, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end