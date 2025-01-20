@interface MRPlaybackQueue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasLocation;
- (BOOL)isEqual:(id)a3;
- (MRPlaybackQueue)initWithCoder:(id)a3;
- (MRPlaybackQueue)initWithContentItem:(id)a3;
- (MRPlaybackQueue)initWithContentItems:(id)a3;
- (MRPlaybackQueue)initWithContentItems:(id)a3 location:(unint64_t)a4;
- (MRPlaybackQueue)initWithContentItems:(id)a3 location:(unint64_t)a4 withPropertiesFromPlaybackQueue:(id)a5;
- (MRPlaybackQueue)initWithContentItems:(id)a3 withPropertiesFromPlaybackQueue:(id)a4;
- (MRPlaybackQueue)initWithData:(id)a3;
- (MRPlaybackQueue)initWithProtobuf:(id)a3;
- (MRPlayerPath)resolvedPlayerPath;
- (NSArray)contentItemIdentifiers;
- (NSArray)contentItems;
- (NSData)data;
- (NSDictionary)auxiliaryNowPlayingInfo;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)nowPlayingInfo;
- (NSDictionary)properties;
- (NSSet)homeUserIdentifiers;
- (NSString)minimalReadableDescription;
- (NSString)queueIdentifier;
- (NSString)requestIdentifier;
- (_MRPlaybackQueueContextProtobuf)context;
- (_NSRange)range;
- (id)contentItemForIdentifier:(id)a3;
- (id)contentItemWithOffset:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)protobufWithEncoding:(int64_t)a3;
- (int64_t)location;
- (void)encodeWithCoder:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)mergePropertiesFromPlaybackQueue:(id)a3;
- (void)setAuxiliaryNowPlayingInfo:(id)a3;
- (void)setContentItems:(id)a3;
- (void)setContext:(id)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setHomeUserIdentifiers:(id)a3;
- (void)setLocation:(int64_t)a3;
- (void)setProperties:(id)a3;
- (void)setQueueIdentifier:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setResolvedPlayerPath:(id)a3;
@end

@implementation MRPlaybackQueue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_resolvedPlayerPath, 0);
  objc_storeStrong((id *)&self->_auxiliaryNowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_queueIdentifier, 0);

  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

- (MRPlaybackQueue)initWithContentItems:(id)a3 location:(unint64_t)a4
{
  result = [(MRPlaybackQueue *)self initWithContentItems:a3];
  if (result)
  {
    result->_location = a4;
    result->_hasLocation = 1;
  }
  return result;
}

