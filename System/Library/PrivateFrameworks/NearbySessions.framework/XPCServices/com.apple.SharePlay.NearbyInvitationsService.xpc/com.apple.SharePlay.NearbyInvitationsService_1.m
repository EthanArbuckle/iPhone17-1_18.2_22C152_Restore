uint64_t getEnumTag for NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t destructiveInjectEnumTag for NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(uint64_t result, char a2)
{
  *(unsigned char *)(result + 32) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation()
{
  return &type metadata for NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation;
}

uint64_t closure #2 in _PublisherElements.Iterator.next()specialized partial apply(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = partial apply for closure #1 in NearbyInvitationsAdvertiser.start();
  return specialized closure #2 in _PublisherElements.Iterator.next()(a1, v4);
}

uint64_t partial apply for closure #1 in closure #1 in NearbyGroupHostIDSService.distributeLeave(for:)(uint64_t a1)
{
  uint64_t v2 = UUID.data.getter();
  uint64_t v4 = v3;
  uint64_t result = outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = 1;
  return result;
}

uint64_t outlined assign with take of NearbyGroup_Group.OneOf_Event?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in closure #1 in NearbyGroupHostIDSService.distributeRemove(for:removingMember:)(uint64_t a1)
{
  return closure #1 in closure #1 in NearbyGroupHostIDSService.distributeAdd(for:addingMember:)(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

uint64_t partial apply for closure #1 in closure #1 in NearbyGroupHostIDSService.distributeGroupInitialization(for:to:)(uint64_t a1)
{
  return closure #1 in closure #1 in NearbyGroupHostIDSService.distributeGroupInitialization(for:to:)(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t partial apply for closure #1 in closure #1 in NearbyGroupHostIDSService.distributeAdd(for:addingMember:)(uint64_t a1)
{
  return closure #1 in closure #1 in NearbyGroupHostIDSService.distributeAdd(for:addingMember:)(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), type metadata accessor for NearbyGroup_Group.MemberAdded);
}

uint64_t NearbyInvitationServiceHostConnection.__allocating_init(connection:queue:dataSource:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return NearbyInvitationServiceHostConnection.init(connection:queue:dataSource:)(a1, a2, a3);
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t NearbyInvitationServiceHostConnection.init(connection:queue:dataSource:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + direct field offset for NearbyInvitationServiceHostConnection.dataSource) = a3;
  uint64_t v4 = one-time initialization token for host;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  __swift_project_value_buffer(v5, (uint64_t)static Log.host);
  v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Creating NearbyInvitationServiceHostConnection", v8, 2u);
    swift_slowDealloc();
  }

  uint64_t v9 = XPCHostConnection.init(connection:queue:)();
  swift_release();
  return v9;
}

void NearbyInvitationServiceHostConnection.init(connection:queue:)()
{
}

uint64_t NearbyInvitationServiceHostConnection.__ivar_destroyer()
{
  return swift_release();
}

uint64_t @objc NearbyInvitationServiceHostConnection.__ivar_destroyer()
{
  return swift_release();
}

uint64_t NearbyInvitationServiceHostConnection.createGroup(with:response:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  id v9 = a1;
  v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = (void *)swift_slowAlloc();
    *(_DWORD *)v12 = 138412290;
    uint64_t v17 = v4;
    uint64_t v14 = a2;
    id v15 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v13 = v9;

    a2 = v14;
    uint64_t v4 = v17;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "NearbyInvitationServiceHostConnection received request to create group with %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(id, uint64_t, uint64_t))(**(void **)(v4
                                                                       + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                         + 480))(v9, a2, a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.createGroup(with:response:)(void *a1, int a2, void *a3, void *a4)
{
  return @objc NearbyInvitationServiceHostConnection.createGroup(with:response:)(a1, a2, a3, a4, (uint64_t)&unk_1000F93C0, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NearbyGroupConnectionInfo?, @unowned NSError?) -> (), (void (*)(id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.createGroup(with:response:));
}

uint64_t NearbyInvitationServiceHostConnection.requestApproval(with:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  id v9 = a1;
  v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)v12 = 136315138;
    type metadata accessor for InvitationApprovalRequest();
    uint64_t v13 = a2;
    id v14 = v9;
    uint64_t v15 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    a2 = v13;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "NearbyInvitationServiceHostConnection requestApproval with %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(id, uint64_t, uint64_t))(**(void **)(v4
                                                                       + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                         + 488))(v9, a2, a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.requestApproval(with:completion:)(void *a1, int a2, void *a3, void *a4)
{
  return @objc NearbyInvitationServiceHostConnection.createGroup(with:response:)(a1, a2, a3, a4, (uint64_t)&unk_1000F9398, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned InvitationBlob?, @unowned NSError?) -> (), (void (*)(id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.requestApproval(with:completion:));
}

uint64_t NearbyInvitationServiceHostConnection.approve(pendingMember:response:completion:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)static Log.host);
  id v11 = a1;
  v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)id v14 = 136315138;
    type metadata accessor for IncomingInvitationJoinRequest();
    uint64_t v20 = v5;
    uint64_t v15 = a2;
    id v16 = v11;
    uint64_t v17 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v18, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    a2 = v15;
    uint64_t v5 = v20;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "NearbyInvitationServiceHostConnection approve pendingMember %s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(id, uint64_t, uint64_t, uint64_t))(**(void **)(v5
                                                                                + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                                  + 496))(v11, a2, a3, a4);
}

uint64_t @objc NearbyInvitationServiceHostConnection.approve(pendingMember:response:completion:)(void *a1, int a2, void *a3, void *a4, void *a5)
{
  return @objc NearbyInvitationServiceHostConnection.approve(pendingMember:response:completion:)(a1, a2, a3, a4, a5, (uint64_t)&unk_1000F9370, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, (void (*)(id, id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.approve(pendingMember:response:completion:));
}

uint64_t NearbyInvitationServiceHostConnection.reject(pendingMember:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  id v9 = a1;
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)v12 = 136315138;
    type metadata accessor for IncomingInvitationJoinRequest();
    uint64_t v13 = a2;
    id v14 = v9;
    uint64_t v15 = String.init<A>(reflecting:)();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    a2 = v13;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "NearbyInvitationServiceHostConnection reject pendingMember %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(id, uint64_t, uint64_t))(**(void **)(v4
                                                                       + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                         + 504))(v9, a2, a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.reject(pendingMember:completion:)(void *a1, int a2, void *a3, void *a4)
{
  return @objc NearbyInvitationServiceHostConnection.createGroup(with:response:)(a1, a2, a3, a4, (uint64_t)&unk_1000F9348, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, (void (*)(id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.reject(pendingMember:completion:));
}

uint64_t NearbyInvitationServiceHostConnection.generateNearbyInvitation(provider:response:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  id v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "NearbyInvitationServiceHostConnection generateNearbyInvitation", v11, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v4
                                                                            + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                              + 512))(a1, a2, a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.generateNearbyInvitation(provider:response:)(void *a1, int a2, uint64_t a3, void *a4)
{
  return @objc NearbyInvitationServiceHostConnection.generateNearbyInvitation(provider:response:)(a1, a2, a3, a4, (uint64_t)&unk_1000F9320, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned InvitationBlob?, @unowned NSError?) -> (), (void (*)(uint64_t, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.generateNearbyInvitation(provider:response:));
}

uint64_t NearbyInvitationServiceHostConnection.advertiseNearbyInvitation(_:provider:response:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)static Log.host);
  os_log_type_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "NearbyInvitationServiceHostConnection advertiseNearbyInvitation", v13, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(v5
                                                                                     + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                                       + 520))(a1, a2, a3, a4);
}

uint64_t @objc NearbyInvitationServiceHostConnection.advertiseNearbyInvitation(_:provider:response:)(void *a1, int a2, void *a3, uint64_t a4, void *aBlock)
{
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a1;
  NearbyInvitationServiceHostConnection.advertiseNearbyInvitation(_:provider:response:)((uint64_t)v10, a4, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, v9);

  return swift_release();
}

uint64_t NearbyInvitationServiceHostConnection.advertiseNearbySessionEndpoint(params:response:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "NearbyInvitationServiceHostConnection advertiseNearbyInvitation", v11, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v4
                                                                            + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                              + 528))(a1, a2, a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.advertiseNearbySessionEndpoint(params:response:)(void *a1, int a2, void *a3, void *a4)
{
  return @objc NearbyInvitationServiceHostConnection.createGroup(with:response:)(a1, a2, a3, a4, (uint64_t)&unk_1000F92D0, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, (void (*)(id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.advertiseNearbySessionEndpoint(params:response:));
}

uint64_t NearbyInvitationServiceHostConnection.stopAdvertisingNearbyInvitation(_:response:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "NearbyInvitationServiceHostConnection stopAdvertisingNearbyInvitation", v11, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v4
                                                                            + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                              + 536))(a1, a2, a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.stopAdvertisingNearbyInvitation(_:response:)(void *a1, uint64_t a2, uint64_t a3, const void *a4)
{
  return @objc NearbyInvitationServiceHostConnection.stopAdvertisingNearbyInvitation(_:response:)(a1, a2, a3, a4, (uint64_t)&unk_1000F92A8, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, (void (*)(char *, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.stopAdvertisingNearbyInvitation(_:response:));
}

uint64_t NearbyInvitationServiceHostConnection.stopAdvertisingNearbySessionEndpoint(response:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  __swift_project_value_buffer(v6, (uint64_t)static Log.host);
  os_log_type_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "NearbyInvitationServiceHostConnection stopAdvertisingNearbyInvitation", v9, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(**(void **)(v3
                                                                   + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                     + 544))(a1, a2);
}

uint64_t @objc NearbyInvitationServiceHostConnection.stopAdvertisingNearbySessionEndpoint(response:)(void *a1, int a2, void *aBlock)
{
  uint64_t v4 = _Block_copy(aBlock);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = a1;
  NearbyInvitationServiceHostConnection.stopAdvertisingNearbySessionEndpoint(response:)((uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, v5);

  return swift_release();
}

uint64_t NearbyInvitationServiceHostConnection.assertAdvertisementPublic(_:rotations:response:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  __swift_project_value_buffer(v12, (uint64_t)static Log.host);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v22 = a1;
    uint64_t v16 = v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v24 = a4;
    v21[1] = v17;
    uint64_t v27 = v17;
    *(_DWORD *)uint64_t v16 = 136315394;
    uint64_t v23 = a2;
    lazy protocol witness table accessor for type UUID and conformance UUID();
    uint64_t v18 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v19, &v27);
    a2 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    *(_WORD *)(v16 + 12) = 2048;
    uint64_t v26 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "NearbyInvitationServiceHostConnection assertAdvertisementPublic invitationID: %s for %lu rotations", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    a4 = v24;
    swift_slowDealloc();
    a1 = v22;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(v25
                                                                                     + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                                       + 560))(a1, a2, a3, a4);
}

uint64_t @objc NearbyInvitationServiceHostConnection.assertAdvertisementPublic(_:rotations:response:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5)
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a1;
  NearbyInvitationServiceHostConnection.assertAdvertisementPublic(_:rotations:response:)((uint64_t)v11, a4, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSUUID?, @unowned NSError?) -> (), v13);

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSUUID?, @unowned NSError?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of UUID?(a1, (uint64_t)v8);
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
  }
  if (a2) {
    uint64_t v12 = (void *)_convertErrorToNSError(_:)();
  }
  else {
    uint64_t v12 = 0;
  }
  (*(void (**)(uint64_t, Class, void *))(a3 + 16))(a3, isa, v12);
}

uint64_t NearbyInvitationServiceHostConnection.markInvitationUsed(_:response:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  id v9 = a1;
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v13 = NearbyInvitationJoinRequestMetadata.pseudonym.getter();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "NearbyInvitationServiceHostConnection markInvitationUsed for pseudonym: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(id, uint64_t, uint64_t))(**(void **)(v4
                                                                       + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                         + 552))(v9, a2, a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.markInvitationUsed(_:response:)(void *a1, int a2, void *a3, void *a4)
{
  return @objc NearbyInvitationServiceHostConnection.createGroup(with:response:)(a1, a2, a3, a4, (uint64_t)&unk_1000F9230, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, (void (*)(id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.markInvitationUsed(_:response:));
}

uint64_t NearbyInvitationServiceHostConnection.releaseAdvertisementPublicAssertion(_:assertionIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v29 - v11;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  __swift_project_value_buffer(v13, (uint64_t)static Log.host);
  unint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v14(v12, a1, v6);
  v14(v10, a2, v6);
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  int v17 = v16;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v32 = v3;
    uint64_t v19 = v18;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v36 = v31;
    *(_DWORD *)uint64_t v19 = 136315394;
    int v30 = v17;
    lazy protocol witness table accessor for type UUID and conformance UUID();
    os_log_t v29 = v15;
    uint64_t v20 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v22 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, &v36);
    uint64_t v34 = a2;
    uint64_t v35 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v33 = a1;
    uint64_t v23 = *(void (**)(char *, uint64_t))(v7 + 8);
    v23(v12, v6);
    *(_WORD *)(v19 + 12) = 2080;
    uint64_t v24 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v35 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v36);
    a2 = v34;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v23(v10, v6);
    a1 = v33;
    os_log_t v26 = v29;
    _os_log_impl((void *)&_mh_execute_header, v29, (os_log_type_t)v30, "NearbyInvitationServiceHostConnection releaseAdvertisementPublicAssertion invitationID: %s assertionIdentifier %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v3 = v32;
    swift_slowDealloc();
  }
  else
  {
    uint64_t v27 = *(void (**)(char *, uint64_t))(v7 + 8);
    v27(v12, v6);
    v27(v10, v6);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void (*)(uint64_t), void))(**(void **)(v3 + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                                                           + 568))(a1, a2, closure #1 in NearbyInvitationServiceHostConnection.releaseAdvertisementPublicAssertion(_:assertionIdentifier:), 0);
}

void closure #1 in NearbyInvitationServiceHostConnection.releaseAdvertisementPublicAssertion(_:assertionIdentifier:)(uint64_t a1)
{
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  __swift_project_value_buffer(v2, (uint64_t)static Log.host);
  swift_errorRetain();
  swift_errorRetain();
  oslog = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    if (a1)
    {
      swift_errorRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
      uint64_t v5 = String.init<A>(reflecting:)();
      unint64_t v7 = v6;
    }
    else
    {
      unint64_t v7 = 0xE300000000000000;
      uint64_t v5 = 7104878;
    }
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v5, v7, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v3, "Released assertion with error: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
}

uint64_t @objc NearbyInvitationServiceHostConnection.releaseAdvertisementPublicAssertion(_:assertionIdentifier:)(void *a1)
{
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v12 - v7;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a1;
  NearbyInvitationServiceHostConnection.releaseAdvertisementPublicAssertion(_:assertionIdentifier:)((uint64_t)v8, (uint64_t)v6);

  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v6, v2);
  return ((uint64_t (*)(char *, uint64_t))v10)(v8, v2);
}

uint64_t NearbyInvitationServiceHostConnection.releaseInvitation(_:response:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  id v9 = a1;
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v13 = NearbyInvitationJoinRequestMetadata.pseudonym.getter();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v13, v14, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "NearbyInvitationServiceHostConnection releaseInvitation for pseudonym: %s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(id, uint64_t, uint64_t))(**(void **)(v4
                                                                       + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                         + 576))(v9, a2, a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.releaseInvitation(_:response:)(void *a1, int a2, void *a3, void *a4)
{
  return @objc NearbyInvitationServiceHostConnection.createGroup(with:response:)(a1, a2, a3, a4, (uint64_t)&unk_1000F9208, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, (void (*)(id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.releaseInvitation(_:response:));
}

uint64_t @objc NearbyInvitationServiceHostConnection.createGroup(with:response:)(void *a1, int a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(id, uint64_t, uint64_t))
{
  os_log_type_t v11 = _Block_copy(aBlock);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a3;
  id v14 = a1;
  a7(v13, a6, v12);

  return swift_release();
}

uint64_t NearbyInvitationServiceHostConnection.scanNearbyInvitations(scannerID:response:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  id v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "NearbyInvitationServiceHostConnection scanNearbyInvitations", v11, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v4
                                                                            + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                              + 584))(a1, a2, a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.scanNearbyInvitations(scannerID:response:)(void *a1, uint64_t a2, uint64_t a3, const void *a4)
{
  return @objc NearbyInvitationServiceHostConnection.stopAdvertisingNearbyInvitation(_:response:)(a1, a2, a3, a4, (uint64_t)&unk_1000F91E0, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, (void (*)(char *, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.scanNearbyInvitations(scannerID:response:));
}

uint64_t @objc NearbyInvitationServiceHostConnection.stopAdvertisingNearbyInvitation(_:response:)(void *a1, uint64_t a2, uint64_t a3, const void *a4, uint64_t a5, uint64_t a6, void (*a7)(char *, uint64_t, uint64_t))
{
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  id v17 = a1;
  a7(v14, a6, v16);

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t NearbyInvitationServiceHostConnection.scanNearbyEndpoints(params:scannerID:response:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)static Log.host);
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "NearbyInvitationServiceHostConnection scanNearbyInvitations", v13, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(v5
                                                                                     + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                                       + 592))(a1, a2, a3, a4);
}

uint64_t @objc NearbyInvitationServiceHostConnection.scanNearbyEndpoints(params:scannerID:response:)(void *a1, uint64_t a2, void *a3, uint64_t a4, const void *a5)
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  os_log_type_t v12 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  id v14 = a3;
  id v15 = a1;
  NearbyInvitationServiceHostConnection.scanNearbyEndpoints(params:scannerID:response:)((uint64_t)v14, (uint64_t)v11, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, v13);

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t NearbyInvitationServiceHostConnection.stopScanningNearbyInvitations(provider:response:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "NearbyInvitationServiceHostConnection stopScanningNearbyInvitations", v11, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v4
                                                                            + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                              + 600))(a1, a2, a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.stopScanningNearbyInvitations(provider:response:)(void *a1, int a2, uint64_t a3, void *a4)
{
  return @objc NearbyInvitationServiceHostConnection.generateNearbyInvitation(provider:response:)(a1, a2, a3, a4, (uint64_t)&unk_1000F9190, (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply, (void (*)(uint64_t, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.stopScanningNearbyInvitations(provider:response:));
}

uint64_t @objc NearbyInvitationServiceHostConnection.generateNearbyInvitation(provider:response:)(void *a1, int a2, uint64_t a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v11 = _Block_copy(aBlock);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  id v13 = a1;
  a7(a3, a6, v12);

  return swift_release();
}

uint64_t NearbyInvitationServiceHostConnection.requestConnection(with:localInvitation:response:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)static Log.host);
  id v11 = a1;
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    *(_DWORD *)id v14 = 138412290;
    uint64_t v18 = a2;
    id v15 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v17 = v11;

    a2 = v18;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "NearbyInvitationServiceHostConnection requestConnection with advertisement %@", v14, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(id, uint64_t, uint64_t, uint64_t))(**(void **)(v5
                                                                                + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                                  + 608))(v11, a2, a3, a4);
}

uint64_t @objc NearbyInvitationServiceHostConnection.requestConnection(with:localInvitation:response:)(void *a1, int a2, void *a3, void *a4, void *a5)
{
  return @objc NearbyInvitationServiceHostConnection.approve(pendingMember:response:completion:)(a1, a2, a3, a4, a5, (uint64_t)&unk_1000F9168, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned InvitationBlob?, @unowned NSError?) -> (), (void (*)(id, id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.requestConnection(with:localInvitation:response:));
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NearbyGroupConnectionInfo?, @unowned NSError?) -> ()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t NearbyInvitationServiceHostConnection.requestEndpointConnection(with:pseudonym:response:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)static Log.host);
  id v11 = a1;
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    *(_DWORD *)id v14 = 138412290;
    uint64_t v18 = a2;
    id v15 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v17 = v11;

    a2 = v18;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "NearbyInvitationServiceHostConnection requestConnectionEndpoint with advertisement %@", v14, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(id, uint64_t, uint64_t, uint64_t))(**(void **)(v5
                                                                                + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                                  + 616))(v11, a2, a3, a4);
}

uint64_t @objc NearbyInvitationServiceHostConnection.requestEndpointConnection(with:pseudonym:response:)(void *a1, int a2, void *a3, void *a4, void *a5)
{
  return @objc NearbyInvitationServiceHostConnection.approve(pendingMember:response:completion:)(a1, a2, a3, a4, a5, (uint64_t)&unk_1000F9140, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> (), (void (*)(id, id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.requestEndpointConnection(with:pseudonym:response:));
}

uint64_t @objc NearbyInvitationServiceHostConnection.approve(pendingMember:response:completion:)(void *a1, int a2, void *a3, void *a4, void *aBlock, uint64_t a6, uint64_t a7, void (*a8)(id, id, uint64_t, uint64_t))
{
  os_log_type_t v13 = _Block_copy(aBlock);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  id v15 = a3;
  id v16 = a4;
  id v17 = a1;
  a8(v15, v16, a7, v14);

  return swift_release();
}

uint64_t NearbyInvitationServiceHostConnection.approveConnectionRequest(_:localInvitation:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  id v9 = a1;
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    uint64_t v17 = v4;
    uint64_t v14 = a2;
    id v15 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v13 = v9;

    a2 = v14;
    uint64_t v4 = v17;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "NearbyInvitationServiceHostConnection approveConnectionRequest with advertisement %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(id, uint64_t, uint64_t))(**(void **)(v4
                                                                       + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                         + 624))(v9, a2, a3);
}

void @objc NearbyInvitationServiceHostConnection.approveConnectionRequest(_:localInvitation:)(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v11 = a1;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  NearbyInvitationServiceHostConnection.approveConnectionRequest(_:localInvitation:)(v6, v8, v10);
  outlined consume of Data._Representation(v8, v10);
}

uint64_t NearbyInvitationServiceHostConnection.denyConnectionRequest(_:)(void *a1)
{
  uint64_t v2 = v1;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  __swift_project_value_buffer(v4, (uint64_t)static Log.host);
  id v5 = a1;
  id v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    unint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *unint64_t v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "NearbyInvitationServiceHostConnection denyConnectionRequest with advertisement %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(id))(**(void **)(v2
                                                     + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                       + 632))(v5);
}

void @objc NearbyInvitationServiceHostConnection.denyConnectionRequest(_:)(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  NearbyInvitationServiceHostConnection.denyConnectionRequest(_:)(v4);
}

unint64_t lazy protocol witness table accessor for type UUID and conformance UUID()
{
  unint64_t result = lazy protocol witness table cache variable for type UUID and conformance UUID;
  if (!lazy protocol witness table cache variable for type UUID and conformance UUID)
  {
    type metadata accessor for UUID();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID);
  }
  return result;
}

uint64_t type metadata accessor for NearbyInvitationServiceHostConnection()
{
  uint64_t result = type metadata singleton initialization cache for NearbyInvitationServiceHostConnection;
  if (!type metadata singleton initialization cache for NearbyInvitationServiceHostConnection) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t type metadata completion function for NearbyInvitationServiceHostConnection()
{
  return swift_initClassMetadata2();
}

uint64_t ObjC metadata update function for NearbyInvitationServiceHostConnection()
{
  return type metadata accessor for NearbyInvitationServiceHostConnection();
}

uint64_t sub_1000AEA1C()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSUUID?, @unowned NSError?) -> ()(uint64_t a1, uint64_t a2)
{
  thunk for @escaping @callee_unowned @convention(block) (@unowned NSUUID?, @unowned NSError?) -> ()(a1, a2, *(void *)(v2 + 16));
}

uint64_t outlined init with copy of UUID?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NearbyGroupConnectionInfo?, @unowned NSError?) -> ()(uint64_t a1, uint64_t a2)
{
  thunk for @escaping @callee_unowned @convention(block) (@unowned NearbyGroupConnectionInfo?, @unowned NSError?) -> ()(a1, a2, *(void *)(v2 + 16));
}

uint64_t _PublisherElements.makeAsyncIterator()()
{
  return specialized _PublisherElements.Iterator.init(_:)();
}

uint64_t _PublisherElements.Iterator.next()(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return _swift_task_switch(_PublisherElements.Iterator.next(), 0, 0);
}

uint64_t _PublisherElements.Iterator.next()()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = (uint64_t *)v0[4];
  uint64_t v3 = *v2;
  v0[5] = *v2;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[6] = v4;
  v4[2] = *(void *)(v1 + 16);
  v4[3] = *(void *)(v1 + 24);
  v4[4] = v2;
  unint64_t v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)&async function pointer to withTaskCancellationHandler<A>(handler:operation:)
                                                                                    + async function pointer to withTaskCancellationHandler<A>(handler:operation:));
  swift_retain();
  id v5 = (void *)swift_task_alloc();
  v0[7] = v5;
  swift_getAssociatedTypeWitness();
  uint64_t v6 = type metadata accessor for Optional();
  void *v5 = v0;
  v5[1] = _PublisherElements.Iterator.next();
  uint64_t v7 = v0[2];
  return v9(v7, (uint64_t)partial apply for closure #1 in _PublisherElements.Iterator.next(), v3, (uint64_t)&async function pointer to partial apply for closure #2 in _PublisherElements.Iterator.next(), (uint64_t)v4, v6);
}

{
  uint64_t *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t _PublisherElements.Iterator.Inner.lock.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t _PublisherElements.Iterator.Inner.state.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  uint64_t v3 = type metadata accessor for _PublisherElements.Iterator.Inner.State();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(a1, v1 + 32, v3);
}

uint64_t _PublisherElements.Iterator.Inner.state.setter(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = type metadata accessor for _PublisherElements.Iterator.Inner.State();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40))(v1 + 32, a1, v3);
  return swift_endAccess();
}

uint64_t _PublisherElements.Iterator.Inner.pendingDemand.getter()
{
  swift_beginAccess();
  return *(void *)(v0 + 72);
}

uint64_t _PublisherElements.Iterator.Inner.pendingDemand.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 72) = a1;
  return result;
}

uint64_t (*_PublisherElements.Iterator.Inner.pendingDemand.modify())()
{
  return NearbyInvitationAdvertiser.listeners.modify;
}

uint64_t _PublisherElements.Iterator.Inner.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  _PublisherElements.Iterator.Inner.init()();
  return v0;
}

uint64_t _PublisherElements.Iterator.Inner.init()()
{
  *(void *)(v0 + 16) = swift_slowAlloc();
  swift_getAssociatedTypeWitness();
  type metadata accessor for Optional();
  type metadata accessor for UnsafeContinuation();
  *(void *)(v0 + 24) = Array.init()();
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(void *)(v0 + 64) = 0;
  *(void *)(v0 + 72) = static Subscribers.Demand.none.getter();
  **(_DWORD **)(v0 + 16) = 0;
  return v0;
}

uint64_t _PublisherElements.Iterator.Inner.deinit()
{
  swift_slowDealloc();
  swift_bridgeObjectRelease();
  uint64_t v1 = type metadata accessor for _PublisherElements.Iterator.Inner.State();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v1 - 8) + 8))(v0 + 32, v1);
  return v0;
}

uint64_t _PublisherElements.Iterator.Inner.__deallocating_deinit()
{
  _PublisherElements.Iterator.Inner.deinit();
  return swift_deallocClassInstance();
}

uint64_t _PublisherElements.Iterator.Inner.receive(subscription:)(void *a1)
{
  uint64_t v3 = *(os_unfair_lock_s **)(v1 + 16);
  os_unfair_lock_lock(v3);
  swift_beginAccess();
  uint64_t v4 = type metadata accessor for _PublisherElements.Iterator.Inner.State();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v10, v1 + 32, v4);
  uint64_t v6 = v11;
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v10, v4);
  if (v6)
  {
    os_unfair_lock_unlock(v3);
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    return dispatch thunk of Cancellable.cancel()();
  }
  else
  {
    outlined init with copy of PseudonymProtocol((uint64_t)a1, (uint64_t)v10);
    swift_beginAccess();
    (*(void (**)(uint64_t, unsigned char *, uint64_t))(v5 + 40))(v1 + 32, v10, v4);
    swift_endAccess();
    swift_beginAccess();
    unint64_t v8 = *(void *)(v1 + 72);
    *(void *)(v1 + 72) = static Subscribers.Demand.none.getter();
    os_unfair_lock_unlock(v3);
    unint64_t v9 = static Subscribers.Demand.none.getter();
    static Subscribers.Demand.unlimited.getter();
    if ((static Subscribers.Demand.== infix(_:_:)() & 1) == 0
      || (static Subscribers.Demand.unlimited.getter(),
          uint64_t result = static Subscribers.Demand.== infix(_:_:)(),
          (result & 1) == 0))
    {
      static Subscribers.Demand.unlimited.getter();
      if ((static Subscribers.Demand.== infix(_:_:)() & 1) != 0
        || (static Subscribers.Demand.unlimited.getter(),
            uint64_t result = static Subscribers.Demand.== infix(_:_:)(),
            (result & 1) == 0)
        && v9 < v8)
      {
        __swift_project_boxed_opaque_existential_1(a1, a1[3]);
        return dispatch thunk of Subscription.request(_:)();
      }
    }
  }
  return result;
}

uint64_t _PublisherElements.Iterator.Inner.receive(_:)(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v4 = type metadata accessor for Optional();
  uint64_t v22 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v20 - v5;
  uint64_t v7 = *(os_unfair_lock_s **)(v1 + 16);
  os_unfair_lock_lock(v7);
  swift_beginAccess();
  uint64_t v8 = type metadata accessor for _PublisherElements.Iterator.Inner.State();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v9 + 16))(v25, v1 + 32, v8);
  uint64_t v10 = (uint64_t *)(v1 + 24);
  if (v26 >= 2)
  {
LABEL_11:
    swift_beginAccess();
    uint64_t v24 = *v10;
    type metadata accessor for UnsafeContinuation();
    type metadata accessor for Array();
    swift_getWitnessTable();
    if (Collection.isEmpty.getter())
    {
      os_unfair_lock_unlock(v7);
    }
    else
    {
      swift_beginAccess();
      swift_getWitnessTable();
      RangeReplaceableCollection.removeFirst()();
      swift_endAccess();
      uint64_t v15 = v23;
      os_unfair_lock_unlock(v7);
      uint64_t v16 = v9;
      uint64_t v17 = *(void *)(AssociatedTypeWitness - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v6, a1, AssociatedTypeWitness);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v6, 0, 1, AssociatedTypeWitness);
      uint64_t v9 = v16;
      (*(void (**)(void, char *, uint64_t))(v22 + 32))(*(void *)(*(void *)(v15 + 64) + 40), v6, v4);
      swift_continuation_resume();
    }
  }
  else
  {
    uint64_t v20 = v9;
    uint64_t v21 = v8;
    swift_beginAccess();
    a1 = *v10;
    swift_beginAccess();
    type metadata accessor for UnsafeContinuation();
    type metadata accessor for Array();
    swift_bridgeObjectRetain();
    Array.removeAll(keepingCapacity:)(0);
    swift_endAccess();
    os_unfair_lock_unlock(v7);
    if (Array.endIndex.getter())
    {
      uint64_t v10 = (uint64_t *)(AssociatedTypeWitness - 8);
      uint64_t v9 = v22 + 32;
      uint64_t v8 = 4;
      do
      {
        uint64_t v11 = v8 - 4;
        Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
        Array._checkSubscript(_:wasNativeTypeChecked:)();
        if (IsNativeType)
        {
          uint64_t v13 = *(void *)(a1 + 8 * v8);
          BOOL v14 = __OFADD__(v11, 1);
          uint64_t v7 = (os_unfair_lock_s *)(v8 - 3);
          if (v14) {
            goto LABEL_10;
          }
        }
        else
        {
          uint64_t v13 = _ArrayBuffer._getElementSlowPath(_:)();
          swift_unknownObjectRelease();
          BOOL v14 = __OFADD__(v11, 1);
          uint64_t v7 = (os_unfair_lock_s *)(v8 - 3);
          if (v14)
          {
LABEL_10:
            __break(1u);
            goto LABEL_11;
          }
        }
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(v6, 1, 1, AssociatedTypeWitness);
        (*(void (**)(void, char *, uint64_t))v9)(*(void *)(*(void *)(v13 + 64) + 40), v6, v4);
        swift_continuation_resume();
        ++v8;
      }
      while (v7 != (os_unfair_lock_s *)Array.endIndex.getter());
    }
    swift_bridgeObjectRelease();
    uint64_t v9 = v20;
    uint64_t v8 = v21;
  }
  uint64_t v18 = static Subscribers.Demand.none.getter();
  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v25, v8);
  return v18;
}

Swift::Void __swiftcall _PublisherElements.Iterator.Inner.cancel()()
{
  uint64_t v51 = *(void *)(*v0 + 88);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = type metadata accessor for Optional();
  uint64_t v48 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v42 - v3;
  os_unfair_lock_t v49 = (os_unfair_lock_t)v0[2];
  os_unfair_lock_lock(v49);
  swift_beginAccess();
  uint64_t v5 = v0[3];
  swift_beginAccess();
  uint64_t v52 = v2;
  type metadata accessor for UnsafeContinuation();
  type metadata accessor for Array();
  swift_bridgeObjectRetain();
  Array.removeAll(keepingCapacity:)(0);
  swift_endAccess();
  swift_beginAccess();
  uint64_t v6 = type metadata accessor for _PublisherElements.Iterator.Inner.State();
  uint64_t v51 = *(void *)(v6 - 8);
  uint64_t v7 = *(void (**)(long long *, void *, uint64_t))(v51 + 16);
  v7(&v63, v0 + 4, v6);
  v50 = v0 + 4;
  if (v64 >= 2)
  {
    outlined init with take of PseudonymProtocol(&v63, (uint64_t)v61);
    if (one-time initialization token for default != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    __swift_project_value_buffer(v18, (uint64_t)static Log.default);
    outlined init with copy of PseudonymProtocol((uint64_t)v61, (uint64_t)v59);
    uint64_t v19 = Logger.logObject.getter();
    int v20 = static os_log_type_t.default.getter();
    v46 = v19;
    if (os_log_type_enabled(v19, (os_log_type_t)v20))
    {
      LODWORD(v45) = v20;
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      uint64_t v58 = v22;
      *(_DWORD *)uint64_t v21 = 136315138;
      outlined init with copy of PseudonymProtocol((uint64_t)v59, (uint64_t)v57);
      outlined init with copy of Subscription?((uint64_t)v57, (uint64_t)&v55);
      uint64_t v47 = v6;
      uint64_t v44 = v22;
      if (v56)
      {
        outlined init with take of PseudonymProtocol(&v55, (uint64_t)v54);
        outlined init with copy of PseudonymProtocol((uint64_t)v54, (uint64_t)&v53);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Subscription);
        uint64_t v23 = String.init<A>(reflecting:)();
        unint64_t v25 = v24;
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v54);
      }
      else
      {
        unint64_t v25 = 0xE300000000000000;
        uint64_t v23 = 7104878;
      }
      outlined destroy of Subscription?((uint64_t)v57);
      v57[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v23, v25, &v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v59);
      uint64_t v34 = v46;
      _os_log_impl((void *)&_mh_execute_header, v46, (os_log_type_t)v45, "Handling cancellation by terminating upstream subscription: %s", v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v6 = v47;
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v59);
    }
    uint64_t v35 = v50;
    memset(v59, 0, sizeof(v59));
    long long v60 = xmmword_1000D77C0;
    swift_beginAccess();
    (*(void (**)(void *, uint64_t *, uint64_t))(v51 + 40))(v35, v59, v6);
    swift_endAccess();
    os_unfair_lock_unlock(v49);
    __swift_project_boxed_opaque_existential_1(v61, v62);
    dispatch thunk of Cancellable.cancel()();
    if (Array.endIndex.getter())
    {
      uint64_t v36 = (void (**)(void, char *, uint64_t))(v48 + 32);
      uint64_t v37 = 4;
      do
      {
        uint64_t v38 = v37 - 4;
        Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
        Array._checkSubscript(_:wasNativeTypeChecked:)();
        if (IsNativeType)
        {
          uint64_t v40 = *(void *)(v5 + 8 * v37);
          BOOL v32 = __OFADD__(v38, 1);
          uint64_t v41 = v37 - 3;
          if (v32) {
            goto LABEL_33;
          }
        }
        else
        {
          uint64_t v40 = _ArrayBuffer._getElementSlowPath(_:)();
          swift_unknownObjectRelease();
          BOOL v32 = __OFADD__(v38, 1);
          uint64_t v41 = v37 - 3;
          if (v32)
          {
LABEL_33:
            __break(1u);
            break;
          }
        }
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(v4, 1, 1, AssociatedTypeWitness);
        (*v36)(*(void *)(*(void *)(v40 + 64) + 40), v4, v52);
        swift_continuation_resume();
        ++v37;
      }
      while (v41 != Array.endIndex.getter());
    }
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v61);
  }
  else
  {
    if (one-time initialization token for default != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    __swift_project_value_buffer(v8, (uint64_t)static Log.default);
    swift_retain_n();
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    LODWORD(v46) = v10;
    if (os_log_type_enabled(v9, v10))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      v59[0] = v44;
      os_log_t v43 = v9;
      uint64_t v11 = v45;
      *(_DWORD *)v45 = 136315138;
      v42 = v11 + 4;
      v7((long long *)v61, v50, v6);
      uint64_t v12 = >> prefix<A>(_:)((uint64_t)v61, v6);
      unint64_t v14 = v13;
      uint64_t v15 = type metadata accessor for Optional();
      (*(void (**)(void *, uint64_t))(*(void *)(v15 - 8) + 8))(v61, v15);
      v61[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v12, v14, v59);
      uint64_t v16 = v50;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      os_log_t v17 = v43;
      _os_log_impl((void *)&_mh_execute_header, v43, (os_log_type_t)v46, "Terminating sequence from state: %s", v45, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
      uint64_t v16 = v50;
    }
    memset(v61, 0, sizeof(v61));
    long long v62 = xmmword_1000D77C0;
    swift_beginAccess();
    unint64_t v26 = *(void (**)(void *, void *, uint64_t))(v51 + 40);
    uint64_t v47 = v6;
    v26(v16, v61, v6);
    swift_endAccess();
    os_unfair_lock_unlock(v49);
    if (Array.endIndex.getter())
    {
      uint64_t v27 = (void (**)(void, char *, uint64_t))(v48 + 32);
      uint64_t v28 = 4;
      do
      {
        uint64_t v29 = v28 - 4;
        Swift::Bool v30 = Array._hoistableIsNativeTypeChecked()();
        Array._checkSubscript(_:wasNativeTypeChecked:)();
        if (v30)
        {
          uint64_t v31 = *(void *)(v5 + 8 * v28);
          BOOL v32 = __OFADD__(v29, 1);
          uint64_t v33 = v28 - 3;
          if (v32) {
            goto LABEL_20;
          }
        }
        else
        {
          uint64_t v31 = _ArrayBuffer._getElementSlowPath(_:)();
          swift_unknownObjectRelease();
          BOOL v32 = __OFADD__(v29, 1);
          uint64_t v33 = v28 - 3;
          if (v32)
          {
LABEL_20:
            __break(1u);
            break;
          }
        }
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(v4, 1, 1, AssociatedTypeWitness);
        (*v27)(*(void *)(*(void *)(v31 + 64) + 40), v4, v52);
        swift_continuation_resume();
        ++v28;
      }
      while (v33 != Array.endIndex.getter());
    }
    swift_bridgeObjectRelease();
    (*(void (**)(long long *, uint64_t))(v51 + 8))(&v63, v47);
  }
}

uint64_t _PublisherElements.Iterator.Inner.next()(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  return _swift_task_switch(_PublisherElements.Iterator.Inner.next(), 0, 0);
}

uint64_t _PublisherElements.Iterator.Inner.next()()
{
  uint64_t v6 = (char *)&async function pointer to withUnsafeContinuation<A>(isolation:_:)
     + async function pointer to withUnsafeContinuation<A>(isolation:_:);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  swift_getAssociatedTypeWitness();
  uint64_t v2 = type metadata accessor for Optional();
  *uint64_t v1 = v0;
  v1[1] = _PublisherElements.Iterator.Inner.next();
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  return ((uint64_t (*)(uint64_t, void, void, void (*)(uint64_t), uint64_t, uint64_t))v6)(v3, 0, 0, partial apply for closure #1 in _PublisherElements.Iterator.Inner.next(), v4, v2);
}

{
  uint64_t *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void closure #1 in _PublisherElements.Iterator.Inner.next()(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = type metadata accessor for Optional();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v14 - v7;
  uint64_t v9 = *(os_unfair_lock_s **)(a2 + 16);
  os_unfair_lock_lock(v9);
  swift_beginAccess();
  uint64_t v10 = type metadata accessor for _PublisherElements.Iterator.Inner.State();
  (*(void (**)(long long *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16))(&v16, a2 + 32, v10);
  if (!v17)
  {
    v14[1] = a1;
    swift_beginAccess();
    type metadata accessor for UnsafeContinuation();
    type metadata accessor for Array();
    Array.append(_:)();
    swift_endAccess();
    uint64_t v11 = (uint64_t *)(a2 + 72);
    swift_beginAccess();
    uint64_t v12 = *(void *)(a2 + 72);
    static Subscribers.Demand.unlimited.getter();
    if (static Subscribers.Demand.== infix(_:_:)()) {
      goto LABEL_8;
    }
    if (v12 < 0)
    {
      __break(1u);
      return;
    }
    uint64_t v13 = v12 + 1;
    if (__OFADD__(v12, 1)) {
LABEL_8:
    }
      uint64_t v13 = static Subscribers.Demand.unlimited.getter();
    *uint64_t v11 = v13;
    swift_endAccess();
    os_unfair_lock_unlock(v9);
    return;
  }
  if (v17 == 1)
  {
    os_unfair_lock_unlock(v9);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(v8, 1, 1, AssociatedTypeWitness);
    (*(void (**)(void, char *, uint64_t))(v6 + 32))(*(void *)(*(void *)(a1 + 64) + 40), v8, v5);
    swift_continuation_resume();
  }
  else
  {
    outlined init with take of PseudonymProtocol(&v16, (uint64_t)v15);
    v14[4] = a1;
    swift_beginAccess();
    type metadata accessor for UnsafeContinuation();
    type metadata accessor for Array();
    Array.append(_:)();
    swift_endAccess();
    os_unfair_lock_unlock(v9);
    __swift_project_boxed_opaque_existential_1(v15, v15[3]);
    dispatch thunk of Subscription.request(_:)();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v15);
  }
}

uint64_t withUnsafeContinuation<A>(isolation:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[11] = a4;
  v5[12] = a5;
  v5[10] = a1;
  if (a2)
  {
    swift_getObjectType();
    uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  return _swift_task_switch(withUnsafeContinuation<A>(isolation:_:), v6, v8);
}

uint64_t withUnsafeContinuation<A>(isolation:_:)()
{
  uint64_t v1 = (void (*)(uint64_t))v0[11];
  uint64_t v2 = v0[10];
  v0[2] = v0;
  v0[7] = v2;
  v0[3] = withUnsafeContinuation<A>(isolation:_:);
  uint64_t v3 = swift_continuation_init();
  v1(v3);
  return _swift_continuation_await(v0 + 2);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  uint64_t v1 = *(uint64_t (**)(void))(*(void *)v0 + 8);
  return v1();
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance _PublisherElements<A>.Iterator.Inner(void *a1)
{
  return _PublisherElements.Iterator.Inner.receive(subscription:)(a1);
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance _PublisherElements<A>.Iterator.Inner(uint64_t a1)
{
  return _PublisherElements.Iterator.Inner.receive(_:)(a1);
}

uint64_t protocol witness for Subscriber.receive(completion:) in conformance _PublisherElements<A>.Iterator.Inner()
{
  return specialized _PublisherElements.Iterator.Inner.receive(completion:)();
}

void protocol witness for Cancellable.cancel() in conformance _PublisherElements<A>.Iterator.Inner()
{
}

uint64_t protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance _PublisherElements<A>.Iterator.Inner()
{
  return CustomCombineIdentifierConvertible<>.combineIdentifier.getter();
}

uint64_t _PublisherElements.Iterator.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = specialized _PublisherElements.Iterator.init(_:)();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

uint64_t closure #2 in _PublisherElements.Iterator.next()(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return _swift_task_switch(closure #2 in _PublisherElements.Iterator.next(), 0, 0);
}

uint64_t closure #2 in _PublisherElements.Iterator.next()()
{
  uint64_t v1 = **(void ***)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  swift_retain();
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v2;
  *uint64_t v2 = v0;
  v2[1] = closure #2 in _PublisherElements.Iterator.next();
  v2[2] = *(void *)(v0 + 16);
  v2[3] = v1;
  v2[4] = *v1;
  return _swift_task_switch(_PublisherElements.Iterator.Inner.next(), 0, 0);
}

{
  uint64_t *v0;
  uint64_t (*v1)(void);
  uint64_t v3;
  uint64_t v4;

  uint64_t v3 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t withTaskCancellationHandler<A>(handler:operation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v15 = (char *)&async function pointer to withTaskCancellationHandler<A>(operation:onCancel:isolation:)
      + async function pointer to withTaskCancellationHandler<A>(operation:onCancel:isolation:);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  void *v13 = v6;
  v13[1] = partial apply for closure #1 in NearbyInvitationAdvertiser.stopAdvertising();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))v15)(a1, a4, a5, a2, a3, 0, 0, a6);
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance _PublisherElements<A>.Iterator(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  void *v6 = v3;
  v6[3] = a2;
  v6[4] = v2;
  v6[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_;
  v6[2] = a1;
  return _swift_task_switch(_PublisherElements.Iterator.next(), 0, 0);
}

uint64_t _s44com_apple_SharePlay_NearbyInvitationsService18_PublisherElementsV8IteratorVyx_GScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v12;
  void *v12 = v6;
  v12[1] = _s44com_apple_SharePlay_NearbyInvitationsService18_PublisherElementsV8IteratorVyx_GScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  return __sScIsE4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKF(a1, a2, a3, a5, a6);
}

uint64_t _s44com_apple_SharePlay_NearbyInvitationsService18_PublisherElementsV8IteratorVyx_GScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance _PublisherElements<A>@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = _PublisherElements.makeAsyncIterator()();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8))(v2, a1);
  *a2 = v5;
  return result;
}

uint64_t withTaskCancellationHandler<A>(operation:onCancel:isolation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v17;
  *uint64_t v17 = v8;
  v17[1] = partial apply for closure #1 in NearbyInvitationsAdvertiser.start();
  return withTaskCancellationHandler<A>(operation:onCancel:isolation:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t specialized _PublisherElements.Iterator.init(_:)()
{
  type metadata accessor for _PublisherElements.Iterator.Inner();
  uint64_t v0 = swift_allocObject();
  _PublisherElements.Iterator.Inner.init()();
  swift_getWitnessTable();
  Publisher.subscribe<A>(_:)();
  return v0;
}

uint64_t partial apply for closure #2 in _PublisherElements.Iterator.next()(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[2] = a1;
  v5[3] = v4;
  v5[1] = partial apply for closure #1 in NearbyInvitationAdvertiser.stopAdvertising();
  return _swift_task_switch(closure #2 in _PublisherElements.Iterator.next(), 0, 0);
}

uint64_t type metadata accessor for _PublisherElements.Iterator.Inner.State()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t specialized _PublisherElements.Iterator.Inner.receive(completion:)()
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v2 = type metadata accessor for Optional();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = &v17[-v4];
  uint64_t v6 = *(os_unfair_lock_s **)(v0 + 16);
  os_unfair_lock_lock(v6);
  memset(v18, 0, sizeof(v18));
  long long v19 = xmmword_1000D77C0;
  swift_beginAccess();
  uint64_t v7 = type metadata accessor for _PublisherElements.Iterator.Inner.State();
  (*(void (**)(uint64_t, void *, uint64_t))(*(void *)(v7 - 8) + 40))(v0 + 32, v18, v7);
  swift_endAccess();
  swift_beginAccess();
  uint64_t v8 = *(void *)(v0 + 24);
  swift_beginAccess();
  type metadata accessor for UnsafeContinuation();
  type metadata accessor for Array();
  swift_bridgeObjectRetain();
  Array.removeAll(keepingCapacity:)(0);
  swift_endAccess();
  os_unfair_lock_unlock(v6);
  if (Array.endIndex.getter())
  {
    uint64_t v9 = (void (**)(void, unsigned char *, uint64_t))(v3 + 32);
    uint64_t v10 = 4;
    do
    {
      uint64_t v11 = v10 - 4;
      Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
      Array._checkSubscript(_:wasNativeTypeChecked:)();
      if (IsNativeType)
      {
        uint64_t v13 = *(void *)(v8 + 8 * v10);
        BOOL v14 = __OFADD__(v11, 1);
        uint64_t v15 = v10 - 3;
        if (v14) {
          goto LABEL_9;
        }
      }
      else
      {
        uint64_t v13 = _ArrayBuffer._getElementSlowPath(_:)();
        swift_unknownObjectRelease();
        BOOL v14 = __OFADD__(v11, 1);
        uint64_t v15 = v10 - 3;
        if (v14)
        {
LABEL_9:
          __break(1u);
          return swift_bridgeObjectRelease();
        }
      }
      (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56))(v5, 1, 1, AssociatedTypeWitness);
      (*v9)(*(void *)(*(void *)(v13 + 64) + 40), v5, v2);
      swift_continuation_resume();
      ++v10;
    }
    while (v15 != Array.endIndex.getter());
  }
  return swift_bridgeObjectRelease();
}

uint64_t outlined init with copy of Subscription?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Subscription?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Subscription?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Subscription?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void partial apply for closure #1 in _PublisherElements.Iterator.Inner.next()(uint64_t a1)
{
  closure #1 in _PublisherElements.Iterator.Inner.next()(a1, v1);
}

uint64_t base witness table accessor for CustomCombineIdentifierConvertible in _PublisherElements<A>.Iterator.Inner()
{
  return swift_getWitnessTable();
}

uint64_t associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in _PublisherElements<A>()
{
  return swift_getWitnessTable();
}

uint64_t type metadata completion function for _PublisherElements()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for _PublisherElements(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(void *)(v4 + 64);
  if (!a2) {
    return 0;
  }
  unsigned int v7 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_19;
  }
  char v8 = 8 * v6;
  if (v6 <= 3)
  {
    unsigned int v10 = ((v7 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)((char *)a1 + v6);
      if (!v9) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)((char *)a1 + v6);
      if (!*(unsigned __int16 *)((char *)a1 + v6)) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_19:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0;
    }
  }
  int v9 = *((unsigned __int8 *)a1 + v6);
  if (!*((unsigned char *)a1 + v6)) {
    goto LABEL_19;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (v6 > 3) {
    int v11 = 0;
  }
  if (v6)
  {
    if (v6 > 3) {
      LODWORD(v6) = 4;
    }
    switch((int)v6)
    {
      case 2:
        LODWORD(v6) = *a1;
        break;
      case 3:
        LODWORD(v6) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v6) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v6) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v5 + (v6 | v11) + 1;
}

void storeEnumTagSinglePayload for _PublisherElements(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v14 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v14))
      {
        int v11 = 4;
      }
      else if (v14 >= 0x100)
      {
        int v11 = 2;
      }
      else
      {
        int v11 = v14 > 1;
      }
    }
    else
    {
      int v11 = 1;
    }
  }
  else
  {
    int v11 = 0;
  }
  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      int v13 = (v12 >> (8 * v8)) + 1;
      if (v8)
      {
        int v15 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if (v8 == 3)
        {
          *(_WORD *)a1 = v15;
          a1[2] = BYTE2(v15);
        }
        else if (v8 == 2)
        {
          *(_WORD *)a1 = v15;
        }
        else
        {
          *a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v12;
      int v13 = 1;
    }
    switch(v11)
    {
      case 1:
        a1[v8] = v13;
        return;
      case 2:
        *(_WORD *)&a1[v8] = v13;
        return;
      case 3:
        goto LABEL_34;
      case 4:
        *(_DWORD *)&a1[v8] = v13;
        return;
      default:
        return;
    }
  }
  switch(v11)
  {
    case 1:
      a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 2:
      *(_WORD *)&a1[v8] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_21;
    case 3:
LABEL_34:
      __break(1u);
      JUMPOUT(0x1000B1B58);
    case 4:
      *(_DWORD *)&a1[v8] = 0;
      goto LABEL_20;
    default:
LABEL_20:
      if (a2)
      {
LABEL_21:
        uint64_t v16 = *(void (**)(void))(v6 + 56);
        v16();
      }
      return;
  }
}

uint64_t type metadata accessor for _PublisherElements()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata accessor for _PublisherElements.Iterator()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t type metadata completion function for _PublisherElements.Iterator.Inner()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for _PublisherElements.Iterator.Inner()
{
  return __swift_instantiateGenericMetadata();
}

uint64_t destroy for _PublisherElements.Iterator.Inner.State(uint64_t a1)
{
  if (*(void *)(a1 + 24) >= 0xFFFFFFFFuLL) {
    return __swift_destroy_boxed_opaque_existential_0Tm(a1);
  }
  return a1;
}

uint64_t initializeWithCopy for _PublisherElements.Iterator.Inner.State(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 24);
  if (v3 < 0xFFFFFFFF)
  {
    long long v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }
  else
  {
    uint64_t v4 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v3;
    *(void *)(a1 + 32) = v4;
    (**(void (***)(uint64_t))(v3 - 8))(a1);
  }
  return a1;
}

uint64_t assignWithCopy for _PublisherElements.Iterator.Inner.State(uint64_t a1, long long *a2)
{
  unint64_t v4 = *((void *)a2 + 3);
  if (*(void *)(a1 + 24) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *(void *)(a1 + 24) = v4;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      (**(void (***)(uint64_t, long long *))(v4 - 8))(a1, a2);
      return a1;
    }
LABEL_7:
    long long v5 = *a2;
    long long v6 = a2[1];
    *(void *)(a1 + 32) = *((void *)a2 + 4);
    *(_OWORD *)a1 = v5;
    *(_OWORD *)(a1 + 16) = v6;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    __swift_destroy_boxed_opaque_existential_0Tm(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    unint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v10 = *(void *)(v4 - 8);
      if ((*(unsigned char *)(v10 + 82) & 2) != 0)
      {
        uint64_t v12 = *a2;
        swift_retain();
        uint64_t result = (uint64_t *)swift_release();
        *unint64_t v3 = v12;
      }
      else
      {
        int v11 = *(uint64_t (**)(void))(v10 + 24);
        return (uint64_t *)v11();
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      uint64_t v8 = v7;
      int v9 = *(_DWORD *)(v7 + 80);
      if ((*(unsigned char *)(v6 + 82) & 2) != 0)
      {
        if ((v9 & 0x20000) != 0)
        {
          *uint64_t result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(unsigned char *, uint64_t *, uint64_t))(v6 + 32))(v13, result, v4);
        if ((v9 & 0x20000) != 0)
        {
          *unint64_t v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v13, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for _PublisherElements.Iterator.Inner.State(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24) >= 0xFFFFFFFFuLL) {
    __swift_destroy_boxed_opaque_existential_0Tm(a1);
  }
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for _PublisherElements.Iterator.Inner.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for _PublisherElements.Iterator.Inner.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)(result + 32) = 0;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2 + 1;
    }
  }
  return result;
}

uint64_t getEnumTag for _PublisherElements.Iterator.Inner.State(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 24);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

double destructiveInjectEnumTag for _PublisherElements.Iterator.Inner.State(uint64_t a1, int a2)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
  }
  else if (a2)
  {
    *(void *)(a1 + 24) = (a2 - 1);
  }
  return result;
}

BOOL NearbyGroup_Member.hasTokenID.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for NearbyGroup_Member(0) + 24) + 8) != 0;
}

uint64_t type metadata accessor for NearbyGroup_Member(uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner(a1, (uint64_t *)&type metadata singleton initialization cache for NearbyGroup_Member);
}

uint64_t NearbyGroup_Member.tokenID.getter()
{
  unint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for NearbyGroup_Member(0) + 24));
  if (v1[1]) {
    uint64_t v2 = *v1;
  }
  else {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t NearbyGroup_Group.MemberAdded.member.setter(uint64_t a1)
{
  return NearbyGroup_Group.MemberAdded.member.setter(a1, type metadata accessor for NearbyGroup_Group.MemberAdded);
}

uint64_t type metadata accessor for NearbyGroup_Group.MemberAdded(uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner(a1, (uint64_t *)&type metadata singleton initialization cache for NearbyGroup_Group.MemberAdded);
}

uint64_t NearbyGroup_Group.MemberRemoved.member.setter(uint64_t a1)
{
  return NearbyGroup_Group.MemberAdded.member.setter(a1, type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

uint64_t NearbyGroup_Group.MemberAdded.member.setter(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 24);
  outlined destroy of Any?(v4, &demangling cache variable for type metadata for NearbyGroup_Member?);
  outlined init with take of NearbyGroup_Member(a1, v4, type metadata accessor for NearbyGroup_Member);
  uint64_t v5 = type metadata accessor for NearbyGroup_Member(0);
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  return v6(v4, 0, 1, v5);
}

uint64_t type metadata accessor for NearbyGroup_Group.MemberRemoved(uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner(a1, (uint64_t *)&type metadata singleton initialization cache for NearbyGroup_Group.MemberRemoved);
}

uint64_t NearbyGroup_Group.MemberAdded.member.getter@<X0>(void *a1@<X8>)
{
  return NearbyGroup_Group.MemberAdded.member.getter(type metadata accessor for NearbyGroup_Group.MemberAdded, a1);
}

uint64_t NearbyGroup_Group.MemberRemoved.member.getter@<X0>(void *a1@<X8>)
{
  return NearbyGroup_Group.MemberAdded.member.getter(type metadata accessor for NearbyGroup_Group.MemberRemoved, a1);
}

uint64_t NearbyGroup_Group.MemberAdded.member.getter@<X0>(uint64_t (*a1)(void)@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = a1(0);
  outlined init with copy of (String, Any)(v2 + *(int *)(v8 + 24), (uint64_t)v7, &demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v9 = type metadata accessor for NearbyGroup_Member(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48))(v7, 1, v9) != 1) {
    return outlined init with take of NearbyGroup_Member((uint64_t)v7, (uint64_t)a2, type metadata accessor for NearbyGroup_Member);
  }
  *a2 = 0;
  a2[1] = 0xE000000000000000;
  UnknownStorage.init()();
  uint64_t v10 = (void *)((char *)a2 + *(int *)(v9 + 24));
  void *v10 = 0;
  v10[1] = 0;
  return outlined destroy of Any?((uint64_t)v7, &demangling cache variable for type metadata for NearbyGroup_Member?);
}

uint64_t NearbyGroup_Member.init()@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  uint64_t v2 = type metadata accessor for NearbyGroup_Member(0);
  uint64_t result = UnknownStorage.init()();
  uint64_t v4 = (void *)((char *)a1 + *(int *)(v2 + 24));
  *uint64_t v4 = 0;
  v4[1] = 0;
  return result;
}

uint64_t NearbyGroup_Member.tokenID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for NearbyGroup_Member(0) + 24));
  uint64_t result = swift_bridgeObjectRelease();
  void *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t key path getter for NearbyGroup_Member.tokenID : NearbyGroup_Member@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  unint64_t v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for NearbyGroup_Member(0) + 24));
  unint64_t v4 = v3[1];
  if (v4)
  {
    uint64_t v5 = *v3;
    unint64_t v6 = v4;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0xE000000000000000;
  }
  *a2 = v5;
  a2[1] = v6;
  return swift_bridgeObjectRetain();
}

uint64_t key path setter for NearbyGroup_Member.tokenID : NearbyGroup_Member(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  unint64_t v4 = (void *)(a2 + *(int *)(type metadata accessor for NearbyGroup_Member(0) + 24));
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *unint64_t v4 = v3;
  v4[1] = v2;
  return result;
}

uint64_t (*NearbyGroup_Member.tokenID.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for NearbyGroup_Member(0) + 24);
  *(_DWORD *)(a1 + 24) = v3;
  unint64_t v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0xE000000000000000;
  }
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain();
  return NearbyProtoConnectionRequest.displayName.modify;
}

Swift::Void __swiftcall NearbyGroup_Member.clearTokenID()()
{
  uint64_t v1 = (void *)(v0 + *(int *)(type metadata accessor for NearbyGroup_Member(0) + 24));
  swift_bridgeObjectRelease();
  *uint64_t v1 = 0;
  v1[1] = 0;
}

uint64_t NearbyGroup_Member.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return NearbyGroup_Member.unknownFields.getter(type metadata accessor for NearbyGroup_Member, a1);
}

uint64_t NearbyGroup_Member.unknownFields.setter(uint64_t a1)
{
  return NearbyGroup_Member.unknownFields.setter(a1, type metadata accessor for NearbyGroup_Member);
}

void (__swiftcall *NearbyGroup_Member.unknownFields.modify())()
{
  return Log.init();
}

uint64_t NearbyGroup_Group.event.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of (String, Any)(v1, a1, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
}

uint64_t NearbyGroup_Group.event.setter(uint64_t a1)
{
  return outlined assign with take of NearbyGroup_Group.OneOf_Event?(a1, v1);
}

uint64_t NearbyGroup_Group.initialize.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of (String, Any)(v2, (uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v7 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    outlined destroy of Any?((uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
LABEL_5:
    *(_OWORD *)a1 = xmmword_1000D7960;
    *(void *)(a1 + 16) = _swiftEmptyArrayStorage;
    type metadata accessor for NearbyGroup_Group.Initialization(0);
    return UnknownStorage.init()();
  }
  if (swift_getEnumCaseMultiPayload())
  {
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v6, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    goto LABEL_5;
  }
  return outlined init with take of NearbyGroup_Member((uint64_t)v6, a1, type metadata accessor for NearbyGroup_Group.Initialization);
}

uint64_t NearbyGroup_Group.initialize.setter(uint64_t a1)
{
  return NearbyGroup_Group.initialize.setter(a1, type metadata accessor for NearbyGroup_Group.Initialization);
}

uint64_t NearbyGroup_Group.Initialization.init()@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_1000D7960;
  *(void *)(a1 + 16) = _swiftEmptyArrayStorage;
  type metadata accessor for NearbyGroup_Group.Initialization(0);
  return UnknownStorage.init()();
}

uint64_t type metadata accessor for NearbyGroup_Group.OneOf_Event(uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner(a1, (uint64_t *)&type metadata singleton initialization cache for NearbyGroup_Group.OneOf_Event);
}

uint64_t type metadata accessor for NearbyGroup_Group.Initialization(uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner(a1, (uint64_t *)&type metadata singleton initialization cache for NearbyGroup_Group.Initialization);
}

uint64_t outlined init with take of NearbyGroup_Member(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void (*NearbyGroup_Group.initialize.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x30uLL);
  *a1 = v4;
  *uint64_t v4 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v6 = malloc(*(void *)(*(void *)(v5 - 8) + 64));
  v4[1] = v6;
  size_t v7 = *(void *)(*(void *)(type metadata accessor for NearbyGroup_Group.Initialization(0) - 8) + 64);
  v4[2] = malloc(v7);
  uint64_t v8 = malloc(v7);
  v4[3] = v8;
  outlined init with copy of (String, Any)(v2, (uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v9 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  v4[4] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v4[5] = v10;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) == 1)
  {
    outlined destroy of Any?((uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  }
  else
  {
    if (!swift_getEnumCaseMultiPayload())
    {
      outlined init with take of NearbyGroup_Member((uint64_t)v6, (uint64_t)v8, type metadata accessor for NearbyGroup_Group.Initialization);
      return NearbyGroup_Group.initialize.modify;
    }
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v6, type metadata accessor for NearbyGroup_Group.OneOf_Event);
  }
  *(_OWORD *)uint64_t v8 = xmmword_1000D7960;
  v8[2] = _swiftEmptyArrayStorage;
  UnknownStorage.init()();
  return NearbyGroup_Group.initialize.modify;
}

void NearbyGroup_Group.initialize.modify(uint64_t **a1, char a2)
{
}

uint64_t outlined destroy of NearbyGroup_Group.OneOf_Event(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t NearbyGroup_Group.memberAdded.getter@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of (String, Any)(v2, (uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v7 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    outlined destroy of Any?((uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1) {
      return outlined init with take of NearbyGroup_Member((uint64_t)v6, (uint64_t)a1, type metadata accessor for NearbyGroup_Group.MemberAdded);
    }
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v6, type metadata accessor for NearbyGroup_Group.OneOf_Event);
  }
  *a1 = xmmword_1000D7960;
  uint64_t v9 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
  UnknownStorage.init()();
  uint64_t v10 = (char *)a1 + *(int *)(v9 + 24);
  uint64_t v11 = type metadata accessor for NearbyGroup_Member(0);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
}

uint64_t NearbyGroup_Group.memberAdded.setter(uint64_t a1)
{
  return NearbyGroup_Group.initialize.setter(a1, type metadata accessor for NearbyGroup_Group.MemberAdded);
}

uint64_t NearbyGroup_Group.MemberAdded.init()@<X0>(_OWORD *a1@<X8>)
{
  return NearbyGroup_Group.MemberAdded.init()(type metadata accessor for NearbyGroup_Group.MemberAdded, a1);
}

void (*NearbyGroup_Group.memberAdded.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x30uLL);
  *a1 = v4;
  *uint64_t v4 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v6 = malloc(*(void *)(*(void *)(v5 - 8) + 64));
  v4[1] = v6;
  uint64_t v7 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
  size_t v8 = *(void *)(*(void *)(v7 - 8) + 64);
  v4[2] = malloc(v8);
  uint64_t v9 = malloc(v8);
  v4[3] = v9;
  outlined init with copy of (String, Any)(v2, (uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v10 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  v4[4] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v4[5] = v11;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) == 1)
  {
    outlined destroy of Any?((uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
LABEL_6:
    *uint64_t v9 = xmmword_1000D7960;
    UnknownStorage.init()();
    uint64_t v12 = (char *)v9 + *(int *)(v7 + 24);
    uint64_t v13 = type metadata accessor for NearbyGroup_Member(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
    return NearbyGroup_Group.memberAdded.modify;
  }
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v6, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    goto LABEL_6;
  }
  outlined init with take of NearbyGroup_Member((uint64_t)v6, (uint64_t)v9, type metadata accessor for NearbyGroup_Group.MemberAdded);
  return NearbyGroup_Group.memberAdded.modify;
}

void NearbyGroup_Group.memberAdded.modify(uint64_t **a1, char a2)
{
}

uint64_t outlined init with copy of NearbyGroup_Group.Initialization(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t NearbyGroup_Group.memberRemoved.getter@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of (String, Any)(v2, (uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v7 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    outlined destroy of Any?((uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 2) {
      return outlined init with take of NearbyGroup_Member((uint64_t)v6, (uint64_t)a1, type metadata accessor for NearbyGroup_Group.MemberRemoved);
    }
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v6, type metadata accessor for NearbyGroup_Group.OneOf_Event);
  }
  *a1 = xmmword_1000D7960;
  uint64_t v9 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
  UnknownStorage.init()();
  uint64_t v10 = (char *)a1 + *(int *)(v9 + 24);
  uint64_t v11 = type metadata accessor for NearbyGroup_Member(0);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
}

uint64_t NearbyGroup_Group.memberRemoved.setter(uint64_t a1)
{
  return NearbyGroup_Group.initialize.setter(a1, type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

uint64_t NearbyGroup_Group.MemberRemoved.init()@<X0>(_OWORD *a1@<X8>)
{
  return NearbyGroup_Group.MemberAdded.init()(type metadata accessor for NearbyGroup_Group.MemberRemoved, a1);
}

uint64_t NearbyGroup_Group.MemberAdded.init()@<X0>(uint64_t (*a1)(void)@<X0>, _OWORD *a2@<X8>)
{
  *a2 = xmmword_1000D7960;
  uint64_t v3 = a1(0);
  UnknownStorage.init()();
  uint64_t v4 = (char *)a2 + *(int *)(v3 + 24);
  uint64_t v5 = type metadata accessor for NearbyGroup_Member(0);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  return v6(v4, 1, 1, v5);
}

void (*NearbyGroup_Group.memberRemoved.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x30uLL);
  *a1 = v4;
  *uint64_t v4 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v6 = malloc(*(void *)(*(void *)(v5 - 8) + 64));
  v4[1] = v6;
  uint64_t v7 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
  size_t v8 = *(void *)(*(void *)(v7 - 8) + 64);
  v4[2] = malloc(v8);
  uint64_t v9 = malloc(v8);
  v4[3] = v9;
  outlined init with copy of (String, Any)(v2, (uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v10 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  v4[4] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v4[5] = v11;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) == 1)
  {
    outlined destroy of Any?((uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
LABEL_6:
    *uint64_t v9 = xmmword_1000D7960;
    UnknownStorage.init()();
    uint64_t v12 = (char *)v9 + *(int *)(v7 + 24);
    uint64_t v13 = type metadata accessor for NearbyGroup_Member(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
    return NearbyGroup_Group.memberRemoved.modify;
  }
  if (swift_getEnumCaseMultiPayload() != 2)
  {
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v6, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    goto LABEL_6;
  }
  outlined init with take of NearbyGroup_Member((uint64_t)v6, (uint64_t)v9, type metadata accessor for NearbyGroup_Group.MemberRemoved);
  return NearbyGroup_Group.memberRemoved.modify;
}

void NearbyGroup_Group.memberRemoved.modify(uint64_t **a1, char a2)
{
}

uint64_t NearbyGroup_Group.memberLeft.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of (String, Any)(v2, (uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v7 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    outlined destroy of Any?((uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 3) {
      return outlined init with take of NearbyGroup_Member((uint64_t)v6, a1, type metadata accessor for NearbyGroup_Group.MemberLeft);
    }
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v6, type metadata accessor for NearbyGroup_Group.OneOf_Event);
  }
  *(_OWORD *)a1 = xmmword_1000D7960;
  *(unsigned char *)(a1 + 16) = 0;
  type metadata accessor for NearbyGroup_Group.MemberLeft(0);
  return UnknownStorage.init()();
}

uint64_t key path setter for NearbyGroup_Group.initialize : NearbyGroup_Group(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(void))
{
  uint64_t v11 = a5(0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v16 - v12;
  outlined init with copy of NearbyGroup_Group.Initialization(a1, (uint64_t)&v16 - v12, a6);
  outlined destroy of Any?(a2, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  outlined init with take of NearbyGroup_Member((uint64_t)v13, a2, a7);
  uint64_t v14 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(a2, 0, 1, v14);
}

uint64_t NearbyGroup_Group.memberLeft.setter(uint64_t a1)
{
  return NearbyGroup_Group.initialize.setter(a1, type metadata accessor for NearbyGroup_Group.MemberLeft);
}

uint64_t NearbyGroup_Group.initialize.setter(uint64_t a1, uint64_t (*a2)(void))
{
  outlined destroy of Any?(v2, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  outlined init with take of NearbyGroup_Member(a1, v2, a2);
  uint64_t v5 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  swift_storeEnumTagMultiPayload();
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  return v6(v2, 0, 1, v5);
}

uint64_t NearbyGroup_Group.MemberLeft.init()@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_1000D7960;
  *(unsigned char *)(a1 + 16) = 0;
  type metadata accessor for NearbyGroup_Group.MemberLeft(0);
  return UnknownStorage.init()();
}

uint64_t type metadata accessor for NearbyGroup_Group.MemberLeft(uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner(a1, (uint64_t *)&type metadata singleton initialization cache for NearbyGroup_Group.MemberLeft);
}

void (*NearbyGroup_Group.memberLeft.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x30uLL);
  *a1 = v4;
  *uint64_t v4 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v6 = malloc(*(void *)(*(void *)(v5 - 8) + 64));
  v4[1] = v6;
  size_t v7 = *(void *)(*(void *)(type metadata accessor for NearbyGroup_Group.MemberLeft(0) - 8) + 64);
  v4[2] = malloc(v7);
  size_t v8 = malloc(v7);
  v4[3] = v8;
  outlined init with copy of (String, Any)(v2, (uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v9 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  v4[4] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v4[5] = v10;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v10 + 48))(v6, 1, v9) == 1)
  {
    outlined destroy of Any?((uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
LABEL_6:
    *(_OWORD *)size_t v8 = xmmword_1000D7960;
    v8[16] = 0;
    UnknownStorage.init()();
    return NearbyGroup_Group.memberLeft.modify;
  }
  if (swift_getEnumCaseMultiPayload() != 3)
  {
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v6, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    goto LABEL_6;
  }
  outlined init with take of NearbyGroup_Member((uint64_t)v6, (uint64_t)v8, type metadata accessor for NearbyGroup_Group.MemberLeft);
  return NearbyGroup_Group.memberLeft.modify;
}

void NearbyGroup_Group.memberLeft.modify(uint64_t **a1, char a2)
{
}

void NearbyGroup_Group.initialize.modify(uint64_t **a1, char a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  size_t v7 = *a1;
  uint64_t v8 = (*a1)[4];
  uint64_t v9 = (*a1)[5];
  uint64_t v10 = (void *)(*a1)[2];
  uint64_t v11 = (void *)(*a1)[3];
  uint64_t v13 = **a1;
  uint64_t v12 = (void *)(*a1)[1];
  if (a2)
  {
    outlined init with copy of NearbyGroup_Group.Initialization((*a1)[3], (uint64_t)v10, a5);
    outlined destroy of Any?(v13, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    outlined init with take of NearbyGroup_Member((uint64_t)v10, v13, a3);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v13, 0, 1, v8);
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v11, a6);
  }
  else
  {
    outlined destroy of Any?(**a1, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    outlined init with take of NearbyGroup_Member((uint64_t)v11, v13, a3);
    swift_storeEnumTagMultiPayload();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v13, 0, 1, v8);
  }
  free(v11);
  free(v10);
  free(v12);
  free(v7);
}

uint64_t NearbyGroup_Group.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return NearbyGroup_Member.unknownFields.getter(type metadata accessor for NearbyGroup_Group, a1);
}

uint64_t NearbyGroup_Member.unknownFields.getter@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 20);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t type metadata accessor for NearbyGroup_Group(uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner(a1, (uint64_t *)&type metadata singleton initialization cache for NearbyGroup_Group);
}

uint64_t NearbyGroup_Group.unknownFields.setter(uint64_t a1)
{
  return NearbyGroup_Member.unknownFields.setter(a1, type metadata accessor for NearbyGroup_Group);
}

uint64_t NearbyGroup_Member.unknownFields.setter(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 20);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

void (__swiftcall *NearbyGroup_Group.unknownFields.modify())()
{
  return Log.init();
}

uint64_t static NearbyGroup_Group.MemberAdded.== infix(_:_:)(uint64_t *a1, uint64_t a2)
{
  return specialized static NearbyGroup_Group.MemberRemoved.== infix(_:_:)(a1, a2, type metadata accessor for NearbyGroup_Group.MemberAdded) & 1;
}

uint64_t static NearbyGroup_Group.MemberRemoved.== infix(_:_:)(uint64_t *a1, uint64_t a2)
{
  return specialized static NearbyGroup_Group.MemberRemoved.== infix(_:_:)(a1, a2, type metadata accessor for NearbyGroup_Group.MemberRemoved) & 1;
}

uint64_t NearbyGroup_Group.Initialization.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return NearbyGroup_Group.Initialization.unknownFields.getter(type metadata accessor for NearbyGroup_Group.Initialization, a1);
}

uint64_t NearbyGroup_Group.Initialization.unknownFields.setter(uint64_t a1)
{
  return NearbyGroup_Group.Initialization.unknownFields.setter(a1, type metadata accessor for NearbyGroup_Group.Initialization);
}

void (__swiftcall *NearbyGroup_Group.Initialization.unknownFields.modify())()
{
  return Log.init();
}

uint64_t (*NearbyGroup_Group.MemberAdded.member.modify(void *a1))()
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for NearbyGroup_Member(0);
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for NearbyGroup_Group.MemberAdded(0) + 24);
  *((_DWORD *)v3 + 12) = v11;
  outlined init with copy of (String, Any)(v1 + v11, (uint64_t)v5, &demangling cache variable for type metadata for NearbyGroup_Member?);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    void *v10 = 0;
    v10[1] = 0xE000000000000000;
    UnknownStorage.init()();
    uint64_t v12 = (void *)((char *)v10 + *(int *)(v6 + 24));
    void *v12 = 0;
    v12[1] = 0;
    outlined destroy of Any?((uint64_t)v5, &demangling cache variable for type metadata for NearbyGroup_Member?);
  }
  else
  {
    outlined init with take of NearbyGroup_Member((uint64_t)v5, (uint64_t)v10, type metadata accessor for NearbyGroup_Member);
  }
  return NearbyGroup_Group.MemberAdded.member.modify;
}

BOOL NearbyGroup_Group.MemberAdded.hasMember.getter()
{
  return NearbyGroup_Group.MemberAdded.hasMember.getter(type metadata accessor for NearbyGroup_Group.MemberAdded);
}

Swift::Void __swiftcall NearbyGroup_Group.MemberAdded.clearMember()()
{
}

uint64_t NearbyGroup_Group.MemberAdded.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return NearbyGroup_Member.unknownFields.getter(type metadata accessor for NearbyGroup_Group.MemberAdded, a1);
}

uint64_t NearbyGroup_Group.MemberAdded.unknownFields.setter(uint64_t a1)
{
  return NearbyGroup_Member.unknownFields.setter(a1, type metadata accessor for NearbyGroup_Group.MemberAdded);
}

void (__swiftcall *NearbyGroup_Group.MemberAdded.unknownFields.modify())()
{
  return Log.init();
}

uint64_t key path getter for NearbyGroup_Group.MemberAdded.member : NearbyGroup_Group.MemberAdded@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X3>, void *a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2(0);
  outlined init with copy of (String, Any)(a1 + *(int *)(v9 + 24), (uint64_t)v8, &demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v10 = type metadata accessor for NearbyGroup_Member(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v8, 1, v10) != 1) {
    return outlined init with take of NearbyGroup_Member((uint64_t)v8, (uint64_t)a3, type metadata accessor for NearbyGroup_Member);
  }
  *a3 = 0;
  a3[1] = 0xE000000000000000;
  UnknownStorage.init()();
  uint64_t v11 = (void *)((char *)a3 + *(int *)(v10 + 24));
  *uint64_t v11 = 0;
  v11[1] = 0;
  return outlined destroy of Any?((uint64_t)v8, &demangling cache variable for type metadata for NearbyGroup_Member?);
}

uint64_t key path setter for NearbyGroup_Group.MemberAdded.member : NearbyGroup_Group.MemberAdded(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v8 = type metadata accessor for NearbyGroup_Member(0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of NearbyGroup_Group.Initialization(a1, (uint64_t)v11, type metadata accessor for NearbyGroup_Member);
  uint64_t v12 = a2 + *(int *)(a5(0) + 24);
  outlined destroy of Any?(v12, &demangling cache variable for type metadata for NearbyGroup_Member?);
  outlined init with take of NearbyGroup_Member((uint64_t)v11, v12, type metadata accessor for NearbyGroup_Member);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v12, 0, 1, v8);
}

uint64_t (*NearbyGroup_Group.MemberRemoved.member.modify(void *a1))()
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for NearbyGroup_Member(0);
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = v7;
  v3[3] = v7;
  size_t v9 = *(void *)(v7 + 64);
  v3[4] = malloc(v9);
  uint64_t v10 = malloc(v9);
  v3[5] = v10;
  uint64_t v11 = *(int *)(type metadata accessor for NearbyGroup_Group.MemberRemoved(0) + 24);
  *((_DWORD *)v3 + 12) = v11;
  outlined init with copy of (String, Any)(v1 + v11, (uint64_t)v5, &demangling cache variable for type metadata for NearbyGroup_Member?);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v6) == 1)
  {
    void *v10 = 0;
    v10[1] = 0xE000000000000000;
    UnknownStorage.init()();
    uint64_t v12 = (void *)((char *)v10 + *(int *)(v6 + 24));
    void *v12 = 0;
    v12[1] = 0;
    outlined destroy of Any?((uint64_t)v5, &demangling cache variable for type metadata for NearbyGroup_Member?);
  }
  else
  {
    outlined init with take of NearbyGroup_Member((uint64_t)v5, (uint64_t)v10, type metadata accessor for NearbyGroup_Member);
  }
  return NearbyGroup_Group.MemberAdded.member.modify;
}

void NearbyGroup_Group.MemberAdded.member.modify(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(int *)(*(void *)a1 + 48);
  uint64_t v4 = *(void **)(*(void *)a1 + 32);
  uint64_t v5 = *(void **)(*(void *)a1 + 40);
  uint64_t v6 = *(void *)(*(void *)a1 + 16);
  uint64_t v7 = *(void *)(*(void *)a1 + 24);
  uint64_t v8 = *(void **)(*(void *)a1 + 8);
  uint64_t v9 = **(void **)a1 + v3;
  if (a2)
  {
    outlined init with copy of NearbyGroup_Group.Initialization(*(void *)(*(void *)a1 + 40), (uint64_t)v4, type metadata accessor for NearbyGroup_Member);
    outlined destroy of Any?(v9, &demangling cache variable for type metadata for NearbyGroup_Member?);
    outlined init with take of NearbyGroup_Member((uint64_t)v4, v9, type metadata accessor for NearbyGroup_Member);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v5, type metadata accessor for NearbyGroup_Member);
  }
  else
  {
    outlined destroy of Any?(**(void **)a1 + v3, &demangling cache variable for type metadata for NearbyGroup_Member?);
    outlined init with take of NearbyGroup_Member((uint64_t)v5, v9, type metadata accessor for NearbyGroup_Member);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9, 0, 1, v6);
  }
  free(v5);
  free(v4);
  free(v8);
  free(v2);
}

BOOL NearbyGroup_Group.MemberRemoved.hasMember.getter()
{
  return NearbyGroup_Group.MemberAdded.hasMember.getter(type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

BOOL NearbyGroup_Group.MemberAdded.hasMember.getter(uint64_t (*a1)(void))
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = a1(0);
  outlined init with copy of (String, Any)(v1 + *(int *)(v6 + 24), (uint64_t)v5, &demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v7 = type metadata accessor for NearbyGroup_Member(0);
  BOOL v8 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1;
  outlined destroy of Any?((uint64_t)v5, &demangling cache variable for type metadata for NearbyGroup_Member?);
  return v8;
}

Swift::Void __swiftcall NearbyGroup_Group.MemberRemoved.clearMember()()
{
}

uint64_t NearbyGroup_Group.MemberAdded.clearMember()(uint64_t (*a1)(void))
{
  uint64_t v2 = v1 + *(int *)(a1(0) + 24);
  outlined destroy of Any?(v2, &demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v3 = type metadata accessor for NearbyGroup_Member(0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);
  return v4(v2, 1, 1, v3);
}

uint64_t NearbyGroup_Group.MemberRemoved.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return NearbyGroup_Member.unknownFields.getter(type metadata accessor for NearbyGroup_Group.MemberRemoved, a1);
}

uint64_t NearbyGroup_Group.MemberRemoved.unknownFields.setter(uint64_t a1)
{
  return NearbyGroup_Member.unknownFields.setter(a1, type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

void (__swiftcall *NearbyGroup_Group.MemberRemoved.unknownFields.modify())()
{
  return Log.init();
}

uint64_t NearbyGroup_Group.MemberLeft.usesToken.setter(uint64_t result)
{
  *(unsigned char *)(v1 + 16) = result;
  return result;
}

uint64_t NearbyGroup_Group.MemberLeft.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return NearbyGroup_Group.Initialization.unknownFields.getter(type metadata accessor for NearbyGroup_Group.MemberLeft, a1);
}

uint64_t NearbyGroup_Group.Initialization.unknownFields.getter@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1(0) + 24);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v6(a2, v4, v5);
}

uint64_t NearbyGroup_Group.MemberLeft.unknownFields.setter(uint64_t a1)
{
  return NearbyGroup_Group.Initialization.unknownFields.setter(a1, type metadata accessor for NearbyGroup_Group.MemberLeft);
}

uint64_t NearbyGroup_Group.Initialization.unknownFields.setter(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0) + 24);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40);
  return v6(v4, a1, v5);
}

void (__swiftcall *NearbyGroup_Group.MemberLeft.unknownFields.modify())()
{
  return Log.init();
}

uint64_t NearbyGroup_Group.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(a1, 1, 1, v2);
  type metadata accessor for NearbyGroup_Group(0);
  return UnknownStorage.init()();
}

const char *NearbyGroup_Member.protoMessageName.unsafeMutableAddressor()
{
  return "cp.Member";
}

uint64_t static NearbyGroup_Member.protoMessageName.getter()
{
  return 0x65626D654D2E7063;
}

uint64_t NearbyGroup_Member._protobuf_nameMap.unsafeMutableAddressor()
{
  return NearbyProtoNearbySessionMessageType._protobuf_nameMap.unsafeMutableAddressor(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Member._protobuf_nameMap);
}

uint64_t static NearbyGroup_Member._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static NearbyProtoNearbySessionMessageType._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Member._protobuf_nameMap, a1);
}

uint64_t NearbyGroup_Member.decodeMessage<A>(decoder:)()
{
  while (1)
  {
    uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    if (v0 || (v2 & 1) != 0) {
      break;
    }
    if (result == 2)
    {
      type metadata accessor for NearbyGroup_Member(0);
      dispatch thunk of Decoder.decodeSingularStringField(value:)();
    }
    else if (result == 1)
    {
      dispatch thunk of Decoder.decodeSingularStringField(value:)();
    }
    uint64_t v0 = 0;
  }
  return result;
}

uint64_t NearbyGroup_Member.traverse<A>(visitor:)()
{
  unint64_t v2 = v0[1];
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000) == 0) {
    uint64_t v3 = *v0 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3 || (uint64_t result = dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)(), !v1))
  {
    uint64_t result = closure #1 in NearbyGroup_Member.traverse<A>(visitor:)((uint64_t)v0);
    if (!v1)
    {
      type metadata accessor for NearbyGroup_Member(0);
      return UnknownStorage.traverse<A>(visitor:)();
    }
  }
  return result;
}

uint64_t closure #1 in NearbyGroup_Member.traverse<A>(visitor:)(uint64_t a1)
{
  uint64_t result = type metadata accessor for NearbyGroup_Member(0);
  if (*(void *)(a1 + *(int *)(result + 24) + 8)) {
    return dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)();
  }
  return result;
}

Swift::Int NearbyGroup_Member.hashValue.getter()
{
  return NearbyGroup_Member.hashValue.getter((void (*)(void))type metadata accessor for NearbyGroup_Member, &lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Member);
}

uint64_t protocol witness for Message.init() in conformance NearbyGroup_Member@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0xE000000000000000;
  uint64_t result = UnknownStorage.init()();
  uint64_t v5 = (void *)((char *)a2 + *(int *)(a1 + 24));
  void *v5 = 0;
  v5[1] = 0;
  return result;
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance NearbyGroup_Member()
{
  return NearbyGroup_Member.decodeMessage<A>(decoder:)();
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance NearbyGroup_Member()
{
  return NearbyGroup_Member.traverse<A>(visitor:)();
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance NearbyGroup_Member(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Member);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyGroup_Member@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyProtoNearbySessionMessageType(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Member._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance NearbyGroup_Member()
{
  lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Member);
  return Message.debugDescription.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NearbyGroup_Member(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Member);
  return Message.hash(into:)(a1, a2, v4);
}

const char *NearbyGroup_Group.protoMessageName.unsafeMutableAddressor()
{
  return "cp.Group";
}

uint64_t static NearbyGroup_Group.protoMessageName.getter()
{
  return 0x70756F72472E7063;
}

uint64_t NearbyGroup_Group._protobuf_nameMap.unsafeMutableAddressor()
{
  return NearbyProtoNearbySessionMessageType._protobuf_nameMap.unsafeMutableAddressor(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Group._protobuf_nameMap);
}

uint64_t static NearbyGroup_Group._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static NearbyProtoNearbySessionMessageType._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Group._protobuf_nameMap, a1);
}

uint64_t NearbyGroup_Group.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  while (1)
  {
    uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    if (v4 || (v10 & 1) != 0) {
      return result;
    }
    switch(result)
    {
      case 1:
        closure #1 in NearbyGroup_Group.decodeMessage<A>(decoder:)(v5, a1, a2, a3);
        break;
      case 2:
        closure #2 in NearbyGroup_Group.decodeMessage<A>(decoder:)(v5, a1, a2, a3);
        break;
      case 3:
        closure #3 in NearbyGroup_Group.decodeMessage<A>(decoder:)(v5, a1, a2, a3);
        break;
      case 4:
        closure #4 in NearbyGroup_Group.decodeMessage<A>(decoder:)(v5, a1, a2, a3);
        break;
      default:
        continue;
    }
  }
}

uint64_t closure #1 in NearbyGroup_Group.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v49 = a4;
  uint64_t v47 = a2;
  uint64_t v48 = a3;
  uint64_t v5 = type metadata accessor for NearbyGroup_Group.Initialization(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v41 = (uint64_t)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v44 = (char *)&v37 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  long long v19 = (char *)&v37 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.Initialization?);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  uint64_t v42 = (uint64_t)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  unint64_t v24 = (char *)&v37 - v23;
  uint64_t v43 = v6;
  unint64_t v25 = *(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
  uint64_t v46 = v5;
  uint64_t v26 = v5;
  uint64_t v27 = v25;
  v25((char *)&v37 - v23, 1, 1, v26);
  uint64_t v40 = a1;
  outlined init with copy of (String, Any)(a1, (uint64_t)v12, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v39 = v14;
  int v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if (v28 == 1)
  {
    outlined destroy of Any?((uint64_t)v12, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    uint64_t v29 = v13;
    uint64_t v30 = v46;
  }
  else
  {
    uint64_t v38 = v27;
    uint64_t v31 = (uint64_t)v44;
    outlined init with take of NearbyGroup_Member((uint64_t)v12, (uint64_t)v19, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    outlined init with take of NearbyGroup_Member((uint64_t)v19, (uint64_t)v17, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    uint64_t v29 = v13;
    if (swift_getEnumCaseMultiPayload())
    {
      outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v17, type metadata accessor for NearbyGroup_Group.OneOf_Event);
      uint64_t v30 = v46;
    }
    else
    {
      outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Group.Initialization?);
      outlined init with take of NearbyGroup_Member((uint64_t)v17, v31, type metadata accessor for NearbyGroup_Group.Initialization);
      outlined init with take of NearbyGroup_Member(v31, (uint64_t)v24, type metadata accessor for NearbyGroup_Group.Initialization);
      uint64_t v30 = v46;
      v38(v24, 0, 1, v46);
    }
  }
  uint64_t v32 = v45;
  lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.Initialization);
  dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
  if (v32) {
    return outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Group.Initialization?);
  }
  uint64_t v34 = v42;
  outlined init with copy of (String, Any)((uint64_t)v24, v42, &demangling cache variable for type metadata for NearbyGroup_Group.Initialization?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v34, 1, v30) == 1)
  {
    outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Group.Initialization?);
    return outlined destroy of Any?(v34, &demangling cache variable for type metadata for NearbyGroup_Group.Initialization?);
  }
  else
  {
    uint64_t v35 = v41;
    outlined init with take of NearbyGroup_Member(v34, v41, type metadata accessor for NearbyGroup_Group.Initialization);
    if (v28 != 1) {
      dispatch thunk of Decoder.handleConflictingOneOf()();
    }
    outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Group.Initialization?);
    uint64_t v36 = v40;
    outlined destroy of Any?(v40, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    outlined init with take of NearbyGroup_Member(v35, v36, type metadata accessor for NearbyGroup_Group.Initialization);
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v29);
  }
}

uint64_t closure #2 in NearbyGroup_Group.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v49 = a4;
  uint64_t v47 = a2;
  uint64_t v48 = a3;
  uint64_t v5 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v41 = (uint64_t)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v44 = (char *)&v37 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  long long v19 = (char *)&v37 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.MemberAdded?);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  uint64_t v42 = (uint64_t)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  unint64_t v24 = (char *)&v37 - v23;
  uint64_t v43 = v6;
  unint64_t v25 = *(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
  uint64_t v46 = v5;
  uint64_t v26 = v5;
  uint64_t v27 = v25;
  v25((char *)&v37 - v23, 1, 1, v26);
  uint64_t v40 = a1;
  outlined init with copy of (String, Any)(a1, (uint64_t)v12, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v39 = v14;
  int v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if (v28 == 1)
  {
    outlined destroy of Any?((uint64_t)v12, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    uint64_t v29 = v13;
  }
  else
  {
    uint64_t v38 = v27;
    uint64_t v30 = (uint64_t)v44;
    outlined init with take of NearbyGroup_Member((uint64_t)v12, (uint64_t)v19, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    outlined init with take of NearbyGroup_Member((uint64_t)v19, (uint64_t)v17, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    uint64_t v29 = v13;
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Group.MemberAdded?);
      outlined init with take of NearbyGroup_Member((uint64_t)v17, v30, type metadata accessor for NearbyGroup_Group.MemberAdded);
      outlined init with take of NearbyGroup_Member(v30, (uint64_t)v24, type metadata accessor for NearbyGroup_Group.MemberAdded);
      uint64_t v31 = v46;
      v38(v24, 0, 1, v46);
      goto LABEL_7;
    }
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v17, type metadata accessor for NearbyGroup_Group.OneOf_Event);
  }
  uint64_t v31 = v46;
LABEL_7:
  uint64_t v32 = v45;
  lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberAdded);
  dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
  if (v32) {
    return outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Group.MemberAdded?);
  }
  uint64_t v34 = v42;
  outlined init with copy of (String, Any)((uint64_t)v24, v42, &demangling cache variable for type metadata for NearbyGroup_Group.MemberAdded?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v34, 1, v31) == 1)
  {
    outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Group.MemberAdded?);
    return outlined destroy of Any?(v34, &demangling cache variable for type metadata for NearbyGroup_Group.MemberAdded?);
  }
  else
  {
    uint64_t v35 = v41;
    outlined init with take of NearbyGroup_Member(v34, v41, type metadata accessor for NearbyGroup_Group.MemberAdded);
    if (v28 != 1) {
      dispatch thunk of Decoder.handleConflictingOneOf()();
    }
    outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Group.MemberAdded?);
    uint64_t v36 = v40;
    outlined destroy of Any?(v40, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    outlined init with take of NearbyGroup_Member(v35, v36, type metadata accessor for NearbyGroup_Group.MemberAdded);
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v29);
  }
}

uint64_t closure #3 in NearbyGroup_Group.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v49 = a4;
  uint64_t v47 = a2;
  uint64_t v48 = a3;
  uint64_t v5 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v41 = (uint64_t)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v44 = (char *)&v37 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  long long v19 = (char *)&v37 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.MemberRemoved?);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  uint64_t v42 = (uint64_t)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  unint64_t v24 = (char *)&v37 - v23;
  uint64_t v43 = v6;
  unint64_t v25 = *(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
  uint64_t v46 = v5;
  uint64_t v26 = v5;
  uint64_t v27 = v25;
  v25((char *)&v37 - v23, 1, 1, v26);
  uint64_t v40 = a1;
  outlined init with copy of (String, Any)(a1, (uint64_t)v12, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v39 = v14;
  int v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if (v28 == 1)
  {
    outlined destroy of Any?((uint64_t)v12, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    uint64_t v29 = v13;
  }
  else
  {
    uint64_t v38 = v27;
    uint64_t v30 = (uint64_t)v44;
    outlined init with take of NearbyGroup_Member((uint64_t)v12, (uint64_t)v19, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    outlined init with take of NearbyGroup_Member((uint64_t)v19, (uint64_t)v17, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    uint64_t v29 = v13;
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Group.MemberRemoved?);
      outlined init with take of NearbyGroup_Member((uint64_t)v17, v30, type metadata accessor for NearbyGroup_Group.MemberRemoved);
      outlined init with take of NearbyGroup_Member(v30, (uint64_t)v24, type metadata accessor for NearbyGroup_Group.MemberRemoved);
      uint64_t v31 = v46;
      v38(v24, 0, 1, v46);
      goto LABEL_7;
    }
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v17, type metadata accessor for NearbyGroup_Group.OneOf_Event);
  }
  uint64_t v31 = v46;
LABEL_7:
  uint64_t v32 = v45;
  lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberRemoved);
  dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
  if (v32) {
    return outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Group.MemberRemoved?);
  }
  uint64_t v34 = v42;
  outlined init with copy of (String, Any)((uint64_t)v24, v42, &demangling cache variable for type metadata for NearbyGroup_Group.MemberRemoved?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v34, 1, v31) == 1)
  {
    outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Group.MemberRemoved?);
    return outlined destroy of Any?(v34, &demangling cache variable for type metadata for NearbyGroup_Group.MemberRemoved?);
  }
  else
  {
    uint64_t v35 = v41;
    outlined init with take of NearbyGroup_Member(v34, v41, type metadata accessor for NearbyGroup_Group.MemberRemoved);
    if (v28 != 1) {
      dispatch thunk of Decoder.handleConflictingOneOf()();
    }
    outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Group.MemberRemoved?);
    uint64_t v36 = v40;
    outlined destroy of Any?(v40, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    outlined init with take of NearbyGroup_Member(v35, v36, type metadata accessor for NearbyGroup_Group.MemberRemoved);
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v29);
  }
}

uint64_t closure #4 in NearbyGroup_Group.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v49 = a4;
  uint64_t v47 = a2;
  uint64_t v48 = a3;
  uint64_t v5 = type metadata accessor for NearbyGroup_Group.MemberLeft(0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v41 = (uint64_t)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v44 = (char *)&v37 - v9;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  long long v19 = (char *)&v37 - v18;
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.MemberLeft?);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  uint64_t v42 = (uint64_t)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  unint64_t v24 = (char *)&v37 - v23;
  uint64_t v43 = v6;
  unint64_t v25 = *(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56);
  uint64_t v46 = v5;
  uint64_t v26 = v5;
  uint64_t v27 = v25;
  v25((char *)&v37 - v23, 1, 1, v26);
  uint64_t v40 = a1;
  outlined init with copy of (String, Any)(a1, (uint64_t)v12, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v39 = v14;
  int v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13);
  if (v28 == 1)
  {
    outlined destroy of Any?((uint64_t)v12, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    uint64_t v29 = v13;
  }
  else
  {
    uint64_t v38 = v27;
    uint64_t v30 = (uint64_t)v44;
    outlined init with take of NearbyGroup_Member((uint64_t)v12, (uint64_t)v19, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    outlined init with take of NearbyGroup_Member((uint64_t)v19, (uint64_t)v17, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    uint64_t v29 = v13;
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Group.MemberLeft?);
      outlined init with take of NearbyGroup_Member((uint64_t)v17, v30, type metadata accessor for NearbyGroup_Group.MemberLeft);
      outlined init with take of NearbyGroup_Member(v30, (uint64_t)v24, type metadata accessor for NearbyGroup_Group.MemberLeft);
      uint64_t v31 = v46;
      v38(v24, 0, 1, v46);
      goto LABEL_7;
    }
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v17, type metadata accessor for NearbyGroup_Group.OneOf_Event);
  }
  uint64_t v31 = v46;
LABEL_7:
  uint64_t v32 = v45;
  lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberLeft);
  dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
  if (v32) {
    return outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Group.MemberLeft?);
  }
  uint64_t v34 = v42;
  outlined init with copy of (String, Any)((uint64_t)v24, v42, &demangling cache variable for type metadata for NearbyGroup_Group.MemberLeft?);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48))(v34, 1, v31) == 1)
  {
    outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Group.MemberLeft?);
    return outlined destroy of Any?(v34, &demangling cache variable for type metadata for NearbyGroup_Group.MemberLeft?);
  }
  else
  {
    uint64_t v35 = v41;
    outlined init with take of NearbyGroup_Member(v34, v41, type metadata accessor for NearbyGroup_Group.MemberLeft);
    if (v28 != 1) {
      dispatch thunk of Decoder.handleConflictingOneOf()();
    }
    outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Group.MemberLeft?);
    uint64_t v36 = v40;
    outlined destroy of Any?(v40, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    outlined init with take of NearbyGroup_Member(v35, v36, type metadata accessor for NearbyGroup_Group.MemberLeft);
    swift_storeEnumTagMultiPayload();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v36, 0, 1, v29);
  }
}

uint64_t NearbyGroup_Group.traverse<A>(visitor:)()
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of (String, Any)(v0, (uint64_t)v4, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v5 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v4, 1, v5) == 1) {
    goto LABEL_8;
  }
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      closure #2 in NearbyGroup_Group.traverse<A>(visitor:)(v0);
      break;
    case 2u:
      closure #3 in NearbyGroup_Group.traverse<A>(visitor:)(v0);
      break;
    case 3u:
      closure #4 in NearbyGroup_Group.traverse<A>(visitor:)(v0);
      break;
    default:
      closure #1 in NearbyGroup_Group.traverse<A>(visitor:)(v0);
      break;
  }
  uint64_t result = outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v4, type metadata accessor for NearbyGroup_Group.OneOf_Event);
  if (!v1)
  {
LABEL_8:
    type metadata accessor for NearbyGroup_Group(0);
    return UnknownStorage.traverse<A>(visitor:)();
  }
  return result;
}

uint64_t closure #1 in NearbyGroup_Group.traverse<A>(visitor:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for NearbyGroup_Group.Initialization(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of (String, Any)(a1, (uint64_t)v4, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v8 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v4, 1, v8) == 1)
  {
    outlined destroy of Any?((uint64_t)v4, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    __break(1u);
  }
  else if (!swift_getEnumCaseMultiPayload())
  {
    outlined init with take of NearbyGroup_Member((uint64_t)v4, (uint64_t)v7, type metadata accessor for NearbyGroup_Group.Initialization);
    lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.Initialization);
    dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
    return outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v7, type metadata accessor for NearbyGroup_Group.Initialization);
  }
  uint64_t result = outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v4, type metadata accessor for NearbyGroup_Group.OneOf_Event);
  __break(1u);
  return result;
}

uint64_t closure #2 in NearbyGroup_Group.traverse<A>(visitor:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of (String, Any)(a1, (uint64_t)v4, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v8 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v4, 1, v8) == 1)
  {
    outlined destroy of Any?((uint64_t)v4, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    __break(1u);
  }
  else if (swift_getEnumCaseMultiPayload() == 1)
  {
    outlined init with take of NearbyGroup_Member((uint64_t)v4, (uint64_t)v7, type metadata accessor for NearbyGroup_Group.MemberAdded);
    lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberAdded);
    dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
    return outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v7, type metadata accessor for NearbyGroup_Group.MemberAdded);
  }
  uint64_t result = outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v4, type metadata accessor for NearbyGroup_Group.OneOf_Event);
  __break(1u);
  return result;
}

uint64_t closure #3 in NearbyGroup_Group.traverse<A>(visitor:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of (String, Any)(a1, (uint64_t)v4, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v8 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v4, 1, v8) == 1)
  {
    outlined destroy of Any?((uint64_t)v4, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    __break(1u);
  }
  else if (swift_getEnumCaseMultiPayload() == 2)
  {
    outlined init with take of NearbyGroup_Member((uint64_t)v4, (uint64_t)v7, type metadata accessor for NearbyGroup_Group.MemberRemoved);
    lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberRemoved);
    dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
    return outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v7, type metadata accessor for NearbyGroup_Group.MemberRemoved);
  }
  uint64_t result = outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v4, type metadata accessor for NearbyGroup_Group.OneOf_Event);
  __break(1u);
  return result;
}

uint64_t closure #4 in NearbyGroup_Group.traverse<A>(visitor:)(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for NearbyGroup_Group.MemberLeft(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of (String, Any)(a1, (uint64_t)v4, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v8 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v4, 1, v8) == 1)
  {
    outlined destroy of Any?((uint64_t)v4, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    __break(1u);
  }
  else if (swift_getEnumCaseMultiPayload() == 3)
  {
    outlined init with take of NearbyGroup_Member((uint64_t)v4, (uint64_t)v7, type metadata accessor for NearbyGroup_Group.MemberLeft);
    lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberLeft);
    dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
    return outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v7, type metadata accessor for NearbyGroup_Group.MemberLeft);
  }
  uint64_t result = outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v4, type metadata accessor for NearbyGroup_Group.OneOf_Event);
  __break(1u);
  return result;
}

Swift::Int NearbyGroup_Group.hashValue.getter()
{
  return NearbyGroup_Member.hashValue.getter((void (*)(void))type metadata accessor for NearbyGroup_Group, &lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group);
}

uint64_t protocol witness for Message.init() in conformance NearbyGroup_Group@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(a1, 1, 1, v2);
  return UnknownStorage.init()();
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance NearbyGroup_Group(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance NearbyGroup_Group()
{
  return NearbyGroup_Group.traverse<A>(visitor:)();
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance NearbyGroup_Group(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyGroup_Group@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyProtoNearbySessionMessageType(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Group._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance NearbyGroup_Group()
{
  lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member((unint64_t *)&lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group);
  return Message.debugDescription.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NearbyGroup_Group(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member((unint64_t *)&lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group);
  return Message.hash(into:)(a1, a2, v4);
}

void one-time initialization function for protoMessageName(int a1)
{
  v1._countAndFlagsBits = 0x6C616974696E492ELL;
  v1._object = (void *)0xEF6E6F6974617A69;
  one-time initialization function for protoMessageName(a1, v1, static NearbyGroup_Group.Initialization.protoMessageName, &static NearbyGroup_Group.Initialization.protoMessageName[1]);
}

{
  Swift::String v1;

  v1._countAndFlagsBits = 0x417265626D654D2ELL;
  v1._object = (void *)0xEC00000064656464;
  one-time initialization function for protoMessageName(a1, v1, static NearbyGroup_Group.MemberAdded.protoMessageName, &static NearbyGroup_Group.MemberAdded.protoMessageName[1]);
}

{
  Swift::String v1;

  v1._countAndFlagsBits = 0x527265626D654D2ELL;
  v1._object = (void *)0xEE006465766F6D65;
  one-time initialization function for protoMessageName(a1, v1, static NearbyGroup_Group.MemberRemoved.protoMessageName, &static NearbyGroup_Group.MemberRemoved.protoMessageName[1]);
}

{
  Swift::String v1;

  v1._countAndFlagsBits = 0x4C7265626D654D2ELL;
  v1._object = (void *)0xEB00000000746665;
  one-time initialization function for protoMessageName(a1, v1, static NearbyGroup_Group.MemberLeft.protoMessageName, &static NearbyGroup_Group.MemberLeft.protoMessageName[1]);
}

void *NearbyGroup_Group.Initialization.protoMessageName.unsafeMutableAddressor()
{
  if (one-time initialization token for protoMessageName != -1) {
    swift_once();
  }
  return static NearbyGroup_Group.Initialization.protoMessageName;
}

uint64_t static NearbyGroup_Group.Initialization.protoMessageName.getter()
{
  return static NearbyProtoConnectionResponse.Content.protoMessageName.getter(&one-time initialization token for protoMessageName, static NearbyGroup_Group.Initialization.protoMessageName);
}

uint64_t NearbyGroup_Group.Initialization._protobuf_nameMap.unsafeMutableAddressor()
{
  return NearbyProtoNearbySessionMessageType._protobuf_nameMap.unsafeMutableAddressor(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Group.Initialization._protobuf_nameMap);
}

uint64_t static NearbyGroup_Group.Initialization._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static NearbyProtoNearbySessionMessageType._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Group.Initialization._protobuf_nameMap, a1);
}

uint64_t NearbyGroup_Group.Initialization.decodeMessage<A>(decoder:)()
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        type metadata accessor for NearbyGroup_Member(0);
        lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Member);
        dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)();
      }
      else if (result == 1)
      {
        dispatch thunk of Decoder.decodeSingularBytesField(value:)();
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t NearbyGroup_Group.Initialization.traverse<A>(visitor:)()
{
  uint64_t v2 = *v0;
  unint64_t v3 = v0[1];
  switch(v3 >> 62)
  {
    case 1uLL:
      if ((int)v2 != v2 >> 32) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 2uLL:
      if (*(void *)(v2 + 16) != *(void *)(v2 + 24)) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
      if (!v1)
      {
LABEL_8:
        if (!*(void *)(v0[2] + 16)
          || (type metadata accessor for NearbyGroup_Member(0),
              lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Member), uint64_t result = dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)(), !v1))
        {
          type metadata accessor for NearbyGroup_Group.Initialization(0);
          return UnknownStorage.traverse<A>(visitor:)();
        }
      }
      return result;
  }
}

Swift::Int NearbyGroup_Group.Initialization.hashValue.getter()
{
  return NearbyGroup_Member.hashValue.getter((void (*)(void))type metadata accessor for NearbyGroup_Group.Initialization, &lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.Initialization);
}

uint64_t protocol witness for Message.init() in conformance NearbyGroup_Group.Initialization@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_1000D7960;
  *(void *)(a1 + 16) = _swiftEmptyArrayStorage;
  return UnknownStorage.init()();
}

uint64_t protocol witness for static Message.protoMessageName.getter in conformance NearbyGroup_Group.Initialization(uint64_t a1, uint64_t a2)
{
  return protocol witness for static Message.protoMessageName.getter in conformance NearbyProtoConnectionResponse.Content(a1, a2, &one-time initialization token for protoMessageName, static NearbyGroup_Group.Initialization.protoMessageName);
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance NearbyGroup_Group.Initialization()
{
  return NearbyGroup_Group.Initialization.decodeMessage<A>(decoder:)();
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance NearbyGroup_Group.Initialization()
{
  return NearbyGroup_Group.Initialization.traverse<A>(visitor:)();
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance NearbyGroup_Group.Initialization(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.Initialization);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyGroup_Group.Initialization@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyProtoNearbySessionMessageType(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Group.Initialization._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance NearbyGroup_Group.Initialization()
{
  lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.Initialization);
  return Message.debugDescription.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NearbyGroup_Group.Initialization(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.Initialization);
  return Message.hash(into:)(a1, a2, v4);
}

void *NearbyGroup_Group.MemberAdded.protoMessageName.unsafeMutableAddressor()
{
  if (one-time initialization token for protoMessageName != -1) {
    swift_once();
  }
  return static NearbyGroup_Group.MemberAdded.protoMessageName;
}

uint64_t static NearbyGroup_Group.MemberAdded.protoMessageName.getter()
{
  return static NearbyProtoConnectionResponse.Content.protoMessageName.getter(&one-time initialization token for protoMessageName, static NearbyGroup_Group.MemberAdded.protoMessageName);
}

uint64_t NearbyGroup_Group.MemberAdded._protobuf_nameMap.unsafeMutableAddressor()
{
  return NearbyProtoNearbySessionMessageType._protobuf_nameMap.unsafeMutableAddressor(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Group.MemberAdded._protobuf_nameMap);
}

uint64_t static NearbyGroup_Group.MemberAdded._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static NearbyProtoNearbySessionMessageType._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Group.MemberAdded._protobuf_nameMap, a1);
}

uint64_t NearbyGroup_Group.MemberAdded.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.MemberAdded.decodeMessage<A>(decoder:)(a1, a2, a3, (void (*)(void))type metadata accessor for NearbyGroup_Group.MemberAdded);
}

uint64_t NearbyGroup_Group.MemberAdded.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.MemberAdded.traverse<A>(visitor:)(a1, a2, a3, type metadata accessor for NearbyGroup_Group.MemberAdded, (void (*)(void))type metadata accessor for NearbyGroup_Group.MemberAdded);
}

Swift::Int NearbyGroup_Group.MemberAdded.hashValue.getter()
{
  return NearbyGroup_Member.hashValue.getter((void (*)(void))type metadata accessor for NearbyGroup_Group.MemberAdded, &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberAdded);
}

uint64_t protocol witness for static Message.protoMessageName.getter in conformance NearbyGroup_Group.MemberAdded(uint64_t a1, uint64_t a2)
{
  return protocol witness for static Message.protoMessageName.getter in conformance NearbyProtoConnectionResponse.Content(a1, a2, &one-time initialization token for protoMessageName, static NearbyGroup_Group.MemberAdded.protoMessageName);
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance NearbyGroup_Group.MemberAdded(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.MemberAdded.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance NearbyGroup_Group.MemberAdded(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.MemberAdded.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance NearbyGroup_Group.MemberAdded(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberAdded);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyGroup_Group.MemberAdded@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyProtoNearbySessionMessageType(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Group.MemberAdded._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance NearbyGroup_Group.MemberAdded()
{
  lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberAdded);
  return Message.debugDescription.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NearbyGroup_Group.MemberAdded(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberAdded);
  return Message.hash(into:)(a1, a2, v4);
}

void *NearbyGroup_Group.MemberRemoved.protoMessageName.unsafeMutableAddressor()
{
  if (one-time initialization token for protoMessageName != -1) {
    swift_once();
  }
  return static NearbyGroup_Group.MemberRemoved.protoMessageName;
}

uint64_t static NearbyGroup_Group.MemberRemoved.protoMessageName.getter()
{
  return static NearbyProtoConnectionResponse.Content.protoMessageName.getter(&one-time initialization token for protoMessageName, static NearbyGroup_Group.MemberRemoved.protoMessageName);
}

uint64_t NearbyGroup_Group.MemberRemoved._protobuf_nameMap.unsafeMutableAddressor()
{
  return NearbyProtoNearbySessionMessageType._protobuf_nameMap.unsafeMutableAddressor(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Group.MemberRemoved._protobuf_nameMap);
}

uint64_t static NearbyGroup_Group.MemberRemoved._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static NearbyProtoNearbySessionMessageType._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Group.MemberRemoved._protobuf_nameMap, a1);
}

uint64_t NearbyGroup_Group.MemberRemoved.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.MemberAdded.decodeMessage<A>(decoder:)(a1, a2, a3, (void (*)(void))type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

uint64_t NearbyGroup_Group.MemberAdded.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v7 = v4;
  while (1)
  {
    uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    if (v5 || (v12 & 1) != 0) {
      break;
    }
    if (result == 2)
    {
      closure #2 in NearbyGroup_Group.MemberAdded.decodeMessage<A>(decoder:)(a1, v7, a2, a3, a4);
    }
    else if (result == 1)
    {
      dispatch thunk of Decoder.decodeSingularBytesField(value:)();
    }
  }
  return result;
}

uint64_t closure #2 in NearbyGroup_Group.MemberAdded.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  return dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
}

uint64_t NearbyGroup_Group.MemberRemoved.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.MemberAdded.traverse<A>(visitor:)(a1, a2, a3, type metadata accessor for NearbyGroup_Group.MemberRemoved, (void (*)(void))type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

uint64_t NearbyGroup_Group.MemberAdded.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), void (*a5)(void))
{
  uint64_t v9 = *v5;
  unint64_t v10 = v5[1];
  switch(v10 >> 62)
  {
    case 1uLL:
      if ((int)v9 != v9 >> 32) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 2uLL:
      if (*(void *)(v9 + 16) != *(void *)(v9 + 24)) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((v10 & 0xFF000000000000) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
      if (!v6)
      {
LABEL_8:
        uint64_t result = closure #1 in NearbyGroup_Group.MemberAdded.traverse<A>(visitor:)((uint64_t)v5, a1, a2, a3, a4);
        if (!v6)
        {
          a5(0);
          return UnknownStorage.traverse<A>(visitor:)();
        }
      }
      return result;
  }
}

uint64_t closure #1 in NearbyGroup_Group.MemberAdded.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  v16[3] = a4;
  v16[1] = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for NearbyGroup_Member(0);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = a5(0);
  outlined init with copy of (String, Any)(a1 + *(int *)(v14 + 24), (uint64_t)v9, &demangling cache variable for type metadata for NearbyGroup_Member?);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1) {
    return outlined destroy of Any?((uint64_t)v9, &demangling cache variable for type metadata for NearbyGroup_Member?);
  }
  outlined init with take of NearbyGroup_Member((uint64_t)v9, (uint64_t)v13, type metadata accessor for NearbyGroup_Member);
  lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Member);
  dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
  return outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v13, type metadata accessor for NearbyGroup_Member);
}

Swift::Int NearbyGroup_Group.MemberRemoved.hashValue.getter()
{
  return NearbyGroup_Member.hashValue.getter((void (*)(void))type metadata accessor for NearbyGroup_Group.MemberRemoved, &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

uint64_t protocol witness for Message.init() in conformance NearbyGroup_Group.MemberAdded@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *a2 = xmmword_1000D7960;
  UnknownStorage.init()();
  uint64_t v4 = (char *)a2 + *(int *)(a1 + 24);
  uint64_t v5 = type metadata accessor for NearbyGroup_Member(0);
  uint64_t v6 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  return v6(v4, 1, 1, v5);
}

uint64_t protocol witness for static Message.protoMessageName.getter in conformance NearbyGroup_Group.MemberRemoved(uint64_t a1, uint64_t a2)
{
  return protocol witness for static Message.protoMessageName.getter in conformance NearbyProtoConnectionResponse.Content(a1, a2, &one-time initialization token for protoMessageName, static NearbyGroup_Group.MemberRemoved.protoMessageName);
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance NearbyGroup_Group.MemberRemoved(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.MemberRemoved.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance NearbyGroup_Group.MemberRemoved(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.MemberRemoved.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance NearbyGroup_Group.MemberRemoved(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberRemoved);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyGroup_Group.MemberRemoved@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyProtoNearbySessionMessageType(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Group.MemberRemoved._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance NearbyGroup_Group.MemberRemoved()
{
  lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberRemoved);
  return Message.debugDescription.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NearbyGroup_Group.MemberRemoved(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberRemoved);
  return Message.hash(into:)(a1, a2, v4);
}

void one-time initialization function for protoMessageName(int a1, Swift::String a2, void *a3, void *a4)
{
  *a3 = 0x70756F72472E7063;
  *a4 = 0xE800000000000000;
}

void *NearbyGroup_Group.MemberLeft.protoMessageName.unsafeMutableAddressor()
{
  if (one-time initialization token for protoMessageName != -1) {
    swift_once();
  }
  return static NearbyGroup_Group.MemberLeft.protoMessageName;
}

uint64_t static NearbyGroup_Group.MemberLeft.protoMessageName.getter()
{
  return static NearbyProtoConnectionResponse.Content.protoMessageName.getter(&one-time initialization token for protoMessageName, static NearbyGroup_Group.MemberLeft.protoMessageName);
}

uint64_t NearbyGroup_Group.MemberLeft._protobuf_nameMap.unsafeMutableAddressor()
{
  return NearbyProtoNearbySessionMessageType._protobuf_nameMap.unsafeMutableAddressor(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Group.MemberLeft._protobuf_nameMap);
}

uint64_t static NearbyGroup_Group.MemberLeft._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static NearbyProtoNearbySessionMessageType._protobuf_nameMap.getter(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Group.MemberLeft._protobuf_nameMap, a1);
}

uint64_t NearbyGroup_Group.MemberLeft.decodeMessage<A>(decoder:)()
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
  if (!v0)
  {
    while ((v2 & 1) == 0)
    {
      if (result == 2)
      {
        dispatch thunk of Decoder.decodeSingularBoolField(value:)();
      }
      else if (result == 1)
      {
        dispatch thunk of Decoder.decodeSingularBytesField(value:)();
      }
      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()();
    }
  }
  return result;
}

uint64_t NearbyGroup_Group.MemberLeft.traverse<A>(visitor:)()
{
  uint64_t v2 = *(void *)v0;
  unint64_t v3 = *(void *)(v0 + 8);
  switch(v3 >> 62)
  {
    case 1uLL:
      if ((int)v2 != v2 >> 32) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 2uLL:
      if (*(void *)(v2 + 16) != *(void *)(v2 + 24)) {
        goto LABEL_7;
      }
      goto LABEL_8;
    case 3uLL:
      goto LABEL_8;
    default:
      if ((v3 & 0xFF000000000000) == 0) {
        goto LABEL_8;
      }
LABEL_7:
      uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
      if (!v1)
      {
LABEL_8:
        if (*(unsigned char *)(v0 + 16) != 1
          || (uint64_t result = dispatch thunk of Visitor.visitSingularBoolField(value:fieldNumber:)(), !v1))
        {
          type metadata accessor for NearbyGroup_Group.MemberLeft(0);
          return UnknownStorage.traverse<A>(visitor:)();
        }
      }
      return result;
  }
}

Swift::Int NearbyGroup_Group.MemberLeft.hashValue.getter()
{
  return NearbyGroup_Member.hashValue.getter((void (*)(void))type metadata accessor for NearbyGroup_Group.MemberLeft, &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberLeft);
}

Swift::Int NearbyGroup_Member.hashValue.getter(void (*a1)(void), unint64_t *a2, void (*a3)(uint64_t))
{
  return Hasher._finalize()();
}

uint64_t protocol witness for Message.init() in conformance NearbyGroup_Group.MemberLeft@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_1000D7960;
  *(unsigned char *)(a1 + 16) = 0;
  return UnknownStorage.init()();
}

uint64_t protocol witness for static Message.protoMessageName.getter in conformance NearbyGroup_Group.MemberLeft(uint64_t a1, uint64_t a2)
{
  return protocol witness for static Message.protoMessageName.getter in conformance NearbyProtoConnectionResponse.Content(a1, a2, &one-time initialization token for protoMessageName, static NearbyGroup_Group.MemberLeft.protoMessageName);
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance NearbyGroup_Group.MemberLeft()
{
  return NearbyGroup_Group.MemberLeft.decodeMessage<A>(decoder:)();
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance NearbyGroup_Group.MemberLeft()
{
  return NearbyGroup_Group.MemberLeft.traverse<A>(visitor:)();
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance NearbyGroup_Group.MemberLeft(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberLeft);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyGroup_Group.MemberLeft@<X0>(uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyProtoNearbySessionMessageType(&one-time initialization token for _protobuf_nameMap, (uint64_t)static NearbyGroup_Group.MemberLeft._protobuf_nameMap, a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance NearbyGroup_Group.MemberLeft()
{
  lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberLeft);
  return Message.debugDescription.getter();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NearbyGroup_Group.MemberLeft(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberLeft);
  return Message.hash(into:)(a1, a2, v4);
}

uint64_t closure #1 in static Data.== infix(_:_:)@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      outlined copy of Data._Representation(a2, a3);
      uint64_t v10 = (char *)__DataStorage._bytes.getter();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = __DataStorage._offset.getter();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = __DataStorage._length.getter();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x1000B96FCLL);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = outlined consume of Data._Representation(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)__DataStorage._bytes.getter();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = __DataStorage._offset.getter();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = __DataStorage._length.getter();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t specialized static Array<A>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NearbyGroup_Member(0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (uint64_t *)((char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v5);
  uint64_t v10 = (uint64_t *)((char *)&v21 - v9);
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2) {
      return 1;
    }
    unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v22 = *(void *)(v8 + 72);
    while (1)
    {
      outlined init with copy of NearbyGroup_Group.Initialization(a1 + v12, (uint64_t)v10, type metadata accessor for NearbyGroup_Member);
      outlined init with copy of NearbyGroup_Group.Initialization(a2 + v12, (uint64_t)v7, type metadata accessor for NearbyGroup_Member);
      BOOL v13 = *v10 == *v7 && v10[1] == v7[1];
      if (!v13 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        break;
      }
      uint64_t v14 = *(int *)(v4 + 24);
      uint64_t v15 = (void *)((char *)v10 + v14);
      uint64_t v16 = *(void *)((char *)v10 + v14 + 8);
      uint64_t v17 = (void *)((char *)v7 + v14);
      uint64_t v18 = v17[1];
      if (v16)
      {
        if (!v18) {
          break;
        }
        BOOL v19 = *v15 == *v17 && v16 == v18;
        if (!v19 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
          break;
        }
      }
      else if (v18)
      {
        break;
      }
      type metadata accessor for UnknownStorage();
      lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      if ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) == 0) {
        break;
      }
      outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v7, type metadata accessor for NearbyGroup_Member);
      outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v10, type metadata accessor for NearbyGroup_Member);
      v12 += v22;
      if (!--v11) {
        return 1;
      }
    }
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v7, type metadata accessor for NearbyGroup_Member);
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v10, type metadata accessor for NearbyGroup_Member);
  }
  return 0;
}

uint64_t specialized static Array<A>.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  BOOL v5 = a1[4] == a2[4] && a1[5] == a2[5];
  if (v5 || (v6 = _stringCompareWithSmolCheck(_:_:expecting:)(), uint64_t result = 0, (v6 & 1) != 0))
  {
    uint64_t v8 = v2 - 1;
    if (!v8) {
      return 1;
    }
    uint64_t v9 = a1 + 7;
    for (i = a2 + 7; ; i += 2)
    {
      BOOL v11 = *(v9 - 1) == *(i - 1) && *v9 == *i;
      if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
        break;
      }
      v9 += 2;
      if (!--v8) {
        return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t specialized Data.InlineData.withUnsafeBytes<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  closure #1 in static Data.== infix(_:_:)((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t specialized __DataStorage.withUnsafeBytes<A>(in:apply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  __DataStorage._length.getter();
  closure #1 in static Data.== infix(_:_:)(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t specialized static Data.== infix(_:_:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x1000B9E54);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  outlined copy of Data._Representation(a3, a4);
                  outlined copy of Data._Representation(a1, a2);
                  char v17 = specialized __DataStorage.withUnsafeBytes<A>(in:apply:)((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  outlined consume of Data._Representation(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  outlined copy of Data._Representation(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = specialized __DataStorage.withUnsafeBytes<A>(in:apply:)(v21, v22, v20, a3, a4);
                  outlined consume of Data._Representation(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  outlined copy of Data._Representation(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  outlined copy of Data._Representation(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = specialized Data.InlineData.withUnsafeBytes<A>(_:)(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              outlined consume of Data._Representation(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t specialized static NearbyGroup_Group.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v43 = *(void *)(v4 - 8);
  uint64_t v44 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v42 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v41 = (char *)&v37 - v7;
  uint64_t v8 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v38 = (uint64_t)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (NearbyGroup_Group.OneOf_Event?, NearbyGroup_Group.OneOf_Event?));
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v37 - v20;
  __chkstk_darwin(v19);
  int v23 = (char *)&v37 - v22;
  uint64_t v39 = a1;
  outlined init with copy of (String, Any)(a1, (uint64_t)&v37 - v22, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v40 = a2;
  outlined init with copy of (String, Any)(a2, (uint64_t)v21, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v24 = (uint64_t)&v14[*(int *)(v12 + 56)];
  outlined init with copy of (String, Any)((uint64_t)v23, (uint64_t)v14, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  outlined init with copy of (String, Any)((uint64_t)v21, v24, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  unint64_t v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v25((uint64_t)v14, 1, v8) != 1)
  {
    outlined init with copy of (String, Any)((uint64_t)v14, (uint64_t)v18, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    if (v25(v24, 1, v8) != 1)
    {
      uint64_t v26 = v38;
      outlined init with take of NearbyGroup_Member(v24, v38, type metadata accessor for NearbyGroup_Group.OneOf_Event);
      char v27 = specialized static NearbyGroup_Group.OneOf_Event.__derived_enum_equals(_:_:)((uint64_t)v18, v26);
      outlined destroy of NearbyGroup_Group.OneOf_Event(v26, type metadata accessor for NearbyGroup_Group.OneOf_Event);
      outlined destroy of Any?((uint64_t)v21, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
      outlined destroy of Any?((uint64_t)v23, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
      outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v18, type metadata accessor for NearbyGroup_Group.OneOf_Event);
      outlined destroy of Any?((uint64_t)v14, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
      if (v27) {
        goto LABEL_8;
      }
LABEL_9:
      char v34 = 0;
      return v34 & 1;
    }
    outlined destroy of Any?((uint64_t)v21, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    outlined destroy of Any?((uint64_t)v23, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v18, type metadata accessor for NearbyGroup_Group.OneOf_Event);
LABEL_6:
    outlined destroy of Any?((uint64_t)v14, &demangling cache variable for type metadata for (NearbyGroup_Group.OneOf_Event?, NearbyGroup_Group.OneOf_Event?));
    goto LABEL_9;
  }
  outlined destroy of Any?((uint64_t)v21, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  outlined destroy of Any?((uint64_t)v23, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  if (v25(v24, 1, v8) != 1) {
    goto LABEL_6;
  }
  outlined destroy of Any?((uint64_t)v14, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
LABEL_8:
  uint64_t v28 = type metadata accessor for NearbyGroup_Group(0);
  uint64_t v30 = v43;
  uint64_t v29 = v44;
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 16);
  uint64_t v32 = v41;
  v31(v41, v39 + *(int *)(v28 + 20), v44);
  uint64_t v33 = v42;
  v31(v42, v40 + *(int *)(v28 + 20), v29);
  lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
  char v34 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v35 = *(void (**)(char *, uint64_t))(v30 + 8);
  v35(v33, v29);
  v35(v32, v29);
  return v34 & 1;
}

uint64_t specialized static NearbyGroup_Group.Initialization.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v16 - v9;
  if ((specialized static Data.== infix(_:_:)(*(void *)a1, *(void *)(a1 + 8), *(void *)a2, *(void *)(a2 + 8)) & 1) != 0
    && (specialized static Array<A>.== infix(_:_:)(*(void *)(a1 + 16), *(void *)(a2 + 16)) & 1) != 0)
  {
    uint64_t v11 = type metadata accessor for NearbyGroup_Group.Initialization(0);
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v12(v10, a1 + *(int *)(v11 + 24), v4);
    v12(v8, a2 + *(int *)(v11 + 24), v4);
    lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    char v13 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v13 = 0;
  }
  return v13 & 1;
}

uint64_t specialized static NearbyGroup_Group.OneOf_Event.__derived_enum_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v43 = a1;
  uint64_t v44 = a2;
  uint64_t v40 = type metadata accessor for NearbyGroup_Group.MemberLeft(0);
  __chkstk_darwin(v40);
  uint64_t v42 = (uint64_t)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = type metadata accessor for NearbyGroup_Group.Initialization(0);
  __chkstk_darwin(v39);
  uint64_t v41 = (uint64_t)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  uint64_t v11 = __chkstk_darwin(v10);
  char v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (uint64_t *)((char *)&v39 - v15);
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (uint64_t *)((char *)&v39 - v18);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v39 - v20;
  uint64_t v22 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (NearbyGroup_Group.OneOf_Event, NearbyGroup_Group.OneOf_Event));
  uint64_t v23 = __chkstk_darwin(v22 - 8);
  unint64_t v25 = (char *)&v39 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = (uint64_t)&v25[*(int *)(v23 + 56)];
  outlined init with copy of NearbyGroup_Group.Initialization(v43, (uint64_t)v25, type metadata accessor for NearbyGroup_Group.OneOf_Event);
  outlined init with copy of NearbyGroup_Group.Initialization(v44, v26, type metadata accessor for NearbyGroup_Group.OneOf_Event);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      outlined init with copy of NearbyGroup_Group.Initialization((uint64_t)v25, (uint64_t)v19, type metadata accessor for NearbyGroup_Group.OneOf_Event);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        outlined init with take of NearbyGroup_Member(v26, (uint64_t)v8, type metadata accessor for NearbyGroup_Group.MemberAdded);
        char v29 = specialized static NearbyGroup_Group.MemberRemoved.== infix(_:_:)(v19, (uint64_t)v8, type metadata accessor for NearbyGroup_Group.MemberAdded);
        outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v8, type metadata accessor for NearbyGroup_Group.MemberAdded);
        uint64_t v30 = (uint64_t)v19;
        uint64_t v31 = type metadata accessor for NearbyGroup_Group.MemberAdded;
        goto LABEL_8;
      }
      char v27 = type metadata accessor for NearbyGroup_Group.MemberAdded;
      uint64_t v28 = (uint64_t)v19;
      goto LABEL_17;
    case 2u:
      outlined init with copy of NearbyGroup_Group.Initialization((uint64_t)v25, (uint64_t)v16, type metadata accessor for NearbyGroup_Group.OneOf_Event);
      if (swift_getEnumCaseMultiPayload() != 2)
      {
        char v27 = type metadata accessor for NearbyGroup_Group.MemberRemoved;
        uint64_t v28 = (uint64_t)v16;
        goto LABEL_17;
      }
      outlined init with take of NearbyGroup_Member(v26, (uint64_t)v5, type metadata accessor for NearbyGroup_Group.MemberRemoved);
      char v29 = specialized static NearbyGroup_Group.MemberRemoved.== infix(_:_:)(v16, (uint64_t)v5, type metadata accessor for NearbyGroup_Group.MemberRemoved);
      outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v5, type metadata accessor for NearbyGroup_Group.MemberRemoved);
      uint64_t v30 = (uint64_t)v16;
      uint64_t v31 = type metadata accessor for NearbyGroup_Group.MemberRemoved;
LABEL_8:
      outlined destroy of NearbyGroup_Group.OneOf_Event(v30, v31);
      outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v25, type metadata accessor for NearbyGroup_Group.OneOf_Event);
      return v29 & 1;
    case 3u:
      outlined init with copy of NearbyGroup_Group.Initialization((uint64_t)v25, (uint64_t)v13, type metadata accessor for NearbyGroup_Group.OneOf_Event);
      if (swift_getEnumCaseMultiPayload() != 3)
      {
        char v27 = type metadata accessor for NearbyGroup_Group.MemberLeft;
        uint64_t v28 = (uint64_t)v13;
        goto LABEL_17;
      }
      uint64_t v32 = v42;
      outlined init with take of NearbyGroup_Member(v26, v42, type metadata accessor for NearbyGroup_Group.MemberLeft);
      if ((specialized static Data.== infix(_:_:)(*(void *)v13, *((void *)v13 + 1), *(void *)v32, *(void *)(v32 + 8)) & 1) != 0&& v13[16] == *(unsigned char *)(v32 + 16))
      {
        type metadata accessor for UnknownStorage();
        lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
        if (dispatch thunk of static Equatable.== infix(_:_:)())
        {
          uint64_t v33 = type metadata accessor for NearbyGroup_Group.MemberLeft;
          outlined destroy of NearbyGroup_Group.OneOf_Event(v32, type metadata accessor for NearbyGroup_Group.MemberLeft);
          uint64_t v34 = (uint64_t)v13;
          goto LABEL_23;
        }
      }
      uint64_t v35 = type metadata accessor for NearbyGroup_Group.MemberLeft;
      outlined destroy of NearbyGroup_Group.OneOf_Event(v32, type metadata accessor for NearbyGroup_Group.MemberLeft);
      uint64_t v36 = (uint64_t)v13;
      goto LABEL_25;
    default:
      outlined init with copy of NearbyGroup_Group.Initialization((uint64_t)v25, (uint64_t)v21, type metadata accessor for NearbyGroup_Group.OneOf_Event);
      if (swift_getEnumCaseMultiPayload())
      {
        char v27 = type metadata accessor for NearbyGroup_Group.Initialization;
        uint64_t v28 = (uint64_t)v21;
LABEL_17:
        outlined destroy of NearbyGroup_Group.OneOf_Event(v28, v27);
        outlined destroy of Any?((uint64_t)v25, &demangling cache variable for type metadata for (NearbyGroup_Group.OneOf_Event, NearbyGroup_Group.OneOf_Event));
LABEL_26:
        char v29 = 0;
        return v29 & 1;
      }
      uint64_t v37 = v41;
      outlined init with take of NearbyGroup_Member(v26, v41, type metadata accessor for NearbyGroup_Group.Initialization);
      if ((specialized static Data.== infix(_:_:)(*(void *)v21, *((void *)v21 + 1), *(void *)v37, *(void *)(v37 + 8)) & 1) == 0|| (specialized static Array<A>.== infix(_:_:)(*((void *)v21 + 2), *(void *)(v37 + 16)) & 1) == 0|| (type metadata accessor for UnknownStorage(), lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, (void (*)(uint64_t))&type metadata accessor for UnknownStorage), (dispatch thunk of static Equatable.== infix(_:_:)() & 1) == 0))
      {
        uint64_t v35 = type metadata accessor for NearbyGroup_Group.Initialization;
        outlined destroy of NearbyGroup_Group.OneOf_Event(v37, type metadata accessor for NearbyGroup_Group.Initialization);
        uint64_t v36 = (uint64_t)v21;
LABEL_25:
        outlined destroy of NearbyGroup_Group.OneOf_Event(v36, v35);
        outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v25, type metadata accessor for NearbyGroup_Group.OneOf_Event);
        goto LABEL_26;
      }
      uint64_t v33 = type metadata accessor for NearbyGroup_Group.Initialization;
      outlined destroy of NearbyGroup_Group.OneOf_Event(v37, type metadata accessor for NearbyGroup_Group.Initialization);
      uint64_t v34 = (uint64_t)v21;
LABEL_23:
      outlined destroy of NearbyGroup_Group.OneOf_Event(v34, v33);
      outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v25, type metadata accessor for NearbyGroup_Group.OneOf_Event);
      char v29 = 1;
      return v29 & 1;
  }
}

uint64_t specialized static NearbyGroup_Group.MemberRemoved.== infix(_:_:)(uint64_t *a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v53 = a3;
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v51 = *(void *)(v5 - 8);
  uint64_t v52 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  v50 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v46 - v8;
  uint64_t v10 = type metadata accessor for NearbyGroup_Member(0);
  uint64_t v54 = *(void *)(v10 - 8);
  uint64_t v55 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (NearbyGroup_Member?, NearbyGroup_Member?));
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v46 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v19 = (char *)&v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = (char *)&v46 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v46 - v23;
  uint64_t v25 = *a1;
  unint64_t v26 = a1[1];
  char v27 = a1;
  uint64_t v28 = a2;
  if ((specialized static Data.== infix(_:_:)(v25, v26, *(void *)a2, *(void *)(a2 + 8)) & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v48 = v9;
  uint64_t v49 = v19;
  uint64_t v47 = v12;
  uint64_t v29 = v53(0);
  outlined init with copy of (String, Any)((uint64_t)v27 + *(int *)(v29 + 24), (uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Member?);
  outlined init with copy of (String, Any)(a2 + *(int *)(v29 + 24), (uint64_t)v22, &demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v30 = (uint64_t)&v15[*(int *)(v13 + 48)];
  outlined init with copy of (String, Any)((uint64_t)v24, (uint64_t)v15, &demangling cache variable for type metadata for NearbyGroup_Member?);
  outlined init with copy of (String, Any)((uint64_t)v22, v30, &demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v31 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v54 + 48);
  uint64_t v32 = (uint64_t)v15;
  if (v31((uint64_t)v15, 1, v55) == 1)
  {
    uint64_t v54 = v28;
    uint64_t v33 = v29;
    outlined destroy of Any?((uint64_t)v22, &demangling cache variable for type metadata for NearbyGroup_Member?);
    outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Member?);
    if (v31(v30, 1, v55) == 1)
    {
      outlined destroy of Any?((uint64_t)v15, &demangling cache variable for type metadata for NearbyGroup_Member?);
LABEL_11:
      uint64_t v41 = v51;
      uint64_t v40 = v52;
      uint64_t v42 = *(void (**)(char *, char *, uint64_t))(v51 + 16);
      uint64_t v43 = v48;
      v42(v48, (char *)v27 + *(int *)(v33 + 20), v52);
      uint64_t v44 = v50;
      v42(v50, (char *)(v54 + *(int *)(v33 + 20)), v40);
      lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      char v36 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v45 = *(void (**)(char *, uint64_t))(v41 + 8);
      v45(v44, v40);
      v45(v43, v40);
      return v36 & 1;
    }
    goto LABEL_7;
  }
  uint64_t v34 = (uint64_t)v15;
  uint64_t v35 = v49;
  outlined init with copy of (String, Any)(v34, (uint64_t)v49, &demangling cache variable for type metadata for NearbyGroup_Member?);
  if (v31(v30, 1, v55) == 1)
  {
    outlined destroy of Any?((uint64_t)v22, &demangling cache variable for type metadata for NearbyGroup_Member?);
    outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Member?);
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v35, type metadata accessor for NearbyGroup_Member);
LABEL_7:
    outlined destroy of Any?(v32, &demangling cache variable for type metadata for (NearbyGroup_Member?, NearbyGroup_Member?));
    goto LABEL_8;
  }
  uint64_t v54 = v28;
  uint64_t v33 = v29;
  uint64_t v38 = v47;
  outlined init with take of NearbyGroup_Member(v30, (uint64_t)v47, type metadata accessor for NearbyGroup_Member);
  char v39 = specialized static NearbyGroup_Member.== infix(_:_:)(v35, v38);
  outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v38, type metadata accessor for NearbyGroup_Member);
  outlined destroy of Any?((uint64_t)v22, &demangling cache variable for type metadata for NearbyGroup_Member?);
  outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for NearbyGroup_Member?);
  outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v35, type metadata accessor for NearbyGroup_Member);
  outlined destroy of Any?(v32, &demangling cache variable for type metadata for NearbyGroup_Member?);
  if (v39) {
    goto LABEL_11;
  }
LABEL_8:
  char v36 = 0;
  return v36 & 1;
}

uint64_t specialized static NearbyGroup_Group.MemberLeft.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v16 - v9;
  if ((specialized static Data.== infix(_:_:)(*(void *)a1, *(void *)(a1 + 8), *(void *)a2, *(void *)(a2 + 8)) & 1) != 0
    && *(unsigned __int8 *)(a1 + 16) == *(unsigned __int8 *)(a2 + 16))
  {
    uint64_t v12 = type metadata accessor for NearbyGroup_Group.MemberLeft(0);
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v13(v10, a1 + *(int *)(v12 + 24), v4);
    v13(v8, a2 + *(int *)(v12 + 24), v4);
    lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
    char v11 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v14 = *(void (**)(char *, uint64_t))(v5 + 8);
    v14(v8, v4);
    v14(v10, v4);
  }
  else
  {
    char v11 = 0;
  }
  return v11 & 1;
}

uint64_t specialized static NearbyGroup_Member.== infix(_:_:)(char *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v23 - v9;
  if (*(void *)a1 != *(void *)a2 || *((void *)a1 + 1) != *((void *)a2 + 1))
  {
    char v12 = 0;
    if ((_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
      return v12 & 1;
    }
  }
  uint64_t v13 = type metadata accessor for NearbyGroup_Member(0);
  uint64_t v14 = *(int *)(v13 + 24);
  uint64_t v15 = &a1[v14];
  uint64_t v16 = *(void *)&a1[v14 + 8];
  uint64_t v17 = &a2[v14];
  uint64_t v18 = *((void *)v17 + 1);
  if (!v16)
  {
    if (!v18)
    {
LABEL_16:
      uint64_t v20 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v20(v10, &a1[*(int *)(v13 + 20)], v4);
      v20(v8, &a2[*(int *)(v13 + 20)], v4);
      lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage, (void (*)(uint64_t))&type metadata accessor for UnknownStorage);
      char v12 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v21 = *(void (**)(char *, uint64_t))(v5 + 8);
      v21(v8, v4);
      v21(v10, v4);
      return v12 & 1;
    }
LABEL_15:
    char v12 = 0;
    return v12 & 1;
  }
  if (!v18) {
    goto LABEL_15;
  }
  if (*(void *)v15 == *(void *)v17 && v16 == v18) {
    goto LABEL_16;
  }
  char v12 = 0;
  if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
    goto LABEL_16;
  }
  return v12 & 1;
}

uint64_t lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t base witness table accessor for CustomDebugStringConvertible in NearbyGroup_Member()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Member);
}

uint64_t base witness table accessor for Message in NearbyGroup_Member()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Member);
}

uint64_t base witness table accessor for Hashable in NearbyGroup_Member()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Member);
}

uint64_t base witness table accessor for Equatable in NearbyGroup_Member()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Member);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in NearbyGroup_Group()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group);
}

uint64_t base witness table accessor for Message in NearbyGroup_Group()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member((unint64_t *)&lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group);
}

uint64_t base witness table accessor for Hashable in NearbyGroup_Group()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group);
}

uint64_t base witness table accessor for Equatable in NearbyGroup_Group()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in NearbyGroup_Group.Initialization()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.Initialization);
}

uint64_t base witness table accessor for Message in NearbyGroup_Group.Initialization()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.Initialization);
}

uint64_t base witness table accessor for Hashable in NearbyGroup_Group.Initialization()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.Initialization);
}

uint64_t base witness table accessor for Equatable in NearbyGroup_Group.Initialization()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.Initialization);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in NearbyGroup_Group.MemberAdded()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberAdded);
}

uint64_t base witness table accessor for Message in NearbyGroup_Group.MemberAdded()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberAdded);
}

uint64_t base witness table accessor for Hashable in NearbyGroup_Group.MemberAdded()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberAdded);
}

uint64_t base witness table accessor for Equatable in NearbyGroup_Group.MemberAdded()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberAdded);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in NearbyGroup_Group.MemberRemoved()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

uint64_t base witness table accessor for Message in NearbyGroup_Group.MemberRemoved()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

uint64_t base witness table accessor for Hashable in NearbyGroup_Group.MemberRemoved()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

uint64_t base witness table accessor for Equatable in NearbyGroup_Group.MemberRemoved()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in NearbyGroup_Group.MemberLeft()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberLeft);
}

uint64_t base witness table accessor for Message in NearbyGroup_Group.MemberLeft()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberLeft);
}

uint64_t base witness table accessor for Hashable in NearbyGroup_Group.MemberLeft()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberLeft);
}

uint64_t base witness table accessor for Equatable in NearbyGroup_Group.MemberLeft()
{
  return lazy protocol witness table accessor for type NearbyGroup_Member and conformance NearbyGroup_Member(&lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.MemberLeft);
}

uint64_t sub_1000BBCE4@<X0>(uint64_t a1@<X8>)
{
  return NearbyGroup_Group.initialize.getter(a1);
}

uint64_t sub_1000BBD08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for NearbyGroup_Group.initialize : NearbyGroup_Group(a1, a2, a3, a4, type metadata accessor for NearbyGroup_Group.Initialization, type metadata accessor for NearbyGroup_Group.Initialization, type metadata accessor for NearbyGroup_Group.Initialization);
}

uint64_t sub_1000BBD60@<X0>(_OWORD *a1@<X8>)
{
  return NearbyGroup_Group.memberAdded.getter(a1);
}

uint64_t sub_1000BBD84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for NearbyGroup_Group.initialize : NearbyGroup_Group(a1, a2, a3, a4, type metadata accessor for NearbyGroup_Group.MemberAdded, type metadata accessor for NearbyGroup_Group.MemberAdded, type metadata accessor for NearbyGroup_Group.MemberAdded);
}

uint64_t sub_1000BBDDC@<X0>(_OWORD *a1@<X8>)
{
  return NearbyGroup_Group.memberRemoved.getter(a1);
}

uint64_t sub_1000BBE00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for NearbyGroup_Group.initialize : NearbyGroup_Group(a1, a2, a3, a4, type metadata accessor for NearbyGroup_Group.MemberRemoved, type metadata accessor for NearbyGroup_Group.MemberRemoved, type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

uint64_t sub_1000BBE58@<X0>(uint64_t a1@<X8>)
{
  return NearbyGroup_Group.memberLeft.getter(a1);
}

uint64_t sub_1000BBE7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for NearbyGroup_Group.initialize : NearbyGroup_Group(a1, a2, a3, a4, type metadata accessor for NearbyGroup_Group.MemberLeft, type metadata accessor for NearbyGroup_Group.MemberLeft, type metadata accessor for NearbyGroup_Group.MemberLeft);
}

uint64_t sub_1000BBED4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return key path getter for NearbyGroup_Group.MemberAdded.member : NearbyGroup_Group.MemberAdded(a1, type metadata accessor for NearbyGroup_Group.MemberAdded, a2);
}

uint64_t sub_1000BBF00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for NearbyGroup_Group.MemberAdded.member : NearbyGroup_Group.MemberAdded(a1, a2, a3, a4, type metadata accessor for NearbyGroup_Group.MemberAdded);
}

uint64_t sub_1000BBF2C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return key path getter for NearbyGroup_Group.MemberAdded.member : NearbyGroup_Group.MemberAdded(a1, type metadata accessor for NearbyGroup_Group.MemberRemoved, a2);
}

uint64_t sub_1000BBF58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for NearbyGroup_Group.MemberAdded.member : NearbyGroup_Group.MemberAdded(a1, a2, a3, a4, type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

uint64_t *initializeBufferWithCopyOfBuffer for NearbyGroup_Member(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for UnknownStorage();
    char v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for NearbyGroup_Member(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for NearbyGroup_Member(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for UnknownStorage();
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = v14[1];
  void *v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for NearbyGroup_Member(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  *uint64_t v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for NearbyGroup_Member(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *assignWithTake for NearbyGroup_Member(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (void *)((char *)a1 + v11);
  uint64_t v13 = (void *)((char *)a2 + v11);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  void *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for NearbyGroup_Member(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000BC410);
}

uint64_t sub_1000BC410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 20);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for NearbyGroup_Member(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000BC4D4);
}

uint64_t sub_1000BC4D4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 20);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for NearbyGroup_Member()
{
  uint64_t result = type metadata accessor for UnknownStorage();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for NearbyGroup_Group(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v16 = *a2;
          unint64_t v17 = a2[1];
          outlined copy of Data._Representation(*a2, v17);
          *a1 = v16;
          a1[1] = v17;
          uint64_t v18 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
          goto LABEL_9;
        case 2u:
          uint64_t v19 = *a2;
          unint64_t v20 = a2[1];
          outlined copy of Data._Representation(*a2, v20);
          *a1 = v19;
          a1[1] = v20;
          uint64_t v18 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
LABEL_9:
          uint64_t v21 = v18;
          uint64_t v22 = *(int *)(v18 + 20);
          uint64_t v23 = (char *)a1 + v22;
          uint64_t v24 = (char *)a2 + v22;
          uint64_t v25 = type metadata accessor for UnknownStorage();
          uint64_t v53 = *(void (**)(char *, char *, uint64_t))(*(void *)(v25 - 8) + 16);
          v53(v23, v24, v25);
          uint64_t v26 = *(int *)(v21 + 24);
          char v27 = (uint64_t *)((char *)a1 + v26);
          uint64_t v28 = (uint64_t *)((char *)a2 + v26);
          uint64_t v29 = type metadata accessor for NearbyGroup_Member(0);
          uint64_t v30 = *(void *)(v29 - 8);
          if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
          {
            uint64_t v31 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
            memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
          }
          else
          {
            uint64_t v38 = v28[1];
            *char v27 = *v28;
            v27[1] = v38;
            uint64_t v39 = *(int *)(v29 + 20);
            v50 = (char *)v28 + v39;
            uint64_t v51 = (char *)v27 + v39;
            swift_bridgeObjectRetain();
            v53(v51, v50, v25);
            uint64_t v40 = *(int *)(v29 + 24);
            uint64_t v41 = (void *)((char *)v27 + v40);
            uint64_t v42 = (void *)((char *)v28 + v40);
            uint64_t v43 = v42[1];
            *uint64_t v41 = *v42;
            v41[1] = v43;
            uint64_t v44 = *(void (**)(void *, void, uint64_t, uint64_t))(v30 + 56);
            swift_bridgeObjectRetain();
            v44(v27, 0, 1, v29);
          }
          break;
        case 3u:
          uint64_t v32 = *a2;
          unint64_t v33 = a2[1];
          outlined copy of Data._Representation(*a2, v33);
          *a1 = v32;
          a1[1] = v33;
          *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
          uint64_t v34 = *(int *)(type metadata accessor for NearbyGroup_Group.MemberLeft(0) + 24);
          uint64_t v35 = (char *)a1 + v34;
          char v36 = (char *)a2 + v34;
          uint64_t v37 = type metadata accessor for UnknownStorage();
          (*(void (**)(char *, char *, uint64_t))(*(void *)(v37 - 8) + 16))(v35, v36, v37);
          break;
        default:
          uint64_t v11 = *a2;
          unint64_t v12 = a2[1];
          outlined copy of Data._Representation(*a2, v12);
          *a1 = v11;
          a1[1] = v12;
          a1[2] = a2[2];
          uint64_t v13 = *(int *)(type metadata accessor for NearbyGroup_Group.Initialization(0) + 24);
          uint64_t v52 = (char *)a2 + v13;
          uint64_t v54 = (char *)a1 + v13;
          uint64_t v14 = type metadata accessor for UnknownStorage();
          uint64_t v15 = *(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16);
          swift_bridgeObjectRetain();
          v15(v54, v52, v14);
          break;
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v45 = *(int *)(a3 + 20);
    uint64_t v46 = (char *)a1 + v45;
    uint64_t v47 = (char *)a2 + v45;
    uint64_t v48 = type metadata accessor for UnknownStorage();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v48 - 8) + 16))(v46, v47, v48);
  }
  return a1;
}

uint64_t destroy for NearbyGroup_Group(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4))
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));
        swift_bridgeObjectRelease();
        uint64_t v9 = type metadata accessor for NearbyGroup_Group.Initialization(0);
        goto LABEL_12;
      case 1u:
        outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));
        uint64_t v10 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
        goto LABEL_9;
      case 2u:
        outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));
        uint64_t v10 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
LABEL_9:
        uint64_t v11 = v10;
        uint64_t v12 = a1 + *(int *)(v10 + 20);
        uint64_t v13 = type metadata accessor for UnknownStorage();
        uint64_t v14 = *(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8);
        v14(v12, v13);
        uint64_t v15 = a1 + *(int *)(v11 + 24);
        uint64_t v16 = type metadata accessor for NearbyGroup_Member(0);
        if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 48))(v15, 1, v16))
        {
          swift_bridgeObjectRelease();
          v14(v15 + *(int *)(v16 + 20), v13);
          swift_bridgeObjectRelease();
        }
        break;
      case 3u:
        outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));
        uint64_t v9 = type metadata accessor for NearbyGroup_Group.MemberLeft(0);
LABEL_12:
        uint64_t v17 = a1 + *(int *)(v9 + 24);
        uint64_t v18 = type metadata accessor for UnknownStorage();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v18 - 8) + 8))(v17, v18);
        break;
      default:
        break;
    }
  }
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for UnknownStorage();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

void *initializeWithCopy for NearbyGroup_Group(void *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v14 = *a2;
        unint64_t v15 = a2[1];
        outlined copy of Data._Representation(*a2, v15);
        *a1 = v14;
        a1[1] = v15;
        uint64_t v16 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
        goto LABEL_7;
      case 2u:
        uint64_t v17 = *a2;
        unint64_t v18 = a2[1];
        outlined copy of Data._Representation(*a2, v18);
        *a1 = v17;
        a1[1] = v18;
        uint64_t v16 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
LABEL_7:
        uint64_t v19 = v16;
        uint64_t v20 = *(int *)(v16 + 20);
        uint64_t v21 = (char *)a1 + v20;
        uint64_t v22 = (char *)a2 + v20;
        uint64_t v23 = type metadata accessor for UnknownStorage();
        uint64_t v51 = *(void (**)(char *, char *, uint64_t))(*(void *)(v23 - 8) + 16);
        v51(v21, v22, v23);
        uint64_t v24 = *(int *)(v19 + 24);
        uint64_t v25 = (void *)((char *)a1 + v24);
        uint64_t v26 = (uint64_t *)((char *)a2 + v24);
        uint64_t v27 = type metadata accessor for NearbyGroup_Member(0);
        uint64_t v28 = *(void *)(v27 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
        {
          uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
          memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
        }
        else
        {
          uint64_t v36 = v26[1];
          *uint64_t v25 = *v26;
          v25[1] = v36;
          uint64_t v37 = *(int *)(v27 + 20);
          uint64_t v48 = (char *)v26 + v37;
          uint64_t v49 = (char *)v25 + v37;
          swift_bridgeObjectRetain();
          v51(v49, v48, v23);
          uint64_t v38 = *(int *)(v27 + 24);
          uint64_t v39 = (void *)((char *)v25 + v38);
          uint64_t v40 = (void *)((char *)v26 + v38);
          uint64_t v41 = v40[1];
          *uint64_t v39 = *v40;
          v39[1] = v41;
          uint64_t v42 = *(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56);
          swift_bridgeObjectRetain();
          v42(v25, 0, 1, v27);
        }
        break;
      case 3u:
        uint64_t v30 = *a2;
        unint64_t v31 = a2[1];
        outlined copy of Data._Representation(*a2, v31);
        *a1 = v30;
        a1[1] = v31;
        *((unsigned char *)a1 + 16) = *((unsigned char *)a2 + 16);
        uint64_t v32 = *(int *)(type metadata accessor for NearbyGroup_Group.MemberLeft(0) + 24);
        unint64_t v33 = (char *)a1 + v32;
        uint64_t v34 = (char *)a2 + v32;
        uint64_t v35 = type metadata accessor for UnknownStorage();
        (*(void (**)(char *, char *, uint64_t))(*(void *)(v35 - 8) + 16))(v33, v34, v35);
        break;
      default:
        uint64_t v9 = *a2;
        unint64_t v10 = a2[1];
        outlined copy of Data._Representation(*a2, v10);
        *a1 = v9;
        a1[1] = v10;
        a1[2] = a2[2];
        uint64_t v11 = *(int *)(type metadata accessor for NearbyGroup_Group.Initialization(0) + 24);
        v50 = (char *)a2 + v11;
        uint64_t v52 = (char *)a1 + v11;
        uint64_t v12 = type metadata accessor for UnknownStorage();
        uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
        swift_bridgeObjectRetain();
        v13(v52, v50, v12);
        break;
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v43 = *(int *)(a3 + 20);
  uint64_t v44 = (char *)a1 + v43;
  uint64_t v45 = (char *)a2 + v43;
  uint64_t v46 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v46 - 8) + 16))(v44, v45, v46);
  return a1;
}

uint64_t assignWithCopy for NearbyGroup_Group(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          uint64_t v25 = *(void *)a2;
          unint64_t v26 = *(void *)(a2 + 8);
          outlined copy of Data._Representation(*(void *)a2, v26);
          *(void *)a1 = v25;
          *(void *)(a1 + 8) = v26;
          uint64_t v27 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
          uint64_t v28 = *(int *)(v27 + 20);
          uint64_t v29 = a1 + v28;
          uint64_t v30 = a2 + v28;
          uint64_t v31 = type metadata accessor for UnknownStorage();
          v119 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 16);
          v119(v29, v30, v31);
          uint64_t v32 = *(int *)(v27 + 24);
          unint64_t v33 = (void *)(a1 + v32);
          uint64_t v34 = (void *)(a2 + v32);
          uint64_t v35 = type metadata accessor for NearbyGroup_Member(0);
          uint64_t v36 = *(void *)(v35 - 8);
          if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v36 + 48))(v34, 1, v35)) {
            goto LABEL_14;
          }
          *unint64_t v33 = *v34;
          v33[1] = v34[1];
          uint64_t v85 = *(int *)(v35 + 20);
          v110 = (char *)v34 + v85;
          v112 = (char *)v33 + v85;
          swift_bridgeObjectRetain();
          v119((uint64_t)v112, (uint64_t)v110, v31);
          uint64_t v86 = *(int *)(v35 + 24);
          v87 = (void *)((char *)v33 + v86);
          v88 = (void *)((char *)v34 + v86);
          void *v87 = *v88;
          v87[1] = v88[1];
          v89 = *(void (**)(void *, void, uint64_t, uint64_t))(v36 + 56);
          swift_bridgeObjectRetain();
          v89(v33, 0, 1, v35);
          break;
        case 2u:
          uint64_t v37 = *(void *)a2;
          unint64_t v38 = *(void *)(a2 + 8);
          outlined copy of Data._Representation(*(void *)a2, v38);
          *(void *)a1 = v37;
          *(void *)(a1 + 8) = v38;
          uint64_t v39 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
          uint64_t v40 = *(int *)(v39 + 20);
          uint64_t v41 = a1 + v40;
          uint64_t v42 = a2 + v40;
          uint64_t v43 = type metadata accessor for UnknownStorage();
          v120 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 16);
          v120(v41, v42, v43);
          uint64_t v44 = *(int *)(v39 + 24);
          unint64_t v33 = (void *)(a1 + v44);
          uint64_t v34 = (void *)(a2 + v44);
          uint64_t v45 = type metadata accessor for NearbyGroup_Member(0);
          uint64_t v46 = *(void *)(v45 - 8);
          if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v46 + 48))(v34, 1, v45))
          {
LABEL_14:
            uint64_t v47 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
            memcpy(v33, v34, *(void *)(*(void *)(v47 - 8) + 64));
          }
          else
          {
            *unint64_t v33 = *v34;
            v33[1] = v34[1];
            uint64_t v90 = *(int *)(v45 + 20);
            v111 = (char *)v34 + v90;
            v113 = (char *)v33 + v90;
            swift_bridgeObjectRetain();
            v120((uint64_t)v113, (uint64_t)v111, v43);
            uint64_t v91 = *(int *)(v45 + 24);
            v92 = (void *)((char *)v33 + v91);
            v93 = (void *)((char *)v34 + v91);
            void *v92 = *v93;
            v92[1] = v93[1];
            v94 = *(void (**)(void *, void, uint64_t, uint64_t))(v46 + 56);
            swift_bridgeObjectRetain();
            v94(v33, 0, 1, v45);
          }
          break;
        case 3u:
          uint64_t v48 = *(void *)a2;
          unint64_t v49 = *(void *)(a2 + 8);
          outlined copy of Data._Representation(*(void *)a2, v49);
          *(void *)a1 = v48;
          *(void *)(a1 + 8) = v49;
          *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
          uint64_t v50 = *(int *)(type metadata accessor for NearbyGroup_Group.MemberLeft(0) + 24);
          uint64_t v51 = a1 + v50;
          uint64_t v52 = a2 + v50;
          uint64_t v53 = type metadata accessor for UnknownStorage();
          (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v53 - 8) + 16))(v51, v52, v53);
          break;
        default:
          uint64_t v11 = *(void *)a2;
          unint64_t v12 = *(void *)(a2 + 8);
          outlined copy of Data._Representation(*(void *)a2, v12);
          *(void *)a1 = v11;
          *(void *)(a1 + 8) = v12;
          *(void *)(a1 + 16) = *(void *)(a2 + 16);
          uint64_t v13 = *(int *)(type metadata accessor for NearbyGroup_Group.Initialization(0) + 24);
          uint64_t v118 = a1 + v13;
          uint64_t v14 = a2 + v13;
          uint64_t v15 = type metadata accessor for UnknownStorage();
          uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16);
          swift_bridgeObjectRetain();
          v16(v118, v14, v15);
          break;
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_24;
    }
LABEL_7:
    uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    memcpy((void *)a1, (const void *)a2, *(void *)(*(void *)(v17 - 8) + 64));
    goto LABEL_24;
  }
  if (v10)
  {
    outlined destroy of NearbyGroup_Group.OneOf_Event(a1, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    outlined destroy of NearbyGroup_Group.OneOf_Event(a1, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v54 = *(void *)a2;
        unint64_t v55 = *(void *)(a2 + 8);
        outlined copy of Data._Representation(*(void *)a2, v55);
        *(void *)a1 = v54;
        *(void *)(a1 + 8) = v55;
        uint64_t v56 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
        uint64_t v57 = *(int *)(v56 + 20);
        uint64_t v58 = (char *)(a1 + v57);
        v59 = (char *)(a2 + v57);
        uint64_t v60 = type metadata accessor for UnknownStorage();
        v61 = (void (**)(char *, char *, uint64_t))(*(void *)(v60 - 8) + 16);
        v121 = *v61;
        (*v61)(v58, v59, v60);
        uint64_t v62 = *(int *)(v56 + 24);
        long long v63 = (void *)(a1 + v62);
        unint64_t v64 = (void *)(a2 + v62);
        uint64_t v65 = type metadata accessor for NearbyGroup_Member(0);
        uint64_t v66 = *(void *)(v65 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v66 + 48))(v64, 1, v65)) {
          goto LABEL_17;
        }
        *long long v63 = *v64;
        v63[1] = v64[1];
        uint64_t v100 = *(int *)(v65 + 20);
        v114 = (char *)v64 + v100;
        v116 = (char *)v63 + v100;
        swift_bridgeObjectRetain();
        v121(v116, v114, v60);
        uint64_t v101 = *(int *)(v65 + 24);
        v102 = (void *)((char *)v63 + v101);
        v103 = (void *)((char *)v64 + v101);
        void *v102 = *v103;
        v102[1] = v103[1];
        v104 = *(void (**)(void *, void, uint64_t, uint64_t))(v66 + 56);
        swift_bridgeObjectRetain();
        v104(v63, 0, 1, v65);
        goto LABEL_26;
      case 2u:
        uint64_t v68 = *(void *)a2;
        unint64_t v69 = *(void *)(a2 + 8);
        outlined copy of Data._Representation(*(void *)a2, v69);
        *(void *)a1 = v68;
        *(void *)(a1 + 8) = v69;
        uint64_t v70 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
        uint64_t v71 = *(int *)(v70 + 20);
        v72 = (char *)(a1 + v71);
        v73 = (char *)(a2 + v71);
        uint64_t v74 = type metadata accessor for UnknownStorage();
        v75 = (void (**)(char *, char *, uint64_t))(*(void *)(v74 - 8) + 16);
        v122 = *v75;
        (*v75)(v72, v73, v74);
        uint64_t v76 = *(int *)(v70 + 24);
        long long v63 = (void *)(a1 + v76);
        unint64_t v64 = (void *)(a2 + v76);
        uint64_t v77 = type metadata accessor for NearbyGroup_Member(0);
        uint64_t v78 = *(void *)(v77 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v78 + 48))(v64, 1, v77))
        {
LABEL_17:
          uint64_t v67 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
          memcpy(v63, v64, *(void *)(*(void *)(v67 - 8) + 64));
        }
        else
        {
          *long long v63 = *v64;
          v63[1] = v64[1];
          uint64_t v105 = *(int *)(v77 + 20);
          v115 = (char *)v64 + v105;
          v117 = (char *)v63 + v105;
          swift_bridgeObjectRetain();
          v122(v117, v115, v74);
          uint64_t v106 = *(int *)(v77 + 24);
          v107 = (void *)((char *)v63 + v106);
          v108 = (void *)((char *)v64 + v106);
          void *v107 = *v108;
          v107[1] = v108[1];
          v109 = *(void (**)(void *, void, uint64_t, uint64_t))(v78 + 56);
          swift_bridgeObjectRetain();
          v109(v63, 0, 1, v77);
        }
LABEL_26:
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        uint64_t v79 = *(void *)a2;
        unint64_t v80 = *(void *)(a2 + 8);
        outlined copy of Data._Representation(*(void *)a2, v80);
        *(void *)a1 = v79;
        *(void *)(a1 + 8) = v80;
        *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
        uint64_t v81 = *(int *)(type metadata accessor for NearbyGroup_Group.MemberLeft(0) + 24);
        uint64_t v82 = a1 + v81;
        uint64_t v83 = a2 + v81;
        uint64_t v84 = type metadata accessor for UnknownStorage();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v84 - 8) + 16))(v82, v83, v84);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        uint64_t v18 = *(void *)a2;
        unint64_t v19 = *(void *)(a2 + 8);
        outlined copy of Data._Representation(*(void *)a2, v19);
        *(void *)a1 = v18;
        *(void *)(a1 + 8) = v19;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        uint64_t v20 = *(int *)(type metadata accessor for NearbyGroup_Group.Initialization(0) + 24);
        uint64_t v21 = a1 + v20;
        uint64_t v22 = a2 + v20;
        uint64_t v23 = type metadata accessor for UnknownStorage();
        uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 16);
        swift_bridgeObjectRetain();
        v24(v21, v22, v23);
        swift_storeEnumTagMultiPayload();
        break;
    }
  }
LABEL_24:
  uint64_t v95 = *(int *)(a3 + 20);
  uint64_t v96 = a1 + v95;
  uint64_t v97 = a2 + v95;
  uint64_t v98 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v98 - 8) + 24))(v96, v97, v98);
  return a1;
}

unsigned char *initializeWithTake for NearbyGroup_Group(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v13 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
        uint64_t v14 = *(int *)(v13 + 20);
        uint64_t v15 = &a1[v14];
        uint64_t v16 = &a2[v14];
        uint64_t v17 = type metadata accessor for UnknownStorage();
        unint64_t v38 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v17 - 8) + 32);
        v38(v15, v16, v17);
        uint64_t v18 = *(int *)(v13 + 24);
        unint64_t v19 = &a1[v18];
        uint64_t v20 = &a2[v18];
        uint64_t v21 = type metadata accessor for NearbyGroup_Member(0);
        uint64_t v22 = *(void *)(v21 - 8);
        if (!(*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21)) {
          goto LABEL_10;
        }
        goto LABEL_8;
      case 2u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v23 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
        uint64_t v24 = *(int *)(v23 + 20);
        uint64_t v25 = &a1[v24];
        unint64_t v26 = &a2[v24];
        uint64_t v17 = type metadata accessor for UnknownStorage();
        unint64_t v38 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v17 - 8) + 32);
        v38(v25, v26, v17);
        uint64_t v27 = *(int *)(v23 + 24);
        unint64_t v19 = &a1[v27];
        uint64_t v20 = &a2[v27];
        uint64_t v21 = type metadata accessor for NearbyGroup_Member(0);
        uint64_t v22 = *(void *)(v21 - 8);
        if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
        {
LABEL_8:
          uint64_t v28 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
          memcpy(v19, v20, *(void *)(*(void *)(v28 - 8) + 64));
        }
        else
        {
LABEL_10:
          *unint64_t v19 = *v20;
          v38((unsigned char *)v19 + *(int *)(v21 + 20), (unsigned char *)v20 + *(int *)(v21 + 20), v17);
          *(_OWORD *)((char *)v19 + *(int *)(v21 + 24)) = *(_OWORD *)((char *)v20 + *(int *)(v21 + 24));
          (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
        }
        break;
      case 3u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        a1[16] = a2[16];
        uint64_t v29 = *(int *)(type metadata accessor for NearbyGroup_Group.MemberLeft(0) + 24);
        uint64_t v30 = &a1[v29];
        uint64_t v31 = &a2[v29];
        uint64_t v32 = type metadata accessor for UnknownStorage();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v32 - 8) + 32))(v30, v31, v32);
        break;
      default:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *((void *)a1 + 2) = *((void *)a2 + 2);
        uint64_t v9 = *(int *)(type metadata accessor for NearbyGroup_Group.Initialization(0) + 24);
        int v10 = &a1[v9];
        uint64_t v11 = &a2[v9];
        uint64_t v12 = type metadata accessor for UnknownStorage();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v12 - 8) + 32))(v10, v11, v12);
        break;
    }
    swift_storeEnumTagMultiPayload();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v33 = *(int *)(a3 + 20);
  uint64_t v34 = &a1[v33];
  uint64_t v35 = &a2[v33];
  uint64_t v36 = type metadata accessor for UnknownStorage();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v36 - 8) + 32))(v34, v35, v36);
  return a1;
}

unsigned char *assignWithTake for NearbyGroup_Group(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 1u:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          uint64_t v20 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
          uint64_t v21 = *(int *)(v20 + 20);
          uint64_t v22 = &a1[v21];
          uint64_t v23 = &a2[v21];
          uint64_t v24 = type metadata accessor for UnknownStorage();
          uint64_t v67 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v24 - 8) + 32);
          v67(v22, v23, v24);
          uint64_t v25 = *(int *)(v20 + 24);
          unint64_t v26 = &a1[v25];
          uint64_t v27 = &a2[v25];
          uint64_t v28 = type metadata accessor for NearbyGroup_Member(0);
          uint64_t v29 = *(void *)(v28 - 8);
          if (!(*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28)) {
            goto LABEL_21;
          }
          goto LABEL_14;
        case 2u:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          uint64_t v30 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
          uint64_t v31 = *(int *)(v30 + 20);
          uint64_t v32 = &a1[v31];
          uint64_t v33 = &a2[v31];
          uint64_t v24 = type metadata accessor for UnknownStorage();
          uint64_t v67 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v24 - 8) + 32);
          v67(v32, v33, v24);
          uint64_t v34 = *(int *)(v30 + 24);
          unint64_t v26 = &a1[v34];
          uint64_t v27 = &a2[v34];
          uint64_t v28 = type metadata accessor for NearbyGroup_Member(0);
          uint64_t v29 = *(void *)(v28 - 8);
          if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
          {
LABEL_14:
            uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
            memcpy(v26, v27, *(void *)(*(void *)(v35 - 8) + 64));
          }
          else
          {
LABEL_21:
            *unint64_t v26 = *v27;
            v67((unsigned char *)v26 + *(int *)(v28 + 20), (unsigned char *)v27 + *(int *)(v28 + 20), v24);
            *(_OWORD *)((char *)v26 + *(int *)(v28 + 24)) = *(_OWORD *)((char *)v27 + *(int *)(v28 + 24));
            (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
          }
          break;
        case 3u:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          a1[16] = a2[16];
          uint64_t v36 = *(int *)(type metadata accessor for NearbyGroup_Group.MemberLeft(0) + 24);
          uint64_t v37 = &a1[v36];
          unint64_t v38 = &a2[v36];
          uint64_t v39 = type metadata accessor for UnknownStorage();
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v39 - 8) + 32))(v37, v38, v39);
          break;
        default:
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *((void *)a1 + 2) = *((void *)a2 + 2);
          uint64_t v11 = *(int *)(type metadata accessor for NearbyGroup_Group.Initialization(0) + 24);
          uint64_t v12 = &a1[v11];
          uint64_t v13 = &a2[v11];
          uint64_t v14 = type metadata accessor for UnknownStorage();
          (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v14 - 8) + 32))(v12, v13, v14);
          break;
      }
      swift_storeEnumTagMultiPayload();
      (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_23;
    }
LABEL_7:
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    memcpy(a1, a2, *(void *)(*(void *)(v15 - 8) + 64));
    goto LABEL_23;
  }
  if (v10)
  {
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)a1, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    goto LABEL_7;
  }
  if (a1 != a2)
  {
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)a1, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v40 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
        uint64_t v41 = *(int *)(v40 + 20);
        uint64_t v42 = &a1[v41];
        uint64_t v43 = &a2[v41];
        uint64_t v44 = type metadata accessor for UnknownStorage();
        uint64_t v45 = (void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 32);
        uint64_t v68 = *v45;
        (*v45)(v42, v43, v44);
        uint64_t v46 = *(int *)(v40 + 24);
        uint64_t v47 = &a1[v46];
        uint64_t v48 = &a2[v46];
        uint64_t v49 = type metadata accessor for NearbyGroup_Member(0);
        uint64_t v50 = *(void *)(v49 - 8);
        if (!(*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v50 + 48))(v48, 1, v49)) {
          goto LABEL_24;
        }
        goto LABEL_17;
      case 2u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v52 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
        uint64_t v53 = *(int *)(v52 + 20);
        uint64_t v54 = &a1[v53];
        unint64_t v55 = &a2[v53];
        uint64_t v44 = type metadata accessor for UnknownStorage();
        uint64_t v56 = (void (**)(char *, char *, uint64_t))(*(void *)(v44 - 8) + 32);
        uint64_t v68 = *v56;
        (*v56)(v54, v55, v44);
        uint64_t v57 = *(int *)(v52 + 24);
        uint64_t v47 = &a1[v57];
        uint64_t v48 = &a2[v57];
        uint64_t v49 = type metadata accessor for NearbyGroup_Member(0);
        uint64_t v50 = *(void *)(v49 - 8);
        if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v50 + 48))(v48, 1, v49))
        {
LABEL_17:
          uint64_t v51 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
          memcpy(v47, v48, *(void *)(*(void *)(v51 - 8) + 64));
        }
        else
        {
LABEL_24:
          *uint64_t v47 = *v48;
          v68((char *)v47 + *(int *)(v49 + 20), (char *)v48 + *(int *)(v49 + 20), v44);
          *(_OWORD *)((char *)v47 + *(int *)(v49 + 24)) = *(_OWORD *)((char *)v48 + *(int *)(v49 + 24));
          (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v50 + 56))(v47, 0, 1, v49);
        }
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        a1[16] = a2[16];
        uint64_t v58 = *(int *)(type metadata accessor for NearbyGroup_Group.MemberLeft(0) + 24);
        v59 = &a1[v58];
        uint64_t v60 = &a2[v58];
        uint64_t v61 = type metadata accessor for UnknownStorage();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v61 - 8) + 32))(v59, v60, v61);
        swift_storeEnumTagMultiPayload();
        break;
      default:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *((void *)a1 + 2) = *((void *)a2 + 2);
        uint64_t v16 = *(int *)(type metadata accessor for NearbyGroup_Group.Initialization(0) + 24);
        uint64_t v17 = &a1[v16];
        uint64_t v18 = &a2[v16];
        uint64_t v19 = type metadata accessor for UnknownStorage();
        (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v19 - 8) + 32))(v17, v18, v19);
        swift_storeEnumTagMultiPayload();
        break;
    }
  }
LABEL_23:
  uint64_t v62 = *(int *)(a3 + 20);
  long long v63 = &a1[v62];
  unint64_t v64 = &a2[v62];
  uint64_t v65 = type metadata accessor for UnknownStorage();
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v65 - 8) + 40))(v63, v64, v65);
  return a1;
}

uint64_t getEnumTagSinglePayload for NearbyGroup_Group(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000BEAF8);
}

uint64_t sub_1000BEAF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = type metadata accessor for UnknownStorage();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for NearbyGroup_Group(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000BEC08);
}

uint64_t sub_1000BEC08(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = type metadata accessor for UnknownStorage();
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

void type metadata completion function for NearbyGroup_Group()
{
  type metadata accessor for NearbyGroup_Group.OneOf_Event?(319, &lazy cache variable for type metadata for NearbyGroup_Group.OneOf_Event?, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Group.OneOf_Event);
  if (v0 <= 0x3F)
  {
    type metadata accessor for UnknownStorage();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unint64_t initializeBufferWithCopyOfBuffer for NearbyGroup_Group.OneOf_Event(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v13 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v14 = *(void *)a2;
        unint64_t v15 = *(void *)(a2 + 8);
        outlined copy of Data._Representation(*(void *)a2, v15);
        *(void *)a1 = v14;
        *(void *)(a1 + 8) = v15;
        uint64_t v16 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
        uint64_t v17 = *(int *)(v16 + 20);
        uint64_t v18 = a1 + v17;
        uint64_t v19 = a2 + v17;
        uint64_t v20 = type metadata accessor for UnknownStorage();
        uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 16);
        v21(v18, v19, v20);
        uint64_t v22 = *(int *)(v16 + 24);
        uint64_t v23 = (void *)(a1 + v22);
        uint64_t v24 = (void *)(a2 + v22);
        uint64_t v25 = type metadata accessor for NearbyGroup_Member(0);
        uint64_t v26 = *(void *)(v25 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25)) {
          goto LABEL_8;
        }
        uint64_t v45 = v24[1];
        *uint64_t v23 = *v24;
        v23[1] = v45;
        uint64_t v46 = *(int *)(v25 + 20);
        uint64_t v47 = (char *)v23 + v46;
        uint64_t v62 = (char *)v24 + v46;
        swift_bridgeObjectRetain();
        v21((uint64_t)v47, (uint64_t)v62, v20);
        uint64_t v48 = *(int *)(v25 + 24);
        uint64_t v49 = (void *)((char *)v23 + v48);
        uint64_t v50 = (void *)((char *)v24 + v48);
        uint64_t v51 = v50[1];
        *uint64_t v49 = *v50;
        v49[1] = v51;
        uint64_t v52 = *(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56);
        swift_bridgeObjectRetain();
        v52(v23, 0, 1, v25);
        break;
      case 2u:
        uint64_t v27 = *(void *)a2;
        unint64_t v28 = *(void *)(a2 + 8);
        outlined copy of Data._Representation(*(void *)a2, v28);
        *(void *)a1 = v27;
        *(void *)(a1 + 8) = v28;
        uint64_t v29 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
        uint64_t v30 = *(int *)(v29 + 20);
        uint64_t v31 = a1 + v30;
        uint64_t v32 = a2 + v30;
        uint64_t v33 = type metadata accessor for UnknownStorage();
        uint64_t v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16);
        v34(v31, v32, v33);
        uint64_t v35 = *(int *)(v29 + 24);
        uint64_t v23 = (void *)(a1 + v35);
        uint64_t v24 = (void *)(a2 + v35);
        uint64_t v36 = type metadata accessor for NearbyGroup_Member(0);
        uint64_t v37 = *(void *)(v36 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v37 + 48))(v24, 1, v36))
        {
LABEL_8:
          uint64_t v38 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
          memcpy(v23, v24, *(void *)(*(void *)(v38 - 8) + 64));
        }
        else
        {
          uint64_t v53 = v24[1];
          *uint64_t v23 = *v24;
          v23[1] = v53;
          uint64_t v54 = *(int *)(v36 + 20);
          unint64_t v55 = (char *)v23 + v54;
          long long v63 = (char *)v24 + v54;
          swift_bridgeObjectRetain();
          v34((uint64_t)v55, (uint64_t)v63, v33);
          uint64_t v56 = *(int *)(v36 + 24);
          uint64_t v57 = (void *)((char *)v23 + v56);
          uint64_t v58 = (void *)((char *)v24 + v56);
          uint64_t v59 = v58[1];
          *uint64_t v57 = *v58;
          v57[1] = v59;
          uint64_t v60 = *(void (**)(void *, void, uint64_t, uint64_t))(v37 + 56);
          swift_bridgeObjectRetain();
          v60(v23, 0, 1, v36);
        }
        break;
      case 3u:
        uint64_t v39 = *(void *)a2;
        unint64_t v40 = *(void *)(a2 + 8);
        outlined copy of Data._Representation(*(void *)a2, v40);
        *(void *)a1 = v39;
        *(void *)(a1 + 8) = v40;
        *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
        uint64_t v41 = *(int *)(type metadata accessor for NearbyGroup_Group.MemberLeft(0) + 24);
        uint64_t v42 = a1 + v41;
        uint64_t v43 = a2 + v41;
        uint64_t v44 = type metadata accessor for UnknownStorage();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 16))(v42, v43, v44);
        break;
      default:
        uint64_t v6 = *(void *)a2;
        unint64_t v7 = *(void *)(a2 + 8);
        outlined copy of Data._Representation(*(void *)a2, v7);
        *(void *)a1 = v6;
        *(void *)(a1 + 8) = v7;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        uint64_t v8 = *(int *)(type metadata accessor for NearbyGroup_Group.Initialization(0) + 24);
        uint64_t v9 = a1 + v8;
        uint64_t v10 = a2 + v8;
        uint64_t v11 = type metadata accessor for UnknownStorage();
        uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
        swift_bridgeObjectRetain();
        v12(v9, v10, v11);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for NearbyGroup_Group.OneOf_Event(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));
      swift_bridgeObjectRelease();
      uint64_t v3 = type metadata accessor for NearbyGroup_Group.Initialization(0);
      goto LABEL_8;
    case 1:
      outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));
      uint64_t v4 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
      goto LABEL_5;
    case 2:
      outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));
      uint64_t v4 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
LABEL_5:
      uint64_t v5 = v4;
      uint64_t v6 = a1 + *(int *)(v4 + 20);
      uint64_t v7 = type metadata accessor for UnknownStorage();
      uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
      v8(v6, v7);
      uint64_t v9 = a1 + *(int *)(v5 + 24);
      uint64_t v10 = type metadata accessor for NearbyGroup_Member(0);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v9, 1, v10);
      if (!result)
      {
        swift_bridgeObjectRelease();
        v8(v9 + *(int *)(v10 + 20), v7);
        uint64_t result = swift_bridgeObjectRelease();
      }
      break;
    case 3:
      outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));
      uint64_t v3 = type metadata accessor for NearbyGroup_Group.MemberLeft(0);
LABEL_8:
      uint64_t v11 = a1 + *(int *)(v3 + 24);
      uint64_t v12 = type metadata accessor for UnknownStorage();
      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8);
      uint64_t result = v13(v11, v12);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for NearbyGroup_Group.OneOf_Event(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v11 = *(void *)a2;
      unint64_t v12 = *(void *)(a2 + 8);
      outlined copy of Data._Representation(*(void *)a2, v12);
      *(void *)a1 = v11;
      *(void *)(a1 + 8) = v12;
      uint64_t v13 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
      goto LABEL_5;
    case 2u:
      uint64_t v14 = *(void *)a2;
      unint64_t v15 = *(void *)(a2 + 8);
      outlined copy of Data._Representation(*(void *)a2, v15);
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v15;
      uint64_t v13 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
LABEL_5:
      uint64_t v16 = v13;
      uint64_t v17 = *(int *)(v13 + 20);
      uint64_t v18 = (char *)(a1 + v17);
      uint64_t v19 = (char *)(a2 + v17);
      uint64_t v20 = type metadata accessor for UnknownStorage();
      uint64_t v21 = (void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
      uint64_t v44 = *v21;
      (*v21)(v18, v19, v20);
      uint64_t v22 = *(int *)(v16 + 24);
      uint64_t v23 = (void *)(a1 + v22);
      uint64_t v24 = (void *)(a2 + v22);
      uint64_t v25 = type metadata accessor for NearbyGroup_Member(0);
      uint64_t v26 = *(void *)(v25 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
      {
        uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
        memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
      }
      else
      {
        uint64_t v34 = v24[1];
        *uint64_t v23 = *v24;
        v23[1] = v34;
        uint64_t v35 = *(int *)(v25 + 20);
        uint64_t v36 = (char *)v23 + v35;
        uint64_t v43 = (char *)v24 + v35;
        swift_bridgeObjectRetain();
        v44(v36, v43, v20);
        uint64_t v37 = *(int *)(v25 + 24);
        uint64_t v38 = (void *)((char *)v23 + v37);
        uint64_t v39 = (void *)((char *)v24 + v37);
        uint64_t v40 = v39[1];
        *uint64_t v38 = *v39;
        v38[1] = v40;
        uint64_t v41 = *(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56);
        swift_bridgeObjectRetain();
        v41(v23, 0, 1, v25);
      }
      break;
    case 3u:
      uint64_t v28 = *(void *)a2;
      unint64_t v29 = *(void *)(a2 + 8);
      outlined copy of Data._Representation(*(void *)a2, v29);
      *(void *)a1 = v28;
      *(void *)(a1 + 8) = v29;
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
      uint64_t v30 = *(int *)(type metadata accessor for NearbyGroup_Group.MemberLeft(0) + 24);
      uint64_t v31 = a1 + v30;
      uint64_t v32 = a2 + v30;
      uint64_t v33 = type metadata accessor for UnknownStorage();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
      break;
    default:
      uint64_t v4 = *(void *)a2;
      unint64_t v5 = *(void *)(a2 + 8);
      outlined copy of Data._Representation(*(void *)a2, v5);
      *(void *)a1 = v4;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      uint64_t v6 = *(int *)(type metadata accessor for NearbyGroup_Group.Initialization(0) + 24);
      uint64_t v7 = a1 + v6;
      uint64_t v8 = a2 + v6;
      uint64_t v9 = type metadata accessor for UnknownStorage();
      uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
      swift_bridgeObjectRetain();
      v10(v7, v8, v9);
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for NearbyGroup_Group.OneOf_Event(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    outlined destroy of NearbyGroup_Group.OneOf_Event(a1, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        uint64_t v11 = *(void *)a2;
        unint64_t v12 = *(void *)(a2 + 8);
        outlined copy of Data._Representation(*(void *)a2, v12);
        *(void *)a1 = v11;
        *(void *)(a1 + 8) = v12;
        uint64_t v13 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
        goto LABEL_6;
      case 2u:
        uint64_t v14 = *(void *)a2;
        unint64_t v15 = *(void *)(a2 + 8);
        outlined copy of Data._Representation(*(void *)a2, v15);
        *(void *)a1 = v14;
        *(void *)(a1 + 8) = v15;
        uint64_t v13 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
LABEL_6:
        uint64_t v16 = v13;
        uint64_t v17 = *(int *)(v13 + 20);
        uint64_t v18 = (char *)(a1 + v17);
        uint64_t v19 = (char *)(a2 + v17);
        uint64_t v20 = type metadata accessor for UnknownStorage();
        uint64_t v21 = (void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16);
        uint64_t v42 = *v21;
        (*v21)(v18, v19, v20);
        uint64_t v22 = *(int *)(v16 + 24);
        uint64_t v23 = (void *)(a1 + v22);
        uint64_t v24 = (void *)(a2 + v22);
        uint64_t v25 = type metadata accessor for NearbyGroup_Member(0);
        uint64_t v26 = *(void *)(v25 - 8);
        if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
        {
          uint64_t v27 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
          memcpy(v23, v24, *(void *)(*(void *)(v27 - 8) + 64));
        }
        else
        {
          *uint64_t v23 = *v24;
          v23[1] = v24[1];
          uint64_t v34 = *(int *)(v25 + 20);
          uint64_t v35 = (char *)v23 + v34;
          uint64_t v41 = (char *)v24 + v34;
          swift_bridgeObjectRetain();
          v42(v35, v41, v20);
          uint64_t v36 = *(int *)(v25 + 24);
          uint64_t v37 = (void *)((char *)v23 + v36);
          uint64_t v38 = (void *)((char *)v24 + v36);
          *uint64_t v37 = *v38;
          v37[1] = v38[1];
          uint64_t v39 = *(void (**)(void *, void, uint64_t, uint64_t))(v26 + 56);
          swift_bridgeObjectRetain();
          v39(v23, 0, 1, v25);
        }
        break;
      case 3u:
        uint64_t v28 = *(void *)a2;
        unint64_t v29 = *(void *)(a2 + 8);
        outlined copy of Data._Representation(*(void *)a2, v29);
        *(void *)a1 = v28;
        *(void *)(a1 + 8) = v29;
        *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
        uint64_t v30 = *(int *)(type metadata accessor for NearbyGroup_Group.MemberLeft(0) + 24);
        uint64_t v31 = a1 + v30;
        uint64_t v32 = a2 + v30;
        uint64_t v33 = type metadata accessor for UnknownStorage();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 16))(v31, v32, v33);
        break;
      default:
        uint64_t v4 = *(void *)a2;
        unint64_t v5 = *(void *)(a2 + 8);
        outlined copy of Data._Representation(*(void *)a2, v5);
        *(void *)a1 = v4;
        *(void *)(a1 + 8) = v5;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        uint64_t v6 = *(int *)(type metadata accessor for NearbyGroup_Group.Initialization(0) + 24);
        uint64_t v7 = a1 + v6;
        uint64_t v8 = a2 + v6;
        uint64_t v9 = type metadata accessor for UnknownStorage();
        uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16);
        swift_bridgeObjectRetain();
        v10(v7, v8, v9);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for NearbyGroup_Group.OneOf_Event(uint64_t a1, uint64_t a2)
{
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v8 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
      uint64_t v9 = *(int *)(v8 + 20);
      uint64_t v10 = (char *)(a1 + v9);
      uint64_t v11 = (char *)(a2 + v9);
      uint64_t v12 = type metadata accessor for UnknownStorage();
      uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32);
      v13(v10, v11, v12);
      uint64_t v14 = *(int *)(v8 + 24);
      unint64_t v15 = (_OWORD *)(a1 + v14);
      uint64_t v16 = (_OWORD *)(a2 + v14);
      uint64_t v17 = type metadata accessor for NearbyGroup_Member(0);
      uint64_t v18 = *(void *)(v17 - 8);
      if (!(*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17)) {
        goto LABEL_8;
      }
      goto LABEL_6;
    case 2u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      uint64_t v19 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
      uint64_t v20 = *(int *)(v19 + 20);
      uint64_t v21 = (char *)(a1 + v20);
      uint64_t v22 = (char *)(a2 + v20);
      uint64_t v12 = type metadata accessor for UnknownStorage();
      uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32);
      v13(v21, v22, v12);
      uint64_t v23 = *(int *)(v19 + 24);
      unint64_t v15 = (_OWORD *)(a1 + v23);
      uint64_t v16 = (_OWORD *)(a2 + v23);
      uint64_t v17 = type metadata accessor for NearbyGroup_Member(0);
      uint64_t v18 = *(void *)(v17 - 8);
      if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
      {
LABEL_6:
        uint64_t v24 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
        memcpy(v15, v16, *(void *)(*(void *)(v24 - 8) + 64));
      }
      else
      {
LABEL_8:
        *unint64_t v15 = *v16;
        v13((char *)v15 + *(int *)(v17 + 20), (char *)v16 + *(int *)(v17 + 20), v12);
        *(_OWORD *)((char *)v15 + *(int *)(v17 + 24)) = *(_OWORD *)((char *)v16 + *(int *)(v17 + 24));
        (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      }
      break;
    case 3u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
      uint64_t v25 = *(int *)(type metadata accessor for NearbyGroup_Group.MemberLeft(0) + 24);
      uint64_t v26 = a1 + v25;
      uint64_t v27 = a2 + v25;
      uint64_t v28 = type metadata accessor for UnknownStorage();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 32))(v26, v27, v28);
      break;
    default:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(void *)(a1 + 16) = *(void *)(a2 + 16);
      uint64_t v4 = *(int *)(type metadata accessor for NearbyGroup_Group.Initialization(0) + 24);
      uint64_t v5 = a1 + v4;
      uint64_t v6 = a2 + v4;
      uint64_t v7 = type metadata accessor for UnknownStorage();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
      break;
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for NearbyGroup_Group.OneOf_Event(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    outlined destroy of NearbyGroup_Group.OneOf_Event(a1, type metadata accessor for NearbyGroup_Group.OneOf_Event);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v8 = type metadata accessor for NearbyGroup_Group.MemberAdded(0);
        uint64_t v9 = *(int *)(v8 + 20);
        uint64_t v10 = a1 + v9;
        uint64_t v11 = a2 + v9;
        uint64_t v12 = type metadata accessor for UnknownStorage();
        uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32);
        v13(v10, v11, v12);
        uint64_t v14 = *(int *)(v8 + 24);
        unint64_t v15 = (_OWORD *)(a1 + v14);
        uint64_t v16 = (_OWORD *)(a2 + v14);
        uint64_t v17 = type metadata accessor for NearbyGroup_Member(0);
        uint64_t v18 = *(void *)(v17 - 8);
        if (!(*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17)) {
          goto LABEL_9;
        }
        goto LABEL_5;
      case 2u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        uint64_t v20 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0);
        uint64_t v21 = *(int *)(v20 + 20);
        uint64_t v22 = a1 + v21;
        uint64_t v23 = a2 + v21;
        uint64_t v12 = type metadata accessor for UnknownStorage();
        uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 32);
        v13(v22, v23, v12);
        uint64_t v24 = *(int *)(v20 + 24);
        unint64_t v15 = (_OWORD *)(a1 + v24);
        uint64_t v16 = (_OWORD *)(a2 + v24);
        uint64_t v17 = type metadata accessor for NearbyGroup_Member(0);
        uint64_t v18 = *(void *)(v17 - 8);
        if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
        {
LABEL_5:
          uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
          memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
        }
        else
        {
LABEL_9:
          *unint64_t v15 = *v16;
          v13((uint64_t)v15 + *(int *)(v17 + 20), (uint64_t)v16 + *(int *)(v17 + 20), v12);
          *(_OWORD *)((char *)v15 + *(int *)(v17 + 24)) = *(_OWORD *)((char *)v16 + *(int *)(v17 + 24));
          (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
        }
        break;
      case 3u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
        uint64_t v25 = *(int *)(type metadata accessor for NearbyGroup_Group.MemberLeft(0) + 24);
        uint64_t v26 = a1 + v25;
        uint64_t v27 = a2 + v25;
        uint64_t v28 = type metadata accessor for UnknownStorage();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 32))(v26, v27, v28);
        break;
      default:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = *(void *)(a2 + 16);
        uint64_t v4 = *(int *)(type metadata accessor for NearbyGroup_Group.Initialization(0) + 24);
        uint64_t v5 = a1 + v4;
        uint64_t v6 = a2 + v4;
        uint64_t v7 = type metadata accessor for UnknownStorage();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
        break;
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t type metadata completion function for NearbyGroup_Group.OneOf_Event()
{
  uint64_t result = type metadata accessor for NearbyGroup_Group.Initialization(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for NearbyGroup_Group.MemberAdded(319);
    if (v2 <= 0x3F)
    {
      uint64_t result = type metadata accessor for NearbyGroup_Group.MemberRemoved(319);
      if (v3 <= 0x3F)
      {
        uint64_t result = type metadata accessor for NearbyGroup_Group.MemberLeft(319);
        if (v4 <= 0x3F)
        {
          swift_initEnumMetadataMultiPayload();
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for NearbyGroup_Group.Initialization(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    outlined copy of Data._Representation(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    a1[2] = a2[2];
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for UnknownStorage();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
  }
  return a1;
}

uint64_t destroy for NearbyGroup_Group.Initialization(uint64_t a1, uint64_t a2)
{
  outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t *initializeWithCopy for NearbyGroup_Group.Initialization(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  outlined copy of Data._Representation(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  a1[2] = a2[2];
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  return a1;
}

uint64_t *assignWithCopy for NearbyGroup_Group.Initialization(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  outlined copy of Data._Representation(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  outlined consume of Data._Representation(v8, v9);
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t initializeWithTake for NearbyGroup_Group.Initialization(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t *assignWithTake for NearbyGroup_Group.Initialization(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  outlined consume of Data._Representation(v6, v7);
  a1[2] = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v8 = *(int *)(a3 + 24);
  unint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for NearbyGroup_Group.Initialization(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000C0928);
}

uint64_t sub_1000C0928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    unint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for NearbyGroup_Group.Initialization(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000C09EC);
}

uint64_t sub_1000C09EC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for NearbyGroup_Group.Initialization()
{
  return type metadata completion function for NearbyGroup_Group.Initialization();
}

{
  uint64_t result;
  unint64_t v1;

  uint64_t result = type metadata accessor for UnknownStorage();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for NearbyGroup_Group.MemberAdded(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, j____swift_get_extra_inhabitant_index_22Tm);
}

uint64_t storeEnumTagSinglePayload for NearbyGroup_Group.MemberAdded(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_23Tm);
}

void type metadata accessor for NearbyGroup_Group.OneOf_Event?(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = type metadata accessor for Optional();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for NearbyGroup_Group.MemberAdded(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    outlined copy of Data._Representation(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for UnknownStorage();
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16);
    v13(v10, v11, v12);
    uint64_t v14 = *(int *)(a3 + 24);
    unint64_t v15 = (uint64_t *)((char *)a1 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = type metadata accessor for NearbyGroup_Member(0);
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
      memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64));
    }
    else
    {
      uint64_t v21 = v16[1];
      *unint64_t v15 = *v16;
      v15[1] = v21;
      uint64_t v22 = *(int *)(v17 + 20);
      uint64_t v23 = (char *)v15 + v22;
      uint64_t v24 = (char *)v16 + v22;
      swift_bridgeObjectRetain();
      v13(v23, v24, v12);
      uint64_t v25 = *(int *)(v17 + 24);
      uint64_t v26 = (void *)((char *)v15 + v25);
      uint64_t v27 = (void *)((char *)v16 + v25);
      uint64_t v28 = v27[1];
      *uint64_t v26 = *v27;
      v26[1] = v28;
      unint64_t v29 = *(void (**)(void *, void, uint64_t, uint64_t))(v18 + 56);
      swift_bridgeObjectRetain();
      v29(v15, 0, 1, v17);
    }
  }
  return a1;
}

uint64_t destroy for NearbyGroup_Group.MemberAdded(uint64_t a1, uint64_t a2)
{
  outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  v6(v4, v5);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = type metadata accessor for NearbyGroup_Member(0);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v7, 1, v8);
  if (!result)
  {
    swift_bridgeObjectRelease();
    v6(v7 + *(int *)(v8 + 20), v5);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *initializeWithCopy for NearbyGroup_Group.MemberAdded(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  outlined copy of Data._Representation(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage();
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16);
  v12(v9, v10, v11);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (uint64_t *)((char *)a1 + v13);
  unint64_t v15 = (uint64_t *)((char *)a2 + v13);
  uint64_t v16 = type metadata accessor for NearbyGroup_Member(0);
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    uint64_t v19 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v19;
    uint64_t v20 = *(int *)(v16 + 20);
    uint64_t v21 = (char *)v14 + v20;
    uint64_t v22 = (char *)v15 + v20;
    swift_bridgeObjectRetain();
    v12(v21, v22, v11);
    uint64_t v23 = *(int *)(v16 + 24);
    uint64_t v24 = (void *)((char *)v14 + v23);
    uint64_t v25 = (void *)((char *)v15 + v23);
    uint64_t v26 = v25[1];
    *uint64_t v24 = *v25;
    v24[1] = v26;
    uint64_t v27 = *(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56);
    swift_bridgeObjectRetain();
    v27(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t *assignWithCopy for NearbyGroup_Group.MemberAdded(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  outlined copy of Data._Representation(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  outlined consume of Data._Representation(v8, v9);
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for UnknownStorage();
  uint64_t v35 = *(void *)(v13 - 8);
  uint64_t v36 = v13;
  uint64_t v14 = *(void (**)(char *, char *))(v35 + 24);
  v14(v11, v12);
  uint64_t v15 = *(int *)(a3 + 24);
  uint64_t v16 = (uint64_t *)((char *)a1 + v15);
  uint64_t v17 = (uint64_t *)((char *)a2 + v15);
  uint64_t v18 = type metadata accessor for NearbyGroup_Member(0);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v19 + 48);
  LODWORD(v12) = v20(v16, 1, v18);
  int v21 = v20(v17, 1, v18);
  if (!v12)
  {
    if (!v21)
    {
      *uint64_t v16 = *v17;
      v16[1] = v17[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      ((void (*)(char *, char *, uint64_t))v14)((char *)v16 + *(int *)(v18 + 20), (char *)v17 + *(int *)(v18 + 20), v36);
      uint64_t v32 = *(int *)(v18 + 24);
      uint64_t v33 = (void *)((char *)v16 + v32);
      uint64_t v34 = (void *)((char *)v17 + v32);
      *uint64_t v33 = *v34;
      v33[1] = v34[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return a1;
    }
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v16, type metadata accessor for NearbyGroup_Member);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    uint64_t v30 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
    memcpy(v16, v17, *(void *)(*(void *)(v30 - 8) + 64));
    return a1;
  }
  *uint64_t v16 = *v17;
  v16[1] = v17[1];
  uint64_t v22 = *(int *)(v18 + 20);
  uint64_t v23 = (char *)v16 + v22;
  uint64_t v24 = (char *)v17 + v22;
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
  swift_bridgeObjectRetain();
  v25(v23, v24, v36);
  uint64_t v26 = *(int *)(v18 + 24);
  uint64_t v27 = (void *)((char *)v16 + v26);
  uint64_t v28 = (void *)((char *)v17 + v26);
  *uint64_t v27 = *v28;
  v27[1] = v28[1];
  unint64_t v29 = *(void (**)(void *, void, uint64_t, uint64_t))(v19 + 56);
  swift_bridgeObjectRetain();
  v29(v16, 0, 1, v18);
  return a1;
}

_OWORD *initializeWithTake for NearbyGroup_Group.MemberAdded(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage();
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (_OWORD *)((char *)a1 + v11);
  uint64_t v13 = (_OWORD *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for NearbyGroup_Member(0);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    _OWORD *v12 = *v13;
    v10((char *)v12 + *(int *)(v14 + 20), (char *)v13 + *(int *)(v14 + 20), v9);
    *(_OWORD *)((char *)v12 + *(int *)(v14 + 24)) = *(_OWORD *)((char *)v13 + *(int *)(v14 + 24));
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t *assignWithTake for NearbyGroup_Group.MemberAdded(uint64_t *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *(_OWORD *)a1 = *a2;
  outlined consume of Data._Representation(v6, v7);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage();
  uint64_t v28 = *(void *)(v11 - 8);
  uint64_t v29 = v11;
  uint64_t v12 = *(void (**)(char *, char *))(v28 + 40);
  v12(v9, v10);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (uint64_t *)((char *)a1 + v13);
  uint64_t v15 = (void *)((char *)a2 + v13);
  uint64_t v16 = type metadata accessor for NearbyGroup_Member(0);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v10) = v18(v14, 1, v16);
  int v19 = v18(v15, 1, v16);
  if (!v10)
  {
    if (!v19)
    {
      uint64_t v22 = v15[1];
      *uint64_t v14 = *v15;
      v14[1] = v22;
      swift_bridgeObjectRelease();
      ((void (*)(char *, char *, uint64_t))v12)((char *)v14 + *(int *)(v16 + 20), (char *)v15 + *(int *)(v16 + 20), v29);
      uint64_t v23 = *(int *)(v16 + 24);
      uint64_t v24 = (void *)((char *)v14 + v23);
      uint64_t v25 = (void *)((char *)v15 + v23);
      uint64_t v27 = *v25;
      uint64_t v26 = v25[1];
      *uint64_t v24 = v27;
      v24[1] = v26;
      swift_bridgeObjectRelease();
      return a1;
    }
    outlined destroy of NearbyGroup_Group.OneOf_Event((uint64_t)v14, type metadata accessor for NearbyGroup_Member);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
    memcpy(v14, v15, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  (*(void (**)(char *, char *, uint64_t))(v28 + 32))((char *)v14 + *(int *)(v16 + 20), (char *)v15 + *(int *)(v16 + 20), v29);
  *(_OWORD *)((char *)v14 + *(int *)(v16 + 24)) = *(_OWORD *)((char *)v15 + *(int *)(v16 + 24));
  (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  return a1;
}

uint64_t getEnumTagSinglePayload for NearbyGroup_Group.MemberRemoved(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000C1680);
}

uint64_t __swift_get_extra_inhabitant_index_22Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 12)
  {
    uint64_t v4 = *(void *)(a1 + 8) >> 60;
    if (((4 * v4) & 0xC) != 0) {
      return 16 - ((4 * v4) & 0xC | (v4 >> 2));
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = a1 + *(int *)(a3 + 20);
      uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
      return v12(v11, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
      uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
      uint64_t v15 = v13;
      uint64_t v16 = a1 + *(int *)(a3 + 24);
      return v14(v16, a2, v15);
    }
  }
}

uint64_t storeEnumTagSinglePayload for NearbyGroup_Group.MemberRemoved(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000C17D4);
}

void *__swift_store_extra_inhabitant_index_23Tm(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 12)
  {
    *uint64_t result = 0;
    result[1] = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * a2) << 60;
  }
  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage();
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = (char *)v5 + *(int *)(a4 + 20);
      uint64_t v12 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
      return (void *)v12(v11, a2, a2, v10);
    }
    else
    {
      uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
      uint64_t v14 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
      uint64_t v15 = v13;
      uint64_t v16 = (char *)v5 + *(int *)(a4 + 24);
      return (void *)v14(v16, a2, a2, v15);
    }
  }
  return result;
}

void type metadata completion function for NearbyGroup_Group.MemberAdded()
{
  type metadata accessor for UnknownStorage();
  if (v0 <= 0x3F)
  {
    type metadata accessor for NearbyGroup_Group.OneOf_Event?(319, &lazy cache variable for type metadata for NearbyGroup_Member?, (void (*)(uint64_t))type metadata accessor for NearbyGroup_Member);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

unint64_t initializeBufferWithCopyOfBuffer for NearbyGroup_Group.MemberLeft(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v13 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = *(void *)a2;
    unint64_t v8 = *(void *)(a2 + 8);
    outlined copy of Data._Representation(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v8;
    *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = a1 + v9;
    uint64_t v11 = a2 + v9;
    uint64_t v12 = type metadata accessor for UnknownStorage();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  return a1;
}

uint64_t destroy for NearbyGroup_Group.MemberLeft(uint64_t a1, uint64_t a2)
{
  outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for UnknownStorage();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);
  return v6(v4, v5);
}

uint64_t initializeWithCopy for NearbyGroup_Group.MemberLeft(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  outlined copy of Data._Representation(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16))(v9, v10, v11);
  return a1;
}

uint64_t assignWithCopy for NearbyGroup_Group.MemberLeft(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  outlined copy of Data._Representation(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  unint64_t v9 = *(void *)(a1 + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  outlined consume of Data._Representation(v8, v9);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t initializeWithTake for NearbyGroup_Group.MemberLeft(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for NearbyGroup_Group.MemberLeft(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  outlined consume of Data._Representation(v6, v7);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for NearbyGroup_Group.MemberLeft(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000C1DE4);
}

uint64_t sub_1000C1DE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 254)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 16);
    BOOL v5 = v4 >= 2;
    int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5) {
      return (v6 + 1);
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v10 = type metadata accessor for UnknownStorage();
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 24);
    return v11(v13, a2, v12);
  }
}

uint64_t storeEnumTagSinglePayload for NearbyGroup_Group.MemberLeft(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000C1EA8);
}

uint64_t sub_1000C1EA8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 254)
  {
    *(unsigned char *)(result + 16) = a2 + 1;
  }
  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t type metadata completion function for NearbyGroup_Group.MemberLeft()
{
  return type metadata completion function for NearbyGroup_Group.Initialization();
}

uint64_t NearbyGroupFirewall.__allocating_init(group:service:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = Pseudonym.__allocating_init(service:configuration:);
  return NearbyGroupFirewall.init(group:service:)(a1, a2);
}

uint64_t NearbyGroupFirewall.group.getter()
{
  return swift_unknownObjectWeakLoadStrong();
}

void NearbyGroupFirewall.group.setter(void *a1)
{
}

void (*NearbyGroupFirewall.group.modify(void *a1))(id **a1, char a2)
{
  unint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_beginAccess();
  v3[3] = swift_unknownObjectWeakLoadStrong();
  return NearbyGroupFirewall.group.modify;
}

void NearbyGroupFirewall.group.modify(id **a1, char a2)
{
  unint64_t v3 = *a1;
  id v4 = (*a1)[3];
  swift_unknownObjectWeakAssign();
  if (a2)
  {

    swift_endAccess();
  }
  else
  {
    swift_endAccess();
  }
  free(v3);
}

uint64_t NearbyGroupFirewall.firewall.getter@<X0>(uint64_t a1@<X8>)
{
  swift_beginAccess();
  return outlined init with copy of PseudonymProtocol(v1 + 24, a1);
}

uint64_t NearbyGroupFirewall.firewall.setter(long long *a1)
{
  uint64_t v3 = v1 + 24;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_0Tm(v3);
  outlined init with take of PseudonymProtocol(a1, v3);
  return swift_endAccess();
}

uint64_t (*NearbyGroupFirewall.firewall.modify())()
{
  return NearbyInvitationAdvertiser.listeners.modify;
}

uint64_t NearbyGroupFirewall.init(group:service:)(uint64_t a1, uint64_t a2)
{
  v3[15] = a2;
  v3[16] = v2;
  v3[14] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  v3[17] = swift_task_alloc();
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Set<NearbyGroupMember>>.Publisher);
  v3[18] = v4;
  v3[19] = *(void *)(v4 - 8);
  v3[20] = swift_task_alloc();
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncPublisher<Published<Set<NearbyGroupMember>>.Publisher>);
  v3[21] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[22] = v6;
  v3[23] = *(void *)(v6 + 64);
  v3[24] = swift_task_alloc();
  v3[25] = swift_task_alloc();
  return _swift_task_switch(NearbyGroupFirewall.init(group:service:), 0, 0);
}

uint64_t NearbyGroupFirewall.init(group:service:)()
{
  int v19 = v0;
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  if (one-time initialization token for firewall != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[14];
  uint64_t v2 = type metadata accessor for Logger();
  v0[26] = __swift_project_value_buffer(v2, (uint64_t)static Log.firewall);
  id v3 = v1;
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  BOOL v6 = os_log_type_enabled(v4, v5);
  uint64_t v7 = (void *)v0[14];
  if (v6)
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    v0[12] = v7;
    type metadata accessor for NearbyGroupHost();
    id v9 = v7;
    uint64_t v10 = String.init<A>(reflecting:)();
    v0[13] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v10, v11, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Fetching firewall for service: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v12 = (void *)v0[15];
  uint64_t v13 = v12[3];
  uint64_t v14 = v12[4];
  __swift_project_boxed_opaque_existential_1(v12, v13);
  uint64_t v17 = (uint64_t (*)(void *, uint64_t, uint64_t))(*(void *)(v14 + 24) + **(int **)(v14 + 24));
  uint64_t v15 = (void *)swift_task_alloc();
  v0[27] = v15;
  *uint64_t v15 = v0;
  v15[1] = NearbyGroupFirewall.init(group:service:);
  return v17(v0 + 2, v13, v14);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 224) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = NearbyGroupFirewall.init(group:service:);
  }
  else {
    uint64_t v2 = NearbyGroupFirewall.init(group:service:);
  }
  return _swift_task_switch(v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 176);
  uint64_t v17 = *(void *)(v0 + 192);
  uint64_t v18 = *(void *)(v0 + 184);
  id v3 = *(void *)(v0 + 160);
  os_log_type_t v5 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 152);
  BOOL v6 = *(void *)(v0 + 136);
  uint64_t v16 = *(void *)(v0 + 168);
  uint64_t v7 = *(void **)(v0 + 112);
  int v19 = *(void *)(v0 + 120);
  uint64_t v8 = outlined init with take of PseudonymProtocol((long long *)(v0 + 16), *(void *)(v0 + 128) + 24);
  (*(void (**)(uint64_t))((swift_isaMask & *v7) + 0xD0))(v8);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type Published<Set<NearbyGroupMember>>.Publisher and conformance Published<A>.Publisher, &demangling cache variable for type metadata for Published<Set<NearbyGroupMember>>.Publisher);
  Publisher<>.values.getter();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  id v9 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  uint64_t v10 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v17, v1, v16);
  unint64_t v11 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = 0;
  *(void *)(v12 + 24) = 0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v2 + 32))(v12 + v11, v17, v16);
  *(void *)(v12 + ((v18 + v11 + 7) & 0xFFFFFFFFFFFFFFF8)) = v10;
  _sScTss5NeverORs_rlE8detached8priority9operationScTyxABGScPSg_xyYaYAcntFZyt_Tgm5(v6, (uint64_t)&async function pointer to partial apply for closure #1 in NearbyGroupFirewall.init(group:service:), v12);

  swift_release();
  outlined destroy of TaskPriority?(v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v16);
  __swift_destroy_boxed_opaque_existential_0Tm(v19);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v14 = *(void *)(v0 + 128);
  return v13(v14);
}

{
  void *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t (*v10)(void);
  uint64_t v12;
  void *v13;
  uint64_t v14;

  uint64_t v13 = v0;
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  uint64_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = v0[28];
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v5 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    uint64_t v12 = v5;
    v0[10] = v3;
    swift_errorRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
    BOOL v6 = String.init<A>(reflecting:)();
    v0[11] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, &v12);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to fetch firewall, reason: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  id v9 = (void *)v0[14];
  uint64_t v8 = v0[15];
  swift_willThrow();

  swift_unknownObjectWeakDestroy();
  type metadata accessor for NearbyGroupFirewall();
  swift_deallocPartialClassInstance();
  __swift_destroy_boxed_opaque_existential_0Tm(v8);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t type metadata accessor for NearbyGroupFirewall()
{
  return self;
}

uint64_t closure #1 in NearbyGroupFirewall.init(group:service:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[15] = a4;
  v5[16] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncPublisher<Published<Set<NearbyGroupMember>>.Publisher>.Iterator);
  v5[17] = v6;
  v5[18] = *(void *)(v6 - 8);
  v5[19] = swift_task_alloc();
  return _swift_task_switch(closure #1 in NearbyGroupFirewall.init(group:service:), 0, 0);
}

uint64_t closure #1 in NearbyGroupFirewall.init(group:service:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncPublisher<Published<Set<NearbyGroupMember>>.Publisher>);
  AsyncPublisher.makeAsyncIterator()();
  swift_beginAccess();
  uint64_t v1 = lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type AsyncPublisher<Published<Set<NearbyGroupMember>>.Publisher>.Iterator and conformance AsyncPublisher<A>.Iterator, &demangling cache variable for type metadata for AsyncPublisher<Published<Set<NearbyGroupMember>>.Publisher>.Iterator);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v2;
  *uint64_t v2 = v0;
  v2[1] = closure #1 in NearbyGroupFirewall.init(group:service:);
  uint64_t v3 = *(void *)(v0 + 136);
  return dispatch thunk of AsyncIteratorProtocol.next()(v0 + 88, v3, v1);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = closure #1 in NearbyGroupFirewall.init(group:service:);
  }
  else {
    uint64_t v2 = closure #1 in NearbyGroupFirewall.init(group:service:);
  }
  return _swift_task_switch(v2, 0, 0);
}

{
  uint64_t v0;

  *(void *)(v0 + 176) = *(void *)(v0 + 88);
  return _swift_task_switch(closure #1 in NearbyGroupFirewall.init(group:service:), 0, 0);
}

{
  void *v0;
  uint64_t v1;
  uint64_t Strong;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t (*v10)(void);
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  long long v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;

  uint64_t v18 = v0;
  uint64_t v1 = v0[22];
  if (v1)
  {
    Strong = swift_weakLoadStrong();
    v0[23] = Strong;
    if (Strong)
    {
      uint64_t v3 = Strong;
      if (one-time initialization token for firewall != -1) {
        swift_once();
      }
      uint64_t v4 = type metadata accessor for Logger();
      v0[24] = __swift_project_value_buffer(v4, (uint64_t)static Log.firewall);
      swift_bridgeObjectRetain_n();
      uint64_t v5 = Logger.logObject.getter();
      uint64_t v6 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v5, v6))
      {
        uint64_t v7 = swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        *(_DWORD *)uint64_t v7 = 136315138;
        v0[14] = v1;
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Set<NearbyGroupMember>);
        uint64_t v8 = String.init<A>(reflecting:)();
        *(void *)(v7 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v8, v9, &v17);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Donating %s", (uint8_t *)v7, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }

      (*(void (**)(void))(*(void *)v3 + 120))();
      uint64_t v16 = *(_OWORD *)(v0 + 5);
      uint64_t v12 = __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
      uint64_t v13 = swift_bridgeObjectRetain();
      uint64_t v14 = specialized _copyCollectionToContiguousArray<A>(_:)(v13);
      v0[25] = v14;
      swift_bridgeObjectRelease();
      uint64_t v15 = swift_task_alloc();
      v0[26] = v15;
      *(void *)uint64_t v15 = v0;
      *(void *)(v15 + 8) = closure #1 in NearbyGroupFirewall.init(group:service:);
      *(void *)(v15 + 56) = v12;
      *(_OWORD *)(v15 + 40) = v16;
      *(void *)(v15 + 32) = v14;
      return _swift_task_switch(FirewallProvider.donateEntries(_:), 0, 0);
    }
    (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
  }
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

{
  uint64_t v0;
  uint64_t v2;

  *(void *)(v0 + 80) = *(void *)(v0 + 168);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
  swift_dynamicCast();
  return swift_willThrowTypedImpl();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  swift_release();
  if (v0)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = closure #1 in NearbyGroupFirewall.init(group:service:);
  }
  else
  {
    uint64_t v2 = closure #1 in NearbyGroupFirewall.init(group:service:);
  }
  return _swift_task_switch(v2, 0, 0);
}

{
  void *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  uint64_t v12 = v0;
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(v0 + 2));
  swift_bridgeObjectRetain();
  uint64_t v1 = Logger.logObject.getter();
  uint64_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[22];
    uint64_t v4 = swift_slowAlloc();
    unint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[13] = v3;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Set<NearbyGroupMember>);
    uint64_t v5 = String.init<A>(reflecting:)();
    *(void *)(v4 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v5, v6, &v11);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Donated %s", (uint8_t *)v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_release();
  }
  else
  {
    swift_release();

    swift_bridgeObjectRelease_n();
  }
  uint64_t v7 = lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type AsyncPublisher<Published<Set<NearbyGroupMember>>.Publisher>.Iterator and conformance AsyncPublisher<A>.Iterator, &demangling cache variable for type metadata for AsyncPublisher<Published<Set<NearbyGroupMember>>.Publisher>.Iterator);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[20] = v8;
  uint8_t *v8 = v0;
  v8[1] = closure #1 in NearbyGroupFirewall.init(group:service:);
  id v9 = v0[17];
  return dispatch thunk of AsyncIteratorProtocol.next()(v0 + 11, v9, v7);
}

{
  void *v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  uint64_t v12 = v0;
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(v0 + 2));
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  uint64_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[27];
    uint64_t v4 = swift_slowAlloc();
    unint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[12] = v3;
    swift_errorRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
    uint64_t v5 = String.init<A>(reflecting:)();
    *(void *)(v4 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v5, v6, &v11);
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Failed to donate, error: %s", (uint8_t *)v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_release();

    swift_errorRelease();
  }
  else
  {
    swift_release();
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v7 = lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type AsyncPublisher<Published<Set<NearbyGroupMember>>.Publisher>.Iterator and conformance AsyncPublisher<A>.Iterator, &demangling cache variable for type metadata for AsyncPublisher<Published<Set<NearbyGroupMember>>.Publisher>.Iterator);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[20] = v8;
  uint8_t *v8 = v0;
  v8[1] = closure #1 in NearbyGroupFirewall.init(group:service:);
  id v9 = v0[17];
  return dispatch thunk of AsyncIteratorProtocol.next()(v0 + 11, v9, v7);
}

uint64_t FirewallProvider.donateEntries(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  return _swift_task_switch(FirewallProvider.donateEntries(_:), 0, 0);
}

uint64_t FirewallProvider.donateEntries(_:)()
{
  uint64_t v29 = v0;
  unint64_t v1 = v0[4];
  if (v1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (uint64_t i = v0[4]; v2; uint64_t i = v0[4])
  {
    uint64_t v4 = 0;
    unint64_t v5 = v1 & 0xC000000000000001;
    uint64_t v6 = i + 32;
    uint64_t v25 = i + 32;
    uint64_t v26 = v2;
    while (1)
    {
      id v7 = v5 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v6 + 8 * v4);
      unint64_t v1 = (unint64_t)v7;
      uint64_t v8 = v4 + 1;
      if (__OFADD__(v4, 1)) {
        break;
      }
      NearbyGroupMember.handle.getter();
      id v9 = objc_allocWithZone((Class)IDSURI);
      NSString v10 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v11 = [v9 initWithPrefixedURI:v10];

      if (v11)
      {
        id v12 = [objc_allocWithZone((Class)IDSFirewallEntry) initWithURI:v11];

        if (v12)
        {
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
        }
      }
      else
      {
        if (one-time initialization token for firewall != -1) {
          swift_once();
        }
        uint64_t v13 = type metadata accessor for Logger();
        __swift_project_value_buffer(v13, (uint64_t)static Log.firewall);
        id v14 = (id)v1;
        uint64_t v15 = Logger.logObject.getter();
        os_log_type_t v16 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v15, v16))
        {
          uint64_t v17 = swift_slowAlloc();
          uint64_t v28 = swift_slowAlloc();
          *(_DWORD *)uint64_t v17 = 136315138;
          v0[2] = NearbyGroupMember.handle.getter();
          v0[3] = v18;
          uint64_t v19 = String.init<A>(reflecting:)();
          *(void *)(v17 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, &v28);
          swift_bridgeObjectRelease();

          _os_log_impl((void *)&_mh_execute_header, v15, v16, "Failed to convert handle %s to IDSURI", (uint8_t *)v17, 0xCu);
          swift_arrayDestroy();
          uint64_t v2 = v26;
          swift_slowDealloc();
          uint64_t v6 = v25;
          swift_slowDealloc();
        }
        else
        {
        }
      }
      ++v4;
      if (v8 == v2) {
        goto LABEL_22;
      }
    }
    __break(1u);
LABEL_21:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
  }
LABEL_22:
  swift_bridgeObjectRelease();
  v0[8] = _swiftEmptyArrayStorage;
  uint64_t v27 = (uint64_t (*)(void *, uint64_t, uint64_t))(*(void *)(v0[6] + 8) + **(int **)(v0[6] + 8));
  int v21 = (void *)swift_task_alloc();
  v0[9] = v21;
  *int v21 = v0;
  v21[1] = FirewallProvider.donateEntries(_:);
  uint64_t v22 = v0[6];
  uint64_t v23 = v0[5];
  return v27(_swiftEmptyArrayStorage, v23, v22);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 80) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = FirewallProvider.donateEntries(_:);
  }
  else {
    uint64_t v2 = FirewallProvider.donateEntries(_:);
  }
  return _swift_task_switch(v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_bridgeObjectRelease();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_bridgeObjectRelease();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t NearbyGroupFirewall.deinit()
{
  swift_unknownObjectWeakDestroy();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 24);
  return v0;
}

uint64_t NearbyGroupFirewall.__deallocating_deinit()
{
  swift_unknownObjectWeakDestroy();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t sub_1000C40D4()
{
  swift_weakDestroy();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000C410C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncPublisher<Published<Set<NearbyGroupMember>>.Publisher>);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();
  return _swift_deallocObject(v0, v6, v5);
}

uint64_t partial apply for closure #1 in NearbyGroupFirewall.init(group:service:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AsyncPublisher<Published<Set<NearbyGroupMember>>.Publisher>)
                 - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  NSString v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  void *v10 = v2;
  v10[1] = partial apply for closure #1 in NearbyInvitationAdvertiser.stopAdvertising();
  return closure #1 in NearbyGroupFirewall.init(group:service:)(a1, v6, v7, v8, v9);
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000C4380@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 96))();
  *a2 = result;
  return result;
}

uint64_t sub_1000C43CC(id *a1, uint64_t a2)
{
  id v2 = *a1;
  uint64_t v3 = *(uint64_t (**)(id))(**(void **)a2 + 104);
  id v4 = *a1;
  return v3(v2);
}

uint64_t sub_1000C4424(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)a1 + 120))();
}

uint64_t sub_1000C4468(uint64_t a1, uint64_t a2)
{
  outlined init with copy of PseudonymProtocol(a1, (uint64_t)v4);
  return (*(uint64_t (**)(unsigned char *))(**(void **)a2 + 128))(v4);
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = _swiftEmptyArrayStorage;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = _swift_stdlib_malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    specialized Array._copyContents(initializing:)((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v3;
}

void *specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = __CocoaSet.count.getter();
    if (v2) {
      goto LABEL_3;
    }
    return _swiftEmptyArrayStorage;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
LABEL_3:
  if (v2 <= 0)
  {
    uint64_t v3 = _swiftEmptyArrayStorage;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
    uint64_t v3 = (void *)swift_allocObject();
    int64_t v4 = _swift_stdlib_malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  unint64_t v6 = specialized Sequence._copySequenceContents(initializing:)(&v8, v3 + 4, v2, a1);
  uint64_t result = (void *)outlined consume of Set<IDSAccount>.Iterator._Variant();
  if (v6 == (void *)v2) {
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t specialized Array._copyContents(initializing:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]((unint64_t *)&lazy protocol witness table cache variable for type [NearbyAdvertisement] and conformance [A], &demangling cache variable for type metadata for [NearbyAdvertisement]);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [NearbyAdvertisement]);
          uint64_t v12 = specialized protocol witness for Collection.subscript.read in conformance [A](v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for NearbyAdvertisement();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void (*specialized protocol witness for Collection.subscript.read in conformance [A](void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = specialized Array.subscript.read(v6, a2, a3);
  return protocol witness for Collection.subscript.read in conformance [A]specialized ;
}

void protocol witness for Collection.subscript.read in conformance [A]specialized (void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*specialized Array.subscript.read(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return destroy for NearbyGroupHostIDSService.MessageContext;
  }
  __break(1u);
  return result;
}

void *specialized Sequence._copySequenceContents(initializing:)(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  unint64_t v6 = a2;
  uint64_t v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    __CocoaSet.makeIterator()();
    type metadata accessor for NearbyGroupMember();
    lazy protocol witness table accessor for type NearbyGroupMember and conformance NSObject();
    uint64_t result = (void *)Set.Iterator.init(_cocoa:)();
    uint64_t v4 = v27;
    uint64_t v8 = v28;
    uint64_t v9 = v29;
    int64_t v10 = v30;
    unint64_t v11 = v31;
    uint64_t v24 = v7;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v12 = 0;
LABEL_46:
    *uint64_t v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return (void *)v12;
  }
  int64_t v10 = 0;
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v8 = a4 + 56;
  uint64_t v9 = ~v20;
  uint64_t v21 = -v20;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v11 = v22 & *(void *)(a4 + 56);
  uint64_t v24 = result;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v12 = 0;
  int64_t v25 = (unint64_t)(v9 + 64) >> 6;
  uint64_t v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!__CocoaSet.Iterator.next()()) {
        goto LABEL_45;
      }
      type metadata accessor for NearbyGroupMember();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v15 = v26;
      uint64_t result = (void *)swift_unknownObjectRelease();
      if (!v26) {
        goto LABEL_45;
      }
      goto LABEL_8;
    }
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v16 >= v25)
    {
      unint64_t v11 = 0;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    if (v17) {
      goto LABEL_23;
    }
    int64_t v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      unint64_t v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25) {
        goto LABEL_42;
      }
      unint64_t v17 = *(void *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        int64_t v16 = v10 + 3;
        goto LABEL_23;
      }
      int64_t v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        unint64_t v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v18);
      if (!v17)
      {
        int64_t v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          unint64_t v11 = 0;
          int64_t v10 = v18;
          goto LABEL_45;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v16);
        if (!v17)
        {
          int64_t v19 = v10 + 6;
          while (v25 != v19)
          {
            unint64_t v17 = *(void *)(v8 + 8 * v19++);
            if (v17)
            {
              int64_t v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v11 = 0;
          int64_t v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    int64_t v16 = v18;
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v10 = v16;
LABEL_7:
    uint64_t result = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t v15 = result;
    if (!result) {
      goto LABEL_45;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      uint64_t v12 = a3;
LABEL_45:
      uint64_t v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

void specialized Sequence.compactMap<A>(_:)(uint64_t a1)
{
  unint64_t v22 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v1 = a1 + 56;
  uint64_t v2 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v3 = -1;
  if (v2 < 64) {
    uint64_t v3 = ~(-1 << v2);
  }
  uint64_t v4 = v3 & *(void *)(a1 + 56);
  int64_t v20 = (unint64_t)(v2 + 63) >> 6;
  int64_t v5 = 0;
  unint64_t v6 = &swift_beginAccess_ptr;
  swift_bridgeObjectRetain();
  while (v4)
  {
    v4 &= v4 - 1;
LABEL_20:
    id v10 = objc_allocWithZone((Class)v6[220]);
    swift_bridgeObjectRetain_n();
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v12 = [v10 initWithPrefixedURI:v11];

    if (v12)
    {
      id v13 = [objc_allocWithZone((Class)IDSFirewallEntry) initWithURI:v12];
      swift_bridgeObjectRelease();

      if (v13)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
    }
    else
    {
      if (one-time initialization token for firewall != -1) {
        swift_once();
      }
      uint64_t v14 = type metadata accessor for Logger();
      __swift_project_value_buffer(v14, (uint64_t)static Log.firewall);
      swift_bridgeObjectRetain_n();
      uint64_t v15 = Logger.logObject.getter();
      os_log_type_t v16 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v17 = swift_slowAlloc();
        uint64_t v21 = swift_slowAlloc();
        *(_DWORD *)uint64_t v17 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v18 = String.init<A>(reflecting:)();
        *(void *)(v17 + 4) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, v19, &v21);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Failed to convert URI: %s to IDSURI", (uint8_t *)v17, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        swift_bridgeObjectRelease();

        unint64_t v6 = &swift_beginAccess_ptr;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        unint64_t v6 = &swift_beginAccess_ptr;
      }
    }
  }
  if (__OFADD__(v5++, 1))
  {
    __break(1u);
    goto LABEL_35;
  }
  if (v5 >= v20) {
    goto LABEL_33;
  }
  uint64_t v8 = *(void *)(v1 + 8 * v5);
  if (v8)
  {
LABEL_19:
    uint64_t v4 = (v8 - 1) & v8;
    goto LABEL_20;
  }
  int64_t v9 = v5 + 1;
  if (v5 + 1 >= v20) {
    goto LABEL_33;
  }
  uint64_t v8 = *(void *)(v1 + 8 * v9);
  if (v8) {
    goto LABEL_18;
  }
  int64_t v9 = v5 + 2;
  if (v5 + 2 >= v20) {
    goto LABEL_33;
  }
  uint64_t v8 = *(void *)(v1 + 8 * v9);
  if (v8) {
    goto LABEL_18;
  }
  int64_t v9 = v5 + 3;
  if (v5 + 3 >= v20) {
    goto LABEL_33;
  }
  uint64_t v8 = *(void *)(v1 + 8 * v9);
  if (v8) {
    goto LABEL_18;
  }
  int64_t v9 = v5 + 4;
  if (v5 + 4 >= v20)
  {
LABEL_33:
    swift_release();
    return;
  }
  uint64_t v8 = *(void *)(v1 + 8 * v9);
  if (v8)
  {
LABEL_18:
    int64_t v5 = v9;
    goto LABEL_19;
  }
  while (1)
  {
    int64_t v5 = v9 + 1;
    if (__OFADD__(v9, 1)) {
      break;
    }
    if (v5 >= v20) {
      goto LABEL_33;
    }
    uint64_t v8 = *(void *)(v1 + 8 * v5);
    ++v9;
    if (v8) {
      goto LABEL_19;
    }
  }
LABEL_35:
  __break(1u);
}

id NearbyIDSServiceController.__allocating_init(queue:service:delegate:joinRequestsController:)(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  NSString v11 = (char *)objc_allocWithZone(v5);
  uint64_t v12 = *(void *)(a2 + 24);
  uint64_t v13 = *(void *)(a2 + 32);
  uint64_t v14 = __swift_mutable_project_boxed_opaque_existential_1(a2, v12);
  __chkstk_darwin(v14);
  os_log_type_t v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v17 + 16))(v16);
  id v18 = specialized NearbyIDSServiceController.init(queue:service:delegate:joinRequestsController:)(a1, (uint64_t)v16, a3, a4, a5, v11, v12, v13);
  __swift_destroy_boxed_opaque_existential_0Tm(a2);
  return v18;
}

uint64_t IDSServiceProtocol.send(_:from:to:priority:options:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = a4;
  unint64_t v45 = a4 & 0xC000000000000001;
  if ((a4 & 0xC000000000000001) != 0) {
    uint64_t v10 = __CocoaSet.count.getter();
  }
  else {
    uint64_t v10 = *(void *)(a4 + 16);
  }
  NSString v11 = _swiftEmptyArrayStorage;
  if (!v10)
  {
LABEL_23:
    uint64_t v35 = specialized Set.init<A>(_:)((uint64_t)v11);
    swift_bridgeObjectRelease();
    uint64_t v36 = specialized _setUpCast<A, B>(_:)(v35);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a9 + 48))(a1, a2, a3, v36, a5, a6, a7, a8, a9);
    return swift_bridgeObjectRelease();
  }
  uint64_t v50 = _swiftEmptyArrayStorage;
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v10 & ~(v10 >> 63), 0);
  if (v45)
  {
    uint64_t result = __CocoaSet.startIndex.getter();
    char v14 = 1;
  }
  else
  {
    uint64_t result = specialized _NativeSet.startIndex.getter(v9);
    char v14 = v15 & 1;
  }
  uint64_t v47 = result;
  uint64_t v48 = v13;
  char v49 = v14;
  if ((v10 & 0x8000000000000000) == 0)
  {
    uint64_t v44 = v9;
    do
    {
      while (1)
      {
        int64_t v22 = v47;
        uint64_t v21 = v48;
        char v23 = v49;
        specialized Set.subscript.getter(v47, v48, v49, v9);
        int64_t v25 = v24;
        uint64_t v26 = NearbyGroupMember.tokenID.getter();
        if (!v27) {
          uint64_t v26 = NearbyGroupMember.handle.getter();
        }
        uint64_t v28 = v26;
        uint64_t v29 = v27;

        int64_t v30 = v50;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v30[2] + 1, 1);
          int64_t v30 = v50;
        }
        unint64_t v32 = v30[2];
        unint64_t v31 = v30[3];
        if (v32 >= v31 >> 1)
        {
          uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v31 > 1, v32 + 1, 1);
          int64_t v30 = v50;
        }
        v30[2] = v32 + 1;
        uint64_t v33 = &v30[2 * v32];
        v33[4] = v28;
        v33[5] = v29;
        if (v45) {
          break;
        }
        uint64_t v9 = v44;
        int64_t v16 = specialized _NativeSet.index(after:)(v22, v21, v23, v44);
        uint64_t v18 = v17;
        char v20 = v19;
        outlined consume of Set<NearbyGroupHostIDSService.MessageEvent.Member>.Index._Variant(v22, v21, v23);
        uint64_t v47 = v16;
        uint64_t v48 = v18;
        char v49 = v20 & 1;
        if (!--v10) {
          goto LABEL_22;
        }
      }
      uint64_t v9 = v44;
      if ((v23 & 1) == 0) {
        goto LABEL_25;
      }
      if (__CocoaSet.Index.handleBitPattern.getter()) {
        swift_isUniquelyReferenced_nonNull_native();
      }
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Set<NearbyGroupMember>.Index);
      uint64_t v34 = (void (*)(char *, void))Set.Index._asCocoa.modify();
      __CocoaSet.formIndex(after:isUnique:)();
      v34(v46, 0);
      --v10;
    }
    while (v10);
LABEL_22:
    outlined consume of Set<NearbyGroupHostIDSService.MessageEvent.Member>.Index._Variant(v47, v48, v49);
    NSString v11 = v50;
    goto LABEL_23;
  }
  __break(1u);
LABEL_25:
  __break(1u);
  return result;
}

uint64_t specialized _setUpCast<A, B>(_:)(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<AnyHashable>);
    uint64_t v2 = (void *)static _SetStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptySetSingleton;
  }
  uint64_t v3 = a1 + 56;
  uint64_t v4 = -1 << *(unsigned char *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1 << -(char)v4);
  }
  else {
    uint64_t v5 = -1;
  }
  uint64_t v6 = v5 & *(void *)(a1 + 56);
  int64_t v7 = (unint64_t)(63 - v4) >> 6;
  uint64_t v8 = (char *)(v2 + 7);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_28;
    }
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v7) {
      goto LABEL_37;
    }
    uint64_t v14 = *(void *)(v3 + 8 * v13);
    int64_t v15 = v10 + 1;
    if (!v14)
    {
      int64_t v15 = v10 + 2;
      if (v10 + 2 >= v7) {
        goto LABEL_37;
      }
      uint64_t v14 = *(void *)(v3 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v10 + 3;
        if (v10 + 3 >= v7) {
          goto LABEL_37;
        }
        uint64_t v14 = *(void *)(v3 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v10 + 4;
          if (v10 + 4 >= v7) {
            goto LABEL_37;
          }
          uint64_t v14 = *(void *)(v3 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    uint64_t v6 = (v14 - 1) & v14;
    int64_t v10 = v15;
LABEL_28:
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v17 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)&v8[8 * (v18 >> 6)]) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v18) & ~*(void *)&v8[8 * (v18 >> 6)])) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v20 = 0;
      unint64_t v21 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v21 && (v20 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v22 = v19 == v21;
        if (v19 == v21) {
          unint64_t v19 = 0;
        }
        v20 |= v22;
        uint64_t v23 = *(void *)&v8[8 * v19];
      }
      while (v23 == -1);
      unint64_t v11 = __clz(__rbit64(~v23)) + (v19 << 6);
    }
    *(void *)&v8[(v11 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v11;
    uint64_t v12 = v2[6] + 40 * v11;
    *(_OWORD *)uint64_t v12 = v24;
    *(_OWORD *)(v12 + 16) = v25;
    *(void *)(v12 + 32) = v26;
    ++v2[2];
  }
  int64_t v16 = v10 + 5;
  if (v10 + 5 >= v7)
  {
LABEL_37:
    swift_release();
    outlined consume of Set<IDSAccount>.Iterator._Variant();
    return (uint64_t)v2;
  }
  uint64_t v14 = *(void *)(v3 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v10 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v7) {
      goto LABEL_37;
    }
    uint64_t v14 = *(void *)(v3 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t IDSService.firewall.getter(uint64_t a1)
{
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = v1;
  return _swift_task_switch(IDSService.firewall.getter, 0, 0);
}

uint64_t IDSService.firewall.getter()
{
  uint64_t v1 = (void *)v0[17];
  type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  uint64_t v2 = static OS_dispatch_queue.main.getter();
  v0[18] = v2;
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = IDSService.firewall.getter;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = @objc completion handler block implementation for @escaping @callee_unowned @convention(block) (@unowned IDSPseudonym?, @unowned NSError?) -> () with result type IDSPseudonym;
  v0[13] = &block_descriptor_5;
  v0[14] = v3;
  [v1 retrieveFirewallWithQueue:v2 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 152) = v1;
  if (v1) {
    uint64_t v2 = IDSService.firewall.getter;
  }
  else {
    uint64_t v2 = IDSService.firewall.getter;
  }
  return _swift_task_switch(v2, 0, 0);
}

{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v6;

  uint64_t v1 = (void *)v0[18];
  uint64_t v3 = v0[15];
  uint64_t v2 = (void *)v0[16];
  v2[3] = type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for IDSFirewall);
  v2[4] = &protocol witness table for IDSFirewall;
  *uint64_t v2 = v3;

  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

{
  uint64_t v0;
  void *v1;
  uint64_t (*v2)(void);
  uint64_t v4;

  uint64_t v1 = *(void **)(v0 + 144);
  swift_willThrow();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t protocol witness for IDSServiceProtocol.firewall.getter in conformance IDSService(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = partial apply for closure #1 in NearbyInvitationAdvertiser.stopAdvertising();
  v5[16] = a1;
  v5[17] = v4;
  return _swift_task_switch(IDSService.firewall.getter, 0, 0);
}

id protocol witness for IDSServiceProtocol.add(_:with:queue:) in conformance IDSService(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*v3 addDelegate:a1 withDelegateProperties:a2 queue:a3];
}

id protocol witness for IDSServiceProtocol.send(_:toDestinations:priority:options:identifier:) in conformance IDSService(uint64_t a1, unint64_t a2, objc_class *a3, uint64_t a4, objc_class *a5, uint64_t a6)
{
  return @nonobjc IDSService.send(_:toDestinations:priority:options:identifier:)(a1, a2, a3, a4, a5, a6);
}

id @nonobjc IDSService.send(_:toDestinations:priority:options:identifier:)(uint64_t a1, unint64_t a2, objc_class *a3, uint64_t a4, Class a5, uint64_t a6)
{
  uint64_t v7 = v6;
  Class v11 = a3;
  if (a2 >> 60 != 15)
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    if (!v11) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  Class isa = 0;
  if (a3) {
LABEL_5:
  }
    Class v11 = Set._bridgeToObjectiveC()().super.isa;
LABEL_6:
  if (a5) {
    a5 = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  id v16 = 0;
  unsigned int v13 = [v7 sendData:isa toDestinations:v11 priority:a4 options:a5 identifier:a6 error:&v16];

  if (v13) {
    return v16;
  }
  id v15 = v16;
  _convertNSErrorToError(_:)();

  return (id)swift_willThrow();
}

id protocol witness for IDSServiceProtocol.send(_:from:toDestinations:priority:options:identifier:) in conformance IDSService(uint64_t a1, unint64_t a2, uint64_t a3, objc_class *a4, uint64_t a5, objc_class *a6, uint64_t a7)
{
  return @nonobjc IDSService.send(_:from:toDestinations:priority:options:identifier:)(a1, a2, a3, a4, a5, a6, a7);
}

id @nonobjc IDSService.send(_:from:toDestinations:priority:options:identifier:)(uint64_t a1, unint64_t a2, uint64_t a3, objc_class *a4, uint64_t a5, Class a6, uint64_t a7)
{
  uint64_t v8 = v7;
  Class v12 = a4;
  if (a2 >> 60 != 15)
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    if (!v12) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  Class isa = 0;
  if (a4) {
LABEL_5:
  }
    Class v12 = Set._bridgeToObjectiveC()().super.isa;
LABEL_6:
  if (a6) {
    a6 = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  id v18 = 0;
  unsigned int v15 = [v8 sendData:isa fromAccount:a3 toDestinations:v12 priority:a5 options:a6 identifier:a7 error:&v18];

  if (v15) {
    return v18;
  }
  id v17 = v18;
  _convertNSErrorToError(_:)();

  return (id)swift_willThrow();
}

uint64_t protocol witness for IDSServiceProtocol.send(_:from:to:priority:options:identifier:) in conformance IDSService(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return IDSServiceProtocol.send(_:from:to:priority:options:identifier:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t NearbyIDSServiceController.delegate.getter()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t NearbyIDSServiceController.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*NearbyIDSServiceController.delegate.modify(void *a1))(uint64_t a1, char a2)
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = Strong;
  v3[4] = v7;
  return NearbyInvitationAdvertiser.delegate.modify;
}

uint64_t NearbyIDSServiceController.service.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of PseudonymProtocol(v1 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_service, a1);
}

uint64_t NearbyIDSServiceController.firewall.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_firewall;
  swift_beginAccess();
  return outlined init with copy of (String, Any)(v3, a1, &demangling cache variable for type metadata for FirewallProvider?);
}

uint64_t NearbyIDSServiceController.firewall.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_firewall;
  swift_beginAccess();
  outlined assign with take of FirewallProvider?(a1, v3);
  return swift_endAccess();
}

uint64_t (*NearbyIDSServiceController.firewall.modify())()
{
  return NearbyInvitationsScanner.deviceFoundContinuation.modify;
}

id NearbyIDSServiceController.joinRequestsController.getter()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_joinRequestsController));
}

id NearbyIDSServiceController.queue.getter()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue));
}

uint64_t NearbyIDSServiceController.requesterCredentialsByOwnerPseudonym.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t NearbyIDSServiceController.requesterCredentialsByOwnerPseudonym.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1
                + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_requesterCredentialsByOwnerPseudonym);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*NearbyIDSServiceController.requesterCredentialsByOwnerPseudonym.modify())()
{
  return NearbyInvitationAdvertiser.listeners.modify;
}

id NearbyIDSServiceController.contactStore.getter()
{
  uint64_t v1 = OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController____lazy_storage___contactStore;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController____lazy_storage___contactStore);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController____lazy_storage___contactStore);
  }
  else
  {
    id v4 = closure #1 in NearbyIDSServiceController.contactStore.getter();
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id closure #1 in NearbyIDSServiceController.contactStore.getter()
{
  id v0 = [self mainBundle];
  id v1 = [v0 bundleIdentifier];

  if (v1)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  uint64_t v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v4 = objc_msgSend(v2, "tu_contactStoreConfigurationForBundleIdentifier:", v3);

  id v5 = [objc_allocWithZone((Class)CNContactStore) initWithConfiguration:v4];
  return v5;
}

id NearbyIDSServiceController.init(queue:service:delegate:joinRequestsController:)(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v11 = *(void *)(a2 + 24);
  uint64_t v12 = *(void *)(a2 + 32);
  uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1(a2, v11);
  __chkstk_darwin(v13);
  unsigned int v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v16 + 16))(v15);
  id v17 = specialized NearbyIDSServiceController.init(queue:service:delegate:joinRequestsController:)(a1, (uint64_t)v15, a3, a4, a5, v5, v11, v12);
  __swift_destroy_boxed_opaque_existential_0Tm(a2);
  return v17;
}

uint64_t closure #1 in NearbyIDSServiceController.init(queue:service:delegate:joinRequestsController:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 72) = a4;
  *(void *)(v5 + 80) = a5;
  return _swift_task_switch(closure #1 in NearbyIDSServiceController.init(queue:service:delegate:joinRequestsController:), 0, 0);
}

uint64_t closure #1 in NearbyIDSServiceController.init(queue:service:delegate:joinRequestsController:)()
{
  id v1 = *(void **)(v0 + 80);
  uint64_t v2 = v1[3];
  uint64_t v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  id v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 24) + **(int **)(v3 + 24));
  id v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 88) = v4;
  *id v4 = v0;
  v4[1] = closure #1 in NearbyIDSServiceController.init(queue:service:delegate:joinRequestsController:);
  return v6(v0 + 16, v2, v3);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 96) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = closure #1 in NearbyIDSServiceController.init(queue:service:delegate:joinRequestsController:);
  }
  else {
    uint64_t v2 = closure #1 in NearbyIDSServiceController.init(queue:service:delegate:joinRequestsController:);
  }
  return _swift_task_switch(v2, 0, 0);
}

{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t (*v5)(void);
  uint64_t v7;

  (*(void (**)(uint64_t))((swift_isaMask & **(void **)(v0 + 72)) + 0xA8))(v0 + 16);
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  id v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Log.host);
  uint64_t v2 = Logger.logObject.getter();
  uint64_t v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    id v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Fetched firewall.", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  BOOL v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t (*v9)(void);
  uint64_t v11;
  void *v12;
  uint64_t v13;

  uint64_t v12 = v0;
  if (one-time initialization token for host != -1) {
    swift_once();
  }
  id v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Log.host);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  uint64_t v3 = static os_log_type_t.error.getter();
  id v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[12];
  if (v4)
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)id v6 = 136315138;
    v0[7] = v5;
    swift_errorRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
    uint64_t v7 = String.init<A>(reflecting:)();
    v0[8] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v8, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Failed to fetch firewall, error: %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NearbyIDSServiceController.denyConnectionRequest(id:destinationHandle:)(Swift::String id, Swift::String destinationHandle)
{
  Swift::String v38 = destinationHandle;
  uint64_t v3 = type metadata accessor for NearbyProtoConnectionResponse.Content(0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (int *)type metadata accessor for NearbyProtoSessionMessage(0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchPredicate();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (uint8_t **)((char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v37 = v2;
  uint64_t v13 = *(void **)((char *)v2
                 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue);
  void *v12 = v13;
  (*(void (**)(void *, void, uint64_t))(v10 + 104))(v12, enum case for DispatchPredicate.onQueue(_:), v9);
  id v14 = v13;
  LOBYTE(v13) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v10 + 8))(v12, v9);
  if ((v13 & 1) == 0)
  {
    __break(1u);
LABEL_11:
    swift_once();
    goto LABEL_4;
  }
  UnknownStorage.init()();
  unsigned int v15 = &v8[v6[5]];
  *(_DWORD *)unsigned int v15 = 0;
  void v15[4] = 1;
  uint64_t v16 = &v8[v6[6]];
  *(void *)uint64_t v16 = 0;
  *((_WORD *)v16 + 4) = 256;
  id v17 = &v8[v6[7]];
  *(_OWORD *)id v17 = xmmword_1000D61F0;
  *(void *)uint64_t v16 = 4;
  *((_WORD *)v16 + 4) = 1;
  lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content, (void (*)(uint64_t))type metadata accessor for NearbyProtoConnectionResponse.Content);
  uint64_t v18 = (uint64_t)v39;
  static Message.with(_:)();
  uint64_t v19 = Message.serializedData(partial:)();
  uint64_t v3 = v18;
  if (v18) {
    goto LABEL_9;
  }
  uint64_t v39 = v5;
  *(void *)id v17 = v19;
  *((void *)v17 + 1) = v20;
  if (one-time initialization token for host != -1) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v21 = type metadata accessor for Logger();
  __swift_project_value_buffer(v21, (uint64_t)static Log.host);
  object = v38._object;
  swift_bridgeObjectRetain_n();
  uint64_t v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v23, v24))
  {
    long long v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    uint64_t v42 = v36;
    *(_DWORD *)long long v25 = 136315138;
    uint64_t v35 = v25 + 4;
    uint64_t countAndFlagsBits = v38._countAndFlagsBits;
    uint64_t v41 = object;
    swift_bridgeObjectRetain();
    uint64_t v26 = String.init<A>(reflecting:)();
    uint64_t countAndFlagsBits = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v26, v27, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Sending deny connection message to %s", v25, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v5 = v39;
  lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content((unint64_t *)&lazy protocol witness table cache variable for type NearbyProtoSessionMessage and conformance NearbyProtoSessionMessage, (void (*)(uint64_t))type metadata accessor for NearbyProtoSessionMessage);
  uint64_t v28 = Message.serializedData(partial:)();
  if (!v3)
  {
    uint64_t v30 = v28;
    unint64_t v31 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000D61D0;
    uint64_t v33 = v38._object;
    *(void *)(inited + 32) = v38._countAndFlagsBits;
    *(void *)(inited + 40) = v33;
    swift_bridgeObjectRetain();
    Swift::Int v34 = specialized Set.init(_nonEmptyArrayLiteral:)(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    (*(void (**)(uint64_t, unint64_t, Swift::Int, void, void, void))((swift_isaMask & *v37)
                                                                                          + 0x120))(v30, v31, v34, 0, 0, 0);
    swift_bridgeObjectRelease();
    outlined consume of Data._Representation(v30, v31);
    swift_bridgeObjectRelease();
  }
LABEL_9:
  outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v5, type metadata accessor for NearbyProtoConnectionResponse.Content);
  outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v8, type metadata accessor for NearbyProtoSessionMessage);
}

uint64_t closure #1 in NearbyIDSServiceController.denyConnectionRequest(id:destinationHandle:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NearbyProtoConnectionResponse.Content.DeniedContent(0);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoConnectionResponse.Content.DeniedContent and conformance NearbyProtoConnectionResponse.Content.DeniedContent, (void (*)(uint64_t))type metadata accessor for NearbyProtoConnectionResponse.Content.DeniedContent);
  static Message.with(_:)();
  uint64_t v5 = a1 + *(int *)(type metadata accessor for NearbyProtoConnectionResponse.Content(0) + 24);
  outlined destroy of Any?(v5, &demangling cache variable for type metadata for NearbyProtoConnectionResponse.Content.OneOf_Operation?);
  outlined init with take of NearbyProtoSessionMessage((uint64_t)v4, v5, type metadata accessor for NearbyProtoConnectionResponse.Content.DeniedContent);
  uint64_t v6 = type metadata accessor for NearbyProtoConnectionResponse.Content.OneOf_Operation(0);
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
}

uint64_t NearbyIDSServiceController.approveConnectionRequest(id:localInvitation:destinationHandle:)(void *a1, uint8_t *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v53 = a2;
  uint64_t v49 = a5;
  uint64_t v50 = a6;
  uint64_t v51 = a3;
  uint64_t v52 = a4;
  uint64_t v8 = type metadata accessor for NearbyProtoConnectionResponse.Content(0);
  __chkstk_darwin(v8);
  unint64_t v55 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (int *)type metadata accessor for NearbyProtoSessionMessage(0);
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DispatchPredicate();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (void **)((char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v48 = v6;
  id v17 = *(void **)((char *)v6
                 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue);
  *uint64_t v16 = v17;
  (*(void (**)(void *, void, uint64_t))(v14 + 104))(v16, enum case for DispatchPredicate.onQueue(_:), v13);
  id v18 = v17;
  LOBYTE(v17) = _dispatchPreconditionTest(_:)();
  uint64_t v20 = *(void (**)(void *, uint64_t))(v14 + 8);
  uint64_t v19 = v14 + 8;
  v20(v16, v13);
  if ((v17 & 1) == 0)
  {
    __break(1u);
LABEL_12:
    swift_once();
    goto LABEL_4;
  }
  uint64_t v21 = UnknownStorage.init()();
  BOOL v22 = &v12[v10[5]];
  *(_DWORD *)BOOL v22 = 0;
  v22[4] = 1;
  uint64_t v23 = &v12[v10[6]];
  *(void *)uint64_t v23 = 0;
  *((_WORD *)v23 + 4) = 256;
  os_log_type_t v24 = &v12[v10[7]];
  *(_OWORD *)os_log_type_t v24 = xmmword_1000D61F0;
  *(void *)uint64_t v23 = 4;
  *((_WORD *)v23 + 4) = 1;
  __chkstk_darwin(v21);
  long long v25 = v52;
  *(&v48 - 4) = v51;
  *(&v48 - 3) = v25;
  uint64_t v26 = v53;
  *(&v48 - 2) = a1;
  *(&v48 - 1) = v26;
  lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content, (void (*)(uint64_t))type metadata accessor for NearbyProtoConnectionResponse.Content);
  unint64_t v27 = v54;
  uint64_t v19 = (uint64_t)v55;
  static Message.with(_:)();
  uint64_t v28 = Message.serializedData(partial:)();
  uint64_t v16 = v27;
  if (v27)
  {
LABEL_9:
    outlined destroy of NearbyProtoConnectionResponse.Content(v19, type metadata accessor for NearbyProtoConnectionResponse.Content);
    uint64_t v47 = (uint64_t)v12;
    return outlined destroy of NearbyProtoConnectionResponse.Content(v47, type metadata accessor for NearbyProtoSessionMessage);
  }
  uint64_t v30 = v28;
  uint64_t v31 = v29;
  uint64_t v54 = v12;
  outlined consume of Data?(*(void *)v24, *((void *)v24 + 1));
  *(void *)os_log_type_t v24 = v30;
  *((void *)v24 + 1) = v31;
  if (one-time initialization token for host != -1) {
    goto LABEL_12;
  }
LABEL_4:
  uint64_t v32 = type metadata accessor for Logger();
  __swift_project_value_buffer(v32, (uint64_t)static Log.host);
  uint64_t v33 = v50;
  swift_bridgeObjectRetain_n();
  Swift::Int v34 = Logger.logObject.getter();
  os_log_type_t v35 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    uint64_t v58 = swift_slowAlloc();
    *(_DWORD *)uint64_t v36 = 136315138;
    uint64_t v53 = v36 + 4;
    uint64_t v56 = v49;
    uint64_t v57 = v33;
    swift_bridgeObjectRetain();
    uint64_t v37 = String.init<A>(reflecting:)();
    uint64_t v56 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v37, v38, &v58);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    uint64_t v19 = (uint64_t)v55;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v34, v35, "Sending approve connection message to %s", v36, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v12 = v54;
  lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content((unint64_t *)&lazy protocol witness table cache variable for type NearbyProtoSessionMessage and conformance NearbyProtoSessionMessage, (void (*)(uint64_t))type metadata accessor for NearbyProtoSessionMessage);
  uint64_t v39 = Message.serializedData(partial:)();
  if (v16) {
    goto LABEL_9;
  }
  uint64_t v41 = v39;
  unint64_t v42 = v40;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000D61D0;
  uint64_t v44 = v50;
  *(void *)(inited + 32) = v49;
  *(void *)(inited + 40) = v44;
  swift_bridgeObjectRetain();
  Swift::Int v45 = specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  (*(void (**)(uint64_t, unint64_t, Swift::Int, void, void, uint64_t))((swift_isaMask & *v48)
                                                                                         + 0x120))(v41, v42, v45, 0, 0, 1);
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v41, v42);
  swift_bridgeObjectRelease();
  outlined destroy of NearbyProtoConnectionResponse.Content(v19, type metadata accessor for NearbyProtoConnectionResponse.Content);
  uint64_t v47 = (uint64_t)v54;
  return outlined destroy of NearbyProtoConnectionResponse.Content(v47, type metadata accessor for NearbyProtoSessionMessage);
}

uint64_t closure #1 in NearbyIDSServiceController.approveConnectionRequest(id:localInvitation:destinationHandle:)(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v19 = a4;
  uint64_t v20 = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoConnectionResponse.Content.OneOf_Operation?);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for NearbyProtoConnectionResponse.Content.ApprovalContent(0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = (uint64_t)a1 + *(int *)(type metadata accessor for NearbyProtoConnectionResponse.Content(0) + 24);
  outlined init with copy of (String, Any)(v14, (uint64_t)v10, &demangling cache variable for type metadata for NearbyProtoConnectionResponse.Content.OneOf_Operation?);
  uint64_t v15 = type metadata accessor for NearbyProtoConnectionResponse.Content.OneOf_Operation(0);
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v10, 1, v15) == 1)
  {
    outlined copy of Data._Representation(a2, a3);
    outlined destroy of Any?((uint64_t)v10, &demangling cache variable for type metadata for NearbyProtoConnectionResponse.Content.OneOf_Operation?);
LABEL_6:
    *(_OWORD *)uint64_t v13 = xmmword_1000D7960;
    UnknownStorage.init()();
    goto LABEL_7;
  }
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    outlined copy of Data._Representation(a2, a3);
    outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v10, type metadata accessor for NearbyProtoConnectionResponse.Content.OneOf_Operation);
    goto LABEL_6;
  }
  outlined init with take of NearbyProtoSessionMessage((uint64_t)v10, (uint64_t)v13, type metadata accessor for NearbyProtoConnectionResponse.Content.ApprovalContent);
  outlined copy of Data._Representation(a2, a3);
LABEL_7:
  outlined consume of Data._Representation(*(void *)v13, *((void *)v13 + 1));
  *(void *)uint64_t v13 = a2;
  *((void *)v13 + 1) = a3;
  outlined destroy of Any?(v14, &demangling cache variable for type metadata for NearbyProtoConnectionResponse.Content.OneOf_Operation?);
  outlined init with take of NearbyProtoSessionMessage((uint64_t)v13, v14, type metadata accessor for NearbyProtoConnectionResponse.Content.ApprovalContent);
  swift_storeEnumTagMultiPayload();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v16 + 56))(v14, 0, 1, v15);
  uint64_t v17 = v20;
  swift_bridgeObjectRetain();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v19;
  a1[1] = v17;
  return result;
}

void NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)(void *a1, void *a2)
{
  uint64_t v3 = v2;
  id v97 = a2;
  uint64_t v5 = type metadata accessor for NearbyProtoSessionMessage(0);
  __chkstk_darwin(v5);
  v94 = (char *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for NearbyProtoJoinResponse.Content(0);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v85 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchPredicate();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (void *)((char *)&v85 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = *(void **)((char *)v3
                 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue);
  void *v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, enum case for DispatchPredicate.onQueue(_:), v10);
  id v15 = v14;
  LOBYTE(v14) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) == 0)
  {
    __break(1u);
LABEL_24:
    swift_once();
    goto LABEL_6;
  }
  uint64_t v16 = dispatch thunk of IncomingInvitationJoinRequest.hostInfo.getter();
  if (v16)
  {
    uint64_t v92 = v5;
    uint64_t v17 = (void *)v16;
    uint64_t v93 = NearbyInvitationJoinRequestMetadata.pseudonym.getter();
    uint64_t v95 = v18;
    __chkstk_darwin(v93);
    id v19 = v97;
    *((void *)&v85 - 2) = a1;
    *((void *)&v85 - 1) = v19;
    lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoJoinResponse.Content and conformance NearbyProtoJoinResponse.Content, (void (*)(uint64_t))type metadata accessor for NearbyProtoJoinResponse.Content);
    id v20 = v96;
    static Message.with(_:)();
    uint64_t v21 = *(void **)((char *)v3
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_joinRequestsController);
    uint64_t v22 = Message.serializedData(partial:)();
    if (v20)
    {
      outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v9, type metadata accessor for NearbyProtoJoinResponse.Content);
      swift_bridgeObjectRelease();

      return;
    }
    uint64_t v32 = v22;
    unint64_t v33 = v23;
    uint64_t v90 = v3;
    id v96 = v17;
    uint64_t v91 = v9;
    uint64_t v34 = IncomingInvitationJoinRequest.remotePublicKey.getter();
    unint64_t v36 = v35;
    uint64_t v37 = v95;
    uint64_t v39 = a1;
    uint64_t v40 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))((swift_isaMask & *v21) + 0xB8))(v32, v33, v34, v35, v93, v95);
    uint64_t v41 = v34;
    unint64_t v43 = v42;
    outlined consume of Data._Representation(v41, v36);
    uint64_t v44 = outlined consume of Data._Representation(v32, v33);
    __chkstk_darwin(v44);
    *((void *)&v85 - 2) = v40;
    *((void *)&v85 - 1) = v43;
    uint64_t v45 = lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content((unint64_t *)&lazy protocol witness table cache variable for type NearbyProtoSessionMessage and conformance NearbyProtoSessionMessage, (void (*)(uint64_t))type metadata accessor for NearbyProtoSessionMessage);
    uint64_t v46 = (uint64_t)v94;
    static Message.with(_:)();
    uint64_t v86 = v40;
    unint64_t v87 = v43;
    uint64_t v89 = 0;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, String)>);
    uint64_t inited = swift_initStackObject();
    long long v85 = xmmword_1000D61D0;
    *(_OWORD *)(inited + 16) = xmmword_1000D61D0;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v48;
    *(void *)(inited + 48) = v93;
    *(void *)(inited + 56) = v37;
    swift_bridgeObjectRetain();
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    swift_bridgeObjectRelease();
    if (one-time initialization token for host != -1) {
      swift_once();
    }
    uint64_t v49 = type metadata accessor for Logger();
    __swift_project_value_buffer(v49, (uint64_t)static Log.host);
    id v50 = v97;
    id v51 = v39;
    uint64_t v52 = v50;
    uint64_t v53 = v51;
    uint64_t v54 = Logger.logObject.getter();
    os_log_type_t v55 = static os_log_type_t.default.getter();
    int v56 = v55;
    BOOL v57 = os_log_type_enabled(v54, v55);
    uint64_t v88 = v45;
    if (v57)
    {
      uint64_t v58 = swift_slowAlloc();
      uint64_t v59 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v58 = 138412546;
      LODWORD(v97) = v56;
      v99 = v52;
      uint64_t v60 = v52;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v59 = v52;

      uint64_t v46 = (uint64_t)v94;
      *(_WORD *)(v58 + 12) = 2112;
      v99 = v53;
      uint64_t v61 = v53;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v59[1] = v53;

      _os_log_impl((void *)&_mh_execute_header, v54, (os_log_type_t)v97, "We are about to send a join response with this response %@ and this %@", (uint8_t *)v58, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v54 = v52;
    }
    uint64_t v62 = (uint64_t)v91;

    uint64_t v63 = IncomingInvitationJoinRequest.destinationToken.getter();
    if (v64)
    {
      uint64_t v65 = v63;
      uint64_t v66 = v64;
      uint64_t v67 = v89;
      uint64_t v68 = Message.serializedData(partial:)();
      if (!v67)
      {
        uint64_t v70 = v68;
        unint64_t v71 = v69;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
        uint64_t v72 = swift_initStackObject();
        *(_OWORD *)(v72 + 16) = v85;
        *(void *)(v72 + 32) = v65;
        *(void *)(v72 + 40) = v66;
        Swift::Int v73 = specialized Set.init(_nonEmptyArrayLiteral:)(v72);
        swift_setDeallocating();
        swift_arrayDestroy();
        (*(void (**)(uint64_t, unint64_t, Swift::Int, uint64_t, uint64_t, uint64_t))((swift_isaMask & *v90)
                                                                                                 + 0x120))(v70, v71, v73, v93, v95, 1);
        outlined consume of Data._Representation(v86, v87);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        outlined consume of Data._Representation(v70, v71);
        swift_bridgeObjectRelease();

LABEL_22:
        uint64_t v84 = (uint64_t)v91;
        outlined destroy of NearbyProtoConnectionResponse.Content(v46, type metadata accessor for NearbyProtoSessionMessage);
        outlined destroy of NearbyProtoConnectionResponse.Content(v84, type metadata accessor for NearbyProtoJoinResponse.Content);
        return;
      }
    }
    else
    {
      uint64_t v74 = IncomingInvitationJoinRequest.remotePseudonym.getter();
      uint64_t v76 = v75;
      uint64_t v77 = v89;
      uint64_t v78 = Message.serializedData(partial:)();
      if (!v77)
      {
        uint64_t v80 = v78;
        unint64_t v81 = v79;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
        uint64_t v82 = swift_initStackObject();
        *(_OWORD *)(v82 + 16) = v85;
        *(void *)(v82 + 32) = v74;
        *(void *)(v82 + 40) = v76;
        Swift::Int v83 = specialized Set.init(_nonEmptyArrayLiteral:)(v82);
        swift_setDeallocating();
        swift_arrayDestroy();
        (*(void (**)(uint64_t, unint64_t, Swift::Int, uint64_t, uint64_t, uint64_t))((swift_isaMask & *v90)
                                                                                                 + 0x120))(v80, v81, v83, v93, v95, 1);
        outlined consume of Data._Representation(v86, v87);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        outlined consume of Data._Representation(v80, v81);
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
    }
    outlined consume of Data._Representation(v86, v87);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    outlined destroy of NearbyProtoConnectionResponse.Content(v46, type metadata accessor for NearbyProtoSessionMessage);
    outlined destroy of NearbyProtoConnectionResponse.Content(v62, type metadata accessor for NearbyProtoJoinResponse.Content);
    return;
  }
  if (one-time initialization token for host != -1) {
    goto LABEL_24;
  }
LABEL_6:
  uint64_t v24 = type metadata accessor for Logger();
  __swift_project_value_buffer(v24, (uint64_t)static Log.host);
  id v25 = a1;
  uint64_t v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v26, v27))
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc();
    v99 = swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 136315138;
    uint64_t v98 = (uint64_t)v25;
    type metadata accessor for IncomingInvitationJoinRequest();
    id v29 = v25;
    uint64_t v30 = String.init<A>(reflecting:)();
    uint64_t v98 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, (uint64_t *)&v99);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Failed to find hostInfo on pendingMember: %s", v28, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  lazy protocol witness table accessor for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors();
  swift_allocError();
  *unint64_t v38 = 0;
  swift_willThrow();
}

uint64_t closure #1 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for NearbyProtoJoinResponse.Content.ApprovalContent(0);
  __chkstk_darwin(v5);
  uint64_t v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  IncomingInvitationJoinRequest.invitationID.getter();
  uint64_t v12 = UUID.uuidString.getter();
  uint64_t v14 = v13;
  (*(void (**)(unsigned char *, uint64_t))(v9 + 8))(v11, v8);
  swift_bridgeObjectRelease();
  *a1 = v12;
  a1[1] = v14;
  uint64_t v19 = a3;
  lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content((unint64_t *)&lazy protocol witness table cache variable for type NearbyProtoJoinResponse.Content.ApprovalContent and conformance NearbyProtoJoinResponse.Content.ApprovalContent, (void (*)(uint64_t))type metadata accessor for NearbyProtoJoinResponse.Content.ApprovalContent);
  static Message.with(_:)();
  uint64_t v15 = (uint64_t)a1 + *(int *)(type metadata accessor for NearbyProtoJoinResponse.Content(0) + 20);
  outlined destroy of Any?(v15, &demangling cache variable for type metadata for NearbyProtoJoinResponse.Content.OneOf_Operation?);
  outlined init with take of NearbyProtoSessionMessage((uint64_t)v7, v15, type metadata accessor for NearbyProtoJoinResponse.Content.ApprovalContent);
  uint64_t v16 = type metadata accessor for NearbyProtoJoinResponse.Content.OneOf_Operation(0);
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 0, 1, v16);
}

uint64_t closure #1 in closure #1 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)(uint64_t *a1)
{
  uint64_t v2 = InvitationJoinResponse.sessionIdentifier.getter();
  if (v3)
  {
    uint64_t v4 = v2;
    uint64_t v5 = v3;
    swift_bridgeObjectRelease();
    *a1 = v4;
    a1[1] = v5;
  }
  uint64_t v6 = InvitationJoinResponse.userInfo.getter();
  if (v7 >> 60 != 15)
  {
    uint64_t v8 = v6;
    unint64_t v9 = v7;
    uint64_t v10 = (char *)a1 + *(int *)(type metadata accessor for NearbyProtoJoinResponse.Content.ApprovalContent(0) + 28);
    outlined consume of Data?(*(void *)v10, *((void *)v10 + 1));
    *(void *)uint64_t v10 = v8;
    *((void *)v10 + 1) = v9;
  }
  uint64_t result = InvitationJoinResponse.memberHandles.getter();
  if (result)
  {
    uint64_t v12 = result;
    uint64_t result = swift_bridgeObjectRelease();
    a1[2] = v12;
  }
  return result;
}

void NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:)(void *a1)
{
  uint64_t v88 = type metadata accessor for NearbyProtoSessionMessage(0);
  __chkstk_darwin(v88);
  uint64_t v4 = (char *)&v78 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for NearbyProtoJoinResponse.Content(0);
  __chkstk_darwin(v5);
  unint64_t v7 = (char *)&v78 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchPredicate();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (void *)((char *)&v78 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v90 = v1;
  uint64_t v12 = *(void **)((char *)v1
                 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue);
  *uint64_t v11 = v12;
  (*(void (**)(void *, void, uint64_t))(v9 + 104))(v11, enum case for DispatchPredicate.onQueue(_:), v8);
  id v13 = v12;
  LOBYTE(v12) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) == 0)
  {
    __break(1u);
LABEL_24:
    swift_once();
    goto LABEL_6;
  }
  uint64_t v14 = dispatch thunk of IncomingInvitationJoinRequest.hostInfo.getter();
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    uint64_t v86 = v4;
    uint64_t v87 = NearbyInvitationJoinRequestMetadata.pseudonym.getter();
    uint64_t v17 = v16;
    __chkstk_darwin(v87);
    *((void *)&v78 - 2) = a1;
    lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoJoinResponse.Content and conformance NearbyProtoJoinResponse.Content, (void (*)(uint64_t))type metadata accessor for NearbyProtoJoinResponse.Content);
    id v18 = v89;
    static Message.with(_:)();
    uint64_t v19 = *(void **)((char *)v90
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_joinRequestsController);
    uint64_t v20 = Message.serializedData(partial:)();
    if (v18)
    {
      outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v7, type metadata accessor for NearbyProtoJoinResponse.Content);
      swift_bridgeObjectRelease();

      return;
    }
    uint64_t v30 = v20;
    unint64_t v31 = v21;
    long long v85 = v7;
    id v89 = v15;
    id v84 = a1;
    uint64_t v32 = IncomingInvitationJoinRequest.remotePublicKey.getter();
    unint64_t v34 = v33;
    uint64_t v35 = v87;
    uint64_t v36 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))((swift_isaMask & *v19) + 0xB8))(v30, v31, v32, v33, v87, v17);
    unint64_t v39 = v38;
    uint64_t v83 = v17;
    uint64_t v40 = v36;
    outlined consume of Data._Representation(v32, v34);
    uint64_t v41 = outlined consume of Data._Representation(v30, v31);
    __chkstk_darwin(v41);
    *((void *)&v78 - 2) = v40;
    *((void *)&v78 - 1) = v39;
    uint64_t v42 = lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content((unint64_t *)&lazy protocol witness table cache variable for type NearbyProtoSessionMessage and conformance NearbyProtoSessionMessage, (void (*)(uint64_t))type metadata accessor for NearbyProtoSessionMessage);
    unint64_t v43 = v39;
    uint64_t v44 = (uint64_t)v86;
    static Message.with(_:)();
    uint64_t v82 = v42;
    uint64_t v81 = 0;
    uint64_t v79 = v40;
    unint64_t v80 = v43;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, String)>);
    uint64_t inited = swift_initStackObject();
    long long v78 = xmmword_1000D61D0;
    *(_OWORD *)(inited + 16) = xmmword_1000D61D0;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v46;
    uint64_t v47 = v83;
    *(void *)(inited + 48) = v35;
    *(void *)(inited + 56) = v47;
    swift_bridgeObjectRetain();
    specialized Dictionary.init(dictionaryLiteral:)(inited);
    swift_bridgeObjectRelease();
    uint64_t v48 = (uint64_t)v85;
    if (one-time initialization token for host != -1) {
      swift_once();
    }
    uint64_t v49 = type metadata accessor for Logger();
    __swift_project_value_buffer(v49, (uint64_t)static Log.host);
    id v50 = v84;
    id v51 = Logger.logObject.getter();
    os_log_type_t v52 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      uint64_t v54 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v53 = 138412290;
      uint64_t v92 = v50;
      os_log_type_t v55 = v50;
      uint64_t v44 = (uint64_t)v86;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v54 = v50;

      _os_log_impl((void *)&_mh_execute_header, v51, v52, "We are about to send a reject response for %@", v53, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      uint64_t v48 = (uint64_t)v85;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      id v51 = v50;
    }
    id v56 = v89;

    uint64_t v57 = IncomingInvitationJoinRequest.destinationToken.getter();
    if (v58)
    {
      uint64_t v59 = v57;
      uint64_t v60 = v58;
      uint64_t v61 = v81;
      uint64_t v62 = Message.serializedData(partial:)();
      if (!v61)
      {
        uint64_t v64 = v62;
        unint64_t v65 = v63;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
        uint64_t v66 = swift_initStackObject();
        *(_OWORD *)(v66 + 16) = v78;
        *(void *)(v66 + 32) = v59;
        *(void *)(v66 + 40) = v60;
        Swift::Int v67 = specialized Set.init(_nonEmptyArrayLiteral:)(v66);
        swift_setDeallocating();
        swift_arrayDestroy();
        (*(void (**)(uint64_t, unint64_t, Swift::Int, uint64_t, uint64_t, void))((swift_isaMask & *v90)
                                                                                                + 0x120))(v64, v65, v67, v87, v83, 0);
        outlined consume of Data._Representation(v79, v80);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        outlined consume of Data._Representation(v64, v65);
        swift_bridgeObjectRelease();

LABEL_22:
        outlined destroy of NearbyProtoConnectionResponse.Content(v44, type metadata accessor for NearbyProtoSessionMessage);
        outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v85, type metadata accessor for NearbyProtoJoinResponse.Content);
        return;
      }
    }
    else
    {
      uint64_t v68 = IncomingInvitationJoinRequest.remotePseudonym.getter();
      uint64_t v70 = v69;
      uint64_t v71 = v81;
      uint64_t v72 = Message.serializedData(partial:)();
      if (!v71)
      {
        uint64_t v74 = v72;
        unint64_t v75 = v73;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
        uint64_t v76 = swift_initStackObject();
        *(_OWORD *)(v76 + 16) = v78;
        *(void *)(v76 + 32) = v68;
        *(void *)(v76 + 40) = v70;
        Swift::Int v77 = specialized Set.init(_nonEmptyArrayLiteral:)(v76);
        swift_setDeallocating();
        swift_arrayDestroy();
        (*(void (**)(uint64_t, unint64_t, Swift::Int, uint64_t, uint64_t, void))((swift_isaMask & *v90)
                                                                                                + 0x120))(v74, v75, v77, v87, v83, 0);
        outlined consume of Data._Representation(v79, v80);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        outlined consume of Data._Representation(v74, v75);
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
    }
    outlined consume of Data._Representation(v79, v80);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    outlined destroy of NearbyProtoConnectionResponse.Content(v44, type metadata accessor for NearbyProtoSessionMessage);
    outlined destroy of NearbyProtoConnectionResponse.Content(v48, type metadata accessor for NearbyProtoJoinResponse.Content);
    return;
  }
  if (one-time initialization token for host != -1) {
    goto LABEL_24;
  }
LABEL_6:
  uint64_t v22 = type metadata accessor for Logger();
  __swift_project_value_buffer(v22, (uint64_t)static Log.host);
  id v23 = a1;
  uint64_t v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v92 = swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 136315138;
    uint64_t v91 = (uint64_t)v23;
    type metadata accessor for IncomingInvitationJoinRequest();
    id v27 = v23;
    uint64_t v28 = String.init<A>(reflecting:)();
    uint64_t v91 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v28, v29, (uint64_t *)&v92);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Failed to find hostInfo on pendingMember: %s", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  lazy protocol witness table accessor for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors();
  swift_allocError();
  *uint64_t v37 = 0;
  swift_willThrow();
}

uint64_t closure #1 in NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:)(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for NearbyProtoJoinResponse.Content.DeniedContent(0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  IncomingInvitationJoinRequest.invitationID.getter();
  uint64_t v9 = UUID.uuidString.getter();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  *a1 = v9;
  a1[1] = v11;
  UnknownStorage.init()();
  uint64_t v12 = (uint64_t)a1 + *(int *)(type metadata accessor for NearbyProtoJoinResponse.Content(0) + 20);
  outlined destroy of Any?(v12, &demangling cache variable for type metadata for NearbyProtoJoinResponse.Content.OneOf_Operation?);
  outlined init with take of NearbyProtoSessionMessage((uint64_t)v4, v12, type metadata accessor for NearbyProtoJoinResponse.Content.DeniedContent);
  uint64_t v13 = type metadata accessor for NearbyProtoJoinResponse.Content.OneOf_Operation(0);
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 0, 1, v13);
}

uint64_t closure #2 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for NearbyProtoJoinResponse(0);
  __chkstk_darwin(v7);
  uint64_t v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = type metadata accessor for NearbyProtoSessionMessage(0);
  uint64_t v11 = a1 + *(int *)(v10 + 24);
  *(void *)uint64_t v11 = 2;
  *(_WORD *)(v11 + 8) = 1;
  uint64_t v19 = a2;
  uint64_t v20 = a3;
  lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoJoinResponse and conformance NearbyProtoJoinResponse, (void (*)(uint64_t))type metadata accessor for NearbyProtoJoinResponse);
  static Message.with(_:)();
  uint64_t v12 = Message.serializedData(partial:)();
  if (v3) {
    return outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v9, type metadata accessor for NearbyProtoJoinResponse);
  }
  uint64_t v15 = v12;
  uint64_t v16 = v13;
  outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v9, type metadata accessor for NearbyProtoJoinResponse);
  uint64_t v17 = a1 + *(int *)(v10 + 28);
  uint64_t result = outlined consume of Data?(*(void *)v17, *(void *)(v17 + 8));
  *(void *)uint64_t v17 = v15;
  *(void *)(v17 + 8) = v16;
  return result;
}

uint64_t closure #1 in closure #2 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = (uint64_t *)(a1 + *(int *)(type metadata accessor for NearbyProtoJoinResponse(0) + 20));
  uint64_t v6 = *v5;
  unint64_t v7 = v5[1];
  outlined copy of Data._Representation(a2, a3);
  uint64_t result = outlined consume of Data?(v6, v7);
  uint64_t *v5 = a2;
  v5[1] = a3;
  return result;
}

uint64_t NearbyIDSServiceController.sendRequestConnectionWithNearbyHost(fromHandle:nearbyAdvertisement:)(int *a1, uint8_t *a2, unint64_t a3)
{
  uint64_t v68 = a1;
  uint64_t v69 = a2;
  uint64_t v5 = type metadata accessor for NearbyProtoConnectionRequest(0);
  __chkstk_darwin(v5);
  unint64_t v7 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (int *)type metadata accessor for NearbyProtoSessionMessage(0);
  __chkstk_darwin(v8);
  Swift::Int v67 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchPredicate();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (int **)((char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v70 = v3;
  uint64_t v14 = *(Class *)((char *)&v3->isa
                 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue);
  void *v13 = v14;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v13, enum case for DispatchPredicate.onQueue(_:), v10);
  id v15 = v14;
  LOBYTE(v14) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) == 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v16 = NearbyAdvertisement.contactID.getter();
  if (!v17)
  {
    lazy protocol witness table accessor for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors();
    swift_allocError();
    char v27 = 1;
LABEL_10:
    *uint64_t v26 = v27;
    return swift_willThrow();
  }
  uint64_t v18 = v16;
  uint64_t v19 = v17;
  NearbyAdvertisement.handle.getter();
  if (!v20)
  {
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors();
    swift_allocError();
    char v27 = 2;
    goto LABEL_10;
  }
  NSString v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v22 = [v21 IDSFormattedDestinationID];

  if (!v22)
  {
    swift_bridgeObjectRelease();
    lazy protocol witness table accessor for type IDSServiceError and conformance IDSServiceError();
    swift_allocError();
    return swift_willThrow();
  }
  uint64_t v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v65 = v23;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v24 = swift_allocObject();
  *(_OWORD *)(v24 + 16) = xmmword_1000D61E0;
  *(void *)(v24 + 32) = [self descriptorForRequiredKeysForStyle:0];
  uint64_t v72 = (void *)v24;
  specialized Array._endMutation()();
  type metadata accessor for NearbyAdvertisement();
  if (v18 == static NearbyAdvertisement.meContactID.getter() && v19 == v25)
  {
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  char v29 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v29)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    id v30 = NearbyIDSServiceController.contactStore.getter();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CNKeyDescriptor);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    uint64_t v72 = 0;
    uint64_t v32 = (int *)objc_msgSend(v30, "_ios_meContactWithKeysToFetch:error:", isa, &v72);

    unint64_t v33 = v72;
    if (v32) {
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  id v47 = NearbyIDSServiceController.contactStore.getter();
  NSString v48 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for CNKeyDescriptor);
  Class v49 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v72 = 0;
  uint64_t v32 = (int *)[v47 unifiedContactWithIdentifier:v48 keysToFetch:v49 error:&v72];

  unint64_t v33 = v72;
  if (!v32)
  {
LABEL_18:
    id v50 = v33;
    swift_bridgeObjectRelease();
    _convertNSErrorToError(_:)();

    return swift_willThrow();
  }
LABEL_15:
  uint64_t v64 = v7;
  id v34 = v33;
  uint64_t v35 = v67;
  uint64_t v36 = UnknownStorage.init()();
  uint64_t v37 = &v35[v8[5]];
  *(_DWORD *)uint64_t v37 = 0;
  v37[4] = 1;
  unint64_t v38 = &v35[v8[6]];
  *(void *)unint64_t v38 = 0;
  *((_WORD *)v38 + 4) = 256;
  unint64_t v39 = &v35[v8[7]];
  *(_OWORD *)unint64_t v39 = xmmword_1000D61F0;
  *(void *)unint64_t v38 = 3;
  *((_WORD *)v38 + 4) = 1;
  __chkstk_darwin(v36);
  uint64_t v40 = v68;
  *(&v62 - 4) = v32;
  *(&v62 - 3) = v40;
  *(&v62 - 2) = (int *)v69;
  *(&v62 - 1) = (int *)a3;
  lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoConnectionRequest and conformance NearbyProtoConnectionRequest, (void (*)(uint64_t))type metadata accessor for NearbyProtoConnectionRequest);
  uint64_t v62 = v8;
  uint64_t v41 = v32;
  uint64_t v42 = (uint64_t)v64;
  unint64_t v43 = v66;
  static Message.with(_:)();
  uint64_t v44 = Message.serializedData(partial:)();
  if (!v43)
  {
    uint64_t v51 = v44;
    uint64_t v52 = v45;
    uint64_t v66 = v41;
    outlined consume of Data?(*(void *)v39, *((void *)v39 + 1));
    *(void *)unint64_t v39 = v51;
    *((void *)v39 + 1) = v52;
    lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content((unint64_t *)&lazy protocol witness table cache variable for type NearbyProtoSessionMessage and conformance NearbyProtoSessionMessage, (void (*)(uint64_t))type metadata accessor for NearbyProtoSessionMessage);
    uint64_t v8 = (int *)Message.serializedData(partial:)();
    a3 = v53;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000D61D0;
    *(void *)(inited + 32) = v63;
    *(void *)(inited + 40) = v65;
    uint64_t v55 = specialized Set.init<A>(_:)(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    uint64_t v13 = (void *)(*(uint64_t (**)(int *, unint64_t, uint64_t, int *, uint8_t *, uint64_t))((swift_isaMask & (uint64_t)v70->isa) + 0x120))(v8, a3, v55, v68, v69, 1);
    unint64_t v7 = v56;
    swift_bridgeObjectRelease();
    if (one-time initialization token for host == -1)
    {
LABEL_22:
      uint64_t v57 = type metadata accessor for Logger();
      __swift_project_value_buffer(v57, (uint64_t)static Log.host);
      swift_bridgeObjectRetain();
      uint64_t v58 = Logger.logObject.getter();
      os_log_type_t v59 = static os_log_type_t.info.getter();
      uint64_t v70 = v58;
      if (os_log_type_enabled(v58, v59))
      {
        uint64_t v60 = (uint8_t *)swift_slowAlloc();
        uint64_t v72 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v60 = 136315138;
        uint64_t v69 = v60 + 4;
        swift_bridgeObjectRetain();
        uint64_t v71 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)((uint64_t)v13, (unint64_t)v7, (uint64_t *)&v72);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        uint64_t v61 = v70;
        _os_log_impl((void *)&_mh_execute_header, v70, v59, "Sent IDS message with identifier: %s", v60, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        outlined consume of Data._Representation((uint64_t)v8, a3);
      }
      else
      {
        outlined consume of Data._Representation((uint64_t)v8, a3);

        swift_bridgeObjectRelease_n();
      }
      outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v64, type metadata accessor for NearbyProtoConnectionRequest);
      uint64_t v46 = (uint64_t)v67;
      return outlined destroy of NearbyProtoConnectionResponse.Content(v46, type metadata accessor for NearbyProtoSessionMessage);
    }
LABEL_27:
    swift_once();
    goto LABEL_22;
  }

  swift_bridgeObjectRelease();
  outlined destroy of NearbyProtoConnectionResponse.Content(v42, type metadata accessor for NearbyProtoConnectionRequest);
  uint64_t v46 = (uint64_t)v35;
  return outlined destroy of NearbyProtoConnectionResponse.Content(v46, type metadata accessor for NearbyProtoSessionMessage);
}

uint64_t closure #1 in NearbyIDSServiceController.sendRequestConnectionWithNearbyHost(fromHandle:nearbyAdvertisement:)(uint64_t *a1, id a2, uint64_t a3, uint64_t a4)
{
  id v7 = [a2 givenName];
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;

  uint64_t v11 = type metadata accessor for NearbyProtoConnectionRequest(0);
  uint64_t v12 = (uint64_t *)((char *)a1 + *(int *)(v11 + 28));
  swift_bridgeObjectRelease();
  uint64_t *v12 = v8;
  v12[1] = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a3;
  a1[3] = a4;
  uint64_t v13 = NearbyAdvertisement.identifier.getter();
  uint64_t v15 = v14;
  swift_bridgeObjectRelease();
  *a1 = v13;
  a1[1] = v15;
  uint64_t result = NearbyAdvertisement.userInfo.getter();
  if (v17 >> 60 != 15)
  {
    uint64_t v18 = result;
    unint64_t v19 = v17;
    uint64_t v20 = (char *)a1 + *(int *)(v11 + 32);
    uint64_t result = outlined consume of Data?(*(void *)v20, *((void *)v20 + 1));
    *(void *)uint64_t v20 = v18;
    *((void *)v20 + 1) = v19;
  }
  return result;
}

uint64_t NearbyIDSServiceController.sendJoinRequest(for:from:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v116 = a3;
  id v112 = a2;
  uint64_t v120 = a4;
  id v121 = a1;
  uint64_t v5 = type metadata accessor for NearbyProtoSessionMessage(0);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v107 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v107 - v9;
  uint64_t v118 = type metadata accessor for NearbyProtoJoinRequest.Content(0);
  uint64_t v11 = __chkstk_darwin(v118);
  v115 = (uint8_t *)&v107 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v107 - v13;
  uint64_t v15 = type metadata accessor for DispatchPredicate();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char **)((char *)&v107 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v117 = v4;
  unint64_t v19 = *(void **)((char *)v4
                 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue);
  *uint64_t v18 = v19;
  (*(void (**)(void *, void, uint64_t))(v16 + 104))(v18, enum case for DispatchPredicate.onQueue(_:), v15);
  id v20 = v19;
  LOBYTE(v19) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v16 + 8))(v18, v15);
  if (v19)
  {
    v107 = v8;
    if (one-time initialization token for host == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v21 = type metadata accessor for Logger();
  id v22 = (void *)__swift_project_value_buffer(v21, (uint64_t)static Log.host);
  uint64_t v23 = v116;
  swift_bridgeObjectRetain_n();
  id v24 = v121;
  id v121 = v22;
  uint64_t v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.default.getter();
  BOOL v27 = os_log_type_enabled(v25, v26);
  v110 = v10;
  uint64_t v109 = v5;
  v119 = v14;
  if (v27)
  {
    uint64_t v28 = swift_slowAlloc();
    uint64_t v124 = swift_slowAlloc();
    *(_DWORD *)uint64_t v28 = 136315394;
    uint64_t v122 = (uint64_t)v112;
    uint64_t v123 = v23;
    swift_bridgeObjectRetain();
    uint64_t v29 = String.init<A>(reflecting:)();
    uint64_t v122 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v29, v30, &v124);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v28 + 12) = 2080;
    uint64_t v122 = (uint64_t)v24;
    type metadata accessor for InvitationApprovalRequest();
    id v31 = v24;
    uint64_t v32 = String.init<A>(reflecting:)();
    uint64_t v122 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, &v124);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    uint64_t v14 = v119;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Attempting to create and send joinRequest from: %s for request: %s", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v34 = (void *)InvitationApprovalRequest.remoteInvitationData.getter();
  uint64_t v35 = (void *)NearbyInvitationData.hostConnectionInfo.getter();

  uint64_t v108 = NearbyInvitationJoinRequestMetadata.pseudonym.getter();
  uint64_t v113 = v36;

  uint64_t v37 = v120;
  uint64_t v38 = UUID.init()();
  __chkstk_darwin(v38);
  *(&v107 - 2) = (char *)v24;
  *(&v107 - 1) = (char *)v37;
  uint64_t v39 = lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content((unint64_t *)&lazy protocol witness table cache variable for type NearbyProtoJoinRequest.Content and conformance NearbyProtoJoinRequest.Content, (void (*)(uint64_t))type metadata accessor for NearbyProtoJoinRequest.Content);
  uint64_t v40 = v114;
  static Message.with(_:)();
  uint64_t v114 = v40;
  uint64_t v41 = (uint64_t)v14;
  uint64_t v42 = (uint64_t)v115;
  outlined init with copy of NearbyProtoJoinRequest.Content(v41, (uint64_t)v115, type metadata accessor for NearbyProtoJoinRequest.Content);
  unint64_t v43 = Logger.logObject.getter();
  os_log_type_t v44 = static os_log_type_t.info.getter();
  BOOL v45 = os_log_type_enabled(v43, v44);
  v111 = (uint64_t *)v39;
  if (v45)
  {
    uint64_t v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v122 = swift_slowAlloc();
    *(_DWORD *)uint64_t v46 = 136315138;
    uint64_t v47 = Message.debugDescription.getter();
    uint64_t v124 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v47, v48, &v122);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    outlined destroy of NearbyProtoConnectionResponse.Content(v42, type metadata accessor for NearbyProtoJoinRequest.Content);
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Request content: %s", v46, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    outlined destroy of NearbyProtoConnectionResponse.Content(v42, type metadata accessor for NearbyProtoJoinRequest.Content);
  }

  id v49 = v24;
  id v50 = Logger.logObject.getter();
  os_log_type_t v51 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v50, v51))
  {
    uint64_t v52 = (uint8_t *)swift_slowAlloc();
    uint64_t v124 = swift_slowAlloc();
    *(_DWORD *)uint64_t v52 = 136315138;
    v115 = v52 + 4;
    unint64_t v53 = (void *)InvitationApprovalRequest.remoteInvitationData.getter();
    uint64_t v54 = (void *)NearbyInvitationData.hostConnectionInfo.getter();

    uint64_t v55 = NearbyInvitationJoinRequestMetadata.publicKey.getter();
    uint64_t v57 = v56;

    uint64_t v122 = v55;
    uint64_t v123 = v57;
    uint64_t v58 = String.init<A>(reflecting:)();
    uint64_t v122 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v58, v59, &v124);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v50, v51, "Creating RequesterCredentials with publicKey: %s", v52, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v60 = (uint64_t)v119;
  uint64_t v61 = v117;
  uint64_t v62 = (void *)InvitationApprovalRequest.remoteInvitationData.getter();
  uint64_t v63 = (void *)NearbyInvitationData.hostConnectionInfo.getter();

  NearbyInvitationJoinRequestMetadata.publicKey.getter();
  type metadata accessor for RequesterCredentials();
  swift_allocObject();
  uint64_t v64 = v114;
  uint64_t v65 = RequesterCredentials.init(ownerPublicKey:)();
  if (v64)
  {
    outlined destroy of NearbyProtoConnectionResponse.Content(v60, type metadata accessor for NearbyProtoJoinRequest.Content);
    swift_bridgeObjectRelease();
    uint64_t v71 = type metadata accessor for UUID();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v71 - 8) + 8))(v120, v71);
  }
  else
  {
    uint64_t v66 = v65;
    uint64_t v67 = Message.serializedData(partial:)();
    unint64_t v69 = v68;
    uint64_t v70 = (*(uint64_t (**)(void))(*(void *)v66 + 144))();
    uint64_t v74 = v73;
    uint64_t v114 = v70;
    v115 = (uint8_t *)v75;
    uint64_t v118 = v76;
    outlined consume of Data._Representation(v67, v69);
    Swift::Int v77 = (void *)InvitationApprovalRequest.remoteInvitationData.getter();
    long long v78 = (void *)NearbyInvitationData.hostConnectionInfo.getter();

    uint64_t v79 = NearbyInvitationJoinRequestMetadata.pseudonym.getter();
    uint64_t v81 = v80;

    uint64_t v82 = *(uint64_t (**)(uint64_t *))((swift_isaMask & *v61) + 0xC8);
    swift_retain();
    uint64_t v83 = (uint64_t (*)(uint64_t *, void))v82(&v122);
    long long v85 = v84;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v124 = *v85;
    *long long v85 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v66, v79, v81, isUniquelyReferenced_nonNull_native);
    *long long v85 = v124;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v87 = v83(&v122, 0);
    v111 = (uint64_t *)&v107;
    __chkstk_darwin(v87);
    uint64_t v88 = v114;
    *(&v107 - 4) = (char *)v115;
    *(&v107 - 3) = (char *)v118;
    *(&v107 - 2) = (char *)v88;
    *(&v107 - 1) = (char *)v74;
    lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content((unint64_t *)&lazy protocol witness table cache variable for type NearbyProtoSessionMessage and conformance NearbyProtoSessionMessage, (void (*)(uint64_t))type metadata accessor for NearbyProtoSessionMessage);
    static Message.with(_:)();
    uint64_t v89 = Message.serializedData(partial:)();
    unint64_t v91 = v90;
    v111 = (uint64_t *)v74;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000D61D0;
    *(void *)(inited + 32) = v108;
    *(void *)(inited + 40) = v113;
    Swift::Int v93 = specialized Set.init(_nonEmptyArrayLiteral:)(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    uint64_t v94 = (*(uint64_t (**)(uint64_t, unint64_t, Swift::Int, id, uint64_t, uint64_t))((swift_isaMask & *v117)
                                                                                                 + 0x120))(v89, v91, v93, v112, v116, 1);
    unint64_t v96 = v95;
    uint64_t v120 = v94;
    swift_bridgeObjectRelease();
    outlined consume of Data._Representation(v89, v91);
    uint64_t v97 = (uint64_t)v110;
    uint64_t v98 = (uint64_t)v107;
    outlined init with copy of NearbyProtoJoinRequest.Content((uint64_t)v110, (uint64_t)v107, type metadata accessor for NearbyProtoSessionMessage);
    swift_bridgeObjectRetain();
    v99 = Logger.logObject.getter();
    os_log_type_t v100 = static os_log_type_t.default.getter();
    int v101 = v100;
    if (os_log_type_enabled(v99, v100))
    {
      uint64_t v102 = swift_slowAlloc();
      LODWORD(v117) = v101;
      uint64_t v103 = v102;
      id v121 = (id)swift_slowAlloc();
      uint64_t v122 = (uint64_t)v121;
      *(_DWORD *)uint64_t v103 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v124 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v120, v96, &v122);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v103 + 12) = 2080;
      uint64_t v104 = Message.debugDescription.getter();
      uint64_t v124 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v104, v105, &v122);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      outlined destroy of NearbyProtoConnectionResponse.Content(v98, type metadata accessor for NearbyProtoSessionMessage);
      _os_log_impl((void *)&_mh_execute_header, v99, (os_log_type_t)v117, "Sent JoinRequest (%s), message: %s", (uint8_t *)v103, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      outlined consume of Data._Representation((uint64_t)v115, v118);
      outlined consume of Data._Representation(v114, (unint64_t)v111);
      swift_release();

      uint64_t v106 = (uint64_t)v110;
    }
    else
    {
      outlined consume of Data._Representation((uint64_t)v115, v118);
      outlined consume of Data._Representation(v114, (unint64_t)v111);

      outlined destroy of NearbyProtoConnectionResponse.Content(v98, type metadata accessor for NearbyProtoSessionMessage);
      swift_release();
      swift_bridgeObjectRelease_n();
      uint64_t v106 = v97;
    }
    outlined destroy of NearbyProtoConnectionResponse.Content(v106, type metadata accessor for NearbyProtoSessionMessage);
    return outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v119, type metadata accessor for NearbyProtoJoinRequest.Content);
  }
}

void closure #1 in NearbyIDSServiceController.sendJoinRequest(for:from:)(uint64_t *a1)
{
  uint64_t v2 = InvitationApprovalRequest.displayName.getter();
  uint64_t v4 = v3;
  uint64_t v5 = (int *)type metadata accessor for NearbyProtoJoinRequest.Content(0);
  uint64_t v6 = (uint64_t *)((char *)a1 + v5[6]);
  swift_bridgeObjectRelease();
  uint64_t *v6 = v2;
  v6[1] = v4;
  uint64_t v7 = UUID.uuidString.getter();
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  *a1 = v7;
  a1[1] = v9;
  *((unsigned char *)a1 + v5[8]) = 1;
  uint64_t v10 = InvitationApprovalRequest.userInfo.getter();
  if (v11 >> 60 == 15)
  {
    uint64_t v12 = (void *)InvitationApprovalRequest.remoteInvitationData.getter();
    uint64_t v13 = NearbyInvitationData.userInfo.getter();
    unint64_t v15 = v14;

    if (v15 >> 60 != 15)
    {
      uint64_t v16 = (char *)a1 + v5[7];
      outlined consume of Data?(*(void *)v16, *((void *)v16 + 1));
      *(void *)uint64_t v16 = v13;
      *((void *)v16 + 1) = v15;
    }
  }
  else
  {
    uint64_t v17 = v10;
    unint64_t v18 = v11;
    unint64_t v19 = (char *)a1 + v5[7];
    outlined consume of Data?(*(void *)v19, *((void *)v19 + 1));
    *(void *)unint64_t v19 = v17;
    *((void *)v19 + 1) = v18;
  }
}

uint64_t closure #2 in NearbyIDSServiceController.sendJoinRequest(for:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = type metadata accessor for NearbyProtoJoinRequest(0);
  __chkstk_darwin(v11);
  uint64_t v13 = &v22[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = type metadata accessor for NearbyProtoSessionMessage(0);
  uint64_t v15 = a1 + *(int *)(v14 + 24);
  *(void *)uint64_t v15 = 1;
  *(_WORD *)(v15 + 8) = 1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v25 = a4;
  uint64_t v26 = a5;
  lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoJoinRequest and conformance NearbyProtoJoinRequest, (void (*)(uint64_t))type metadata accessor for NearbyProtoJoinRequest);
  static Message.with(_:)();
  uint64_t v16 = Message.serializedData(partial:)();
  if (v5) {
    return outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v13, type metadata accessor for NearbyProtoJoinRequest);
  }
  uint64_t v19 = v16;
  uint64_t v20 = v17;
  outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v13, type metadata accessor for NearbyProtoJoinRequest);
  uint64_t v21 = a1 + *(int *)(v14 + 28);
  uint64_t result = outlined consume of Data?(*(void *)v21, *(void *)(v21 + 8));
  *(void *)uint64_t v21 = v19;
  *(void *)(v21 + 8) = v20;
  return result;
}

uint64_t closure #1 in closure #2 in NearbyIDSServiceController.sendJoinRequest(for:from:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10 = type metadata accessor for NearbyProtoJoinRequest(0);
  uint64_t v11 = (uint64_t *)(a1 + *(int *)(v10 + 20));
  uint64_t v12 = *v11;
  unint64_t v13 = v11[1];
  outlined copy of Data._Representation(a2, a3);
  outlined consume of Data?(v12, v13);
  *uint64_t v11 = a2;
  v11[1] = a3;
  uint64_t v14 = (uint64_t *)(a1 + *(int *)(v10 + 24));
  uint64_t v15 = *v14;
  unint64_t v16 = v14[1];
  outlined copy of Data._Representation(a4, a5);
  uint64_t result = outlined consume of Data?(v15, v16);
  *uint64_t v14 = a4;
  v14[1] = a5;
  return result;
}

void NearbyIDSServiceController.send(data:toDestinations:from:shouldDonateToFirweall:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v7 = v6;
  int v42 = a6;
  uint64_t v43 = a2;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v11 - 8);
  unint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000D61D0;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v15;
  uint64_t v16 = type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
  v17.super.super.Class isa = NSNumber.init(BOOLeanLiteral:)(1).super.super.isa;
  *(void *)(inited + 72) = v16;
  *(NSNumber *)(inited + 48) = v17;
  unint64_t v18 = specialized Dictionary.init(dictionaryLiteral:)(inited);
  uint64_t v41 = v13;
  if (a5)
  {
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v21 = v20;
    NSString v22 = String._bridgeToObjectiveC()();
    uint64_t v23 = IDSCopyBestGuessIDForID();

    if (!v23)
    {
      __break(1u);
      return;
    }
    uint64_t v48 = type metadata accessor for OS_dispatch_queue(0, &lazy cache variable for type metadata for NSString);
    *(void *)&long long v47 = v23;
    outlined init with take of Any(&v47, v46);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v45 = v18;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v46, v19, v21, isUniquelyReferenced_nonNull_native);
    unint64_t v18 = v45;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v25 = *(void *)&v7[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_service
                     + 24];
  uint64_t v26 = *(void *)&v7[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_service
                     + 32];
  __swift_project_boxed_opaque_existential_1(&v7[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_service], v25);
  uint64_t v27 = specialized _setUpCast<A, B>(_:)(a3);
  uint64_t v28 = a3;
  uint64_t v29 = v7;
  uint64_t v30 = specialized _dictionaryUpCast<A, B, C, D>(_:)(v18);
  swift_bridgeObjectRelease();
  *(void *)&long long v47 = 0;
  uint64_t v31 = v44;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, long long *, uint64_t, uint64_t))(v26 + 40))(a1, v43, v27, 300, v30, &v47, v25, v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v31)
  {
    id v32 = (id)v47;
    swift_willThrow();
  }
  else
  {
    uint64_t v33 = v28;
    id v34 = v29;
    id v35 = (id)v47;
    if (v42)
    {
      uint64_t v36 = type metadata accessor for TaskPriority();
      uint64_t v37 = (uint64_t)v41;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v36 - 8) + 56))(v41, 1, 1, v36);
      uint64_t v38 = (void *)swift_allocObject();
      v38[2] = 0;
      v38[3] = 0;
      v38[4] = v34;
      v38[5] = v33;
      id v39 = v34;
      swift_bridgeObjectRetain();
      _sScTss5Error_pRs_rlE8priority9operationScTyxsAA_pGScPSg_xyYaKYAcntcfCyt_Tgm5(v37, (uint64_t)&async function pointer to partial apply for closure #1 in NearbyIDSServiceController.send(data:toDestinations:from:shouldDonateToFirweall:), (uint64_t)v38);
      swift_release();
    }
    if (v35)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    else
    {
      lazy protocol witness table accessor for type IDSServiceError and conformance IDSServiceError();
      swift_allocError();
      swift_willThrow();
    }
  }
}

uint64_t closure #1 in NearbyIDSServiceController.send(data:toDestinations:from:shouldDonateToFirweall:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 128) = a4;
  *(void *)(v5 + 136) = a5;
  return _swift_task_switch(closure #1 in NearbyIDSServiceController.send(data:toDestinations:from:shouldDonateToFirweall:), 0, 0);
}

uint64_t closure #1 in NearbyIDSServiceController.send(data:toDestinations:from:shouldDonateToFirweall:)()
{
  uint64_t v19 = v0;
  (*(void (**)(void))((swift_isaMask & **(void **)(v0 + 128)) + 0xA0))();
  if (*(void *)(v0 + 80))
  {
    uint64_t v1 = *(void *)(v0 + 136);
    outlined init with take of PseudonymProtocol((long long *)(v0 + 56), v0 + 16);
    uint64_t v2 = *(void *)(v0 + 40);
    uint64_t v3 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), v2);
    specialized Sequence.compactMap<A>(_:)(v1);
    uint64_t v5 = v4;
    *(void *)(v0 + 144) = v4;
    NSNumber v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 + 8) + **(int **)(v3 + 8));
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v6;
    void *v6 = v0;
    v6[1] = closure #1 in NearbyIDSServiceController.send(data:toDestinations:from:shouldDonateToFirweall:);
    return v17(v5, v2, v3);
  }
  else
  {
    outlined destroy of Any?(v0 + 56, &demangling cache variable for type metadata for FirewallProvider?);
    if (one-time initialization token for firewall != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    __swift_project_value_buffer(v8, (uint64_t)static Log.firewall);
    swift_bridgeObjectRetain_n();
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v12 = *(void *)(v0 + 136);
    if (v11)
    {
      unint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)unint64_t v13 = 136315138;
      *(void *)(v0 + 96) = v12;
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Set<String>);
      uint64_t v14 = String.init<A>(reflecting:)();
      *(void *)(v0 + 104) = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Message sent without firewall being ready to destinations: %s", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
    return v16();
  }
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();
  uint64_t v4;

  *(void *)(*(void *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = closure #1 in NearbyIDSServiceController.send(data:toDestinations:from:shouldDonateToFirweall:);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = closure #1 in NearbyIDSServiceController.send(data:toDestinations:from:shouldDonateToFirweall:);
  }
  return _swift_task_switch(v2, 0, 0);
}

{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  BOOL v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t (*v9)(void);
  uint64_t v11;
  void *v12;
  uint64_t v13;

  uint64_t v12 = v0;
  if (one-time initialization token for firewall != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Log.firewall);
  swift_bridgeObjectRetain_n();
  uint64_t v2 = Logger.logObject.getter();
  uint64_t v3 = static os_log_type_t.default.getter();
  uint64_t v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = v0[17];
  if (v4)
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    BOOL v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    v0[14] = v5;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Set<String>);
    uint64_t v7 = String.init<A>(reflecting:)();
    v0[15] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v8, &v11);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Donated entries: %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)(v0 + 2));
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v3;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 16);
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void NearbyIDSServiceController.init()()
{
}

id NearbyIDSServiceController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NearbyIDSServiceController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void NearbyIDSServiceController.service(_:account:incomingData:fromID:context:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, NSObject *a5, uint64_t a6, void *a7)
{
  if (a1)
  {
    id v13 = a1;
    specialized NearbyIDSServiceController.handleIncomingMessage(_:account:incomingData:fromIDWithToken:context:)(a3, a4, a5, a6, a7, v7);
  }
  else
  {
    __break(1u);
  }
}

void NearbyIDSServiceController.handleIncomingMessage(_:account:incomingData:fromIDWithToken:context:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, NSObject *a5, uint64_t a6, void *a7)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  specialized NearbyIDSServiceController.handleIncomingMessage(_:account:incomingData:fromIDWithToken:context:)(a3, a4, a5, a6, a7, v7);
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

{
  char **v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

{
  char **v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;

  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    os_log_type_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    os_log_type_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  id v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt>);
    os_log_type_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    os_log_type_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  id v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  size_t v14;
  uint64_t result;

  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<BluetoothScannerDiscoveryEngineDevice>);
    os_log_type_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 88);
  }
  else
  {
    os_log_type_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  uint64_t v14 = 88 * v8;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<FilteredBluetoothScanner<NearbyRangingFilter>.FilteredDevice>);
    os_log_type_t v10 = (void *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    void v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    os_log_type_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 24 * v8) {
      memmove(v10 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 24 * v8 || v12 >= v13 + 24 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FilteredBluetoothScanner<NearbyRangingFilter>.FilteredDevice);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NearbyGroup_Member>);
  os_log_type_t v10 = *(void *)(type metadata accessor for NearbyGroup_Member(0) - 8);
  size_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  uint64_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for NearbyGroup_Member(0) - 8);
  NSNumber v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  NSString v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id specialized NearbyIDSServiceController.init(queue:service:delegate:joinRequestsController:)(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, char *a6, uint64_t a7, uint64_t a8)
{
  v31[1] = a3;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (char *)v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35[3] = a7;
  v35[4] = a8;
  __swift_allocate_boxed_opaque_existential_1(v35);
  uint64_t v32 = a7;
  (*(void (**)(void))(*(void *)(a7 - 8) + 32))();
  NSNumber v17 = &a6[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_delegate];
  *(void *)&a6[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v18 = &a6[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_firewall];
  *(_OWORD *)uint64_t v18 = 0u;
  *((_OWORD *)v18 + 1) = 0u;
  *((void *)v18 + 4) = 0;
  *(void *)&a6[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_requesterCredentialsByOwnerPseudonym] = &_swiftEmptyDictionarySingleton;
  *(void *)&a6[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController____lazy_storage___contactStore] = 0;
  swift_beginAccess();
  *((void *)v17 + 1) = a4;
  swift_unknownObjectWeakAssign();
  outlined init with copy of PseudonymProtocol((uint64_t)v35, (uint64_t)&a6[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_service]);
  *(void *)&a6[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue] = a1;
  *(void *)&a6[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_joinRequestsController] = a5;
  uint64_t v19 = (objc_class *)type metadata accessor for NearbyIDSServiceController();
  v34.receiver = a6;
  v34.super_class = v19;
  id v20 = a1;
  v31[0] = a5;
  id v21 = objc_msgSendSuper2(&v34, "init");
  uint64_t v22 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v16, 1, 1, v22);
  outlined init with copy of PseudonymProtocol((uint64_t)v35, (uint64_t)v33);
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = v21;
  outlined init with take of PseudonymProtocol(v33, (uint64_t)(v23 + 5));
  id v24 = v21;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v16, (uint64_t)&async function pointer to partial apply for closure #1 in NearbyIDSServiceController.init(queue:service:delegate:joinRequestsController:), (uint64_t)v23);
  swift_release();
  id v25 = [objc_allocWithZone((Class)IDSServiceDelegateProperties) init];
  [v25 setWantsCrossAccountMessaging:1];
  uint64_t v26 = *(void (**)(id, id, id, uint64_t, uint64_t))(a8 + 32);
  id v27 = v20;
  id v28 = v24;
  id v29 = v25;
  v26(v24, v25, v20, v32, a8);

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v35);
  return v28;
}

int64_t specialized _NativeSet.index(after:)(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void specialized Set.subscript.getter(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      __CocoaSet.element(at:)();
      type metadata accessor for NearbyGroupMember();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  __CocoaSet.Index.element.getter();
  type metadata accessor for NearbyGroupMember();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  unint64_t v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v7 & ~v8;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v9 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v10 = static NSObject.== infix(_:_:)();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v6 = (v6 + 1) & v11;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_23;
      }
      id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v13 = static NSObject.== infix(_:_:)();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  uint64_t v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);
  id v15 = v14;
}

uint64_t specialized _NativeSet.startIndex.getter(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1 << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t outlined assign with take of FirewallProvider?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FirewallProvider?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

Swift::Int specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<String>);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      unsigned int v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        uint64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      id v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *id v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t partial apply for closure #1 in NearbyIDSServiceController.approveConnectionRequest(id:localInvitation:destinationHandle:)(void *a1)
{
  return closure #1 in NearbyIDSServiceController.approveConnectionRequest(id:localInvitation:destinationHandle:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

unint64_t lazy protocol witness table accessor for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors()
{
  unint64_t result = lazy protocol witness table cache variable for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors;
  if (!lazy protocol witness table cache variable for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors;
  if (!lazy protocol witness table cache variable for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors);
  }
  return result;
}

uint64_t partial apply for closure #1 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)(uint64_t *a1)
{
  return closure #1 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t partial apply for closure #2 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)(uint64_t a1)
{
  return closure #2 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t partial apply for closure #1 in NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:)(uint64_t *a1)
{
  return closure #1 in NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:)(a1);
}

uint64_t partial apply for closure #2 in NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:)(uint64_t a1)
{
  return closure #2 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

unint64_t lazy protocol witness table accessor for type IDSServiceError and conformance IDSServiceError()
{
  unint64_t result = lazy protocol witness table cache variable for type IDSServiceError and conformance IDSServiceError;
  if (!lazy protocol witness table cache variable for type IDSServiceError and conformance IDSServiceError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IDSServiceError and conformance IDSServiceError);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type IDSServiceError and conformance IDSServiceError;
  if (!lazy protocol witness table cache variable for type IDSServiceError and conformance IDSServiceError)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type IDSServiceError and conformance IDSServiceError);
  }
  return result;
}

uint64_t partial apply for closure #1 in NearbyIDSServiceController.sendRequestConnectionWithNearbyHost(fromHandle:nearbyAdvertisement:)(uint64_t *a1)
{
  return closure #1 in NearbyIDSServiceController.sendRequestConnectionWithNearbyHost(fromHandle:nearbyAdvertisement:)(a1, *(id *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

void partial apply for closure #1 in NearbyIDSServiceController.sendJoinRequest(for:from:)(uint64_t *a1)
{
}

uint64_t partial apply for closure #2 in NearbyIDSServiceController.sendJoinRequest(for:from:)(uint64_t a1)
{
  return closure #2 in NearbyIDSServiceController.sendJoinRequest(for:from:)(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1000CDBB8()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t partial apply for closure #1 in NearbyIDSServiceController.send(data:toDestinations:from:shouldDonateToFirweall:)()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = partial apply for closure #1 in NearbyInvitationAdvertiser.stopAdvertising();
  *(_OWORD *)(v2 + 128) = v3;
  return _swift_task_switch(closure #1 in NearbyIDSServiceController.send(data:toDestinations:from:shouldDonateToFirweall:), 0, 0);
}

uint64_t type metadata accessor for NearbyIDSServiceController()
{
  return self;
}

void specialized NearbyIDSServiceController.handleIncomingMessage(_:account:incomingData:fromIDWithToken:context:)(uint64_t a1, uint64_t a2, NSObject *a3, uint64_t a4, void *a5, void *a6)
{
  uint64_t v261 = a4;
  id v262 = a5;
  os_log_t v260 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for NearbyProtoJoinResponse.Content?);
  __chkstk_darwin(v9 - 8);
  v228 = (char *)&v220 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v227 = type metadata accessor for NearbyProtoJoinResponse.Content(0);
  uint64_t v226 = *(void *)(v227 - 8);
  __chkstk_darwin(v227);
  uint64_t v224 = (uint64_t)&v220 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v247 = type metadata accessor for NearbyProtoJoinResponse(0);
  __chkstk_darwin(v247);
  uint64_t v250 = (uint64_t)&v220 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for NearbyProtoJoinRequest.Content(0);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  v234 = (char *)&v220 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  BOOL v17 = (char *)&v220 - v16;
  uint64_t v18 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v18 - 8);
  v230 = (char *)&v220 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v248 = type metadata accessor for NearbyProtoJoinRequest(0);
  uint64_t v20 = __chkstk_darwin(v248);
  uint64_t v235 = (uint64_t)&v220 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v249 = (char *)&v220 - v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoConnectionResponse.Content?);
  __chkstk_darwin(v23 - 8);
  v246 = (char *)&v220 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v245 = type metadata accessor for NearbyProtoConnectionResponse.Content(0);
  uint64_t v239 = *(void *)(v245 - 8);
  __chkstk_darwin(v245);
  uint64_t v232 = (uint64_t)&v220 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoConnectionRequest?);
  __chkstk_darwin(v26 - 8);
  v244 = (char *)&v220 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v243 = type metadata accessor for NearbyProtoConnectionRequest(0);
  uint64_t v238 = *(void *)(v243 - 8);
  uint64_t v28 = __chkstk_darwin(v243);
  uint64_t v233 = (uint64_t)&v220 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __chkstk_darwin(v28);
  v231 = (uint64_t *)((char *)&v220 - v31);
  __chkstk_darwin(v30);
  uint64_t v236 = (uint64_t)&v220 - v32;
  uint64_t v33 = type metadata accessor for BinaryDecodingOptions();
  uint64_t v34 = __chkstk_darwin(v33 - 8);
  v225 = (char *)&v220 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __chkstk_darwin(v34);
  uint64_t v38 = (char *)&v220 - v37;
  uint64_t v39 = __chkstk_darwin(v36);
  v242 = (char *)&v220 - v40;
  uint64_t v41 = __chkstk_darwin(v39);
  v241 = (char *)&v220 - v42;
  uint64_t v43 = __chkstk_darwin(v41);
  v240 = (char *)&v220 - v44;
  __chkstk_darwin(v43);
  v253 = (char *)&v220 - v45;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoSessionMessage?);
  __chkstk_darwin(v46 - 8);
  v255 = (char *)&v220 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v256 = type metadata accessor for NearbyProtoSessionMessage(0);
  uint64_t v254 = *(void *)(v256 - 8);
  uint64_t v48 = __chkstk_darwin(v256);
  uint64_t v252 = (uint64_t)&v220 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __chkstk_darwin(v48);
  uint64_t v251 = (uint64_t)&v220 - v51;
  __chkstk_darwin(v50);
  unint64_t v53 = (char *)&v220 - v52;
  uint64_t v54 = type metadata accessor for DispatchPredicate();
  uint64_t v55 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v57 = (uint64_t *)((char *)&v220 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v58 = *(void **)((char *)a6
                 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue);
  *uint64_t v57 = v58;
  (*(void (**)(void *, void, uint64_t))(v55 + 104))(v57, enum case for DispatchPredicate.onQueue(_:), v54);
  id v59 = v58;
  LOBYTE(v58) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v55 + 8))(v57, v54);
  if (v58)
  {
    v229 = v38;
    uint64_t v38 = (char *)a2;
    a2 = a1;
    v223 = v17;
    if (one-time initialization token for host == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v60 = type metadata accessor for Logger();
  uint64_t v61 = __swift_project_value_buffer(v60, (uint64_t)static Log.host);
  id v62 = v262;
  uint64_t v63 = v261;
  swift_bridgeObjectRetain_n();
  id v64 = v62;
  uint64_t v65 = (char *)v61;
  uint64_t v66 = Logger.logObject.getter();
  os_log_type_t v67 = static os_log_type_t.default.getter();
  BOOL v68 = os_log_type_enabled(v66, v67);
  id v259 = v64;
  if (v68)
  {
    v237 = a6;
    v257 = v53;
    uint64_t v258 = a2;
    v222 = v38;
    uint64_t v69 = swift_slowAlloc();
    uint64_t v70 = (void *)swift_slowAlloc();
    uint64_t v266 = swift_slowAlloc();
    *(_DWORD *)uint64_t v69 = 136315394;
    if (v63)
    {
      *(void *)&long long v263 = v260;
      *((void *)&v263 + 1) = v63;
      swift_bridgeObjectRetain();
      uint64_t v71 = String.init<A>(reflecting:)();
      unint64_t v73 = v72;
    }
    else
    {
      uint64_t v71 = 7104878;
      unint64_t v73 = 0xE300000000000000;
    }
    *(void *)&long long v263 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v71, v73, &v266);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v69 + 12) = 2112;
    if (v262)
    {
      id v77 = v259;
      *(void *)&long long v263 = v259;
      id v78 = v259;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
    }
    else
    {
      *(void *)&long long v263 = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      id v77 = v259;
    }
    *uint64_t v70 = v262;

    _os_log_impl((void *)&_mh_execute_header, v66, v67, "Handling incoming data from: %s context: %@", (uint8_t *)v69, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    unint64_t v75 = (unint64_t)v222;
    unint64_t v53 = v257;
    a6 = v237;
    uint64_t v74 = v258;
    if (!v261) {
      goto LABEL_13;
    }
LABEL_7:
    NSString v76 = String._bridgeToObjectiveC()();
    goto LABEL_14;
  }

  swift_bridgeObjectRelease_n();
  uint64_t v74 = a2;
  unint64_t v75 = (unint64_t)v38;
  if (v63) {
    goto LABEL_7;
  }
LABEL_13:
  NSString v76 = 0;
LABEL_14:
  uint64_t v79 = (void *)IDSCopyAddressDestinationForDestination();

  uint64_t v80 = (void *)IDSCopyRawAddressForDestination();
  if (!v80) {
    return;
  }
  uint64_t v81 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v83 = v82;

  if (String.count.getter() < 1 || v75 >> 60 == 15)
  {
    swift_bridgeObjectRelease();
    return;
  }
  switch(v75 >> 62)
  {
    case 1uLL:
      if (!__OFSUB__(HIDWORD(v74), v74))
      {
        uint64_t v84 = HIDWORD(v74) - (int)v74;
        goto LABEL_25;
      }
      __break(1u);
      goto LABEL_98;
    case 2uLL:
      uint64_t v86 = *(void *)(v74 + 16);
      uint64_t v85 = *(void *)(v74 + 24);
      uint64_t v84 = v85 - v86;
      if (__OFSUB__(v85, v86))
      {
LABEL_98:
        __break(1u);

        swift_release();
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
        uint64_t v200 = v258;
        unint64_t v201 = (unint64_t)v222;
LABEL_99:
        outlined consume of Data?(v200, v201);
LABEL_100:
        outlined destroy of NearbyProtoConnectionResponse.Content(v250, type metadata accessor for NearbyProtoJoinResponse);
        outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v257, type metadata accessor for NearbyProtoSessionMessage);
        return;
      }
LABEL_25:
      outlined copy of Data._Representation(v74, v75);
      if (v84 < 1)
      {
LABEL_21:
        swift_bridgeObjectRelease();
        outlined consume of Data?(v74, v75);
        return;
      }
LABEL_26:
      if (!v262)
      {
        __break(1u);
LABEL_106:
        __break(1u);
        JUMPOUT(0x1000D06F8);
      }
      id v87 = [v259 toID];
      uint64_t v88 = (void *)IDSCopyAddressDestinationForDestination();

      uint64_t v89 = (void *)IDSCopyRawAddressForDestination();
      if (!v89) {
        goto LABEL_33;
      }
      uint64_t v90 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v92 = v91;

      uint64_t v93 = HIBYTE(v92) & 0xF;
      if ((v92 & 0x2000000000000000) == 0) {
        uint64_t v93 = v90 & 0xFFFFFFFFFFFFLL;
      }
      if (!v93)
      {
        swift_bridgeObjectRelease();
LABEL_33:
        swift_bridgeObjectRelease();
        id v97 = v259;
        uint64_t v98 = Logger.logObject.getter();
        os_log_type_t v99 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v98, v99))
        {
          uint64_t v258 = v74;
          os_log_type_t v100 = (uint8_t *)swift_slowAlloc();
          *(void *)&long long v263 = swift_slowAlloc();
          *(_DWORD *)os_log_type_t v100 = 136315138;
          uint64_t v266 = (uint64_t)v97;
          type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for IDSMessageContext);
          id v101 = v97;
          uint64_t v102 = String.init<A>(reflecting:)();
          uint64_t v266 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v102, v103, (uint64_t *)&v263);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v98, v99, "Failed to find toID for message: %s", v100, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          outlined consume of Data?(v258, v75);
        }
        else
        {
          outlined consume of Data?(v74, v75);
        }
        return;
      }
      v257 = v53;
      uint64_t v221 = v90;
      v222 = (char *)v92;
      uint64_t v265 = 0;
      long long v263 = 0u;
      long long v264 = 0u;
      outlined copy of Data._Representation(v74, v75);
      BinaryDecodingOptions.init()();
      uint64_t v94 = lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content((unint64_t *)&lazy protocol witness table cache variable for type NearbyProtoSessionMessage and conformance NearbyProtoSessionMessage, (void (*)(uint64_t))type metadata accessor for NearbyProtoSessionMessage);
      uint64_t v95 = (uint64_t)v255;
      uint64_t v96 = v256;
      Message.init(serializedData:extensions:partial:options:)();
      v253 = (char *)v94;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v254 + 56))(v95, 0, 1, v96);
      uint64_t v104 = (uint64_t)v257;
      outlined init with take of NearbyProtoSessionMessage(v95, (uint64_t)v257, type metadata accessor for NearbyProtoSessionMessage);
      uint64_t v105 = v104 + *(int *)(v96 + 24);
      if ((*(unsigned char *)(v105 + 9) & 1) != 0 || (*(unsigned char *)(v105 + 8) & 1) == 0)
      {
LABEL_39:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v106 = v251;
        outlined init with copy of NearbyProtoJoinRequest.Content(v104, v251, type metadata accessor for NearbyProtoSessionMessage);
        uint64_t v107 = v252;
        outlined init with copy of NearbyProtoJoinRequest.Content(v104, v252, type metadata accessor for NearbyProtoSessionMessage);
        uint64_t v108 = Logger.logObject.getter();
        os_log_type_t v109 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v108, v109))
        {
          uint64_t v110 = swift_slowAlloc();
          *(void *)&long long v263 = swift_slowAlloc();
          *(_DWORD *)uint64_t v110 = 134218242;
          uint64_t v111 = v106 + *(int *)(v256 + 24);
          uint64_t v112 = *(void *)v111;
          LODWORD(v111) = *(unsigned __int8 *)(v111 + 9);
          uint64_t v258 = v74;
          if (v111) {
            uint64_t v113 = 0;
          }
          else {
            uint64_t v113 = v112;
          }
          outlined destroy of NearbyProtoConnectionResponse.Content(v106, type metadata accessor for NearbyProtoSessionMessage);
          uint64_t v266 = v113;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v110 + 12) = 2080;
          uint64_t v114 = v252;
          uint64_t v115 = Message.debugDescription.getter();
          uint64_t v266 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v115, v116, (uint64_t *)&v263);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          outlined destroy of NearbyProtoConnectionResponse.Content(v114, type metadata accessor for NearbyProtoSessionMessage);
          _os_log_impl((void *)&_mh_execute_header, v108, v109, "Not able to handle message type: %ld, message: %s", (uint8_t *)v110, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          outlined consume of Data?(v258, v75);
          outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v257, type metadata accessor for NearbyProtoSessionMessage);
        }
        else
        {
          outlined destroy of NearbyProtoConnectionResponse.Content(v106, type metadata accessor for NearbyProtoSessionMessage);

          outlined destroy of NearbyProtoConnectionResponse.Content(v107, type metadata accessor for NearbyProtoSessionMessage);
          outlined consume of Data?(v74, v75);
          outlined destroy of NearbyProtoConnectionResponse.Content(v104, type metadata accessor for NearbyProtoSessionMessage);
        }
      }
      else
      {
        switch(*(void *)v105)
        {
          case 1:
            swift_bridgeObjectRelease();
            v117 = Logger.logObject.getter();
            os_log_type_t v118 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v117, v118))
            {
              v119 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v119 = 0;
              _os_log_impl((void *)&_mh_execute_header, v117, v118, "Handling join request", v119, 2u);
              swift_slowDealloc();
            }

            uint64_t v120 = (uint64_t *)(v104 + *(int *)(v256 + 28));
            uint64_t v121 = *v120;
            unint64_t v122 = v120[1];
            uint64_t v265 = 0;
            long long v263 = 0u;
            long long v264 = 0u;
            outlined copy of Data?(v121, v122);
            BinaryDecodingOptions.init()();
            lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoJoinRequest and conformance NearbyProtoJoinRequest, (void (*)(uint64_t))type metadata accessor for NearbyProtoJoinRequest);
            uint64_t v123 = (uint64_t)v249;
            Message.init(serializedData:extensions:partial:options:)();
            uint64_t v146 = v235;
            outlined init with copy of NearbyProtoJoinRequest.Content(v123, v235, type metadata accessor for NearbyProtoJoinRequest);
            v255 = v65;
            v147 = Logger.logObject.getter();
            os_log_type_t v148 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v147, v148))
            {
              v237 = a6;
              uint64_t v258 = v74;
              unint64_t v149 = v75;
              v150 = (uint8_t *)swift_slowAlloc();
              uint64_t v266 = swift_slowAlloc();
              *(_DWORD *)v150 = 136315138;
              v151 = (uint64_t *)(v146 + *(int *)(v248 + 20));
              unint64_t v152 = v151[1];
              if (v152 >> 60 == 15) {
                uint64_t v153 = 0;
              }
              else {
                uint64_t v153 = *v151;
              }
              if (v152 >> 60 == 15) {
                unint64_t v154 = 0xC000000000000000;
              }
              else {
                unint64_t v154 = v151[1];
              }
              outlined copy of Data?(*v151, v152);
              static String.Encoding.utf8.getter();
              uint64_t v155 = String.init(data:encoding:)();
              uint64_t v157 = v156;
              outlined consume of Data._Representation(v153, v154);
              if (v157)
              {
                *(void *)&long long v263 = v155;
                *((void *)&v263 + 1) = v157;
                uint64_t v158 = String.init<A>(reflecting:)();
                unint64_t v160 = v159;
              }
              else
              {
                uint64_t v158 = 7104878;
                unint64_t v160 = 0xE300000000000000;
              }
              *(void *)&long long v263 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v158, v160, &v266);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease();
              outlined destroy of NearbyProtoConnectionResponse.Content(v235, type metadata accessor for NearbyProtoJoinRequest);
              _os_log_impl((void *)&_mh_execute_header, v147, v148, "Attempting to decrypt data with publicKey: %s", v150, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              unint64_t v75 = v149;
              uint64_t v104 = (uint64_t)v257;
              uint64_t v74 = v258;
              a6 = v237;
              uint64_t v123 = (uint64_t)v249;
            }
            else
            {
              outlined destroy of NearbyProtoConnectionResponse.Content(v146, type metadata accessor for NearbyProtoJoinRequest);
            }
            uint64_t v206 = (uint64_t)v234;
            uint64_t v207 = (*(uint64_t (**)(char *, uint64_t, uint64_t, char *))((swift_isaMask & **(void **)((char *)a6 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_joinRequestsController))
                                                                               + 0xC0))(v234, v123, v221, v222);
            id v262 = v208;
            uint64_t v209 = v207;
            uint64_t v210 = outlined init with take of NearbyProtoSessionMessage(v206, (uint64_t)v223, type metadata accessor for NearbyProtoJoinRequest.Content);
            if (!(*(uint64_t (**)(uint64_t))((swift_isaMask & *a6) + 0x88))(v210)) {
              goto LABEL_95;
            }
            if (!v261) {
              goto LABEL_106;
            }
            uint64_t v212 = v211;
            uint64_t ObjectType = swift_getObjectType();
            (*(void (**)(void *, _UNKNOWN **, char *, os_log_t, uint64_t, uint64_t, char *, uint64_t, id, uint64_t, uint64_t))(v212 + 24))(a6, &protocol witness table for NearbyIDSServiceController, v223, v260, v261, v221, v222, v209, v262, ObjectType, v212);
            swift_unknownObjectRelease();
LABEL_95:
            swift_bridgeObjectRelease();
            outlined consume of Data._Representation(v209, (unint64_t)v262);
            outlined consume of Data?(v74, v75);
            outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v223, type metadata accessor for NearbyProtoJoinRequest.Content);
            v195 = type metadata accessor for NearbyProtoJoinRequest;
            uint64_t v196 = (uint64_t)v249;
            goto LABEL_96;
          case 2:
            swift_bridgeObjectRelease();
            v255 = v65;
            uint64_t v124 = Logger.logObject.getter();
            os_log_type_t v125 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v124, v125))
            {
              v126 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v126 = 0;
              _os_log_impl((void *)&_mh_execute_header, v124, v125, "Handling join response", v126, 2u);
              swift_slowDealloc();
            }

            v127 = (uint64_t *)(v104 + *(int *)(v256 + 28));
            uint64_t v128 = *v127;
            unint64_t v129 = v127[1];
            uint64_t v265 = 0;
            long long v263 = 0u;
            long long v264 = 0u;
            outlined copy of Data?(v128, v129);
            BinaryDecodingOptions.init()();
            lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoJoinResponse and conformance NearbyProtoJoinResponse, (void (*)(uint64_t))type metadata accessor for NearbyProtoJoinResponse);
            Message.init(serializedData:extensions:partial:options:)();
            v161 = *(uint64_t (**)(uint64_t))((swift_isaMask & *a6) + 0xB8);
            uint64_t v162 = swift_bridgeObjectRetain();
            v237 = a6;
            uint64_t v163 = v161(v162);
            uint64_t v164 = v163;
            if (*(void *)(v163 + 16))
            {
              unint64_t v165 = specialized __RawDictionaryStorage.find<A>(_:)(v81, (uint64_t)v83);
              if (v166)
              {
                uint64_t v258 = v74;
                v222 = (char *)v75;
                uint64_t v167 = *(void *)(*(void *)(v164 + 56) + 8 * v165);
                swift_retain();
                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease();
                v168 = (uint64_t *)(v250 + *(int *)(v247 + 20));
                unint64_t v169 = v168[1];
                if (v169 >> 60 == 15) {
                  uint64_t v170 = 0;
                }
                else {
                  uint64_t v170 = *v168;
                }
                if (v169 >> 60 == 15) {
                  unint64_t v171 = 0xC000000000000000;
                }
                else {
                  unint64_t v171 = v168[1];
                }
                v172 = *(uint64_t (**)(uint64_t, unint64_t))(*(void *)v167 + 152);
                outlined copy of Data?(*v168, v169);
                uint64_t v173 = v172(v170, v171);
                unint64_t v175 = v174;
                outlined consume of Data._Representation(v170, v171);
                uint64_t v265 = 0;
                long long v263 = 0u;
                long long v264 = 0u;
                outlined copy of Data._Representation(v173, v175);
                BinaryDecodingOptions.init()();
                lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoJoinResponse.Content and conformance NearbyProtoJoinResponse.Content, (void (*)(uint64_t))type metadata accessor for NearbyProtoJoinResponse.Content);
                Message.init(serializedData:extensions:partial:options:)();
                uint64_t v214 = (uint64_t)v228;
                (*(void (**)(char *, void, uint64_t, uint64_t))(v226 + 56))(v228, 0, 1, v227);
                uint64_t v215 = outlined init with take of NearbyProtoSessionMessage(v214, v224, type metadata accessor for NearbyProtoJoinResponse.Content);
                if ((*(uint64_t (**)(uint64_t))((swift_isaMask & *v237) + 0x88))(v215))
                {
                  uint64_t v218 = v217;
                  uint64_t v219 = swift_getObjectType();
                  (*(void (**)(void *, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(v218 + 32))(v237, &protocol witness table for NearbyIDSServiceController, v224, v219, v218);
                  swift_release();
                  swift_unknownObjectRelease();
                }
                else
                {
                  swift_release();
                }
                outlined consume of Data._Representation(v173, v175);
                outlined consume of Data?(v258, (unint64_t)v222);
                outlined destroy of NearbyProtoConnectionResponse.Content(v224, type metadata accessor for NearbyProtoJoinResponse.Content);
                goto LABEL_100;
              }
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRetain();
            v197 = Logger.logObject.getter();
            os_log_type_t v198 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v197, v198))
            {
              uint64_t v199 = swift_slowAlloc();
              *(void *)&long long v263 = swift_slowAlloc();
              *(_DWORD *)uint64_t v199 = 136315394;
              uint64_t v266 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000046, 0x80000001000DCE60, (uint64_t *)&v263);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              *(_WORD *)(v199 + 12) = 2080;
              swift_bridgeObjectRetain();
              uint64_t v266 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v81, (unint64_t)v83, (uint64_t *)&v263);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease_n();
              _os_log_impl((void *)&_mh_execute_header, v197, v198, "%s No credentials to parse join response for: %s", (uint8_t *)v199, 0x16u);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              uint64_t v200 = v74;
              unint64_t v201 = v75;
              goto LABEL_99;
            }
            swift_bridgeObjectRelease_n();

            outlined consume of Data?(v74, v75);
            v195 = type metadata accessor for NearbyProtoJoinResponse;
            uint64_t v196 = v250;
LABEL_96:
            outlined destroy of NearbyProtoConnectionResponse.Content(v196, v195);
            outlined destroy of NearbyProtoConnectionResponse.Content(v104, type metadata accessor for NearbyProtoSessionMessage);
            break;
          case 3:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v130 = Logger.logObject.getter();
            os_log_type_t v131 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v130, v131))
            {
              v132 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v132 = 0;
              _os_log_impl((void *)&_mh_execute_header, v130, v131, "Handling connection request message", v132, 2u);
              swift_slowDealloc();
            }

            v133 = (uint64_t *)(v104 + *(int *)(v256 + 28));
            uint64_t v134 = *v133;
            unint64_t v135 = v133[1];
            uint64_t v265 = 0;
            long long v263 = 0u;
            long long v264 = 0u;
            outlined copy of Data?(v134, v135);
            BinaryDecodingOptions.init()();
            lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoConnectionRequest and conformance NearbyProtoConnectionRequest, (void (*)(uint64_t))type metadata accessor for NearbyProtoConnectionRequest);
            uint64_t v136 = (uint64_t)v244;
            uint64_t v137 = v243;
            Message.init(serializedData:extensions:partial:options:)();
            v237 = a6;
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v238 + 56))(v136, 0, 1, v137);
            uint64_t v176 = v236;
            outlined init with take of NearbyProtoSessionMessage(v136, v236, type metadata accessor for NearbyProtoConnectionRequest);
            v177 = v231;
            outlined init with copy of NearbyProtoJoinRequest.Content(v176, (uint64_t)v231, type metadata accessor for NearbyProtoConnectionRequest);
            uint64_t v178 = v233;
            outlined init with copy of NearbyProtoJoinRequest.Content(v176, v233, type metadata accessor for NearbyProtoConnectionRequest);
            v179 = Logger.logObject.getter();
            os_log_type_t v180 = static os_log_type_t.info.getter();
            LODWORD(v262) = v180;
            if (os_log_type_enabled(v179, v180))
            {
              uint64_t v181 = swift_slowAlloc();
              uint64_t v261 = swift_slowAlloc();
              *(void *)&long long v263 = v261;
              *(_DWORD *)uint64_t v181 = 136315394;
              uint64_t v183 = *v177;
              unint64_t v182 = v177[1];
              uint64_t v258 = v74;
              swift_bridgeObjectRetain();
              uint64_t v266 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v183, v182, (uint64_t *)&v263);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease();
              outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v177, type metadata accessor for NearbyProtoConnectionRequest);
              *(_WORD *)(v181 + 12) = 2080;
              os_log_t v260 = v179;
              unint64_t v184 = v75;
              uint64_t v185 = *(void *)(v178 + 16);
              unint64_t v186 = *(void *)(v178 + 24);
              swift_bridgeObjectRetain();
              uint64_t v266 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v185, v186, (uint64_t *)&v263);
              uint64_t v187 = v258;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              unint64_t v75 = v184;
              uint64_t v74 = v187;
              swift_bridgeObjectRelease();
              uint64_t v176 = v236;
              outlined destroy of NearbyProtoConnectionResponse.Content(v178, type metadata accessor for NearbyProtoConnectionRequest);
              os_log_t v188 = v260;
              _os_log_impl((void *)&_mh_execute_header, v260, (os_log_type_t)v262, "Got connection request: %s from: %s", (uint8_t *)v181, 0x16u);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
              outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v177, type metadata accessor for NearbyProtoConnectionRequest);
              outlined destroy of NearbyProtoConnectionResponse.Content(v178, type metadata accessor for NearbyProtoConnectionRequest);
            }
            v202 = v237;
            if ((*(uint64_t (**)(void))((swift_isaMask & *v237) + 0x88))())
            {
              uint64_t v204 = v203;
              uint64_t v205 = swift_getObjectType();
              (*(void (**)(void *, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(v204 + 8))(v202, &protocol witness table for NearbyIDSServiceController, v176, v205, v204);
              swift_unknownObjectRelease();
            }
            outlined consume of Data?(v74, v75);
            v195 = type metadata accessor for NearbyProtoConnectionRequest;
            uint64_t v196 = v176;
            goto LABEL_96;
          case 4:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v138 = Logger.logObject.getter();
            os_log_type_t v139 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v138, v139))
            {
              v140 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v140 = 0;
              _os_log_impl((void *)&_mh_execute_header, v138, v139, "Handling connection response", v140, 2u);
              swift_slowDealloc();
            }

            v141 = (uint64_t *)(v104 + *(int *)(v256 + 28));
            uint64_t v142 = *v141;
            unint64_t v143 = v141[1];
            uint64_t v265 = 0;
            long long v263 = 0u;
            long long v264 = 0u;
            outlined copy of Data?(v142, v143);
            BinaryDecodingOptions.init()();
            lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content, (void (*)(uint64_t))type metadata accessor for NearbyProtoConnectionResponse.Content);
            uint64_t v144 = (uint64_t)v246;
            uint64_t v145 = v245;
            Message.init(serializedData:extensions:partial:options:)();
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v239 + 56))(v144, 0, 1, v145);
            uint64_t v189 = v232;
            uint64_t v190 = outlined init with take of NearbyProtoSessionMessage(v144, v232, type metadata accessor for NearbyProtoConnectionResponse.Content);
            if ((*(uint64_t (**)(uint64_t))((swift_isaMask & *a6) + 0x88))(v190))
            {
              uint64_t v193 = v192;
              uint64_t v194 = swift_getObjectType();
              (*(void (**)(void *, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(v193 + 16))(a6, &protocol witness table for NearbyIDSServiceController, v189, v194, v193);
              swift_unknownObjectRelease();
            }
            outlined consume of Data?(v74, v75);
            v195 = type metadata accessor for NearbyProtoConnectionResponse.Content;
            uint64_t v196 = v189;
            goto LABEL_96;
          default:
            goto LABEL_39;
        }
      }
      return;
    case 3uLL:
      goto LABEL_21;
    default:
      if (!BYTE6(v75)) {
        goto LABEL_21;
      }
      goto LABEL_26;
  }
}

{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  char *v65;
  NSObject *v66;
  os_log_type_t v67;
  BOOL v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  NSString v76;
  id v77;
  id v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  void *v88;
  void *v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  NSObject *v98;
  os_log_type_t v99;
  uint8_t *v100;
  id v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  os_log_type_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  NSObject *v117;
  os_log_type_t v118;
  uint8_t *v119;
  uint64_t *v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  NSObject *v124;
  os_log_type_t v125;
  uint8_t *v126;
  uint64_t *v127;
  uint64_t v128;
  unint64_t v129;
  NSObject *v130;
  os_log_type_t v131;
  uint8_t *v132;
  uint64_t *v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  uint64_t v137;
  NSObject *v138;
  os_log_type_t v139;
  uint8_t *v140;
  uint64_t *v141;
  uint64_t v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  NSObject *v147;
  os_log_type_t v148;
  unint64_t v149;
  uint8_t *v150;
  uint64_t *v151;
  unint64_t v152;
  uint64_t v153;
  unint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  unint64_t v160;
  uint64_t (*v161)(uint64_t);
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  unint64_t v165;
  char v166;
  uint64_t v167;
  uint64_t *v168;
  unint64_t v169;
  uint64_t v170;
  unint64_t v171;
  uint64_t (*v172)(uint64_t, unint64_t);
  uint64_t v173;
  unint64_t v174;
  unint64_t v175;
  uint64_t v176;
  uint64_t *v177;
  uint64_t v178;
  NSObject *v179;
  os_log_type_t v180;
  uint64_t v181;
  unint64_t v182;
  uint64_t v183;
  unint64_t v184;
  uint64_t v185;
  unint64_t v186;
  uint64_t v187;
  os_log_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t (*v195)(uint64_t);
  uint64_t v196;
  NSObject *v197;
  os_log_type_t v198;
  uint64_t v199;
  uint64_t v200;
  unint64_t v201;
  void *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t ObjectType;
  uint64_t v214;
  uint64_t v215;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  char *v222;
  char *v223;
  uint64_t v224;
  char *v225;
  uint64_t v226;
  uint64_t v227;
  char *v228;
  char *v229;
  char *v230;
  uint64_t *v231;
  uint64_t v232;
  uint64_t v233;
  char *v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  uint64_t v238;
  uint64_t v239;
  char *v240;
  char *v241;
  char *v242;
  uint64_t v243;
  char *v244;
  uint64_t v245;
  char *v246;
  uint64_t v247;
  uint64_t v248;
  char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  char *v253;
  uint64_t v254;
  char *v255;
  uint64_t v256;
  char *v257;
  uint64_t v258;
  id v259;
  os_log_t v260;
  uint64_t v261;
  id v262;
  long long v263;
  long long v264;
  uint64_t v265;
  uint64_t v266;

  uint64_t v261 = a4;
  id v262 = a5;
  os_log_t v260 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for NearbyProtoJoinResponse.Content?);
  __chkstk_darwin(v9 - 8);
  v228 = (char *)&v220 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v227 = type metadata accessor for NearbyProtoJoinResponse.Content(0);
  uint64_t v226 = *(void *)(v227 - 8);
  __chkstk_darwin(v227);
  uint64_t v224 = (uint64_t)&v220 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v247 = type metadata accessor for NearbyProtoJoinResponse(0);
  __chkstk_darwin(v247);
  uint64_t v250 = (uint64_t)&v220 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for NearbyProtoJoinRequest.Content(0);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  v234 = (char *)&v220 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  BOOL v17 = (char *)&v220 - v16;
  uint64_t v18 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v18 - 8);
  v230 = (char *)&v220 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v248 = type metadata accessor for NearbyProtoJoinRequest(0);
  uint64_t v20 = __chkstk_darwin(v248);
  uint64_t v235 = (uint64_t)&v220 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v249 = (char *)&v220 - v22;
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoConnectionResponse.Content?);
  __chkstk_darwin(v23 - 8);
  v246 = (char *)&v220 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v245 = type metadata accessor for NearbyProtoConnectionResponse.Content(0);
  uint64_t v239 = *(void *)(v245 - 8);
  __chkstk_darwin(v245);
  uint64_t v232 = (uint64_t)&v220 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoConnectionRequest?);
  __chkstk_darwin(v26 - 8);
  v244 = (char *)&v220 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v243 = type metadata accessor for NearbyProtoConnectionRequest(0);
  uint64_t v238 = *(void *)(v243 - 8);
  uint64_t v28 = __chkstk_darwin(v243);
  uint64_t v233 = (uint64_t)&v220 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = __chkstk_darwin(v28);
  v231 = (uint64_t *)((char *)&v220 - v31);
  __chkstk_darwin(v30);
  uint64_t v236 = (uint64_t)&v220 - v32;
  uint64_t v33 = type metadata accessor for BinaryDecodingOptions();
  uint64_t v34 = __chkstk_darwin(v33 - 8);
  v225 = (char *)&v220 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = __chkstk_darwin(v34);
  uint64_t v38 = (char *)&v220 - v37;
  uint64_t v39 = __chkstk_darwin(v36);
  v242 = (char *)&v220 - v40;
  uint64_t v41 = __chkstk_darwin(v39);
  v241 = (char *)&v220 - v42;
  uint64_t v43 = __chkstk_darwin(v41);
  v240 = (char *)&v220 - v44;
  __chkstk_darwin(v43);
  v253 = (char *)&v220 - v45;
  uint64_t v46 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoSessionMessage?);
  __chkstk_darwin(v46 - 8);
  v255 = (char *)&v220 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v256 = type metadata accessor for NearbyProtoSessionMessage(0);
  uint64_t v254 = *(void *)(v256 - 8);
  uint64_t v48 = __chkstk_darwin(v256);
  uint64_t v252 = (uint64_t)&v220 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = __chkstk_darwin(v48);
  uint64_t v251 = (uint64_t)&v220 - v51;
  __chkstk_darwin(v50);
  unint64_t v53 = (char *)&v220 - v52;
  uint64_t v54 = type metadata accessor for DispatchPredicate();
  uint64_t v55 = *(void *)(v54 - 8);
  __chkstk_darwin(v54);
  uint64_t v57 = (uint64_t *)((char *)&v220 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v58 = *(void **)((char *)a6
                 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue);
  *uint64_t v57 = v58;
  (*(void (**)(void *, void, uint64_t))(v55 + 104))(v57, enum case for DispatchPredicate.onQueue(_:), v54);
  id v59 = v58;
  LOBYTE(v58) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v55 + 8))(v57, v54);
  if (v58)
  {
    v229 = v38;
    uint64_t v38 = (char *)a2;
    a2 = a1;
    v223 = v17;
    if (one-time initialization token for host == -1) {
      goto LABEL_3;
    }
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  uint64_t v60 = type metadata accessor for Logger();
  uint64_t v61 = __swift_project_value_buffer(v60, (uint64_t)static Log.host);
  id v62 = v262;
  uint64_t v63 = v261;
  swift_bridgeObjectRetain_n();
  id v64 = v62;
  uint64_t v65 = (char *)v61;
  uint64_t v66 = Logger.logObject.getter();
  os_log_type_t v67 = static os_log_type_t.default.getter();
  BOOL v68 = os_log_type_enabled(v66, v67);
  id v259 = v64;
  if (v68)
  {
    v237 = a6;
    v257 = v53;
    uint64_t v258 = a2;
    v222 = v38;
    uint64_t v69 = swift_slowAlloc();
    uint64_t v70 = (void *)swift_slowAlloc();
    uint64_t v266 = swift_slowAlloc();
    *(_DWORD *)uint64_t v69 = 136315394;
    if (v63)
    {
      *(void *)&long long v263 = v260;
      *((void *)&v263 + 1) = v63;
      swift_bridgeObjectRetain();
      uint64_t v71 = String.init<A>(reflecting:)();
      unint64_t v73 = v72;
    }
    else
    {
      uint64_t v71 = 7104878;
      unint64_t v73 = 0xE300000000000000;
    }
    *(void *)&long long v263 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v71, v73, &v266);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v69 + 12) = 2112;
    if (v262)
    {
      id v77 = v259;
      *(void *)&long long v263 = v259;
      id v78 = v259;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
    }
    else
    {
      *(void *)&long long v263 = 0;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      id v77 = v259;
    }
    *uint64_t v70 = v262;

    _os_log_impl((void *)&_mh_execute_header, v66, v67, "Handling incoming data from: %s context: %@", (uint8_t *)v69, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    unint64_t v75 = (unint64_t)v222;
    unint64_t v53 = v257;
    a6 = v237;
    uint64_t v74 = v258;
    if (!v261) {
      goto LABEL_13;
    }
LABEL_7:
    NSString v76 = String._bridgeToObjectiveC()();
    goto LABEL_14;
  }

  swift_bridgeObjectRelease_n();
  uint64_t v74 = a2;
  unint64_t v75 = (unint64_t)v38;
  if (v63) {
    goto LABEL_7;
  }
LABEL_13:
  NSString v76 = 0;
LABEL_14:
  uint64_t v79 = (void *)IDSCopyAddressDestinationForDestination();

  uint64_t v80 = (void *)IDSCopyRawAddressForDestination();
  if (!v80) {
    return;
  }
  uint64_t v81 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v83 = v82;

  if (String.count.getter() < 1 || v75 >> 60 == 15)
  {
    swift_bridgeObjectRelease();
    return;
  }
  switch(v75 >> 62)
  {
    case 1uLL:
      if (!__OFSUB__(HIDWORD(v74), v74))
      {
        uint64_t v84 = HIDWORD(v74) - (int)v74;
        goto LABEL_25;
      }
      __break(1u);
      goto LABEL_98;
    case 2uLL:
      uint64_t v86 = *(void *)(v74 + 16);
      uint64_t v85 = *(void *)(v74 + 24);
      uint64_t v84 = v85 - v86;
      if (__OFSUB__(v85, v86))
      {
LABEL_98:
        __break(1u);

        swift_release();
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
        uint64_t v200 = v258;
        unint64_t v201 = (unint64_t)v222;
LABEL_99:
        outlined consume of Data?(v200, v201);
LABEL_100:
        outlined destroy of NearbyProtoConnectionResponse.Content(v250, type metadata accessor for NearbyProtoJoinResponse);
        outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v257, type metadata accessor for NearbyProtoSessionMessage);
        return;
      }
LABEL_25:
      outlined copy of Data._Representation(v74, v75);
      if (v84 < 1)
      {
LABEL_21:
        swift_bridgeObjectRelease();
        outlined consume of Data?(v74, v75);
        return;
      }
LABEL_26:
      if (!v262)
      {
        __break(1u);
LABEL_106:
        __break(1u);
        JUMPOUT(0x1000D3148);
      }
      id v87 = [v259 toID];
      uint64_t v88 = (void *)IDSCopyAddressDestinationForDestination();

      uint64_t v89 = (void *)IDSCopyRawAddressForDestination();
      if (!v89) {
        goto LABEL_33;
      }
      uint64_t v90 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v92 = v91;

      uint64_t v93 = HIBYTE(v92) & 0xF;
      if ((v92 & 0x2000000000000000) == 0) {
        uint64_t v93 = v90 & 0xFFFFFFFFFFFFLL;
      }
      if (!v93)
      {
        swift_bridgeObjectRelease();
LABEL_33:
        swift_bridgeObjectRelease();
        id v97 = v259;
        uint64_t v98 = Logger.logObject.getter();
        os_log_type_t v99 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v98, v99))
        {
          uint64_t v258 = v74;
          os_log_type_t v100 = (uint8_t *)swift_slowAlloc();
          *(void *)&long long v263 = swift_slowAlloc();
          *(_DWORD *)os_log_type_t v100 = 136315138;
          uint64_t v266 = (uint64_t)v97;
          type metadata accessor for OS_dispatch_queue(0, (unint64_t *)&lazy cache variable for type metadata for IDSMessageContext);
          id v101 = v97;
          uint64_t v102 = String.init<A>(reflecting:)();
          uint64_t v266 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v102, v103, (uint64_t *)&v263);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v98, v99, "Failed to find toID for message: %s", v100, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          outlined consume of Data?(v258, v75);
        }
        else
        {
          outlined consume of Data?(v74, v75);
        }
        return;
      }
      v257 = v53;
      uint64_t v221 = v90;
      v222 = (char *)v92;
      uint64_t v265 = 0;
      long long v263 = 0u;
      long long v264 = 0u;
      outlined copy of Data._Representation(v74, v75);
      BinaryDecodingOptions.init()();
      uint64_t v94 = lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content((unint64_t *)&lazy protocol witness table cache variable for type NearbyProtoSessionMessage and conformance NearbyProtoSessionMessage, (void (*)(uint64_t))type metadata accessor for NearbyProtoSessionMessage);
      uint64_t v95 = (uint64_t)v255;
      uint64_t v96 = v256;
      Message.init(serializedData:extensions:partial:options:)();
      v253 = (char *)v94;
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v254 + 56))(v95, 0, 1, v96);
      uint64_t v104 = (uint64_t)v257;
      outlined init with take of NearbyProtoSessionMessage(v95, (uint64_t)v257, type metadata accessor for NearbyProtoSessionMessage);
      uint64_t v105 = v104 + *(int *)(v96 + 24);
      if ((*(unsigned char *)(v105 + 9) & 1) != 0 || (*(unsigned char *)(v105 + 8) & 1) == 0)
      {
LABEL_39:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v106 = v251;
        outlined init with copy of NearbyProtoJoinRequest.Content(v104, v251, type metadata accessor for NearbyProtoSessionMessage);
        uint64_t v107 = v252;
        outlined init with copy of NearbyProtoJoinRequest.Content(v104, v252, type metadata accessor for NearbyProtoSessionMessage);
        uint64_t v108 = Logger.logObject.getter();
        os_log_type_t v109 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v108, v109))
        {
          uint64_t v110 = swift_slowAlloc();
          *(void *)&long long v263 = swift_slowAlloc();
          *(_DWORD *)uint64_t v110 = 134218242;
          uint64_t v111 = v106 + *(int *)(v256 + 24);
          uint64_t v112 = *(void *)v111;
          LODWORD(v111) = *(unsigned __int8 *)(v111 + 9);
          uint64_t v258 = v74;
          if (v111) {
            uint64_t v113 = 0;
          }
          else {
            uint64_t v113 = v112;
          }
          outlined destroy of NearbyProtoConnectionResponse.Content(v106, type metadata accessor for NearbyProtoSessionMessage);
          uint64_t v266 = v113;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v110 + 12) = 2080;
          uint64_t v114 = v252;
          uint64_t v115 = Message.debugDescription.getter();
          uint64_t v266 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v115, v116, (uint64_t *)&v263);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          outlined destroy of NearbyProtoConnectionResponse.Content(v114, type metadata accessor for NearbyProtoSessionMessage);
          _os_log_impl((void *)&_mh_execute_header, v108, v109, "Not able to handle message type: %ld, message: %s", (uint8_t *)v110, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          outlined consume of Data?(v258, v75);
          outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v257, type metadata accessor for NearbyProtoSessionMessage);
        }
        else
        {
          outlined destroy of NearbyProtoConnectionResponse.Content(v106, type metadata accessor for NearbyProtoSessionMessage);

          outlined destroy of NearbyProtoConnectionResponse.Content(v107, type metadata accessor for NearbyProtoSessionMessage);
          outlined consume of Data?(v74, v75);
          outlined destroy of NearbyProtoConnectionResponse.Content(v104, type metadata accessor for NearbyProtoSessionMessage);
        }
      }
      else
      {
        switch(*(void *)v105)
        {
          case 1:
            swift_bridgeObjectRelease();
            v117 = Logger.logObject.getter();
            os_log_type_t v118 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v117, v118))
            {
              v119 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v119 = 0;
              _os_log_impl((void *)&_mh_execute_header, v117, v118, "Handling join request", v119, 2u);
              swift_slowDealloc();
            }

            uint64_t v120 = (uint64_t *)(v104 + *(int *)(v256 + 28));
            uint64_t v121 = *v120;
            unint64_t v122 = v120[1];
            uint64_t v265 = 0;
            long long v263 = 0u;
            long long v264 = 0u;
            outlined copy of Data?(v121, v122);
            BinaryDecodingOptions.init()();
            lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoJoinRequest and conformance NearbyProtoJoinRequest, (void (*)(uint64_t))type metadata accessor for NearbyProtoJoinRequest);
            uint64_t v123 = (uint64_t)v249;
            Message.init(serializedData:extensions:partial:options:)();
            uint64_t v146 = v235;
            outlined init with copy of NearbyProtoJoinRequest.Content(v123, v235, type metadata accessor for NearbyProtoJoinRequest);
            v255 = v65;
            v147 = Logger.logObject.getter();
            os_log_type_t v148 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v147, v148))
            {
              v237 = a6;
              uint64_t v258 = v74;
              unint64_t v149 = v75;
              v150 = (uint8_t *)swift_slowAlloc();
              uint64_t v266 = swift_slowAlloc();
              *(_DWORD *)v150 = 136315138;
              v151 = (uint64_t *)(v146 + *(int *)(v248 + 20));
              unint64_t v152 = v151[1];
              if (v152 >> 60 == 15) {
                uint64_t v153 = 0;
              }
              else {
                uint64_t v153 = *v151;
              }
              if (v152 >> 60 == 15) {
                unint64_t v154 = 0xC000000000000000;
              }
              else {
                unint64_t v154 = v151[1];
              }
              outlined copy of Data?(*v151, v152);
              static String.Encoding.utf8.getter();
              uint64_t v155 = String.init(data:encoding:)();
              uint64_t v157 = v156;
              outlined consume of Data._Representation(v153, v154);
              if (v157)
              {
                *(void *)&long long v263 = v155;
                *((void *)&v263 + 1) = v157;
                uint64_t v158 = String.init<A>(reflecting:)();
                unint64_t v160 = v159;
              }
              else
              {
                uint64_t v158 = 7104878;
                unint64_t v160 = 0xE300000000000000;
              }
              *(void *)&long long v263 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v158, v160, &v266);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease();
              outlined destroy of NearbyProtoConnectionResponse.Content(v235, type metadata accessor for NearbyProtoJoinRequest);
              _os_log_impl((void *)&_mh_execute_header, v147, v148, "Attempting to decrypt data with publicKey: %s", v150, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              unint64_t v75 = v149;
              uint64_t v104 = (uint64_t)v257;
              uint64_t v74 = v258;
              a6 = v237;
              uint64_t v123 = (uint64_t)v249;
            }
            else
            {
              outlined destroy of NearbyProtoConnectionResponse.Content(v146, type metadata accessor for NearbyProtoJoinRequest);
            }
            uint64_t v206 = (uint64_t)v234;
            uint64_t v207 = (*(uint64_t (**)(char *, uint64_t, uint64_t, char *))((swift_isaMask & **(void **)((char *)a6 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_joinRequestsController))
                                                                               + 0xC0))(v234, v123, v221, v222);
            id v262 = v208;
            uint64_t v209 = v207;
            uint64_t v210 = outlined init with take of NearbyProtoSessionMessage(v206, (uint64_t)v223, type metadata accessor for NearbyProtoJoinRequest.Content);
            if (!(*(uint64_t (**)(uint64_t))((swift_isaMask & *a6) + 0x88))(v210)) {
              goto LABEL_95;
            }
            if (!v261) {
              goto LABEL_106;
            }
            uint64_t v212 = v211;
            uint64_t ObjectType = swift_getObjectType();
            (*(void (**)(void *, _UNKNOWN **, char *, os_log_t, uint64_t, uint64_t, char *, uint64_t, id, uint64_t, uint64_t))(v212 + 24))(a6, &protocol witness table for NearbyIDSServiceController, v223, v260, v261, v221, v222, v209, v262, ObjectType, v212);
            swift_unknownObjectRelease();
LABEL_95:
            swift_bridgeObjectRelease();
            outlined consume of Data._Representation(v209, (unint64_t)v262);
            outlined consume of Data?(v74, v75);
            outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v223, type metadata accessor for NearbyProtoJoinRequest.Content);
            v195 = type metadata accessor for NearbyProtoJoinRequest;
            uint64_t v196 = (uint64_t)v249;
            goto LABEL_96;
          case 2:
            swift_bridgeObjectRelease();
            v255 = v65;
            uint64_t v124 = Logger.logObject.getter();
            os_log_type_t v125 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v124, v125))
            {
              v126 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v126 = 0;
              _os_log_impl((void *)&_mh_execute_header, v124, v125, "Handling join response", v126, 2u);
              swift_slowDealloc();
            }

            v127 = (uint64_t *)(v104 + *(int *)(v256 + 28));
            uint64_t v128 = *v127;
            unint64_t v129 = v127[1];
            uint64_t v265 = 0;
            long long v263 = 0u;
            long long v264 = 0u;
            outlined copy of Data?(v128, v129);
            BinaryDecodingOptions.init()();
            lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoJoinResponse and conformance NearbyProtoJoinResponse, (void (*)(uint64_t))type metadata accessor for NearbyProtoJoinResponse);
            Message.init(serializedData:extensions:partial:options:)();
            v161 = *(uint64_t (**)(uint64_t))((swift_isaMask & *a6) + 0xB8);
            uint64_t v162 = swift_bridgeObjectRetain();
            v237 = a6;
            uint64_t v163 = v161(v162);
            uint64_t v164 = v163;
            if (*(void *)(v163 + 16))
            {
              unint64_t v165 = specialized __RawDictionaryStorage.find<A>(_:)(v81, (uint64_t)v83);
              if (v166)
              {
                uint64_t v258 = v74;
                v222 = (char *)v75;
                uint64_t v167 = *(void *)(*(void *)(v164 + 56) + 8 * v165);
                swift_retain();
                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease();
                v168 = (uint64_t *)(v250 + *(int *)(v247 + 20));
                unint64_t v169 = v168[1];
                if (v169 >> 60 == 15) {
                  uint64_t v170 = 0;
                }
                else {
                  uint64_t v170 = *v168;
                }
                if (v169 >> 60 == 15) {
                  unint64_t v171 = 0xC000000000000000;
                }
                else {
                  unint64_t v171 = v168[1];
                }
                v172 = *(uint64_t (**)(uint64_t, unint64_t))(*(void *)v167 + 152);
                outlined copy of Data?(*v168, v169);
                uint64_t v173 = v172(v170, v171);
                unint64_t v175 = v174;
                outlined consume of Data._Representation(v170, v171);
                uint64_t v265 = 0;
                long long v263 = 0u;
                long long v264 = 0u;
                outlined copy of Data._Representation(v173, v175);
                BinaryDecodingOptions.init()();
                lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoJoinResponse.Content and conformance NearbyProtoJoinResponse.Content, (void (*)(uint64_t))type metadata accessor for NearbyProtoJoinResponse.Content);
                Message.init(serializedData:extensions:partial:options:)();
                uint64_t v214 = (uint64_t)v228;
                (*(void (**)(char *, void, uint64_t, uint64_t))(v226 + 56))(v228, 0, 1, v227);
                uint64_t v215 = outlined init with take of NearbyProtoSessionMessage(v214, v224, type metadata accessor for NearbyProtoJoinResponse.Content);
                if ((*(uint64_t (**)(uint64_t))((swift_isaMask & *v237) + 0x88))(v215))
                {
                  uint64_t v218 = v217;
                  uint64_t v219 = swift_getObjectType();
                  (*(void (**)(void *, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(v218 + 32))(v237, &protocol witness table for NearbyIDSServiceController, v224, v219, v218);
                  swift_release();
                  swift_unknownObjectRelease();
                }
                else
                {
                  swift_release();
                }
                outlined consume of Data._Representation(v173, v175);
                outlined consume of Data?(v258, (unint64_t)v222);
                outlined destroy of NearbyProtoConnectionResponse.Content(v224, type metadata accessor for NearbyProtoJoinResponse.Content);
                goto LABEL_100;
              }
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRetain();
            v197 = Logger.logObject.getter();
            os_log_type_t v198 = static os_log_type_t.error.getter();
            if (os_log_type_enabled(v197, v198))
            {
              uint64_t v199 = swift_slowAlloc();
              *(void *)&long long v263 = swift_slowAlloc();
              *(_DWORD *)uint64_t v199 = 136315394;
              uint64_t v266 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(0xD000000000000046, 0x80000001000DCE60, (uint64_t *)&v263);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              *(_WORD *)(v199 + 12) = 2080;
              swift_bridgeObjectRetain();
              uint64_t v266 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v81, (unint64_t)v83, (uint64_t *)&v263);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease_n();
              _os_log_impl((void *)&_mh_execute_header, v197, v198, "%s No credentials to parse join response for: %s", (uint8_t *)v199, 0x16u);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              uint64_t v200 = v74;
              unint64_t v201 = v75;
              goto LABEL_99;
            }
            swift_bridgeObjectRelease_n();

            outlined consume of Data?(v74, v75);
            v195 = type metadata accessor for NearbyProtoJoinResponse;
            uint64_t v196 = v250;
LABEL_96:
            outlined destroy of NearbyProtoConnectionResponse.Content(v196, v195);
            outlined destroy of NearbyProtoConnectionResponse.Content(v104, type metadata accessor for NearbyProtoSessionMessage);
            break;
          case 3:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v130 = Logger.logObject.getter();
            os_log_type_t v131 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v130, v131))
            {
              v132 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v132 = 0;
              _os_log_impl((void *)&_mh_execute_header, v130, v131, "Handling connection request message", v132, 2u);
              swift_slowDealloc();
            }

            v133 = (uint64_t *)(v104 + *(int *)(v256 + 28));
            uint64_t v134 = *v133;
            unint64_t v135 = v133[1];
            uint64_t v265 = 0;
            long long v263 = 0u;
            long long v264 = 0u;
            outlined copy of Data?(v134, v135);
            BinaryDecodingOptions.init()();
            lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoConnectionRequest and conformance NearbyProtoConnectionRequest, (void (*)(uint64_t))type metadata accessor for NearbyProtoConnectionRequest);
            uint64_t v136 = (uint64_t)v244;
            uint64_t v137 = v243;
            Message.init(serializedData:extensions:partial:options:)();
            v237 = a6;
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v238 + 56))(v136, 0, 1, v137);
            uint64_t v176 = v236;
            outlined init with take of NearbyProtoSessionMessage(v136, v236, type metadata accessor for NearbyProtoConnectionRequest);
            v177 = v231;
            outlined init with copy of NearbyProtoJoinRequest.Content(v176, (uint64_t)v231, type metadata accessor for NearbyProtoConnectionRequest);
            uint64_t v178 = v233;
            outlined init with copy of NearbyProtoJoinRequest.Content(v176, v233, type metadata accessor for NearbyProtoConnectionRequest);
            v179 = Logger.logObject.getter();
            os_log_type_t v180 = static os_log_type_t.info.getter();
            LODWORD(v262) = v180;
            if (os_log_type_enabled(v179, v180))
            {
              uint64_t v181 = swift_slowAlloc();
              uint64_t v261 = swift_slowAlloc();
              *(void *)&long long v263 = v261;
              *(_DWORD *)uint64_t v181 = 136315394;
              uint64_t v183 = *v177;
              unint64_t v182 = v177[1];
              uint64_t v258 = v74;
              swift_bridgeObjectRetain();
              uint64_t v266 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v183, v182, (uint64_t *)&v263);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease();
              outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v177, type metadata accessor for NearbyProtoConnectionRequest);
              *(_WORD *)(v181 + 12) = 2080;
              os_log_t v260 = v179;
              unint64_t v184 = v75;
              uint64_t v185 = *(void *)(v178 + 16);
              unint64_t v186 = *(void *)(v178 + 24);
              swift_bridgeObjectRetain();
              uint64_t v266 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v185, v186, (uint64_t *)&v263);
              uint64_t v187 = v258;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              unint64_t v75 = v184;
              uint64_t v74 = v187;
              swift_bridgeObjectRelease();
              uint64_t v176 = v236;
              outlined destroy of NearbyProtoConnectionResponse.Content(v178, type metadata accessor for NearbyProtoConnectionRequest);
              os_log_t v188 = v260;
              _os_log_impl((void *)&_mh_execute_header, v260, (os_log_type_t)v262, "Got connection request: %s from: %s", (uint8_t *)v181, 0x16u);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
              outlined destroy of NearbyProtoConnectionResponse.Content((uint64_t)v177, type metadata accessor for NearbyProtoConnectionRequest);
              outlined destroy of NearbyProtoConnectionResponse.Content(v178, type metadata accessor for NearbyProtoConnectionRequest);
            }
            v202 = v237;
            if ((*(uint64_t (**)(void))((swift_isaMask & *v237) + 0x88))())
            {
              uint64_t v204 = v203;
              uint64_t v205 = swift_getObjectType();
              (*(void (**)(void *, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(v204 + 8))(v202, &protocol witness table for NearbyIDSServiceController, v176, v205, v204);
              swift_unknownObjectRelease();
            }
            outlined consume of Data?(v74, v75);
            v195 = type metadata accessor for NearbyProtoConnectionRequest;
            uint64_t v196 = v176;
            goto LABEL_96;
          case 4:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v138 = Logger.logObject.getter();
            os_log_type_t v139 = static os_log_type_t.info.getter();
            if (os_log_type_enabled(v138, v139))
            {
              v140 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v140 = 0;
              _os_log_impl((void *)&_mh_execute_header, v138, v139, "Handling connection response", v140, 2u);
              swift_slowDealloc();
            }

            v141 = (uint64_t *)(v104 + *(int *)(v256 + 28));
            uint64_t v142 = *v141;
            unint64_t v143 = v141[1];
            uint64_t v265 = 0;
            long long v263 = 0u;
            long long v264 = 0u;
            outlined copy of Data?(v142, v143);
            BinaryDecodingOptions.init()();
            lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(&lazy protocol witness table cache variable for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content, (void (*)(uint64_t))type metadata accessor for NearbyProtoConnectionResponse.Content);
            uint64_t v144 = (uint64_t)v246;
            uint64_t v145 = v245;
            Message.init(serializedData:extensions:partial:options:)();
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v239 + 56))(v144, 0, 1, v145);
            uint64_t v189 = v232;
            uint64_t v190 = outlined init with take of NearbyProtoSessionMessage(v144, v232, type metadata accessor for NearbyProtoConnectionResponse.Content);
            if ((*(uint64_t (**)(uint64_t))((swift_isaMask & *a6) + 0x88))(v190))
            {
              uint64_t v193 = v192;
              uint64_t v194 = swift_getObjectType();
              (*(void (**)(void *, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(v193 + 16))(a6, &protocol witness table for NearbyIDSServiceController, v189, v194, v193);
              swift_unknownObjectRelease();
            }
            outlined consume of Data?(v74, v75);
            v195 = type metadata accessor for NearbyProtoConnectionResponse.Content;
            uint64_t v196 = v189;
            goto LABEL_96;
          default:
            goto LABEL_39;
        }
      }
      return;
    case 3uLL:
      goto LABEL_21;
    default:
      if (!BYTE6(v75)) {
        goto LABEL_21;
      }
      goto LABEL_26;
  }
}

uint64_t sub_1000D3220@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x88))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1000D327C(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  long long v3 = *(uint64_t (**)(uint64_t, uint64_t))((swift_isaMask & **a2) + 0x90);
  uint64_t v4 = swift_unknownObjectRetain();
  return v3(v4, v2);
}

uint64_t sub_1000D32F0(void **a1)
{
  return (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0xA0))();
}

uint64_t sub_1000D3344(uint64_t a1, void **a2)
{
  outlined init with copy of (String, Any)(a1, (uint64_t)v4, &demangling cache variable for type metadata for FirewallProvider?);
  return (*(uint64_t (**)(unsigned char *))((swift_isaMask & **a2) + 0xA8))(v4);
}

uint64_t sub_1000D33B8@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0xB8))();
  *a2 = result;
  return result;
}

uint64_t sub_1000D3414(uint64_t a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((swift_isaMask & **a2) + 0xC0);
  uint64_t v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

unsigned char *storeEnumTagSinglePayload for IDSServiceError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x1000D3514);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for IDSServiceError()
{
  return &type metadata for IDSServiceError;
}

unsigned char *storeEnumTagSinglePayload for NearbyIDSServiceController.Errors(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x1000D3618);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for NearbyIDSServiceController.Errors()
{
  return &type metadata for NearbyIDSServiceController.Errors;
}

uint64_t outlined init with copy of NearbyProtoJoinRequest.Content(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t partial apply for closure #1 in closure #2 in NearbyIDSServiceController.sendJoinRequest(for:from:)(uint64_t a1)
{
  return closure #1 in closure #2 in NearbyIDSServiceController.sendJoinRequest(for:from:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

uint64_t partial apply for closure #1 in closure #2 in NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:)(uint64_t a1)
{
  return closure #1 in closure #2 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t partial apply for closure #1 in closure #1 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)(uint64_t *a1)
{
  return closure #1 in closure #1 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)(a1);
}

uint64_t outlined destroy of NearbyProtoConnectionResponse.Content(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t lazy protocol witness table accessor for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined init with take of NearbyProtoSessionMessage(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000D3820()
{
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 40);
  return _swift_deallocObject(v0, 80, 7);
}

uint64_t partial apply for closure #1 in closure #2 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)(uint64_t a1)
{
  return partial apply for closure #1 in closure #2 in NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:)(a1);
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t Data.description.getter()
{
  return Data.description.getter();
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.append(_:)()
{
  return Data.append(_:)();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.data.getter()
{
  return UUID.data.getter();
}

uint64_t UUID.init(data:)()
{
  return UUID.init(data:)();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t static UUID.== infix(_:_:)()
{
  return static UUID.== infix(_:_:)();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UUID.hashValue.getter()
{
  return UUID.hashValue.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t OwnerCredentials.init()()
{
  return OwnerCredentials.init()();
}

uint64_t type metadata accessor for OwnerCredentials()
{
  return type metadata accessor for OwnerCredentials();
}

uint64_t RequesterCredentials.init(ownerPublicKey:)()
{
  return RequesterCredentials.init(ownerPublicKey:)();
}

uint64_t type metadata accessor for RequesterCredentials()
{
  return type metadata accessor for RequesterCredentials();
}

uint64_t ABCReporter.init(domain:type:)()
{
  return ABCReporter.init(domain:type:)();
}

uint64_t dispatch thunk of ABCReporter.signature(subType:context:process:)()
{
  return dispatch thunk of ABCReporter.signature(subType:context:process:)();
}

uint64_t type metadata accessor for ABCReporter()
{
  return type metadata accessor for ABCReporter();
}

uint64_t CurrentSubject.init(wrappedValue:)()
{
  return CurrentSubject.init(wrappedValue:)();
}

uint64_t CurrentSubject.wrappedValue.modify()
{
  return CurrentSubject.wrappedValue.modify();
}

uint64_t CurrentSubject.wrappedValue.getter()
{
  return CurrentSubject.wrappedValue.getter();
}

uint64_t CurrentSubject.wrappedValue.setter()
{
  return CurrentSubject.wrappedValue.setter();
}

uint64_t CurrentSubject.projectedValue.getter()
{
  return CurrentSubject.projectedValue.getter();
}

uint64_t type metadata accessor for CurrentSubject()
{
  return type metadata accessor for CurrentSubject();
}

uint64_t AsyncSerialQueue.init(priority:bufferingPolicy:)()
{
  return AsyncSerialQueue.init(priority:bufferingPolicy:)();
}

uint64_t type metadata accessor for AsyncSerialQueue()
{
  return type metadata accessor for AsyncSerialQueue();
}

uint64_t dispatch thunk of XPCHostConnection.destroyConnection()()
{
  return dispatch thunk of XPCHostConnection.destroyConnection()();
}

uint64_t XPCHostConnection.init(connection:queue:)()
{
  return XPCHostConnection.init(connection:queue:)();
}

uint64_t XPCHostConnection.clientObject.getter()
{
  return XPCHostConnection.clientObject.getter();
}

uint64_t XPCHostConnection.queue.getter()
{
  return XPCHostConnection.queue.getter();
}

uint64_t Lock.withLock<A>(_:)()
{
  return Lock.withLock<A>(_:)();
}

Swift::Void __swiftcall Lock.assertOwned()()
{
}

Swift::Void __swiftcall Lock.assertNotOwned()()
{
}

Swift::Void __swiftcall Lock.lock()()
{
}

Swift::Void __swiftcall Lock.unlock()()
{
}

uint64_t Lock.init()()
{
  return Lock.init()();
}

uint64_t type metadata accessor for Lock()
{
  return type metadata accessor for Lock();
}

uint64_t NearbyGroupMember.init(handle:tokenID:)()
{
  return NearbyGroupMember.init(handle:tokenID:)();
}

uint64_t NearbyGroupMember.handle.getter()
{
  return NearbyGroupMember.handle.getter();
}

uint64_t NearbyGroupMember.tokenID.getter()
{
  return NearbyGroupMember.tokenID.getter();
}

uint64_t type metadata accessor for NearbyGroupMember()
{
  return type metadata accessor for NearbyGroupMember();
}

uint64_t NearbyAdvertisement.identifier.getter()
{
  return NearbyAdvertisement.identifier.getter();
}

uint64_t static NearbyAdvertisement.meContactID.getter()
{
  return static NearbyAdvertisement.meContactID.getter();
}

uint64_t NearbyAdvertisement.handle.getter()
{
  return NearbyAdvertisement.handle.getter();
}

uint64_t NearbyAdvertisement.userInfo.getter()
{
  return NearbyAdvertisement.userInfo.getter();
}

uint64_t NearbyAdvertisement.contactID.getter()
{
  return NearbyAdvertisement.contactID.getter();
}

uint64_t dispatch thunk of NearbyAdvertisement.__allocating_init(scannerID:identifier:activityType:contactID:handle:displayName:userInfo:deviceColor:deviceModel:deviceID:)()
{
  return dispatch thunk of NearbyAdvertisement.__allocating_init(scannerID:identifier:activityType:contactID:handle:displayName:userInfo:deviceColor:deviceModel:deviceID:)();
}

uint64_t NearbyAdvertisement.init(scannerID:identifier:activityType:contactID:handle:displayName:userInfo:deviceColor:deviceModel:deviceID:)()
{
  return NearbyAdvertisement.init(scannerID:identifier:activityType:contactID:handle:displayName:userInfo:deviceColor:deviceModel:deviceID:)();
}

uint64_t type metadata accessor for NearbyAdvertisement()
{
  return type metadata accessor for NearbyAdvertisement();
}

uint64_t NearbyInvitationData.hostConnectionInfo.getter()
{
  return NearbyInvitationData.hostConnectionInfo.getter();
}

uint64_t NearbyInvitationData.userInfo.getter()
{
  return NearbyInvitationData.userInfo.getter();
}

uint64_t NearbyGroupConnectionInfo.init(id:endpoint:localMember:)()
{
  return NearbyGroupConnectionInfo.init(id:endpoint:localMember:)();
}

uint64_t type metadata accessor for NearbyGroupConnectionInfo()
{
  return type metadata accessor for NearbyGroupConnectionInfo();
}

uint64_t NearbyAdvertisementRequest.identifier.getter()
{
  return NearbyAdvertisementRequest.identifier.getter();
}

uint64_t NearbyAdvertisementRequest.activityType.getter()
{
  return NearbyAdvertisementRequest.activityType.getter();
}

uint64_t NearbyAdvertisementRequest.route.getter()
{
  return NearbyAdvertisementRequest.route.getter();
}

uint64_t type metadata accessor for NearbyAdvertisementRequest()
{
  return type metadata accessor for NearbyAdvertisementRequest();
}

uint64_t NearbyGroupCreationRequest.id.getter()
{
  return NearbyGroupCreationRequest.id.getter();
}

uint64_t NearbyGroupCreationRequest.members.getter()
{
  return NearbyGroupCreationRequest.members.getter();
}

uint64_t NearbyInvitationParameters.browserType.getter()
{
  return NearbyInvitationParameters.browserType.getter();
}

uint64_t NearbyInvitationParameters.serviceName.getter()
{
  return NearbyInvitationParameters.serviceName.getter();
}

uint64_t NearbyInvitationParameters.routeType.getter()
{
  return NearbyInvitationParameters.routeType.getter();
}

uint64_t NearbyInvitationActivityType.rawValue.getter()
{
  return NearbyInvitationActivityType.rawValue.getter();
}

uint64_t NearbyInvitationJoinRequestMetadata.pseudonym.getter()
{
  return NearbyInvitationJoinRequestMetadata.pseudonym.getter();
}

uint64_t NearbyInvitationJoinRequestMetadata.publicKey.getter()
{
  return NearbyInvitationJoinRequestMetadata.publicKey.getter();
}

uint64_t NearbyInvitationJoinRequestMetadata.init(publicKey:pseudonym:)()
{
  return NearbyInvitationJoinRequestMetadata.init(publicKey:pseudonym:)();
}

uint64_t type metadata accessor for NearbyInvitationJoinRequestMetadata()
{
  return type metadata accessor for NearbyInvitationJoinRequestMetadata();
}

uint64_t InvitationBlob.init(invitationID:dataBlob:)()
{
  return InvitationBlob.init(invitationID:dataBlob:)();
}

uint64_t type metadata accessor for InvitationBlob()
{
  return type metadata accessor for InvitationBlob();
}

uint64_t InvitationRequestData.invitationData.getter()
{
  return InvitationRequestData.invitationData.getter();
}

uint64_t InvitationRequestData.init(invitationData:id:pseudo:)()
{
  return InvitationRequestData.init(invitationData:id:pseudo:)();
}

uint64_t InvitationRequestData.id.getter()
{
  return InvitationRequestData.id.getter();
}

uint64_t type metadata accessor for InvitationRequestData()
{
  return type metadata accessor for InvitationRequestData();
}

uint64_t InvitationJoinResponse.memberHandles.getter()
{
  return InvitationJoinResponse.memberHandles.getter();
}

uint64_t InvitationJoinResponse.sessionIdentifier.getter()
{
  return InvitationJoinResponse.sessionIdentifier.getter();
}

uint64_t static InvitationJoinResponse.denied.getter()
{
  return static InvitationJoinResponse.denied.getter();
}

uint64_t static InvitationJoinResponse.approved(sessionIdentifier:memberHandles:userInfo:)()
{
  return static InvitationJoinResponse.approved(sessionIdentifier:memberHandles:userInfo:)();
}

uint64_t InvitationJoinResponse.userInfo.getter()
{
  return InvitationJoinResponse.userInfo.getter();
}

uint64_t type metadata accessor for InvitationJoinResponse()
{
  return type metadata accessor for InvitationJoinResponse();
}

uint64_t InvitationApprovalRequest.remoteInvitationData.getter()
{
  return InvitationApprovalRequest.remoteInvitationData.getter();
}

uint64_t InvitationApprovalRequest.displayName.getter()
{
  return InvitationApprovalRequest.displayName.getter();
}

uint64_t InvitationApprovalRequest.userInfo.getter()
{
  return InvitationApprovalRequest.userInfo.getter();
}

uint64_t type metadata accessor for InvitationApprovalRequest()
{
  return type metadata accessor for InvitationApprovalRequest();
}

uint64_t IncomingInvitationJoinRequest.invitationID.getter()
{
  return IncomingInvitationJoinRequest.invitationID.getter();
}

uint64_t IncomingInvitationJoinRequest.init(invitationID:remotePseudonym:destinationToken:remotePublicKey:displayName:userInfo:hostInfo:)()
{
  return IncomingInvitationJoinRequest.init(invitationID:remotePseudonym:destinationToken:remotePublicKey:displayName:userInfo:hostInfo:)();
}

uint64_t IncomingInvitationJoinRequest.remotePseudonym.getter()
{
  return IncomingInvitationJoinRequest.remotePseudonym.getter();
}

uint64_t IncomingInvitationJoinRequest.remotePublicKey.getter()
{
  return IncomingInvitationJoinRequest.remotePublicKey.getter();
}

uint64_t IncomingInvitationJoinRequest.destinationToken.getter()
{
  return IncomingInvitationJoinRequest.destinationToken.getter();
}

uint64_t dispatch thunk of IncomingInvitationJoinRequest.hostInfo.getter()
{
  return dispatch thunk of IncomingInvitationJoinRequest.hostInfo.getter();
}

uint64_t type metadata accessor for IncomingInvitationJoinRequest()
{
  return type metadata accessor for IncomingInvitationJoinRequest();
}

uint64_t UnknownStorage.traverse<A>(visitor:)()
{
  return UnknownStorage.traverse<A>(visitor:)();
}

uint64_t UnknownStorage.init()()
{
  return UnknownStorage.init()();
}

uint64_t type metadata accessor for UnknownStorage()
{
  return type metadata accessor for UnknownStorage();
}

uint64_t BinaryDecodingOptions.init()()
{
  return BinaryDecodingOptions.init()();
}

uint64_t type metadata accessor for BinaryDecodingOptions()
{
  return type metadata accessor for BinaryDecodingOptions();
}

uint64_t dispatch thunk of Decoder.nextFieldNumber()()
{
  return dispatch thunk of Decoder.nextFieldNumber()();
}

uint64_t dispatch thunk of Decoder.handleConflictingOneOf()()
{
  return dispatch thunk of Decoder.handleConflictingOneOf()();
}

uint64_t dispatch thunk of Decoder.decodeSingularBoolField(value:)()
{
  return dispatch thunk of Decoder.decodeSingularBoolField(value:)();
}

{
  return dispatch thunk of Decoder.decodeSingularBoolField(value:)();
}

uint64_t dispatch thunk of Decoder.decodeSingularEnumField<A>(value:)()
{
  return dispatch thunk of Decoder.decodeSingularEnumField<A>(value:)();
}

uint64_t dispatch thunk of Decoder.decodeSingularBytesField(value:)()
{
  return dispatch thunk of Decoder.decodeSingularBytesField(value:)();
}

{
  return dispatch thunk of Decoder.decodeSingularBytesField(value:)();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedStringField(value:)()
{
  return dispatch thunk of Decoder.decodeRepeatedStringField(value:)();
}

uint64_t dispatch thunk of Decoder.decodeSingularStringField(value:)()
{
  return dispatch thunk of Decoder.decodeSingularStringField(value:)();
}

{
  return dispatch thunk of Decoder.decodeSingularStringField(value:)();
}

uint64_t dispatch thunk of Decoder.decodeSingularUInt32Field(value:)()
{
  return dispatch thunk of Decoder.decodeSingularUInt32Field(value:)();
}

uint64_t dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)()
{
  return dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)();
}

uint64_t dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)()
{
  return dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)();
}

uint64_t Message.init(serializedData:extensions:partial:options:)()
{
  return Message.init(serializedData:extensions:partial:options:)();
}

uint64_t Message.serializedData(partial:)()
{
  return Message.serializedData(partial:)();
}

uint64_t Message.debugDescription.getter()
{
  return Message.debugDescription.getter();
}

uint64_t static Message.with(_:)()
{
  return static Message.with(_:)();
}

uint64_t dispatch thunk of Visitor.visitSingularBoolField(value:fieldNumber:)()
{
  return dispatch thunk of Visitor.visitSingularBoolField(value:fieldNumber:)();
}

uint64_t dispatch thunk of Visitor.visitSingularEnumField<A>(value:fieldNumber:)()
{
  return dispatch thunk of Visitor.visitSingularEnumField<A>(value:fieldNumber:)();
}

uint64_t dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)()
{
  return dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)();
}

uint64_t dispatch thunk of Visitor.visitRepeatedStringField(value:fieldNumber:)()
{
  return dispatch thunk of Visitor.visitRepeatedStringField(value:fieldNumber:)();
}

uint64_t dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)()
{
  return dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)();
}

uint64_t dispatch thunk of Visitor.visitSingularUInt32Field(value:fieldNumber:)()
{
  return dispatch thunk of Visitor.visitSingularUInt32Field(value:fieldNumber:)();
}

uint64_t dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)()
{
  return dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:)();
}

uint64_t dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)()
{
  return dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)();
}

uint64_t type metadata accessor for _NameMap.NameDescription()
{
  return type metadata accessor for _NameMap.NameDescription();
}

uint64_t _NameMap.init(dictionaryLiteral:)()
{
  return _NameMap.init(dictionaryLiteral:)();
}

uint64_t _NameMap.init()()
{
  return _NameMap.init()();
}

uint64_t type metadata accessor for _NameMap()
{
  return type metadata accessor for _NameMap();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t XPC_ARRAY_APPEND.getter()
{
  return XPC_ARRAY_APPEND.getter();
}

uint64_t CustomCombineIdentifierConvertible<>.combineIdentifier.getter()
{
  return CustomCombineIdentifierConvertible<>.combineIdentifier.getter();
}

uint64_t type metadata accessor for Publishers.PrefetchStrategy()
{
  return type metadata accessor for Publishers.PrefetchStrategy();
}

uint64_t dispatch thunk of Cancellable.cancel()()
{
  return dispatch thunk of Cancellable.cancel()();
}

uint64_t static Subscribers.Demand.== infix(_:_:)()
{
  return static Subscribers.Demand.== infix(_:_:)();
}

uint64_t static Subscribers.Demand.none.getter()
{
  return static Subscribers.Demand.none.getter();
}

uint64_t static Subscribers.Demand.unlimited.getter()
{
  return static Subscribers.Demand.unlimited.getter();
}

uint64_t dispatch thunk of Subscription.request(_:)()
{
  return dispatch thunk of Subscription.request(_:)();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

uint64_t type metadata accessor for AnyCancellable()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t AsyncPublisher.makeAsyncIterator()()
{
  return AsyncPublisher.makeAsyncIterator()();
}

uint64_t dispatch thunk of ObservableObject.objectWillChange.getter()
{
  return dispatch thunk of ObservableObject.objectWillChange.getter();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t PassthroughSubject.send(completion:)()
{
  return PassthroughSubject.send(completion:)();
}

uint64_t PassthroughSubject.send(_:)()
{
  return PassthroughSubject.send(_:)();
}

uint64_t PassthroughSubject.init()()
{
  return PassthroughSubject.init()();
}

uint64_t AsyncThrowingPublisher.makeAsyncIterator()()
{
  return AsyncThrowingPublisher.makeAsyncIterator()();
}

Swift::Void __swiftcall ObservableObjectPublisher.send()()
{
}

uint64_t type metadata accessor for ObservableObjectPublisher()
{
  return type metadata accessor for ObservableObjectPublisher();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t Published.projectedValue.getter()
{
  return Published.projectedValue.getter();
}

uint64_t Published.projectedValue.setter()
{
  return Published.projectedValue.setter();
}

uint64_t static Published.subscript.modify()
{
  return static Published.subscript.modify();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t Publisher.compactMap<A>(_:)()
{
  return Publisher.compactMap<A>(_:)();
}

uint64_t Publisher.buffer(size:prefetch:whenFull:)()
{
  return Publisher.buffer(size:prefetch:whenFull:)();
}

uint64_t Publisher.values.getter()
{
  return Publisher.values.getter();
}

uint64_t Publisher.subscribe<A>(_:)()
{
  return Publisher.subscribe<A>(_:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t Publisher<>.values.getter()
{
  return Publisher<>.values.getter();
}

uint64_t NWEndpoint.deviceColor.getter()
{
  return NWEndpoint.deviceColor.getter();
}

uint64_t NWEndpoint.deviceModel.getter()
{
  return NWEndpoint.deviceModel.getter();
}

uint64_t NWEndpoint.debugDescription.getter()
{
  return NWEndpoint.debugDescription.getter();
}

uint64_t NWEndpoint.endpointUUID()()
{
  return NWEndpoint.endpointUUID()();
}

uint64_t NWEndpoint.deviceID.getter()
{
  return NWEndpoint.deviceID.getter();
}

uint64_t NWEndpoint.contactID.getter()
{
  return NWEndpoint.contactID.getter();
}

uint64_t type metadata accessor for NWEndpoint()
{
  return type metadata accessor for NWEndpoint();
}

uint64_t NWListener.stateUpdateHandler.setter()
{
  return NWListener.stateUpdateHandler.setter();
}

uint64_t NWListener.newConnectionHandler.setter()
{
  return NWListener.newConnectionHandler.setter();
}

uint64_t type metadata accessor for NWListener.State()
{
  return type metadata accessor for NWListener.State();
}

uint64_t NWListener.start(queue:)()
{
  return NWListener.start(queue:)();
}

Swift::Void __swiftcall NWListener.cancel()()
{
}

uint64_t NWListener.Service.init(applicationService:invitation:)()
{
  return NWListener.Service.init(applicationService:invitation:)();
}

uint64_t type metadata accessor for NWListener.Service.Invitation.Route()
{
  return type metadata accessor for NWListener.Service.Invitation.Route();
}

uint64_t type metadata accessor for NWListener.Service.Invitation.Scope()
{
  return type metadata accessor for NWListener.Service.Invitation.Scope();
}

uint64_t static NWListener.Service.Invitation.wrangler(route:scope:)()
{
  return static NWListener.Service.Invitation.wrangler(route:scope:)();
}

uint64_t type metadata accessor for NWListener.Service.Invitation()
{
  return type metadata accessor for NWListener.Service.Invitation();
}

uint64_t type metadata accessor for NWListener.Service()
{
  return type metadata accessor for NWListener.Service();
}

uint64_t NWListener.__allocating_init(service:using:)()
{
  return NWListener.__allocating_init(service:using:)();
}

uint64_t type metadata accessor for NWListener()
{
  return type metadata accessor for NWListener();
}

uint64_t NWConnection.ContentContext.init(identifier:expiration:priority:isFinal:antecedent:metadata:)()
{
  return NWConnection.ContentContext.init(identifier:expiration:priority:isFinal:antecedent:metadata:)();
}

uint64_t dispatch thunk of NWConnection.ContentContext.protocolMetadata(definition:)()
{
  return dispatch thunk of NWConnection.ContentContext.protocolMetadata(definition:)();
}

uint64_t type metadata accessor for NWConnection.ContentContext()
{
  return type metadata accessor for NWConnection.ContentContext();
}

uint64_t type metadata accessor for NWConnection.SendCompletion()
{
  return type metadata accessor for NWConnection.SendCompletion();
}

uint64_t NWConnection.receiveMessage(completion:)()
{
  return NWConnection.receiveMessage(completion:)();
}

uint64_t NWConnection.stateUpdateHandler.setter()
{
  return NWConnection.stateUpdateHandler.setter();
}

uint64_t NWConnection.init(to:using:)()
{
  return NWConnection.init(to:using:)();
}

uint64_t NWConnection.send(content:contentContext:isComplete:completion:)()
{
  return NWConnection.send(content:contentContext:isComplete:completion:)();
}

uint64_t static NWConnection.State.== infix(_:_:)()
{
  return static NWConnection.State.== infix(_:_:)();
}

uint64_t type metadata accessor for NWConnection.State()
{
  return type metadata accessor for NWConnection.State();
}

uint64_t NWConnection.start(queue:)()
{
  return NWConnection.start(queue:)();
}

Swift::Void __swiftcall NWConnection.cancel()()
{
}

uint64_t NWConnection.endpoint.getter()
{
  return NWConnection.endpoint.getter();
}

uint64_t type metadata accessor for NWConnection()
{
  return type metadata accessor for NWConnection();
}

uint64_t dispatch thunk of NWParameters.ProtocolStack.applicationProtocols.modify()
{
  return dispatch thunk of NWParameters.ProtocolStack.applicationProtocols.modify();
}

uint64_t NWParameters.defaultProtocolStack.getter()
{
  return NWParameters.defaultProtocolStack.getter();
}

uint64_t type metadata accessor for NWParameters()
{
  return type metadata accessor for NWParameters();
}

uint64_t NWParameters.__allocating_init(_:)()
{
  return NWParameters.__allocating_init(_:)();
}

uint64_t NWProtocolFramer.Definition.init(implementation:)()
{
  return NWProtocolFramer.Definition.init(implementation:)();
}

uint64_t type metadata accessor for NWProtocolFramer.Definition()
{
  return type metadata accessor for NWProtocolFramer.Definition();
}

uint64_t type metadata accessor for NWProtocolFramer.StartResult()
{
  return type metadata accessor for NWProtocolFramer.StartResult();
}

uint64_t dispatch thunk of NWProtocolFramer.Message.__allocating_init(definition:)()
{
  return dispatch thunk of NWProtocolFramer.Message.__allocating_init(definition:)();
}

uint64_t type metadata accessor for NWProtocolFramer.Message()
{
  return type metadata accessor for NWProtocolFramer.Message();
}

uint64_t dispatch thunk of NWProtocolFramer.Message.subscript.getter()
{
  return dispatch thunk of NWProtocolFramer.Message.subscript.getter();
}

uint64_t dispatch thunk of NWProtocolFramer.Message.subscript.setter()
{
  return dispatch thunk of NWProtocolFramer.Message.subscript.setter();
}

uint64_t NWProtocolFramer.Options.init(definition:)()
{
  return NWProtocolFramer.Options.init(definition:)();
}

uint64_t type metadata accessor for NWProtocolFramer.Options()
{
  return type metadata accessor for NWProtocolFramer.Options();
}

uint64_t NWProtocolFramer.Instance.parseInput(minimumIncompleteLength:maximumLength:parse:)()
{
  return NWProtocolFramer.Instance.parseInput(minimumIncompleteLength:maximumLength:parse:)();
}

uint64_t NWProtocolFramer.Instance.writeOutput(data:)()
{
  return NWProtocolFramer.Instance.writeOutput(data:)();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NWProtocolFramer.Instance.writeOutputNoCopy(length:)(Swift::Int length)
{
}

uint64_t NWProtocolFramer.Instance.deliverInputNoCopy(length:message:isComplete:)()
{
  return NWProtocolFramer.Instance.deliverInputNoCopy(length:message:isComplete:)();
}

uint64_t type metadata accessor for NWProtocolOptions()
{
  return type metadata accessor for NWProtocolOptions();
}

uint64_t type metadata accessor for NWError()
{
  return type metadata accessor for NWError();
}

uint64_t type metadata accessor for NWBrowser.Descriptor()
{
  return type metadata accessor for NWBrowser.Descriptor();
}

uint64_t type metadata accessor for NWBrowser.Invitation.Scope()
{
  return type metadata accessor for NWBrowser.Invitation.Scope();
}

uint64_t static NWBrowser.Invitation.wrangler(scope:)()
{
  return static NWBrowser.Invitation.wrangler(scope:)();
}

uint64_t NWBrowser.stateUpdateHandler.setter()
{
  return NWBrowser.stateUpdateHandler.setter();
}

uint64_t NWBrowser.browseResultsChangedHandler.setter()
{
  return NWBrowser.browseResultsChangedHandler.setter();
}

uint64_t NWBrowser.init(for:using:)()
{
  return NWBrowser.init(for:using:)();
}

uint64_t type metadata accessor for NWBrowser.State()
{
  return type metadata accessor for NWBrowser.State();
}

uint64_t NWBrowser.start(queue:)()
{
  return NWBrowser.start(queue:)();
}

uint64_t type metadata accessor for NWBrowser.Result.Change()
{
  return type metadata accessor for NWBrowser.Result.Change();
}

uint64_t NWBrowser.Result.endpoint.getter()
{
  return NWBrowser.Result.endpoint.getter();
}

uint64_t type metadata accessor for NWBrowser.Result()
{
  return type metadata accessor for NWBrowser.Result();
}

Swift::Void __swiftcall NWBrowser.cancel()()
{
}

uint64_t type metadata accessor for NWBrowser()
{
  return type metadata accessor for NWBrowser();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t DispatchWorkItem.init(flags:block:)()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t dispatch thunk of DispatchWorkItem.cancel()()
{
  return dispatch thunk of DispatchWorkItem.cancel()();
}

uint64_t type metadata accessor for DispatchWorkItem()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

uint64_t Array.init()()
{
  return Array.init()();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t Dictionary.Values.description.getter()
{
  return Dictionary.Values.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t BidirectionalCollection.difference<A>(from:by:)()
{
  return BidirectionalCollection.difference<A>(from:by:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(data:encoding:)()
{
  return String.init(data:encoding:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

Swift::String __swiftcall String.lowercased()()
{
  uint64_t v0 = String.lowercased()();
  result._object = v1;
  result._uint64_t countAndFlagsBits = v0;
  return result;
}

uint64_t String.init<A>(reflecting:)()
{
  return String.init<A>(reflecting:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t Sequence.first(where:)()
{
  return Sequence.first(where:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t Array._checkSubscript(_:wasNativeTypeChecked:)()
{
  return Array._checkSubscript(_:wasNativeTypeChecked:)();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return static Array._allocateUninitialized(_:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

Swift::Bool __swiftcall Array._hoistableIsNativeTypeChecked()()
{
  return Array._hoistableIsNativeTypeChecked()();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t Array.append(_:)()
{
  return Array.append(_:)();
}

uint64_t Array.endIndex.getter()
{
  return Array.endIndex.getter();
}

Swift::Void __swiftcall Array.removeAll(keepingCapacity:)(Swift::Bool keepingCapacity)
{
}

uint64_t type metadata accessor for Array()
{
  return type metadata accessor for Array();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static TaskPriority.background.getter()
{
  return static TaskPriority.background.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return AsyncStream.Continuation.yield(_:)();
}

Swift::Void __swiftcall AsyncStream.Continuation.finish()()
{
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return AsyncStream.makeAsyncIterator()();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

uint64_t Task<>.reportFailure(on:function:process:)()
{
  return Task<>.reportFailure(on:function:process:)();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t static Task<>.isCancelled.getter()
{
  return static Task<>.isCancelled.getter();
}

uint64_t static Task<>.checkCancellation()()
{
  return static Task<>.checkCancellation()();
}

uint64_t type metadata accessor for UnsafeContinuation()
{
  return type metadata accessor for UnsafeContinuation();
}

uint64_t Double.write<A>(to:)()
{
  return Double.write<A>(to:)();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.description.getter()
{
  return Set.description.getter();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Index._asCocoa.modify()
{
  return Set.Index._asCocoa.modify();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return dispatch thunk of Collection.count.getter();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return dispatch thunk of Collection.formIndex(after:)();
}

uint64_t Collection.isEmpty.getter()
{
  return Collection.isEmpty.getter();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t RangeReplaceableCollection.removeFirst()()
{
  return RangeReplaceableCollection.removeFirst()();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t NSXPCConnection.bundleIdentifier.getter()
{
  return NSXPCConnection.bundleIdentifier.getter();
}

uint64_t NSXPCConnection.isEntitledToUseNearbyInvitations.getter()
{
  return NSXPCConnection.isEntitledToUseNearbyInvitations.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t Optional.debugDescription.getter()
{
  return Optional.debugDescription.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.Index.handleBitPattern.getter()
{
  return __CocoaSet.Index.handleBitPattern.getter();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.contains(_:)()
{
  return __CocoaSet.contains(_:)();
}

uint64_t __CocoaSet.formIndex(after:isUnique:)()
{
  return __CocoaSet.formIndex(after:isUnique:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _ArrayBuffer._getElementSlowPath(_:)()
{
  return _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t ContiguousArray.append(_:)()
{
  return ContiguousArray.append(_:)();
}

uint64_t ContiguousArray.init()()
{
  return ContiguousArray.init()();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return type metadata accessor for ContiguousArray();
}

uint64_t type metadata accessor for ContinuousClock.Instant()
{
  return type metadata accessor for ContinuousClock.Instant();
}

uint64_t ContinuousClock.init()()
{
  return ContinuousClock.init()();
}

uint64_t type metadata accessor for ContinuousClock()
{
  return type metadata accessor for ContinuousClock();
}

uint64_t dispatch thunk of InstantProtocol.advanced(by:)()
{
  return dispatch thunk of InstantProtocol.advanced(by:)();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t dispatch thunk of Clock.now.getter()
{
  return dispatch thunk of Clock.now.getter();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t print(_:separator:terminator:)()
{
  return print(_:separator:terminator:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt16 a1)
{
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t static Duration.seconds(_:)()
{
  return static Duration.seconds(_:)();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t IDSCopyAddressDestinationForDestination()
{
  return _IDSCopyAddressDestinationForDestination();
}

uint64_t IDSCopyBestGuessIDForID()
{
  return _IDSCopyBestGuessIDForID();
}

uint64_t IDSCopyIDForTokenWithID()
{
  return _IDSCopyIDForTokenWithID();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return _IDSCopyRawAddressForDestination();
}

uint64_t IMGetConferenceSettings()
{
  return _IMGetConferenceSettings();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _TUIsInternalInstall()
{
  return __TUIsInternalInstall();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

nw_parameters_t nw_parameters_create_application_service(void)
{
  return _nw_parameters_create_application_service();
}

uint64_t nw_parameters_set_required_netagent_classes()
{
  return _nw_parameters_set_required_netagent_classes();
}

uint64_t nw_parameters_set_server_mode()
{
  return _nw_parameters_set_server_mode();
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_resume()
{
  return _swift_continuation_resume();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unexpectedError()
{
  return _swift_unexpectedError();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

uint64_t voucher_adopt()
{
  return _voucher_adopt();
}

uint64_t voucher_copy()
{
  return _voucher_copy();
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}