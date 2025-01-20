@interface NINearbyObject
+ (BOOL)supportsSecureCoding;
+ (NINearbyObject)new;
+ (id)fauxObjectWithDiscoveryToken:(id)a3 name:(id)a4 deviceIdentifier:(id)a5;
+ (id)objectFromBluetoothDevice:(id)a3;
- (BOOL)canInteract;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresBiasCorrection;
- (BOOL)resetARSession;
- (BOOL)revokeFindingExperience;
- (NIDiscoveryToken)discoveryToken;
- (NINearbyObject)init;
- (NINearbyObject)initWithCoder:(id)a3;
- (NINearbyObject)initWithNearbyObject:(id)a3;
- (NINearbyObject)initWithToken:(id)a3;
- (NINearbyObjectVerticalDirectionEstimate)verticalDirectionEstimate;
- (NSData)bluetoothAdvertisingAddress;
- (NSNumber)spatialScore;
- (NSString)debugDisplayInfo;
- (NSString)deviceIdentifier;
- (NSString)name;
- (NSUUID)bluetoothPeerIdentifier;
- (UWBSignalFeatures)uwbSignalFeatures;
- (__n128)quaternion;
- (__n128)setQuaternion:(__n128 *)result;
- (__n128)worldPosition;
- (double)nbRssi;
- (double)rangeBiasEstimate;
- (double)rangeUncertainty;
- (double)signalStrength;
- (double)timestamp;
- (float)azimuth;
- (float)boundedRegionRange;
- (float)distance;
- (float)elevation;
- (float)horizontalAngle;
- (float)horizontalAngleAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (id)deviceIdentifer;
- (int64_t)algorithmSource;
- (int64_t)distanceMeasurementQuality;
- (int64_t)motionState;
- (simd_float3)direction;
- (unint64_t)hash;
- (unint64_t)relationship;
- (unsigned)mmsRxStatus;
- (unsigned)nbRxStatus;
- (unsigned)remoteTxAntennaMask;
- (void)encodeWithCoder:(id)a3;
- (void)overrideDirection:(NINearbyObject *)self;
- (void)overrideDistance:(float)a3;
- (void)overrideDistanceMeasurementQuality:(int64_t)a3;
- (void)overrideMotionState:(int64_t)a3;
- (void)overrideRelationship:(unint64_t)a3;
- (void)overrideSpatialScore:(id)a3;
- (void)overrideTimestamp:(float)a3;
- (void)setAlgorithmSource:(int64_t)a3;
- (void)setAzimuth:(float)a3;
- (void)setBluetoothAdvertisingAddress:(id)a3;
- (void)setBluetoothPeerIdentifier:(id)a3;
- (void)setBoundedRegionRange:(float)a3;
- (void)setCanInteract:(BOOL)a3;
- (void)setDebugDisplayInfo:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDirection:(NINearbyObject *)self;
- (void)setDiscoveryToken:(id)a3;
- (void)setDistance:(float)a3;
- (void)setDistanceMeasurementQuality:(int64_t)a3;
- (void)setElevation:(float)a3;
- (void)setHorizontalAngle:(float)a3;
- (void)setHorizontalAngleAccuracy:(float)a3;
- (void)setMmsRxStatus:(unsigned __int8)a3;
- (void)setMotionState:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setNbRssi:(double)a3;
- (void)setNbRxStatus:(unsigned __int8)a3;
- (void)setRangeBiasEstimate:(double)a3;
- (void)setRangeUncertainty:(double)a3;
- (void)setRelationship:(unint64_t)a3;
- (void)setRemoteTxAntennaMask:(unsigned __int8)a3;
- (void)setRequiresBiasCorrection:(BOOL)a3;
- (void)setResetARSession:(BOOL)a3;
- (void)setRevokeFindingExperience:(BOOL)a3;
- (void)setSignalStrength:(double)a3;
- (void)setSpatialScore:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setUwbSignalFeatures:(id)a3;
- (void)setVerticalDirectionEstimate:(int64_t)a3;
- (void)setWorldPosition:(NINearbyObject *)self;
@end

@implementation NINearbyObject

- (NINearbyObject)initWithToken:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, self, @"NINearbyObject.mm", 105, @"Invalid parameter not satisfying: %@", @"token" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)NINearbyObject;
  v7 = [(NINearbyObject *)&v25 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_discoveryToken, a3);
    v8->_distance = NINearbyObjectDistanceNotAvailable;
    simd_float3 v9 = NINearbyObjectDirectionNotAvailable;
    v8->_distanceMeasurementQuality = 0;
    int v10 = NINearbyObjectElevationNotAvailable;
    LODWORD(v8->_azimuth) = NINearbyObjectAzimuthNotAvailable;
    LODWORD(v8->_elevation) = v10;
    long long v11 = NINearbyObjectQuaternionNotAvailable;
    *(simd_float3 *)v8->_direction = v9;
    *(_OWORD *)v8->_anon_d0 = v11;
    *(void *)&v8->_timestamp = qword_1008AC4E0;
    deviceIdentifier = v8->_deviceIdentifier;
    v8->_relationship = 4;
    v8->_deviceIdentifier = 0;

    name = v8->_name;
    v8->_motionState = 0;
    v8->_name = 0;
    v8->_verticalDirectionEstimate = 0;
    float v14 = NINearbyObjectAngleNotAvailable;
    v8->_horizontalAngle = NINearbyObjectAngleNotAvailable;
    v8->_horizontalAngleAccuracy = v14;

    spatialScore = v8->_spatialScore;
    v8->_spatialScore = 0;

    bluetoothAdvertisingAddress = v8->_bluetoothAdvertisingAddress;
    v8->_bluetoothAdvertisingAddress = 0;

    bluetoothPeerIdentifier = v8->_bluetoothPeerIdentifier;
    v8->_bluetoothPeerIdentifier = 0;

    uint64_t v18 = NINearbyObjectSignalStrengthNotAvailable;
    v8->_remoteTxAntennaMask = NINearbyObjectRemoteTxAntennaMaskNotAvailable;
    uint64_t v19 = NINearbyObjectRangeBiasEstimateNotAvailable;
    *(void *)&v8->_signalStrength = v18;
    *(void *)&v8->_rangeBiasEstimate = v19;
    *(void *)&v8->_rangeUncertainty = NINearbyObjectRangeUncertaintyNotAvailable;
    *(_OWORD *)v8->_worldPosition = NINearbyObjectWorldPositionNotAvailable;
    v8->_requiresBiasCorrection = byte_1008AC4E9;
    uwbSignalFeatures = v8->_uwbSignalFeatures;
    v8->_uwbSignalFeatures = 0;

    char v21 = NINearbyObjectRxStatusNotAvailable;
    v8->_nbRxStatus = NINearbyObjectRxStatusNotAvailable;
    v8->_mmsRxStatus = v21;
    *(void *)&v8->_nbRssi = NINearbyObjectNbRssiNotAvailable;
    *(_WORD *)&v8->_canInteract = 1;
    v8->_revokeFindingExperience = 0;
    LODWORD(v8->_boundedRegionRange) = NINearbyObjectRegionBoundaryRangeNotAvailable;
    debugDisplayInfo = v8->_debugDisplayInfo;
    v8->_algorithmSource = 1;
    v8->_debugDisplayInfo = 0;
  }
  return v8;
}

