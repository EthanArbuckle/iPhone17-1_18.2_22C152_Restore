@interface TUIElementSmartGridAdornments
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7;
@end

@implementation TUIElementSmartGridAdornments

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL____TUIElementSmartGridAdornmentConsuming;
}

+ (void)instantiateChildrenOfNode:(id)a3 object:(id)a4 containingBuilder:(id)a5 context:(id)a6 block:(id)a7
{
  id v9 = a5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_5434;
  v12[3] = &unk_251780;
  id v13 = a6;
  id v14 = v9;
  id v10 = v9;
  id v11 = v13;
  [v11 enumerateChildrenOfNode:a3.var0 block:v12];
}

@end