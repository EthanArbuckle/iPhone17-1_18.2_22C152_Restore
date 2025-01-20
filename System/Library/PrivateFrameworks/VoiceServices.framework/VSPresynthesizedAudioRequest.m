@interface VSPresynthesizedAudioRequest
+ (BOOL)supportsSecureCoding;
- (AudioStreamBasicDescription)decoderStreamDescription;
- (AudioStreamBasicDescription)playerStreamDescription;
- (BOOL)canLogRequestText;
- (BOOL)enqueue;
- (BOOL)hasValidAudio;
- (NSData)audioData;
- (NSString)clientBundleIdentifier;
- (NSString)identifier;
- (NSString)text;
- (NSUUID)accessoryID;
- (NSUUID)siriRequestId;
- (VSPresynthesizedAudioRequest)init;
- (VSPresynthesizedAudioRequest)initWithAudioData:(id)a3 decoderStreamDescription:(AudioStreamBasicDescription *)a4 playerStreamDescription:(AudioStreamBasicDescription *)a5;
- (VSPresynthesizedAudioRequest)initWithAudioData:(id)a3 playerStreamDescription:(AudioStreamBasicDescription *)a4;
- (VSPresynthesizedAudioRequest)initWithCoder:(id)a3;
- (VSPresynthesizedAudioRequest)initWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)logText;
- (id)stopHandler;
- (unint64_t)pcmDataSize;
- (unint64_t)requestCreatedTimestamp;
- (unsigned)audioSessionID;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessoryID:(id)a3;
- (void)setAudioSessionID:(unsigned int)a3;
- (void)setClientBundleIdentifier:(id)a3;
- (void)setEnqueue:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setPcmDataSize:(unint64_t)a3;
- (void)setRequestCreatedTimestamp:(unint64_t)a3;
- (void)setSiriRequestId:(id)a3;
- (void)setStopHandler:(id)a3;
- (void)setText:(id)a3;
@end

@implementation VSPresynthesizedAudioRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stopHandler, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_siriRequestId, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_audioData, 0);
}

- (void)setStopHandler:(id)a3
{
}

- (id)stopHandler
{
  return self->_stopHandler;
}

- (void)setPcmDataSize:(unint64_t)a3
{
  self->_pcmDataSize = a3;
}

- (unint64_t)pcmDataSize
{
  return self->_pcmDataSize;
}

- (NSUUID)accessoryID
{
  return self->_accessoryID;
}

- (void)setClientBundleIdentifier:(id)a3
{
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void)setRequestCreatedTimestamp:(unint64_t)a3
{
  self->_requestCreatedTimestamp = a3;
}

- (unint64_t)requestCreatedTimestamp
{
  return self->_requestCreatedTimestamp;
}

- (void)setSiriRequestId:(id)a3
{
}

