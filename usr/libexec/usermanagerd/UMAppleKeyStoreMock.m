@interface UMAppleKeyStoreMock
- (BOOL)addPersonaWithUUID:(id)a3 toSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6;
- (BOOL)bootstrapVolumeWithMountPoint:(id)a3 user:(unsigned int)a4 error:(id *)a5;
- (BOOL)createIdentityWithUUID:(id)a3 passcode:(id)a4 existingSession:(unsigned int)a5 existingSessionPasscode:(id)a6 error:(id *)a7;
- (BOOL)deleteIdentity:(id)a3 error:(id *)a4;
- (BOOL)deletePersonaWithUUID:(id)a3 fromSession:(unsigned int)a4 error:(id *)a5;
- (BOOL)ignoreIdentityMethods;
- (BOOL)isIdentityLoadedIntoSession:(unsigned int)a3;
- (BOOL)loadIdentity:(id)a3 intoSession:(unsigned int)a4 error:(id *)a5;
- (BOOL)loginIdentity:(id)a3 intoSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6;
- (BOOL)mapVolume:(id)a3 toSession:(unsigned int)a4 withPersona:(id)a5 error:(id *)a6;
- (BOOL)unloadIdentityFromSession:(unsigned int)a3 error:(id *)a4;
- (BOOL)unlockIdentityInSession:(unsigned int)a3 passcode:(id)a4 error:(id *)a5;
- (BOOL)unmapVolume:(id)a3 error:(id *)a4;
- (UMAppleKeyStoreMock)init;
- (id)dataUnwrappingDataWithDeviceClassF:(id)a3 error:(id *)a4;
- (id)dataWrappingDataWithDeviceClassF:(id)a3 error:(id *)a4;
- (void)setIgnoreIdentityMethods:(BOOL)a3;
@end

@implementation UMAppleKeyStoreMock

- (UMAppleKeyStoreMock)init
{
  v13.receiver = self;
  v13.super_class = (Class)UMAppleKeyStoreMock;
  v2 = [(UMAppleKeyStoreMock *)&v13 init];
  if (!v2) {
    sub_1000B08C8();
  }
  v3 = v2;
  uint64_t v4 = +[NSMutableDictionary dictionary];
  bootstrappedVolumes = v3->_bootstrappedVolumes;
  v3->_bootstrappedVolumes = (NSMutableDictionary *)v4;

  uint64_t v6 = +[NSMutableDictionary dictionary];
  personas = v3->_personas;
  v3->_personas = (NSMutableDictionary *)v6;

  uint64_t v8 = +[NSMutableDictionary dictionary];
  mappedVolumes = v3->_mappedVolumes;
  v3->_mappedVolumes = (NSMutableDictionary *)v8;

  uint64_t v10 = +[NSMutableDictionary dictionary];
  mappedVolumePersonas = v3->_mappedVolumePersonas;
  v3->_mappedVolumePersonas = (NSMutableDictionary *)v10;

  return v3;
}

- (BOOL)bootstrapVolumeWithMountPoint:(id)a3 user:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (a5) {
    *a5 = 0;
  }
  if ([(UMAppleKeyStoreMock *)self ignoreIdentityMethods]) {
    goto LABEL_12;
  }
  if (!self || !self->_bootstrapVolumeErrorOverride)
  {
    v11 = +[NSNumber numberWithUnsignedInt:v6];
    if (self) {
      bootstrappedVolumes = self->_bootstrappedVolumes;
    }
    else {
      bootstrappedVolumes = 0;
    }
    [(NSMutableDictionary *)bootstrappedVolumes setObject:v11 forKeyedSubscript:v8];

LABEL_12:
    BOOL v10 = 1;
    goto LABEL_13;
  }
  if (a5)
  {
    v9 = self->_bootstrapVolumeErrorOverride;
    BOOL v10 = 0;
    *a5 = v9;
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_13:

  return v10;
}

- (id)dataWrappingDataWithDeviceClassF:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (self && self->_dataWrappingDataErrorOverride)
  {
    if (a4)
    {
      id v8 = self->_dataWrappingDataErrorOverride;
      v9 = 0;
      *a4 = v8;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }
    if (self && self->_dataWrappingDataReturnOverride)
    {
      BOOL v10 = self->_dataWrappingDataReturnOverride;
    }
    else
    {
      sub_100018370((uint64_t)v6);
      BOOL v10 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v10;
  }

  return v9;
}

