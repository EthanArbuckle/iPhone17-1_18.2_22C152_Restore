@interface PptMetaCharacterBlock
- (PptMetaCharacterBlock)initWithType:(int)a3 position:(int)a4;
- (PptMetaCharacterBlock)initWithType:(int)a3 position:(int)a4 extraData:(int)a5;
- (int)extraData;
- (int)position;
- (int)type;
- (void)setPosition:(int)a3;
@end

@implementation PptMetaCharacterBlock

- (PptMetaCharacterBlock)initWithType:(int)a3 position:(int)a4
{
  return [(PptMetaCharacterBlock *)self initWithType:*(void *)&a3 position:*(void *)&a4 extraData:0];
}

- (int)position
{
  return self->mPosition;
}

- (int)type
{
  return self->mType;
}

- (PptMetaCharacterBlock)initWithType:(int)a3 position:(int)a4 extraData:(int)a5
{
  v11.receiver = self;
  v11.super_class = (Class)PptMetaCharacterBlock;
  result = [(PptMetaCharacterBlock *)&v11 init];
  if (result)
  {
    int v9 = 0;
    switch(a3)
    {
      case 4087:
        int v9 = 2;
        break;
      case 4088:
        int v9 = 1;
        break;
      case 4089:
        int v9 = 3;
        break;
      case 4090:
        break;
      default:
        if (a3 != 4056)
        {
          exception = __cxa_allocate_exception(4uLL);
          _DWORD *exception = 1000;
        }
        int v9 = 4;
        break;
    }
    result->mType = v9;
    result->mPosition = a4;
    result->mExtraData = a5;
  }
  return result;
}

- (void)setPosition:(int)a3
{
  self->mPosition = a3;
}

- (int)extraData
{
  return self->mExtraData;
}

@end