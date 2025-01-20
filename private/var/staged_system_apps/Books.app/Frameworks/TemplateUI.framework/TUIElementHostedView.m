@interface TUIElementHostedView
+ (Class)objectClass;
+ (unint64_t)definesScopes;
+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementHostedView

+ (unint64_t)definesScopes
{
  return 0;
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (void)configureBox:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  id v29 = a5;
  id v9 = a6;
  uint64_t var0 = a4.var0;
  id v11 = a3;
  v12 = [v29 stringForAttribute:212 node:a4.var0];
  v28 = [v29 stringForAttribute:104 node:var0];
  v13 = [v29 stringForAttribute:155 node:var0];
  +[TUIHostedBox presentationFromString:v13];

  v14 = [v29 stringForAttribute:12 node:var0];
  unint64_t v15 = +[TUIHostedBox arrowDirectionFromString:v14];

  v26 = [v29 stringForAttribute:67 node:var0];
  v16 = [v29 stringForAttribute:94 node:var0];
  id v17 = [v29 unsignedIntegerForAttribute:95 withDefault:0 node:var0];
  v27 = [v29 objectForAttribute:150 node:var0];
  if ([v12 length])
  {
    v18 = [v9 manager];
    v19 = [v18 viewRegistry];
    unsigned int v20 = [v19 useHostedViewFactoryForType:v12];

    if (v20)
    {
      v21 = v9;
      v22 = [v9 modelIdentifierWithNode:var0];
    }
    else
    {
      v21 = v9;
      v22 = 0;
    }
    if ([v28 length]) {
      v23 = [[TUIHostingIdentifier alloc] initWithType:v12 identifier:v28 parameters:v27 modelIdentifier:v22];
    }
    else {
      v23 = 0;
    }
  }
  else
  {
    v21 = v9;
    v23 = 0;
    v22 = 0;
  }
  v24 = [[TUIHostingProperties alloc] initWithPresentation:0 flags:0 arrowDirection:v15 groupIdentifier:v16 groupPriority:v17 designatedIdentifier:v26];
  [v11 setHostingIdentifier:v23];
  [v11 setHostingProperties:v24];
  v25 = [v29 stringForAttribute:11 node:var0];
  [v11 setAnchorRefId:v25];

  [v29 insetsForAttribute:112 node:var0];
  [v11 setInsets:];

  if (!v23) {
    [v21 reportError:1001];
  }
}

@end