- (MRPlaybackQueue)initWithContentItems:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRPlaybackQueue;
  v5 = [(MRPlaybackQueue *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    contentItems = v5->_contentItems;
    v5->_contentItems = (NSArray *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setLocation:", -[MRPlaybackQueue location](self, "location"));
  objc_msgSend(v5, "setHasLocation:", -[MRPlaybackQueue hasLocation](self, "hasLocation"));
  uint64_t v6 = [(MRPlaybackQueue *)self requestIdentifier];
  v7 = (void *)[v6 copyWithZone:a3];
  [v5 setRequestIdentifier:v7];

  v8 = [(MRPlaybackQueue *)self queueIdentifier];
  objc_super v9 = (void *)[v8 copyWithZone:a3];
  [v5 setQueueIdentifier:v9];

  v10 = [(MRPlaybackQueue *)self resolvedPlayerPath];
  v11 = (void *)[v10 copyWithZone:a3];
  [v5 setResolvedPlayerPath:v11];

  v12 = [(MRPlaybackQueue *)self homeUserIdentifiers];
  v13 = (void *)[v12 copyWithZone:a3];
  [v5 setHomeUserIdentifiers:v13];

  v14 = [(MRPlaybackQueue *)self contentItems];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __32__MRPlaybackQueue_copyWithZone___block_invoke;
  v23[3] = &__block_descriptor_40_e23__16__0__MRContentItem_8l;
  v23[4] = a3;
  v15 = objc_msgSend(v14, "mr_map:", v23);
  [v5 setContentItems:v15];

  v16 = [(MRPlaybackQueue *)self properties];
  v17 = (void *)[v16 copyWithZone:a3];
  [v5 setProperties:v17];

  v18 = [(MRPlaybackQueue *)self auxiliaryNowPlayingInfo];
  v19 = (void *)[v18 copyWithZone:a3];
  [v5 setAuxiliaryNowPlayingInfo:v19];

  v20 = [(MRPlaybackQueue *)self context];
  v21 = (void *)[v20 copyWithZone:a3];
  [v5 setContext:v21];

  return v5;
}

- (BOOL)hasLocation
{
  return self->_hasLocation;
}

- (MRPlayerPath)resolvedPlayerPath
{
  return self->_resolvedPlayerPath;
}

- (NSString)queueIdentifier
{
  return self->_queueIdentifier;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (NSDictionary)auxiliaryNowPlayingInfo
{
  return self->_auxiliaryNowPlayingInfo;
}

- (_NSRange)range
{
  int64_t v3 = [(MRPlaybackQueue *)self location];
  id v4 = [(MRPlaybackQueue *)self contentItems];
  uint64_t v5 = [v4 count];

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (int64_t)location
{
  return self->_location;
}

- (void)setResolvedPlayerPath:(id)a3
{
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSSet)homeUserIdentifiers
{
  return self->_homeUserIdentifiers;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setQueueIdentifier:(id)a3
{
}

- (void)setProperties:(id)a3
{
}

- (void)setAuxiliaryNowPlayingInfo:(id)a3
{
}

- (_MRPlaybackQueueContextProtobuf)context
{
  return self->_context;
}

- (void)setHomeUserIdentifiers:(id)a3
{
}

- (void)setContext:(id)a3
{
}

- (void)setLocation:(int64_t)a3
{
  self->_location = a3;
  self->_hasLocation = 1;
}

- (void)setHasLocation:(BOOL)a3
{
  self->_hasLocation = a3;
}

- (void)setContentItems:(id)a3
{
}

id __32__MRPlaybackQueue_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copyWithZone:*(void *)(a1 + 32)];

  return v2;
}

- (id)contentItemWithOffset:(unint64_t)a3
{
  if (contentItemWithOffset__onceToken == -1)
  {
    if (!self) {
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&contentItemWithOffset__onceToken, &__block_literal_global_45_1);
    if (!self) {
      goto LABEL_8;
    }
  }
  if (contentItemWithOffset__isNano) {
    goto LABEL_8;
  }
  uint64_t v5 = [(MRPlaybackQueue *)self contentItems];
  if ([v5 count])
  {
    BOOL v6 = [(MRPlaybackQueue *)self hasLocation];

    if (v6) {
      goto LABEL_8;
    }
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    NSUInteger v7 = [NSString stringWithUTF8String:"-[MRPlaybackQueue contentItemWithOffset:]"];
    [v5 handleFailureInFunction:v7 file:@"MRPlaybackQueue.m" lineNumber:257 description:@"Attempting to set non-range based playbackQueue"];
  }
LABEL_8:
  uint64_t v8 = [(MRPlaybackQueue *)self location];
  if (v8 >= 0) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = -v8;
  }
  unint64_t v10 = v9 + a3;
  v11 = [(MRPlaybackQueue *)self contentItems];
  unint64_t v12 = [v11 count];

  if (v10 >= v12)
  {
    v14 = 0;
  }
  else
  {
    v13 = [(MRPlaybackQueue *)self contentItems];
    v14 = [v13 objectAtIndexedSubscript:v10];
  }

  return v14;
}

- (NSArray)contentItems
{
  return self->_contentItems;
}

MRContentItem *__36__MRPlaybackQueue_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int64_t v3 = [[MRContentItem alloc] initWithProtobuf:v2];

  return v3;
}

uint64_t __40__MRPlaybackQueue_protobufWithEncoding___block_invoke(uint64_t a1, void *a2)
{
  return [a2 protobufWithEncoding:*(void *)(a1 + 32)];
}

uint64_t __43__MRPlaybackQueue_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (NSString)minimalReadableDescription
{
  int64_t v3 = [(MRPlaybackQueue *)self dictionaryRepresentation];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [(MRPlaybackQueue *)self contentItems];
  BOOL v6 = MRContentItemsCopyMinimalReadableDescription(v5, 0);

  if (v6) {
    [v4 setObject:v6 forKey:@"contentItems"];
  }
  NSUInteger v7 = [v4 description];

  return (NSString *)v7;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(MRPlaybackQueue *)self hasLocation])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRPlaybackQueue location](self, "location"));
    [v3 setObject:v4 forKeyedSubscript:@"location"];
  }
  uint64_t v5 = [(MRPlaybackQueue *)self requestIdentifier];
  [v3 setObject:v5 forKeyedSubscript:@"requestIdentifier"];

  BOOL v6 = [(MRPlaybackQueue *)self queueIdentifier];
  [v3 setObject:v6 forKeyedSubscript:@"queueIdentifier"];

  NSUInteger v7 = [(MRPlaybackQueue *)self resolvedPlayerPath];
  [v3 setObject:v7 forKeyedSubscript:@"resolvedPlayerPath"];

  uint64_t v8 = [(MRPlaybackQueue *)self homeUserIdentifiers];
  [v3 setObject:v8 forKeyedSubscript:@"homeUserIdentifiers"];

  uint64_t v9 = [(MRPlaybackQueue *)self contentItems];
  unint64_t v10 = objc_msgSend(v9, "mr_map:", &__block_literal_global_26_1);
  [v3 setObject:v10 forKeyedSubscript:@"contentItems"];

  v11 = [(MRPlaybackQueue *)self properties];
  [v3 setObject:v11 forKeyedSubscript:@"properties"];

  unint64_t v12 = [(MRPlaybackQueue *)self auxiliaryNowPlayingInfo];
  [v3 setObject:v12 forKeyedSubscript:@"auxiliaryNowPlayingInfo"];

  return (NSDictionary *)v3;
}

