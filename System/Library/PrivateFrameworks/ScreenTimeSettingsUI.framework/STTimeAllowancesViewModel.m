@interface STTimeAllowancesViewModel
- (BOOL)allAllowancesEnabled;
- (NSDictionary)allowancesByIdentifier;
- (NSDictionary)pendingAskForTimeByIdentifier;
- (STAlwaysAllowList)alwaysAllowList;
- (STDeviceBedtime)bedtime;
- (STTimeAllowancesViewModel)init;
- (void)setAllAllowancesEnabled:(BOOL)a3;
- (void)setAllowancesByIdentifier:(id)a3;
- (void)setAlwaysAllowList:(id)a3;
- (void)setBedtime:(id)a3;
- (void)setPendingAskForTimeByIdentifier:(id)a3;
@end

@implementation STTimeAllowancesViewModel

- (STTimeAllowancesViewModel)init
{
  v8.receiver = self;
  v8.super_class = (Class)STTimeAllowancesViewModel;
  v2 = [(STTimeAllowancesViewModel *)&v8 init];
  v3 = v2;
  if (v2)
  {
    allowancesByIdentifier = v2->_allowancesByIdentifier;
    v5 = (NSDictionary *)MEMORY[0x263EFFA78];
    v2->_allowancesByIdentifier = (NSDictionary *)MEMORY[0x263EFFA78];

    pendingAskForTimeByIdentifier = v3->_pendingAskForTimeByIdentifier;
    v3->_pendingAskForTimeByIdentifier = v5;
  }
  return v3;
}

- (BOOL)allAllowancesEnabled
{
  return self->_allAllowancesEnabled;
}

- (void)setAllAllowancesEnabled:(BOOL)a3
{
  self->_allAllowancesEnabled = a3;
}

- (STDeviceBedtime)bedtime
{
  return self->_bedtime;
}

- (void)setBedtime:(id)a3
{
}

- (NSDictionary)allowancesByIdentifier
{
  return self->_allowancesByIdentifier;
}

- (void)setAllowancesByIdentifier:(id)a3
{
}

- (STAlwaysAllowList)alwaysAllowList
{
  return self->_alwaysAllowList;
}

- (void)setAlwaysAllowList:(id)a3
{
}

- (NSDictionary)pendingAskForTimeByIdentifier
{
  return self->_pendingAskForTimeByIdentifier;
}

- (void)setPendingAskForTimeByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingAskForTimeByIdentifier, 0);
  objc_storeStrong((id *)&self->_alwaysAllowList, 0);
  objc_storeStrong((id *)&self->_allowancesByIdentifier, 0);

  objc_storeStrong((id *)&self->_bedtime, 0);
}

@end