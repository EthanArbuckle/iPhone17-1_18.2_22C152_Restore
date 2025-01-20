@interface SCROMobileBrailleDisplayInputManager
+ (SCROMobileBrailleDisplayInputManager)sharedManager;
- (SCROMobileBrailleDisplayInputManager)init;
- (__CFString)defaultsKeyForModelIdentifier:(id)a3;
- (id)_bundle;
- (id)_commandForHidUsage:(id)a3;
- (id)_commandsFromBrailleInputMode:(int)a3;
- (id)_eightDotCommands;
- (id)_sixDotCommands;
- (id)_updatedCommandDictionaryForCommandDictionary:(id)a3;
- (id)_updatedCommandForCommand:(id)a3;
- (id)buttonNamesAtIndex:(unint64_t)a3 forDisplayWithToken:(int)a4;
- (id)buttonNamesForInputIdentifier:(id)a3 forDisplayWithToken:(int)a4;
- (id)commandAtIndex:(unint64_t)a3 forDisplayWithToken:(int)a4;
- (id)commandDictionaryForDisplayWithToken:(int)a3;
- (id)commandForBrailleKey:(id)a3;
- (id)driverIdentifierForDisplayWithToken:(int)a3;
- (id)inputIdentifierAtIndex:(unint64_t)a3 forDisplayWithToken:(int)a4;
- (id)modelIdentifierForDisplayWithToken:(int)a3;
- (id)userDefaultsForModelIdentifier:(id)a3;
- (unint64_t)countForDisplayWithToken:(int)a3;
- (unint64_t)userAssignedCommandCountForDisplayWithToken:(int)a3;
- (void)configureWithDriverConfiguration:(id)a3;
- (void)removeAllUserAssignedCommandsForDisplayWithToken:(int)a3;
- (void)setCommand:(id)a3 forBrailleKey:(id)a4;
- (void)setCommand:(id)a3 forInputIdentifier:(id)a4 forDisplayWithToken:(int)a5;
- (void)setUserDefaults:(id)a3 forModelIdentifier:(id)a4;
@end

@implementation SCROMobileBrailleDisplayInputManager

+ (SCROMobileBrailleDisplayInputManager)sharedManager
{
  if (sharedManager_onceToken_0 != -1) {
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_8);
  }
  v2 = (void *)_sharedManager_0;

  return (SCROMobileBrailleDisplayInputManager *)v2;
}

uint64_t __53__SCROMobileBrailleDisplayInputManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(SCROMobileBrailleDisplayInputManager);
  _sharedManager_0 = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0);
}

- (id)_bundle
{
  bundle = self->_bundle;
  if (!bundle)
  {
    v4 = (void *)MEMORY[0x263F086E0];
    v5 = self;
    v6 = [v4 bundleForClass:v5];
    v7 = self->_bundle;
    self->_bundle = v6;

    bundle = self->_bundle;
  }

  return bundle;
}

- (SCROMobileBrailleDisplayInputManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)SCROMobileBrailleDisplayInputManager;
  v2 = [(SCROMobileBrailleDisplayInputManager *)&v15 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    displayInfoDict = v2->_displayInfoDict;
    v2->_displayInfoDict = v3;

    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    int v6 = 0;
    unsigned int v7 = 65538;
    do
    {
      unsigned int v7 = v6 | v7 & 0xFFFF00FF;
      v8 = [NSNumber numberWithUnsignedInteger:v7];
      v9 = [v8 stringValue];
      [v5 addObject:v9];

      v6 += 256;
    }
    while (v6 != 3584);
    uint64_t v10 = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:v5];
    brailleKeys = v2->_brailleKeys;
    v2->_brailleKeys = (NSSet *)v10;

    uint64_t v12 = objc_opt_new();
    contentLock = v2->_contentLock;
    v2->_contentLock = (NSLock *)v12;
  }
  return v2;
}

