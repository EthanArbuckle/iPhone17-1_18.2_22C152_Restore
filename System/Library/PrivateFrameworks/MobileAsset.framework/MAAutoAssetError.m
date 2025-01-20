@interface MAAutoAssetError
+ (id)buildError:(int64_t)a3 fromOperation:(id)a4 underlyingError:(id)a5 withDescription:(id)a6;
+ (id)summaryForCode:(int64_t)a3 fromOperation:(id)a4;
@end

@implementation MAAutoAssetError

+ (id)buildError:(int64_t)a3 fromOperation:(id)a4 underlyingError:(id)a5 withDescription:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a4;
  v12 = objc_opt_new();
  v13 = +[MAAutoAssetError summaryForCode:a3 fromOperation:v11];

  id v14 = [NSString alloc];
  if (v10) {
    uint64_t v15 = [v14 initWithFormat:@"[%@] %@", v13, v10];
  }
  else {
    uint64_t v15 = [v14 initWithFormat:@"[%@]", v13, v19];
  }
  v16 = (void *)v15;
  if (v15) {
    [v12 setObject:v15 forKey:*MEMORY[0x1E4F28568]];
  }
  if (v9) {
    [v12 setObject:v9 forKey:*MEMORY[0x1E4F28A50]];
  }
  v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.MobileAssetError.AutoAsset" code:a3 userInfo:v12];

  return v17;
}

