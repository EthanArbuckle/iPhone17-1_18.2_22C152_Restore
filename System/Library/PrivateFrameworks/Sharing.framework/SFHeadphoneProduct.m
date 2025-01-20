@interface SFHeadphoneProduct
+ (SFHeadphoneProduct)airPods;
+ (SFHeadphoneProduct)airPodsMax;
+ (SFHeadphoneProduct)airPodsPro;
+ (SFHeadphoneProduct)airPodsSecondGeneration;
+ (SFHeadphoneProduct)b453;
+ (SFHeadphoneProduct)b463;
+ (SFHeadphoneProduct)b465;
+ (SFHeadphoneProduct)b487;
+ (SFHeadphoneProduct)b494;
+ (SFHeadphoneProduct)b498;
+ (SFHeadphoneProduct)b507;
+ (SFHeadphoneProduct)b607;
+ (SFHeadphoneProduct)b688;
+ (SFHeadphoneProduct)b698;
+ (SFHeadphoneProduct)b768e;
+ (SFHeadphoneProduct)b768m;
+ (SFHeadphoneProduct)beatsFlex;
+ (SFHeadphoneProduct)beatsSolo;
+ (SFHeadphoneProduct)beatsSoloPro;
+ (SFHeadphoneProduct)beatsStudio;
+ (SFHeadphoneProduct)beatsX;
+ (SFHeadphoneProduct)powerBeats3;
+ (SFHeadphoneProduct)powerBeats4;
+ (SFHeadphoneProduct)powerBeatsPro;
- (BOOL)hasAddressInAdvertisement;
- (BOOL)hasCaseBT;
- (BOOL)hasCaseWithoutBattery;
- (BOOL)hasLid;
- (BOOL)hasSplitBattery;
- (BOOL)hasSplitCaseColors;
- (BOOL)hasW1Chip;
- (BOOL)ignoresBatteryStatusIfCounterfeit;
- (BOOL)isAirPods;
- (BOOL)showsStatus;
- (BOOL)showsStatusOutOfCase;
- (BOOL)supportsAdaptiveControlsProx;
- (BOOL)supportsCounterfeitDetection;
- (BOOL)supportsDigitalEngraving;
- (BOOL)supportsEndCallProx;
- (BOOL)supportsFindMyNetwork;
- (BOOL)supportsMobileAsset;
- (BOOL)supportsMuteCallProx;
- (BOOL)supportsOptimizedBatteryCharging;
- (BOOL)supportsRepair;
- (BOOL)supportsSiri;
- (BOOL)supportsSpatialAudio;
- (BOOL)supportsWirelessSplitterInEar;
- (BOOL)usesProductCaseName;
- (NSString)bluetoothModel;
- (SFHeadphoneProduct)initWithBluetoothModel:(id)a3;
- (SFHeadphoneProduct)initWithModel:(unint64_t)a3;
- (SFHeadphoneProduct)initWithProductID:(unsigned int)a3;
- (SFHeadphoneProduct)initWithProductID:(unsigned int)a3 supportsMobileAsset:(BOOL)a4;
- (unint64_t)buttonLocation;
- (unint64_t)model;
- (unsigned)altProductID;
- (unsigned)productID;
- (void)setAltProductID:(unsigned int)a3;
- (void)setBluetoothModel:(id)a3;
- (void)setButtonLocation:(unint64_t)a3;
- (void)setHasAddressInAdvertisement:(BOOL)a3;
- (void)setHasCaseBT:(BOOL)a3;
- (void)setHasCaseWithoutBattery:(BOOL)a3;
- (void)setHasLid:(BOOL)a3;
- (void)setHasSplitBattery:(BOOL)a3;
- (void)setHasSplitCaseColors:(BOOL)a3;
- (void)setHasW1Chip:(BOOL)a3;
- (void)setIgnoresBatteryStatusIfCounterfeit:(BOOL)a3;
- (void)setIsAirPods:(BOOL)a3;
- (void)setModel:(unint64_t)a3;
- (void)setProductID:(unsigned int)a3;
- (void)setShowsStatus:(BOOL)a3;
- (void)setShowsStatusOutOfCase:(BOOL)a3;
- (void)setSupportsAdaptiveControlsProx:(BOOL)a3;
- (void)setSupportsCounterfeitDetection:(BOOL)a3;
- (void)setSupportsDigitalEngraving:(BOOL)a3;
- (void)setSupportsEndCallProx:(BOOL)a3;
- (void)setSupportsFindMyNetwork:(BOOL)a3;
- (void)setSupportsMobileAsset:(BOOL)a3;
- (void)setSupportsMuteCallProx:(BOOL)a3;
- (void)setSupportsOptimizedBatteryCharging:(BOOL)a3;
- (void)setSupportsRepair:(BOOL)a3;
- (void)setSupportsSiri:(BOOL)a3;
- (void)setSupportsSpatialAudio:(BOOL)a3;
- (void)setSupportsWirelessSplitterInEar:(BOOL)a3;
- (void)setUsesProductCaseName:(BOOL)a3;
@end

@implementation SFHeadphoneProduct

- (SFHeadphoneProduct)initWithProductID:(unsigned int)a3 supportsMobileAsset:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SFHeadphoneProduct;
  result = [(SFHeadphoneProduct *)&v7 init];
  result->_supportsMobileAsset = a4;
  result->_productID = a3;
  result->_altProductID = -1;
  return result;
}

