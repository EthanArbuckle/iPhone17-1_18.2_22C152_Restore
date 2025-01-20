@interface NFAppletExtraInfo
+ (id)infoWithDictionary:(id)a3 applet:(id)a4;
- (NFApplet)applet;
- (NSData)obgk;
- (NSData)ssdAID;
- (id)debugDescription;
@end

@implementation NFAppletExtraInfo

+ (id)infoWithDictionary:(id)a3 applet:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (id *)objc_opt_new();
  objc_storeStrong(v9 + 1, a4);
  v10 = [v8 identifier];
  v11 = [v7 objectForKeyedSubscript:@"appletAid"];
  char v12 = [v10 isEqual:v11];

  if (v12)
  {
    v13 = [v7 objectForKeyedSubscript:@"associatedSSD"];
    if (v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "NF_dataWithHexString:", v13);
        if (v14) {
          objc_storeStrong(v9 + 2, v14);
        }
      }
    }
    v15 = [v7 objectForKeyedSubscript:@"obgk"];

    if (v15)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "NF_dataWithHexString:", v15);
        if (v16) {
          objc_storeStrong(v9 + 3, v16);
        }
      }
    }
    v17 = v9;
  }
  else
  {
    v18 = (const void **)MEMORY[0x1E4FBA898];
    dispatch_get_specific((const void *)*MEMORY[0x1E4FBA898]);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      v20 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(a1);
      BOOL isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      uint64_t v24 = 45;
      if (isMetaClass) {
        uint64_t v24 = 43;
      }
      v20(3, "%c[%{public}s %{public}s]:%i AID does not match", v24, ClassName, Name, 668);
    }
    dispatch_get_specific(*v18);
    v25 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = object_getClass(a1);
      if (class_isMetaClass(v26)) {
        int v27 = 43;
      }
      else {
        int v27 = 45;
      }
      *(_DWORD *)buf = 67109890;
      int v31 = v27;
      __int16 v32 = 2082;
      v33 = object_getClassName(a1);
      __int16 v34 = 2082;
      v35 = sel_getName(a2);
      __int16 v36 = 1024;
      int v37 = 668;
      _os_log_impl(&dword_19D636000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i AID does not match", buf, 0x22u);
    }

    v17 = 0;
  }

  return v17;
}

- (id)debugDescription
{
  v3 = objc_opt_new();
  v4 = [(NFApplet *)self->_applet debugDescription];
  [v3 appendFormat:@"%@", v4];

  v5 = [(NSData *)self->_ssdAID NF_asHexString];
  v6 = [(NSData *)self->_obgk NF_asHexString];
  [v3 appendFormat:@", { ssdID=%@, OBGK=%@ }", v5, v6];

  return v3;
}

- (NFApplet)applet
{
  return self->_applet;
}

- (NSData)ssdAID
{
  return self->_ssdAID;
}

- (NSData)obgk
{
  return self->_obgk;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_obgk, 0);
  objc_storeStrong((id *)&self->_ssdAID, 0);
  objc_storeStrong((id *)&self->_applet, 0);
}

@end