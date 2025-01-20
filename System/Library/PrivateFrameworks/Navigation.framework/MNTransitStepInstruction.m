@interface MNTransitStepInstruction
+ (id)instructionForStep:(id)a3 context:(int64_t)a4;
+ (id)instructionForStep:(id)a3 overrides:(id)a4 context:(int64_t)a5;
- (GEOComposedRouteStep)step;
- (MNTransitStepInstruction)initWithStep:(id)a3 overrides:(id)a4 context:(int64_t)a5;
- (NSDictionary)overridenInstructionsMapping;
- (id)instructionSet;
@end

@implementation MNTransitStepInstruction

+ (id)instructionForStep:(id)a3 context:(int64_t)a4
{
  return (id)[a1 instructionForStep:a3 overrides:0 context:a4];
}

+ (id)instructionForStep:(id)a3 overrides:(id)a4 context:(int64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)a1) initWithStep:v9 overrides:v8 context:a5];

  return v10;
}

- (MNTransitStepInstruction)initWithStep:(id)a3 overrides:(id)a4 context:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MNTransitStepInstruction;
  v11 = [(MNTransitInstruction *)&v15 initWithContext:a5];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_step, a3);
    objc_storeStrong((id *)&v12->_overridenInstructionsMapping, a4);
    [(MNTransitInstruction *)v12 _fillInInstructions];
    v13 = v12;
  }

  return v12;
}

- (id)instructionSet
{
  return (id)[(GEOComposedRouteStep *)self->_step instructions];
}

- (GEOComposedRouteStep)step
{
  return self->_step;
}

- (NSDictionary)overridenInstructionsMapping
{
  return self->_overridenInstructionsMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridenInstructionsMapping, 0);
  objc_storeStrong((id *)&self->_step, 0);
}

@end