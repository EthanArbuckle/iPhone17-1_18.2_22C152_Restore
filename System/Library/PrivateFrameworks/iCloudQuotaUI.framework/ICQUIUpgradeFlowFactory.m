@interface ICQUIUpgradeFlowFactory
+ (Class)flowManagerClassForOfferType:(int64_t)a3;
@end

@implementation ICQUIUpgradeFlowFactory

+ (Class)flowManagerClassForOfferType:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0:
      v3 = _ICQGetLogSystem();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "Unknown flow type.", (uint8_t *)&v10, 2u);
      }
      goto LABEL_6;
    case 1:
    case 2:
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
      uint64_t v5 = objc_opt_class();
      if (!v5) {
        goto LABEL_10;
      }
      v6 = (void *)v5;
      v7 = _ICQGetLogSystem();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v10 = 138412290;
      v11 = v6;
      v8 = "Using flow manager of class: %@";
      break;
    case 5:
      v3 = _ICQGetLogSystem();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = _ICQStringForOfferType();
        int v10 = 138543362;
        v11 = v4;
        _os_log_impl(&dword_22C821000, v3, OS_LOG_TYPE_DEFAULT, "unexpected offer type %{public}@ - should not need a flow manager", (uint8_t *)&v10, 0xCu);
      }
LABEL_6:

      goto LABEL_10;
    default:
LABEL_10:
      v6 = objc_opt_class();
      v7 = _ICQGetLogSystem();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      int v10 = 138412290;
      v11 = v6;
      v8 = "No flow manager was assigned. Using workaround with base class: %@";
      break;
  }
  _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0xCu);
LABEL_13:

  return (Class)v6;
}

@end