- (SFHeadphoneProduct)initWithModel:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      uint64_t v4 = +[SFHeadphoneProduct airPods];
      goto LABEL_26;
    case 2uLL:
      uint64_t v4 = +[SFHeadphoneProduct airPodsSecondGeneration];
      goto LABEL_26;
    case 3uLL:
      uint64_t v4 = +[SFHeadphoneProduct airPodsPro];
      goto LABEL_26;
    case 4uLL:
      uint64_t v4 = +[SFHeadphoneProduct airPodsMax];
      goto LABEL_26;
    case 5uLL:
      uint64_t v4 = +[SFHeadphoneProduct beatsSolo];
      goto LABEL_26;
    case 6uLL:
      uint64_t v4 = +[SFHeadphoneProduct beatsSoloPro];
      goto LABEL_26;
    case 7uLL:
      uint64_t v4 = +[SFHeadphoneProduct beatsStudio];
      goto LABEL_26;
    case 8uLL:
      uint64_t v4 = +[SFHeadphoneProduct beatsX];
      goto LABEL_26;
    case 9uLL:
      uint64_t v4 = +[SFHeadphoneProduct beatsFlex];
      goto LABEL_26;
    case 0xAuLL:
      uint64_t v4 = +[SFHeadphoneProduct powerBeats3];
      goto LABEL_26;
    case 0xBuLL:
      uint64_t v4 = +[SFHeadphoneProduct powerBeats4];
      goto LABEL_26;
    case 0xCuLL:
      uint64_t v4 = +[SFHeadphoneProduct powerBeatsPro];
      goto LABEL_26;
    case 0xDuLL:
      uint64_t v4 = +[SFHeadphoneProduct b507];
      goto LABEL_26;
    case 0xEuLL:
      uint64_t v4 = +[SFHeadphoneProduct b688];
      goto LABEL_26;
    case 0xFuLL:
      uint64_t v4 = +[SFHeadphoneProduct b494];
      goto LABEL_26;
    case 0x10uLL:
      uint64_t v4 = +[SFHeadphoneProduct b607];
      goto LABEL_26;
    case 0x11uLL:
      uint64_t v4 = +[SFHeadphoneProduct b453];
      goto LABEL_26;
    case 0x12uLL:
      uint64_t v4 = +[SFHeadphoneProduct b465];
      goto LABEL_26;
    case 0x13uLL:
      uint64_t v4 = +[SFHeadphoneProduct b768e];
      goto LABEL_26;
    case 0x14uLL:
      uint64_t v4 = +[SFHeadphoneProduct b768m];
      goto LABEL_26;
    case 0x15uLL:
      uint64_t v4 = +[SFHeadphoneProduct b487];
      goto LABEL_26;
    case 0x16uLL:
      uint64_t v4 = +[SFHeadphoneProduct b498];
      goto LABEL_26;
    case 0x17uLL:
      uint64_t v4 = +[SFHeadphoneProduct b463];
LABEL_26:
      v5 = (SFHeadphoneProduct *)v4;
      break;
    default:
      v5 = 0;
      break;
  }

  return v5;
}

