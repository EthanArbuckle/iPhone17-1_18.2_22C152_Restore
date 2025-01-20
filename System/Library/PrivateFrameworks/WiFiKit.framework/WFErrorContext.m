@interface WFErrorContext
- (BOOL)needsDismissal;
- (NSError)error;
- (NSString)description;
- (WFDiagnosticsResultItem)result;
- (WFErrorContext)initWithAssociationError:(id)a3 network:(id)a4 diagnosticsResult:(id)a5;
- (WFNetworkListRecord)network;
- (WFNetworkView)provider;
- (id)_userInfoForAssociationError:(id)a3 networkName:(id)a4;
- (id)completionHandler;
- (int64_t)requestedFields;
- (void)cancel;
- (void)setCompletionHandler:(id)a3;
- (void)setError:(id)a3;
- (void)setNetwork:(id)a3;
- (void)setProvider:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation WFErrorContext

- (WFErrorContext)initWithAssociationError:(id)a3 network:(id)a4 diagnosticsResult:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    objc_storeStrong((id *)&self->_network, a4);
    objc_storeStrong((id *)&self->_result, a5);
    v11 = (void *)MEMORY[0x263F087E8];
    v12 = [v9 ssid];
    v13 = [(WFErrorContext *)self _userInfoForAssociationError:v8 networkName:v12];
    v14 = [v11 errorWithDomain:@"com.apple.wifikit.error" code:-1 userInfo:v13];
    error = self->_error;
    self->_error = v14;

    self->_needsDismissal = 1;
  }
  else
  {
    v17 = WFLogForCategory(0);
    os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v17 && os_log_type_enabled(v17, v18))
    {
      int v19 = 136315138;
      v20 = "-[WFErrorContext initWithAssociationError:network:diagnosticsResult:]";
      _os_log_impl(&dword_226071000, v17, v18, "%s: nil network", (uint8_t *)&v19, 0xCu);
    }

    self = 0;
  }

  return self;
}

