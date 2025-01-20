@interface MXMProbeDisplay
+ (MXMDisplayDescriptor)mainDescriptor;
+ (NSArray)descriptors;
+ (id)probe;
+ (id)probeWithDescriptor:(id)a3;
- (MXMProbeDisplay)init;
- (MXMProbeDisplay)initWithDescriptor:(id)a3;
- (void)_beginUpdates;
- (void)_stopUpdates;
@end

@implementation MXMProbeDisplay

+ (MXMDisplayDescriptor)mainDescriptor
{
  uint64_t v6 = 0;
  v7 = (id *)&v6;
  uint64_t v8 = 0x3042000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  id v11 = 0;
  v2 = [a1 descriptors];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__MXMProbeDisplay_mainDescriptor__block_invoke;
  v5[3] = &unk_264525230;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  id WeakRetained = objc_loadWeakRetained(v7 + 5);
  _Block_object_dispose(&v6, 8);
  objc_destroyWeak(&v11);
  return (MXMDisplayDescriptor *)WeakRetained;
}

void __33__MXMProbeDisplay_mainDescriptor__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id obj = a2;
  if ([obj main])
  {
    objc_storeWeak((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
    *a4 = 1;
  }
}

+ (NSArray)descriptors
{
  v2 = objc_opt_class();
  return (NSArray *)[v2 _allDescriptors];
}

+ (id)probe
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

+ (id)probeWithDescriptor:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v4];

  return v5;
}

- (MXMProbeDisplay)init
{
  v3 = [(id)objc_opt_class() mainDescriptor];

  if (v3)
  {
    id v4 = [(id)objc_opt_class() mainDescriptor];
    self = [(MXMProbeDisplay *)self initWithDescriptor:v4];

    v3 = self;
  }

  return v3;
}

- (MXMProbeDisplay)initWithDescriptor:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MXMProbeDisplay;
  uint64_t v6 = [(MXMProbe *)&v16 init];
  if (v6)
  {
    if (!v5)
    {
      v13 = [MEMORY[0x263F08690] currentHandler];
      [v13 handleFailureInMethod:a2 object:v6 file:@"MXMDisplayProbe.m" lineNumber:120 description:@"Cannot initialize a screen probe with a nil target!"];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = [MEMORY[0x263F08690] currentHandler];
      [v14 handleFailureInMethod:a2 object:v6 file:@"MXMDisplayProbe.m" lineNumber:121 description:@"Cannot initialize a screen probe with a non-MXMProbeScreenDescriptor instance target!"];
    }
    v7 = [MXMDisplayProbe_iphoneOS_Internal alloc];
    uint64_t v8 = [(MXMProbe *)v6 updateQueue];
    uint64_t v9 = [(MXMDisplayProbe_iphoneOS_Internal *)v7 initPrivateWithDescriptor:v5 queue:v8];
    impl = v6->_impl;
    v6->_impl = (MXMDisplayProbePlatform *)v9;

    id v11 = v6->_impl;
    if (!v11)
    {
      v15 = [MEMORY[0x263F08690] currentHandler];
      [v15 handleFailureInMethod:a2 object:v6 file:@"MXMDisplayProbe.m" lineNumber:133 description:@"Failed to initialize platform screen probe."];

      id v11 = v6->_impl;
    }
    [(MXMDisplayProbePlatform *)v11 setDelegate:v6];
  }

  return v6;
}

- (void)_beginUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)MXMProbeDisplay;
  [(MXMProbe *)&v3 _beginUpdates];
  [(MXMDisplayProbePlatform *)self->_impl _start];
}

- (void)_stopUpdates
{
  v3.receiver = self;
  v3.super_class = (Class)MXMProbeDisplay;
  [(MXMProbe *)&v3 _stopUpdates];
  [(MXMDisplayProbePlatform *)self->_impl _stop];
}

- (void).cxx_destruct
{
}

@end