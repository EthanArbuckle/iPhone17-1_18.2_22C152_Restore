@interface SFAirDropTransfer
+ (BOOL)automaticallyNotifiesObserversOfFailureReason;
+ (BOOL)automaticallyNotifiesObserversOfTransferState;
+ (BOOL)automaticallyNotifiesObserversOfUserResponse;
+ (BOOL)supportsSecureCoding;
+ (id)keyPathsForValuesAffectingNeedsAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isJustFiles;
- (BOOL)needsAction;
- (BOOL)updateUsingCoder:(id)a3;
- (BOOL)updateWithTransfer:(id)a3;
- (BOOL)willOpenInMRQL;
- (NSArray)completedURLs;
- (NSArray)possibleActions;
- (NSArray)sensitiveURLs;
- (NSError)error;
- (NSProgress)transferProgress;
- (NSString)contentsDescription;
- (NSString)contentsTitle;
- (NSString)identifier;
- (NSURL)customDestinationURL;
- (SFAirDropAction)cancelAction;
- (SFAirDropAction)selectedAction;
- (SFAirDropTransfer)initWithCoder:(id)a3;
- (SFAirDropTransfer)initWithIdentifier:(id)a3 initialInformation:(id)a4;
- (SFAirDropTransfer)initWithIdentifier:(id)a3 metaData:(id)a4 userResponse:(unint64_t)a5 transferState:(unint64_t)a6 failureReason:(unint64_t)a7 error:(id)a8 customDestinationURL:(id)a9 contentsTitle:(id)a10 contentsDescription:(id)a11 selectedAction:(id)a12 possibleActions:(id)a13 cancelAction:(id)a14 completedURLs:(id)a15;
- (SFAirDropTransferMetaData)metaData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)progressToken;
- (unint64_t)failureReason;
- (unint64_t)hash;
- (unint64_t)itemCount;
- (unint64_t)transferState;
- (unint64_t)userResponse;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCancelAction:(id)a3;
- (void)setCompletedURLs:(id)a3;
- (void)setContentsDescription:(id)a3;
- (void)setContentsTitle:(id)a3;
- (void)setCustomDestinationURL:(id)a3;
- (void)setError:(id)a3;
- (void)setFailureReason:(unint64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setMetaData:(id)a3;
- (void)setPossibleActions:(id)a3;
- (void)setProgressToken:(id)a3;
- (void)setSelectedAction:(id)a3;
- (void)setTransferProgress:(id)a3;
- (void)setTransferState:(unint64_t)a3;
- (void)setUpProgress;
- (void)setUpProgressToBroadcast:(BOOL)a3;
- (void)setUserResponse:(unint64_t)a3;
- (void)setWillOpenInMRQL:(BOOL)a3;
- (void)updateWithInformation:(id)a3;
@end

@implementation SFAirDropTransfer

- (SFAirDropTransfer)initWithIdentifier:(id)a3 initialInformation:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SFAirDropTransfer;
  v8 = [(SFAirDropTransfer *)&v17 init];
  v9 = v8;
  if (v8)
  {
    v8->_usedByTransferManager = 1;
    uint64_t v10 = [v6 copy];
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    if (v9->_usedByTransferManager)
    {
      v12 = airdrop_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = v9->_identifier;
        *(_DWORD *)buf = 138543618;
        v19 = v13;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_impl(&dword_1A5389000, v12, OS_LOG_TYPE_INFO, "[Transfer: %{public}@] Initialized with initial information: %@", buf, 0x16u);
      }
    }
    v9->_transferState = 0;
    v14 = [[SFAirDropTransferMetaData alloc] initWithInformation:v7];
    metaData = v9->_metaData;
    v9->_metaData = v14;

    [(SFAirDropTransfer *)v9 updateWithInformation:v7];
    [(SFAirDropTransfer *)v9 setUpProgressToBroadcast:v9->_usedByTransferManager];
  }

  return v9;
}

