@interface TUCallContainer
- (BOOL)allCallsAreOfService:(int)a3;
- (BOOL)allCallsPassTest:(id)a3;
- (BOOL)anyCallIsEndpointOnCurrentDevice;
- (BOOL)anyCallIsHostedOnCurrentDevice;
- (BOOL)anyCallPassesTest:(id)a3;
- (BOOL)existingCallsHaveMultipleProviders;
- (BOOL)hasCurrentAudioCalls;
- (BOOL)hasCurrentCalls;
- (BOOL)hasCurrentVideoCalls;
- (NSArray)bargeCalls;
- (NSArray)callGroupsOnDefaultPairedDevice;
- (NSArray)calls;
- (NSArray)callsHostedElsewhere;
- (NSArray)callsHostedOrAnEndpointElsewhere;
- (NSArray)callsOnDefaultPairedDevice;
- (NSArray)callsWithAnEndpointElsewhere;
- (NSArray)conferenceParticipantCalls;
- (NSArray)currentAudioAndVideoCallGroups;
- (NSArray)currentAudioAndVideoCalls;
- (NSArray)currentCallGroups;
- (NSArray)currentCalls;
- (NSArray)currentVideoCalls;
- (NSArray)displayedAudioAndVideoCalls;
- (NSArray)displayedCalls;
- (NSArray)incomingCalls;
- (TUCall)activeVideoCall;
- (TUCall)currentVideoCall;
- (TUCall)frontmostBargeCall;
- (TUCall)incomingCall;
- (TUCall)incomingVideoCall;
- (TUCall)screeningCall;
- (TUCallContainer)init;
- (TUCallContainer)initWithCalls:(id)a3;
- (id)_callGroupsFromCalls:(id)a3;
- (id)audioAndVideoCallsWithStatus:(int)a3;
- (id)audioOrVideoCallWithStatus:(int)a3;
- (id)bargeCallWithStatus:(int)a3;
- (id)bargeCallWithUniqueProxyIdentifier:(id)a3;
- (id)bargeCallsPassingTest:(id)a3;
- (id)callPassingTest:(id)a3;
- (id)callPassingTest:(id)a3 sortedUsingComparator:(id)a4;
- (id)callPassingTest:(id)a3 withOptions:(unint64_t)a4;
- (id)callWithCallUUID:(id)a3;
- (id)callWithStatus:(int)a3;
- (id)callWithUniqueProxyIdentifier:(id)a3;
- (id)callsPassingTest:(id)a3;
- (id)callsWithGroupUUID:(id)a3;
- (id)callsWithStatus:(int)a3;
- (id)conferenceCall;
- (id)displayedCall;
- (id)displayedCallFromCalls:(id)a3;
- (id)frontmostAudioOrVideoCall;
- (id)frontmostCall;
- (id)videoCallWithStatus:(int)a3;
- (unint64_t)callCountOnDefaultPairedDevice;
- (unint64_t)countOfCallsPassingTest:(id)a3;
- (unint64_t)currentAudioAndVideoCallCount;
- (unint64_t)currentCallCount;
- (unint64_t)currentVideoCallCount;
- (void)enumerateBargeCallsInvokingBlock:(id)a3 forCallsPassingTest:(id)a4;
- (void)enumerateCallsInvokingBlock:(id)a3 forCallsPassingTest:(id)a4;
- (void)enumerateCallsWithOptions:(unint64_t)a3 invokingBlock:(id)a4 forCallsPassingTest:(id)a5;
- (void)setCalls:(id)a3;
@end

@implementation TUCallContainer

- (void).cxx_destruct
{
}

- (unint64_t)currentCallCount
{
  return [(TUCallContainer *)self countOfCallsPassingTest:TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate];
}

