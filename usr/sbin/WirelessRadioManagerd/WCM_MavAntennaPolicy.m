@interface WCM_MavAntennaPolicy
- (NSMutableArray)mWifiCiConfig;
- (OS_xpc_object)mEurekaConfig;
- (OS_xpc_object)mMavCiConfig;
- (OS_xpc_object)mMavFaceIdPtConfig;
- (OS_xpc_object)mMavPtConfig;
- (OS_xpc_object)mMavSfPboffConfig;
- (WCM_MavAntennaPolicy)init;
- (id)createAntennaBlockingClientXpcArray:(id)a3 client_id:(int)a4 convBand:(unsigned __int8)a5;
- (id)createConditionIdXpcElement:(unsigned int)a3 mav_antenna_block_client_id:(unsigned int)a4 cellular_band:(unsigned int)a5 cellular_frequency_upper:(unsigned int)a6 cellular_frequency_lower:(unsigned int)a7 cellular_ant_mitigation:(unsigned int)a8;
- (id)createDynamicAntBlockingWifiClientMappingsWithCellAntBlkEnableIdx1:(unsigned __int8)a3 cellAntBlkEnableIdx2:(unsigned __int8)a4;
- (id)createFaceIDPowerTableXpcElement:(unsigned int)a3 ant:(unsigned int)a4 target_power_dbm:(unsigned int)a5;
- (id)createHardcodedFcamClientMappings;
- (id)createHardcodedFidClientMappings;
- (id)createHardcodedJpgRegClientMappings;
- (id)createHardcodedRc1ClientMappings;
- (id)createHardcodedWifiClientMappings;
- (id)createPowerTableXpcElement:(unsigned int)a3 ant:(unsigned int)a4 target_power_dbm:(unsigned int)a5 condition_id:(unsigned int)a6 entry_num:(unsigned int)a7;
- (id)createSubframePowerBackOffTableXpcElement:(id)a3 condition_id:(unsigned int)a4;
- (id)createXpcClientObjectWithClientId:(int)a3 blockVoice:(BOOL)a4 timeMultipler:(unint64_t)a5 antennaBandMappings:(id)a6;
- (id)getFaceIDConfigDictionarySKUBased:(id)a3;
- (id)getFaceIDPlatformPlistName;
- (id)getPlatformCidPlistName;
- (id)getPlatformPlistName;
- (int)convertBandToEurBandId:(id)a3;
- (int)getMavClientIdforAntClient:(id)a3;
- (void)addXpcBandEntriesWithAnt:(unint64_t)a3 bandsToAddSet:(id)a4 bandArray:(id)a5;
- (void)applyMavAntennaPolicyForPlatformId:(int)a3 sku:(int)a4;
- (void)createClientMappingsfromPlist:(int)a3;
- (void)createFaceIDpowerTablefromPlist;
- (void)initSfPboffParams;
- (void)reconfigureClientAntBlockingParamsWithCellAntBlkEnableIdx1:(unsigned __int8)a3 cellAntBlkEnableIdx2:(unsigned __int8)a4;
- (void)sendFaceIDPowerTables;
- (void)sendMavConfigitems;
- (void)setMEurekaConfig:(id)a3;
- (void)setMMavCiConfig:(id)a3;
- (void)setMMavFaceIdPtConfig:(id)a3;
- (void)setMMavPtConfig:(id)a3;
- (void)setMMavSfPboffConfig:(id)a3;
- (void)setMWifiCiConfig:(id)a3;
@end

@implementation WCM_MavAntennaPolicy

- (WCM_MavAntennaPolicy)init
{
  v7.receiver = self;
  v7.super_class = (Class)WCM_MavAntennaPolicy;
  v2 = [(WCM_MavAntennaPolicy *)&v7 init];
  *(_OWORD *)(v2 + 8) = xmmword_1001EAF20;
  uint64_t v3 = +[NSArray arrayWithObjects:@"wifi_client", @"rc3_client", @"rc1_client", @"fid_client", @"rcam_t_client", @"rcam_w_client", @"e85_u_client0", @"e85_d_client0", 0];
  v4 = (void *)*((void *)v2 + 3);
  *((void *)v2 + 3) = v3;

  v5 = (void *)*((void *)v2 + 4);
  *((void *)v2 + 4) = &__NSArray0__struct;

  return (WCM_MavAntennaPolicy *)v2;
}

- (void)applyMavAntennaPolicyForPlatformId:(int)a3 sku:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  self->mPlatformId = a3;
  self->mSKU = a4;
  [(WCM_MavAntennaPolicy *)self initSfPboffParams];

  [(WCM_MavAntennaPolicy *)self createClientMappingsfromPlist:v4];
}

- (void)initSfPboffParams
{
  uint64_t mPlatformId = self->mPlatformId;
  if (mPlatformId == 54)
  {
    uint64_t v3 = (NSArray *)&off_10024E1D0;
  }
  else
  {
    if (mPlatformId != 57)
    {
      +[WCM_Logging logLevel:3, @"SF Pboff Policy: Platform %u is not supported", mPlatformId message];
      return;
    }
    uint64_t v3 = (NSArray *)&off_10024E1B8;
  }
  self->mFixedPbOffBands = v3;

  _objc_release_x1();
}

- (id)getPlatformPlistName
{
  uint64_t mPlatformId = self->mPlatformId;
  switch((int)mPlatformId)
  {
    case '2':
      return @"antenna_block_policy_mav_p031";
    case '3':
      return @"antenna_block_policy_mav_p032";
    case '4':
      return @"antenna_block_policy_mav_p033";
    case '5':
      return @"antenna_block_policy_mav_p034";
    case '6':
      return @"antenna_block_policy_mav_p043";
    case '7':
      return @"antenna_block_policy_mav_p044";
    case '8':
      return @"antenna_block_policy_mav_p041";
    case '9':
      return @"antenna_block_policy_mav_p042";
    default:
      if ((mPlatformId - 162) > 8) {
        goto LABEL_15;
      }
      if (((1 << (mPlatformId + 94)) & 0x145) != 0) {
        return @"antenna_block_policy_mav_dummy";
      }
      if (mPlatformId == 166) {
        return @"antenna_block_policy_mav_p045";
      }
LABEL_15:
      +[WCM_Logging logLevel:3, @"Ant Block Policy: Platform %u is not supported", mPlatformId message];
      return 0;
  }
}

- (id)getPlatformCidPlistName
{
  uint64_t mPlatformId = self->mPlatformId;
  id result = @"bb_CoEx-Table-CellCoex034_V7WiFiEnh";
  switch((int)mPlatformId)
  {
    case '2':
      id result = @"bb_CoEx-Table-CellCoex031_V7WiFiEnh";
      break;
    case '3':
      id result = @"bb_CoEx-Table-CellCoex032_V7WiFiEnh";
      break;
    case '4':
      id result = @"bb_CoEx-Table-CellCoex033_V7WiFiEnh";
      break;
    case '5':
      return result;
    case '6':
      id result = @"bb_CoEx-Table-CellCoex043_V7WiFiEnh";
      break;
    case '7':
      id result = @"bb_CoEx-Table-CellCoex044_V7WiFiEnh";
      break;
    case '8':
      id result = @"bb_CoEx-Table-CellCoex041_V7WiFiEnh";
      break;
    case '9':
      id result = @"bb_CoEx-Table-CellCoex042_V7WiFiEnh";
      break;
    default:
      switch((int)mPlatformId)
      {
        case 162:
          id result = @"bb_CoEx-Table-CellCoex035_V7WiFiEnh";
          break;
        case 164:
          id result = @"bb_CoEx-Table-CellCoex036_V7WiFiEnh";
          break;
        case 166:
          id result = @"bb_CoEx-Table-CellCoex045_V7WiFiEnh";
          break;
        case 168:
          id result = @"bb_CoEx-Table-CellCoex039_V7WiFiEnh";
          break;
        case 170:
          id result = @"bb_CoEx-Table-CellCoex040_V7WiFiEnh";
          break;
        default:
          +[WCM_Logging logLevel:3, @"Condition id Policy: Platform %u is not supported", mPlatformId message];
          id result = 0;
          break;
      }
      break;
  }
  return result;
}

- (id)getFaceIDConfigDictionarySKUBased:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    switch(self->mSKU)
    {
      case 1:
        CFStringRef v6 = @"A";
        break;
      case 2:
        CFStringRef v6 = @"B";
        break;
      case 3:
        CFStringRef v6 = @"C";
        break;
      case 4:
        CFStringRef v6 = @"D";
        break;
      default:
        +[WCM_Logging logLevel:3, @"FaceId Config: SKU %u is not supported", self->mSKU message];
        goto LABEL_5;
    }
    objc_super v7 = [v4 objectForKey:v6];
  }
  else
  {
LABEL_5:
    objc_super v7 = 0;
  }

  return v7;
}

- (id)getFaceIDPlatformPlistName
{
  uint64_t mPlatformId = self->mPlatformId;
  if ((mPlatformId - 54) < 4) {
    return (id)*((void *)&off_100210E70 + (int)mPlatformId - 54);
  }
  +[WCM_Logging logLevel:3, @"Face id Policy: Platform %u is not supported", mPlatformId message];
  return 0;
}