- (SFHeadphoneProduct)initWithBluetoothModel:(id)a3
{
  id v4 = a3;
  v5 = +[SFHeadphoneProduct b507];
  v6 = [v5 bluetoothModel];
  int v7 = [v4 isEqualToString:v6];

  if (v7)
  {
    uint64_t v8 = +[SFHeadphoneProduct b507];
  }
  else
  {
    v9 = +[SFHeadphoneProduct b688];
    v10 = [v9 bluetoothModel];
    int v11 = [v4 isEqualToString:v10];

    if (v11)
    {
      uint64_t v8 = +[SFHeadphoneProduct b688];
    }
    else
    {
      v12 = +[SFHeadphoneProduct b494];
      v13 = [v12 bluetoothModel];
      int v14 = [v4 isEqualToString:v13];

      if (v14)
      {
        uint64_t v8 = +[SFHeadphoneProduct b494];
      }
      else
      {
        v15 = +[SFHeadphoneProduct b698];
        v16 = [v15 bluetoothModel];
        int v17 = [v4 isEqualToString:v16];

        if (v17)
        {
          uint64_t v8 = +[SFHeadphoneProduct b698];
        }
        else
        {
          v18 = +[SFHeadphoneProduct b607];
          v19 = [v18 bluetoothModel];
          int v20 = [v4 isEqualToString:v19];

          if (v20)
          {
            uint64_t v8 = +[SFHeadphoneProduct b607];
          }
          else
          {
            v21 = +[SFHeadphoneProduct b453];
            v22 = [v21 bluetoothModel];
            int v23 = [v4 isEqualToString:v22];

            if (v23)
            {
              uint64_t v8 = +[SFHeadphoneProduct b453];
            }
            else
            {
              v24 = +[SFHeadphoneProduct b465];
              v25 = [v24 bluetoothModel];
              int v26 = [v4 isEqualToString:v25];

              if (v26)
              {
                uint64_t v8 = +[SFHeadphoneProduct b465];
              }
              else
              {
                v27 = +[SFHeadphoneProduct b768e];
                v28 = [v27 bluetoothModel];
                int v29 = [v4 isEqualToString:v28];

                if (v29)
                {
                  uint64_t v8 = +[SFHeadphoneProduct b768e];
                }
                else
                {
                  v30 = +[SFHeadphoneProduct b768m];
                  v31 = [v30 bluetoothModel];
                  int v32 = [v4 isEqualToString:v31];

                  if (v32)
                  {
                    uint64_t v8 = +[SFHeadphoneProduct b768m];
                  }
                  else
                  {
                    v33 = +[SFHeadphoneProduct b487];
                    v34 = [v33 bluetoothModel];
                    int v35 = [v4 isEqualToString:v34];

                    if (v35)
                    {
                      uint64_t v8 = +[SFHeadphoneProduct b487];
                    }
                    else
                    {
                      v36 = +[SFHeadphoneProduct b498];
                      v37 = [v36 bluetoothModel];
                      int v38 = [v4 isEqualToString:v37];

                      if (v38)
                      {
                        uint64_t v8 = +[SFHeadphoneProduct b498];
                      }
                      else
                      {
                        v39 = +[SFHeadphoneProduct b463];
                        v40 = [v39 bluetoothModel];
                        int v41 = [v4 isEqualToString:v40];

                        if (!v41)
                        {
                          v42 = 0;
                          goto LABEL_26;
                        }
                        uint64_t v8 = +[SFHeadphoneProduct b463];
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v42 = (SFHeadphoneProduct *)v8;
LABEL_26:

  return v42;
}

- (SFHeadphoneProduct)initWithProductID:(unsigned int)a3
{
  v5 = +[SFHeadphoneProduct b507];
  int v6 = [v5 productID];

  if (v6 == a3)
  {
    uint64_t v7 = +[SFHeadphoneProduct b507];
LABEL_35:
    int v17 = (SFHeadphoneProduct *)v7;
    goto LABEL_36;
  }
  uint64_t v8 = +[SFHeadphoneProduct b607];
  int v9 = [v8 productID];

  if (v9 == a3)
  {
    uint64_t v7 = +[SFHeadphoneProduct b607];
    goto LABEL_35;
  }
  v10 = +[SFHeadphoneProduct b688];
  int v11 = [v10 productID];

  if (v11 == a3)
  {
    uint64_t v7 = +[SFHeadphoneProduct b688];
    goto LABEL_35;
  }
  v12 = +[SFHeadphoneProduct b494];
  int v13 = [v12 productID];

  if (v13 == a3)
  {
    uint64_t v7 = +[SFHeadphoneProduct b494];
    goto LABEL_35;
  }
  int v14 = +[SFHeadphoneProduct b698];
  int v15 = [v14 productID];

  v16 = +[SFHeadphoneProduct b698];
  int v17 = v16;
  if (v15 != a3)
  {
    unsigned int v18 = [(SFHeadphoneProduct *)v16 altProductID];

    if (v18 == a3)
    {
      uint64_t v7 = +[SFHeadphoneProduct b698];
      goto LABEL_35;
    }
    v19 = +[SFHeadphoneProduct b768e];
    int v20 = [v19 productID];

    v21 = +[SFHeadphoneProduct b768e];
    int v17 = v21;
    if (v20 != a3)
    {
      unsigned int v22 = [(SFHeadphoneProduct *)v21 altProductID];

      if (v22 == a3)
      {
        uint64_t v7 = +[SFHeadphoneProduct b768e];
        goto LABEL_35;
      }
      int v23 = +[SFHeadphoneProduct b768m];
      int v24 = [v23 productID];

      v25 = +[SFHeadphoneProduct b768m];
      int v17 = v25;
      if (v24 != a3)
      {
        unsigned int v26 = [(SFHeadphoneProduct *)v25 altProductID];

        if (v26 == a3)
        {
          uint64_t v7 = +[SFHeadphoneProduct b768m];
          goto LABEL_35;
        }
        v27 = +[SFHeadphoneProduct airPodsPro];
        int v28 = [v27 productID];

        if (v28 == a3)
        {
          uint64_t v7 = +[SFHeadphoneProduct airPodsPro];
          goto LABEL_35;
        }
        int v29 = +[SFHeadphoneProduct airPodsMax];
        int v30 = [v29 altProductID];

        v31 = +[SFHeadphoneProduct airPodsMax];
        int v17 = v31;
        if (v30 != a3)
        {
          unsigned int v32 = [(SFHeadphoneProduct *)v31 productID];

          if (v32 == a3)
          {
            uint64_t v7 = +[SFHeadphoneProduct airPodsMax];
          }
          else
          {
            v33 = +[SFHeadphoneProduct powerBeatsPro];
            int v34 = [v33 productID];

            if (v34 == a3)
            {
              uint64_t v7 = +[SFHeadphoneProduct powerBeatsPro];
            }
            else
            {
              int v35 = +[SFHeadphoneProduct b453];
              int v36 = [v35 productID];

              if (v36 == a3)
              {
                uint64_t v7 = +[SFHeadphoneProduct b453];
              }
              else
              {
                v37 = +[SFHeadphoneProduct b465];
                int v38 = [v37 productID];

                if (v38 == a3)
                {
                  uint64_t v7 = +[SFHeadphoneProduct b465];
                }
                else
                {
                  v39 = +[SFHeadphoneProduct b487];
                  int v40 = [v39 productID];

                  if (v40 == a3)
                  {
                    uint64_t v7 = +[SFHeadphoneProduct b487];
                  }
                  else
                  {
                    int v41 = +[SFHeadphoneProduct b498];
                    int v42 = [v41 productID];

                    if (v42 == a3)
                    {
                      uint64_t v7 = +[SFHeadphoneProduct b498];
                    }
                    else
                    {
                      v43 = +[SFHeadphoneProduct b463];
                      int v44 = [v43 productID];

                      if (v44 != a3)
                      {
                        int v17 = 0;
                        goto LABEL_36;
                      }
                      uint64_t v7 = +[SFHeadphoneProduct b463];
                    }
                  }
                }
              }
            }
          }
          goto LABEL_35;
        }
      }
    }
  }
LABEL_36:

  return v17;
}

+ (SFHeadphoneProduct)airPods
{
  if (airPods_onceToken != -1) {
    dispatch_once(&airPods_onceToken, &__block_literal_global_37);
  }
  v2 = (void *)airPods_airPods;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __29__SFHeadphoneProduct_airPods__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8194 supportsMobileAsset:1];
  v1 = (void *)airPods_airPods;
  airPods_airPods = (uint64_t)v0;

  [(id)airPods_airPods setBluetoothModel:@"AirPods1,1"];
  [(id)airPods_airPods setModel:1];
  [(id)airPods_airPods setSupportsSiri:1];
  [(id)airPods_airPods setSupportsRepair:1];
  [(id)airPods_airPods setSupportsSpatialAudio:1];
  [(id)airPods_airPods setSupportsCounterfeitDetection:1];
  [(id)airPods_airPods setShowsStatus:1];
  [(id)airPods_airPods setHasAddressInAdvertisement:1];
  [(id)airPods_airPods setHasSplitBattery:1];
  [(id)airPods_airPods setHasW1Chip:1];
  [(id)airPods_airPods setHasLid:1];
  [(id)airPods_airPods setButtonLocation:1];
  v2 = (void *)airPods_airPods;

  return [v2 setIsAirPods:1];
}

+ (SFHeadphoneProduct)airPodsSecondGeneration
{
  if (airPodsSecondGeneration_onceToken != -1) {
    dispatch_once(&airPodsSecondGeneration_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)airPodsSecondGeneration_airPods;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __45__SFHeadphoneProduct_airPodsSecondGeneration__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8207 supportsMobileAsset:1];
  v1 = (void *)airPodsSecondGeneration_airPods;
  airPodsSecondGeneration_airPods = (uint64_t)v0;

  [(id)airPodsSecondGeneration_airPods setBluetoothModel:@"AirPods1,3"];
  [(id)airPodsSecondGeneration_airPods setModel:2];
  [(id)airPodsSecondGeneration_airPods setSupportsSiri:1];
  [(id)airPodsSecondGeneration_airPods setSupportsRepair:1];
  [(id)airPodsSecondGeneration_airPods setSupportsSpatialAudio:1];
  [(id)airPodsSecondGeneration_airPods setSupportsCounterfeitDetection:1];
  [(id)airPodsSecondGeneration_airPods setShowsStatus:1];
  [(id)airPodsSecondGeneration_airPods setHasAddressInAdvertisement:1];
  [(id)airPodsSecondGeneration_airPods setHasSplitBattery:1];
  [(id)airPodsSecondGeneration_airPods setHasLid:1];
  [(id)airPodsSecondGeneration_airPods setButtonLocation:1];
  v2 = (void *)airPodsSecondGeneration_airPods;

  return [v2 setIsAirPods:1];
}

+ (SFHeadphoneProduct)b688
{
  if (b688_onceToken[0] != -1) {
    dispatch_once(b688_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)b688_b688;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __26__SFHeadphoneProduct_b688__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8211 supportsMobileAsset:1];
  v1 = (void *)b688_b688;
  b688_b688 = (uint64_t)v0;

  [(id)b688_b688 setBluetoothModel:@"Device1,8211"];
  [(id)b688_b688 setModel:14];
  [(id)b688_b688 setSupportsSiri:1];
  [(id)b688_b688 setSupportsRepair:1];
  [(id)b688_b688 setSupportsSpatialAudio:1];
  [(id)b688_b688 setSupportsOptimizedBatteryCharging:1];
  [(id)b688_b688 setSupportsFindMyNetwork:1];
  [(id)b688_b688 setSupportsCounterfeitDetection:1];
  [(id)b688_b688 setSupportsMuteCallProx:1];
  [(id)b688_b688 setShowsStatus:1];
  [(id)b688_b688 setHasAddressInAdvertisement:1];
  [(id)b688_b688 setHasSplitBattery:1];
  [(id)b688_b688 setHasLid:1];
  [(id)b688_b688 setButtonLocation:1];
  v2 = (void *)b688_b688;

  return [v2 setIsAirPods:1];
}

+ (SFHeadphoneProduct)b768e
{
  if (b768e_onceToken != -1) {
    dispatch_once(&b768e_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)b768e_b768e;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __27__SFHeadphoneProduct_b768e__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8217 supportsMobileAsset:1];
  v1 = (void *)b768e_b768e;
  b768e_b768e = (uint64_t)v0;

  [(id)b768e_b768e setAltProductID:8222];
  [(id)b768e_b768e setBluetoothModel:@"Device1,8217"];
  [(id)b768e_b768e setModel:19];
  [(id)b768e_b768e setSupportsSiri:1];
  [(id)b768e_b768e setSupportsRepair:1];
  [(id)b768e_b768e setSupportsSpatialAudio:1];
  [(id)b768e_b768e setSupportsOptimizedBatteryCharging:1];
  [(id)b768e_b768e setSupportsFindMyNetwork:1];
  [(id)b768e_b768e setSupportsCounterfeitDetection:1];
  [(id)b768e_b768e setSupportsDigitalEngraving:1];
  [(id)b768e_b768e setIgnoresBatteryStatusIfCounterfeit:1];
  [(id)b768e_b768e setShowsStatus:1];
  [(id)b768e_b768e setHasAddressInAdvertisement:1];
  [(id)b768e_b768e setHasSplitBattery:1];
  [(id)b768e_b768e setHasLid:1];
  [(id)b768e_b768e setButtonLocation:1];
  v2 = (void *)b768e_b768e;

  return [v2 setIsAirPods:1];
}

+ (SFHeadphoneProduct)b768m
{
  if (b768m_onceToken != -1) {
    dispatch_once(&b768m_onceToken, &__block_literal_global_18);
  }
  v2 = (void *)b768m_b768m;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __27__SFHeadphoneProduct_b768m__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8219 supportsMobileAsset:1];
  v1 = (void *)b768m_b768m;
  b768m_b768m = (uint64_t)v0;

  [(id)b768m_b768m setAltProductID:8224];
  [(id)b768m_b768m setBluetoothModel:@"Device1,8219"];
  [(id)b768m_b768m setModel:20];
  [(id)b768m_b768m setSupportsSiri:1];
  [(id)b768m_b768m setSupportsRepair:1];
  [(id)b768m_b768m setSupportsSpatialAudio:1];
  [(id)b768m_b768m setSupportsOptimizedBatteryCharging:1];
  [(id)b768m_b768m setSupportsFindMyNetwork:1];
  [(id)b768m_b768m setSupportsCounterfeitDetection:1];
  [(id)b768m_b768m setSupportsDigitalEngraving:1];
  [(id)b768m_b768m setIgnoresBatteryStatusIfCounterfeit:1];
  [(id)b768m_b768m setShowsStatus:1];
  [(id)b768m_b768m setHasAddressInAdvertisement:1];
  [(id)b768m_b768m setHasSplitBattery:1];
  [(id)b768m_b768m setHasLid:1];
  [(id)b768m_b768m setHasCaseBT:1];
  [(id)b768m_b768m setButtonLocation:1];
  v2 = (void *)b768m_b768m;

  return [v2 setIsAirPods:1];
}

+ (SFHeadphoneProduct)airPodsPro
{
  if (airPodsPro_onceToken != -1) {
    dispatch_once(&airPodsPro_onceToken, &__block_literal_global_23);
  }
  v2 = (void *)airPodsPro_airPodsPro;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __32__SFHeadphoneProduct_airPodsPro__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8206 supportsMobileAsset:1];
  v1 = (void *)airPodsPro_airPodsPro;
  airPodsPro_airPodsPro = (uint64_t)v0;

  [(id)airPodsPro_airPodsPro setBluetoothModel:@"AirPodsPro1,1"];
  [(id)airPodsPro_airPodsPro setModel:3];
  [(id)airPodsPro_airPodsPro setSupportsSiri:1];
  [(id)airPodsPro_airPodsPro setSupportsRepair:1];
  [(id)airPodsPro_airPodsPro setSupportsSpatialAudio:1];
  [(id)airPodsPro_airPodsPro setSupportsOptimizedBatteryCharging:1];
  [(id)airPodsPro_airPodsPro setSupportsFindMyNetwork:1];
  [(id)airPodsPro_airPodsPro setSupportsCounterfeitDetection:1];
  [(id)airPodsPro_airPodsPro setSupportsMuteCallProx:1];
  [(id)airPodsPro_airPodsPro setShowsStatus:1];
  [(id)airPodsPro_airPodsPro setHasAddressInAdvertisement:1];
  [(id)airPodsPro_airPodsPro setHasSplitBattery:1];
  [(id)airPodsPro_airPodsPro setHasLid:1];
  [(id)airPodsPro_airPodsPro setButtonLocation:1];
  v2 = (void *)airPodsPro_airPodsPro;

  return [v2 setIsAirPods:1];
}

+ (SFHeadphoneProduct)b698
{
  if (b698_onceToken != -1) {
    dispatch_once(&b698_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)b698_airPodsPro;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __26__SFHeadphoneProduct_b698__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8212 supportsMobileAsset:1];
  v1 = (void *)b698_airPodsPro;
  b698_airPodsPro = (uint64_t)v0;

  [(id)b698_airPodsPro setAltProductID:8228];
  [(id)b698_airPodsPro setBluetoothModel:@"Device1,8212"];
  [(id)b698_airPodsPro setModel:3];
  [(id)b698_airPodsPro setSupportsSiri:1];
  [(id)b698_airPodsPro setSupportsRepair:1];
  [(id)b698_airPodsPro setSupportsSpatialAudio:1];
  [(id)b698_airPodsPro setSupportsOptimizedBatteryCharging:1];
  [(id)b698_airPodsPro setSupportsFindMyNetwork:1];
  [(id)b698_airPodsPro setSupportsCounterfeitDetection:1];
  [(id)b698_airPodsPro setIgnoresBatteryStatusIfCounterfeit:1];
  [(id)b698_airPodsPro setSupportsDigitalEngraving:1];
  [(id)b698_airPodsPro setSupportsMuteCallProx:1];
  [(id)b698_airPodsPro setSupportsAdaptiveControlsProx:1];
  [(id)b698_airPodsPro setShowsStatus:1];
  [(id)b698_airPodsPro setHasSplitBattery:1];
  [(id)b698_airPodsPro setHasLid:1];
  [(id)b698_airPodsPro setHasCaseBT:1];
  [(id)b698_airPodsPro setButtonLocation:1];
  v2 = (void *)b698_airPodsPro;

  return [v2 setIsAirPods:1];
}

+ (SFHeadphoneProduct)airPodsMax
{
  if (airPodsMax_onceToken != -1) {
    dispatch_once(&airPodsMax_onceToken, &__block_literal_global_33);
  }
  v2 = (void *)airPodsMax_airPodsMax;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __32__SFHeadphoneProduct_airPodsMax__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8202 supportsMobileAsset:1];
  v1 = (void *)airPodsMax_airPodsMax;
  airPodsMax_airPodsMax = (uint64_t)v0;

  [(id)airPodsMax_airPodsMax setAltProductID:8223];
  [(id)airPodsMax_airPodsMax setBluetoothModel:@"Device1,8202"];
  [(id)airPodsMax_airPodsMax setModel:4];
  [(id)airPodsMax_airPodsMax setSupportsSiri:1];
  [(id)airPodsMax_airPodsMax setSupportsRepair:1];
  [(id)airPodsMax_airPodsMax setSupportsSpatialAudio:1];
  [(id)airPodsMax_airPodsMax setSupportsFindMyNetwork:1];
  [(id)airPodsMax_airPodsMax setSupportsCounterfeitDetection:1];
  [(id)airPodsMax_airPodsMax setSupportsMuteCallProx:1];
  [(id)airPodsMax_airPodsMax setHasAddressInAdvertisement:1];
  [(id)airPodsMax_airPodsMax setShowsStatus:1];
  v2 = (void *)airPodsMax_airPodsMax;

  return [v2 setButtonLocation:2];
}

+ (SFHeadphoneProduct)beatsSolo
{
  if (beatsSolo_onceToken != -1) {
    dispatch_once(&beatsSolo_onceToken, &__block_literal_global_38);
  }
  v2 = (void *)beatsSolo_beatsSolo;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __31__SFHeadphoneProduct_beatsSolo__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8198 supportsMobileAsset:1];
  v1 = (void *)beatsSolo_beatsSolo;
  beatsSolo_beatsSolo = (uint64_t)v0;

  [(id)beatsSolo_beatsSolo setBluetoothModel:@"BeatsSolo3,1"];
  [(id)beatsSolo_beatsSolo setModel:5];
  [(id)beatsSolo_beatsSolo setSupportsSiri:1];
  [(id)beatsSolo_beatsSolo setSupportsRepair:1];
  [(id)beatsSolo_beatsSolo setHasAddressInAdvertisement:1];
  [(id)beatsSolo_beatsSolo setHasW1Chip:1];
  v2 = (void *)beatsSolo_beatsSolo;

  return [v2 setButtonLocation:2];
}

+ (SFHeadphoneProduct)beatsSoloPro
{
  if (beatsSoloPro_onceToken != -1) {
    dispatch_once(&beatsSoloPro_onceToken, &__block_literal_global_43);
  }
  v2 = (void *)beatsSoloPro_beatsSoloPro;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __34__SFHeadphoneProduct_beatsSoloPro__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8204 supportsMobileAsset:1];
  v1 = (void *)beatsSoloPro_beatsSoloPro;
  beatsSoloPro_beatsSoloPro = (uint64_t)v0;

  [(id)beatsSoloPro_beatsSoloPro setBluetoothModel:@"BeatsSoloPro1,1"];
  [(id)beatsSoloPro_beatsSoloPro setModel:6];
  [(id)beatsSoloPro_beatsSoloPro setSupportsSiri:1];
  [(id)beatsSoloPro_beatsSoloPro setHasAddressInAdvertisement:1];
  [(id)beatsSoloPro_beatsSoloPro setShowsStatusOutOfCase:1];
  v2 = (void *)beatsSoloPro_beatsSoloPro;

  return [v2 setButtonLocation:2];
}

+ (SFHeadphoneProduct)beatsStudio
{
  if (beatsStudio_onceToken != -1) {
    dispatch_once(&beatsStudio_onceToken, &__block_literal_global_48);
  }
  v2 = (void *)beatsStudio_beatsStudio;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __33__SFHeadphoneProduct_beatsStudio__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8201 supportsMobileAsset:1];
  v1 = (void *)beatsStudio_beatsStudio;
  beatsStudio_beatsStudio = (uint64_t)v0;

  [(id)beatsStudio_beatsStudio setBluetoothModel:@"BeatsStudio3,2"];
  [(id)beatsStudio_beatsStudio setModel:7];
  [(id)beatsStudio_beatsStudio setSupportsRepair:1];
  [(id)beatsStudio_beatsStudio setHasAddressInAdvertisement:1];
  [(id)beatsStudio_beatsStudio setHasW1Chip:1];
  v2 = (void *)beatsStudio_beatsStudio;

  return [v2 setButtonLocation:2];
}

+ (SFHeadphoneProduct)b453
{
  if (b453_onceToken != -1) {
    dispatch_once(&b453_onceToken, &__block_literal_global_53);
  }
  v2 = (void *)b453_b453;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __26__SFHeadphoneProduct_b453__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8215 supportsMobileAsset:1];
  v1 = (void *)b453_b453;
  b453_b453 = (uint64_t)v0;

  [(id)b453_b453 setBluetoothModel:@"Device1,8215"];
  [(id)b453_b453 setModel:17];
  [(id)b453_b453 setSupportsSiri:1];
  [(id)b453_b453 setSupportsRepair:1];
  [(id)b453_b453 setSupportsEndCallProx:1];
  [(id)b453_b453 setHasAddressInAdvertisement:1];
  [(id)b453_b453 setHasW1Chip:1];
  v2 = (void *)b453_b453;

  return [v2 setButtonLocation:2];
}

+ (SFHeadphoneProduct)b465
{
  if (b465_onceToken != -1) {
    dispatch_once(&b465_onceToken, &__block_literal_global_58);
  }
  v2 = (void *)b465_b465;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __26__SFHeadphoneProduct_b465__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8229 supportsMobileAsset:1];
  v1 = (void *)b465_b465;
  b465_b465 = (uint64_t)v0;

  [(id)b465_b465 setBluetoothModel:@"Device1,8229"];
  [(id)b465_b465 setModel:18];
  [(id)b465_b465 setSupportsSiri:1];
  [(id)b465_b465 setSupportsRepair:1];
  [(id)b465_b465 setSupportsEndCallProx:1];
  [(id)b465_b465 setSupportsMuteCallProx:1];
  [(id)b465_b465 setHasAddressInAdvertisement:1];
  [(id)b465_b465 setHasW1Chip:1];
  v2 = (void *)b465_b465;

  return [v2 setButtonLocation:2];
}

+ (SFHeadphoneProduct)b487
{
  if (b487_onceToken != -1) {
    dispatch_once(&b487_onceToken, &__block_literal_global_63);
  }
  v2 = (void *)b487_b487;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __26__SFHeadphoneProduct_b487__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8218 supportsMobileAsset:1];
  v1 = (void *)b487_b487;
  b487_b487 = (uint64_t)v0;

  [(id)b487_b487 setBluetoothModel:@"Device1,8218"];
  [(id)b487_b487 setModel:21];
  [(id)b487_b487 setSupportsRepair:1];
  [(id)b487_b487 setSupportsEndCallProx:1];
  [(id)b487_b487 setSupportsMuteCallProx:1];
  [(id)b487_b487 setHasAddressInAdvertisement:1];
  [(id)b487_b487 setHasW1Chip:1];
  v2 = (void *)b487_b487;

  return [v2 setButtonLocation:2];
}

+ (SFHeadphoneProduct)beatsX
{
  if (beatsX_onceToken != -1) {
    dispatch_once(&beatsX_onceToken, &__block_literal_global_68);
  }
  v2 = (void *)beatsX_beatsX;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __28__SFHeadphoneProduct_beatsX__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8197 supportsMobileAsset:1];
  v1 = (void *)beatsX_beatsX;
  beatsX_beatsX = (uint64_t)v0;

  [(id)beatsX_beatsX setBluetoothModel:@"BeatsX1,1"];
  [(id)beatsX_beatsX setModel:8];
  [(id)beatsX_beatsX setSupportsRepair:1];
  [(id)beatsX_beatsX setHasAddressInAdvertisement:1];
  [(id)beatsX_beatsX setHasW1Chip:1];
  v2 = (void *)beatsX_beatsX;

  return [v2 setButtonLocation:2];
}

