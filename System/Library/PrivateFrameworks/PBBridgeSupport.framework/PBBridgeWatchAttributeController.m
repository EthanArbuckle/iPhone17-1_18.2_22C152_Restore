@interface PBBridgeWatchAttributeController
+ (id)editionDescription:(unint64_t)a3;
+ (id)hwBehaviorDescription:(unint64_t)a3;
+ (id)materialDescription:(unint64_t)a3;
+ (id)materialKeyColorForMaterial:(unint64_t)a3;
+ (id)resourceString:(id)a3 material:(unint64_t)a4 size:(unint64_t)a5 forAttributes:(unint64_t)a6;
+ (id)sharedDeviceController;
+ (id)sizeDescription:(unint64_t)a3;
+ (id)stingMaterialDescription:(unint64_t)a3;
+ (int64_t)pdrSizeFromInternalSize:(unint64_t)a3;
+ (unint64_t)_materialForCLHSValue:(unint64_t)a3;
+ (unint64_t)materialFromDevice:(id)a3;
+ (unint64_t)materialFromPdrDevice:(id)a3;
+ (unint64_t)sizeFromDevice:(id)a3;
+ (unint64_t)sizeFromPdrDevice:(id)a3;
+ (unsigned)sizeFromInternalSize:(unint64_t)a3;
- (BOOL)hasTwoYearWarranty;
- (NRDevice)device;
- (NSCache)stringCache;
- (PBBridgeWatchAttributeController)init;
- (PDRDevice)pdrDevice;
- (id)attributesDescription;
- (id)getGestaltDmin;
- (id)materialKeyColor;
- (id)resourceString:(id)a3 forAttributes:(unint64_t)a4;
- (unint64_t)edition;
- (unint64_t)fallbackMaterialForSize:(unint64_t)a3;
- (unint64_t)hardwareBehavior;
- (unint64_t)internalSize;
- (unint64_t)material;
- (unint64_t)size;
- (unint64_t)stingButtonColor;
- (void)_populateMaterialDetailsWithDMinProperties:(id)a3;
- (void)_setMaterialWithCLHSValue:(unint64_t)a3;
- (void)setDevice:(id)a3;
- (void)setInternalSize:(unint64_t)a3;
- (void)setMaterial:(unint64_t)a3;
- (void)setStringCache:(id)a3;
@end

@implementation PBBridgeWatchAttributeController

