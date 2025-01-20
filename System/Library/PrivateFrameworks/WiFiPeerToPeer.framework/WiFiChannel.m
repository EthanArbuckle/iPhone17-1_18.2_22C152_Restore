@interface WiFiChannel
+ (BOOL)supportsSecureCoding;
- (BOOL)extensionChannelAbove;
- (BOOL)is2_4GHz;
- (BOOL)is5GHz;
- (BOOL)is6GHz;
- (BOOL)isDFS;
- (BOOL)isEqual:(id)a3;
- (WiFiChannel)initWithChannelNumber:(unsigned int)a3 bandwidth:(int64_t)a4 is2_4GHz:(BOOL)a5 is5GHz:(BOOL)a6 is6GHz:(BOOL)a7 isDFS:(BOOL)a8 extensionChannelAbove:(BOOL)a9;
- (WiFiChannel)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)bandwidth;
- (unint64_t)hash;
- (unsigned)channelNumber;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WiFiChannel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiChannel)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeInt32ForKey:@"WiFiChannel.channelNumberKey"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"WiFiChannel.bandwidthKey"];
  uint64_t v7 = [v4 decodeBoolForKey:@"WiFiChannel.is2_4GHzKey"];
  uint64_t v8 = [v4 decodeBoolForKey:@"WiFiChannel.is5GHzKey"];
  uint64_t v9 = [v4 decodeBoolForKey:@"WiFiChannel.is6GHzKey"];
  uint64_t v10 = [v4 decodeBoolForKey:@"WiFiChannel.isDFSKey"];
  char v11 = [v4 decodeBoolForKey:@"WiFiChannel.extensionChannelAboveKey"];

  LOBYTE(v13) = v11;
  return [(WiFiChannel *)self initWithChannelNumber:v5 bandwidth:v6 is2_4GHz:v7 is5GHz:v8 is6GHz:v9 isDFS:v10 extensionChannelAbove:v13];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt32:forKey:", -[WiFiChannel channelNumber](self, "channelNumber"), @"WiFiChannel.channelNumberKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[WiFiChannel bandwidth](self, "bandwidth"), @"WiFiChannel.bandwidthKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiChannel is2_4GHz](self, "is2_4GHz"), @"WiFiChannel.is2_4GHzKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiChannel is5GHz](self, "is5GHz"), @"WiFiChannel.is5GHzKey");
  [v4 encodeBool:self->_is6GHz forKey:@"WiFiChannel.is6GHzKey"];
  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiChannel isDFS](self, "isDFS"), @"WiFiChannel.isDFSKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[WiFiChannel extensionChannelAbove](self, "extensionChannelAbove"), @"WiFiChannel.extensionChannelAboveKey");
}

- (WiFiChannel)initWithChannelNumber:(unsigned int)a3 bandwidth:(int64_t)a4 is2_4GHz:(BOOL)a5 is5GHz:(BOOL)a6 is6GHz:(BOOL)a7 isDFS:(BOOL)a8 extensionChannelAbove:(BOOL)a9
{
  v16.receiver = self;
  v16.super_class = (Class)WiFiChannel;
  result = [(WiFiChannel *)&v16 init];
  if (result)
  {
    result->_channelNumber = a3;
    result->_bandwidth = a4;
    result->_is2_4GHz = a5;
    result->_is5GHz = a6;
    result->_is6GHz = a7;
    result->_isDFS = a8;
    result->_extensionChannelAbove = a9;
  }
  return result;
}

- (unint64_t)hash
{
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[WiFiChannel channelNumber](self, "channelNumber"));
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WiFiChannel *)a3;
  if (self == v4)
  {
    uint64_t v5 = 0;
LABEL_12:
    BOOL v12 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v12 = 0;
    uint64_t v5 = 0;
    goto LABEL_14;
  }
  uint64_t v5 = v4;
  unsigned int v6 = [(WiFiChannel *)self channelNumber];
  if (v6 == [v5 channelNumber])
  {
    int64_t v7 = [(WiFiChannel *)self bandwidth];
    if (v7 == [v5 bandwidth])
    {
      int v8 = [(WiFiChannel *)self is2_4GHz];
      if (v8 == objc_msgSend(v5, "is2_4GHz"))
      {
        int v9 = [(WiFiChannel *)self is5GHz];
        if (v9 == [v5 is5GHz] && self->_is6GHz == v5[10])
        {
          int v10 = [(WiFiChannel *)self isDFS];
          if (v10 == [v5 isDFS])
          {
            int v11 = [(WiFiChannel *)self extensionChannelAbove];
            if (v11 == [v5 extensionChannelAbove]) {
              goto LABEL_12;
            }
          }
        }
      }
    }
  }
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (id)description
{
  int64_t v3 = [(WiFiChannel *)self bandwidth];
  if ((unint64_t)(v3 - 3) >= 3)
  {
    if (v3 == 2)
    {
      if ([(WiFiChannel *)self extensionChannelAbove]) {
        id v4 = @"+";
      }
      else {
        id v4 = @"-";
      }
    }
    else
    {
      id v4 = &stru_1F1806D08;
    }
  }
  else
  {
    id v4 = @"yy";
  }
  return (id)[NSString stringWithFormat:@"%u%@", -[WiFiChannel channelNumber](self, "channelNumber"), v4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [WiFiChannel alloc];
  uint64_t v5 = [(WiFiChannel *)self channelNumber];
  int64_t v6 = [(WiFiChannel *)self bandwidth];
  BOOL v7 = [(WiFiChannel *)self is2_4GHz];
  BOOL v8 = [(WiFiChannel *)self is5GHz];
  BOOL is6GHz = self->_is6GHz;
  BOOL v10 = [(WiFiChannel *)self isDFS];
  LOBYTE(v12) = [(WiFiChannel *)self extensionChannelAbove];
  return [(WiFiChannel *)v4 initWithChannelNumber:v5 bandwidth:v6 is2_4GHz:v7 is5GHz:v8 is6GHz:is6GHz isDFS:v10 extensionChannelAbove:v12];
}

- (unsigned)channelNumber
{
  return self->_channelNumber;
}

- (BOOL)is2_4GHz
{
  return self->_is2_4GHz;
}

- (BOOL)is5GHz
{
  return self->_is5GHz;
}

- (BOOL)is6GHz
{
  return self->_is6GHz;
}

- (BOOL)isDFS
{
  return self->_isDFS;
}

- (int64_t)bandwidth
{
  return self->_bandwidth;
}

- (BOOL)extensionChannelAbove
{
  return self->_extensionChannelAbove;
}

@end