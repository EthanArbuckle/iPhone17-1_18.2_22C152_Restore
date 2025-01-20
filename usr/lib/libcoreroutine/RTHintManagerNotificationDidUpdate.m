@interface RTHintManagerNotificationDidUpdate
+ (id)sourcesUpdatedForHints:(id)a3;
- (NSNumber)hintSourcesUpdated;
- (RTHintManagerNotificationDidUpdate)initWithHints:(id)a3;
- (id)description;
- (void)setHintSourcesUpdated:(id)a3;
@end

@implementation RTHintManagerNotificationDidUpdate

- (RTHintManagerNotificationDidUpdate)initWithHints:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTHintManagerNotificationDidUpdate;
  v5 = [(RTNotification *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [(id)objc_opt_class() sourcesUpdatedForHints:v4];
    hintSourcesUpdated = v5->_hintSourcesUpdated;
    v5->_hintSourcesUpdated = (NSNumber *)v6;
  }
  return v5;
}

+ (id)sourcesUpdatedForHints:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= 1 << ([*(id *)(*((void *)&v11 + 1) + 8 * i) source] + 1);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_super v9 = [NSNumber numberWithInteger:v6];

  return v9;
}

- (void).cxx_destruct
{
}

- (NSNumber)hintSourcesUpdated
{
  return self->_hintSourcesUpdated;
}

- (id)description
{
  v2 = NSString;
  id v3 = [(RTHintManagerNotificationDidUpdate *)self hintSourcesUpdated];
  uint64_t v4 = [v2 stringWithFormat:@"hintSourcesUpdated, %@", v3];

  return v4;
}

- (void)setHintSourcesUpdated:(id)a3
{
}

@end