+ (id)sharedDeviceController
{
  if (sharedDeviceController_onceToken != -1) {
    dispatch_once(&sharedDeviceController_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedDeviceController___material;
  return v2;
}

uint64_t __58__PBBridgeWatchAttributeController_sharedDeviceController__block_invoke()
{
  sharedDeviceController___material = objc_alloc_init(PBBridgeWatchAttributeController);
  return MEMORY[0x270F9A758]();
}

- (void)_populateMaterialDetailsWithDMinProperties:(id)a3
{
  id v6 = [a3 objectForKey:&unk_26CCA1580];
  unint64_t v4 = [v6 integerValue];
  self->_material = v4;
  if (v4 - 1 > 0x25) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = qword_21C4946C8[v4 - 1];
  }
  self->_edition = v5;
}

- (PBBridgeWatchAttributeController)init
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)PBBridgeWatchAttributeController;
  v2 = [(PBBridgeWatchAttributeController *)&v29 init];
  if (v2)
  {
    if (_IsSetup_onceToken != -1) {
      dispatch_once(&_IsSetup_onceToken, &__block_literal_global_249);
    }
    if (_IsSetup___isSetup)
    {
      v3 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
      stringCache = v2->_stringCache;
      v2->_stringCache = v3;

      unint64_t v5 = (void *)MGCopyAnswer();
      uint64_t v6 = [v5 integerValue];
      v7 = pbb_setup_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, "Device is CLHS Type", buf, 2u);
        }

        [(PBBridgeWatchAttributeController *)v2 _setMaterialWithCLHSValue:v6];
      }
      else
      {
        if (v8)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, "Device is DMin Type", buf, 2u);
        }

        v9 = [(PBBridgeWatchAttributeController *)v2 getGestaltDmin];
        [(PBBridgeWatchAttributeController *)v2 _populateMaterialDetailsWithDMinProperties:v9];
      }
      v10 = (void *)MGCopyAnswer();
      v2->_unint64_t hardwareBehavior = [v10 integerValue];
      if (MGGetBoolAnswer())
      {
        v11 = (void *)MGCopyAnswer();
        v12 = [v11 objectForKey:@"ArtworkDeviceSubType"];
        [v12 unsignedIntegerValue];
        int v13 = NRDeviceSizeForArtworkDeviceSubType() - 1;
        unint64_t hardwareBehavior = v2->_hardwareBehavior;
        switch(v13)
        {
          case 0:
            uint64_t v15 = 5;
            if (hardwareBehavior != 2) {
              uint64_t v15 = 1;
            }
            BOOL v16 = hardwareBehavior == 1;
            uint64_t v17 = 3;
            goto LABEL_36;
          case 1:
            uint64_t v15 = 2;
            if (hardwareBehavior == 2) {
              uint64_t v15 = 6;
            }
            BOOL v16 = hardwareBehavior == 1;
            uint64_t v17 = 4;
            goto LABEL_36;
          case 2:
            uint64_t v15 = 7;
            if (hardwareBehavior == 2) {
              uint64_t v15 = 11;
            }
            BOOL v16 = hardwareBehavior == 1;
            uint64_t v17 = 9;
            goto LABEL_36;
          case 3:
            uint64_t v15 = 8;
            if (hardwareBehavior == 2) {
              uint64_t v15 = 12;
            }
            BOOL v16 = hardwareBehavior == 1;
            uint64_t v17 = 10;
            goto LABEL_36;
          case 4:
            uint64_t v15 = 14;
            if (hardwareBehavior == 2) {
              uint64_t v15 = 18;
            }
            BOOL v16 = hardwareBehavior == 1;
            uint64_t v17 = 16;
            goto LABEL_36;
          case 5:
            uint64_t v15 = 13;
            if (hardwareBehavior == 2) {
              uint64_t v15 = 17;
            }
            BOOL v16 = hardwareBehavior == 1;
            uint64_t v17 = 15;
LABEL_36:
            if (!v16) {
              uint64_t v17 = v15;
            }
            break;
          case 6:
            BOOL v22 = hardwareBehavior == 1;
            uint64_t v17 = 19;
            uint64_t v23 = 24;
            goto LABEL_42;
          case 7:
            BOOL v22 = hardwareBehavior == 1;
            uint64_t v17 = 20;
            uint64_t v23 = 22;
            goto LABEL_42;
          case 8:
            BOOL v22 = hardwareBehavior == 1;
            uint64_t v17 = 21;
            uint64_t v23 = 23;
LABEL_42:
            if (v22) {
              uint64_t v17 = v23;
            }
            break;
          default:
            uint64_t v17 = 0;
            break;
        }
        v2->_internalSize = v17;
      }
      else
      {
        v11 = (void *)MGCopyAnswer();
        unint64_t v18 = v2->_hardwareBehavior;
        switch(NRDeviceSizeForProductType())
        {
          case 1u:
            uint64_t v19 = 5;
            if (v18 != 2) {
              uint64_t v19 = 1;
            }
            BOOL v20 = v18 == 1;
            uint64_t v21 = 3;
            goto LABEL_63;
          case 2u:
            uint64_t v19 = 2;
            if (v18 == 2) {
              uint64_t v19 = 6;
            }
            BOOL v20 = v18 == 1;
            uint64_t v21 = 4;
            goto LABEL_63;
          case 3u:
            uint64_t v19 = 7;
            if (v18 == 2) {
              uint64_t v19 = 11;
            }
            BOOL v20 = v18 == 1;
            uint64_t v21 = 9;
            goto LABEL_63;
          case 4u:
            uint64_t v19 = 8;
            if (v18 == 2) {
              uint64_t v19 = 12;
            }
            BOOL v20 = v18 == 1;
            uint64_t v21 = 10;
            goto LABEL_63;
          case 5u:
            uint64_t v19 = 14;
            if (v18 == 2) {
              uint64_t v19 = 18;
            }
            BOOL v20 = v18 == 1;
            uint64_t v21 = 16;
            goto LABEL_63;
          case 6u:
            uint64_t v19 = 13;
            if (v18 == 2) {
              uint64_t v19 = 17;
            }
            BOOL v20 = v18 == 1;
            uint64_t v21 = 15;
            goto LABEL_63;
          case 7u:
            BOOL v20 = v18 == 1;
            uint64_t v19 = 19;
            uint64_t v21 = 24;
            goto LABEL_63;
          case 8u:
            BOOL v20 = v18 == 1;
            uint64_t v19 = 20;
            uint64_t v21 = 22;
            goto LABEL_63;
          case 9u:
            BOOL v20 = v18 == 1;
            uint64_t v19 = 21;
            uint64_t v21 = 23;
LABEL_63:
            if (v20) {
              unint64_t v24 = v21;
            }
            else {
              unint64_t v24 = v19;
            }
            break;
          default:
            unint64_t v24 = 0;
            break;
        }
        v2->_internalSize = v24;
        +[PBBridgeCAReporter recordMaterial:andSize:](PBBridgeCAReporter, "recordMaterial:andSize:", v6);
      }

      v25 = (void *)MGCopyAnswer();
      v2->_stingButtonColor = [v25 integerValue];
      v26 = pbb_setup_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = [(PBBridgeWatchAttributeController *)v2 attributesDescription];
        *(_DWORD *)buf = 138412290;
        v31 = v27;
        _os_log_impl(&dword_21C445000, v26, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
    }
  }
  return v2;
}