- (void)configureWithDriverConfiguration:(id)a3
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v58 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v60 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v59 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [(NSLock *)self->_contentLock lock];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v62 = self;
  id v5 = self->_displayInfoDict;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v68 objects:v77 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v69 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [(NSMutableDictionary *)v62->_displayInfoDict objectForKey:*(void *)(*((void *)&v68 + 1) + 8 * i)];
        v11 = [v10 driverIdentifier];
        uint64_t v12 = [v10 modelIdentifier];
        if (v11)
        {
          v13 = [v10 bundle];
          if (v13) {
            [v58 setObject:v13 forKey:v11];
          }
        }
        if (v12)
        {
          v14 = [v10 commandDictionary];
          if (v14) {
            [v59 setObject:v14 forKey:v12];
          }
          objc_super v15 = [v10 orderedIdentifiers];
          if (v15) {
            [v60 setObject:v15 forKey:v12];
          }
        }
      }
      uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v68 objects:v77 count:16];
    }
    while (v7);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  obuint64_t j = v4;
  uint64_t v16 = [obj countByEnumeratingWithState:&v64 objects:v76 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v65;
    uint64_t v49 = *(void *)v65;
    do
    {
      uint64_t v19 = 0;
      uint64_t v50 = v17;
      do
      {
        if (*(void *)v65 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v64 + 1) + 8 * v19);
        v21 = [v20 objectForKey:kSCROBrailleDisplayToken[0]];
        if (v21)
        {
          id v63 = v21;
          v22 = [v20 objectForKey:kSCROBrailleDisplayBrailleInputMode[0]];
          uint64_t v61 = [v22 integerValue];

          v23 = [v20 objectForKey:kSCROBrailleDisplayDriverIdentifier[0]];
          if ([v23 length])
          {
            v55 = v20;
            v24 = [v20 objectForKey:kSCROBrailleDisplayModelIdentifier[0]];
            if ([v24 length])
            {
              v53 = v23;
              v25 = [v58 objectForKey:v23];
              if (!v25)
              {
                v25 = [MEMORY[0x263F086E0] brailleDriverBundleWithIdentifier:v53];
                if (v25) {
                  [v58 setObject:v25 forKey:v53];
                }
              }
              id v26 = [v59 objectForKey:v24];
              if (!v26)
              {
                id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
                [v59 setObject:v26 forKey:v24];
              }
              uint64_t v51 = v19;
              id v27 = [v60 objectForKey:v24];
              uint64_t v28 = v61;
              if (!v27)
              {
                id v27 = objc_alloc_init(MEMORY[0x263EFF980]);
                [v60 setObject:v27 forKey:v24];
              }
              v54 = [(SCROMobileBrailleDisplayInputManager *)v62 _commandsFromBrailleInputMode:v61];
              id v56 = v24;
              id v57 = v25;
              id v29 = v26;
              id v30 = v27;
              v31 = v30;
              if (v29 && v30)
              {
                v48 = v24;
                [v29 removeAllObjects];
                [v31 removeAllObjects];
                v32 = [NSString stringWithFormat:@"%@-mobile", v56];
                uint64_t v33 = [v57 pathForResource:v32 ofType:@"plist"];

                if (!v33
                  || (id v34 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithContentsOfFile:v33]) == 0)
                {
                  uint64_t v35 = [v57 pathForResource:v56 ofType:@"plist"];
                  if (!v35
                    || (v36 = (void *)v35,
                        id v34 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithContentsOfFile:v35],
                        v36,
                        !v34))
                  {
                    id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
                  }
                }
                v47 = (void *)v33;
                [v34 addObjectsFromArray:v54];
                long long v74 = 0u;
                long long v75 = 0u;
                long long v72 = 0u;
                long long v73 = 0u;
                id v37 = v34;
                uint64_t v38 = [v37 countByEnumeratingWithState:&v72 objects:v78 count:16];
                if (v38)
                {
                  uint64_t v39 = v38;
                  uint64_t v40 = *(void *)v73;
                  do
                  {
                    for (uint64_t j = 0; j != v39; ++j)
                    {
                      if (*(void *)v73 != v40) {
                        objc_enumerationMutation(v37);
                      }
                      v42 = *(void **)(*((void *)&v72 + 1) + 8 * j);
                      v43 = [v42 objectForKey:@"SCRBrailleInputIdentifier"];
                      if (v43)
                      {
                        v44 = [v42 objectForKey:@"SCRCommand"];
                        if (v44) {
                          [v29 setObject:v44 forKey:v43];
                        }
                        [v31 addObject:v43];
                      }
                    }
                    uint64_t v39 = [v37 countByEnumeratingWithState:&v72 objects:v78 count:16];
                  }
                  while (v39);
                }

                v24 = v48;
                uint64_t v28 = v61;
              }

              v45 = objc_alloc_init(SCROMobileBrailleDisplayInputManagerCacheObject);
              [(SCROMobileBrailleDisplayInputManagerCacheObject *)v45 setDriverIdentifier:v53];
              [(SCROMobileBrailleDisplayInputManagerCacheObject *)v45 setModelIdentifier:v56];
              [(SCROMobileBrailleDisplayInputManagerCacheObject *)v45 setCommandDictionary:v29];
              [(SCROMobileBrailleDisplayInputManagerCacheObject *)v45 setBundle:v57];
              [(SCROMobileBrailleDisplayInputManagerCacheObject *)v45 setBrailleInputMode:v28];
              v46 = [v55 objectForKeyedSubscript:kSCROBrailleDisplayBrailleProductName[0]];
              [(SCROMobileBrailleDisplayInputManagerCacheObject *)v45 setProductName:v46];

              [(NSMutableDictionary *)v62->_displayInfoDict setObject:v45 forKey:v63];
              v23 = v53;

              uint64_t v18 = v49;
              uint64_t v17 = v50;
              uint64_t v19 = v51;
            }
          }
          v21 = v63;
        }

        ++v19;
      }
      while (v19 != v17);
      uint64_t v17 = [obj countByEnumeratingWithState:&v64 objects:v76 count:16];
    }
    while (v17);
  }

  [(NSLock *)v62->_contentLock unlock];
}

