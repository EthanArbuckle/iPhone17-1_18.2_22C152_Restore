id SUCoreBorder_MSUPreflightUpdate(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;
  uint64_t vars8;

  v2 = a2;
  v12 = 0;
  v3 = _SUCoreBorder_MSUFunctionAtBegin(@"MSUPreflightUpdate", &v12);
  v4 = v3;
  if (!v3)
  {
    v8 = MSUPreflightUpdate();
    v9 = _SUCoreBorder_MSUFunctionAtEnd(@"MSUPreflightUpdate", &v12);
    if (v9)
    {
      v10 = v9;
      LOBYTE(v8) = _SUCoreBorder_MSUSimulate(v9, v8, &v12);
    }
    if (v8) {
      goto LABEL_3;
    }
LABEL_9:
    v7 = v12;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v3, 1, &v12)) {
    goto LABEL_9;
  }
LABEL_3:
  if (v12)
  {
    v5 = [MEMORY[0x263F77DA8] sharedDiag];
    v6 = v12;
    [v5 trackAnomaly:@"SUCoreBorder_MSUPreflightUpdate" forReason:@"preflight (prior to SU download) was successful with error" withResult:0 withError:v12];
  }
  v7 = 0;
LABEL_10:

  return v7;
}

id _SUCoreBorder_MSUFunctionAtBegin(void *a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F77E20];
  id v4 = a1;
  v5 = [v3 sharedSimulator];
  v6 = [v5 begin:@"msu" atFunction:v4];

  if (v6)
  {
    if ([v6 simAction] == 1)
    {
      _SUCoreBorder_MSUSetSimulatedError(v6, (uint64_t)a2);
    }
    else if ([v6 simAction] == 3)
    {
      if (a2) {
        *a2 = 0;
      }
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

id _SUCoreBorder_MSUFunctionAtEnd(void *a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F77E20];
  id v4 = a1;
  v5 = [v3 sharedSimulator];
  v6 = [v5 end:@"msu" atFunction:v4];

  if (v6)
  {
    if ([v6 simAction] == 1)
    {
      _SUCoreBorder_MSUSetSimulatedError(v6, (uint64_t)a2);
    }
    else if ([v6 simAction] == 3)
    {
      if (a2) {
        *a2 = 0;
      }
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

uint64_t _SUCoreBorder_MSUSimulate(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = [v5 simAction];
  if (v6 == 3)
  {
    if (a3) {
      *a3 = 0;
    }
    a2 = 1;
  }
  else if (v6 == 1)
  {
    _SUCoreBorder_MSUSetSimulatedError(v5, (uint64_t)a3);
    a2 = 0;
  }
  else
  {
    v7 = [MEMORY[0x263F77DA8] sharedDiag];
    v8 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v5];
    [v7 trackAnomaly:@"_SUCoreBorder_MSUSimulate" forReason:v8 withResult:8113 withError:0];
  }
  return a2;
}

id SUCoreBorder_MSUPrepareUpdateWithMAAsset(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v14 = 0;
  id v5 = _SUCoreBorder_MSUFunctionAtBegin(@"MSUPrepareUpdateWithMAAsset", &v14);
  uint64_t v6 = v5;
  if (v5)
  {
    if (_SUCoreBorder_MSUSimulate(v5, 1, &v14)) {
      goto LABEL_3;
    }
LABEL_8:
    v9 = v14;
    if (v14) {
      goto LABEL_12;
    }
    v7 = [MEMORY[0x263F77D78] sharedCore];
    v9 = [v7 buildError:8804 underlying:0 description:@"MSUPrepareUpdateWithMAAsset was not successful (yet no error provided)"];
    goto LABEL_10;
  }
  uint64_t v10 = MSUPrepareUpdateWithMAAsset();
  v11 = _SUCoreBorder_MSUFunctionAtEnd(@"MSUPrepareUpdateWithMAAsset", &v14);
  if (v11)
  {
    v12 = v11;
    LOBYTE(v10) = _SUCoreBorder_MSUSimulate(v11, v10, &v14);
  }
  if ((v10 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14)
  {
    v7 = [MEMORY[0x263F77DA8] sharedDiag];
    v8 = v14;
    [v7 trackAnomaly:@"SUCoreBorder_MSUPrepareUpdateWithMAAsset" forReason:@"prepare was successful with error" withResult:0 withError:v14];

    v9 = 0;
LABEL_10:

    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

id SUCoreBorder_MSUPrepareUpdate(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v14 = 0;
  id v5 = _SUCoreBorder_MSUFunctionAtBegin(@"MSUPrepareUpdate", &v14);
  uint64_t v6 = v5;
  if (v5)
  {
    if (_SUCoreBorder_MSUSimulate(v5, 1, &v14)) {
      goto LABEL_3;
    }
LABEL_8:
    v9 = v14;
    if (v14) {
      goto LABEL_12;
    }
    v7 = [MEMORY[0x263F77D78] sharedCore];
    v9 = [v7 buildError:8804 underlying:0 description:@"MSUPrepareUpdate was not successful (yet no error provided)"];
    goto LABEL_10;
  }
  uint64_t v10 = MSUPrepareUpdate();
  v11 = _SUCoreBorder_MSUFunctionAtEnd(@"MSUPrepareUpdate", &v14);
  if (v11)
  {
    v12 = v11;
    LOBYTE(v10) = _SUCoreBorder_MSUSimulate(v11, v10, &v14);
  }
  if ((v10 & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  if (v14)
  {
    v7 = [MEMORY[0x263F77DA8] sharedDiag];
    v8 = v14;
    [v7 trackAnomaly:@"SUCoreBorder_MSUPrepareUpdate" forReason:@"prepare was successful with error" withResult:0 withError:v14];

    v9 = 0;
LABEL_10:

    goto LABEL_12;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

id SUCoreBorder_MSUApplyUpdate(uint64_t a1, void *a2)
{
  id v2 = a2;
  v12 = 0;
  id v3 = _SUCoreBorder_MSUFunctionAtBegin(@"MSUApplyUpdate", &v12);
  id v4 = v3;
  if (!v3)
  {
    uint64_t v8 = MSUApplyUpdate();
    v9 = _SUCoreBorder_MSUFunctionAtEnd(@"MSUApplyUpdate", &v12);
    if (v9)
    {
      uint64_t v10 = v9;
      LOBYTE(v8) = _SUCoreBorder_MSUSimulate(v9, v8, &v12);
    }
    if (v8) {
      goto LABEL_3;
    }
LABEL_9:
    v7 = v12;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v3, 1, &v12)) {
    goto LABEL_9;
  }
LABEL_3:
  if (v12)
  {
    id v5 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v6 = v12;
    [v5 trackAnomaly:@"SUCoreBorder_MSUApplyUpdate" forReason:@"apply was successful with error" withResult:0 withError:v12];
  }
  v7 = 0;
LABEL_10:

  return v7;
}

id SUCoreBorder_MSUSuspendUpdate()
{
  v9 = 0;
  v0 = _SUCoreBorder_MSUFunctionAtBegin(@"MSUSuspendUpdate", &v9);
  v1 = v0;
  if (!v0)
  {
    uint64_t v5 = MSUSuspendUpdate();
    uint64_t v6 = _SUCoreBorder_MSUFunctionAtEnd(@"MSUSuspendUpdate", &v9);
    if (v6)
    {
      v7 = v6;
      LOBYTE(v5) = _SUCoreBorder_MSUSimulate(v6, v5, &v9);
    }
    if (v5) {
      goto LABEL_3;
    }
LABEL_9:
    id v4 = v9;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v0, 1, &v9)) {
    goto LABEL_9;
  }
LABEL_3:
  if (v9)
  {
    id v2 = [MEMORY[0x263F77DA8] sharedDiag];
    id v3 = v9;
    [v2 trackAnomaly:@"SUCoreBorder_MSUSuspendUpdate" forReason:@"suspend was successful with error" withResult:0 withError:v9];
  }
  id v4 = 0;
LABEL_10:

  return v4;
}

id SUCoreBorder_MSUPurgeSuspendedUpdate()
{
  v9 = 0;
  v0 = _SUCoreBorder_MSUFunctionAtBegin(@"MSUPurgeSuspendedUpdate", &v9);
  v1 = v0;
  if (!v0)
  {
    uint64_t v5 = MSUPurgeSuspendedUpdate();
    uint64_t v6 = _SUCoreBorder_MSUFunctionAtEnd(@"MSUPurgeSuspendedUpdate", &v9);
    if (v6)
    {
      v7 = v6;
      LOBYTE(v5) = _SUCoreBorder_MSUSimulate(v6, v5, &v9);
    }
    if (v5) {
      goto LABEL_3;
    }
LABEL_9:
    id v4 = v9;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v0, 1, &v9)) {
    goto LABEL_9;
  }
LABEL_3:
  if (v9)
  {
    id v2 = [MEMORY[0x263F77DA8] sharedDiag];
    id v3 = v9;
    [v2 trackAnomaly:@"SUCoreBorder_MSUPurgeSuspendedUpdate" forReason:@"purge suspeneded update was successful with error" withResult:0 withError:v9];
  }
  id v4 = 0;
LABEL_10:

  return v4;
}

id SUCoreBorder_MSUResumeUpdateWithOptions(void *a1)
{
  id v1 = a1;
  v11 = 0;
  id v2 = _SUCoreBorder_MSUFunctionAtBegin(@"MSUResumeUpdateWithOptions", &v11);
  id v3 = v2;
  if (!v2)
  {
    uint64_t v7 = MSUResumeUpdateWithOptions();
    uint64_t v8 = _SUCoreBorder_MSUFunctionAtEnd(@"MSUResumeUpdateWithOptions", &v11);
    if (v8)
    {
      v9 = v8;
      LOBYTE(v7) = _SUCoreBorder_MSUSimulate(v8, v7, &v11);
    }
    if (v7) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = v11;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v2, 1, &v11)) {
    goto LABEL_9;
  }
LABEL_3:
  if (v11)
  {
    id v4 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v5 = v11;
    [v4 trackAnomaly:@"SUCoreBorder_MSUResumeUpdateWithOptions" forReason:@"resume was successful with error" withResult:0 withError:v11];
  }
  uint64_t v6 = 0;
LABEL_10:

  return v6;
}

id SUCoreBorder_MSUBrainIsLoadable(void *a1)
{
  id v1 = a1;
  v11 = 0;
  id v2 = _SUCoreBorder_MSUFunctionAtBegin(@"MSUUpdateBrainIsLoadable", &v11);
  id v3 = v2;
  if (!v2)
  {
    uint64_t IsLoadable = MSUBrainIsLoadable();
    uint64_t v8 = _SUCoreBorder_MSUFunctionAtEnd(@"MSUUpdateBrainIsLoadable", &v11);
    if (v8)
    {
      v9 = v8;
      LOBYTE(IsLoadable) = _SUCoreBorder_MSUSimulate(v8, IsLoadable, &v11);
    }
    if (IsLoadable) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = v11;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v2, 1, &v11)) {
    goto LABEL_9;
  }
LABEL_3:
  if (v11)
  {
    id v4 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v5 = v11;
    [v4 trackAnomaly:@"SUCoreBorder_MSUBrainIsLoadable" forReason:@"brainIsLoadable returned YES with error" withResult:0 withError:v11];
  }
  uint64_t v6 = 0;
LABEL_10:

  return v6;
}

id SUCoreBorder_MSUAssetCalculatePrepareSize(void *a1)
{
  id v1 = a1;
  v11 = 0;
  id v2 = _SUCoreBorder_MSUFunctionAtBegin(@"MSUAssetCalculatePrepareSize", &v11);
  id v3 = v2;
  if (!v2)
  {
    uint64_t v7 = MSUAssetCalculatePrepareSize();
    uint64_t v8 = _SUCoreBorder_MSUFunctionAtEnd(@"MSUAssetCalculatePrepareSize", &v11);
    if (v8)
    {
      v9 = v8;
      LOBYTE(v7) = _SUCoreBorder_MSUSimulate(v8, v7, &v11);
    }
    if (v7) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = v11;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v2, 1, &v11)) {
    goto LABEL_9;
  }
LABEL_3:
  if (v11)
  {
    id v4 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v5 = v11;
    [v4 trackAnomaly:@"SUCoreBorder_MSUAssetCalculatePrepareSize" forReason:@"asset calculate prepare size was successful with error" withResult:0 withError:v11];
  }
  uint64_t v6 = 0;
LABEL_10:

  return v6;
}

id SUCoreBorder_MSUAssetCalculateApplySize(void *a1)
{
  id v1 = a1;
  v11 = 0;
  id v2 = _SUCoreBorder_MSUFunctionAtBegin(@"MSUAssetCalculateApplySize", &v11);
  id v3 = v2;
  if (!v2)
  {
    uint64_t v7 = MSUAssetCalculateApplySize();
    uint64_t v8 = _SUCoreBorder_MSUFunctionAtEnd(@"MSUAssetCalculateApplySize", &v11);
    if (v8)
    {
      v9 = v8;
      LOBYTE(v7) = _SUCoreBorder_MSUSimulate(v8, v7, &v11);
    }
    if (v7) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = v11;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v2, 1, &v11)) {
    goto LABEL_9;
  }
LABEL_3:
  if (v11)
  {
    id v4 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v5 = v11;
    [v4 trackAnomaly:@"SUCoreBorder_MSUAssetCalculateApplySize" forReason:@"asset calculate apply size was successful with error" withResult:0 withError:v11];
  }
  uint64_t v6 = 0;
LABEL_10:

  return v6;
}

uint64_t SUCoreBorder_MSURetrievePreviousUpdateState()
{
  v0 = _SUCoreBorder_MSUFunctionAtBegin(@"MSURetrievePreviousUpdateState", 0);
  id v1 = v0;
  if (v0)
  {
    uint64_t updated = _SUCoreBorder_MSUSimulate(v0, 1, 0);
  }
  else
  {
    uint64_t updated = MSURetrievePreviousUpdateState();
    id v3 = _SUCoreBorder_MSUFunctionAtEnd(@"MSURetrievePreviousUpdateState", 0);
    id v4 = v3;
    if (v3) {
      uint64_t updated = _SUCoreBorder_MSUSimulate(v3, updated, 0);
    }
  }
  return updated;
}

id SUCoreBorder_MSUGetUpdateInfo(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = _SUCoreBorder_MSUFunctionAtBegin(@"MSUGetUpdateInfo", 0);
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = _SUCoreBorder_MSUGetUpdateInfo(v5);
  }
  else
  {
    uint64_t v7 = MSUGetUpdateInfo();
    uint64_t v8 = _SUCoreBorder_MSUFunctionAtEnd(@"MSUGetUpdateInfo", 0);
    v9 = v8;
    if (v8)
    {
      uint64_t v10 = _SUCoreBorder_MSUGetUpdateInfo(v8);

      uint64_t v7 = (void *)v10;
    }
  }

  return v7;
}

id _SUCoreBorder_MSUGetUpdateInfo(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 simAction];
  if (v2 == 1)
  {
    uint64_t v5 = 0;
  }
  else
  {
    if (v2 == 3)
    {
      id v3 = NSDictionary;
      id v4 = [v1 updateInfoPlist];
      uint64_t v5 = [v3 dictionaryWithContentsOfFile:v4];
    }
    else
    {
      id v4 = [MEMORY[0x263F77DA8] sharedDiag];
      uint64_t v6 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v1];
      [v4 trackAnomaly:@"_SUCoreBorder_MSUGetUpdateInfo" forReason:v6 withResult:8113 withError:0];

      uint64_t v5 = 0;
    }
  }

  return v5;
}

