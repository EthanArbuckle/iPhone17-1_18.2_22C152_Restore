@interface _SWCServiceSettings
+ (BOOL)removeObjectsForKeys:(id)a3 serviceSpecifier:(id)a4 error:(id *)a5;
+ (BOOL)removeObjectsForKeys:(id)a3 serviceType:(id)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (NSNotificationCenter)notificationCenter;
+ (id)serviceSettingsWithServiceSpecifier:(id)a3 error:(id *)a4;
+ (void)postChangeNotificationForServiceSpecifier:(id)a3;
+ (void)serviceSettingsDidChange:(id)a3;
- (BOOL)commitReturningError:(id *)a3;
- (BOOL)hasChanges;
- (NSDictionary)dictionaryRepresentation;
- (_SWCGeneration)generation;
- (_SWCServiceSettings)initWithCoder:(id)a3;
- (_SWCServiceSpecifier)serviceSpecifier;
- (id)_initWithServiceSpecifier:(id)a3 dictionary:(id)a4 generation:(id)a5;
- (id)debugDescription;
- (id)description;
- (id)objectForKey:(id)a3 ofClass:(Class)a4;
- (id)objectForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5;
- (id)redactedDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation _SWCServiceSettings

+ (NSNotificationCenter)notificationCenter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41___SWCServiceSettings_notificationCenter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB67B068 != -1) {
    dispatch_once(&qword_1EB67B068, block);
  }
  v2 = (void *)_MergedGlobals_0;
  return (NSNotificationCenter *)v2;
}

+ (id)serviceSettingsWithServiceSpecifier:(id)a3 error:(id *)a4
{
  id v7 = a3;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  v8 = [v7 serviceType];

  if (!v8)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"SWCServiceSettings.mm", 71, @"Invalid parameter not satisfying: %@", @"specifier.serviceType != nil" object file lineNumber description];
  }
  v9 = _SWCGetServerConnection();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __65___SWCServiceSettings_serviceSettingsWithServiceSpecifier_error___block_invoke;
  v16[3] = &unk_1E5E519D8;
  v16[4] = &v17;
  v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v16];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65___SWCServiceSettings_serviceSettingsWithServiceSpecifier_error___block_invoke_2;
  v15[3] = &unk_1E5E51A00;
  v15[4] = &v23;
  v15[5] = &v17;
  [v10 getServiceSettingsWithServiceSpecifier:v7 completionHandler:v15];
  v11 = (void *)v24[5];
  if (a4 && !v11)
  {
    *a4 = (id) v18[5];
    v11 = (void *)v24[5];
  }
  id v12 = v11;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4
{
  id v7 = a3;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"SWCServiceSettings.mm", 95, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
LABEL_10:
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"SWCServiceSettings.mm", 96, @"Invalid parameter not satisfying: %@", @"clazz != Nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_10;
  }
LABEL_3:
  v8 = [(NSMutableDictionary *)self->_dict objectForKeyedSubscript:v7];
  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v8 = 0;
  }

  return v8;
}