- (SFAirDropTransfer)initWithIdentifier:(id)a3 metaData:(id)a4 userResponse:(unint64_t)a5 transferState:(unint64_t)a6 failureReason:(unint64_t)a7 error:(id)a8 customDestinationURL:(id)a9 contentsTitle:(id)a10 contentsDescription:(id)a11 selectedAction:(id)a12 possibleActions:(id)a13 cancelAction:(id)a14 completedURLs:(id)a15
{
  id v36 = a3;
  id obj = a4;
  id v35 = a4;
  id v34 = a8;
  id v33 = a9;
  id v32 = a10;
  id v31 = a11;
  id v18 = a12;
  id v19 = a13;
  id v20 = a14;
  id v21 = a15;
  v37.receiver = self;
  v37.super_class = (Class)SFAirDropTransfer;
  uint64_t v22 = [(SFAirDropTransfer *)&v37 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_identifier, a3);
    objc_storeStrong((id *)&v23->_metaData, obj);
    v23->_userResponse = a5;
    v23->_transferState = a6;
    v23->_failureReason = a7;
    objc_storeStrong((id *)&v23->_error, a8);
    objc_storeStrong((id *)&v23->_customDestinationURL, a9);
    objc_storeStrong((id *)&v23->_contentsTitle, a10);
    objc_storeStrong((id *)&v23->_contentsDescription, a11);
    objc_storeStrong((id *)&v23->_selectedAction, a12);
    objc_storeStrong((id *)&v23->_possibleActions, a13);
    objc_storeStrong((id *)&v23->_cancelAction, a14);
    objc_storeStrong((id *)&v23->_completedURLs, a15);
    v24 = v23;
  }

  return v23;
}

- (void)setUpProgress
{
}

- (void)setUpProgressToBroadcast:(BOOL)a3
{
  BOOL v3 = a3;
  v34[3] = *MEMORY[0x1E4F143B8];
  v5 = SFAirDropDownloadsURL();
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 URLByAppendingPathComponent:@"com.apple.AirDrop" isDirectory:1];
    v8 = [v7 URLByAppendingPathComponent:self->_identifier isDirectory:1];
    id location = 0;
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E4F28F90];
    if (v3)
    {
      id v10 = objc_alloc(MEMORY[0x1E4F28F90]);
      uint64_t v11 = *MEMORY[0x1E4F28868];
      v33[0] = *MEMORY[0x1E4F28890];
      v33[1] = v11;
      uint64_t v12 = *MEMORY[0x1E4F28870];
      v34[0] = v8;
      v34[1] = v12;
      v33[2] = *MEMORY[0x1E4F28888];
      v13 = NSNumber;
      v14 = [(SFAirDropTransfer *)self metaData];
      v15 = [v14 rawFiles];
      v16 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
      v34[2] = v16;
      objc_super v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
      id v18 = (NSProgress *)[v10 initWithParent:0 userInfo:v17];
      transferProgress = self->_transferProgress;
      self->_transferProgress = v18;

      [(NSProgress *)self->_transferProgress setCancellable:1];
      [(NSProgress *)self->_transferProgress setPausable:0];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __46__SFAirDropTransfer_setUpProgressToBroadcast___block_invoke;
      v29[3] = &unk_1E5BBC540;
      id v20 = &v31;
      objc_copyWeak(&v31, &location);
      id v30 = v8;
      [(NSProgress *)self->_transferProgress setCancellationHandler:v29];
      [(NSProgress *)self->_transferProgress publish];
      id v21 = &v30;
    }
    else
    {
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __46__SFAirDropTransfer_setUpProgressToBroadcast___block_invoke_149;
      v26 = &unk_1E5BBD8B0;
      id v20 = &v28;
      objc_copyWeak(&v28, &location);
      id v27 = v8;
      uint64_t v22 = [v9 addSubscriberForFileURL:v27 withPublishingHandler:&v23];
      -[SFAirDropTransfer setProgressToken:](self, "setProgressToken:", v22, v23, v24, v25, v26);

      id v21 = &v27;
    }

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);

LABEL_9:
    goto LABEL_10;
  }
  if (self->_usedByTransferManager)
  {
    id v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SFAirDropTransfer setUpProgressToBroadcast:]((uint64_t)self, v7);
    }
    goto LABEL_9;
  }
LABEL_10:
}

void __46__SFAirDropTransfer_setUpProgressToBroadcast___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = airdrop_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = [WeakRetained identifier];
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543619;
    v8 = v4;
    __int16 v9 = 2113;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1A5389000, v2, OS_LOG_TYPE_INFO, "[Transfer: %{public}@]: SFAirDropTransfer: cancellation handler called %{private}@", (uint8_t *)&v7, 0x16u);
  }
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  [v6 setUserResponse:2];
}

