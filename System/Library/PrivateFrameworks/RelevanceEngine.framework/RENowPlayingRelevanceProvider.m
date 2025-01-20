@interface RENowPlayingRelevanceProvider
+ (id)relevanceSimulatorID;
- (BOOL)isEqual:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)itemIdentifer;
- (RENowPlayingRelevanceProvider)initWithDictionary:(id)a3;
- (RENowPlayingRelevanceProvider)initWithState:(unint64_t)a3;
- (RENowPlayingRelevanceProvider)initWithState:(unint64_t)a3 bundleIdentifier:(id)a4 itemIdentifier:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryEncoding;
- (unint64_t)_hash;
- (unint64_t)state;
@end

@implementation RENowPlayingRelevanceProvider

+ (id)relevanceSimulatorID
{
  return @"now_playing";
}

- (RENowPlayingRelevanceProvider)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"state"];
  v6 = [v4 objectForKeyedSubscript:@"bundleIdentifier"];
  v7 = [v4 objectForKeyedSubscript:@"itemIdentifier"];

  v8 = -[RENowPlayingRelevanceProvider initWithState:bundleIdentifier:itemIdentifier:](self, "initWithState:bundleIdentifier:itemIdentifier:", [v5 unsignedIntegerValue], v6, v7);
  return v8;
}

- (id)dictionaryEncoding
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [NSNumber numberWithUnsignedInteger:self->_state];
  [v3 setObject:v4 forKeyedSubscript:@"state"];

  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v3 setObject:bundleIdentifier forKeyedSubscript:@"bundleIdentifier"];
  }
  itemIdentifer = self->_itemIdentifer;
  if (itemIdentifer) {
    [v3 setObject:itemIdentifer forKeyedSubscript:@"itemIdentifier"];
  }
  v7 = (void *)[v3 copy];

  return v7;
}

- (RENowPlayingRelevanceProvider)initWithState:(unint64_t)a3
{
  return [(RENowPlayingRelevanceProvider *)self initWithState:a3 bundleIdentifier:0 itemIdentifier:0];
}

- (RENowPlayingRelevanceProvider)initWithState:(unint64_t)a3 bundleIdentifier:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RENowPlayingRelevanceProvider;
  v10 = [(RERelevanceProvider *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_state = a3;
    uint64_t v12 = [v8 copy];
    bundleIdentifier = v11->_bundleIdentifier;
    v11->_bundleIdentifier = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    itemIdentifer = v11->_itemIdentifer;
    v11->_itemIdentifer = (NSString *)v14;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  unint64_t state = self->_state;
  bundleIdentifier = self->_bundleIdentifier;
  itemIdentifer = self->_itemIdentifer;
  return (id)[v4 initWithState:state bundleIdentifier:bundleIdentifier itemIdentifier:itemIdentifer];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RENowPlayingRelevanceProvider *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)RENowPlayingRelevanceProvider;
    if ([(RERelevanceProvider *)&v18 isEqual:v4])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v5 = v4;
        v6 = v5;
        if (self->_state == v5->_state)
        {
          bundleIdentifier = self->_bundleIdentifier;
          id v8 = v5->_bundleIdentifier;
          if (bundleIdentifier == v8)
          {
          }
          else
          {
            id v9 = v8;
            v10 = bundleIdentifier;
            int v11 = [(NSString *)v10 isEqual:v9];

            if (!v11) {
              goto LABEL_7;
            }
          }
          itemIdentifer = self->_itemIdentifer;
          uint64_t v14 = v6->_itemIdentifer;
          v15 = itemIdentifer;
          v16 = v15;
          if (v15 == v14) {
            char v12 = 1;
          }
          else {
            char v12 = [(NSString *)v15 isEqual:v14];
          }

          goto LABEL_15;
        }
LABEL_7:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    char v12 = 0;
  }
LABEL_16:

  return v12;
}

- (unint64_t)_hash
{
  unint64_t state = self->_state;
  NSUInteger v4 = [(NSString *)self->_itemIdentifer hash] ^ state;
  return v4 ^ [(NSString *)self->_bundleIdentifier hash];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)RENowPlayingRelevanceProvider;
  v3 = [(RENowPlayingRelevanceProvider *)&v6 description];
  NSUInteger v4 = [v3 stringByAppendingFormat:@" state=%lu, bundleIdentifier=%@, itemIdentifier=%@", self->_state, self->_bundleIdentifier, self->_itemIdentifer];

  return v4;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)itemIdentifer
{
  return self->_itemIdentifer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifer, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end