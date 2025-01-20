@interface COSRestoreTableViewCell
- (BOOL)updateRequired;
- (COSRestoreTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (COSWatchView)watchView;
- (NSDateFormatter)dateFormatter;
- (UILabel)deviceCaseSizeLabel;
- (UILabel)deviceLastBackupDetailLabel;
- (UILabel)deviceMaterialLabel;
- (UILabel)deviceTitleLabel;
- (UILabel)pairedStatusLabel;
- (UILabel)updateRequiredLabel;
- (unsigned)_NRWatchVersionFromBackup:(id)a3;
- (void)layoutSubviews;
- (void)setDateFormatter:(id)a3;
- (void)setRestoreDetailsFromBackup:(id)a3;
- (void)setRestoreDetailsFromDevice:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setUpdateRequired:(BOOL)a3;
@end

@implementation COSRestoreTableViewCell

- (COSRestoreTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v76.receiver = self;
  v76.super_class = (Class)COSRestoreTableViewCell;
  v4 = [(COSRestoreTableViewCell *)&v76 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [[COSWatchView alloc] initWithStyle:3];
    watchView = v4->_watchView;
    v4->_watchView = v5;

    [(COSRestoreTableViewCell *)v4 addSubview:v4->_watchView];
    v81 = &off_10025BF50;
    v82 = &off_10025C3A0;
    v7 = +[NSDictionary dictionaryWithObjects:&v82 forKeys:&v81 count:1];
    __asm { FMOV            V1.2D, #17.0 }
    long long v67 = _Q1;
    long long v70 = _Q1;
    long long v73 = _Q1;
    BPSScreenValueGetRelevantZoomValue();
    double v14 = v13;

    v79 = &off_10025BF50;
    v80 = &off_10025C3B0;
    v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1, 0x4030000000000000, 0x4031000000000000, v67, v70, v73);
    __asm { FMOV            V1.2D, #14.0 }
    long long v68 = _Q1;
    long long v71 = _Q1;
    long long v74 = _Q1;
    BPSScreenValueGetRelevantZoomValue();
    double v18 = v17;

    v77 = &off_10025BF50;
    v78 = &off_10025C3C0;
    v19 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1, 0x402A000000000000, 0x402C000000000000, v68, v71, v74);
    __asm { FMOV            V1.2D, #12.0 }
    long long v69 = _Q1;
    long long v72 = _Q1;
    long long v75 = _Q1;
    BPSScreenValueGetRelevantZoomValue();
    double v22 = v21;

    v23 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v14, 0x4024000000000000, 0x4026000000000000, v69, v72, v75);
    v24 = +[UIFont systemFontOfSize:v18 weight:UIFontWeightMedium];
    v25 = +[UIFont systemFontOfSize:v22 weight:UIFontWeightMedium];
    id v26 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v30 = [v26 initWithFrame:CGRectZero.origin.x, y, width, height];
    deviceTitleLabel = v4->_deviceTitleLabel;
    v4->_deviceTitleLabel = v30;

    [(UILabel *)v4->_deviceTitleLabel setFont:v23];
    v32 = v4->_deviceTitleLabel;
    v33 = +[UIColor clearColor];
    [(UILabel *)v32 setBackgroundColor:v33];

    v34 = v4->_deviceTitleLabel;
    v35 = BPSTextColor();
    [(UILabel *)v34 setTextColor:v35];

    [(UILabel *)v4->_deviceTitleLabel setTextAlignment:4];
    [(UILabel *)v4->_deviceTitleLabel setNumberOfLines:0];
    [(COSRestoreTableViewCell *)v4 addSubview:v4->_deviceTitleLabel];
    v36 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    pairedStatusLabel = v4->_pairedStatusLabel;
    v4->_pairedStatusLabel = v36;

    [(UILabel *)v4->_pairedStatusLabel setFont:v24];
    v38 = v4->_pairedStatusLabel;
    v39 = +[UIColor clearColor];
    [(UILabel *)v38 setBackgroundColor:v39];

    v40 = v4->_pairedStatusLabel;
    v41 = BPSTextColor();
    [(UILabel *)v40 setTextColor:v41];

    [(UILabel *)v4->_pairedStatusLabel setTextAlignment:4];
    [(UILabel *)v4->_pairedStatusLabel setNumberOfLines:0];
    [(COSRestoreTableViewCell *)v4 addSubview:v4->_pairedStatusLabel];
    v42 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    deviceMaterialLabel = v4->_deviceMaterialLabel;
    v4->_deviceMaterialLabel = v42;

    [(UILabel *)v4->_deviceMaterialLabel setFont:v24];
    v44 = v4->_deviceMaterialLabel;
    v45 = +[UIColor clearColor];
    [(UILabel *)v44 setBackgroundColor:v45];

    v46 = v4->_deviceMaterialLabel;
    v47 = +[UIColor systemGrayColor];
    [(UILabel *)v46 setTextColor:v47];

    [(UILabel *)v4->_deviceMaterialLabel setTextAlignment:4];
    [(UILabel *)v4->_deviceMaterialLabel setNumberOfLines:0];
    [(COSRestoreTableViewCell *)v4 addSubview:v4->_deviceMaterialLabel];
    v48 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    deviceCaseSizeLabel = v4->_deviceCaseSizeLabel;
    v4->_deviceCaseSizeLabel = v48;

    [(UILabel *)v4->_deviceCaseSizeLabel setFont:v24];
    [(UILabel *)v4->_deviceCaseSizeLabel setAdjustsFontSizeToFitWidth:1];
    v50 = v4->_deviceCaseSizeLabel;
    v51 = +[UIColor clearColor];
    [(UILabel *)v50 setBackgroundColor:v51];

    v52 = v4->_deviceCaseSizeLabel;
    v53 = +[UIColor systemGrayColor];
    [(UILabel *)v52 setTextColor:v53];

    [(UILabel *)v4->_deviceCaseSizeLabel setTextAlignment:4];
    [(COSRestoreTableViewCell *)v4 addSubview:v4->_deviceCaseSizeLabel];
    v54 = [objc_alloc((Class)UILabel) initWithFrame:CGRectMake(0, 0, width, height)];
    deviceLastBackupDetailLabel = v4->_deviceLastBackupDetailLabel;
    v4->_deviceLastBackupDetailLabel = v54;

    [(UILabel *)v4->_deviceLastBackupDetailLabel setFont:v25];
    [(UILabel *)v4->_deviceLastBackupDetailLabel setAdjustsFontSizeToFitWidth:1];
    v56 = v4->_deviceLastBackupDetailLabel;
    v57 = +[UIColor clearColor];
    [(UILabel *)v56 setBackgroundColor:v57];

    v58 = v4->_deviceLastBackupDetailLabel;
    v59 = +[UIColor systemGrayColor];
    [(UILabel *)v58 setTextColor:v59];

    [(UILabel *)v4->_deviceLastBackupDetailLabel setTextAlignment:4];
    [(UILabel *)v4->_deviceLastBackupDetailLabel setNumberOfLines:0];
    [(UILabel *)v4->_deviceLastBackupDetailLabel setLineBreakMode:0];
    [(COSRestoreTableViewCell *)v4 addSubview:v4->_deviceLastBackupDetailLabel];
    v60 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    updateRequiredLabel = v4->_updateRequiredLabel;
    v4->_updateRequiredLabel = v60;

    [(UILabel *)v4->_updateRequiredLabel setFont:v25];
    [(UILabel *)v4->_updateRequiredLabel setAdjustsFontSizeToFitWidth:1];
    v62 = v4->_updateRequiredLabel;
    v63 = +[UIColor clearColor];
    [(UILabel *)v62 setBackgroundColor:v63];

    v64 = v4->_updateRequiredLabel;
    v65 = +[UIColor systemRedColor];
    [(UILabel *)v64 setTextColor:v65];

    [(UILabel *)v4->_updateRequiredLabel setTextAlignment:4];
    [(COSRestoreTableViewCell *)v4 addSubview:v4->_updateRequiredLabel];
    [(COSRestoreTableViewCell *)v4 setSelectionStyle:0];
  }
  return v4;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)COSRestoreTableViewCell;
  -[COSRestoreTableViewCell setSelected:](&v6, "setSelected:");
  if (v3) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 0;
  }
  [(COSRestoreTableViewCell *)self setAccessoryType:v5];
}