- (int)getMavClientIdforAntClient:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"wifi_client"])
  {
    unsigned int v5 = 0;
LABEL_18:
    self->unsigned int mAntBlockClientId = v5;
    goto LABEL_19;
  }
  if ([v4 isEqualToString:@"rc3_client"])
  {
    unsigned int v5 = 1;
    goto LABEL_18;
  }
  if ([v4 isEqualToString:@"rc1_client"])
  {
    unsigned int v5 = 2;
    goto LABEL_18;
  }
  if ([v4 isEqualToString:@"fid_client"])
  {
    unsigned int v5 = 3;
    goto LABEL_18;
  }
  if ([v4 isEqualToString:@"rcam_t_client"])
  {
    unsigned int v5 = 4;
    goto LABEL_18;
  }
  if ([v4 isEqualToString:@"rcam_w_client"])
  {
    unsigned int v5 = 5;
    goto LABEL_18;
  }
  if ([v4 isEqualToString:@"e85_u_client0"])
  {
    unsigned int v5 = 6;
    goto LABEL_18;
  }
  if ([v4 isEqualToString:@"e85_d_client0"])
  {
    unsigned int v5 = 7;
    goto LABEL_18;
  }
  unsigned int v5 = -1;
  if (v4) {
    goto LABEL_18;
  }
  unsigned int mAntBlockClientId = self->mAntBlockClientId;
  self->unsigned int mAntBlockClientId = mAntBlockClientId + 1;
  if ((int)(mAntBlockClientId + 1) <= 15) {
    unsigned int v5 = mAntBlockClientId + 1;
  }
  else {
    unsigned int v5 = -1;
  }
LABEL_19:

  return v5;
}

