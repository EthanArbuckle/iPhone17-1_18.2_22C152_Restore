@interface TSUtilities
+ (BOOL)hasCellularBaseband;
+ (BOOL)isBackAllowed:(id)a3;
+ (BOOL)isCaseInsensitiveEqual:(id)a3 withString:(id)a4;
+ (BOOL)isDeviceLocked;
+ (BOOL)isGreenTeaCapable;
+ (BOOL)isOnBootstrap;
+ (BOOL)isPad;
+ (BOOL)isRegRestActiveLocationAuthorizedOff:(id)a3;
+ (BOOL)isRegRestActiveLocationServiceOff:(id)a3;
+ (BOOL)isRegulatoryRestrictionActive:(id)a3;
+ (BOOL)isSecureIntentUIRequired:(id)a3;
+ (BOOL)isWifiAvailable;
+ (BOOL)openPrefsURL:(id)a3;
+ (BOOL)transferOptions;
+ (id)_findPPRItem:(id)a3;
+ (id)backgroundColorForRemotePlan:(BOOL)a3;
+ (id)findSubscriptionContextForCellularPlanItem:(id)a3 fromSubscriptionContexts:(id)a4;
+ (id)formattedPhoneNumber:(id)a3 withCountryCode:(id)a4;
+ (id)getByteRepresentationOf:(id)a3;
+ (id)getErrorTitleDetail:(id)a3 forCarrier:(id)a4;
+ (id)preinstallPPRAlertControllerWithItems:(id)a3 completion:(id)a4;
+ (id)productClass;
+ (id)secureIntentAccessControlItem;
+ (id)textColorForRemotePlan:(BOOL)a3;
+ (unint64_t)odaPlans:(id)a3;
+ (unint64_t)transferablePlans:(id)a3;
+ (void)launchURL:(id)a3;
+ (void)secureIntentAccessControlItem;
@end

@implementation TSUtilities

+ (id)getByteRepresentationOf:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 UTF8String];
  unint64_t v5 = [v3 length];
  v6 = [MEMORY[0x263EFF990] dataWithCapacity:v5 >> 1];
  char v11 = 0;
  unint64_t v9 = 0;
  if (v5 >= 0x64) {
    unint64_t v5 = 100;
  }
  if (v5)
  {
    for (unint64_t i = 0; i < v5; i += 2)
    {
      *(_WORD *)__str = *(_WORD *)(v4 + i);
      unint64_t v9 = strtoul(__str, 0, 16);
      [v6 appendBytes:&v9 length:1];
    }
  }

  return v6;
}

+ (id)formattedPhoneNumber:(id)a3 withCountryCode:(id)a4
{
  id v4 = a3;
  uint64_t v5 = CFPhoneNumberCreate();
  if (!v5 || (v6 = (const void *)v5, id String = (id)CFPhoneNumberCreateString(), CFRelease(v6), !String)) {
    id String = v4;
  }

  return String;
}