- (NSData)data
{
  id v2 = [(MRPlaybackQueue *)self protobufWithEncoding:0];
  id v3 = [v2 data];

  return (NSData *)v3;
}

- (id)protobufWithEncoding:(int64_t)a3
{
  uint64_t v5 = objc_alloc_init(_MRPlaybackQueueProtobuf);
  BOOL v6 = [(MRPlaybackQueue *)self context];
  [(_MRPlaybackQueueProtobuf *)v5 setContext:v6];

  [(_MRPlaybackQueueProtobuf *)v5 setLocation:[(MRPlaybackQueue *)self location]];
  [(_MRPlaybackQueueProtobuf *)v5 setHasLocation:[(MRPlaybackQueue *)self hasLocation]];
  NSUInteger v7 = [(MRPlaybackQueue *)self requestIdentifier];
  uint64_t v8 = (void *)[v7 copy];
  [(_MRPlaybackQueueProtobuf *)v5 setRequestID:v8];

  uint64_t v9 = [(MRPlaybackQueue *)self queueIdentifier];
  unint64_t v10 = (void *)[v9 copy];
  [(_MRPlaybackQueueProtobuf *)v5 setQueueIdentifier:v10];

  v11 = [(MRPlaybackQueue *)self resolvedPlayerPath];
  unint64_t v12 = [v11 protobuf];
  [(_MRPlaybackQueueProtobuf *)v5 setResolvedPlayerPath:v12];

  v13 = [(MRPlaybackQueue *)self homeUserIdentifiers];
  v14 = [v13 allObjects];
  v15 = (void *)[v14 mutableCopy];
  [(_MRPlaybackQueueProtobuf *)v5 setHomeUserIdentifiers:v15];

  v16 = [(MRPlaybackQueue *)self contentItems];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __40__MRPlaybackQueue_protobufWithEncoding___block_invoke;
  v24[3] = &__block_descriptor_40_e47____MRContentItemProtobuf_16__0__MRContentItem_8l;
  v24[4] = a3;
  v17 = objc_msgSend(v16, "mr_map:", v24);
  v18 = (void *)[v17 mutableCopy];
  [(_MRPlaybackQueueProtobuf *)v5 setContentItems:v18];

  v19 = [(MRPlaybackQueue *)self properties];
  v20 = _MRProtoUtilsProtoDictionaryFromNSDictionary(v19);
  [(_MRPlaybackQueueProtobuf *)v5 setProperties:v20];

  v21 = [(MRPlaybackQueue *)self auxiliaryNowPlayingInfo];
  v22 = _MRProtoUtilsProtoDictionaryFromNSDictionary(v21);
  [(_MRPlaybackQueueProtobuf *)v5 setAuxiliaryNowPlayingInfo:v22];

  return v5;
}

