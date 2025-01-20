@interface SidecarDisplayConfig
+ (BOOL)supportsSecureCoding;
- (CGSize)size;
- (NSNumber)cipher;
- (NSNumber)codec;
- (NSNumber)configureDisplayExclusiveMode;
- (NSNumber)dataLink;
- (NSNumber)displayID;
- (NSNumber)enableTimeSync;
- (NSNumber)framerate;
- (NSNumber)hdr;
- (NSNumber)keyFrameInterval;
- (NSNumber)lowLatency;
- (NSNumber)rtcp;
- (NSNumber)rtcpTimeoutInterval;
- (NSNumber)showSideBar;
- (NSNumber)showTouchBar;
- (NSNumber)tilesPerFrame;
- (NSNumber)txMaxBitrate;
- (NSNumber)txMinBitrate;
- (NSString)service;
- (SidecarDevice)device;
- (SidecarDisplayConfig)initWithCoder:(id)a3;
- (double)scale;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)transport;
- (void)encodeWithCoder:(id)a3;
- (void)setCipher:(id)a3;
- (void)setCodec:(id)a3;
- (void)setConfigureDisplayExclusiveMode:(id)a3;
- (void)setDataLink:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDisplayID:(id)a3;
- (void)setEnableTimeSync:(id)a3;
- (void)setFramerate:(id)a3;
- (void)setHdr:(id)a3;
- (void)setKeyFrameInterval:(id)a3;
- (void)setLowLatency:(id)a3;
- (void)setRtcp:(id)a3;
- (void)setRtcpTimeoutInterval:(id)a3;
- (void)setScale:(double)a3;
- (void)setService:(id)a3;
- (void)setShowSideBar:(id)a3;
- (void)setShowTouchBar:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setTilesPerFrame:(id)a3;
- (void)setTransport:(int64_t)a3;
- (void)setTxMaxBitrate:(id)a3;
- (void)setTxMinBitrate:(id)a3;
@end