id __46__SFAirDropTransfer_setUpProgressToBroadcast___block_invoke_149(uint64_t a1, void *a2)
{
  BOOL v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setTransferProgress:v4];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__SFAirDropTransfer_setUpProgressToBroadcast___block_invoke_2;
  v8[3] = &unk_1E5BBBD18;
  v8[4] = WeakRetained;
  id v9 = *(id *)(a1 + 32);
  id v6 = _Block_copy(v8);

  return v6;
}

void __46__SFAirDropTransfer_setUpProgressToBroadcast___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = airdrop_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    BOOL v3 = [*(id *)(a1 + 32) identifier];
    uint64_t v4 = *(void *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1A5389000, v2, OS_LOG_TYPE_INFO, "[Transfer: %{public}@] Progress unpublished for transfer at %@", (uint8_t *)&v9, 0x16u);
  }
  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = (id *)(a1 + 32);
  int v7 = [v6 progressToken];
  [*v5 setProgressToken:0];
  if (v7)
  {
    [*v5 setTransferProgress:0];
  }
  else
  {
    v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __46__SFAirDropTransfer_setUpProgressToBroadcast___block_invoke_2_cold_1(v5, v8);
    }
  }
}

- (BOOL)isJustFiles
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(SFAirDropTransfer *)self metaData];
  BOOL v3 = [v2 items];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (![*(id *)(*((void *)&v10 + 1) + 8 * i) isFile])
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

- (unint64_t)itemCount
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(SFAirDropTransfer *)self metaData];
  BOOL v3 = [v2 items];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 += [*(id *)(*((void *)&v10 + 1) + 8 * i) count];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  if (self->_progressToken) {
    objc_msgSend(MEMORY[0x1E4F28F90], "removeSubscriber:");
  }
  [(NSProgress *)self->_transferProgress unpublish];
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropTransfer;
  [(SFAirDropTransfer *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v4 = objc_opt_new();
  [v4 updateWithTransfer:self];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAirDropTransfer)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SFAirDropTransfer *)self init];
  unint64_t v6 = v5;
  if (v5) {
    [(SFAirDropTransfer *)v5 updateUsingCoder:v4];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_metaData forKey:@"metaData"];
  [v5 encodeInteger:self->_userResponse forKey:@"userResponse"];
  [v5 encodeInteger:self->_transferState forKey:@"transferState"];
  [v5 encodeInteger:self->_failureReason forKey:@"failureReason"];
  [v5 encodeObject:self->_error forKey:@"error"];
  [v5 encodeObject:self->_contentsTitle forKey:@"contentsTitle"];
  [v5 encodeObject:self->_contentsDescription forKey:@"contentsDescription"];
  [v5 encodeObject:self->_selectedAction forKey:@"selectedAction"];
  [v5 encodeObject:self->_possibleActions forKey:@"possibleActions"];
  [v5 encodeObject:self->_cancelAction forKey:@"cancelAction"];
  [v5 encodeBool:self->_willOpenInMRQL forKey:@"willOpenInMRQL"];
  [v5 encodeObject:self->_completedURLs forKey:@"completedURLs"];
}

- (id)description
{
  objc_opt_class();
  identifier = self->_identifier;
  NSAppendPrintF();
  id v24 = 0;
  id v18 = SFAirDropTransferStateToString(self->_transferState);
  NSAppendPrintF();
  id v3 = v24;

  if (self->_transferState == 9)
  {
    NSAppendPrintF();
    id v4 = v3;

    NSAppendPrintF();
    id v3 = v4;
  }
  unint64_t userResponse = self->_userResponse;
  if (userResponse > 3) {
    unint64_t v6 = @"Unknown";
  }
  else {
    unint64_t v6 = off_1E5BBD8D0[userResponse];
  }
  id v19 = v6;
  NSAppendPrintF();
  id v7 = v3;

  if ([(SFAirDropTransfer *)self needsAction]) {
    BOOL v8 = "yes";
  }
  else {
    BOOL v8 = "no";
  }
  id v20 = v8;
  NSAppendPrintF();
  id v9 = v7;

  if ([(SFAirDropTransfer *)self willOpenInMRQL]) {
    long long v10 = "yes";
  }
  else {
    long long v10 = "no";
  }
  id v21 = v10;
  NSAppendPrintF();
  id v11 = v9;

  selectedAction = self->_selectedAction;
  if (selectedAction)
  {
    long long v13 = [(SFAirDropAction *)selectedAction localizedTitle];
    NSAppendPrintF();
    id v14 = v11;
  }
  else
  {
    long long v13 = [(NSArray *)self->_possibleActions valueForKeyPath:@"@unionOfObjects.localizedTitle", v21];
    uint64_t v22 = SFCompactStringFromCollection(v13);
    NSAppendPrintF();
    id v14 = v11;

    id v11 = (id)v22;
  }

  NSAppendPrintF();
  id v15 = v14;

  NSAppendPrintF();
  id v16 = v15;

  return v16;
}

