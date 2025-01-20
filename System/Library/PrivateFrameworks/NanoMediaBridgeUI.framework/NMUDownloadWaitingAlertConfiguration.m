@interface NMUDownloadWaitingAlertConfiguration
- (NMUDownloadWaitingAlertConfiguration)initWithItemName:(id)a3 status:(unint64_t)a4 downloadPauseReason:(unint64_t)a5 options:(id)a6;
- (NMUDownloadWaitingAlertConfiguration)initWithModelObject:(id)a3 status:(unint64_t)a4 downloadPauseReason:(unint64_t)a5 options:(id)a6;
- (id)_downloadNowOnCellularActionWithOptions:(id)a3;
- (id)_tryAgainWithOptions:(id)a3;
- (unint64_t)reason;
- (void)setReason:(unint64_t)a3;
@end

@implementation NMUDownloadWaitingAlertConfiguration

- (NMUDownloadWaitingAlertConfiguration)initWithModelObject:(id)a3 status:(unint64_t)a4 downloadPauseReason:(unint64_t)a5 options:(id)a6
{
  id v10 = a6;
  v11 = _titleForModelObject(a3);
  v12 = [(NMUDownloadWaitingAlertConfiguration *)self initWithItemName:v11 status:a4 downloadPauseReason:a5 options:v10];

  return v12;
}

- (NMUDownloadWaitingAlertConfiguration)initWithItemName:(id)a3 status:(unint64_t)a4 downloadPauseReason:(unint64_t)a5 options:(id)a6
{
  int v7 = a5;
  v114[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  v103.receiver = self;
  v103.super_class = (Class)NMUDownloadWaitingAlertConfiguration;
  v12 = [(NMUDownloadWaitingAlertConfiguration *)&v103 init];
  if (v12)
  {
    v13 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
    v14 = [v13 localizedStringForKey:@"WAITING_TO_DOWNLOAD_ALERT_TITLE" value:@"Waiting to Download" table:0];
    [(NMUKeepLocalAlertConfiguration *)v12 setTitle:v14];

    switch(NMUResolvedDownloadWaitingReason(a4, v7))
    {
      case 0:
        v15 = NSString;
        v16 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v17 = [v16 localizedStringForKey:@"WAITING_TO_DOWNLOAD_ALERT_GENERIC_MESSAGE_CONTAINER" value:@"“%@” will download soon." table:0];
        v18 = objc_msgSend(v15, "stringWithFormat:", v17, v10);
        [(NMUKeepLocalAlertConfiguration *)v12 setMessage:v18];

        v19 = [(NMUKeepLocalAlertConfiguration *)v12 _okAction];
        v114[0] = v19;
        v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v114 count:1];
        [(NMUKeepLocalAlertConfiguration *)v12 setActions:v20];

        v21 = v12;
        uint64_t v22 = 0;
        goto LABEL_18;
      case 1:
        v23 = NSString;
        v24 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v25 = [v24 localizedStringForKey:@"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_STORAGE_CONTAINER" value:@"“%@” will download once additional storage space is available on your Apple Watch." table:0];
        v26 = objc_msgSend(v23, "stringWithFormat:", v25, v10);
        [(NMUKeepLocalAlertConfiguration *)v12 setMessage:v26];

        v27 = [(NMUKeepLocalAlertConfiguration *)v12 _okAction];
        v113 = v27;
        v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v113 count:1];
        [(NMUKeepLocalAlertConfiguration *)v12 setActions:v28];

        v21 = v12;
        uint64_t v22 = 1;
        goto LABEL_18;
      case 2:
        v29 = NSString;
        v30 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v31 = [v30 localizedStringForKey:@"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_LOW_NETWORK_LINK_QUALITY_CONTAINER" value:@"“%@” will download once your Apple Watch has a better internet connection." table:0];
        v32 = objc_msgSend(v29, "stringWithFormat:", v31, v10);
        [(NMUKeepLocalAlertConfiguration *)v12 setMessage:v32];

        v33 = [(NMUKeepLocalAlertConfiguration *)v12 _okAction];
        v107 = v33;
        v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v107 count:1];
        [(NMUKeepLocalAlertConfiguration *)v12 setActions:v34];

        v21 = v12;
        uint64_t v22 = 2;
        goto LABEL_18;
      case 3:
        v35 = NSString;
        v36 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v37 = [v36 localizedStringForKey:@"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_CONSTRAINED_NETWORK_CONTAINER" value:@"“%@” will download once your Apple Watch is no longer in Low Data Mode." table:0];
        v38 = objc_msgSend(v35, "stringWithFormat:", v37, v10);
        [(NMUKeepLocalAlertConfiguration *)v12 setMessage:v38];

        v39 = [(NMUKeepLocalAlertConfiguration *)v12 _okAction];
        v106 = v39;
        v40 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v106 count:1];
        [(NMUKeepLocalAlertConfiguration *)v12 setActions:v40];

        v21 = v12;
        uint64_t v22 = 3;
        goto LABEL_18;
      case 4:
        v41 = NSString;
        int v42 = MGGetBoolAnswer();
        v43 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v44 = v43;
        if (v42)
        {
          v45 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_CELLULAR_DOWNLOADS_NOT_ALLOWED_CONTAINER_WLAN";
          v46 = @"Cellular downloads are turned off. “%@” will download the next time your Apple Watch is connected to either WLAN or your iPhone.";
        }
        else
        {
          v45 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_CELLULAR_DOWNLOADS_NOT_ALLOWED_CONTAINER_WIFI";
          v46 = @"Cellular downloads are turned off. “%@” will download the next time your Apple Watch is connected to either Wi-Fi or your iPhone.";
        }
        v87 = [v43 localizedStringForKey:v45 value:v46 table:0];
        v88 = objc_msgSend(v41, "stringWithFormat:", v87, v10);
        [(NMUKeepLocalAlertConfiguration *)v12 setMessage:v88];

        [(NMUDownloadWaitingAlertConfiguration *)v12 setReason:4];
        v89 = [(NMUKeepLocalAlertConfiguration *)v12 _okAction];
        v112 = v89;
        v90 = (void *)MEMORY[0x263EFF8C0];
        v91 = &v112;
        goto LABEL_23;
      case 5:
        v47 = NSString;
        int v48 = MGGetBoolAnswer();
        v49 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v50 = v49;
        if (v48)
        {
          v51 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_CELLULAR_DOWNLOADS_NOT_ALLOWED_CONTAINER_WLAN";
          v52 = @"Cellular downloads are turned off. “%@” will download the next time your Apple Watch is connected to either WLAN or your iPhone.";
        }
        else
        {
          v51 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_CELLULAR_DOWNLOADS_NOT_ALLOWED_CONTAINER_WIFI";
          v52 = @"Cellular downloads are turned off. “%@” will download the next time your Apple Watch is connected to either Wi-Fi or your iPhone.";
        }
        v92 = [v49 localizedStringForKey:v51 value:v52 table:0];
        v93 = objc_msgSend(v47, "stringWithFormat:", v92, v10);
        [(NMUKeepLocalAlertConfiguration *)v12 setMessage:v93];

        [(NMUDownloadWaitingAlertConfiguration *)v12 setReason:5];
        v89 = [(NMUKeepLocalAlertConfiguration *)v12 _okAction];
        v111 = v89;
        v90 = (void *)MEMORY[0x263EFF8C0];
        v91 = &v111;
