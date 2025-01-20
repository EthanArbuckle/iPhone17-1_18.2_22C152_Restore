@interface TUIElementTextAttributed
+ (Class)builderClass;
+ (Class)objectClass;
+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6;
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5;
+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementTextAttributed

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIAttributedStringConsuming;
}

+ (Class)builderClass
{
  return (Class)objc_opt_class();
}

+ (Class)objectClass
{
  return (Class)objc_opt_class();
}

+ (id)builderWithNode:(id)a3 object:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a3.var0;
  id v7 = a5;
  v8 = [v7 colorForAttribute:51 node:var0];
  v9 = [v7 fontSpecForNode:var0];
  v10 = [v7 stringForAttribute:201 node:var0];
  int64_t v11 = +[TUIBox textAlignmentFromString:v10];

  v12 = [[TUIAttributedStringBuilder alloc] initWithFontSpec:v9 style:0 color:v8 textAlignment:v11];
  v13 = [v7 stringForAttribute:102 node:var0];

  [(TUIAttributedStringBuilder *)v12 setOptions:sub_5ED20(v13, 2uLL)];
  return v12;
}

+ (void)configureObject:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a3;
  id v9 = [a5 stringForAttribute:176 node:var0];
  [v8 setRole:v9];
}

+ (void)configureObject:(id)a3 withBuilder:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = [a4 finalizeTextModelWithContext:a5];
  [v7 setString:v8];
}

+ (void)addObject:(id)a3 toContainingBuilder:(id)a4 context:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 string];
  id v8 = [v7 role];

  [v6 addAttributedString:v9 forRole:v8];
}

@end