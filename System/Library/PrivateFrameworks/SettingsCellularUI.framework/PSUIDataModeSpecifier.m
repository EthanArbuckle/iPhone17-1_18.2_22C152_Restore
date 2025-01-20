@interface PSUIDataModeSpecifier
- (BOOL)isHighDataModeSupported;
- (BOOL)isLowDataModeSupported;
- (PSUIDataModeSpecifier)initWithCTClient:(id)a3 hostController:(id)a4 parentSpecifier:(id)a5;
- (id)dataModeFromNumber:(id)a3;
- (id)getDataMode:(id)a3;
- (id)getLogger;
- (id)interfaceCostFromBool:(BOOL)a3;
- (id)isInterfaceCostExpensive:(id)a3;
- (id)isLowDataModeEnabled:(id)a3;
- (id)lowDataModeFromBool:(BOOL)a3;
- (id)lowDataModeGroupSpecifier;
- (unint64_t)showDataMode;
- (void)populateDrillDownSpecifiers;
- (void)prepareDataModeDrillDown;
- (void)prepareLowDataModeSwitch;
- (void)setDataMode:(id)a3 specifier:(id)a4;
- (void)setFooterText;
- (void)setInterfaceCostExpensive:(id)a3 specifier:(id)a4;
- (void)setLowDataMode:(id)a3 specifier:(id)a4;
- (void)setShowDataMode:(unint64_t)a3;
@end

@implementation PSUIDataModeSpecifier

- (PSUIDataModeSpecifier)initWithCTClient:(id)a3 hostController:(id)a4 parentSpecifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PSUIDataModeSpecifier;
  v12 = [(PSUIDataModeSpecifier *)&v19 init];
  v13 = v12;
  if (v12)
  {
    [(PSUIDataModeSpecifier *)v12 setTarget:v12];
    objc_storeStrong((id *)&v13->_ctClient, a3);
    objc_storeWeak((id *)&v13->_hostController, v10);
    uint64_t v14 = [v11 propertyForKey:*MEMORY[0x263F60290]];
    subscriptionContext = v13->_subscriptionContext;
    v13->_subscriptionContext = (CTXPCServiceSubscriptionContext *)v14;

    uint64_t v16 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:v13->_subscriptionContext];
    serviceDescriptor = v13->_serviceDescriptor;
    v13->_serviceDescriptor = (CTServiceDescriptor *)v16;

    if ([(PSUIDataModeSpecifier *)v13 isHighDataModeSupported])
    {
      v13->_showDataMode = 2;
      [(PSUIDataModeSpecifier *)v13 prepareDataModeDrillDown];
    }
    else if ([(PSUIDataModeSpecifier *)v13 isLowDataModeSupported])
    {
      v13->_showDataMode = 1;
      [(PSUIDataModeSpecifier *)v13 prepareLowDataModeSwitch];
    }
    else
    {
      v13->_showDataMode = 0;
    }
  }

  return v13;
}

- (void)prepareLowDataModeSwitch
{
  v3 = [(PSUIDataModeSpecifier *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEBUG, "Low data mode switch will be shown", v6, 2u);
  }

  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"LOW_DATA_MODE" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  [(PSUIDataModeSpecifier *)self setName:v5];

  [(PSUIDataModeSpecifier *)self setCellType:6];
  [(PSUIDataModeSpecifier *)self setDetailControllerClass:0];
  [(PSUIDataModeSpecifier *)self setIdentifier:@"LOW_DATA_MODE"];
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FE28]) = (Class)sel_isLowDataModeEnabled_;
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FE38]) = (Class)sel_setLowDataMode_specifier_;
}