- (NINearbyObject)initWithNearbyObject:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v38 = +[NSAssertionHandler currentHandler];
    [v38 handleFailureInMethod:a2, self, @"NINearbyObject.mm", 151, @"Invalid parameter not satisfying: %@", @"object" object file lineNumber description];
  }
  v39.receiver = self;
  v39.super_class = (Class)NINearbyObject;
  id v6 = [(NINearbyObject *)&v39 init];
  if (v6)
  {
    uint64_t v7 = [v5 discoveryToken];
    discoveryToken = v6->_discoveryToken;
    v6->_discoveryToken = (NIDiscoveryToken *)v7;

    [v5 distance];
    v6->_distance = v9;
    [v5 direction];
    *(_OWORD *)v6->_direction = v10;
    v6->_distanceMeasurementQuality = (int64_t)[v5 distanceMeasurementQuality];
    [v5 azimuth];
    v6->_azimuth = v11;
    [v5 elevation];
    v6->_elevation = v12;
    [v5 quaternion];
    *(_OWORD *)v6->_anon_d0 = v13;
    v6->_relationship = (unint64_t)[v5 relationship];
    uint64_t v14 = [v5 deviceIdentifier];
    deviceIdentifier = v6->_deviceIdentifier;
    v6->_deviceIdentifier = (NSString *)v14;

    [v5 timestamp];
    v6->_timestamp = v16;
    v6->_motionState = (int64_t)[v5 motionState];
    uint64_t v17 = [v5 name];
    name = v6->_name;
    v6->_name = (NSString *)v17;

    v6->_verticalDirectionEstimate = (int64_t)[v5 verticalDirectionEstimate];
    [v5 horizontalAngle];
    v6->_horizontalAngle = v19;
    [v5 horizontalAngleAccuracy];
    v6->_horizontalAngleAccuracy = v20;
    uint64_t v21 = [v5 spatialScore];
    spatialScore = v6->_spatialScore;
    v6->_spatialScore = (NSNumber *)v21;

    uint64_t v23 = [v5 bluetoothAdvertisingAddress];
    bluetoothAdvertisingAddress = v6->_bluetoothAdvertisingAddress;
    v6->_bluetoothAdvertisingAddress = (NSData *)v23;

    uint64_t v25 = [v5 bluetoothPeerIdentifier];
    bluetoothPeerIdentifier = v6->_bluetoothPeerIdentifier;
    v6->_bluetoothPeerIdentifier = (NSUUID *)v25;

    [v5 signalStrength];
    v6->_signalStrength = v27;
    v6->_remoteTxAntennaMask = [v5 remoteTxAntennaMask];
    [v5 rangeBiasEstimate];
    v6->_rangeBiasEstimate = v28;
    [v5 rangeUncertainty];
    v6->_rangeUncertainty = v29;
    [v5 worldPosition];
    *(_OWORD *)v6->_worldPosition = v30;
    v6->_requiresBiasCorrection = [v5 requiresBiasCorrection];
    uint64_t v31 = [v5 uwbSignalFeatures];
    uwbSignalFeatures = v6->_uwbSignalFeatures;
    v6->_uwbSignalFeatures = (UWBSignalFeatures *)v31;

    v6->_nbRxStatus = [v5 nbRxStatus];
    v6->_mmsRxStatus = [v5 mmsRxStatus];
    [v5 nbRssi];
    v6->_nbRssi = v33;
    v6->_canInteract = [v5 canInteract];
    v6->_resetARSession = [v5 resetARSession];
    v6->_revokeFindingExperience = [v5 revokeFindingExperience];
    [v5 boundedRegionRange];
    v6->_boundedRegionRange = v34;
    v6->_algorithmSource = (int64_t)[v5 algorithmSource];
    uint64_t v35 = [v5 debugDisplayInfo];
    debugDisplayInfo = v6->_debugDisplayInfo;
    v6->_debugDisplayInfo = (NSString *)v35;
  }
  return v6;
}

- (NINearbyObject)init
{
}

+ (NINearbyObject)new
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];

  return _[v4 initWithNearbyObject:self];
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  [v10 encodeObject:self->_discoveryToken forKey:@"discoveryToken"];
  *(float *)&double v4 = self->_distance;
  [v10 encodeFloat:@"distance" forKey:v4];
  [v10 encodeVector3:@"direction" forKey:*(double *)self->_direction];
  *(float *)&double v5 = self->_azimuth;
  [v10 encodeFloat:@"azimuth" forKey:v5];
  *(float *)&double v6 = self->_elevation;
  [v10 encodeFloat:@"elevation" forKey:v6];
  [v10 encodeQuat:@"quaternion" forKey:*(double *)self->_anon_d0];
  [v10 encodeInteger:self->_relationship forKey:@"relationship"];
  [v10 encodeObject:self->_deviceIdentifier forKey:@"deviceIdentifier"];
  [v10 encodeDouble:@"timestamp" forKey:self->_timestamp];
  [v10 encodeInteger:self->_distanceMeasurementQuality forKey:@"measurementQuality"];
  [v10 encodeInteger:self->_motionState forKey:@"motionState"];
  [v10 encodeObject:self->_name forKey:@"name"];
  [v10 encodeInteger:self->_verticalDirectionEstimate forKey:@"verticalDirectionEstimate"];
  *(float *)&double v7 = self->_horizontalAngle;
  [v10 encodeFloat:@"horizontalAngle" forKey:v7];
  *(float *)&double v8 = self->_horizontalAngleAccuracy;
  [v10 encodeFloat:@"horizontalAngleAccuracy" forKey:v8];
  [v10 encodeObject:self->_spatialScore forKey:@"spatialScore"];
  [v10 encodeObject:self->_bluetoothAdvertisingAddress forKey:@"bluetoothAdvertisingAddress"];
  [v10 encodeObject:self->_bluetoothPeerIdentifier forKey:@"bluetoothPeerIdentifier"];
  [v10 encodeDouble:@"signalStrength" forKey:self->_signalStrength];
  [v10 encodeInteger:self->_remoteTxAntennaMask forKey:@"remoteTxAntennaMask"];
  [v10 encodeDouble:@"rangeBiasEstimate" forKey:self->_rangeBiasEstimate];
  [v10 encodeDouble:@"rangeUncertainty" forKey:self->_rangeUncertainty];
  [v10 encodeVector3:@"worldPosition" forKey:*(double *)self->_worldPosition];
  [v10 encodeBool:self->_requiresBiasCorrection forKey:@"requiresBiasCorrection"];
  [v10 encodeObject:self->_uwbSignalFeatures forKey:@"uwbSignalFeatures"];
  [v10 encodeInteger:self->_nbRxStatus forKey:@"nbRxStatus"];
  [v10 encodeInteger:self->_mmsRxStatus forKey:@"mmsRxStatus"];
  [v10 encodeDouble:@"nbRssi" forKey:self->_nbRssi];
  [v10 encodeBool:self->_canInteract forKey:@"canInteract"];
  [v10 encodeBool:self->_resetARSession forKey:@"resetARSession"];
  [v10 encodeBool:self->_revokeFindingExperience forKey:@"revokeFindingExperience"];
  *(float *)&double v9 = self->_boundedRegionRange;
  [v10 encodeFloat:@"boundedRegionRange" forKey:v9];
  [v10 encodeInteger:self->_algorithmSource forKey:@"algorithmSource"];
  [v10 encodeObject:self->_debugDisplayInfo forKey:@"debugDisplayInfo"];
}