+ (id)getErrorTitleDetail:(id)a3 forCarrier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  v8 = [v5 domain];
  int v9 = [v8 isEqualToString:*MEMORY[0x263F31920]];

  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v11 = v10;
  if (v9)
  {
    v12 = [v10 localizedStringForKey:@"CONTINUE" value:&stru_26DBE8E78 table:@"Localizable"];
    [v7 setObject:v12 forKeyedSubscript:@"ErrorButton"];

    uint64_t v13 = [v5 code];
    switch(v13)
    {
      case 2:
        v47 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v48 = [v47 localizedStringForKey:@"CTCELLULARPLANERROR_PARSE_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v48 forKeyedSubscript:@"ErrorHeader"];

        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"CTCELLULARPLANERROR_PARSE_MESSAGE";
        goto LABEL_75;
      case 3:
      case 4:
      case 5:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 23:
      case 24:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 38:
      case 39:
      case 41:
      case 42:
      case 43:
      case 45:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 61:
      case 64:
        goto LABEL_20;
      case 6:
        v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v24 = [v22 localizedStringForKey:@"CTCELLULARPLANERROR_INVALID_ARGUMENT_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        v25 = @"ErrorHeader";
        break;
      case 13:
        v49 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v50 = [v49 localizedStringForKey:@"CTCELLULARPLANERROR_BUSY_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v50 forKeyedSubscript:@"ErrorHeader"];

        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"CTCELLULARPLANERROR_BUSY_MESSAGE";
        goto LABEL_75;
      case 22:
      case 54:
        v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v32 = [v31 localizedStringForKey:@"CTCELLULARPLANERROR_CARRIER_ERROR_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v32 forKeyedSubscript:@"ErrorHeader"];

        if (v6 && [v6 length])
        {
          v29 = NSString;
          v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v22 = v33;
          v30 = @"CARRIER_TRANSFER_ERROR_CODE_PERMANENT_FAILURE_%@";
          goto LABEL_82;
        }
        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"CARRIER_TRANSFER_ERROR_CODE_PERMANENT_FAILURE_NO_NAME";
        goto LABEL_75;
      case 25:
        v51 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v52 = [v51 localizedStringForKey:@"CTCELLULARPLANERROR_INVALID_PPR_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v52 forKeyedSubscript:@"ErrorHeader"];

        if ([v6 length])
        {
          v53 = NSString;
          v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v24 = [v22 localizedStringForKey:@"CTCELLULARPLANERROR_INVALID_PPR_MESSAGE_%@_%@" value:&stru_26DBE8E78 table:@"Localizable"];
          objc_msgSend(v53, "stringWithFormat:", v24, v6, v6);
          goto LABEL_83;
        }
        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"CTCELLULARPLANERROR_INVALID_PPR_MESSAGE_NO_NAME";
        goto LABEL_75;
      case 26:
        v54 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v55 = [v54 localizedStringForKey:@"CTCELLULARPLANERROR_INVALID_FAUX_CARD_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v55 forKeyedSubscript:@"ErrorHeader"];

        if ([v6 length])
        {
          v29 = NSString;
          v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v22 = v33;
          v30 = @"CTCELLULARPLANERROR_INVALID_FAUX_CARD_MESSAGE_CARRIER_LOCK_%@";
          goto LABEL_82;
        }
        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"CTCELLULARPLANERROR_INVALID_FAUX_CARD_MESSAGE_CARRIER_LOCK_NO_CARRIER";
        goto LABEL_75;
      case 34:
      case 46:
        if (v6 && [v6 length])
        {
          v14 = NSString;
          v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v16 = [v15 localizedStringForKey:@"ESIM_NOT_SUPPORT_TITLE_ADD_PLAN_%@" value:&stru_26DBE8E78 table:@"Localizable"];
          v17 = objc_msgSend(v14, "stringWithFormat:", v16, v6);
          [v7 setObject:v17 forKeyedSubscript:@"ErrorDetail"];
        }
        else
        {
          v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v16 = [v15 localizedStringForKey:@"ESIM_NOT_SUPPORT_TITLE_ADD_PLAN" value:&stru_26DBE8E78 table:@"Localizable"];
          [v7 setObject:v16 forKeyedSubscript:@"ErrorHeader"];
        }

        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"ESIM_NOT_SUPPORT_DETAIL_ADD_PLAN_CARRIER_UNLOCK";
        goto LABEL_75;
      case 35:
        v56 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v57 = [v56 localizedStringForKey:@"CTCELLULARPLANERROR_NO_ELIGIBLE_PROFILES_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v57 forKeyedSubscript:@"ErrorHeader"];

        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"CTCELLULARPLANERROR_NO_ELIGIBLE_PROFILES_MESSAGE";
        goto LABEL_75;
      case 36:
        v58 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v59 = [v58 localizedStringForKey:@"CTCELLULARPLANERROR_INVALID_SMDP_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v59 forKeyedSubscript:@"ErrorHeader"];

        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"CTCELLULARPLANERROR_INVALID_SMDP_MESSAGE";
        goto LABEL_75;
      case 37:
        v60 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v61 = [v60 localizedStringForKey:@"CTCELLULARPLANERROR_CARRIER_ERROR_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v61 forKeyedSubscript:@"ErrorHeader"];

        if (v6 && [v6 length])
        {
          v29 = NSString;
          v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v22 = v33;
          v30 = @"TRANSFER_ERROR_INELIGIBLE_ACCOUNT_%@";
          goto LABEL_82;
        }
        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"TRANSFER_ERROR_INELIGIBLE_ACCOUNT_NO_NAME";
        goto LABEL_75;
      case 40:
        v62 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v63 = [v62 localizedStringForKey:@"ERROR_TRANSFER_ITEM_WEBSHEET_IN_BUDDY_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v63 forKeyedSubscript:@"ErrorHeader"];

        if (v6 && [v6 length])
        {
          v29 = NSString;
          v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v22 = v33;
          v30 = @"ERROR_TRANSFER_ITEM_WEBSHEET_IN_BUDDY_%@";
          goto LABEL_82;
        }
        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"ERROR_TRANSFER_ITEM_WEBSHEET_IN_BUDDY_NO_NAME";
        goto LABEL_75;
      case 44:
        v64 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v65 = [v64 localizedStringForKey:@"CTCELLULARPLANERROR_NO_DATA_PATH_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v65 forKeyedSubscript:@"ErrorHeader"];

        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"CTCELLULARPLANERROR_NO_DATA_PATH_MESSAGE";
        goto LABEL_75;
      case 52:
      case 53:
        v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v27 = [v26 localizedStringForKey:@"CTCELLULARPLANERROR_CARRIER_ERROR_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v27 forKeyedSubscript:@"ErrorHeader"];

        if (v6 && [v6 length])
        {
          BOOL v28 = +[TSUtilities inBuddy];
          v29 = NSString;
          v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          if (v28) {
            v30 = @"CARRIER_TRANSFER_ERROR_CODE_TEMPORARY_FAILURE_BUDDY_%@";
          }
          else {
            v30 = @"CARRIER_TRANSFER_ERROR_CODE_TEMPORARY_FAILURE_%@";
          }
          goto LABEL_81;
        }
        BOOL v46 = +[TSUtilities inBuddy];
        v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        if (v46) {
          v43 = @"CARRIER_TRANSFER_ERROR_CODE_TEMPORARY_FAILURE_BUDDY_NO_NAME";
        }
        else {
          v43 = @"CARRIER_TRANSFER_ERROR_CODE_TEMPORARY_FAILURE_NO_NAME";
        }
        goto LABEL_74;
      case 55:
        v66 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v67 = [v66 localizedStringForKey:@"CTCELLULARPLANERROR_CARRIER_ERROR_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v67 forKeyedSubscript:@"ErrorHeader"];

        if (v6 && [v6 length])
        {
          v29 = NSString;
          v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v22 = v33;
          v30 = @"TRANSFER_ERROR_BLOCKED_ACCOUNT_%@";
          goto LABEL_82;
        }
        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"TRANSFER_ERROR_BLOCKED_ACCOUNT_NO_NAME";
        goto LABEL_75;
      case 56:
        v68 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v69 = [v68 localizedStringForKey:@"CTCELLULARPLANERROR_FAILED_TRANSFER_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v69 forKeyedSubscript:@"ErrorHeader"];

        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"CTCELLULARPLANERROR_FAILED_TRANSFER_MESSAGE";
        goto LABEL_75;
      case 57:
        v70 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v71 = [v70 localizedStringForKey:@"CTCELLULARPLANERROR_DELAYED_ACTIVATION_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v71 forKeyedSubscript:@"ErrorHeader"];

        if (!v6 || ![v6 length])
        {
          BOOL v85 = +[TSUtilities inBuddy];
          v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          if (v85) {
            v43 = @"CARRIER_TRANSFER_ERROR_CODE_DELAYED_ACTIVATION_BUDDY_NO_NAME";
          }
          else {
            v43 = @"CARRIER_TRANSFER_ERROR_CODE_DELAYED_ACTIVATION_NO_NAME";
          }
          goto LABEL_74;
        }
        BOOL v72 = +[TSUtilities inBuddy];
        v29 = NSString;
        v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        if (v72) {
          v30 = @"CARRIER_TRANSFER_ERROR_CODE_DELAYED_ACTIVATION_BUDDY_%@";
        }
        else {
          v30 = @"CARRIER_TRANSFER_ERROR_CODE_DELAYED_ACTIVATION_%@";
        }
LABEL_81:
        v33 = v22;
        goto LABEL_82;
      case 58:
        v73 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v74 = [v73 localizedStringForKey:@"CTCELLULARPLANERROR_REGULATORY_RESTRICTION_ACTIVE_LOC_ON_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v74 forKeyedSubscript:@"ErrorHeader"];

        v75 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v76 = [v75 localizedStringForKey:@"CTCELLULARPLANERROR_REGULATORY_RESTRICTION_ACTIVE_LOC_ON_MESSAGE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v76 forKeyedSubscript:@"ErrorDetail"];

        v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v21;
        v23 = @"OK";
        goto LABEL_7;
      case 59:
        v77 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v78 = [v77 localizedStringForKey:@"TRANSFER_UPDATE_REQUIRED_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v78 forKeyedSubscript:@"ErrorHeader"];

        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"TRANSFER_TARGET_UPDATE_REQUIRED_DETAIL";
        goto LABEL_75;
      case 60:
        v79 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v80 = [v79 localizedStringForKey:@"TRANSFER_UPDATE_REQUIRED_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v80 forKeyedSubscript:@"ErrorHeader"];

        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"TRANSFER_SOURCE_UPDATE_REQUIRED_DETAIL";
        goto LABEL_75;
      case 62:
      case 63:
        v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v35 = [v34 localizedStringForKey:@"CTCELLULARPLANERROR_REGULATORY_RESTRICTION_ACTIVE_LOC_OFF_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v35 forKeyedSubscript:@"ErrorHeader"];

        v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v37 = [v36 localizedStringForKey:@"CTCELLULARPLANERROR_REGULATORY_RESTRICTION_ACTIVE_LOC_OFF_MESSAGE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v37 forKeyedSubscript:@"ErrorDetail"];

        v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v21;
        v23 = @"TURN_ON_LOCATION_SERVICE";
        goto LABEL_7;
      case 65:
        v81 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v82 = [v81 localizedStringForKey:@"CTCELLULARPLANERROR_CARRIER_ERROR_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v82 forKeyedSubscript:@"ErrorHeader"];

        if (v6 && [v6 length])
        {
          v29 = NSString;
          v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v22 = v33;
          v30 = @"TRANSFER_ERROR_MAX_OTP_ATTEMPTS_EXHAUSTED_DETAIL_%@";
          goto LABEL_82;
        }
        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"TRANSFER_ERROR_MAX_OTP_ATTEMPTS_EXHAUSTED_DETAIL_NO_CARRIER";
        goto LABEL_75;
      case 66:
        v83 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v84 = [v83 localizedStringForKey:@"CTCELLULARPLANERROR_CARRIER_ERROR_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
        [v7 setObject:v84 forKeyedSubscript:@"ErrorHeader"];

        if (v6 && [v6 length])
        {
          v29 = NSString;
          v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v22 = v33;
          v30 = @"TRANSFER_ERROR_MAX_PIN_ATTEMPTS_EXHAUSTED_DETAIL_%@";
LABEL_82:
          v24 = [v33 localizedStringForKey:v30 value:&stru_26DBE8E78 table:@"Localizable"];
          objc_msgSend(v29, "stringWithFormat:", v24, v6, v88);
          v87 = LABEL_83:;
          [v7 setObject:v87 forKeyedSubscript:@"ErrorDetail"];

          goto LABEL_77;
        }
        v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v22 = v42;
        v43 = @"TRANSFER_ERROR_MAX_PIN_ATTEMPTS_EXHAUSTED_DETAIL_NO_CARRIER";
LABEL_75:
        v24 = [v42 localizedStringForKey:v43 value:&stru_26DBE8E78 table:@"Localizable"];
        v25 = @"ErrorDetail";
        break;
      default:
        if (v13 == 4097)
        {
          if (!+[TSUtilities inBuddy])
          {
            v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v39 = [v38 localizedStringForKey:@"DONE" value:&stru_26DBE8E78 table:@"Localizable"];
            [v7 setObject:v39 forKeyedSubscript:@"ErrorButton"];
          }
          v40 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v41 = [v40 localizedStringForKey:@"ERROR_TRANSFER_ITEM_ACTIVATION_TIMEOUT_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
          [v7 setObject:v41 forKeyedSubscript:@"ErrorHeader"];

          v42 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v22 = v42;
          v43 = @"ERROR_TRANSFER_ITEM_XPC_CONNECTION_BROKEN_MESSAGE";
        }
        else
        {
LABEL_20:
          v44 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v45 = [v44 localizedStringForKey:@"CTCELLULARPLANERROR_FAILED_ACTION_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
          [v7 setObject:v45 forKeyedSubscript:@"ErrorHeader"];

          LODWORD(v44) = +[TSUtilities inBuddy];
          v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          if (v44) {
            v43 = @"CTCELLULARPLANERROR_FAILED_ACTION_MESSAGE_BUDDY";
          }
          else {
            v43 = @"CTCELLULARPLANERROR_FAILED_ACTION_MESSAGE";
          }
LABEL_74:
          v42 = v22;
        }
        goto LABEL_75;
    }
  }
  else
  {
    v18 = [v10 localizedStringForKey:@"CTCELLULARPLANERROR_FAILED_ACTION_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
    [v7 setObject:v18 forKeyedSubscript:@"ErrorHeader"];

    v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"CTCELLULARPLANERROR_FAILED_ACTION_MESSAGE" value:&stru_26DBE8E78 table:@"Localizable"];
    [v7 setObject:v20 forKeyedSubscript:@"ErrorDetail"];

    v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v22 = v21;
    v23 = @"CONTINUE";
LABEL_7:
    v24 = [v21 localizedStringForKey:v23 value:&stru_26DBE8E78 table:@"Localizable"];
    v25 = @"ErrorButton";
  }
  [v7 setObject:v24 forKeyedSubscript:v25];
LABEL_77:

  return v7;
}

+ (id)preinstallPPRAlertControllerWithItems:(id)a3 completion:(id)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  v7 = +[TSUtilities _findPPRItem:v5];
  if (!v7)
  {
    v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v66 = "+[TSUtilities preinstallPPRAlertControllerWithItems:completion:]";
      char v11 = "No plans with PPR @%s";
      goto LABEL_8;
    }
LABEL_9:

    v6[2](v6, 0);
    v12 = 0;
    goto LABEL_29;
  }
  v8 = +[TSCellularPlanManagerCache sharedInstance];
  unint64_t v9 = [v8 calculateInstallConsentTextTypeFor:v5];

  if (v9 > 7)
  {
    v20 = 0;
    v21 = 0;
  }
  else
  {
    if (((1 << v9) & 0xCF) != 0)
    {
      v10 = _TSLogDomain();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v66 = "+[TSUtilities preinstallPPRAlertControllerWithItems:completion:]";
        char v11 = "Invalid consent @%s";
LABEL_8:
        _os_log_impl(&dword_227A17000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    if (v9 == 4)
    {
      uint64_t v13 = [v7 carrierName];
      uint64_t v14 = [v13 length];

      if (v14)
      {
        v15 = NSString;
        v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v17 = [v16 localizedStringForKey:@"CONSENT_CURRENT_PLAN_CANNOT_BE_DISABLED_IPHONE_%@_%@" value:&stru_26DBE8E78 table:@"Localizable"];
        v18 = [v7 carrierName];
        v19 = [v7 carrierName];
        uint64_t v47 = objc_msgSend(v15, "stringWithFormat:", v17, v18, v19);
      }
      else
      {
        v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v47 = [v16 localizedStringForKey:@"CONSENT_CURRENT_PLAN_CANNOT_BE_DISABLED_NO_NAME_IPHONE" value:&stru_26DBE8E78 table:@"Localizable"];
      }

      BOOL v28 = (void *)MEMORY[0x263F82400];
      v49 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v29 = [v49 localizedStringForKey:@"CONSENT_CANCEL" value:&stru_26DBE8E78 table:@"Localizable"];
      v56[0] = MEMORY[0x263EF8330];
      v56[1] = 3221225472;
      v56[2] = __64__TSUtilities_preinstallPPRAlertControllerWithItems_completion___block_invoke_3;
      v56[3] = &unk_264827C30;
      v48 = &v57;
      v30 = v6;
      id v57 = v30;
      v31 = [v28 actionWithTitle:v29 style:1 handler:v56];
      v63[0] = v31;
      v32 = (void *)MEMORY[0x263F82400];
      v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v34 = [v33 localizedStringForKey:@"CONSENT_DELETE_ACTION" value:&stru_26DBE8E78 table:@"Localizable"];
      v54[0] = MEMORY[0x263EF8330];
      v54[1] = 3221225472;
      v54[2] = __64__TSUtilities_preinstallPPRAlertControllerWithItems_completion___block_invoke_4;
      v54[3] = &unk_264827C30;
      v35 = (id *)&v55;
      v55 = v30;
      v36 = [v32 actionWithTitle:v34 style:2 handler:v54];
      v63[1] = v36;
      v37 = v63;
    }
    else
    {
      v22 = [v7 carrierName];
      uint64_t v23 = [v22 length];

      if (v23)
      {
        v24 = NSString;
        v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v26 = [v25 localizedStringForKey:@"CONSENT_CURRENT_PLAN_CANNOT_BE_DELETED_IPHONE_PLAN_LOCK%@" value:&stru_26DBE8E78 table:@"Localizable"];
        v27 = [v7 carrierName];
        uint64_t v47 = objc_msgSend(v24, "stringWithFormat:", v26, v27);
      }
      else
      {
        v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v47 = [v25 localizedStringForKey:@"CONSENT_CURRENT_PLAN_CANNOT_BE_DELETED_NO_NAME_IPHONE_PLAN_LOCK" value:&stru_26DBE8E78 table:@"Localizable"];
      }

      v38 = (void *)MEMORY[0x263F82400];
      v49 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v29 = [v49 localizedStringForKey:@"CONSENT_DELETE_ACTION" value:&stru_26DBE8E78 table:@"Localizable"];
      v60[0] = MEMORY[0x263EF8330];
      v60[1] = 3221225472;
      v60[2] = __64__TSUtilities_preinstallPPRAlertControllerWithItems_completion___block_invoke;
      v60[3] = &unk_264827C30;
      v48 = &v61;
      v39 = v6;
      id v61 = v39;
      v31 = [v38 actionWithTitle:v29 style:2 handler:v60];
      v64[0] = v31;
      v40 = (void *)MEMORY[0x263F82400];
      v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v34 = [v33 localizedStringForKey:@"CONSENT_KEEP_ACTION" value:&stru_26DBE8E78 table:@"Localizable"];
      v58[0] = MEMORY[0x263EF8330];
      v58[1] = 3221225472;
      v58[2] = __64__TSUtilities_preinstallPPRAlertControllerWithItems_completion___block_invoke_2;
      v58[3] = &unk_264827C30;
      v35 = (id *)&v59;
      v59 = v39;
      v36 = [v40 actionWithTitle:v34 style:0 handler:v58];
      v64[1] = v36;
      v37 = v64;
    }
    v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];

    v20 = (void *)v47;
  }
  v12 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:v20 preferredStyle:0];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v41 = v21;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v50 objects:v62 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v51 != v44) {
          objc_enumerationMutation(v41);
        }
        [v12 addAction:*(void *)(*((void *)&v50 + 1) + 8 * i)];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v50 objects:v62 count:16];
    }
    while (v43);
  }

LABEL_29:
  return v12;
}

uint64_t __64__TSUtilities_preinstallPPRAlertControllerWithItems_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__TSUtilities_preinstallPPRAlertControllerWithItems_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__TSUtilities_preinstallPPRAlertControllerWithItems_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __64__TSUtilities_preinstallPPRAlertControllerWithItems_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)_findPPRItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        unint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", (void)v15) == 2)
        {
          v10 = [v9 plan];

          if (v10)
          {
            if (v6)
            {

              goto LABEL_17;
            }
            id v6 = v9;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5) {
        continue;
      }
      break;
    }

    if (v6)
    {
      char v11 = [v6 plan];
      if ([v11 isDeleteNotAllowed]) {
        goto LABEL_18;
      }
      v12 = [v6 plan];
      char v13 = [v12 isDisableNotAllowed];

      if ((v13 & 1) == 0)
      {
        char v11 = v6;
        id v6 = 0;
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_17:
    id v6 = 0;
    char v11 = v3;
LABEL_18:
  }
  return v6;
}

+ (id)backgroundColorForRemotePlan:(BOOL)a3
{
  uint64_t v4 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  uint64_t v5 = v4;
  if (a3)
  {
    id v6 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:2];
    id v7 = [v5 resolvedColorWithTraitCollection:v6];
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

+ (id)textColorForRemotePlan:(BOOL)a3
{
  if (a3) {
    BPSTextColor();
  }
  else {
  id v3 = [MEMORY[0x263F825C8] secondaryLabelColor];
  }
  return v3;
}

+ (unint64_t)transferablePlans:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        unint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) objectForKeyedSubscript:@"planItem"];
        unsigned int v10 = [v9 isTransferablePlan];

        v6 += v10;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (unint64_t)odaPlans:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        unint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) objectForKeyedSubscript:@"planItem"];
        unsigned int v10 = [v9 isOnDeviceTransferredPlan];

        v6 += v10;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

+ (BOOL)hasCellularBaseband
{
  if (hasCellularBaseband___hasBasebandToken != -1) {
    dispatch_once(&hasCellularBaseband___hasBasebandToken, &__block_literal_global_421);
  }
  return hasCellularBaseband___hasBaseband;
}

uint64_t __34__TSUtilities_hasCellularBaseband__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  hasCellularBaseband___hasBaseband = result;
  return result;
}

+ (BOOL)isPad
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

+ (id)productClass
{
  if (+[TSUtilities isPad]) {
    return @"Pad";
  }
  else {
    return @"Phone";
  }
}

+ (BOOL)isOnBootstrap
{
  v2 = [MEMORY[0x263F14420] sharedDefaultEvaluator];
  uint64_t v3 = [v2 path];
  char v4 = [(id)v3 usesInterfaceType:1];

  uint64_t v5 = +[TSCoreTelephonyClientCache sharedInstance];
  LOBYTE(v3) = [v5 usingBootstrapDataService];

  return v3 & ~v4;
}

+ (BOOL)isDeviceLocked
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = SBSGetScreenLockStatus();
  uint64_t v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v6 = v2;
    __int16 v7 = 1024;
    int v8 = 0;
    __int16 v9 = 2080;
    unsigned int v10 = "+[TSUtilities isDeviceLocked]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "screen locked : %d, passcode : %d @%s", buf, 0x18u);
  }

  return 0;
}

+ (BOOL)isWifiAvailable
{
  int v2 = [MEMORY[0x263F14420] sharedDefaultEvaluator];
  uint64_t v3 = [v2 path];

  if ([v3 status] == 1) {
    char v4 = [v3 usesInterfaceType:1];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

+ (id)secureIntentAccessControlItem
{
  v13[6] = *MEMORY[0x263EF8340];
  SecKeyRef key = 0;
  uint64_t v2 = *MEMORY[0x263F171B8];
  v12[0] = *MEMORY[0x263F17000];
  v12[1] = v2;
  uint64_t v3 = *MEMORY[0x263F171E0];
  v13[0] = @"euicc-rk-ucrt";
  v13[1] = v3;
  uint64_t v4 = *MEMORY[0x263F17580];
  v12[2] = *MEMORY[0x263F17530];
  v12[3] = v4;
  v13[2] = MEMORY[0x263EFFA88];
  v13[3] = MEMORY[0x263EFFA88];
  uint64_t v5 = *MEMORY[0x263F16E80];
  v12[4] = *MEMORY[0x263F17590];
  v12[5] = v5;
  v13[4] = MEMORY[0x263EFFA88];
  v13[5] = @"com.apple.coretelephony";
  CFDictionaryRef v6 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:6];
  OSStatus v7 = SecItemCopyMatching(v6, (CFTypeRef *)&key);
  if (key)
  {
    int v8 = SecKeyCopyAttributes(key);
    __int16 v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F16E70]];
    CFRelease(key);
  }
  else
  {
    int v8 = _TSLogDomain();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[TSUtilities secureIntentAccessControlItem];
    }
    __int16 v9 = 0;
  }

  return v9;
}

+ (BOOL)isSecureIntentUIRequired:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = +[TSUtilities secureIntentAccessControlItem];
  if (v4)
  {
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x2050000000;
    uint64_t v5 = (void *)getLAContextClass_softClass_0;
    uint64_t v20 = getLAContextClass_softClass_0;
    if (!getLAContextClass_softClass_0)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getLAContextClass_block_invoke_0;
      v24 = (const char *)&unk_264827BA8;
      v25 = &v17;
      __getLAContextClass_block_invoke_0((uint64_t)buf);
      uint64_t v5 = (void *)v18[3];
    }
    CFDictionaryRef v6 = v5;
    _Block_object_dispose(&v17, 8);
    OSStatus v7 = (void *)[[v6 alloc] initWithExternalizedContext:v3];
    v21 = &unk_26DC145A8;
    uint64_t v22 = MEMORY[0x263EFFA88];
    int v8 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    id v16 = 0;
    __int16 v9 = [v7 evaluateAccessControl:v4 operation:3 options:v8 error:&v16];
    unsigned int v10 = v16;

    uint64_t v11 = _TSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2080;
      v24 = "+[TSUtilities isSecureIntentUIRequired:]";
      _os_log_impl(&dword_227A17000, v11, OS_LOG_TYPE_DEFAULT, "result:%@, error:%@ @%s", buf, 0x20u);
    }

    BOOL v14 = 1;
    if (v9)
    {
      long long v12 = [v9 objectForKeyedSubscript:&unk_26DC145C0];
      char v13 = [v12 BOOLValue];

      if (v13) {
        BOOL v14 = 0;
      }
    }
  }
  else
  {
    unsigned int v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[TSUtilities isSecureIntentUIRequired:](v10);
    }
    BOOL v14 = 0;
  }

  return v14;
}

+ (void)launchURL:(id)a3
{
  id v3 = (void *)MEMORY[0x263F82438];
  id v4 = a3;
  id v6 = [v3 sharedApplication];
  uint64_t v5 = [NSURL URLWithString:v4];

  [v6 openURL:v5 options:MEMORY[0x263EFFA78] completionHandler:&__block_literal_global_448];
}

void __25__TSUtilities_launchURL___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = _TSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __25__TSUtilities_launchURL___block_invoke_cold_1(v2);
    }
  }
}

+ (BOOL)isBackAllowed:(id)a3
{
  id v4 = [a3 navigationController];
  uint64_t v5 = [v4 viewControllers];

  if ((unint64_t)[v5 count] >= 2)
  {
    uint64_t v7 = [v5 count];
    if (v7 - 2 < 0)
    {
LABEL_10:
      char v11 = 0;
    }
    else
    {
      id v3 = sel_backOption;
      uint64_t v8 = v7 - 1;
      while (1)
      {
        __int16 v9 = [v5 objectAtIndex:--v8];
        if (![v9 conformsToProtocol:&unk_26DC1B908]
          || (objc_opt_respondsToSelector() & 1) == 0
          || (uint64_t v10 = [v9 backOption]) == 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_13;
        }
        if (v10 == 2) {
          break;
        }

        if (v8 <= 0) {
          goto LABEL_10;
        }
      }
      LOBYTE(v3) = 0;
LABEL_13:

      char v11 = 1;
    }
    char v6 = v11 & v3;
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)isGreenTeaCapable
{
  if (isGreenTeaCapable___greenTeaCapabilityToken != -1) {
    dispatch_once(&isGreenTeaCapable___greenTeaCapabilityToken, &__block_literal_global_501);
  }
  return isGreenTeaCapable___greenTea;
}

uint64_t __32__TSUtilities_isGreenTeaCapable__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isGreenTeaCapable___greenTea = result;
  return result;
}

+ (BOOL)isRegulatoryRestrictionActive:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    char v6 = [v4 domain];
    if ([v6 isEqualToString:*MEMORY[0x263F31920]]
      && ([v5 code] == 58 || objc_msgSend(v5, "code") == 62 || objc_msgSend(v5, "code") == 63)
      && [a1 isGreenTeaCapable])
    {
      char v7 = [a1 isPad];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isRegRestActiveLocationServiceOff:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    char v6 = [v4 domain];
    if ([v6 isEqualToString:*MEMORY[0x263F31920]]
      && [v5 code] == 62
      && [a1 isGreenTeaCapable])
    {
      char v7 = [a1 isPad];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isRegRestActiveLocationAuthorizedOff:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    char v6 = [v4 domain];
    if ([v6 isEqualToString:*MEMORY[0x263F31920]]
      && [v5 code] == 63
      && [a1 isGreenTeaCapable])
    {
      char v7 = [a1 isPad];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)transferOptions
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  if (!+[TSUtilities isPad]) {
    return 1;
  }
  char v3 = _os_feature_enabled_impl();
  if ([a1 isGreenTeaCapable])
  {
    id v4 = [MEMORY[0x263F31978] sharedManager];
    uint64_t v5 = [v4 getSupportedFlowTypes];

    if (v5 == 2) {
      return 0;
    }
  }
  return v3;
}

+ (BOOL)openPrefsURL:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  char v3 = (objc_class *)MEMORY[0x263F01880];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  char v6 = [NSURL URLWithString:v4];

  uint64_t v21 = *MEMORY[0x263F3F5E8];
  v22[0] = MEMORY[0x263EFFA88];
  char v7 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  id v14 = 0;
  int v8 = [v5 openSensitiveURL:v6 withOptions:v7 error:&v14];
  id v9 = v14;
  if (v9)
  {
    uint64_t v10 = _TSLogDomain();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [v9 localizedDescription];
      uint64_t v12 = [v11 UTF8String];
      *(_DWORD *)buf = 136315650;
      uint64_t v16 = v12;
      __int16 v17 = 1024;
      int v18 = v8;
      __int16 v19 = 2080;
      uint64_t v20 = "+[TSUtilities openPrefsURL:]";
      _os_log_impl(&dword_227A17000, v10, OS_LOG_TYPE_DEFAULT, "openURL failed with error: %s, isOpened:%d\n @%s", buf, 0x1Cu);
    }
  }

  return v8;
}

+ (BOOL)isCaseInsensitiveEqual:(id)a3 withString:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = v6;
  if (v5 == v6)
  {
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
    if (v5 && v6) {
      BOOL v8 = [v5 caseInsensitiveCompare:v6] == 0;
    }
  }

  return v8;
}