- (id)callPassingTest:(id)a3 withOptions:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__2;
  v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__TUCallContainer_callPassingTest_withOptions___block_invoke;
  v9[3] = &unk_1E58E6B00;
  v9[4] = &v10;
  [(TUCallContainer *)self enumerateCallsWithOptions:a4 invokingBlock:v9 forCallsPassingTest:v6];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (unint64_t)countOfCallsPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__TUCallContainer_countOfCallsPassingTest___block_invoke;
  v7[3] = &unk_1E58E6B00;
  v7[4] = &v8;
  [(TUCallContainer *)self enumerateCallsInvokingBlock:v7 forCallsPassingTest:v4];
  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)enumerateCallsWithOptions:(unint64_t)a3 invokingBlock:(id)a4 forCallsPassingTest:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (v8 && v9)
  {
    uint64_t v11 = [(TUCallContainer *)self calls];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__TUCallContainer_enumerateCallsWithOptions_invokingBlock_forCallsPassingTest___block_invoke;
    v12[3] = &unk_1E58E6A98;
    id v13 = v10;
    id v14 = v8;
    [v11 enumerateObjectsWithOptions:a3 usingBlock:v12];
  }
}

- (NSArray)calls
{
  return self->_calls;
}

- (void)enumerateCallsInvokingBlock:(id)a3 forCallsPassingTest:(id)a4
{
}

- (id)callPassingTest:(id)a3
{
  return [(TUCallContainer *)self callPassingTest:a3 withOptions:0];
}

- (TUCall)activeVideoCall
{
  return (TUCall *)[(TUCallContainer *)self callPassingTest:&__block_literal_global_43];
}

- (TUCallContainer)initWithCalls:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TUCallContainer;
  unint64_t v5 = [(TUCallContainer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    calls = v5->_calls;
    v5->_calls = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)displayedCalls
{
  v3 = [(TUCallContainer *)self callsPassingTest:&__block_literal_global_33_0];
  id v4 = [(TUCallContainer *)self conferenceCall];
  if (v4)
  {
    uint64_t v5 = [v3 arrayByAddingObject:v4];

    v3 = (void *)v5;
  }
  uint64_t v6 = [v3 sortedArrayUsingComparator:&__block_literal_global_30];

  return (NSArray *)v6;
}

- (id)conferenceCall
{
  return [(TUCallContainer *)self callPassingTest:&__block_literal_global_25 sortedUsingComparator:&__block_literal_global_30];
}

- (id)callsPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__2;
  id v13 = __Block_byref_object_dispose__2;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__TUCallContainer_callsPassingTest___block_invoke;
  v8[3] = &unk_1E58E6B00;
  v8[4] = &v9;
  [(TUCallContainer *)self enumerateCallsInvokingBlock:v8 forCallsPassingTest:v4];
  uint64_t v5 = (void *)v10[5];
  if (v5) {
    uint64_t v6 = (void *)[v5 copy];
  }
  else {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)callPassingTest:(id)a3 sortedUsingComparator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__TUCallContainer_callPassingTest_sortedUsingComparator___block_invoke;
  v11[3] = &unk_1E58E6B70;
  id v13 = &v14;
  id v8 = v7;
  id v12 = v8;
  [(TUCallContainer *)self enumerateCallsInvokingBlock:v11 forCallsPassingTest:v6];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v9;
}

- (TUCallContainer)init
{
  return [(TUCallContainer *)self initWithCalls:MEMORY[0x1E4F1CBF0]];
}

void __79__TUCallContainer_enumerateCallsWithOptions_invokingBlock_forCallsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 isPTT] & 1) == 0 && (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __36__TUCallContainer_callsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v8 = v3;
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v8;
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v4 addObject:v3];
}

- (NSArray)currentCalls
{
  return (NSArray *)[(TUCallContainer *)self callsPassingTest:TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate];
}

- (NSArray)currentVideoCalls
{
  return (NSArray *)[(TUCallContainer *)self callsPassingTest:&__block_literal_global_18];
}

- (NSArray)currentAudioAndVideoCalls
{
  return (NSArray *)[(TUCallContainer *)self callsPassingTest:&__block_literal_global_9_0];
}

- (NSArray)incomingCalls
{
  return (NSArray *)[(TUCallContainer *)self callsPassingTest:&__block_literal_global_17];
}

