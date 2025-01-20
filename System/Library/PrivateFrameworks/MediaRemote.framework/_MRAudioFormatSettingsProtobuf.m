@interface _MRAudioFormatSettingsProtobuf
- (BOOL)hasFormatSettingsPlistData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)formatSettingsPlistData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFormatSettingsPlistData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRAudioFormatSettingsProtobuf

- (BOOL)hasFormatSettingsPlistData
{
  return self->_formatSettingsPlistData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRAudioFormatSettingsProtobuf;
  v4 = [(_MRAudioFormatSettingsProtobuf *)&v8 description];
  v5 = [(_MRAudioFormatSettingsProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  formatSettingsPlistData = self->_formatSettingsPlistData;
  if (formatSettingsPlistData) {
    [v3 setObject:formatSettingsPlistData forKey:@"formatSettingsPlistData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAudioFormatSettingsProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_formatSettingsPlistData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  formatSettingsPlistData = self->_formatSettingsPlistData;
  if (formatSettingsPlistData) {
    [a3 setFormatSettingsPlistData:formatSettingsPlistData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_formatSettingsPlistData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    formatSettingsPlistData = self->_formatSettingsPlistData;
    if ((unint64_t)formatSettingsPlistData | v4[1]) {
      char v6 = -[NSData isEqual:](formatSettingsPlistData, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSData *)self->_formatSettingsPlistData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[_MRAudioFormatSettingsProtobuf setFormatSettingsPlistData:](self, "setFormatSettingsPlistData:");
  }
}

- (NSData)formatSettingsPlistData
{
  return self->_formatSettingsPlistData;
}

- (void)setFormatSettingsPlistData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end