- (id)objectForKey:(id)a3 ofClass:(Class)a4 valuesOfClass:(Class)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  if (!a5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SWCServiceSettings.mm", 110, @"Invalid parameter not satisfying: %@", @"valueClazz != Nil" object file lineNumber description];
  }
  v10 = [(_SWCServiceSettings *)self objectForKey:v9 ofClass:a4];
  if (v10)
  {
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 1;
    if (_NSIsNSArray())
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v19;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v11);
            }
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              *((unsigned char *)v23 + 24) = 0;
              goto LABEL_17;
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v26 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_17:
    }
    else if (_NSIsNSDictionary())
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __58___SWCServiceSettings_objectForKey_ofClass_valuesOfClass___block_invoke;
      v17[3] = &unk_1E5E51A28;
      v17[4] = &v22;
      v17[5] = a5;
      [v10 enumerateKeysAndObjectsUsingBlock:v17];
    }
    if (!*((unsigned char *)v23 + 24))
    {

      v10 = 0;
    }
    _Block_object_dispose(&v22, 8);
  }

  return v10;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  unint64_t propertyList = (unint64_t)a3;
  id v7 = a4;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SWCServiceSettings.mm", 144, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }
  uint64_t v8 = [(NSMutableDictionary *)self->_dict objectForKeyedSubscript:v7];
  id v9 = (void *)v8;
  if (propertyList | v8)
  {
    if ((objc_msgSend((id)v8, "isEqual:") & 1) == 0)
    {
      unint64_t v10 = propertyList;
      if (propertyList)
      {
        if (([MEMORY[0x1E4F28F98] propertyList:propertyList isValidForFormat:200] & 1) == 0)
        {
          uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
          [v13 handleFailureInMethod:a2, self, @"SWCServiceSettings.mm", 154, @"Invalid parameter not satisfying: %@", @"[NSPropertyListSerialization propertyList:newValue isValidForFormat:NSPropertyListBinaryFormat_v1_0]" object file lineNumber description];
        }
        CFPropertyListRef DeepCopy = CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFPropertyListRef)propertyList, 0);

        unint64_t v10 = (unint64_t)DeepCopy;
      }
      unint64_t propertyList = v10;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dict, "setObject:forKeyedSubscript:");
      *((unsigned char *)self + 16) |= 1u;
    }
  }
  else
  {
    unint64_t propertyList = 0;
  }
}

- (BOOL)commitReturningError:(id *)a3
{
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  if (*((unsigned char *)self + 16))
  {
    v6 = _SWCGetServerConnection();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44___SWCServiceSettings_commitReturningError___block_invoke;
    v11[3] = &unk_1E5E519D8;
    v11[4] = &v12;
    id v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v11];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44___SWCServiceSettings_commitReturningError___block_invoke_2;
    v10[3] = &unk_1E5E51A50;
    v10[4] = self;
    v10[5] = &v18;
    v10[6] = &v12;
    [v7 commitServiceSettings:self completionHandler:v10];
    if (*((unsigned char *)v19 + 24)) {
      *((unsigned char *)self + 16) &= ~1u;
    }

    int v3 = *((unsigned __int8 *)v19 + 24);
    if (a3 && !*((unsigned char *)v19 + 24))
    {
      *a3 = (id) v13[5];
      int v3 = *((unsigned __int8 *)v19 + 24);
    }
  }
  else
  {
    int v3 = 1;
    char v21 = 1;
  }
  BOOL v8 = v3 != 0;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

- (BOOL)hasChanges
{
  return *((unsigned char *)self + 16) & 1;
}

- (id)_initWithServiceSpecifier:(id)a3 dictionary:(id)a4 generation:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_SWCServiceSettings;
  uint64_t v12 = [(_SWCServiceSettings *)&v18 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceSpecifier, a3);
    if (v10) {
      uint64_t v14 = v10;
    }
    else {
      uint64_t v14 = (void *)MEMORY[0x1E4F1CC08];
    }
    uint64_t v15 = [v14 mutableCopy];
    dict = v13->_dict;
    v13->_dict = (NSMutableDictionary *)v15;

    objc_storeStrong((id *)&v13->_generation, a5);
  }

  return v13;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = (void *)[(NSMutableDictionary *)self->_dict copy];
  return (NSDictionary *)v2;
}