- (unint64_t)hash
{
  v2 = [(SFAirDropTransfer *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFAirDropTransfer *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(SFAirDropTransfer *)self identifier];
      unint64_t v6 = [(SFAirDropTransfer *)v4 identifier];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (BOOL)updateWithTransfer:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F28DB0];
  id v5 = a3;
  unint64_t v6 = (void *)[[v4 alloc] initRequiringSecureCoding:1];
  [v5 encodeWithCoder:v6];

  id v7 = objc_alloc(MEMORY[0x1E4F28DC0]);
  BOOL v8 = [v6 encodedData];
  id v9 = (void *)[v7 initForReadingFromData:v8 error:0];

  LOBYTE(self) = [(SFAirDropTransfer *)self updateUsingCoder:v9];
  [v9 finishDecoding];

  return (char)self;
}

- (BOOL)updateUsingCoder:(id)a3
{
  v54[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SFAirDropTransfer *)self identifier];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  [(SFAirDropTransfer *)self setIdentifier:v6];

  id v7 = [(SFAirDropTransfer *)self identifier];
  int v52 = SFNilEqual((unint64_t)v5, (uint64_t)v7);

  BOOL v8 = [(SFAirDropTransfer *)self metaData];

  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metaData"];
  [(SFAirDropTransfer *)self setMetaData:v9];

  long long v10 = [(SFAirDropTransfer *)self metaData];
  int v51 = SFNilEqual((unint64_t)v8, (uint64_t)v10);

  unint64_t v11 = [(SFAirDropTransfer *)self userResponse];
  -[SFAirDropTransfer setUserResponse:](self, "setUserResponse:", [v4 decodeIntegerForKey:@"userResponse"]);
  BOOL v50 = v11 != [(SFAirDropTransfer *)self userResponse];
  unint64_t v12 = [(SFAirDropTransfer *)self transferState];
  -[SFAirDropTransfer setTransferState:](self, "setTransferState:", [v4 decodeIntegerForKey:@"transferState"]);
  BOOL v49 = v12 != [(SFAirDropTransfer *)self transferState];
  unint64_t v13 = [(SFAirDropTransfer *)self failureReason];
  -[SFAirDropTransfer setFailureReason:](self, "setFailureReason:", [v4 decodeIntegerForKey:@"failureReason"]);
  BOOL v48 = v13 != [(SFAirDropTransfer *)self failureReason];
  id v14 = [(SFAirDropTransfer *)self error];

  id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
  [(SFAirDropTransfer *)self setError:v15];

  id v16 = [(SFAirDropTransfer *)self error];
  int v47 = SFNilEqual((unint64_t)v14, (uint64_t)v16);

  objc_super v17 = [(SFAirDropTransfer *)self contentsTitle];

  id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentsTitle"];
  [(SFAirDropTransfer *)self setContentsTitle:v18];

  id v19 = [(SFAirDropTransfer *)self contentsTitle];
  int v46 = SFNilEqual((unint64_t)v17, (uint64_t)v19);

  id v20 = [(SFAirDropTransfer *)self contentsDescription];

  id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentsDescription"];
  [(SFAirDropTransfer *)self setContentsDescription:v21];

  uint64_t v22 = [(SFAirDropTransfer *)self contentsDescription];
  int v45 = SFNilEqual((unint64_t)v20, (uint64_t)v22);

  uint64_t v23 = [(SFAirDropTransfer *)self selectedAction];

  id v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedAction"];
  [(SFAirDropTransfer *)self setSelectedAction:v24];

  v25 = [(SFAirDropTransfer *)self selectedAction];
  int v44 = SFNilEqual((unint64_t)v23, (uint64_t)v25);

  v26 = [(SFAirDropTransfer *)self possibleActions];

  id v27 = (void *)MEMORY[0x1E4F1CAD0];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  v29 = [v27 setWithArray:v28];
  id v30 = [v4 decodeObjectOfClasses:v29 forKey:@"possibleActions"];
  [(SFAirDropTransfer *)self setPossibleActions:v30];

  uint64_t v31 = [(SFAirDropTransfer *)self possibleActions];
  int v32 = SFNilEqual((unint64_t)v26, v31);

  id v33 = [(SFAirDropTransfer *)self cancelAction];

  id v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cancelAction"];
  [(SFAirDropTransfer *)self setCancelAction:v34];

  uint64_t v35 = [(SFAirDropTransfer *)self cancelAction];
  int v36 = SFNilEqual((unint64_t)v33, v35);

  LOBYTE(v35) = [(SFAirDropTransfer *)self willOpenInMRQL];
  -[SFAirDropTransfer setWillOpenInMRQL:](self, "setWillOpenInMRQL:", [v4 decodeBoolForKey:@"willOpenInMRQL"]);
  LOBYTE(v31) = [(SFAirDropTransfer *)self willOpenInMRQL];
  objc_super v37 = [(SFAirDropTransfer *)self completedURLs];

  v38 = (void *)MEMORY[0x1E4F1CAD0];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  v40 = [v38 setWithArray:v39];
  v41 = [v4 decodeObjectOfClasses:v40 forKey:@"completedURLs"];

  [(SFAirDropTransfer *)self setCompletedURLs:v41];
  v42 = [(SFAirDropTransfer *)self completedURLs];
  LOBYTE(self) = SFNilEqual((unint64_t)v37, (uint64_t)v42);

  return (v50 || (v52 & v51 & 1) == 0 || v49 || v48 || (v47 & v46 & v45 & v44 & v32 & v36 & 1) == 0) | (v35 ^ v31) & 1 | ((self & 1) == 0);
}

