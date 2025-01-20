@interface FCHLSPlaylist
+ (id)playlistParsingData:(void *)a3 error:;
- (BOOL)parserShouldCollectLine:(id)a3;
- (NSString)description;
- (void)parser:(id)a3 lineIsTag:(id)a4 value:(id)a5 attributeList:(id)a6;
- (void)parser:(id)a3 lineIsURL:(id)a4;
@end

@implementation FCHLSPlaylist

- (NSString)description
{
  if (self)
  {
    if (self->_independentSegments) {
      v3 = @"YES";
    }
    else {
      v3 = @"NO";
    }
    v4 = [MEMORY[0x1E4F28E78] stringWithFormat:@"{ independentSegments: %@\n", v3];
    groups = self->_groups;
  }
  else
  {
    v4 = [MEMORY[0x1E4F28E78] stringWithFormat:@"{ independentSegments: %@\n", @"NO"];
    groups = 0;
  }
  if ([(NSArray *)groups count])
  {
    if (self) {
      v6 = self->_groups;
    }
    else {
      v6 = 0;
    }
    v7 = [(NSArray *)v6 debugDescription];
    [v4 appendFormat:@"Groups: %@\n", v7];
  }
  if (self) {
    streamInfs = self->_streamInfs;
  }
  else {
    streamInfs = 0;
  }
  if ([(NSArray *)streamInfs count])
  {
    if (self) {
      v9 = self->_streamInfs;
    }
    else {
      v9 = 0;
    }
    v10 = [(NSArray *)v9 debugDescription];
    [v4 appendFormat:@"SegmentInfs: %@\n", v10];
  }
  if (self) {
    segments = self->_segments;
  }
  else {
    segments = 0;
  }
  if ([(NSArray *)segments count])
  {
    if (self) {
      v12 = self->_segments;
    }
    else {
      v12 = 0;
    }
    v13 = [(NSArray *)v12 debugDescription];
    [v4 appendFormat:@"Segments: %@\n", v13];
  }
  [v4 appendFormat:@"}"];
  v14 = (void *)[v4 copy];

  return (NSString *)v14;
}

void __41__FCHLSPlaylist__parseUsingParser_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [FCHLSGroup alloc];
  id v8 = v6;
  id v9 = v5;
  if (v7
    && (v15.receiver = v7,
        v15.super_class = (Class)FCHLSGroup,
        (v14 = objc_msgSendSuper2(&v15, sel_init)) != 0))
  {
    uint64_t v10 = [v8 copy];
    v11 = (void *)v14[1];
    v14[1] = v10;

    uint64_t v12 = [v9 copy];
    v13 = (void *)v14[2];
    v14[2] = v12;
  }
  else
  {
    v14 = 0;
  }

  [*(id *)(a1 + 32) addObject:v14];
}

