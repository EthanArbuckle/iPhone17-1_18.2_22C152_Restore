@interface NEKPBDuplicateCalendar
- (BOOL)hasExternalId;
- (BOOL)hasName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)externalId;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExternalId:(id)a3;
- (void)setName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NEKPBDuplicateCalendar

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasExternalId
{
  return self->_externalId != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NEKPBDuplicateCalendar;
  v3 = [(NEKPBDuplicateCalendar *)&v7 description];
  v4 = [(NEKPBDuplicateCalendar *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  externalId = self->_externalId;
  if (externalId) {
    [v4 setObject:externalId forKey:@"externalId"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10004EC18((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_externalId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_name)
  {
    [v4 setName:];
    id v4 = v5;
  }
  if (self->_externalId)
  {
    [v5 setExternalId:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_name copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_externalId copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((name = self->_name, !((unint64_t)name | v4[2])) || -[NSString isEqual:](name, "isEqual:")))
  {
    externalId = self->_externalId;
    if ((unint64_t)externalId | v4[1]) {
      unsigned __int8 v7 = -[NSString isEqual:](externalId, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  return [(NSString *)self->_externalId hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NEKPBDuplicateCalendar setName:](self, "setName:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NEKPBDuplicateCalendar setExternalId:](self, "setExternalId:");
    id v4 = v5;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)externalId
{
  return self->_externalId;
}

- (void)setExternalId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_externalId, 0);
}

@end