- (id)attributesDescription
{
  v3 = NSString;
  unint64_t v4 = +[PBBridgeWatchAttributeController stingMaterialDescription:self->_stingButtonColor];
  unint64_t v5 = [v3 stringWithFormat:@" (Sting: %@)", v4];

  uint64_t v6 = NSString;
  v7 = +[PBBridgeWatchAttributeController materialDescription:self->_material];
  BOOL v8 = +[PBBridgeWatchAttributeController sizeDescription:self->_internalSize];
  v9 = +[PBBridgeWatchAttributeController editionDescription:self->_edition];
  v10 = +[PBBridgeWatchAttributeController hwBehaviorDescription:self->_hardwareBehavior];
  v11 = [v6 stringWithFormat:@" Attributes: (Material: %@) (Size: %@) (Edition: %@) (HW Behavior: %@)%@", v7, v8, v9, v10, v5];

  return v11;
}

- (BOOL)hasTwoYearWarranty
{
  if ([(PBBridgeWatchAttributeController *)self size] > 0x12) {
    return 0;
  }
  unint64_t v4 = [(PBBridgeWatchAttributeController *)self edition];
  unint64_t v5 = [(PBBridgeWatchAttributeController *)self hardwareBehavior];
  unint64_t v6 = [(PBBridgeWatchAttributeController *)self material] & 0xFFFFFFFFFFFFFFFELL;
  return v4 == 3 || v5 == 1 || v6 == 10;
}