+ (id)playlistParsingData:(void *)a3 error:
{
  id v4 = a2;
  self;
  id v5 = -[FCM3U8Parser initWithData:]([FCM3U8Parser alloc], v4);

  id v6 = v5;
  self;
  v7 = [FCHLSPlaylist alloc];
  if (!v7
    || (v45.receiver = v7,
        v45.super_class = (Class)FCHLSPlaylist,
        (id v8 = objc_msgSendSuper2(&v45, sel_init)) == 0))
  {
    id v9 = 0;
LABEL_17:
    v40 = 0;
    goto LABEL_18;
  }
  id v9 = v8;
  uint64_t v10 = (void *)v8[2];
  uint64_t v11 = MEMORY[0x1E4F1CBF0];
  v8[2] = MEMORY[0x1E4F1CBF0];

  uint64_t v12 = (void *)*((void *)v9 + 4);
  *((void *)v9 + 4) = v11;

  objc_storeStrong((id *)v9 + 8, 0);
  uint64_t v13 = [MEMORY[0x1E4F1CA80] set];
  v14 = (void *)*((void *)v9 + 7);
  *((void *)v9 + 7) = v13;

  objc_super v15 = v6;
  v16 = v15;
  if (v15) {
    objc_storeWeak(v15 + 2, v9);
  }
  v17 = objc_alloc_init(FCHLSPlaylistState);
  v18 = (void *)*((void *)v9 + 6);
  *((void *)v9 + 6) = v17;

  id v49 = 0;
  BOOL v19 = -[FCM3U8Parser parseWithError:]((uint64_t)v16, &v49);

  id v20 = v49;
  v21 = v20;
  if (!v19)
  {
    if (a3) {
      *a3 = v20;
    }

    goto LABEL_17;
  }
  id v22 = *((id *)v9 + 6);
  v23 = [MEMORY[0x1E4F1CA48] array];
  if (v22) {
    v24 = (void *)*((void *)v22 + 1);
  }
  else {
    v24 = 0;
  }
  v45.receiver = (id)MEMORY[0x1E4F143A8];
  v45.super_class = (Class)3221225472;
  v46 = __41__FCHLSPlaylist__parseUsingParser_error___block_invoke;
  v47 = &unk_1E5B556B0;
  id v25 = v23;
  id v48 = v25;
  [v24 enumerateKeysAndObjectsUsingBlock:&v45];
  uint64_t v26 = [v25 copy];
  v27 = (void *)*((void *)v9 + 2);
  *((void *)v9 + 2) = v26;

  if (v22)
  {
    id v28 = *((id *)v22 + 6);
    uint64_t v29 = [v28 copy];
    v30 = (void *)*((void *)v9 + 3);
    *((void *)v9 + 3) = v29;

    v31 = (void *)*((void *)v22 + 4);
  }
  else
  {
    uint64_t v43 = [0 copy];
    v44 = (void *)*((void *)v9 + 3);
    *((void *)v9 + 3) = v43;

    v31 = 0;
  }
  id v32 = v31;
  uint64_t v33 = [v32 copy];
  v34 = (void *)*((void *)v9 + 4);
  *((void *)v9 + 4) = v33;

  if (v22) {
    v35 = (void *)*((void *)v22 + 8);
  }
  else {
    v35 = 0;
  }
  id v36 = v35;
  uint64_t v37 = [v36 copy];
  v38 = (void *)*((void *)v9 + 5);
  *((void *)v9 + 5) = v37;

  v39 = (void *)*((void *)v9 + 6);
  *((void *)v9 + 6) = 0;

  v40 = v9;
LABEL_18:

  id v41 = v40;
  return v41;
}

- (void)parser:(id)a3 lineIsURL:(id)a4
{
  id v19 = a4;
  if (!self || (id v6 = self->_state) == 0)
  {
    id v9 = [FCHLSSegment alloc];
    uint64_t v7 = 0;
    id v12 = 0;
    v14 = 0;
    double v11 = 0.0;
    char v13 = 1;
LABEL_7:
    id v15 = v19;
    id v16 = v12;
    id v17 = v14;
    if (v9)
    {
      v20.receiver = v9;
      v20.super_class = (Class)FCHLSSegment;
      v18 = [(FCHLSPlaylist *)&v20 init];
      id v9 = (FCHLSSegment *)v18;
      if (v18)
      {
        objc_storeStrong((id *)&v18->_groups, a4);
        v9->_duration = v11;
        objc_storeStrong((id *)&v9->_map, v12);
        objc_storeStrong((id *)&v9->_key, v14);
      }
    }

    if (v13)
    {
      uint64_t v10 = 0;
    }
    else
    {
      *(void *)(v7 + 24) = 0xBFF0000000000000;
      uint64_t v10 = *(void **)(v7 + 32);
    }
    goto LABEL_12;
  }
  uint64_t v7 = (uint64_t)v6;
  currentStreamInf = v6->_currentStreamInf;
  if (!currentStreamInf)
  {
    if (v6->_currentDuration == -1.0) {
      goto LABEL_13;
    }
    id v9 = [FCHLSSegment alloc];
    double v11 = *(double *)(v7 + 24);
    id v12 = *(id *)(v7 + 16);
    char v13 = 0;
    v14 = *(void **)(v7 + 56);
    goto LABEL_7;
  }
  id v9 = currentStreamInf;
  -[FCHLSPlaylistState setCurrentStreamInf:](v7, 0);
  objc_storeStrong((id *)&v9->_map, a4);
  uint64_t v10 = *(void **)(v7 + 48);
LABEL_12:
  [v10 addObject:v9];

LABEL_13:
}