- (id)dataUnwrappingDataWithDeviceClassF:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (self && self->_dataUnwrappingDataErrorOverride)
  {
    if (a4)
    {
      id v8 = self->_dataUnwrappingDataErrorOverride;
      v9 = 0;
      *a4 = v8;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    if (a4) {
      *a4 = 0;
    }
    if (self && self->_dataUnwrappingDataReturnOverride)
    {
      BOOL v10 = self->_dataUnwrappingDataReturnOverride;
    }
    else
    {
      sub_1000183E8(v6);
      BOOL v10 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v10;
  }

  return v9;
}

- (BOOL)createIdentityWithUUID:(id)a3 passcode:(id)a4 existingSession:(unsigned int)a5 existingSessionPasscode:(id)a6 error:(id *)a7
{
  if (a7) {
    *a7 = 0;
  }
  if (self)
  {
    createIdentityWithUUIDErrorOverride = self->_createIdentityWithUUIDErrorOverride;
    if (!a7) {
      return createIdentityWithUUIDErrorOverride == 0;
    }
  }
  else
  {
    createIdentityWithUUIDErrorOverride = 0;
    if (!a7) {
      return createIdentityWithUUIDErrorOverride == 0;
    }
  }
  if (createIdentityWithUUIDErrorOverride)
  {
    if (self) {
      self = self->_createIdentityWithUUIDErrorOverride;
    }
    *a7 = self;
  }
  return createIdentityWithUUIDErrorOverride == 0;
}

- (BOOL)deleteIdentity:(id)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  if (self)
  {
    deleteIdentityErrorOverride = self->_deleteIdentityErrorOverride;
    if (!a4) {
      return deleteIdentityErrorOverride == 0;
    }
  }
  else
  {
    deleteIdentityErrorOverride = 0;
    if (!a4) {
      return deleteIdentityErrorOverride == 0;
    }
  }
  if (deleteIdentityErrorOverride)
  {
    if (self) {
      self = self->_deleteIdentityErrorOverride;
    }
    *a4 = self;
  }
  return deleteIdentityErrorOverride == 0;
}

- (BOOL)isIdentityLoadedIntoSession:(unsigned int)a3
{
  if (self) {
    LOBYTE(self) = self->_isIdentityLoadedForSessionReturnOverride;
  }
  return (char)self;
}

- (BOOL)loadIdentity:(id)a3 intoSession:(unsigned int)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  if (self)
  {
    loadIdentityErrorOverride = self->_loadIdentityErrorOverride;
    if (!a5) {
      return loadIdentityErrorOverride == 0;
    }
  }
  else
  {
    loadIdentityErrorOverride = 0;
    if (!a5) {
      return loadIdentityErrorOverride == 0;
    }
  }
  if (loadIdentityErrorOverride)
  {
    if (self) {
      self = self->_loadIdentityErrorOverride;
    }
    *a5 = self;
  }
  return loadIdentityErrorOverride == 0;
}

- (BOOL)unloadIdentityFromSession:(unsigned int)a3 error:(id *)a4
{
  if (a4) {
    *a4 = 0;
  }
  if (self)
  {
    unloadIdentityErrorOverride = self->_unloadIdentityErrorOverride;
    if (!a4) {
      return unloadIdentityErrorOverride == 0;
    }
  }
  else
  {
    unloadIdentityErrorOverride = 0;
    if (!a4) {
      return unloadIdentityErrorOverride == 0;
    }
  }
  if (unloadIdentityErrorOverride)
  {
    if (self) {
      self = self->_unloadIdentityErrorOverride;
    }
    *a4 = self;
  }
  return unloadIdentityErrorOverride == 0;
}

