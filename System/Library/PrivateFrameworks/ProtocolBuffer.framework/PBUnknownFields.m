@interface PBUnknownFields
- (id)description;
- (id)dictionaryRepresentation;
- (void)dealloc;
- (void)writeTo:(id)a3;
@end

@implementation PBUnknownFields

- (void)dealloc
{
  free(self->_buf);
  v3.receiver = self;
  v3.super_class = (Class)PBUnknownFields;
  [(PBUnknownFields *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  if (self->_bufLen) {
    objc_msgSend(a3, "write:maxLength:", self->_buf);
  }
}

- (id)description
{
  v2 = [(PBUnknownFields *)self dictionaryRepresentation];
  objc_super v3 = [v2 description];

  return v3;
}

- (id)dictionaryRepresentation
{
  if (self->_bufLen)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:self->_buf length:self->_bufLen freeWhenDone:0];
    objc_super v3 = [[PBDataReader alloc] initWithData:v2];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    _dictionaryRepresentation(v3, 0, 6, v4);
  }
  else
  {
    v4 = [MEMORY[0x1E4F1C9E8] dictionary];
  }
  return v4;
}

@end