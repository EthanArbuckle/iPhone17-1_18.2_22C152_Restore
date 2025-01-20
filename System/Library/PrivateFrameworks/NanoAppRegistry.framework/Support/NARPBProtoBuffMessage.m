@interface NARPBProtoBuffMessage
- (BOOL)hasApplicationWrapper;
- (BOOL)hasWorkspaceMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NARPBApplicationWrapper)applicationWrapper;
- (NARPBWorkspaceMetadata)workspaceMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApplicationWrapper:(id)a3;
- (void)setWorkspaceMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NARPBProtoBuffMessage

- (BOOL)hasApplicationWrapper
{
  return self->_applicationWrapper != 0;
}

- (BOOL)hasWorkspaceMetadata
{
  return self->_workspaceMetadata != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NARPBProtoBuffMessage;
  v3 = [(NARPBProtoBuffMessage *)&v7 description];
  v4 = [(NARPBProtoBuffMessage *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  applicationWrapper = self->_applicationWrapper;
  if (applicationWrapper)
  {
    v5 = [(NARPBApplicationWrapper *)applicationWrapper dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"applicationWrapper"];
  }
  workspaceMetadata = self->_workspaceMetadata;
  if (workspaceMetadata)
  {
    objc_super v7 = [(NARPBWorkspaceMetadata *)workspaceMetadata dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"workspaceMetadata"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100007940((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_applicationWrapper)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_workspaceMetadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_applicationWrapper)
  {
    objc_msgSend(v4, "setApplicationWrapper:");
    id v4 = v5;
  }
  if (self->_workspaceMetadata)
  {
    objc_msgSend(v5, "setWorkspaceMetadata:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NARPBApplicationWrapper *)self->_applicationWrapper copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NARPBWorkspaceMetadata *)self->_workspaceMetadata copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((applicationWrapper = self->_applicationWrapper, !((unint64_t)applicationWrapper | v4[1]))
     || -[NARPBApplicationWrapper isEqual:](applicationWrapper, "isEqual:")))
  {
    workspaceMetadata = self->_workspaceMetadata;
    if ((unint64_t)workspaceMetadata | v4[2]) {
      unsigned __int8 v7 = -[NARPBWorkspaceMetadata isEqual:](workspaceMetadata, "isEqual:");
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
  unint64_t v3 = [(NARPBApplicationWrapper *)self->_applicationWrapper hash];
  return [(NARPBWorkspaceMetadata *)self->_workspaceMetadata hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  applicationWrapper = self->_applicationWrapper;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (applicationWrapper)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NARPBApplicationWrapper mergeFrom:](applicationWrapper, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NARPBProtoBuffMessage setApplicationWrapper:](self, "setApplicationWrapper:");
  }
  id v4 = v9;
LABEL_7:
  workspaceMetadata = self->_workspaceMetadata;
  uint64_t v8 = v4[2];
  if (workspaceMetadata)
  {
    if (v8) {
      -[NARPBWorkspaceMetadata mergeFrom:](workspaceMetadata, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NARPBProtoBuffMessage setWorkspaceMetadata:](self, "setWorkspaceMetadata:");
  }

  _objc_release_x1();
}

- (NARPBApplicationWrapper)applicationWrapper
{
  return self->_applicationWrapper;
}

- (void)setApplicationWrapper:(id)a3
{
}

- (NARPBWorkspaceMetadata)workspaceMetadata
{
  return self->_workspaceMetadata;
}

- (void)setWorkspaceMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workspaceMetadata, 0);

  objc_storeStrong((id *)&self->_applicationWrapper, 0);
}

@end