id SUCoreBorder_MSUCommitStash(void *a1)
{
  id v1 = a1;
  v11 = 0;
  uint64_t v2 = _SUCoreBorder_MSUFunctionAtBegin(@"MSUCommitStash", &v11);
  id v3 = v2;
  if (!v2)
  {
    uint64_t v7 = MSUCommitStash();
    uint64_t v8 = _SUCoreBorder_MSUFunctionAtEnd(@"MSUCommitStash", 0);
    if (v8)
    {
      v9 = v8;
      LOBYTE(v7) = _SUCoreBorder_MSUSimulate(v8, v7, &v11);
    }
    if (v7) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = v11;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v2, 1, &v11)) {
    goto LABEL_9;
  }
LABEL_3:
  if (v11)
  {
    id v4 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v5 = v11;
    [v4 trackAnomaly:@"SUCoreBorder_MSUCommitStash" forReason:@"StashCommit was successful with error" withResult:0 withError:v11];
  }
  uint64_t v6 = 0;
LABEL_10:

  return v6;
}

id SUCoreBorder_MSURollbackUpdatePrepare(uint64_t a1, void *a2)
{
  id v2 = a2;
  v12 = 0;
  id v3 = _SUCoreBorder_MSUFunctionAtBegin(@"MSURollbackUpdatePrepare", &v12);
  id v4 = v3;
  if (!v3)
  {
    uint64_t v8 = MSUPrepareUpdate();
    v9 = _SUCoreBorder_MSUFunctionAtEnd(@"MSURollbackUpdatePrepare", &v12);
    if (v9)
    {
      uint64_t v10 = v9;
      LOBYTE(v8) = _SUCoreBorder_MSUSimulate(v9, v8, &v12);
    }
    if (v8) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v7 = v12;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v3, 1, &v12)) {
    goto LABEL_9;
  }