+ (SFHeadphoneProduct)beatsFlex
{
  if (beatsFlex_onceToken != -1) {
    dispatch_once(&beatsFlex_onceToken, &__block_literal_global_73);
  }
  v2 = (void *)beatsFlex_beatsFlex;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __31__SFHeadphoneProduct_beatsFlex__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8208 supportsMobileAsset:1];
  v1 = (void *)beatsFlex_beatsFlex;
  beatsFlex_beatsFlex = (uint64_t)v0;

  [(id)beatsFlex_beatsFlex setBluetoothModel:@"Device1,8208"];
  [(id)beatsFlex_beatsFlex setModel:9];
  [(id)beatsFlex_beatsFlex setSupportsRepair:1];
  [(id)beatsFlex_beatsFlex setSupportsWirelessSplitterInEar:1];
  [(id)beatsFlex_beatsFlex setHasAddressInAdvertisement:1];
  [(id)beatsFlex_beatsFlex setHasW1Chip:1];
  v2 = (void *)beatsFlex_beatsFlex;

  return [v2 setButtonLocation:2];
}

+ (SFHeadphoneProduct)powerBeats3
{
  if (powerBeats3_onceToken != -1) {
    dispatch_once(&powerBeats3_onceToken, &__block_literal_global_78);
  }
  v2 = (void *)powerBeats3_powerBeats3;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __33__SFHeadphoneProduct_powerBeats3__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8195 supportsMobileAsset:1];
  v1 = (void *)powerBeats3_powerBeats3;
  powerBeats3_powerBeats3 = (uint64_t)v0;

  [(id)powerBeats3_powerBeats3 setBluetoothModel:@"PowerBeats3,1"];
  [(id)powerBeats3_powerBeats3 setModel:10];
  [(id)powerBeats3_powerBeats3 setSupportsRepair:1];
  [(id)powerBeats3_powerBeats3 setHasAddressInAdvertisement:1];
  [(id)powerBeats3_powerBeats3 setHasW1Chip:1];
  v2 = (void *)powerBeats3_powerBeats3;

  return [v2 setButtonLocation:2];
}

