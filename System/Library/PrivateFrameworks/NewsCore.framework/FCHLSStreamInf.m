@interface FCHLSStreamInf
- (id)description;
- (void)setPropertiesFromAttributeList:(void *)a1;
@end

@implementation FCHLSStreamInf

- (void)setPropertiesFromAttributeList:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v11 = v3;
    v4 = [v3 objectForKeyedSubscript:@"BANDWIDTH"];
    a1[2] = FCHLSUIntegerFromString(v4);
    v5 = [v11 objectForKeyedSubscript:@"AVERAGE-BANDWIDTH"];
    v6 = v5;
    if (v5) {
      a1[3] = FCHLSUIntegerFromString(v5);
    }
    uint64_t v7 = [v11 objectForKeyedSubscript:@"CODECS"];
    v8 = (void *)a1[4];
    a1[4] = v7;

    uint64_t v9 = [v11 objectForKeyedSubscript:@"AUDIO"];
    v10 = (void *)a1[5];
    a1[5] = v9;

    id v3 = v11;
  }
}

- (id)description
{
  v2 = NSString;
  if (self)
  {
    unint64_t bandwidth = self->_bandwidth;
    unint64_t averageBandwidth = self->_averageBandwidth;
    v6 = self->_codecs;
    audio = self->_audio;
  }
  else
  {
    v6 = 0;
    unint64_t bandwidth = 0;
    unint64_t averageBandwidth = 0;
    audio = 0;
  }
  v8 = [v2 stringWithFormat:@"{ Bandwidth: %llu, Average Bandwidth: %llu, codecs: %@, audio: %@", bandwidth, averageBandwidth, v6, audio];

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audio, 0);
  objc_storeStrong((id *)&self->_codecs, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end