LABEL_3:
  if (v12)
  {
    uint64_t v5 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v6 = v12;
    [v5 trackAnomaly:@"SUCoreBorder_MSURollbackUpdate" forReason:@"rollback was successful with error" withResult:0 withError:v12];
  }
  uint64_t v7 = 0;
LABEL_10:

  return v7;
}

id SUCoreBorder_MSURollbackUpdateSuspend()
{
  v9 = 0;
  v0 = _SUCoreBorder_MSUFunctionAtBegin(@"MSURollbackUpdateSuspend", &v9);
  id v1 = v0;
  if (!v0)
  {
    uint64_t v5 = MSUSuspendUpdate();
    uint64_t v6 = _SUCoreBorder_MSUFunctionAtEnd(@"MSURollbackUpdateSuspend", &v9);
    if (v6)
    {
      uint64_t v7 = v6;
      LOBYTE(v5) = _SUCoreBorder_MSUSimulate(v6, v5, &v9);
    }
    if (v5) {
      goto LABEL_3;
    }
LABEL_9:
    id v4 = v9;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v0, 1, &v9)) {
    goto LABEL_9;
  }
LABEL_3:
  if (v9)
  {
    id v2 = [MEMORY[0x263F77DA8] sharedDiag];
    id v3 = v9;
    [v2 trackAnomaly:@"SUCoreBorder_MSURollbackUpdateSuspend" forReason:@"suspend was successful with error" withResult:0 withError:v9];
  }
  id v4 = 0;