- (void)setRestoreDetailsFromBackup:(id)a3
{
  id v4 = a3;
  deviceTitleLabel = self->_deviceTitleLabel;
  objc_super v6 = [v4 name];
  [(UILabel *)deviceTitleLabel setText:v6];

  v41 = [v4 housingColor];
  id v7 = [v41 integerValue];
  if (!v7
    || (id v8 = +[PBBridgeWatchAttributeController _materialForCLHSValue:v7]) == 0)
  {
    v9 = [v4 topEnclosureMaterial];
    id v8 = [v9 integerValue];
  }
  deviceMaterialLabel = self->_deviceMaterialLabel;
  v11 = BPSLocalizedNameForMaterial();
  [(UILabel *)deviceMaterialLabel setText:v11];

  deviceCaseSizeLabel = self->_deviceCaseSizeLabel;
  double v13 = [v4 productType];
  double v14 = BPSLocalizedVariantSizeForProductType();
  [(UILabel *)deviceCaseSizeLabel setText:v14];

  id v15 = objc_alloc_init((Class)NSDateFormatter);
  [v15 setTimeStyle:1];
  [v15 setDateStyle:1];
  [v15 setDoesRelativeDateFormatting:1];
  v16 = [v4 marketingVersion];
  if (!v16)
  {
    v16 = [v4 systemVersion];
  }
  double v17 = [v4 lastModificationDate];
  double v18 = [v15 stringFromDate:v17];

  if (v18)
  {
    v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"DATE_AND_OS_%@_%@" value:&stru_100249230 table:@"Localizable"];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v18, v16);
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v21 = v16;
  }
  v40 = v21;
  [(UILabel *)self->_deviceLastBackupDetailLabel setText:v21];
  double v22 = [v4 productType];
  uint64_t v23 = BPSVariantSizeForProductType();

  [(COSWatchView *)self->_watchView overrideMaterial:v8 size:v23];
  [(UILabel *)self->_pairedStatusLabel setText:&stru_100249230];
  v24 = [v4 activeWatchFaceFileURL];
  v25 = v24;
  if (v24 && [v24 isFileURL])
  {
    id v26 = [v25 path];
  }
  else
  {
    id v26 = 0;
  }
  v27 = [v4 watchFaceData];

  if (v27)
  {
    v28 = [v4 watchFaceData];
    v29 = +[UIImage imageWithData:v28];
    [(COSWatchView *)self->_watchView setStaticSnapShot:v29];

    v30 = pbb_setupflow_log();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v31 = "Setting up snapshot for backup with data from backup";
  }
  else if (v26)
  {
    [(COSWatchView *)self->_watchView setWatchFaceFilePath:v26];
    v30 = pbb_setupflow_log();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v31 = "Setting up snapshot from file in backup";
  }
  else
  {
    v30 = pbb_setupflow_log();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_22;
    }
    *(_WORD *)buf = 0;
    v31 = "No watch face data, nor watch face file.  Watch will be blank";
  }
  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v31, buf, 2u);