LABEL_23:
        v94 = [v90 arrayWithObjects:v91 count:1];
        [(NMUKeepLocalAlertConfiguration *)v12 setActions:v94];
        goto LABEL_29;
      case 6:
        v53 = NSString;
        int v54 = MGGetBoolAnswer();
        v55 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v56 = v55;
        if (v54)
        {
          v57 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_WAITING_FOR_WLAN_CONTAINER";
          v58 = @"“%@” will download the next time your Apple Watch is connected to either WLAN or your iPhone.";
        }
        else
        {
          v57 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_WAITING_WIFI_CONTAINER";
          v58 = @"“%@” will download the next time your Apple Watch is connected to either Wi-Fi or your iPhone.";
        }
        v95 = [v55 localizedStringForKey:v57 value:v58 table:0];
        v96 = objc_msgSend(v53, "stringWithFormat:", v95, v10);
        [(NMUKeepLocalAlertConfiguration *)v12 setMessage:v96];

        [(NMUDownloadWaitingAlertConfiguration *)v12 setReason:6];
        v89 = [(NMUKeepLocalAlertConfiguration *)v12 _okAction];
        v110[0] = v89;
        v94 = [(NMUDownloadWaitingAlertConfiguration *)v12 _downloadNowOnCellularActionWithOptions:v11];
        v110[1] = v94;
        v97 = (void *)MEMORY[0x263EFF8C0];
        v98 = v110;
        goto LABEL_28;
      case 7:
        v59 = NSString;
        v60 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v61 = [v60 localizedStringForKey:@"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_WAITING_FOR_POWER_CONTAINER" value:@"“%@” will download the next time your Apple Watch is charging." table:0];
        v62 = objc_msgSend(v59, "stringWithFormat:", v61, v10);
        [(NMUKeepLocalAlertConfiguration *)v12 setMessage:v62];

        v63 = [(NMUKeepLocalAlertConfiguration *)v12 _okAction];
        v108[0] = v63;
        v64 = [(NMUKeepLocalAlertConfiguration *)v12 _downloadNowOffPowerActionWithOptions:v11];
        v108[1] = v64;
        v65 = [MEMORY[0x263EFF8C0] arrayWithObjects:v108 count:2];
        [(NMUKeepLocalAlertConfiguration *)v12 setActions:v65];

        v21 = v12;
        uint64_t v22 = 7;
        goto LABEL_18;
      case 8:
        v66 = NSString;
        int v67 = MGGetBoolAnswer();
        v68 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v69 = v68;
        if (v67)
        {
          v70 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_WAITING_FOR_WLAN_AND_POWER_CONTAINER";
          v71 = @"“%@” will download the next time your Apple Watch is charging and connected to either WLAN or your iPhone.";
        }
        else
        {
          v70 = @"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_WAITING_FOR_WIFI_AND_POWER_CONTAINER";
          v71 = @"“%@” will download the next time your Apple Watch is charging and connected to either Wi-Fi or your iPhone.";
        }
        v99 = [v68 localizedStringForKey:v70 value:v71 table:0];
        v100 = objc_msgSend(v66, "stringWithFormat:", v99, v10);
        [(NMUKeepLocalAlertConfiguration *)v12 setMessage:v100];

        [(NMUDownloadWaitingAlertConfiguration *)v12 setReason:8];
        v89 = [(NMUKeepLocalAlertConfiguration *)v12 _okAction];
        v109[0] = v89;
        v94 = [(NMUKeepLocalAlertConfiguration *)v12 _downloadNowOffPowerOnCellularActionWithOptions:v11];
        v109[1] = v94;
        v97 = (void *)MEMORY[0x263EFF8C0];
        v98 = v109;
