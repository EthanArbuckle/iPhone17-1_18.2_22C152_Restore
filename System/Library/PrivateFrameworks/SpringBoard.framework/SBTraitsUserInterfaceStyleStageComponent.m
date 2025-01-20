@interface SBTraitsUserInterfaceStyleStageComponent
- (NSNumber)componentOrder;
- (NSString)description;
- (SBTraitsUserInterfaceStyleStageComponent)init;
- (SBTraitsUserInterfaceStyleStageComponent)initWithComponentOrder:(id)a3;
- (int64_t)preferencesType;
@end

@implementation SBTraitsUserInterfaceStyleStageComponent

- (SBTraitsUserInterfaceStyleStageComponent)initWithComponentOrder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsUserInterfaceStyleStageComponent;
  v5 = [(SBTraitsUserInterfaceStyleStageComponent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    componentOrder = v5->_componentOrder;
    v5->_componentOrder = (NSNumber *)v6;
  }
  return v5;
}

- (SBTraitsUserInterfaceStyleStageComponent)init
{
  return [(SBTraitsUserInterfaceStyleStageComponent *)self initWithComponentOrder:&unk_1F3349B30];
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v8.receiver = self;
  v8.super_class = (Class)SBTraitsUserInterfaceStyleStageComponent;
  id v4 = [(SBTraitsUserInterfaceStyleStageComponent *)&v8 description];
  v5 = [v3 stringWithString:v4];

  uint64_t v6 = [(NSNumber *)self->_componentOrder stringValue];
  [v5 appendFormat:@" order: %@", v6];

  return (NSString *)v5;
}

- (int64_t)preferencesType
{
  return 3;
}

- (NSNumber)componentOrder
{
  return self->_componentOrder;
}

- (void).cxx_destruct
{
}

@end