- (void)updateWithInformation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"Items"];
  [(SFAirDropTransfer *)self setCompletedURLs:v5];

  unint64_t v6 = [v4 objectForKeyedSubscript:@"Error"];
  [(SFAirDropTransfer *)self setError:v6];

  id v7 = [(SFAirDropTransfer *)self error];

  if (v7 && self->_usedByTransferManager)
  {
    BOOL v8 = airdrop_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      identifier = self->_identifier;
      long long v10 = [(SFAirDropTransfer *)self error];
      int v18 = 138543618;
      id v19 = identifier;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_INFO, "[Transfer: %{public}@] updateWithInformation: Error was set: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  unint64_t v11 = [v4 objectForKeyedSubscript:@"TotalBytes"];
  unint64_t v12 = v11;
  if (v11) {
    -[NSProgress setTotalUnitCount:](self->_transferProgress, "setTotalUnitCount:", [v11 longLongValue]);
  }
  unint64_t v13 = [v4 objectForKeyedSubscript:@"BytesCopied"];
  if (v13)
  {
    if (self->_usedByTransferManager)
    {
      id v14 = airdrop_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = self->_identifier;
        int v18 = 138543874;
        id v19 = v15;
        __int16 v20 = 2112;
        id v21 = v13;
        __int16 v22 = 2112;
        uint64_t v23 = v12;
        _os_log_impl(&dword_1A5389000, v14, OS_LOG_TYPE_INFO, "[Transfer: %{public}@] Updating completedUnitCount: %@ bytesCopied / %@ totalBytes", (uint8_t *)&v18, 0x20u);
      }
    }
    -[NSProgress setCompletedUnitCount:](self->_transferProgress, "setCompletedUnitCount:", [v13 longLongValue]);
  }
  id v16 = [v4 objectForKeyedSubscript:@"TimeRemaining"];
  if (v16) {
    [(NSProgress *)self->_transferProgress setUserInfoObject:v16 forKey:*MEMORY[0x1E4F28818]];
  }
  objc_super v17 = [v4 objectForKeyedSubscript:@"FilesCopied"];
  if (v17) {
    [(NSProgress *)self->_transferProgress setUserInfoObject:v17 forKey:*MEMORY[0x1E4F28820]];
  }
}

+ (BOOL)automaticallyNotifiesObserversOfUserResponse
{
  return 0;
}

