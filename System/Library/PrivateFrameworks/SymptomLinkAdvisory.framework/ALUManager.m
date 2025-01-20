@interface ALUManager
- (ALUManager)initWithDelegate:(id)a3 queue:(id)a4;
- (ALUManagerDelegate)delegate;
- (BOOL)_handleALUMessageTypeLinkAdviceWithPayload:(id)a3;
- (BOOL)_handleALUMessageTypeTransferStatsWithPayload:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation ALUManager

- (ALUManager)initWithDelegate:(id)a3 queue:(id)a4
{
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ALUManager;
  [(ALUManager *)&v2 dealloc];
}

- (BOOL)_handleALUMessageTypeLinkAdviceWithPayload:(id)a3
{
  return 0;
}

- (BOOL)_handleALUMessageTypeTransferStatsWithPayload:(id)a3
{
  return 0;
}

- (ALUManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ALUManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end