uint64_t __33__TUCallContainer_displayedCalls__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (TUCallCenterDisplayedAudioCallPredicate_block_invoke_12((uint64_t)v2, v2)
    && ![v2 isConferenced])
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [v2 isConversation];
  }

  return v3;
}

- (NSArray)displayedAudioAndVideoCalls
{
  uint64_t v3 = [(TUCallContainer *)self callsPassingTest:&__block_literal_global_35];
  id v4 = [(TUCallContainer *)self conferenceCall];
  if (v4)
  {
    uint64_t v5 = [v3 arrayByAddingObject:v4];

    uint64_t v3 = (void *)v5;
  }
  uint64_t v6 = [v3 sortedArrayUsingComparator:&__block_literal_global_30];

  return (NSArray *)v6;
}

uint64_t __46__TUCallContainer_displayedAudioAndVideoCalls__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 status] - 1 > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 isConferenced] ^ 1;
  }

  return v3;
}

- (NSArray)conferenceParticipantCalls
{
  id v2 = [(TUCallContainer *)self callsPassingTest:&__block_literal_global_25];
  uint64_t v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_30];

  return (NSArray *)v3;
}

- (NSArray)callsHostedElsewhere
{
  return (NSArray *)[(TUCallContainer *)self callsPassingTest:&__block_literal_global_37_0];
}

uint64_t __39__TUCallContainer_callsHostedElsewhere__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHostedOnCurrentDevice] ^ 1;
}

- (NSArray)callsWithAnEndpointElsewhere
{
  return (NSArray *)[(TUCallContainer *)self callsPassingTest:&__block_literal_global_39];
}

uint64_t __47__TUCallContainer_callsWithAnEndpointElsewhere__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEndpointOnCurrentDevice] ^ 1;
}

- (NSArray)callsHostedOrAnEndpointElsewhere
{
  return (NSArray *)[(TUCallContainer *)self callsPassingTest:&__block_literal_global_41];
}

uint64_t __51__TUCallContainer_callsHostedOrAnEndpointElsewhere__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isHostedOnCurrentDevice]) {
    uint64_t v3 = [v2 isEndpointOnCurrentDevice] ^ 1;
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (NSArray)callsOnDefaultPairedDevice
{
  return (NSArray *)[(TUCallContainer *)self callsPassingTest:&__block_literal_global_11];
}

- (id)callsWithStatus:(int)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__TUCallContainer_callsWithStatus___block_invoke;
  v5[3] = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  int v6 = a3;
  uint64_t v3 = [(TUCallContainer *)self callsPassingTest:v5];

  return v3;
}

uint64_t __35__TUCallContainer_callsWithStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status] == *(_DWORD *)(a1 + 32)) {
    uint64_t v4 = (*((uint64_t (**)(uint64_t, void *))TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate + 2))((uint64_t)TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate, v3);
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)audioAndVideoCallsWithStatus:(int)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__TUCallContainer_audioAndVideoCallsWithStatus___block_invoke;
  v5[3] = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  int v6 = a3;
  id v3 = [(TUCallContainer *)self callsPassingTest:v5];

  return v3;
}

uint64_t __48__TUCallContainer_audioAndVideoCallsWithStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 status];
  if (v4 == *(_DWORD *)(a1 + 32)) {
    uint64_t v5 = TUCallCenterHostedOnOrEndpointOnCurrentDevicePredicate_block_invoke_5(v4, v3);
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)callsWithGroupUUID:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__TUCallContainer_callsWithGroupUUID___block_invoke;
  v8[3] = &unk_1E58E6B48;
  id v9 = v4;
  id v5 = v4;
  int v6 = [(TUCallContainer *)self callsPassingTest:v8];

  return v6;
}

uint64_t __38__TUCallContainer_callsWithGroupUUID___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 callGroupUUID];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

void __47__TUCallContainer_callPassingTest_withOptions___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

void __57__TUCallContainer_callPassingTest_sortedUsingComparator___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = v4;
  if (*(void *)(v5 + 40))
  {
    id v6 = v4;
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      if ((*(uint64_t (**)(uint64_t, id))(v7 + 16))(v7, v6) != -1) {
        goto LABEL_6;
      }
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    }
  }
  objc_storeStrong((id *)(v5 + 40), a2);
