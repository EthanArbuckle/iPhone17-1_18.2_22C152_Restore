@interface SiriCoreDataDecompressor
- (id)decompressedDataForBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5;
- (id)decompressedDataForData:(id)a3 error:(id *)a4;
@end

@implementation SiriCoreDataDecompressor

- (id)decompressedDataForData:(id)a3 error:(id *)a4
{
  id v4 = a3;

  return v4;
}

- (id)decompressedDataForBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  if (a3)
  {
    dispatch_data_t v5 = dispatch_data_create(a3, a4, 0, 0);
  }
  else
  {
    dispatch_data_t v5 = (dispatch_data_t)MEMORY[0x263EF8388];
    id v6 = MEMORY[0x263EF8388];
  }

  return v5;
}

@end