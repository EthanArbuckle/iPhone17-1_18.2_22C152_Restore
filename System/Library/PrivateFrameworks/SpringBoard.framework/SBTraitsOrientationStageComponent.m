@interface SBTraitsOrientationStageComponent
- (NSNumber)componentOrder;
- (NSString)description;
- (SBTraitsOrientationStageComponent)init;
- (SBTraitsOrientationStageComponent)initWithComponentOrder:(id)a3;
- (int64_t)preferencesType;
@end

@implementation SBTraitsOrientationStageComponent

- (NSNumber)componentOrder
{
  return self->_componentOrder;
}

- (int64_t)preferencesType
{
  return 1;
}

- (void).cxx_destruct
{
}

- (SBTraitsOrientationStageComponent)initWithComponentOrder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTraitsOrientationStageComponent;
  v5 = [(SBTraitsOrientationStageComponent *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    componentOrder = v5->_componentOrder;
    v5->_componentOrder = (NSNumber *)v6;
  }
  return v5;
}

- (SBTraitsOrientationStageComponent)init
{
  return [(SBTraitsOrientationStageComponent *)self initWithComponentOrder:&unk_1F334B1E0];
}

- (NSString)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v8.receiver = self;
  v8.super_class = (Class)SBTraitsOrientationStageComponent;
  id v4 = [(SBTraitsOrientationStageComponent *)&v8 description];
  v5 = [v3 stringWithString:v4];

  uint64_t v6 = [(NSNumber *)self->_componentOrder stringValue];
  [v5 appendFormat:@" order: %@", v6];

  return (NSString *)v5;
}

@end