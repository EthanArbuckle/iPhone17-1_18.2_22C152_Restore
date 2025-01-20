@interface PBPasteAuthority
- (BOOL)isSharingTokenValidForPasteboard:(id)a3 token:(id)a4;
- (PBPasteAuthority)init;
- (const)preliminaryAccessForPasteboard:(id)a3 auditTokenInfo:(id)a4 authenticationMessage:(id)a5 sharingToken:(id)a6 dataOwner:(int64_t)a7;
- (id)tccIdentityForAuditTokenInfo:(id)a3;
- (id)tccSyncMessageOptions;
- (unint64_t)accessToPasteboard:(id)a3 auditTokenInfo:(id)a4 authenticationMessage:(id)a5 sharingToken:(id)a6 dataOwner:(int64_t)a7;
- (unint64_t)isPasteAuthenticForAuthenticationMessage:(id)a3 auditTokenInfo:(id)a4 currentTimestamp:(unint64_t)a5;
- (unint64_t)isPasteAuthorizedForAuditTokenInfo:(id)a3 pasteboard:(id)a4 currentTimestamp:(unint64_t)a5;
- (unint64_t)isPasteExemptForPasteboard:(id)a3 auditTokenInfo:(id)a4;
- (unint64_t)isPasteManageableForPasteboard:(id)a3 auditTokenInfo:(id)a4 dataOwner:(int64_t)a5;
- (unint64_t)isPasteNativeForPasteboard:(id)a3 auditTokenInfo:(id)a4;
- (unint64_t)isPasteTimelyForPasteboard:(id)a3 currentTimestamp:(unint64_t)a4;
- (unint64_t)pasteAccessFromTCCForAuditTokenInfo:(id)a3;
- (unint64_t)pasteLegibleForPasteboard:(id)a3 authenticationMessage:(id)a4 auditTokenInfo:(id)a5;
- (unint64_t)tccAuthorizationRightForAuditTokenInfo:(id)a3 encounteredError:(BOOL *)a4;
- (void)recordInteractivePasteAuthorizationPromptActivityForAuditTokenInfo:(id)a3;
@end

@implementation PBPasteAuthority

- (PBPasteAuthority)init
{
  v17.receiver = self;
  v17.super_class = (Class)PBPasteAuthority;
  v2 = [(PBPasteAuthority *)&v17 init];
  if (v2)
  {
    uint64_t v16 = 0x3FF0000000000000;
    long long v19 = xmmword_1000257F0;
    v3 = (UISTransform3DGrader *)objc_alloc_init((Class)UISTransform3DGrader);
    layerGrader = v2->_layerGrader;
    v2->_layerGrader = v3;

    -[UISTransform3DGrader allowRotations:count:](v2->_layerGrader, "allowRotations:count:", &UISAllDeviceRotations, UISAllDeviceRotationCount, v16);
    [(UISTransform3DGrader *)v2->_layerGrader allowScales:&v16 count:1 lowerMultiplier:0.85 lowerConstant:0.0 upperMultiplier:1.1 upperConstant:0.0];
    [(UISTransform3DGrader *)v2->_layerGrader allowShift:5.0];
    v5 = (UISTransform3DGrader *)objc_alloc_init((Class)UISTransform3DGrader);
    contentsGrader = v2->_contentsGrader;
    v2->_contentsGrader = v5;

    [(UISTransform3DGrader *)v2->_contentsGrader allowScales:&v19 count:2 lowerMultiplier:1.0 lowerConstant:0.0 upperMultiplier:1.0 upperConstant:0.0];
    [(UISTransform3DGrader *)v2->_contentsGrader allowTranslation:1.0];
    PBPreferencesDoubleValue();
    double v8 = v7;
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v9) = info.denom;
    LODWORD(v10) = info.numer;
    v2->_copyAlienExpiryPeriod = (unint64_t)(v8 * (double)v9 * 1000000000.0 / (double)v10);
    uint64_t v11 = tcc_server_create();
    tccServer = v2->_tccServer;
    v2->_tccServer = (OS_tcc_server *)v11;

    uint64_t v13 = tcc_service_singleton_for_CF_name();
    tccService = v2->_tccService;
    v2->_tccService = (OS_tcc_service *)v13;
  }
  return v2;
}

