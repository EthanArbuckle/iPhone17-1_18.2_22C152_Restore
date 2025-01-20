@interface PSGSEIDDetailsController
- (BOOL)_setupSEIDSpecifier;
- (NSString)SEIDString;
- (id)specifiers;
- (unsigned)hwState;
- (void)_setupSEIDSpecifier;
- (void)_updateHwStateChange;
- (void)dealloc;
- (void)hardwareStateDidChange;
- (void)setHwState:(unsigned int)a3;
- (void)setSEIDString:(id)a3;
- (void)viewDidLoad;
@end

@implementation PSGSEIDDetailsController

- (void)dealloc
{
  v3 = [MEMORY[0x263F58110] sharedHardwareManager];
  [v3 unregisterEventListener:self];

  v4.receiver = self;
  v4.super_class = (Class)PSGSEIDDetailsController;
  [(PSGSEIDDetailsController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v3 = [MEMORY[0x263F58110] sharedHardwareManager];
  [v3 registerEventListener:self];
  -[PSGSEIDDetailsController setHwState:](self, "setHwState:", [v3 getHwSupport]);
  v4.receiver = self;
  v4.super_class = (Class)PSGSEIDDetailsController;
  [(PSGSEIDDetailsController *)&v4 viewDidLoad];
}

- (id)specifiers
{
  [(PSGSEIDDetailsController *)self _updateHwStateChange];
  unsigned int v3 = [(PSGSEIDDetailsController *)self hwState];
  uint64_t v4 = (int)*MEMORY[0x263F5FDB8];
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  if (v5) {
    goto LABEL_4;
  }
  if (v3 == 2)
  {
    [(PSGSEIDDetailsController *)self _setupSEIDSpecifier];
    v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
LABEL_4:
    id v6 = v5;
    goto LABEL_5;
  }
  v8 = _PSGLoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_23D28D000, v8, OS_LOG_TYPE_DEFAULT, "HW not ready yet", v9, 2u);
  }

  id v6 = (id)MEMORY[0x263EFFA68];
LABEL_5:
  return v6;
}

- (NSString)SEIDString
{
  SEIDString = self->_SEIDString;
  if (!SEIDString)
  {
    uint64_t v4 = [MEMORY[0x263F58130] embeddedSecureElement];
    v5 = [v4 serialNumber];
    id v6 = self->_SEIDString;
    self->_SEIDString = v5;

    SEIDString = self->_SEIDString;
  }
  return SEIDString;
}

- (void)hardwareStateDidChange
{
  unsigned int v3 = _PSGLoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23D28D000, v3, OS_LOG_TYPE_DEFAULT, "HW state updated", buf, 2u);
  }

  unsigned int v4 = [(PSGSEIDDetailsController *)self hwState];
  [(PSGSEIDDetailsController *)self _updateHwStateChange];
  if (v4 != 4 && v4 != [(PSGSEIDDetailsController *)self hwState])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__PSGSEIDDetailsController_hardwareStateDidChange__block_invoke;
    block[3] = &unk_264E8C8A0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __50__PSGSEIDDetailsController_hardwareStateDidChange__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _setupSEIDSpecifier];
  if (result)
  {
    unsigned int v3 = *(void **)(a1 + 32);
    return [v3 reloadSpecifiers];
  }
  return result;
}

- (void)_updateHwStateChange
{
  if ([(PSGSEIDDetailsController *)self hwState] != 4
    && [(PSGSEIDDetailsController *)self hwState] != 2)
  {
    id v3 = [MEMORY[0x263F58110] sharedHardwareManager];
    -[PSGSEIDDetailsController setHwState:](self, "setHwState:", [v3 getHwSupport]);
  }
}

- (BOOL)_setupSEIDSpecifier
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  uint64_t v4 = [*(id *)((char *)&self->super.super.super.super.super.isa + v3) count];
  if (v4)
  {
    v5 = _PSGLoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23D28D000, v5, OS_LOG_TYPE_DEFAULT, "Already initialized", buf, 2u);
    }
  }
  else
  {
    uint64_t v6 = [(PSGSEIDDetailsController *)self SEIDString];
    if (!v6) {
      -[PSGSEIDDetailsController _setupSEIDSpecifier]();
    }
    v5 = v6;
    v7 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:0 target:self set:0 get:sel_SEIDString_ detail:0 cell:4 edit:0];
    [v7 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    uint64_t v8 = MEMORY[0x263EFFA88];
    [v7 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60050]];
    [v7 setProperty:v8 forKey:*MEMORY[0x263F602E8]];
    v13[0] = v7;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v9;
  }
  return v4 == 0;
}

- (void)setSEIDString:(id)a3
{
}

- (unsigned)hwState
{
  return self->_hwState;
}

- (void)setHwState:(unsigned int)a3
{
  self->_hwState = a3;
}

- (void).cxx_destruct
{
}

- (void)_setupSEIDSpecifier
{
  v0 = _PSGLoggingFacility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_23D28D000, v0, OS_LOG_TYPE_DEFAULT, "We should never hit this since we're supposed to wait until the secure element id is returned.", v1, 2u);
  }

  __assert_rtn("-[PSGSEIDDetailsController _setupSEIDSpecifier]", "PSGAboutController.m", 704, "0");
}

@end