- (id)commandDictionaryForDisplayWithToken:(int)a3
{
  [(NSLock *)self->_contentLock lock];
  id v5 = NSNumber;
  uint64_t v6 = self->_displayInfoDict;
  uint64_t v7 = [v5 numberWithInteger:a3];
  uint64_t v8 = [(NSMutableDictionary *)v6 objectForKey:v7];

  v9 = [v8 commandDictionary];
  uint64_t v10 = (void *)[v9 mutableCopy];

  v11 = [v8 modelIdentifier];
  uint64_t v12 = [(SCROMobileBrailleDisplayInputManager *)self userDefaultsForModelIdentifier:v11];
  [v10 setValuesForKeysWithDictionary:v12];

  [(NSLock *)self->_contentLock unlock];
  v13 = [(SCROMobileBrailleDisplayInputManager *)self _updatedCommandDictionaryForCommandDictionary:v10];

  return v13;
}

- (id)driverIdentifierForDisplayWithToken:(int)a3
{
  [(NSLock *)self->_contentLock lock];
  id v5 = NSNumber;
  uint64_t v6 = self->_displayInfoDict;
  uint64_t v7 = [v5 numberWithInteger:a3];
  uint64_t v8 = [(NSMutableDictionary *)v6 objectForKey:v7];

  v9 = [v8 driverIdentifier];
  [(NSLock *)self->_contentLock unlock];

  return v9;
}

- (id)modelIdentifierForDisplayWithToken:(int)a3
{
  [(NSLock *)self->_contentLock lock];
  id v5 = NSNumber;
  uint64_t v6 = self->_displayInfoDict;
  uint64_t v7 = [v5 numberWithInteger:a3];
  uint64_t v8 = [(NSMutableDictionary *)v6 objectForKey:v7];

  v9 = [v8 modelIdentifier];
  [(NSLock *)self->_contentLock unlock];

  return v9;
}

- (id)_commandForHidUsage:(id)a3
{
  uint64_t v3 = _commandForHidUsage__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_commandForHidUsage__onceToken, &__block_literal_global_83);
  }
  id v5 = [v4 identifier];

  unsigned __int16 v6 = [v5 integerValue];
  if ((v6 & 0xF) == 6) {
    uint64_t v7 = v6 >> 4;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = (void *)_commandForHidUsage__hidCommandToCommandMap;
  v9 = [NSNumber numberWithUnsignedInt:v7];
  uint64_t v10 = [v8 objectForKey:v9];

  return v10;
}

