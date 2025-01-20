@interface SSBiomeConsumers
+ (id)sharedInstance;
- (SSBiomeConsumers)init;
- (void)start;
- (void)stop;
@end

@implementation SSBiomeConsumers

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_35);
  }
  v2 = (void *)sharedInstance_sharedInstance_3;
  return v2;
}

uint64_t __34__SSBiomeConsumers_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_3 = objc_alloc_init(SSBiomeConsumers);
  return MEMORY[0x1F41817F8]();
}

- (SSBiomeConsumers)init
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)SSBiomeConsumers;
  v2 = [(SSBiomeConsumers *)&v11 init];
  if (v2 && +[SSBiomeConsumers enabled])
  {
    v3 = +[SSAppInFocus sharedInstance];
    v12[0] = v3;
    v4 = +[SSAppIntent sharedInstance];
    v12[1] = v4;
    v5 = +[SSMediaNowPlaying sharedInstance];
    v12[2] = v5;
    v6 = +[SSSystemSettingsSearchTerms sharedInstance];
    v12[3] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
    consumers = v2->_consumers;
    v2->_consumers = (NSArray *)v7;

    v9 = v2;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)start
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_consumers;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "start", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)stop
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_consumers;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "stop", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
}

@end