- (void)setDevice:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  unint64_t v4 = (NRDevice *)a3;
  if (self->_device != v4)
  {
    [(NSCache *)self->_stringCache removeAllObjects];
    unint64_t v5 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    stringCache = self->_stringCache;
    self->_stringCache = v5;

    v7 = [(NRDevice *)v4 valueForProperty:*MEMORY[0x263F57578]];
    BOOL v8 = [(NRDevice *)v4 valueForProperty:*MEMORY[0x263F57568]];
    unint64_t v9 = (int)[v8 intValue];

    v10 = [(NRDevice *)v4 valueForProperty:*MEMORY[0x263F57570]];
    uint64_t v11 = [v10 integerValue];
    v12 = pbb_setup_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_21C445000, v12, OS_LOG_TYPE_DEFAULT, "Device is CLHS Type", (uint8_t *)&v22, 2u);
      }

      [(PBBridgeWatchAttributeController *)self _setMaterialWithCLHSValue:v11];
    }
    else
    {
      if (v13)
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_21C445000, v12, OS_LOG_TYPE_DEFAULT, "Device is DMin Type", (uint8_t *)&v22, 2u);
      }

      [(PBBridgeWatchAttributeController *)self _populateMaterialDetailsWithDMinProperties:v7];
    }
    self->_unint64_t hardwareBehavior = v9;
    v14 = [(NRDevice *)v4 valueForProperty:*MEMORY[0x263F57548]];
    if (MGGetBoolAnswer() && v14)
    {
      uint64_t v15 = [v14 objectForKeyedSubscript:@"ArtworkDeviceSubType"];
      [v15 unsignedIntegerValue];
      switch(NRDeviceSizeForArtworkDeviceSubType())
      {
        case 1u:
          goto LABEL_13;
        case 2u:
          goto LABEL_16;
        case 3u:
          goto LABEL_19;
        case 4u:
          goto LABEL_22;
        case 5u:
          goto LABEL_25;
        case 6u:
          goto LABEL_28;
        case 7u:
          goto LABEL_31;
        case 8u:
          goto LABEL_32;
        case 9u:
          goto LABEL_34;
        default:
          goto LABEL_33;
      }
    }
    uint64_t v15 = [(NRDevice *)v4 valueForProperty:*MEMORY[0x263F57628]];
    switch(NRDeviceSizeForProductType())
    {
      case 1u:
LABEL_13:
        unint64_t v16 = 5;
        if (v9 != 2) {
          unint64_t v16 = 1;
        }
        BOOL v17 = v9 == 1;
        uint64_t v18 = 3;
        goto LABEL_35;
      case 2u:
LABEL_16:
        unint64_t v16 = 2;
        if (v9 == 2) {
          unint64_t v16 = 6;
        }
        BOOL v17 = v9 == 1;
        uint64_t v18 = 4;
        goto LABEL_35;
      case 3u:
LABEL_19:
        unint64_t v16 = 7;
        if (v9 == 2) {
          unint64_t v16 = 11;
        }
        BOOL v17 = v9 == 1;
        uint64_t v18 = 9;
        goto LABEL_35;
      case 4u:
LABEL_22:
        unint64_t v16 = 8;
        if (v9 == 2) {
          unint64_t v16 = 12;
        }
        BOOL v17 = v9 == 1;
        uint64_t v18 = 10;
        goto LABEL_35;
      case 5u:
LABEL_25:
        unint64_t v16 = 14;
        if (v9 == 2) {
          unint64_t v16 = 18;
        }
        BOOL v17 = v9 == 1;
        uint64_t v18 = 16;
        goto LABEL_35;
      case 6u:
LABEL_28:
        unint64_t v16 = 13;
        if (v9 == 2) {
          unint64_t v16 = 17;
        }
        BOOL v17 = v9 == 1;
        uint64_t v18 = 15;
        goto LABEL_35;
      case 7u:
LABEL_31:
        BOOL v17 = v9 == 1;
        unint64_t v16 = 19;
        uint64_t v18 = 24;
        goto LABEL_35;
      case 8u:
LABEL_32:
        BOOL v17 = v9 == 1;
        unint64_t v16 = 20;
        uint64_t v18 = 22;
        goto LABEL_35;
      case 9u:
LABEL_34:
        BOOL v17 = v9 == 1;
        unint64_t v16 = 21;
        uint64_t v18 = 23;
LABEL_35:
        if (v17) {
          unint64_t v16 = v18;
        }
        break;
      default:
LABEL_33:
        unint64_t v16 = 0;
        break;
    }
    self->_internalSize = v16;

    uint64_t v19 = pbb_setup_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v20 = [(PBBridgeWatchAttributeController *)self attributesDescription];
      int v22 = 138543362;
      uint64_t v23 = v20;
      _os_log_impl(&dword_21C445000, v19, OS_LOG_TYPE_DEFAULT, "Populating With Device: %{public}@", (uint8_t *)&v22, 0xCu);
    }
  }
  device = self->_device;
  self->_device = v4;
}