- (BOOL)unlockIdentityInSession:(unsigned int)a3 passcode:(id)a4 error:(id *)a5
{
  if (a5) {
    *a5 = 0;
  }
  if (self)
  {
    unlockIdentityErrorOverride = self->_unlockIdentityErrorOverride;
    if (!a5) {
      return unlockIdentityErrorOverride == 0;
    }
  }
  else
  {
    unlockIdentityErrorOverride = 0;
    if (!a5) {
      return unlockIdentityErrorOverride == 0;
    }
  }
  if (unlockIdentityErrorOverride)
  {
    if (self) {
      self = self->_unlockIdentityErrorOverride;
    }
    *a5 = self;
  }
  return unlockIdentityErrorOverride == 0;
}

- (BOOL)loginIdentity:(id)a3 intoSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6
{
  if (a6) {
    *a6 = 0;
  }
  if (self)
  {
    loginIdentityErrorOverride = self->_loginIdentityErrorOverride;
    if (!a6) {
      return loginIdentityErrorOverride == 0;
    }
  }
  else
  {
    loginIdentityErrorOverride = 0;
    if (!a6) {
      return loginIdentityErrorOverride == 0;
    }
  }
  if (loginIdentityErrorOverride)
  {
    if (self) {
      self = self->_loginIdentityErrorOverride;
    }
    *a6 = self;
  }
  return loginIdentityErrorOverride == 0;
}

- (BOOL)addPersonaWithUUID:(id)a3 toSession:(unsigned int)a4 passcode:(id)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a3;
  if (a6) {
    *a6 = 0;
  }
  if (self)
  {
    addPersonaToSessionErrorOverride = self->_addPersonaToSessionErrorOverride;
    if (addPersonaToSessionErrorOverride)
    {
      if (a6) {
        *a6 = self->_addPersonaToSessionErrorOverride;
      }
      goto LABEL_15;
    }
  }
  else
  {
    addPersonaToSessionErrorOverride = 0;
  }
  if (self) {
    personas = self->_personas;
  }
  else {
    personas = 0;
  }
  v12 = personas;
  objc_super v13 = +[NSNumber numberWithUnsignedInt:v7];
  v14 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:v13];

  if (!v14)
  {
    v14 = +[NSMutableSet set];
  }
  [v14 addObject:v9];
  if (self) {
    v15 = self->_personas;
  }
  else {
    v15 = 0;
  }
  v16 = v15;
  v17 = +[NSNumber numberWithUnsignedInt:v7];
  [(NSMutableDictionary *)v16 setObject:v14 forKeyedSubscript:v17];

LABEL_15:
  return addPersonaToSessionErrorOverride == 0;
}

- (BOOL)deletePersonaWithUUID:(id)a3 fromSession:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  if (a5) {
    *a5 = 0;
  }
  if (self)
  {
    deletePersonaFromSessionErrorOverride = self->_deletePersonaFromSessionErrorOverride;
    if (deletePersonaFromSessionErrorOverride)
    {
      if (a5) {
        *a5 = self->_deletePersonaFromSessionErrorOverride;
      }
      goto LABEL_15;
    }
  }
  else
  {
    deletePersonaFromSessionErrorOverride = 0;
  }
  if (self) {
    personas = self->_personas;
  }
  else {
    personas = 0;
  }
  v11 = personas;
  v12 = +[NSNumber numberWithUnsignedInt:v6];
  objc_super v13 = [(NSMutableDictionary *)v11 objectForKeyedSubscript:v12];

  if (!v13)
  {
    objc_super v13 = +[NSMutableSet set];
  }
  [v13 removeObject:v8];
  if (self) {
    v14 = self->_personas;
  }
  else {
    v14 = 0;
  }
  v15 = v14;
  v16 = +[NSNumber numberWithUnsignedInt:v6];
  [(NSMutableDictionary *)v15 setObject:v13 forKeyedSubscript:v16];

LABEL_15:
  return deletePersonaFromSessionErrorOverride == 0;
}