@implementation SidecarDisplayConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txMaxBitrate, 0);
  objc_storeStrong((id *)&self->_txMinBitrate, 0);
  objc_storeStrong((id *)&self->_dataLink, 0);
  objc_storeStrong((id *)&self->_tilesPerFrame, 0);
  objc_storeStrong((id *)&self->_showSideBar, 0);
  objc_storeStrong((id *)&self->_showTouchBar, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_rtcpTimeoutInterval, 0);
  objc_storeStrong((id *)&self->_rtcp, 0);
  objc_storeStrong((id *)&self->_lowLatency, 0);
  objc_storeStrong((id *)&self->_keyFrameInterval, 0);
  objc_storeStrong((id *)&self->_hdr, 0);
  objc_storeStrong((id *)&self->_framerate, 0);
  objc_storeStrong((id *)&self->_enableTimeSync, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
  objc_storeStrong((id *)&self->_configureDisplayExclusiveMode, 0);
  objc_storeStrong((id *)&self->_codec, 0);
  objc_storeStrong((id *)&self->_cipher, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setTxMaxBitrate:(id)a3
{
}

- (NSNumber)txMaxBitrate
{
  return self->_txMaxBitrate;
}

- (void)setTxMinBitrate:(id)a3
{
}

- (NSNumber)txMinBitrate
{
  return self->_txMinBitrate;
}

- (void)setDataLink:(id)a3
{
}

- (NSNumber)dataLink
{
  return self->_dataLink;
}

- (void)setTransport:(int64_t)a3
{
  self->_transport = a3;
}

- (int64_t)transport
{
  return self->_transport;
}

- (void)setTilesPerFrame:(id)a3
{
}

- (NSNumber)tilesPerFrame
{
  return self->_tilesPerFrame;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setShowSideBar:(id)a3
{
}

- (NSNumber)showSideBar
{
  return self->_showSideBar;
}

- (void)setShowTouchBar:(id)a3
{
}

- (NSNumber)showTouchBar
{
  return self->_showTouchBar;
}

- (void)setService:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setRtcpTimeoutInterval:(id)a3
{
}

- (NSNumber)rtcpTimeoutInterval
{
  return self->_rtcpTimeoutInterval;
}

- (void)setRtcp:(id)a3
{
}

- (NSNumber)rtcp
{
  return self->_rtcp;
}

- (void)setLowLatency:(id)a3
{
}

- (NSNumber)lowLatency
{
  return self->_lowLatency;
}

- (void)setKeyFrameInterval:(id)a3
{
}

- (NSNumber)keyFrameInterval
{
  return self->_keyFrameInterval;
}

- (void)setHdr:(id)a3
{
}

- (NSNumber)hdr
{
  return self->_hdr;
}

- (void)setFramerate:(id)a3
{
}

- (NSNumber)framerate
{
  return self->_framerate;
}

- (void)setEnableTimeSync:(id)a3
{
}

- (NSNumber)enableTimeSync
{
  return self->_enableTimeSync;
}

- (void)setDisplayID:(id)a3
{
}

- (NSNumber)displayID
{
  return self->_displayID;
}

- (void)setConfigureDisplayExclusiveMode:(id)a3
{
}

- (NSNumber)configureDisplayExclusiveMode
{
  return self->_configureDisplayExclusiveMode;
}

- (void)setCodec:(id)a3
{
}

- (NSNumber)codec
{
  return self->_codec;
}

- (void)setCipher:(id)a3
{
}

- (NSNumber)cipher
{
  return self->_cipher;
}

- (void)setDevice:(id)a3
{
}

- (SidecarDevice)device
{
  return self->_device;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[SidecarDisplayConfig allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_cipher, self->_cipher);
  objc_storeStrong((id *)&v4->_codec, self->_codec);
  objc_storeStrong((id *)&v4->_configureDisplayExclusiveMode, self->_configureDisplayExclusiveMode);
  objc_storeStrong((id *)&v4->_device, self->_device);
  objc_storeStrong((id *)&v4->_displayID, self->_displayID);
  objc_storeStrong((id *)&v4->_enableTimeSync, self->_enableTimeSync);
  objc_storeStrong((id *)&v4->_framerate, self->_framerate);
  objc_storeStrong((id *)&v4->_hdr, self->_hdr);
  objc_storeStrong((id *)&v4->_keyFrameInterval, self->_keyFrameInterval);
  objc_storeStrong((id *)&v4->_lowLatency, self->_lowLatency);
  objc_storeStrong((id *)&v4->_rtcp, self->_rtcp);
  objc_storeStrong((id *)&v4->_rtcpTimeoutInterval, self->_rtcpTimeoutInterval);
  v4->_scale = self->_scale;
  objc_storeStrong((id *)&v4->_service, self->_service);
  objc_storeStrong((id *)&v4->_showTouchBar, self->_showTouchBar);
  objc_storeStrong((id *)&v4->_showSideBar, self->_showSideBar);
  v4->_size = self->_size;
  objc_storeStrong((id *)&v4->_tilesPerFrame, self->_tilesPerFrame);
  v4->_transport = self->_transport;
  objc_storeStrong((id *)&v4->_dataLink, self->_dataLink);
  objc_storeStrong((id *)&v4->_txMaxBitrate, self->_txMaxBitrate);
  objc_storeStrong((id *)&v4->_txMinBitrate, self->_txMinBitrate);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = (void *)*MEMORY[0x263F08160];
  id v5 = a3;
  validateXPCCoder(self, v5, v4);
  encodeObject(v5, @"cipher", self->_cipher);
  encodeObject(v5, @"codec", self->_codec);
  encodeObject(v5, @"configureDisplayExclusiveMode", self->_configureDisplayExclusiveMode);
  encodeObject(v5, @"device", self->_device);
  encodeObject(v5, @"displayID", self->_displayID);
  encodeObject(v5, @"framerate", self->_framerate);
  encodeObject(v5, @"hdr", self->_hdr);
  encodeObject(v5, @"keyFrameInterval", self->_keyFrameInterval);
  encodeObject(v5, @"lowLatency", self->_lowLatency);
  encodeObject(v5, @"rtcp", self->_rtcp);
  encodeObject(v5, @"rtcpTimeoutInterval", self->_rtcpTimeoutInterval);
  encodeDouble(v5, @"scale", self->_scale);
  encodeObject(v5, @"service", self->_service);
  encodeDouble(v5, @"size.width", self->_size.width);
  encodeDouble(v5, @"size.height", self->_size.height);
  encodeObject(v5, @"timeSync", self->_enableTimeSync);
  encodeObject(v5, @"touchBar", self->_showTouchBar);
  encodeObject(v5, @"sideBar", self->_showSideBar);
  encodeObject(v5, @"tiles", self->_tilesPerFrame);
  encodeInteger(v5, @"transport", self->_transport);
  encodeObject(v5, @"dataLink", self->_dataLink);
  encodeObject(v5, @"txMinBitrate", self->_txMinBitrate);
  encodeObject(v5, @"txMaxBitrate", self->_txMaxBitrate);
}

- (SidecarDisplayConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)SidecarDisplayConfig;
  id v5 = [(SidecarDisplayConfig *)&v48 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    validateXPCCoder(v5, v4, (void *)*MEMORY[0x263F08170]);
    uint64_t v9 = decodeObject(v4, @"cipher", v7);
    cipher = v5->_cipher;
    v5->_cipher = (NSNumber *)v9;

    uint64_t v11 = decodeObject(v4, @"codec", v7);
    codec = v5->_codec;
    v5->_codec = (NSNumber *)v11;

    uint64_t v13 = decodeObject(v4, @"configureDisplayExclusiveMode", v7);
    configureDisplayExclusiveMode = v5->_configureDisplayExclusiveMode;
    v5->_configureDisplayExclusiveMode = (NSNumber *)v13;

    uint64_t v15 = decodeObject(v4, @"device", v6);
    device = v5->_device;
    v5->_device = (SidecarDevice *)v15;

    uint64_t v17 = decodeObject(v4, @"displayID", v7);
    displayID = v5->_displayID;
    v5->_displayID = (NSNumber *)v17;

    uint64_t v19 = decodeObject(v4, @"framerate", v7);
    framerate = v5->_framerate;
    v5->_framerate = (NSNumber *)v19;

    uint64_t v21 = decodeObject(v4, @"hdr", v7);
    hdr = v5->_hdr;
    v5->_hdr = (NSNumber *)v21;

    uint64_t v23 = decodeObject(v4, @"keyFrameInterval", v7);
    keyFrameInterval = v5->_keyFrameInterval;
    v5->_keyFrameInterval = (NSNumber *)v23;

    uint64_t v25 = decodeObject(v4, @"lowLatency", v7);
    lowLatency = v5->_lowLatency;
    v5->_lowLatency = (NSNumber *)v25;

    uint64_t v27 = decodeObject(v4, @"rtcp", v7);
    rtcp = v5->_rtcp;
    v5->_rtcp = (NSNumber *)v27;

    uint64_t v29 = decodeObject(v4, @"rtcpTimeoutInterval", v7);
    rtcpTimeoutInterval = v5->_rtcpTimeoutInterval;
    v5->_rtcpTimeoutInterval = (NSNumber *)v29;

    v5->_scale = decodeDouble(v4, @"scale");
    uint64_t v31 = decodeObject(v4, @"service", v8);
    service = v5->_service;
    v5->_service = (NSString *)v31;

    v5->_size.double width = decodeDouble(v4, @"size.width");
    v5->_size.double height = decodeDouble(v4, @"size.height");
    uint64_t v33 = decodeObject(v4, @"timeSync", v7);
    enableTimeSync = v5->_enableTimeSync;
    v5->_enableTimeSync = (NSNumber *)v33;

    uint64_t v35 = decodeObject(v4, @"touchBar", v7);
    showTouchBar = v5->_showTouchBar;
    v5->_showTouchBar = (NSNumber *)v35;

    uint64_t v37 = decodeObject(v4, @"sideBar", v7);
    showSideBar = v5->_showSideBar;
    v5->_showSideBar = (NSNumber *)v37;

    uint64_t v39 = decodeObject(v4, @"tiles", v7);
    tilesPerFrame = v5->_tilesPerFrame;
    v5->_tilesPerFrame = (NSNumber *)v39;

    v5->_transport = decodeInteger(v4, @"transport");
    uint64_t v41 = decodeObject(v4, @"dataLink", v7);
    dataLink = v5->_dataLink;
    v5->_dataLink = (NSNumber *)v41;

    uint64_t v43 = decodeObject(v4, @"txMinBitrate", v7);
    txMinBitrate = v5->_txMinBitrate;
    v5->_txMinBitrate = (NSNumber *)v43;

    uint64_t v45 = decodeObject(v4, @"txMaxBitrate", v7);
    txMaxBitrate = v5->_txMaxBitrate;
    v5->_txMaxBitrate = (NSNumber *)v45;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end