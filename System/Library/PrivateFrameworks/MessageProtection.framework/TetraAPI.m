@interface TetraAPI
+ (BOOL)markForStateResetWithOurURI:(id)a3 ourPushToken:(id)a4 theirURI:(id)a5 theirPushToken:(id)a6 theirRegistration:(id)a7 signedByOur:(id)a8;
+ (id)sealWithMessage:(id)a3 authenticatedData:(id)a4 guid:(id)a5 sendingURI:(id)a6 sendingPushToken:(id)a7 receivingURI:(id)a8 receivingPushToken:(id)a9 receiverRegistration:(id)a10 encryptedAttributes:(id)a11 resetState:(BOOL)a12 signedBy:(id)a13 error:(id *)a14;
+ (void)openWithMessage:(id)a3 authenticatedData:(id)a4 guid:(id)a5 sendingURI:(id)a6 sendingPushToken:(id)a7 receivingURI:(id)a8 receivingPushToken:(id)a9 signedBy:(id)a10 tetraVersion:(unsigned int)a11 ourPrekeys:(id)a12 ourSigningPublicKeyCompactRepresentation:(id)a13 decryptionBlock:(id)aBlock;
- (_TtC17MessageProtection8TetraAPI)init;
@end

@implementation TetraAPI

+ (BOOL)markForStateResetWithOurURI:(id)a3 ourPushToken:(id)a4 theirURI:(id)a5 theirPushToken:(id)a6 theirRegistration:(id)a7 signedByOur:(id)a8
{
  unint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;
  unint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v17 = v16;
  id v18 = a4;
  id v19 = a6;
  v20 = (char *)a7;
  id v21 = a8;
  LOBYTE(v15) = specialized static TetraAPI.markForStateReset(ourURI:ourPushToken:theirURI:theirPushToken:theirRegistration:signedByOur:)(v12, v14, v18, v15, v17, v19, v20, v21);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15 & 1;
}

+ (id)sealWithMessage:(id)a3 authenticatedData:(id)a4 guid:(id)a5 sendingURI:(id)a6 sendingPushToken:(id)a7 receivingURI:(id)a8 receivingPushToken:(id)a9 receiverRegistration:(id)a10 encryptedAttributes:(id)a11 resetState:(BOOL)a12 signedBy:(id)a13 error:(id *)a14
{
  id v39 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  id v43 = a7;
  id v22 = a8;
  id v42 = a9;
  v35 = (objc_class *)a10;
  id v23 = a11;
  id v24 = a13;
  uint64_t v37 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v41 = v25;

  uint64_t v26 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v38 = v27;
  uint64_t v40 = v26;

  unint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v29 = v28;

  v30 = (uint64_t (*)(uint64_t))static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v32 = v31;

  uint64_t v33 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  Class v44 = specialized static TetraAPI.seal(message:authenticatedData:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:receiverRegistration:encryptedAttributes:resetState:signedBy:)(v37, v41, v40, v38, v36, v29, v43, v30, v32, v42, v35, v33, a12, v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  outlined consume of Data._Representation(v40, v38);
  outlined consume of Data._Representation(v37, v41);
  return v44;
}

+ (void)openWithMessage:(id)a3 authenticatedData:(id)a4 guid:(id)a5 sendingURI:(id)a6 sendingPushToken:(id)a7 receivingURI:(id)a8 receivingPushToken:(id)a9 signedBy:(id)a10 tetraVersion:(unsigned int)a11 ourPrekeys:(id)a12 ourSigningPublicKeyCompactRepresentation:(id)a13 decryptionBlock:(id)aBlock
{
  id v20 = _Block_copy(aBlock);
  id v45 = a3;
  id v21 = a4;
  id v22 = a5;
  id v23 = a6;
  id v48 = a7;
  id v24 = a8;
  id v47 = a9;
  id v39 = a10;
  id v25 = a12;
  id v49 = a13;
  uint64_t v26 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v28 = v27;

  v46 = (objc_class *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v44 = v29;

  uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v42 = v31;
  uint64_t v43 = v30;

  uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v40 = v33;
  unint64_t v41 = v32;

  unint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v36 = v35;

  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for NGMFullPrekey);
  uint64_t v38 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  ObjCClassMetadata = (void *)swift_getObjCClassMetadata();
  _Block_copy(v20);
  specialized static TetraAPI.open(message:authenticatedData:guid:sendingURI:sendingPushToken:receivingURI:receivingPushToken:signedBy:tetraVersion:ourPrekeys:ourSigningPublicKeyCompactRepresentation:decryptionBlock:)(v26, v28, v46, v44, v43, v42, v41, v40, v48, v34, v36, v47, v39, a11, v38, (uint64_t)v49, ObjCClassMetadata, (uint8_t *)v20);
  _Block_release(v20);
  _Block_release(v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation((uint64_t)v46, v44);
  outlined consume of Data._Representation(v26, v28);
}

- (_TtC17MessageProtection8TetraAPI)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TetraAPI();
  return [(TetraAPI *)&v3 init];
}

@end