- (void)createClientMappingsfromPlist:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  +[WCM_Logging logLevel:4 message:@"Cellular controller create MavClientMappings from Plist"];
  uint64_t v168 = 0;
  xpc_object_t xarray = xpc_array_create(0, 0);
  if (xarray)
  {
    xpc_object_t object = xpc_array_create(0, 0);
    if (!object)
    {
      v8 = 0;
      v22 = 0;
      id v9 = 0;
LABEL_122:

      goto LABEL_123;
    }
    xpc_object_t v126 = xpc_array_create(0, 0);
    if (!v126)
    {
      v8 = 0;
      v111 = 0;
      id v9 = 0;
LABEL_121:

      v22 = v111;
      goto LABEL_122;
    }
    uint64_t v5 = [(WCM_MavAntennaPolicy *)self getPlatformPlistName];
    v104 = (void *)v5;
    if (v5)
    {
      uint64_t v6 = sub_100095D24(v5, @"plist");
      if (v6)
      {
        objc_super v7 = (void *)v6;
        id v167 = 0;
        v8 = +[NSPropertyListSerialization propertyListWithData:v6 options:2 format:&v168 error:&v167];
        id v9 = v167;
        if (v8)
        {
          +[WCM_Logging logLevel:3 message:@"create Mav Client AntennaM appings from Plist: Antenna blocking policy Plist File Found"];
          long long v165 = 0u;
          long long v166 = 0u;
          long long v163 = 0u;
          long long v164 = 0u;
          v128 = self;
          v10 = self->mFixedAntClients;
          id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v163 objects:v179 count:16];
          v133 = v7;
          if (v11)
          {
            id v12 = v11;
            v136 = 0;
            v111 = 0;
            uint64_t v13 = *(void *)v164;
            do
            {
              v14 = 0;
              v15 = v111;
              do
              {
                v16 = v15;
                if (*(void *)v164 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v17 = *(void *)(*((void *)&v163 + 1) + 8 * (void)v14);
                uint64_t v18 = [v8 objectForKey:v17];

                id v19 = (id)[(WCM_MavAntennaPolicy *)v128 getMavClientIdforAntClient:v17];
                v15 = (void *)v18;
                if (v18) {
                  BOOL v20 = v19 == -1;
                }
                else {
                  BOOL v20 = 1;
                }
                if (!v20)
                {
                  v21 = [(WCM_MavAntennaPolicy *)v128 createAntennaBlockingClientXpcArray:v18 client_id:v19 convBand:1];

                  if (v21)
                  {
                    xpc_array_append_value(xarray, v21);
                    v136 = v21;
                  }
                  else
                  {
                    v136 = 0;
                  }
                  v15 = (void *)v18;
                }
                v14 = (char *)v14 + 1;
              }
              while (v12 != v14);
              v111 = v15;
              id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v163 objects:v179 count:16];
            }
            while (v12);
          }
          else
          {
            v136 = 0;
            v111 = 0;
          }

          p_isa = (id *)&v128->super.isa;
          uint64_t v24 = [(WCM_MavAntennaPolicy *)v128 getPlatformCidPlistName];

          v102 = (void *)v24;
          uint64_t v25 = sub_100095D24(v24, @"plist");

          v103 = (void *)v25;
          if (v25)
          {
            id v162 = 0;
            v26 = +[NSPropertyListSerialization propertyListWithData:v25 options:2 format:&v168 error:&v162];
            id v101 = v162;

            if (v26)
            {
              +[WCM_Logging logLevel:3 message:@"create Mav Client Antenna Mappings from Plist: Antenna condition id policy Plist File Found for device"];
              v100 = v26;
              v27 = [v26 objectForKey:@"config"];
              v28 = +[NSMutableDictionary dictionary];
              long long v158 = 0u;
              long long v159 = 0u;
              long long v160 = 0u;
              long long v161 = 0u;
              v99 = v27;
              id obj = [v27 reverseObjectEnumerator];
              id v107 = [obj countByEnumeratingWithState:&v158 objects:v178 count:16];
              if (v107)
              {
                uint64_t v106 = *(void *)v159;
                v114 = v28;
                do
                {
                  for (i = 0; i != v107; i = (char *)i + 1)
                  {
                    if (*(void *)v159 != v106)
                    {
                      v30 = i;
                      objc_enumerationMutation(obj);
                      i = v30;
                    }
                    v31 = *(void **)(*((void *)&v158 + 1) + 8 * i);
                    if (v31)
                    {
                      v109 = i;
                      v32 = [v31 objectForKey:@"Policy"];
                      long long v154 = 0u;
                      long long v155 = 0u;
                      long long v156 = 0u;
                      long long v157 = 0u;
                      v108 = v32;
                      id v113 = [v32 reverseObjectEnumerator];
                      id v118 = [v113 countByEnumeratingWithState:&v154 objects:v177 count:16];
                      if (v118)
                      {
                        unsigned __int8 v122 = 0;
                        uint64_t v117 = *(void *)v155;
                        v115 = v31;
                        do
                        {
                          for (j = 0; j != v118; j = (char *)j + 1)
                          {
                            if (*(void *)v155 != v117) {
                              objc_enumerationMutation(v113);
                            }
                            v34 = *(void **)(*((void *)&v154 + 1) + 8 * (void)j);
                            if (v34)
                            {
                              v121 = j;
                              v35 = [v34 objectForKey:@"cellular_frequency_upper"];
                              unsigned int v119 = [v35 unsignedIntValue];

                              v36 = [v34 objectForKey:@"cellular_frequency_lower"];
                              unsigned int v120 = [v36 unsignedIntValue];

                              v37 = [v34 objectForKey:@"cellular_band"];
                              unsigned int v134 = [p_isa convertBandToEurBandId:v37];

                              v38 = [v31 objectForKey:@"condition_id"];
                              unsigned int v129 = [v38 unsignedIntValue];

                              v39 = [v34 objectForKey:@"antenna_info"];
                              v40 = [v34 objectForKey:@"antblock_client_id"];

                              if (v40)
                              {
                                v41 = [v34 objectForKey:@"antblock_client_id"];
                                id v42 = [v41 unsignedIntValue];

                                v43 = +[NSNumber numberWithInt:v42];
                                v44 = [v28 objectForKeyedSubscript:v43];

                                if (!v44)
                                {
                                  v45 = +[NSMutableDictionary dictionary];
                                  v46 = +[NSNumber numberWithInt:v42];
                                  [v28 setObject:v45 forKeyedSubscript:v46];
                                }
                                int v116 = (int)v42;
                                v47 = +[NSNumber numberWithInt:v42];
                                v124 = [v28 objectForKeyedSubscript:v47];
                              }
                              else
                              {
                                v124 = 0;
                                int v116 = -1;
                              }
                              long long v152 = 0u;
                              long long v153 = 0u;
                              long long v150 = 0u;
                              long long v151 = 0u;
                              id v48 = v39;
                              id v49 = [v48 countByEnumeratingWithState:&v150 objects:v176 count:16];
                              if (v49)
                              {
                                id v50 = v49;
                                int v51 = 0;
                                v131 = 0;
                                uint64_t v52 = *(void *)v151;
                                do
                                {
                                  for (k = 0; k != v50; k = (char *)k + 1)
                                  {
                                    if (*(void *)v151 != v52) {
                                      objc_enumerationMutation(v48);
                                    }
                                    v54 = *(void **)(*((void *)&v150 + 1) + 8 * (void)k);
                                    if (v54)
                                    {
                                      v55 = [*(id *)(*((void *)&v150 + 1) + 8 * (void)k) objectForKey:@"target_power"];
                                      id v56 = [v55 unsignedIntValue];

                                      v57 = [v54 objectForKey:@"antenna_num"];
                                      id v58 = [v57 unsignedIntValue];

                                      if (v56)
                                      {
                                        v51 |= (unsigned __int16)(1 << ((_BYTE)v58 - 1));
                                        v59 = [(WCM_MavAntennaPolicy *)v128 createPowerTableXpcElement:v134 ant:v58 target_power_dbm:v56 condition_id:v129 entry_num:v122];

                                        if (v59)
                                        {
                                          xpc_array_append_value(v126, v59);
                                          v136 = v59;
                                        }
                                        else
                                        {
                                          v136 = 0;
                                        }
                                      }
                                      else
                                      {
                                        v60 = +[NSNumber numberWithUnsignedInt:v58];
                                        v61 = [v124 objectForKeyedSubscript:v60];

                                        if (v61)
                                        {
                                          v62 = +[NSNumber numberWithUnsignedInt:v134];
                                          [v61 addObject:v62];
                                          v131 = v61;
                                        }
                                        else
                                        {
                                          v63 = +[NSMutableSet set];
                                          v64 = +[NSNumber numberWithUnsignedInt:v134];
                                          [v63 addObject:v64];

                                          v62 = +[NSNumber numberWithUnsignedInt:v58];
                                          v131 = v63;
                                          [v124 setObject:v63 forKeyedSubscript:v62];
                                        }

                                        v51 |= 0x10000 << ((_BYTE)v58 - 1);
                                      }
                                    }
                                  }
                                  id v50 = [v48 countByEnumeratingWithState:&v150 objects:v176 count:16];
                                }
                                while (v50);
                              }
                              else
                              {
                                int v51 = 0;
                                v131 = 0;
                              }

                              p_isa = (id *)&v128->super.isa;
                              if (v120)
                              {
                                v31 = v115;
                                if (v119 && v51)
                                {
                                  if (v116 == -1) {
                                    uint64_t v65 = 8;
                                  }
                                  else {
                                    uint64_t v65 = (v116 + 8);
                                  }
                                  v66 = -[WCM_MavAntennaPolicy createConditionIdXpcElement:mav_antenna_block_client_id:cellular_band:cellular_frequency_upper:cellular_frequency_lower:cellular_ant_mitigation:](v128, "createConditionIdXpcElement:mav_antenna_block_client_id:cellular_band:cellular_frequency_upper:cellular_frequency_lower:cellular_ant_mitigation:", v129, v65, v134);

                                  if (v66)
                                  {
                                    xpc_array_append_value(object, v66);
                                    v136 = v66;
                                  }
                                  else
                                  {
                                    v136 = 0;
                                  }
                                }
                              }
                              else
                              {
                                v31 = v115;
                              }
                              j = v121;
                              ++v122;

                              v28 = v114;
                            }
                          }
                          id v118 = [v113 countByEnumeratingWithState:&v154 objects:v177 count:16];
                        }
                        while (v118);
                      }

                      i = v109;
                    }
                  }
                  id v107 = [obj countByEnumeratingWithState:&v158 objects:v178 count:16];
                }
                while (v107);
              }

              long long v148 = 0u;
              long long v149 = 0u;
              long long v146 = 0u;
              long long v147 = 0u;
              id v127 = v28;
              id v125 = [v127 countByEnumeratingWithState:&v146 objects:v175 count:16];
              if (v125)
              {
                uint64_t v123 = *(void *)v147;
                do
                {
                  uint64_t v67 = 0;
                  v68 = v136;
                  v69 = v111;
                  do
                  {
                    v132 = v69;
                    v135 = v68;
                    if (*(void *)v147 != v123) {
                      objc_enumerationMutation(v127);
                    }
                    uint64_t v137 = v67;
                    v70 = *(void **)(*((void *)&v146 + 1) + 8 * v67);
                    id v71 = objc_alloc_init((Class)NSMutableArray);
                    v72 = [v127 objectForKeyedSubscript:v70];
                    long long v142 = 0u;
                    long long v143 = 0u;
                    long long v144 = 0u;
                    long long v145 = 0u;
                    id v73 = [v72 countByEnumeratingWithState:&v142 objects:v174 count:16];
                    v130 = v70;
                    if (v73)
                    {
                      id v74 = v73;
                      v75 = 0;
                      uint64_t v76 = *(void *)v143;
                      do
                      {
                        v77 = 0;
                        v78 = v75;
                        do
                        {
                          if (*(void *)v143 != v76) {
                            objc_enumerationMutation(v72);
                          }
                          v173[0] = *(void *)(*((void *)&v142 + 1) + 8 * (void)v77);
                          v172[0] = @"Cellular_Ant";
                          v172[1] = @"Cellular_Band_Array";
                          v79 = [v72 objectForKeyedSubscript:];
                          v173[1] = v79;
                          v75 = +[NSDictionary dictionaryWithObjects:v173 forKeys:v172 count:2];

                          [v71 addObject:v75];
                          v77 = (char *)v77 + 1;
                          v78 = v75;
                        }
                        while (v74 != v77);
                        id v74 = [v72 countByEnumeratingWithState:&v142 objects:v174 count:16];
                      }
                      while (v74);
                    }
                    else
                    {
                      v75 = 0;
                    }
                    v170[0] = @"Block_Voice";
                    v170[1] = @"Duration_Granularity";
                    v171[0] = &off_10023CB88;
                    v171[1] = &off_10023CBA0;
                    v170[2] = @"Policy";
                    v171[2] = v71;
                    uint64_t v80 = +[NSDictionary dictionaryWithObjects:v171 forKeys:v170 count:3];

                    p_isa = (id *)&v128->super.isa;
                    v111 = (void *)v80;
                    v81 = -[WCM_MavAntennaPolicy createAntennaBlockingClientXpcArray:client_id:convBand:](v128, "createAntennaBlockingClientXpcArray:client_id:convBand:", v80, [v130 unsignedIntValue] + 8, 0);

                    if (v81) {
                      xpc_array_append_value(xarray, v81);
                    }

                    uint64_t v67 = v137 + 1;
                    v68 = v81;
                    v69 = v111;
                  }
                  while ((id)(v137 + 1) != v125);
                  v136 = v81;
                  id v125 = [v127 countByEnumeratingWithState:&v146 objects:v175 count:16];
                }
                while (v125);
              }

              xpc_object_t v82 = xpc_copy(xarray);
              [p_isa setMEurekaConfig:v82];

              xpc_object_t v83 = xpc_copy(object);
              [p_isa setMMavCiConfig:v83];

              xpc_object_t v84 = xpc_copy(v126);
              [p_isa setMMavPtConfig:v84];

              xpc_object_t v85 = xpc_array_create(0, 0);
              long long v138 = 0u;
              long long v139 = 0u;
              long long v140 = 0u;
              long long v141 = 0u;
              id v86 = p_isa[4];
              id v87 = [v86 countByEnumeratingWithState:&v138 objects:v169 count:16];
              if (v87)
              {
                id v88 = v87;
                v89 = 0;
                uint64_t v90 = *(void *)v139;
                do
                {
                  for (m = 0; m != v88; m = (char *)m + 1)
                  {
                    if (*(void *)v139 != v90) {
                      objc_enumerationMutation(v86);
                    }
                    v92 = *(void **)(*((void *)&v138 + 1) + 8 * (void)m);
                    if (v92)
                    {
                      uint64_t v93 = [*(id *)(*((void *)&v138 + 1) + 8 * (void)m) objectForKey:@"band"];

                      v94 = [v92 objectForKey:@"cid"];
                      unsigned __int8 v95 = [v94 unsignedIntValue];

                      v96 = [(WCM_MavAntennaPolicy *)v128 createSubframePowerBackOffTableXpcElement:v93 condition_id:v95];

                      if (v96)
                      {
                        xpc_array_append_value(v85, v96);
                        v136 = v96;
                      }
                      else
                      {
                        v136 = 0;
                      }
                      v89 = (void *)v93;
                    }
                  }
                  id v88 = [v86 countByEnumeratingWithState:&v138 objects:v169 count:16];
                }
                while (v88);
              }
              else
              {
                v89 = 0;
              }

              xpc_object_t v98 = xpc_copy(v85);
              [(WCM_MavAntennaPolicy *)v128 setMMavSfPboffConfig:v98];

              [(WCM_MavAntennaPolicy *)v128 createFaceIDpowerTablefromPlist];
            }
            else
            {
              +[WCM_Logging logLevel:3 message:@"create Mav Client Antenna Mappings from Plist: No antenna condition id policy Plist File Found"];
            }
            id v9 = v101;
            v97 = v102;
          }
          else
          {
            v97 = v102;
          }

          objc_super v7 = v103;
          v8 = v136;
        }
        else
        {
          +[WCM_Logging logLevel:3 message:@"create Mav ClientAntenna Mappings from Plist: No antenna blocking policy Plist File Found"];
          v111 = 0;
        }

        goto LABEL_120;
      }
    }
    else
    {
      +[WCM_Logging logLevel:3, @"create Client Mappings from Plist: Ant Block Policy: Platform %u is not supported", v3 message];
    }
    v8 = 0;
    v111 = 0;
    id v9 = 0;
LABEL_120:

    goto LABEL_121;
  }
LABEL_123:
}