void __60__SCROMobileBrailleDisplayInputManager__commandForHidUsage___block_invoke()
{
  v3[70] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26CCF11C8;
  v2[1] = &unk_26CCF11E0;
  v3[0] = @"VOTEventCommandBrailleNextInputTable";
  v3[1] = @"VOTEventCommandBrailleNextOutputTable";
  v2[2] = &unk_26CCF11F8;
  v2[3] = &unk_26CCF1210;
  v3[2] = @"VOTEventCommandBraillePanLeft";
  v3[3] = @"VOTEventCommandBraillePanRight";
  v2[4] = &unk_26CCF1228;
  v2[5] = &unk_26CCF1240;
  v3[4] = @"VOTEventCommandBraillePanLeft";
  v3[5] = @"VOTEventCommandBraillePanRight";
  v2[6] = &unk_26CCF1258;
  v2[7] = &unk_26CCF1270;
  v3[6] = @"VOTEventCommandDelete";
  v3[7] = @"VOTEventCommandReturn";
  v2[8] = &unk_26CCF1288;
  v2[9] = &unk_26CCF12A0;
  v3[8] = @"VOTEventCommandEscape";
  v3[9] = @"VOTEventCommandMoveToStatusBar";
  v2[10] = &unk_26CCF12B8;
  v2[11] = &unk_26CCF12D0;
  v3[10] = @"VOTEventCommandFirstElement";
  v3[11] = @"VOTEventCommandLastElement";
  v2[12] = &unk_26CCF12E8;
  v2[13] = &unk_26CCF1300;
  v3[12] = @"VOTEventCommandPreviousElement";
  v3[13] = @"VOTEventCommandNextElement";
  v2[14] = &unk_26CCF1318;
  v2[15] = &unk_26CCF1330;
  v3[14] = @"VOTEventCommandReadFromTop";
  v3[15] = @"VOTEventCommandReadAll";
  v2[16] = &unk_26CCF1348;
  v2[17] = &unk_26CCF1360;
  v3[16] = @"VOTEventCommandScrollLeftPage";
  v3[17] = @"VOTEventCommandScrollRightPage";
  v2[18] = &unk_26CCF1378;
  v2[19] = &unk_26CCF1390;
  v3[18] = @"VOTEventCommandScrollUpPage";
  v3[19] = @"VOTEventCommandScrollDownPage";
  v2[20] = &unk_26CCF13A8;
  v2[21] = &unk_26CCF13C0;
  v3[20] = @"VOTEventCommandSearchRotorRight";
  v3[21] = @"VOTEventCommandSearchRotorLeft";
  v2[22] = &unk_26CCF13D8;
  v2[23] = &unk_26CCF13F0;
  v3[22] = @"VOTEventCommandSearchRotorUp";
  v3[23] = @"VOTEventCommandSearchRotorDown";
  v2[24] = &unk_26CCF1408;
  v2[25] = &unk_26CCF1420;
  v3[24] = @"VOTEventCommandSimpleTap";
  v3[25] = @"VOTEventCommandToggleSpeaking";
  v2[26] = &unk_26CCF1438;
  v2[27] = &unk_26CCF1450;
  v3[26] = @"VOTEventCommandStartStopToggle";
  v3[27] = @"VOTEventCommandHomeButtonPress";
  v2[28] = &unk_26CCF1468;
  v2[29] = &unk_26CCF1480;
  v3[28] = @"VOTEventCommandBottomEdgeSingleSwipe";
  v3[29] = @"VOTEventCommandMoveToStatusBar";
  v2[30] = &unk_26CCF1498;
  v2[31] = &unk_26CCF14B0;
  v3[30] = @"VOTEventCommandNextHeading";
  v3[31] = @"VOTEventCommandPreviousHeading";
  v2[32] = &unk_26CCF14C8;
  v2[33] = &unk_26CCF14E0;
  v3[32] = @"VOTEventCommandNextGraphic";
  v3[33] = @"VOTEventCommandPreviousGraphic";
  v2[34] = &unk_26CCF14F8;
  v2[35] = &unk_26CCF1510;
  v3[34] = @"VOTEventCommandNextTable";
  v3[35] = @"VOTEventCommandPreviousTable";
  v2[36] = &unk_26CCF1528;
  v2[37] = &unk_26CCF1540;
  v3[36] = @"VOTEventCommandNextList";
  v3[37] = @"VOTEventCommandPreviousList";
  v2[38] = &unk_26CCF1558;
  v2[39] = &unk_26CCF1570;
  v3[38] = @"VOTEventCommandNextControl";
  v3[39] = @"VOTEventCommandPreviousControl";
  v2[40] = &unk_26CCF1588;
  v2[41] = &unk_26CCF15A0;
  v3[40] = @"VOTEventCommandNextBlockquote";
  v3[41] = @"VOTEventCommandPreviousBlockquote";
  v2[42] = &unk_26CCF15B8;
  v2[43] = &unk_26CCF15D0;
  v3[42] = @"VOTEventCommandNextSameBlockquote";
  v3[43] = @"VOTEventCommandPreviousSameBlockquote";
  v2[44] = &unk_26CCF15E8;
  v2[45] = &unk_26CCF1600;
  v3[44] = @"VOTEventCommandNextLink";
  v3[45] = @"VOTEventCommandPreviousLink";
  v2[46] = &unk_26CCF1618;
  v2[47] = &unk_26CCF1630;
  v3[46] = @"VOTEventCommandNextVisitedLink";
  v3[47] = @"VOTEventCommandPreviousVisitedLink";
  v2[48] = &unk_26CCF1648;
  v2[49] = &unk_26CCF1660;
  v3[48] = @"VOTEventCommandNextSameHeading";
  v3[49] = @"VOTEventCommandPreviousSameHeading";
  v2[50] = &unk_26CCF1678;
  v2[51] = &unk_26CCF1690;
  v3[50] = @"VOTEventCommandNextBoldText";
  v3[51] = @"VOTEventCommandPreviousBoldText";
  v2[52] = &unk_26CCF16A8;
  v2[53] = &unk_26CCF16C0;
  v3[52] = @"VOTEventCommandNextItalicText";
  v3[53] = @"VOTEventCommandPreviousItalicText";
  v2[54] = &unk_26CCF16D8;
  v2[55] = &unk_26CCF16F0;
  v3[54] = @"VOTEventCommandNextUnderlineText";
  v3[55] = @"VOTEventCommandPreviousUnderlineText";
  v2[56] = &unk_26CCF1708;
  v2[57] = &unk_26CCF1720;
  v3[56] = @"VOTEventCommandNextMisspelledWord";
  v3[57] = @"VOTEventCommandPreviousMisspelledWord";
  v2[58] = &unk_26CCF1738;
  v2[59] = &unk_26CCF1750;
  v3[58] = @"VOTEventCommandNextPlainText";
  v3[59] = @"VOTEventCommandPreviousPlainText";
  v2[60] = &unk_26CCF1768;
  v2[61] = &unk_26CCF1780;
  v3[60] = @"VOTEventCommandNextColorChange";
  v3[61] = @"VOTEventCommandPreviousColorChange";
  v2[62] = &unk_26CCF1798;
  v2[63] = &unk_26CCF17B0;
  v3[62] = @"VOTEventCommandNextFontChange";
  v3[63] = @"VOTEventCommandPreviousFontChange";
  v2[64] = &unk_26CCF17C8;
  v3[64] = @"VOTEventCommandNextStyleChange";
  v2[65] = &unk_26CCF17E0;
  v3[65] = @"VOTEventCommandPreviousStyleChange";
  v2[66] = &unk_26CCF17F8;
  v3[66] = @"VOTEventCommandNextSameElement";
  v2[67] = &unk_26CCF1810;
  v3[67] = @"VOTEventCommandPreviousSameElement";
  v2[68] = &unk_26CCF1828;
  v3[68] = @"VOTEventCommandNextDifferentElement";
  v2[69] = &unk_26CCF1840;
  v3[69] = @"VOTEventCommandPreviousDifferentElement";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:70];
  v1 = (void *)_commandForHidUsage__hidCommandToCommandMap;
  _commandForHidUsage__hidCommandToCommandMap = v0;
}