- (unint64_t)isPasteExemptForPasteboard:(id)a3 auditTokenInfo:(id)a4
{
  id v5 = a4;
  if ([a3 isGeneralPasteboard])
  {
    if ([v5 isAllowedToPasteUnchecked]) {
      unint64_t v6 = 2;
    }
    else {
      unint64_t v6 = 3;
    }
  }
  else
  {
    unint64_t v6 = 1;
  }

  return v6;
}

- (unint64_t)isPasteTimelyForPasteboard:(id)a3 currentTimestamp:(unint64_t)a4
{
  id v6 = a3;
  if ([v6 isOrWasRemote])
  {
    unint64_t v7 = 4;
  }
  else
  {
    double v8 = [v6 saveBootSession];
    unint64_t v9 = sub_100012AA0();
    unsigned int v10 = [v8 isEqual:v9];

    if (v10)
    {
      id v11 = [v6 saveTimestamp];
      if ((unint64_t)v11 <= a4)
      {
        if ((unint64_t)v11 + self->_copyAlienExpiryPeriod < a4) {
          unint64_t v7 = 7;
        }
        else {
          unint64_t v7 = 8;
        }
      }
      else
      {
        unint64_t v7 = 6;
      }
    }
    else
    {
      unint64_t v7 = 5;
    }
  }

  return v7;
}

- (unint64_t)isPasteManageableForPasteboard:(id)a3 auditTokenInfo:(id)a4 dataOwner:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  unint64_t v9 = +[MCProfileConnection sharedConnection];
  if (![v9 isPasteboardManagementEnabled])
  {
    unint64_t v13 = 9;
    goto LABEL_11;
  }
  unsigned int v10 = [v8 bundleID];
  id v11 = [v9 dataOwnerForBundleID:v10 requestedDataOwner:a5];

  id v12 = [v7 originatorDataOwner];
  if ((unint64_t)v12 >= 2)
  {
    if (v12 == (id)2
      && (unint64_t)v11 <= 1
      && ![v9 isManagedToUnmanagedPasteAllowed])
    {
      unint64_t v13 = 11;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if (v11 != (id)2 || ([v9 isUnmanagedToManagedPasteAllowed] & 1) != 0)
  {
LABEL_10:
    unint64_t v13 = 12;
    goto LABEL_11;
  }
  unint64_t v13 = 10;
LABEL_11:

  return v13;
}

- (unint64_t)isPasteNativeForPasteboard:(id)a3 auditTokenInfo:(id)a4
{
  if (sub_100012074(a3, a4)) {
    return 13;
  }
  else {
    return 14;
  }
}

- (unint64_t)isPasteAuthenticForAuthenticationMessage:(id)a3 auditTokenInfo:(id)a4 currentTimestamp:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 originIdentifier];
  if (v9 == (id)0x30D8E242D30C9F99)
  {
    unint64_t v13 = +[PBSecurePasteAuthenticationMessageGenerator sharedInstance];
    unsigned int v14 = [v13 validateAuthenticationMessage:v7];

    if (!v14)
    {
LABEL_4:
      unint64_t v12 = 15;
      goto LABEL_13;
    }
  }
  else
  {
    if (v9 != (id)0xC181BADB23D8497BLL)
    {
      unint64_t v12 = 16;
      goto LABEL_13;
    }
    unsigned int v10 = +[BKSHIDEventDeliveryManager sharedInstance];
    id v11 = [v10 authenticateMessage:v7];

    if (v11 != (id)2) {
      goto LABEL_4;
    }
  }
  id v15 = [v7 versionedPID];
  if (v8) {
    [v8 auditToken];
  }
  if (v15 != (id)BSVersionedPIDForAuditToken())
  {
    unint64_t v12 = 17;
    goto LABEL_13;
  }
  if ((unint64_t)[v7 timestamp] > a5)
  {
    unint64_t v12 = 18;
    goto LABEL_13;
  }
  uint64_t v17 = (uint64_t)[v7 context];
  uint64_t v18 = v17;
  unint64_t v12 = 20;
  if (v17 <= 0xC59AA8F622F26FBLL)
  {
    if (v17 <= (uint64_t)0xA9745AB1695ED68ALL)
    {
      if (v17 <= (uint64_t)0x95DD33C9595B8B09)
      {
        if (v17 == 0x84E6A8CBF3F0F10CLL) {
          goto LABEL_13;
        }
        unint64_t v19 = 0x926FA0AD41ACE950;
      }
      else
      {
        if (v17 == 0x95DD33C9595B8B0ALL || v17 == 0x9D0980DD8F0CAFCBLL) {
          goto LABEL_13;
        }
        unint64_t v19 = 0xA16D1C5A60C000E1;
      }
    }
    else if (v17 > (uint64_t)0xF317E322CB2CEA01)
    {
      if (v17 == 0xF317E322CB2CEA02 || v17 == 0xF635B19E69CD15ECLL) {
        goto LABEL_13;
      }
      unint64_t v19 = 0x6B3CE0810AAF53ALL;
    }
    else
    {
      if (v17 == 0xA9745AB1695ED68BLL || v17 == 0xB40F49E017F83014) {
        goto LABEL_13;
      }
      unint64_t v19 = 0xC58523F7A4B7A983;
    }
  }
  else if (v17 > 0x51A2F5DDCA075EA0)
  {
    if (v17 > 0x67510999674CD01DLL)
    {
      if (v17 == 0x67510999674CD01ELL || v17 == 0x70A52C167AE7B042) {
        goto LABEL_13;
      }
      unint64_t v19 = 0x7EC07AF570CAADBCLL;
    }
    else
    {
      if (v17 == 0x51A2F5DDCA075EA1 || v17 == 0x5597A8D691A21829) {
        goto LABEL_13;
      }
      unint64_t v19 = 0x5A4A97C3218CE65BLL;
    }
  }
  else if (v17 > 0x2BB12563A205EBD0)
  {
    if (v17 == 0x2BB12563A205EBD1 || v17 == 0x37CA128B814942F4) {
      goto LABEL_13;
    }
    unint64_t v19 = 0x41683F1594B2E071;
  }
  else
  {
    if (v17 == 0xC59AA8F622F26FCLL || v17 == 0x237A2046F04E760CLL) {
      goto LABEL_13;
    }
    unint64_t v19 = 0x25FC7F58D8DEA672;
  }
  if (v17 != v19)
  {
    v20 = _PBLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Authentication message has unexpected context %llu.", buf, 0xCu);
    }

    unint64_t v12 = 19;
  }
