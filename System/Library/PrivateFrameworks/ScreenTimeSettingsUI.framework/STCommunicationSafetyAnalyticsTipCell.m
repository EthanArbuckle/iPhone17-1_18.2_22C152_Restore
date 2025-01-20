@interface STCommunicationSafetyAnalyticsTipCell
+ (BOOL)didAcknowledgeTipViewForDSID:(id)a3;
+ (void)acknowledgeTipViewForDSID:(id)a3;
- (STCommunicationSafetyAnalyticsTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation STCommunicationSafetyAnalyticsTipCell

- (STCommunicationSafetyAnalyticsTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v17.receiver = self;
  v17.super_class = (Class)STCommunicationSafetyAnalyticsTipCell;
  id v7 = a5;
  v8 = [(STTableCell *)&v17 initWithStyle:a3 reuseIdentifier:a4 specifier:v7];
  v9 = objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x263F5FF70], v17.receiver, v17.super_class);
  v10 = [v7 objectForKeyedSubscript:*MEMORY[0x263F60078]];

  v11 = [MEMORY[0x263F67438] makeCommunicationSafetyAnalyticsTipViewControllerWithActionBlock:v9 dismissTipBlock:v10];
  v12 = [v11 view];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [(STCommunicationSafetyAnalyticsTipCell *)v8 contentView];
  [v13 addSubview:v12];
  v14 = (void *)MEMORY[0x263F08938];
  v15 = objc_msgSend(MEMORY[0x263F08938], "st_constraintsForView:equalToView:", v12, v13);
  [v14 activateConstraints:v15];

  return v8;
}

+ (void)acknowledgeTipViewForDSID:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
    v6 = [v5 objectForKey:@"HasShownCommunicationSafetyAnalyticsTipByDSID"];
    if (([a1 didAcknowledgeTipViewForDSID:v4] & 1) == 0)
    {
      if (v6)
      {
        id v7 = (void *)[v6 mutableCopy];
        [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v4];

        v6 = v7;
      }
      else
      {
        id v8 = v4;
        v9[0] = MEMORY[0x263EFFA88];
        v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
      }
      [v5 setObject:v6 forKey:@"HasShownCommunicationSafetyAnalyticsTipByDSID"];
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    +[STCommunicationSafetyAnalyticsTipCell acknowledgeTipViewForDSID:]();
  }
}

+ (BOOL)didAcknowledgeTipViewForDSID:(id)a3
{
  v3 = (void *)MEMORY[0x263EFFA40];
  id v4 = a3;
  v5 = [v3 standardUserDefaults];
  v6 = [v5 objectForKey:@"HasShownCommunicationSafetyAnalyticsTipByDSID"];

  id v7 = [v6 objectForKeyedSubscript:v4];

  LOBYTE(v4) = [v7 BOOLValue];
  return (char)v4;
}

+ (void)acknowledgeTipViewForDSID:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to update communication safety analytics tip by DSID dictionary due to nil DSID.", v0, 2u);
}

@end