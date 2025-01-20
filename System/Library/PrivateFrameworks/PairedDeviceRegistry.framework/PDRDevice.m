@interface PDRDevice
- (BOOL)isActive;
- (BOOL)isAltAccount;
- (BOOL)isArchived;
- (BOOL)isPaired;
- (BOOL)isSetup;
- (NSUUID)pairingID;
- (PDRDevice)init;
- (id)bluetoothIdentifier;
- (id)lastActiveDate;
- (id)pairingStorePath;
- (id)propertyNames;
- (id)systemBuildVersion;
- (id)systemName;
- (id)valueForProperty:(id)a3;
@end

@implementation PDRDevice

- (PDRDevice)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDRDevice;
  return [(PDRDevice *)&v3 init];
}

- (BOOL)isPaired
{
  v2 = self;
  char v3 = PDRDevice.isPaired()(PDRDevicePropertyKeyIsPaired);

  return v3 & 1;
}

- (BOOL)isActive
{
  v2 = self;
  char v3 = PDRDevice.isPaired()(PDRDevicePropertyKeyIsActive);

  return v3 & 1;
}

- (id)pairingStorePath
{
  v2 = self;
  uint64_t v3 = PDRDevice.localPairingDataStorePath.getter();
  uint64_t v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x25A2CA820](v3, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)isSetup
{
  v2 = self;
  char v3 = PDRDevice.isPaired()(PDRDevicePropertyKeyIsSetup);

  return v3 & 1;
}

- (BOOL)isArchived
{
  v2 = self;
  char v3 = PDRDevice.isPaired()(PDRDevicePropertyKeyIsArchived);

  return v3 & 1;
}

- (BOOL)isAltAccount
{
  v2 = self;
  char v3 = PDRDevice.isPaired()(PDRDevicePropertyKeyIsAltAccount);

  return v3 & 1;
}

- (id)lastActiveDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  PDRDevice.lastActiveDate()((uint64_t)v5);

  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return isa;
}

- (id)systemBuildVersion
{
  return @objc PDRDevice.systemBuildVersion()(self, (uint64_t)a2, PDRDevicePropertyKeySystemBuildVersion);
}

- (id)systemName
{
  return @objc PDRDevice.systemBuildVersion()(self, (uint64_t)a2, PDRDevicePropertyKeySystemName);
}

- (id)bluetoothIdentifier
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = self;
  id result = [(PDRDevice *)v7 valueForProperty:@"_bluetoothIdentifier"];
  if (result)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    outlined init with take of Any(v10, &v11);
    swift_dynamicCast();

    v9.super.Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return v9.super.isa;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSUUID)pairingID
{
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return 0;
}

- (id)valueForProperty:(id)a3
{
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0(v3);
  return 0;
}

- (id)propertyNames
{
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return 0;
}

@end