+ (void)serviceSettingsDidChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"serviceSpecifierData"];

  if (v5 && _NSIsNSData())
  {
    id v10 = 0;
    v6 = objc_msgSend(MEMORY[0x1E4F28DC0], "swc_unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v10);
    id v7 = v10;
    if (v6)
    {
      BOOL v8 = [a1 notificationCenter];
      [v8 postNotificationName:@"com.apple.swc.serviceSettingsDidChangeNotification" object:v6];
    }
    else
    {
      if (qword_1EB67B088 != -1) {
        dispatch_once(&qword_1EB67B088, &__block_literal_global_148);
      }
      id v9 = qword_1EB67B080;
      if (os_log_type_enabled((os_log_t)qword_1EB67B080, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v7;
        _os_log_error_impl(&dword_1ABCD7000, v9, OS_LOG_TYPE_ERROR, "Failed to decode service specifier for posting change notification: %@", buf, 0xCu);
      }
    }
  }
}

+ (void)postChangeNotificationForServiceSpecifier:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v13 = 0;
    v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v13];
    id v5 = v13;
    if (v4)
    {
      v16 = @"serviceSpecifierData";
      v17[0] = v4;
      v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
      if (qword_1EB67B078 != -1) {
        dispatch_once(&qword_1EB67B078, &__block_literal_global_0);
      }
      id v7 = qword_1EB67B070;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65___SWCServiceSettings_postChangeNotificationForServiceSpecifier___block_invoke_2;
      block[3] = &unk_1E5E51A78;
      id v11 = v6;
      uint64_t v12 = 3;
      id v8 = v6;
      dispatch_async(v7, block);
    }
    else
    {
      if (qword_1EB67B088 != -1) {
        dispatch_once(&qword_1EB67B088, &__block_literal_global_148);
      }
      id v9 = qword_1EB67B080;
      if (os_log_type_enabled((os_log_t)qword_1EB67B080, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v5;
        _os_log_error_impl(&dword_1ABCD7000, v9, OS_LOG_TYPE_ERROR, "Failed to encode service specifier for posting change notification: %@", buf, 0xCu);
      }
    }
  }
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(_SWCServiceSettings *)self serviceSpecifier];
  id v5 = (void *)[v3 initWithFormat:@"{ s = %@, %llu values }", v4, -[NSMutableDictionary count](self->_dict, "count")];

  return v5;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  id v5 = [(_SWCServiceSettings *)self description];
  v6 = (void *)[v3 initWithFormat:@"<%@ %p> %@", v4, self, v5];

  return v6;
}

- (id)redactedDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(_SWCServiceSettings *)self serviceSpecifier];
  id v5 = [v4 redactedDescription];
  v6 = (void *)[v3 initWithFormat:@"{ s = %@, %llu values }", v5, -[NSMutableDictionary count](self->_dict, "count")];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_serviceSpecifier forKey:@"serviceSpecifier"];
  [v4 encodeObject:self->_dict forKey:@"dictionaryRepresentation"];
  [v4 encodeObject:self->_generation forKey:@"generation"];
}