- (id)_updatedCommandForCommand:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"VOTEventCommandBrailleNextInputMode"])
  {
    id v4 = @"VOTEventCommandBrailleNextInputTable";
  }
  else if ([v3 isEqualToString:@"VOTEventCommandBrailleNextOutputMode"])
  {
    id v4 = @"VOTEventCommandBrailleNextOutputTable";
  }
  else
  {
    id v4 = (__CFString *)v3;
  }

  return v4;
}

- (id)_updatedCommandDictionaryForCommandDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v15);
        v13 = [(SCROMobileBrailleDisplayInputManager *)self _updatedCommandForCommand:v12];
        [v5 setObject:v13 forKeyedSubscript:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)commandForBrailleKey:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_contentLock lock];
  displayInfoDict = self->_displayInfoDict;
  uint64_t v6 = (int)[v4 displayToken];
  uint64_t v7 = NSNumber;
  uint64_t v8 = displayInfoDict;
  uint64_t v9 = [v7 numberWithInteger:v6];
  uint64_t v10 = [(NSMutableDictionary *)v8 objectForKey:v9];

  uint64_t v11 = [v10 modelIdentifier];
  uint64_t v12 = [v10 commandDictionary];
  v13 = (void *)[v12 copy];

  [(NSLock *)self->_contentLock unlock];
  v14 = [(SCROMobileBrailleDisplayInputManager *)self userDefaultsForModelIdentifier:v11];
  long long v15 = [v4 identifier];
  long long v16 = [v14 objectForKey:v15];

  if (v16)
  {
    long long v17 = [(SCROMobileBrailleDisplayInputManager *)self _updatedCommandForCommand:v16];
  }
  else
  {
    long long v18 = [v4 identifier];
    uint64_t v19 = [v13 objectForKey:v18];

    if (!v19)
    {
      uint64_t v19 = [(SCROMobileBrailleDisplayInputManager *)self _commandForHidUsage:v4];
    }
    long long v17 = [(SCROMobileBrailleDisplayInputManager *)self _updatedCommandForCommand:v19];
  }

  return v17;
}