+ (SFHeadphoneProduct)powerBeats4
{
  if (powerBeats4_onceToken != -1) {
    dispatch_once(&powerBeats4_onceToken, &__block_literal_global_83);
  }
  v2 = (void *)powerBeats4_powerBeats4;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __33__SFHeadphoneProduct_powerBeats4__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8205 supportsMobileAsset:1];
  v1 = (void *)powerBeats4_powerBeats4;
  powerBeats4_powerBeats4 = (uint64_t)v0;

  [(id)powerBeats4_powerBeats4 setBluetoothModel:@"Powerbeats4,1"];
  [(id)powerBeats4_powerBeats4 setModel:11];
  [(id)powerBeats4_powerBeats4 setHasAddressInAdvertisement:1];
  [(id)powerBeats4_powerBeats4 setSupportsRepair:1];
  [(id)powerBeats4_powerBeats4 setShowsStatusOutOfCase:1];
  v2 = (void *)powerBeats4_powerBeats4;

  return [v2 setButtonLocation:2];
}

+ (SFHeadphoneProduct)powerBeatsPro
{
  if (powerBeatsPro_onceToken != -1) {
    dispatch_once(&powerBeatsPro_onceToken, &__block_literal_global_88);
  }
  v2 = (void *)powerBeatsPro_powerBeatsPro;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __35__SFHeadphoneProduct_powerBeatsPro__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8203 supportsMobileAsset:1];
  v1 = (void *)powerBeatsPro_powerBeatsPro;
  powerBeatsPro_powerBeatsPro = (uint64_t)v0;

  [(id)powerBeatsPro_powerBeatsPro setBluetoothModel:@"PowerbeatsPro1,1"];
  [(id)powerBeatsPro_powerBeatsPro setModel:12];
  [(id)powerBeatsPro_powerBeatsPro setSupportsSiri:1];
  [(id)powerBeatsPro_powerBeatsPro setSupportsRepair:1];
  [(id)powerBeatsPro_powerBeatsPro setSupportsEndCallProx:1];
  [(id)powerBeatsPro_powerBeatsPro setSupportsMuteCallProx:1];
  [(id)powerBeatsPro_powerBeatsPro setShowsStatus:1];
  [(id)powerBeatsPro_powerBeatsPro setHasAddressInAdvertisement:1];
  [(id)powerBeatsPro_powerBeatsPro setHasSplitBattery:1];
  [(id)powerBeatsPro_powerBeatsPro setHasLid:1];
  [(id)powerBeatsPro_powerBeatsPro setButtonLocation:0];
  [(id)powerBeatsPro_powerBeatsPro setUsesProductCaseName:1];
  v2 = (void *)powerBeatsPro_powerBeatsPro;

  return [v2 setHasSplitCaseColors:1];
}

