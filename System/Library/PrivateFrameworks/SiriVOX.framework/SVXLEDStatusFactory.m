@interface SVXLEDStatusFactory
- (SVXLEDStatusFactory)init;
- (id)createClearLEDStatus;
- (id)createCommandForStatus:(id)a3;
- (id)createStatusForColor:(id)a3;
@end

@implementation SVXLEDStatusFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLEDSupplier, 0);

  objc_storeStrong((id *)&self->_statusLEDCommands, 0);
}

- (id)createStatusForColor:(id)a3
{
  targetLEDSupplier = self->_targetLEDSupplier;
  id v4 = a3;
  unsigned int v5 = [(SVXTargetLEDSupplier *)targetLEDSupplier get];
  v6 = [NSString stringWithFormat:@"individual %d %@", v5, v4];

  return v6;
}

- (id)createClearLEDStatus
{
  return [(SVXLEDStatusFactory *)self createStatusForColor:@"0 0 0"];
}

- (id)createCommandForStatus:(id)a3
{
  if (a3)
  {
    id v4 = -[NSDictionary objectForKeyedSubscript:](self->_statusLEDCommands, "objectForKeyedSubscript:");
    if (v4)
    {
      unsigned int v5 = [(SVXLEDStatusFactory *)self createStatusForColor:v4];
    }
    else
    {
      unsigned int v5 = 0;
    }
  }
  else
  {
    unsigned int v5 = 0;
  }

  return v5;
}

- (SVXLEDStatusFactory)init
{
  v11[3] = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)SVXLEDStatusFactory;
  v2 = [(SVXLEDStatusFactory *)&v9 init];
  if (v2)
  {
    uint64_t v3 = *MEMORY[0x263F65EE0];
    v10[0] = *MEMORY[0x263F65ED8];
    v10[1] = v3;
    v11[0] = @"0 190 0";
    v11[1] = @"190 0 0";
    v10[2] = *MEMORY[0x263F65EE8];
    v11[2] = @"190 190 0";
    uint64_t v4 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
    statusLEDCommands = v2->_statusLEDCommands;
    v2->_statusLEDCommands = (NSDictionary *)v4;

    v6 = objc_alloc_init(SVXTargetLEDSupplier);
    targetLEDSupplier = v2->_targetLEDSupplier;
    v2->_targetLEDSupplier = v6;
  }
  return v2;
}

@end