- (void)createFaceIDpowerTablefromPlist
{
  uint64_t v3 = [(WCM_MavAntennaPolicy *)self getFaceIDPlatformPlistName];
  id v4 = (void *)v3;
  if (v3)
  {
    uint64_t v5 = sub_100095D24(v3, @"plist");
    if (v5)
    {
      id v39 = 0;
      uint64_t v40 = 0;
      uint64_t v6 = +[NSPropertyListSerialization propertyListWithData:v5 options:2 format:&v40 error:&v39];
      id v7 = v39;
      if (v6)
      {
        +[WCM_Logging logLevel:3 message:@"create FaceID power Tables from Plist: Face ID policy Plist File Found for device"];
        xpc_object_t v8 = xpc_array_create(0, 0);
        if (v8)
        {
          id v9 = [v6 objectForKey:@"Config"];
          v10 = [(WCM_MavAntennaPolicy *)self getFaceIDConfigDictionarySKUBased:v9];
          id v11 = v10;
          if (v10)
          {
            v29 = v9;
            id v30 = v7;
            v31 = v6;
            v32 = v5;
            v33 = v4;
            v28 = v10;
            [v10 objectForKey:@"Policy"];
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id obj = (id)objc_claimAutoreleasedReturnValue();
            id v12 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
            if (v12)
            {
              id v13 = v12;
              v14 = 0;
              uint64_t v15 = *(void *)v36;
              do
              {
                for (i = 0; i != v13; i = (char *)i + 1)
                {
                  if (*(void *)v36 != v15) {
                    objc_enumerationMutation(obj);
                  }
                  uint64_t v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
                  if (v17)
                  {
                    uint64_t v18 = [*(id *)(*((void *)&v35 + 1) + 8 * i) objectForKey:@"band"];
                    id v19 = [v18 unsignedIntValue];

                    BOOL v20 = [v17 objectForKey:@"target_power"];
                    id v21 = [v20 unsignedIntValue];

                    v22 = [v17 objectForKey:@"antenna_num"];
                    id v23 = [v22 unsignedIntValue];

                    uint64_t v24 = [(WCM_MavAntennaPolicy *)self createFaceIDPowerTableXpcElement:v19 ant:v23 target_power_dbm:v21];

                    if (v24)
                    {
                      if (!xpc_array_get_count(v8))
                      {
                        uint64_t v25 = [(WCM_MavAntennaPolicy *)self createFaceIDPowerTableXpcElement:0 ant:0 target_power_dbm:0];
                        if (v25) {
                          xpc_array_append_value(v8, v25);
                        }
                      }
                      xpc_array_append_value(v8, v24);
                      v14 = v24;
                    }
                    else
                    {
                      v14 = 0;
                    }
                  }
                }
                id v13 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
              }
              while (v13);
            }
            else
            {
              v14 = 0;
            }
            uint64_t v5 = v32;
            id v4 = v33;
            id v11 = v28;
            if (xpc_array_get_count(v8))
            {
              v26 = [(WCM_MavAntennaPolicy *)self createFaceIDPowerTableXpcElement:244 ant:0 target_power_dbm:0];
              if (v26) {
                xpc_array_append_value(v8, v26);
              }
            }
            xpc_object_t v27 = xpc_copy(v8);
            [(WCM_MavAntennaPolicy *)self setMMavFaceIdPtConfig:v27];

            id v7 = v30;
            uint64_t v6 = v31;
            id v9 = v29;
          }
          else
          {
            +[WCM_Logging logLevel:3 message:@"Face ID Policy Table not found for the SKU"];
            [(WCM_MavAntennaPolicy *)self setMMavFaceIdPtConfig:0];
          }
        }
      }
      else
      {
        +[WCM_Logging logLevel:3 message:@"create FaceID power Tables from Plist: No Face ID policy Plist File Found"];
      }
    }
  }
  else
  {
    +[WCM_Logging logLevel:3 message:@"Face ID policy is not found for this platform"];
  }
}

- (void)sendFaceIDPowerTables
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  if (xdict)
  {
    uint64_t v3 = [(WCM_MavAntennaPolicy *)self mMavFaceIdPtConfig];

    if (v3)
    {
      id v4 = +[WCM_PolicyManager singleton];
      uint64_t v5 = [v4 cellularController];

      if (v5)
      {
        +[WCM_Logging logLevel:4 message:@"sendFaceIDPowerTables"];
        xpc_object_t v6 = xpc_array_create(0, 0);
        xpc_object_t v7 = xpc_array_create(0, 0);
        if (v7)
        {
          xpc_object_t v8 = v7;
          id v9 = [(WCM_MavAntennaPolicy *)self mMavFaceIdPtConfig];
          xpc_object_t v10 = xpc_copy(v9);

          int count = xpc_array_get_count(v10);
          if (count >= 1)
          {
            uint64_t v12 = count;
            uint64_t v13 = (count + 1);
            uint64_t v14 = 1;
            do
            {
              uint64_t v15 = xpc_array_get_value(v10, v14 - 1);
              xpc_array_append_value(v6, v15);
              if (v12 == v14 || (v14 & 7) == 0)
              {
                xpc_dictionary_set_value(xdict, "kWCMCellularTransparentMessageInformationSet", v6);
                [v5 sendMessage:1223 withArgs:xdict];
                xpc_object_t v16 = xpc_array_create(0, 0);

                xpc_object_t v6 = v16;
              }

              ++v14;
            }
            while (v13 != v14);
          }
        }
        else
        {
          xpc_object_t v10 = 0;
        }
      }
      else
      {
        +[WCM_Logging logLevel:4 message:@"create FaceID Power Tables failed due controller being NULL"];
      }
    }
    else
    {
      +[WCM_Logging logLevel:0 message:@"Baseband FaceID config is null"];
    }
  }
}

- (void)sendMavConfigitems
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    xpc_object_t xdict = v3;
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    if (!v4)
    {
LABEL_36:

      xpc_object_t v3 = xdict;
      goto LABEL_37;
    }
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    if (!v5)
    {
LABEL_35:

      goto LABEL_36;
    }
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    if (v6)
    {
      uint64_t v7 = [(WCM_MavAntennaPolicy *)self mEurekaConfig];
      if (v7)
      {
        xpc_object_t v8 = (void *)v7;
        uint64_t v9 = [(WCM_MavAntennaPolicy *)self mMavCiConfig];
        if (v9)
        {
          xpc_object_t v10 = (void *)v9;
          id v11 = [(WCM_MavAntennaPolicy *)self mMavPtConfig];

          if (v11)
          {
            uint64_t v12 = +[WCM_PolicyManager singleton];
            uint64_t v13 = [v12 cellularController];

            if (v13)
            {
              xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
              uint64_t v15 = [(WCM_MavAntennaPolicy *)self mEurekaConfig];
              xpc_object_t v16 = xpc_copy(v15);

              xpc_dictionary_set_value(v4, "kWCMCellularSetAntBlocking_ClientInformationSet", v16);
              [v13 sendMessage:1224 withArgs:v4];
              xpc_object_t v17 = xpc_dictionary_create(0, 0, 0);
              if (v17)
              {
                xpc_object_t v44 = v16;
                xpc_object_t v45 = v6;
                uint64_t v18 = [(WCM_MavAntennaPolicy *)self createConditionIdXpcElement:0 mav_antenna_block_client_id:0 cellular_band:0 cellular_frequency_upper:0 cellular_frequency_lower:0 cellular_ant_mitigation:0];
                xpc_object_t v19 = xpc_array_create(0, 0);
                id v42 = v18;
                xpc_array_append_value(v19, v18);
                v41 = v19;
                xpc_dictionary_set_value(v17, "kWCMCellularTransparentMessageInformationSet", v19);
                v46 = v13;
                xpc_object_t v43 = v17;
                [v13 sendMessage:1223 withArgs:v17];
                +[WCM_Logging logLevel:4 message:@"Sending CID config params"];
                xpc_object_t v20 = xpc_array_create(0, 0);
                id v21 = [(WCM_MavAntennaPolicy *)self mMavCiConfig];
                xpc_object_t v22 = xpc_copy(v21);

                xpc_object_t v23 = xpc_array_create(0, 0);
                if (xpc_array_get_count(v22))
                {
                  size_t v24 = 0;
                  do
                  {
                    uint64_t v25 = xpc_array_get_value(v22, v24);
                    xpc_array_append_value(v23, v25);
                    if (((v24 + 1) & 7) == 0 || v24 + 1 == xpc_array_get_count(v22))
                    {
                      xpc_dictionary_set_value(v5, "kWCMCellularTransparentMessageInformationSet", v23);
                      [v46 sendMessage:1223 withArgs:v5];
                      xpc_object_t v26 = xpc_array_create(0, 0);

                      xpc_object_t v23 = v26;
                    }

                    ++v24;
                  }
                  while (xpc_array_get_count(v22) > v24);
                }
                +[WCM_Logging logLevel:4 message:@"Sending CID Pboff params"];
                xpc_object_t v27 = xpc_array_create(0, 0);
                v28 = [(WCM_MavAntennaPolicy *)self mMavPtConfig];
                xpc_object_t v29 = xpc_copy(v28);

                xpc_object_t v30 = xpc_array_create(0, 0);
                if (xpc_array_get_count(v29))
                {
                  size_t v31 = 0;
                  do
                  {
                    v32 = xpc_array_get_value(v29, v31);
                    xpc_array_append_value(v30, v32);
                    if (((v31 + 1) & 7) == 0 || v31 + 1 == xpc_array_get_count(v29))
                    {
                      xpc_dictionary_set_value(xdict, "kWCMCellularTransparentMessageInformationSet", v30);
                      [v46 sendMessage:1223 withArgs:xdict];
                      xpc_object_t v33 = xpc_array_create(0, 0);

                      xpc_object_t v30 = v33;
                    }

                    ++v31;
                  }
                  while (xpc_array_get_count(v29) > v31);
                }
                +[WCM_Logging logLevel:4 message:@"Sending SF Pboff params"];
                xpc_object_t v34 = xpc_array_create(0, 0);
                long long v35 = [(WCM_MavAntennaPolicy *)self mMavSfPboffConfig];
                xpc_object_t v36 = xpc_copy(v35);

                xpc_object_t v37 = xpc_array_create(0, 0);
                if (xpc_array_get_count(v36))
                {
                  size_t v38 = 0;
                  do
                  {
                    id v39 = xpc_array_get_value(v36, v38);
                    xpc_array_append_value(v37, v39);
                    if (((v38 + 1) & 7) == 0 || v38 + 1 == xpc_array_get_count(v36))
                    {
                      xpc_dictionary_set_value(v45, "kWCMCellularTransparentMessageInformationSet", v37);
                      [v46 sendMessage:1223 withArgs:v45];
                      xpc_object_t v40 = xpc_array_create(0, 0);

                      xpc_object_t v37 = v40;
                    }

                    ++v38;
                  }
                  while (xpc_array_get_count(v36) > v38);
                }
                [(WCM_MavAntennaPolicy *)self sendFaceIDPowerTables];

                xpc_object_t v6 = v45;
                uint64_t v13 = v46;
                xpc_object_t v17 = v43;
                xpc_object_t v16 = v44;
              }
            }
            else
            {
              +[WCM_Logging logLevel:4 message:@"create Mav ClientMappings failed due controller being NULL"];
            }

            goto LABEL_34;
          }
        }
        else
        {
        }
      }
      +[WCM_Logging logLevel:0 message:@"Baseband eur config is null"];
    }