- (void)setUserResponse:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t userResponse = self->_userResponse;
  if (userResponse != a3)
  {
    if (userResponse > 3) {
      unint64_t v6 = @"Unknown";
    }
    else {
      unint64_t v6 = off_1E5BBD8D0[userResponse];
    }
    if (a3 > 3) {
      id v7 = @"Unknown";
    }
    else {
      id v7 = off_1E5BBD8D0[a3];
    }
    if (self->_userResponse >= a3)
    {
      if (!self->_usedByTransferManager) {
        return;
      }
      unint64_t v11 = airdrop_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        identifier = self->_identifier;
        int v13 = 138543874;
        id v14 = identifier;
        __int16 v15 = 2112;
        id v16 = v6;
        __int16 v17 = 2112;
        int v18 = v7;
        _os_log_error_impl(&dword_1A5389000, v11, OS_LOG_TYPE_ERROR, "[Transfer: %{public}@] Cannot change userResponse from %@ to %@", (uint8_t *)&v13, 0x20u);
      }
    }
    else
    {
      if (self->_usedByTransferManager)
      {
        BOOL v8 = airdrop_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          id v9 = self->_identifier;
          int v13 = 138543874;
          id v14 = v9;
          __int16 v15 = 2112;
          id v16 = v6;
          __int16 v17 = 2112;
          int v18 = v7;
          _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_INFO, "[Transfer: %{public}@] Changing user response from %@ to %@", (uint8_t *)&v13, 0x20u);
        }
      }
      long long v10 = NSStringFromSelector(sel_userResponse);
      [(SFAirDropTransfer *)self willChangeValueForKey:v10];

      self->_unint64_t userResponse = a3;
      unint64_t v11 = NSStringFromSelector(sel_userResponse);
      [(SFAirDropTransfer *)self didChangeValueForKey:v11];
    }
  }
}

+ (BOOL)automaticallyNotifiesObserversOfTransferState
{
  return 0;
}

- (void)setTransferState:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t transferState = self->_transferState;
  if (transferState != a3)
  {
    unint64_t v6 = SFAirDropTransferStateToString(transferState);
    id v7 = SFAirDropTransferStateToString(a3);
    if (self->_transferState >= a3)
    {
      if (!self->_usedByTransferManager)
      {
LABEL_12:

        return;
      }
      unint64_t v11 = airdrop_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        identifier = self->_identifier;
        int v13 = 138543874;
        id v14 = identifier;
        __int16 v15 = 2112;
        id v16 = v6;
        __int16 v17 = 2112;
        int v18 = v7;
        _os_log_error_impl(&dword_1A5389000, v11, OS_LOG_TYPE_ERROR, "[Transfer: %{public}@] Cannot change transferState from %@ to %@", (uint8_t *)&v13, 0x20u);
      }
    }
    else
    {
      if (self->_usedByTransferManager)
      {
        BOOL v8 = airdrop_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          id v9 = self->_identifier;
          int v13 = 138543874;
          id v14 = v9;
          __int16 v15 = 2112;
          id v16 = v6;
          __int16 v17 = 2112;
          int v18 = v7;
          _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_INFO, "[Transfer: %{public}@] Changing transfer state from %@ to %@", (uint8_t *)&v13, 0x20u);
        }
      }
      long long v10 = NSStringFromSelector(sel_transferState);
      [(SFAirDropTransfer *)self willChangeValueForKey:v10];

      self->_unint64_t transferState = a3;
      unint64_t v11 = NSStringFromSelector(sel_transferState);
      [(SFAirDropTransfer *)self didChangeValueForKey:v11];
    }

    goto LABEL_12;
  }
}

+ (BOOL)automaticallyNotifiesObserversOfFailureReason
{
  return 0;
}

- (void)setFailureReason:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t failureReason = self->_failureReason;
  if (failureReason != a3)
  {
    if (failureReason - 1 > 2) {
      unint64_t v6 = @"Unknown";
    }
    else {
      unint64_t v6 = off_1E5BBD8F0[failureReason - 1];
    }
    if (a3 - 1 > 2) {
      id v7 = @"Unknown";
    }
    else {
      id v7 = off_1E5BBD8F0[a3 - 1];
    }
    if (self->_usedByTransferManager)
    {
      BOOL v8 = airdrop_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        identifier = self->_identifier;
        int v12 = 138543874;
        int v13 = identifier;
        __int16 v14 = 2112;
        __int16 v15 = v6;
        __int16 v16 = 2112;
        __int16 v17 = v7;
        _os_log_impl(&dword_1A5389000, v8, OS_LOG_TYPE_INFO, "[Transfer: %{public}@] Setting failure reason from %@ to %@", (uint8_t *)&v12, 0x20u);
      }
    }
    long long v10 = NSStringFromSelector(sel_failureReason);
    [(SFAirDropTransfer *)self willChangeValueForKey:v10];

    self->_unint64_t failureReason = a3;
    unint64_t v11 = NSStringFromSelector(sel_failureReason);
    [(SFAirDropTransfer *)self didChangeValueForKey:v11];
  }
}