- (PDRDevice)pdrDevice
{
  device = self->_device;
  if (device)
  {
    v3 = [(NRDevice *)device pairingID];
    unint64_t v4 = [MEMORY[0x263F5BAC8] sharedInstance];
    unint64_t v5 = [v4 deviceForPairingID:v3];
  }
  else
  {
    unint64_t v5 = 0;
  }
  return (PDRDevice *)v5;
}

- (id)getGestaltDmin
{
  NSLog(&cfstr_CallingMgcopya.isa, a2, @"DMin");
  v2 = (void *)MGCopyAnswer();
  return v2;
}

+ (id)stingMaterialDescription:(unint64_t)a3
{
  if (a3 == 1) {
    return @"Color-2022";
  }
  else {
    return 0;
  }
}

+ (id)materialDescription:(unint64_t)a3
{
  if (a3 - 1 > 0x25) {
    return @"Generic";
  }
  else {
    return off_264400CA8[a3 - 1];
  }
}

+ (id)sizeDescription:(unint64_t)a3
{
  if (a3 > 0x18) {
    return 0;
  }
  else {
    return off_264400DD8[a3];
  }
}

+ (id)hwBehaviorDescription:(unint64_t)a3
{
  v3 = @"Default";
  if (a3 == 2) {
    v3 = @"Nike+";
  }
  if (a3 == 1) {
    return @"Hermès";
  }
  else {
    return v3;
  }
}

+ (id)resourceString:(id)a3 material:(unint64_t)a4 size:(unint64_t)a5 forAttributes:(unint64_t)a6
{
  char v6 = a6;
  uint64_t v19 = *MEMORY[0x263EF8340];
  unint64_t v9 = [MEMORY[0x263F089D8] stringWithString:a3];
  v10 = v9;
  if ((v6 & 2) != 0)
  {
    unint64_t v11 = a4 - 1;
    if (a4 - 1 >= 0x26)
    {
      BOOL v13 = @"-M3";
      goto LABEL_10;
    }
    v12 = off_264400FD0;
  }
  else
  {
    if ((v6 & 3) == 0) {
      goto LABEL_11;
    }
    unint64_t v11 = a4 - 5;
    if (a4 - 5 >= 0x22)
    {
      BOOL v13 = @"-E2";
      goto LABEL_10;
    }
    v12 = off_264400EA0;
  }
  BOOL v13 = v12[v11];
LABEL_10:
  [v9 appendString:v13];
LABEL_11:
  if ((v6 & 4) != 0)
  {
    if (a5 - 1 > 0x17) {
      v14 = @"-448h";
    }
    else {
      v14 = off_264401100[a5 - 1];
    }
    [v10 appendString:v14];
  }
  uint64_t v15 = pbb_setup_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    uint64_t v18 = v10;
    _os_log_impl(&dword_21C445000, v15, OS_LOG_TYPE_DEFAULT, "+resourceString %@", (uint8_t *)&v17, 0xCu);
  }

  return v10;
}

+ (id)editionDescription:(unint64_t)a3
{
  if (a3 > 3) {
    return @"Sport";
  }
  else {
    return off_264400FB0[a3];
  }
}