LABEL_34:

    goto LABEL_35;
  }
LABEL_37:
}

- (id)createAntennaBlockingClientXpcArray:(id)a3 client_id:(int)a4 convBand:(unsigned __int8)a5
{
  int v5 = a5;
  id v8 = a3;
  uint64_t v9 = +[NSMutableDictionary dictionary];
  if (v8)
  {
    xpc_object_t v10 = [v8 objectForKey:@"Block_Voice"];
    unsigned int v11 = [v10 BOOLValue];

    uint64_t v12 = [v8 objectForKey:@"Duration_Granularity"];
    unsigned int v13 = [v12 unsignedIntValue];

    xpc_object_t v14 = [v8 objectForKey:@"Policy"];
    if (v14)
    {
      unsigned int v37 = v11;
      id v38 = v8;
      long long v51 = 0u;
      long long v52 = 0u;
      uint64_t v36 = v13;
      long long v49 = 0u;
      long long v50 = 0u;
      id obj = v14;
      id v44 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      uint64_t v15 = 0;
      if (!v44) {
        goto LABEL_23;
      }
      uint64_t v43 = *(void *)v50;
      xpc_object_t v40 = v9;
      int v39 = v5;
      while (1)
      {
        for (i = 0; i != v44; i = (char *)i + 1)
        {
          xpc_object_t v17 = v15;
          if (*(void *)v50 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          xpc_object_t v19 = +[NSMutableSet set];
          xpc_object_t v20 = [v18 objectForKey:@"Cellular_Ant"];
          uint64_t v21 = [v20 unsignedIntValue];

          uint64_t v15 = [v18 objectForKey:@"Cellular_Band_Array"];

          if (v5 != 1)
          {
            if (!v15) {
              goto LABEL_21;
            }
            size_t v31 = +[NSMutableSet set];
            v32 = +[NSNumber numberWithUnsignedLongLong:v21];
            [v9 setObject:v31 forKeyedSubscript:v32];

            v28 = +[NSNumber numberWithUnsignedLongLong:v21];
            xpc_object_t v29 = v9;
            xpc_object_t v30 = v15;
            goto LABEL_20;
          }
          uint64_t v42 = v21;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v22 = v15;
          id v23 = [v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v46;
            do
            {
              for (j = 0; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v46 != v25) {
                  objc_enumerationMutation(v22);
                }
                xpc_object_t v27 = +[NSNumber numberWithInt:[(WCM_MavAntennaPolicy *)self convertBandToEurBandId:*(void *)(*((void *)&v45 + 1) + 8 * (void)j)]];
                [v19 addObject:v27];
              }
              id v24 = [v22 countByEnumeratingWithState:&v45 objects:v53 count:16];
            }
            while (v24);
          }

          uint64_t v9 = v40;
          int v5 = v39;
          if (v19)
          {
            v28 = +[NSNumber numberWithUnsignedLongLong:v42];
            xpc_object_t v29 = v40;
            xpc_object_t v30 = v19;
LABEL_20:
            [v29 setObject:v30 forKeyedSubscript:v28];
          }
LABEL_21:
        }
        id v44 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
        if (!v44)
        {
LABEL_23:
          xpc_object_t v33 = obj;

          xpc_object_t v34 = [(WCM_MavAntennaPolicy *)self createXpcClientObjectWithClientId:a4 blockVoice:v37 timeMultipler:v36 antennaBandMappings:v9];
          id v8 = v38;
          goto LABEL_25;
        }
      }
    }
  }
  xpc_object_t v34 = 0;
  uint64_t v15 = 0;
  xpc_object_t v33 = 0;
LABEL_25:

  return v34;
}

- (void)addXpcBandEntriesWithAnt:(unint64_t)a3 bandsToAddSet:(id)a4 bandArray:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  xpc_object_t v9 = xpc_array_create(0, 0);
  if (v9)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        xpc_object_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          xpc_object_t v15 = xpc_uint64_create([*(id *)(*((void *)&v18 + 1) + 8 * (void)v14) unsignedIntValue]);
          xpc_array_append_value(v9, v15);

          xpc_object_t v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v17 = v16;
    if (v16)
    {
      xpc_dictionary_set_value(v16, "kWCMCellularSetAntBlocking_BandInfoSet_BandList", v9);
      xpc_dictionary_set_uint64(v17, "kWCMCellularSetAntBlocking_BandInfoSet_AntNum", a3);
      xpc_array_append_value(v8, v17);
    }
  }
}

