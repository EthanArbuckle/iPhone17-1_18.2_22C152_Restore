@interface NUTileInfo
+ (id)tileInfoWithIndex:(int64_t)a3 size:(id)a4 frameRect:(id *)a5 contentRect:(id *)a6;
- ($0AC6E346AE4835514AAA8AC86D8F4844)size;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)contentRect;
- ($8D19A3D7F6B32A57CF9B882F3E1C418F)frameRect;
- (id)debugDescription;
- (id)translatedAndClippedRegion:(id)a3;
- (int64_t)index;
@end

@implementation NUTileInfo

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)contentRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = self[2].var1;
  retstr->var0 = self[2].var0;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = var1;
  return self;
}

- ($8D19A3D7F6B32A57CF9B882F3E1C418F)frameRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 var1 = self[1].var1;
  retstr->var0 = self[1].var0;
  retstr->$0AC6E346AE4835514AAA8AC86D8F4844 var1 = var1;
  return self;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)size
{
  int64_t height = self->_size.height;
  int64_t width = self->_size.width;
  result.$0AC6E346AE4835514AAA8AC86D8F4844 var1 = height;
  result.var0 = width;
  return result;
}

- (int64_t)index
{
  return self->_index;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(NUTileInfo *)self index];
  uint64_t v6 = [(NUTileInfo *)self size];
  v8 = [NSString stringWithFormat:@"{%ld, %ld}", v6, v7];
  [(NUTileInfo *)self frameRect];
  v9 = [NSString stringWithFormat:@"{origin={%ld, %ld} size={%ld, %ld}}]", v16, v17, v18];
  [(NUTileInfo *)self contentRect];
  v10 = [NSString stringWithFormat:@"{origin={%ld, %ld} size={%ld, %ld}}]", v13, v14, v15];
  v11 = [v3 stringWithFormat:@"<%@:%p> index=%ld, size=%@, frameRect=%@, contentRect=%@", v4, self, v5, v8, v9, v10];

  return v11;
}

- (id)translatedAndClippedRegion:(id)a3
{
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size = self->_frameRect.size;
  v8[0] = self->_frameRect.origin;
  v8[1] = size;
  int64_t v5 = [a3 regionByClippingToRect:v8];
  uint64_t v6 = (void *)[v5 mutableCopy];

  objc_msgSend(v6, "translateBy:", -self->_frameRect.origin.x, -self->_frameRect.origin.y);

  return v6;
}

+ (id)tileInfoWithIndex:(int64_t)a3 size:(id)a4 frameRect:(id *)a5 contentRect:(id *)a6
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  v11 = objc_alloc_init(NUTileInfo);
  v11->_index = a3;
  v11->_size.int64_t width = var0;
  v11->_size.int64_t height = var1;
  $0AC6E346AE4835514AAA8AC86D8F4844 v12 = a5->var1;
  v11->_frameRect.origin = ($86B46DF249C2B4242DBB096758D29184)a5->var0;
  v11->_frameRect.$5BB7312FFE32F1AB3F1F5957C99A58B3 size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v12;
  $0AC6E346AE4835514AAA8AC86D8F4844 v13 = a6->var1;
  v11->_contentRect.origin = ($86B46DF249C2B4242DBB096758D29184)a6->var0;
  v11->_contentRect.$5BB7312FFE32F1AB3F1F5957C99A58B3 size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v13;

  return v11;
}

@end