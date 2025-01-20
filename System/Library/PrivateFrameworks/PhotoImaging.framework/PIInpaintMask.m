@interface PIInpaintMask
- ($0AC6E346AE4835514AAA8AC86D8F4844)scale;
- ($FD18CD26FAB5729647810B74E671536E)extent;
- (NSString)identifier;
- (NUImageBuffer)buffer;
- (PIInpaintMask)initWithBuffer:(id)a3 identifier:(id)a4;
- (PIInpaintMask)initWithBuffer:(id)a3 identifier:(id)a4 extent:(id *)a5 scale:(id)a6;
@end

@implementation PIInpaintMask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)scale
{
  int64_t denominator = self->_scale.denominator;
  int64_t numerator = self->_scale.numerator;
  result.var1 = denominator;
  result.var0 = numerator;
  return result;
}

- ($FD18CD26FAB5729647810B74E671536E)extent
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[1].var1.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[1].var0.var1;
  retstr->var1 = v3;
  return self;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NUImageBuffer)buffer
{
  return self->_buffer;
}

- (PIInpaintMask)initWithBuffer:(id)a3 identifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v11[0] = 0;
  v11[1] = 0;
  v11[2] = [v7 size];
  v11[3] = v8;
  v9 = -[PIInpaintMask initWithBuffer:identifier:extent:scale:](self, "initWithBuffer:identifier:extent:scale:", v7, v6, v11, *MEMORY[0x1E4F7A338], *(void *)(MEMORY[0x1E4F7A338] + 8));

  return v9;
}

- (PIInpaintMask)initWithBuffer:(id)a3 identifier:(id)a4 extent:(id *)a5 scale:(id)a6
{
  int64_t var1 = a6.var1;
  int64_t var0 = a6.var0;
  id v12 = a3;
  id v13 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PIInpaintMask;
  v14 = [(PIInpaintMask *)&v20 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_buffer, a3);
    uint64_t v16 = [v13 copy];
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    $0AC6E346AE4835514AAA8AC86D8F4844 v18 = a5->var0;
    v15->_extent.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)a5->var1;
    v15->_extent.origin = ($86B46DF249C2B4242DBB096758D29184)v18;
    v15->_scale.int64_t numerator = var0;
    v15->_scale.int64_t denominator = var1;
  }

  return v15;
}

@end