- (NINearbyObject)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"discoveryToken"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v4 decodeFloatForKey:@"distance"];
    float v52 = v6;
    [v4 decodeVector3ForKey:@"direction"];
    long long v51 = v7;
    [v4 decodeFloatForKey:@"azimuth"];
    float v50 = v8;
    [v4 decodeFloatForKey:@"elevation"];
    float v49 = v9;
    [v4 decodeQuatForKey:@"quaternion"];
    long long v48 = v10;
    id v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceIdentifier"];
    id v11 = [v4 decodeIntegerForKey:@"relationship"];
    [v4 decodeDoubleForKey:@"timestamp"];
    double v13 = v12;
    id v14 = [v4 decodeIntegerForKey:@"measurementQuality"];
    id v15 = [v4 decodeIntegerForKey:@"motionState"];
    double v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"spatialScore"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bluetoothAdvertisingAddress"];
    v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bluetoothPeerIdentifier"];
    id v18 = [v4 decodeIntegerForKey:@"verticalDirectionEstimate"];
    [v4 decodeFloatForKey:@"horizontalAngle"];
    float v20 = v19;
    [v4 decodeFloatForKey:@"horizontalAngleAccuracy"];
    float v22 = v21;
    [v4 decodeDoubleForKey:@"signalStrength"];
    double v24 = v23;
    unsigned __int8 v47 = [v4 decodeIntForKey:@"remoteTxAntennaMask"];
    [v4 decodeDoubleForKey:@"rangeBiasEstimate"];
    double v26 = v25;
    [v4 decodeDoubleForKey:@"rangeUncertainty"];
    double v28 = v27;
    [v4 decodeVector3ForKey:@"worldPosition"];
    long long v46 = v29;
    unsigned __int8 v45 = [v4 decodeBoolForKey:@"requiresBiasCorrection"];
    v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uwbSignalFeatures"];
    unsigned __int8 v44 = [v4 decodeIntForKey:@"nbRxStatus"];
    unsigned __int8 v43 = [v4 decodeIntForKey:@"mmsRxStatus"];
    [v4 decodeDoubleForKey:@"nbRssi"];
    double v31 = v30;
    unsigned __int8 v42 = [v4 decodeBoolForKey:@"canInteract"];
    unsigned __int8 v41 = [v4 decodeBoolForKey:@"resetARSession"];
    unsigned __int8 v40 = [v4 decodeBoolForKey:@"revokeFindingExperience"];
    [v4 decodeFloatForKey:@"boundedRegionRange"];
    float v33 = v32;
    id v39 = [v4 decodeIntegerForKey:@"algorithmSource"];
    float v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"debugDisplayInfo"];
    v57.receiver = self;
    v57.super_class = (Class)NINearbyObject;
    uint64_t v35 = [(NINearbyObject *)&v57 init];
    v36 = v35;
    if (v35)
    {
      objc_storeStrong((id *)&v35->_discoveryToken, v5);
      v36->_distance = v52;
      v36->_azimuth = v50;
      v36->_elevation = v49;
      *(_OWORD *)v36->_direction = v51;
      *(_OWORD *)v36->_anon_d0 = v48;
      v36->_relationship = (unint64_t)v11;
      objc_storeStrong((id *)&v36->_deviceIdentifier, v56);
      v36->_timestamp = v13;
      v36->_distanceMeasurementQuality = (int64_t)v14;
      v36->_motionState = (int64_t)v15;
      objc_storeStrong((id *)&v36->_name, v16);
      v36->_verticalDirectionEstimate = (int64_t)v18;
      v36->_horizontalAngle = v20;
      v36->_horizontalAngleAccuracy = v22;
      objc_storeStrong((id *)&v36->_spatialScore, v55);
      objc_storeStrong((id *)&v36->_bluetoothAdvertisingAddress, v17);
      objc_storeStrong((id *)&v36->_bluetoothPeerIdentifier, v54);
      v36->_remoteTxAntennaMask = v47;
      v36->_signalStrength = v24;
      v36->_rangeBiasEstimate = v26;
      v36->_rangeUncertainty = v28;
      *(_OWORD *)v36->_worldPosition = v46;
      v36->_requiresBiasCorrection = v45;
      objc_storeStrong((id *)&v36->_uwbSignalFeatures, v53);
      v36->_nbRxStatus = v44;
      v36->_mmsRxStatus = v43;
      v36->_nbRssi = v31;
      v36->_canInteract = v42;
      v36->_resetARSession = v41;
      v36->_revokeFindingExperience = v40;
      v36->_boundedRegionRange = v33;
      v36->_algorithmSource = (int64_t)v39;
      objc_storeStrong((id *)&v36->_debugDisplayInfo, v34);
    }
    self = v36;

    v37 = self;
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = (NINearbyObject *)v4;
    float v6 = v5;
    if (v5 == self)
    {
      char v77 = 1;
LABEL_60:

      goto LABEL_61;
    }
    discoveryToken = self->_discoveryToken;
    id v118 = v4;
    if (!discoveryToken)
    {
      float v8 = [(NINearbyObject *)v5 discoveryToken];

      if (!v8)
      {
        unsigned __int8 v10 = 1;
LABEL_7:
        deviceIdentifier = self->_deviceIdentifier;
        if (!deviceIdentifier)
        {
          double v12 = [(NINearbyObject *)v6 deviceIdentifier];

          if (!v12)
          {
            unsigned __int8 v14 = 1;
LABEL_11:
            float distance = self->_distance;
            [(NINearbyObject *)v6 distance];
            float v17 = v16;
            float32x4_t v117 = *(float32x4_t *)self->_direction;
            [(NINearbyObject *)v6 direction];
            float32x4_t v116 = v18;
            int64_t distanceMeasurementQuality = self->_distanceMeasurementQuality;
            id v20 = [(NINearbyObject *)v6 distanceMeasurementQuality];
            unint64_t relationship = self->_relationship;
            id v22 = [(NINearbyObject *)v6 relationship];
            double timestamp = self->_timestamp;
            [(NINearbyObject *)v6 timestamp];
            double v25 = v24;
            int64_t motionState = self->_motionState;
            id v115 = [(NINearbyObject *)v6 motionState];
            double signalStrength = self->_signalStrength;
            [(NINearbyObject *)v6 signalStrength];
            double v29 = v28;
            int remoteTxAntennaMask = self->_remoteTxAntennaMask;
            unsigned int v113 = [(NINearbyObject *)v6 remoteTxAntennaMask];
            double rangeBiasEstimate = self->_rangeBiasEstimate;
            [(NINearbyObject *)v6 rangeBiasEstimate];
            double v32 = v31;
            id v110 = (id)motionState;
            id v111 = v22;
            unint64_t v112 = relationship;
            double rangeUncertainty = self->_rangeUncertainty;
            [(NINearbyObject *)v6 rangeUncertainty];
            double v108 = v33;
            name = self->_name;
            if (!name)
            {
              uint64_t v35 = [(NINearbyObject *)v6 name];

              if (!v35)
              {
                unsigned __int8 v37 = 1;
LABEL_15:
                int64_t verticalDirectionEstimate = self->_verticalDirectionEstimate;
                NINearbyObjectVerticalDirectionEstimate v39 = [(NINearbyObject *)v6 verticalDirectionEstimate];
                float horizontalAngle = self->_horizontalAngle;
                [(NINearbyObject *)v6 horizontalAngle];
                float v106 = v40;
                int64_t v103 = v39;
                int64_t v104 = verticalDirectionEstimate;
                unsigned __int8 v105 = v37;
                float horizontalAngleAccuracy = self->_horizontalAngleAccuracy;
                [(NINearbyObject *)v6 horizontalAngleAccuracy];
                float v101 = v41;
                spatialScore = self->_spatialScore;
                if (!spatialScore)
                {
                  unsigned __int8 v43 = [(NINearbyObject *)v6 spatialScore];

                  if (!v43)
                  {
                    unsigned __int8 v100 = 1;
LABEL_19:
                    bluetoothAdvertisingAddress = self->_bluetoothAdvertisingAddress;
                    if (!bluetoothAdvertisingAddress)
                    {
                      long long v46 = [(NINearbyObject *)v6 bluetoothAdvertisingAddress];

                      if (!v46)
                      {
                        unsigned __int8 v99 = 1;
LABEL_23:
                        bluetoothPeerIdentifier = self->_bluetoothPeerIdentifier;
                        if (!bluetoothPeerIdentifier)
                        {
                          float v49 = [(NINearbyObject *)v6 bluetoothPeerIdentifier];

                          if (!v49)
                          {
                            unsigned __int8 v51 = 1;
LABEL_27:
                            float32x4_t v98 = *(float32x4_t *)self->_worldPosition;
                            [(NINearbyObject *)v6 worldPosition];
                            float32x4_t v97 = v52;
                            int requiresBiasCorrection = self->_requiresBiasCorrection;
                            unsigned __int8 v96 = v51;
                            unsigned int v94 = [(NINearbyObject *)v6 requiresBiasCorrection];
                            uwbSignalFeatures = self->_uwbSignalFeatures;
                            id v93 = v20;
                            if (!uwbSignalFeatures)
                            {
                              v54 = [(NINearbyObject *)v6 uwbSignalFeatures];

                              if (!v54) {
                                goto LABEL_31;
                              }
                              uwbSignalFeatures = self->_uwbSignalFeatures;
                            }
                            v55 = [(NINearbyObject *)v6 uwbSignalFeatures];
                            unsigned __int8 v56 = [(UWBSignalFeatures *)uwbSignalFeatures isEqual:v55];

                            LOBYTE(v54) = v56 ^ 1;
LABEL_31:
                            int nbRxStatus = self->_nbRxStatus;
                            unsigned int v58 = [(NINearbyObject *)v6 nbRxStatus];
                            int mmsRxStatus = self->_mmsRxStatus;
                            unsigned int v92 = [(NINearbyObject *)v6 mmsRxStatus];
                            int v89 = mmsRxStatus;
                            double nbRssi = self->_nbRssi;
                            [(NINearbyObject *)v6 nbRssi];
                            double v90 = v60;
                            BOOL canInteract = self->_canInteract;
                            unsigned int v88 = [(NINearbyObject *)v6 canInteract];
                            int resetARSession = self->_resetARSession;
                            unsigned int v86 = [(NINearbyObject *)v6 resetARSession];
                            int v84 = canInteract;
                            char v85 = (char)v54;
                            int revokeFindingExperience = self->_revokeFindingExperience;
                            unsigned int v82 = [(NINearbyObject *)v6 revokeFindingExperience];
                            unsigned __int8 v62 = v14;
                            unsigned __int8 v63 = v10;
                            float boundedRegionRange = self->_boundedRegionRange;
                            [(NINearbyObject *)v6 boundedRegionRange];
                            float v80 = v64;
                            int64_t algorithmSource = self->_algorithmSource;
                            id v65 = [(NINearbyObject *)v6 algorithmSource];
                            debugDisplayInfo = self->_debugDisplayInfo;
                            if (!debugDisplayInfo)
                            {
                              v67 = [(NINearbyObject *)v6 debugDisplayInfo];

                              if (!v67)
                              {
                                unsigned __int8 v69 = 1;
                                goto LABEL_35;
                              }
                              debugDisplayInfo = self->_debugDisplayInfo;
                            }
                            v68 = [(NINearbyObject *)v6 debugDisplayInfo];
                            unsigned __int8 v69 = [(NSString *)debugDisplayInfo isEqualToString:v68];

LABEL_35:
                            uint32x4_t v70 = (uint32x4_t)vceqq_f32(v98, v97);
                            v70.i32[3] = v70.i32[2];
                            BOOL v71 = (vminvq_u32(v70) & 0x80000000) == 0;
                            uint32x4_t v72 = (uint32x4_t)vceqq_f32(v117, v116);
                            v72.i32[3] = v72.i32[2];
                            int v73 = vminvq_u32(v72);
                            char v74 = v63 ^ 1;
                            if (distance != v17) {
                              char v74 = 1;
                            }
                            if (v73 >= 0) {
                              char v74 = 1;
                            }
                            if ((id)distanceMeasurementQuality != v93) {
                              char v74 = 1;
                            }
                            char v75 = v74 | v62 ^ 1;
                            if ((id)v112 != v111) {
                              char v75 = 1;
                            }
                            char v76 = (nbRxStatus == v58) & ~(v75 | (timestamp != v25 || v110 != v115) | v105 ^ 1 | (v104 != v103) | (horizontalAngle != v106) | (horizontalAngleAccuracy != v101) | v100 ^ 1 | v99 ^ 1 | v96 ^ 1 | (signalStrength != v29) | (remoteTxAntennaMask != v113) | v71 | (requiresBiasCorrection != v94) | (rangeUncertainty != v108) | (rangeBiasEstimate != v32) | v85);
                            if (v89 != v92) {
                              char v76 = 0;
                            }
                            if (nbRssi != v90) {
                              char v76 = 0;
                            }
                            if (v84 != v88) {
                              char v76 = 0;
                            }
                            if (resetARSession != v86) {
                              char v76 = 0;
                            }
                            if (revokeFindingExperience != v82) {
                              char v76 = 0;
                            }
                            if (boundedRegionRange != v80) {
                              char v76 = 0;
                            }
                            if ((id)algorithmSource != v65) {
                              char v76 = 0;
                            }
                            char v77 = v76 & v69;
                            id v4 = v118;
                            goto LABEL_60;
                          }
                          bluetoothPeerIdentifier = self->_bluetoothPeerIdentifier;
                        }
                        float v50 = [(NINearbyObject *)v6 bluetoothPeerIdentifier];
                        unsigned __int8 v51 = [(NSUUID *)bluetoothPeerIdentifier isEqual:v50];

                        goto LABEL_27;
                      }
                      bluetoothAdvertisingAddress = self->_bluetoothAdvertisingAddress;
                    }
                    unsigned __int8 v47 = [(NINearbyObject *)v6 bluetoothAdvertisingAddress];
                    unsigned __int8 v99 = [(NSData *)bluetoothAdvertisingAddress isEqualToData:v47];

                    goto LABEL_23;
                  }
                  spatialScore = self->_spatialScore;
                }
                unsigned __int8 v44 = [(NINearbyObject *)v6 spatialScore];
                unsigned __int8 v100 = [(NSNumber *)spatialScore isEqualToNumber:v44];

                goto LABEL_19;
              }
              name = self->_name;
            }
            v36 = [(NINearbyObject *)v6 name];
            unsigned __int8 v37 = [(NSString *)name isEqualToString:v36];

            goto LABEL_15;
          }
          deviceIdentifier = self->_deviceIdentifier;
        }
        double v13 = [(NINearbyObject *)v6 deviceIdentifier];
        unsigned __int8 v14 = [(NSString *)deviceIdentifier isEqualToString:v13];

        goto LABEL_11;
      }
      discoveryToken = self->_discoveryToken;
    }
    float v9 = [(NINearbyObject *)v6 discoveryToken];
    unsigned __int8 v10 = [(NIDiscoveryToken *)discoveryToken isEqual:v9];

    goto LABEL_7;
  }
  char v77 = 0;