- (void)setCommand:(id)a3 forBrailleKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v6 identifier];
  uint64_t v8 = [v6 displayToken];

  [(SCROMobileBrailleDisplayInputManager *)self setCommand:v7 forInputIdentifier:v9 forDisplayWithToken:v8];
}

- (id)buttonNamesForInputIdentifier:(id)a3 forDisplayWithToken:(int)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(SCROMobileBrailleDisplayInputManager *)self _bundle];
  if ([v6 hasPrefix:@"unassigned"])
  {
    uint64_t v8 = (void *)MEMORY[0x263EFF8C0];
    id v9 = [v7 localizedStringForKey:@"unassigned" value:&stru_26CCE0B50 table:@"Client"];
    uint64_t v10 = [v8 arrayWithObject:v9];
  }
  else
  {
    [(NSLock *)self->_contentLock lock];
    uint64_t v11 = NSNumber;
    uint64_t v12 = self->_displayInfoDict;
    v13 = [v11 numberWithInteger:a4];
    v14 = [(NSMutableDictionary *)v12 objectForKey:v13];

    long long v15 = [v14 bundle];
    v46 = [v14 driverIdentifier];
    uint64_t v49 = [v14 modelIdentifier];
    v42 = v14;
    v45 = [v14 productName];
    [(NSLock *)self->_contentLock unlock];
    long long v16 = _SCROD_LOG();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v57 = v6;
      __int16 v58 = 2112;
      id v59 = v49;
      __int16 v60 = 2112;
      uint64_t v61 = v45;
      _os_log_impl(&dword_21C66E000, v16, OS_LOG_TYPE_DEFAULT, "Button name %@ for %@ %@", buf, 0x20u);
    }

    long long v17 = [v6 componentsSeparatedByString:@"."];
    id v44 = v6;
    uint64_t v50 = v7;
    if ([v17 count])
    {
      uint64_t v10 = [MEMORY[0x263EFF980] array];
    }
    else
    {
      uint64_t v10 = 0;
    }
    v43 = v15;
    v48 = [v15 localizedInfoDictionary];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    obuint64_t j = v17;
    uint64_t v18 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v52 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if ([(NSSet *)self->_brailleKeys containsObject:v22])
          {
            v23 = [@"braille.key" stringByAppendingPathExtension:v22];
            v24 = [v50 localizedStringForKey:v23 value:&stru_26CCE0B50 table:@"Client"];
          }
          else
          {
            v23 = 0;
            v24 = 0;
          }
          if (![v24 length])
          {
            uint64_t v25 = [v49 stringByAppendingPathExtension:v22];

            if (v25)
            {
              uint64_t v26 = [v48 objectForKey:v25];

              v23 = (void *)v25;
              v24 = (void *)v26;
            }
            else
            {
              v23 = 0;
            }
          }
          if (![v24 length])
          {
            uint64_t v27 = [v46 stringByAppendingPathExtension:v22];

            if (v27)
            {
              uint64_t v28 = [v48 objectForKey:v27];

              v23 = (void *)v27;
              v24 = (void *)v28;
            }
            else
            {
              v23 = 0;
            }
          }
          if (![v24 length])
          {
            unsigned int v29 = [v22 integerValue];
            int v30 = (v29 >> 17) & 3;
            if (v30)
            {
              if (v30 == 3)
              {
                v31 = @"HID.joystick.key";
              }
              else if (v30 == 2)
              {
                v31 = @"HID.rocker.key";
              }
              else
              {
                v31 = @"HID.button.key";
              }
              v32 = [v50 localizedStringForKey:v31 value:&stru_26CCE0B50 table:@"Client"];
              BOOL v41 = (v29 & 0xFF000000) != 0;
              uint64_t v33 = SCRCFormattedString();

              v24 = (void *)v33;
            }
          }
          if (!objc_msgSend(v24, "length", v41))
          {
            if ([v49 isEqualToString:@"com.apple.generic.hid.mobile"])
            {
              char v34 = [v45 hasPrefix:@"Brailliant BI"];
              uint64_t v35 = @"com.apple.scrod.braille.driver.humanware.brailliant.BI";
              if ((v34 & 1) != 0
                || (int v36 = [v45 hasPrefix:@"NLS eReader Humanware"],
                    uint64_t v35 = @"com.apple.scrod.braille.driver.nls.ereader",
                    v36))
              {
                id v37 = [(__CFString *)v35 stringByAppendingPathExtension:v22];
                uint64_t v38 = [v48 objectForKey:v37];

                v24 = (void *)v38;
              }
            }
          }
          if (![v24 length])
          {
            id v39 = v22;

            v24 = v39;
          }
          [v10 addObject:v24];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v19);
    }

    id v6 = v44;
    id v7 = v50;
  }

  return v10;
}

