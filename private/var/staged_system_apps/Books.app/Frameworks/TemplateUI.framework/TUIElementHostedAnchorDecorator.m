@interface TUIElementHostedAnchorDecorator
+ (id)requiredBuilderProtocol;
+ (unint64_t)definesScopes;
+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6;
@end

@implementation TUIElementHostedAnchorDecorator

+ (unint64_t)definesScopes
{
  return 0;
}

+ (id)requiredBuilderProtocol
{
  return &OBJC_PROTOCOL___TUIHostedAnchorConsuming;
}

+ (void)configureContainingBuilder:(id)a3 withNode:(id)a4 attributes:(id)a5 context:(id)a6
{
  uint64_t var0 = a4.var0;
  id v8 = a5;
  id v9 = a3;
  id v31 = [v8 stringForAttribute:212 node:var0];
  v10 = [v8 stringForAttribute:104 node:var0];
  v11 = [v8 stringForAttribute:155 node:var0];
  unint64_t v12 = +[TUIHostedBox presentationFromString:v11];

  v13 = [v8 stringForAttribute:12 node:var0];
  unint64_t v14 = +[TUIHostedBox arrowDirectionFromString:v13];

  v15 = [v8 stringForAttribute:67 node:var0];
  v16 = [v8 stringForAttribute:94 node:var0];
  id v17 = [v8 unsignedIntegerForAttribute:95 withDefault:0 node:var0];

  if (v12 <= 1) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = v12;
  }
  v19 = [[TUIHostingProperties alloc] initWithPresentation:v18 flags:0 arrowDirection:v14 groupIdentifier:v16 groupPriority:v17 designatedIdentifier:v15];
  if ([v31 length] && objc_msgSend(v10, "length")) {
    v20 = [[TUIHostingIdentifier alloc] initWithType:v31 identifier:v10];
  }
  else {
    v20 = 0;
  }
  uint64_t v21 = [v9 hostingIdentifiers];
  v22 = (void *)v21;
  if (v21) {
    v23 = (void *)v21;
  }
  else {
    v23 = &__NSArray0__struct;
  }
  id v24 = v23;

  uint64_t v25 = [v9 hostingProperities];
  v26 = (void *)v25;
  if (v25) {
    v27 = (void *)v25;
  }
  else {
    v27 = &__NSArray0__struct;
  }
  id v28 = v27;

  v29 = [v24 arrayByAddingObject:v20];
  [v9 setHostingIdentifiers:v29];

  v30 = [v28 arrayByAddingObject:v19];

  [v9 setHostingProperities:v30];
}

@end