+ (SFHeadphoneProduct)b507
{
  if (b507_onceToken != -1) {
    dispatch_once(&b507_onceToken, &__block_literal_global_93);
  }
  v2 = (void *)b507_b507;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __26__SFHeadphoneProduct_b507__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8209 supportsMobileAsset:1];
  v1 = (void *)b507_b507;
  b507_b507 = (uint64_t)v0;

  [(id)b507_b507 setBluetoothModel:@"Device1,8209"];
  [(id)b507_b507 setModel:13];
  [(id)b507_b507 setSupportsSiri:0];
  [(id)b507_b507 setSupportsRepair:1];
  [(id)b507_b507 setSupportsEndCallProx:1];
  [(id)b507_b507 setShowsStatus:1];
  [(id)b507_b507 setHasAddressInAdvertisement:1];
  [(id)b507_b507 setHasSplitBattery:1];
  [(id)b507_b507 setHasLid:1];
  [(id)b507_b507 setButtonLocation:0];
  [(id)b507_b507 setUsesProductCaseName:1];
  v2 = (void *)b507_b507;

  return [v2 setHasSplitCaseColors:1];
}

+ (SFHeadphoneProduct)b607
{
  if (b607_onceToken != -1) {
    dispatch_once(&b607_onceToken, &__block_literal_global_98);
  }
  v2 = (void *)b607_b607;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __26__SFHeadphoneProduct_b607__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8214 supportsMobileAsset:1];
  v1 = (void *)b607_b607;
  b607_b607 = (uint64_t)v0;

  [(id)b607_b607 setBluetoothModel:@"Device1,8214"];
  [(id)b607_b607 setModel:16];
  [(id)b607_b607 setSupportsSiri:1];
  [(id)b607_b607 setSupportsRepair:1];
  [(id)b607_b607 setSupportsEndCallProx:1];
  [(id)b607_b607 setShowsStatus:1];
  [(id)b607_b607 setHasAddressInAdvertisement:1];
  [(id)b607_b607 setHasSplitBattery:1];
  [(id)b607_b607 setHasLid:1];
  [(id)b607_b607 setButtonLocation:0];
  [(id)b607_b607 setUsesProductCaseName:1];
  v2 = (void *)b607_b607;

  return [v2 setHasSplitCaseColors:0];
}