- (id)createXpcClientObjectWithClientId:(int)a3 blockVoice:(BOOL)a4 timeMultipler:(unint64_t)a5 antennaBandMappings:(id)a6
{
  id v10 = a6;
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  if (v11)
  {
    xpc_object_t v12 = xpc_uint64_create(a3);
    xpc_dictionary_set_value(v11, "kWCMCellularSetAntBlocking_ClientId", v12);
    xpc_object_t v13 = xpc_BOOL_create(a4);
    xpc_dictionary_set_value(v11, "kWCMCellularSetAntBlocking_BlockVoice", v13);
    xpc_object_t v14 = xpc_uint64_create(a5);
    xpc_dictionary_set_value(v11, "kWCMCellularSetAntBlocking_TimeMultiplier", v14);
    xpc_object_t v15 = xpc_array_create(0, 0);
    if (v15)
    {
      xpc_object_t v26 = v13;
      xpc_object_t v27 = v12;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v28 = v10;
      id v16 = v10;
      id v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v30;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v30 != v19) {
              objc_enumerationMutation(v16);
            }
            long long v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            id v22 = [v21 unsignedLongValue];
            id v23 = [v16 objectForKeyedSubscript:v21];
            [(WCM_MavAntennaPolicy *)self addXpcBandEntriesWithAnt:v22 bandsToAddSet:v23 bandArray:v15];
          }
          id v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v18);
      }

      xpc_dictionary_set_value(v11, "kWCMCellularSetAntBlocking_BandInformationSet", v15);
      id v24 = v11;
      xpc_object_t v12 = v27;
      id v10 = v28;
      xpc_object_t v13 = v26;
    }
    else
    {
      id v24 = 0;
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)createHardcodedWifiClientMappings
{
  v2 = +[WCM_PolicyManager singleton];
  xpc_object_t v3 = [v2 activeCoexFeatures];
  unsigned __int8 v4 = [v3 containsObject:@"BB22_N79_DYNAMIC_ANTENNA_BLOCKING"];

  if ((v4 & 1) == 0)
  {
    +[WCM_Logging logLevel:0 message:@"ERROR: This should never happen. createHardcodedWifiClientMappings"];
    objc_exception_throw(NSInternalInconsistencyException);
  }
  +[WCM_Logging logLevel:4 message:@"cellular controller createHardcodedWifiClientMappings"];
  int v5 = +[WCM_PolicyManager singleton];
  xpc_object_t v6 = [v5 platformManager];
  unsigned int v7 = [v6 wrmPlatformId];

  id v8 = +[NSMutableDictionary dictionary];
  if ((v7 & 0xFFFFFFFC) == 0x10)
  {
    xpc_object_t v9 = +[NSMutableSet set];
    id v10 = +[NSNumber numberWithUnsignedLongLong:8];
    [v8 setObject:v9 forKeyedSubscript:v10];

    xpc_object_t v11 = +[NSNumber numberWithUnsignedLongLong:8];
    xpc_object_t v12 = [v8 objectForKeyedSubscript:v11];
    [v12 addObject:&off_10023CBB8];

    if (v7 == 17)
    {
      xpc_object_t v13 = +[NSMutableSet set];
      xpc_object_t v14 = +[NSNumber numberWithUnsignedLongLong:3];
      [v8 setObject:v13 forKeyedSubscript:v14];

      xpc_object_t v15 = +[NSNumber numberWithUnsignedLongLong:3];
      id v16 = [v8 objectForKeyedSubscript:v15];
      [v16 addObject:&off_10023CBD0];

      id v17 = +[NSNumber numberWithUnsignedLongLong:3];
      id v18 = [v8 objectForKeyedSubscript:v17];
      [v18 addObject:&off_10023CBE8];

      uint64_t v19 = +[NSNumber numberWithUnsignedLongLong:3];
      long long v20 = [v8 objectForKeyedSubscript:v19];
      long long v21 = v20;
      id v22 = &off_10023CC00;
LABEL_13:
      [v20 addObject:v22];
      goto LABEL_14;
    }
  }
  if ((v7 & 0xFFFFFFFD) == 0x10)
  {
    id v23 = +[NSMutableSet set];
    id v24 = +[NSNumber numberWithUnsignedLongLong:3];
    [v8 setObject:v23 forKeyedSubscript:v24];

    uint64_t v25 = +[NSNumber numberWithUnsignedLongLong:3];
    xpc_object_t v26 = [v8 objectForKeyedSubscript:v25];
    [v26 addObject:&off_10023CC18];
  }
  if (v7 == 146)
  {
    xpc_object_t v27 = +[NSMutableSet set];
    id v28 = +[NSNumber numberWithUnsignedLongLong:4];
    [v8 setObject:v27 forKeyedSubscript:v28];

    uint64_t v19 = +[NSNumber numberWithUnsignedLongLong:4];
    long long v20 = [v8 objectForKeyedSubscript:v19];
    long long v21 = v20;
    id v22 = &off_10023CBB8;
    goto LABEL_13;
  }
  if (v7 == 144)
  {
    long long v29 = +[NSMutableSet set];
    long long v30 = +[NSNumber numberWithUnsignedLongLong:6];
    [v8 setObject:v29 forKeyedSubscript:v30];

    uint64_t v19 = +[NSNumber numberWithUnsignedLongLong:6];
    long long v20 = [v8 objectForKeyedSubscript:v19];
    long long v21 = v20;
    id v22 = &off_10023CC30;
    goto LABEL_13;
  }
  if (v7 != 19) {
    goto LABEL_15;
  }
  uint64_t v19 = +[NSMutableSet set];
  long long v21 = +[NSNumber numberWithUnsignedLongLong:3];
  [v8 setObject:v19 forKeyedSubscript:v21];
LABEL_14:

LABEL_15:

  return v8;
}

- (id)createDynamicAntBlockingWifiClientMappingsWithCellAntBlkEnableIdx1:(unsigned __int8)a3 cellAntBlkEnableIdx2:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  unsigned int v5 = a3;
  xpc_object_t v6 = +[WCM_PolicyManager singleton];
  unsigned int v7 = [v6 activeCoexFeatures];
  unsigned __int8 v8 = [v7 containsObject:@"BB22_N79_DYNAMIC_ANTENNA_BLOCKING"];

  if ((v8 & 1) == 0)
  {
    +[WCM_Logging logLevel:0 message:@"ERROR: This should never happen. createN79MitigationWifiClientMappingsWithCellAntBlkEnableIdx1"];
    objc_exception_throw(NSInternalInconsistencyException);
  }
  uint64_t v9 = v4;
  uint64_t v10 = v5;
  +[WCM_Logging logLevel:4, @"cellular controller createN79MitigationWifiClientMappings idx1: %d and idx2: %d", v5, v4 message];
  xpc_object_t v11 = +[WCM_PolicyManager singleton];
  xpc_object_t v12 = [v11 platformManager];
  [v12 wrmPlatformId];

  xpc_object_t v13 = +[NSMutableDictionary dictionary];
  xpc_object_t v14 = +[NSMutableSet set];
  xpc_object_t v15 = +[NSNumber numberWithUnsignedLongLong:v10];
  [v13 setObject:v14 forKeyedSubscript:v15];

  id v16 = +[NSNumber numberWithUnsignedLongLong:v10];
  id v17 = [v13 objectForKeyedSubscript:v16];
  [v17 addObject:&off_10023CBB8];

  if (v4)
  {
    id v18 = +[NSMutableSet set];
    uint64_t v19 = +[NSNumber numberWithUnsignedLongLong:v9];
    [v13 setObject:v18 forKeyedSubscript:v19];

    long long v20 = +[NSNumber numberWithUnsignedLongLong:v9];
    long long v21 = [v13 objectForKeyedSubscript:v20];
    [v21 addObject:&off_10023CBB8];
  }

  return v13;
}

- (id)createHardcodedRc1ClientMappings
{
  v2 = +[WCM_PolicyManager singleton];
  xpc_object_t v3 = [v2 activeCoexFeatures];
  unsigned __int8 v4 = [v3 containsObject:@"BB22_N79_DYNAMIC_ANTENNA_BLOCKING"];

  if ((v4 & 1) == 0)
  {
    +[WCM_Logging logLevel:0 message:@"ERROR: This should never happen. createHardcodedRc1ClientMappings"];
    objc_exception_throw(NSInternalInconsistencyException);
  }
  +[WCM_Logging logLevel:4 message:@"cellular controller createHardcodedRc1ClientMappings"];
  unsigned int v5 = +[WCM_PolicyManager singleton];
  xpc_object_t v6 = [v5 platformManager];
  unsigned int v7 = [v6 wrmPlatformId];

  unsigned __int8 v8 = +[NSMutableDictionary dictionary];
  if ((v7 & 0xFFFFFFFC) == 0x10)
  {
    uint64_t v9 = +[NSMutableSet set];
    uint64_t v10 = +[NSNumber numberWithUnsignedLongLong:8];
    [v8 setObject:v9 forKeyedSubscript:v10];

    xpc_object_t v11 = +[NSNumber numberWithUnsignedLongLong:8];
    xpc_object_t v12 = [v8 objectForKeyedSubscript:v11];
    [v12 addObject:&off_10023CBB8];

    if (v7 == 17)
    {
      xpc_object_t v13 = +[NSMutableSet set];
      xpc_object_t v14 = +[NSNumber numberWithUnsignedLongLong:2];
      [v8 setObject:v13 forKeyedSubscript:v14];

      xpc_object_t v15 = +[NSNumber numberWithUnsignedLongLong:2];
      id v16 = [v8 objectForKeyedSubscript:v15];
      [v16 addObject:&off_10023CC48];

LABEL_10:
      xpc_object_t v27 = +[NSMutableSet set];
      id v28 = +[NSNumber numberWithUnsignedLongLong:4];
      [v8 setObject:v27 forKeyedSubscript:v28];

      long long v21 = +[NSNumber numberWithUnsignedLongLong:4];
      id v22 = [v8 objectForKeyedSubscript:v21];
      id v23 = v22;
      id v24 = &off_10023CC78;
      goto LABEL_11;
    }
  }
  switch(v7)
  {
    case 0x12u:
      uint64_t v25 = +[NSMutableSet set];
      xpc_object_t v26 = +[NSNumber numberWithUnsignedLongLong:2];
      [v8 setObject:v25 forKeyedSubscript:v26];

      long long v21 = +[NSNumber numberWithUnsignedLongLong:2];
      id v22 = [v8 objectForKeyedSubscript:v21];
      id v23 = v22;
      id v24 = &off_10023CC48;
      break;
    case 0x10u:
      id v17 = +[NSMutableSet set];
      id v18 = +[NSNumber numberWithUnsignedLongLong:2];
      [v8 setObject:v17 forKeyedSubscript:v18];

      uint64_t v19 = +[NSNumber numberWithUnsignedLongLong:2];
      long long v20 = [v8 objectForKeyedSubscript:v19];
      [v20 addObject:&off_10023CC48];

      long long v21 = +[NSNumber numberWithUnsignedLongLong:2];
      id v22 = [v8 objectForKeyedSubscript:v21];
      id v23 = v22;
      id v24 = &off_10023CC60;
      break;
    case 0x11u:
      goto LABEL_10;
    default:
      goto LABEL_12;
  }
LABEL_11:
  [v22 addObject:v24];

LABEL_12:

  return v8;
}