LABEL_61:

  return v77;
}

- (unint64_t)hash
{
  discoveryToken = self->_discoveryToken;
  if (discoveryToken) {
    unint64_t v64 = [(NIDiscoveryToken *)discoveryToken hash];
  }
  else {
    unint64_t v64 = 0;
  }
  float distance = self->_distance;
  float v6 = NINearbyObjectDistanceNotAvailable;
  if (distance == NINearbyObjectDistanceNotAvailable)
  {
    unint64_t v63 = 0;
  }
  else
  {
    *(float *)&double v2 = self->_distance;
    double v33 = +[NSNumber numberWithFloat:v2];
    unint64_t v63 = (unint64_t)[v33 hash];
  }
  __n128 v7 = *(__n128 *)self->_direction;
  uint32x4_t v8 = (uint32x4_t)vceqq_f32((float32x4_t)NINearbyObjectDirectionNotAvailable, (float32x4_t)v7);
  v8.i32[3] = v8.i32[2];
  if ((vminvq_u32(v8) & 0x80000000) != 0) {
    unint64_t v62 = 0;
  }
  else {
    unint64_t v62 = sub_1001F4D94(v7);
  }
  double timestamp = self->_timestamp;
  double v10 = *(double *)&qword_1008AC4E0;
  if (timestamp == *(double *)&qword_1008AC4E0)
  {
    unint64_t v61 = 0;
  }
  else
  {
    double v32 = +[NSNumber numberWithDouble:self->_timestamp];
    unint64_t v61 = (unint64_t)[v32 hash];
  }
  BOOL v71 = +[NSNumber numberWithInteger:self->_distanceMeasurementQuality];
  unint64_t v60 = (unint64_t)[v71 hash];
  uint32x4_t v70 = +[NSNumber numberWithInteger:self->_motionState];
  unint64_t v58 = (unint64_t)[v70 hash];
  unsigned __int8 v69 = +[NSNumber numberWithInteger:self->_relationship];
  unint64_t v57 = (unint64_t)[v69 hash];
  NSUInteger v56 = [(NSString *)self->_deviceIdentifier hash];
  NSUInteger v54 = [(NSString *)self->_name hash];
  v68 = +[NSNumber numberWithInteger:self->_verticalDirectionEstimate];
  unint64_t v53 = (unint64_t)[v68 hash];
  float horizontalAngle = self->_horizontalAngle;
  float v13 = NINearbyObjectAngleNotAvailable;
  if (horizontalAngle == NINearbyObjectAngleNotAvailable)
  {
    unint64_t v52 = 0;
  }
  else
  {
    *(float *)&double v11 = self->_horizontalAngle;
    double v31 = +[NSNumber numberWithFloat:v11];
    unint64_t v52 = (unint64_t)[v31 hash];
  }
  float v14 = NINearbyObjectAngleNotAvailable;
  float horizontalAngleAccuracy = self->_horizontalAngleAccuracy;
  if (horizontalAngleAccuracy == NINearbyObjectAngleNotAvailable)
  {
    unint64_t v49 = 0;
  }
  else
  {
    *(float *)&double v11 = self->_horizontalAngleAccuracy;
    double v30 = +[NSNumber numberWithFloat:v11];
    unint64_t v49 = (unint64_t)[v30 hash];
  }
  unint64_t v50 = (unint64_t)[(NSNumber *)self->_spatialScore hash];
  unint64_t v48 = (unint64_t)[(NSData *)self->_bluetoothAdvertisingAddress hash];
  unint64_t v47 = (unint64_t)[(NSUUID *)self->_bluetoothPeerIdentifier hash];
  v67 = +[NSNumber numberWithDouble:self->_signalStrength];
  unint64_t v46 = (unint64_t)[v67 hash];
  v66 = +[NSNumber numberWithInt:self->_remoteTxAntennaMask];
  unint64_t v45 = (unint64_t)[v66 hash];
  id v65 = +[NSNumber numberWithDouble:self->_rangeBiasEstimate];
  unint64_t v44 = (unint64_t)[v65 hash];
  v59 = +[NSNumber numberWithDouble:self->_rangeUncertainty];
  unint64_t v43 = (unint64_t)[v59 hash];
  __n128 v16 = *(__n128 *)self->_worldPosition;
  uint32x4_t v17 = (uint32x4_t)vceqq_f32((float32x4_t)NINearbyObjectWorldPositionNotAvailable, (float32x4_t)v16);
  v17.i32[3] = v17.i32[2];
  if ((vminvq_u32(v17) & 0x80000000) != 0) {
    unint64_t v42 = 0;
  }
  else {
    unint64_t v42 = sub_1001F4D94(v16);
  }
  v55 = +[NSNumber numberWithBool:self->_requiresBiasCorrection];
  unint64_t v41 = (unint64_t)[v55 hash];
  unint64_t v40 = [(UWBSignalFeatures *)self->_uwbSignalFeatures hash];
  unsigned __int8 v51 = +[NSNumber numberWithInt:self->_nbRxStatus];
  unint64_t v39 = (unint64_t)[v51 hash];
  float32x4_t v18 = +[NSNumber numberWithInt:self->_mmsRxStatus];
  unint64_t v38 = (unint64_t)[v18 hash];
  float v19 = +[NSNumber numberWithDouble:self->_nbRssi];
  unint64_t v37 = (unint64_t)[v19 hash];
  id v20 = +[NSNumber numberWithBool:self->_canInteract];
  unint64_t v36 = (unint64_t)[v20 hash];
  float v21 = +[NSNumber numberWithBool:self->_resetARSession];
  unint64_t v35 = (unint64_t)[v21 hash];
  id v22 = +[NSNumber numberWithBool:self->_revokeFindingExperience];
  unint64_t v34 = (unint64_t)[v22 hash];
  *(float *)&double v23 = self->_boundedRegionRange;
  double v24 = +[NSNumber numberWithFloat:v23];
  unint64_t v25 = (unint64_t)[v24 hash];
  double v26 = +[NSNumber numberWithInteger:self->_algorithmSource];
  unint64_t v27 = (unint64_t)[v26 hash];
  NSUInteger v28 = [(NSString *)self->_debugDisplayInfo hash];

  if (horizontalAngleAccuracy != v14) {
  if (horizontalAngle != v13)
  }

  if (timestamp != v10) {
  if (distance != v6)
  }

  return v63 ^ v64 ^ v62 ^ v61 ^ v60 ^ v58 ^ v57 ^ v56 ^ v54 ^ v53 ^ v52 ^ v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v25 ^ v27 ^ v28;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"<%@: ", v5];

  discoveryToken = self->_discoveryToken;
  if (discoveryToken)
  {
    uint32x4_t v8 = [(NIDiscoveryToken *)discoveryToken descriptionInternal];
    [v6 appendFormat:@"Token: %@", v8];
  }
  else
  {
    [v6 appendString:@"Token: null"];
  }
  float distance = self->_distance;
  if (distance == NINearbyObjectDistanceNotAvailable) {
    [v6 appendString:@", Distance not available"];
  }
  else {
    [v6 appendFormat:@", Distance: %.2fm", distance];
  }
  float32x4_t v10 = *(float32x4_t *)self->_direction;
  uint32x4_t v11 = (uint32x4_t)vceqq_f32(v10, (float32x4_t)NINearbyObjectDirectionNotAvailable);
  v11.i32[3] = v11.i32[2];
  if ((vminvq_u32(v11) & 0x80000000) != 0) {
    [v6 appendString:@", Direction not available"];
  }
  else {
    [v6 appendFormat:@", Direction: (%.3f,%.3f,%.3f)", v10.f32[0], v10.f32[1], v10.f32[2]];
  }
  float horizontalAngle = self->_horizontalAngle;
  if (horizontalAngle == NINearbyObjectAngleNotAvailable) {
    [v6 appendFormat:@", Horizontal Angle: %.2frad", horizontalAngle];
  }
  else {
    [v6 appendString:@", Horizontal Angle not available"];
  }
  unint64_t verticalDirectionEstimate = self->_verticalDirectionEstimate;
  if (verticalDirectionEstimate >= 5) {
    __assert_rtn("NINearbyObjectVerticalDirectionEstimateToString", "NINearbyObject.mm", 78, "false");
  }
  [v6 appendFormat:@", Vertical Direction Estimate: %@ ", off_100859480[verticalDirectionEstimate]];
  [v6 appendString:@">"];

  return v6;
}