- (void)parser:(id)a3 lineIsTag:(id)a4 value:(id)a5 attributeList:(id)a6
{
  id v46 = a4;
  id v9 = a5;
  id v10 = a6;
  if (self) {
    state = self->_state;
  }
  else {
    state = 0;
  }
  id v12 = state;
  if ([v46 isEqualToString:@"#EXT-X-MEDIA"])
  {
    char v13 = [v10 objectForKeyedSubscript:@"GROUP-ID"];
    v14 = objc_alloc_init(FCHLSMedia);
    if (v14)
    {
      id v15 = v10;
      uint64_t v16 = [v15 objectForKeyedSubscript:@"TYPE"];
      type = v14->_type;
      v14->_type = (NSString *)v16;

      uint64_t v18 = [v15 objectForKeyedSubscript:@"URI"];
      url = v14->_url;
      v14->_url = (NSURL *)v18;

      uint64_t v20 = [v15 objectForKeyedSubscript:@"NAME"];

      name = v14->_name;
      v14->_name = (NSString *)v20;
    }
    if (v12) {
      mutableGroups = v12->_mutableGroups;
    }
    else {
      mutableGroups = 0;
    }
    v23 = [(NSMutableDictionary *)mutableGroups objectForKeyedSubscript:v13];
    if (!v23)
    {
      v23 = [MEMORY[0x1E4F1CA48] array];
      if (v12) {
        v24 = v12->_mutableGroups;
      }
      else {
        v24 = 0;
      }
      [(NSMutableDictionary *)v24 setObject:v23 forKeyedSubscript:v13];
    }
    [v23 addObject:v14];

LABEL_13:
LABEL_22:

    goto LABEL_23;
  }
  if ([v46 isEqualToString:@"#EXT-X-MAP"])
  {
    char v13 = objc_alloc_init(FCHLSMap);
    if (v13)
    {
      id v25 = [v10 objectForKeyedSubscript:@"URI"];
      uint64_t v26 = [MEMORY[0x1E4F1CB10] URLWithString:v25];
      v27 = v13->_url;
      v13->_url = (NSURL *)v26;
    }
    if (v12) {
      objc_storeStrong((id *)&v12->_currentMap, v13);
    }
    goto LABEL_22;
  }
  if ([v46 isEqualToString:@"#EXTINF"])
  {
    char v13 = [v9 componentsSeparatedByString:@","];
    id v28 = [(FCHLSMap *)v13 objectAtIndexedSubscript:0];
    [v28 doubleValue];
    double v30 = v29;

    if (v12) {
      v12->_currentDuration = v30;
    }
    goto LABEL_22;
  }
  if ([v46 isEqualToString:@"#EXT-X-INDEPENDENT-SEGMENTS"])
  {
    if (self) {
      self->_independentSegments = 1;
    }
    goto LABEL_23;
  }
  if ([v46 isEqualToString:@"#EXT-X-KEY"])
  {
    v31 = objc_alloc_init(FCHLSKey);
    if (!v31)
    {
LABEL_49:

      goto LABEL_23;
    }
    id v32 = v10;
    uint64_t v33 = [v32 objectForKeyedSubscript:@"METHOD"];
    if ([@"NONE" isEqualToString:v33])
    {
      uint64_t v34 = 1;
    }
    else if ([@"AES-128" isEqualToString:v33])
    {
      uint64_t v34 = 2;
    }
    else
    {
      if (![@"SAMPLE-AES" isEqualToString:v33])
      {
        v31->_method = 0;
LABEL_47:
        uint64_t v37 = [v32 objectForKeyedSubscript:@"URI"];
        uint64_t v38 = [MEMORY[0x1E4F1CB10] URLWithString:v37];
        v39 = v31->_url;
        v31->_url = (NSURL *)v38;

        uint64_t v40 = [v32 objectForKeyedSubscript:@"KEYFORMAT"];
        keyFormat = v31->_keyFormat;
        v31->_keyFormat = (NSString *)v40;

        uint64_t v42 = [v32 objectForKeyedSubscript:@"KEYFORMATVERSIONS"];
        keyFormatVersions = v31->_keyFormatVersions;
        v31->_keyFormatVersions = (NSString *)v42;

        uint64_t v44 = [v32 objectForKeyedSubscript:@"IV"];

        iv = v31->_iv;
        v31->_iv = (NSString *)v44;

        if ([(NSString *)v31->_keyFormat isEqualToString:@"com.apple.streamingkeydelivery"])
        {
          -[FCPurchaseLookupResult setIntroOffer:]((uint64_t)v12, v31);
          [(NSMutableSet *)self->_uniqueKeys addObject:v31];
        }
        goto LABEL_49;
      }
      uint64_t v34 = 3;
    }
    v31->_method = v34;
    goto LABEL_47;
  }
  if ([v46 isEqualToString:@"#EXT-X-STREAM-INF"])
  {
    char v13 = objc_alloc_init(FCHLSStreamInf);
    -[FCHLSStreamInf setPropertiesFromAttributeList:](v13, v10);
    -[FCHLSPlaylistState setCurrentStreamInf:]((uint64_t)v12, v13);
    goto LABEL_22;
  }
  if (([v46 isEqualToString:@"#EXT-X-BITRATE"] & 1) == 0
    && [v46 isEqualToString:@"#EXT-X-SESSION-DATA"])
  {
    char v13 = [v10 objectForKeyedSubscript:@"DATA-ID"];
    uint64_t v35 = [v10 objectForKeyedSubscript:@"VALUE"];
    v14 = (FCHLSMedia *)v35;
    if (v13 && v35)
    {
      if (v12) {
        mutableSessionData = v12->_mutableSessionData;
      }
      else {
        mutableSessionData = 0;
      }
      [(NSMutableDictionary *)mutableSessionData setObject:v14 forKey:v13];
    }
    goto LABEL_13;
  }
LABEL_23:
}

- (BOOL)parserShouldCollectLine:(id)a3
{
  if (!self || (id v4 = self->_state) == 0)
  {
    id v6 = 0;
    char v14 = 1;
    goto LABEL_9;
  }
  currentStreamInf = v4->_currentStreamInf;

  if (!currentStreamInf) {
    return 1;
  }
  id v6 = self->_requestedBitrates;
  uint64_t v7 = NSNumber;
  id v8 = self->_state;
  id v9 = v8;
  if (v8)
  {
    id v10 = v8->_currentStreamInf;
    double v11 = v10;
    if (v10)
    {
      unint64_t averageBandwidth = v10->_averageBandwidth;
      if (!averageBandwidth) {
        unint64_t averageBandwidth = v10->_bandwidth;
      }
      goto LABEL_8;
    }
  }
  else
  {
    double v11 = 0;
  }
  unint64_t averageBandwidth = 0;
LABEL_8:
  char v13 = [v7 numberWithUnsignedLongLong:averageBandwidth];
  char v14 = [(NSArray *)v6 containsObject:v13];

LABEL_9:
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedBitrates, 0);
  objc_storeStrong((id *)&self->_uniqueKeys, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_sessionData, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_streamInfs, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

@end