- (id)createHardcodedFcamClientMappings
{
  v2 = +[WCM_PolicyManager singleton];
  xpc_object_t v3 = [v2 activeCoexFeatures];
  unsigned __int8 v4 = [v3 containsObject:@"BB22_N79_DYNAMIC_ANTENNA_BLOCKING"];

  if ((v4 & 1) == 0)
  {
    +[WCM_Logging logLevel:0 message:@"ERROR: This should never happen. createHardcodedFcamClientMappings"];
    objc_exception_throw(NSInternalInconsistencyException);
  }
  +[WCM_Logging logLevel:4 message:@"cellular controller createHardcodedFcamClientMappings"];
  unsigned int v5 = +[WCM_PolicyManager singleton];
  xpc_object_t v6 = [v5 platformManager];
  unsigned int v7 = [v6 wrmPlatformId];

  unsigned __int8 v8 = +[NSMutableDictionary dictionary];
  switch(v7)
  {
    case 0x10u:
    case 0x11u:
    case 0x13u:
      uint64_t v9 = +[NSMutableSet set];
      uint64_t v10 = +[NSNumber numberWithUnsignedLongLong:8];
      [v8 setObject:v9 forKeyedSubscript:v10];

      xpc_object_t v11 = +[NSNumber numberWithUnsignedLongLong:8];
      xpc_object_t v12 = [v8 objectForKeyedSubscript:v11];
      [v12 addObject:&off_10023CBB8];

      xpc_object_t v13 = +[NSNumber numberWithUnsignedLongLong:8];
      xpc_object_t v14 = [v8 objectForKeyedSubscript:v13];
      xpc_object_t v15 = v14;
      id v16 = &off_10023CC90;
      goto LABEL_6;
    case 0x12u:
      id v23 = +[NSMutableSet set];
      id v24 = +[NSNumber numberWithUnsignedLongLong:8];
      [v8 setObject:v23 forKeyedSubscript:v24];

      xpc_object_t v13 = +[NSNumber numberWithUnsignedLongLong:8];
      xpc_object_t v14 = [v8 objectForKeyedSubscript:v13];
      xpc_object_t v15 = v14;
      id v16 = &off_10023CBB8;
      goto LABEL_6;
    case 0x16u:
    case 0x17u:
      id v17 = +[NSMutableSet set];
      id v18 = +[NSNumber numberWithUnsignedLongLong:8];
      [v8 setObject:v17 forKeyedSubscript:v18];

      uint64_t v19 = +[NSNumber numberWithUnsignedLongLong:8];
      long long v20 = [v8 objectForKeyedSubscript:v19];
      [v20 addObject:&off_10023CBB8];

      long long v21 = +[NSNumber numberWithUnsignedLongLong:8];
      id v22 = [v8 objectForKeyedSubscript:v21];
      [v22 addObject:&off_10023CC90];

      xpc_object_t v13 = +[NSNumber numberWithUnsignedLongLong:8];
      xpc_object_t v14 = [v8 objectForKeyedSubscript:v13];
      xpc_object_t v15 = v14;
      id v16 = &off_10023CC78;
LABEL_6:
      [v14 addObject:v16];

      break;
    default:
      break;
  }

  return v8;
}

- (id)createHardcodedFidClientMappings
{
  v2 = +[WCM_PolicyManager singleton];
  xpc_object_t v3 = [v2 activeCoexFeatures];
  unsigned __int8 v4 = [v3 containsObject:@"BB22_N79_DYNAMIC_ANTENNA_BLOCKING"];

  if ((v4 & 1) == 0)
  {
    +[WCM_Logging logLevel:0 message:@"ERROR: This should never happen. createHardcodedFidClientMappings"];
    objc_exception_throw(NSInternalInconsistencyException);
  }
  +[WCM_Logging logLevel:4 message:@"cellular controller createHardcodedFidClientMappings"];
  unsigned int v5 = +[WCM_PolicyManager singleton];
  xpc_object_t v6 = [v5 platformManager];
  unsigned int v7 = [v6 wrmPlatformId];

  unsigned __int8 v8 = +[NSMutableDictionary dictionary];
  if (v7 == 23 || v7 == 16)
  {
    uint64_t v9 = +[NSMutableSet set];
    uint64_t v10 = +[NSNumber numberWithUnsignedLongLong:2];
    [v8 setObject:v9 forKeyedSubscript:v10];

    xpc_object_t v11 = +[NSNumber numberWithUnsignedLongLong:2];
    xpc_object_t v12 = [v8 objectForKeyedSubscript:v11];
    [v12 addObject:&off_10023CC60];

    xpc_object_t v13 = +[NSNumber numberWithUnsignedLongLong:2];
    xpc_object_t v14 = [v8 objectForKeyedSubscript:v13];
    [v14 addObject:&off_10023CC48];
  }

  return v8;
}

- (id)createHardcodedJpgRegClientMappings
{
  v2 = +[WCM_PolicyManager singleton];
  xpc_object_t v3 = [v2 activeCoexFeatures];
  unsigned __int8 v4 = [v3 containsObject:@"BB22_N79_DYNAMIC_ANTENNA_BLOCKING"];

  if ((v4 & 1) == 0)
  {
    +[WCM_Logging logLevel:0 message:@"ERROR: This should never happen. createHardcodedJpgRegClientMappings"];
    objc_exception_throw(NSInternalInconsistencyException);
  }
  +[WCM_Logging logLevel:4 message:@"cellular controller createHardcodedJpgRegClientMappings"];
  unsigned int v5 = +[WCM_PolicyManager singleton];
  xpc_object_t v6 = [v5 platformManager];
  unsigned int v7 = [v6 wrmPlatformId];

  unsigned __int8 v8 = +[NSMutableDictionary dictionary];
  if (v7 == 146)
  {
    uint64_t v9 = +[NSMutableSet set];
    uint64_t v10 = +[NSNumber numberWithUnsignedLongLong:6];
    [v8 setObject:v9 forKeyedSubscript:v10];

    xpc_object_t v11 = +[NSNumber numberWithUnsignedLongLong:6];
    xpc_object_t v12 = [v8 objectForKeyedSubscript:v11];
    [v12 addObject:&off_10023CC90];

    xpc_object_t v13 = +[NSNumber numberWithUnsignedLongLong:6];
    xpc_object_t v14 = [v8 objectForKeyedSubscript:v13];
    [v14 addObject:&off_10023CC78];
  }

  return v8;
}

- (void)reconfigureClientAntBlockingParamsWithCellAntBlkEnableIdx1:(unsigned __int8)a3 cellAntBlkEnableIdx2:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  unsigned int v7 = +[WCM_PolicyManager singleton];
  unsigned __int8 v8 = [v7 activeCoexFeatures];
  unsigned __int8 v9 = [v8 containsObject:@"BB22_N79_DYNAMIC_ANTENNA_BLOCKING"];

  if ((v9 & 1) == 0)
  {
    +[WCM_Logging logLevel:0 message:@"ERROR: This should never happen. reconfigureClientAntBlockingParamsWithCellAntBlkEnableIdx1"];
    objc_exception_throw(NSInternalInconsistencyException);
  }
  +[WCM_Logging logLevel:4, @"cellular controller reconfigure antenna blocking to cellAntBlkEnableIdx1 %d and cellAntBlkEnableIdx2 %d", v5, v4 message];
  xpc_object_t v11 = +[WCM_PolicyManager singleton];
  xpc_object_t v12 = [v11 platformManager];
  unsigned int v13 = [v12 wrmPlatformId];

  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  if (v14)
  {
    xpc_object_t v15 = xpc_array_create(0, 0);
    if (v15)
    {
      if (v13 == 25) {
        [(WCM_MavAntennaPolicy *)self createDynamicAntBlockingWifiClientMappingsWithCellAntBlkEnableIdx1:v5 cellAntBlkEnableIdx2:v4];
      }
      else {
      long long v29 = [(WCM_MavAntennaPolicy *)self createHardcodedWifiClientMappings];
      }
      id v16 = [(WCM_MavAntennaPolicy *)self createXpcClientObjectWithClientId:0 blockVoice:0 timeMultipler:250 antennaBandMappings:v29];
      if (v16) {
        xpc_array_append_value(v15, v16);
      }
      xpc_object_t v27 = [(WCM_MavAntennaPolicy *)self createHardcodedRc1ClientMappings];
      id v17 = -[WCM_MavAntennaPolicy createXpcClientObjectWithClientId:blockVoice:timeMultipler:antennaBandMappings:](self, "createXpcClientObjectWithClientId:blockVoice:timeMultipler:antennaBandMappings:", 1, 1, 250);
      if (v17) {
        xpc_array_append_value(v15, v17);
      }
      long long v30 = v10;
      xpc_object_t v26 = [(WCM_MavAntennaPolicy *)self createHardcodedFcamClientMappings];
      id v18 = -[WCM_MavAntennaPolicy createXpcClientObjectWithClientId:blockVoice:timeMultipler:antennaBandMappings:](self, "createXpcClientObjectWithClientId:blockVoice:timeMultipler:antennaBandMappings:", 2, 1, 250);
      if (v18) {
        xpc_array_append_value(v15, v18);
      }
      id v28 = v16;
      uint64_t v19 = [(WCM_MavAntennaPolicy *)self createHardcodedFidClientMappings];
      long long v20 = [(WCM_MavAntennaPolicy *)self createXpcClientObjectWithClientId:3 blockVoice:1 timeMultipler:250 antennaBandMappings:v19];
      if (v20) {
        xpc_array_append_value(v15, v20);
      }
      long long v21 = [(WCM_MavAntennaPolicy *)self createHardcodedJpgRegClientMappings];
      id v22 = [(WCM_MavAntennaPolicy *)self createXpcClientObjectWithClientId:2 blockVoice:0 timeMultipler:250 antennaBandMappings:v21];
      if (v22) {
        xpc_array_append_value(v15, v22);
      }
      xpc_dictionary_set_value(v14, "kWCMCellularSetAntBlocking_ClientInformationSet", v15);
      id v23 = [v14 description];
      +[WCM_Logging logLevel:4, @"cellular controller final args: %@", v23 message];

      id v24 = +[WCM_PolicyManager singleton];
      uint64_t v25 = [v24 cellularController];

      [v25 sendMessage:1221 withArgs:v14];
      uint64_t v10 = v30;
    }
  }
}

