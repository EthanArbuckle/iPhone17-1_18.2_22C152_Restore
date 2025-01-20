@interface TUContactsDataProviderAppleCareHandles
- (BOOL)contains:(id)a3;
- (NSSet)appleCareHandles;
- (TUContactsDataProviderAppleCareHandles)init;
- (void)loadHandles;
@end

@implementation TUContactsDataProviderAppleCareHandles

- (TUContactsDataProviderAppleCareHandles)init
{
  v5.receiver = self;
  v5.super_class = (Class)TUContactsDataProviderAppleCareHandles;
  v2 = [(TUContactsDataProviderAppleCareHandles *)&v5 init];
  v3 = v2;
  if (v2) {
    [(TUContactsDataProviderAppleCareHandles *)v2 loadHandles];
  }
  return v3;
}

- (void)loadHandles
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "tu_defaults");
  v4 = [v3 stringForKey:@"appleCareHandles"];

  if (!v4)
  {
    objc_super v5 = [MEMORY[0x1E4F6B598] sharedInstance];
    uint64_t v6 = [v5 objectForKey:@"appleCareHandles"];

    if (v6) {
      v4 = (__CFString *)v6;
    }
    else {
      v4 = @"+18006927753,+18006927753,+558007610867,+864006272273,+864006668800,+448000391010,+85221120099, +852800908988,+3618830300,+82267126700,+82803334000,+82803308877,+74959612426,+74959612427,+886800095988,+886800020021";
    }
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = [(__CFString *)v4 componentsSeparatedByString:@",", 0];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v13 length])
        {
          v14 = +[TUHandle normalizedHandleWithDestinationID:v13];
          [v7 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  v15 = (NSSet *)[v7 copy];
  appleCareHandles = self->_appleCareHandles;
  self->_appleCareHandles = v15;
}

- (BOOL)contains:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TUContactsDataProviderAppleCareHandles *)self appleCareHandles];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (NSSet)appleCareHandles
{
  return self->_appleCareHandles;
}

- (void).cxx_destruct
{
}

@end