- (void)setCommand:(id)a3 forInputIdentifier:(id)a4 forDisplayWithToken:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v12 = a3;
  id v8 = a4;
  id v9 = [(SCROMobileBrailleDisplayInputManager *)self modelIdentifierForDisplayWithToken:v5];
  uint64_t v10 = [(SCROMobileBrailleDisplayInputManager *)self userDefaultsForModelIdentifier:v9];
  uint64_t v11 = (void *)[v10 mutableCopy];

  if (v12) {
    [v11 setObject:v12 forKey:v8];
  }
  else {
    [v11 removeObjectForKey:v8];
  }

  [(SCROMobileBrailleDisplayInputManager *)self setUserDefaults:v11 forModelIdentifier:v9];
}

- (void)removeAllUserAssignedCommandsForDisplayWithToken:(int)a3
{
  id v4 = [(SCROMobileBrailleDisplayInputManager *)self modelIdentifierForDisplayWithToken:*(void *)&a3];
  [(SCROMobileBrailleDisplayInputManager *)self setUserDefaults:MEMORY[0x263EFFA78] forModelIdentifier:v4];
}

- (unint64_t)userAssignedCommandCountForDisplayWithToken:(int)a3
{
  id v4 = [(SCROMobileBrailleDisplayInputManager *)self modelIdentifierForDisplayWithToken:*(void *)&a3];
  uint64_t v5 = [(SCROMobileBrailleDisplayInputManager *)self userDefaultsForModelIdentifier:v4];
  unint64_t v6 = [v5 count];

  return v6;
}

- (id)_sixDotCommands
{
  sixDotCommands = self->_sixDotCommands;
  if (!sixDotCommands)
  {
    id v4 = [(SCROMobileBrailleDisplayInputManager *)self _bundle];
    uint64_t v5 = [v4 pathForResource:@"6dot.mobile.commands" ofType:@"plist"];

    if (v5)
    {
      unint64_t v6 = (NSArray *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithContentsOfFile:v5];
      id v7 = self->_sixDotCommands;
      self->_sixDotCommands = v6;
    }
    sixDotCommands = self->_sixDotCommands;
  }

  return sixDotCommands;
}

- (id)_eightDotCommands
{
  eightDotCommands = self->_eightDotCommands;
  if (!eightDotCommands)
  {
    id v4 = [(SCROMobileBrailleDisplayInputManager *)self _bundle];
    uint64_t v5 = [v4 pathForResource:@"8dot.mobile.commands" ofType:@"plist"];

    if (v5)
    {
      unint64_t v6 = (NSArray *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithContentsOfFile:v5];
      id v7 = self->_eightDotCommands;
      self->_eightDotCommands = v6;
    }
    eightDotCommands = self->_eightDotCommands;
  }

  return eightDotCommands;
}