LABEL_22:

  v32 = +[COSBackupManager sharedBackupManager];
  uint64_t v33 = [v32 minWatchOSVersion];
  int v34 = NRWatchOSVersion();

  [(COSRestoreTableViewCell *)self _NRWatchVersionFromBackup:v4];
  LOBYTE(v33) = NRVersionIsGreaterThanOrEqual();
  v35 = pbb_setupflow_log();
  BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
  if (v33)
  {
    if (v36)
    {
      *(_DWORD *)buf = 138412546;
      v43 = v16;
      __int16 v44 = 1024;
      int v45 = v34;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "found compatible backup: %@ - %u", buf, 0x12u);
    }
  }
  else
  {
    if (v36)
    {
      *(_DWORD *)buf = 138412546;
      v43 = v16;
      __int16 v44 = 1024;
      int v45 = v34;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "found incompatible backup: %@ - %u", buf, 0x12u);
    }

    updateRequiredLabel = self->_updateRequiredLabel;
    v38 = +[NSBundle mainBundle];
    v39 = [v38 localizedStringForKey:@"BACKUP_UPDATE_REQUIRED" value:&stru_100249230 table:@"Localizable"];
    [(UILabel *)updateRequiredLabel setText:v39];

    self->_updateRequired = 1;
  }
  [(COSRestoreTableViewCell *)self setNeedsLayout];
}