LABEL_10:

  return v4;
}

id SUCoreBorder_MSURollbackUpdateResumeWithOptions(void *a1)
{
  id v1 = a1;
  v11 = 0;
  id v2 = _SUCoreBorder_MSUFunctionAtBegin(@"MSURollbackUpdateResume", &v11);
  id v3 = v2;
  if (!v2)
  {
    uint64_t v7 = MSUResumeUpdateWithOptions();
    uint64_t v8 = _SUCoreBorder_MSUFunctionAtEnd(@"MSURollbackUpdateResume", &v11);
    if (v8)
    {
      v9 = v8;
      LOBYTE(v7) = _SUCoreBorder_MSUSimulate(v8, v7, &v11);
    }
    if (v7) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v6 = v11;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v2, 1, &v11)) {
    goto LABEL_9;
  }
LABEL_3:
  if (v11)
  {
    id v4 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v5 = v11;
    [v4 trackAnomaly:@"SUCoreBorder_MSURollbackUpdateResumeWithOptions" forReason:@"resume was successful with error" withResult:0 withError:v11];
  }
  uint64_t v6 = 0;
LABEL_10:

  return v6;
}

id SUCoreBorder_MSURollbackUpdateApply(uint64_t a1, void *a2)
{
  id v2 = a2;
  v12 = 0;
  id v3 = _SUCoreBorder_MSUFunctionAtBegin(@"MSURollbackUpdateApply", &v12);
  id v4 = v3;
  if (!v3)
  {
    uint64_t v8 = MSUApplyUpdate();
    v9 = _SUCoreBorder_MSUFunctionAtEnd(@"MSURollbackUpdateApply", &v12);
    if (v9)
    {
      uint64_t v10 = v9;
      LOBYTE(v8) = _SUCoreBorder_MSUSimulate(v9, v8, &v12);
    }
    if (v8) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v7 = v12;
    goto LABEL_10;
  }
  if (!_SUCoreBorder_MSUSimulate(v3, 1, &v12)) {
    goto LABEL_9;
  }
LABEL_3:
  if (v12)
  {
    uint64_t v5 = [MEMORY[0x263F77DA8] sharedDiag];
    uint64_t v6 = v12;
    [v5 trackAnomaly:@"SUCoreBorder_MSUApplyUpdate" forReason:@"apply was successful with error" withResult:0 withError:v12];
  }
  uint64_t v7 = 0;
LABEL_10:

  return v7;
}