LABEL_13:

  return v12;
}

- (unint64_t)pasteLegibleForPasteboard:(id)a3 authenticationMessage:(id)a4 auditTokenInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 secureNameStatus] != (id)1)
  {
    if (([v7 isOrWasRemote] & 1) == 0)
    {
      id v10 = [v8 timestamp];
      if (v10 < [v7 saveTimestamp])
      {
        unint64_t v9 = 23;
        goto LABEL_113;
      }
    }
    uint64_t v11 = (uint64_t)[v8 context];
    uint64_t v12 = 0;
    float v13 = NAN;
    float v14 = 0.95;
    if (v11 > 0xC59AA8F622F26FBLL)
    {
      if (v11 <= 0x51A2F5DDCA075EA0)
      {
        if (v11 <= 0x2BB12563A205EBD0)
        {
          if (v11 != 0xC59AA8F622F26FCLL)
          {
            if (v11 != 0x237A2046F04E760CLL)
            {
              float v15 = 0.95;
              float v16 = NAN;
              float v17 = NAN;
              if (v11 == 0x25FC7F58D8DEA672)
              {
                unint64_t v9 = 34;
                goto LABEL_113;
              }
LABEL_102:
              v23 = [v8 hitTestInformationFromStartEvent];
              v24 = [v8 hitTestInformationFromEndEvent];
              [v23 cumulativeOpacity];
              if (v25 < v14
                || ([v24 cumulativeOpacity], float v27 = v26,
                                                            [v23 cumulativeOpacity],
                                                            v27 != v28)
                && ([v24 cumulativeOpacity], v29 < v15))
              {
                unint64_t v9 = 24;
LABEL_112:

                goto LABEL_113;
              }
              if (([v23 hasInsecureFilter] & 1) != 0
                || ([v24 hasInsecureFilter] & 1) != 0)
              {
                unint64_t v9 = 25;
                goto LABEL_112;
              }
              if (([v23 detectedOcclusion] & 1) != 0
                || ([v24 detectedOcclusion] & 1) != 0)
              {
                unint64_t v9 = 26;
                goto LABEL_112;
              }
              if (v12 == 2)
              {
                [v23 backgroundAverageContrastThreshold];
                if (v35 >= 0.98)
                {
                  [v24 backgroundAverageContrastThreshold];
                  if (v36 >= 0.98) {
                    goto LABEL_124;
                  }
                }
              }
              else if (v12 != 1 {
                     || ([v23 backgroundAverage], v31 >= v13)
              }
                     && ([v23 backgroundStandardDeviation], v32 <= v17)
                     && ([v24 backgroundAverage], v33 >= v16)
                     && ([v24 backgroundStandardDeviation], v34 <= v17))
              {
LABEL_124:
                layerGrader = self->_layerGrader;
                if (v23) {
                  [v23 cumulativeLayerTransform];
                }
                else {
                  memset(v46, 0, sizeof(v46));
                }
                if (v24) {
                  [v24 cumulativeLayerTransform];
                }
                else {
                  memset(v45, 0, sizeof(v45));
                }
                unint64_t v38 = (unint64_t)[(UISTransform3DGrader *)layerGrader gradeStartTransform3D:v46 endTransform3D:v45];
                contentsGrader = self->_contentsGrader;
                if (v23) {
                  [v23 cumulativeContentsTransform];
                }
                else {
                  memset(v44, 0, sizeof(v44));
                }
                if (v24) {
                  [v24 cumulativeContentsTransform];
                }
                else {
                  memset(v43, 0, sizeof(v43));
                }
                unint64_t v40 = (unint64_t)[(UISTransform3DGrader *)contentsGrader gradeStartTransform3D:v44 endTransform3D:v43];
                if (v38 | v40)
                {
                  unint64_t v41 = v40;
                  v42 = _PBLog();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 134218240;
                    unint64_t v48 = v38;
                    __int16 v49 = 2048;
                    unint64_t v50 = v41;
                    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Authentication message button is transformed %lu, %lu.", buf, 0x16u);
                  }

                  unint64_t v9 = 28;
                }
                else
                {
                  unint64_t v9 = 35;
                }
                goto LABEL_112;
              }
              unint64_t v9 = 27;
              goto LABEL_112;
            }
            goto LABEL_56;
          }
LABEL_57:
          int v20 = _AXSInvertColorsEnabled();
          if (v20) {
            uint64_t v12 = 1;
          }
          else {
            uint64_t v12 = 2;
          }
          if (v20) {
            float v13 = 0.88;
          }
          else {
            float v13 = NAN;
          }
          if (v20) {
            float v16 = 0.72;
          }
          else {
            float v16 = NAN;
          }
          if (v20) {
            float v17 = 0.022;
          }
          else {
            float v17 = NAN;
          }
          float v15 = 0.95;
          goto LABEL_70;
        }
        if (v11 != 0x2BB12563A205EBD1)
        {
          if (v11 != 0x37CA128B814942F4)
          {
            float v15 = 0.95;
            float v16 = NAN;
            float v17 = NAN;
            if (v11 == 0x41683F1594B2E071)
            {
              unint64_t v9 = 33;
              goto LABEL_113;
            }
            goto LABEL_102;
          }
          float v13 = NAN;
          uint64_t v12 = 2;
          float v15 = 0.8;
          float v16 = NAN;
          float v17 = NAN;
LABEL_101:
          float v14 = 0.8;
          goto LABEL_102;
        }
        goto LABEL_71;
      }
      if (v11 <= 0x67510999674CD01DLL)
      {
        if (v11 == 0x51A2F5DDCA075EA1)
        {
          unint64_t v9 = 32;
          goto LABEL_113;
        }
        if (v11 == 0x5597A8D691A21829)
        {
          int v22 = _AXSInvertColorsEnabled();
          if (v22) {
            uint64_t v12 = 1;
          }
          else {
            uint64_t v12 = 2;
          }
          if (v22) {
            float v13 = 0.55;
          }
          else {
            float v13 = NAN;
          }
          if (v22) {
            float v17 = 0.04;
          }
          else {
            float v17 = NAN;
          }
          float v15 = 0.175;
          float v16 = v13;
        }
        else
        {
          float v15 = 0.95;
          float v16 = NAN;
          float v17 = NAN;
          if (v11 == 0x5A4A97C3218CE65BLL)
          {
            unint64_t v9 = 31;
            goto LABEL_113;
          }
        }
        goto LABEL_102;
      }
      if (v11 == 0x67510999674CD01ELL) {
        goto LABEL_57;
      }
      if (v11 == 0x70A52C167AE7B042)
      {
LABEL_71:
        float v13 = NAN;
        uint64_t v12 = 2;
        float v15 = 0.175;
        goto LABEL_88;
      }
      uint64_t v18 = 0x7EC07AF570CAADBCLL;
      goto LABEL_39;
    }
    unint64_t v9 = 29;
    if (v11 <= (uint64_t)0xA9745AB1695ED68ALL)
    {
      if (v11 <= (uint64_t)0x95DD33C9595B8B09)
      {
        if (v11 == 0x84E6A8CBF3F0F10CLL) {
          goto LABEL_113;
        }
        float v15 = 0.95;
        float v16 = NAN;
        float v17 = NAN;
        if (v11 != 0x926FA0AD41ACE950) {
          goto LABEL_102;
        }
        int v19 = _AXSInvertColorsEnabled();
        if (v19) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = 2;
        }
        if (v19) {
          float v13 = 0.71;
        }
        else {
          float v13 = NAN;
        }
        if (v19) {
          float v16 = 0.69;
        }
        else {
          float v16 = NAN;
        }
        if (v19) {
          float v17 = 0.11;
        }
        else {
          float v17 = NAN;
        }
        float v15 = 0.8;
        goto LABEL_101;
      }
      if (v11 == 0x95DD33C9595B8B0ALL)
      {
LABEL_40:
        unint64_t v9 = 30;
        goto LABEL_113;
      }
      if (v11 == 0x9D0980DD8F0CAFCBLL)
      {
LABEL_56:
        float v13 = NAN;
        uint64_t v12 = 2;
        float v15 = 0.95;
        float v16 = NAN;
        float v17 = NAN;
LABEL_70:
        float v14 = 0.75;
        goto LABEL_102;
      }
      if (v11 != 0xA16D1C5A60C000E1)
      {
LABEL_73:
        float v15 = 0.95;
        goto LABEL_88;
      }
    }
    else
    {
      if (v11 <= (uint64_t)0xF317E322CB2CEA01)
      {
        switch(v11)
        {
          case 0xA9745AB1695ED68BLL:
            int v21 = _AXSInvertColorsEnabled();
            if (v21) {
              uint64_t v12 = 1;
            }
            else {
              uint64_t v12 = 2;
            }
            if (v21) {
              float v13 = 0.67;
            }
            else {
              float v13 = NAN;
            }
            if (v21) {
              float v16 = 0.52;
            }
            else {
              float v16 = NAN;
            }
            if (v21) {
              float v17 = 0.043;
            }
            else {
              float v17 = NAN;
            }
            float v15 = 0.95;
            goto LABEL_102;
          case 0xB40F49E017F83014:
            uint64_t v12 = 0;
            float v13 = NAN;
            float v15 = 0.19;
            goto LABEL_88;
          case 0xC58523F7A4B7A983:
            uint64_t v12 = 0;
            float v13 = NAN;
            float v15 = 0.38;
LABEL_88:
            float v16 = NAN;
            float v17 = NAN;
            goto LABEL_102;
        }
        goto LABEL_73;
      }
      if (v11 == 0xF317E322CB2CEA02) {
        goto LABEL_113;
      }
      if (v11 != 0xF635B19E69CD15ECLL)
      {
        uint64_t v18 = 0x6B3CE0810AAF53ALL;
LABEL_39:
        float v15 = 0.95;
        float v16 = NAN;
        float v17 = NAN;
        if (v11 != v18) {
          goto LABEL_102;
        }
        goto LABEL_40;
      }
    }
    float v13 = NAN;
    uint64_t v12 = 2;
    goto LABEL_73;
  }
  unint64_t v9 = 21;
