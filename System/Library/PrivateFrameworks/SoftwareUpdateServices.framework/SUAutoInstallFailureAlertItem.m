@interface SUAutoInstallFailureAlertItem
- (SUAutoInstallFailureAlertItem)initWithError:(id)a3 buildNumber:(id)a4;
- (id)_okButton;
- (id)_radarButton;
- (id)buttons;
- (id)message;
- (id)title;
@end

@implementation SUAutoInstallFailureAlertItem

- (SUAutoInstallFailureAlertItem)initWithError:(id)a3 buildNumber:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v67.receiver = self;
  v67.super_class = (Class)SUAutoInstallFailureAlertItem;
  v9 = [(SUBaseAlertItem *)&v67 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_error, a3);
    objc_storeStrong((id *)&v10->_buildNumber, a4);
    id v65 = v7;
    id v11 = v7;
    id v64 = v8;
    id v12 = v8;
    int v60 = MGGetBoolAnswer();
    uint64_t v13 = MGCopyAnswer();
    if (!v13)
    {
      v14 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
      uint64_t v13 = [v14 localizedStringForKey:@"DEVICE" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
    }
    v63 = (void *)v13;
    v15 = v11;
    v66 = v12;
    if (v12)
    {
      uint64_t v16 = [NSString stringWithFormat:@"%@", v12];
    }
    else
    {
      v17 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
      uint64_t v16 = [v17 localizedStringForKey:@"SOFTWARE_UPDATE" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
    }
    v18 = NSString;
    v19 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
    v20 = [v19 localizedStringForKey:@"AUTO_SU_FAILED_HEADER" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
    v62 = (void *)v16;
    objc_msgSend(v18, "stringWithFormat:", v20, v16);
    id v21 = (id)objc_claimAutoreleasedReturnValue();

    v22 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
    id v23 = [v22 localizedStringForKey:@"AUTO_SU_FAILED_BODY_DEFAULT" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];

    v24 = v15;
    if (!v15) {
      goto LABEL_22;
    }
    uint64_t v25 = [v15 code];
    switch(v25)
    {
      case 47:
        v40 = NSString;
        v28 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
        if (v60)
        {
          v41 = @"AUTO_SU_FAILED_BODY_KEYBAG_COMMIT";
LABEL_29:
          v47 = [v28 localizedStringForKey:v41 value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
          id v23 = [v40 stringWithFormat:v47];

          goto LABEL_30;
        }
        break;
      case 24:
        v42 = NSString;
        v28 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
        v43 = [v28 localizedStringForKey:@"AUTO_SU_FAILED_BODY_UNPLUGGED" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
        objc_msgSend(v42, "stringWithFormat:", v43, v63);
        id v23 = (id)objc_claimAutoreleasedReturnValue();

        v24 = v15;
        v29 = v63;
        goto LABEL_31;
      case 20:
        v26 = [v15 userInfo];

        if (v26)
        {
          v27 = [v15 userInfo];
          v28 = [v27 objectForKey:@"SUInstallationConstraintsUnmet"];

          v29 = v63;
          if (v28)
          {
            id v30 = v21;
            uint64_t v31 = [v28 longValue];
            id v32 = v63;
            int v33 = MGGetBoolAnswer();
            if (v31)
            {
              if ((v31 & 2) != 0)
              {
                v56 = NSString;
                v37 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
                v57 = [v37 localizedStringForKey:@"UNMET_CONSTRAINT_NO_NETWORK" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
                objc_msgSend(v56, "stringWithFormat:", v57, v32);
                v58 = LABEL_47:;
                v38 = v62;
LABEL_48:

                id v23 = v58;
                id v21 = v30;
                goto LABEL_32;
              }
              if ((v31 & 4) == 0)
              {
                int v34 = v33;
                if (v31)
                {
                  v35 = NSString;
                  v37 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
                  if (!v34) {
                    goto LABEL_44;
                  }
                  v55 = @"UNMET_CONSTRAINT_LOW_BATTERY";
                }
                else
                {
                  if ((v31 & 8) == 0)
                  {
                    if ((v31 & 0x10) == 0)
                    {
                      v35 = NSString;
                      v36 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
                      v37 = v36;
                      if ((v31 & 0x20) != 0)
                      {
                        v61 = v35;
                        v38 = v62;
                        if (v34) {
                          v39 = @"UNMET_CONSTRAINT_DEVICE_LOCKED";
                        }
                        else {
                          v39 = @"AUTO_SU_FAILED_BODY_DEFAULT";
                        }
                        v57 = [v36 localizedStringForKey:v39 value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
                        v58 = [v61 stringWithFormat:v57];
                        goto LABEL_48;
                      }
                      goto LABEL_44;
                    }
                    v35 = NSString;
                    v37 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
                    if (v34)
                    {
                      v55 = @"UNMET_CONSTRAINT_KEYBAG_MISSING";
                      goto LABEL_45;
                    }
LABEL_44:
                    v55 = @"AUTO_SU_FAILED_BODY_DEFAULT";
                    goto LABEL_45;
                  }
                  v35 = NSString;
                  v37 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
                  if (!v34) {
                    goto LABEL_44;
                  }
                  v55 = @"UNMET_CONSTRAINT_ICLOUD_RESTORE";
                }
LABEL_45:
                v54 = v37;
                goto LABEL_46;
              }
              v35 = NSString;
              v54 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
              v37 = v54;
              v55 = @"UNMET_CONSTRAINT_INSUFFICIENT_SPACE";
            }
            else
            {
              v35 = NSString;
              v54 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
              v37 = v54;
              v55 = @"AUTO_SU_FAILED_BODY_DEFAULT";
            }
LABEL_46:
            v57 = [v54 localizedStringForKey:v55 value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
            objc_msgSend(v35, "stringWithFormat:", v57, v59);
            goto LABEL_47;
          }
LABEL_31:
          v38 = v62;
LABEL_32:

          id v8 = v64;
          id v7 = v65;
          goto LABEL_33;
        }
LABEL_22:
        id v8 = v64;
        v38 = v62;
        v29 = v63;
LABEL_33:

        v48 = (NSString *)v21;
        v49 = (NSString *)v23;
        title = v10->_title;
        v10->_title = v48;
        v51 = v48;

        message = v10->_message;
        v10->_message = v49;

        goto LABEL_34;
      default:
        v40 = NSString;
        v44 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
        v28 = v44;
        if (v60)
        {
          v45 = [v44 localizedStringForKey:@"AUTO_SU_FAILED_BODY_ERROR_CODE_AND_STRING" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
          uint64_t v46 = objc_msgSend(v40, "stringWithFormat:", v45, objc_msgSend(v15, "code"), v15);

          id v23 = [NSString stringWithFormat:@"[Internal Only]\n%@", v46];
          v28 = (void *)v46;
          v24 = v15;
LABEL_30:
          v29 = v63;
          goto LABEL_31;
        }
        break;
    }
    v41 = @"AUTO_SU_FAILED_BODY_DEFAULT";
    goto LABEL_29;
  }
LABEL_34:

  return v10;
}

- (id)title
{
  return self->_title;
}

- (id)message
{
  return self->_message;
}

- (id)buttons
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(SUAutoInstallFailureAlertItem *)self _okButton];
  [v3 addObject:v4];

  MGGetBoolAnswer();
  v5 = (void *)[v3 copy];

  return v5;
}

- (id)_okButton
{
  v2 = [SUAlertButtonDefinition alloc];
  v3 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
  v4 = [v3 localizedStringForKey:@"OK_BUTTON" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
  v5 = [(SUAlertButtonDefinition *)v2 initWithLabel:v4 presentationStyle:0 isPreferredButton:0 handler:&__block_literal_global_11];

  return v5;
}

- (id)_radarButton
{
  v3 = self->_buildNumber;
  v4 = self->_error;
  v5 = [SUAlertButtonDefinition alloc];
  v6 = [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"];
  id v7 = [v6 localizedStringForKey:@"FILE_A_RADAR" value:&stru_26CE93248 table:@"SoftwareUpdateServices"];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__SUAutoInstallFailureAlertItem__radarButton__block_invoke;
  v12[3] = &unk_26447C8C8;
  uint64_t v13 = v4;
  v14 = v3;
  id v8 = v3;
  v9 = v4;
  v10 = [(SUAlertButtonDefinition *)v5 initWithLabel:v7 presentationStyle:2 isPreferredButton:0 handler:v12];

  return v10;
}

void __45__SUAutoInstallFailureAlertItem__radarButton__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  SULogInfo(@"About to file a radar about this install failure!", a2, a3, a4, a5, a6, a7, a8, v14);
  v15 = objc_alloc_init(SUTapToRadar);
  v9 = NSString;
  v10 = +[SUUtility currentHWModelStr];
  id v11 = +[SUUtility currentProductBuild];
  id v12 = [v9 stringWithFormat:@"%@/%@: Auto Installation Failed", v10, v11];
  [(SUTapToRadar *)v15 setTitle:v12];

  id v13 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v13 appendFormat:@"\nAuto installation failed with error:\n\n%@", *(void *)(a1 + 32)];
  if (*(void *)(a1 + 40)) {
    [v13 appendFormat:@"\n\nTarget update: %@", *(void *)(a1 + 40)];
  }
  [(SUTapToRadar *)v15 setMessage:v13];
  [(SUTapToRadar *)v15 setClassification:7];
  [(SUTapToRadar *)v15 setReproducibility:6];
  [(SUTapToRadar *)v15 file];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_buildNumber, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end