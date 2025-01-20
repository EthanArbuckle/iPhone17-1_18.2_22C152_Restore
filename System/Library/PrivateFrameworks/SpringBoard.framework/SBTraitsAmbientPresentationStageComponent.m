@interface SBTraitsAmbientPresentationStageComponent
- (NSNumber)componentOrder;
- (NSString)description;
- (SBTraitsAmbientPresentationStageComponent)init;
- (SBTraitsAmbientPresentationStageComponent)initWithComponentOrder:(id)a3;
- (int64_t)preferencesType;
@end

@implementation SBTraitsAmbientPresentationStageComponent

- (SBTraitsAmbientPresentationStageComponent)initWithComponentOrder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsAmbientPresentationStageComponent;
  v5 = [(SBTraitsAmbientPresentationStageComponent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    componentOrder = v5->_componentOrder;
    v5->_componentOrder = (NSNumber *)v6;
  }
  return v5;
}

- (SBTraitsAmbientPresentationStageComponent)init
{
  return [(SBTraitsAmbientPresentationStageComponent *)self initWithComponentOrder:&unk_1F3349C68];
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v8.receiver = self;
  v8.super_class = (Class)SBTraitsAmbientPresentationStageComponent;
  id v4 = [(SBTraitsAmbientPresentationStageComponent *)&v8 description];
  v5 = [v3 stringWithString:v4];

  uint64_t v6 = [(NSNumber *)self->_componentOrder stringValue];
  [v5 appendFormat:@" order: %@", v6];

  return (NSString *)v5;
}

- (int64_t)preferencesType
{
  return 2;
}

- (NSNumber)componentOrder
{
  return self->_componentOrder;
}

- (void).cxx_destruct
{
}

@end