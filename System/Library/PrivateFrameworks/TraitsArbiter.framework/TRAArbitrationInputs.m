@interface TRAArbitrationInputs
- (TRAArbitrationAmbientPresentationInputs)ambientPresentationInputs;
- (TRAArbitrationDeviceOrientationInputs)deviceOrientationInputs;
- (TRAArbitrationInputs)initWithInterfaceIdiomInputs:(id)a3 deviceOrientationInputs:(id)a4 keyboardInputs:(id)a5 ambientPresentationInputs:(id)a6;
- (TRAArbitrationInputs)initWithInterfaceIdiomInputs:(id)a3 userInterfaceStyleInputs:(id)a4 deviceOrientationInputs:(id)a5 keyboardInputs:(id)a6 ambientPresentationInputs:(id)a7;
- (TRAArbitrationInterfaceIdiomInputs)interfaceIdiomInputs;
- (TRAArbitrationKeyboardInputs)keyboardInputs;
- (TRAArbitrationUserInterfaceStyleInputs)userInterfaceStyleInputs;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation TRAArbitrationInputs

- (TRAArbitrationDeviceOrientationInputs)deviceOrientationInputs
{
  return self->_deviceOrientationInputs;
}

- (TRAArbitrationUserInterfaceStyleInputs)userInterfaceStyleInputs
{
  return self->_userInterfaceStyleInputs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ambientPresentationInputs, 0);
  objc_storeStrong((id *)&self->_keyboardInputs, 0);
  objc_storeStrong((id *)&self->_deviceOrientationInputs, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleInputs, 0);
  objc_storeStrong((id *)&self->_interfaceIdiomInputs, 0);
}

- (TRAArbitrationInputs)initWithInterfaceIdiomInputs:(id)a3 userInterfaceStyleInputs:(id)a4 deviceOrientationInputs:(id)a5 keyboardInputs:(id)a6 ambientPresentationInputs:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_8:
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"TRAArbitration.m", 393, @"Invalid parameter not satisfying: %@", @"userInterfaceStyleInputs" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v30 = [MEMORY[0x263F08690] currentHandler];
  [v30 handleFailureInMethod:a2, self, @"TRAArbitration.m", 392, @"Invalid parameter not satisfying: %@", @"interfaceIdiomInputs" object file lineNumber description];

  if (!v14) {
    goto LABEL_8;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_9:
  v32 = [MEMORY[0x263F08690] currentHandler];
  [v32 handleFailureInMethod:a2, self, @"TRAArbitration.m", 394, @"Invalid parameter not satisfying: %@", @"deviceOrientationInputs" object file lineNumber description];

LABEL_4:
  v33.receiver = self;
  v33.super_class = (Class)TRAArbitrationInputs;
  v18 = [(TRAArbitrationInputs *)&v33 init];
  if (v18)
  {
    uint64_t v19 = [v13 copy];
    interfaceIdiomInputs = v18->_interfaceIdiomInputs;
    v18->_interfaceIdiomInputs = (TRAArbitrationInterfaceIdiomInputs *)v19;

    uint64_t v21 = [v14 copy];
    userInterfaceStyleInputs = v18->_userInterfaceStyleInputs;
    v18->_userInterfaceStyleInputs = (TRAArbitrationUserInterfaceStyleInputs *)v21;

    uint64_t v23 = [v15 copy];
    deviceOrientationInputs = v18->_deviceOrientationInputs;
    v18->_deviceOrientationInputs = (TRAArbitrationDeviceOrientationInputs *)v23;

    uint64_t v25 = [v16 copy];
    keyboardInputs = v18->_keyboardInputs;
    v18->_keyboardInputs = (TRAArbitrationKeyboardInputs *)v25;

    uint64_t v27 = [v17 copy];
    ambientPresentationInputs = v18->_ambientPresentationInputs;
    v18->_ambientPresentationInputs = (TRAArbitrationAmbientPresentationInputs *)v27;
  }
  return v18;
}

- (TRAArbitrationKeyboardInputs)keyboardInputs
{
  return self->_keyboardInputs;
}

- (TRAArbitrationInterfaceIdiomInputs)interfaceIdiomInputs
{
  return self->_interfaceIdiomInputs;
}

- (TRAArbitrationAmbientPresentationInputs)ambientPresentationInputs
{
  return self->_ambientPresentationInputs;
}

- (TRAArbitrationInputs)initWithInterfaceIdiomInputs:(id)a3 deviceOrientationInputs:(id)a4 keyboardInputs:(id)a5 ambientPresentationInputs:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[TRAArbitrationUserInterfaceStyleInputs alloc] initWithUserInterfaceStyle:0];
  id v15 = [(TRAArbitrationInputs *)self initWithInterfaceIdiomInputs:v13 userInterfaceStyleInputs:v14 deviceOrientationInputs:v12 keyboardInputs:v11 ambientPresentationInputs:v10];

  return v15;
}

- (id)succinctDescription
{
  v2 = [(TRAArbitrationInputs *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__TRAArbitrationInputs_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_265543D20;
  id v4 = v3;
  id v8 = v4;
  v9 = self;
  [v4 appendBodySectionWithName:0 multilinePrefix:@"\t" block:v7];
  id v5 = v4;

  return v5;
}

id __50__TRAArbitrationInputs_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 8) withName:@"interfaceIdiomInputs"];
  id v3 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"userInterfaceStyleInputs"];
  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"deviceOrientationInputs"];
  id v5 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"keyboardInputs"];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"ambientPresentationInputs"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(TRAArbitrationInputs *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

@end