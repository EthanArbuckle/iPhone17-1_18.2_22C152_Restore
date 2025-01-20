@interface BSUIElementAudiobookControl
+ (Class)objectClass;
+ (id)supportedAttributes;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation BSUIElementAudiobookControl

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)supportedAttributes
{
  if (qword_3D40F8 != -1) {
    dispatch_once(&qword_3D40F8, &stru_38E9D0);
  }
  v2 = (void *)qword_3D40F0;

  return v2;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v22 = [v10 objectForAttribute:113 node:var0];
  v12 = [v10 objectForAttribute:150 node:var0];

  v13 = [v9 manager];
  v14 = [v13 dynamicRegistry];
  v15 = [v14 progressProviderForKind:@"audiobookProgress"];

  v16 = [v15 dynamicProgressForKind:@"chapterProgress" instance:v22 parameters:v12];
  v17 = BUProtocolCast();

  v18 = [v9 manager];

  v19 = [v18 dynamicRegistry];
  v20 = [v19 stateProviderForKind:@"libraryItem"];

  v21 = [v20 dynamicStateForKind:@"libraryItem" instance:v22 parameters:v12];
  [v11 setDynamicAudiobookProgress:v17];
  [v11 setDynamicState:v21];
}

@end