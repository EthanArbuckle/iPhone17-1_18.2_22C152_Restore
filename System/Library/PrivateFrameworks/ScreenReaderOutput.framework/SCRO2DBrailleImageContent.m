@interface SCRO2DBrailleImageContent
- (BOOL)canPanLeft;
- (BOOL)canPanRight;
- (SCRO2DBrailleImageContent)initWithBrailleData:(id)a3 canvas:(id)a4;
- (void)drawOnCanvas:(id)a3;
@end

@implementation SCRO2DBrailleImageContent

- (SCRO2DBrailleImageContent)initWithBrailleData:(id)a3 canvas:(id)a4
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCRO2DBrailleImageContent;
  v6 = [(SCRO2DBrailleImageContent *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 imageData];
    imageData = v6->_imageData;
    v6->_imageData = (NSData *)v7;

    v9 = v6;
  }

  return v6;
}

- (void)drawOnCanvas:(id)a3
{
  imageData = self->_imageData;
  if (imageData) {
    [a3 setImageData:imageData];
  }
}

- (BOOL)canPanLeft
{
  return 0;
}

- (BOOL)canPanRight
{
  return 0;
}

- (void).cxx_destruct
{
}

@end