LABEL_6:
}

- (TUCall)incomingCall
{
  return (TUCall *)[(TUCallContainer *)self callPassingTest:&__block_literal_global_17];
}

- (TUCall)incomingVideoCall
{
  return (TUCall *)[(TUCallContainer *)self callPassingTest:&__block_literal_global_19 withOptions:2];
}

BOOL __34__TUCallContainer_activeVideoCall__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isVideo])
  {
    int v3 = [v2 status];
    BOOL v5 = v3 == 2 || (v3 & 0xFFFFFFFD) == 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (TUCall)currentVideoCall
{
  int v3 = [(TUCallContainer *)self incomingVideoCall];
  if (!v3)
  {
    int v3 = [(TUCallContainer *)self activeVideoCall];
    if (!v3)
    {
      id v4 = [(TUCallContainer *)self currentVideoCalls];
      if ([v4 count])
      {
        int v3 = [v4 lastObject];
      }
      else
      {
        int v3 = 0;
      }
    }
  }

  return (TUCall *)v3;
}

- (TUCall)screeningCall
{
  return (TUCall *)[(TUCallContainer *)self callPassingTest:&__block_literal_global_27];
}

- (id)callWithStatus:(int)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__TUCallContainer_callWithStatus___block_invoke;
  v5[3] = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  int v6 = a3;
  int v3 = [(TUCallContainer *)self callPassingTest:v5];

  return v3;
}

uint64_t __34__TUCallContainer_callWithStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status] == *(_DWORD *)(a1 + 32)) {
    uint64_t v4 = (*((uint64_t (**)(uint64_t, void *))TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate + 2))((uint64_t)TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate, v3);
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)videoCallWithStatus:(int)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__TUCallContainer_videoCallWithStatus___block_invoke;
  v5[3] = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  int v6 = a3;
  id v3 = [(TUCallContainer *)self callPassingTest:v5];

  return v3;
}

uint64_t __39__TUCallContainer_videoCallWithStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status] == *(_DWORD *)(a1 + 32)) {
    uint64_t v4 = [v3 isVideo];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)audioOrVideoCallWithStatus:(int)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__TUCallContainer_audioOrVideoCallWithStatus___block_invoke;
  v5[3] = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  int v6 = a3;
  id v3 = [(TUCallContainer *)self callPassingTest:v5];

  return v3;
}

uint64_t __46__TUCallContainer_audioOrVideoCallWithStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 status];
  if (v4 == *(_DWORD *)(a1 + 32)) {
    uint64_t v5 = TUCallCenterHostedOnOrEndpointOnCurrentDevicePredicate_block_invoke_5(v4, v3);
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)callWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __49__TUCallContainer_callWithUniqueProxyIdentifier___block_invoke;
  v8[3] = &unk_1E58E6B48;
  id v9 = v4;
  id v5 = v4;
  int v6 = [(TUCallContainer *)self callPassingTest:v8];

  return v6;
}

uint64_t __49__TUCallContainer_callWithUniqueProxyIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueProxyIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)callWithCallUUID:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__TUCallContainer_callWithCallUUID___block_invoke;
  v8[3] = &unk_1E58E6B48;
  id v9 = v4;
  id v5 = v4;
  int v6 = [(TUCallContainer *)self callPassingTest:v8];

  return v6;
}

uint64_t __36__TUCallContainer_callWithCallUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 callUUID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)displayedCall
{
  id v3 = TUCallCenterCallDateConnectedComparator_block_invoke_16((uint64_t)self, 3);
  uint64_t v4 = [(TUCallContainer *)self callPassingTest:v3];

  int v6 = TUCallCenterCallDateConnectedComparator_block_invoke_16(v5, 1);
  uint64_t v7 = [(TUCallContainer *)self callPassingTest:v6];

  id v9 = TUCallCenterCallDateConnectedComparator_block_invoke_16(v8, 4);
  uint64_t v10 = [(TUCallContainer *)self callPassingTest:v9];

  id v11 = v7;
  id v12 = v11;
  if (v11 && (id v13 = v10) != 0 || (id v13 = v4, v14 = v11, v4))
  {
    id v14 = v13;
  }

  return v14;
}

