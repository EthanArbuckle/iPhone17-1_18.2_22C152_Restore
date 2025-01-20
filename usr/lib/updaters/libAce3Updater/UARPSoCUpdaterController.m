@interface UARPSoCUpdaterController
- (BOOL)applyStagedFirmware;
- (BOOL)initializeUpdatersWithOptions:(id)a3;
- (BOOL)isDone;
- (BOOL)offerFirmwareDataWithDictionary:(id)a3;
- (BOOL)offerFirmwareForUpdater:(id)a3 inputDict:(id)a4;
- (BOOL)offerPersonalizationDataWithDictionary:(id)a3;
- (NSDictionary)personalizationRequests;
- (NSString)restorePartition;
- (UARPSoCUpdaterController)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5;
- (id)createUpdaterInstanceFor:(unsigned int)a3 helper:(id)a4 options:(id)a5;
- (id)firmwareTags;
- (id)queryInfo;
- (id)ticketNameTags;
- (unsigned)numberOfAvailableUnits;
@end

@implementation UARPSoCUpdaterController

- (UARPSoCUpdaterController)initWithOptions:(id)a3 logFunction:(void *)a4 logContext:(void *)a5
{
  id v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)UARPSoCUpdaterController;
  v9 = [(UARPSoCUpdaterController *)&v29 init];
  if (v9)
  {
    v10 = [[SoCUpdaterHelper alloc] initWithOptions:v8 logFunction:a4 logContext:a5];
    log = v9->_log;
    v9->_log = v10;

    uint64_t v12 = objc_opt_new();
    updaters = v9->_updaters;
    v9->_updaters = (NSMutableArray *)v12;

    v9->_isDone = 0;
    if (![(UARPSoCUpdaterController *)v9 initializeUpdatersWithOptions:v8])
    {
      v27 = 0;
      goto LABEL_10;
    }
    int ShouldSkipSameVersion = SoCUpdaterShouldSkipSameVersion(v8);
    v9->_skipSameVersion = ShouldSkipSameVersion;
    v15 = "No";
    if (ShouldSkipSameVersion) {
      v15 = "Yes";
    }
    [(SoCUpdaterHelper *)v9->_log log:@"Ace3 skip same version: %s", v15];
    v16 = [v8 objectForKeyedSubscript:@"Options"];
    v17 = v9->_log;
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    [(SoCUpdaterHelper *)v17 log:@"%@: options = %@", v19, v16];

    uint64_t v20 = [v16 objectForKeyedSubscript:@"RestoreSystemPartition"];
    restorePartition = v9->_restorePartition;
    v9->_restorePartition = (NSString *)v20;

    if (!v9->_restorePartition)
    {
      v9->_restorePartition = (NSString *)&stru_270ED5B10;
    }
    v22 = [v16 objectForKeyedSubscript:@"ForceLocalSigning"];
    v9->_forceLocalSigning = [v22 BOOLValue];

    v23 = v9->_log;
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    [(SoCUpdaterHelper *)v23 verboseLog:@"%@: _forceLocalSigning = %d", v25, v9->_forceLocalSigning];

    personalizationRequests = v9->_personalizationRequests;
    v9->_personalizationRequests = 0;
  }
  v27 = v9;
LABEL_10:

  return v27;
}

- (id)firmwareTags
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_updaters;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) firmwareTagName:v12];
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v10;
}

- (id)ticketNameTags
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_updaters;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) ticketName:v12];
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = [MEMORY[0x263EFF8C0] arrayWithArray:v3];

  return v10;
}

- (id)queryInfo
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_updaters count])
  {
    if (self->_forceLocalSigning)
    {
      uint64_t v3 = 1;
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v5 = self->_updaters;
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v18 != v8) {
              objc_enumerationMutation(v5);
            }
            if (objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "useLocalSigning", (void)v17))
            {
              uint64_t v3 = 1;
              goto LABEL_15;
            }
          }
          uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
      uint64_t v3 = 0;
LABEL_15:
    }
    v22[0] = self;
    v21[0] = @"UpdaterRef";
    v21[1] = @"TicketName";
    v10 = -[NSMutableArray objectAtIndexedSubscript:](self->_updaters, "objectAtIndexedSubscript:", 0, (void)v17);
    v11 = [v10 ticketName];
    v22[1] = v11;
    v21[2] = @"RestoreSystemPartition";
    long long v12 = [(UARPSoCUpdaterController *)self restorePartition];
    v22[2] = v12;
    v21[3] = @"LocalSigningID";
    long long v13 = [NSNumber numberWithBool:v3];
    v22[3] = v13;
    v21[4] = @"ManifestPrefix";
    long long v14 = [(NSMutableArray *)self->_updaters objectAtIndexedSubscript:0];
    long long v15 = [v14 manifestPrefix];
    v22[4] = v15;
    v4 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:5];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)offerFirmwareDataWithDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  -[SoCUpdaterHelper verboseLog:](self->_log, "verboseLog:", @"%s: options = %@", "-[UARPSoCUpdaterController offerFirmwareDataWithDictionary:]", v4);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  personalizationRequests = self->_updaters;
  uint64_t v7 = [(NSMutableArray *)personalizationRequests countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(personalizationRequests);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v11 isDone])
        {
          -[SoCUpdaterHelper verboseLog:](self->_log, "verboseLog:", @"%s: Skipping Offer Firmware. Updater(LUN:%d,RouterID:%d) has finished.", "-[UARPSoCUpdaterController offerFirmwareDataWithDictionary:]", [v11 logicUnitNumber], [v11 routerID]);
        }
        else
        {
          if (![(UARPSoCUpdaterController *)self offerFirmwareForUpdater:v11 inputDict:v4])
          {
            BOOL v14 = 0;
            goto LABEL_14;
          }
          long long v12 = [v11 personalizationRequestDict];
          [v5 addEntriesFromDictionary:v12];
        }
      }
      uint64_t v8 = [(NSMutableArray *)personalizationRequests countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  long long v13 = [NSDictionary dictionaryWithDictionary:v5];
  personalizationRequests = (NSMutableArray *)self->_personalizationRequests;
  self->_personalizationRequests = v13;
  BOOL v14 = 1;
LABEL_14:

  return v14;
}

