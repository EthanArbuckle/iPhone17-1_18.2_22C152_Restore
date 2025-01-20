@interface SCROVirtualBrailleDisplay
+ (id)systemDisplay;
- (SCROVirtualBrailleDisplay)initWithMainSize:(int64_t)a3;
- (id)_initWithMainSize:(int64_t)a3 ioElement:(id)a4;
- (id)mainCells;
- (int64_t)mainSize;
- (void)_simulateKeypressWithMask:(unsigned int)a3;
- (void)didSetMainCells:(id)a3;
- (void)pressKeyChord:(unint64_t)a3;
- (void)pressNext;
- (void)pressPanLeft;
- (void)pressPanRight;
- (void)pressPrevious;
- (void)pressRouterWithIndex:(unint64_t)a3;
@end

@implementation SCROVirtualBrailleDisplay

+ (id)systemDisplay
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__SCROVirtualBrailleDisplay_systemDisplay__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (systemDisplay_onceToken != -1) {
    dispatch_once(&systemDisplay_onceToken, block);
  }
  v2 = (void *)systemDisplay__systemDisplay;

  return v2;
}

void __42__SCROVirtualBrailleDisplay_systemDisplay__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  id v4 = +[SCROVirtualIOElement systemElement];
  uint64_t v2 = [v1 _initWithMainSize:1 ioElement:v4];
  v3 = (void *)systemDisplay__systemDisplay;
  systemDisplay__systemDisplay = v2;
}

- (SCROVirtualBrailleDisplay)initWithMainSize:(int64_t)a3
{
  v5 = objc_opt_new();
  v6 = [(SCROVirtualBrailleDisplay *)self _initWithMainSize:a3 ioElement:v5];

  return v6;
}

- (id)_initWithMainSize:(int64_t)a3 ioElement:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3 <= 0)
  {
    _SCROD_LOG();
    v7 = (SCROVirtualBrailleDriver *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v19 = a3;
      _os_log_impl(&dword_21C66E000, &v7->super, OS_LOG_TYPE_DEFAULT, "Failed to create a virtual display: mainSize is nonpositive (%ld).", buf, 0xCu);
    }
    v15 = 0;
  }
  else
  {
    v7 = [[SCROVirtualBrailleDriver alloc] initWithMainSize:a3 delegate:self];
    v8 = +[SCROBrailleDisplayManager sharedManager];
    v17.receiver = self;
    v17.super_class = (Class)SCROVirtualBrailleDisplay;
    id v9 = [(SCROBrailleDisplay *)&v17 _initWithDriver:v7 driverIdentifier:@"com.apple.scrod.braille.driver.generic.hid" ioElement:v6 delegate:v8];

    if (v9)
    {
      v10 = objc_opt_new();
      int64_t v11 = a3;
      do
      {
        [v10 appendString:@"⠀"];
        --v11;
      }
      while (v11);
      v12 = (void *)*((void *)v9 + 33);
      *((void *)v9 + 33) = v10;
      id v13 = v10;

      *((void *)v9 + 32) = a3;
      objc_storeStrong((id *)v9 + 34, v7);

      v14 = _SCROD_LOG();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v19 = a3;
        _os_log_impl(&dword_21C66E000, v14, OS_LOG_TYPE_DEFAULT, "Created a virtual display with main size: %ld", buf, 0xCu);
      }
    }
    self = (SCROVirtualBrailleDisplay *)v9;
    v15 = self;
  }

  return v15;
}

- (int64_t)mainSize
{
  return self->_mainSize;
}

- (id)mainCells
{
  return self->_mainCells;
}

- (void)didSetMainCells:(id)a3
{
}

- (void)pressPanLeft
{
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueuePan:1 down:1];
  virtualDriver = self->_virtualDriver;

  [(SCROVirtualBrailleDriver *)virtualDriver enqueuePan:1 down:0];
}

- (void)pressPanRight
{
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueuePan:0 down:1];
  virtualDriver = self->_virtualDriver;

  [(SCROVirtualBrailleDriver *)virtualDriver enqueuePan:0 down:0];
}

- (void)pressPrevious
{
}

- (void)pressNext
{
}

- (void)pressKeyChord:(unint64_t)a3
{
  __int16 v3 = a3;
  if ((a3 & 2) != 0)
  {
    [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueDot:1 down:1];
    if ((v3 & 4) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((a3 & 4) == 0)
  {
    goto LABEL_3;
  }
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueDot:2 down:1];
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueDot:3 down:1];
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueDot:4 down:1];
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueDot:5 down:1];
  if ((v3 & 0x40) == 0)
  {
LABEL_7:
    if ((v3 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueDot:6 down:1];
  if ((v3 & 0x80) == 0)
  {
LABEL_8:
    if ((v3 & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueDot:7 down:1];
  if ((v3 & 0x100) == 0)
  {
LABEL_9:
    if ((v3 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueDot:8 down:1];
  if ((v3 & 0x200) == 0)
  {
LABEL_10:
    if ((v3 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueSpaceWithDown:1];
  if ((v3 & 2) == 0)
  {
LABEL_11:
    if ((v3 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueDot:1 down:0];
  if ((v3 & 4) == 0)
  {
LABEL_12:
    if ((v3 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueDot:2 down:0];
  if ((v3 & 8) == 0)
  {
LABEL_13:
    if ((v3 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueDot:3 down:0];
  if ((v3 & 0x10) == 0)
  {
LABEL_14:
    if ((v3 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueDot:4 down:0];
  if ((v3 & 0x20) == 0)
  {
LABEL_15:
    if ((v3 & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueDot:5 down:0];
  if ((v3 & 0x40) == 0)
  {
LABEL_16:
    if ((v3 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueDot:6 down:0];
  if ((v3 & 0x80) == 0)
  {
LABEL_17:
    if ((v3 & 0x100) == 0) {
      goto LABEL_18;
    }
LABEL_36:
    [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueDot:8 down:0];
    if ((v3 & 0x200) == 0) {
      return;
    }
    goto LABEL_37;
  }
LABEL_35:
  [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueDot:7 down:0];
  if ((v3 & 0x100) != 0) {
    goto LABEL_36;
  }
LABEL_18:
  if ((v3 & 0x200) == 0) {
    return;
  }
LABEL_37:
  virtualDriver = self->_virtualDriver;

  [(SCROVirtualBrailleDriver *)virtualDriver enqueueSpaceWithDown:0];
}

- (void)pressRouterWithIndex:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (self->_mainSize <= a3)
  {
    id v6 = _SCROD_LOG();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int64_t mainSize = self->_mainSize;
      int v8 = 134218240;
      unint64_t v9 = a3;
      __int16 v10 = 2048;
      int64_t v11 = mainSize;
      _os_log_impl(&dword_21C66E000, v6, OS_LOG_TYPE_DEFAULT, "Virtual display: router index (%ld) out of bound (%ld)", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    [(SCROVirtualBrailleDriver *)self->_virtualDriver enqueueRouter:a3 down:1];
    virtualDriver = self->_virtualDriver;
    [(SCROVirtualBrailleDriver *)virtualDriver enqueueRouter:a3 down:0];
  }
}

- (void)_simulateKeypressWithMask:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setDisplayToken:", -[SCROBrailleDisplay token](self, "token"));
  [v5 setDisplayMode:0];
  [v5 addKeyMask:v3];
  [(SCROBrailleDisplay *)self simulateKeypress:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualDriver, 0);

  objc_storeStrong((id *)&self->_mainCells, 0);
}

@end