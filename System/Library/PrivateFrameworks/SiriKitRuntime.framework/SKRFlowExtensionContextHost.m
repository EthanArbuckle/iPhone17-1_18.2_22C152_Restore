@interface SKRFlowExtensionContextHost
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (SKRFlowExtensionContextHost)init;
- (SKRFlowExtensionContextHost)initWithInputItems:(id)a3;
- (SKRFlowExtensionContextHost)initWithInputItems:(id)a3 contextUUID:(id)a4;
- (SKRFlowExtensionContextHost)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
@end

@implementation SKRFlowExtensionContextHost

- (SKRFlowExtensionContextHost)init
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v4 = [(SKRFlowExtensionContextHost *)self initWithInputItems:isa listenerEndpoint:0 contextUUID:0];

  return v4;
}

- (SKRFlowExtensionContextHost)initWithInputItems:(id)a3
{
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v5 = [(SKRFlowExtensionContextHost *)self initWithInputItems:isa listenerEndpoint:0 contextUUID:0];

  return v5;
}

- (SKRFlowExtensionContextHost)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1F4188790](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 0, 1, v11);
  }
  else
  {
    uint64_t v12 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  id v13 = a4;
  specialized FlowExtensionContextHost.init(inputItems:listenerEndpoint:contextUUID:)(v10, (uint64_t)a4, (uint64_t)v9);
  v15 = v14;

  return v15;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return @objc static FlowExtensionContext._extensionAuxiliaryVendorProtocol()((uint64_t)a1, (uint64_t)a2, &one-time initialization token for remoteConversationXPCInterface, (void **)&static RemoteConversationXPCHelper.remoteConversationXPCInterface);
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return @objc static FlowExtensionContext._extensionAuxiliaryVendorProtocol()((uint64_t)a1, (uint64_t)a2, &one-time initialization token for remoteConversationHostXPCInterface, (void **)&static RemoteConversationXPCHelper.remoteConversationHostXPCInterface);
}

- (SKRFlowExtensionContextHost)initWithInputItems:(id)a3 contextUUID:(id)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for UUID();
    uint64_t v10 = 0;
    v9 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UUID();
    v9 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    uint64_t v10 = 1;
  }
  (*v9)(v7, v10, 1, v8);
  result = (SKRFlowExtensionContextHost *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end