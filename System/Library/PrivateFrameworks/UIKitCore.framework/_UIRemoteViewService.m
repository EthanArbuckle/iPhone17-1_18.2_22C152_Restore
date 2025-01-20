@interface _UIRemoteViewService
+ (_UIRemoteViewService)allocWithZone:(_NSZone *)a3;
- (PKPlugIn)plugin;
- (_UIRemoteViewService)init;
- (_UIRemoteViewService)initWithExtension:(id)a3 andContextToken:(id)a4;
- (_UIRemoteViewService)initWithPlugIn:(id)a3 andContextToken:(id)a4;
- (id)_init;
- (void)beginUsing:(id)a3;
- (void)endUsing:(id)a3;
@end

@implementation _UIRemoteViewService

+ (_UIRemoteViewService)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38___UIRemoteViewService_allocWithZone___block_invoke;
    block[3] = &__block_descriptor_48_e5_v8__0l;
    block[4] = a3;
    block[5] = a1;
    if (qword_1EB25BF88 != -1) {
      dispatch_once(&qword_1EB25BF88, block);
    }
    v6 = (void *)_MergedGlobals_1_28;
    return (_UIRemoteViewService *)v6;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS____UIRemoteViewService;
    return (_UIRemoteViewService *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIRemoteViewService;
  return [(_UIRemoteViewService *)&v3 init];
}

- (_UIRemoteViewService)initWithPlugIn:(id)a3 andContextToken:(id)a4
{
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F28C70];
  v9 = [a3 identifier];
  id v16 = 0;
  v10 = [v8 extensionWithIdentifier:v9 error:&v16];
  id v11 = v16;

  if (!v10)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = [v11 localizedDescription];
    [v14 handleFailureInMethod:a2, self, @"_UIRemoteViewService.m", 48, @"extension was nil - error %@", v15 object file lineNumber description];
  }
  v12 = [(_UIRemoteViewService *)self initWithExtension:v10 andContextToken:v7];

  return v12;
}

- (_UIRemoteViewService)initWithExtension:(id)a3 andContextToken:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[_UIConcreteRemoteViewService alloc] initWithExtension:v7 andContextToken:v6];

  return &v8->super;
}

- (_UIRemoteViewService)init
{
  objc_super v3 = objc_alloc_init(_UIConcreteRemoteViewService);

  return &v3->super;
}

- (PKPlugIn)plugin
{
  return 0;
}

- (void)beginUsing:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIRemoteViewService.m", 79, @"Abstract method called %s", "-[_UIRemoteViewService beginUsing:]");
}

- (void)endUsing:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_UIRemoteViewService.m", 83, @"Abstract method called %s", "-[_UIRemoteViewService endUsing:]");
}

@end