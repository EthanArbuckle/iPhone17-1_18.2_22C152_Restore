@interface REMUserActivity
+ (BOOL)supportsSecureCoding;
+ (REMUserActivity)userActivityWithDictionaryData:(id)a3 error:(id *)a4;
+ (REMUserActivity)userActivityWithUserActivity:(id)a3 completion:(id)a4;
+ (id)dataFromUserActivity:(id)a3;
+ (id)stringForActivityType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)storage;
- (REMUserActivity)initWithCoder:(id)a3;
- (REMUserActivity)initWithSiriIntent:(id)a3;
- (REMUserActivity)initWithType:(int64_t)a3 storage:(id)a4;
- (REMUserActivity)initWithUniversalLink:(id)a3;
- (REMUserActivity)initWithUserActivity:(id)a3;
- (REMUserActivity)initWithUserActivityData:(id)a3;
- (id)archivedDictionaryData;
- (id)debugDescription;
- (id)debugDescriptionDetails;
- (id)siriIntent;
- (id)universalLink;
- (id)userActivity;
- (id)userActivityData;
- (int64_t)type;
- (unint64_t)hash;
- (void)archivedDictionaryData;
- (void)encodeWithCoder:(id)a3;
- (void)siriIntent;
@end

@implementation REMUserActivity

- (REMUserActivity)initWithType:(int64_t)a3 storage:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)REMUserActivity;
  v8 = [(REMUserActivity *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_storage, a4);
  }

  return v9;
}

- (REMUserActivity)initWithUniversalLink:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMUserActivity;
  v5 = [(REMUserActivity *)&v11 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_4;
  }
  v5->_type = 1;
  id v7 = [v4 absoluteString];
  v8 = [v7 dataUsingEncoding:4];

  if (v8)
  {
    storage = v6->_storage;
    v6->_storage = (NSData *)v8;

LABEL_4:
    v8 = v6;
  }

  return v8;
}

- (REMUserActivity)initWithUserActivity:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)REMUserActivity;
  v5 = [(REMUserActivity *)&v12 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_4;
  }
  v5->_type = 2;
  uint64_t v7 = +[REMUserActivity dataFromUserActivity:v4];
  if (v7)
  {
    storage = v6->_storage;
    v6->_storage = (NSData *)v7;

LABEL_4:
    v9 = v6;
    goto LABEL_8;
  }
  v10 = +[REMLog siriKit];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    -[REMUserActivity initWithUserActivity:]();
  }

  v9 = 0;
LABEL_8:

  return v9;
}

- (REMUserActivity)initWithUserActivityData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMUserActivity;
  v6 = [(REMUserActivity *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    objc_storeStrong((id *)&v6->_storage, a3);
  }

  return v7;
}

- (REMUserActivity)initWithSiriIntent:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)REMUserActivity;
  id v5 = [(REMUserActivity *)&v16 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_10;
  }
  v5->_type = 3;
  id v15 = 0;
  uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v15];
  id v8 = v15;
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (!v9)
  {
    storage = v6->_storage;
    v6->_storage = v7;

LABEL_10:
    objc_super v12 = v6;
    goto LABEL_11;
  }
  v10 = v8;
  objc_super v11 = +[REMLog siriKit];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
    -[REMUserActivity initWithSiriIntent:]();
  }

  objc_super v12 = 0;
LABEL_11:

  return v12;
}

+ (REMUserActivity)userActivityWithUserActivity:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__REMUserActivity_userActivityWithUserActivity_completion___block_invoke;
  v8[3] = &unk_1E61DDF68;
  id v9 = v5;
  id v6 = v5;
  [a3 _createUserActivityDataWithOptions:0 completionHandler:v8];

  return result;
}

