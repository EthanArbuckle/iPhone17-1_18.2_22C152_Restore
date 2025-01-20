@interface PSUICellularErrorGlossary
+ (id)sharedInstance;
- (PSUICellularErrorGlossary)init;
- (id)getLogger;
- (id)initPrivate;
- (id)messageForError:(id)a3;
@end

@implementation PSUICellularErrorGlossary

+ (id)sharedInstance
{
  if (qword_26AC322C8 != -1) {
    dispatch_once(&qword_26AC322C8, &__block_literal_global_11);
  }
  v2 = (void *)_MergedGlobals_64;
  return v2;
}

uint64_t __43__PSUICellularErrorGlossary_sharedInstance__block_invoke()
{
  _MergedGlobals_64 = [[PSUICellularErrorGlossary alloc] initPrivate];
  return MEMORY[0x270F9A758]();
}

- (id)initPrivate
{
  v3.receiver = self;
  v3.super_class = (Class)PSUICellularErrorGlossary;
  return [(PSUICellularErrorGlossary *)&v3 init];
}

- (PSUICellularErrorGlossary)init
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = [(PSUICellularErrorGlossary *)self getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    v4 = "-[PSUICellularErrorGlossary init]";
    _os_log_error_impl(&dword_221B17000, v2, OS_LOG_TYPE_ERROR, "Error: unsupported initializer called: %s", (uint8_t *)&v3, 0xCu);
  }

  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer" reason:@"Unsupported initializer called" userInfo:0]);
}

- (id)messageForError:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"GENERIC_CELLULAR_PLAN_ERROR_TITLE" value:&stru_26D410CA0 table:@"Cellular"];
  [v4 setTitle:v6];

  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"GENERIC_CELLULAR_PLAN_ERROR_MESSAGE" value:&stru_26D410CA0 table:@"Cellular"];
  [v4 setMessage:v8];

  v9 = [v3 domain];
  LODWORD(v8) = [v9 isEqualToString:*MEMORY[0x263F31920]];

  if (v8)
  {
    uint64_t v10 = [v3 code];
    if (v10 == 13)
    {
      v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v17 = [v16 localizedStringForKey:@"CELLULAR_PLAN_BEING_CONFIGURED_TITLE" value:&stru_26D410CA0 table:@"Cellular"];
      [v4 setTitle:v17];

      v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v14 = v13;
      v15 = @"CELLULAR_PLAN_BEING_CONFIGURED_MESSAGE";
    }
    else
    {
      if (v10 != 2) {
        goto LABEL_7;
      }
      v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v12 = [v11 localizedStringForKey:@"INVALID_ACTIVATION_CODE_TITLE" value:&stru_26D410CA0 table:@"Cellular"];
      [v4 setTitle:v12];

      v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v14 = v13;
      v15 = @"INVALID_ACTIVATION_CODE_MESSAGE";
    }
    v18 = [v13 localizedStringForKey:v15 value:&stru_26D410CA0 table:@"Cellular"];
    [v4 setMessage:v18];
  }
LABEL_7:

  return v4;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CellularErrorGlossary"];
}

@end