+ (SFHeadphoneProduct)b463
{
  if (b463_onceToken != -1) {
    dispatch_once(&b463_onceToken, &__block_literal_global_103);
  }
  v2 = (void *)b463_b463;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __26__SFHeadphoneProduct_b463__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8230 supportsMobileAsset:1];
  v1 = (void *)b463_b463;
  b463_b463 = (uint64_t)v0;

  [(id)b463_b463 setBluetoothModel:@"Device1,8230"];
  [(id)b463_b463 setModel:23];
  [(id)b463_b463 setSupportsRepair:1];
  [(id)b463_b463 setSupportsMuteCallProx:1];
  [(id)b463_b463 setShowsStatus:1];
  [(id)b463_b463 setHasAddressInAdvertisement:1];
  [(id)b463_b463 setHasSplitBattery:1];
  [(id)b463_b463 setHasCaseWithoutBattery:1];
  [(id)b463_b463 setHasLid:1];
  [(id)b463_b463 setButtonLocation:2];
  [(id)b463_b463 setUsesProductCaseName:1];
  v2 = (void *)b463_b463;

  return [v2 setHasSplitCaseColors:0];
}

+ (SFHeadphoneProduct)b494
{
  if (b494_onceToken != -1) {
    dispatch_once(&b494_onceToken, &__block_literal_global_108);
  }
  v2 = (void *)b494_b494;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __26__SFHeadphoneProduct_b494__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8210 supportsMobileAsset:1];
  v1 = (void *)b494_b494;
  b494_b494 = (uint64_t)v0;

  [(id)b494_b494 setBluetoothModel:@"Device1,8210"];
  [(id)b494_b494 setModel:15];
  [(id)b494_b494 setSupportsSiri:1];
  [(id)b494_b494 setSupportsRepair:1];
  [(id)b494_b494 setSupportsEndCallProx:1];
  [(id)b494_b494 setSupportsMuteCallProx:1];
  [(id)b494_b494 setShowsStatus:1];
  [(id)b494_b494 setHasAddressInAdvertisement:1];
  [(id)b494_b494 setHasSplitBattery:1];
  [(id)b494_b494 setHasLid:1];
  [(id)b494_b494 setButtonLocation:0];
  [(id)b494_b494 setUsesProductCaseName:1];
  v2 = (void *)b494_b494;

  return [v2 setHasSplitCaseColors:1];
}

+ (SFHeadphoneProduct)b498
{
  if (b498_onceToken != -1) {
    dispatch_once(&b498_onceToken, &__block_literal_global_113);
  }
  v2 = (void *)b498_b498;

  return (SFHeadphoneProduct *)v2;
}

