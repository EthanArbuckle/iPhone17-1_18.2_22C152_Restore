@interface TXRImage
- (NSError)error;
- (TXRBuffer)buffer;
- (TXRImage)initWithBytesPerRow:(unint64_t)a3 bytesPerImage:(unint64_t)a4 buffer:(id)a5 offset:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initAsLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5 dataSourceProvider:(id)a6;
- (unint64_t)bytesPerImage;
- (unint64_t)bytesPerRow;
- (unint64_t)offset;
- (void)deferredProvide;
@end

@implementation TXRImage

- (void)deferredProvide
{
  dataSourceProvider = self->_dataSourceProvider;
  if (dataSourceProvider)
  {
    id v7 = [(TXRDataSourceProvider *)dataSourceProvider provideImageInfoAtLevel:self->_level element:self->_element face:self->_face];
    v4 = [v7 buffer];
    buffer = self->_buffer;
    self->_buffer = v4;

    self->_offset = [v7 offset];
    self->_bytesPerRow = [v7 bytesPerRow];
    self->_bytesPerImage = [v7 bytesPerImage];
    v6 = self->_dataSourceProvider;
    self->_dataSourceProvider = 0;
  }
}

- (unint64_t)offset
{
  return self->_offset;
}

- (TXRBuffer)buffer
{
  [(TXRImage *)self deferredProvide];
  buffer = self->_buffer;
  return buffer;
}

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (unint64_t)bytesPerImage
{
  return self->_bytesPerImage;
}

- (TXRImage)initWithBytesPerRow:(unint64_t)a3 bytesPerImage:(unint64_t)a4 buffer:(id)a5 offset:(unint64_t)a6
{
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TXRImage;
  v12 = [(TXRImage *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_buffer, a5);
    v13->_bytesPerImage = a4;
    v13->_bytesPerRow = a3;
    v13->_offset = a6;
    v13->_face = -1;
    v13->_element = 0;
    dataSourceProvider = v13->_dataSourceProvider;
    v13->_level = 0;
    v13->_dataSourceProvider = 0;
  }
  return v13;
}

- (id)initAsLevel:(unint64_t)a3 element:(unint64_t)a4 face:(unint64_t)a5 dataSourceProvider:(id)a6
{
  id v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)TXRImage;
  v12 = [(TXRImage *)&v16 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    v12->_element = a4;
    v12->_level = a3;
    v12->_face = a5;
    buffer = v12->_buffer;
    v12->_buffer = 0;
    v12->_offset = -1;

    objc_storeStrong(p_isa + 9, a6);
  }

  return p_isa;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[TXRImage allocWithZone:](TXRImage, "allocWithZone:") init];
  v6 = v5;
  v5->_offset = self->_offset;
  if (self->_dataSourceProvider)
  {
    v5->_face = self->_face;
    v5->_element = self->_element;
    v5->_level = self->_level;
    buffer = v5->_buffer;
    v5->_buffer = 0;
  }
  else
  {
    uint64_t v8 = [(TXRBuffer *)self->_buffer copyWithZone:a3];
    buffer = v6->_buffer;
    v6->_buffer = (TXRBuffer *)v8;
  }

  return v6;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSourceProvider, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end