- (id)frontmostCall
{
  id v3 = [(TUCallContainer *)self currentCallCount];
  if (v3)
  {
    id v3 = [(TUCallContainer *)self incomingCall];
    if (!v3)
    {
      id v3 = [(TUCallContainer *)self callWithStatus:1];
      if (!v3)
      {
        id v3 = [(TUCallContainer *)self callWithStatus:3];
        if (!v3)
        {
          id v3 = [(TUCallContainer *)self callWithStatus:2];
        }
      }
    }
  }

  return v3;
}

- (id)frontmostAudioOrVideoCall
{
  id v3 = [(TUCallContainer *)self currentAudioAndVideoCallCount];
  if (v3)
  {
    id v3 = [(TUCallContainer *)self audioOrVideoCallWithStatus:4];
    if (!v3)
    {
      id v3 = [(TUCallContainer *)self audioOrVideoCallWithStatus:1];
      if (!v3)
      {
        id v3 = [(TUCallContainer *)self audioOrVideoCallWithStatus:3];
        if (!v3)
        {
          id v3 = [(TUCallContainer *)self audioOrVideoCallWithStatus:2];
        }
      }
    }
  }

  return v3;
}

- (id)displayedCallFromCalls:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(TUCallContainer *)self currentCalls];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v6)
  {
    id v8 = 0;
    id v9 = 0;
    goto LABEL_32;
  }
  uint64_t v7 = v6;
  id v8 = 0;
  id v9 = 0;
  uint64_t v10 = *(void *)v28;
  double v11 = 0.0;
  double v12 = 0.0;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v28 != v10) {
        objc_enumerationMutation(v5);
      }
      id v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
      int v15 = objc_msgSend(v14, "status", (void)v27);
      if ((v15 - 5) > 0xFFFFFFFD)
      {
        id v25 = v14;

        id v8 = v25;
        goto LABEL_32;
      }
      if (v15 == 1)
      {
        if (v8)
        {
          [v14 callDuration];
          if (v16 <= v12) {
            goto LABEL_24;
          }
          double v17 = v16;
          id v18 = v14;

          id v8 = v18;
          double v12 = v17;
          if (v18) {
            goto LABEL_24;
          }
          goto LABEL_22;
        }
        id v8 = v14;
        [v8 callDuration];
        double v12 = v22;
      }
      else if (v15 == 2 && v12 == 0.0)
      {
        if (!v9)
        {
          id v9 = v14;
          [v9 callDuration];
          double v11 = v23;
          if (v8) {
            goto LABEL_24;
          }
          goto LABEL_22;
        }
        [v14 callDuration];
        if (v19 > v11)
        {
          double v20 = v19;
          id v21 = v14;

          id v9 = v21;
          double v11 = v20;
          if (v8) {
            goto LABEL_24;
          }
          goto LABEL_22;
        }
      }
      if (v8) {
        goto LABEL_24;
      }
LABEL_22:
      if (v9)
      {
        id v8 = v9;
        id v9 = v8;
      }
LABEL_24:
      ++v13;
    }
    while (v7 != v13);
    uint64_t v24 = [v5 countByEnumeratingWithState:&v27 objects:v31 count:16];
    uint64_t v7 = v24;
  }
  while (v24);
LABEL_32:

  return v8;
}

uint64_t __43__TUCallContainer_countOfCallsPassingTest___block_invoke(uint64_t result)
{
  return result;
}

- (unint64_t)currentVideoCallCount
{
  return [(TUCallContainer *)self countOfCallsPassingTest:&__block_literal_global_18];
}

- (unint64_t)currentAudioAndVideoCallCount
{
  return [(TUCallContainer *)self countOfCallsPassingTest:&__block_literal_global_9_0];
}

- (unint64_t)callCountOnDefaultPairedDevice
{
  return [(TUCallContainer *)self countOfCallsPassingTest:&__block_literal_global_11];
}