uint64_t __26__SFHeadphoneProduct_b498__block_invoke()
{
  v0 = [[SFHeadphoneProduct alloc] initWithProductID:8221 supportsMobileAsset:1];
  v1 = (void *)b498_b498;
  b498_b498 = (uint64_t)v0;

  [(id)b498_b498 setBluetoothModel:@"Device1,8221"];
  [(id)b498_b498 setModel:22];
  [(id)b498_b498 setSupportsSiri:1];
  [(id)b498_b498 setSupportsRepair:1];
  [(id)b498_b498 setSupportsMuteCallProx:1];
  [(id)b498_b498 setSupportsCounterfeitDetection:1];
  [(id)b498_b498 setIgnoresBatteryStatusIfCounterfeit:1];
  [(id)b498_b498 setShowsStatus:1];
  [(id)b498_b498 setHasAddressInAdvertisement:1];
  [(id)b498_b498 setHasSplitBattery:1];
  [(id)b498_b498 setHasLid:1];
  [(id)b498_b498 setButtonLocation:0];
  [(id)b498_b498 setUsesProductCaseName:1];
  v2 = (void *)b498_b498;

  return [v2 setHasSplitCaseColors:0];
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned int)a3
{
  self->_productID = a3;
}

- (unsigned)altProductID
{
  return self->_altProductID;
}

- (void)setAltProductID:(unsigned int)a3
{
  self->_altProductID = a3;
}

- (unint64_t)model
{
  return self->_model;
}

- (void)setModel:(unint64_t)a3
{
  self->_model = a3;
}

- (NSString)bluetoothModel
{
  return self->_bluetoothModel;
}

- (void)setBluetoothModel:(id)a3
{
}

- (BOOL)supportsDigitalEngraving
{
  return self->_supportsDigitalEngraving;
}

- (void)setSupportsDigitalEngraving:(BOOL)a3
{
  self->_supportsDigitalEngraving = a3;
}

- (BOOL)supportsMobileAsset
{
  return self->_supportsMobileAsset;
}

- (void)setSupportsMobileAsset:(BOOL)a3
{
  self->_supportsMobileAsset = a3;
}

- (BOOL)supportsRepair
{
  return self->_supportsRepair;
}

- (void)setSupportsRepair:(BOOL)a3
{
  self->_supportsRepair = a3;
}

- (BOOL)supportsSiri
{
  return self->_supportsSiri;
}

- (void)setSupportsSiri:(BOOL)a3
{
  self->_supportsSiri = a3;
}

- (BOOL)supportsSpatialAudio
{
  return self->_supportsSpatialAudio;
}

- (void)setSupportsSpatialAudio:(BOOL)a3
{
  self->_supportsSpatialAudio = a3;
}

- (BOOL)supportsOptimizedBatteryCharging
{
  return self->_supportsOptimizedBatteryCharging;
}

- (void)setSupportsOptimizedBatteryCharging:(BOOL)a3
{
  self->_supportsOptimizedBatteryCharging = a3;
}

- (BOOL)supportsWirelessSplitterInEar
{
  return self->_supportsWirelessSplitterInEar;
}

- (void)setSupportsWirelessSplitterInEar:(BOOL)a3
{
  self->_supportsWirelessSplitterInEar = a3;
}

- (BOOL)supportsFindMyNetwork
{
  return self->_supportsFindMyNetwork;
}

- (void)setSupportsFindMyNetwork:(BOOL)a3
{
  self->_supportsFindMyNetwork = a3;
}

- (BOOL)supportsEndCallProx
{
  return self->_supportsEndCallProx;
}

- (void)setSupportsEndCallProx:(BOOL)a3
{
  self->_supportsEndCallProx = a3;
}

- (BOOL)supportsMuteCallProx
{
  return self->_supportsMuteCallProx;
}

- (void)setSupportsMuteCallProx:(BOOL)a3
{
  self->_supportsMuteCallProx = a3;
}

- (BOOL)supportsAdaptiveControlsProx
{
  return self->_supportsAdaptiveControlsProx;
}

- (void)setSupportsAdaptiveControlsProx:(BOOL)a3
{
  self->_supportsAdaptiveControlsProx = a3;
}

- (BOOL)supportsCounterfeitDetection
{
  return self->_supportsCounterfeitDetection;
}

- (void)setSupportsCounterfeitDetection:(BOOL)a3
{
  self->_supportsCounterfeitDetection = a3;
}

- (BOOL)ignoresBatteryStatusIfCounterfeit
{
  return self->_ignoresBatteryStatusIfCounterfeit;
}

- (void)setIgnoresBatteryStatusIfCounterfeit:(BOOL)a3
{
  self->_ignoresBatteryStatusIfCounterfeit = a3;
}

- (BOOL)showsStatus
{
  return self->_showsStatus;
}

- (void)setShowsStatus:(BOOL)a3
{
  self->_showsStatus = a3;
}

- (BOOL)showsStatusOutOfCase
{
  return self->_showsStatusOutOfCase;
}

- (void)setShowsStatusOutOfCase:(BOOL)a3
{
  self->_showsStatusOutOfCase = a3;
}

- (BOOL)hasAddressInAdvertisement
{
  return self->_hasAddressInAdvertisement;
}

- (void)setHasAddressInAdvertisement:(BOOL)a3
{
  self->_hasAddressInAdvertisement = a3;
}

- (BOOL)hasW1Chip
{
  return self->_hasW1Chip;
}

- (void)setHasW1Chip:(BOOL)a3
{
  self->_hasW1Chip = a3;
}

- (BOOL)hasLid
{
  return self->_hasLid;
}

- (void)setHasLid:(BOOL)a3
{
  self->_hasLid = a3;
}

- (BOOL)hasSplitBattery
{
  return self->_hasSplitBattery;
}

- (void)setHasSplitBattery:(BOOL)a3
{
  self->_hasSplitBattery = a3;
}

- (BOOL)hasCaseWithoutBattery
{
  return self->_hasCaseWithoutBattery;
}

- (void)setHasCaseWithoutBattery:(BOOL)a3
{
  self->_hasCaseWithoutBattery = a3;
}

- (unint64_t)buttonLocation
{
  return self->_buttonLocation;
}

- (void)setButtonLocation:(unint64_t)a3
{
  self->_buttonLocation = a3;
}

- (BOOL)usesProductCaseName
{
  return self->_usesProductCaseName;
}

- (void)setUsesProductCaseName:(BOOL)a3
{
  self->_usesProductCaseName = a3;
}

- (BOOL)hasSplitCaseColors
{
  return self->_hasSplitCaseColors;
}

- (void)setHasSplitCaseColors:(BOOL)a3
{
  self->_hasSplitCaseColors = a3;
}

- (BOOL)isAirPods
{
  return self->_isAirPods;
}

- (void)setIsAirPods:(BOOL)a3
{
  self->_isAirPods = a3;
}

- (BOOL)hasCaseBT
{
  return self->_hasCaseBT;
}

- (void)setHasCaseBT:(BOOL)a3
{
  self->_hasCaseBT = a3;
}

- (void).cxx_destruct
{
}

@end