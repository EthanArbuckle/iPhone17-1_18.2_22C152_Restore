@interface TXRArrayElement
- (NSArray)faces;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initAsLevel:(unint64_t)a3 element:(unint64_t)a4 cubemap:(BOOL)a5 dataSourceProvider:(id)a6;
- (id)initAsLevel:(unint64_t)a3 element:(unint64_t)a4 dimensions:(unint64_t)a5 pixelFormat:(unint64_t)a6 alphaInfo:(BOOL)a7 cubemap:(id)a8 bufferAllocator:;
- (void)setImage:(id)a3 atFace:(unint64_t)a4;
@end

@implementation TXRArrayElement

- (id)initAsLevel:(unint64_t)a3 element:(unint64_t)a4 cubemap:(BOOL)a5 dataSourceProvider:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  v19.receiver = self;
  v19.super_class = (Class)TXRArrayElement;
  v11 = [(TXRArrayElement *)&v19 init];
  if (v11)
  {
    if (v6) {
      uint64_t v12 = 6;
    }
    else {
      uint64_t v12 = 1;
    }
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v12];
    faces = v11->_faces;
    v11->_faces = (NSMutableArray *)v13;

    for (uint64_t i = 0; i != v12; ++i)
    {
      v16 = v11->_faces;
      id v17 = [[TXRImage alloc] initAsLevel:a3 element:a4 face:i dataSourceProvider:v10];
      [(NSMutableArray *)v16 addObject:v17];
    }
  }

  return v11;
}

- (id)initAsLevel:(unint64_t)a3 element:(unint64_t)a4 dimensions:(unint64_t)a5 pixelFormat:(unint64_t)a6 alphaInfo:(BOOL)a7 cubemap:(id)a8 bufferAllocator:
{
  BOOL v9 = a7;
  double v21 = v8;
  id v13 = a8;
  v22.receiver = self;
  v22.super_class = (Class)TXRArrayElement;
  v14 = [(TXRArrayElement *)&v22 init];
  if (v14)
  {
    if (v9) {
      uint64_t v15 = 6;
    }
    else {
      uint64_t v15 = 1;
    }
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
    faces = v14->_faces;
    v14->_faces = (NSMutableArray *)v16;

    do
    {
      v18 = v14->_faces;
      objc_super v19 = [[TXRImageIndependent alloc] initWithDimensions:a5 pixelFormat:a6 alphaInfo:v13 bufferAllocator:v21];
      [(NSMutableArray *)v18 addObject:v19];

      --v15;
    }
    while (v15);
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = [+[TXRArrayElement allocWithZone:](TXRArrayElement, "allocWithZone:") init];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", a3), "initWithCapacity:", -[NSMutableArray count](self->_faces, "count"));
  faces = v5->_faces;
  v5->_faces = (NSMutableArray *)v6;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v8 = self->_faces;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = v5->_faces;
        v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "copyWithZone:", a3, (void)v16);
        [(NSMutableArray *)v13 addObject:v14];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v5;
}

- (void)setImage:(id)a3 atFace:(unint64_t)a4
{
}

- (NSArray)faces
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end