LABEL_28:
        v101 = [v97 arrayWithObjects:v98 count:2];
        [(NMUKeepLocalAlertConfiguration *)v12 setActions:v101];

LABEL_29:
        break;
      case 9:
        v72 = NSString;
        v73 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v74 = [v73 localizedStringForKey:@"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_THERMAL_CONTAINER" value:@"“%@” will download once your Apple Watch cools down." table:0];
        v75 = objc_msgSend(v72, "stringWithFormat:", v74, v10);
        [(NMUKeepLocalAlertConfiguration *)v12 setMessage:v75];

        v76 = [(NMUKeepLocalAlertConfiguration *)v12 _okAction];
        v105 = v76;
        v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v105 count:1];
        [(NMUKeepLocalAlertConfiguration *)v12 setActions:v77];

        v21 = v12;
        uint64_t v22 = 9;
        goto LABEL_18;
      case 10:
        v78 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v79 = [v78 localizedStringForKey:@"DOWNLOAD_FAILED_ALERT_TITLE" value:@"Download Failed" table:0];
        [(NMUKeepLocalAlertConfiguration *)v12 setTitle:v79];

        v80 = NSString;
        v81 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
        v82 = [v81 localizedStringForKey:@"WAITING_TO_DOWNLOAD_ALERT_MESSAGE_FAILED_CONTAINER" value:@"“%@” will resume downloading the next time your Apple Watch is charging and connected to the internet." table:0];
        v83 = objc_msgSend(v80, "stringWithFormat:", v82, v10);
        [(NMUKeepLocalAlertConfiguration *)v12 setMessage:v83];

        v84 = [(NMUKeepLocalAlertConfiguration *)v12 _okAction];
        v104[0] = v84;
        v85 = [(NMUDownloadWaitingAlertConfiguration *)v12 _tryAgainWithOptions:v11];
        v104[1] = v85;
        v86 = [MEMORY[0x263EFF8C0] arrayWithObjects:v104 count:2];
        [(NMUKeepLocalAlertConfiguration *)v12 setActions:v86];

        v21 = v12;
        uint64_t v22 = 10;
LABEL_18:
        [(NMUDownloadWaitingAlertConfiguration *)v21 setReason:v22];
        break;
      default:
        break;
    }
  }

  return v12;
}

- (id)_downloadNowOnCellularActionWithOptions:(id)a3
{
  v3 = (void *)[a3 copy];
  [v3 setCellularPolicy:1];
  v4 = [MEMORY[0x263F086E0] nanoMediaBridgeUIBundle];
  v5 = [v4 localizedStringForKey:@"ACTION_TITLE_DOWNLOAD_NOW" value:@"Download Now" table:0];
  v6 = +[NMUKeepLocalAlertAction actionWithTitle:v5 shouldPerformKeepLocalRequest:1 keepLocalRequestOptions:v3 downloadAction:4];

  return v6;
}

- (id)_tryAgainWithOptions:(id)a3
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  v5 = [v3 nanoMediaBridgeUIBundle];
  v6 = [v5 localizedStringForKey:@"ACTION_TITLE_TRY_AGAIN_NOW" value:@"Try Again Now" table:0];
  int v7 = +[NMUKeepLocalAlertAction actionWithTitle:v6 shouldPerformKeepLocalRequest:1 keepLocalRequestOptions:v4 downloadAction:6];

  return v7;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

@end