- (void)prepareDataModeDrillDown
{
  v3 = [(PSUIDataModeSpecifier *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_debug_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEBUG, "Data mode drill down specifier will be shown", v6, 2u);
  }

  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"DATA_MODE" value:&stru_26D410CA0 table:@"Aries"];
  [(PSUIDataModeSpecifier *)self setName:v5];

  [(PSUIDataModeSpecifier *)self setCellType:2];
  [(PSUIDataModeSpecifier *)self setDetailControllerClass:objc_opt_class()];
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FE38]) = (Class)sel_setDataMode_specifier_;
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FE28]) = (Class)sel_getDataMode_;
  [(PSUIDataModeSpecifier *)self populateDrillDownSpecifiers];
  [(PSUIDataModeSpecifier *)self setFooterText];
}

- (void)setFooterText
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F82670] currentDevice];
  int v4 = objc_msgSend(v3, "sf_isChinaRegionCellularDevice");
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = v5;
  if (v4) {
    v7 = @"5G_DATA_MODE_FOOTER_WLAN";
  }
  else {
    v7 = @"5G_DATA_MODE_FOOTER_WIFI";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26D410CA0 table:@"Aries"];

  id v9 = [(PSUIDataModeSpecifier *)self getLogger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 138412290;
    id v11 = v8;
    _os_log_debug_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEBUG, "Adding Footer Text: %@", (uint8_t *)&v10, 0xCu);
  }

  [(PSUIDataModeSpecifier *)self setProperty:v8 forKey:*MEMORY[0x263F60280]];
}

- (void)populateDrillDownSpecifiers
{
  v15[3] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  int v4 = [MEMORY[0x263EFF980] array];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"DATA_MODE_HIGH" value:&stru_26D410CA0 table:@"Aries"];
  v15[0] = v6;
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"DATA_MODE_STANDARD" value:&stru_26D410CA0 table:@"Aries"];
  v15[1] = v8;
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v10 = [v9 localizedStringForKey:@"DATA_MODE_LOW" value:&stru_26D410CA0 table:@"Aries"];
  v15[2] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
  [v3 addObjectsFromArray:v11];

  [v4 addObjectsFromArray:&unk_26D426020];
  uint64_t v12 = [(PSUIDataModeSpecifier *)self getLogger];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    uint64_t v14 = v3;
    _os_log_debug_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEBUG, "Adding Data Modes : %@", (uint8_t *)&v13, 0xCu);
  }

  [(PSUIDataModeSpecifier *)self setValues:v4 titles:v3 shortTitles:v3];
}

- (BOOL)isHighDataModeSupported
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  ctClient = self->_ctClient;
  serviceDescriptor = self->_serviceDescriptor;
  id v11 = 0;
  int v5 = [(CoreTelephonyClient *)ctClient isHighDataModeSupported:serviceDescriptor error:&v11];
  v6 = (__CFString *)v11;
  v7 = [(PSUIDataModeSpecifier *)self getLogger];
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      int v13 = v6;
      _os_log_error_impl(&dword_221B17000, v8, OS_LOG_TYPE_ERROR, "Failed to get high data mode support state with error: %@", buf, 0xCu);
    }
    LOBYTE(v5) = 0;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"Not supported";
    if (v5) {
      id v9 = @"Supported";
    }
    *(_DWORD *)buf = 138412290;
    int v13 = v9;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Successfully retrieved high data mode support value : %@", buf, 0xCu);
  }

  return v5;
}

- (BOOL)isLowDataModeSupported
{
  v3 = +[PSUICoreTelephonyDataCache sharedInstance];
  LOBYTE(self) = [v3 isPrivateNetworkSIM:self->_serviceDescriptor] ^ 1;

  return (char)self;
}

- (id)getDataMode:(id)a3
{
  id v4 = a3;
  int v5 = [(PSUIDataModeSpecifier *)self isLowDataModeEnabled:v4];
  int v6 = [v5 BOOLValue];

  if (v6)
  {
    v7 = [(PSUIDataModeSpecifier *)self getLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Data mode is: Low", buf, 2u);
    }
    v8 = &unk_26D425F78;
  }
  else
  {
    id v9 = [(PSUIDataModeSpecifier *)self isInterfaceCostExpensive:v4];
    int v10 = [v9 BOOLValue];

    v7 = [(PSUIDataModeSpecifier *)self getLogger];
    BOOL v11 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v11)
      {
        *(_WORD *)uint64_t v14 = 0;
        _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Data mode is: Normal", v14, 2u);
      }
      v8 = &unk_26D425F60;
    }
    else
    {
      if (v11)
      {
        *(_WORD *)int v13 = 0;
        _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Data mode is: High", v13, 2u);
      }
      v8 = &unk_26D425F48;
    }
  }

  return v8;
}

