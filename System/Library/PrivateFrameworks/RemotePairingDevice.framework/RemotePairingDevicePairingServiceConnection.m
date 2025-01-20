@interface RemotePairingDevicePairingServiceConnection
- (BOOL)deleteAllPairingRecordsAndReturnError:(id *)a3;
- (BOOL)deletePairingRecordForHostWithIdentifier:(id)a3 error:(id *)a4;
- (_TtC19RemotePairingDevice43RemotePairingDevicePairingServiceConnection)init;
- (id)trustedHostInfoAndReturnError:(id *)a3;
- (int64_t)getUSBConectedHostTrustStateWithError:(id *)a3;
- (void)allowPromptlessPairingForAutomation:(BOOL)a3 forBUID:(id)a4 withQueue:(id)a5 completion:(id)a6;
- (void)deleteAllPairingRecordsWithInvokingCompletionHandlerOn:(id)a3 completion:(id)a4;
- (void)deletePairingRecordWithUuid:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)initiateWirelessPairingSessionWithQueue:(id)a3 completionHandler:(id)a4 customPinHandler:(id)a5;
@end

@implementation RemotePairingDevicePairingServiceConnection

- (_TtC19RemotePairingDevice43RemotePairingDevicePairingServiceConnection)init
{
  return (_TtC19RemotePairingDevice43RemotePairingDevicePairingServiceConnection *)RemotePairingDevicePairingServiceConnection.init()();
}

- (BOOL)deleteAllPairingRecordsAndReturnError:(id *)a3
{
  v4 = self;
  RemotePairingDevicePairingServiceConnection.deleteAllPairingRecords()();

  if (v5)
  {
    if (a3)
    {
      v6 = (void *)sub_1D765FD50();

      id v7 = v6;
      *a3 = v6;
    }
    else
    {
    }
  }
  return v5 == 0;
}

- (BOOL)deletePairingRecordForHostWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_1D765FFD0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D765FFC0();
  v9 = self;
  RemotePairingDevicePairingServiceConnection.deletePairingRecord(forHostWithIdentifier:)((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (void)deletePairingRecordWithUuid:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_1D765FFD0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D765FFC0();
  *(void *)(swift_allocObject() + 16) = v7;
  id v12 = a4;
  v13 = self;
  RemotePairingDevicePairingServiceConnection.deletePairingRecord(uuid:queue:completion:)();

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)deleteAllPairingRecordsWithInvokingCompletionHandlerOn:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v6;
  id v7 = a3;
  uint64_t v8 = self;
  RemotePairingDevicePairingServiceConnection.deleteAllPairingRecords(invokingCompletionHandlerOn:completion:)();

  swift_release();
}

- (id)trustedHostInfoAndReturnError:(id *)a3
{
  v3 = self;
  RemotePairingDevicePairingServiceConnection.trustedHostInfo()();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA82B7E0);
  v4 = (void *)sub_1D7660CE0();
  swift_bridgeObjectRelease();
  return v4;
}

- (int64_t)getUSBConectedHostTrustStateWithError:(id *)a3
{
  v3 = self;
  int64_t v4 = RemotePairingDevicePairingServiceConnection.getUSBConnectedHostState(with:)();

  return v4;
}

- (void)allowPromptlessPairingForAutomation:(BOOL)a3 forBUID:(id)a4 withQueue:(id)a5 completion:(id)a6
{
  BOOL v7 = a3;
  uint64_t v9 = _Block_copy(a6);
  uint64_t v10 = sub_1D7660B10();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  id v14 = a5;
  v15 = self;
  RemotePairingDevicePairingServiceConnection.allowPromptlessPairingForHost(pairingShouldBeMarkedForAutomation:forBUID:withQueue:completion:)(v7, v10, v12, (uint64_t)a5, (uint64_t)sub_1D75AB824, v13);

  swift_bridgeObjectRelease();
  swift_release();
}

- (void)initiateWirelessPairingSessionWithQueue:(id)a3 completionHandler:(id)a4 customPinHandler:(id)a5
{
  uint64_t v8 = _Block_copy(a4);
  uint64_t v9 = _Block_copy(a5);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  if (v9)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v9;
    uint64_t v9 = sub_1D75AB81C;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = a3;
  uint64_t v13 = self;
  RemotePairingDevicePairingServiceConnection.initiateWirelessPairingSession(withQueue:completionHandler:customPinHandler:)(v12, (uint64_t)sub_1D75AB814, v10, (uint64_t)v9, v11);
  sub_1D75940A4((uint64_t)v9);

  swift_release();
}

- (void).cxx_destruct
{
}

@end