- (id)_userInfoForAssociationError:(id)a3 networkName:(id)a4
{
  uint64_t v134 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 code];
  if (v8 <= 15)
  {
    switch(v8)
    {
      case 1:
        uint64_t v61 = *MEMORY[0x263F08608];
        id v131 = v6;
        uint64_t v62 = *MEMORY[0x263F08320];
        v130[0] = v61;
        v130[1] = v62;
        v63 = NSString;
        v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v13 = [v12 localizedStringForKey:@"kWFLocAssociationPasswordFailureAlertTitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
        uint64_t v132 = objc_msgSend(v63, "stringWithFormat:", v13, v7);
        v130[2] = *MEMORY[0x263F08340];
        v64 = (void *)MEMORY[0x263EFF8C0];
        uint64_t v21 = (void *)v132;
        os_log_type_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        int v19 = [v18 localizedStringForKey:@"kWFLocGenericFailureAlertButton" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
        objc_msgSend(v64, "arrayWithObjects:", v19, 0);
        v23 = v22 = v7;
        v133 = v23;
        v24 = NSDictionary;
        v25 = &v131;
        v26 = v130;
        uint64_t v46 = 3;
        break;
      case 4:
LABEL_10:
        uint64_t v30 = *MEMORY[0x263F08608];
        v123[0] = v6;
        uint64_t v31 = *MEMORY[0x263F08320];
        v122[0] = v30;
        v122[1] = v31;
        v32 = NSString;
        v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v13 = [v12 localizedStringForKey:@"kWFLocOtherNetworkFailedFindAlertFormat" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
        objc_msgSend(v32, "stringWithFormat:", v13, v7);
        uint64_t v33 = v22 = v7;
        uint64_t v34 = *MEMORY[0x263F08348];
        v123[1] = v33;
        v123[2] = &stru_26D9BFD58;
        uint64_t v35 = *MEMORY[0x263F08340];
        v122[2] = v34;
        v122[3] = v35;
        v36 = (void *)MEMORY[0x263EFF8C0];
        os_log_type_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        int v19 = [v18 localizedStringForKey:@"kWFLocGenericFailureAlertButton" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
        v37 = v36;
        uint64_t v21 = (void *)v33;
        v23 = objc_msgSend(v37, "arrayWithObjects:", v19, 0);
        v123[3] = v23;
        v24 = NSDictionary;
        v25 = (id *)v123;
        v26 = v122;
LABEL_12:
        uint64_t v46 = 4;
        break;
      case 5:
        v27 = [v6 userInfo];
        uint64_t v28 = *MEMORY[0x263F08608];
        v29 = [v27 objectForKeyedSubscript:*MEMORY[0x263F08608]];

        v106 = v29;
        id v107 = v7;
        if (MGGetBoolAnswer() && v29) {
          [NSString stringWithFormat:@"%@ \n [error: %ld]", v7, objc_msgSend(v29, "code")];
        }
        else {
        v13 = [NSString stringWithFormat:@"%@", v7, v104];
        }
        v129[0] = v6;
        uint64_t v75 = *MEMORY[0x263F08320];
        v128[0] = v28;
        v128[1] = v75;
        id v111 = v6;
        v76 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        os_log_type_t v18 = [v76 localizedStringForKey:@"kWFLocHotspotFailureAlertTitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
        v129[1] = v18;
        v128[2] = *MEMORY[0x263F08348];
        v77 = NSString;
        int v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v23 = [v19 localizedStringForKey:@"kWFLocHotspotFailureAlertMessage" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
        v78 = objc_msgSend(v77, "stringWithFormat:", v23, v13);
        v129[2] = v78;
        v128[3] = *MEMORY[0x263F08340];
        v79 = (void *)MEMORY[0x263EFF8C0];
        v80 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v81 = [v80 localizedStringForKey:@"kWFLocGenericFailureAlertButton" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
        v82 = objc_msgSend(v79, "arrayWithObjects:", v81, 0);
        v129[3] = v82;
        v47 = [NSDictionary dictionaryWithObjects:v129 forKeys:v128 count:4];

        uint64_t v21 = v76;
        id v6 = v111;

        goto LABEL_29;
      default:
LABEL_18:
        v106 = [v6 userInfo];
        v65 = [v106 objectForKey:@"kWFAssociationPrivateMacFailureThresholdMetKey"];
        int v66 = [v65 BOOLValue];

        id v110 = v6;
        id v107 = v7;
        if (v66)
        {
          v67 = [MEMORY[0x263F863A8] issueWithType:0x8000];
          uint64_t v68 = *MEMORY[0x263F08608];
          v117[0] = v6;
          uint64_t v69 = *MEMORY[0x263F08320];
          v116[0] = v68;
          v116[1] = v69;
          v70 = NSString;
          v109 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          os_log_type_t v18 = [v109 localizedStringForKey:@"kWFLocAssociationFailureAlertTitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
          int v19 = objc_msgSend(v70, "stringWithFormat:", v18, v7);
          v117[1] = v19;
          v116[2] = *MEMORY[0x263F08348];
          v13 = v67;
          v23 = [v67 issueRecommendation];
          v117[2] = v23;
          v116[3] = *MEMORY[0x263F08340];
          v71 = (void *)MEMORY[0x263EFF8C0];
          v72 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v73 = [v72 localizedStringForKey:@"kWFLocGenericFailureAlertButton" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
          v74 = objc_msgSend(v71, "arrayWithObjects:", v73, 0);
          v117[3] = v74;
          v47 = [NSDictionary dictionaryWithObjects:v117 forKeys:v116 count:4];

LABEL_28:
          uint64_t v21 = v109;
          id v6 = v110;
LABEL_29:
          v12 = v106;
          v22 = v107;
          goto LABEL_30;
        }
        uint64_t v83 = [(WFErrorContext *)self result];
        if (v83)
        {
          v84 = (void *)v83;
          v85 = [(WFErrorContext *)self result];
          uint64_t v86 = [v85 title];
          if (v86)
          {
            v87 = (void *)v86;
            v88 = [(WFErrorContext *)self result];
            v89 = [v88 suggestion];

            if (v89)
            {
              uint64_t v90 = *MEMORY[0x263F08608];
              v115[0] = v6;
              uint64_t v91 = *MEMORY[0x263F08320];
              v114[0] = v90;
              v114[1] = v91;
              v92 = NSString;
              v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              v109 = [v13 localizedStringForKey:@"kWFLocAssociationFailureAlertTitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
              os_log_type_t v18 = [v92 stringWithFormat:v7];
              v115[1] = v18;
              v114[2] = *MEMORY[0x263F08348];
              v93 = NSString;
              int v19 = [(WFErrorContext *)self result];
              v23 = [v19 title];
              v72 = [(WFErrorContext *)self result];
              v94 = [v72 suggestion];
              v105 = [v93 stringWithFormat:@"%@\n%@", v23, v94];
              v115[2] = v105;
              v114[3] = *MEMORY[0x263F08340];
              v95 = (void *)MEMORY[0x263EFF8C0];
              v96 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              v97 = [v96 localizedStringForKey:@"kWFLocGenericFailureAlertButton" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
              v98 = objc_msgSend(v95, "arrayWithObjects:", v97, 0);
              v115[3] = v98;
              v47 = [NSDictionary dictionaryWithObjects:v115 forKeys:v114 count:4];

              goto LABEL_28;
            }
          }
          else
          {
          }
        }
        uint64_t v99 = *MEMORY[0x263F08608];
        v113[0] = v6;
        uint64_t v100 = *MEMORY[0x263F08320];
        v112[0] = v99;
        v112[1] = v100;
        v101 = NSString;
        v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v109 = [v13 localizedStringForKey:@"kWFLocAssociationFailureAlertTitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
        os_log_type_t v18 = [v101 stringWithFormat:v7];
        v113[1] = v18;
        v112[2] = *MEMORY[0x263F08340];
        v102 = (void *)MEMORY[0x263EFF8C0];
        int v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v23 = [v19 localizedStringForKey:@"kWFLocGenericFailureAlertButton" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
        v72 = objc_msgSend(v102, "arrayWithObjects:", v23, 0);
        v113[2] = v72;
        v47 = [NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:3];
        goto LABEL_28;
    }
    v47 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:v46];
    goto LABEL_30;
  }
  switch(v8)
  {
    case 16:
      goto LABEL_10;
    case 17:
      uint64_t v9 = *MEMORY[0x263F08608];
      v125[0] = v6;
      uint64_t v10 = *MEMORY[0x263F08320];
      v124[0] = v9;
      v124[1] = v10;
      v11 = NSString;
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = [v12 localizedStringForKey:@"kWFLocOtherNetworkFailedSecurityAlertFormat" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      uint64_t v14 = objc_msgSend(v11, "stringWithFormat:", v13, v7);
      uint64_t v15 = *MEMORY[0x263F08348];
      v125[1] = v14;
      v125[2] = &stru_26D9BFD58;
      uint64_t v16 = *MEMORY[0x263F08340];
      v124[2] = v15;
      v124[3] = v16;
      v17 = (void *)MEMORY[0x263EFF8C0];
      os_log_type_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v19 = [v18 localizedStringForKey:@"kWFLocGenericFailureAlertButton" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      v20 = v17;
      uint64_t v21 = (void *)v14;
      objc_msgSend(v20, "arrayWithObjects:", v19, 0);
      v23 = v22 = v7;
      v125[3] = v23;
      v24 = NSDictionary;
      v25 = (id *)v125;
      v26 = v124;
      goto LABEL_12;
    case 19:
      uint64_t v38 = *MEMORY[0x263F08608];
      v127[0] = v6;
      uint64_t v39 = *MEMORY[0x263F08320];
      v126[0] = v38;
      v126[1] = v39;
      v40 = NSString;
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = [v12 localizedStringForKey:@"kWFLocHotspotPeerRejectedAlertMessage" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      uint64_t v41 = objc_msgSend(v40, "stringWithFormat:", v13, v7);
      uint64_t v42 = *MEMORY[0x263F08348];
      v127[1] = v41;
      v127[2] = &stru_26D9BFD58;
      uint64_t v43 = *MEMORY[0x263F08340];
      v126[2] = v42;
      v126[3] = v43;
      v44 = (void *)MEMORY[0x263EFF8C0];
      os_log_type_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v19 = [v18 localizedStringForKey:@"kWFLocGenericFailureAlertButton" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      v45 = v44;
      uint64_t v21 = (void *)v41;
      objc_msgSend(v45, "arrayWithObjects:", v19, 0);
      v23 = v22 = v7;
      v127[3] = v23;
      v24 = NSDictionary;
      v25 = (id *)v127;
      v26 = v126;
      goto LABEL_12;
    case 20:
      uint64_t v48 = *MEMORY[0x263F08608];
      v121[0] = v6;
      uint64_t v49 = *MEMORY[0x263F08320];
      v120[0] = v48;
      v120[1] = v49;
      v50 = NSString;
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = [v12 localizedStringForKey:@"kWFLocAccessPointFullAlertTitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      uint64_t v108 = objc_msgSend(v50, "stringWithFormat:", v13, v7);
      v121[1] = v108;
      v120[2] = *MEMORY[0x263F08348];
      os_log_type_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v19 = [v18 localizedStringForKey:@"kWFLocAccessPointFullAlertBody" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      v121[2] = v19;
      v120[3] = *MEMORY[0x263F08340];
      v51 = (void *)MEMORY[0x263EFF8C0];
      [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v23 = v22 = v7;
      v52 = [v23 localizedStringForKey:@"kWFLocGenericFailureAlertButton" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      v53 = objc_msgSend(v51, "arrayWithObjects:", v52, 0);
      v121[3] = v53;
      v54 = NSDictionary;
      v55 = v121;
      v56 = v120;
      break;
    case 21:
      uint64_t v57 = *MEMORY[0x263F08608];
      v119[0] = v6;
      uint64_t v58 = *MEMORY[0x263F08320];
      v118[0] = v57;
      v118[1] = v58;
      v59 = NSString;
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = [v12 localizedStringForKey:@"kWFLocAssociationFailureAlertTitle" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      uint64_t v108 = objc_msgSend(v59, "stringWithFormat:", v13, v7);
      v119[1] = v108;
      v118[2] = *MEMORY[0x263F08348];
      os_log_type_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      int v19 = [v18 localizedStringForKey:@"kWFLocAccessPointWeakAlertBody" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      v119[2] = v19;
      v118[3] = *MEMORY[0x263F08340];
      v60 = (void *)MEMORY[0x263EFF8C0];
      [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v23 = v22 = v7;
      v52 = [v23 localizedStringForKey:@"kWFLocGenericFailureAlertButton" value:&stru_26D9BFD58 table:@"WiFiKitLocalizableStrings"];
      v53 = objc_msgSend(v60, "arrayWithObjects:", v52, 0);
      v119[3] = v53;
      v54 = NSDictionary;
      v55 = v119;
      v56 = v118;
      break;
    default:
      goto LABEL_18;
  }
  v47 = [v54 dictionaryWithObjects:v55 forKeys:v56 count:4];

  uint64_t v21 = (void *)v108;
LABEL_30:

  return v47;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(WFErrorContext *)self network];
  id v7 = [v6 ssid];
  uint64_t v8 = [(WFErrorContext *)self error];
  uint64_t v9 = [v3 stringWithFormat:@"<%@: %p network: %@ error %@>", v5, self, v7, v8];

  return (NSString *)v9;
}

- (int64_t)requestedFields
{
  return 0;
}

- (void)cancel
{
  self->_needsDismissal = 0;
  v2 = [(WFErrorContext *)self completionHandler];
  v2[2]();
}

- (WFNetworkView)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (WFNetworkView *)WeakRetained;
}

- (void)setProvider:(id)a3
{
}

- (BOOL)needsDismissal
{
  return self->_needsDismissal;
}

- (WFDiagnosticsResultItem)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (WFNetworkListRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_destroyWeak((id *)&self->_provider);
}

@end