- (BOOL)anyCallPassesTest:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__TUCallContainer_anyCallPassesTest___block_invoke;
  v6[3] = &unk_1E58E6B00;
  v6[4] = &v7;
  [(TUCallContainer *)self enumerateCallsInvokingBlock:v6 forCallsPassingTest:v4];
  LOBYTE(self) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

uint64_t __37__TUCallContainer_anyCallPassesTest___block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + ++*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

- (BOOL)allCallsPassTest:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__TUCallContainer_allCallsPassTest___block_invoke;
  v7[3] = &unk_1E58E6B98;
  id v8 = v4;
  id v5 = v4;
  LODWORD(self) = ![(TUCallContainer *)self anyCallPassesTest:v7];

  return (char)self;
}

uint64_t __36__TUCallContainer_allCallsPassTest___block_invoke(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() ^ 1;
}

- (BOOL)hasCurrentCalls
{
  return [(TUCallContainer *)self anyCallPassesTest:&__block_literal_global_9_0];
}

- (BOOL)hasCurrentAudioCalls
{
  return [(TUCallContainer *)self anyCallPassesTest:TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate];
}

- (BOOL)hasCurrentVideoCalls
{
  return [(TUCallContainer *)self anyCallPassesTest:&__block_literal_global_18];
}

- (BOOL)anyCallIsHostedOnCurrentDevice
{
  return [(TUCallContainer *)self anyCallPassesTest:&__block_literal_global_5_0];
}

- (BOOL)anyCallIsEndpointOnCurrentDevice
{
  return [(TUCallContainer *)self anyCallPassesTest:&__block_literal_global_7_0];
}

- (BOOL)allCallsAreOfService:(int)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__TUCallContainer_allCallsAreOfService___block_invoke;
  v4[3] = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  int v5 = a3;
  return [(TUCallContainer *)self allCallsPassTest:v4];
}

uint64_t __40__TUCallContainer_allCallsAreOfService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 service];
  if (v4 == *(_DWORD *)(a1 + 32)) {
    uint64_t v5 = TUCallCenterHostedOnOrEndpointOnCurrentDevicePredicate_block_invoke_5(v4, v3);
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)existingCallsHaveMultipleProviders
{
  id v2 = self;
  id v3 = [(TUCallContainer *)self currentAudioAndVideoCalls];
  uint64_t v4 = [v3 firstObject];
  uint64_t v5 = [v4 provider];
  uint64_t v6 = [v5 identifier];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__TUCallContainer_existingCallsHaveMultipleProviders__block_invoke;
  v9[3] = &unk_1E58E6B48;
  id v10 = v6;
  id v7 = v6;
  LOBYTE(v2) = [(TUCallContainer *)v2 anyCallPassesTest:v9];

  return (char)v2;
}

uint64_t __53__TUCallContainer_existingCallsHaveMultipleProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 provider];
  uint64_t v4 = [v3 identifier];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v5;
}

- (NSArray)currentCallGroups
{
  id v3 = [(TUCallContainer *)self currentCalls];
  uint64_t v4 = [(TUCallContainer *)self _callGroupsFromCalls:v3];

  return (NSArray *)v4;
}

- (NSArray)currentAudioAndVideoCallGroups
{
  id v3 = [(TUCallContainer *)self currentAudioAndVideoCalls];
  uint64_t v4 = [(TUCallContainer *)self _callGroupsFromCalls:v3];

  return (NSArray *)v4;
}

- (NSArray)callGroupsOnDefaultPairedDevice
{
  id v3 = [(TUCallContainer *)self callsOnDefaultPairedDevice];
  uint64_t v4 = [(TUCallContainer *)self _callGroupsFromCalls:v3];

  return (NSArray *)v4;
}

