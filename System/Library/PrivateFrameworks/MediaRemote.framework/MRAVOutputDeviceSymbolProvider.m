@interface MRAVOutputDeviceSymbolProvider
+ (id)_fallbackCompositionForOutputDevice:(id)a3;
+ (id)compositionForClusterOutputDevice:(id)a3;
+ (id)compositionForOutputDevice:(id)a3;
+ (id)compositionForOutputDevices:(id)a3;
+ (id)symbolNameForOutputDevice:(id)a3;
+ (id)symbolNameForOutputDevices:(id)a3;
@end

@implementation MRAVOutputDeviceSymbolProvider

+ (id)symbolNameForOutputDevice:(id)a3
{
  v3 = [a1 compositionForOutputDevice:a3];
  v4 = +[MRGroupSymbolProvider symbolNameForComposition:v3];

  return v4;
}

+ (id)compositionForOutputDevice:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(MRGroupComposition);
  int v6 = [v4 deviceType];
  int v7 = [v4 isAirpodsDevice];
  if (v6 == 2)
  {
    int v8 = v7;
    if ([v4 deviceSubtype] == 9)
    {
      [(MRGroupComposition *)v5 setHeadphoneCount:1];
      if (!v8) {
        goto LABEL_9;
      }
    }
    else
    {
      [(MRGroupComposition *)v5 setBluetoothSpeakerCount:1];
      if (!v8) {
        goto LABEL_9;
      }
    }
    if (![v4 isAppleAccessory])
    {
LABEL_10:
      v10 = v5;
      goto LABEL_11;
    }
LABEL_9:
    v11 = [v4 modelID];
    [(MRGroupComposition *)v5 setSoloProductIdentifier:v11];

    goto LABEL_10;
  }
  if ([v4 clusterType])
  {
    v9 = [a1 compositionForClusterOutputDevice:v4];

    v10 = v9;
LABEL_11:
    v5 = v10;
LABEL_12:
    v12 = v10;
    goto LABEL_13;
  }
  if ([v4 deviceSubtype] == 11)
  {
    [(MRGroupComposition *)v5 setTvCount:1];
    goto LABEL_10;
  }
  if ([v4 deviceSubtype] == 16)
  {
    [(MRGroupComposition *)v5 setSetTopCount:1];
    goto LABEL_10;
  }
  if ([v4 deviceSubtype] == 17)
  {
    [(MRGroupComposition *)v5 setTvStickCount:1];
    goto LABEL_10;
  }
  if ([v4 deviceSubtype] == 13)
  {
    [(MRGroupComposition *)v5 setAtvCount:1];
    goto LABEL_10;
  }
  if ([v4 isBeatsLegacyDevice])
  {
    [(MRGroupComposition *)v5 setLegacyBeatsCount:1];
    goto LABEL_10;
  }
  if ([v4 deviceSubtype] == 19) {
    goto LABEL_27;
  }
  if ([v4 deviceSubtype] == 18)
  {
    v15 = [v4 modelID];
    [(MRGroupComposition *)v5 setSoloModelIdentifier:v15];

    [(MRGroupComposition *)v5 setMacCount:1];
    goto LABEL_10;
  }
  if ([v4 deviceSubtype] == 21)
  {
    v16 = [v4 modelID];
    [(MRGroupComposition *)v5 setSoloModelIdentifier:v16];

    [(MRGroupComposition *)v5 setVisionCount:1];
    goto LABEL_10;
  }
  if ([v4 isJ327Device])
  {
    [(MRGroupComposition *)v5 setDisplayCount:1];
    goto LABEL_10;
  }
  if ([v4 deviceType] == 3)
  {
    [(MRGroupComposition *)v5 setCarplayCount:1];
    goto LABEL_10;
  }
  if ([v4 deviceSubtype] == 12)
  {
    if ([v4 isB520Device]) {
      [(MRGroupComposition *)v5 setHomePodMiniCount:1];
    }
    else {
      [(MRGroupComposition *)v5 setHomePodCount:1];
    }
    goto LABEL_10;
  }
  if ([v4 isHearingDevice])
  {
    [(MRGroupComposition *)v5 setHearingDeviceCount:1];
    goto LABEL_10;
  }
  if ([v4 deviceType] == 4
    && [v4 deviceSubtype] == 1
    && [v4 hostDeviceClass] == 1)
  {
LABEL_27:
    v14 = [v4 modelID];
    [(MRGroupComposition *)v5 setSoloModelIdentifier:v14];

    [(MRGroupComposition *)v5 setIPhoneCount:1];
    goto LABEL_10;
  }
  if ([v4 deviceType] == 4 && objc_msgSend(v4, "deviceSubtype") == 1)
  {
    v17 = [v4 sourceInfo];
    int v18 = [v17 multipleBuiltInDevices];

    if (v18)
    {
      v10 = +[MRGroupComposition multiBuiltInComposition];
      goto LABEL_12;
    }
  }
  if ([v4 deviceType] == 4 || MSVDeviceIsAppleTV())
  {
    [(MRGroupComposition *)v5 setBuiltInCount:1];
    goto LABEL_10;
  }
  v19 = [(MRGroupComposition *)v5 soloProductIdentifier];
  v20 = [a1 _fallbackCompositionForOutputDevice:v4];

  [v20 setSoloProductIdentifier:v19];
  v5 = v20;

  v12 = v5;
