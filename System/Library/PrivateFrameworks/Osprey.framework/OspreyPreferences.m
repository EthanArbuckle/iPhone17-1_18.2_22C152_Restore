@interface OspreyPreferences
- (OspreyPreferences)initWithKeychain:(id)a3;
- (id)connectionPreferencesForHost:(id)a3;
- (id)connections;
- (void)deleteConnectionPreferencesForHost:(id)a3;
- (void)setConnectionPreferences:(id)a3;
- (void)synchronize;
@end

@implementation OspreyPreferences

- (OspreyPreferences)initWithKeychain:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OspreyPreferences;
  v6 = [(OspreyPreferences *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_keychain, a3);
  }

  return v7;
}

- (void)synchronize
{
}

- (id)connectionPreferencesForHost:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6 = [v4 lowercaseString];
    v7 = (void *)CFPreferencesCopyAppValue(@"Connections", @"com.apple.osprey");
    v8 = [v7 objectForKey:v6];
    objc_super v9 = [OspreyConnectionPreferences alloc];
    keychain = self->_keychain;
    if (v8) {
      uint64_t v11 = [(OspreyConnectionPreferences *)v9 initWithDictionary:v8 keychain:keychain];
    }
    else {
      uint64_t v11 = [(OspreyConnectionPreferences *)v9 initWithConnectionHost:v5 keychain:keychain];
    }
    v12 = (void *)v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)deleteConnectionPreferencesForHost:(id)a3
{
  id v9 = a3;
  id v4 = (void *)CFPreferencesCopyAppValue(@"Connections", @"com.apple.osprey");
  id v5 = (void *)[v4 mutableCopy];

  if (v5)
  {
    v6 = [v9 lowercaseString];
    v7 = [v5 objectForKey:v6];
    if (v7)
    {
      v8 = [[OspreyConnectionPreferences alloc] initWithDictionary:v7 keychain:self->_keychain];
      [(OspreyConnectionPreferences *)v8 deleteAll];

      [v5 removeObjectForKey:v6];
      CFPreferencesSetAppValue(@"Connections", v5, @"com.apple.osprey");
    }
  }
}

- (void)setConnectionPreferences:(id)a3
{
  id v10 = a3;
  v3 = [v10 connectionHost];

  id v4 = v10;
  if (v3)
  {
    id v5 = [v10 connectionHost];
    v6 = [v5 lowercaseString];

    v7 = (void *)CFPreferencesCopyAppValue(@"Connections", @"com.apple.osprey");
    id v8 = (id)[v7 mutableCopy];

    if (!v8) {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v9 = [v10 dictionaryRepresentation];
    if (v9) {
      [v8 setValue:v9 forKey:v6];
    }
    else {
      [v8 removeObjectForKey:v6];
    }
    CFPreferencesSetAppValue(@"Connections", v8, @"com.apple.osprey");

    id v4 = v10;
  }
}

- (id)connections
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)CFPreferencesCopyAppValue(@"Connections", @"com.apple.osprey");
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [OspreyConnectionPreferences alloc];
        v12 = [v3 objectForKey:v10];
        v13 = [(OspreyConnectionPreferences *)v11 initWithDictionary:v12 keychain:self->_keychain];

        [v4 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end