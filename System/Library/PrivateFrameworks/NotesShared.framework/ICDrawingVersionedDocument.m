@interface ICDrawingVersionedDocument
+ (unsigned)minimumSupportedVersion;
+ (unsigned)serializationVersion;
- (ICDrawing)drawing;
- (id)serializeCurrentVersion:(unsigned int *)a3;
- (unint64_t)mergeWithDrawingVersionedDocument:(id)a3;
- (void)mergeVersion:(unsigned int)a3 fromData:(id)a4;
@end

@implementation ICDrawingVersionedDocument

+ (unsigned)serializationVersion
{
  return 4;
}

+ (unsigned)minimumSupportedVersion
{
  return 1;
}

- (ICDrawing)drawing
{
  drawing = self->_drawing;
  if (drawing)
  {
    v4 = drawing;
    v5 = self->_drawing;
    self->_drawing = v4;
  }
  else
  {
    v6 = [ICDrawing alloc];
    v5 = [(ICTTVersionedDocument *)self replicaID];
    v7 = [(ICDrawing *)v6 initWithReplicaID:v5];
    v8 = self->_drawing;
    self->_drawing = v7;
  }
  v9 = self->_drawing;
  return v9;
}

- (unint64_t)mergeWithDrawingVersionedDocument:(id)a3
{
  id v4 = a3;
  v5 = [(ICDrawingVersionedDocument *)self drawing];
  v6 = [v4 drawing];
  unint64_t v7 = [v5 mergeWithDrawing:v6];

  v9.receiver = self;
  v9.super_class = (Class)ICDrawingVersionedDocument;
  [(ICTTVersionedDocument *)&v9 mergeWithVersionedDocument:v4];

  return v7;
}

- (void)mergeVersion:(unsigned int)a3 fromData:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v11 = a4;
  v6 = [ICDrawing alloc];
  unint64_t v7 = [(ICTTVersionedDocument *)self replicaID];
  v8 = [(ICDrawing *)v6 initWithData:v11 version:v4 replicaID:v7];

  if (self->_drawing)
  {
    if (!v8) {
      goto LABEL_6;
    }
    drawing = [(ICDrawingVersionedDocument *)self drawing];
    [drawing mergeWithDrawing:v8];
  }
  else
  {
    v10 = v8;
    drawing = self->_drawing;
    self->_drawing = v10;
  }

LABEL_6:
}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  uint64_t v4 = [(ICDrawingVersionedDocument *)self drawing];
  v5 = [v4 serializeWithPathData:1 toVersion:a3];

  return v5;
}

- (void).cxx_destruct
{
}

@end