uint64_t _SUCoreBorder_MSUSetSimulatedError(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = v3;
  if (a2)
  {
    if (*(void *)a2)
    {
      a2 = 0;
    }
    else
    {
      *(void *)a2 = [v3 buildErrorWithDescription:@"_SUCoreBorder_MSUSetSimulatedError"];
      a2 = 1;
    }
  }

  return a2;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void SUCoreBorder_MAPurgeAll(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v11 = 0;
  v12 = (id *)&v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  id obj = 0;
  uint64_t v5 = _SUCoreBorder_MAFunctionAtBegin(@"MAPurgeAll", &obj);
  objc_storeStrong(&v16, obj);
  if (v5)
  {
    uint64_t v6 = v12 + 5;
    v7[0] = v12[5];
    _SUCoreBorder_MASimulate(v5, v7);
    objc_storeStrong(v6, v7[0]);
    if (v4) {
      ((void (**)(id, id))v4)[2](v4, v12[5]);
    }
  }
  else
  {
    v7[1] = (id)MEMORY[0x263EF8330];
    v7[2] = (id)3221225472;
    v7[3] = __SUCoreBorder_MAPurgeAll_block_invoke;
    v7[4] = &unk_2640DC3B0;
    v9 = &v11;
    uint64_t v8 = v4;
    MAPurgeAll();
  }
  _Block_object_dispose(&v11, 8);
}

void sub_20C8F1760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

id _SUCoreBorder_MAFunctionAtBegin(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F77E20];
  id v4 = a1;
  uint64_t v5 = [v3 sharedSimulator];
  uint64_t v6 = [v5 begin:@"ma" atFunction:v4];

  if (v6)
  {
    if ([v6 simAction] == 1)
    {
      _SUCoreBorder_MASetSimulatedError(v6, a2);
    }
    else if ([v6 simAction] == 3)
    {
      if (a2) {
        *a2 = 0;
      }
    }
    else
    {

      uint64_t v6 = 0;
    }
  }

  return v6;
}

id _SUCoreBorder_MAFunctionAtEnd(void *a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263F77E20];
  id v4 = a1;
  uint64_t v5 = [v3 sharedSimulator];
  uint64_t v6 = [v5 end:@"ma" atFunction:v4];

  if (v6)
  {
    if ([v6 simAction] == 1)
    {
      _SUCoreBorder_MASetSimulatedError(v6, a2);
    }
    else if ([v6 simAction] == 3)
    {
      if (a2) {
        *a2 = 0;
      }
    }
    else
    {

      uint64_t v6 = 0;
    }
  }

  return v6;
}

void _SUCoreBorder_MASimulate(void *a1, void *a2)
{
  id v7 = a1;
  uint64_t v3 = [v7 simAction];
  if (v3 == 3)
  {
    id v4 = v7;
    if (a2) {
      *a2 = 0;
    }
  }
  else
  {
    if (v3 == 1)
    {
      _SUCoreBorder_MASetSimulatedError(v7, a2);
    }
    else
    {
      uint64_t v5 = [MEMORY[0x263F77DA8] sharedDiag];
      uint64_t v6 = (void *)[[NSString alloc] initWithFormat:@"unsupported simulated event action, event: %@", v7];
      [v5 trackAnomaly:@"_SUCoreBorder_MASimulate" forReason:v6 withResult:8113 withError:0];
    }
    id v4 = v7;
  }
}

void _SUCoreBorder_MASetSimulatedError(void *a1, void *a2)
{
  id v3 = a1;
  if (a2 && !*a2)
  {
    id v4 = v3;
    *a2 = [v3 buildErrorWithDescription:@"SUCoreError created by _SUCoreBorder_MASetSimulatedError"];
    id v3 = v4;
  }
}

uint64_t _isUpdateBrainAssetType(void *a1)
{
  id v1 = a1;
  if (([v1 isEqualToString:@"com.apple.MobileAsset.MobileSoftwareUpdate.UpdateBrain"] & 1) != 0
    || ([v1 isEqualToString:@"com.apple.MobileAsset.RecoveryOSUpdateBrain"] & 1) != 0)
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = [v1 isEqualToString:@"com.apple.MobileAsset.MobileSoftwareUpdate.MacUpdateBrain"];
  }

  return v2;
}

id _getNewUpdateBrainMAAssetAttributesDictionary(void *a1, void *a2, void *a3)
{
  v22[2] = *MEMORY[0x263EF8340];
  int v20 = -272716322;
  uint64_t v5 = (objc_class *)MEMORY[0x263EFF8F8];
  id v6 = a3;
  id v7 = a2;
  id v8 = a1;
  v9 = (void *)[[v5 alloc] initWithBytes:&v20 length:4];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v11 = (void *)MGCopyAnswer();
  if ([v11 hasPrefix:@"AudioAccessory"]) {
    uint64_t v12 = 21;
  }
  else {
    uint64_t v12 = 20;
  }
  uint64_t v13 = [NSNumber numberWithInt:v12];
  [v10 setSafeObject:v13 forKey:@"_CompatibilityVersion"];

  [v10 setSafeObject:v7 forKey:@"Build"];
  [v10 setSafeObject:v6 forKey:@"AssetPurpose"];

  [v10 setSafeObject:@"zip" forKey:@"_CompressionAlgorithm"];
  [v10 setSafeObject:@"9999099099000000" forKey:@"_ContentVersion"];
  [v10 setSafeObject:@"https://xp.apple.com/report" forKey:@"_EventRecordingServiceURL"];
  [v10 setSafeObject:MEMORY[0x263EFFA88] forKey:@"_IsZipStreamable"];
  [v10 setSafeObject:@"2072" forKey:@"_MasteredVersion"];
  [v10 setSafeObject:v9 forKey:@"_Measurement"];
  [v10 setSafeObject:@"SHA-1" forKey:@"_MeasurementAlgorithm"];
  v14 = [NSNumber numberWithLong:1234];
  [v10 setSafeObject:v14 forKey:@"_UnarchivedSize"];

  v15 = [NSNumber numberWithLong:1234];
  [v10 setSafeObject:v15 forKey:@"_DownloadSize"];

  id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v16 setSafeObject:v8 forKey:@"AssetType"];

  [v16 setSafeObject:@"SimulatedUpdateBrainAssetId" forKey:@"AssetId"];
  v17 = [NSNumber numberWithLong:1];
  [v16 setSafeObject:v17 forKey:@"AssetState"];

  v21[0] = @"AssetProperties";
  v21[1] = @"AssetAddedProperties";
  v22[0] = v10;
  v22[1] = v16;
  v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

  return v18;
}