- (id)resourceString:(id)a3 forAttributes:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (self->_material - 39 <= 0xFFFFFFFFFFFFFFD9)
  {
    v7 = pbb_setup_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t material = self->_material;
      int v19 = 134217984;
      unint64_t v20 = material;
      _os_log_impl(&dword_21C445000, v7, OS_LOG_TYPE_DEFAULT, "Unknown Material: %lu -- Will fallback to M3.", (uint8_t *)&v19, 0xCu);
    }
  }
  unint64_t v9 = [(NSCache *)self->_stringCache objectForKey:v6];
  if (!v9)
  {
    v10 = [MEMORY[0x263F089D8] stringWithString:v6];
    unint64_t v9 = v10;
    if ((v4 & 2) != 0)
    {
      unint64_t v14 = self->_material - 1;
      if (v14 >= 0x26) {
        BOOL v13 = @"-M3";
      }
      else {
        BOOL v13 = off_264400FD0[v14];
      }
    }
    else
    {
      if ((v4 & 3) == 0)
      {
LABEL_17:
        if ((v4 & 4) != 0)
        {
          unint64_t v15 = self->_internalSize - 1;
          if (v15 > 0x17) {
            unint64_t v16 = @"-448h";
          }
          else {
            unint64_t v16 = off_264401100[v15];
          }
          [v9 appendString:v16];
        }
        [(NSCache *)self->_stringCache setObject:v9 forKey:v6];
        goto LABEL_23;
      }
      unint64_t edition = self->_edition;
      v12 = @"-E2";
      if (edition == 3) {
        v12 = @"-E3";
      }
      if (edition == 1) {
        BOOL v13 = @"-E1";
      }
      else {
        BOOL v13 = v12;
      }
    }
    [v10 appendString:v13];
    goto LABEL_17;
  }
LABEL_23:
  int v17 = pbb_setup_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    unint64_t v20 = (unint64_t)v9;
    _os_log_impl(&dword_21C445000, v17, OS_LOG_TYPE_DEFAULT, "-resourceString %@", (uint8_t *)&v19, 0xCu);
  }

  return v9;
}

+ (id)materialKeyColorForMaterial:(unint64_t)a3
{
  switch(a3)
  {
    case 0x14uLL:
      v7 = [MEMORY[0x263F1C550] systemOrangeColor];
      goto LABEL_9;
    case 9uLL:
      v3 = (void *)MEMORY[0x263F1C550];
      double v4 = 0.91372549;
      double v5 = 0.705882353;
      double v6 = 0.549019608;
      goto LABEL_7;
    case 8uLL:
      v3 = (void *)MEMORY[0x263F1C550];
      double v4 = 0.898039216;
      double v5 = 0.796078431;
      double v6 = 0.482352941;
LABEL_7:
      v7 = [v3 colorWithRed:v4 green:v5 blue:v6 alpha:1.0];
      goto LABEL_9;
  }
  v7 = [MEMORY[0x263F1C550] whiteColor];
LABEL_9:
  return v7;
}

- (id)materialKeyColor
{
  return +[PBBridgeWatchAttributeController materialKeyColorForMaterial:self->_material];
}

- (unint64_t)size
{
  return SizeForInternalSize(self->_internalSize);
}

- (unint64_t)fallbackMaterialForSize:(unint64_t)a3
{
  unint64_t v3 = 3;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x14) {
    unint64_t v3 = 22;
  }
  if (a3 == 19) {
    return 14;
  }
  else {
    return v3;
  }
}

- (void)setInternalSize:(unint64_t)a3
{
  self->_internalSize = a3;
  if (a3 - 3 > 0x15) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = qword_21C4944B8[a3 - 3];
  }
  self->_unint64_t hardwareBehavior = v3;
}

- (void)setMaterial:(unint64_t)a3
{
  self->_unint64_t material = a3;
  if (a3 - 1 > 0x25) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = qword_21C4946C8[a3 - 1];
  }
  self->_unint64_t edition = v3;
}

+ (unint64_t)materialFromDevice:(id)a3
{
  id v4 = a3;
  double v5 = [v4 valueForProperty:*MEMORY[0x263F57570]];
  uint64_t v6 = [v5 integerValue];
  if (v6)
  {
    unint64_t v7 = [a1 _materialForCLHSValue:v6];
  }
  else
  {
    BOOL v8 = [v4 valueForProperty:*MEMORY[0x263F57578]];
    unint64_t v9 = [v8 objectForKeyedSubscript:&unk_26CCA1580];
    unint64_t v7 = [v9 integerValue];
  }
  return v7;
}

