@interface TRDeviceSetupAction
+ (id)actionWithActionType:(id)a3 parameters:(id)a4;
+ (id)actionWithData:(id)a3 error:(id *)a4 supportsLegacy:(BOOL)a5;
- (NSDictionary)parameters;
- (NSString)actionType;
- (TRDeviceSetupAction)init;
- (id)_initWithActionType:(id)a3 parameters:(id)a4;
- (id)dataRepresentationWithError:(id *)a3;
- (id)description;
- (id)propertyListRepresentation;
- (unint64_t)protocolVersion;
@end

@implementation TRDeviceSetupAction

- (TRDeviceSetupAction)init
{
  return (TRDeviceSetupAction *)[(TRDeviceSetupAction *)self _initWithActionType:0 parameters:0];
}

- (id)_initWithActionType:(id)a3 parameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TRDeviceSetupAction;
  v8 = [(TRDeviceSetupAction *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    actionType = v8->_actionType;
    v8->_actionType = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    parameters = v8->_parameters;
    v8->_parameters = (NSDictionary *)v11;
  }
  return v8;
}

+ (id)actionWithActionType:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithActionType:v7 parameters:v6];

  return v8;
}

- (id)propertyListRepresentation
{
  uint64_t v3 = [(TRDeviceSetupAction *)self actionType];
  v4 = (void *)v3;
  v5 = &stru_26C5827A8;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  id v6 = v5;

  id v7 = [MEMORY[0x263EFF9A0] dictionary];
  [v7 setObject:v6 forKey:@"a2"];

  v8 = [(TRDeviceSetupAction *)self parameters];

  if (v8)
  {
    uint64_t v9 = [(TRDeviceSetupAction *)self parameters];
    [v7 setObject:v9 forKey:@"p2"];
  }
  [v7 setObject:&unk_26C58CCB0 forKey:@"_v_"];
  v10 = (void *)[v7 copy];

  return v10;
}

- (id)description
{
  uint64_t v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)TRDeviceSetupAction;
  v4 = [(TRDeviceSetupAction *)&v9 description];
  v5 = [(TRDeviceSetupAction *)self actionType];
  id v6 = [(TRDeviceSetupAction *)self parameters];
  id v7 = [v3 stringWithFormat:@"%@ action: \"%@\"; paramaters: %@", v4, v5, v6];

  return v7;
}

- (unint64_t)protocolVersion
{
  return 0;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
}

+ (id)actionWithData:(id)a3 error:(id *)a4 supportsLegacy:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  objc_super v9 = v8;
  if (!v8)
  {
    id v18 = objc_alloc_init((Class)a1);
    goto LABEL_45;
  }
  id v10 = v8;
  uint64_t v11 = objc_msgSend(v10, "TR_decompressedGzipData");
  v12 = v11;
  if (v11)
  {
    id v13 = v11;

    id v10 = v13;
  }
  objc_super v14 = [MEMORY[0x263F08AC0] propertyListWithData:v10 options:0 format:0 error:a4];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [v14 objectForKeyedSubscript:@"a2"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v15 = 0;
      }
      v16 = [v14 objectForKeyedSubscript:@"p2"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v16 = 0;
      }
      v17 = [v14 objectForKeyedSubscript:@"a"];
      if ([v17 length] && !v5 && !v15)
      {
        id v18 = 0;
LABEL_43:

        goto LABEL_44;
      }
      if (![v17 length] || !v5)
      {
        if ([v15 isEqualToString:@"connect"])
        {
          v21 = TRDeviceSetupConnectAction;
        }
        else if ([v15 isEqualToString:@"auth"])
        {
          v21 = TRDeviceSetupAuthenticateAction;
        }
        else if ([v15 isEqualToString:@"setup"])
        {
          v21 = TRDeviceSetupGeneralSetupAction;
        }
        else if ([v15 isEqualToString:@"finish"])
        {
          v21 = TRDeviceSetupFinishAction;
        }
        else if ([v15 isEqualToString:@"cancel"])
        {
          v21 = TRDeviceSetupCancelAction;
        }
        else
        {
          v21 = (__objc2_class *)a1;
        }
        id v18 = [(__objc2_class *)v21 actionWithActionType:v15 parameters:v16];
        goto LABEL_43;
      }
      v19 = [v14 objectForKeyedSubscript:@"p"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v19 = 0;
      }
      if ([v17 isEqualToString:@"auth"])
      {
        v20 = off_264220498;
      }
      else if ([v17 isEqualToString:@"setup"])
      {
        v20 = off_2642204B0;
      }
      else if ([v17 isEqualToString:@"cancel"])
      {
        v20 = off_2642204A0;
      }
      else
      {
        if (![v17 isEqualToString:@"finish"])
        {
          id v18 = 0;
          goto LABEL_35;
        }
        v20 = off_2642204A8;
      }
      id v18 = [(__objc2_class *)*v20 actionWithActionType:v17 parameters:v19];
LABEL_35:

      goto LABEL_43;
    }
  }
  id v18 = 0;
LABEL_44:

LABEL_45:
  return v18;
}

- (id)dataRepresentationWithError:(id *)a3
{
  v4 = (void *)MEMORY[0x263F08AC0];
  BOOL v5 = [(TRDeviceSetupAction *)self propertyListRepresentation];
  id v6 = [v4 dataWithPropertyList:v5 format:200 options:0 error:a3];
  id v7 = objc_msgSend(v6, "TR_compressedGzipData");

  return v7;
}

@end