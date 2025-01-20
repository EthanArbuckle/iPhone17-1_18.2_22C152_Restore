@interface WLKContentPlayResponse
- (NSDictionary)dictionary;
- (WLKContentPlayResponse)init;
- (WLKContentPlayResponse)initWithDictionary:(id)a3;
- (WLKPlayable)playable;
@end

@implementation WLKContentPlayResponse

- (WLKContentPlayResponse)initWithDictionary:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WLKContentPlayResponse;
  v6 = [(WLKContentPlayResponse *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    v8 = objc_msgSend(v5, "wlk_dictionaryForKey:", @"data");
    uint64_t v9 = +[WLKChannelsResponse parseChannelsFromPayload:v8];
    v10 = (void *)v9;
    if (v9)
    {
      v16 = @"WLKModelContextKeyChannels";
      v17[0] = v9;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    }
    else
    {
      v11 = 0;
    }
    v12 = [[WLKPlayable alloc] initWithDictionary:v8 context:v11];
    playable = v7->_playable;
    v7->_playable = v12;
  }
  return v7;
}

- (WLKContentPlayResponse)init
{
  return 0;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (WLKPlayable)playable
{
  return self->_playable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playable, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end