@interface WBSTabDialogInformation
- ($74EE3C8A9A83D7DA9DE4D87A9C9037E2)slot;
- (BOOL)isBlockingWebProcess;
- (BOOL)isDismissed;
- (BOOL)isExemptFromCancellationInContext:(id)a3;
- (BOOL)isPresented;
- (NSArray)cancellationExemptions;
- (WBSTabDialogInformation)initWithPresentationBlock:(id)a3 dismissalBlock:(id)a4 blocksWebProcessUntilDismissed:(BOOL)a5;
- (id)description;
- (void)dismissWithResponse:(id)a3;
- (void)presentIfNeeded;
- (void)setCancellationExemptions:(id)a3;
- (void)setSlot:(id)a3;
@end

@implementation WBSTabDialogInformation

- (WBSTabDialogInformation)initWithPresentationBlock:(id)a3 dismissalBlock:(id)a4 blocksWebProcessUntilDismissed:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WBSTabDialogInformation;
  v10 = [(WBSTabDialogInformation *)&v18 init];
  if (v10)
  {
    uint64_t v11 = MEMORY[0x1AD0C4F80](v9);
    id dismissalBlock = v10->_dismissalBlock;
    v10->_id dismissalBlock = (id)v11;

    uint64_t v13 = MEMORY[0x1AD0C4F80](v8);
    id presentationBlock = v10->_presentationBlock;
    v10->_id presentationBlock = (id)v13;

    v10->_blockingWebProcess = a5;
    cancellationExemptions = v10->_cancellationExemptions;
    v10->_cancellationExemptions = (NSArray *)MEMORY[0x1E4F1CBF0];

    v16 = v10;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = @"YES";
  if (self->_presented) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if (self->_dismissed) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  if (!self->_blockingWebProcess) {
    v5 = @"NO";
  }
  uint64_t v8 = *(void *)&self->_slot.webProcessID;
  unint64_t tabID = self->_slot.tabID;
  v10 = NSString;
  uint64_t v11 = v5;
  v12 = v7;
  uint64_t v13 = v6;
  v14 = [v10 stringWithFormat:@"{pid:%d, tab:0x%lx}", v8, tabID];
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; presented = %@, dismissed = %@, blockingWebProcess = %@, slot = %@>",
    v4,
    self,
    v13,
    v12,
    v11,
  v15 = v14);

  return v15;
}

- (void)presentIfNeeded
{
  if (!self->_presented && !self->_isInvokingPresentationBlock)
  {
    self->_isInvokingPresentationBlock = 1;
    uint64_t v3 = (*((uint64_t (**)(void))self->_presentationBlock + 2))();
    self->_isInvokingPresentationBlock = 0;
    if (!v3) {
      self->_presented = 1;
    }
  }
}

- (void)dismissWithResponse:(id)a3
{
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    (*((void (**)(void))self->_dismissalBlock + 2))();
    self->_blockingWebProcess = 0;
  }
}

- (BOOL)isExemptFromCancellationInContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_cancellationExemptions;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "isExemptFromCancellationInContext:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- ($74EE3C8A9A83D7DA9DE4D87A9C9037E2)slot
{
  unint64_t tabID = self->_slot.tabID;
  uint64_t v3 = *(void *)&self->_slot.webProcessID;
  result.var1 = tabID;
  result.var0 = v3;
  return result;
}

- (void)setSlot:(id)a3
{
  self->_slot = ($84CF90F7BD3801B8A4587140E8FC5183)a3;
}

- (NSArray)cancellationExemptions
{
  return self->_cancellationExemptions;
}

- (void)setCancellationExemptions:(id)a3
{
}

- (BOOL)isBlockingWebProcess
{
  return self->_blockingWebProcess;
}

- (BOOL)isDismissed
{
  return self->_dismissed;
}

- (BOOL)isPresented
{
  return self->_presented;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationExemptions, 0);
  objc_storeStrong(&self->_presentationBlock, 0);
  objc_storeStrong(&self->_dismissalBlock, 0);
}

@end