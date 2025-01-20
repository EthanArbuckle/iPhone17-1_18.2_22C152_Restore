@interface W5WiFiChannel
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToChannel:(id)a3;
- (W5WiFiChannel)init;
- (W5WiFiChannel)initWithChannel:(int64_t)a3 flags:(unsigned int)a4;
- (W5WiFiChannel)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)snifferDescription;
- (int64_t)band;
- (int64_t)channel;
- (int64_t)channelWidth;
- (unint64_t)hash;
- (unsigned)flags;
- (void)encodeWithCoder:(id)a3;
@end

@implementation W5WiFiChannel

- (W5WiFiChannel)initWithChannel:(int64_t)a3 flags:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)W5WiFiChannel;
  result = [(W5WiFiChannel *)&v7 init];
  if (result)
  {
    result->_channel = a3;
    result->_flags = a4;
  }
  return result;
}

- (W5WiFiChannel)init
{
}

- (int64_t)channelWidth
{
  unsigned int flags = self->_flags;
  int64_t v3 = 80;
  uint64_t v4 = 40;
  uint64_t v5 = 20;
  if ((flags & 2) == 0) {
    uint64_t v5 = -1;
  }
  if ((flags & 4) == 0) {
    uint64_t v4 = v5;
  }
  if ((flags & 0x400) == 0) {
    int64_t v3 = v4;
  }
  if ((flags & 0x800) != 0) {
    return 160;
  }
  else {
    return v3;
  }
}

- (id)description
{
  if (!objc_opt_class()) {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ldg%ld/%ld", -[W5WiFiChannel band](self, "band"), -[W5WiFiChannel channel](self, "channel"), -[W5WiFiChannel channelWidth](self, "channelWidth"));
  }
  id v3 = objc_alloc_init(MEMORY[0x263F386D0]);
  objc_msgSend(v3, "setChannel:", -[W5WiFiChannel channel](self, "channel"));
  objc_msgSend(v3, "setFlags:", -[W5WiFiChannel flags](self, "flags"));
  return (id)[v3 description];
}

- (int64_t)band
{
  unsigned int flags = self->_flags;
  int64_t v3 = 5;
  uint64_t v4 = 6;
  if ((flags & 0x2000) == 0) {
    uint64_t v4 = -1;
  }
  if ((flags & 0x10) == 0) {
    int64_t v3 = v4;
  }
  if ((flags & 8) != 0) {
    return 2;
  }
  else {
    return v3;
  }
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5WiFiChannel;
  if (-[W5WiFiChannel conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (BOOL)isEqualToChannel:(id)a3
{
  int64_t channel = self->_channel;
  if (channel != [a3 channel]) {
    return 0;
  }
  unsigned int flags = self->_flags;
  return flags == [a3 flags];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(W5WiFiChannel *)self isEqualToChannel:a3];
}

- (unint64_t)hash
{
  return self->_channel ^ self->_flags;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[W5WiFiChannel allocWithZone:a3];
  int64_t channel = self->_channel;
  uint64_t flags = self->_flags;
  return [(W5WiFiChannel *)v4 initWithChannel:channel flags:flags];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:self->_channel forKey:@"_channel"];
  uint64_t flags = self->_flags;
  [a3 encodeInt:flags forKey:@"_flags"];
}

- (W5WiFiChannel)initWithCoder:(id)a3
{
  return -[W5WiFiChannel initWithChannel:flags:](self, "initWithChannel:flags:", [a3 decodeIntegerForKey:@"_channel"], objc_msgSend(a3, "decodeIntForKey:", @"_flags"));
}

- (id)snifferDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ld (%ld GHz) / %ld MHz", -[W5WiFiChannel channel](self, "channel"), -[W5WiFiChannel band](self, "band"), -[W5WiFiChannel channelWidth](self, "channelWidth"));
}

- (int64_t)channel
{
  return self->_channel;
}

- (unsigned)flags
{
  return self->_flags;
}

@end