uint64_t __33__MRPlaybackQueue_nowPlayingInfo__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

- (MRPlaybackQueue)initWithContentItems:(id)a3 location:(unint64_t)a4 withPropertiesFromPlaybackQueue:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(MRPlaybackQueue *)self initWithContentItems:a3 location:a4];
  unint64_t v10 = v9;
  if (v9) {
    [(MRPlaybackQueue *)v9 mergePropertiesFromPlaybackQueue:v8];
  }

  return v10;
}

- (void)mergePropertiesFromPlaybackQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 queueIdentifier];
  BOOL v6 = (NSString *)[v5 copy];
  queueIdentifier = self->_queueIdentifier;
  self->_queueIdentifier = v6;

  id v8 = [v4 properties];
  uint64_t v9 = (NSDictionary *)[v8 copy];
  properties = self->_properties;
  self->_properties = v9;

  v11 = [v4 auxiliaryNowPlayingInfo];
  unint64_t v12 = (NSDictionary *)[v11 copy];
  auxiliaryNowPlayingInfo = self->_auxiliaryNowPlayingInfo;
  self->_auxiliaryNowPlayingInfo = v12;

  v14 = [v4 resolvedPlayerPath];
  v15 = (MRPlayerPath *)[v14 copy];
  resolvedPlayerPath = self->_resolvedPlayerPath;
  self->_resolvedPlayerPath = v15;

  v17 = [v4 homeUserIdentifiers];
  v18 = (NSSet *)[v17 copy];
  homeUserIdentifiers = self->_homeUserIdentifiers;
  self->_homeUserIdentifiers = v18;

  v20 = [v4 context];
  v21 = (_MRPlaybackQueueContextProtobuf *)[v20 copy];
  context = self->_context;
  self->_context = v21;

  id v25 = [v4 requestIdentifier];

  v23 = (NSString *)[v25 copy];
  requestIdentifier = self->_requestIdentifier;
  self->_requestIdentifier = v23;
}

- (MRPlaybackQueue)initWithData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [[_MRPlaybackQueueProtobuf alloc] initWithData:v4];

    self = [(MRPlaybackQueue *)self initWithProtobuf:v5];
    BOOL v6 = self;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (MRPlaybackQueue)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v34.receiver = self;
    v34.super_class = (Class)MRPlaybackQueue;
    uint64_t v5 = [(MRPlaybackQueue *)&v34 init];
    if (v5)
    {
      uint64_t v6 = [v4 context];
      context = v5->_context;
      v5->_context = (_MRPlaybackQueueContextProtobuf *)v6;

      v5->_location = (int)[v4 location];
      v5->_hasLocation = [v4 hasLocation];
      id v8 = [v4 requestID];
      uint64_t v9 = [v8 copy];
      requestIdentifier = v5->_requestIdentifier;
      v5->_requestIdentifier = (NSString *)v9;

      v11 = [v4 queueIdentifier];
      uint64_t v12 = [v11 copy];
      queueIdentifier = v5->_queueIdentifier;
      v5->_queueIdentifier = (NSString *)v12;

      v14 = [v4 homeUserIdentifiers];

      if (v14)
      {
        id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        v16 = [v4 homeUserIdentifiers];
        uint64_t v17 = [v15 initWithArray:v16];
        homeUserIdentifiers = v5->_homeUserIdentifiers;
        v5->_homeUserIdentifiers = (NSSet *)v17;
      }
      v19 = [v4 contentItems];
      uint64_t v20 = objc_msgSend(v19, "mr_map:", &__block_literal_global_102);
      contentItems = v5->_contentItems;
      v5->_contentItems = (NSArray *)v20;

      v22 = [v4 properties];
      uint64_t v23 = _MRProtoUtilsNSDictionaryFromProtoDictionary(v22);
      properties = v5->_properties;
      v5->_properties = (NSDictionary *)v23;

      id v25 = [v4 auxiliaryNowPlayingInfo];
      uint64_t v26 = _MRProtoUtilsNSDictionaryFromProtoDictionary(v25);
      auxiliaryNowPlayingInfo = v5->_auxiliaryNowPlayingInfo;
      v5->_auxiliaryNowPlayingInfo = (NSDictionary *)v26;

      if ([v4 hasResolvedPlayerPath])
      {
        v28 = [MRPlayerPath alloc];
        v29 = [v4 resolvedPlayerPath];
        uint64_t v30 = [(MRPlayerPath *)v28 initWithProtobuf:v29];
        resolvedPlayerPath = v5->_resolvedPlayerPath;
        v5->_resolvedPlayerPath = (MRPlayerPath *)v30;
      }
    }
    self = v5;
    v32 = self;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (id)contentItemForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(MRPlaybackQueue *)self contentItems];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unint64_t v10 = [v9 identifier];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

