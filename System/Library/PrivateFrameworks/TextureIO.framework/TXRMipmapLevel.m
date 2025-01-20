@interface TXRMipmapLevel
- (NSArray)elements;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initAsLevel:(unint64_t)a3 arrayLength:(unint64_t)a4 cubemap:(BOOL)a5 dataSourceProvider:(id)a6;
- (id)initAsLevel:(unint64_t)a3 dimensions:(unint64_t)a4 pixelFormat:(unint64_t)a5 alphaInfo:(unint64_t)a6 arrayLength:(BOOL)a7 cubemap:(id)a8 bufferAllocator:;
- (void)setImage:(id)a3 atElement:(unint64_t)a4 atFace:(unint64_t)a5;
@end

@implementation TXRMipmapLevel

- (NSArray)elements
{
  return (NSArray *)self->_elements;
}

- (id)initAsLevel:(unint64_t)a3 arrayLength:(unint64_t)a4 cubemap:(BOOL)a5 dataSourceProvider:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  v19.receiver = self;
  v19.super_class = (Class)TXRMipmapLevel;
  v11 = [(TXRMipmapLevel *)&v19 init];
  v12 = v11;
  if (v11)
  {
    v11->_level = a3;
    uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a4];
    elements = v12->_elements;
    v12->_elements = (NSMutableArray *)v13;

    if (a4)
    {
      uint64_t v15 = 0;
      do
      {
        v16 = v12->_elements;
        id v17 = [[TXRArrayElement alloc] initAsLevel:a3 element:v15 cubemap:v6 dataSourceProvider:v10];
        [(NSMutableArray *)v16 addObject:v17];

        ++v15;
      }
      while (a4 != v15);
    }
  }

  return v12;
}

- (id)initAsLevel:(unint64_t)a3 dimensions:(unint64_t)a4 pixelFormat:(unint64_t)a5 alphaInfo:(unint64_t)a6 arrayLength:(BOOL)a7 cubemap:(id)a8 bufferAllocator:
{
  BOOL v9 = a7;
  double v24 = v8;
  id v15 = a8;
  v25.receiver = self;
  v25.super_class = (Class)TXRMipmapLevel;
  v16 = [(TXRMipmapLevel *)&v25 init];
  id v17 = v16;
  if (v16)
  {
    v16->_level = a3;
    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a6];
    elements = v17->_elements;
    v17->_elements = (NSMutableArray *)v18;

    if (a6)
    {
      uint64_t v20 = 0;
      do
      {
        v21 = v17->_elements;
        id v22 = [[TXRArrayElement alloc] initAsLevel:a3 element:v20 dimensions:a4 pixelFormat:a5 alphaInfo:v9 cubemap:v15 bufferAllocator:v24];
        [(NSMutableArray *)v21 addObject:v22];

        ++v20;
      }
      while (a6 != v20);
    }
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = [+[TXRMipmapLevel allocWithZone:](TXRMipmapLevel, "allocWithZone:") init];
  uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA48], "allocWithZone:", a3), "initWithCapacity:", -[NSMutableArray count](self->_elements, "count"));
  elements = v5->_elements;
  v5->_elements = (NSMutableArray *)v6;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v8 = self->_elements;
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
        uint64_t v13 = v5->_elements;
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

- (void)setImage:(id)a3 atElement:(unint64_t)a4 atFace:(unint64_t)a5
{
  elements = self->_elements;
  id v8 = a3;
  id v9 = [(NSMutableArray *)elements objectAtIndexedSubscript:a4];
  [v9 setImage:v8 atFace:a5];
}

- (void).cxx_destruct
{
}

@end