id _getNewSoftwareUpdateMAAssetAttributesDictionary(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  v49[2] = *MEMORY[0x263EF8340];
  id v46 = a1;
  id v13 = a4;
  int v47 = -272716322;
  v14 = (objc_class *)MEMORY[0x263EFF8F8];
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  id v19 = a2;
  int v20 = (void *)[[v14 alloc] initWithBytes:&v47 length:4];
  id v21 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v21 setSafeObject:v19 forKey:@"Build"];
  [v21 setSafeObject:v18 forKey:@"OSVersion"];

  v22 = [MEMORY[0x263F55950] _translateBuildVersionToRestoreVersionTuple:v19];

  [v21 setSafeObject:v22 forKey:@"RestoreVersion"];
  [v21 setSafeObject:v22 forKey:@"TargetBridgeUpdateVersion"];
  [v21 setSafeObject:v22 forKey:@"TargetSFRUpdateVersion"];
  [v21 setSafeObject:v13 forKey:@"ReleaseType"];
  [v21 setSafeObject:v17 forKey:@"PrerequisiteBuild"];

  [v21 setSafeObject:v16 forKey:@"PrerequisiteOSVersion"];
  [v21 setSafeObject:v15 forKey:@"AssetPurpose"];

  if (v13
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v13 containsString:@"Internal"] & 1) != 0)
  {
    v23 = @"PreRelease";
  }
  else
  {
    v23 = @"Release";
  }
  [v21 setSafeObject:v23 forKey:@"SUDocumentationID"];
  [v21 setSafeObject:@"SimulatedBaseURL" forKey:@"__BaseURL"];
  [v21 setSafeObject:@"SimulatedRelativePath" forKey:@"__RelativePath"];
  if ([v46 containsString:@"Documentation"])
  {
    [v21 setSafeObject:@"SimulatedDevice" forKey:@"Device"];
    v24 = [NSNumber numberWithLong:1234];
    [v21 setSafeObject:v24 forKey:@"SUSLAVersionRequired"];
  }
  else
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"SimulatedSupportedDeviceModels", 0);
    [v21 setSafeObject:v24 forKey:@"SupportedDeviceModels"];
    v25 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"SimulatedSupportedDevices", 0);
    [v21 setSafeObject:v25 forKey:@"SupportedDevices"];
    [v21 setSafeObject:@"SimulatedSystemName" forKey:@"SUProductSystemName"];
    [v21 setSafeObject:@"Apple Inc." forKey:@"SUPublisher"];
    [v21 setSafeObject:v20 forKey:@"RSEPDigest"];
    [v21 setSafeObject:v20 forKey:@"SEPDigest"];
    uint64_t v26 = MEMORY[0x263EFFA88];
    [v21 setSafeObject:MEMORY[0x263EFFA88] forKey:@"SUInstallTonightEnabled"];
    [v21 setSafeObject:v26 forKey:@"SUMultiPassEnabled"];
    [v21 setSafeObject:v26 forKey:@"SUConvReqd"];
    [v21 setSafeObject:@"1234" forKey:@"InstallationSize-Snapshot"];
    [v21 setSafeObject:@"1234" forKey:@"InstallationSize"];
    v27 = [NSNumber numberWithLong:1234];
    [v21 setSafeObject:v27 forKey:@"MinimumSystemPartition"];

    v28 = [NSNumber numberWithLong:1234];
    [v21 setSafeObject:v28 forKey:@"ActualMinimumSystemPartition"];

    [v21 setSafeObject:@"https://ns.itunes.apple.com/nowserving" forKey:@"__QueuingServiceURL"];
    [v21 setSafeObject:@"https://xp.apple.com/report" forKey:@"_EventRecordingServiceURL"];
    id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v30 = [NSNumber numberWithLong:80];
    [v29 setSafeObject:v30 forKey:@"8"];

    v31 = [NSNumber numberWithLong:160];
    [v29 setSafeObject:v31 forKey:@"16"];

    v32 = [NSNumber numberWithLong:320];
    [v29 setSafeObject:v32 forKey:@"32"];

    v33 = [NSNumber numberWithLong:640];
    [v29 setSafeObject:v33 forKey:@"64"];

    v34 = [NSNumber numberWithLong:1280];
    [v29 setSafeObject:v34 forKey:@"128"];

    v35 = [NSNumber numberWithLong:1280];
    [v29 setSafeObject:v35 forKey:@"256"];

    v36 = [NSNumber numberWithLong:1280];
    [v29 setSafeObject:v36 forKey:@"512"];

    v37 = [NSNumber numberWithLong:1280];
    [v29 setSafeObject:v37 forKey:@"768"];

    v38 = [NSNumber numberWithLong:1280];
    [v29 setSafeObject:v38 forKey:@"1024"];

    [v21 setSafeObject:v29 forKey:@"SystemPartitionPadding"];
  }

  [v21 setSafeObject:v20 forKey:@"_Measurement"];
  [v21 setSafeObject:@"SHA-1" forKey:@"_MeasurementAlgorithm"];
  uint64_t v39 = MEMORY[0x263EFFA88];
  [v21 setSafeObject:MEMORY[0x263EFFA88] forKey:@"__CanUseLocalCacheServer"];
  [v21 setSafeObject:v39 forKey:@"_IsZipStreamable"];
  [v21 setSafeObject:@"NeverCollected" forKey:@"__AssetDefaultGarbageCollectionBehavior"];
  v40 = [NSNumber numberWithLong:1234];
  [v21 setSafeObject:v40 forKey:@"_UnarchivedSize"];

  v41 = [NSNumber numberWithLong:1234];
  [v21 setSafeObject:v41 forKey:@"_DownloadSize"];

  [v21 setSafeObject:@"zip" forKey:@"_CompressionAlgorithm"];
  id v42 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v42 setSafeObject:v46 forKey:@"AssetType"];
  [v42 setSafeObject:@"SimulatedSoftwareUpdateAssetId" forKey:@"AssetId"];
  v43 = [NSNumber numberWithLong:1];
  [v42 setSafeObject:v43 forKey:@"AssetState"];

  v48[0] = @"AssetProperties";
  v48[1] = @"AssetAddedProperties";
  v49[0] = v21;
  v49[1] = v42;
  v44 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];

  return v44;
}

