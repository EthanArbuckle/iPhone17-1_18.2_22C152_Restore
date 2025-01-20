@interface TRASettingsAmbientPresentation
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAmbientPresentationSettings:(id)a3;
- (NSString)debugDescription;
- (TRAArbitrationAmbientPresentationInputs)ambientPresentationInputs;
- (TRASettingsAmbientPresentation)init;
- (TRASettingsAmbientPresentation)initWithAmbientPresentationInputs:(id)a3;
- (TRASettingsAmbientPresentation)initWithAmbientPresentationSettings:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation TRASettingsAmbientPresentation

- (TRASettingsAmbientPresentation)initWithAmbientPresentationInputs:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRASettingsAmbientPresentation;
  v6 = [(TRASettingsAmbientPresentation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_ambientPresentationInputs, a3);
  }

  return v7;
}

- (TRASettingsAmbientPresentation)initWithAmbientPresentationSettings:(id)a3
{
  v4 = [a3 ambientPresentationInputs];
  id v5 = [(TRASettingsAmbientPresentation *)self initWithAmbientPresentationInputs:v4];

  return v5;
}

- (TRASettingsAmbientPresentation)init
{
  return [(TRASettingsAmbientPresentation *)self initWithAmbientPresentationSettings:0];
}

- (BOOL)isEqualToAmbientPresentationSettings:(id)a3
{
  id v5 = (TRASettingsAmbientPresentation *)a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = [MEMORY[0x263F08690] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"TRASettings.m", 474, @"Invalid parameter not satisfying: %@", @"ambientPresentationSettings == nil || [ambientPresentationSettings isKindOfClass:[TRASettingsAmbientPresentation class]]" object file lineNumber description];
    }
    if (self == v5)
    {
      char v8 = 1;
    }
    else
    {
      ambientPresentationInputs = self->_ambientPresentationInputs;
      v7 = [(TRASettingsAmbientPresentation *)v5 ambientPresentationInputs];
      char v8 = [(TRAArbitrationAmbientPresentationInputs *)ambientPresentationInputs isEqual:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[TRAMutableSettingsAmbientPresentation allocWithZone:a3];
  return [(TRASettingsAmbientPresentation *)v4 initWithAmbientPresentationSettings:self];
}

- (NSString)debugDescription
{
  return (NSString *)[(TRASettingsAmbientPresentation *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (TRASettingsAmbientPresentation *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TRASettingsAmbientPresentation *)self isEqualToAmbientPresentationSettings:v4];
  }

  return v5;
}

- (id)succinctDescription
{
  v2 = [(TRASettingsAmbientPresentation *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendInteger:withName:", -[TRAArbitrationAmbientPresentationInputs ambientDisplayStyle](self->_ambientPresentationInputs, "ambientDisplayStyle"), @"ambientDisplayStyle");
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[TRAArbitrationAmbientPresentationInputs isAmbientPresented](self->_ambientPresentationInputs, "isAmbientPresented"), @"isAmbientPresented");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(TRASettingsAmbientPresentation *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (TRAArbitrationAmbientPresentationInputs)ambientPresentationInputs
{
  return self->_ambientPresentationInputs;
}

- (void).cxx_destruct
{
}

@end