@interface AtlasRecordData
- (NSData)content;
- (id)description;
- (unsigned)recordId;
- (unsigned)sfi;
- (void)setContent:(id)a3;
- (void)setRecordId:(unsigned __int8)a3;
- (void)setSfi:(unsigned __int8)a3;
@end

@implementation AtlasRecordData

- (id)description
{
  v3 = NSString;
  unsigned int v4 = [(AtlasRecordData *)self sfi];
  unsigned int v5 = [(AtlasRecordData *)self recordId];
  v6 = [(AtlasRecordData *)self content];
  v7 = [v6 asHexString];
  v8 = [v3 stringWithFormat:@"SFI : %02X - RecordId : %02X - Content : %@", v4, v5, v7];

  return v8;
}

- (unsigned)sfi
{
  return self->sfi;
}

- (void)setSfi:(unsigned __int8)a3
{
  self->sfi = a3;
}

- (unsigned)recordId
{
  return self->recordId;
}

- (void)setRecordId:(unsigned __int8)a3
{
  self->recordId = a3;
}

- (NSData)content
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end