id _getNewDocumentationMAAssetAttributesDictionary(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  v26[2] = *MEMORY[0x263EF8340];
  int v24 = -272716322;
  v9 = (objc_class *)MEMORY[0x263EFF8F8];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  id v14 = a1;
  id v15 = (void *)[[v9 alloc] initWithBytes:&v24 length:4];
  id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v16 setSafeObject:v13 forKey:@"Build"];

  [v16 setSafeObject:v12 forKey:@"OSVersion"];
  [v16 setSafeObject:v11 forKey:@"SUDocumentationID"];

  [v16 setSafeObject:v10 forKey:@"AssetPurpose"];
  [v16 setSafeObject:v15 forKey:@"_Measurement"];
  [v16 setSafeObject:@"SHA-1" forKey:@"_MeasurementAlgorithm"];
  uint64_t v17 = MEMORY[0x263EFFA88];
  [v16 setSafeObject:MEMORY[0x263EFFA88] forKey:@"__CanUseLocalCacheServer"];
  [v16 setSafeObject:v17 forKey:@"_IsZipStreamable"];
  [v16 setSafeObject:@"NeverCollected" forKey:@"__AssetDefaultGarbageCollectionBehavior"];
  id v18 = [NSNumber numberWithLong:1234];
  [v16 setSafeObject:v18 forKey:@"_UnarchivedSize"];

  id v19 = [NSNumber numberWithLong:1234];
  [v16 setSafeObject:v19 forKey:@"_DownloadSize"];

  [v16 setSafeObject:@"zip" forKey:@"_CompressionAlgorithm"];
  id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v20 setSafeObject:v14 forKey:@"AssetType"];

  [v20 setSafeObject:@"SimulatedDocAssetId" forKey:@"AssetId"];
  id v21 = [NSNumber numberWithLong:1];
  [v20 setSafeObject:v21 forKey:@"AssetState"];

  v25[0] = @"AssetProperties";
  v25[1] = @"AssetAddedProperties";
  v26[0] = v16;
  v26[1] = v20;
  v22 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

  return v22;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_20C906014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_20C90FA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x210550B20](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_20C91057C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t __Block_byref_object_copy__90(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__91(uint64_t a1)
{
}

void sub_20C910988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C910C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C910FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
}

void sub_20C911304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20C9116D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C911FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C912238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C912530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C9126F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id getUIImageClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getUIImageClass_softClass;
  uint64_t v7 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getUIImageClass_block_invoke;
    v3[3] = &unk_2640DD5A8;
    v3[4] = &v4;
    __getUIImageClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_20C921F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIImageClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __UIKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2640DD5C8;
    uint64_t v6 = 0;
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!UIKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("UIImage");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getUIImageClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getUIImageClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __UIKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  UIKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_20C92CD78(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    id v3 = +[SUCoreDDMUtilities sharedLogger];
    uint64_t v4 = [v3 oslog];

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __61__SUCorePolicyDDMConfiguration_initWithStatePersistencePath___block_invoke_cold_1();
    }

    objc_end_catch();
    JUMPOUT(0x20C92CD48);
  }
  _Unwind_Resume(exception_object);
}

void sub_20C92D290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C92D890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_20C92D9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C92DD38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20C92E1D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C92E4FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C92E8D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C92EC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C92F1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C92F408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_20C92F7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C92FABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20C93013C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20C9303F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_20C933C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_20C938C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