void __59__REMUserActivity_userActivityWithUserActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    id v9 = +[REMLog siriKit];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __59__REMUserActivity_userActivityWithUserActivity_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v8 = [[REMUserActivity alloc] initWithType:2 storage:v5];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  int64_t v3 = [(REMUserActivity *)self type];
  id v4 = [(REMUserActivity *)self storage];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REMUserActivity *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    id v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int64_t v7 = [(REMUserActivity *)self type], v7 == [(REMUserActivity *)v6 type]))
    {
      id v8 = [(REMUserActivity *)self storage];
      uint64_t v9 = [(REMUserActivity *)v6 storage];
      if (v8 == (void *)v9)
      {
        char v13 = 1;
        v10 = v8;
      }
      else
      {
        v10 = (void *)v9;
        objc_super v11 = [(REMUserActivity *)self storage];
        objc_super v12 = [(REMUserActivity *)v6 storage];
        char v13 = [v11 isEqual:v12];
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMUserActivity type](self, "type"), @"type");
  id v5 = [(REMUserActivity *)self storage];
  [v4 encodeObject:v5 forKey:@"storage"];
}

- (REMUserActivity)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  if ((unint64_t)(v5 - 1) >= 3)
  {
    id v6 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[REMUserActivity initWithCoder:]();
    }

    uint64_t v5 = 1;
  }
  int64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storage"];

  id v8 = [[REMUserActivity alloc] initWithType:v5 storage:v7];
  return v8;
}

+ (REMUserActivity)userActivityWithDictionaryData:(id)a3 error:(id *)a4
{
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v6 = a3;
  id v13 = 0;
  int64_t v7 = (void *)[[v5 alloc] initForReadingFromData:v6 error:&v13];

  id v8 = v13;
  uint64_t v9 = [[REMUserActivity alloc] initWithCoder:v7];
  if (v9) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10)
  {
    objc_super v11 = +[REMLog siriKit];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      +[REMUserActivity userActivityWithDictionaryData:error:]();
    }

    if (a4) {
      *a4 = v8;
    }
  }

  return v9;
}

- (id)archivedDictionaryData
{
  int64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [(REMUserActivity *)self encodeWithCoder:v3];
  id v4 = [v3 encodedData];
  if (!v4)
  {
    uint64_t v5 = +[REMLog siriKit];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[REMUserActivity archivedDictionaryData](v5);
    }
  }

  return v4;
}

+ (id)dataFromUserActivity:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__14;
  v20 = __Block_byref_object_dispose__14;
  id v21 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  objc_super v12 = __40__REMUserActivity_dataFromUserActivity___block_invoke;
  id v13 = &unk_1E61DDF90;
  id v15 = &v16;
  uint64_t v5 = v4;
  v14 = v5;
  [v3 _createUserActivityDataWithOptions:0 completionHandler:&v10];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6) >= 1)
  {
    int64_t v7 = +[REMLog siriKit];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[REMUserActivity dataFromUserActivity:](v7);
    }
  }
  id v8 = (id)v17[5];

  _Block_object_dispose(&v16, 8);

  return v8;
}

