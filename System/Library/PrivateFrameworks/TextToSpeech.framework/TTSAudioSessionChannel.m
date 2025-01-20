@interface TTSAudioSessionChannel
+ (id)channelWithChannel:(id)a3;
+ (id)convertChannels:(id)a3;
- (AVAudioSessionChannelDescription)channel;
- (BOOL)isEqual:(id)a3;
- (NSString)channelName;
- (NSString)owningPortUID;
- (TTSAudioSessionChannel)init;
- (id)description;
- (unint64_t)channelNumber;
- (unsigned)channelLabel;
- (void)dealloc;
- (void)setChannel:(id)a3;
- (void)setChannelLabel:(unsigned int)a3;
- (void)setChannelName:(id)a3;
- (void)setChannelNumber:(unint64_t)a3;
- (void)setOwningPortUID:(id)a3;
@end

@implementation TTSAudioSessionChannel

+ (id)channelWithChannel:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  objc_msgSend_setChannel_(v4, v5, (uint64_t)v3, v6, v7);

  return v4;
}

+ (id)convertChannels:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v8 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v4, v5, v6, v7);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v9 = v3;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v34, (uint64_t)v38, 16);
  if (v11)
  {
    uint64_t v16 = v11;
    uint64_t v17 = *(void *)v35;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v9);
        }
        v19 = *(void **)(*((void *)&v34 + 1) + 8 * v18);
        v20 = objc_msgSend_channel(v19, v12, v13, v14, v15);

        v25 = objc_msgSend_channel(v19, v21, v22, v23, v24);
        v29 = v25;
        if (v20)
        {
          objc_msgSend_addObject_(v8, v26, (uint64_t)v25, v27, v28);
LABEL_8:

          goto LABEL_10;
        }

        if (!v29)
        {
          v29 = AXTTSLogCommon();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
            sub_1A688F5F4(&v32, v33, v29);
          }
          goto LABEL_8;
        }
LABEL_10:
        ++v18;
      }
      while (v16 != v18);
      uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v34, (uint64_t)v38, 16);
      uint64_t v16 = v30;
    }
    while (v30);
  }

  return v8;
}

- (TTSAudioSessionChannel)init
{
  v6.receiver = self;
  v6.super_class = (Class)TTSAudioSessionChannel;
  v2 = [(TTSAudioSessionChannel *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_channelNumber = 0x7FFFFFFFFFFFFFFFLL;
    v2->_channelLabel = -1;
    v4 = v2;
  }

  return v3;
}

- (unsigned)channelLabel
{
  if (self->_channelLabel != -1) {
    return self->_channelLabel;
  }
  objc_super v6 = objc_msgSend_channel(self, a2, v2, v3, v4);
  unsigned int v11 = objc_msgSend_channelLabel(v6, v7, v8, v9, v10);

  return v11;
}

- (unint64_t)channelNumber
{
  if (self->_channelNumber != 0x7FFFFFFFFFFFFFFFLL) {
    return self->_channelNumber;
  }
  uint64_t v5 = objc_msgSend_channel(self, a2, v2, v3, v4);
  unint64_t v10 = objc_msgSend_channelNumber(v5, v6, v7, v8, v9);

  return v10;
}

- (NSString)channelName
{
  channelName = self->_channelName;
  if (channelName)
  {
    objc_super v6 = channelName;
  }
  else
  {
    uint64_t v7 = objc_msgSend_channel(self, a2, v2, v3, v4);
    objc_msgSend_channelName(v7, v8, v9, v10, v11);
    objc_super v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (NSString)owningPortUID
{
  owningPortUID = self->_owningPortUID;
  if (owningPortUID)
  {
    objc_super v6 = owningPortUID;
  }
  else
  {
    uint64_t v7 = objc_msgSend_channel(self, a2, v2, v3, v4);
    objc_msgSend_owningPortUID(v7, v8, v9, v10, v11);
    objc_super v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self->_channelNumber == 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend_channelNumber(v4, v5, v6, v7, v8) == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v9 = objc_msgSend_channel(self, v5, v6, v7, v8);
      uint64_t v14 = objc_msgSend_channel(v4, v10, v11, v12, v13);
      char isEqual = objc_msgSend_isEqual_(v9, v15, (uint64_t)v14, v16, v17);
    }
    else
    {
      unint64_t channelNumber = self->_channelNumber;
      char isEqual = channelNumber == objc_msgSend_channelNumber(v4, v5, v6, v7, v8);
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (void)dealloc
{
  objc_msgSend_setChannel_(self, a2, 0, v2, v3);
  v5.receiver = self;
  v5.super_class = (Class)TTSAudioSessionChannel;
  [(TTSAudioSessionChannel *)&v5 dealloc];
}

- (id)description
{
  objc_super v5 = NSString;
  uint64_t v6 = objc_msgSend_channel(self, a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_description(v6, v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_stringWithFormat_(v5, v12, @"TTSAudioSessionChannel -> %@", v13, v14, v11);

  return v15;
}

- (AVAudioSessionChannelDescription)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (void)setChannelName:(id)a3
{
}

- (void)setChannelNumber:(unint64_t)a3
{
  self->_unint64_t channelNumber = a3;
}

- (void)setChannelLabel:(unsigned int)a3
{
  self->_channelLabel = a3;
}

- (void)setOwningPortUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owningPortUID, 0);
  objc_storeStrong((id *)&self->_channelName, 0);

  objc_storeStrong((id *)&self->_channel, 0);
}

@end