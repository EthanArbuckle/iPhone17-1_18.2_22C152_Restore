@interface TUIIdentifierMap
+ (id)describeForDebuggingIdentifierIndex:(unint64_t)a3 package:(id)a4;
- (NSUUID)UUID;
- (TUIIdentifier)loadingIdentifier;
- (TUIIdentifierMap)init;
- (TUIIdentifierMap)initWithUUID:(id)a3;
- (TUIRenderModelIdentifierMap)renderModelIdentifierMap;
- (id)identifierWithNode:(id)a3 baseIdentifier:(id)a4;
@end

@implementation TUIIdentifierMap

- (TUIIdentifierMap)init
{
  v3 = +[NSUUID UUID];
  v4 = [(TUIIdentifierMap *)self initWithUUID:v3];

  return v4;
}

- (TUIIdentifierMap)initWithUUID:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TUIIdentifierMap;
  v6 = [(TUIIdentifierMap *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_UUID, a3);
    uint64_t v8 = objc_opt_new();
    renderModelIdentifierMap = v7->_renderModelIdentifierMap;
    v7->_renderModelIdentifierMap = (TUIRenderModelIdentifierMap *)v8;

    loadingIdentifier = v7->_loadingIdentifier;
    v7->_loadingIdentifier = (TUIIdentifier *)&off_267AC0;
  }
  return v7;
}

- (id)identifierWithNode:(id)a3 baseIdentifier:(id)a4
{
  id v5 = a4;
  if (TUIElementNodeNotNil(a3.var0))
  {
    v6 = +[NSNumber numberWithUnsignedInt:(2 * a3.var0) | 1];
    v7 = v6;
    if (v5)
    {
      [v5 tui_identifierByAppendingIndex:[v6 unsignedIntegerValue]];
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = v6;
    }
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)describeForDebuggingIdentifierIndex:(unint64_t)a3 package:(id)a4
{
  if (a3)
  {
    [a4 debugLocationForNode:(a3 >> 1) v4];
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = @"Other:Loading";
  }
  return v6;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (TUIRenderModelIdentifierMap)renderModelIdentifierMap
{
  return self->_renderModelIdentifierMap;
}

- (TUIIdentifier)loadingIdentifier
{
  return self->_loadingIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderModelIdentifierMap, 0);
  objc_storeStrong((id *)&self->_UUID, 0);

  objc_storeStrong((id *)&self->_loadingIdentifier, 0);
}

@end