+ (unint64_t)sizeFromDevice:(id)a3
{
  id v3 = a3;
  id v4 = [v3 valueForProperty:*MEMORY[0x263F57568]];
  int v5 = [v4 intValue];

  uint64_t v6 = [v3 valueForProperty:*MEMORY[0x263F57548]];
  if (MGGetBoolAnswer() && v6)
  {
    unint64_t v7 = [v6 objectForKeyedSubscript:@"ArtworkDeviceSubType"];
    [v7 unsignedIntegerValue];
    switch(NRDeviceSizeForArtworkDeviceSubType())
    {
      case 1u:
        goto LABEL_5;
      case 2u:
        goto LABEL_9;
      case 3u:
        goto LABEL_12;
      case 4u:
        goto LABEL_15;
      case 5u:
        goto LABEL_18;
      case 6u:
        goto LABEL_21;
      case 7u:
        goto LABEL_24;
      case 8u:
        goto LABEL_25;
      case 9u:
        goto LABEL_26;
      default:
        goto LABEL_8;
    }
  }
  unint64_t v7 = [v3 valueForProperty:*MEMORY[0x263F57628]];
  switch(NRDeviceSizeForProductType())
  {
    case 1u:
LABEL_5:
      uint64_t v8 = 5;
      if (v5 != 2) {
        uint64_t v8 = 1;
      }
      BOOL v9 = v5 == 1;
      uint64_t v10 = 3;
      goto LABEL_27;
    case 2u:
LABEL_9:
      uint64_t v8 = 2;
      if (v5 == 2) {
        uint64_t v8 = 6;
      }
      BOOL v9 = v5 == 1;
      uint64_t v10 = 4;
      goto LABEL_27;
    case 3u:
LABEL_12:
      uint64_t v8 = 7;
      if (v5 == 2) {
        uint64_t v8 = 11;
      }
      BOOL v9 = v5 == 1;
      uint64_t v10 = 9;
      goto LABEL_27;
    case 4u:
LABEL_15:
      uint64_t v8 = 8;
      if (v5 == 2) {
        uint64_t v8 = 12;
      }
      BOOL v9 = v5 == 1;
      uint64_t v10 = 10;
      goto LABEL_27;
    case 5u:
LABEL_18:
      uint64_t v8 = 14;
      if (v5 == 2) {
        uint64_t v8 = 18;
      }
      BOOL v9 = v5 == 1;
      uint64_t v10 = 16;
      goto LABEL_27;
    case 6u:
LABEL_21:
      uint64_t v8 = 13;
      if (v5 == 2) {
        uint64_t v8 = 17;
      }
      BOOL v9 = v5 == 1;
      uint64_t v10 = 15;
      goto LABEL_27;
    case 7u:
LABEL_24:
      BOOL v9 = v5 == 1;
      uint64_t v8 = 19;
      uint64_t v10 = 24;
      goto LABEL_27;
    case 8u:
LABEL_25:
      BOOL v9 = v5 == 1;
      uint64_t v8 = 20;
      uint64_t v10 = 22;
      goto LABEL_27;
    case 9u:
LABEL_26:
      BOOL v9 = v5 == 1;
      uint64_t v8 = 21;
      uint64_t v10 = 23;
LABEL_27:
      if (v9) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = v8;
      }
      break;
    default:
LABEL_8:
      uint64_t v11 = 0;
      break;
  }

  unint64_t v12 = SizeForInternalSize(v11);
  return v12;
}

+ (unint64_t)materialFromPdrDevice:(id)a3
{
  id v4 = a3;
  int v5 = [v4 valueForProperty:*MEMORY[0x263F5BAE8]];
  uint64_t v6 = [v5 integerValue];
  if (v6)
  {
    unint64_t v7 = [a1 _materialForCLHSValue:v6];
  }
  else
  {
    uint64_t v8 = [v4 valueForProperty:*MEMORY[0x263F5BAF0]];
    BOOL v9 = [v8 objectForKeyedSubscript:&unk_26CCA1580];
    unint64_t v7 = [v9 integerValue];
  }
  return v7;
}

