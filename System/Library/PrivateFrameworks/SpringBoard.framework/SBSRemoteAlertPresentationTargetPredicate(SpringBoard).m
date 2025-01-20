@interface SBSRemoteAlertPresentationTargetPredicate(SpringBoard)
- (id)_launchingApplicationRecord;
- (id)targetApplicationWithController:()SpringBoard;
- (uint64_t)matchesOverlayViewController:()SpringBoard;
- (void)_launchingApplicationRecord;
- (void)configureTransientOverlayContext:()SpringBoard;
@end

@implementation SBSRemoteAlertPresentationTargetPredicate(SpringBoard)

- (id)targetApplicationWithController:()SpringBoard
{
  id v4 = a3;
  v5 = [a1 process];
  uint64_t v6 = [a1 launchingApplicationIdentity];
  v7 = (void *)v6;
  if (v5)
  {
    v8 = objc_msgSend(v4, "applicationWithPid:", objc_msgSend(v5, "pid"));
  }
  else if (v6)
  {
    v9 = [a1 _launchingApplicationRecord];
    v10 = [v9 bundleIdentifier];

    v8 = [v4 applicationWithBundleIdentifier:v10];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)matchesOverlayViewController:()SpringBoard
{
  id v4 = a3;
  v5 = [a1 process];
  uint64_t v6 = [a1 launchingApplicationIdentity];
  v7 = (void *)v6;
  if (v5)
  {
    uint64_t v8 = [v4 isPresentedByProcess:v5];
  }
  else if (v6)
  {
    v9 = [a1 _launchingApplicationRecord];
    v10 = [v9 bundleIdentifier];

    uint64_t v8 = [v4 isPresentedByBundleIdentifier:v10];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)configureTransientOverlayContext:()SpringBoard
{
  id v5 = a3;
  id v4 = [a1 process];
  if (v4) {
    [v5 setOriginatingProcess:v4];
  }
}

- (id)_launchingApplicationRecord
{
  v1 = [a1 launchingApplicationIdentity];
  id v6 = 0;
  v2 = [v1 findApplicationRecordWithError:&v6];
  id v3 = v6;

  if (v3)
  {
    id v4 = SBLogTransientOverlay();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(SBSRemoteAlertPresentationTargetPredicate(SpringBoard) *)(uint64_t)v3 _launchingApplicationRecord];
    }
  }
  return v2;
}

- (void)_launchingApplicationRecord
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "could not find app record for app identity. error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end