- (NSUUID)siriRequestId
{
  return self->_siriRequestId;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setEnqueue:(BOOL)a3
{
  self->_enqueue = a3;
}

- (BOOL)enqueue
{
  return self->_enqueue;
}

- (AudioStreamBasicDescription)playerStreamDescription
{
  long long v3 = *(_OWORD *)&self[3].mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[3].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[4].mSampleRate;
  return self;
}

- (AudioStreamBasicDescription)decoderStreamDescription
{
  long long v3 = *(_OWORD *)&self[2].mBytesPerFrame;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[2].mFormatID;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(Float64 *)&retstr->mBitsPerChannel = self[3].mSampleRate;
  return self;
}

- (NSData)audioData
{
  return self->_audioData;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (BOOL)canLogRequestText
{
  return 1;
}

- (id)description
{
  long long v3 = NSString;
  if (self->_decoderStreamDescription.mFormatID == 1869641075) {
    v4 = @"Opus";
  }
  else {
    v4 = @"PCM";
  }
  v5 = [NSNumber numberWithDouble:self->_decoderStreamDescription.mSampleRate];
  v6 = [v3 stringWithFormat:@"%@%@kHz", v4, v5];

  v7 = NSString;
  v8 = [NSNumber numberWithDouble:self->_playerStreamDescription.mSampleRate];
  v9 = [v7 stringWithFormat:@"PCM%@KHz", v8];

  v10 = NSString;
  clientBundleIdentifier = self->_clientBundleIdentifier;
  uint64_t audioSessionID = self->_audioSessionID;
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSData length](self->_audioData, "length"));
  v14 = [NSNumber numberWithUnsignedLongLong:self->_requestCreatedTimestamp];
  v15 = [(VSPresynthesizedAudioRequest *)self logText];
  v16 = [v10 stringWithFormat:@"sessionId %u, clientId %@, %@ bytes, input format %@, output format %@, requestCreatedTime %@, text '%@', identifier: %@, accessoryID:%@", audioSessionID, clientBundleIdentifier, v13, v6, v9, v14, v15, self->_identifier, self->_accessoryID];

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [VSPresynthesizedAudioRequest alloc];
  audioData = self->_audioData;
  long long v6 = *(_OWORD *)&self->_decoderStreamDescription.mBytesPerPacket;
  v11[0] = *(_OWORD *)&self->_decoderStreamDescription.mSampleRate;
  v11[1] = v6;
  uint64_t v12 = *(void *)&self->_decoderStreamDescription.mBitsPerChannel;
  long long v7 = *(_OWORD *)&self->_playerStreamDescription.mBytesPerPacket;
  v9[0] = *(_OWORD *)&self->_playerStreamDescription.mSampleRate;
  v9[1] = v7;
  uint64_t v10 = *(void *)&self->_playerStreamDescription.mBitsPerChannel;
  return [(VSPresynthesizedAudioRequest *)v4 initWithAudioData:audioData decoderStreamDescription:v11 playerStreamDescription:v9];
}

- (VSPresynthesizedAudioRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v22[0] = VSAudioFormat48khzOpus;
  v22[1] = unk_20CB038F0;
  uint64_t v23 = 0;
  v20[0] = VSAudioFormat48khzPCM;
  v20[1] = unk_20CB038A0;
  uint64_t v21 = 16;
  v5 = [(VSPresynthesizedAudioRequest *)self initWithAudioData:0 decoderStreamDescription:v22 playerStreamDescription:v20];
  long long v6 = v5;
  if (v5)
  {
    [v4 decodeValueOfObjCType:"{AudioStreamBasicDescription=dIIIIIIII}" at:&v5->_decoderStreamDescription size:40];
    [v4 decodeValueOfObjCType:"{AudioStreamBasicDescription=dIIIIIIII}" at:&v6->_playerStreamDescription size:40];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_audioData"];
    audioData = v6->_audioData;
    v6->_audioData = (NSData *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clientBundleIdentifier"];
    clientBundleIdentifier = v6->_clientBundleIdentifier;
    v6->_clientBundleIdentifier = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_text"];
    text = v6->_text;
    v6->_text = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_accessoryID"];
    accessoryID = v6->_accessoryID;
    v6->_accessoryID = (NSUUID *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_siriRequestId"];
    siriRequestId = v6->_siriRequestId;
    v6->_siriRequestId = (NSUUID *)v17;

    v6->_uint64_t audioSessionID = [v4 decodeInt32ForKey:@"_audioSessionID"];
    v6->_enqueue = [v4 decodeBoolForKey:@"_enqueue"];
    v6->_requestCreatedTimestamp = [v4 decodeInt64ForKey:@"_requestCreatedTimestamp"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  p_decoderStreamDescription = &self->_decoderStreamDescription;
  id v5 = a3;
  [v5 encodeValueOfObjCType:"{AudioStreamBasicDescription=dIIIIIIII}" at:p_decoderStreamDescription];
  [v5 encodeValueOfObjCType:"{AudioStreamBasicDescription=dIIIIIIII}" at:&self->_playerStreamDescription];
  [v5 encodeObject:self->_audioData forKey:@"_audioData"];
  [v5 encodeObject:self->_clientBundleIdentifier forKey:@"_clientBundleIdentifier"];
  [v5 encodeObject:self->_text forKey:@"_text"];
  [v5 encodeObject:self->_identifier forKey:@"_identifier"];
  [v5 encodeObject:self->_accessoryID forKey:@"_accessoryID"];
  [v5 encodeObject:self->_siriRequestId forKey:@"_siriRequestId"];
  [v5 encodeInt32:self->_audioSessionID forKey:@"_audioSessionID"];
  [v5 encodeBool:self->_enqueue forKey:@"_enqueue"];
  [v5 encodeInt64:self->_requestCreatedTimestamp forKey:@"_requestCreatedTimestamp"];
}

- (void)setAccessoryID:(id)a3
{
  if (a3) {
    self->_enqueue = 1;
  }
  id v4 = (NSUUID *)[a3 copy];
  accessoryID = self->_accessoryID;
  self->_accessoryID = v4;
}

- (BOOL)hasValidAudio
{
  audioData = self->_audioData;
  if (audioData)
  {
    audioData = [(NSData *)audioData length];
    if (audioData)
    {
      AudioFormatID mFormatID = self->_decoderStreamDescription.mFormatID;
      LOBYTE(audioData) = (mFormatID == 1869641075 || mFormatID == 1819304813)
                       && self->_playerStreamDescription.mFormatID == 1819304813;
    }
  }
  return (char)audioData;
}

- (id)logText
{
  text = self->_text;
  int v3 = [(VSPresynthesizedAudioRequest *)self canLogRequestText];
  return VSLoggingStringForUtterance(text, v3);
}

- (VSPresynthesizedAudioRequest)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSPresynthesizedAudioRequest;
  long long v6 = [(VSPresynthesizedAudioRequest *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (VSPresynthesizedAudioRequest)initWithAudioData:(id)a3 decoderStreamDescription:(AudioStreamBasicDescription *)a4 playerStreamDescription:(AudioStreamBasicDescription *)a5
{
  id v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VSPresynthesizedAudioRequest;
  uint64_t v10 = [(VSPresynthesizedAudioRequest *)&v17 init];
  uint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_audioData, a3);
    long long v12 = *(_OWORD *)&a4->mSampleRate;
    long long v13 = *(_OWORD *)&a4->mBytesPerPacket;
    *(void *)&v11->_decoderStreamDescription.mBitsPerChannel = *(void *)&a4->mBitsPerChannel;
    *(_OWORD *)&v11->_decoderStreamDescription.mBytesPerPacket = v13;
    *(_OWORD *)&v11->_decoderStreamDescription.mSampleRate = v12;
    long long v14 = *(_OWORD *)&a5->mSampleRate;
    long long v15 = *(_OWORD *)&a5->mBytesPerPacket;
    *(void *)&v11->_playerStreamDescription.mBitsPerChannel = *(void *)&a5->mBitsPerChannel;
    *(_OWORD *)&v11->_playerStreamDescription.mSampleRate = v14;
    *(_OWORD *)&v11->_playerStreamDescription.mBytesPerPacket = v15;
  }

  return v11;
}

- (VSPresynthesizedAudioRequest)initWithAudioData:(id)a3 playerStreamDescription:(AudioStreamBasicDescription *)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSPresynthesizedAudioRequest;
  v8 = [(VSPresynthesizedAudioRequest *)&v13 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_audioData, a3);
    *(void *)&v9->_decoderStreamDescription.mBitsPerChannel = 0;
    *(_OWORD *)&v9->_decoderStreamDescription.mSampleRate = VSAudioFormat48khzOpus;
    *(_OWORD *)&v9->_decoderStreamDescription.mBytesPerPacket = unk_20CB038F0;
    long long v11 = *(_OWORD *)&a4->mSampleRate;
    long long v10 = *(_OWORD *)&a4->mBytesPerPacket;
    *(void *)&v9->_playerStreamDescription.mBitsPerChannel = *(void *)&a4->mBitsPerChannel;
    *(_OWORD *)&v9->_playerStreamDescription.mSampleRate = v11;
    *(_OWORD *)&v9->_playerStreamDescription.mBytesPerPacket = v10;
  }

  return v9;
}

- (VSPresynthesizedAudioRequest)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end