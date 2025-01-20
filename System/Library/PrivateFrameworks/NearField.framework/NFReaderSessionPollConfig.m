@interface NFReaderSessionPollConfig
+ (id)pollConfigWithTechnology:(unsigned int)a3;
- (BOOL)fieldDetect;
- (BOOL)lpcd;
- (BOOL)skipMifareClassify;
- (NFReaderSessionPollConfig)init;
- (NSData)ecp;
- (id)asDictionary;
- (unsigned)pollDuration;
- (unsigned)technology;
- (void)setEcp:(id)a3;
- (void)setFieldDetect:(BOOL)a3;
- (void)setLpcd:(BOOL)a3;
- (void)setPollDuration:(unsigned int)a3;
- (void)setSkipMifareClassify:(BOOL)a3;
- (void)setTechnology:(unsigned int)a3;
@end

@implementation NFReaderSessionPollConfig

- (NFReaderSessionPollConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)NFReaderSessionPollConfig;
  v2 = [(NFReaderSessionPollConfig *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_technology = 23;
    v2->_fieldDetect = 1;
    v4 = v2;
  }

  return v3;
}

+ (id)pollConfigWithTechnology:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = objc_opt_new();
  [v4 setTechnology:v3];
  return v4;
}

- (void)setEcp:(id)a3
{
  BOOL v4 = a3 != 0;
  objc_storeStrong((id *)&self->_ecp, a3);
  self->_technology = self->_technology & 0xFFFFFFF7 | (8 * v4);
}

- (id)asDictionary
{
  uint64_t v3 = objc_opt_new();
  BOOL v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NFReaderSessionPollConfig technology](self, "technology"));
  [v3 setObject:v4 forKeyedSubscript:@"tech"];

  v5 = [(NFReaderSessionPollConfig *)self ecp];

  if (v5)
  {
    objc_super v6 = [(NFReaderSessionPollConfig *)self ecp];
    [v3 setObject:v6 forKeyedSubscript:@"ecp"];
  }
  if ([(NFReaderSessionPollConfig *)self pollDuration])
  {
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[NFReaderSessionPollConfig pollDuration](self, "pollDuration"));
    [v3 setObject:v7 forKeyedSubscript:@"pollDuration"];
  }
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[NFReaderSessionPollConfig skipMifareClassify](self, "skipMifareClassify"));
  [v3 setObject:v8 forKeyedSubscript:@"skipMifareClassify"];

  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[NFReaderSessionPollConfig lpcd](self, "lpcd"));
  [v3 setObject:v9 forKeyedSubscript:@"lpcd"];

  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[NFReaderSessionPollConfig fieldDetect](self, "fieldDetect"));
  [v3 setObject:v10 forKeyedSubscript:@"fd"];

  return v3;
}

- (unsigned)technology
{
  return self->_technology;
}

- (void)setTechnology:(unsigned int)a3
{
  self->_technology = a3;
}

- (NSData)ecp
{
  return self->_ecp;
}

- (unsigned)pollDuration
{
  return self->_pollDuration;
}

- (void)setPollDuration:(unsigned int)a3
{
  self->_pollDuration = a3;
}

- (BOOL)skipMifareClassify
{
  return self->_skipMifareClassify;
}

- (void)setSkipMifareClassify:(BOOL)a3
{
  self->_skipMifareClassify = a3;
}

- (BOOL)lpcd
{
  return self->_lpcd;
}

- (void)setLpcd:(BOOL)a3
{
  self->_lpcd = a3;
}

- (BOOL)fieldDetect
{
  return self->_fieldDetect;
}

- (void)setFieldDetect:(BOOL)a3
{
  self->_fieldDetect = a3;
}

- (void).cxx_destruct
{
}

@end