void __41__MRPlaybackQueue_contentItemWithOffset___block_invoke()
{
  id v1 = [MEMORY[0x1E4F28F80] processInfo];
  v0 = [v1 processName];
  contentItemWithOffset__isNano = [v0 containsString:@"nanomediaremotelinkagent"];
}

- (NSDictionary)nowPlayingInfo
{
  id v3 = [(MRPlaybackQueue *)self contentItemWithOffset:0];
  if (v3)
  {
    id v4 = [(MRPlaybackQueue *)self auxiliaryNowPlayingInfo];
    uint64_t v5 = [v3 nowPlayingInfo];
    id v6 = (void *)[v5 mutableCopy];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __33__MRPlaybackQueue_nowPlayingInfo__block_invoke;
    v10[3] = &unk_1E57D48B0;
    id v11 = v6;
    id v7 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v10];
    id v8 = (void *)[v7 copy];
  }
  else
  {
    id v8 = 0;
  }

  return (NSDictionary *)v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [(MRPlaybackQueue *)self contentItems];
  uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v18)
  {
    uint64_t v16 = *(void *)v24;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v23 + 1) + 8 * v4);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v6 = [v17 contentItems];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v20;
          do
          {
            uint64_t v10 = 0;
            do
            {
              if (*(void *)v20 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
              uint64_t v12 = [v5 identifier];
              long long v13 = [v11 identifier];
              int v14 = [v12 isEqualToString:v13];

              if (v14) {
                MRContentItemMerge(v5, v11);
              }
              ++v10;
            }
            while (v8 != v10);
            uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v8);
        }

        ++v4;
      }
      while (v4 != v18);
      uint64_t v18 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v18);
  }
}

- (MRPlaybackQueue)initWithContentItem:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v9 = a3;
    uint64_t v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    id v6 = [v4 arrayWithObjects:&v9 count:1];

    self = -[MRPlaybackQueue initWithContentItems:](self, "initWithContentItems:", v6, v9, v10);
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (MRPlaybackQueue)initWithContentItems:(id)a3 withPropertiesFromPlaybackQueue:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(MRPlaybackQueue *)self initWithContentItems:a3];
  uint64_t v8 = v7;
  if (v7) {
    [(MRPlaybackQueue *)v7 mergePropertiesFromPlaybackQueue:v6];
  }

  return v8;
}

- (MRPlaybackQueue)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobuf"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = _MRLogForCategory(0);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MRLanguageOption initWithCoder:]((uint64_t)v5, v6);
    }

    id v5 = 0;
  }
  uint64_t v7 = [(MRPlaybackQueue *)self initWithProtobuf:v5];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MRPlaybackQueue *)self protobufWithEncoding:0];
  [v4 encodeObject:v5 forKey:@"protobuf"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)contentItemIdentifiers
{
  id v2 = [(MRPlaybackQueue *)self contentItems];
  id v3 = objc_msgSend(v2, "mr_map:", &__block_literal_global_37);

  return (NSArray *)v3;
}

