@interface CSDMessagingLabeledHandle
+ (id)handleWithTULabeledHandle:(id)a3;
- (BOOL)hasHandle;
- (BOOL)hasLabel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CSDMessagingHandle)handle;
- (NSString)label;
- (TULabeledHandle)tuLabeledHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHandle:(id)a3;
- (void)setLabel:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingLabeledHandle

+ (id)handleWithTULabeledHandle:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 handle];
    v6 = +[CSDMessagingHandle handleWithTUHandle:v5];

    if (v6)
    {
      v7 = objc_alloc_init(CSDMessagingLabeledHandle);
      v8 = [v4 label];
      [(CSDMessagingLabeledHandle *)v7 setLabel:v8];

      [(CSDMessagingLabeledHandle *)v7 setHandle:v6];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (TULabeledHandle)tuLabeledHandle
{
  id v3 = [(CSDMessagingLabeledHandle *)self handle];

  if (v3)
  {
    v4 = [(CSDMessagingLabeledHandle *)self handle];
    v5 = [v4 tuHandle];

    id v6 = objc_alloc((Class)TULabeledHandle);
    v7 = [(CSDMessagingLabeledHandle *)self label];
    id v8 = [v6 initWithHandle:v5 label:v7 isSuggested:0];
  }
  else
  {
    id v8 = 0;
  }

  return (TULabeledHandle *)v8;
}

- (BOOL)hasHandle
{
  return self->_handle != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingLabeledHandle;
  id v3 = [(CSDMessagingLabeledHandle *)&v7 description];
  v4 = [(CSDMessagingLabeledHandle *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  handle = self->_handle;
  if (handle)
  {
    v5 = [(CSDMessagingHandle *)handle dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"handle"];
  }
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001743D4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_handle)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_handle)
  {
    objc_msgSend(v4, "setHandle:");
    id v4 = v5;
  }
  if (self->_label)
  {
    objc_msgSend(v5, "setLabel:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(CSDMessagingHandle *)self->_handle copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_label copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((handle = self->_handle, !((unint64_t)handle | v4[1]))
     || -[CSDMessagingHandle isEqual:](handle, "isEqual:")))
  {
    label = self->_label;
    if ((unint64_t)label | v4[2]) {
      unsigned __int8 v7 = -[NSString isEqual:](label, "isEqual:");
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
  unint64_t v3 = [(CSDMessagingHandle *)self->_handle hash];
  return [(NSString *)self->_label hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  handle = self->_handle;
  uint64_t v6 = v4[1];
  unsigned __int8 v7 = v4;
  if (handle)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CSDMessagingHandle mergeFrom:](handle, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[CSDMessagingLabeledHandle setHandle:](self, "setHandle:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[CSDMessagingLabeledHandle setLabel:](self, "setLabel:");
    id v4 = v7;
  }
}

- (CSDMessagingHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end