LABEL_113:

  return v9;
}

- (BOOL)isSharingTokenValidForPasteboard:(id)a3 token:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = mach_continuous_time();
  if (!v6) {
    goto LABEL_5;
  }
  unint64_t v8 = v7;
  unint64_t v9 = [v5 sharingToken];
  unsigned int v10 = [v6 isEqual:v9];

  if (!v10) {
    goto LABEL_5;
  }
  if (v8 > (unint64_t)[v5 saveTimestamp]
    && (double v11 = PBSharingTokenTimeoutInterval,
        mach_timebase_info info = 0,
        mach_timebase_info(&info),
        LODWORD(v12) = info.denom,
        LODWORD(v13) = info.numer,
        v8 - (unint64_t)(v11 * (double)v12 * 1000000000.0 / (double)v13) <= (unint64_t)[v5 saveTimestamp]))
  {
    BOOL v14 = 1;
  }
  else
  {
LABEL_5:
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)pasteAccessFromTCCForAuditTokenInfo:(id)a3
{
  char v8 = 0;
  unint64_t v3 = [(PBPasteAuthority *)self tccAuthorizationRightForAuditTokenInfo:a3 encounteredError:&v8];
  if (v8)
  {
    v4 = _PBLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "TCC encountered an error while fetching authorization status. Defaulting to 'ask'", v7, 2u);
    }

    return 5;
  }
  else
  {
    unint64_t v6 = 4;
    if (v3 != 2) {
      unint64_t v6 = 1;
    }
    if ((v3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      return 5;
    }
    else {
      return v6;
    }
  }
}