- (void)setDataMode:(id)a3 specifier:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(PSUIDataModeSpecifier *)self getDataMode:v7];
  int v9 = [v6 isEqualToNumber:v8];
  int v10 = [(PSUIDataModeSpecifier *)self getLogger];
  BOOL v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_super v19 = [(PSUIDataModeSpecifier *)self dataModeFromNumber:v6];
      int v20 = 138412290;
      v21 = v19;
      _os_log_debug_impl(&dword_221B17000, v11, OS_LOG_TYPE_DEBUG, "Data mode is already set to the requested state: %@", (uint8_t *)&v20, 0xCu);
    }
    goto LABEL_18;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(PSUIDataModeSpecifier *)self dataModeFromNumber:v8];
    int v13 = [(PSUIDataModeSpecifier *)self dataModeFromNumber:v6];
    int v20 = 138412546;
    v21 = v12;
    __int16 v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_221B17000, v11, OS_LOG_TYPE_DEFAULT, "Changing data mode %@ -> %@", (uint8_t *)&v20, 0x16u);
  }
  int v14 = [v6 intValue];
  switch(v14)
  {
    case 1:
      uint64_t v15 = MEMORY[0x263EFFA88];
      goto LABEL_12;
    case 2:
      [(PSUIDataModeSpecifier *)self setInterfaceCostExpensive:MEMORY[0x263EFFA88] specifier:v7];
      uint64_t v17 = MEMORY[0x263EFFA80];
      uint64_t v16 = self;
      goto LABEL_14;
    case 3:
      uint64_t v15 = MEMORY[0x263EFFA80];
LABEL_12:
      [(PSUIDataModeSpecifier *)self setInterfaceCostExpensive:v15 specifier:v7];
      uint64_t v16 = self;
      uint64_t v17 = v15;
LABEL_14:
      [(PSUIDataModeSpecifier *)v16 setLowDataMode:v17 specifier:v7];
      goto LABEL_18;
  }
  v18 = [(PSUIDataModeSpecifier *)self getLogger];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v20) = 0;
    _os_log_error_impl(&dword_221B17000, v18, OS_LOG_TYPE_ERROR, "Setting data mode to an unknown value", (uint8_t *)&v20, 2u);
  }

LABEL_18:
}

- (id)isLowDataModeEnabled:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  ctClient = self->_ctClient;
  serviceDescriptor = self->_serviceDescriptor;
  id v13 = 0;
  uint64_t v6 = [(CoreTelephonyClient *)ctClient lowDataMode:serviceDescriptor error:&v13];
  id v7 = v13;
  v8 = [(PSUIDataModeSpecifier *)self getLogger];
  int v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_error_impl(&dword_221B17000, v9, OS_LOG_TYPE_ERROR, "Failed to get low data mode state with error: %@", buf, 0xCu);
    }

    int v10 = (void *)MEMORY[0x263EFFA80];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [(PSUIDataModeSpecifier *)self lowDataModeFromBool:v6];
      *(_DWORD *)buf = 138412290;
      id v15 = v11;
      _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "Successfully retrieved low data mode state : %@", buf, 0xCu);
    }
    int v10 = [NSNumber numberWithBool:v6];
  }

  return v10;
}

