@interface SASUpdateAudioInfo
+ (id)updateAudioInfo;
- (BOOL)requiresResponse;
- (BOOL)triggeredTwoShotBorealis;
- (NSNumber)noiseReductionLevel;
- (NSString)audioDestination;
- (NSString)audioSource;
- (NSString)deviceIdentifier;
- (NSString)deviceModel;
- (NSString)dspStatus;
- (NSString)firmwareVersion;
- (NSString)headsetAddress;
- (NSString)headsetId;
- (NSString)headsetName;
- (NSString)origin;
- (NSString)productId;
- (NSString)vendorId;
- (SASRecordingInfo)recordingInfo;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int)codec;
- (void)setAudioDestination:(id)a3;
- (void)setAudioSource:(id)a3;
- (void)setCodec:(int)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDspStatus:(id)a3;
- (void)setFirmwareVersion:(id)a3;
- (void)setHeadsetAddress:(id)a3;
- (void)setHeadsetId:(id)a3;
- (void)setHeadsetName:(id)a3;
- (void)setNoiseReductionLevel:(id)a3;
- (void)setOrigin:(id)a3;
- (void)setProductId:(id)a3;
- (void)setRecordingInfo:(id)a3;
- (void)setTriggeredTwoShotBorealis:(BOOL)a3;
- (void)setVendorId:(id)a3;
@end

@implementation SASUpdateAudioInfo

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"UpdateAudioInfo";
}

+ (id)updateAudioInfo
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)audioDestination
{
  return (NSString *)[(AceObject *)self propertyForKey:@"audioDestination"];
}

- (void)setAudioDestination:(id)a3
{
}

- (NSString)audioSource
{
  return (NSString *)[(AceObject *)self propertyForKey:@"audioSource"];
}

- (void)setAudioSource:(id)a3
{
}

- (int)codec
{
  id v2 = [(AceObject *)self propertyForKey:@"codec"];
  int v3 = SASCodecForString(v2);

  return v3;
}

- (void)setCodec:(int)a3
{
  stringForSASCodec(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  AceObjectSetCopyingObjectForProperty(self, @"codec", v4);
}

- (NSString)deviceIdentifier
{
  return (NSString *)[(AceObject *)self propertyForKey:@"deviceIdentifier"];
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSString)deviceModel
{
  return (NSString *)[(AceObject *)self propertyForKey:@"deviceModel"];
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)dspStatus
{
  return (NSString *)[(AceObject *)self propertyForKey:@"dspStatus"];
}

- (void)setDspStatus:(id)a3
{
}

- (NSString)firmwareVersion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"firmwareVersion"];
}

- (void)setFirmwareVersion:(id)a3
{
}

- (NSString)headsetAddress
{
  return (NSString *)[(AceObject *)self propertyForKey:@"headsetAddress"];
}

- (void)setHeadsetAddress:(id)a3
{
}

- (NSString)headsetId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"headsetId"];
}

- (void)setHeadsetId:(id)a3
{
}

- (NSString)headsetName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"headsetName"];
}

- (void)setHeadsetName:(id)a3
{
}

- (NSNumber)noiseReductionLevel
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"noiseReductionLevel"];
}

- (void)setNoiseReductionLevel:(id)a3
{
}

- (NSString)origin
{
  return (NSString *)[(AceObject *)self propertyForKey:@"origin"];
}

- (void)setOrigin:(id)a3
{
}

- (NSString)productId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"productId"];
}

- (void)setProductId:(id)a3
{
}

- (SASRecordingInfo)recordingInfo
{
  return (SASRecordingInfo *)AceObjectAceObjectForProperty(self, @"recordingInfo");
}

- (void)setRecordingInfo:(id)a3
{
}

- (BOOL)triggeredTwoShotBorealis
{
  return AceObjectBoolForProperty(self, @"triggeredTwoShotBorealis");
}

- (void)setTriggeredTwoShotBorealis:(BOOL)a3
{
}

- (NSString)vendorId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"vendorId"];
}

- (void)setVendorId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end