void __40__REMUserActivity_dataFromUserActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    id v8 = +[REMLog siriKit];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __59__REMUserActivity_userActivityWithUserActivity_completion___block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)universalLink
{
  if ([(REMUserActivity *)self type] == 1)
  {
    id v3 = [NSString alloc];
    dispatch_semaphore_t v4 = [(REMUserActivity *)self storage];
    uint64_t v5 = (void *)[v3 initWithData:v4 encoding:4];

    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)userActivity
{
  if ([(REMUserActivity *)self type] == 2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F22488]);
    dispatch_semaphore_t v4 = [(REMUserActivity *)self storage];
    uint64_t v5 = (void *)[v3 _initWithUserActivityData:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)userActivityData
{
  if ([(REMUserActivity *)self type] == 2)
  {
    id v3 = [(REMUserActivity *)self storage];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)siriIntent
{
  if ([(REMUserActivity *)self type] == 3)
  {
    id v3 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = [(REMUserActivity *)self storage];
    id v11 = 0;
    id v6 = [v3 unarchivedObjectOfClass:v4 fromData:v5 error:&v11];
    id v7 = v11;

    if (v7 || !v6)
    {
      uint64_t v9 = +[REMLog siriKit];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[REMUserActivity siriIntent]();
      }

      id v8 = 0;
    }
    else
    {
      id v8 = v6;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)debugDescription
{
  v12.receiver = self;
  v12.super_class = (Class)REMUserActivity;
  id v3 = [(REMUserActivity *)&v12 debugDescription];
  uint64_t v4 = NSString;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "stringForActivityType:", -[REMUserActivity type](self, "type"));
  id v6 = NSNumber;
  id v7 = [(REMUserActivity *)self storage];
  id v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
  uint64_t v9 = [(REMUserActivity *)self debugDescriptionDetails];
  uint64_t v10 = [v4 stringWithFormat:@"%@ (type=%@, bytes=%@, details=%@)", v3, v5, v8, v9];

  return v10;
}

- (id)debugDescriptionDetails
{
  int64_t v3 = [(REMUserActivity *)self type];
  switch(v3)
  {
    case 3:
      uint64_t v4 = [(REMUserActivity *)self siriIntent];
      uint64_t v5 = [v4 debugDescription];
      goto LABEL_6;
    case 2:
      uint64_t v4 = [(REMUserActivity *)self userActivity];
      id v7 = NSString;
      id v8 = [v4 activityType];
      uint64_t v9 = [v4 title];
      uint64_t v10 = [v4 webpageURL];
      id v11 = [v4 userInfo];
      id v6 = [v7 stringWithFormat:@"{type: %@, title: %@, URL: %@, userInfo: %@}", v8, v9, v10, v11];

      break;
    case 1:
      uint64_t v4 = [(REMUserActivity *)self universalLink];
      uint64_t v5 = [v4 absoluteString];
LABEL_6:
      id v6 = (void *)v5;
      break;
    default:
      v18.receiver = self;
      v18.super_class = (Class)REMUserActivity;
      uint64_t v4 = [(REMUserActivity *)&v18 debugDescription];
      objc_super v12 = NSString;
      id v13 = objc_msgSend((id)objc_opt_class(), "stringForActivityType:", -[REMUserActivity type](self, "type"));
      v14 = NSNumber;
      id v15 = [(REMUserActivity *)self storage];
      uint64_t v16 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "length"));
      id v6 = [v12 stringWithFormat:@"%@ (type=%@, bytes=%@)", v4, v13, v16];

      break;
  }

  return v6;
}

+ (id)stringForActivityType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown REMUserActivityType %ld", a3);
    int64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int64_t v3 = off_1E61DDFB0[a3 - 1];
  }

  return v3;
}

- (int64_t)type
{
  return self->_type;
}

- (NSData)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
}

- (void)initWithUserActivity:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_FAULT, "Error when archiving NSUserActivity. {userActivity: %@}", v1, 0xCu);
}

- (void)initWithSiriIntent:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_fault_impl(&dword_1B9AA2000, v1, OS_LOG_TYPE_FAULT, "Error when archiving Siri Intent. {siriIntent: %@, error: %@}", v2, 0x16u);
}

void __59__REMUserActivity_userActivityWithUserActivity_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Failed to serialize user activity {error: %@}", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_1B9AA2000, v0, OS_LOG_TYPE_FAULT, "Unknown REMUserActivityType %ld", v1, 0xCu);
}

+ (void)userActivityWithDictionaryData:error:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Error decoding REMUserActivity {error: %@}", v2, v3, v4, v5, v6);
}

- (void)archivedDictionaryData
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "Error encoding REMUserActivity", v1, 2u);
}

+ (void)dataFromUserActivity:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1B9AA2000, log, OS_LOG_TYPE_ERROR, "Timed out serializing user activity.", v1, 2u);
}

- (void)siriIntent
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1B9AA2000, v0, v1, "Error when unarchiving Siri Intent. {error: %@}", v2, v3, v4, v5, v6);
}

@end