- (_SWCServiceSettings)initWithCoder:(id)a3
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), @"serviceSpecifier");
  v6 = v5;
  if (!v5 || ([v5 serviceType], id v7 = objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
    v35[0] = @"Line";
    v35[1] = @"Function";
    v36[0] = &unk_1F0345860;
    id v9 = [NSString stringWithUTF8String:"-[_SWCServiceSettings initWithCoder:]"];
    v36[1] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
    id v11 = (void *)[v8 initWithDomain:*MEMORY[0x1E4F281F8] code:4865 userInfo:v10];
    [v4 failWithError:v11];

    self = 0;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  v34[2] = objc_opt_class();
  v34[3] = objc_opt_class();
  v34[4] = objc_opt_class();
  v34[5] = objc_opt_class();
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:6];
  uint64_t v14 = (void *)[v12 initWithArray:v13];

  id v15 = objc_msgSend(v4, "swc_decodeObjectOfClasses:forKey:", v14, @"dictionaryRepresentation");
  if (!v15)
  {
    id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
    v32[0] = @"Line";
    v32[1] = @"Function";
    v33[0] = &unk_1F0345878;
    id v17 = [NSString stringWithUTF8String:"-[_SWCServiceSettings initWithCoder:]"];
    v33[1] = v17;
    objc_super v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    long long v19 = (void *)[v20 initWithDomain:*MEMORY[0x1E4F281F8] code:4865 userInfo:v18];
    [v4 failWithError:v19];
    goto LABEL_9;
  }
  if (!_NSIsNSDictionary()
    || ([MEMORY[0x1E4F28F98] propertyList:v15 isValidForFormat:200] & 1) == 0)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    v30[0] = @"Line";
    v30[1] = @"Function";
    v31[0] = &unk_1F0345890;
    id v17 = [NSString stringWithUTF8String:"-[_SWCServiceSettings initWithCoder:]"];
    v31[1] = v17;
    objc_super v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    long long v19 = (void *)[v16 initWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:v18];
    [v4 failWithError:v19];
LABEL_9:

    self = 0;
  }
  char v21 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), @"generation");
  if (!v21)
  {
    id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v23 = objc_msgSend(NSString, "stringWithUTF8String:", "-[_SWCServiceSettings initWithCoder:]", @"Line", @"Function", &unk_1F03458A8);
    v29[1] = v23;
    uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:2];
    char v25 = (void *)[v22 initWithDomain:*MEMORY[0x1E4F281F8] code:4865 userInfo:v24];
    [v4 failWithError:v25];

    self = 0;
  }
  v26 = [(_SWCServiceSettings *)self _initWithServiceSpecifier:v6 dictionary:v15 generation:v21];

  return v26;
}

- (_SWCServiceSpecifier)serviceSpecifier
{
  return (_SWCServiceSpecifier *)objc_getProperty(self, a2, 24, 1);
}

- (_SWCGeneration)generation
{
  return (_SWCGeneration *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generation, 0);
  objc_storeStrong((id *)&self->_serviceSpecifier, 0);
  objc_storeStrong((id *)&self->_dict, 0);
}

+ (BOOL)removeObjectsForKeys:(id)a3 serviceType:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  if (!v10)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"SWCServiceSettings.mm", 353, @"Invalid parameter not satisfying: %@", @"serviceType != nil" object file lineNumber description];
  }
  id v11 = _SWCGetServerConnection();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71___SWCServiceSettings_Removal__removeObjectsForKeys_serviceType_error___block_invoke;
  v18[3] = &unk_1E5E519D8;
  v18[4] = &v19;
  id v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __71___SWCServiceSettings_Removal__removeObjectsForKeys_serviceType_error___block_invoke_2;
  v17[3] = &unk_1E5E51AA0;
  v17[4] = &v25;
  v17[5] = &v19;
  [v12 removeSettingsForKeys:v9 serviceType:v10 completionHandler:v17];
  int v13 = *((unsigned __int8 *)v26 + 24);
  if (a5 && !*((unsigned char *)v26 + 24))
  {
    *a5 = (id) v20[5];
    int v13 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

+ (BOOL)removeObjectsForKeys:(id)a3 serviceSpecifier:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__0;
  uint64_t v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  if (!v10)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"SWCServiceSettings.mm", 377, @"Invalid parameter not satisfying: %@", @"specifier != nil" object file lineNumber description];
  }
  id v11 = _SWCGetServerConnection();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76___SWCServiceSettings_Removal__removeObjectsForKeys_serviceSpecifier_error___block_invoke;
  v18[3] = &unk_1E5E519D8;
  v18[4] = &v19;
  id v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __76___SWCServiceSettings_Removal__removeObjectsForKeys_serviceSpecifier_error___block_invoke_2;
  v17[3] = &unk_1E5E51AA0;
  v17[4] = &v25;
  v17[5] = &v19;
  [v12 removeSettingsForKeys:v9 serviceSpecifier:v10 completionHandler:v17];
  int v13 = *((unsigned __int8 *)v26 + 24);
  if (a5 && !*((unsigned char *)v26 + 24))
  {
    *a5 = (id) v20[5];
    int v13 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v14;
}

@end