- (id)_callGroupsFromCalls:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[a3 mutableCopy];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  uint64_t v6 = [(TUCallContainer *)self conferenceCall];

  if (v6)
  {
    id v7 = [TUCallGroup alloc];
    id v8 = [(TUCallContainer *)self conferenceParticipantCalls];
    uint64_t v9 = [(TUCallGroup *)v7 initWithCalls:v8];

    [v5 addObject:v9];
    id v10 = [(TUCallGroup *)v9 calls];
    [v4 removeObjectsInArray:v10];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        double v17 = [TUCallGroup alloc];
        id v18 = -[TUCallGroup initWithCall:](v17, "initWithCall:", v16, (void)v20);
        [v5 addObject:v18];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  return v5;
}

- (void)setCalls:(id)a3
{
}

- (id)bargeCallWithStatus:(int)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__10;
  uint64_t v12 = __Block_byref_object_dispose__10;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__TUCallContainer_TUBargeCall__bargeCallWithStatus___block_invoke;
  v7[3] = &unk_1E58E6B00;
  void v7[4] = &v8;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__TUCallContainer_TUBargeCall__bargeCallWithStatus___block_invoke_2;
  v5[3] = &__block_descriptor_36_e16_B16__0__TUCall_8l;
  int v6 = a3;
  [(TUCallContainer *)self enumerateBargeCallsInvokingBlock:v7 forCallsPassingTest:v5];
  id v3 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v3;
}

void __52__TUCallContainer_TUBargeCall__bargeCallWithStatus___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

uint64_t __52__TUCallContainer_TUBargeCall__bargeCallWithStatus___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 status] == *(_DWORD *)(a1 + 32)) {
    uint64_t v4 = (*((uint64_t (**)(uint64_t, void *))TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate + 2))((uint64_t)TUCallCenterAudioCallHostedOnOrEndpointOnCurrentDevicePredicate, v3);
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (NSArray)bargeCalls
{
  return (NSArray *)[(TUCallContainer *)self bargeCallsPassingTest:&__block_literal_global_38];
}

uint64_t __42__TUCallContainer_TUBargeCall__bargeCalls__block_invoke()
{
  return 1;
}

- (id)bargeCallWithUniqueProxyIdentifier:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__TUCallContainer_TUBargeCall__bargeCallWithUniqueProxyIdentifier___block_invoke;
  v9[3] = &unk_1E58E6B48;
  id v10 = v4;
  id v5 = v4;
  int v6 = [(TUCallContainer *)self bargeCallsPassingTest:v9];
  id v7 = [v6 firstObject];

  return v7;
}

uint64_t __67__TUCallContainer_TUBargeCall__bargeCallWithUniqueProxyIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) length])
  {
    id v4 = [v3 uniqueProxyIdentifier];
    uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)bargeCallsPassingTest:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__10;
  id v13 = __Block_byref_object_dispose__10;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__TUCallContainer_TUBargeCall__bargeCallsPassingTest___block_invoke;
  v8[3] = &unk_1E58E6B00;
  void v8[4] = &v9;
  [(TUCallContainer *)self enumerateBargeCallsInvokingBlock:v8 forCallsPassingTest:v4];
  uint64_t v5 = (void *)v10[5];
  if (v5) {
    int v6 = (void *)[v5 copy];
  }
  else {
    int v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __54__TUCallContainer_TUBargeCall__bargeCallsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v8 = v3;
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v8;
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v4 addObject:v3];
}

- (void)enumerateBargeCallsInvokingBlock:(id)a3 forCallsPassingTest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    uint64_t v9 = [(TUCallContainer *)self _allCalls];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __85__TUCallContainer_TUBargeCall__enumerateBargeCallsInvokingBlock_forCallsPassingTest___block_invoke;
    v10[3] = &unk_1E58E6A98;
    id v11 = v8;
    id v12 = v6;
    [v9 enumerateObjectsWithOptions:0 usingBlock:v10];
  }
}

void __85__TUCallContainer_TUBargeCall__enumerateBargeCallsInvokingBlock_forCallsPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isPTT] && (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (TUCall)frontmostBargeCall
{
  id v3 = [(TUCallContainer *)self bargeCallWithStatus:1];
  if (!v3)
  {
    id v3 = [(TUCallContainer *)self bargeCallWithStatus:2];
  }

  return (TUCall *)v3;
}

@end