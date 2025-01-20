@interface SFSSCacheItem
+ (id)generateCacheKey:(id)a3 text:(id)a4;
- (AudioStreamBasicDescription)asbd;
- (NSArray)rawAudio;
- (NSString)key;
- (NSString)resourceKey;
- (NSString)text;
- (NSString)voiceKey;
- (SFSSCacheItem)initWithText:(id)a3 voiceName:(id)a4 voiceKey:(id)a5 resourceKey:(id)a6 asbd:(AudioStreamBasicDescription *)a7 rawAudio:(id)a8;
@end

@implementation SFSSCacheItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawAudio, 0);
  objc_storeStrong((id *)&self->_resourceKey, 0);
  objc_storeStrong((id *)&self->_voiceKey, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (NSArray)rawAudio
{
  return self->_rawAudio;
}

- (AudioStreamBasicDescription)asbd
{
  long long v3 = *(_OWORD *)&self[1].mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[1].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[2].mSampleRate;
  return self;
}

- (NSString)resourceKey
{
  return self->_resourceKey;
}

- (NSString)voiceKey
{
  return self->_voiceKey;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)key
{
  return self->_key;
}

- (SFSSCacheItem)initWithText:(id)a3 voiceName:(id)a4 voiceKey:(id)a5 resourceKey:(id)a6 asbd:(AudioStreamBasicDescription *)a7 rawAudio:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)SFSSCacheItem;
  v19 = [(SFSSCacheItem *)&v31 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    text = v19->_text;
    v19->_text = (NSString *)v20;

    uint64_t v22 = [v16 copy];
    voiceKey = v19->_voiceKey;
    v19->_voiceKey = (NSString *)v22;

    uint64_t v24 = [v17 copy];
    resourceKey = v19->_resourceKey;
    v19->_resourceKey = (NSString *)v24;

    long long v26 = *(_OWORD *)&a7->mSampleRate;
    long long v27 = *(_OWORD *)&a7->mBytesPerPacket;
    *(void *)&v19->_asbd.mBitsPerChannel = *(void *)&a7->mBitsPerChannel;
    *(_OWORD *)&v19->_asbd.mSampleRate = v26;
    *(_OWORD *)&v19->_asbd.mBytesPerPacket = v27;
    objc_storeStrong((id *)&v19->_rawAudio, a8);
    uint64_t v28 = +[SFSSCacheItem generateCacheKey:v15 text:v19->_text];
    key = v19->_key;
    v19->_key = (NSString *)v28;
  }
  return v19;
}

+ (id)generateCacheKey:(id)a3 text:(id)a4
{
  v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a3, a4, 0);
  v5 = [v4 componentsJoinedByString:@":"];

  return v5;
}

@end