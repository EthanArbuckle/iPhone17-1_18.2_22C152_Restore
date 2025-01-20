@interface JSAPackageProvisioner
- (JSAPackageProvisioner)init;
- (JSAPackageProvisioner)initWithLaunching:(BOOL)a3;
- (JSAPackageProvisioner)initWithLaunching:(BOOL)a3 onQueue:(id)a4;
- (JSAPackageProvisioner)initWithLaunching:(BOOL)a3 processVariant:(int64_t)a4 overridePackageURLCachePath:(id)a5 on:(id)a6;
- (void)provisionWithCompletionHandler:(id)a3;
@end

@implementation JSAPackageProvisioner

- (JSAPackageProvisioner)initWithLaunching:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_CC4B8 != -1) {
    swift_once();
  }
  uint64_t v5 = *(void *)(qword_CD290 + OBJC_IVAR___JSAProcessEnvironment__variant);
  v6 = (void *)sub_86310();
  v7 = [(JSAPackageProvisioner *)self initWithLaunching:v3 processVariant:v5 overridePackageURLCachePath:0 on:v6];

  return v7;
}

- (JSAPackageProvisioner)initWithLaunching:(BOOL)a3 onQueue:(id)a4
{
  BOOL v4 = a3;
  uint64_t v6 = qword_CC4B8;
  id v7 = a4;
  if (v6 != -1) {
    swift_once();
  }
  v8 = [(JSAPackageProvisioner *)self initWithLaunching:v4 processVariant:*(void *)(qword_CD290 + OBJC_IVAR___JSAProcessEnvironment__variant) overridePackageURLCachePath:0 on:v7];

  return v8;
}

- (JSAPackageProvisioner)initWithLaunching:(BOOL)a3 processVariant:(int64_t)a4 overridePackageURLCachePath:(id)a5 on:(id)a6
{
  if (a5)
  {
    uint64_t v9 = sub_86860();
    uint64_t v11 = v10;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
  }
  id v12 = a6;
  v13 = (JSAPackageProvisioner *)sub_3E6A8(a3, a4, v9, v11, v12);

  return v13;
}

- (void)provisionWithCompletionHandler:(id)a3
{
  BOOL v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  swift_retain();
  PackageProvisioner.provision(completionHandler:)((uint64_t)sub_3ECC8, v4);
  swift_release();

  swift_release();
}

- (JSAPackageProvisioner)init
{
  swift_defaultActor_initialize();
  result = (JSAPackageProvisioner *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end