@interface TUIElementHostedAnchor
+ (Class)builderClass;
+ (Class)objectClass;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
@end

@implementation TUIElementHostedAnchor

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v23 = a6;
  uint64_t var0 = a4.var0;
  id v10 = a5;
  id v11 = a3;
  v12 = [v10 stringForAttribute:212 node:a4.var0];
  v13 = [v10 stringForAttribute:104 node:a4.var0];
  v14 = [v10 stringForAttribute:155 node:var0];
  unint64_t v15 = +[TUIHostedBox presentationFromString:v14];

  v16 = [v10 stringForAttribute:12 node:var0];
  unint64_t v17 = +[TUIHostedBox arrowDirectionFromString:v16];

  v18 = [v10 stringForAttribute:67 node:var0];
  if (v15 <= 1) {
    unint64_t v15 = 1;
  }
  v19 = [v10 stringForAttribute:94 node:var0];
  id v20 = [v10 unsignedIntegerForAttribute:95 withDefault:0 node:var0];

  v21 = [[TUIHostingProperties alloc] initWithPresentation:v15 flags:0 arrowDirection:v17 groupIdentifier:v19 groupPriority:v20 designatedIdentifier:v18];
  if ([v12 length] && objc_msgSend(v13, "length")) {
    v22 = [[TUIHostingIdentifier alloc] initWithType:v12 identifier:v13];
  }
  else {
    v22 = 0;
  }
  [v11 setHostingIdentifier:v22];
  [v11 setHostingProperties:v21];

  if (!v22) {
    [v23 reportError:1001];
  }
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v5 = [a4 finalizeModelsWithParent:a3 box:a3 context:a5];
}

@end