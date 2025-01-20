@interface TUIFeedEntry
+ (id)defaultStackNames;
+ (id)feedEntryFromDictionary:(id)a3;
+ (id)feedEntryFromTemplateURL:(id)a3 data:(id)a4 behaviors:(id)a5;
- (BOOL)canHandleDropSession:(id)a3 behavior:(id)a4;
- (BOOL)handleBehaviorWithName:(id)a3 arguments:(id)a4;
- (NSDictionary)dictionary;
- (NSSet)stackNames;
- (NSString)uid;
- (NSURL)templateURL;
- (NSUUID)uuid;
- (TUIFeedBehaviors)behaviors;
- (TUIFeedData)data;
- (TUIFeedEntry)init;
- (TUIFeedEntry)initWithDictionary:(id)a3;
- (TUIFeedEntryDelegate)delegate;
- (TUIIdentifierMap)identifierMap;
- (double)loadDelay;
- (id)description;
- (id)dragItemForFeedEntry:(id)a3 name:(id)a4 arguments:(id)a5 imageResourceBlock:(id)a6;
- (id)requestDataWithPriority:(float)a3 block:(id)a4;
- (void)performDropWithSession:(id)a3 behavior:(id)a4;
- (void)setBehaviors:(id)a3;
- (void)setData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setIdentifierMap:(id)a3;
- (void)setStackNames:(id)a3;
- (void)setTemplateURL:(id)a3;
@end

@implementation TUIFeedEntry

+ (id)feedEntryFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = [[TUIFeedEntry alloc] initWithDictionary:v3];

  return v4;
}

+ (id)feedEntryFromTemplateURL:(id)a3 data:(id)a4 behaviors:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(TUIFeedEntry);
  [(TUIFeedEntry *)v10 setTemplateURL:v9];

  [(TUIFeedEntry *)v10 setData:v8];
  [(TUIFeedEntry *)v10 setBehaviors:v7];

  return v10;
}

+ (id)defaultStackNames
{
  id v2 = [objc_alloc((Class)NSSet) initWithObjects:@"default", 0];

  return v2;
}

- (TUIFeedEntry)init
{
  return [(TUIFeedEntry *)self initWithDictionary:0];
}

- (TUIFeedEntry)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUIFeedEntry;
  v5 = [(TUIFeedEntry *)&v13 init];
  if (v5)
  {
    v6 = (NSUUID *)objc_alloc_init((Class)NSUUID);
    uuid = v5->_uuid;
    v5->_uuid = v6;

    id v8 = [[TUIIdentifierMap alloc] initWithUUID:v5->_uuid];
    identifierMap = v5->_identifierMap;
    v5->_identifierMap = v8;

    uint64_t v10 = [(id)objc_opt_class() defaultStackNames];
    stackNames = v5->_stackNames;
    v5->_stackNames = (NSSet *)v10;

    v5->_stackNamesLock._os_unfair_lock_opaque = 0;
    [(TUIFeedEntry *)v5 setDictionary:v4];
  }

  return v5;
}

- (void)setDictionary:(id)a3
{
  v5 = (NSDictionary *)a3;
  dictionary = self->_dictionary;
  if (dictionary != v5 && ([(NSDictionary *)dictionary isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_dictionary, a3);
    id v7 = [(NSDictionary *)v5 objectForKeyedSubscript:@"template"];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v8 = objc_opt_class();
        id v9 = TUIDynamicCast(v8, v7);
        uint64_t v10 = +[NSURL URLWithString:v9];
        templateURL = self->_templateURL;
        self->_templateURL = v10;
      }
      else
      {
        uint64_t v12 = objc_opt_class();
        TUIDynamicCast(v12, v7);
        objc_super v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
        id v9 = self->_templateURL;
        self->_templateURL = v13;
      }

      if (!self->_templateURL)
      {
        v14 = TUIDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_191100((uint64_t)v7, v14);
        }
      }
    }
    uint64_t v15 = objc_opt_class();
    v16 = [(NSDictionary *)v5 objectForKeyedSubscript:@"load-delay"];
    v17 = TUIDynamicCast(v15, v16);
    [v17 floatValue];
    self->_loadDelay = v18;

    v19 = [(NSDictionary *)v5 objectForKeyedSubscript:@"data"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = +[TUIFeedData feedDataWithDictionary:v19];
      data = self->_data;
      self->_data = v20;
    }
    v22 = [(NSDictionary *)v5 objectForKeyedSubscript:@"behaviors"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v23 = +[TUIFeedBehaviors feedBehaviorsWithDictionary:v22];
      behaviors = self->_behaviors;
      self->_behaviors = v23;
    }
    uint64_t v25 = objc_opt_class();
    v26 = [(NSDictionary *)v5 objectForKeyedSubscript:@"stackNames"];
    v27 = TUIDynamicCast(v25, v26);

    if ([v27 count])
    {
      v41 = v22;
      v42 = v7;
      id v28 = objc_alloc_init((Class)NSMutableSet);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      v40 = v27;
      id v29 = v27;
      id v30 = [v29 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v44;
        do
        {
          v33 = 0;
          do
          {
            if (*(void *)v44 != v32) {
              objc_enumerationMutation(v29);
            }
            v34 = *(void **)(*((void *)&v43 + 1) + 8 * (void)v33);
            uint64_t v35 = objc_opt_class();
            v36 = TUIDynamicCast(v35, v34);

            if (v36) {
              [v28 addObject:v34];
            }
            v33 = (char *)v33 + 1;
          }
          while (v31 != v33);
          id v31 = [v29 countByEnumeratingWithState:&v43 objects:v47 count:16];
        }
        while (v31);
      }

      if ([v28 count]) {
        [(TUIFeedEntry *)self setStackNames:v28];
      }
      v22 = v41;
      id v7 = v42;
      v27 = v40;
    }
    else
    {
      uint64_t v37 = objc_opt_class();
      v38 = [(NSDictionary *)v5 objectForKeyedSubscript:@"stackName"];
      TUIDynamicCast(v37, v38);
      id v28 = (id)objc_claimAutoreleasedReturnValue();

      if ([v28 length])
      {
        v39 = +[NSSet setWithObject:v28];
        [(TUIFeedEntry *)self setStackNames:v39];
      }
    }
  }
}