- (id)createConditionIdXpcElement:(unsigned int)a3 mav_antenna_block_client_id:(unsigned int)a4 cellular_band:(unsigned int)a5 cellular_frequency_upper:(unsigned int)a6 cellular_frequency_lower:(unsigned int)a7 cellular_ant_mitigation:(unsigned int)a8
{
  unsigned int v28 = a8;
  xpc_object_t v13 = xpc_array_create(0, 0);
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v15 = xpc_uint64_create(0xAuLL);
  unsigned int v26 = 1000 * a6;
  unsigned int v27 = 1000 * a7;
  xpc_object_t v16 = xpc_uint64_create(a3);
  xpc_array_append_value(v13, v16);

  xpc_object_t v17 = xpc_uint64_create(a4);
  xpc_array_append_value(v13, v17);

  xpc_object_t v18 = xpc_uint64_create(a5);
  xpc_array_append_value(v13, v18);

  for (uint64_t i = 0; i != 4; ++i)
  {
    xpc_object_t v20 = xpc_uint64_create(*((unsigned __int8 *)&v26 + i));
    xpc_array_append_value(v13, v20);
  }
  for (uint64_t j = 0; j != 4; ++j)
  {
    xpc_object_t v22 = xpc_uint64_create(*((unsigned __int8 *)&v27 + j));
    xpc_array_append_value(v13, v22);
  }
  for (uint64_t k = 0; k != 4; ++k)
  {
    xpc_object_t v24 = xpc_uint64_create(*((unsigned __int8 *)&v28 + k));
    xpc_array_append_value(v13, v24);
  }
  xpc_dictionary_set_value(v14, "kWCMCellularTransparentMessage_Type", v15);
  xpc_dictionary_set_value(v14, "kWCMCellularTransparentMessage_ByteList", v13);

  return v14;
}

- (id)createPowerTableXpcElement:(unsigned int)a3 ant:(unsigned int)a4 target_power_dbm:(unsigned int)a5 condition_id:(unsigned int)a6 entry_num:(unsigned int)a7
{
  unsigned __int8 v7 = a7;
  unsigned __int8 v8 = a6;
  char v9 = a5;
  xpc_object_t v12 = xpc_array_create(0, 0);
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v14 = xpc_uint64_create(0xBuLL);
  xpc_object_t v15 = xpc_uint64_create(a3);
  xpc_array_append_value(v12, v15);

  xpc_object_t v16 = xpc_uint64_create(a4);
  xpc_array_append_value(v12, v16);

  xpc_object_t v17 = xpc_uint64_create(2 * ((5 * v9) & 0x7Fu));
  xpc_array_append_value(v12, v17);

  xpc_object_t v18 = xpc_uint64_create(v8);
  xpc_array_append_value(v12, v18);

  xpc_object_t v19 = xpc_uint64_create(v7);
  xpc_array_append_value(v12, v19);

  xpc_dictionary_set_value(v13, "kWCMCellularTransparentMessage_Type", v14);
  xpc_dictionary_set_value(v13, "kWCMCellularTransparentMessage_ByteList", v12);

  return v13;
}

- (id)createFaceIDPowerTableXpcElement:(unsigned int)a3 ant:(unsigned int)a4 target_power_dbm:(unsigned int)a5
{
  xpc_object_t v8 = xpc_array_create(0, 0);
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v10 = xpc_uint64_create(0xDuLL);
  xpc_object_t v11 = xpc_uint64_create(a3);
  xpc_array_append_value(v8, v11);

  xpc_object_t v12 = xpc_uint64_create(a4);
  xpc_array_append_value(v8, v12);

  xpc_object_t v13 = xpc_uint64_create(a5);
  xpc_array_append_value(v8, v13);

  xpc_dictionary_set_value(v9, "kWCMCellularTransparentMessage_Type", v10);
  xpc_dictionary_set_value(v9, "kWCMCellularTransparentMessage_ByteList", v8);

  return v9;
}

- (id)createSubframePowerBackOffTableXpcElement:(id)a3 condition_id:(unsigned int)a4
{
  unsigned __int8 v4 = a4;
  id v6 = a3;
  xpc_object_t v7 = xpc_array_create(0, 0);
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v9 = xpc_uint64_create(0xCuLL);
  xpc_object_t v10 = xpc_uint64_create(v4);
  xpc_array_append_value(v7, v10);

  LOBYTE(v10) = [(WCM_MavAntennaPolicy *)self convertBandToEurBandId:v6];
  xpc_object_t v11 = xpc_uint64_create(v10);
  xpc_array_append_value(v7, v11);

  xpc_dictionary_set_value(v8, "kWCMCellularTransparentMessage_Type", v9);
  xpc_dictionary_set_value(v8, "kWCMCellularTransparentMessage_ByteList", v7);

  return v8;
}

- (int)convertBandToEurBandId:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"n79"])
  {
    int v4 = 202;
  }
  else if ([v3 isEqualToString:@"n1"])
  {
    int v4 = 182;
  }
  else if ([v3 isEqualToString:@"n77"])
  {
    int v4 = 200;
  }
  else if ([v3 isEqualToString:@"n78"])
  {
    int v4 = 201;
  }
  else if ([v3 isEqualToString:@"b1"])
  {
    int v4 = 120;
  }
  else if ([v3 isEqualToString:@"b38"])
  {
    int v4 = 157;
  }
  else
  {
    if ([v3 isEqualToString:@"b3"]) {
      goto LABEL_14;
    }
    if ([v3 isEqualToString:@"n38"]) {
      goto LABEL_16;
    }
    if ([v3 isEqualToString:@"b25"])
    {
      int v4 = 144;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"b7"])
    {
      int v4 = 126;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"n7"])
    {
      int v4 = 186;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"b40"])
    {
      int v4 = 159;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"b4"])
    {
      int v4 = 123;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"b42"])
    {
      int v4 = 161;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"n40"])
    {
      int v4 = 219;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"n38"])
    {
LABEL_16:
      int v4 = 190;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"n41"])
    {
      int v4 = 191;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"b41"])
    {
      int v4 = 160;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"n48"])
    {
      int v4 = 222;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"b48"])
    {
      int v4 = 178;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"n30"])
    {
      int v4 = 227;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"b30"])
    {
      int v4 = 149;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"n66"])
    {
      int v4 = 194;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"b66"])
    {
      int v4 = 168;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"n3"])
    {
      int v4 = 184;
      goto LABEL_66;
    }
    if ([v3 isEqualToString:@"b3"])
    {
LABEL_14:
      int v4 = 122;
    }
    else if ([v3 isEqualToString:@"n70"])
    {
      int v4 = 195;
    }
    else if ([v3 isEqualToString:@"b34"])
    {
      int v4 = 153;
    }
    else if ([v3 isEqualToString:@"b2"])
    {
      int v4 = 121;
    }
    else if ([v3 isEqualToString:@"n2"])
    {
      int v4 = 183;
    }
    else if ([v3 isEqualToString:@"b5"])
    {
      int v4 = 124;
    }
    else if ([v3 isEqualToString:@"n18"])
    {
      int v4 = 225;
    }
    else if ([v3 isEqualToString:@"b18"])
    {
      int v4 = 137;
    }
    else
    {
      +[WCM_Logging logLevel:0, @"MavAntPolicy Plist Error: Unrecognized band in plist, rectify %@", v3 message];
      int v4 = 244;
    }
  }
LABEL_66:

  return v4;
}

- (OS_xpc_object)mEurekaConfig
{
  return self->_mEurekaConfig;
}

- (void)setMEurekaConfig:(id)a3
{
}

- (OS_xpc_object)mMavCiConfig
{
  return self->_mMavCiConfig;
}

- (void)setMMavCiConfig:(id)a3
{
}

- (NSMutableArray)mWifiCiConfig
{
  return self->_mWifiCiConfig;
}

- (void)setMWifiCiConfig:(id)a3
{
}

- (OS_xpc_object)mMavPtConfig
{
  return self->_mMavPtConfig;
}

- (void)setMMavPtConfig:(id)a3
{
}

- (OS_xpc_object)mMavSfPboffConfig
{
  return self->_mMavSfPboffConfig;
}

- (void)setMMavSfPboffConfig:(id)a3
{
}

- (OS_xpc_object)mMavFaceIdPtConfig
{
  return self->_mMavFaceIdPtConfig;
}

- (void)setMMavFaceIdPtConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mMavFaceIdPtConfig, 0);
  objc_storeStrong((id *)&self->_mMavSfPboffConfig, 0);
  objc_storeStrong((id *)&self->_mMavPtConfig, 0);
  objc_storeStrong((id *)&self->_mWifiCiConfig, 0);
  objc_storeStrong((id *)&self->_mMavCiConfig, 0);
  objc_storeStrong((id *)&self->_mEurekaConfig, 0);
  objc_storeStrong((id *)&self->mFixedPbOffBands, 0);

  objc_storeStrong((id *)&self->mFixedAntClients, 0);
}

@end