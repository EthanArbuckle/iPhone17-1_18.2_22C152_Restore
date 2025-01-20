@interface PBBridgeAkashiReporter
+ (id)descriptionForSetUpType:(unint64_t)a3;
+ (void)incrementSetUpEvent:(unint64_t)a3;
@end

@implementation PBBridgeAkashiReporter

+ (id)descriptionForSetUpType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      uint64_t v8 = v3;
      uint64_t v9 = v4;
      v5 = pbb_shared_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_21C445000, v5, OS_LOG_TYPE_DEFAULT, "Unexpcted PBCAAkashiEvent.", v7, 2u);
      }

      id result = &stru_26CC94B60;
      break;
    case 1uLL:
      id result = @"CellularPaneShown";
      break;
    case 2uLL:
      id result = @"CellularPaneSkippedAreadySetUp";
      break;
    case 3uLL:
      id result = @"CellularPaneSkippedBlocked";
      break;
    case 4uLL:
      id result = @"CellularShownSpinner";
      break;
    case 5uLL:
      id result = @"CellularShownSetUpNow";
      break;
    case 6uLL:
      id result = @"CellularShownContinue";
      break;
    case 7uLL:
      id result = @"CellularShownPreinstallSpinner";
      break;
    case 8uLL:
      id result = @"CellularShownTrialOffer";
      break;
    case 9uLL:
      id result = @"CellularShownError";
      break;
    case 0xAuLL:
      id result = @"CellularShownConsentRequest";
      break;
    case 0xBuLL:
      id result = @"CellularUserTappedSkip";
      break;
    case 0xCuLL:
      id result = @"CellularUserTappedSetUpNow";
      break;
    case 0xDuLL:
      id result = @"CellularUserTappedNext";
      break;
    case 0xEuLL:
      id result = @"CellularUserTappedConsent";
      break;
    case 0xFuLL:
      id result = @"CellularUserTappedTransfer";
      break;
    case 0x10uLL:
      id result = @"CellularUserTappedSetUpNew";
      break;
    default:
      id result = &stru_26CC94B60;
      break;
  }
  return result;
}

+ (void)incrementSetUpEvent:(unint64_t)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  v5 = @"setUpType";
  uint64_t v3 = +[PBBridgeAkashiReporter descriptionForSetUpType:a3];
  v6[0] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  AnalyticsSendEvent();
}

@end