+ (id)summaryForCode:(int64_t)a3 fromOperation:(id)a4
{
  v4 = @"MAAutoAssetError";
  if (a3 <= 6530)
  {
    if (a3 <= 6200)
    {
      switch(a3)
      {
        case 6101:
          v4 = @"ResourceUnavailable";
          break;
        case 6102:
          v4 = @"MissingParameter";
          break;
        case 6103:
          v4 = @"InvalidInstance";
          break;
        case 6104:
          v4 = @"CommunicationFailure";
          break;
        case 6105:
          v4 = @"OperationTimedOut";
          break;
        case 6106:
          v4 = @"UnknownOperation";
          break;
        case 6107:
          v4 = @"UnderlyingError";
          break;
        case 6108:
          v4 = @"InvalidValue";
          break;
        case 6109:
          v4 = @"TooManyEntries";
          break;
        case 6110:
          v4 = @"NoValidEntries";
          break;
        case 6111:
          v4 = @"MissingReference";
          break;
        case 6112:
          v4 = @"NotSupportedForSimulator";
          break;
        case 6113:
          v4 = @"BusyPerformingOperation";
          break;
        case 6114:
          v4 = @"EliminationInProgress";
          break;
        case 6115:
          v4 = @"OperationCanceled";
          break;
        default:
          v7 = @"SUCCESS";
          BOOL v8 = a3 == 0;
LABEL_64:
          if (v8) {
            v4 = v7;
          }
          break;
      }
    }
    else if (a3 > 6300)
    {
      switch(a3)
      {
        case 6501:
          v4 = @"NotCurrentlyLocked";
          break;
        case 6502:
          v4 = @"LockInitiatedNoWait";
          break;
        case 6503:
          v4 = @"LockNoWaitNoDownloadedAsset";
          break;
        case 6504:
          v4 = @"LockAttemptedNoDownloadedAsset";
          break;
        case 6505:
          v4 = @"LockTimeoutNoDownloadedAsset";
          break;
        default:
          uint64_t v5 = 6301;
          v6 = @"NotAwareOfAsset";
          if (a3 == 6401) {
            v4 = @"DownloadPostponed";
          }
          goto LABEL_20;
      }
    }
    else
    {
      switch(a3)
      {
        case 6201:
          v4 = @"NoVersionFound";
          break;
        case 6202:
          v4 = @"NewerVersionRevoked";
          break;
        case 6203:
          v4 = @"AvailableVersionRevoked";
          break;
        case 6204:
          v4 = @"CheckInitiatedNoWait";
          break;
        case 6205:
          v4 = @"SameVersionFound";
          break;
        case 6206:
          v4 = @"CheckNoWaitNoDownloadedAsset";
          break;
        case 6207:
          v4 = @"CheckAttemptedNoDownloadedAsset";
          break;
        case 6208:
          v4 = @"CheckTimeoutNoDownloadedAsset";
          break;
        case 6209:
          v4 = @"NotEnoughSpaceForSetDownload";
          break;
        case 6210:
          v4 = @"SomeContentNotAvailable";
          break;
        default:
          BOOL v8 = a3 == 6251;
          v7 = @"CheckNoWaitNoDownloadedInstance";
          goto LABEL_64;
      }
    }
  }
  else if (a3 > 6700)
  {
    uint64_t v5 = 6701;
    v6 = @"BlockedNoNetwork";
    if (a3 == 6801) {
      v4 = @"NotImplemented";
    }
    if (a3 == 6702) {
      v4 = @"BlockedRecentUserActivity";
    }
LABEL_20:
    if (a3 == v5) {
      v4 = v6;
    }
  }
  else
  {
    switch(a3)
    {
      case 6531:
        v4 = @"NotSecureAssetFormat";
        break;
      case 6532:
        v4 = @"SecureOperationInProgress";
        break;
      case 6533:
        v4 = @"WouldRequireNetwork";
        break;
      case 6534:
        v4 = @"SecureOperationFailure";
        break;
      case 6535:
        v4 = @"SecureUnableToPersonalize";
        break;
      case 6536:
        v4 = @"SecureUnableToBeginAccess";
        break;
      case 6537:
        v4 = @"SecureUnableToMapToExclave";
        break;
      case 6551:
        v4 = @"SetAtomicInstanceUnknown";
        break;
      case 6552:
        v4 = @"SetSubAtomicInstanceUnavailable";
        break;
      case 6553:
        v4 = @"SetSubAtomicInstanceReference";
        break;
      case 6554:
        v4 = @"SetConfigurationInvalid";
        break;
      case 6555:
        v4 = @"SetEmptyEntriesNotValid";
        break;
      case 6556:
        v4 = @"SetNoneFoundServerSide";
        break;
      case 6557:
        v4 = @"SetAtomicInstanceOrphaned";
        break;
      case 6558:
        v4 = @"SetIdentifierNotFound";
        break;
      case 6570:
        v4 = @"PolicyInvalidClientRequest";
        break;
      case 6571:
        v4 = @"PolicyInvalidUserInitiated";
        break;
      case 6572:
        v4 = @"PolicyInvalidLockInhibits";
        break;
      case 6573:
        v4 = @"PolicyInvalidBlockCheck";
        break;
      case 6580:
        v4 = @"InvalidForLockerMode";
        break;
      case 6581:
        v4 = @"RestrictedToLockerMode";
        break;
      case 6582:
        v4 = @"NoSharedLock";
        break;
      case 6583:
        v4 = @"FailedSharedLockPreparation";
        break;
      case 6584:
        v4 = @"ShortTermLocked";
        break;
      case 6601:
        v4 = @"StagingOperationReplaced";
        break;
      case 6602:
        v4 = @"StagingDetermineUnableWhenRequired";
        break;
      case 6603:
        v4 = @"StagingDetermineUnableNoRequired";
        break;
      case 6604:
        v4 = @"StagingDetermineAlreadyDownloading";
        break;
      case 6605:
        v4 = @"StagingDetermineAlreadyDownloaded";
        break;
      case 6606:
        v4 = @"StagingWrongMode";
        break;
      case 6607:
        v4 = @"StagingAlreadyDetermining";
        break;
      case 6608:
        v4 = @"StagingNoGroupsStaged";
        break;
      case 6609:
        v4 = @"StagingOperationCanceled";
        break;
      case 6611:
        v4 = @"StagingDownloadUnableWhenRequired";
        break;
      case 6612:
        v4 = @"StagingDifferentClientThanLatched";
        break;
      case 6613:
        v4 = @"StagingSpecifierNotInLookupResults";
        break;
      default:
        return (id)[NSString stringWithFormat:@"%@:%@(%lld)", a4, v4, a3];
    }
  }
  return (id)[NSString stringWithFormat:@"%@:%@(%lld)", a4, v4, a3];
}

@end