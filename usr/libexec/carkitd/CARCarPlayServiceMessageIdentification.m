@interface CARCarPlayServiceMessageIdentification
+ (unint64_t)identifier;
- (BOOL)supportsEnhancedIntegration;
- (BOOL)supportsThemeAssets;
- (BOOL)supportsWiredCarPlay;
- (BOOL)supportsWiredToWirelessPairing;
- (CARCarPlayServiceMessageIdentification)initWithDictionaryRepresentation:(id)a3;
- (CARCarPlayServiceMessageIdentification)initWithDisplayName:(id)a3 modelName:(id)a4 PPID:(id)a5 authenticationSerialNumber:(id)a6 accessoryProtocols:(id)a7 supportsWiredCarPlay:(BOOL)a8 supportsWiredToWirelessPairing:(BOOL)a9 supportsEnhancedIntegration:(BOOL)a10 supportsThemeAssets:(BOOL)a11;
- (NSArray)accessoryProtocols;
- (NSData)authenticationSerialNumber;
- (NSString)PPID;
- (NSString)description;
- (NSString)displayName;
- (NSString)modelName;
- (id)dictionaryRepresentation;
@end

@implementation CARCarPlayServiceMessageIdentification

- (CARCarPlayServiceMessageIdentification)initWithDisplayName:(id)a3 modelName:(id)a4 PPID:(id)a5 authenticationSerialNumber:(id)a6 accessoryProtocols:(id)a7 supportsWiredCarPlay:(BOOL)a8 supportsWiredToWirelessPairing:(BOOL)a9 supportsEnhancedIntegration:(BOOL)a10 supportsThemeAssets:(BOOL)a11
{
  id v18 = a3;
  id v19 = a4;
  id v25 = a5;
  id v24 = a6;
  id v20 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CARCarPlayServiceMessageIdentification;
  v21 = [(CARCarPlayServiceMessageIdentification *)&v26 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_displayName, a3);
    objc_storeStrong((id *)&v22->_modelName, a4);
    objc_storeStrong((id *)&v22->_PPID, a5);
    objc_storeStrong((id *)&v22->_authenticationSerialNumber, a6);
    objc_storeStrong((id *)&v22->_accessoryProtocols, a7);
    v22->_supportsWiredCarPlay = a8;
    v22->_supportsWiredToWirelessPairing = a9;
    v22->_supportsEnhancedIntegration = a10;
    v22->_supportsThemeAssets = a11;
  }

  return v22;
}

- (NSString)description
{
  v15.receiver = self;
  v15.super_class = (Class)CARCarPlayServiceMessageIdentification;
  v14 = [(CARCarPlayServiceMessageIdentification *)&v15 description];
  v13 = [(CARCarPlayServiceMessageIdentification *)self displayName];
  v3 = [(CARCarPlayServiceMessageIdentification *)self modelName];
  v4 = [(CARCarPlayServiceMessageIdentification *)self PPID];
  v5 = [(CARCarPlayServiceMessageIdentification *)self authenticationSerialNumber];
  v6 = [(CARCarPlayServiceMessageIdentification *)self accessoryProtocols];
  if ([(CARCarPlayServiceMessageIdentification *)self supportsWiredCarPlay]) {
    CFStringRef v7 = @"YES";
  }
  else {
    CFStringRef v7 = @"NO";
  }
  if ([(CARCarPlayServiceMessageIdentification *)self supportsWiredToWirelessPairing]) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  if ([(CARCarPlayServiceMessageIdentification *)self supportsEnhancedIntegration]) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  if ([(CARCarPlayServiceMessageIdentification *)self supportsThemeAssets]) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  v11 = +[NSString stringWithFormat:@"%@ {displayName: %@, modelName: %@, PPID: %@, authSerial: %@, protocols: %@, supportsWired: %@, supportsOOBPairing: %@, supportsEnhancedIntegration: %@, supportsThemeAssets: %@}", v14, v13, v3, v4, v5, v6, v7, v8, v9, v10];

  return (NSString *)v11;
}

+ (unint64_t)identifier
{
  return 1;
}