- (BOOL)offerPersonalizationDataWithDictionary:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  -[SoCUpdaterHelper verboseLog:](self->_log, "verboseLog:", @"%s: %@", "-[UARPSoCUpdaterController offerPersonalizationDataWithDictionary:]", v4);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_updaters;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 isDone])
        {
          -[self->_log verboseLog:@"%s: Skipping Offer Tss Response. Updater(LUN:%d,RouterID:%d) has finished.", "-[UARPSoCUpdaterController offerPersonalizationDataWithDictionary:]", [v10 logicUnitNumber], objc_msgSend(v10, "routerID")];
        }
        else if (![v10 offerPersonalizationResponse:v4])
        {
          BOOL v11 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (BOOL)applyStagedFirmware
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = 1;
  self->_isDone = 1;
  -[SoCUpdaterHelper verboseLog:](self->_log, "verboseLog:", @"%s", "-[UARPSoCUpdaterController applyStagedFirmware]");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_updaters;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isDone])
        {
          -[SoCUpdaterHelper verboseLog:](self->_log, @"verboseLog: %s: Skipping Apply. Updater(LUN:%d,RouterID:%d) has finished.", @"-[UARPSoCUpdaterController applyStagedFirmware]", [v9 logicUnitNumber], objc_msgSend(v9, "routerID"));
        }
        else
        {
          if (![v9 applyStagedFirmware])
          {
            BOOL v3 = 0;
            goto LABEL_15;
          }
          if (([v9 isDone] & 1) == 0)
          {
            -[SoCUpdaterHelper verboseLog:](self->_log, "verboseLog:", @"%s: Updating is not finish yet for unit with LUN: %d, RouterID: %d", "-[UARPSoCUpdaterController applyStagedFirmware]", [v9 logicUnitNumber], [v9 routerID]);
            self->_isDone = 0;
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
    BOOL v3 = 1;
  }
LABEL_15:

  return v3;
}

- (NSDictionary)personalizationRequests
{
  return self->_personalizationRequests;
}

- (id)createUpdaterInstanceFor:(unsigned int)a3 helper:(id)a4 options:(id)a5
{
  return 0;
}

- (unsigned)numberOfAvailableUnits
{
  return 0;
}

- (BOOL)initializeUpdatersWithOptions:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(UARPSoCUpdaterController *)self numberOfAvailableUnits];
  if (v5)
  {
    unsigned int v6 = v5;
    uint64_t v7 = 1;
    while (1)
    {
      uint64_t v8 = [(UARPSoCUpdaterController *)self createUpdaterInstanceFor:v7 helper:self->_log options:v4];
      if (!v8) {
        break;
      }
      uint64_t v9 = (void *)v8;
      [(NSMutableArray *)self->_updaters addObject:v8];
      [(SoCUpdaterHelper *)self->_log log:@"Created updater instance for LUN %d", v7];

      uint64_t v7 = (v7 + 1);
      if (v7 > v6)
      {
        BOOL v10 = 1;
        goto LABEL_9;
      }
    }
    log = self->_log;
    uint64_t v14 = v7;
    long long v12 = @"Failed to create updater instance for LUN %d";
  }
  else
  {
    log = self->_log;
    long long v12 = @"No available units to be updated";
  }
  -[SoCUpdaterHelper log:](log, "log:", v12, v14);
  BOOL v10 = 0;
LABEL_9:

  return v10;
}

- (BOOL)offerFirmwareForUpdater:(id)a3 inputDict:(id)a4
{
  id v6 = a3;
  log = self->_log;
  id v8 = a4;
  -[SoCUpdaterHelper verboseLog:](log, "verboseLog:", @"%s: options = %@", "-[UARPSoCUpdaterController offerFirmwareForUpdater:inputDict:]", v8);
  uint64_t v9 = [v8 objectForKeyedSubscript:@"FirmwareData"];

  if (v9)
  {
    char v10 = [v6 offerFirmwareData:v9];
  }
  else
  {
    -[SoCUpdaterHelper log:](self->_log, "log:", @"%s: Unable to locate firmware data.", "-[UARPSoCUpdaterController offerFirmwareForUpdater:inputDict:]");
    char v10 = 0;
  }

  return v10;
}

- (BOOL)isDone
{
  return self->_isDone;
}

- (NSString)restorePartition
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restorePartition, 0);
  objc_storeStrong((id *)&self->_personalizationRequests, 0);
  objc_storeStrong((id *)&self->_updaters, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end