- (id)descriptionInternal
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"<%@: ", v5];

  __n128 v7 = [(NINearbyObject *)self description];
  [v6 appendString:v7];

  uint32x4_t v8 = [(NINearbyObject *)self deviceIdentifer];
  [v6 appendFormat:@", deviceIdentifier: %@", v8];

  float horizontalAngleAccuracy = self->_horizontalAngleAccuracy;
  float v10 = NINearbyObjectAngleNotAvailable;
  if (horizontalAngleAccuracy == NINearbyObjectAngleNotAvailable)
  {
    uint32x4_t v11 = @"-";
  }
  else
  {
    uint32x4_t v11 = +[NSString stringWithFormat:@"%0.2frad", horizontalAngleAccuracy];
  }
  [v6 appendFormat:@", HorizAngleAcc: %@", v11];
  if (horizontalAngleAccuracy != v10) {

  }
  unint64_t distanceMeasurementQuality = self->_distanceMeasurementQuality;
  if (distanceMeasurementQuality > 3)
  {
    int v41 = 46;
    unint64_t v42 = "NIDistanceMeasurementQualityToString";
    goto LABEL_57;
  }
  [v6 appendFormat:@", Ranging Quality: %@ ", off_1008594A8[distanceMeasurementQuality]];
  unint64_t motionState = self->_motionState;
  if (motionState >= 3)
  {
    int v41 = 60;
    unint64_t v42 = "NIMotionActivityStateToString";
LABEL_57:
    __assert_rtn(v42, "NINearbyObject.mm", v41, "false");
  }
  [v6 appendFormat:@", Motion State: %@", off_1008594C8[motionState]];
  double signalStrength = self->_signalStrength;
  double v15 = *(double *)&NINearbyObjectSignalStrengthNotAvailable;
  if (signalStrength == *(double *)&NINearbyObjectSignalStrengthNotAvailable)
  {
    __n128 v16 = @"-";
  }
  else
  {
    __n128 v16 = +[NSString stringWithFormat:@"%0.2f dBm", *(void *)&self->_signalStrength];
  }
  [v6 appendFormat:@", Signal Strength: %@", v16];
  if (signalStrength != v15) {

  }
  int remoteTxAntennaMask = self->_remoteTxAntennaMask;
  int v18 = NINearbyObjectRemoteTxAntennaMaskNotAvailable;
  if (remoteTxAntennaMask == NINearbyObjectRemoteTxAntennaMaskNotAvailable)
  {
    float v19 = @"-";
  }
  else
  {
    float v19 = +[NSString stringWithFormat:@"0x%02x", self->_remoteTxAntennaMask];
  }
  [v6 appendFormat:@", Remote Tx Antenna Mask: %@", v19];
  if (remoteTxAntennaMask != v18) {

  }
  float32x4_t v20 = *(float32x4_t *)self->_worldPosition;
  uint32x4_t v21 = (uint32x4_t)vceqq_f32(v20, (float32x4_t)NINearbyObjectWorldPositionNotAvailable);
  v21.i32[3] = v21.i32[2];
  if ((vminvq_u32(v21) & 0x80000000) != 0) {
    [v6 appendString:@", World Position not available"];
  }
  else {
    [v6 appendFormat:@", World Position: (%.2f,%.2f,%.2f)", v20.f32[0], v20.f32[1], v20.f32[2]];
  }
  if (self->_requiresBiasCorrection) {
    CFStringRef v22 = @"YES";
  }
  else {
    CFStringRef v22 = @"NO";
  }
  [v6 appendFormat:@", Require Bias Correction: %@", v22];
  double rangeBiasEstimate = self->_rangeBiasEstimate;
  double v24 = *(double *)&NINearbyObjectRangeBiasEstimateNotAvailable;
  if (rangeBiasEstimate == *(double *)&NINearbyObjectRangeBiasEstimateNotAvailable)
  {
    unint64_t v25 = @"-";
  }
  else
  {
    unint64_t v25 = +[NSString stringWithFormat:@"%0.2f m", *(void *)&self->_rangeBiasEstimate];
  }
  [v6 appendFormat:@", Range Bias Estimate: %@", v25];
  if (rangeBiasEstimate != v24) {

  }
  double rangeUncertainty = self->_rangeUncertainty;
  double v27 = *(double *)&NINearbyObjectRangeUncertaintyNotAvailable;
  if (rangeUncertainty == *(double *)&NINearbyObjectRangeUncertaintyNotAvailable)
  {
    NSUInteger v28 = @"-";
  }
  else
  {
    NSUInteger v28 = +[NSString stringWithFormat:@"%0.2f m", *(void *)&self->_rangeUncertainty];
  }
  [v6 appendFormat:@", Range Uncertainty: %@", v28];
  if (rangeUncertainty != v27) {

  }
  double v29 = [(UWBSignalFeatures *)self->_uwbSignalFeatures description];
  [v6 appendFormat:@", Bias features: %@", v29];

  int nbRxStatus = self->_nbRxStatus;
  int v31 = NINearbyObjectRxStatusNotAvailable;
  if (nbRxStatus == NINearbyObjectRxStatusNotAvailable)
  {
    double v32 = @"-";
  }
  else
  {
    double v32 = +[NSString stringWithFormat:@"%d", self->_nbRxStatus];
  }
  [v6 appendFormat:@", NB Rx status: %@", v32];
  if (nbRxStatus != v31) {

  }
  int mmsRxStatus = self->_mmsRxStatus;
  int v34 = NINearbyObjectRxStatusNotAvailable;
  if (mmsRxStatus == NINearbyObjectRxStatusNotAvailable)
  {
    unint64_t v35 = @"-";
  }
  else
  {
    unint64_t v35 = +[NSString stringWithFormat:@"%d", self->_mmsRxStatus];
  }
  [v6 appendFormat:@", UWB Rx status: %@", v35];
  if (mmsRxStatus != v34) {

  }
  double nbRssi = self->_nbRssi;
  double v37 = *(double *)&NINearbyObjectNbRssiNotAvailable;
  if (nbRssi == *(double *)&NINearbyObjectNbRssiNotAvailable)
  {
    unint64_t v38 = @"-";
  }
  else
  {
    unint64_t v38 = +[NSString stringWithFormat:@"%0.2f dBm", *(void *)&self->_nbRssi];
  }
  [v6 appendFormat:@", NB RSSI: %@", v38];
  if (nbRssi != v37) {

  }
  if (self->_canInteract) {
    CFStringRef v39 = @"YES";
  }
  else {
    CFStringRef v39 = @"NO";
  }
  [v6 appendFormat:@", Can Interact: %@", v39];
  [v6 appendString:@">"];

  return v6;
}