- (unsigned)_NRWatchVersionFromBackup:(id)a3
{
  id v3 = a3;
  id v4 = [v3 systemVersion];
  uint64_t v5 = [v3 productName];

  if (!v5)
  {
    unsigned int v6 = [v4 hasPrefix:@"8.2"];
    id v7 = @"Watch OS";
    if (v6) {
      id v7 = @"iPhone OS";
    }
    uint64_t v5 = v7;
  }
  unsigned int v8 = NRWatchOSVersion();

  return v8;
}

- (void)setRestoreDetailsFromDevice:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 valueForProperty:NRDevicePropertyName];
  uint64_t v6 = [v4 valueForProperty:NRDevicePropertyProductType];
  uint64_t v7 = [v4 valueForProperty:NRDevicePropertySystemVersion];
  id v32 = +[PBBridgeWatchAttributeController materialFromDevice:v4];
  uint64_t v8 = [v4 valueForProperty:NRDevicePropertyLastActiveDate];
  v35 = (void *)v5;
  [(UILabel *)self->_deviceTitleLabel setText:v5];
  deviceMaterialLabel = self->_deviceMaterialLabel;
  v10 = BPSLocalizedNameForMaterial();
  [(UILabel *)deviceMaterialLabel setText:v10];

  deviceCaseSizeLabel = self->_deviceCaseSizeLabel;
  v12 = BPSLocalizedVariantSizeForProductType();
  [(UILabel *)deviceCaseSizeLabel setText:v12];

  id v13 = objc_alloc_init((Class)NSDateFormatter);
  [v13 setTimeStyle:1];
  [v13 setDateStyle:1];
  double v14 = +[NSBundle mainBundle];
  id v15 = [v14 localizedStringForKey:@"DATE_AND_OS_%@_%@" value:&stru_100249230 table:@"Localizable"];
  uint64_t v33 = (void *)v8;
  v16 = [v13 stringFromDate:v8];
  int v34 = (void *)v7;
  double v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v16, v7);

  double v18 = (void *)v6;
  [(UILabel *)self->_deviceLastBackupDetailLabel setText:v17];
  [(COSWatchView *)self->_watchView overrideMaterial:v32 size:BPSVariantSizeForProductType()];
  [(COSWatchView *)self->_watchView setAssociatedDevice:v4];
  pairedStatusLabel = self->_pairedStatusLabel;
  v20 = +[NSBundle mainBundle];
  id v21 = [v20 localizedStringForKey:@"CURRENTLY_PAIRED_TITLE" value:&stru_100249230 table:@"Localizable"];
  [(UILabel *)pairedStatusLabel setText:v21];

  uint64_t v22 = +[COSBackupManager sharedBackupManager];
  uint64_t v23 = [(id)v22 minWatchOSVersion];
  int v24 = NRWatchOSVersion();

  int v25 = NRWatchOSVersionForRemoteDevice();
  LOBYTE(v22) = NRVersionIsGreaterThanOrEqual();
  id v26 = pbb_setupflow_log();
  BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v27)
    {
      v28 = [v4 valueForProperty:NRDevicePropertyPairingID];
      *(_DWORD *)buf = 67109634;
      int v37 = v25;
      __int16 v38 = 1024;
      int v39 = v24;
      __int16 v40 = 2112;
      v41 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "found compatible device: %u - %u - %@", buf, 0x18u);
    }
  }
  else
  {
    if (v27)
    {
      *(_DWORD *)buf = 67109376;
      int v37 = v25;
      __int16 v38 = 1024;
      int v39 = v24;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "found incompatible device: %u - %u", buf, 0xEu);
    }

    updateRequiredLabel = self->_updateRequiredLabel;
    v30 = +[NSBundle mainBundle];
    v31 = [v30 localizedStringForKey:@"BACKUP_UPDATE_REQUIRED" value:&stru_100249230 table:@"Localizable"];
    [(UILabel *)updateRequiredLabel setText:v31];

    self->_updateRequired = 1;
  }
  [(COSRestoreTableViewCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v71.receiver = self;
  v71.super_class = (Class)COSRestoreTableViewCell;
  [(COSRestoreTableViewCell *)&v71 layoutSubviews];
  [(COSRestoreTableViewCell *)self bounds];
  double v4 = v3;
  v77 = &off_10025BF50;
  v78 = &off_10025C3D0;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];
  __asm { FMOV            V1.2D, #25.0 }
  *(_OWORD *)buf = xmmword_1001AAEF0;
  *(_OWORD *)&buf[16] = _Q1;
  long long v75 = _Q1;
  long long v76 = _Q1;
  BPSScreenValueGetRelevantZoomValue();
  double v12 = v11;

  long long v72 = &off_10025BF50;
  long long v73 = &off_10025C3E0;
  id v13 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
  __asm { FMOV            V1.2D, #24.0 }
  *(_OWORD *)buf = xmmword_1001AAF00;
  *(_OWORD *)&buf[16] = _Q1;
  long long v75 = _Q1;
  long long v76 = _Q1;
  BPSScreenValueGetRelevantZoomValue();
  double v16 = v15;

  -[COSWatchView sizeThatFits:](self->_watchView, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v18 = v17;
  double v20 = v19;
  unsigned int v21 = [(COSRestoreTableViewCell *)self _shouldReverseLayoutDirection];
  double v22 = v4 - v12 - v18;
  if (!v21) {
    double v22 = v12;
  }
  v64.origin.x = v22;
  v64.size.double width = v18;
  v64.size.double height = v20;
  float v23 = (148.0 - v20) * 0.5;
  v64.origin.double y = floorf(v23);
  -[COSWatchView setFrame:](self->_watchView, "setFrame:");
  double v63 = v16;
  double v24 = v4 + v16 * -2.0 - v18 + -44.0;
  -[UILabel sizeThatFits:](self->_deviceTitleLabel, "sizeThatFits:");
  double v70 = v25;
  -[UILabel sizeThatFits:](self->_pairedStatusLabel, "sizeThatFits:", v24, 0.0);
  double v68 = v26;
  double v69 = v27;
  -[UILabel sizeThatFits:](self->_deviceMaterialLabel, "sizeThatFits:", v24, 0.0);
  double v29 = v28;
  -[UILabel sizeThatFits:](self->_deviceCaseSizeLabel, "sizeThatFits:", v24, 0.0);
  double v31 = v30;
  -[UILabel sizeThatFits:](self->_deviceLastBackupDetailLabel, "sizeThatFits:", v24, 0.0);
  double v33 = v32;
  -[UILabel sizeThatFits:](self->_updateRequiredLabel, "sizeThatFits:", v24, 0.0);
  double v35 = v34;
  double v37 = v36;
  __asm { FMOV            V0.2D, #6.0 }
  *(_OWORD *)buf = _Q0;
  *(_OWORD *)&buf[16] = _Q0;
  long long v75 = _Q0;
  long long v76 = _Q0;
  BPSScreenValueGetRelevantValue();
  double v40 = v39;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)buf = _Q0;
  *(_OWORD *)&buf[16] = _Q0;
  long long v75 = _Q0;
  long long v76 = _Q0;
  BPSScreenValueGetRelevantValue();
  double v65 = v42;
  double v66 = v37;
  double v67 = v33;
  double v43 = v33 + v40 + v31 + v29 + v70 + v40 + v42;
  double v44 = v69;
  if (v68 <= 0.0) {
    double v44 = 0.0;
  }
  double v45 = v44 + v43;
  if (v35 <= 0.0) {
    double v46 = 0.0;
  }
  else {
    double v46 = v37;
  }
  double v47 = v46 + v45;
  if (v46 + v45 > CGRectGetHeight(v64))
  {
    v48 = pbb_setupflow_log();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v49 = [(UILabel *)self->_deviceTitleLabel text];
      v50 = [(UILabel *)self->_deviceMaterialLabel text];
      v51 = [(UILabel *)self->_deviceCaseSizeLabel text];
      v52 = [(UILabel *)self->_deviceLastBackupDetailLabel text];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v49;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v50;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v51;
      LOWORD(v75) = 2112;
      *(void *)((char *)&v75 + 2) = v52;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Back text group is too tall. %@ // %@ // %@ // %@", buf, 0x2Au);
    }
  }
  if (([(COSRestoreTableViewCell *)self _shouldReverseLayoutDirection] & 1) == 0) {
    double v12 = v63 + CGRectGetMaxX(v64);
  }
  float v53 = (CGRectGetHeight(v64) - v47) * 0.5;
  double v54 = CGRectGetMinY(v64) + floorf(v53);
  -[UILabel setFrame:](self->_deviceTitleLabel, "setFrame:", v12, v54, v24 + 44.0, v70);
  v79.origin.x = v12;
  v79.origin.double y = v54;
  v79.size.double width = v24 + 44.0;
  v79.size.double height = v70;
  double v55 = v65 + CGRectGetMaxY(v79);
  -[UILabel setFrame:](self->_pairedStatusLabel, "setFrame:", v12, v55, v24, v69);
  if (v68 <= 0.0) {
    double v56 = v70;
  }
  else {
    double v56 = v69;
  }
  if (v68 <= 0.0) {
    double v57 = v24 + 44.0;
  }
  else {
    double v57 = v24;
  }
  if (v68 <= 0.0) {
    double v58 = v54;
  }
  else {
    double v58 = v55;
  }
  double v59 = v12;
  CGFloat v60 = v40 + CGRectGetMaxY(*(CGRect *)(&v56 - 3));
  -[UILabel setFrame:](self->_deviceMaterialLabel, "setFrame:", v12, v60, v24, v29);
  v80.origin.x = v12;
  v80.origin.double y = v60;
  v80.size.double width = v24;
  v80.size.double height = v29;
  CGFloat v61 = v65 + CGRectGetMaxY(v80);
  -[UILabel setFrame:](self->_deviceCaseSizeLabel, "setFrame:", v12, v61, v24, v31);
  v81.origin.x = v12;
  v81.origin.double y = v61;
  v81.size.double width = v24;
  v81.size.double height = v31;
  CGFloat v62 = v65 + CGRectGetMaxY(v81);
  -[UILabel setFrame:](self->_deviceLastBackupDetailLabel, "setFrame:", v12, v62, v24, v67);
  v82.origin.x = v12;
  v82.origin.double y = v62;
  v82.size.double width = v24;
  v82.size.double height = v67;
  -[UILabel setFrame:](self->_updateRequiredLabel, "setFrame:", v12, v65 + CGRectGetMaxY(v82), v24, v66);
}

- (COSWatchView)watchView
{
  return self->_watchView;
}

- (UILabel)deviceTitleLabel
{
  return self->_deviceTitleLabel;
}

- (UILabel)pairedStatusLabel
{
  return self->_pairedStatusLabel;
}

- (UILabel)deviceMaterialLabel
{
  return self->_deviceMaterialLabel;
}

- (UILabel)deviceLastBackupDetailLabel
{
  return self->_deviceLastBackupDetailLabel;
}

- (UILabel)deviceCaseSizeLabel
{
  return self->_deviceCaseSizeLabel;
}

- (UILabel)updateRequiredLabel
{
  return self->_updateRequiredLabel;
}

- (BOOL)updateRequired
{
  return self->_updateRequired;
}

- (void)setUpdateRequired:(BOOL)a3
{
  self->_updateRequired = a3;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_updateRequiredLabel, 0);
  objc_storeStrong((id *)&self->_deviceCaseSizeLabel, 0);
  objc_storeStrong((id *)&self->_deviceLastBackupDetailLabel, 0);
  objc_storeStrong((id *)&self->_deviceMaterialLabel, 0);
  objc_storeStrong((id *)&self->_pairedStatusLabel, 0);
  objc_storeStrong((id *)&self->_deviceTitleLabel, 0);

  objc_storeStrong((id *)&self->_watchView, 0);
}

@end