+ (id)findSubscriptionContextForCellularPlanItem:(id)a3 fromSubscriptionContexts:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  char v7 = v6;
  if (v5 && [v6 count])
  {
    BOOL v8 = +[TSCellularPlanManagerCache sharedInstance];
    id v9 = [v8 getSubscriptionContextUUIDforPlan:v5];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v7;
    id v11 = (id)[v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      __int16 v19 = v7;
      uint64_t v12 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v10);
          }
          id v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          long long v15 = [v14 uuid];
          uint64_t v16 = [v15 UUIDString];
          char v17 = [v16 isEqualToString:v9];

          if (v17)
          {
            id v11 = v14;
            goto LABEL_14;
          }
        }
        id v11 = (id)[v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11) {
          continue;
        }
        break;
      }
LABEL_14:
      char v7 = v19;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (void)secureIntentAccessControlItem
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 67109378;
  v2[1] = a1;
  __int16 v3 = 2080;
  id v4 = "+[TSUtilities secureIntentAccessControlItem]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]No euicc key!!, status code : %d @%s", (uint8_t *)v2, 0x12u);
}

+ (void)isSecureIntentUIRequired:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "+[TSUtilities isSecureIntentUIRequired:]";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]No euicc acl!! @%s", (uint8_t *)&v1, 0xCu);
}

void __25__TSUtilities_launchURL___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "+[TSUtilities launchURL:]_block_invoke";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]Fail to launch the learn more page @%s", (uint8_t *)&v1, 0xCu);
}

@end