+ (unint64_t)sizeFromPdrDevice:(id)a3
{
  uint64_t v3 = *MEMORY[0x263F5BAE0];
  id v4 = a3;
  int v5 = [v4 valueForProperty:v3];
  int v6 = [v5 intValue];

  unint64_t v7 = [v4 valueForProperty:*MEMORY[0x263F5BB10]];

  switch(NRDeviceSizeForProductType())
  {
    case 1u:
      uint64_t v8 = 5;
      if (v6 != 2) {
        uint64_t v8 = 1;
      }
      BOOL v9 = v6 == 1;
      uint64_t v10 = 3;
      goto LABEL_24;
    case 2u:
      uint64_t v8 = 2;
      if (v6 == 2) {
        uint64_t v8 = 6;
      }
      BOOL v9 = v6 == 1;
      uint64_t v10 = 4;
      goto LABEL_24;
    case 3u:
      uint64_t v8 = 7;
      if (v6 == 2) {
        uint64_t v8 = 11;
      }
      BOOL v9 = v6 == 1;
      uint64_t v10 = 9;
      goto LABEL_24;
    case 4u:
      uint64_t v8 = 8;
      if (v6 == 2) {
        uint64_t v8 = 12;
      }
      BOOL v9 = v6 == 1;
      uint64_t v10 = 10;
      goto LABEL_24;
    case 5u:
      uint64_t v8 = 14;
      if (v6 == 2) {
        uint64_t v8 = 18;
      }
      BOOL v9 = v6 == 1;
      uint64_t v10 = 16;
      goto LABEL_24;
    case 6u:
      uint64_t v8 = 13;
      if (v6 == 2) {
        uint64_t v8 = 17;
      }
      BOOL v9 = v6 == 1;
      uint64_t v10 = 15;
      goto LABEL_24;
    case 7u:
      BOOL v9 = v6 == 1;
      uint64_t v8 = 19;
      uint64_t v10 = 24;
      goto LABEL_24;
    case 8u:
      BOOL v9 = v6 == 1;
      uint64_t v8 = 20;
      uint64_t v10 = 22;
      goto LABEL_24;
    case 9u:
      BOOL v9 = v6 == 1;
      uint64_t v8 = 21;
      uint64_t v10 = 23;
LABEL_24:
      if (v9) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = v8;
      }
      break;
    default:
      uint64_t v11 = 0;
      break;
  }

  return SizeForInternalSize(v11);
}

+ (unsigned)sizeFromInternalSize:(unint64_t)a3
{
  if (a3 - 1 > 0x17) {
    return 0;
  }
  else {
    return word_21C494568[a3 - 1];
  }
}

+ (int64_t)pdrSizeFromInternalSize:(unint64_t)a3
{
  return +[PBBridgeWatchAttributeController sizeFromInternalSize:a3];
}

+ (unint64_t)_materialForCLHSValue:(unint64_t)a3
{
  if (a3 - 2 > 0x25) {
    return 3;
  }
  else {
    return qword_21C494598[a3 - 2];
  }
}

- (void)_setMaterialWithCLHSValue:(unint64_t)a3
{
  unint64_t v4 = +[PBBridgeWatchAttributeController _materialForCLHSValue:a3];
  self->_unint64_t material = v4;
  if (v4 - 1 > 0x25) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = qword_21C4946C8[v4 - 1];
  }
  self->_unint64_t edition = v5;
}

- (unint64_t)edition
{
  return self->_edition;
}

- (unint64_t)material
{
  return self->_material;
}

- (unint64_t)internalSize
{
  return self->_internalSize;
}

- (unint64_t)hardwareBehavior
{
  return self->_hardwareBehavior;
}

- (NRDevice)device
{
  return self->_device;
}

- (NSCache)stringCache
{
  return self->_stringCache;
}

- (void)setStringCache:(id)a3
{
}

- (unint64_t)stingButtonColor
{
  return self->_stingButtonColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringCache, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end