LABEL_13:

  return v12;
}

+ (id)_fallbackCompositionForOutputDevice:(id)a3
{
  id v3 = a3;
  int v4 = [v3 deviceType];
  int v5 = [v3 deviceSubtype];
  int v6 = [v3 producesLowFidelityAudio];

  int v7 = objc_alloc_init(MRGroupComposition);
  int v8 = v7;
  switch(v4)
  {
    case 0:
LABEL_2:
      [(MRGroupComposition *)v7 setUnknownCount:1];
      break;
    case 1:
LABEL_5:
      if (v6) {
        [(MRGroupComposition *)v7 setLofiCount:1];
      }
      else {
        [(MRGroupComposition *)v7 setHifiCount:1];
      }
      break;
    case 2:
      if (v5 == 9) {
LABEL_9:
      }
        [(MRGroupComposition *)v7 setHeadphoneCount:1];
      else {
        [(MRGroupComposition *)v7 setBluetoothSpeakerCount:1];
      }
      break;
    case 3:
LABEL_7:
      [(MRGroupComposition *)v7 setVehicleCount:1];
      break;
    default:
      switch(v5)
      {
        case 2:
          goto LABEL_9;
        case 4:
        case 5:
          goto LABEL_5;
        case 7:
        case 8:
        case 11:
          [(MRGroupComposition *)v7 setTvCount:1];
          break;
        case 14:
          goto LABEL_7;
        default:
          goto LABEL_2;
      }
      break;
  }

  return v8;
}

+ (id)symbolNameForOutputDevices:(id)a3
{
  id v3 = [a1 compositionForOutputDevices:a3];
  int v4 = +[MRGroupSymbolProvider symbolNameForComposition:v3];

  return v4;
}