- (unint64_t)isPasteAuthorizedForAuditTokenInfo:(id)a3 pasteboard:(id)a4 currentTimestamp:(unint64_t)a5
{
  if (a4) {
    return (unint64_t)[a4 authorizationDecisionForAuditTokenInfo:a3 timestamp:a5];
  }
  else {
    return 41;
  }
}

- (unint64_t)tccAuthorizationRightForAuditTokenInfo:(id)a3 encounteredError:(BOOL *)a4
{
  id v5 = a3;
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x3032000000;
  unint64_t v13 = sub_100009C0C;
  BOOL v14 = sub_100009C1C;
  id v15 = 0;
  unint64_t v6 = [(PBPasteAuthority *)self tccSyncMessageOptions];
  uint64_t v7 = [(PBPasteAuthority *)self tccIdentityForAuditTokenInfo:v5];
  if (v7) {
    tcc_server_message_get_authorization_records_by_identity();
  }
  if (v11[5]) {
    unint64_t authorization_right = tcc_authorization_record_get_authorization_right();
  }
  else {
    unint64_t authorization_right = 1;
  }

  _Block_object_dispose(&v10, 8);
  return authorization_right;
}

- (id)tccSyncMessageOptions
{
  v2 = (void *)tcc_message_options_create();
  tcc_message_options_set_reply_handler_policy();
  tcc_message_options_set_request_prompt_policy();
  return v2;
}

- (id)tccIdentityForAuditTokenInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(PBPasteAuthority *)self tccSyncMessageOptions];
  if (v4)
  {
    [v4 auditToken];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
  }
  unint64_t v6 = (void *)tcc_credential_create_for_process_with_audit_token();
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x3032000000;
  unint64_t v13 = sub_100009C0C;
  BOOL v14 = sub_100009C1C;
  id v15 = 0;
  if (v6)
  {
    tcc_server_message_get_identity_for_credential();
    uint64_t v7 = (void *)v11[5];
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  _Block_object_dispose(&v10, 8);

  return v8;
}

- (void)recordInteractivePasteAuthorizationPromptActivityForAuditTokenInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(PBPasteAuthority *)self tccSyncMessageOptions];
  unint64_t v6 = [(PBPasteAuthority *)self tccIdentityForAuditTokenInfo:v4];
  char v7 = 0;
  if (v6)
  {
    [(PBPasteAuthority *)self tccAuthorizationRightForAuditTokenInfo:v4 encounteredError:&v7];
    if (!v7) {
      tcc_server_message_set_authorization_value();
    }
  }
}

- (unint64_t)accessToPasteboard:(id)a3 auditTokenInfo:(id)a4 authenticationMessage:(id)a5 sharingToken:(id)a6 dataOwner:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v16 = [(PBPasteAuthority *)self preliminaryAccessForPasteboard:v12 auditTokenInfo:v13 authenticationMessage:v14 sharingToken:v15 dataOwner:a7];
  p_var0 = &v16->var0;
  uint64_t v18 = 0;
  uint64_t var1 = v16->var1;
  unint64_t v20 = 1;
  switch(var1)
  {
    case 0:
      int v21 = _PBLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v23 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Logic error in PBPasteAuthority: decision map should not return undecided.", v23, 2u);
      }

      uint64_t v18 = 0;
      unint64_t v20 = 1;
      break;
    case 2:
    case 3:
    case 4:
      uint64_t v18 = 0;
      unint64_t v20 = v16->var1;
      break;
    case 5:
      if ([(PBPasteAuthority *)self isSharingTokenValidForPasteboard:v12 token:v15])
      {
        uint64_t v18 = @"sharingTokenAccepted";
        unint64_t v20 = 4;
      }
      else
      {
        unint64_t v20 = [(PBPasteAuthority *)self pasteAccessFromTCCForAuditTokenInfo:v13];
        if (v20 == 5) {
          uint64_t v18 = 0;
        }
        else {
          uint64_t v18 = @"TCC";
        }
      }
      break;
    default:
      break;
  }
  sub_100007F40(*p_var0, var1, v18, v20, v14, v13);

  return v20;
}

