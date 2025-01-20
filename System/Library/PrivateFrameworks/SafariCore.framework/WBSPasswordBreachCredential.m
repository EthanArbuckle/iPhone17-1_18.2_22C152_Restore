@interface WBSPasswordBreachCredential
- (NSData)persistentIdentifier;
- (NSDate)dateLastModified;
- (NSString)password;
- (WBSPasswordBreachCredential)initWithPassword:(id)a3 persistentIdentifier:(id)a4 dateLastModified:(id)a5;
- (WBSPasswordBreachCredential)initWithSecItemDictionary:(id)a3;
- (id)description;
@end

@implementation WBSPasswordBreachCredential

- (WBSPasswordBreachCredential)initWithSecItemDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "safari_dataForKey:", *MEMORY[0x1E4F3BD38]);
  v6 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
  if (v6)
  {
    v7 = objc_msgSend(v4, "safari_dataForKey:", *MEMORY[0x1E4F3BD40]);
    v8 = objc_msgSend(v4, "safari_dateForKey:", *MEMORY[0x1E4F3B790]);
    self = [(WBSPasswordBreachCredential *)self initWithPassword:v6 persistentIdentifier:v7 dateLastModified:v8];

    v9 = self;
  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[WBSPasswordBreachCredential initWithSecItemDictionary:](v10);
    }
    v9 = 0;
  }

  return v9;
}

- (WBSPasswordBreachCredential)initWithPassword:(id)a3 persistentIdentifier:(id)a4 dateLastModified:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)WBSPasswordBreachCredential;
  v11 = [(WBSPasswordBreachCredential *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    password = v11->_password;
    v11->_password = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    persistentIdentifier = v11->_persistentIdentifier;
    v11->_persistentIdentifier = (NSData *)v14;

    uint64_t v16 = [v10 copy];
    dateLastModified = v11->_dateLastModified;
    v11->_dateLastModified = (NSDate *)v16;

    v18 = v11;
  }

  return v11;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p, persistentIdentifier: %@, dateLastModified: %@>", objc_opt_class(), self, self->_persistentIdentifier, self->_dateLastModified];
}

- (NSString)password
{
  return self->_password;
}

- (NSData)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (NSDate)dateLastModified
{
  return self->_dateLastModified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateLastModified, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

- (void)initWithSecItemDictionary:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B728F000, log, OS_LOG_TYPE_DEBUG, "Skipping password with invalid UTF-8 byte sequence.", v1, 2u);
}

@end