- (id)deviceIdentifer
{
  return self->_deviceIdentifier;
}

+ (id)fauxObjectWithDiscoveryToken:(id)a3 name:(id)a4 deviceIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  float v10 = [[NINearbyObject alloc] initWithToken:v7];
  [(NINearbyObject *)v10 setName:v8];
  [(NINearbyObject *)v10 setDeviceIdentifier:v9];

  return v10;
}

- (void)overrideDistance:(float)a3
{
  self->_float distance = a3;
}

- (void)overrideDirection:(NINearbyObject *)self
{
  *(_OWORD *)self->_direction = v2;
}

- (void)overrideRelationship:(unint64_t)a3
{
  self->_unint64_t relationship = a3;
}

- (void)overrideDistanceMeasurementQuality:(int64_t)a3
{
  self->_unint64_t distanceMeasurementQuality = a3;
}

- (void)overrideMotionState:(int64_t)a3
{
  self->_unint64_t motionState = a3;
}

- (void)overrideTimestamp:(float)a3
{
  self->_double timestamp = a3;
}

- (void)overrideSpatialScore:(id)a3
{
}

- (NIDiscoveryToken)discoveryToken
{
  return self->_discoveryToken;
}

- (void)setDiscoveryToken:(id)a3
{
}

- (float)distance
{
  return self->_distance;
}

