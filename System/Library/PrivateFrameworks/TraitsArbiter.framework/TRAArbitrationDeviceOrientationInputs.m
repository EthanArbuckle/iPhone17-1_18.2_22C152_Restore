@interface TRAArbitrationDeviceOrientationInputs
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeviceOrientationInputs:(id)a3;
- (TRAArbitrationDeviceOrientationInputs)initWithCurrentDeviceOrientation:(int64_t)a3 nonFlatDeviceOrientation:(int64_t)a4;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)currentDeviceOrientation;
- (int64_t)nonFlatDeviceOrientation;
@end

@implementation TRAArbitrationDeviceOrientationInputs

- (BOOL)isEqual:(id)a3
{
  v4 = (TRAArbitrationDeviceOrientationInputs *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TRAArbitrationDeviceOrientationInputs *)self isEqualToDeviceOrientationInputs:v4];
  }

  return v5;
}

- (BOOL)isEqualToDeviceOrientationInputs:(id)a3
{
  BOOL v5 = (TRAArbitrationDeviceOrientationInputs *)a3;
  if (!v5) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x263F08690] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TRAArbitration.m", 510, @"Invalid parameter not satisfying: %@", @"deviceOrientationInputs == nil || [deviceOrientationInputs isKindOfClass:[TRAArbitrationDeviceOrientationInputs class]]" object file lineNumber description];
  }
  if (self == v5)
  {
    BOOL v8 = 1;
    goto LABEL_9;
  }
  int64_t currentDeviceOrientation = self->_currentDeviceOrientation;
  if (currentDeviceOrientation == [(TRAArbitrationDeviceOrientationInputs *)v5 currentDeviceOrientation])
  {
    int64_t nonFlatDeviceOrientation = self->_nonFlatDeviceOrientation;
    BOOL v8 = nonFlatDeviceOrientation == [(TRAArbitrationDeviceOrientationInputs *)v5 nonFlatDeviceOrientation];
  }
  else
  {
LABEL_7:
    BOOL v8 = 0;
  }
LABEL_9:

  return v8;
}

- (int64_t)currentDeviceOrientation
{
  return self->_currentDeviceOrientation;
}

- (int64_t)nonFlatDeviceOrientation
{
  return self->_nonFlatDeviceOrientation;
}

- (TRAArbitrationDeviceOrientationInputs)initWithCurrentDeviceOrientation:(int64_t)a3 nonFlatDeviceOrientation:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TRAArbitrationDeviceOrientationInputs;
  result = [(TRAArbitrationDeviceOrientationInputs *)&v7 init];
  if (result)
  {
    result->_int64_t currentDeviceOrientation = a3;
    result->_int64_t nonFlatDeviceOrientation = a4;
  }
  return result;
}

- (id)succinctDescription
{
  v2 = [(TRAArbitrationDeviceOrientationInputs *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__TRAArbitrationDeviceOrientationInputs_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_265543D20;
  id v4 = v3;
  id v8 = v4;
  v9 = self;
  [v4 appendBodySectionWithName:0 multilinePrefix:@"\t\t" block:v7];
  id v5 = v4;

  return v5;
}

void __67__TRAArbitrationDeviceOrientationInputs_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = TRAStringForBSDeviceOrientation(*(void *)(*(void *)(a1 + 40) + 8));
  [v2 appendString:v3 withName:@"current"];

  id v4 = *(void **)(a1 + 32);
  TRAStringForBSDeviceOrientation(*(void *)(*(void *)(a1 + 40) + 16));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 appendString:v5 withName:@"nonFlat"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(TRAArbitrationDeviceOrientationInputs *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

@end