- (void)setLowDataMode:(id)a3 specifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 BOOLValue];
  uint64_t v6 = [(CoreTelephonyClient *)self->_ctClient setLowDataMode:self->_serviceDescriptor enable:v5];
  id v7 = [(PSUIDataModeSpecifier *)self getLogger];
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = [(PSUIDataModeSpecifier *)self lowDataModeFromBool:v5];
      int v10 = 138412546;
      BOOL v11 = v9;
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_error_impl(&dword_221B17000, v8, OS_LOG_TYPE_ERROR, "Failed to set low data mode to: %@ with error: %@", (uint8_t *)&v10, 0x16u);
LABEL_6:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(PSUIDataModeSpecifier *)self lowDataModeFromBool:v5];
    int v10 = 138412290;
    BOOL v11 = v9;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Successfully set low data mode to: %@", (uint8_t *)&v10, 0xCu);
    goto LABEL_6;
  }
}

- (id)lowDataModeGroupSpecifier
{
  v2 = [MEMORY[0x263F5FC40] emptyGroupSpecifier];
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"DATA_MODE_FOOTER" value:&stru_26D410CA0 table:@"Cellular"];
  [v2 setProperty:v4 forKey:*MEMORY[0x263F600F8]];

  return v2;
}

- (id)isInterfaceCostExpensive:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  ctClient = self->_ctClient;
  serviceDescriptor = self->_serviceDescriptor;
  id v13 = 0;
  uint64_t v6 = [(CoreTelephonyClient *)ctClient interfaceCostExpensive:serviceDescriptor error:&v13];
  id v7 = v13;
  v8 = [(PSUIDataModeSpecifier *)self getLogger];
  int v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_error_impl(&dword_221B17000, v9, OS_LOG_TYPE_ERROR, "Failed to get interface cost with error: %@", buf, 0xCu);
    }

    int v10 = (void *)MEMORY[0x263EFFA88];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [(PSUIDataModeSpecifier *)self interfaceCostFromBool:v6];
      *(_DWORD *)buf = 138412290;
      id v15 = v11;
      _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "Successfully retrieved interface cost: %@", buf, 0xCu);
    }
    int v10 = [NSNumber numberWithBool:v6];
  }

  return v10;
}

- (void)setInterfaceCostExpensive:(id)a3 specifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 BOOLValue];
  uint64_t v6 = [(PSUIDataModeSpecifier *)self interfaceCostFromBool:v5];
  id v7 = [(CoreTelephonyClient *)self->_ctClient setInterfaceCost:self->_serviceDescriptor expensive:v5];
  v8 = [(PSUIDataModeSpecifier *)self getLogger];
  int v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412546;
      BOOL v11 = v6;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_error_impl(&dword_221B17000, v9, OS_LOG_TYPE_ERROR, "Failed to set interface cost to: %@ with error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    BOOL v11 = v6;
    _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "Successfully set interface cost to: %@", (uint8_t *)&v10, 0xCu);
  }
}

- (id)dataModeFromNumber:(id)a3
{
  unsigned int v4 = [a3 intValue] - 1;
  if (v4 < 3) {
    return off_2645E19A0[v4];
  }
  uint64_t v6 = [(PSUIDataModeSpecifier *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v7 = 0;
    _os_log_error_impl(&dword_221B17000, v6, OS_LOG_TYPE_ERROR, "Unknown data mode value", v7, 2u);
  }

  return &stru_26D410CA0;
}

- (id)lowDataModeFromBool:(BOOL)a3
{
  if (a3) {
    return @"ON";
  }
  else {
    return @"OFF";
  }
}

- (id)interfaceCostFromBool:(BOOL)a3
{
  if (a3) {
    return @"Expensive";
  }
  else {
    return @"Inexpensive";
  }
}

- (id)getLogger
{
  v2 = (void *)MEMORY[0x263F67EB0];
  v3 = [(CTServiceDescriptor *)self->_serviceDescriptor instance];
  unsigned int v4 = [v3 stringValue];
  uint64_t v5 = [v2 loggerWithCategory:@"LDM" instance:v4];

  return v5;
}

- (unint64_t)showDataMode
{
  return self->_showDataMode;
}

- (void)setShowDataMode:(unint64_t)a3
{
  self->_showDataMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_serviceDescriptor, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end