- (void)setDistance:(float)a3
{
  self->_float distance = a3;
}

- (simd_float3)direction
{
  return *(simd_float3 *)self->_direction;
}

- (void)setDirection:(NINearbyObject *)self
{
  *(_OWORD *)self->_direction = v2;
}

- (NINearbyObjectVerticalDirectionEstimate)verticalDirectionEstimate
{
  return self->_verticalDirectionEstimate;
}

- (void)setVerticalDirectionEstimate:(int64_t)a3
{
  self->_unint64_t verticalDirectionEstimate = a3;
}

- (float)horizontalAngle
{
  return self->_horizontalAngle;
}

- (void)setHorizontalAngle:(float)a3
{
  self->_float horizontalAngle = a3;
}

- (__n128)quaternion
{
  return a1[13];
}

- (__n128)setQuaternion:(__n128 *)result
{
  result[13] = a2;
  return result;
}

- (float)azimuth
{
  return self->_azimuth;
}

- (void)setAzimuth:(float)a3
{
  self->_azimuth = a3;
}

- (float)elevation
{
  return self->_elevation;
}

- (void)setElevation:(float)a3
{
  self->_elevation = a3;
}

- (unint64_t)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(unint64_t)a3
{
  self->_unint64_t relationship = a3;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (int64_t)distanceMeasurementQuality
{
  return self->_distanceMeasurementQuality;
}

- (void)setDistanceMeasurementQuality:(int64_t)a3
{
  self->_unint64_t distanceMeasurementQuality = a3;
}

- (int64_t)motionState
{
  return self->_motionState;
}

- (void)setMotionState:(int64_t)a3
{
  self->_unint64_t motionState = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSNumber)spatialScore
{
  return self->_spatialScore;
}

- (void)setSpatialScore:(id)a3
{
}

- (NSData)bluetoothAdvertisingAddress
{
  return self->_bluetoothAdvertisingAddress;
}

- (void)setBluetoothAdvertisingAddress:(id)a3
{
}

- (NSUUID)bluetoothPeerIdentifier
{
  return self->_bluetoothPeerIdentifier;
}

- (void)setBluetoothPeerIdentifier:(id)a3
{
}

- (float)horizontalAngleAccuracy
{
  return self->_horizontalAngleAccuracy;
}

- (void)setHorizontalAngleAccuracy:(float)a3
{
  self->_float horizontalAngleAccuracy = a3;
}

- (double)signalStrength
{
  return self->_signalStrength;
}

- (void)setSignalStrength:(double)a3
{
  self->_double signalStrength = a3;
}

- (double)rangeBiasEstimate
{
  return self->_rangeBiasEstimate;
}

- (void)setRangeBiasEstimate:(double)a3
{
  self->_double rangeBiasEstimate = a3;
}

- (double)rangeUncertainty
{
  return self->_rangeUncertainty;
}

- (void)setRangeUncertainty:(double)a3
{
  self->_double rangeUncertainty = a3;
}

- (unsigned)remoteTxAntennaMask
{
  return self->_remoteTxAntennaMask;
}

- (void)setRemoteTxAntennaMask:(unsigned __int8)a3
{
  self->_int remoteTxAntennaMask = a3;
}

- (__n128)worldPosition
{
  return a1[14];
}

- (void)setWorldPosition:(NINearbyObject *)self
{
  *(_OWORD *)self->_worldPosition = v2;
}

- (BOOL)requiresBiasCorrection
{
  return self->_requiresBiasCorrection;
}

- (void)setRequiresBiasCorrection:(BOOL)a3
{
  self->_int requiresBiasCorrection = a3;
}

- (UWBSignalFeatures)uwbSignalFeatures
{
  return self->_uwbSignalFeatures;
}

- (void)setUwbSignalFeatures:(id)a3
{
}

- (unsigned)nbRxStatus
{
  return self->_nbRxStatus;
}

- (void)setNbRxStatus:(unsigned __int8)a3
{
  self->_int nbRxStatus = a3;
}

- (unsigned)mmsRxStatus
{
  return self->_mmsRxStatus;
}

- (void)setMmsRxStatus:(unsigned __int8)a3
{
  self->_int mmsRxStatus = a3;
}

- (double)nbRssi
{
  return self->_nbRssi;
}

- (void)setNbRssi:(double)a3
{
  self->_double nbRssi = a3;
}

- (BOOL)canInteract
{
  return self->_canInteract;
}

- (void)setCanInteract:(BOOL)a3
{
  self->_BOOL canInteract = a3;
}

- (float)boundedRegionRange
{
  return self->_boundedRegionRange;
}

- (void)setBoundedRegionRange:(float)a3
{
  self->_float boundedRegionRange = a3;
}

- (int64_t)algorithmSource
{
  return self->_algorithmSource;
}

- (void)setAlgorithmSource:(int64_t)a3
{
  self->_int64_t algorithmSource = a3;
}

- (NSString)debugDisplayInfo
{
  return self->_debugDisplayInfo;
}

- (void)setDebugDisplayInfo:(id)a3
{
}

- (BOOL)resetARSession
{
  return self->_resetARSession;
}

- (void)setResetARSession:(BOOL)a3
{
  self->_int resetARSession = a3;
}

- (BOOL)revokeFindingExperience
{
  return self->_revokeFindingExperience;
}

- (void)setRevokeFindingExperience:(BOOL)a3
{
  self->_int revokeFindingExperience = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugDisplayInfo, 0);
  objc_storeStrong((id *)&self->_uwbSignalFeatures, 0);
  objc_storeStrong((id *)&self->_bluetoothPeerIdentifier, 0);
  objc_storeStrong((id *)&self->_bluetoothAdvertisingAddress, 0);
  objc_storeStrong((id *)&self->_spatialScore, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);

  objc_storeStrong((id *)&self->_discoveryToken, 0);
}

+ (id)objectFromBluetoothDevice:(id)a3
{
  id v3 = a3;
  id v4 = [NINearbyObject alloc];
  double v5 = [v3 discoveryToken];
  id v6 = [(NINearbyObject *)v4 initWithToken:v5];

  if ([v3 systemKeyRelationship])
  {
    id v7 = [v3 idsDeviceID];
    [(NINearbyObject *)v6 setDeviceIdentifier:v7];

    [(NINearbyObject *)v6 setRelationship:2];
    id v8 = [v3 name];
    [(NINearbyObject *)v6 setName:v8];

    id v9 = [v3 cbDevice];
    float v10 = [v9 btAddressData];
    [(NINearbyObject *)v6 setBluetoothAdvertisingAddress:v10];
  }

  return v6;
}

@end