+ (id)compositionForOutputDevices:(id)a3
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22 = v4;
  if ([v4 count] == 1)
  {
    int v5 = objc_msgSend(v4, "firstObject", v4);
    int v6 = [a1 compositionForOutputDevice:v5];
  }
  else
  {
    uint64_t v67 = 0;
    v68 = &v67;
    uint64_t v69 = 0x2020000000;
    uint64_t v70 = 0;
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x2020000000;
    uint64_t v66 = 0;
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2020000000;
    uint64_t v62 = 0;
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x2020000000;
    uint64_t v58 = 0;
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x2020000000;
    uint64_t v54 = 0;
    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x2020000000;
    uint64_t v50 = 0;
    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    uint64_t v46 = 0;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v42 = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = 0;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __62__MRAVOutputDeviceSymbolProvider_compositionForOutputDevices___block_invoke;
    v34[3] = &unk_1E57D9C38;
    v34[4] = &v59;
    v34[5] = &v63;
    v34[6] = &v67;
    v34[7] = &v55;
    v34[8] = &v51;
    v34[9] = &v47;
    v34[10] = &v43;
    v34[11] = &v39;
    v34[12] = &v35;
    int v7 = (void (**)(void, void, void, void, void))MEMORY[0x1997190F0](v34);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    obuint64_t j = v4;
    uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v72 count:16];
    if (v8)
    {
      uint64_t v24 = *(void *)v31;
      do
      {
        uint64_t v25 = v8;
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if (objc_msgSend(v10, "deviceSubtype", v22) == 15)
          {
            long long v28 = 0u;
            long long v29 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            v11 = [v10 clusterComposition];
            uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v71 count:16];
            if (v12)
            {
              uint64_t v13 = *(void *)v27;
              do
              {
                for (uint64_t j = 0; j != v12; ++j)
                {
                  if (*(void *)v27 != v13) {
                    objc_enumerationMutation(v11);
                  }
                  v15 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                  uint64_t v16 = [v15 deviceType];
                  uint64_t v17 = [v15 deviceSubtype];
                  int v18 = [v15 modelID];
                  ((void (**)(void, void, uint64_t, uint64_t, void *))v7)[2](v7, 0, v16, v17, v18);
                }
                uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v71 count:16];
              }
              while (v12);
            }
          }
          else
          {
            uint64_t v19 = [v10 deviceType];
            uint64_t v20 = [v10 deviceSubtype];
            v11 = [v10 modelID];
            ((void (**)(void, void *, uint64_t, uint64_t, void *))v7)[2](v7, v10, v19, v20, v11);
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v30 objects:v72 count:16];
      }
      while (v8);
    }

    int v6 = objc_alloc_init(MRGroupComposition);
    [(MRGroupComposition *)v6 setAtvCount:v68[3]];
    [(MRGroupComposition *)v6 setHomePodCount:v64[3]];
    [(MRGroupComposition *)v6 setHomePodMiniCount:v60[3]];
    [(MRGroupComposition *)v6 setHeadphoneCount:v56[3]];
    [(MRGroupComposition *)v6 setSetTopCount:v52[3]];
    [(MRGroupComposition *)v6 setTvStickCount:v48[3]];
    [(MRGroupComposition *)v6 setTvCount:v44[3]];
    [(MRGroupComposition *)v6 setMacCount:v40[3]];
    [(MRGroupComposition *)v6 setHifiCount:v36[3]];

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);
    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v59, 8);
    _Block_object_dispose(&v63, 8);
    _Block_object_dispose(&v67, 8);
  }

  return v6;
}

void __62__MRAVOutputDeviceSymbolProvider_compositionForOutputDevices___block_invoke(void *a1, void *a2, int a3, int a4, void *a5)
{
  id v11 = a2;
  id v9 = a5;
  switch(a4)
  {
    case 2:
      uint64_t v10 = a1[7];
      goto LABEL_14;
    case 11:
      uint64_t v10 = a1[10];
      goto LABEL_14;
    case 12:
      if ([v11 isB520Device]) {
        uint64_t v10 = a1[4];
      }
      else {
        uint64_t v10 = a1[5];
      }
      goto LABEL_14;
    case 13:
      uint64_t v10 = a1[6];
      goto LABEL_14;
    case 16:
      uint64_t v10 = a1[8];
      goto LABEL_14;
    case 17:
      uint64_t v10 = a1[9];
      goto LABEL_14;
    case 18:
      uint64_t v10 = a1[11];
      goto LABEL_14;
    default:
      if (a3 != 1 || ([v11 producesLowFidelityAudio] & 1) != 0) {
        goto LABEL_15;
      }
      uint64_t v10 = a1[12];
LABEL_14:
      ++*(void *)(*(void *)(v10 + 8) + 24);
LABEL_15:

      return;
  }
}

+ (id)compositionForClusterOutputDevice:(id)a3
{
  id v4 = a3;
  if ([v4 clusterType] == 2)
  {
    if ([v4 isHomeTheaterB520Device]) {
      +[MRGroupComposition homePodMiniHomeTheaterComposition];
    }
    else {
      +[MRGroupComposition homePodHomeTheaterComposition];
    }
    uint64_t v5 = LABEL_4:;
    goto LABEL_13;
  }
  if ([v4 clusterType] == 1)
  {
    if ([v4 isB520Device]) {
      +[MRGroupComposition homePodMiniStereoPairComposition];
    }
    else {
      +[MRGroupComposition homePodStereoPairComposition];
    }
    goto LABEL_4;
  }
  int v6 = [v4 clusterCompositionOutputDevices];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = [v4 clusterCompositionOutputDevices];
    id v9 = [a1 compositionForOutputDevices:v8];

    goto LABEL_14;
  }
  uint64_t v5 = +[MRGroupComposition unknownComposition];
LABEL_13:
  id v9 = (void *)v5;
LABEL_14:

  return v9;
}

@end