- (NSString)uid
{
  id v3 = [(TUIFeedEntry *)self dictionary];
  id v4 = [v3 objectForKeyedSubscript:@"entryID"];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(NSUUID *)self->_uuid UUIDString];
  }
  id v7 = v6;

  return (NSString *)v7;
}

- (id)requestDataWithPriority:(float)a3 block:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [(TUIFeedEntry *)self delegate];

    if (v7)
    {
      objc_initWeak(&location, self);
      uint64_t v8 = [(TUIFeedEntry *)self delegate];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_5A738;
      v12[3] = &unk_253060;
      objc_copyWeak(&v14, &location);
      id v13 = v6;
      *(float *)&double v9 = a3;
      uint64_t v10 = [v8 feedEntry:self requestDataWithPriority:v12 block:v9];

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
      goto LABEL_6;
    }
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  uint64_t v10 = 0;
LABEL_6:

  return v10;
}

- (BOOL)handleBehaviorWithName:(id)a3 arguments:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TUIFeedBehaviors *)self->_behaviors behaviorWithName:v6];
  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v9 = [(TUIFeedEntry *)self delegate];
  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v10 = (void *)v9;
  v11 = [(TUIFeedEntry *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = TUIDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&def_141F14, v13, OS_LOG_TYPE_INFO, "Feed handling behavior '%@' : %@", (uint8_t *)&v17, 0x16u);
    }

    id v14 = [(TUIFeedEntry *)self delegate];
    unsigned __int8 v15 = [v14 feedEntry:self handleBehavior:v8 name:v6 arguments:v7];
  }
  else
  {
LABEL_7:
    unsigned __int8 v15 = 0;
  }

  return v15;
}

- (id)dragItemForFeedEntry:(id)a3 name:(id)a4 arguments:(id)a5 imageResourceBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(TUIFeedEntry *)self delegate];
  if (v14
    && (unsigned __int8 v15 = (void *)v14,
        [(TUIFeedEntry *)self delegate],
        v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = objc_opt_respondsToSelector(),
        v16,
        v15,
        (v17 & 1) != 0))
  {
    id v18 = TUIDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412546;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_impl(&def_141F14, v18, OS_LOG_TYPE_INFO, "Feed handling drag behavior '%@' : %@", (uint8_t *)&v22, 0x16u);
    }

    __int16 v19 = [(TUIFeedEntry *)self delegate];
    id v20 = [v19 dragItemForFeedEntry:v10 name:v11 arguments:v12 imageResourceBlock:v13];
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (void)performDropWithSession:(id)a3 behavior:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TUIFeedEntry *)self delegate];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    id v10 = [(TUIFeedEntry *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = TUIDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        id v15 = v7;
        _os_log_impl(&def_141F14, v12, OS_LOG_TYPE_INFO, "Feed handling drop behavior '%@", (uint8_t *)&v14, 0xCu);
      }

      id v13 = [(TUIFeedEntry *)self delegate];
      [v13 performDropWithSession:v6 behavior:v7];
    }
  }
}

- (BOOL)canHandleDropSession:(id)a3 behavior:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(TUIFeedEntry *)self delegate];
  if (v8
    && (uint64_t v9 = (void *)v8,
        [(TUIFeedEntry *)self delegate],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    id v12 = [(TUIFeedEntry *)self delegate];
    unsigned __int8 v13 = [v12 canHandleDropSession:v6 behavior:v7];
  }
  else
  {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (id)description
{
  id v3 = [(TUIFeedEntry *)self stackNames];
  id v4 = [(id)objc_opt_class() defaultStackNames];
  unsigned __int8 v5 = [v3 isEqualToSet:v4];

  if (v5)
  {
    id v6 = &stru_257BF0;
  }
  else
  {
    id v7 = [v3 allObjects];
    uint64_t v8 = [v7 componentsJoinedByString:@", "];
    +[NSString stringWithFormat:@" stackNames=%@", v8];
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v9 = (objc_class *)objc_opt_class();
  id v10 = NSStringFromClass(v9);
  char v11 = [(TUIFeedEntry *)self uid];
  id v12 = [(NSURL *)self->_templateURL lastPathComponent];
  unsigned __int8 v13 = +[NSString stringWithFormat:@"<%@ %p uid=%@ template=%@%@>", v10, self, v11, v12, v6];

  return v13;
}

- (NSSet)stackNames
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStackNames:(id)a3
{
}

- (TUIIdentifierMap)identifierMap
{
  return self->_identifierMap;
}

- (void)setIdentifierMap:(id)a3
{
}

- (NSURL)templateURL
{
  return self->_templateURL;
}

- (void)setTemplateURL:(id)a3
{
}

- (TUIFeedData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (TUIFeedBehaviors)behaviors
{
  return self->_behaviors;
}

- (void)setBehaviors:(id)a3
{
}

- (double)loadDelay
{
  return self->_loadDelay;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (TUIFeedEntryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUIFeedEntryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_behaviors, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_templateURL, 0);
  objc_storeStrong((id *)&self->_identifierMap, 0);

  objc_storeStrong((id *)&self->_stackNames, 0);
}

@end