uint64_t __41__MRPlaybackQueue_contentItemIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MRPlaybackQueue *)a3;
  if (v4 == self)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_30;
    }
    BOOL v5 = [(MRPlaybackQueue *)v4 hasLocation];
    if (v5 != [(MRPlaybackQueue *)self hasLocation]) {
      goto LABEL_30;
    }
    if ([(MRPlaybackQueue *)v4 hasLocation])
    {
      if ([(MRPlaybackQueue *)self hasLocation])
      {
        uint64_t v6 = [(MRPlaybackQueue *)v4 location];
        if (v6 != [(MRPlaybackQueue *)self location]) {
          goto LABEL_30;
        }
      }
    }
    uint64_t v7 = [(MRPlaybackQueue *)v4 requestIdentifier];
    uint64_t v8 = [(MRPlaybackQueue *)self requestIdentifier];
    if (v7 == (void *)v8)
    {
    }
    else
    {
      id v9 = (void *)v8;
      uint64_t v10 = [(MRPlaybackQueue *)v4 requestIdentifier];
      id v11 = [(MRPlaybackQueue *)self requestIdentifier];
      int v12 = [v10 isEqualToString:v11];

      if (!v12) {
        goto LABEL_30;
      }
    }
    int v14 = [(MRPlaybackQueue *)v4 queueIdentifier];
    uint64_t v15 = [(MRPlaybackQueue *)self queueIdentifier];
    if (v14 == (void *)v15)
    {
    }
    else
    {
      uint64_t v16 = (void *)v15;
      id v17 = [(MRPlaybackQueue *)v4 queueIdentifier];
      uint64_t v18 = [(MRPlaybackQueue *)self queueIdentifier];
      int v19 = [v17 isEqualToString:v18];

      if (!v19) {
        goto LABEL_30;
      }
    }
    long long v20 = [(MRPlaybackQueue *)v4 contentItems];
    uint64_t v21 = [(MRPlaybackQueue *)self contentItems];
    if (v20 == (void *)v21)
    {
    }
    else
    {
      long long v22 = (void *)v21;
      long long v23 = [(MRPlaybackQueue *)v4 contentItems];
      long long v24 = [(MRPlaybackQueue *)self contentItems];
      int v25 = [v23 isEqualToArray:v24];

      if (!v25) {
        goto LABEL_30;
      }
    }
    long long v26 = [(MRPlaybackQueue *)v4 resolvedPlayerPath];
    uint64_t v27 = [(MRPlaybackQueue *)self resolvedPlayerPath];
    if (v26 == (void *)v27)
    {
    }
    else
    {
      v28 = (void *)v27;
      uint64_t v29 = [(MRPlaybackQueue *)v4 resolvedPlayerPath];
      uint64_t v30 = [(MRPlaybackQueue *)self resolvedPlayerPath];
      int v31 = [v29 isEqual:v30];

      if (!v31) {
        goto LABEL_30;
      }
    }
    v32 = [(MRPlaybackQueue *)v4 homeUserIdentifiers];
    uint64_t v33 = [(MRPlaybackQueue *)self homeUserIdentifiers];
    if (v32 == (void *)v33)
    {
    }
    else
    {
      objc_super v34 = (void *)v33;
      v35 = [(MRPlaybackQueue *)v4 homeUserIdentifiers];
      v36 = [(MRPlaybackQueue *)self homeUserIdentifiers];
      int v37 = [v35 isEqualToSet:v36];

      if (!v37) {
        goto LABEL_30;
      }
    }
    v38 = [(MRPlaybackQueue *)v4 properties];
    uint64_t v39 = [(MRPlaybackQueue *)self properties];
    if (v38 == (void *)v39)
    {
    }
    else
    {
      v40 = (void *)v39;
      v41 = [(MRPlaybackQueue *)v4 properties];
      v42 = [(MRPlaybackQueue *)self properties];
      int v43 = [v41 isEqualToDictionary:v42];

      if (!v43)
      {
LABEL_30:
        char v13 = 0;
        goto LABEL_31;
      }
    }
    v45 = [(MRPlaybackQueue *)v4 auxiliaryNowPlayingInfo];
    uint64_t v46 = [(MRPlaybackQueue *)self auxiliaryNowPlayingInfo];
    if (v45 == (void *)v46)
    {
      char v13 = 1;
      v47 = v45;
    }
    else
    {
      v47 = (void *)v46;
      v48 = [(MRPlaybackQueue *)v4 auxiliaryNowPlayingInfo];
      v49 = [(MRPlaybackQueue *)self auxiliaryNowPlayingInfo];
      char v13 = [v48 isEqualToDictionary:v49];
    }
  }
LABEL_31:

  return v13;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(MRPlaybackQueue *)self dictionaryRepresentation];
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

@end