- (id)_commandsFromBrailleInputMode:(int)a3
{
  if (a3 == 2)
  {
    id v4 = [MEMORY[0x263EFF980] array];
    unint64_t v6 = [(SCROMobileBrailleDisplayInputManager *)self _sixDotCommands];
    [v4 addObjectsFromArray:v6];

    uint64_t v5 = [(SCROMobileBrailleDisplayInputManager *)self _eightDotCommands];
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    id v4 = [MEMORY[0x263EFF980] array];
    uint64_t v5 = [(SCROMobileBrailleDisplayInputManager *)self _sixDotCommands];
LABEL_5:
    id v7 = (void *)v5;
    [v4 addObjectsFromArray:v5];

    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

- (unint64_t)countForDisplayWithToken:(int)a3
{
  [(NSLock *)self->_contentLock lock];
  uint64_t v5 = NSNumber;
  unint64_t v6 = self->_displayInfoDict;
  id v7 = [v5 numberWithInteger:a3];
  id v8 = [(NSMutableDictionary *)v6 objectForKey:v7];

  id v9 = [v8 orderedIdentifiers];
  unint64_t v10 = [v9 count];

  [(NSLock *)self->_contentLock unlock];
  return v10;
}

- (id)inputIdentifierAtIndex:(unint64_t)a3 forDisplayWithToken:(int)a4
{
  [(NSLock *)self->_contentLock lock];
  id v7 = NSNumber;
  id v8 = self->_displayInfoDict;
  id v9 = [v7 numberWithInteger:a4];
  unint64_t v10 = [(NSMutableDictionary *)v8 objectForKey:v9];

  uint64_t v11 = [v10 orderedIdentifiers];
  if ([v11 count] <= a3)
  {
    id v12 = 0;
  }
  else
  {
    id v12 = [v11 objectAtIndex:a3];
  }
  [(NSLock *)self->_contentLock unlock];

  return v12;
}

- (id)commandAtIndex:(unint64_t)a3 forDisplayWithToken:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(NSLock *)self->_contentLock lock];
  id v7 = NSNumber;
  id v8 = self->_displayInfoDict;
  id v9 = [v7 numberWithInteger:(int)v4];
  unint64_t v10 = [(NSMutableDictionary *)v8 objectForKey:v9];

  uint64_t v11 = [v10 commandDictionary];
  id v12 = [(SCROMobileBrailleDisplayInputManager *)self inputIdentifierAtIndex:a3 forDisplayWithToken:v4];
  v13 = [v11 objectForKey:v12];

  [(NSLock *)self->_contentLock unlock];
  v14 = [(SCROMobileBrailleDisplayInputManager *)self _updatedCommandForCommand:v13];

  return v14;
}

- (id)buttonNamesAtIndex:(unint64_t)a3 forDisplayWithToken:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  unint64_t v6 = -[SCROMobileBrailleDisplayInputManager inputIdentifierAtIndex:forDisplayWithToken:](self, "inputIdentifierAtIndex:forDisplayWithToken:", a3);
  id v7 = [(SCROMobileBrailleDisplayInputManager *)self buttonNamesForInputIdentifier:v6 forDisplayWithToken:v4];

  return v7;
}

- (__CFString)defaultsKeyForModelIdentifier:(id)a3
{
  return (__CFString *)[NSString stringWithFormat:@"BrailleCommands-%@", a3];
}

- (id)userDefaultsForModelIdentifier:(id)a3
{
  id v3 = (void *)CFPreferencesCopyAppValue([(SCROMobileBrailleDisplayInputManager *)self defaultsKeyForModelIdentifier:a3], @"com.apple.VoiceOverTouch");
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x263EFFA78];
  }
  id v5 = v3;

  return v5;
}

- (void)setUserDefaults:(id)a3 forModelIdentifier:(id)a4
{
  id value = a3;
  CFPreferencesSetAppValue([(SCROMobileBrailleDisplayInputManager *)self defaultsKeyForModelIdentifier:a4], value, @"com.apple.VoiceOverTouch");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLock, 0);
  objc_storeStrong((id *)&self->_eightDotCommands, 0);
  objc_storeStrong((id *)&self->_sixDotCommands, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_brailleKeys, 0);

  objc_storeStrong((id *)&self->_displayInfoDict, 0);
}

@end