- (CARCarPlayServiceMessageIdentification)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    id v5 = [v4 objectForKey:@"displayName"];
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if (v6)
    {
      objc_opt_class();
      id v7 = [v4 objectForKey:@"modelName"];
      if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
        CFStringRef v8 = v7;
      }
      else {
        CFStringRef v8 = 0;
      }

      if (v8)
      {
        objc_opt_class();
        id v10 = [v4 objectForKey:@"PPID"];
        if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
          v11 = v10;
        }
        else {
          v11 = 0;
        }

        if (v11)
        {
          objc_opt_class();
          id v12 = [v4 objectForKey:@"authSerial"];
          if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
            v13 = v12;
          }
          else {
            v13 = 0;
          }

          if (v13)
          {
            objc_opt_class();
            id v14 = [v4 objectForKey:@"accessoryProtocols"];
            if (v14 && (objc_opt_isKindOfClass() & 1) != 0) {
              id v15 = v14;
            }
            else {
              id v15 = 0;
            }
            v38 = v13;

            if (v15)
            {
              v36 = v11;
              long long v41 = 0u;
              long long v42 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              v16 = v15;
              v17 = (char *)[v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
              if (v17)
              {
                id v18 = v17;
                uint64_t v19 = *(void *)v40;
                while (2)
                {
                  for (i = 0; i != v18; ++i)
                  {
                    if (*(void *)v40 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {

                      CFStringRef v9 = 0;
                      v11 = v36;
                      v13 = v38;
                      goto LABEL_68;
                    }
                  }
                  id v18 = (char *)[v16 countByEnumeratingWithState:&v39 objects:v43 count:16];
                  if (v18) {
                    continue;
                  }
                  break;
                }
              }
              id v35 = v6;

              v11 = v36;
            }
            else
            {
              id v35 = v6;
              v16 = &__NSArray0__struct;
            }
            objc_opt_class();
            id v21 = [v4 objectForKey:@"supportsWired"];
            if (v21 && (objc_opt_isKindOfClass() & 1) != 0) {
              id v22 = v21;
            }
            else {
              id v22 = 0;
            }

            objc_opt_class();
            id v23 = [v4 objectForKey:@"supportsOOBPairing"];
            if (v23 && (objc_opt_isKindOfClass() & 1) != 0) {
              id v33 = v23;
            }
            else {
              id v33 = 0;
            }

            objc_opt_class();
            id v24 = [v4 objectForKey:@"supportsEnhancedIntegration"];
            if (v24 && (objc_opt_isKindOfClass() & 1) != 0) {
              id v25 = v24;
            }
            else {
              id v25 = 0;
            }

            objc_opt_class();
            id v26 = [v4 objectForKey:@"supportsThemeAssets"];
            if (v26 && (objc_opt_isKindOfClass() & 1) != 0) {
              id v32 = v26;
            }
            else {
              id v32 = 0;
            }

            unsigned int v34 = [v22 BOOLValue];
            v37 = v22;
            unsigned __int8 v27 = [v33 BOOLValue];
            v28 = v25;
            unsigned __int8 v29 = [v25 BOOLValue];
            BYTE2(v31) = [v32 BOOLValue];
            BYTE1(v31) = v29;
            LOBYTE(v31) = v27;
            v13 = v38;
            self = -[CARCarPlayServiceMessageIdentification initWithDisplayName:modelName:PPID:authenticationSerialNumber:accessoryProtocols:supportsWiredCarPlay:supportsWiredToWirelessPairing:supportsEnhancedIntegration:supportsThemeAssets:](self, "initWithDisplayName:modelName:PPID:authenticationSerialNumber:accessoryProtocols:supportsWiredCarPlay:supportsWiredToWirelessPairing:supportsEnhancedIntegration:supportsThemeAssets:", v35, v8, v11, v38, v16, v34, v31);

            id v6 = v35;
            CFStringRef v9 = self;
          }
          else
          {
            v16 = sub_10005C6FC(2uLL);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              sub_100072B90();
            }
            CFStringRef v9 = 0;
          }
LABEL_68:
        }
        else
        {
          v13 = sub_10005C6FC(2uLL);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            sub_100072B1C();
          }
          CFStringRef v9 = 0;
        }
      }
      else
      {
        v11 = sub_10005C6FC(2uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100072AA8();
        }
        CFStringRef v9 = 0;
      }
    }
    else
    {
      CFStringRef v8 = sub_10005C6FC(2uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100072A34();
      }
      CFStringRef v9 = 0;
    }
  }
  else
  {
    CFStringRef v9 = 0;
  }

  return v9;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = [(CARCarPlayServiceMessageIdentification *)self displayName];
  [v3 cr_setSafeObject:v4 forKey:@"displayName"];

  id v5 = [(CARCarPlayServiceMessageIdentification *)self modelName];
  [v3 cr_setSafeObject:v5 forKey:@"modelName"];

  id v6 = [(CARCarPlayServiceMessageIdentification *)self PPID];
  [v3 cr_setSafeObject:v6 forKey:@"PPID"];

  id v7 = [(CARCarPlayServiceMessageIdentification *)self authenticationSerialNumber];
  [v3 cr_setSafeObject:v7 forKey:@"authSerial"];

  CFStringRef v8 = [(CARCarPlayServiceMessageIdentification *)self accessoryProtocols];
  [v3 cr_setSafeObject:v8 forKey:@"accessoryProtocols"];

  CFStringRef v9 = +[NSNumber numberWithBool:[(CARCarPlayServiceMessageIdentification *)self supportsWiredCarPlay]];
  [v3 cr_setSafeObject:v9 forKey:@"supportsWired"];

  id v10 = +[NSNumber numberWithBool:[(CARCarPlayServiceMessageIdentification *)self supportsWiredToWirelessPairing]];
  [v3 cr_setSafeObject:v10 forKey:@"supportsOOBPairing"];

  v11 = +[NSNumber numberWithBool:[(CARCarPlayServiceMessageIdentification *)self supportsEnhancedIntegration]];
  [v3 cr_setSafeObject:v11 forKey:@"supportsEnhancedIntegration"];

  id v12 = +[NSNumber numberWithBool:[(CARCarPlayServiceMessageIdentification *)self supportsThemeAssets]];
  [v3 cr_setSafeObject:v12 forKey:@"supportsThemeAssets"];

  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSString)PPID
{
  return self->_PPID;
}

- (NSData)authenticationSerialNumber
{
  return self->_authenticationSerialNumber;
}

- (NSArray)accessoryProtocols
{
  return self->_accessoryProtocols;
}

- (BOOL)supportsWiredCarPlay
{
  return self->_supportsWiredCarPlay;
}

- (BOOL)supportsWiredToWirelessPairing
{
  return self->_supportsWiredToWirelessPairing;
}

- (BOOL)supportsEnhancedIntegration
{
  return self->_supportsEnhancedIntegration;
}

- (BOOL)supportsThemeAssets
{
  return self->_supportsThemeAssets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryProtocols, 0);
  objc_storeStrong((id *)&self->_authenticationSerialNumber, 0);
  objc_storeStrong((id *)&self->_PPID, 0);
  objc_storeStrong((id *)&self->_modelName, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end