+ (id)keyPathsForValuesAffectingNeedsAction
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v3 = NSStringFromSelector(sel_selectedAction);
  id v9 = v3;
  id v4 = NSStringFromSelector(sel_possibleActions);
  long long v10 = v4;
  id v5 = NSStringFromSelector(sel_userResponse);
  unint64_t v11 = v5;
  unint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:3];
  id v7 = objc_msgSend(v2, "setWithArray:", v6, v9, v10);

  return v7;
}

- (BOOL)needsAction
{
  unint64_t v3 = [(SFAirDropTransfer *)self selectedAction];
  if (v3)
  {
    BOOL v4 = [(SFAirDropTransfer *)self userResponse] == 0;
  }
  else
  {
    id v5 = [(SFAirDropTransfer *)self possibleActions];
    if ([v5 count]) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = [(SFAirDropTransfer *)self userResponse] == 0;
    }
  }
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (SFAirDropTransferMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSProgress)transferProgress
{
  return self->_transferProgress;
}

- (void)setTransferProgress:(id)a3
{
}

- (NSString)contentsTitle
{
  return self->_contentsTitle;
}

- (void)setContentsTitle:(id)a3
{
}

- (NSString)contentsDescription
{
  return self->_contentsDescription;
}

- (void)setContentsDescription:(id)a3
{
}

- (SFAirDropAction)selectedAction
{
  return self->_selectedAction;
}

- (void)setSelectedAction:(id)a3
{
}

- (NSArray)possibleActions
{
  return self->_possibleActions;
}

- (void)setPossibleActions:(id)a3
{
}

- (SFAirDropAction)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
}

- (BOOL)willOpenInMRQL
{
  return self->_willOpenInMRQL;
}

- (void)setWillOpenInMRQL:(BOOL)a3
{
  self->_willOpenInMRQL = a3;
}

- (NSArray)completedURLs
{
  return self->_completedURLs;
}

- (void)setCompletedURLs:(id)a3
{
}

- (NSArray)sensitiveURLs
{
  return self->_sensitiveURLs;
}

- (unint64_t)userResponse
{
  return self->_userResponse;
}

- (unint64_t)transferState
{
  return self->_transferState;
}

- (unint64_t)failureReason
{
  return self->_failureReason;
}

- (NSURL)customDestinationURL
{
  return self->_customDestinationURL;
}

- (void)setCustomDestinationURL:(id)a3
{
}

- (id)progressToken
{
  return self->_progressToken;
}

- (void)setProgressToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressToken, 0);
  objc_storeStrong((id *)&self->_customDestinationURL, 0);
  objc_storeStrong((id *)&self->_sensitiveURLs, 0);
  objc_storeStrong((id *)&self->_completedURLs, 0);
  objc_storeStrong((id *)&self->_possibleActions, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_storeStrong((id *)&self->_contentsDescription, 0);
  objc_storeStrong((id *)&self->_contentsTitle, 0);
  objc_storeStrong((id *)&self->_transferProgress, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_cancelAction, 0);
}

- (void)setUpProgressToBroadcast:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 24);
  int v3 = 138543618;
  uint64_t v4 = v2;
  __int16 v5 = 2114;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "[Transfer: %{public}@] [Transfer: %{public}@] Failed to set up progress object (Downloads URL not available)", (uint8_t *)&v3, 0x16u);
}

void __46__SFAirDropTransfer_setUpProgressToBroadcast___block_invoke_2_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = [*a1 identifier];
  int v4 = 138543362;
  __int16 v5 = v3;
  _os_log_error_impl(&dword_1A5389000, a2, OS_LOG_TYPE_ERROR, "[Transfer: %{public}@] Progress token not available.", (uint8_t *)&v4, 0xCu);
}

@end