- (BOOL)mapVolume:(id)a3 toSession:(unsigned int)a4 withPersona:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  if (a6) {
    *a6 = 0;
  }
  if ([(UMAppleKeyStoreMock *)self ignoreIdentityMethods]) {
    goto LABEL_4;
  }
  if (self && self->_mapVolumeErrorOverride)
  {
    if (a6)
    {
      objc_super v13 = self->_mapVolumeErrorOverride;
      BOOL v12 = 0;
      *a6 = v13;
      goto LABEL_23;
    }
LABEL_22:
    BOOL v12 = 0;
    goto LABEL_23;
  }
  if (v11)
  {
    if (self) {
      personas = self->_personas;
    }
    else {
      personas = 0;
    }
    v15 = personas;
    v16 = +[NSNumber numberWithUnsignedInt:v8];
    v17 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:v16];

    if (([v17 containsObject:v11] & 1) == 0)
    {
      if (a6)
      {
        *a6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:2 userInfo:0];
      }

      goto LABEL_22;
    }

    v18 = +[NSNumber numberWithUnsignedInt:v8];
    if (self)
    {
      [(NSMutableDictionary *)self->_mappedVolumes setObject:v18 forKeyedSubscript:v10];

      mappedVolumePersonas = self->_mappedVolumePersonas;
    }
    else
    {
      [0 setObject:v18 forKeyedSubscript:v10];

      mappedVolumePersonas = 0;
    }
    [(NSMutableDictionary *)mappedVolumePersonas setObject:v11 forKeyedSubscript:v10];
  }
  else
  {
    v20 = +[NSNumber numberWithUnsignedInt:v8];
    if (self) {
      mappedVolumes = self->_mappedVolumes;
    }
    else {
      mappedVolumes = 0;
    }
    [(NSMutableDictionary *)mappedVolumes setObject:v20 forKeyedSubscript:v10];
  }
LABEL_4:
  BOOL v12 = 1;
LABEL_23:

  return v12;
}

- (BOOL)unmapVolume:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (a4) {
    *a4 = 0;
  }
  if ([(UMAppleKeyStoreMock *)self ignoreIdentityMethods]) {
    goto LABEL_12;
  }
  if (!self || !self->_unmapVolumeErrorOverride)
  {
    if (self)
    {
      [(NSMutableDictionary *)self->_mappedVolumes setObject:0 forKeyedSubscript:v6];
      mappedVolumePersonas = self->_mappedVolumePersonas;
    }
    else
    {
      [0 setObject:0 forKeyedSubscript:v6];
      mappedVolumePersonas = 0;
    }
    [(NSMutableDictionary *)mappedVolumePersonas setObject:0 forKeyedSubscript:v6];
LABEL_12:
    BOOL v8 = 1;
    goto LABEL_13;
  }
  if (a4)
  {
    uint64_t v7 = self->_unmapVolumeErrorOverride;
    BOOL v8 = 0;
    *a4 = v7;
  }
  else
  {
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (BOOL)ignoreIdentityMethods
{
  return self->_ignoreIdentityMethods;
}

- (void)setIgnoreIdentityMethods:(BOOL)a3
{
  self->_ignoreIdentityMethods = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmapVolumeErrorOverride, 0);
  objc_storeStrong((id *)&self->_mapVolumeErrorOverride, 0);
  objc_storeStrong((id *)&self->_deletePersonaFromSessionErrorOverride, 0);
  objc_storeStrong((id *)&self->_addPersonaToSessionErrorOverride, 0);
  objc_storeStrong((id *)&self->_loginIdentityErrorOverride, 0);
  objc_storeStrong((id *)&self->_unlockIdentityErrorOverride, 0);
  objc_storeStrong((id *)&self->_unloadIdentityErrorOverride, 0);
  objc_storeStrong((id *)&self->_loadIdentityErrorOverride, 0);
  objc_storeStrong((id *)&self->_deleteIdentityErrorOverride, 0);
  objc_storeStrong((id *)&self->_createIdentityWithUUIDErrorOverride, 0);
  objc_storeStrong((id *)&self->_dataUnwrappingDataReturnOverride, 0);
  objc_storeStrong((id *)&self->_dataUnwrappingDataErrorOverride, 0);
  objc_storeStrong((id *)&self->_dataWrappingDataReturnOverride, 0);
  objc_storeStrong((id *)&self->_dataWrappingDataErrorOverride, 0);
  objc_storeStrong((id *)&self->_bootstrapVolumeErrorOverride, 0);
  objc_storeStrong((id *)&self->_mappedVolumePersonas, 0);
  objc_storeStrong((id *)&self->_mappedVolumes, 0);
  objc_storeStrong((id *)&self->_personas, 0);

  objc_storeStrong((id *)&self->_bootstrappedVolumes, 0);
}

@end