void sub_20C938E9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20C9390A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_20C939264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_20C93BC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SUCoreStringForDDMStatusNotificationType(unsigned int a1)
{
  if (a1 > 4) {
    return @"Unknown";
  }
  else {
    return off_2640DDA28[(__int16)a1];
  }
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t preflightSUDownloadCallback(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F77DE8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [a1 safeDescriptionWithName:@"status"];
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_20C8EA000, v3, OS_LOG_TYPE_DEFAULT, "[MSU] software update preflight download SU %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

uint64_t preflightPersonalizeCallback(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F77DE8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [a1 safeDescriptionWithName:@"status"];
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_20C8EA000, v3, OS_LOG_TYPE_DEFAULT, "[MSU] preflight personalize %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

uint64_t preflightFDRRecoveryCallback(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F77DE8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [a1 safeDescriptionWithName:@"status"];
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_20C8EA000, v3, OS_LOG_TYPE_DEFAULT, "[MSU] preflight FDRRecovery %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

uint64_t preflightWakeupCallback(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F77DE8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [a1 safeDescriptionWithName:@"status"];
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_20C8EA000, v3, OS_LOG_TYPE_DEFAULT, "[MSU] preflight wakeup %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

uint64_t preflightPrerequisiteCheckCallback(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F77DE8] sharedLogger];
  id v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [a1 safeDescriptionWithName:@"status"];
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl(&dword_20C8EA000, v3, OS_LOG_TYPE_DEFAULT, "[MSU] preflight prerequisite check %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

void sub_20C97121C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

uint64_t prepareCallback(uint64_t a1, void **a2)
{
  if (!a2)
  {
    int v6 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      prepareCallback_cold_1();
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v7 = [v8 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      prepareCallback_cold_2();
    }
LABEL_10:

    return 0;
  }
  uint64_t v4 = *a2;

  return [v4 prepareProgress:a1];
}

void sub_20C971F78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t applyCallback(uint64_t a1, void **a2)
{
  if (!a2)
  {
    int v6 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v7 = [v6 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      applyCallback_cold_1();
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x263F77DE8] sharedLogger];
    uint64_t v7 = [v8 oslog];

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      applyCallback_cold_2();
    }
LABEL_10:

    return 0;
  }
  uint64_t v4 = *a2;

  return [v4 applyProgress:a1];
}

void sub_20C97415C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_20C981AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __getUIImageClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[SUCorePolicyDDMConfiguration initWithStatePersistencePath:](v0);
}

void prepareCallback_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "[MSU] prepare callback with NULL context", v2, v3, v4, v5, v6);
}

void prepareCallback_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "[MSU] prepare callback with invalid context", v2, v3, v4, v5, v6);
}

void applyCallback_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "[MSU] apply callback with NULL context", v2, v3, v4, v5, v6);
}

void applyCallback_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_20C8EA000, v0, v1, "[MSU] apply callback with invalid context", v2, v3, v4, v5, v6);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x270EE4578](bundle, key, value, tableName);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t CacheDeleteCopyAvailableSpaceForVolume()
{
  return MEMORY[0x270F13080]();
}

uint64_t CacheDeleteCopyPurgeableSpaceWithInfo()
{
  return MEMORY[0x270F13090]();
}

uint64_t CacheDeletePurgeSpaceWithInfo()
{
  return MEMORY[0x270F130A8]();
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x270EF4840](AssertionType, *(void *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x270EF4868](*(void *)&AssertionID);
}

uint64_t MAPurgeAll()
{
  return MEMORY[0x270F4A900]();
}

uint64_t MAPurgeAllExceptGivenIds()
{
  return MEMORY[0x270F4A908]();
}

uint64_t MAStringForMADownloadResult()
{
  return MEMORY[0x270F4A930]();
}

uint64_t MAStringForMAQueryResult()
{
  return MEMORY[0x270F4A948]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MSUApplyUpdate()
{
  return MEMORY[0x270F4AEE8]();
}

uint64_t MSUAssetCalculateApplySize()
{
  return MEMORY[0x270F4AEF0]();
}

uint64_t MSUAssetCalculatePrepareSize()
{
  return MEMORY[0x270F4AEF8]();
}

uint64_t MSUBrainIsLoadable()
{
  return MEMORY[0x270F4AF00]();
}

uint64_t MSUCommitStash()
{
  return MEMORY[0x270F4AF08]();
}

uint64_t MSUGetUpdateInfo()
{
  return MEMORY[0x270F4AF10]();
}

uint64_t MSUPreflightUpdate()
{
  return MEMORY[0x270F4AF18]();
}

uint64_t MSUPrepareUpdate()
{
  return MEMORY[0x270F4AF20]();
}

uint64_t MSUPrepareUpdateWithMAAsset()
{
  return MEMORY[0x270F4AF28]();
}

uint64_t MSUPurgeSuspendedUpdate()
{
  return MEMORY[0x270F4AF30]();
}

uint64_t MSUResumeUpdateWithOptions()
{
  return MEMORY[0x270F4AF38]();
}

uint64_t MSURetrievePreviousUpdateState()
{
  return MEMORY[0x270F4AF40]();
}

uint64_t MSUSuspendUpdate()
{
  return MEMORY[0x270F4AF48]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MSUPreferencesGetAppBooleanValueWithDefaultValue()
{
  return MEMORY[0x270F4AF60]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x270ED8F50](*(void *)&a1, a2, a3);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9AB8](a1, a2, a3, *(void *)&a4);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x270ED9BA0](a1, a2, a3, a4, *(void *)&a5);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return MEMORY[0x270EDAB60]();
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x270EDB570](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

uint64_t xpc_activity_copy_identifier()
{
  return MEMORY[0x270EDBCB0]();
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

uint64_t xpc_set_event()
{
  return MEMORY[0x270EDC398]();
}