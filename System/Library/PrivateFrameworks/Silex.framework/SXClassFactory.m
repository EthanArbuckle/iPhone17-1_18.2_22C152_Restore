@interface SXClassFactory
+ (Class)classForBaseClass:(Class)a3 type:(id)a4;
+ (id)valueClassBlockForBaseClass:(Class)a3;
+ (void)initialize;
+ (void)registerClass:(Class)a3 type:(id)a4 baseClass:(Class)a5;
+ (void)startTesting;
+ (void)stopTesting;
@end

@implementation SXClassFactory

+ (void)initialize
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  v3 = (void *)__registeredClasses;
  __registeredClasses = v2;

  +[SXJSONActionClassRegister registerClasses];
  +[SXAdditionClassRegister registerClasses];
  +[SXComponentAnimationClassRegister registerClasses];
  +[SXComponentBehaviorClassRegister registerClasses];
  +[SXComponentStyleClassRegister registerClasses];
  +[SXDataFormatClassRegister registerClasses];
  +[SXResourceClassRegister registerClasses];
}

+ (void)registerClass:(Class)a3 type:(id)a4 baseClass:(Class)a5
{
  id v8 = a4;
  v7 = [(id)__registeredClasses objectForKey:a5];
  if (!v7)
  {
    v7 = [MEMORY[0x263EFF9A0] dictionary];
    [(id)__registeredClasses setObject:v7 forKey:a5];
  }
  [v7 setObject:a3 forKey:v8];
}

+ (id)valueClassBlockForBaseClass:(Class)a3
{
  v4 = objc_msgSend((id)__registeredClasses, "objectForKey:");
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__SXClassFactory_valueClassBlockForBaseClass___block_invoke;
  v8[3] = &unk_264652010;
  id v9 = v4;
  Class v10 = a3;
  id v5 = v4;
  v6 = (void *)MEMORY[0x223CA5030](v8);

  return v6;
}

id __46__SXClassFactory_valueClassBlockForBaseClass___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) objectForKey:a2];
  v4 = v3;
  if (!v3) {
    v3 = *(void **)(a1 + 40);
  }
  id v5 = v3;

  return v5;
}

+ (Class)classForBaseClass:(Class)a3 type:(id)a4
{
  id v5 = (void *)__registeredClasses;
  id v6 = a4;
  v7 = [v5 objectForKey:a3];
  uint64_t v8 = [v7 objectForKey:v6];

  if (v8) {
    Class v9 = (Class)v8;
  }
  else {
    Class v9 = a3;
  }
  Class v10 = v9;

  return v10;
}

+ (void)startTesting
{
  objc_storeStrong((id *)&__registeredClassesWhileTesting, (id)__registeredClasses);
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = __registeredClasses;
  __registeredClasses = v2;
  MEMORY[0x270F9A758](v2, v3);
}

+ (void)stopTesting
{
  objc_storeStrong((id *)&__registeredClasses, (id)__registeredClassesWhileTesting);
  uint64_t v2 = (void *)__registeredClassesWhileTesting;
  __registeredClassesWhileTesting = 0;
}

@end