- (const)preliminaryAccessForPasteboard:(id)a3 auditTokenInfo:(id)a4 authenticationMessage:(id)a5 sharingToken:(id)a6 dataOwner:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = sub_10000A518([(PBPasteAuthority *)self isPasteExemptForPasteboard:v11 auditTokenInfo:v12]);
  if (!v14)
  {
    id v14 = sub_10000A518([(PBPasteAuthority *)self isPasteManageableForPasteboard:v11 auditTokenInfo:v12 dataOwner:a7]);
    if (!v14)
    {
      id v14 = sub_10000A518([(PBPasteAuthority *)self isPasteNativeForPasteboard:v11 auditTokenInfo:v12]);
      if (!v14)
      {
        uint64_t v15 = mach_continuous_time();
        id v14 = sub_10000A518([(PBPasteAuthority *)self isPasteTimelyForPasteboard:v11 currentTimestamp:v15]);
        if (!v14
          && (!v13
           || (id v14 = sub_10000A518([(PBPasteAuthority *)self isPasteAuthenticForAuthenticationMessage:v13 auditTokenInfo:v12 currentTimestamp:v15])) == 0))
        {
          id v14 = sub_10000A518([(PBPasteAuthority *)self isPasteAuthorizedForAuditTokenInfo:v12 pasteboard:v11 currentTimestamp:v15]);
          if (!v14)
          {
            if (v13)
            {
              id v14 = sub_10000A518([(PBPasteAuthority *)self pasteLegibleForPasteboard:v11 authenticationMessage:v13 auditTokenInfo:v12]);
              if (!v14)
              {
                long long v17 = _PBLog();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)uint64_t v18 = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Logic error in PBPasteAuthority", v18, 2u);
                }

                id v14 = &off_100030E28;
              }
            }
            else
            {
              id v14 = sub_10000A518(36);
            }
          }
        }
      }
    }
  }

  return (const PBPreliminaryPasteAccessInfo *)v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tccService, 0);
  objc_storeStrong((id *)&self->_tccServer, 0);
  objc_storeStrong((id *)&self->_contentsGrader, 0);
  objc_storeStrong((id *)&self->_layerGrader, 0);
}

@end