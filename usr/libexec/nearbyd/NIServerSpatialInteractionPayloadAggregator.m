@interface NIServerSpatialInteractionPayloadAggregator
+ (id)sharedInstance;
- (BOOL)findingEnabled;
- (BOOL)presenceConfigEnabled;
- (NSData)aggregatedPresenceData;
- (NSData)aggregatedUWBData;
- (id)_initInternal;
- (unsigned)findingConfig;
- (unsigned)findingConfig2;
- (unsigned)findingStatus;
- (unsigned)handOrFaceDetection;
- (unsigned)regionPresenceDetection;
- (void)addPayloadChangeObserver:(id)a3;
- (void)commitChange;
- (void)removePayloadChangeObserver:(id)a3;
- (void)setFindingConfig2:(unsigned __int8)a3;
- (void)setFindingConfig:(unsigned __int8)a3;
- (void)setFindingEnabled:(BOOL)a3;
- (void)setFindingStatus:(unsigned __int8)a3;
- (void)setHandOrFaceDetection:(unsigned __int8)a3;
- (void)setPresenceConfigEnabled:(BOOL)a3;
- (void)setRegionPresenceDetection:(unsigned __int8)a3;
@end

@implementation NIServerSpatialInteractionPayloadAggregator

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023DECC;
  block[3] = &unk_1008466D8;
  block[4] = a1;
  if (qword_1008A57A0 != -1) {
    dispatch_once(&qword_1008A57A0, block);
  }
  v2 = (void *)qword_1008A5798;

  return v2;
}

- (id)_initInternal
{
  v12.receiver = self;
  v12.super_class = (Class)NIServerSpatialInteractionPayloadAggregator;
  v2 = [(NIServerSpatialInteractionPayloadAggregator *)&v12 init];
  v3 = v2;
  if (v2)
  {
    *(_DWORD *)(v2 + 15) = 0;
    *((void *)v2 + 1) = 0;
    char v11 = 0;
    uint64_t v4 = +[NSData dataWithBytes:&v11 length:1];
    v5 = (void *)v3[3];
    v3[3] = v4;

    uint64_t v6 = +[NSData dataWithBytes:&v11 length:1];
    v7 = (void *)v3[4];
    v3[4] = v6;

    uint64_t v8 = +[NSHashTable weakObjectsHashTable];
    v9 = (void *)v3[5];
    v3[5] = v8;
  }
  return v3;
}

- (void)commitChange
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_findingEnabled)
  {
    char v44 = 0;
    v42[0] = 1;
    v42[1] = self->_findingStatus;
    __int16 v43 = *(_WORD *)&self->_findingConfig;
    uint64_t v4 = +[NSData dataWithBytes:v42 length:5];
    unsigned int v5 = [(NSData *)self->_aggregatedUWBData isEqualToData:v4];
    uint64_t v6 = qword_1008ABDE0;
    BOOL v7 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v7) {
        sub_100424D7C(v6, v8, v9, v10, v11, v12, v13, v14);
      }

      goto LABEL_21;
    }
    if (v7)
    {
      aggregatedUWBData = self->_aggregatedUWBData;
      BOOL findingEnabled = self->_findingEnabled;
      int findingStatus = self->_findingStatus;
      int findingConfig = self->_findingConfig;
      *(_DWORD *)buf = 138413058;
      v47 = aggregatedUWBData;
      __int16 v48 = 1024;
      BOOL v49 = findingEnabled;
      __int16 v50 = 1024;
      int v51 = findingStatus;
      __int16 v52 = 1024;
      int v53 = findingConfig;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#type19,Commit change (non-empty uwb payload). Notify payload change with Aggregated uwb data: %@. Flag FE: %d. FS: %d. FC: %d", buf, 0x1Eu);
    }
    v26 = self->_aggregatedUWBData;
    self->_aggregatedUWBData = v4;

    goto LABEL_13;
  }
  v15 = self->_aggregatedUWBData;
  v16 = qword_1008ABDE0;
  BOOL v17 = os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEBUG);
  if (v15)
  {
    if (v17) {
      sub_100424D44(v16, v18, v19, v20, v21, v22, v23, v24);
    }
    v25 = self->_aggregatedUWBData;
    self->_aggregatedUWBData = 0;

LABEL_13:
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v27 = self->_payloadChangeObservers;
    id v28 = [(NSHashTable *)v27 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v39;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v39 != v29) {
            objc_enumerationMutation(v27);
          }
          v31 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          v32 = [v31 payloadChangeObserverQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10023E2D0;
          block[3] = &unk_1008473B0;
          block[4] = v31;
          dispatch_async(v32, block);
        }
        id v28 = [(NSHashTable *)v27 countByEnumeratingWithState:&v38 objects:v45 count:16];
      }
      while (v28);
    }

    goto LABEL_21;
  }
  if (v17) {
    sub_100424D0C(v16, v18, v19, v20, v21, v22, v23, v24);
  }
LABEL_21:
  os_unfair_lock_unlock(p_lock);
}

- (NSData)aggregatedUWBData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_aggregatedUWBData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSData)aggregatedPresenceData
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = self->_aggregatedPresenceData;
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (BOOL)findingEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_findingEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (unsigned)findingStatus
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_findingStatus;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (unsigned)findingConfig
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_findingConfig;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (unsigned)findingConfig2
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_findingConfig2;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (unsigned)regionPresenceDetection
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_regionPresenceDetection;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (unsigned)handOrFaceDetection
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_handOrFaceDetection;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void)setFindingEnabled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_BOOL findingEnabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setPresenceConfigEnabled:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_presenceConfigEnabled = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setFindingStatus:(unsigned __int8)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_int findingStatus = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setFindingConfig2:(unsigned __int8)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_findingConfig2 = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setFindingConfig:(unsigned __int8)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_int findingConfig = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setRegionPresenceDetection:(unsigned __int8)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_regionPresenceDetection = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)setHandOrFaceDetection:(unsigned __int8)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_handOrFaceDetection = a3;

  os_unfair_lock_unlock(p_lock);
}

- (void)addPayloadChangeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_payloadChangeObservers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)removePayloadChangeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_payloadChangeObservers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)presenceConfigEnabled
{
  return self->_presenceConfigEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadChangeObservers, 0);
  objc_storeStrong((id *)&self->_aggregatedPresenceData, 0);

  objc_storeStrong((id *)&self->_aggregatedUWBData, 0);
}

@end