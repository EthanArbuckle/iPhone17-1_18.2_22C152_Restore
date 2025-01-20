@interface NTKProtoCollectionBySlot
- (BOOL)hasCollection;
- (BOOL)hasSlot;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)slot;
- (NTKProtoPigmentCollection)collection;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCollection:(id)a3;
- (void)setSlot:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTKProtoCollectionBySlot

- (BOOL)hasSlot
{
  return self->_slot != 0;
}

- (BOOL)hasCollection
{
  return self->_collection != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTKProtoCollectionBySlot;
  v4 = [(NTKProtoCollectionBySlot *)&v8 description];
  v5 = [(NTKProtoCollectionBySlot *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  slot = self->_slot;
  if (slot) {
    [v3 setObject:slot forKey:@"slot"];
  }
  collection = self->_collection;
  if (collection)
  {
    v7 = [(NTKProtoPigmentCollection *)collection dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"collection"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTKProtoCollectionBySlotReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_slot)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_collection)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_slot)
  {
    objc_msgSend(v4, "setSlot:");
    id v4 = v5;
  }
  if (self->_collection)
  {
    objc_msgSend(v5, "setCollection:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_slot copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NTKProtoPigmentCollection *)self->_collection copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((slot = self->_slot, !((unint64_t)slot | v4[2])) || -[NSString isEqual:](slot, "isEqual:")))
  {
    collection = self->_collection;
    if ((unint64_t)collection | v4[1]) {
      char v7 = -[NTKProtoPigmentCollection isEqual:](collection, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_slot hash];
  return [(NTKProtoPigmentCollection *)self->_collection hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[2])
  {
    -[NTKProtoCollectionBySlot setSlot:](self, "setSlot:");
    id v4 = v7;
  }
  collection = self->_collection;
  uint64_t v6 = v4[1];
  if (collection)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[NTKProtoPigmentCollection mergeFrom:](collection, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[NTKProtoCollectionBySlot setCollection:](self, "setCollection:");
  }
  id v4 = v7;
LABEL_9:
}

- (NSString)slot
{
  return self->_slot;
}

- (void)setSlot:(id)a3
{
}

- (NTKProtoPigmentCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slot, 0);

  objc_storeStrong((id *)&self->_collection, 0);
}

@end